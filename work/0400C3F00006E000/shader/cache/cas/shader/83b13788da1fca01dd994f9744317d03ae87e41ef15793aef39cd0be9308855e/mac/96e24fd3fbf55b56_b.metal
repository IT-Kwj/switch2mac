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
    float4 m_48 [[color(0)]];
};

struct main0_in
{
    float4 m_39 [[user(locn0)]];
    float4 m_43 [[user(locn1)]];
    float4 m_35 [[user(locn2)]];
    float4 m_50 [[user(locn3)]];
    float4 m_45 [[user(locn4)]];
    float4 m_41 [[user(locn5)]];
    float4 m_33 [[user(locn6)]];
    float4 m_37 [[user(locn7)]];
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
    float2 _448 = float2(_73, _75);
    float4 _78 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_448, float2(0.0), isnan(_448))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_448, float2(0.0), isnan(_448))).xyzw;
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
    float _130 = in.m_41.w;
    float _132 = gl_FragCoord.w;
    float _134 = _130 * _132;
    float _136 = _71 * _92;
    float _138 = _71 * _98;
    float _140 = _71 * _104;
    float _142 = _136 * _136;
    float _144 = fma(_138, _138, _142);
    float _146 = -(*spvDescriptorSet0.fp_c9)._m0[139].z;
    float _148 = _146 + (*spvDescriptorSet0.fp_c9)._m0[139].w;
    float _150 = fma(_140, _140, _144);
    float _152 = _71 * _110;
    float _154 = in.m_43.w;
    float _156 = gl_FragCoord.w;
    float _158 = _154 * _156;
    float _160 = rsqrt(_150);
    float _162 = 1.0 / _148;
    float _164 = in.m_45.x;
    float _166 = gl_FragCoord.w;
    float _168 = _164 * _166;
    float _170 = _136 * _160;
    float _172 = _138 * _160;
    float _174 = _140 * _160;
    float _176 = _152 * _170;
    float _178 = _71 * _116;
    float _180 = fma(_178, _172, _176);
    float _182 = _71 * _122;
    float _184 = fma(_182, _174, _180);
    float _186 = abs(_184);
    float _188 = -(*spvDescriptorSet0.fp_c9)._m0[139].z;
    float _190 = _186 + _188;
    float _192 = _190 * _162;
    float _194 = precise::clamp(_192, 0.0, 1.0);
    float _196 = _71 * _128;
    float _198 = fma(_194, -2.0, 3.0);
    float _200 = _194 * _194;
    float _202 = _71 * _134;
    float _204 = _198 * _200;
    float _206 = _71 * _168;
    float _208 = in.m_39.y;
    float _210 = gl_FragCoord.w;
    float _212 = _208 * _210;
    float _214 = in.m_43.x;
    float _216 = gl_FragCoord.w;
    float _218 = _214 * _216;
    float _220 = in.m_39.z;
    float _222 = gl_FragCoord.w;
    float _224 = _220 * _222;
    float _226 = in.m_43.z;
    float _228 = gl_FragCoord.w;
    float _230 = _226 * _228;
    float _232 = in.m_41.x;
    float _234 = gl_FragCoord.w;
    float _236 = _232 * _234;
    float _238 = in.m_41.y;
    float _240 = gl_FragCoord.w;
    float _242 = _238 * _240;
    float _244 = in.m_41.z;
    float _246 = gl_FragCoord.w;
    float _248 = _244 * _246;
    float _250 = _71 * _218;
    float _252 = -_196;
    float _254 = fma(_86, _202, _252);
    float _256 = _71 * _158;
    float _258 = _256 * _254;
    float _260 = 0.0 + _258;
    float _262 = precise::clamp(_260, 0.0, 1.0);
    float _264 = _262 * _204;
    float _266 = _264 * _206;
    bool _270 = _266 > (*spvDescriptorSet0.fp_c9)._m0[141].z;
    bool _272 = isnan(_266);
    bool _274 = _270 || _272;
    bool _276 = isnan((*spvDescriptorSet0.fp_c9)._m0[141].z);
    bool _278 = _274 || _276;
    float _280 = in.m_39.x;
    float _282 = gl_FragCoord.w;
    float _284 = _280 * _282;
    float _286 = in.m_43.y;
    float _288 = gl_FragCoord.w;
    float _290 = _286 * _288;
    if (!_278)
    {
        discard_fragment();
    }
    float _292 = _71 * _224;
    float _294 = _80 * _80;
    float _296 = _82 * _82;
    float _298 = _84 * _84;
    float _300 = _71 * _284;
    float _302 = _71 * _212;
    float _304 = _71 * _290;
    float _306 = _71 * _230;
    float _308 = -_250;
    float _310 = _300 + _308;
    float _312 = -_304;
    float _314 = _302 + _312;
    float _316 = -_306;
    float _318 = _292 + _316;
    float _320 = fma(_294, _310, _250);
    float _322 = _71 * _242;
    float _324 = fma(_296, _314, _304);
    float _326 = fma(_298, _318, _306);
    float _328 = _71 * _236;
    float _330 = _71 * _248;
    float _332 = _324 * _322;
    float _334 = _320 * _328;
    float _336 = _326 * _330;
    if (!_278)
    {
        out.m_48.x = _334;
        out.m_48.y = _332;
        out.m_48.z = _336;
        out.m_48.w = _258;
        return out;
    }
    float _338 = _332 * 0.715200006961822509765625;
    float _340 = 0.0 + _266;
    float _342 = precise::clamp(_340, 0.0, 1.0);
    float _344 = fma(_334, 0.2125999927520751953125, _338);
    bool _346 = (*spvDescriptorSet0.fp_c15)._m0[653].w >= 0.5;
    float _348 = fma(_336, 0.072200000286102294921875, _344);
    float _350 = 1.0 / _348;
    float _352 = _350 * (*spvDescriptorSet0.fp_c15)._m0[661].z;
    float _354 = precise::clamp(_352, 0.0, 1.0);
    float _356 = fma(_354, (*spvDescriptorSet0.fp_c15)._m0[661].y, (*spvDescriptorSet0.fp_c15)._m0[661].x);
    float _358 = _334 * _356;
    float _360 = _332 * _356;
    float _362 = _336 * _356;
    float _364 = _356;
    if (!_346)
    {
        _364 = _342;
    }
    float _366 = _364;
    bool _368 = !_346;
    float _370 = _366;
    if (!_368)
    {
        float _372 = in.m_50.w;
        float _374 = gl_FragCoord.w;
        float _376 = _372 * _374;
        float _378 = in.m_50.z;
        float _380 = gl_FragCoord.w;
        float _382 = _378 * _380;
        float _384 = _71 * _376;
        float _386 = _71 * _382;
        float _388 = 1.0 / _384;
        float _390 = _386 * _388;
        float _392 = -(*spvDescriptorSet0.fp_c8)._m0[30].y;
        float _394 = fma(_390, (*spvDescriptorSet0.fp_c8)._m0[30].w, _392);
        float _396 = 1.0 / _394;
        float _398 = -(*spvDescriptorSet0.fp_c8)._m0[30].z;
        float _400 = -(*spvDescriptorSet0.fp_c8)._m0[30].x;
        float _402 = fma(_396, _398, _400);
        float _404 = _402 * 8.0;
        float _406 = precise::clamp(_404, 0.0, 1.0);
        float _408 = _342 * _406;
        _370 = _408;
    }
    float _410 = _370;
    float _412 = 0.0 + _410;
    float _414 = precise::clamp(_412, 0.0, 1.0);
    out.m_48.x = _358;
    out.m_48.y = _360;
    out.m_48.z = _362;
    out.m_48.w = _414;
    return out;
}

