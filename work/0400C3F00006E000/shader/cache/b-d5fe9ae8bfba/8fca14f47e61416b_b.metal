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
    float2 _441 = float2(_85, _87);
    float4 _94 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_441, float2(0.0), isnan(_441))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_441, float2(0.0), isnan(_441))).xyzw;
    float _96 = _94.x;
    float _98 = _94.y;
    float _100 = _94.z;
    float _102 = _94.w;
    float2 _460 = float2(_89, _91);
    float4 _104 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_460, float2(0.0), isnan(_460))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_460, float2(0.0), isnan(_460))).xyzw;
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
    float _134 = in.m_39.y;
    float _136 = gl_FragCoord.w;
    float _138 = _134 * _136;
    float _140 = in.m_43.x;
    float _142 = gl_FragCoord.w;
    float _144 = _140 * _142;
    float _146 = in.m_43.y;
    float _148 = gl_FragCoord.w;
    float _150 = _146 * _148;
    float _152 = in.m_39.z;
    float _154 = gl_FragCoord.w;
    float _156 = _152 * _154;
    float _158 = in.m_43.z;
    float _160 = gl_FragCoord.w;
    float _162 = _158 * _160;
    float _164 = in.m_37.y;
    float _166 = gl_FragCoord.w;
    float _168 = _164 * _166;
    float _170 = _83 * _138;
    float _172 = _83 * _162;
    float _174 = _83 * _168;
    float _176 = _102 * _112;
    float _178 = _83 * _124;
    float _180 = _176 * _132;
    float _182 = _83 * _130;
    float _184 = _178 * _180;
    float _186 = 0.0 + _184;
    float _188 = precise::clamp(_186, 0.0, 1.0);
    float _190 = _188 * _182;
    bool _194 = _190 > (*spvDescriptorSet0.fp_c9)._m0[141].z;
    bool _196 = isnan(_190);
    bool _198 = _194 || _196;
    bool _200 = isnan((*spvDescriptorSet0.fp_c9)._m0[141].z);
    bool _202 = _198 || _200;
    float _204 = in.m_39.x;
    float _206 = gl_FragCoord.w;
    float _208 = _204 * _206;
    float _210 = in.m_37.x;
    float _212 = gl_FragCoord.w;
    float _214 = _210 * _212;
    float _216 = in.m_37.z;
    float _218 = gl_FragCoord.w;
    float _220 = _216 * _218;
    if (!_202)
    {
        discard_fragment();
    }
    float _222 = _106 * _106;
    float _224 = _98 * _98;
    float _226 = _108 * _108;
    float _228 = _96 * _96;
    float _230 = _100 * _100;
    float _232 = _224 * _226;
    float _234 = _228 * _222;
    float _236 = _110 * _110;
    float _238 = _83 * _144;
    float _240 = _83 * _156;
    float _242 = _230 * _236;
    float _244 = -_172;
    float _246 = _240 + _244;
    float _248 = _83 * _208;
    float _250 = _83 * _150;
    float _252 = _83 * _214;
    float _254 = fma(_242, _246, _172);
    float _256 = -_238;
    float _258 = _248 + _256;
    float _260 = -_250;
    float _262 = _170 + _260;
    float _264 = _83 * _220;
    float _266 = fma(_234, _258, _238);
    float _268 = fma(_232, _262, _250);
    float _270 = _254 * _264;
    float _272 = _266 * _252;
    float _274 = _268 * _174;
    if (!_202)
    {
        out.m_46.x = _272;
        out.m_46.y = _274;
        out.m_46.z = _270;
        out.m_46.w = _184;
        return out;
    }
    float _276 = _274 * 0.715200006961822509765625;
    float _278 = in.m_48.w;
    float _280 = gl_FragCoord.w;
    float _282 = _278 * _280;
    float _284 = in.m_48.z;
    float _286 = gl_FragCoord.w;
    float _288 = _284 * _286;
    float _290 = in.m_48.x;
    float _292 = gl_FragCoord.w;
    float _294 = _290 * _292;
    float _296 = fma(_272, 0.2125999927520751953125, _276);
    float _298 = in.m_48.y;
    float _300 = gl_FragCoord.w;
    float _302 = _298 * _300;
    float _304 = fma(_270, 0.072200000286102294921875, _296);
    bool _306 = (*spvDescriptorSet0.fp_c15)._m0[653].w >= 0.5;
    float _308 = 1.0 / _304;
    float _310 = _308 * (*spvDescriptorSet0.fp_c15)._m0[2].z;
    float _312 = precise::clamp(_310, 0.0, 1.0);
    float _314 = fma(_312, (*spvDescriptorSet0.fp_c15)._m0[2].y, (*spvDescriptorSet0.fp_c15)._m0[2].x);
    float _316 = _83 * _282;
    float _318 = 0.0 + _190;
    float _320 = precise::clamp(_318, 0.0, 1.0);
    float _322 = _83 * _288;
    float _324 = _83 * _302;
    float _326 = _314 * _316;
    float _328 = _83 * _294;
    float _330 = fma(_270, _326, _322);
    float _332 = fma(_272, _326, _328);
    float _334 = fma(_274, _326, _324);
    float _336 = _322;
    if (!_306)
    {
        _336 = _320;
    }
    float _338 = _336;
    bool _340 = !_306;
    float _342 = _338;
    if (!_340)
    {
        float _344 = in.m_50.w;
        float _346 = gl_FragCoord.w;
        float _348 = _344 * _346;
        float _350 = in.m_50.z;
        float _352 = gl_FragCoord.w;
        float _354 = _350 * _352;
        float _356 = _83 * _348;
        float _358 = _83 * _354;
        float _360 = 1.0 / _356;
        float _362 = _358 * _360;
        float _364 = -(*spvDescriptorSet0.fp_c8)._m0[30].y;
        float _366 = fma(_362, (*spvDescriptorSet0.fp_c8)._m0[30].w, _364);
        float _368 = 1.0 / _366;
        float _370 = -(*spvDescriptorSet0.fp_c8)._m0[30].z;
        float _372 = -(*spvDescriptorSet0.fp_c8)._m0[30].x;
        float _374 = fma(_368, _370, _372);
        float _376 = _374 * 8.0;
        float _378 = precise::clamp(_376, 0.0, 1.0);
        float _380 = _320 * _378;
        _342 = _380;
    }
    float _382 = _342;
    float _384 = 0.0 + _382;
    float _386 = precise::clamp(_384, 0.0, 1.0);
    out.m_46.x = _332;
    out.m_46.y = _334;
    out.m_46.z = _330;
    out.m_46.w = _386;
    return out;
}

