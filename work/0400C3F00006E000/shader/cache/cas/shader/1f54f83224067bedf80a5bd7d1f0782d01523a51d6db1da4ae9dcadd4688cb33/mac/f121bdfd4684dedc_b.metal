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
    texture2d<float> fp_t_tcb_A [[id(5)]];
    sampler fp_t_tcb_ASmplr [[id(6)]];
    texture2d<float> fp_t_tcb_C [[id(7)]];
    sampler fp_t_tcb_CSmplr [[id(8)]];
    sampler fp_t_tcb_8Smplr_w [[id(9)]];
    sampler fp_t_tcb_ASmplr_w [[id(10)]];
    sampler fp_t_tcb_CSmplr_w [[id(11)]];
    constant dm_border_t* dm_border [[id(12)]];
};

struct main0_out
{
    float4 m_50 [[color(0)]];
};

struct main0_in
{
    float4 m_41 [[user(locn0)]];
    float4 m_47 [[user(locn1)]];
    float4 m_37 [[user(locn2)]];
    float4 m_52 [[user(locn3)]];
    float4 m_43 [[user(locn4)]];
    float4 m_39 [[user(locn5)]];
    float4 m_45 [[user(locn6)]];
};

fragment main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], float4 gl_FragCoord [[position]])
{
    main0_out out = {};
    float _59 = gl_FragCoord.w;
    float _61 = in.m_37.x;
    float _63 = gl_FragCoord.w;
    float _65 = _61 * _63;
    float _67 = in.m_37.y;
    float _69 = gl_FragCoord.w;
    float _71 = _67 * _69;
    float _73 = in.m_37.z;
    float _75 = gl_FragCoord.w;
    float _77 = _73 * _75;
    float _79 = in.m_37.w;
    float _81 = gl_FragCoord.w;
    float _83 = _79 * _81;
    float _85 = 1.0 / _59;
    float _87 = _85 * _65;
    float _89 = _85 * _71;
    float _91 = _85 * _77;
    float _93 = _85 * _83;
    float2 _435 = float2(_87, _89);
    float4 _96 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_435, float2(0.0), isnan(_435))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_435, float2(0.0), isnan(_435))).xyzw;
    float _98 = _96.x;
    float _100 = _96.y;
    float _102 = _96.z;
    float _104 = _96.w;
    float2 _454 = float2(_91, _93);
    float4 _106 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_454, float2(0.0), isnan(_454))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_454, float2(0.0), isnan(_454))).xyzw;
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
    float _136 = in.m_45.y;
    float _138 = gl_FragCoord.w;
    float _140 = _136 * _138;
    float _142 = _85 * _140;
    float _144 = _104 * _114;
    float _146 = _85 * _126;
    float _148 = _144 * _134;
    float _150 = _146 * _148;
    float _152 = _85 * _132;
    float _154 = 0.0 + _150;
    float _156 = precise::clamp(_154, 0.0, 1.0);
    float _158 = _156 * _152;
    bool _162 = _158 > (*spvDescriptorSet0.fp_c9)._m0[141].z;
    bool _164 = isnan(_158);
    bool _166 = _162 || _164;
    bool _168 = isnan((*spvDescriptorSet0.fp_c9)._m0[141].z);
    bool _170 = _166 || _168;
    float _172 = in.m_45.x;
    float _174 = gl_FragCoord.w;
    float _176 = _172 * _174;
    if (!_170)
    {
        discard_fragment();
    }
    float _178 = _85 * _176;
    float2 _558 = float2(_178, _142);
    float3 _182 = dm_bs(spvDescriptorSet0.fp_t_tcb_C.sample(spvDescriptorSet0.fp_t_tcb_CSmplr, select(_558, float2(0.0), isnan(_558))), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.fp_t_tcb_C, spvDescriptorSet0.fp_t_tcb_CSmplr_w, select(_558, float2(0.0), isnan(_558))).xyz;
    float _184 = _182.x;
    float _186 = _182.y;
    float _188 = _182.z;
    float _190 = in.m_41.x;
    float _192 = gl_FragCoord.w;
    float _194 = _190 * _192;
    float _196 = in.m_47.x;
    float _198 = gl_FragCoord.w;
    float _200 = _196 * _198;
    float _202 = in.m_41.y;
    float _204 = gl_FragCoord.w;
    float _206 = _202 * _204;
    float _208 = in.m_47.y;
    float _210 = gl_FragCoord.w;
    float _212 = _208 * _210;
    float _214 = in.m_41.z;
    float _216 = gl_FragCoord.w;
    float _218 = _214 * _216;
    float _220 = in.m_47.z;
    float _222 = gl_FragCoord.w;
    float _224 = _220 * _222;
    float _226 = in.m_39.x;
    float _228 = gl_FragCoord.w;
    float _230 = _226 * _228;
    float _232 = in.m_39.y;
    float _234 = gl_FragCoord.w;
    float _236 = _232 * _234;
    float _238 = in.m_39.z;
    float _240 = gl_FragCoord.w;
    float _242 = _238 * _240;
    float _244 = _98 * _98;
    float _246 = _100 * _100;
    float _248 = _110 * _110;
    float _250 = _108 * _108;
    float _252 = _112 * _112;
    float _254 = _102 * _102;
    float _256 = _85 * _194;
    float _258 = _85 * _212;
    float _260 = _85 * _230;
    float _262 = fma(_246, _248, _186);
    float _264 = fma(_244, _250, _184);
    float _266 = _85 * _200;
    float _268 = _85 * _206;
    float _270 = _85 * _218;
    float _272 = _85 * _224;
    float _274 = -_266;
    float _276 = _256 + _274;
    float _278 = fma(_254, _252, _188);
    float _280 = -_258;
    float _282 = _268 + _280;
    float _284 = -_272;
    float _286 = _270 + _284;
    float _288 = fma(_264, _276, _266);
    float _290 = _85 * _236;
    float _292 = fma(_262, _282, _258);
    float _294 = fma(_278, _286, _272);
    float _296 = _85 * _242;
    float _298 = _288 * _260;
    float _300 = _292 * _290;
    float _302 = _294 * _296;
    if (!_170)
    {
        out.m_50.x = _298;
        out.m_50.y = _300;
        out.m_50.z = _302;
        out.m_50.w = _150;
        return out;
    }
    float _304 = _300 * 0.715200006961822509765625;
    float _306 = 0.0 + _158;
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

