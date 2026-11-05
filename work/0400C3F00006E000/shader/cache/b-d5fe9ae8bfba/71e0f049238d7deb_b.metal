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
    uint4 _m1[8];
    float4 _m2;
    float4 _m3;
    int _m4;
    float4 _m5[73];
    int4 _m6;
    int _m7;
};

struct _16
{
    float4 _m0[4096];
};

struct spvDescriptorSetBuffer0
{
    constant _10* support_buffer [[id(0)]];
    constant _16* fp_c9 [[id(1)]];
    constant _16* fp_c15 [[id(2)]];
    constant _16* fp_c8 [[id(3)]];
    texture2d<float> fp_t_tcb_8 [[id(4)]];
    sampler fp_t_tcb_8Smplr [[id(5)]];
    texturecube<float> fp_t_tcb_1E [[id(6)]];
    sampler fp_t_tcb_1ESmplr [[id(7)]];
    sampler fp_t_tcb_8Smplr_w [[id(8)]];
    sampler fp_t_tcb_1ESmplr_w [[id(9)]];
    constant dm_border_t* dm_border [[id(10)]];
};

struct main0_out
{
    float4 m_49 [[color(0)]];
};

struct main0_in
{
    float4 m_42 [[user(locn0)]];
    float4 m_46 [[user(locn1)]];
    float4 m_44 [[user(locn2)]];
    float4 m_59 [[user(locn3)]];
    float4 m_40 [[user(locn4)]];
    float4 m_38 [[user(locn5)]];
    float4 m_65 [[user(locn6)]];
    float4 m_53 [[user(locn7)]];
    float4 m_61 [[user(locn8)]];
    float4 m_51 [[user(locn9)]];
    float4 m_63 [[user(locn10)]];
};

fragment main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], float4 gl_FragCoord [[position]], bool gl_FrontFacing [[front_facing]])
{
    main0_out out = {};
    float _72 = gl_FragCoord.w;
    float _74 = in.m_38.x;
    float _76 = gl_FragCoord.w;
    float _78 = _74 * _76;
    float _80 = in.m_38.y;
    float _82 = gl_FragCoord.w;
    float _84 = _80 * _82;
    float _86 = 1.0 / _72;
    float _88 = _86 * _78;
    float _90 = _86 * _84;
    float2 _637;
    _637.x = spvDescriptorSet0.fp_t_tcb_8.calculate_clamped_lod(spvDescriptorSet0.fp_t_tcb_8Smplr, float2(_88, _90));
    _637.y = spvDescriptorSet0.fp_t_tcb_8.calculate_unclamped_lod(spvDescriptorSet0.fp_t_tcb_8Smplr, float2(_88, _90));
    float _92 = _637.x;
    float _94 = _92 * 256.0;
    int _97 = int(_94);
    float _99 = float(uint(_97));
    float _101 = _99 * 0.00390625;
    float _103 = precise::min(_101, 2.0);
    float2 _657 = float2(_88, _90);
    float4 _106 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_657, float2(0.0), isnan(_657)), level(_103)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_657, float2(0.0), isnan(_657)), level(_103)).xyzw;
    float _108 = _106.x;
    float _110 = _106.y;
    float _112 = _106.z;
    float _114 = _106.w;
    float _116 = in.m_40.w;
    float _118 = gl_FragCoord.w;
    float _120 = _116 * _118;
    float _122 = in.m_42.w;
    float _124 = gl_FragCoord.w;
    float _126 = _122 * _124;
    float _128 = in.m_44.x;
    float _130 = gl_FragCoord.w;
    float _132 = _128 * _130;
    float _134 = _86 * _120;
    float _136 = _86 * _126;
    float _138 = _86 * _132;
    float _140 = in.m_42.x;
    float _142 = gl_FragCoord.w;
    float _144 = _140 * _142;
    float _146 = in.m_42.y;
    float _148 = gl_FragCoord.w;
    float _150 = _146 * _148;
    float _152 = in.m_46.z;
    float _154 = gl_FragCoord.w;
    float _156 = _152 * _154;
    float _158 = in.m_46.y;
    float _160 = gl_FragCoord.w;
    float _162 = _158 * _160;
    float _164 = in.m_40.x;
    float _166 = gl_FragCoord.w;
    float _168 = _164 * _166;
    float _170 = in.m_40.y;
    float _172 = gl_FragCoord.w;
    float _174 = _170 * _172;
    float _176 = in.m_40.z;
    float _178 = gl_FragCoord.w;
    float _180 = _176 * _178;
    float _182 = _86 * _144;
    float _184 = _86 * _150;
    float _186 = _86 * _156;
    float _188 = _86 * _162;
    float _190 = -_188;
    float _192 = _184 + _190;
    float _194 = _114 * _134;
    float _196 = _136 * _194;
    float _198 = 0.0 + _196;
    float _200 = precise::clamp(_198, 0.0, 1.0);
    float _202 = _200 * _138;
    bool _205 = _202 > (*spvDescriptorSet0.fp_c9)._m0[141].z;
    bool _207 = isnan(_202);
    bool _209 = _205 || _207;
    bool _211 = isnan((*spvDescriptorSet0.fp_c9)._m0[141].z);
    bool _213 = _209 || _211;
    float _215 = in.m_46.x;
    float _217 = gl_FragCoord.w;
    float _219 = _215 * _217;
    float _221 = in.m_42.z;
    float _223 = gl_FragCoord.w;
    float _225 = _221 * _223;
    if (!_213)
    {
        discard_fragment();
    }
    float _227 = fma(_110, _192, _188);
    float _229 = _86 * _219;
    float _231 = _86 * _225;
    float _233 = -_229;
    float _235 = _182 + _233;
    float _237 = -_186;
    float _239 = _231 + _237;
    float _241 = fma(_108, _235, _229);
    float _243 = fma(_112, _239, _186);
    float _245 = _86 * _168;
    float _247 = _86 * _174;
    float _249 = _86 * _180;
    float _251 = _241 * _245;
    float _253 = _227 * _247;
    float _255 = _243 * _249;
    if (!_213)
    {
        out.m_49.x = _251;
        out.m_49.y = _253;
        out.m_49.z = _255;
        out.m_49.w = _196;
        return out;
    }
    float _257 = in.m_51.w;
    float _259 = gl_FragCoord.w;
    float _261 = _257 * _259;
    float _263 = _86 * _261;
    bool _265 = _263 != 1.0;
    bool _267 = isnan(_263);
    bool _269 = _265 || _267;
    bool _271 = isnan(1.0);
    bool _273 = _269 || _271;
    bool _275 = !_273;
    if (!_275)
    {
        float _277 = gl_FragCoord.x;
        float _279 = (*spvDescriptorSet0.support_buffer)._m5[0].x;
        float _281 = _277 / _279;
        float _283 = gl_FragCoord.y;
        float _285 = (*spvDescriptorSet0.support_buffer)._m5[0].x;
        float _287 = _283 / _285;
        float _289 = _263 * 256.0;
        float _291 = trunc(_289);
        int _293 = int(_291);
        uint _296 = uint(int(uint(_293) >> uint(7)));
        int _298 = int(_296) + _293;
        float _300 = trunc(_281);
        int _302 = int(_300);
        float _304 = trunc(_287);
        int _306 = int(_304);
        int _308 = _302 + 2;
        int _310 = _308 >> 1;
        uint _312 = uint(int(uint(_306) >> uint(1)));
        int _314 = _310 ^ int(_312);
        int _316 = _314 << 16;
        int _318 = _316 ^ _310;
        int _320 = 983055 & _318;
        int _322 = _320 << 6;
        int _324 = _322 + _320;
        int _326 = _324 & 13369548;
        uint _328 = uint(int(uint(_326) >> uint(3)));
        int _330 = _326 | int(_328);
        int _332 = _330 & 5570560;
        int _334 = _330 & 85;
        uint _336 = uint(int(uint(_332) >> uint(15)));
        int _338 = int(_336) + _334;
        bool _340 = uint(_298) > uint(_338);
        if (!_340)
        {
            discard_fragment();
        }
        if (!_340)
        {
            out.m_49.x = _251;
            out.m_49.y = _253;
            out.m_49.z = _255;
            out.m_49.w = _202;
            return out;
        }
    }
    float _342 = in.m_53.y;
    float _344 = gl_FragCoord.w;
    float _346 = _342 * _344;
    float _348 = as_type<float>(gl_FrontFacing ? (-1) : 0);
    float _350 = in.m_53.x;
    float _352 = gl_FragCoord.w;
    float _354 = _350 * _352;
    float _356 = in.m_53.z;
    float _358 = gl_FragCoord.w;
    float _360 = _356 * _358;
    float _362 = in.m_51.x;
    float _364 = gl_FragCoord.w;
    float _366 = _362 * _364;
    float _368 = _86 * _346;
    bool _370 = as_type<int>(_348) != 0;
    float _372 = _86 * _354;
    bool _374 = !_370;
    float _376 = -_368;
    float _378 = _374 ? _376 : _368;
    float _380 = _86 * _360;
    bool _382 = !_370;
    float _384 = -_372;
    float _386 = _382 ? _384 : _372;
    float _388 = _378 * _378;
    bool _390 = !_370;
    float _392 = -_380;
    float _394 = _390 ? _392 : _380;
    float _396 = fma(_386, _386, _388);
    float _398 = fma(_394, _394, _396);
    float _400 = rsqrt(_398);
    float _402 = _386 * _400;
    float _404 = _378 * _400;
    float _406 = _394 * _400;
    float _408 = _86 * _366;
    float _410 = abs(_402);
    float _412 = abs(_404);
    float _414 = precise::max(_410, _412);
    float _416 = abs(_406);
    float _418 = precise::max(_416, _414);
    float _420 = 1.0 / _418;
    float _422 = _402 * _420;
    float _424 = -_420;
    float _426 = _406 * _424;
    float _428 = precise::min(_408, 1.0);
    float _430 = _404 * _420;
    float3 _1137 = float3(_422, _430, _426);
    float3 _434 = dm_bs(spvDescriptorSet0.fp_t_tcb_1E.sample(spvDescriptorSet0.fp_t_tcb_1ESmplr, select(_1137, float3(0.0), isnan(_1137)), level(_428)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_1E, spvDescriptorSet0.fp_t_tcb_1ESmplr_w, select(_1137, float3(0.0), isnan(_1137)), level(_428)).xyz;
    float _436 = _434.x;
    float _438 = _434.y;
    float _440 = _434.z;
    float _442 = in.m_59.y;
    float _444 = gl_FragCoord.w;
    float _446 = _442 * _444;
    float _448 = in.m_59.z;
    float _450 = gl_FragCoord.w;
    float _452 = _448 * _450;
    float _454 = in.m_59.x;
    float _456 = gl_FragCoord.w;
    float _458 = _454 * _456;
    float _460 = in.m_61.z;
    float _462 = gl_FragCoord.w;
    float _464 = _460 * _462;
    float _466 = in.m_61.x;
    float _468 = gl_FragCoord.w;
    float _470 = _466 * _468;
    float _472 = in.m_61.y;
    float _474 = gl_FragCoord.w;
    float _476 = _472 * _474;
    float _478 = in.m_63.x;
    float _480 = gl_FragCoord.w;
    float _482 = _478 * _480;
    float _484 = in.m_63.w;
    float _486 = gl_FragCoord.w;
    float _488 = _484 * _486;
    float _490 = in.m_63.y;
    float _492 = gl_FragCoord.w;
    float _494 = _490 * _492;
    float _496 = in.m_63.z;
    float _498 = gl_FragCoord.w;
    float _500 = _496 * _498;
    float _502 = _86 * _446;
    float _504 = _86 * _452;
    float _506 = _86 * _458;
    bool _508 = (*spvDescriptorSet0.fp_c15)._m0[653].w >= 0.5;
    float _510 = _86 * _488;
    float _512 = fma(_440, 0.20999999344348907470703125, _504);
    float _514 = fma(_436, 0.20999999344348907470703125, _506);
    float _516 = _86 * _464;
    float _518 = fma(_438, 0.20999999344348907470703125, _502);
    float _520 = _86 * _470;
    float _522 = _86 * _476;
    float _524 = _512 + _516;
    float _526 = _514 + _520;
    float _528 = _518 + _522;
    float _530 = _255 * _524;
    float _532 = 0.0 + _202;
    float _534 = precise::clamp(_532, 0.0, 1.0);
    float _536 = _251 * _526;
    float _538 = _86 * _482;
    float _540 = _253 * _528;
    float _542 = _86 * _494;
    float _544 = _86 * _500;
    float _546 = fma(_536, _510, _538);
    float _548 = _538;
    if (!_508)
    {
        _548 = _534;
    }
    float _550 = _548;
    float _552 = fma(_540, _510, _542);
    float _554 = fma(_530, _510, _544);
    bool _556 = !_508;
    float _558 = _550;
    if (!_556)
    {
        float _560 = in.m_65.w;
        float _562 = gl_FragCoord.w;
        float _564 = _560 * _562;
        float _566 = in.m_65.z;
        float _568 = gl_FragCoord.w;
        float _570 = _566 * _568;
        float _572 = _86 * _564;
        float _574 = _86 * _570;
        float _576 = 1.0 / _572;
        float _578 = _574 * _576;
        float _580 = -(*spvDescriptorSet0.fp_c8)._m0[30].y;
        float _582 = fma(_578, (*spvDescriptorSet0.fp_c8)._m0[30].w, _580);
        float _584 = 1.0 / _582;
        float _586 = -(*spvDescriptorSet0.fp_c8)._m0[30].z;
        float _588 = -(*spvDescriptorSet0.fp_c8)._m0[30].x;
        float _590 = fma(_584, _586, _588);
        float _592 = _590 * 8.0;
        float _594 = precise::clamp(_592, 0.0, 1.0);
        float _596 = _534 * _594;
        _558 = _596;
    }
    float _598 = _558;
    float _600 = 0.0 + _598;
    float _602 = precise::clamp(_600, 0.0, 1.0);
    out.m_49.x = _546;
    out.m_49.y = _552;
    out.m_49.z = _554;
    out.m_49.w = _602;
    return out;
}

