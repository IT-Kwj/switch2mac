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
    constant _16* fp_c8 [[id(0)]];
    constant _16* fp_c9 [[id(1)]];
    constant _16* fp_c15 [[id(2)]];
    texture2d<float> fp_t_tcb_10 [[id(3)]];
    sampler fp_t_tcb_10Smplr [[id(4)]];
    texture2d<float> fp_t_tcb_A [[id(5)]];
    sampler fp_t_tcb_ASmplr [[id(6)]];
    texture2d<float> fp_t_tcb_8 [[id(7)]];
    sampler fp_t_tcb_8Smplr [[id(8)]];
    texture2d<float> fp_t_tcb_C [[id(9)]];
    sampler fp_t_tcb_CSmplr [[id(10)]];
    sampler fp_t_tcb_10Smplr_w [[id(11)]];
    sampler fp_t_tcb_ASmplr_w [[id(12)]];
    sampler fp_t_tcb_8Smplr_w [[id(13)]];
    sampler fp_t_tcb_CSmplr_w [[id(14)]];
    constant dm_border_t* dm_border [[id(15)]];
};

struct main0_out
{
    float4 m_54 [[color(0)]];
};

struct main0_in
{
    float4 m_47 [[user(locn0)]];
    float4 m_49 [[user(locn1)]];
    float4 m_41 [[user(locn2)]];
    float4 m_39 [[user(locn3)]];
    float4 m_51 [[user(locn4)]];
    float4 m_45 [[user(locn5)]];
    float4 m_43 [[user(locn6)]];
    float4 m_56 [[user(locn8)]];
};

fragment main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], float4 gl_FragCoord [[position]])
{
    main0_out out = {};
    float _63 = gl_FragCoord.w;
    float _65 = in.m_39.w;
    float _67 = gl_FragCoord.w;
    float _69 = _65 * _67;
    float _71 = in.m_39.x;
    float _73 = gl_FragCoord.w;
    float _75 = _71 * _73;
    float _77 = in.m_39.y;
    float _79 = gl_FragCoord.w;
    float _81 = _77 * _79;
    float _83 = in.m_41.z;
    float _85 = gl_FragCoord.w;
    float _87 = _83 * _85;
    float _89 = in.m_41.x;
    float _91 = gl_FragCoord.w;
    float _93 = _89 * _91;
    float _95 = in.m_41.y;
    float _97 = gl_FragCoord.w;
    float _99 = _95 * _97;
    float _101 = in.m_41.w;
    float _103 = gl_FragCoord.w;
    float _105 = _101 * _103;
    float _107 = in.m_43.x;
    float _109 = gl_FragCoord.w;
    float _111 = _107 * _109;
    float _113 = in.m_43.y;
    float _115 = gl_FragCoord.w;
    float _117 = _113 * _115;
    float _119 = 1.0 / _63;
    float _121 = _119 * _69;
    float _123 = _119 * _75;
    float _125 = _119 * _81;
    float _127 = _119 * _87;
    float _129 = 1.0 / _121;
    float _131 = _119 * _93;
    float _133 = _119 * _105;
    float _135 = _119 * _111;
    float _137 = _119 * _117;
    float _139 = _123 * _129;
    float _141 = _125 * _129;
    float _143 = _119 * _99;
    float2 _577 = float2(_139, _141);
    float _145 = dm_bs(spvDescriptorSet0.fp_t_tcb_10.sample(spvDescriptorSet0.fp_t_tcb_10Smplr, select(_577, float2(0.0), isnan(_577))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_10, spvDescriptorSet0.fp_t_tcb_10Smplr_w, select(_577, float2(0.0), isnan(_577))).x;
    float2 _588 = float2(_127, _133);
    float _147 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_588, float2(0.0), isnan(_588))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_588, float2(0.0), isnan(_588))).w;
    float2 _596 = float2(_131, _143);
    float4 _150 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_596, float2(0.0), isnan(_596))), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_596, float2(0.0), isnan(_596))).xyzw;
    float _152 = _150.x;
    float _154 = _150.y;
    float _156 = _150.z;
    float _158 = _150.w;
    float2 _612 = float2(_135, _137);
    float4 _160 = dm_bs(spvDescriptorSet0.fp_t_tcb_C.sample(spvDescriptorSet0.fp_t_tcb_CSmplr, select(_612, float2(0.0), isnan(_612))), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.fp_t_tcb_C, spvDescriptorSet0.fp_t_tcb_CSmplr_w, select(_612, float2(0.0), isnan(_612))).xyzw;
    float _162 = _160.x;
    float _164 = _160.y;
    float _166 = _160.z;
    float _168 = _160.w;
    float _170 = in.m_39.z;
    float _172 = gl_FragCoord.w;
    float _174 = _170 * _172;
    float _176 = in.m_45.w;
    float _178 = gl_FragCoord.w;
    float _180 = _176 * _178;
    float _182 = in.m_47.w;
    float _184 = gl_FragCoord.w;
    float _186 = _182 * _184;
    float _188 = in.m_49.w;
    float _190 = gl_FragCoord.w;
    float _192 = _188 * _190;
    float _194 = in.m_51.x;
    float _196 = gl_FragCoord.w;
    float _198 = _194 * _196;
    float _200 = _119 * _174;
    float _202 = _200 * _129;
    float _204 = -(*spvDescriptorSet0.fp_c8)._m0[30].y;
    float _206 = fma(_202, (*spvDescriptorSet0.fp_c8)._m0[30].w, _204);
    float _208 = 1.0 / _206;
    float _210 = _119 * _180;
    float _212 = 1.0 / (*spvDescriptorSet0.fp_c9)._m0[142].y;
    float _214 = -(*spvDescriptorSet0.fp_c8)._m0[30].z;
    float _216 = _208 * _214;
    float _218 = in.m_49.z;
    float _220 = gl_FragCoord.w;
    float _222 = _218 * _220;
    float _224 = in.m_45.x;
    float _226 = gl_FragCoord.w;
    float _228 = _224 * _226;
    float _230 = in.m_45.y;
    float _232 = gl_FragCoord.w;
    float _234 = _230 * _232;
    float _236 = -(*spvDescriptorSet0.fp_c8)._m0[30].y;
    float _238 = fma(_145, (*spvDescriptorSet0.fp_c8)._m0[30].w, _236);
    float _240 = -_147;
    float _242 = _158 + _240;
    float _244 = _119 * _192;
    float _246 = 1.0 / _238;
    float _248 = _242 * _168;
    float _250 = _119 * _198;
    float _252 = _248 * _210;
    float _254 = _119 * _186;
    float _256 = _254 * _252;
    float _258 = _244 * _256;
    float _260 = -(*spvDescriptorSet0.fp_c8)._m0[30].z;
    float _262 = -_216;
    float _264 = fma(_246, _260, _262);
    float _266 = 0.0 + _258;
    float _268 = precise::clamp(_266, 0.0, 1.0);
    float _270 = _264 * _212;
    float _272 = precise::clamp(_270, 0.0, 1.0);
    float _274 = _268 * _272;
    float _276 = _274 * _250;
    bool _280 = _276 > (*spvDescriptorSet0.fp_c9)._m0[141].z;
    bool _282 = isnan(_276);
    bool _284 = _280 || _282;
    bool _286 = isnan((*spvDescriptorSet0.fp_c9)._m0[141].z);
    bool _288 = _284 || _286;
    float _290 = in.m_47.y;
    float _292 = gl_FragCoord.w;
    float _294 = _290 * _292;
    float _296 = in.m_47.x;
    float _298 = gl_FragCoord.w;
    float _300 = _296 * _298;
    float _302 = in.m_47.z;
    float _304 = gl_FragCoord.w;
    float _306 = _302 * _304;
    float _308 = in.m_49.x;
    float _310 = gl_FragCoord.w;
    float _312 = _308 * _310;
    float _314 = in.m_49.y;
    float _316 = gl_FragCoord.w;
    float _318 = _314 * _316;
    if (!_288)
    {
        discard_fragment();
    }
    float _320 = in.m_45.z;
    float _322 = gl_FragCoord.w;
    float _324 = _320 * _322;
    float _326 = _162 * _162;
    float _328 = _164 * _164;
    float _330 = _152 * _326;
    float _332 = _154 * _328;
    float _334 = _166 * _166;
    float _336 = _156 * _334;
    float _338 = _119 * _294;
    float _340 = _119 * _300;
    float _342 = _119 * _306;
    float _344 = _119 * _222;
    float _346 = _119 * _312;
    float _348 = _119 * _318;
    float _350 = -_344;
    float _352 = _342 + _350;
    float _354 = -_346;
    float _356 = _340 + _354;
    float _358 = -_348;
    float _360 = _338 + _358;
    float _362 = fma(_336, _352, _344);
    float _364 = fma(_330, _356, _346);
    float _366 = fma(_332, _360, _348);
    float _368 = _119 * _228;
    float _370 = _119 * _234;
    float _372 = _119 * _324;
    float _374 = _364 * _368;
    float _376 = _366 * _370;
    float _378 = _362 * _372;
    if (!_288)
    {
        out.m_54.x = _374;
        out.m_54.y = _376;
        out.m_54.z = _378;
        out.m_54.w = _258;
        return out;
    }
    float _380 = _376 * 0.715200006961822509765625;
    float _382 = in.m_56.w;
    float _384 = gl_FragCoord.w;
    float _386 = _382 * _384;
    float _388 = in.m_56.x;
    float _390 = gl_FragCoord.w;
    float _392 = _388 * _390;
    float _394 = in.m_56.y;
    float _396 = gl_FragCoord.w;
    float _398 = _394 * _396;
    float _400 = fma(_374, 0.2125999927520751953125, _380);
    float _402 = in.m_56.z;
    float _404 = gl_FragCoord.w;
    float _406 = _402 * _404;
    float _408 = fma(_378, 0.072200000286102294921875, _400);
    bool _410 = (*spvDescriptorSet0.fp_c15)._m0[653].w >= 0.5;
    float _412 = 1.0 / _408;
    float _414 = (*spvDescriptorSet0.fp_c15)._m0[653].w;
    if (_410)
    {
        float _416 = -(*spvDescriptorSet0.fp_c8)._m0[30].x;
        float _418 = _216 + _416;
        _414 = _418;
    }
    float _420 = _414;
    float _422 = _412 * (*spvDescriptorSet0.fp_c15)._m0[2].z;
    float _424 = precise::clamp(_422, 0.0, 1.0);
    float _426 = fma(_424, (*spvDescriptorSet0.fp_c15)._m0[2].y, (*spvDescriptorSet0.fp_c15)._m0[2].x);
    float _428 = _119 * _386;
    float _430 = _119 * _398;
    float _432 = _426 * _428;
    float _434 = 0.0 + _276;
    float _436 = precise::clamp(_434, 0.0, 1.0);
    float _438 = _428;
    float _440 = _436;
    if (_410)
    {
        float _442 = _420 * 8.0;
        float _444 = precise::clamp(_442, 0.0, 1.0);
        _438 = _444;
    }
    float _446 = _438;
    float _448 = _119 * _392;
    float _450 = _119 * _406;
    float _452 = fma(_376, _432, _430);
    if (_410)
    {
        float _454 = _436 * _446;
        _440 = _454;
    }
    float _456 = _440;
    float _458 = fma(_374, _432, _448);
    float _460 = fma(_378, _432, _450);
    float _462 = 0.0 + _456;
    float _464 = precise::clamp(_462, 0.0, 1.0);
    out.m_54.x = _458;
    out.m_54.y = _452;
    out.m_54.z = _460;
    out.m_54.w = _464;
    return out;
}

