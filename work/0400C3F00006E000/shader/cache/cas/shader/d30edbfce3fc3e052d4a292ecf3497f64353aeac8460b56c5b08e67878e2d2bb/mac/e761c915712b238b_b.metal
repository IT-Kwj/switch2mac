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
    float4 m_52 [[color(0)]];
};

struct main0_in
{
    float4 m_43 [[user(locn0)]];
    float4 m_47 [[user(locn1)]];
    float4 m_39 [[user(locn2)]];
    float4 m_45 [[user(locn3)]];
    float4 m_37 [[user(locn4), flat]];
    float4 m_35 [[user(locn5)]];
    float4 m_56 [[user(locn6)]];
    float4 m_49 [[user(locn7)]];
    float4 m_41 [[user(locn8)]];
    float4 m_54 [[user(locn9)]];
};

fragment main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], float4 gl_FragCoord [[position]])
{
    main0_out out = {};
    float _63 = gl_FragCoord.w;
    float _65 = in.m_35.x;
    float _67 = gl_FragCoord.w;
    float _69 = _65 * _67;
    float _71 = in.m_35.y;
    float _73 = gl_FragCoord.w;
    float _75 = _71 * _73;
    float _77 = 1.0 / _63;
    float _79 = _77 * _69;
    float _81 = _77 * _75;
    float2 _523 = float2(_79, _81);
    float2 _85 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_523, float2(0.0), isnan(_523))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_523, float2(0.0), isnan(_523))).xy;
    float _87 = _85.x;
    float _89 = _85.y;
    float _91 = in.m_37.x;
    float _93 = in.m_35.z;
    float _95 = gl_FragCoord.w;
    float _97 = _93 * _95;
    float _99 = in.m_35.w;
    float _101 = gl_FragCoord.w;
    float _103 = _99 * _101;
    float _105 = _87 * _87;
    float _107 = _89 * _89;
    float _109 = _77 * _97;
    float _111 = _77 * _103;
    float _113 = fma(_105, 2.0, -1.0);
    float _115 = _91 * (*spvDescriptorSet0.fp_c9)._m0[21].x;
    float _117 = fma(_107, 2.0, -1.0);
    float _119 = _91 * (*spvDescriptorSet0.fp_c9)._m0[21].y;
    float _121 = fma(_115, _113, _109);
    float _123 = fma(_119, _117, _111);
    float2 _592 = float2(_121, _123);
    float4 _126 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_592, float2(0.0), isnan(_592))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_592, float2(0.0), isnan(_592))).xyzw;
    float _128 = _126.x;
    float _130 = _126.y;
    float _132 = _126.z;
    float _134 = _126.w;
    float _136 = in.m_39.y;
    float _138 = gl_FragCoord.w;
    float _140 = _136 * _138;
    float _142 = in.m_39.x;
    float _144 = gl_FragCoord.w;
    float _146 = _142 * _144;
    float _148 = in.m_39.z;
    float _150 = gl_FragCoord.w;
    float _152 = _148 * _150;
    float _154 = in.m_41.y;
    float _156 = gl_FragCoord.w;
    float _158 = _154 * _156;
    float _160 = in.m_41.x;
    float _162 = gl_FragCoord.w;
    float _164 = _160 * _162;
    float _166 = in.m_41.z;
    float _168 = gl_FragCoord.w;
    float _170 = _166 * _168;
    float _172 = in.m_43.w;
    float _174 = gl_FragCoord.w;
    float _176 = _172 * _174;
    float _178 = in.m_45.w;
    float _180 = gl_FragCoord.w;
    float _182 = _178 * _180;
    float _184 = _77 * _140;
    float _186 = _77 * _146;
    float _188 = _77 * _152;
    float _190 = _184 * _184;
    float _192 = fma(_186, _186, _190);
    float _194 = -(*spvDescriptorSet0.fp_c9)._m0[139].z;
    float _196 = _194 + (*spvDescriptorSet0.fp_c9)._m0[139].w;
    float _198 = fma(_188, _188, _192);
    float _200 = _77 * _158;
    float _202 = in.m_47.w;
    float _204 = gl_FragCoord.w;
    float _206 = _202 * _204;
    float _208 = rsqrt(_198);
    float _210 = 1.0 / _196;
    float _212 = in.m_49.x;
    float _214 = gl_FragCoord.w;
    float _216 = _212 * _214;
    float _218 = _184 * _208;
    float _220 = _186 * _208;
    float _222 = _188 * _208;
    float _224 = _200 * _218;
    float _226 = _77 * _164;
    float _228 = fma(_226, _220, _224);
    float _230 = _77 * _170;
    float _232 = fma(_230, _222, _228);
    float _234 = abs(_232);
    float _236 = -(*spvDescriptorSet0.fp_c9)._m0[139].z;
    float _238 = _234 + _236;
    float _240 = _238 * _210;
    float _242 = precise::clamp(_240, 0.0, 1.0);
    float _244 = _77 * _176;
    float _246 = fma(_242, -2.0, 3.0);
    float _248 = _242 * _242;
    float _250 = _77 * _182;
    float _252 = _246 * _248;
    float _254 = _77 * _216;
    float _256 = in.m_43.y;
    float _258 = gl_FragCoord.w;
    float _260 = _256 * _258;
    float _262 = in.m_47.x;
    float _264 = gl_FragCoord.w;
    float _266 = _262 * _264;
    float _268 = in.m_43.z;
    float _270 = gl_FragCoord.w;
    float _272 = _268 * _270;
    float _274 = in.m_47.z;
    float _276 = gl_FragCoord.w;
    float _278 = _274 * _276;
    float _280 = in.m_45.x;
    float _282 = gl_FragCoord.w;
    float _284 = _280 * _282;
    float _286 = in.m_45.y;
    float _288 = gl_FragCoord.w;
    float _290 = _286 * _288;
    float _292 = in.m_45.z;
    float _294 = gl_FragCoord.w;
    float _296 = _292 * _294;
    float _298 = _77 * _266;
    float _300 = -_244;
    float _302 = fma(_134, _250, _300);
    float _304 = _77 * _206;
    float _306 = _304 * _302;
    float _308 = 0.0 + _306;
    float _310 = precise::clamp(_308, 0.0, 1.0);
    float _312 = _310 * _252;
    float _314 = _312 * _254;
    bool _318 = _314 > (*spvDescriptorSet0.fp_c9)._m0[141].z;
    bool _320 = isnan(_314);
    bool _322 = _318 || _320;
    bool _324 = isnan((*spvDescriptorSet0.fp_c9)._m0[141].z);
    bool _326 = _322 || _324;
    float _328 = in.m_43.x;
    float _330 = gl_FragCoord.w;
    float _332 = _328 * _330;
    float _334 = in.m_47.y;
    float _336 = gl_FragCoord.w;
    float _338 = _334 * _336;
    if (!_326)
    {
        discard_fragment();
    }
    float _340 = _77 * _272;
    float _342 = _77 * _332;
    float _344 = _77 * _260;
    float _346 = _77 * _338;
    float _348 = _77 * _278;
    float _350 = -_298;
    float _352 = _342 + _350;
    float _354 = -_346;
    float _356 = _344 + _354;
    float _358 = -_348;
    float _360 = _340 + _358;
    float _362 = fma(_128, _352, _298);
    float _364 = _77 * _290;
    float _366 = fma(_130, _356, _346);
    float _368 = fma(_132, _360, _348);
    float _370 = _77 * _284;
    float _372 = _77 * _296;
    float _374 = _366 * _364;
    float _376 = _362 * _370;
    float _378 = _368 * _372;
    if (!_326)
    {
        out.m_52.x = _376;
        out.m_52.y = _374;
        out.m_52.z = _378;
        out.m_52.w = _306;
        return out;
    }
    float _380 = _374 * 0.715200006961822509765625;
    float _382 = in.m_54.w;
    float _384 = gl_FragCoord.w;
    float _386 = _382 * _384;
    float _388 = in.m_54.z;
    float _390 = gl_FragCoord.w;
    float _392 = _388 * _390;
    float _394 = in.m_54.x;
    float _396 = gl_FragCoord.w;
    float _398 = _394 * _396;
    float _400 = fma(_376, 0.2125999927520751953125, _380);
    float _402 = in.m_54.y;
    float _404 = gl_FragCoord.w;
    float _406 = _402 * _404;
    float _408 = fma(_378, 0.072200000286102294921875, _400);
    bool _410 = (*spvDescriptorSet0.fp_c15)._m0[653].w >= 0.5;
    float _412 = 1.0 / _408;
    float _414 = _412 * (*spvDescriptorSet0.fp_c15)._m0[2].z;
    float _416 = precise::clamp(_414, 0.0, 1.0);
    float _418 = _77 * _386;
    float _420 = fma(_416, (*spvDescriptorSet0.fp_c15)._m0[2].y, (*spvDescriptorSet0.fp_c15)._m0[2].x);
    float _422 = _77 * _392;
    float _424 = _420 * _418;
    float _426 = 0.0 + _314;
    float _428 = precise::clamp(_426, 0.0, 1.0);
    float _430 = _77 * _398;
    float _432 = _77 * _406;
    float _434 = fma(_378, _424, _422);
    float _436 = fma(_376, _424, _430);
    float _438 = fma(_374, _424, _432);
    float _440 = _422;
    if (!_410)
    {
        _440 = _428;
    }
    float _442 = _440;
    bool _444 = !_410;
    float _446 = _442;
    if (!_444)
    {
        float _448 = in.m_56.w;
        float _450 = gl_FragCoord.w;
        float _452 = _448 * _450;
        float _454 = in.m_56.z;
        float _456 = gl_FragCoord.w;
        float _458 = _454 * _456;
        float _460 = _77 * _452;
        float _462 = _77 * _458;
        float _464 = 1.0 / _460;
        float _466 = _462 * _464;
        float _468 = -(*spvDescriptorSet0.fp_c8)._m0[30].y;
        float _470 = fma(_466, (*spvDescriptorSet0.fp_c8)._m0[30].w, _468);
        float _472 = 1.0 / _470;
        float _474 = -(*spvDescriptorSet0.fp_c8)._m0[30].z;
        float _476 = -(*spvDescriptorSet0.fp_c8)._m0[30].x;
        float _478 = fma(_472, _474, _476);
        float _480 = _478 * 8.0;
        float _482 = precise::clamp(_480, 0.0, 1.0);
        float _484 = _428 * _482;
        _446 = _484;
    }
    float _486 = _446;
    float _488 = 0.0 + _486;
    float _490 = precise::clamp(_488, 0.0, 1.0);
    out.m_52.x = _436;
    out.m_52.y = _438;
    out.m_52.z = _434;
    out.m_52.w = _490;
    return out;
}

