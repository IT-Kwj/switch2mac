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
    texture2d<float> fp_t_tcb_8 [[id(3)]];
    sampler fp_t_tcb_8Smplr [[id(4)]];
    texture2d<float> fp_t_tcb_C [[id(5)]];
    sampler fp_t_tcb_CSmplr [[id(6)]];
    sampler fp_t_tcb_8Smplr_w [[id(7)]];
    sampler fp_t_tcb_CSmplr_w [[id(8)]];
    constant dm_border_t* dm_border [[id(9)]];
};

struct main0_out
{
    float4 m_48 [[color(0)]];
};

struct main0_in
{
    float4 m_41 [[user(locn0)]];
    float4 m_45 [[user(locn1)]];
    float4 m_35 [[user(locn2)]];
    float4 m_52 [[user(locn3)]];
    float4 m_43 [[user(locn4)]];
    float4 m_39 [[user(locn5)]];
    float4 m_37 [[user(locn6)]];
    float4 m_50 [[user(locn8)]];
};

fragment main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], float4 gl_FragCoord [[position]])
{
    main0_out out = {};
    float _59 = gl_FragCoord.w;
    float _61 = in.m_35.x;
    float _63 = gl_FragCoord.w;
    float _65 = _61 * _63;
    float _67 = in.m_35.y;
    float _69 = gl_FragCoord.w;
    float _71 = _67 * _69;
    float _73 = in.m_37.x;
    float _75 = gl_FragCoord.w;
    float _77 = _73 * _75;
    float _79 = in.m_37.y;
    float _81 = gl_FragCoord.w;
    float _83 = _79 * _81;
    float _85 = 1.0 / _59;
    float _87 = _85 * _65;
    float _89 = _85 * _71;
    float _91 = _85 * _77;
    float _93 = _85 * _83;
    float2 _442 = float2(_87, _89);
    float4 _96 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_442, float2(0.0), isnan(_442))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_442, float2(0.0), isnan(_442))).xyzw;
    float _98 = _96.x;
    float _100 = _96.y;
    float _102 = _96.z;
    float _104 = _96.w;
    float2 _461 = float2(_91, _93);
    float4 _106 = dm_bs(spvDescriptorSet0.fp_t_tcb_C.sample(spvDescriptorSet0.fp_t_tcb_CSmplr, select(_461, float2(0.0), isnan(_461))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_C, spvDescriptorSet0.fp_t_tcb_CSmplr_w, select(_461, float2(0.0), isnan(_461))).xyzw;
    float _108 = _106.x;
    float _110 = _106.y;
    float _112 = _106.z;
    float _114 = _106.w;
    float _116 = in.m_39.w;
    float _118 = gl_FragCoord.w;
    float _120 = _116 * _118;
    float _122 = in.m_41.w;
    float _124 = gl_FragCoord.w;
    float _126 = _122 * _124;
    float _128 = in.m_43.x;
    float _130 = gl_FragCoord.w;
    float _132 = _128 * _130;
    float _134 = _85 * _120;
    float _136 = in.m_41.y;
    float _138 = gl_FragCoord.w;
    float _140 = _136 * _138;
    float _142 = in.m_45.x;
    float _144 = gl_FragCoord.w;
    float _146 = _142 * _144;
    float _148 = in.m_45.y;
    float _150 = gl_FragCoord.w;
    float _152 = _148 * _150;
    float _154 = in.m_41.z;
    float _156 = gl_FragCoord.w;
    float _158 = _154 * _156;
    float _160 = in.m_45.z;
    float _162 = gl_FragCoord.w;
    float _164 = _160 * _162;
    float _166 = in.m_39.y;
    float _168 = gl_FragCoord.w;
    float _170 = _166 * _168;
    float _172 = _85 * _140;
    float _174 = _85 * _164;
    float _176 = _85 * _170;
    float _178 = _104 * _114;
    float _180 = _85 * _126;
    float _182 = _178 * _134;
    float _184 = _85 * _132;
    float _186 = _180 * _182;
    float _188 = 0.0 + _186;
    float _190 = precise::clamp(_188, 0.0, 1.0);
    float _192 = _190 * _184;
    bool _196 = _192 > (*spvDescriptorSet0.fp_c9)._m0[141].z;
    bool _198 = isnan(_192);
    bool _200 = _196 || _198;
    bool _202 = isnan((*spvDescriptorSet0.fp_c9)._m0[141].z);
    bool _204 = _200 || _202;
    float _206 = in.m_41.x;
    float _208 = gl_FragCoord.w;
    float _210 = _206 * _208;
    float _212 = in.m_39.x;
    float _214 = gl_FragCoord.w;
    float _216 = _212 * _214;
    float _218 = in.m_39.z;
    float _220 = gl_FragCoord.w;
    float _222 = _218 * _220;
    if (!_204)
    {
        discard_fragment();
    }
    float _224 = _108 * _108;
    float _226 = _100 * _100;
    float _228 = _110 * _110;
    float _230 = _98 * _98;
    float _232 = _102 * _102;
    float _234 = _226 * _228;
    float _236 = _230 * _224;
    float _238 = _112 * _112;
    float _240 = _85 * _146;
    float _242 = _85 * _158;
    float _244 = _232 * _238;
    float _246 = -_174;
    float _248 = _242 + _246;
    float _250 = _85 * _210;
    float _252 = _85 * _152;
    float _254 = _85 * _216;
    float _256 = fma(_244, _248, _174);
    float _258 = -_240;
    float _260 = _250 + _258;
    float _262 = -_252;
    float _264 = _172 + _262;
    float _266 = _85 * _222;
    float _268 = fma(_236, _260, _240);
    float _270 = fma(_234, _264, _252);
    float _272 = _256 * _266;
    float _274 = _268 * _254;
    float _276 = _270 * _176;
    if (!_204)
    {
        out.m_48.x = _274;
        out.m_48.y = _276;
        out.m_48.z = _272;
        out.m_48.w = _186;
        return out;
    }
    float _278 = _276 * 0.715200006961822509765625;
    float _280 = in.m_50.w;
    float _282 = gl_FragCoord.w;
    float _284 = _280 * _282;
    float _286 = in.m_50.z;
    float _288 = gl_FragCoord.w;
    float _290 = _286 * _288;
    float _292 = in.m_50.x;
    float _294 = gl_FragCoord.w;
    float _296 = _292 * _294;
    float _298 = fma(_274, 0.2125999927520751953125, _278);
    float _300 = in.m_50.y;
    float _302 = gl_FragCoord.w;
    float _304 = _300 * _302;
    float _306 = fma(_272, 0.072200000286102294921875, _298);
    bool _308 = (*spvDescriptorSet0.fp_c15)._m0[653].w >= 0.5;
    float _310 = 1.0 / _306;
    float _312 = _310 * (*spvDescriptorSet0.fp_c15)._m0[661].z;
    float _314 = precise::clamp(_312, 0.0, 1.0);
    float _316 = fma(_314, (*spvDescriptorSet0.fp_c15)._m0[661].y, (*spvDescriptorSet0.fp_c15)._m0[661].x);
    float _318 = _85 * _284;
    float _320 = 0.0 + _192;
    float _322 = precise::clamp(_320, 0.0, 1.0);
    float _324 = _85 * _290;
    float _326 = _85 * _304;
    float _328 = _316 * _318;
    float _330 = _85 * _296;
    float _332 = fma(_272, _328, _324);
    float _334 = fma(_274, _328, _330);
    float _336 = fma(_276, _328, _326);
    float _338 = _324;
    if (!_308)
    {
        _338 = _322;
    }
    float _340 = _338;
    bool _342 = !_308;
    float _344 = _340;
    if (!_342)
    {
        float _346 = in.m_52.w;
        float _348 = gl_FragCoord.w;
        float _350 = _346 * _348;
        float _352 = in.m_52.z;
        float _354 = gl_FragCoord.w;
        float _356 = _352 * _354;
        float _358 = _85 * _350;
        float _360 = _85 * _356;
        float _362 = 1.0 / _358;
        float _364 = _360 * _362;
        float _366 = -(*spvDescriptorSet0.fp_c8)._m0[30].y;
        float _368 = fma(_364, (*spvDescriptorSet0.fp_c8)._m0[30].w, _366);
        float _370 = 1.0 / _368;
        float _372 = -(*spvDescriptorSet0.fp_c8)._m0[30].z;
        float _374 = -(*spvDescriptorSet0.fp_c8)._m0[30].x;
        float _376 = fma(_370, _372, _374);
        float _378 = _376 * 8.0;
        float _380 = precise::clamp(_378, 0.0, 1.0);
        float _382 = _322 * _380;
        _344 = _382;
    }
    float _384 = _344;
    float _386 = 0.0 + _384;
    float _388 = precise::clamp(_386, 0.0, 1.0);
    out.m_48.x = _334;
    out.m_48.y = _336;
    out.m_48.z = _332;
    out.m_48.w = _388;
    return out;
}

