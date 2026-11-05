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
    constant _16* fp_c3 [[id(0)]];
    constant _16* fp_c4 [[id(1)]];
    texture2d<float> fp_t_tcb_8 [[id(2)]];
    sampler fp_t_tcb_8Smplr [[id(3)]];
    texture2d_array<float> fp_t_tcb_A [[id(4)]];
    sampler fp_t_tcb_ASmplr [[id(5)]];
    sampler fp_t_tcb_8Smplr_w [[id(6)]];
    sampler fp_t_tcb_ASmplr_w [[id(7)]];
    constant dm_border_t* dm_border [[id(8)]];
};

struct main0_out
{
    float4 m_39 [[color(0)]];
};

struct main0_in
{
    float4 m_36 [[user(locn0)]];
};

fragment main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], float4 gl_FragCoord [[position]])
{
    main0_out out = {};
    bool _2920 = false;
    bool _2440 = false;
    bool _1968 = false;
    bool _1480 = false;
    float _46 = gl_FragCoord.w;
    float _48 = in.m_36.x;
    float _50 = gl_FragCoord.w;
    float _52 = _48 * _50;
    float _54 = in.m_36.y;
    float _56 = gl_FragCoord.w;
    float _58 = _54 * _56;
    float _60 = 1.0 / _46;
    float _62 = _60 * _52;
    float _64 = _60 * _58;
    float2 _2965 = float2(_62, _64);
    float _66 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_2965, float2(0.0), isnan(_2965))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_2965, float2(0.0), isnan(_2965))).x;
    float _68 = fma(_66, (*spvDescriptorSet0.fp_c3)._m0[0].w, (*spvDescriptorSet0.fp_c3)._m0[0].z);
    float _70 = fma(_64, 2.0, -1.0);
    float _72 = fma(_62, 2.0, -1.0);
    float _74 = _68 * (*spvDescriptorSet0.fp_c3)._m0[1].y;
    float _76 = _70 * (*spvDescriptorSet0.fp_c3)._m0[0].y;
    float _78 = _72 * (*spvDescriptorSet0.fp_c3)._m0[0].x;
    bool _82 = _74 > (*spvDescriptorSet0.fp_c4)._m0[33].y;
    float _84 = _68 * _76;
    bool _86 = _74 > (*spvDescriptorSet0.fp_c4)._m0[33].x;
    float _88 = _68 * _78;
    bool _90 = _74 > (*spvDescriptorSet0.fp_c4)._m0[33].z;
    float _92 = -(*spvDescriptorSet0.fp_c3)._m0[3].y;
    float _94 = _84 * _92;
    bool _96 = !_82;
    int _99 = _96 ? 0 : 1;
    float _101 = -(*spvDescriptorSet0.fp_c3)._m0[2].y;
    float _103 = _84 * _101;
    float _105 = -(*spvDescriptorSet0.fp_c3)._m0[4].y;
    float _107 = _84 * _105;
    float _109 = fma(_88, (*spvDescriptorSet0.fp_c3)._m0[3].x, _94);
    int _111 = 2;
    if (!_82)
    {
        _111 = 1;
    }
    int _113 = _111;
    float _115 = -_74;
    float _117 = fma(_115, (*spvDescriptorSet0.fp_c3)._m0[3].z, _109);
    int _119 = _113;
    if (!_86)
    {
        _119 = _99;
    }
    int _121 = _119;
    float _123 = fma(_88, (*spvDescriptorSet0.fp_c3)._m0[2].x, _103);
    float _125 = fma(_88, (*spvDescriptorSet0.fp_c3)._m0[4].x, _107);
    float _127 = _117 + (*spvDescriptorSet0.fp_c3)._m0[3].w;
    int _129 = _121 + 1;
    float _131 = -_74;
    float _133 = fma(_131, (*spvDescriptorSet0.fp_c3)._m0[2].z, _123);
    int _135 = _129;
    if (!_90)
    {
        _135 = _121;
    }
    int _137 = _135;
    float _139 = -_74;
    float _141 = fma(_139, (*spvDescriptorSet0.fp_c3)._m0[4].z, _125);
    float _143 = _133 + (*spvDescriptorSet0.fp_c3)._m0[2].w;
    bool _145 = _137 != 1;
    float _147 = _141 + (*spvDescriptorSet0.fp_c3)._m0[4].w;
    float _149 = _127 * 78.233001708984375;
    bool _151 = _137 != 0;
    bool _153 = !_145;
    int _155 = _153 ? as_type<int>((*spvDescriptorSet0.fp_c4)._m0[26].x) : as_type<int>((*spvDescriptorSet0.fp_c4)._m0[30].x);
    float _157 = fma(_147, 12.98980045318603515625, _149);
    bool _159 = !_145;
    int _161 = _159 ? as_type<int>((*spvDescriptorSet0.fp_c4)._m0[26].y) : as_type<int>((*spvDescriptorSet0.fp_c4)._m0[30].y);
    float _163 = fma(_143, 12.98980045318603515625, _149);
    bool _165 = !_145;
    int _167 = _165 ? as_type<int>((*spvDescriptorSet0.fp_c4)._m0[28].x) : as_type<int>((*spvDescriptorSet0.fp_c4)._m0[32].x);
    float _169 = fma(_143, 45.16400146484375, _157);
    bool _171 = !_145;
    int _173 = _171 ? as_type<int>((*spvDescriptorSet0.fp_c4)._m0[28].y) : as_type<int>((*spvDescriptorSet0.fp_c4)._m0[32].y);
    float _175 = fma(_147, 45.16400146484375, _163);
    float _177 = _151 ? as_type<float>(_155) : (*spvDescriptorSet0.fp_c4)._m0[22].x;
    float _179 = _169 + 94.67299652099609375;
    float _181 = _151 ? as_type<float>(_173) : (*spvDescriptorSet0.fp_c4)._m0[24].y;
    float _183 = _175 + 189.3459930419921875;
    float _185 = _151 ? as_type<float>(_161) : (*spvDescriptorSet0.fp_c4)._m0[22].y;
    float _187 = _179 * 0.15915493667125701904296875;
    float _189 = _151 ? as_type<float>(_167) : (*spvDescriptorSet0.fp_c4)._m0[24].x;
    float _191 = _127 * _181;
    float _193 = _175 + 94.67299652099609375;
    float _195 = _127 * _185;
    float _197 = _187 * 6.283185482025146484375;
    float _199 = sin(_197);
    float _201 = fma(_143, _189, _191);
    float _203 = _169 + 189.3459930419921875;
    float _205 = fma(_143, _177, _195);
    float _207 = _193 * 0.15915493667125701904296875;
    float _209 = _203 * 0.15915493667125701904296875;
    bool _211 = !_145;
    int _213 = _211 ? as_type<int>((*spvDescriptorSet0.fp_c4)._m0[25].x) : as_type<int>((*spvDescriptorSet0.fp_c4)._m0[29].x);
    float _215 = _207 * 6.283185482025146484375;
    float _217 = sin(_215);
    bool _219 = !_145;
    int _221 = _219 ? as_type<int>((*spvDescriptorSet0.fp_c4)._m0[25].y) : as_type<int>((*spvDescriptorSet0.fp_c4)._m0[29].y);
    float _223 = _183 * 0.15915493667125701904296875;
    bool _225 = !_145;
    int _227 = _225 ? as_type<int>((*spvDescriptorSet0.fp_c4)._m0[28].z) : as_type<int>((*spvDescriptorSet0.fp_c4)._m0[32].z);
    bool _229 = !_145;
    int _231 = _229 ? as_type<int>((*spvDescriptorSet0.fp_c4)._m0[26].z) : as_type<int>((*spvDescriptorSet0.fp_c4)._m0[30].z);
    float _233 = _151 ? as_type<float>(_221) : (*spvDescriptorSet0.fp_c4)._m0[21].y;
    float _235 = _169 + 284.01898193359375;
    bool _237 = !_145;
    int _239 = _237 ? as_type<int>((*spvDescriptorSet0.fp_c4)._m0[28].w) : as_type<int>((*spvDescriptorSet0.fp_c4)._m0[32].w);
    float _241 = _209 * 6.283185482025146484375;
    float _243 = sin(_241);
    float _245 = _151 ? as_type<float>(_227) : (*spvDescriptorSet0.fp_c4)._m0[24].z;
    float _247 = _235 * 0.15915493667125701904296875;
    float _249 = _151 ? as_type<float>(_231) : (*spvDescriptorSet0.fp_c4)._m0[22].z;
    float _251 = _127 * _233;
    float _253 = _151 ? as_type<float>(_213) : (*spvDescriptorSet0.fp_c4)._m0[21].x;
    float _255 = fma(_147, _245, _201);
    float _257 = _151 ? as_type<float>(_239) : (*spvDescriptorSet0.fp_c4)._m0[24].w;
    float _259 = fma(_147, _249, _205);
    float _261 = fma(_143, _253, _251);
    float _263 = _257 + _255;
    float _265 = _169 + 378.691986083984375;
    float _267 = _223 * 6.283185482025146484375;
    float _269 = sin(_267);
    bool _271 = !_145;
    int _273 = _271 ? as_type<int>((*spvDescriptorSet0.fp_c4)._m0[25].z) : as_type<int>((*spvDescriptorSet0.fp_c4)._m0[29].z);
    float _275 = _265 * 0.15915493667125701904296875;
    float _277 = float(_137);
    bool _279 = !_145;
    int _281 = _279 ? as_type<int>((*spvDescriptorSet0.fp_c4)._m0[25].w) : as_type<int>((*spvDescriptorSet0.fp_c4)._m0[29].w);
    bool _283 = !_145;
    int _285 = _283 ? as_type<int>((*spvDescriptorSet0.fp_c4)._m0[26].w) : as_type<int>((*spvDescriptorSet0.fp_c4)._m0[30].w);
    float _287 = 1.0 / _263;
    float _289 = _151 ? as_type<float>(_273) : (*spvDescriptorSet0.fp_c4)._m0[21].z;
    float _291 = _175 + 284.01898193359375;
    float _293 = _151 ? as_type<float>(_285) : (*spvDescriptorSet0.fp_c4)._m0[22].w;
    float _295 = _151 ? as_type<float>(_281) : (*spvDescriptorSet0.fp_c4)._m0[21].w;
    float _297 = fma(_147, _289, _261);
    float _299 = _291 * 0.15915493667125701904296875;
    float _301 = rint(_277);
    float _303 = precise::max(_301, 0.0);
    uint _306 = uint(_303);
    uint _308 = clamp(_306, 0u, 65535u);
    float _310 = _293 + _259;
    float _312 = _295 + _297;
    float _314 = _175 + 378.691986083984375;
    float _316 = _314 * 0.15915493667125701904296875;
    float _318 = _310 * _287;
    float _320 = _312 * _287;
    float _322 = _275 * 6.283185482025146484375;
    float _324 = sin(_322);
    float3 _3460 = float3(_320, _318, float(int(_308)));
    float3 _3464 = select(_3460, float3(0.0), isnan(_3460));
    float _326 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, _3464.xy, uint(rint(_3464.z))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, _3464.xy, uint(rint(_3464.z))).x;
    float _328 = _299 * 6.283185482025146484375;
    float _330 = sin(_328);
    float _332 = _217 * 43758.546875;
    float _334 = _199 * 43758.546875;
    bool _336 = !_145;
    int _338 = _336 ? as_type<int>((*spvDescriptorSet0.fp_c4)._m0[27].y) : as_type<int>((*spvDescriptorSet0.fp_c4)._m0[31].y);
    float _340 = _243 * 43758.546875;
    bool _342 = !_145;
    int _344 = _342 ? as_type<int>((*spvDescriptorSet0.fp_c4)._m0[5].y) : as_type<int>((*spvDescriptorSet0.fp_c4)._m0[8].y);
    float _346 = _247 * 6.283185482025146484375;
    float _348 = sin(_346);
    bool _350 = !_145;
    int _352 = _350 ? as_type<int>((*spvDescriptorSet0.fp_c4)._m0[3].y) : as_type<int>((*spvDescriptorSet0.fp_c4)._m0[6].y);
    float _354 = _269 * 43758.546875;
    float _356 = _151 ? as_type<float>(_338) : (*spvDescriptorSet0.fp_c4)._m0[23].y;
    float _358 = _151 ? as_type<float>(_344) : (*spvDescriptorSet0.fp_c4)._m0[2].y;
    float _360 = _151 ? as_type<float>(_352) : (*spvDescriptorSet0.fp_c4)._m0[0].y;
    float _362 = _127 * _356;
    float _364 = _127 * _358;
    float _366 = _127 * _360;
    float _368 = _316 * 6.283185482025146484375;
    float _370 = sin(_368);
    bool _372 = !_145;
    int _374 = _372 ? as_type<int>((*spvDescriptorSet0.fp_c4)._m0[4].y) : as_type<int>((*spvDescriptorSet0.fp_c4)._m0[7].y);
    float _376 = _330 * 43758.546875;
    float _378 = _348 * 43758.546875;
    bool _380 = !_145;
    int _382 = _380 ? as_type<int>((*spvDescriptorSet0.fp_c4)._m0[27].x) : as_type<int>((*spvDescriptorSet0.fp_c4)._m0[31].x);
    float _384 = floor(_332);
    bool _386 = !_145;
    int _388 = _386 ? as_type<int>((*spvDescriptorSet0.fp_c4)._m0[3].x) : as_type<int>((*spvDescriptorSet0.fp_c4)._m0[6].x);
    float _390 = _151 ? as_type<float>(_374) : (*spvDescriptorSet0.fp_c4)._m0[1].y;
    bool _392 = !_145;
    int _394 = _392 ? as_type<int>((*spvDescriptorSet0.fp_c4)._m0[4].x) : as_type<int>((*spvDescriptorSet0.fp_c4)._m0[7].x);
    bool _396 = !_145;
    int _398 = _396 ? as_type<int>((*spvDescriptorSet0.fp_c4)._m0[5].x) : as_type<int>((*spvDescriptorSet0.fp_c4)._m0[8].x);
    float _400 = _127 * _390;
    float _402 = _151 ? as_type<float>(_382) : (*spvDescriptorSet0.fp_c4)._m0[23].x;
    float _404 = floor(_334);
    float _406 = _151 ? as_type<float>(_388) : (*spvDescriptorSet0.fp_c4)._m0[0].x;
    float _408 = _151 ? as_type<float>(_394) : (*spvDescriptorSet0.fp_c4)._m0[1].x;
    float _410 = fma(_143, _402, _362);
    float _412 = _151 ? as_type<float>(_398) : (*spvDescriptorSet0.fp_c4)._m0[2].x;
    float _414 = fma(_143, _406, _366);
    float _416 = fma(_143, _408, _400);
    float _418 = fma(_143, _412, _364);
    float _420 = _324 * 43758.546875;
    bool _422 = !_145;
    int _424 = _422 ? as_type<int>((*spvDescriptorSet0.fp_c4)._m0[3].z) : as_type<int>((*spvDescriptorSet0.fp_c4)._m0[6].z);
    float _426 = floor(_340);
    bool _428 = !_145;
    int _430 = _428 ? as_type<int>((*spvDescriptorSet0.fp_c4)._m0[27].z) : as_type<int>((*spvDescriptorSet0.fp_c4)._m0[31].z);
    float _432 = -_384;
    float _434 = _332 + _432;
    bool _436 = !_145;
    int _438 = _436 ? as_type<int>((*spvDescriptorSet0.fp_c4)._m0[4].z) : as_type<int>((*spvDescriptorSet0.fp_c4)._m0[7].z);
    float _440 = -_404;
    float _442 = _334 + _440;
    float _444 = _151 ? as_type<float>(_430) : (*spvDescriptorSet0.fp_c4)._m0[23].z;
    float _446 = _151 ? as_type<float>(_424) : (*spvDescriptorSet0.fp_c4)._m0[0].z;
    float _448 = floor(_354);
    float _450 = _151 ? as_type<float>(_438) : (*spvDescriptorSet0.fp_c4)._m0[1].z;
    float _452 = _370 * 43758.546875;
    float _454 = fma(_147, _446, _414);
    float _456 = fma(_147, _444, _410);
    float _458 = fma(_147, _450, _416);
    float _460 = floor(_376);
    float _462 = -(*spvDescriptorSet0.fp_c3)._m0[5].w;
    float _464 = _462 + 1.0;
    float _466 = -_426;
    float _468 = _340 + _466;
    float _470 = fma(_434, 2.0, -1.0);
    float _472 = fma(_464, (*spvDescriptorSet0.fp_c3)._m0[6].y, (*spvDescriptorSet0.fp_c3)._m0[6].w);
    float _474 = fma(_468, 2.0, -1.0);
    float _476 = floor(_378);
    float _478 = -_448;
    float _480 = _354 + _478;
    float _482 = _472 * (*spvDescriptorSet0.fp_c3)._m0[5].z;
    float _484 = fma(_480, 2.0, -1.0);
    float _486 = _482 * _474;
    float _488 = floor(_452);
    float _490 = -_460;
    float _492 = _376 + _490;
    float _494 = _482 * _484;
    float _496 = _494 * _494;
    bool _498 = !_145;
    int _500 = _498 ? as_type<int>((*spvDescriptorSet0.fp_c4)._m0[27].w) : as_type<int>((*spvDescriptorSet0.fp_c4)._m0[31].w);
    float _502 = floor(_420);
    float _504 = -_476;
    float _506 = _378 + _504;
    float _508 = fma(_442, 2.0, -1.0);
    float _510 = _482 * _470;
    float _512 = fma(_492, 2.0, -1.0);
    float _514 = fma(_506, 2.0, -1.0);
    float _516 = _482 * _508;
    float _518 = _510 * _510;
    float _520 = -_488;
    float _522 = _452 + _520;
    float _524 = _482 * _512;
    float _526 = _482 * _514;
    float _528 = fma(_516, _516, _518);
    float _530 = fma(_522, 2.0, -1.0);
    float _532 = _524 * _524;
    float _534 = fma(_486, _486, _496);
    float _536 = _528 + 1.0;
    float _538 = -_502;
    float _540 = _420 + _538;
    float _542 = _482 * _530;
    float _544 = fma(_526, _526, _532);
    float _546 = _534 + 1.0;
    float _548 = fma(_540, 2.0, -1.0);
    float _550 = _542 * _542;
    float _552 = _544 + 1.0;
    float _554 = _482 * _548;
    float _556 = rsqrt(_536);
    float _558 = fma(_554, _554, _550);
    bool _560 = !_145;
    int _562 = _560 ? as_type<int>((*spvDescriptorSet0.fp_c4)._m0[5].z) : as_type<int>((*spvDescriptorSet0.fp_c4)._m0[8].z);
    float _564 = _558 + 1.0;
    float _566 = _151 ? as_type<float>(_500) : (*spvDescriptorSet0.fp_c4)._m0[23].w;
    float _568 = rsqrt(_552);
    float _570 = _151 ? as_type<float>(_562) : (*spvDescriptorSet0.fp_c4)._m0[2].z;
    float _572 = _566 + _456;
    float _574 = fma(_147, _570, _418);
    float _576 = rsqrt(_546);
    float _578 = _572 * _287;
    float _580 = rsqrt(_564);
    bool _582 = !_145;
    int _584 = _582 ? as_type<int>((*spvDescriptorSet0.fp_c4)._m0[3].w) : as_type<int>((*spvDescriptorSet0.fp_c4)._m0[6].w);
    bool _586 = !_145;
    int _588 = _586 ? as_type<int>((*spvDescriptorSet0.fp_c4)._m0[4].w) : as_type<int>((*spvDescriptorSet0.fp_c4)._m0[7].w);
    bool _590 = !_145;
    int _592 = _590 ? as_type<int>((*spvDescriptorSet0.fp_c4)._m0[5].w) : as_type<int>((*spvDescriptorSet0.fp_c4)._m0[8].w);
    float _594 = _151 ? as_type<float>(_584) : (*spvDescriptorSet0.fp_c4)._m0[0].w;
    float _596 = rint(_277);
    float _598 = precise::max(_596, 0.0);
    uint _600 = uint(_598);
    float _602 = _151 ? as_type<float>(_588) : (*spvDescriptorSet0.fp_c4)._m0[1].w;
    float _604 = _151 ? as_type<float>(_592) : (*spvDescriptorSet0.fp_c4)._m0[2].w;
    float _606 = _594 + _454;
    float _608 = _602 + _458;
    float _610 = _604 + _574;
    float _612 = fma(_516, _556, _606);
    float _614 = fma(_526, _568, _606);
    float _616 = fma(_510, _556, _608);
    float _618 = fma(_524, _568, _608);
    float _620 = -_556;
    float _622 = _610 + _620;
    float _624 = fma(_554, _580, _606);
    float _626 = fma(_542, _580, _608);
    float _628 = -_568;
    float _630 = _610 + _628;
    float _632 = -_580;
    float _634 = _610 + _632;
    float _636 = fma(_494, _576, _608);
    float _638 = fma(_486, _576, _606);
    float _640 = -_576;
    float _642 = _610 + _640;
    bool _644 = !_145;
    int _646 = _644 ? as_type<int>((*spvDescriptorSet0.fp_c4)._m0[13].y) : as_type<int>((*spvDescriptorSet0.fp_c4)._m0[17].y);
    bool _648 = !_145;
    int _650 = _648 ? as_type<int>((*spvDescriptorSet0.fp_c4)._m0[14].y) : as_type<int>((*spvDescriptorSet0.fp_c4)._m0[18].y);
    bool _652 = !_145;
    int _654 = _652 ? as_type<int>((*spvDescriptorSet0.fp_c4)._m0[15].y) : as_type<int>((*spvDescriptorSet0.fp_c4)._m0[19].y);
    bool _656 = !_145;
    int _658 = _656 ? as_type<int>((*spvDescriptorSet0.fp_c4)._m0[16].y) : as_type<int>((*spvDescriptorSet0.fp_c4)._m0[20].y);
    float _660 = _151 ? as_type<float>(_646) : (*spvDescriptorSet0.fp_c4)._m0[9].y;
    float _662 = _151 ? as_type<float>(_650) : (*spvDescriptorSet0.fp_c4)._m0[10].y;
    float _664 = _151 ? as_type<float>(_654) : (*spvDescriptorSet0.fp_c4)._m0[11].y;
    float _666 = _660 * _636;
    float _668 = _151 ? as_type<float>(_658) : (*spvDescriptorSet0.fp_c4)._m0[12].y;
    float _670 = _660 * _616;
    float _672 = _662 * _616;
    float _674 = _664 * _616;
    float _676 = _662 * _636;
    float _678 = _664 * _636;
    float _680 = _660 * _618;
    float _682 = _660 * _626;
    float _684 = _662 * _618;
    float _686 = _662 * _626;
    float _688 = _664 * _618;
    float _690 = _664 * _626;
    float _692 = _668 * _616;
    float _694 = _668 * _636;
    float _696 = _668 * _618;
    float _698 = _668 * _626;
    bool _700 = !_145;
    int _702 = _700 ? as_type<int>((*spvDescriptorSet0.fp_c4)._m0[13].x) : as_type<int>((*spvDescriptorSet0.fp_c4)._m0[17].x);
    bool _704 = !_145;
    int _706 = _704 ? as_type<int>((*spvDescriptorSet0.fp_c4)._m0[15].x) : as_type<int>((*spvDescriptorSet0.fp_c4)._m0[19].x);
    bool _708 = !_145;
    int _710 = _708 ? as_type<int>((*spvDescriptorSet0.fp_c4)._m0[14].x) : as_type<int>((*spvDescriptorSet0.fp_c4)._m0[18].x);
    bool _712 = !_145;
    int _714 = _712 ? as_type<int>((*spvDescriptorSet0.fp_c4)._m0[16].x) : as_type<int>((*spvDescriptorSet0.fp_c4)._m0[20].x);
    float _716 = _151 ? as_type<float>(_702) : (*spvDescriptorSet0.fp_c4)._m0[9].x;
    float _718 = _151 ? as_type<float>(_706) : (*spvDescriptorSet0.fp_c4)._m0[11].x;
    float _720 = _151 ? as_type<float>(_710) : (*spvDescriptorSet0.fp_c4)._m0[10].x;
    float _722 = fma(_716, _612, _670);
    float _724 = _151 ? as_type<float>(_714) : (*spvDescriptorSet0.fp_c4)._m0[12].x;
    float _726 = fma(_718, _612, _674);
    float _728 = fma(_716, _624, _682);
    float _730 = fma(_720, _612, _672);
    float _732 = fma(_720, _638, _676);
    float _734 = fma(_724, _612, _692);
    float _736 = fma(_716, _638, _666);
    float _738 = fma(_716, _614, _680);
    float _740 = fma(_720, _614, _684);
    float _742 = fma(_720, _624, _686);
    float _744 = fma(_718, _638, _678);
    float _746 = fma(_718, _614, _688);
    float _748 = fma(_724, _614, _696);
    float _750 = fma(_718, _624, _690);
    float _752 = fma(_724, _624, _698);
    float _754 = fma(_724, _638, _694);
    bool _756 = !_145;
    int _758 = _756 ? as_type<int>((*spvDescriptorSet0.fp_c4)._m0[13].z) : as_type<int>((*spvDescriptorSet0.fp_c4)._m0[17].z);
    bool _760 = !_145;
    int _762 = _760 ? as_type<int>((*spvDescriptorSet0.fp_c4)._m0[14].z) : as_type<int>((*spvDescriptorSet0.fp_c4)._m0[18].z);
    bool _764 = !_145;
    int _766 = _764 ? as_type<int>((*spvDescriptorSet0.fp_c4)._m0[15].z) : as_type<int>((*spvDescriptorSet0.fp_c4)._m0[19].z);
    bool _768 = !_145;
    int _770 = _768 ? as_type<int>((*spvDescriptorSet0.fp_c4)._m0[16].z) : as_type<int>((*spvDescriptorSet0.fp_c4)._m0[20].z);
    float _772 = _151 ? as_type<float>(_758) : (*spvDescriptorSet0.fp_c4)._m0[9].z;
    float _774 = _151 ? as_type<float>(_762) : (*spvDescriptorSet0.fp_c4)._m0[10].z;
    float _776 = _151 ? as_type<float>(_766) : (*spvDescriptorSet0.fp_c4)._m0[11].z;
    float _778 = fma(_772, _622, _722);
    float _780 = _151 ? as_type<float>(_770) : (*spvDescriptorSet0.fp_c4)._m0[12].z;
    float _782 = fma(_774, _622, _730);
    float _784 = fma(_776, _622, _726);
    float _786 = fma(_772, _642, _736);
    float _788 = fma(_780, _622, _734);
    bool _790 = !_145;
    int _792 = _790 ? as_type<int>((*spvDescriptorSet0.fp_c4)._m0[16].w) : as_type<int>((*spvDescriptorSet0.fp_c4)._m0[20].w);
    float _794 = fma(_774, _642, _732);
    float _796 = fma(_776, _642, _744);
    float _798 = fma(_780, _642, _754);
    float _800 = _151 ? as_type<float>(_792) : (*spvDescriptorSet0.fp_c4)._m0[12].w;
    float _802 = fma(_772, _630, _738);
    float _804 = fma(_772, _634, _728);
    float _806 = fma(_780, _630, _748);
    float _808 = _800 + _788;
    float _810 = fma(_774, _630, _740);
    float _812 = fma(_774, _634, _742);
    float _814 = fma(_776, _630, _746);
    float _816 = fma(_776, _634, _750);
    float _818 = _800 + _798;
    float _820 = 1.0 / _808;
    float _822 = fma(_780, _634, _752);
    float _824 = _800 + _806;
    bool _826 = !_145;
    int _828 = _826 ? as_type<int>((*spvDescriptorSet0.fp_c4)._m0[15].w) : as_type<int>((*spvDescriptorSet0.fp_c4)._m0[19].w);
    float _830 = _800 + _822;
    bool _832 = !_145;
    int _834 = _832 ? as_type<int>((*spvDescriptorSet0.fp_c4)._m0[13].w) : as_type<int>((*spvDescriptorSet0.fp_c4)._m0[17].w);
    float _836 = 1.0 / _818;
    bool _838 = !_145;
    int _840 = _838 ? as_type<int>((*spvDescriptorSet0.fp_c4)._m0[14].w) : as_type<int>((*spvDescriptorSet0.fp_c4)._m0[18].w);
    float _842 = _151 ? as_type<float>(_834) : (*spvDescriptorSet0.fp_c4)._m0[9].w;
    float _844 = _151 ? as_type<float>(_828) : (*spvDescriptorSet0.fp_c4)._m0[11].w;
    float _846 = _151 ? as_type<float>(_840) : (*spvDescriptorSet0.fp_c4)._m0[10].w;
    float _848 = 1.0 / _824;
    float _850 = _842 + _778;
    float _852 = _844 + _784;
    float _854 = _842 + _786;
    float _856 = _846 + _782;
    float _858 = _846 + _794;
    float _860 = _850 * _820;
    float _862 = _844 + _796;
    float _864 = 1.0 / _830;
    float _866 = _856 * _820;
    float _868 = _842 + _802;
    float _870 = _842 + _804;
    float _872 = _846 + _810;
    float _874 = _846 + _812;
    float _876 = _844 + _816;
    float _878 = _852 * _820;
    float _880 = _844 + _814;
    float _882 = _854 * _836;
    float _884 = _858 * _836;
    float _886 = _862 * _836;
    float _888 = fma(_860, 0.5, 0.5);
    float _890 = _868 * _848;
    float _892 = _872 * _848;
    float _894 = _870 * _864;
    float _896 = _874 * _864;
    float _898 = _876 * _864;
    float _900 = fma(_878, 0.5, 0.5);
    float _902 = _880 * _848;
    float _904 = (*spvDescriptorSet0.fp_c3)._m0[5].y * 0.066666670143604278564453125;
    float _906 = -_888;
    float _908 = _320 + _906;
    float _910 = fma(_882, 0.5, 0.5);
    float _912 = fma(_884, -0.5, 0.5);
    float _914 = fma(_886, 0.5, 0.5);
    float _916 = -_900;
    float _918 = _578 + _916;
    float _920 = fma(_866, -0.5, 0.5);
    float _922 = fma(_890, 0.5, 0.5);
    float _924 = fma(_892, -0.5, 0.5);
    float _926 = fma(_902, 0.5, 0.5);
    float _928 = fma(_894, 0.5, 0.5);
    float _930 = fma(_896, -0.5, 0.5);
    float _932 = fma(_898, 0.5, 0.5);
    float _934 = _908 * _904;
    float _936 = (*spvDescriptorSet0.fp_c3)._m0[5].y * 0.066666670143604278564453125;
    float _938 = -_910;
    float _940 = _320 + _938;
    float _942 = -_912;
    float _944 = _318 + _942;
    float _946 = -_914;
    float _948 = _578 + _946;
    float _950 = _918 * _904;
    float _952 = -_578;
    float _954 = _952 + _326;
    float _956 = _940 * _936;
    float _958 = _944 * _936;
    float _960 = _948 * _936;
    float _962 = _950 * 1.5;
    float _964 = _954 + (*spvDescriptorSet0.fp_c3)._m0[5].x;
    float _966 = -_922;
    float _968 = _320 + _966;
    float _970 = -_926;
    float _972 = _578 + _970;
    float _974 = -_920;
    float _976 = _318 + _974;
    float _978 = precise::max(_964, _962);
    float _980 = (*spvDescriptorSet0.fp_c3)._m0[5].y * 0.066666670143604278564453125;
    float _982 = -_924;
    float _984 = _318 + _982;
    float _986 = -_928;
    float _988 = _320 + _986;
    float _990 = precise::min(0.0, _978);
    float _992 = _968 * _980;
    float _994 = _972 * _980;
    float _996 = -_930;
    float _998 = _318 + _996;
    bool _1000 = _990 != _964;
    bool _1002 = isnan(_990);
    bool _1004 = _1000 || _1002;
    bool _1006 = isnan(_964);
    bool _1008 = _1004 || _1006;
    float _1010 = -_932;
    float _1012 = _578 + _1010;
    float _1014 = _976 * _904;
    float _1016 = (*spvDescriptorSet0.fp_c3)._m0[5].y * 0.066666670143604278564453125;
    float _1018 = _984 * _980;
    float _1020 = _988 * _1016;
    float _1022 = _998 * _1016;
    float _1024 = _1012 * _1016;
    bool _1026 = !_1008;
    float _1478;
    if (!_1026)
    {
        float _1028 = _318 + _1014;
        float _1030 = _320 + _934;
        float3 _4749 = float3(_1030, _1028, float(int(_308)));
        float3 _4751 = select(_4749, float3(0.0), isnan(_4749));
        float _1032 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, _4751.xy, uint(rint(_4751.z))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, _4751.xy, uint(rint(_4751.z))).x;
        float _1034 = _578 + _950;
        float _1036 = _950 * 3.0;
        float _1038 = -_1034;
        float _1040 = _1038 + _1032;
        float _1042 = _1040 + (*spvDescriptorSet0.fp_c3)._m0[5].x;
        float _1044 = precise::max(_1042, _1036);
        float _1046 = precise::min(0.0, _1044);
        bool _1048 = _1046 != _1042;
        bool _1050 = isnan(_1046);
        bool _1052 = _1048 || _1050;
        bool _1054 = isnan(_1042);
        bool _1056 = _1052 || _1054;
        bool _1058 = !_1056;
        if (!_1058)
        {
            float _1060 = fma(_1014, 2.0, _318);
            float _1062 = fma(_934, 2.0, _320);
            float3 _4804 = float3(_1062, _1060, float(int(_308)));
            float3 _4806 = select(_4804, float3(0.0), isnan(_4804));
            float _1064 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, _4806.xy, uint(rint(_4806.z))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, _4806.xy, uint(rint(_4806.z))).x;
            float _1066 = fma(_950, 2.0, _578);
            float _1068 = _950 * 4.5;
            float _1070 = -_1066;
            float _1072 = _1070 + _1064;
            float _1074 = _1072 + (*spvDescriptorSet0.fp_c3)._m0[5].x;
            float _1076 = precise::max(_1074, _1068);
            float _1078 = precise::min(0.0, _1076);
            bool _1080 = _1078 != _1074;
            bool _1082 = isnan(_1078);
            bool _1084 = _1080 || _1082;
            bool _1086 = isnan(_1074);
            bool _1088 = _1084 || _1086;
            bool _1090 = !_1088;
            if (!_1090)
            {
                float _1092 = fma(_1014, 3.0, _318);
                float _1094 = fma(_934, 3.0, _320);
                float3 _4859 = float3(_1094, _1092, float(int(_308)));
                float3 _4861 = select(_4859, float3(0.0), isnan(_4859));
                float _1096 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, _4861.xy, uint(rint(_4861.z))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, _4861.xy, uint(rint(_4861.z))).x;
                float _1098 = fma(_950, 3.0, _578);
                float _1100 = _950 * 6.0;
                float _1102 = -_1098;
                float _1104 = _1102 + _1096;
                float _1106 = _1104 + (*spvDescriptorSet0.fp_c3)._m0[5].x;
                float _1108 = precise::max(_1106, _1100);
                float _1110 = precise::min(0.0, _1108);
                bool _1112 = _1110 != _1106;
                bool _1114 = isnan(_1110);
                bool _1116 = _1112 || _1114;
                bool _1118 = isnan(_1106);
                bool _1120 = _1116 || _1118;
                bool _1122 = !_1120;
                if (!_1122)
                {
                    float _1124 = fma(_1014, 4.0, _318);
                    float _1126 = fma(_934, 4.0, _320);
                    float3 _4915 = float3(_1126, _1124, float(int(_308)));
                    float3 _4917 = select(_4915, float3(0.0), isnan(_4915));
                    float _1128 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, _4917.xy, uint(rint(_4917.z))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, _4917.xy, uint(rint(_4917.z))).x;
                    float _1130 = fma(_950, 4.0, _578);
                    float _1132 = _950 * 7.5;
                    float _1134 = -_1130;
                    float _1136 = _1134 + _1128;
                    float _1138 = _1136 + (*spvDescriptorSet0.fp_c3)._m0[5].x;
                    float _1140 = precise::max(_1138, _1132);
                    float _1142 = precise::min(0.0, _1140);
                    bool _1144 = _1142 != _1138;
                    bool _1146 = isnan(_1142);
                    bool _1148 = _1144 || _1146;
                    bool _1150 = isnan(_1138);
                    bool _1152 = _1148 || _1150;
                    bool _1154 = !_1152;
                    if (!_1154)
                    {
                        float _1156 = fma(_1014, 5.0, _318);
                        float _1158 = fma(_934, 5.0, _320);
                        float3 _4971 = float3(_1158, _1156, float(int(_308)));
                        float3 _4973 = select(_4971, float3(0.0), isnan(_4971));
                        float _1160 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, _4973.xy, uint(rint(_4973.z))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, _4973.xy, uint(rint(_4973.z))).x;
                        float _1162 = fma(_950, 5.0, _578);
                        float _1164 = _950 * 9.0;
                        float _1166 = -_1162;
                        float _1168 = _1166 + _1160;
                        float _1170 = _1168 + (*spvDescriptorSet0.fp_c3)._m0[5].x;
                        float _1172 = precise::max(_1170, _1164);
                        float _1174 = precise::min(0.0, _1172);
                        bool _1176 = _1174 != _1170;
                        bool _1178 = isnan(_1174);
                        bool _1180 = _1176 || _1178;
                        bool _1182 = isnan(_1170);
                        bool _1184 = _1180 || _1182;
                        bool _1186 = !_1184;
                        if (!_1186)
                        {
                            float _1188 = fma(_1014, 6.0, _318);
                            float _1190 = fma(_934, 6.0, _320);
                            float3 _5026 = float3(_1190, _1188, float(int(_308)));
                            float3 _5028 = select(_5026, float3(0.0), isnan(_5026));
                            float _1192 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, _5028.xy, uint(rint(_5028.z))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, _5028.xy, uint(rint(_5028.z))).x;
                            float _1194 = fma(_950, 6.0, _578);
                            float _1196 = _950 * 10.5;
                            float _1198 = -_1194;
                            float _1200 = _1198 + _1192;
                            float _1202 = _1200 + (*spvDescriptorSet0.fp_c3)._m0[5].x;
                            float _1204 = precise::max(_1202, _1196);
                            float _1206 = precise::min(0.0, _1204);
                            bool _1208 = _1206 != _1202;
                            bool _1210 = isnan(_1206);
                            bool _1212 = _1208 || _1210;
                            bool _1214 = isnan(_1202);
                            bool _1216 = _1212 || _1214;
                            bool _1218 = !_1216;
                            if (!_1218)
                            {
                                float _1220 = fma(_1014, 7.0, _318);
                                float _1222 = fma(_934, 7.0, _320);
                                float3 _5082 = float3(_1222, _1220, float(int(_308)));
                                float3 _5084 = select(_5082, float3(0.0), isnan(_5082));
                                float _1224 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, _5084.xy, uint(rint(_5084.z))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, _5084.xy, uint(rint(_5084.z))).x;
                                float _1226 = fma(_950, 7.0, _578);
                                float _1228 = _950 * 12.0;
                                float _1230 = -_1226;
                                float _1232 = _1230 + _1224;
                                float _1234 = _1232 + (*spvDescriptorSet0.fp_c3)._m0[5].x;
                                float _1236 = precise::max(_1234, _1228);
                                float _1238 = precise::min(0.0, _1236);
                                bool _1240 = _1238 != _1234;
                                bool _1242 = isnan(_1238);
                                bool _1244 = _1240 || _1242;
                                bool _1246 = isnan(_1234);
                                bool _1248 = _1244 || _1246;
                                bool _1250 = !_1248;
                                if (!_1250)
                                {
                                    float _1252 = fma(_1014, 8.0, _318);
                                    float _1254 = fma(_934, 8.0, _320);
                                    float3 _5138 = float3(_1254, _1252, float(int(_308)));
                                    float3 _5140 = select(_5138, float3(0.0), isnan(_5138));
                                    float _1256 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, _5140.xy, uint(rint(_5140.z))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, _5140.xy, uint(rint(_5140.z))).x;
                                    float _1258 = fma(_950, 8.0, _578);
                                    float _1260 = _950 * 13.5;
                                    float _1262 = -_1258;
                                    float _1264 = _1262 + _1256;
                                    float _1266 = _1264 + (*spvDescriptorSet0.fp_c3)._m0[5].x;
                                    float _1268 = precise::max(_1266, _1260);
                                    float _1270 = precise::min(0.0, _1268);
                                    bool _1272 = _1270 != _1266;
                                    bool _1274 = isnan(_1270);
                                    bool _1276 = _1272 || _1274;
                                    bool _1278 = isnan(_1266);
                                    bool _1280 = _1276 || _1278;
                                    bool _1282 = !_1280;
                                    if (!_1282)
                                    {
                                        float _1284 = fma(_1014, 9.0, _318);
                                        float _1286 = fma(_934, 9.0, _320);
                                        float3 _5193 = float3(_1286, _1284, float(int(_308)));
                                        float3 _5195 = select(_5193, float3(0.0), isnan(_5193));
                                        float _1288 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, _5195.xy, uint(rint(_5195.z))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, _5195.xy, uint(rint(_5195.z))).x;
                                        float _1290 = fma(_950, 9.0, _578);
                                        float _1292 = _950 * 15.0;
                                        float _1294 = -_1290;
                                        float _1296 = _1294 + _1288;
                                        float _1298 = _1296 + (*spvDescriptorSet0.fp_c3)._m0[5].x;
                                        float _1300 = precise::max(_1298, _1292);
                                        float _1302 = precise::min(0.0, _1300);
                                        bool _1304 = _1302 != _1298;
                                        bool _1306 = isnan(_1302);
                                        bool _1308 = _1304 || _1306;
                                        bool _1310 = isnan(_1298);
                                        bool _1312 = _1308 || _1310;
                                        bool _1314 = !_1312;
                                        if (!_1314)
                                        {
                                            float _1316 = fma(_1014, 10.0, _318);
                                            float _1318 = fma(_934, 10.0, _320);
                                            float3 _5249 = float3(_1318, _1316, float(int(_308)));
                                            float3 _5251 = select(_5249, float3(0.0), isnan(_5249));
                                            float _1320 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, _5251.xy, uint(rint(_5251.z))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, _5251.xy, uint(rint(_5251.z))).x;
                                            float _1322 = fma(_950, 10.0, _578);
                                            float _1324 = _950 * 16.5;
                                            float _1326 = -_1322;
                                            float _1328 = _1326 + _1320;
                                            float _1330 = _1328 + (*spvDescriptorSet0.fp_c3)._m0[5].x;
                                            float _1332 = precise::max(_1330, _1324);
                                            float _1334 = precise::min(0.0, _1332);
                                            bool _1336 = _1334 != _1330;
                                            bool _1338 = isnan(_1334);
                                            bool _1340 = _1336 || _1338;
                                            bool _1342 = isnan(_1330);
                                            bool _1344 = _1340 || _1342;
                                            bool _1346 = !_1344;
                                            if (!_1346)
                                            {
                                                float _1348 = fma(_1014, 11.0, _318);
                                                float _1350 = fma(_934, 11.0, _320);
                                                float3 _5305 = float3(_1350, _1348, float(int(_308)));
                                                float3 _5307 = select(_5305, float3(0.0), isnan(_5305));
                                                float _1352 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, _5307.xy, uint(rint(_5307.z))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, _5307.xy, uint(rint(_5307.z))).x;
                                                float _1354 = fma(_950, 11.0, _578);
                                                float _1356 = _950 * 18.0;
                                                float _1358 = -_1354;
                                                float _1360 = _1358 + _1352;
                                                float _1362 = _1360 + (*spvDescriptorSet0.fp_c3)._m0[5].x;
                                                float _1364 = precise::max(_1362, _1356);
                                                float _1366 = precise::min(0.0, _1364);
                                                bool _1368 = _1366 != _1362;
                                                bool _1370 = isnan(_1366);
                                                bool _1372 = _1368 || _1370;
                                                bool _1374 = isnan(_1362);
                                                bool _1376 = _1372 || _1374;
                                                bool _1378 = !_1376;
                                                if (!_1378)
                                                {
                                                    float _1380 = fma(_1014, 12.0, _318);
                                                    float _1382 = fma(_934, 12.0, _320);
                                                    float3 _5360 = float3(_1382, _1380, float(int(_308)));
                                                    float3 _5362 = select(_5360, float3(0.0), isnan(_5360));
                                                    float _1384 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, _5362.xy, uint(rint(_5362.z))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, _5362.xy, uint(rint(_5362.z))).x;
                                                    float _1386 = fma(_950, 12.0, _578);
                                                    float _1388 = _950 * 19.5;
                                                    float _1390 = -_1386;
                                                    float _1392 = _1390 + _1384;
                                                    float _1394 = _1392 + (*spvDescriptorSet0.fp_c3)._m0[5].x;
                                                    float _1396 = precise::max(_1394, _1388);
                                                    float _1398 = precise::min(0.0, _1396);
                                                    bool _1400 = _1398 != _1394;
                                                    bool _1402 = isnan(_1398);
                                                    bool _1404 = _1400 || _1402;
                                                    bool _1406 = isnan(_1394);
                                                    bool _1408 = _1404 || _1406;
                                                    bool _1410 = !_1408;
                                                    if (!_1410)
                                                    {
                                                        float _1412 = fma(_1014, 13.0, _318);
                                                        float _1414 = fma(_934, 13.0, _320);
                                                        float3 _5416 = float3(_1414, _1412, float(int(_308)));
                                                        float3 _5418 = select(_5416, float3(0.0), isnan(_5416));
                                                        float _1416 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, _5418.xy, uint(rint(_5418.z))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, _5418.xy, uint(rint(_5418.z))).x;
                                                        float _1418 = fma(_950, 13.0, _578);
                                                        float _1420 = fma(_950, 21.0, -1.0);
                                                        float _1422 = -_1418;
                                                        float _1424 = _1422 + _1416;
                                                        float _1426 = _1424 + (*spvDescriptorSet0.fp_c3)._m0[5].x;
                                                        float _1428 = precise::max(_1426, _1420);
                                                        float _1430 = precise::min(0.0, _1428);
                                                        bool _1432 = _1430 != _1426;
                                                        bool _1434 = isnan(_1430);
                                                        bool _1436 = _1432 || _1434;
                                                        bool _1438 = isnan(_1426);
                                                        bool _1440 = _1436 || _1438;
                                                        bool _1442 = !_1440;
                                                        if (!_1442)
                                                        {
                                                            float _1444 = fma(_1014, 14.0, _318);
                                                            float _1446 = fma(_934, 14.0, _320);
                                                            float3 _5472 = float3(_1446, _1444, float(int(_308)));
                                                            float3 _5474 = select(_5472, float3(0.0), isnan(_5472));
                                                            float _1448 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, _5474.xy, uint(rint(_5474.z))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, _5474.xy, uint(rint(_5474.z))).x;
                                                            float _1450 = fma(_950, 14.0, _578);
                                                            float _1452 = fma(_950, 22.5, -1.0);
                                                            float _1454 = -_1450;
                                                            float _1456 = _1454 + _1448;
                                                            float _1458 = _1456 + (*spvDescriptorSet0.fp_c3)._m0[5].x;
                                                            float _1460 = precise::max(_1458, _1452);
                                                            float _1462 = precise::min(0.0, _1460);
                                                            bool _1464 = _1462 != _1458;
                                                            bool _1466 = isnan(_1462);
                                                            bool _1468 = _1464 || _1466;
                                                            bool _1470 = isnan(_1458);
                                                            bool _1472 = _1468 || _1470;
                                                            float _1474 = _1462;
                                                            if (_1472)
                                                            {
                                                                _1474 = 0.0;
                                                            }
                                                            float _1476 = _1474;
                                                            _1478 = _1476;
                                                            _1480 = _1472;
                                                        }
                                                    }
                                                }
                                            }
                                        }
                                    }
                                }
                            }
                        }
                    }
                }
            }
        }
    }
    if (!_1480)
    {
        _1478 = 1.0;
    }
    _1480 = false;
    float _1482 = _1478;
    bool _1484 = _600 > 65535u;
    bool _1486 = !_1484;
    float _1488 = _1486 ? as_type<float>(_600) : 9.1834094859526886742986618240905e-41;
    float3 _5551 = float3(_320, _318, float(as_type<int>(_1488)));
    float3 _5553 = select(_5551, float3(0.0), isnan(_5551));
    float _1490 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, _5553.xy, uint(rint(_5553.z))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, _5553.xy, uint(rint(_5553.z))).x;
    float _1492 = _960 * 1.5;
    float _1494 = -_578;
    float _1496 = _1494 + _1490;
    float _1498 = _1496 + (*spvDescriptorSet0.fp_c3)._m0[5].x;
    float _1500 = precise::max(_1498, _1492);
    float _1502 = precise::min(0.0, _1500);
    bool _1504 = _1502 != _1498;
    bool _1506 = isnan(_1502);
    bool _1508 = _1504 || _1506;
    bool _1510 = isnan(_1498);
    bool _1512 = _1508 || _1510;
    bool _1514 = !_1512;
    float _1966;
    if (!_1514)
    {
        float _1516 = _318 + _958;
        float _1518 = _320 + _956;
        float3 _5602 = float3(_1518, _1516, float(as_type<int>(_1488)));
        float3 _5604 = select(_5602, float3(0.0), isnan(_5602));
        float _1520 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, _5604.xy, uint(rint(_5604.z))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, _5604.xy, uint(rint(_5604.z))).x;
        float _1522 = _578 + _960;
        float _1524 = -_1522;
        float _1526 = _1524 + _1520;
        float _1528 = _960 * 3.0;
        float _1530 = _1526 + (*spvDescriptorSet0.fp_c3)._m0[5].x;
        float _1532 = precise::max(_1530, _1528);
        float _1534 = precise::min(0.0, _1532);
        bool _1536 = _1534 != _1530;
        bool _1538 = isnan(_1534);
        bool _1540 = _1536 || _1538;
        bool _1542 = isnan(_1530);
        bool _1544 = _1540 || _1542;
        bool _1546 = !_1544;
        if (!_1546)
        {
            float _1548 = fma(_958, 2.0, _318);
            float _1550 = fma(_956, 2.0, _320);
            float3 _5656 = float3(_1550, _1548, float(as_type<int>(_1488)));
            float3 _5658 = select(_5656, float3(0.0), isnan(_5656));
            float _1552 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, _5658.xy, uint(rint(_5658.z))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, _5658.xy, uint(rint(_5658.z))).x;
            float _1554 = fma(_960, 2.0, _578);
            float _1556 = -_1554;
            float _1558 = _1556 + _1552;
            float _1560 = _960 * 4.5;
            float _1562 = _1558 + (*spvDescriptorSet0.fp_c3)._m0[5].x;
            float _1564 = precise::max(_1562, _1560);
            float _1566 = precise::min(0.0, _1564);
            bool _1568 = _1566 != _1562;
            bool _1570 = isnan(_1566);
            bool _1572 = _1568 || _1570;
            bool _1574 = isnan(_1562);
            bool _1576 = _1572 || _1574;
            bool _1578 = !_1576;
            if (!_1578)
            {
                float _1580 = fma(_958, 3.0, _318);
                float _1582 = fma(_956, 3.0, _320);
                float3 _5710 = float3(_1582, _1580, float(as_type<int>(_1488)));
                float3 _5712 = select(_5710, float3(0.0), isnan(_5710));
                float _1584 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, _5712.xy, uint(rint(_5712.z))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, _5712.xy, uint(rint(_5712.z))).x;
                float _1586 = fma(_960, 3.0, _578);
                float _1588 = -_1586;
                float _1590 = _1588 + _1584;
                float _1592 = _960 * 6.0;
                float _1594 = _1590 + (*spvDescriptorSet0.fp_c3)._m0[5].x;
                float _1596 = precise::max(_1594, _1592);
                float _1598 = precise::min(0.0, _1596);
                bool _1600 = _1598 != _1594;
                bool _1602 = isnan(_1598);
                bool _1604 = _1600 || _1602;
                bool _1606 = isnan(_1594);
                bool _1608 = _1604 || _1606;
                bool _1610 = !_1608;
                if (!_1610)
                {
                    float _1612 = fma(_958, 4.0, _318);
                    float _1614 = fma(_956, 4.0, _320);
                    float3 _5764 = float3(_1614, _1612, float(as_type<int>(_1488)));
                    float3 _5766 = select(_5764, float3(0.0), isnan(_5764));
                    float _1616 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, _5766.xy, uint(rint(_5766.z))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, _5766.xy, uint(rint(_5766.z))).x;
                    float _1618 = fma(_960, 4.0, _578);
                    float _1620 = -_1618;
                    float _1622 = _1620 + _1616;
                    float _1624 = _960 * 7.5;
                    float _1626 = _1622 + (*spvDescriptorSet0.fp_c3)._m0[5].x;
                    float _1628 = precise::max(_1626, _1624);
                    float _1630 = precise::min(0.0, _1628);
                    bool _1632 = _1630 != _1626;
                    bool _1634 = isnan(_1630);
                    bool _1636 = _1632 || _1634;
                    bool _1638 = isnan(_1626);
                    bool _1640 = _1636 || _1638;
                    bool _1642 = !_1640;
                    if (!_1642)
                    {
                        float _1644 = fma(_958, 5.0, _318);
                        float _1646 = fma(_956, 5.0, _320);
                        float3 _5818 = float3(_1646, _1644, float(as_type<int>(_1488)));
                        float3 _5820 = select(_5818, float3(0.0), isnan(_5818));
                        float _1648 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, _5820.xy, uint(rint(_5820.z))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, _5820.xy, uint(rint(_5820.z))).x;
                        float _1650 = fma(_960, 5.0, _578);
                        float _1652 = -_1650;
                        float _1654 = _1652 + _1648;
                        float _1656 = _960 * 9.0;
                        float _1658 = _1654 + (*spvDescriptorSet0.fp_c3)._m0[5].x;
                        float _1660 = precise::max(_1658, _1656);
                        float _1662 = precise::min(0.0, _1660);
                        bool _1664 = _1662 != _1658;
                        bool _1666 = isnan(_1662);
                        bool _1668 = _1664 || _1666;
                        bool _1670 = isnan(_1658);
                        bool _1672 = _1668 || _1670;
                        bool _1674 = !_1672;
                        if (!_1674)
                        {
                            float _1676 = fma(_958, 6.0, _318);
                            float _1678 = fma(_956, 6.0, _320);
                            float3 _5872 = float3(_1678, _1676, float(as_type<int>(_1488)));
                            float3 _5874 = select(_5872, float3(0.0), isnan(_5872));
                            float _1680 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, _5874.xy, uint(rint(_5874.z))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, _5874.xy, uint(rint(_5874.z))).x;
                            float _1682 = fma(_960, 6.0, _578);
                            float _1684 = -_1682;
                            float _1686 = _1684 + _1680;
                            float _1688 = _960 * 10.5;
                            float _1690 = _1686 + (*spvDescriptorSet0.fp_c3)._m0[5].x;
                            float _1692 = precise::max(_1690, _1688);
                            float _1694 = precise::min(0.0, _1692);
                            bool _1696 = _1694 != _1690;
                            bool _1698 = isnan(_1694);
                            bool _1700 = _1696 || _1698;
                            bool _1702 = isnan(_1690);
                            bool _1704 = _1700 || _1702;
                            bool _1706 = !_1704;
                            if (!_1706)
                            {
                                float _1708 = fma(_958, 7.0, _318);
                                float _1710 = fma(_956, 7.0, _320);
                                float3 _5926 = float3(_1710, _1708, float(as_type<int>(_1488)));
                                float3 _5928 = select(_5926, float3(0.0), isnan(_5926));
                                float _1712 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, _5928.xy, uint(rint(_5928.z))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, _5928.xy, uint(rint(_5928.z))).x;
                                float _1714 = fma(_960, 7.0, _578);
                                float _1716 = -_1714;
                                float _1718 = _1716 + _1712;
                                float _1720 = _960 * 12.0;
                                float _1722 = _1718 + (*spvDescriptorSet0.fp_c3)._m0[5].x;
                                float _1724 = precise::max(_1722, _1720);
                                float _1726 = precise::min(0.0, _1724);
                                bool _1728 = _1726 != _1722;
                                bool _1730 = isnan(_1726);
                                bool _1732 = _1728 || _1730;
                                bool _1734 = isnan(_1722);
                                bool _1736 = _1732 || _1734;
                                bool _1738 = !_1736;
                                if (!_1738)
                                {
                                    float _1740 = fma(_958, 8.0, _318);
                                    float _1742 = fma(_956, 8.0, _320);
                                    float3 _5980 = float3(_1742, _1740, float(as_type<int>(_1488)));
                                    float3 _5982 = select(_5980, float3(0.0), isnan(_5980));
                                    float _1744 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, _5982.xy, uint(rint(_5982.z))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, _5982.xy, uint(rint(_5982.z))).x;
                                    float _1746 = fma(_960, 8.0, _578);
                                    float _1748 = -_1746;
                                    float _1750 = _1748 + _1744;
                                    float _1752 = _960 * 13.5;
                                    float _1754 = _1750 + (*spvDescriptorSet0.fp_c3)._m0[5].x;
                                    float _1756 = precise::max(_1754, _1752);
                                    float _1758 = precise::min(0.0, _1756);
                                    bool _1760 = _1758 != _1754;
                                    bool _1762 = isnan(_1758);
                                    bool _1764 = _1760 || _1762;
                                    bool _1766 = isnan(_1754);
                                    bool _1768 = _1764 || _1766;
                                    bool _1770 = !_1768;
                                    if (!_1770)
                                    {
                                        float _1772 = fma(_958, 9.0, _318);
                                        float _1774 = fma(_956, 9.0, _320);
                                        float3 _6034 = float3(_1774, _1772, float(as_type<int>(_1488)));
                                        float3 _6036 = select(_6034, float3(0.0), isnan(_6034));
                                        float _1776 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, _6036.xy, uint(rint(_6036.z))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, _6036.xy, uint(rint(_6036.z))).x;
                                        float _1778 = fma(_960, 9.0, _578);
                                        float _1780 = -_1778;
                                        float _1782 = _1780 + _1776;
                                        float _1784 = _960 * 15.0;
                                        float _1786 = _1782 + (*spvDescriptorSet0.fp_c3)._m0[5].x;
                                        float _1788 = precise::max(_1786, _1784);
                                        float _1790 = precise::min(0.0, _1788);
                                        bool _1792 = _1790 != _1786;
                                        bool _1794 = isnan(_1790);
                                        bool _1796 = _1792 || _1794;
                                        bool _1798 = isnan(_1786);
                                        bool _1800 = _1796 || _1798;
                                        bool _1802 = !_1800;
                                        if (!_1802)
                                        {
                                            float _1804 = fma(_958, 10.0, _318);
                                            float _1806 = fma(_956, 10.0, _320);
                                            float3 _6088 = float3(_1806, _1804, float(as_type<int>(_1488)));
                                            float3 _6090 = select(_6088, float3(0.0), isnan(_6088));
                                            float _1808 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, _6090.xy, uint(rint(_6090.z))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, _6090.xy, uint(rint(_6090.z))).x;
                                            float _1810 = fma(_960, 10.0, _578);
                                            float _1812 = -_1810;
                                            float _1814 = _1812 + _1808;
                                            float _1816 = _960 * 16.5;
                                            float _1818 = _1814 + (*spvDescriptorSet0.fp_c3)._m0[5].x;
                                            float _1820 = precise::max(_1818, _1816);
                                            float _1822 = precise::min(0.0, _1820);
                                            bool _1824 = _1822 != _1818;
                                            bool _1826 = isnan(_1822);
                                            bool _1828 = _1824 || _1826;
                                            bool _1830 = isnan(_1818);
                                            bool _1832 = _1828 || _1830;
                                            bool _1834 = !_1832;
                                            if (!_1834)
                                            {
                                                float _1836 = fma(_958, 11.0, _318);
                                                float _1838 = fma(_956, 11.0, _320);
                                                float3 _6142 = float3(_1838, _1836, float(as_type<int>(_1488)));
                                                float3 _6144 = select(_6142, float3(0.0), isnan(_6142));
                                                float _1840 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, _6144.xy, uint(rint(_6144.z))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, _6144.xy, uint(rint(_6144.z))).x;
                                                float _1842 = fma(_960, 11.0, _578);
                                                float _1844 = -_1842;
                                                float _1846 = _1844 + _1840;
                                                float _1848 = _960 * 18.0;
                                                float _1850 = _1846 + (*spvDescriptorSet0.fp_c3)._m0[5].x;
                                                float _1852 = precise::max(_1850, _1848);
                                                float _1854 = precise::min(0.0, _1852);
                                                bool _1856 = _1854 != _1850;
                                                bool _1858 = isnan(_1854);
                                                bool _1860 = _1856 || _1858;
                                                bool _1862 = isnan(_1850);
                                                bool _1864 = _1860 || _1862;
                                                bool _1866 = !_1864;
                                                if (!_1866)
                                                {
                                                    float _1868 = fma(_958, 12.0, _318);
                                                    float _1870 = fma(_956, 12.0, _320);
                                                    float3 _6196 = float3(_1870, _1868, float(as_type<int>(_1488)));
                                                    float3 _6198 = select(_6196, float3(0.0), isnan(_6196));
                                                    float _1872 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, _6198.xy, uint(rint(_6198.z))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, _6198.xy, uint(rint(_6198.z))).x;
                                                    float _1874 = fma(_960, 12.0, _578);
                                                    float _1876 = -_1874;
                                                    float _1878 = _1876 + _1872;
                                                    float _1880 = _960 * 19.5;
                                                    float _1882 = _1878 + (*spvDescriptorSet0.fp_c3)._m0[5].x;
                                                    float _1884 = precise::max(_1882, _1880);
                                                    float _1886 = precise::min(0.0, _1884);
                                                    bool _1888 = _1886 != _1882;
                                                    bool _1890 = isnan(_1886);
                                                    bool _1892 = _1888 || _1890;
                                                    bool _1894 = isnan(_1882);
                                                    bool _1896 = _1892 || _1894;
                                                    bool _1898 = !_1896;
                                                    if (!_1898)
                                                    {
                                                        float _1900 = fma(_958, 13.0, _318);
                                                        float _1902 = fma(_956, 13.0, _320);
                                                        float3 _6250 = float3(_1902, _1900, float(as_type<int>(_1488)));
                                                        float3 _6252 = select(_6250, float3(0.0), isnan(_6250));
                                                        float _1904 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, _6252.xy, uint(rint(_6252.z))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, _6252.xy, uint(rint(_6252.z))).x;
                                                        float _1906 = fma(_960, 13.0, _578);
                                                        float _1908 = -_1906;
                                                        float _1910 = _1908 + _1904;
                                                        float _1912 = fma(_960, 21.0, -1.0);
                                                        float _1914 = _1910 + (*spvDescriptorSet0.fp_c3)._m0[5].x;
                                                        float _1916 = precise::max(_1914, _1912);
                                                        float _1918 = precise::min(0.0, _1916);
                                                        bool _1920 = _1918 != _1914;
                                                        bool _1922 = isnan(_1918);
                                                        bool _1924 = _1920 || _1922;
                                                        bool _1926 = isnan(_1914);
                                                        bool _1928 = _1924 || _1926;
                                                        bool _1930 = !_1928;
                                                        if (!_1930)
                                                        {
                                                            float _1932 = fma(_958, 14.0, _318);
                                                            float _1934 = fma(_956, 14.0, _320);
                                                            float3 _6304 = float3(_1934, _1932, float(as_type<int>(_1488)));
                                                            float3 _6306 = select(_6304, float3(0.0), isnan(_6304));
                                                            float _1936 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, _6306.xy, uint(rint(_6306.z))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, _6306.xy, uint(rint(_6306.z))).x;
                                                            float _1938 = fma(_960, 14.0, _578);
                                                            float _1940 = fma(_960, 22.5, -1.0);
                                                            float _1942 = -_1938;
                                                            float _1944 = _1942 + _1936;
                                                            float _1946 = _1944 + (*spvDescriptorSet0.fp_c3)._m0[5].x;
                                                            float _1948 = precise::max(_1946, _1940);
                                                            float _1950 = precise::min(0.0, _1948);
                                                            bool _1952 = _1950 != _1946;
                                                            bool _1954 = isnan(_1950);
                                                            bool _1956 = _1952 || _1954;
                                                            bool _1958 = isnan(_1946);
                                                            bool _1960 = _1956 || _1958;
                                                            float _1962 = _1946;
                                                            if (_1960)
                                                            {
                                                                _1962 = _1482;
                                                            }
                                                            float _1964 = _1962;
                                                            _1966 = _1964;
                                                            _1968 = _1960;
                                                        }
                                                    }
                                                }
                                            }
                                        }
                                    }
                                }
                            }
                        }
                    }
                }
            }
        }
    }
    if (!_1968)
    {
        float _1970 = _1482 + 1.0;
        _1966 = _1970;
    }
    _1968 = false;
    float _1972 = _1966;
    float _1974 = _994 * 1.5;
    float _1976 = precise::max(_1498, _1974);
    float _1978 = precise::min(0.0, _1976);
    bool _1980 = _1978 != _1498;
    bool _1982 = isnan(_1978);
    bool _1984 = _1980 || _1982;
    bool _1986 = isnan(_1498);
    bool _1988 = _1984 || _1986;
    bool _1990 = !_1988;
    float _1992 = _1972;
    if (!_1990)
    {
        float _1994 = _318 + _1018;
        float _1996 = _320 + _992;
        float3 _6409 = float3(_1996, _1994, float(as_type<int>(_1488)));
        float3 _6411 = select(_6409, float3(0.0), isnan(_6409));
        float _1998 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, _6411.xy, uint(rint(_6411.z))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, _6411.xy, uint(rint(_6411.z))).x;
        float _2000 = _578 + _994;
        float _2002 = _994 * 3.0;
        float _2004 = -_2000;
        float _2006 = _2004 + _1998;
        float _2008 = _2006 + (*spvDescriptorSet0.fp_c3)._m0[5].x;
        float _2010 = precise::max(_2008, _2002);
        float _2012 = precise::min(0.0, _2010);
        bool _2014 = _2012 != _2008;
        bool _2016 = isnan(_2012);
        bool _2018 = _2014 || _2016;
        bool _2020 = isnan(_2008);
        bool _2022 = _2018 || _2020;
        bool _2024 = !_2022;
        if (!_2024)
        {
            float _2026 = fma(_1018, 2.0, _318);
            float _2028 = fma(_992, 2.0, _320);
            float3 _6463 = float3(_2028, _2026, float(as_type<int>(_1488)));
            float3 _6465 = select(_6463, float3(0.0), isnan(_6463));
            float _2030 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, _6465.xy, uint(rint(_6465.z))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, _6465.xy, uint(rint(_6465.z))).x;
            float _2032 = fma(_994, 2.0, _578);
            float _2034 = _994 * 4.5;
            float _2036 = -_2032;
            float _2038 = _2036 + _2030;
            float _2040 = _2038 + (*spvDescriptorSet0.fp_c3)._m0[5].x;
            float _2042 = precise::max(_2040, _2034);
            float _2044 = precise::min(0.0, _2042);
            bool _2046 = _2044 != _2040;
            bool _2048 = isnan(_2044);
            bool _2050 = _2046 || _2048;
            bool _2052 = isnan(_2040);
            bool _2054 = _2050 || _2052;
            bool _2056 = !_2054;
            if (!_2056)
            {
                float _2058 = fma(_1018, 3.0, _318);
                float _2060 = fma(_992, 3.0, _320);
                float3 _6517 = float3(_2060, _2058, float(as_type<int>(_1488)));
                float3 _6519 = select(_6517, float3(0.0), isnan(_6517));
                float _2062 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, _6519.xy, uint(rint(_6519.z))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, _6519.xy, uint(rint(_6519.z))).x;
                float _2064 = fma(_994, 3.0, _578);
                float _2066 = _994 * 6.0;
                float _2068 = -_2064;
                float _2070 = _2068 + _2062;
                float _2072 = _2070 + (*spvDescriptorSet0.fp_c3)._m0[5].x;
                float _2074 = precise::max(_2072, _2066);
                float _2076 = precise::min(0.0, _2074);
                bool _2078 = _2076 != _2072;
                bool _2080 = isnan(_2076);
                bool _2082 = _2078 || _2080;
                bool _2084 = isnan(_2072);
                bool _2086 = _2082 || _2084;
                bool _2088 = !_2086;
                if (!_2088)
                {
                    float _2090 = fma(_1018, 4.0, _318);
                    float _2092 = fma(_992, 4.0, _320);
                    float3 _6571 = float3(_2092, _2090, float(as_type<int>(_1488)));
                    float3 _6573 = select(_6571, float3(0.0), isnan(_6571));
                    float _2094 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, _6573.xy, uint(rint(_6573.z))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, _6573.xy, uint(rint(_6573.z))).x;
                    float _2096 = fma(_994, 4.0, _578);
                    float _2098 = _994 * 7.5;
                    float _2100 = -_2096;
                    float _2102 = _2100 + _2094;
                    float _2104 = _2102 + (*spvDescriptorSet0.fp_c3)._m0[5].x;
                    float _2106 = precise::max(_2104, _2098);
                    float _2108 = precise::min(0.0, _2106);
                    bool _2110 = _2108 != _2104;
                    bool _2112 = isnan(_2108);
                    bool _2114 = _2110 || _2112;
                    bool _2116 = isnan(_2104);
                    bool _2118 = _2114 || _2116;
                    bool _2120 = !_2118;
                    if (!_2120)
                    {
                        float _2122 = fma(_1018, 5.0, _318);
                        float _2124 = fma(_992, 5.0, _320);
                        float3 _6625 = float3(_2124, _2122, float(as_type<int>(_1488)));
                        float3 _6627 = select(_6625, float3(0.0), isnan(_6625));
                        float _2126 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, _6627.xy, uint(rint(_6627.z))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, _6627.xy, uint(rint(_6627.z))).x;
                        float _2128 = fma(_994, 5.0, _578);
                        float _2130 = _994 * 9.0;
                        float _2132 = -_2128;
                        float _2134 = _2132 + _2126;
                        float _2136 = _2134 + (*spvDescriptorSet0.fp_c3)._m0[5].x;
                        float _2138 = precise::max(_2136, _2130);
                        float _2140 = precise::min(0.0, _2138);
                        bool _2142 = _2140 != _2136;
                        bool _2144 = isnan(_2140);
                        bool _2146 = _2142 || _2144;
                        bool _2148 = isnan(_2136);
                        bool _2150 = _2146 || _2148;
                        bool _2152 = !_2150;
                        if (!_2152)
                        {
                            float _2154 = fma(_1018, 6.0, _318);
                            float _2156 = fma(_992, 6.0, _320);
                            float3 _6679 = float3(_2156, _2154, float(as_type<int>(_1488)));
                            float3 _6681 = select(_6679, float3(0.0), isnan(_6679));
                            float _2158 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, _6681.xy, uint(rint(_6681.z))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, _6681.xy, uint(rint(_6681.z))).x;
                            float _2160 = fma(_994, 6.0, _578);
                            float _2162 = _994 * 10.5;
                            float _2164 = -_2160;
                            float _2166 = _2164 + _2158;
                            float _2168 = _2166 + (*spvDescriptorSet0.fp_c3)._m0[5].x;
                            float _2170 = precise::max(_2168, _2162);
                            float _2172 = precise::min(0.0, _2170);
                            bool _2174 = _2172 != _2168;
                            bool _2176 = isnan(_2172);
                            bool _2178 = _2174 || _2176;
                            bool _2180 = isnan(_2168);
                            bool _2182 = _2178 || _2180;
                            bool _2184 = !_2182;
                            if (!_2184)
                            {
                                float _2186 = fma(_1018, 7.0, _318);
                                float _2188 = fma(_992, 7.0, _320);
                                float3 _6733 = float3(_2188, _2186, float(as_type<int>(_1488)));
                                float3 _6735 = select(_6733, float3(0.0), isnan(_6733));
                                float _2190 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, _6735.xy, uint(rint(_6735.z))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, _6735.xy, uint(rint(_6735.z))).x;
                                float _2192 = fma(_994, 7.0, _578);
                                float _2194 = _994 * 12.0;
                                float _2196 = -_2192;
                                float _2198 = _2196 + _2190;
                                float _2200 = _2198 + (*spvDescriptorSet0.fp_c3)._m0[5].x;
                                float _2202 = precise::max(_2200, _2194);
                                float _2204 = precise::min(0.0, _2202);
                                bool _2206 = _2204 != _2200;
                                bool _2208 = isnan(_2204);
                                bool _2210 = _2206 || _2208;
                                bool _2212 = isnan(_2200);
                                bool _2214 = _2210 || _2212;
                                bool _2216 = !_2214;
                                if (!_2216)
                                {
                                    float _2218 = fma(_1018, 8.0, _318);
                                    float _2220 = fma(_992, 8.0, _320);
                                    float3 _6787 = float3(_2220, _2218, float(as_type<int>(_1488)));
                                    float3 _6789 = select(_6787, float3(0.0), isnan(_6787));
                                    float _2222 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, _6789.xy, uint(rint(_6789.z))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, _6789.xy, uint(rint(_6789.z))).x;
                                    float _2224 = fma(_994, 8.0, _578);
                                    float _2226 = _994 * 13.5;
                                    float _2228 = -_2224;
                                    float _2230 = _2228 + _2222;
                                    float _2232 = _2230 + (*spvDescriptorSet0.fp_c3)._m0[5].x;
                                    float _2234 = precise::max(_2232, _2226);
                                    float _2236 = precise::min(0.0, _2234);
                                    bool _2238 = _2236 != _2232;
                                    bool _2240 = isnan(_2236);
                                    bool _2242 = _2238 || _2240;
                                    bool _2244 = isnan(_2232);
                                    bool _2246 = _2242 || _2244;
                                    bool _2248 = !_2246;
                                    if (!_2248)
                                    {
                                        float _2250 = fma(_1018, 9.0, _318);
                                        float _2252 = fma(_992, 9.0, _320);
                                        float3 _6841 = float3(_2252, _2250, float(as_type<int>(_1488)));
                                        float3 _6843 = select(_6841, float3(0.0), isnan(_6841));
                                        float _2254 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, _6843.xy, uint(rint(_6843.z))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, _6843.xy, uint(rint(_6843.z))).x;
                                        float _2256 = fma(_994, 9.0, _578);
                                        float _2258 = _994 * 15.0;
                                        float _2260 = -_2256;
                                        float _2262 = _2260 + _2254;
                                        float _2264 = _2262 + (*spvDescriptorSet0.fp_c3)._m0[5].x;
                                        float _2266 = precise::max(_2264, _2258);
                                        float _2268 = precise::min(0.0, _2266);
                                        bool _2270 = _2268 != _2264;
                                        bool _2272 = isnan(_2268);
                                        bool _2274 = _2270 || _2272;
                                        bool _2276 = isnan(_2264);
                                        bool _2278 = _2274 || _2276;
                                        bool _2280 = !_2278;
                                        if (!_2280)
                                        {
                                            float _2282 = fma(_1018, 10.0, _318);
                                            float _2284 = fma(_992, 10.0, _320);
                                            float3 _6895 = float3(_2284, _2282, float(as_type<int>(_1488)));
                                            float3 _6897 = select(_6895, float3(0.0), isnan(_6895));
                                            float _2286 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, _6897.xy, uint(rint(_6897.z))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, _6897.xy, uint(rint(_6897.z))).x;
                                            float _2288 = fma(_994, 10.0, _578);
                                            float _2290 = _994 * 16.5;
                                            float _2292 = -_2288;
                                            float _2294 = _2292 + _2286;
                                            float _2296 = _2294 + (*spvDescriptorSet0.fp_c3)._m0[5].x;
                                            float _2298 = precise::max(_2296, _2290);
                                            float _2300 = precise::min(0.0, _2298);
                                            bool _2302 = _2300 != _2296;
                                            bool _2304 = isnan(_2300);
                                            bool _2306 = _2302 || _2304;
                                            bool _2308 = isnan(_2296);
                                            bool _2310 = _2306 || _2308;
                                            bool _2312 = !_2310;
                                            if (!_2312)
                                            {
                                                float _2314 = fma(_1018, 11.0, _318);
                                                float _2316 = fma(_992, 11.0, _320);
                                                float3 _6949 = float3(_2316, _2314, float(as_type<int>(_1488)));
                                                float3 _6951 = select(_6949, float3(0.0), isnan(_6949));
                                                float _2318 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, _6951.xy, uint(rint(_6951.z))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, _6951.xy, uint(rint(_6951.z))).x;
                                                float _2320 = fma(_994, 11.0, _578);
                                                float _2322 = _994 * 18.0;
                                                float _2324 = -_2320;
                                                float _2326 = _2324 + _2318;
                                                float _2328 = _2326 + (*spvDescriptorSet0.fp_c3)._m0[5].x;
                                                float _2330 = precise::max(_2328, _2322);
                                                float _2332 = precise::min(0.0, _2330);
                                                bool _2334 = _2332 != _2328;
                                                bool _2336 = isnan(_2332);
                                                bool _2338 = _2334 || _2336;
                                                bool _2340 = isnan(_2328);
                                                bool _2342 = _2338 || _2340;
                                                bool _2344 = !_2342;
                                                if (!_2344)
                                                {
                                                    float _2346 = fma(_1018, 12.0, _318);
                                                    float _2348 = fma(_992, 12.0, _320);
                                                    float3 _7003 = float3(_2348, _2346, float(as_type<int>(_1488)));
                                                    float3 _7005 = select(_7003, float3(0.0), isnan(_7003));
                                                    float _2350 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, _7005.xy, uint(rint(_7005.z))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, _7005.xy, uint(rint(_7005.z))).x;
                                                    float _2352 = fma(_994, 12.0, _578);
                                                    float _2354 = _994 * 19.5;
                                                    float _2356 = -_2352;
                                                    float _2358 = _2356 + _2350;
                                                    float _2360 = _2358 + (*spvDescriptorSet0.fp_c3)._m0[5].x;
                                                    float _2362 = precise::max(_2360, _2354);
                                                    float _2364 = precise::min(0.0, _2362);
                                                    bool _2366 = _2364 != _2360;
                                                    bool _2368 = isnan(_2364);
                                                    bool _2370 = _2366 || _2368;
                                                    bool _2372 = isnan(_2360);
                                                    bool _2374 = _2370 || _2372;
                                                    bool _2376 = !_2374;
                                                    if (!_2376)
                                                    {
                                                        float _2378 = fma(_1018, 13.0, _318);
                                                        float _2380 = fma(_992, 13.0, _320);
                                                        float3 _7057 = float3(_2380, _2378, float(as_type<int>(_1488)));
                                                        float3 _7059 = select(_7057, float3(0.0), isnan(_7057));
                                                        float _2382 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, _7059.xy, uint(rint(_7059.z))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, _7059.xy, uint(rint(_7059.z))).x;
                                                        float _2384 = fma(_994, 13.0, _578);
                                                        float _2386 = fma(_994, 21.0, -1.0);
                                                        float _2388 = -_2384;
                                                        float _2390 = _2388 + _2382;
                                                        float _2392 = _2390 + (*spvDescriptorSet0.fp_c3)._m0[5].x;
                                                        float _2394 = precise::max(_2392, _2386);
                                                        float _2396 = precise::min(0.0, _2394);
                                                        bool _2398 = _2396 != _2392;
                                                        bool _2400 = isnan(_2396);
                                                        bool _2402 = _2398 || _2400;
                                                        bool _2404 = isnan(_2392);
                                                        bool _2406 = _2402 || _2404;
                                                        bool _2408 = !_2406;
                                                        if (!_2408)
                                                        {
                                                            float _2410 = fma(_1018, 14.0, _318);
                                                            float _2412 = fma(_992, 14.0, _320);
                                                            float3 _7111 = float3(_2412, _2410, float(as_type<int>(_1488)));
                                                            float3 _7113 = select(_7111, float3(0.0), isnan(_7111));
                                                            float _2414 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, _7113.xy, uint(rint(_7113.z))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, _7113.xy, uint(rint(_7113.z))).x;
                                                            float _2416 = fma(_994, 14.0, _578);
                                                            float _2418 = fma(_994, 22.5, -1.0);
                                                            float _2420 = -_2416;
                                                            float _2422 = _2420 + _2414;
                                                            float _2424 = _2422 + (*spvDescriptorSet0.fp_c3)._m0[5].x;
                                                            float _2426 = precise::max(_2424, _2418);
                                                            float _2428 = precise::min(0.0, _2426);
                                                            bool _2430 = _2428 != _2424;
                                                            bool _2432 = isnan(_2428);
                                                            bool _2434 = _2430 || _2432;
                                                            bool _2436 = isnan(_2424);
                                                            bool _2438 = _2434 || _2436;
                                                            _2440 = _2438;
                                                        }
                                                    }
                                                }
                                            }
                                        }
                                    }
                                }
                            }
                        }
                    }
                }
            }
        }
    }
    if (!_2440)
    {
        float _2442 = _1972 + 1.0;
        _1992 = _2442;
    }
    _2440 = false;
    float _2444 = _1992;
    float _2446 = _1024 * 1.5;
    float _2448 = precise::max(_1498, _2446);
    float _2450 = -(*spvDescriptorSet0.fp_c3)._m0[5].w;
    float _2452 = 1.0 + _2450;
    float _2454 = precise::min(0.0, _2448);
    bool _2456 = _2454 != _1498;
    bool _2458 = isnan(_2454);
    bool _2460 = _2456 || _2458;
    bool _2462 = isnan(_1498);
    bool _2464 = _2460 || _2462;
    float _2466 = fma(_2452, (*spvDescriptorSet0.fp_c3)._m0[6].x, (*spvDescriptorSet0.fp_c3)._m0[6].z);
    float _2468 = _2466 * (*spvDescriptorSet0.fp_c3)._m0[7].x;
    bool _2470 = !_2464;
    float _2472 = _2444;
    if (!_2470)
    {
        float _2474 = _318 + _1022;
        float _2476 = _320 + _1020;
        float3 _7224 = float3(_2476, _2474, float(as_type<int>(_1488)));
        float3 _7226 = select(_7224, float3(0.0), isnan(_7224));
        float _2478 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, _7226.xy, uint(rint(_7226.z))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, _7226.xy, uint(rint(_7226.z))).x;
        float _2480 = _578 + _1024;
        float _2482 = _1024 * 3.0;
        float _2484 = -_2480;
        float _2486 = _2484 + _2478;
        float _2488 = _2486 + (*spvDescriptorSet0.fp_c3)._m0[5].x;
        float _2490 = precise::max(_2488, _2482);
        float _2492 = precise::min(0.0, _2490);
        bool _2494 = _2492 != _2488;
        bool _2496 = isnan(_2492);
        bool _2498 = _2494 || _2496;
        bool _2500 = isnan(_2488);
        bool _2502 = _2498 || _2500;
        bool _2504 = !_2502;
        if (!_2504)
        {
            float _2506 = fma(_1022, 2.0, _318);
            float _2508 = fma(_1020, 2.0, _320);
            float3 _7278 = float3(_2508, _2506, float(as_type<int>(_1488)));
            float3 _7280 = select(_7278, float3(0.0), isnan(_7278));
            float _2510 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, _7280.xy, uint(rint(_7280.z))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, _7280.xy, uint(rint(_7280.z))).x;
            float _2512 = fma(_1024, 2.0, _578);
            float _2514 = _1024 * 4.5;
            float _2516 = -_2512;
            float _2518 = _2516 + _2510;
            float _2520 = _2518 + (*spvDescriptorSet0.fp_c3)._m0[5].x;
            float _2522 = precise::max(_2520, _2514);
            float _2524 = precise::min(0.0, _2522);
            bool _2526 = _2524 != _2520;
            bool _2528 = isnan(_2524);
            bool _2530 = _2526 || _2528;
            bool _2532 = isnan(_2520);
            bool _2534 = _2530 || _2532;
            bool _2536 = !_2534;
            if (!_2536)
            {
                float _2538 = fma(_1022, 3.0, _318);
                float _2540 = fma(_1020, 3.0, _320);
                float3 _7332 = float3(_2540, _2538, float(as_type<int>(_1488)));
                float3 _7334 = select(_7332, float3(0.0), isnan(_7332));
                float _2542 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, _7334.xy, uint(rint(_7334.z))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, _7334.xy, uint(rint(_7334.z))).x;
                float _2544 = fma(_1024, 3.0, _578);
                float _2546 = _1024 * 6.0;
                float _2548 = -_2544;
                float _2550 = _2548 + _2542;
                float _2552 = _2550 + (*spvDescriptorSet0.fp_c3)._m0[5].x;
                float _2554 = precise::max(_2552, _2546);
                float _2556 = precise::min(0.0, _2554);
                bool _2558 = _2556 != _2552;
                bool _2560 = isnan(_2556);
                bool _2562 = _2558 || _2560;
                bool _2564 = isnan(_2552);
                bool _2566 = _2562 || _2564;
                bool _2568 = !_2566;
                if (!_2568)
                {
                    float _2570 = fma(_1022, 4.0, _318);
                    float _2572 = fma(_1020, 4.0, _320);
                    float3 _7386 = float3(_2572, _2570, float(as_type<int>(_1488)));
                    float3 _7388 = select(_7386, float3(0.0), isnan(_7386));
                    float _2574 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, _7388.xy, uint(rint(_7388.z))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, _7388.xy, uint(rint(_7388.z))).x;
                    float _2576 = fma(_1024, 4.0, _578);
                    float _2578 = _1024 * 7.5;
                    float _2580 = -_2576;
                    float _2582 = _2580 + _2574;
                    float _2584 = _2582 + (*spvDescriptorSet0.fp_c3)._m0[5].x;
                    float _2586 = precise::max(_2584, _2578);
                    float _2588 = precise::min(0.0, _2586);
                    bool _2590 = _2588 != _2584;
                    bool _2592 = isnan(_2588);
                    bool _2594 = _2590 || _2592;
                    bool _2596 = isnan(_2584);
                    bool _2598 = _2594 || _2596;
                    bool _2600 = !_2598;
                    if (!_2600)
                    {
                        float _2602 = fma(_1022, 5.0, _318);
                        float _2604 = fma(_1020, 5.0, _320);
                        float3 _7440 = float3(_2604, _2602, float(as_type<int>(_1488)));
                        float3 _7442 = select(_7440, float3(0.0), isnan(_7440));
                        float _2606 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, _7442.xy, uint(rint(_7442.z))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, _7442.xy, uint(rint(_7442.z))).x;
                        float _2608 = fma(_1024, 5.0, _578);
                        float _2610 = _1024 * 9.0;
                        float _2612 = -_2608;
                        float _2614 = _2612 + _2606;
                        float _2616 = _2614 + (*spvDescriptorSet0.fp_c3)._m0[5].x;
                        float _2618 = precise::max(_2616, _2610);
                        float _2620 = precise::min(0.0, _2618);
                        bool _2622 = _2620 != _2616;
                        bool _2624 = isnan(_2620);
                        bool _2626 = _2622 || _2624;
                        bool _2628 = isnan(_2616);
                        bool _2630 = _2626 || _2628;
                        bool _2632 = !_2630;
                        if (!_2632)
                        {
                            float _2634 = fma(_1022, 6.0, _318);
                            float _2636 = fma(_1020, 6.0, _320);
                            float3 _7494 = float3(_2636, _2634, float(as_type<int>(_1488)));
                            float3 _7496 = select(_7494, float3(0.0), isnan(_7494));
                            float _2638 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, _7496.xy, uint(rint(_7496.z))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, _7496.xy, uint(rint(_7496.z))).x;
                            float _2640 = fma(_1024, 6.0, _578);
                            float _2642 = _1024 * 10.5;
                            float _2644 = -_2640;
                            float _2646 = _2644 + _2638;
                            float _2648 = _2646 + (*spvDescriptorSet0.fp_c3)._m0[5].x;
                            float _2650 = precise::max(_2648, _2642);
                            float _2652 = precise::min(0.0, _2650);
                            bool _2654 = _2652 != _2648;
                            bool _2656 = isnan(_2652);
                            bool _2658 = _2654 || _2656;
                            bool _2660 = isnan(_2648);
                            bool _2662 = _2658 || _2660;
                            bool _2664 = !_2662;
                            if (!_2664)
                            {
                                float _2666 = fma(_1022, 7.0, _318);
                                float _2668 = fma(_1020, 7.0, _320);
                                float3 _7548 = float3(_2668, _2666, float(as_type<int>(_1488)));
                                float3 _7550 = select(_7548, float3(0.0), isnan(_7548));
                                float _2670 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, _7550.xy, uint(rint(_7550.z))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, _7550.xy, uint(rint(_7550.z))).x;
                                float _2672 = fma(_1024, 7.0, _578);
                                float _2674 = _1024 * 12.0;
                                float _2676 = -_2672;
                                float _2678 = _2676 + _2670;
                                float _2680 = _2678 + (*spvDescriptorSet0.fp_c3)._m0[5].x;
                                float _2682 = precise::max(_2680, _2674);
                                float _2684 = precise::min(0.0, _2682);
                                bool _2686 = _2684 != _2680;
                                bool _2688 = isnan(_2684);
                                bool _2690 = _2686 || _2688;
                                bool _2692 = isnan(_2680);
                                bool _2694 = _2690 || _2692;
                                bool _2696 = !_2694;
                                if (!_2696)
                                {
                                    float _2698 = fma(_1022, 8.0, _318);
                                    float _2700 = fma(_1020, 8.0, _320);
                                    float3 _7602 = float3(_2700, _2698, float(as_type<int>(_1488)));
                                    float3 _7604 = select(_7602, float3(0.0), isnan(_7602));
                                    float _2702 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, _7604.xy, uint(rint(_7604.z))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, _7604.xy, uint(rint(_7604.z))).x;
                                    float _2704 = fma(_1024, 8.0, _578);
                                    float _2706 = _1024 * 13.5;
                                    float _2708 = -_2704;
                                    float _2710 = _2708 + _2702;
                                    float _2712 = _2710 + (*spvDescriptorSet0.fp_c3)._m0[5].x;
                                    float _2714 = precise::max(_2712, _2706);
                                    float _2716 = precise::min(0.0, _2714);
                                    bool _2718 = _2716 != _2712;
                                    bool _2720 = isnan(_2716);
                                    bool _2722 = _2718 || _2720;
                                    bool _2724 = isnan(_2712);
                                    bool _2726 = _2722 || _2724;
                                    bool _2728 = !_2726;
                                    if (!_2728)
                                    {
                                        float _2730 = fma(_1022, 9.0, _318);
                                        float _2732 = fma(_1020, 9.0, _320);
                                        float3 _7656 = float3(_2732, _2730, float(as_type<int>(_1488)));
                                        float3 _7658 = select(_7656, float3(0.0), isnan(_7656));
                                        float _2734 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, _7658.xy, uint(rint(_7658.z))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, _7658.xy, uint(rint(_7658.z))).x;
                                        float _2736 = fma(_1024, 9.0, _578);
                                        float _2738 = _1024 * 15.0;
                                        float _2740 = -_2736;
                                        float _2742 = _2740 + _2734;
                                        float _2744 = _2742 + (*spvDescriptorSet0.fp_c3)._m0[5].x;
                                        float _2746 = precise::max(_2744, _2738);
                                        float _2748 = precise::min(0.0, _2746);
                                        bool _2750 = _2748 != _2744;
                                        bool _2752 = isnan(_2748);
                                        bool _2754 = _2750 || _2752;
                                        bool _2756 = isnan(_2744);
                                        bool _2758 = _2754 || _2756;
                                        bool _2760 = !_2758;
                                        if (!_2760)
                                        {
                                            float _2762 = fma(_1022, 10.0, _318);
                                            float _2764 = fma(_1020, 10.0, _320);
                                            float3 _7710 = float3(_2764, _2762, float(as_type<int>(_1488)));
                                            float3 _7712 = select(_7710, float3(0.0), isnan(_7710));
                                            float _2766 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, _7712.xy, uint(rint(_7712.z))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, _7712.xy, uint(rint(_7712.z))).x;
                                            float _2768 = fma(_1024, 10.0, _578);
                                            float _2770 = _1024 * 16.5;
                                            float _2772 = -_2768;
                                            float _2774 = _2772 + _2766;
                                            float _2776 = _2774 + (*spvDescriptorSet0.fp_c3)._m0[5].x;
                                            float _2778 = precise::max(_2776, _2770);
                                            float _2780 = precise::min(0.0, _2778);
                                            bool _2782 = _2780 != _2776;
                                            bool _2784 = isnan(_2780);
                                            bool _2786 = _2782 || _2784;
                                            bool _2788 = isnan(_2776);
                                            bool _2790 = _2786 || _2788;
                                            bool _2792 = !_2790;
                                            if (!_2792)
                                            {
                                                float _2794 = fma(_1022, 11.0, _318);
                                                float _2796 = fma(_1020, 11.0, _320);
                                                float3 _7764 = float3(_2796, _2794, float(as_type<int>(_1488)));
                                                float3 _7766 = select(_7764, float3(0.0), isnan(_7764));
                                                float _2798 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, _7766.xy, uint(rint(_7766.z))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, _7766.xy, uint(rint(_7766.z))).x;
                                                float _2800 = fma(_1024, 11.0, _578);
                                                float _2802 = _1024 * 18.0;
                                                float _2804 = -_2800;
                                                float _2806 = _2804 + _2798;
                                                float _2808 = _2806 + (*spvDescriptorSet0.fp_c3)._m0[5].x;
                                                float _2810 = precise::max(_2808, _2802);
                                                float _2812 = precise::min(0.0, _2810);
                                                bool _2814 = _2812 != _2808;
                                                bool _2816 = isnan(_2812);
                                                bool _2818 = _2814 || _2816;
                                                bool _2820 = isnan(_2808);
                                                bool _2822 = _2818 || _2820;
                                                bool _2824 = !_2822;
                                                if (!_2824)
                                                {
                                                    float _2826 = fma(_1022, 12.0, _318);
                                                    float _2828 = fma(_1020, 12.0, _320);
                                                    float3 _7818 = float3(_2828, _2826, float(as_type<int>(_1488)));
                                                    float3 _7820 = select(_7818, float3(0.0), isnan(_7818));
                                                    float _2830 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, _7820.xy, uint(rint(_7820.z))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, _7820.xy, uint(rint(_7820.z))).x;
                                                    float _2832 = fma(_1024, 12.0, _578);
                                                    float _2834 = _1024 * 19.5;
                                                    float _2836 = -_2832;
                                                    float _2838 = _2836 + _2830;
                                                    float _2840 = _2838 + (*spvDescriptorSet0.fp_c3)._m0[5].x;
                                                    float _2842 = precise::max(_2840, _2834);
                                                    float _2844 = precise::min(0.0, _2842);
                                                    bool _2846 = _2844 != _2840;
                                                    bool _2848 = isnan(_2844);
                                                    bool _2850 = _2846 || _2848;
                                                    bool _2852 = isnan(_2840);
                                                    bool _2854 = _2850 || _2852;
                                                    bool _2856 = !_2854;
                                                    if (!_2856)
                                                    {
                                                        float _2858 = fma(_1022, 13.0, _318);
                                                        float _2860 = fma(_1020, 13.0, _320);
                                                        float3 _7872 = float3(_2860, _2858, float(as_type<int>(_1488)));
                                                        float3 _7874 = select(_7872, float3(0.0), isnan(_7872));
                                                        float _2862 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, _7874.xy, uint(rint(_7874.z))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, _7874.xy, uint(rint(_7874.z))).x;
                                                        float _2864 = fma(_1024, 13.0, _578);
                                                        float _2866 = fma(_1024, 21.0, -1.0);
                                                        float _2868 = -_2864;
                                                        float _2870 = _2868 + _2862;
                                                        float _2872 = _2870 + (*spvDescriptorSet0.fp_c3)._m0[5].x;
                                                        float _2874 = precise::max(_2872, _2866);
                                                        float _2876 = precise::min(0.0, _2874);
                                                        bool _2878 = _2876 != _2872;
                                                        bool _2880 = isnan(_2876);
                                                        bool _2882 = _2878 || _2880;
                                                        bool _2884 = isnan(_2872);
                                                        bool _2886 = _2882 || _2884;
                                                        bool _2888 = !_2886;
                                                        if (!_2888)
                                                        {
                                                            float _2890 = fma(_1022, 14.0, _318);
                                                            float _2892 = fma(_1020, 14.0, _320);
                                                            float3 _7926 = float3(_2892, _2890, float(as_type<int>(_1488)));
                                                            float3 _7928 = select(_7926, float3(0.0), isnan(_7926));
                                                            float _2894 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, _7928.xy, uint(rint(_7928.z))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, _7928.xy, uint(rint(_7928.z))).x;
                                                            float _2896 = fma(_1024, 14.0, _578);
                                                            float _2898 = fma(_1024, 22.5, -1.0);
                                                            float _2900 = -_2896;
                                                            float _2902 = _2900 + _2894;
                                                            float _2904 = _2902 + (*spvDescriptorSet0.fp_c3)._m0[5].x;
                                                            float _2906 = precise::max(_2904, _2898);
                                                            float _2908 = precise::min(0.0, _2906);
                                                            bool _2910 = _2908 != _2904;
                                                            bool _2912 = isnan(_2908);
                                                            bool _2914 = _2910 || _2912;
                                                            bool _2916 = isnan(_2904);
                                                            bool _2918 = _2914 || _2916;
                                                            _2920 = _2918;
                                                        }
                                                    }
                                                }
                                            }
                                        }
                                    }
                                }
                            }
                        }
                    }
                }
            }
        }
    }
    if (!_2920)
    {
        float _2922 = _2444 + 1.0;
        _2472 = _2922;
    }
    _2920 = false;
    float _2924 = _2472;
    float _2926 = _2924 * 0.25;
    float _2928 = -_2926;
    float _2930 = fma(_2928, _2468, 1.0);
    out.m_39.x = _2930;
    return out;
}

