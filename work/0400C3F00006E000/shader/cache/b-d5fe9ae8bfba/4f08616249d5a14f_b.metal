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
    sampler fp_t_tcb_8Smplr_w [[id(7)]];
    sampler fp_t_tcb_ASmplr_w [[id(8)]];
    constant dm_border_t* dm_border [[id(9)]];
};

struct main0_out
{
    float4 m_46 [[color(0)]];
};

struct main0_in
{
    float4 m_39 [[user(locn0)]];
    float4 m_43 [[user(locn1)]];
    float4 m_35 [[user(locn2)]];
    float4 m_50 [[user(locn3)]];
    float4 m_41 [[user(locn4)]];
    float4 m_37 [[user(locn5)]];
    float4 m_48 [[user(locn7)]];
};

fragment main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], float4 gl_FragCoord [[position]])
{
    main0_out out = {};
    float _57 = gl_FragCoord.w;
    float _59 = in.m_35.x;
    float _61 = gl_FragCoord.w;
    float _63 = _59 * _61;
    float _65 = in.m_35.y;
    float _67 = gl_FragCoord.w;
    float _69 = _65 * _67;
    float _71 = in.m_35.z;
    float _73 = gl_FragCoord.w;
    float _75 = _71 * _73;
    float _77 = in.m_35.w;
    float _79 = gl_FragCoord.w;
    float _81 = _77 * _79;
    float _83 = 1.0 / _57;
    float _85 = _83 * _63;
    float _87 = _83 * _69;
    float _89 = _83 * _75;
    float _91 = _83 * _81;
    float2 _435 = float2(_85, _87);
    float4 _94 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_435, float2(0.0), isnan(_435))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_435, float2(0.0), isnan(_435))).xyzw;
    float _96 = _94.x;
    float _98 = _94.y;
    float _100 = _94.z;
    float _102 = _94.w;
    float2 _454 = float2(_89, _91);
    float4 _104 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_454, float2(0.0), isnan(_454))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_454, float2(0.0), isnan(_454))).xyzw;
    float _106 = _104.x;
    float _108 = _104.y;
    float _110 = _104.z;
    float _112 = _104.w;
    float _114 = in.m_37.w;
    float _116 = gl_FragCoord.w;
    float _118 = _114 * _116;
    float _120 = in.m_39.w;
    float _122 = gl_FragCoord.w;
    float _124 = _120 * _122;
    float _126 = in.m_41.x;
    float _128 = gl_FragCoord.w;
    float _130 = _126 * _128;
    float _132 = _83 * _118;
    float _134 = in.m_39.x;
    float _136 = gl_FragCoord.w;
    float _138 = _134 * _136;
    float _140 = in.m_43.y;
    float _142 = gl_FragCoord.w;
    float _144 = _140 * _142;
    float _146 = in.m_43.z;
    float _148 = gl_FragCoord.w;
    float _150 = _146 * _148;
    float _152 = in.m_37.x;
    float _154 = gl_FragCoord.w;
    float _156 = _152 * _154;
    float _158 = in.m_37.y;
    float _160 = gl_FragCoord.w;
    float _162 = _158 * _160;
    float _164 = in.m_37.z;
    float _166 = gl_FragCoord.w;
    float _168 = _164 * _166;
    float _170 = _83 * _138;
    float _172 = _83 * _150;
    float _174 = _102 * _112;
    float _176 = _83 * _124;
    float _178 = _174 * _132;
    float _180 = _83 * _130;
    float _182 = _176 * _178;
    float _184 = 0.0 + _182;
    float _186 = precise::clamp(_184, 0.0, 1.0);
    float _188 = _186 * _180;
    bool _192 = _188 > (*spvDescriptorSet0.fp_c9)._m0[141].z;
    bool _194 = isnan(_188);
    bool _196 = _192 || _194;
    bool _198 = isnan((*spvDescriptorSet0.fp_c9)._m0[141].z);
    bool _200 = _196 || _198;
    float _202 = in.m_43.x;
    float _204 = gl_FragCoord.w;
    float _206 = _202 * _204;
    float _208 = in.m_39.y;
    float _210 = gl_FragCoord.w;
    float _212 = _208 * _210;
    float _214 = in.m_39.z;
    float _216 = gl_FragCoord.w;
    float _218 = _214 * _216;
    if (!_200)
    {
        discard_fragment();
    }
    float _220 = _96 * _96;
    float _222 = _98 * _98;
    float _224 = _220 * _106;
    float _226 = _222 * _108;
    float _228 = _100 * _100;
    float _230 = _83 * _144;
    float _232 = _228 * _110;
    float _234 = _83 * _206;
    float _236 = _83 * _212;
    float _238 = _83 * _218;
    float _240 = -_234;
    float _242 = _170 + _240;
    float _244 = -_230;
    float _246 = _236 + _244;
    float _248 = -_172;
    float _250 = _238 + _248;
    float _252 = fma(_224, _242, _234);
    float _254 = fma(_226, _246, _230);
    float _256 = fma(_232, _250, _172);
    float _258 = _83 * _156;
    float _260 = _83 * _162;
    float _262 = _83 * _168;
    float _264 = _252 * _258;
    float _266 = _254 * _260;
    float _268 = _256 * _262;
    if (!_200)
    {
        out.m_46.x = _264;
        out.m_46.y = _266;
        out.m_46.z = _268;
        out.m_46.w = _182;
        return out;
    }
    float _270 = _266 * 0.715200006961822509765625;
    float _272 = in.m_48.w;
    float _274 = gl_FragCoord.w;
    float _276 = _272 * _274;
    float _278 = in.m_48.z;
    float _280 = gl_FragCoord.w;
    float _282 = _278 * _280;
    float _284 = in.m_48.x;
    float _286 = gl_FragCoord.w;
    float _288 = _284 * _286;
    float _290 = fma(_264, 0.2125999927520751953125, _270);
    float _292 = in.m_48.y;
    float _294 = gl_FragCoord.w;
    float _296 = _292 * _294;
    float _298 = fma(_268, 0.072200000286102294921875, _290);
    bool _300 = (*spvDescriptorSet0.fp_c15)._m0[653].w >= 0.5;
    float _302 = 1.0 / _298;
    float _304 = _302 * (*spvDescriptorSet0.fp_c15)._m0[2].z;
    float _306 = precise::clamp(_304, 0.0, 1.0);
    float _308 = fma(_306, (*spvDescriptorSet0.fp_c15)._m0[2].y, (*spvDescriptorSet0.fp_c15)._m0[2].x);
    float _310 = _83 * _276;
    float _312 = 0.0 + _188;
    float _314 = precise::clamp(_312, 0.0, 1.0);
    float _316 = _83 * _282;
    float _318 = _83 * _296;
    float _320 = _308 * _310;
    float _322 = _83 * _288;
    float _324 = fma(_268, _320, _316);
    float _326 = fma(_264, _320, _322);
    float _328 = fma(_266, _320, _318);
    float _330 = _316;
    if (!_300)
    {
        _330 = _314;
    }
    float _332 = _330;
    bool _334 = !_300;
    float _336 = _332;
    if (!_334)
    {
        float _338 = in.m_50.w;
        float _340 = gl_FragCoord.w;
        float _342 = _338 * _340;
        float _344 = in.m_50.z;
        float _346 = gl_FragCoord.w;
        float _348 = _344 * _346;
        float _350 = _83 * _342;
        float _352 = _83 * _348;
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
        float _374 = _314 * _372;
        _336 = _374;
    }
    float _376 = _336;
    float _378 = 0.0 + _376;
    float _380 = precise::clamp(_378, 0.0, 1.0);
    out.m_46.x = _326;
    out.m_46.y = _328;
    out.m_46.z = _324;
    out.m_46.w = _380;
    return out;
}

