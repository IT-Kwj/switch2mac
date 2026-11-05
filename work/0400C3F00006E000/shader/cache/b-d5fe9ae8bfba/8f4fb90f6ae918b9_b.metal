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
    constant _16* fp_c8 [[id(1)]];
    constant _16* fp_c15 [[id(2)]];
    texture2d<float> fp_t_tcb_10 [[id(3)]];
    sampler fp_t_tcb_10Smplr [[id(4)]];
    texture2d<float> fp_t_tcb_8 [[id(5)]];
    sampler fp_t_tcb_8Smplr [[id(6)]];
    sampler fp_t_tcb_10Smplr_w [[id(7)]];
    sampler fp_t_tcb_8Smplr_w [[id(8)]];
    constant dm_border_t* dm_border [[id(9)]];
};

struct main0_out
{
    float4 m_46 [[color(0)]];
};

struct main0_in
{
    float4 m_39 [[user(locn0)]];
    float4 m_41 [[user(locn1)]];
    float4 m_35 [[user(locn2)]];
    float4 m_43 [[user(locn3)]];
    float4 m_37 [[user(locn4)]];
    float4 m_48 [[user(locn6)]];
};

fragment main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], float4 gl_FragCoord [[position]])
{
    main0_out out = {};
    float _55 = gl_FragCoord.w;
    float _57 = in.m_35.w;
    float _59 = gl_FragCoord.w;
    float _61 = _57 * _59;
    float _63 = in.m_35.x;
    float _65 = gl_FragCoord.w;
    float _67 = _63 * _65;
    float _69 = in.m_35.y;
    float _71 = gl_FragCoord.w;
    float _73 = _69 * _71;
    float _75 = in.m_37.x;
    float _77 = gl_FragCoord.w;
    float _79 = _75 * _77;
    float _81 = in.m_37.y;
    float _83 = gl_FragCoord.w;
    float _85 = _81 * _83;
    float _87 = 1.0 / _55;
    float _89 = _87 * _61;
    float _91 = _87 * _67;
    float _93 = _87 * _73;
    float _95 = _87 * _79;
    float _97 = 1.0 / _89;
    float _99 = _87 * _85;
    float _101 = _91 * _97;
    float _103 = _93 * _97;
    float2 _434 = float2(_101, _103);
    float _105 = dm_bs(spvDescriptorSet0.fp_t_tcb_10.sample(spvDescriptorSet0.fp_t_tcb_10Smplr, select(_434, float2(0.0), isnan(_434))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_10, spvDescriptorSet0.fp_t_tcb_10Smplr_w, select(_434, float2(0.0), isnan(_434))).x;
    float2 _445 = float2(_95, _99);
    float4 _108 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_445, float2(0.0), isnan(_445))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_445, float2(0.0), isnan(_445))).xyzw;
    float _110 = _108.x;
    float _112 = _108.y;
    float _114 = _108.z;
    float _116 = _108.w;
    float _118 = in.m_35.z;
    float _120 = gl_FragCoord.w;
    float _122 = _118 * _120;
    float _124 = in.m_39.w;
    float _126 = gl_FragCoord.w;
    float _128 = _124 * _126;
    float _130 = in.m_41.w;
    float _132 = gl_FragCoord.w;
    float _134 = _130 * _132;
    float _136 = in.m_43.x;
    float _138 = gl_FragCoord.w;
    float _140 = _136 * _138;
    float _142 = 1.0 / (*spvDescriptorSet0.fp_c9)._m0[142].y;
    float _144 = _87 * _122;
    float _146 = _144 * _97;
    float _148 = -(*spvDescriptorSet0.fp_c8)._m0[30].y;
    float _150 = fma(_146, (*spvDescriptorSet0.fp_c8)._m0[30].w, _148);
    float _152 = _87 * _128;
    float _154 = 1.0 / _150;
    float _156 = in.m_41.x;
    float _158 = gl_FragCoord.w;
    float _160 = _156 * _158;
    float _162 = in.m_41.y;
    float _164 = gl_FragCoord.w;
    float _166 = _162 * _164;
    float _168 = in.m_41.z;
    float _170 = gl_FragCoord.w;
    float _172 = _168 * _170;
    float _174 = _87 * _160;
    float _176 = -(*spvDescriptorSet0.fp_c8)._m0[30].y;
    float _178 = fma(_105, (*spvDescriptorSet0.fp_c8)._m0[30].w, _176);
    float _180 = -_152;
    float _182 = _116 + _180;
    float _184 = _87 * _134;
    float _186 = -(*spvDescriptorSet0.fp_c8)._m0[30].z;
    float _188 = _154 * _186;
    float _190 = 1.0 / _178;
    float _192 = _184 * _182;
    float _194 = 0.0 + _192;
    float _196 = precise::clamp(_194, 0.0, 1.0);
    float _198 = -(*spvDescriptorSet0.fp_c8)._m0[30].z;
    float _200 = -_188;
    float _202 = fma(_190, _198, _200);
    float _204 = _202 * _142;
    float _206 = precise::clamp(_204, 0.0, 1.0);
    float _208 = _87 * _140;
    float _210 = _196 * _206;
    float _212 = _210 * _208;
    bool _216 = _212 > (*spvDescriptorSet0.fp_c9)._m0[141].z;
    bool _218 = isnan(_212);
    bool _220 = _216 || _218;
    bool _222 = isnan((*spvDescriptorSet0.fp_c9)._m0[141].z);
    bool _224 = _220 || _222;
    float _226 = in.m_39.x;
    float _228 = gl_FragCoord.w;
    float _230 = _226 * _228;
    float _232 = in.m_39.y;
    float _234 = gl_FragCoord.w;
    float _236 = _232 * _234;
    float _238 = in.m_39.z;
    float _240 = gl_FragCoord.w;
    float _242 = _238 * _240;
    float _244 = _188;
    if (!_224)
    {
        discard_fragment();
    }
    float _246 = _87 * _166;
    float _248 = _87 * _230;
    float _250 = _87 * _236;
    float _252 = _87 * _242;
    float _254 = _87 * _172;
    float _256 = -_174;
    float _258 = _248 + _256;
    float _260 = -_246;
    float _262 = _250 + _260;
    float _264 = _110 * _110;
    float _266 = -_254;
    float _268 = _252 + _266;
    float _270 = _112 * _112;
    float _272 = _114 * _114;
    float _274 = fma(_264, _258, _174);
    float _276 = fma(_270, _262, _246);
    float _278 = fma(_272, _268, _254);
    float _280 = _246;
    if (!_224)
    {
        out.m_46.x = _274;
        out.m_46.y = _276;
        out.m_46.z = _278;
        out.m_46.w = _192;
        return out;
    }
    float _282 = _276 * 0.715200006961822509765625;
    float _284 = in.m_48.w;
    float _286 = gl_FragCoord.w;
    float _288 = _284 * _286;
    float _290 = in.m_48.x;
    float _292 = gl_FragCoord.w;
    float _294 = _290 * _292;
    float _296 = in.m_48.y;
    float _298 = gl_FragCoord.w;
    float _300 = _296 * _298;
    float _302 = fma(_274, 0.2125999927520751953125, _282);
    float _304 = in.m_48.z;
    float _306 = gl_FragCoord.w;
    float _308 = _304 * _306;
    float _310 = fma(_278, 0.072200000286102294921875, _302);
    bool _312 = (*spvDescriptorSet0.fp_c15)._m0[653].w >= 0.5;
    float _314 = 1.0 / _310;
    if (_312)
    {
        float _316 = -(*spvDescriptorSet0.fp_c8)._m0[30].x;
        float _318 = _188 + _316;
        _244 = _318;
    }
    float _320 = _244;
    if (_312)
    {
        float _322 = _320 * 8.0;
        float _324 = precise::clamp(_322, 0.0, 1.0);
        _280 = _324;
    }
    float _326 = _280;
    float _328 = _314 * (*spvDescriptorSet0.fp_c15)._m0[2].z;
    float _330 = precise::clamp(_328, 0.0, 1.0);
    float _332 = fma(_330, (*spvDescriptorSet0.fp_c15)._m0[2].y, (*spvDescriptorSet0.fp_c15)._m0[2].x);
    float _334 = _87 * _288;
    float _336 = _87 * _294;
    float _338 = _87 * _300;
    float _340 = _332 * _334;
    float _342 = 0.0 + _212;
    float _344 = precise::clamp(_342, 0.0, 1.0);
    float _346 = _87 * _308;
    float _348 = fma(_274, _340, _336);
    float _350 = _344;
    if (_312)
    {
        float _352 = _344 * _326;
        _350 = _352;
    }
    float _354 = _350;
    float _356 = fma(_276, _340, _338);
    float _358 = fma(_278, _340, _346);
    float _360 = 0.0 + _354;
    float _362 = precise::clamp(_360, 0.0, 1.0);
    out.m_46.x = _348;
    out.m_46.y = _356;
    out.m_46.z = _358;
    out.m_46.w = _362;
    return out;
}

