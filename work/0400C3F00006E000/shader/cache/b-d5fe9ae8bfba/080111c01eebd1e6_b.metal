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
    texture2d<float> fp_t_tcb_A [[id(3)]];
    sampler fp_t_tcb_ASmplr [[id(4)]];
    texture2d<float> fp_t_tcb_8 [[id(5)]];
    sampler fp_t_tcb_8Smplr [[id(6)]];
    sampler fp_t_tcb_ASmplr_w [[id(7)]];
    sampler fp_t_tcb_8Smplr_w [[id(8)]];
    constant dm_border_t* dm_border [[id(9)]];
};

struct main0_out
{
    float4 m_46 [[color(0)]];
};

struct main0_in
{
    float4 m_37 [[user(locn0)]];
    float4 m_41 [[user(locn1)]];
    float4 m_35 [[user(locn2)]];
    float4 m_50 [[user(locn3)]];
    float4 m_43 [[user(locn4)]];
    float4 m_39 [[user(locn5)]];
    float4 m_48 [[user(locn7)]];
};

fragment main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], float4 gl_FragCoord [[position]])
{
    main0_out out = {};
    float _57 = gl_FragCoord.w;
    float _59 = in.m_35.z;
    float _61 = gl_FragCoord.w;
    float _63 = _59 * _61;
    float _65 = in.m_35.w;
    float _67 = gl_FragCoord.w;
    float _69 = _65 * _67;
    float _71 = in.m_35.x;
    float _73 = gl_FragCoord.w;
    float _75 = _71 * _73;
    float _77 = in.m_35.y;
    float _79 = gl_FragCoord.w;
    float _81 = _77 * _79;
    float _83 = 1.0 / _57;
    float _85 = _83 * _63;
    float _87 = _83 * _69;
    float _89 = _83 * _75;
    float _91 = _83 * _81;
    float2 _453 = float2(_85, _87);
    float4 _94 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_453, float2(0.0), isnan(_453))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_453, float2(0.0), isnan(_453))).xyzw;
    float _96 = _94.x;
    float _98 = _94.y;
    float _100 = _94.z;
    float _102 = _94.w;
    float2 _472 = float2(_89, _91);
    float4 _104 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_472, float2(0.0), isnan(_472))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_472, float2(0.0), isnan(_472))).xyzw;
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
    float _126 = in.m_41.w;
    float _128 = gl_FragCoord.w;
    float _130 = _126 * _128;
    float _132 = in.m_43.x;
    float _134 = gl_FragCoord.w;
    float _136 = _132 * _134;
    float _138 = _83 * _118;
    float _140 = _83 * _124;
    float _142 = in.m_37.y;
    float _144 = gl_FragCoord.w;
    float _146 = _142 * _144;
    float _148 = in.m_37.z;
    float _150 = gl_FragCoord.w;
    float _152 = _148 * _150;
    float _154 = in.m_41.z;
    float _156 = gl_FragCoord.w;
    float _158 = _154 * _156;
    float _160 = in.m_37.x;
    float _162 = gl_FragCoord.w;
    float _164 = _160 * _162;
    float _166 = in.m_41.x;
    float _168 = gl_FragCoord.w;
    float _170 = _166 * _168;
    float _172 = in.m_41.y;
    float _174 = gl_FragCoord.w;
    float _176 = _172 * _174;
    float _178 = _102 + (-1.0);
    float _180 = _83 * _130;
    float _182 = _112 + _178;
    float _184 = -_138;
    float _186 = fma(_182, _140, _184);
    float _188 = _180 * _186;
    float _190 = _83 * _136;
    float _192 = 0.0 + _188;
    float _194 = precise::clamp(_192, 0.0, 1.0);
    float _196 = _194 * _190;
    bool _200 = _196 > (*spvDescriptorSet0.fp_c9)._m0[141].z;
    bool _202 = isnan(_196);
    bool _204 = _200 || _202;
    bool _206 = isnan((*spvDescriptorSet0.fp_c9)._m0[141].z);
    bool _208 = _204 || _206;
    float _210 = in.m_39.y;
    float _212 = gl_FragCoord.w;
    float _214 = _210 * _212;
    float _216 = in.m_39.x;
    float _218 = gl_FragCoord.w;
    float _220 = _216 * _218;
    if (!_208)
    {
        discard_fragment();
    }
    float _222 = in.m_39.z;
    float _224 = gl_FragCoord.w;
    float _226 = _222 * _224;
    float _228 = _98 * _98;
    float _230 = _108 * _108;
    float _232 = _96 * _96;
    float _234 = _106 * _106;
    float _236 = _83 * _146;
    float _238 = _230 * _228;
    float _240 = _100 * _100;
    float _242 = _110 * _110;
    float _244 = _83 * _152;
    float _246 = _83 * _158;
    float _248 = _234 * _232;
    float _250 = _83 * _164;
    float _252 = _83 * _170;
    float _254 = _83 * _176;
    float _256 = _242 * _240;
    float _258 = -_246;
    float _260 = _244 + _258;
    float _262 = -_252;
    float _264 = _250 + _262;
    float _266 = -_254;
    float _268 = _236 + _266;
    float _270 = _83 * _220;
    float _272 = fma(_256, _260, _246);
    float _274 = _83 * _214;
    float _276 = fma(_248, _264, _252);
    float _278 = fma(_238, _268, _254);
    float _280 = _276 * _270;
    float _282 = _83 * _226;
    float _284 = _278 * _274;
    float _286 = _272 * _282;
    if (!_208)
    {
        out.m_46.x = _280;
        out.m_46.y = _284;
        out.m_46.z = _286;
        out.m_46.w = _188;
        return out;
    }
    float _288 = _284 * 0.715200006961822509765625;
    float _290 = in.m_48.w;
    float _292 = gl_FragCoord.w;
    float _294 = _290 * _292;
    float _296 = in.m_48.z;
    float _298 = gl_FragCoord.w;
    float _300 = _296 * _298;
    float _302 = in.m_48.x;
    float _304 = gl_FragCoord.w;
    float _306 = _302 * _304;
    float _308 = fma(_280, 0.2125999927520751953125, _288);
    float _310 = in.m_48.y;
    float _312 = gl_FragCoord.w;
    float _314 = _310 * _312;
    float _316 = fma(_286, 0.072200000286102294921875, _308);
    bool _318 = (*spvDescriptorSet0.fp_c15)._m0[653].w >= 0.5;
    float _320 = 1.0 / _316;
    float _322 = _320 * (*spvDescriptorSet0.fp_c15)._m0[2].z;
    float _324 = precise::clamp(_322, 0.0, 1.0);
    float _326 = _83 * _294;
    float _328 = fma(_324, (*spvDescriptorSet0.fp_c15)._m0[2].y, (*spvDescriptorSet0.fp_c15)._m0[2].x);
    float _330 = _83 * _300;
    float _332 = _328 * _326;
    float _334 = 0.0 + _196;
    float _336 = precise::clamp(_334, 0.0, 1.0);
    float _338 = _83 * _306;
    float _340 = _83 * _314;
    float _342 = fma(_286, _332, _330);
    float _344 = fma(_280, _332, _338);
    float _346 = fma(_284, _332, _340);
    float _348 = _330;
    if (!_318)
    {
        _348 = _336;
    }
    float _350 = _348;
    bool _352 = !_318;
    float _354 = _350;
    if (!_352)
    {
        float _356 = in.m_50.w;
        float _358 = gl_FragCoord.w;
        float _360 = _356 * _358;
        float _362 = in.m_50.z;
        float _364 = gl_FragCoord.w;
        float _366 = _362 * _364;
        float _368 = _83 * _360;
        float _370 = _83 * _366;
        float _372 = 1.0 / _368;
        float _374 = _370 * _372;
        float _376 = -(*spvDescriptorSet0.fp_c8)._m0[30].y;
        float _378 = fma(_374, (*spvDescriptorSet0.fp_c8)._m0[30].w, _376);
        float _380 = 1.0 / _378;
        float _382 = -(*spvDescriptorSet0.fp_c8)._m0[30].z;
        float _384 = -(*spvDescriptorSet0.fp_c8)._m0[30].x;
        float _386 = fma(_380, _382, _384);
        float _388 = _386 * 8.0;
        float _390 = precise::clamp(_388, 0.0, 1.0);
        float _392 = _336 * _390;
        _354 = _392;
    }
    float _394 = _354;
    float _396 = 0.0 + _394;
    float _398 = precise::clamp(_396, 0.0, 1.0);
    out.m_46.x = _344;
    out.m_46.y = _346;
    out.m_46.z = _342;
    out.m_46.w = _398;
    return out;
}

