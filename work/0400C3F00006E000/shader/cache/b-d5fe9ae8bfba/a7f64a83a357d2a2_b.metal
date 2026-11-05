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

struct spvDescriptorSetBuffer0
{
    constant _10* support_buffer [[id(0)]];
    texture2d<float> fp_t_tcb_8 [[id(1)]];
    sampler fp_t_tcb_8Smplr [[id(2)]];
    texture2d<float> fp_t_tcb_A [[id(3)]];
    sampler fp_t_tcb_ASmplr [[id(4)]];
    texturecube<float> fp_t_tcb_1E [[id(5)]];
    sampler fp_t_tcb_1ESmplr [[id(6)]];
    sampler fp_t_tcb_8Smplr_w [[id(7)]];
    sampler fp_t_tcb_ASmplr_w [[id(8)]];
    sampler fp_t_tcb_1ESmplr_w [[id(9)]];
    constant dm_border_t* dm_border [[id(10)]];
};

struct main0_out
{
    float4 m_43 [[color(0)]];
};

struct main0_in
{
    float4 m_34 [[user(locn0)]];
    float4 m_36 [[user(locn1)]];
    float4 m_32 [[user(locn2)]];
    float4 m_30 [[user(locn3)]];
    float4 m_55 [[user(locn4)]];
    float4 m_40 [[user(locn5)]];
    float4 m_45 [[user(locn6)]];
    float4 m_49 [[user(locn7)]];
    float4 m_47 [[user(locn8)]];
    float4 m_57 [[user(locn9)]];
    float4 m_38 [[user(locn10)]];
};

fragment main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], float4 gl_FragCoord [[position]], bool gl_FrontFacing [[front_facing]])
{
    main0_out out = {};
    float _64 = gl_FragCoord.w;
    float _66 = in.m_30.x;
    float _68 = gl_FragCoord.w;
    float _70 = _66 * _68;
    float _72 = in.m_30.y;
    float _74 = gl_FragCoord.w;
    float _76 = _72 * _74;
    float _78 = in.m_30.z;
    float _80 = gl_FragCoord.w;
    float _82 = _78 * _80;
    float _84 = in.m_30.w;
    float _86 = gl_FragCoord.w;
    float _88 = _84 * _86;
    float _90 = 1.0 / _64;
    float _92 = _90 * _70;
    float _94 = _90 * _76;
    float _96 = _90 * _82;
    float _98 = _90 * _88;
    float2 _664 = float2(_92, _94);
    float4 _101 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_664, float2(0.0), isnan(_664))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_664, float2(0.0), isnan(_664))).xyzw;
    float _103 = _101.x;
    float _105 = _101.y;
    float _107 = _101.z;
    float _109 = _101.w;
    float2 _683 = float2(_96, _98);
    float2 _113 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_683, float2(0.0), isnan(_683))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_683, float2(0.0), isnan(_683))).xy;
    float _115 = _113.x;
    float _117 = _113.y;
    float _119 = in.m_32.w;
    float _121 = gl_FragCoord.w;
    float _123 = _119 * _121;
    float _125 = in.m_34.x;
    float _127 = gl_FragCoord.w;
    float _129 = _125 * _127;
    float _131 = in.m_34.y;
    float _133 = gl_FragCoord.w;
    float _135 = _131 * _133;
    float _137 = in.m_36.y;
    float _139 = gl_FragCoord.w;
    float _141 = _137 * _139;
    float _143 = in.m_38.w;
    float _145 = gl_FragCoord.w;
    float _147 = _143 * _145;
    float _149 = in.m_36.x;
    float _151 = gl_FragCoord.w;
    float _153 = _149 * _151;
    float _155 = in.m_34.z;
    float _157 = gl_FragCoord.w;
    float _159 = _155 * _157;
    float _161 = in.m_36.z;
    float _163 = gl_FragCoord.w;
    float _165 = _161 * _163;
    float _167 = in.m_34.w;
    float _169 = gl_FragCoord.w;
    float _171 = _167 * _169;
    float _173 = in.m_32.x;
    float _175 = gl_FragCoord.w;
    float _177 = _173 * _175;
    float _179 = in.m_32.y;
    float _181 = gl_FragCoord.w;
    float _183 = _179 * _181;
    float _185 = in.m_32.z;
    float _187 = gl_FragCoord.w;
    float _189 = _185 * _187;
    float _191 = in.m_40.x;
    float _193 = gl_FragCoord.w;
    float _195 = _191 * _193;
    float _197 = _90 * _123;
    float _199 = _90 * _153;
    float _201 = _90 * _159;
    float _203 = _90 * _165;
    float _205 = _90 * _171;
    float _207 = -_203;
    float _209 = _201 + _207;
    float _211 = _90 * _195;
    float _213 = _109 * _197;
    float _215 = _90 * _129;
    float _217 = _90 * _135;
    float _219 = _90 * _141;
    float _221 = _205 * _213;
    float _223 = precise::clamp(_221, 0.0, 1.0);
    float _225 = -_199;
    float _227 = _215 + _225;
    float _229 = -_219;
    float _231 = _217 + _229;
    float _233 = _90 * _147;
    float _235 = fma(_103, _227, _199);
    float _237 = fma(_107, _209, _203);
    float _239 = fma(_105, _231, _219);
    float _241 = _90 * _177;
    bool _244 = _233 != 1.0;
    bool _246 = isnan(_233);
    bool _248 = _244 || _246;
    bool _250 = isnan(1.0);
    bool _252 = _248 || _250;
    float _254 = _90 * _183;
    float _256 = _90 * _189;
    float _258 = _235 * _241;
    float _260 = _239 * _254;
    float _262 = _237 * _256;
    float _264 = _223 * _211;
    bool _266 = !_252;
    if (!_266)
    {
        float _268 = gl_FragCoord.x;
        float _270 = (*spvDescriptorSet0.support_buffer)._m5[0].x;
        float _272 = _268 / _270;
        float _274 = gl_FragCoord.y;
        float _276 = (*spvDescriptorSet0.support_buffer)._m5[0].x;
        float _278 = _274 / _276;
        float _280 = _233 * 256.0;
        float _282 = trunc(_280);
        int _285 = int(_282);
        float _287 = trunc(_272);
        int _289 = int(_287);
        float _291 = trunc(_278);
        int _293 = int(_291);
        int _295 = _289 + 2;
        int _297 = _295 >> 1;
        uint _300 = uint(int(uint(_293) >> uint(1)));
        int _302 = _297 ^ int(_300);
        int _304 = _302 << 16;
        int _306 = _304 ^ _297;
        int _308 = 983055 & _306;
        int _310 = _308 << 6;
        int _312 = _310 + _308;
        int _314 = _312 & 13369548;
        uint _316 = uint(int(uint(_314) >> uint(3)));
        int _318 = _314 | int(_316);
        uint _320 = uint(int(uint(_285) >> uint(7)));
        int _322 = int(_320) + _285;
        int _324 = _318 & 5570560;
        int _326 = _318 & 85;
        uint _328 = uint(int(uint(_324) >> uint(15)));
        int _330 = int(_328) + _326;
        bool _332 = uint(_322) > uint(_330);
        if (!_332)
        {
            discard_fragment();
        }
        if (!_332)
        {
            out.m_43.x = _258;
            out.m_43.y = _260;
            out.m_43.z = _262;
            out.m_43.w = _264;
            return out;
        }
    }
    float _334 = in.m_45.y;
    float _336 = gl_FragCoord.w;
    float _338 = _334 * _336;
    float _340 = in.m_47.y;
    float _342 = gl_FragCoord.w;
    float _344 = _340 * _342;
    float _346 = in.m_47.z;
    float _348 = gl_FragCoord.w;
    float _350 = _346 * _348;
    float _352 = in.m_45.x;
    float _354 = gl_FragCoord.w;
    float _356 = _352 * _354;
    float _358 = in.m_47.x;
    float _360 = gl_FragCoord.w;
    float _362 = _358 * _360;
    float _364 = in.m_49.y;
    float _366 = gl_FragCoord.w;
    float _368 = _364 * _366;
    float _370 = in.m_45.z;
    float _372 = gl_FragCoord.w;
    float _374 = _370 * _372;
    float _376 = in.m_49.x;
    float _378 = gl_FragCoord.w;
    float _380 = _376 * _378;
    float _382 = in.m_49.z;
    float _384 = gl_FragCoord.w;
    float _386 = _382 * _384;
    float _388 = _117 * _117;
    float _390 = as_type<float>(gl_FrontFacing ? (-1) : 0);
    float _392 = fma(_115, _115, _388);
    float _394 = precise::clamp(_392, 0.0, 1.0);
    float _396 = _90 * _338;
    float _398 = _90 * _344;
    float _400 = -_394;
    float _402 = _400 + 1.0;
    float _404 = _90 * _350;
    float _406 = _90 * _356;
    float _408 = _396 * _396;
    float _410 = _90 * _362;
    float _412 = _398 * _398;
    float _414 = _90 * _368;
    float _416 = _90 * _374;
    float _418 = fma(_406, _406, _408);
    float _420 = fma(_410, _410, _412);
    float _422 = _90 * _380;
    float _424 = _414 * _414;
    float _426 = fma(_416, _416, _418);
    float _428 = fma(_404, _404, _420);
    float _430 = _90 * _386;
    float _432 = fma(_422, _422, _424);
    float _434 = rsqrt(_426);
    bool _436 = as_type<int>(_390) != 0;
    float _438 = fma(_430, _430, _432);
    float _440 = rsqrt(_428);
    float _442 = sqrt(_402);
    float _444 = _434 * _117;
    float _446 = _406 * _444;
    float _448 = in.m_38.x;
    float _450 = gl_FragCoord.w;
    float _452 = _448 * _450;
    float _454 = rsqrt(_438);
    float _456 = _440 * _115;
    float _458 = _396 * _444;
    float _460 = fma(_410, _456, _446);
    float _462 = fma(_398, _456, _458);
    float _464 = _416 * _444;
    float _466 = fma(_404, _456, _464);
    float _468 = _454 * _442;
    float _470 = fma(_414, _468, _462);
    float _472 = fma(_422, _468, _460);
    float _474 = fma(_430, _468, _466);
    bool _476 = !_436;
    float _478 = -_470;
    float _480 = _476 ? _478 : _470;
    bool _482 = !_436;
    float _484 = -_472;
    float _486 = _482 ? _484 : _472;
    bool _488 = !_436;
    float _490 = -_474;
    float _492 = _488 ? _490 : _474;
    float _494 = _480 * _480;
    float _496 = fma(_486, _486, _494);
    float _498 = fma(_492, _492, _496);
    float _500 = rsqrt(_498);
    float _502 = _486 * _500;
    float _504 = _480 * _500;
    float _506 = _492 * _500;
    float _508 = abs(_502);
    float _510 = abs(_504);
    float _512 = precise::max(_508, _510);
    float _514 = abs(_506);
    float _516 = precise::max(_514, _512);
    float _518 = _90 * _452;
    float _520 = 1.0 / _516;
    float _522 = _502 * _520;
    float _524 = _504 * _520;
    float _526 = -_520;
    float _528 = _506 * _526;
    float _530 = precise::min(_518, 1.0);
    float3 _1278 = float3(_522, _524, _528);
    float3 _534 = dm_bs(spvDescriptorSet0.fp_t_tcb_1E.sample(spvDescriptorSet0.fp_t_tcb_1ESmplr, select(_1278, float3(0.0), isnan(_1278)), level(_530)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.fp_t_tcb_1E, spvDescriptorSet0.fp_t_tcb_1ESmplr_w, select(_1278, float3(0.0), isnan(_1278)), level(_530)).xyz;
    float _536 = _534.x;
    float _538 = _534.y;
    float _540 = _534.z;
    float _542 = in.m_55.x;
    float _544 = gl_FragCoord.w;
    float _546 = _542 * _544;
    float _548 = in.m_55.y;
    float _550 = gl_FragCoord.w;
    float _552 = _548 * _550;
    float _554 = in.m_55.z;
    float _556 = gl_FragCoord.w;
    float _558 = _554 * _556;
    float _560 = in.m_57.x;
    float _562 = gl_FragCoord.w;
    float _564 = _560 * _562;
    float _566 = in.m_57.y;
    float _568 = gl_FragCoord.w;
    float _570 = _566 * _568;
    float _572 = in.m_57.z;
    float _574 = gl_FragCoord.w;
    float _576 = _572 * _574;
    float _578 = 0.0 + _264;
    float _580 = precise::clamp(_578, 0.0, 1.0);
    float _582 = _90 * _546;
    float _584 = _90 * _552;
    float _586 = _90 * _558;
    float _588 = _90 * _564;
    float _590 = _90 * _570;
    float _592 = _90 * _576;
    float _594 = fma(_538, 0.20999999344348907470703125, _584);
    float _596 = fma(_536, 0.20999999344348907470703125, _582);
    float _598 = fma(_540, 0.20999999344348907470703125, _586);
    float _600 = _594 + _590;
    float _602 = _596 + _588;
    float _604 = _598 + _592;
    float _606 = _260 * _600;
    float _608 = _258 * _602;
    float _610 = _262 * _604;
    out.m_43.x = _608;
    out.m_43.y = _606;
    out.m_43.z = _610;
    out.m_43.w = _580;
    return out;
}

