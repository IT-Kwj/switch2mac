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
    sampler fp_t_tcb_8Smplr_w [[id(5)]];
    constant dm_border_t* dm_border [[id(6)]];
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
    float4 m_41 [[user(locn3)]];
    float4 m_33 [[user(locn4)]];
    float4 m_50 [[user(locn5)]];
    float4 m_37 [[user(locn6)]];
    float4 m_48 [[user(locn7)]];
};

fragment main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], float4 gl_FragCoord [[position]])
{
    main0_out out = {};
    float _57 = gl_FragCoord.w;
    float _59 = in.m_33.x;
    float _61 = gl_FragCoord.w;
    float _63 = _59 * _61;
    float _65 = in.m_33.y;
    float _67 = gl_FragCoord.w;
    float _69 = _65 * _67;
    float _71 = 1.0 / _57;
    float _73 = _71 * _63;
    float _75 = _71 * _69;
    float2 _432 = float2(_73, _75);
    float4 _78 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_432, float2(0.0), isnan(_432))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_432, float2(0.0), isnan(_432))).xyzw;
    float _80 = _78.x;
    float _82 = _78.y;
    float _84 = _78.z;
    float _86 = _78.w;
    float _88 = in.m_35.y;
    float _90 = gl_FragCoord.w;
    float _92 = _88 * _90;
    float _94 = in.m_35.x;
    float _96 = gl_FragCoord.w;
    float _98 = _94 * _96;
    float _100 = in.m_35.z;
    float _102 = gl_FragCoord.w;
    float _104 = _100 * _102;
    float _106 = in.m_37.y;
    float _108 = gl_FragCoord.w;
    float _110 = _106 * _108;
    float _112 = in.m_37.x;
    float _114 = gl_FragCoord.w;
    float _116 = _112 * _114;
    float _118 = in.m_37.z;
    float _120 = gl_FragCoord.w;
    float _122 = _118 * _120;
    float _124 = in.m_39.w;
    float _126 = gl_FragCoord.w;
    float _128 = _124 * _126;
    float _130 = _71 * _92;
    float _132 = _71 * _98;
    float _134 = _71 * _104;
    float _136 = _130 * _130;
    float _138 = fma(_132, _132, _136);
    float _140 = -(*spvDescriptorSet0.fp_c9)._m0[139].z;
    float _142 = _140 + (*spvDescriptorSet0.fp_c9)._m0[139].w;
    float _144 = fma(_134, _134, _138);
    float _146 = _71 * _110;
    float _148 = 1.0 / _142;
    float _150 = rsqrt(_144);
    float _152 = _130 * _150;
    float _154 = _132 * _150;
    float _156 = _134 * _150;
    float _158 = _146 * _152;
    float _160 = _71 * _116;
    float _162 = in.m_41.x;
    float _164 = gl_FragCoord.w;
    float _166 = _162 * _164;
    float _168 = fma(_160, _154, _158);
    float _170 = _71 * _122;
    float _172 = fma(_170, _156, _168);
    float _174 = abs(_172);
    float _176 = -(*spvDescriptorSet0.fp_c9)._m0[139].z;
    float _178 = _174 + _176;
    float _180 = _178 * _148;
    float _182 = precise::clamp(_180, 0.0, 1.0);
    float _184 = fma(_182, -2.0, 3.0);
    float _186 = _182 * _182;
    float _188 = _71 * _128;
    float _190 = _184 * _186;
    float _192 = _71 * _166;
    float _194 = in.m_43.x;
    float _196 = gl_FragCoord.w;
    float _198 = _194 * _196;
    float _200 = in.m_39.y;
    float _202 = gl_FragCoord.w;
    float _204 = _200 * _202;
    float _206 = in.m_43.y;
    float _208 = gl_FragCoord.w;
    float _210 = _206 * _208;
    float _212 = in.m_39.z;
    float _214 = gl_FragCoord.w;
    float _216 = _212 * _214;
    float _218 = in.m_43.z;
    float _220 = gl_FragCoord.w;
    float _222 = _218 * _220;
    float _224 = _71 * _198;
    float _226 = _71 * _210;
    float _228 = _71 * _216;
    float _230 = _86 * _188;
    float _232 = 0.0 + _230;
    float _234 = precise::clamp(_232, 0.0, 1.0);
    float _236 = _234 * _190;
    float _238 = _236 * _192;
    bool _242 = _238 > (*spvDescriptorSet0.fp_c9)._m0[141].z;
    bool _244 = isnan(_238);
    bool _246 = _242 || _244;
    bool _248 = isnan((*spvDescriptorSet0.fp_c9)._m0[141].z);
    bool _250 = _246 || _248;
    float _252 = in.m_39.x;
    float _254 = gl_FragCoord.w;
    float _256 = _252 * _254;
    if (!_250)
    {
        discard_fragment();
    }
    float _258 = _84 * _84;
    float _260 = _71 * _256;
    float _262 = _71 * _204;
    float _264 = _71 * _222;
    float _266 = -_224;
    float _268 = _260 + _266;
    float _270 = -_226;
    float _272 = _262 + _270;
    float _274 = -_264;
    float _276 = _228 + _274;
    float _278 = _80 * _80;
    float _280 = _82 * _82;
    float _282 = fma(_258, _276, _264);
    float _284 = fma(_278, _268, _224);
    float _286 = fma(_280, _272, _226);
    if (!_250)
    {
        out.m_46.x = _284;
        out.m_46.y = _286;
        out.m_46.z = _282;
        out.m_46.w = _230;
        return out;
    }
    float _288 = _286 * 0.715200006961822509765625;
    float _290 = in.m_48.w;
    float _292 = gl_FragCoord.w;
    float _294 = _290 * _292;
    float _296 = in.m_48.z;
    float _298 = gl_FragCoord.w;
    float _300 = _296 * _298;
    float _302 = in.m_48.x;
    float _304 = gl_FragCoord.w;
    float _306 = _302 * _304;
    float _308 = fma(_284, 0.2125999927520751953125, _288);
    float _310 = in.m_48.y;
    float _312 = gl_FragCoord.w;
    float _314 = _310 * _312;
    float _316 = 0.0 + _238;
    float _318 = precise::clamp(_316, 0.0, 1.0);
    float _320 = fma(_282, 0.072200000286102294921875, _308);
    bool _322 = (*spvDescriptorSet0.fp_c15)._m0[653].w >= 0.5;
    float _324 = 1.0 / _320;
    float _326 = _324 * (*spvDescriptorSet0.fp_c15)._m0[2].z;
    float _328 = precise::clamp(_326, 0.0, 1.0);
    float _330 = _71 * _294;
    float _332 = fma(_328, (*spvDescriptorSet0.fp_c15)._m0[2].y, (*spvDescriptorSet0.fp_c15)._m0[2].x);
    float _334 = _71 * _300;
    float _336 = _332 * _330;
    float _338 = _71 * _306;
    float _340 = _71 * _314;
    float _342 = fma(_282, _336, _334);
    float _344 = fma(_284, _336, _338);
    float _346 = fma(_286, _336, _340);
    float _348 = _334;
    if (!_322)
    {
        _348 = _318;
    }
    float _350 = _348;
    bool _352 = !_322;
    float _354 = _350;
    if (!_352)
    {
        float _356 = in.m_50.w;
        float _358 = gl_FragCoord.w;
        float _360 = _356 * _358;
        float _362 = in.m_50.z;
        float _364 = gl_FragCoord.w;
        float _366 = _362 * _364;
        float _368 = _71 * _360;
        float _370 = _71 * _366;
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
        float _392 = _318 * _390;
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

