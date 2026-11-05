#include <metal_stdlib>
#include <simd/simd.h>

using namespace metal;

struct dm_border_t { uint mask; float4 k[32]; };
static inline __attribute__((always_inline)) float4 dm_bmix(float4 r, float4 w, float4 k) { return r + (w - r) * k; }
static inline __attribute__((always_inline)) float dm_bmix(float r, float w, float4 k) { return r + (w - r) * k.x; }
template<typename V, typename T, typename... A> static inline __attribute__((always_inline)) V dm_bs(V r, constant dm_border_t* b, uint i, T t, sampler w, A... a)
{
    if (b->mask >> i & 1u) r = dm_bmix(r, t.sample(w, a...), b->k[i]);
    return r;
}

struct _10
{
    uint _m0;
    uint _m1[8];
    float4 _m2;
    float4 _m3;
    int _m4;
    float _m5[73];
    int4 _m6;
    int _m7;
};

struct _16
{
    float4 _m0[4096];
};

struct spvDescriptorSetBuffer0
{
    constant _16* fp_c9 [[id(0)]];
    constant _16* fp_c15 [[id(1)]];
    constant _16* fp_c8 [[id(2)]];
    texture2d<float> fp_t_tcb_C [[id(3)]];
    sampler fp_t_tcb_CSmplr [[id(4)]];
    texture2d<float> fp_t_tcb_8 [[id(5)]];
    sampler fp_t_tcb_8Smplr [[id(6)]];
    sampler fp_t_tcb_CSmplr_w [[id(7)]];
    sampler fp_t_tcb_8Smplr_w [[id(8)]];
    constant dm_border_t* dm_border [[id(9)]];
};

struct main0_out
{
    float4 m_50 [[color(0)]];
};

struct main0_in
{
    float4 m_43 [[user(locn0)]];
    float4 m_47 [[user(locn1)]];
    float4 m_39 [[user(locn2)]];
    float4 m_45 [[user(locn3)]];
    float4 m_37 [[user(locn4)]];
    float4 m_52 [[user(locn5)]];
    float4 m_35 [[user(locn6)]];
    float4 m_41 [[user(locn7)]];
};

fragment main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], float4 gl_FragCoord [[position]])
{
    main0_out out = {};
    float _59 = gl_FragCoord.w;
    float _61 = in.m_35.x;
    float _63 = gl_FragCoord.w;
    float _65 = _61 * _63;
    float _67 = in.m_37.x;
    float _69 = gl_FragCoord.w;
    float _71 = _67 * _69;
    float _73 = in.m_37.y;
    float _75 = gl_FragCoord.w;
    float _77 = _73 * _75;
    float _79 = in.m_35.y;
    float _81 = gl_FragCoord.w;
    float _83 = _79 * _81;
    float _85 = 1.0 / _59;
    float _87 = _85 * _65;
    float _89 = _85 * _71;
    float _91 = _85 * _77;
    float _93 = _85 * _83;
    float2 _434 = float2(_87, _93);
    float _95 = dm_bs(spvDescriptorSet0.fp_t_tcb_C.sample(spvDescriptorSet0.fp_t_tcb_CSmplr, select(_434, float2(0.0), isnan(_434))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_C, spvDescriptorSet0.fp_t_tcb_CSmplr_w, select(_434, float2(0.0), isnan(_434))).w;
    float2 _445 = float2(_89, _91);
    float4 _98 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_445, float2(0.0), isnan(_445))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_445, float2(0.0), isnan(_445))).xyzw;
    float _100 = _98.x;
    float _102 = _98.y;
    float _104 = _98.z;
    float _106 = _98.w;
    float _108 = in.m_39.y;
    float _110 = gl_FragCoord.w;
    float _112 = _108 * _110;
    float _114 = in.m_39.x;
    float _116 = gl_FragCoord.w;
    float _118 = _114 * _116;
    float _120 = in.m_39.z;
    float _122 = gl_FragCoord.w;
    float _124 = _120 * _122;
    float _126 = in.m_41.y;
    float _128 = gl_FragCoord.w;
    float _130 = _126 * _128;
    float _132 = in.m_41.x;
    float _134 = gl_FragCoord.w;
    float _136 = _132 * _134;
    float _138 = in.m_41.z;
    float _140 = gl_FragCoord.w;
    float _142 = _138 * _140;
    float _144 = _85 * _112;
    float _146 = _85 * _118;
    float _148 = _85 * _124;
    float _150 = _85 * _130;
    float _152 = _144 * _144;
    float _154 = in.m_43.w;
    float _156 = gl_FragCoord.w;
    float _158 = _154 * _156;
    float _160 = fma(_146, _146, _152);
    float _162 = -(*spvDescriptorSet0.fp_c9)._m0[139].z;
    float _164 = _162 + (*spvDescriptorSet0.fp_c9)._m0[139].w;
    float _166 = fma(_148, _148, _160);
    float _168 = 1.0 / _164;
    float _170 = rsqrt(_166);
    float _172 = _144 * _170;
    float _174 = _148 * _170;
    float _176 = in.m_45.x;
    float _178 = gl_FragCoord.w;
    float _180 = _176 * _178;
    float _182 = _150 * _172;
    float _184 = _85 * _136;
    float _186 = _146 * _170;
    float _188 = fma(_184, _186, _182);
    float _190 = _85 * _142;
    float _192 = fma(_190, _174, _188);
    float _194 = abs(_192);
    float _196 = -(*spvDescriptorSet0.fp_c9)._m0[139].z;
    float _198 = _194 + _196;
    float _200 = _198 * _168;
    float _202 = precise::clamp(_200, 0.0, 1.0);
    float _204 = fma(_202, -2.0, 3.0);
    float _206 = _202 * _202;
    float _208 = _204 * _206;
    float _210 = _85 * _180;
    float _212 = in.m_43.z;
    float _214 = gl_FragCoord.w;
    float _216 = _212 * _214;
    float _218 = in.m_47.x;
    float _220 = gl_FragCoord.w;
    float _222 = _218 * _220;
    float _224 = in.m_47.z;
    float _226 = gl_FragCoord.w;
    float _228 = _224 * _226;
    float _230 = _85 * _222;
    float _232 = _106 * _95;
    float _234 = _85 * _158;
    float _236 = _232 * _234;
    float _238 = 0.0 + _236;
    float _240 = precise::clamp(_238, 0.0, 1.0);
    float _242 = _240 * _208;
    float _244 = _242 * _210;
    bool _248 = _244 > (*spvDescriptorSet0.fp_c9)._m0[141].z;
    bool _250 = isnan(_244);
    bool _252 = _248 || _250;
    bool _254 = isnan((*spvDescriptorSet0.fp_c9)._m0[141].z);
    bool _256 = _252 || _254;
    float _258 = in.m_43.x;
    float _260 = gl_FragCoord.w;
    float _262 = _258 * _260;
    float _264 = in.m_43.y;
    float _266 = gl_FragCoord.w;
    float _268 = _264 * _266;
    float _270 = in.m_47.y;
    float _272 = gl_FragCoord.w;
    float _274 = _270 * _272;
    if (!_256)
    {
        discard_fragment();
    }
    float _276 = _85 * _262;
    float _278 = _85 * _268;
    float _280 = _85 * _216;
    float _282 = _85 * _274;
    float _284 = _85 * _228;
    float _286 = -_230;
    float _288 = _276 + _286;
    float _290 = -_282;
    float _292 = _278 + _290;
    float _294 = -_284;
    float _296 = _280 + _294;
    float _298 = fma(_100, _288, _230);
    float _300 = fma(_102, _292, _282);
    float _302 = fma(_104, _296, _284);
    if (!_256)
    {
        out.m_50.x = _298;
        out.m_50.y = _300;
        out.m_50.z = _302;
        out.m_50.w = _236;
        return out;
    }
    float _304 = _300 * 0.715200006961822509765625;
    float _306 = 0.0 + _244;
    float _308 = precise::clamp(_306, 0.0, 1.0);
    float _310 = fma(_298, 0.2125999927520751953125, _304);
    bool _312 = (*spvDescriptorSet0.fp_c15)._m0[653].w >= 0.5;
    float _314 = fma(_302, 0.072200000286102294921875, _310);
    float _316 = 1.0 / _314;
    float _318 = _316 * (*spvDescriptorSet0.fp_c15)._m0[2].z;
    float _320 = precise::clamp(_318, 0.0, 1.0);
    float _322 = fma(_320, (*spvDescriptorSet0.fp_c15)._m0[2].y, (*spvDescriptorSet0.fp_c15)._m0[2].x);
    float _324 = _298 * _322;
    float _326 = _300 * _322;
    float _328 = _302 * _322;
    float _330 = _322;
    if (!_312)
    {
        _330 = _308;
    }
    float _332 = _330;
    bool _334 = !_312;
    float _336 = _332;
    if (!_334)
    {
        float _338 = in.m_52.w;
        float _340 = gl_FragCoord.w;
        float _342 = _338 * _340;
        float _344 = in.m_52.z;
        float _346 = gl_FragCoord.w;
        float _348 = _344 * _346;
        float _350 = _85 * _342;
        float _352 = _85 * _348;
        float _354 = 1.0 / _350;
        float _356 = _352 * _354;
        float _358 = -(*spvDescriptorSet0.fp_c8)._m0[30].y;
        float _360 = fma(_356, (*spvDescriptorSet0.fp_c8)._m0[30].w, _358);
        float _362 = 1.0 / _360;
        float _364 = -(*spvDescriptorSet0.fp_c8)._m0[30].z;
        float _366 = -(*spvDescriptorSet0.fp_c8)._m0[30].x;
        float _368 = fma(_362, _364, _366);
        float _370 = _368 * 8.0;
        float _372 = precise::clamp(_370, 0.0, 1.0);
        float _374 = _308 * _372;
        _336 = _374;
    }
    float _376 = _336;
    float _378 = 0.0 + _376;
    float _380 = precise::clamp(_378, 0.0, 1.0);
    out.m_50.x = _324;
    out.m_50.y = _326;
    out.m_50.z = _328;
    out.m_50.w = _380;
    return out;
}

