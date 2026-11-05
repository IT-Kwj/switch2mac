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
    bool _3560 = false;
    bool _2920 = false;
    bool _2288 = false;
    bool _1640 = false;
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
    float2 _3605 = float2(_62, _64);
    float _66 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_3605, float2(0.0), isnan(_3605))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_3605, float2(0.0), isnan(_3605))).x;
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
    float3 _4100 = float3(_320, _318, float(int(_308)));
    float3 _4104 = select(_4100, float3(0.0), isnan(_4100));
    float _326 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, _4104.xy, uint(rint(_4104.z))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, _4104.xy, uint(rint(_4104.z))).x;
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
    float _904 = (*spvDescriptorSet0.fp_c3)._m0[5].y * 0.0500000007450580596923828125;
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
    float _936 = (*spvDescriptorSet0.fp_c3)._m0[5].y * 0.0500000007450580596923828125;
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
    float _980 = (*spvDescriptorSet0.fp_c3)._m0[5].y * 0.0500000007450580596923828125;
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
    float _1016 = (*spvDescriptorSet0.fp_c3)._m0[5].y * 0.0500000007450580596923828125;
    float _1018 = _984 * _980;
    float _1020 = _988 * _1016;
    float _1022 = _998 * _1016;
    float _1024 = _1012 * _1016;
    bool _1026 = !_1008;
    float _1638;
    if (!_1026)
    {
        float _1028 = _318 + _1014;
        float _1030 = _320 + _934;
        float3 _5389 = float3(_1030, _1028, float(int(_308)));
        float3 _5391 = select(_5389, float3(0.0), isnan(_5389));
        float _1032 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, _5391.xy, uint(rint(_5391.z))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, _5391.xy, uint(rint(_5391.z))).x;
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
            float3 _5444 = float3(_1062, _1060, float(int(_308)));
            float3 _5446 = select(_5444, float3(0.0), isnan(_5444));
            float _1064 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, _5446.xy, uint(rint(_5446.z))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, _5446.xy, uint(rint(_5446.z))).x;
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
                float3 _5499 = float3(_1094, _1092, float(int(_308)));
                float3 _5501 = select(_5499, float3(0.0), isnan(_5499));
                float _1096 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, _5501.xy, uint(rint(_5501.z))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, _5501.xy, uint(rint(_5501.z))).x;
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
                    float3 _5555 = float3(_1126, _1124, float(int(_308)));
                    float3 _5557 = select(_5555, float3(0.0), isnan(_5555));
                    float _1128 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, _5557.xy, uint(rint(_5557.z))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, _5557.xy, uint(rint(_5557.z))).x;
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
                        float3 _5611 = float3(_1158, _1156, float(int(_308)));
                        float3 _5613 = select(_5611, float3(0.0), isnan(_5611));
                        float _1160 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, _5613.xy, uint(rint(_5613.z))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, _5613.xy, uint(rint(_5613.z))).x;
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
                            float3 _5666 = float3(_1190, _1188, float(int(_308)));
                            float3 _5668 = select(_5666, float3(0.0), isnan(_5666));
                            float _1192 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, _5668.xy, uint(rint(_5668.z))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, _5668.xy, uint(rint(_5668.z))).x;
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
                                float3 _5722 = float3(_1222, _1220, float(int(_308)));
                                float3 _5724 = select(_5722, float3(0.0), isnan(_5722));
                                float _1224 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, _5724.xy, uint(rint(_5724.z))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, _5724.xy, uint(rint(_5724.z))).x;
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
                                    float3 _5778 = float3(_1254, _1252, float(int(_308)));
                                    float3 _5780 = select(_5778, float3(0.0), isnan(_5778));
                                    float _1256 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, _5780.xy, uint(rint(_5780.z))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, _5780.xy, uint(rint(_5780.z))).x;
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
                                        float3 _5833 = float3(_1286, _1284, float(int(_308)));
                                        float3 _5835 = select(_5833, float3(0.0), isnan(_5833));
                                        float _1288 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, _5835.xy, uint(rint(_5835.z))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, _5835.xy, uint(rint(_5835.z))).x;
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
                                            float3 _5889 = float3(_1318, _1316, float(int(_308)));
                                            float3 _5891 = select(_5889, float3(0.0), isnan(_5889));
                                            float _1320 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, _5891.xy, uint(rint(_5891.z))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, _5891.xy, uint(rint(_5891.z))).x;
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
                                                float3 _5945 = float3(_1350, _1348, float(int(_308)));
                                                float3 _5947 = select(_5945, float3(0.0), isnan(_5945));
                                                float _1352 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, _5947.xy, uint(rint(_5947.z))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, _5947.xy, uint(rint(_5947.z))).x;
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
                                                    float3 _6000 = float3(_1382, _1380, float(int(_308)));
                                                    float3 _6002 = select(_6000, float3(0.0), isnan(_6000));
                                                    float _1384 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, _6002.xy, uint(rint(_6002.z))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, _6002.xy, uint(rint(_6002.z))).x;
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
                                                        float3 _6056 = float3(_1414, _1412, float(int(_308)));
                                                        float3 _6058 = select(_6056, float3(0.0), isnan(_6056));
                                                        float _1416 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, _6058.xy, uint(rint(_6058.z))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, _6058.xy, uint(rint(_6058.z))).x;
                                                        float _1418 = fma(_950, 13.0, _578);
                                                        float _1420 = _950 * 21.0;
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
                                                            float3 _6112 = float3(_1446, _1444, float(int(_308)));
                                                            float3 _6114 = select(_6112, float3(0.0), isnan(_6112));
                                                            float _1448 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, _6114.xy, uint(rint(_6114.z))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, _6114.xy, uint(rint(_6114.z))).x;
                                                            float _1450 = fma(_950, 14.0, _578);
                                                            float _1452 = _950 * 22.5;
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
                                                            bool _1474 = !_1472;
                                                            if (!_1474)
                                                            {
                                                                float _1476 = fma(_1014, 15.0, _318);
                                                                float _1478 = fma(_934, 15.0, _320);
                                                                float3 _6167 = float3(_1478, _1476, float(int(_308)));
                                                                float3 _6169 = select(_6167, float3(0.0), isnan(_6167));
                                                                float _1480 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, _6169.xy, uint(rint(_6169.z))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, _6169.xy, uint(rint(_6169.z))).x;
                                                                float _1482 = fma(_950, 15.0, _578);
                                                                float _1484 = _950 * 24.0;
                                                                float _1486 = -_1482;
                                                                float _1488 = _1486 + _1480;
                                                                float _1490 = _1488 + (*spvDescriptorSet0.fp_c3)._m0[5].x;
                                                                float _1492 = precise::max(_1490, _1484);
                                                                float _1494 = precise::min(0.0, _1492);
                                                                bool _1496 = _1494 != _1490;
                                                                bool _1498 = isnan(_1494);
                                                                bool _1500 = _1496 || _1498;
                                                                bool _1502 = isnan(_1490);
                                                                bool _1504 = _1500 || _1502;
                                                                bool _1506 = !_1504;
                                                                if (!_1506)
                                                                {
                                                                    float _1508 = fma(_1014, 16.0, _318);
                                                                    float _1510 = fma(_934, 16.0, _320);
                                                                    float3 _6223 = float3(_1510, _1508, float(int(_308)));
                                                                    float3 _6225 = select(_6223, float3(0.0), isnan(_6223));
                                                                    float _1512 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, _6225.xy, uint(rint(_6225.z))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, _6225.xy, uint(rint(_6225.z))).x;
                                                                    float _1514 = fma(_950, 16.0, _578);
                                                                    float _1516 = _950 * 25.5;
                                                                    float _1518 = -_1514;
                                                                    float _1520 = _1518 + _1512;
                                                                    float _1522 = _1520 + (*spvDescriptorSet0.fp_c3)._m0[5].x;
                                                                    float _1524 = precise::max(_1522, _1516);
                                                                    float _1526 = precise::min(0.0, _1524);
                                                                    bool _1528 = _1526 != _1522;
                                                                    bool _1530 = isnan(_1526);
                                                                    bool _1532 = _1528 || _1530;
                                                                    bool _1534 = isnan(_1522);
                                                                    bool _1536 = _1532 || _1534;
                                                                    bool _1538 = !_1536;
                                                                    if (!_1538)
                                                                    {
                                                                        float _1540 = fma(_1014, 17.0, _318);
                                                                        float _1542 = fma(_934, 17.0, _320);
                                                                        float3 _6279 = float3(_1542, _1540, float(int(_308)));
                                                                        float3 _6281 = select(_6279, float3(0.0), isnan(_6279));
                                                                        float _1544 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, _6281.xy, uint(rint(_6281.z))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, _6281.xy, uint(rint(_6281.z))).x;
                                                                        float _1546 = fma(_950, 17.0, _578);
                                                                        float _1548 = _950 * 27.0;
                                                                        float _1550 = -_1546;
                                                                        float _1552 = _1550 + _1544;
                                                                        float _1554 = _1552 + (*spvDescriptorSet0.fp_c3)._m0[5].x;
                                                                        float _1556 = precise::max(_1554, _1548);
                                                                        float _1558 = precise::min(0.0, _1556);
                                                                        bool _1560 = _1558 != _1554;
                                                                        bool _1562 = isnan(_1558);
                                                                        bool _1564 = _1560 || _1562;
                                                                        bool _1566 = isnan(_1554);
                                                                        bool _1568 = _1564 || _1566;
                                                                        bool _1570 = !_1568;
                                                                        if (!_1570)
                                                                        {
                                                                            float _1572 = fma(_1014, 18.0, _318);
                                                                            float _1574 = fma(_934, 18.0, _320);
                                                                            float3 _6334 = float3(_1574, _1572, float(int(_308)));
                                                                            float3 _6336 = select(_6334, float3(0.0), isnan(_6334));
                                                                            float _1576 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, _6336.xy, uint(rint(_6336.z))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, _6336.xy, uint(rint(_6336.z))).x;
                                                                            float _1578 = fma(_950, 18.0, _578);
                                                                            float _1580 = fma(_950, 28.5, -1.0);
                                                                            float _1582 = -_1578;
                                                                            float _1584 = _1582 + _1576;
                                                                            float _1586 = _1584 + (*spvDescriptorSet0.fp_c3)._m0[5].x;
                                                                            float _1588 = precise::max(_1586, _1580);
                                                                            float _1590 = precise::min(0.0, _1588);
                                                                            bool _1592 = _1590 != _1586;
                                                                            bool _1594 = isnan(_1590);
                                                                            bool _1596 = _1592 || _1594;
                                                                            bool _1598 = isnan(_1586);
                                                                            bool _1600 = _1596 || _1598;
                                                                            bool _1602 = !_1600;
                                                                            if (!_1602)
                                                                            {
                                                                                float _1604 = fma(_1014, 19.0, _318);
                                                                                float _1606 = fma(_934, 19.0, _320);
                                                                                float3 _6390 = float3(_1606, _1604, float(int(_308)));
                                                                                float3 _6392 = select(_6390, float3(0.0), isnan(_6390));
                                                                                float _1608 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, _6392.xy, uint(rint(_6392.z))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, _6392.xy, uint(rint(_6392.z))).x;
                                                                                float _1610 = fma(_950, 19.0, _578);
                                                                                float _1612 = fma(_950, 30.0, -1.0);
                                                                                float _1614 = -_1610;
                                                                                float _1616 = _1614 + _1608;
                                                                                float _1618 = _1616 + (*spvDescriptorSet0.fp_c3)._m0[5].x;
                                                                                float _1620 = precise::max(_1618, _1612);
                                                                                float _1622 = precise::min(0.0, _1620);
                                                                                bool _1624 = _1622 != _1618;
                                                                                bool _1626 = isnan(_1622);
                                                                                bool _1628 = _1624 || _1626;
                                                                                bool _1630 = isnan(_1618);
                                                                                bool _1632 = _1628 || _1630;
                                                                                float _1634 = _1622;
                                                                                if (_1632)
                                                                                {
                                                                                    _1634 = 0.0;
                                                                                }
                                                                                float _1636 = _1634;
                                                                                _1638 = _1636;
                                                                                _1640 = _1632;
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
                    }
                }
            }
        }
    }
    if (!_1640)
    {
        _1638 = 1.0;
    }
    _1640 = false;
    float _1642 = _1638;
    bool _1644 = _600 > 65535u;
    bool _1646 = !_1644;
    float _1648 = _1646 ? as_type<float>(_600) : 9.1834094859526886742986618240905e-41;
    float3 _6474 = float3(_320, _318, float(as_type<int>(_1648)));
    float3 _6476 = select(_6474, float3(0.0), isnan(_6474));
    float _1650 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, _6476.xy, uint(rint(_6476.z))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, _6476.xy, uint(rint(_6476.z))).x;
    float _1652 = _960 * 1.5;
    float _1654 = -_578;
    float _1656 = _1654 + _1650;
    float _1658 = _1656 + (*spvDescriptorSet0.fp_c3)._m0[5].x;
    float _1660 = precise::max(_1658, _1652);
    float _1662 = precise::min(0.0, _1660);
    bool _1664 = _1662 != _1658;
    bool _1666 = isnan(_1662);
    bool _1668 = _1664 || _1666;
    bool _1670 = isnan(_1658);
    bool _1672 = _1668 || _1670;
    bool _1674 = !_1672;
    float _2286;
    if (!_1674)
    {
        float _1676 = _318 + _958;
        float _1678 = _320 + _956;
        float3 _6525 = float3(_1678, _1676, float(as_type<int>(_1648)));
        float3 _6527 = select(_6525, float3(0.0), isnan(_6525));
        float _1680 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, _6527.xy, uint(rint(_6527.z))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, _6527.xy, uint(rint(_6527.z))).x;
        float _1682 = _578 + _960;
        float _1684 = -_1682;
        float _1686 = _1684 + _1680;
        float _1688 = _960 * 3.0;
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
            float _1708 = fma(_958, 2.0, _318);
            float _1710 = fma(_956, 2.0, _320);
            float3 _6579 = float3(_1710, _1708, float(as_type<int>(_1648)));
            float3 _6581 = select(_6579, float3(0.0), isnan(_6579));
            float _1712 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, _6581.xy, uint(rint(_6581.z))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, _6581.xy, uint(rint(_6581.z))).x;
            float _1714 = fma(_960, 2.0, _578);
            float _1716 = -_1714;
            float _1718 = _1716 + _1712;
            float _1720 = _960 * 4.5;
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
                float _1740 = fma(_958, 3.0, _318);
                float _1742 = fma(_956, 3.0, _320);
                float3 _6633 = float3(_1742, _1740, float(as_type<int>(_1648)));
                float3 _6635 = select(_6633, float3(0.0), isnan(_6633));
                float _1744 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, _6635.xy, uint(rint(_6635.z))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, _6635.xy, uint(rint(_6635.z))).x;
                float _1746 = fma(_960, 3.0, _578);
                float _1748 = -_1746;
                float _1750 = _1748 + _1744;
                float _1752 = _960 * 6.0;
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
                    float _1772 = fma(_958, 4.0, _318);
                    float _1774 = fma(_956, 4.0, _320);
                    float3 _6687 = float3(_1774, _1772, float(as_type<int>(_1648)));
                    float3 _6689 = select(_6687, float3(0.0), isnan(_6687));
                    float _1776 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, _6689.xy, uint(rint(_6689.z))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, _6689.xy, uint(rint(_6689.z))).x;
                    float _1778 = fma(_960, 4.0, _578);
                    float _1780 = -_1778;
                    float _1782 = _1780 + _1776;
                    float _1784 = _960 * 7.5;
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
                        float _1804 = fma(_958, 5.0, _318);
                        float _1806 = fma(_956, 5.0, _320);
                        float3 _6741 = float3(_1806, _1804, float(as_type<int>(_1648)));
                        float3 _6743 = select(_6741, float3(0.0), isnan(_6741));
                        float _1808 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, _6743.xy, uint(rint(_6743.z))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, _6743.xy, uint(rint(_6743.z))).x;
                        float _1810 = fma(_960, 5.0, _578);
                        float _1812 = -_1810;
                        float _1814 = _1812 + _1808;
                        float _1816 = _960 * 9.0;
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
                            float _1836 = fma(_958, 6.0, _318);
                            float _1838 = fma(_956, 6.0, _320);
                            float3 _6795 = float3(_1838, _1836, float(as_type<int>(_1648)));
                            float3 _6797 = select(_6795, float3(0.0), isnan(_6795));
                            float _1840 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, _6797.xy, uint(rint(_6797.z))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, _6797.xy, uint(rint(_6797.z))).x;
                            float _1842 = fma(_960, 6.0, _578);
                            float _1844 = -_1842;
                            float _1846 = _1844 + _1840;
                            float _1848 = _960 * 10.5;
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
                                float _1868 = fma(_958, 7.0, _318);
                                float _1870 = fma(_956, 7.0, _320);
                                float3 _6849 = float3(_1870, _1868, float(as_type<int>(_1648)));
                                float3 _6851 = select(_6849, float3(0.0), isnan(_6849));
                                float _1872 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, _6851.xy, uint(rint(_6851.z))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, _6851.xy, uint(rint(_6851.z))).x;
                                float _1874 = fma(_960, 7.0, _578);
                                float _1876 = -_1874;
                                float _1878 = _1876 + _1872;
                                float _1880 = _960 * 12.0;
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
                                    float _1900 = fma(_958, 8.0, _318);
                                    float _1902 = fma(_956, 8.0, _320);
                                    float3 _6903 = float3(_1902, _1900, float(as_type<int>(_1648)));
                                    float3 _6905 = select(_6903, float3(0.0), isnan(_6903));
                                    float _1904 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, _6905.xy, uint(rint(_6905.z))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, _6905.xy, uint(rint(_6905.z))).x;
                                    float _1906 = fma(_960, 8.0, _578);
                                    float _1908 = -_1906;
                                    float _1910 = _1908 + _1904;
                                    float _1912 = _960 * 13.5;
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
                                        float _1932 = fma(_958, 9.0, _318);
                                        float _1934 = fma(_956, 9.0, _320);
                                        float3 _6957 = float3(_1934, _1932, float(as_type<int>(_1648)));
                                        float3 _6959 = select(_6957, float3(0.0), isnan(_6957));
                                        float _1936 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, _6959.xy, uint(rint(_6959.z))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, _6959.xy, uint(rint(_6959.z))).x;
                                        float _1938 = fma(_960, 9.0, _578);
                                        float _1940 = -_1938;
                                        float _1942 = _1940 + _1936;
                                        float _1944 = _960 * 15.0;
                                        float _1946 = _1942 + (*spvDescriptorSet0.fp_c3)._m0[5].x;
                                        float _1948 = precise::max(_1946, _1944);
                                        float _1950 = precise::min(0.0, _1948);
                                        bool _1952 = _1950 != _1946;
                                        bool _1954 = isnan(_1950);
                                        bool _1956 = _1952 || _1954;
                                        bool _1958 = isnan(_1946);
                                        bool _1960 = _1956 || _1958;
                                        bool _1962 = !_1960;
                                        if (!_1962)
                                        {
                                            float _1964 = fma(_958, 10.0, _318);
                                            float _1966 = fma(_956, 10.0, _320);
                                            float3 _7011 = float3(_1966, _1964, float(as_type<int>(_1648)));
                                            float3 _7013 = select(_7011, float3(0.0), isnan(_7011));
                                            float _1968 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, _7013.xy, uint(rint(_7013.z))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, _7013.xy, uint(rint(_7013.z))).x;
                                            float _1970 = fma(_960, 10.0, _578);
                                            float _1972 = -_1970;
                                            float _1974 = _1972 + _1968;
                                            float _1976 = _960 * 16.5;
                                            float _1978 = _1974 + (*spvDescriptorSet0.fp_c3)._m0[5].x;
                                            float _1980 = precise::max(_1978, _1976);
                                            float _1982 = precise::min(0.0, _1980);
                                            bool _1984 = _1982 != _1978;
                                            bool _1986 = isnan(_1982);
                                            bool _1988 = _1984 || _1986;
                                            bool _1990 = isnan(_1978);
                                            bool _1992 = _1988 || _1990;
                                            bool _1994 = !_1992;
                                            if (!_1994)
                                            {
                                                float _1996 = fma(_958, 11.0, _318);
                                                float _1998 = fma(_956, 11.0, _320);
                                                float3 _7065 = float3(_1998, _1996, float(as_type<int>(_1648)));
                                                float3 _7067 = select(_7065, float3(0.0), isnan(_7065));
                                                float _2000 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, _7067.xy, uint(rint(_7067.z))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, _7067.xy, uint(rint(_7067.z))).x;
                                                float _2002 = fma(_960, 11.0, _578);
                                                float _2004 = -_2002;
                                                float _2006 = _2004 + _2000;
                                                float _2008 = _960 * 18.0;
                                                float _2010 = _2006 + (*spvDescriptorSet0.fp_c3)._m0[5].x;
                                                float _2012 = precise::max(_2010, _2008);
                                                float _2014 = precise::min(0.0, _2012);
                                                bool _2016 = _2014 != _2010;
                                                bool _2018 = isnan(_2014);
                                                bool _2020 = _2016 || _2018;
                                                bool _2022 = isnan(_2010);
                                                bool _2024 = _2020 || _2022;
                                                bool _2026 = !_2024;
                                                if (!_2026)
                                                {
                                                    float _2028 = fma(_958, 12.0, _318);
                                                    float _2030 = fma(_956, 12.0, _320);
                                                    float3 _7119 = float3(_2030, _2028, float(as_type<int>(_1648)));
                                                    float3 _7121 = select(_7119, float3(0.0), isnan(_7119));
                                                    float _2032 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, _7121.xy, uint(rint(_7121.z))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, _7121.xy, uint(rint(_7121.z))).x;
                                                    float _2034 = fma(_960, 12.0, _578);
                                                    float _2036 = -_2034;
                                                    float _2038 = _2036 + _2032;
                                                    float _2040 = _960 * 19.5;
                                                    float _2042 = _2038 + (*spvDescriptorSet0.fp_c3)._m0[5].x;
                                                    float _2044 = precise::max(_2042, _2040);
                                                    float _2046 = precise::min(0.0, _2044);
                                                    bool _2048 = _2046 != _2042;
                                                    bool _2050 = isnan(_2046);
                                                    bool _2052 = _2048 || _2050;
                                                    bool _2054 = isnan(_2042);
                                                    bool _2056 = _2052 || _2054;
                                                    bool _2058 = !_2056;
                                                    if (!_2058)
                                                    {
                                                        float _2060 = fma(_958, 13.0, _318);
                                                        float _2062 = fma(_956, 13.0, _320);
                                                        float3 _7173 = float3(_2062, _2060, float(as_type<int>(_1648)));
                                                        float3 _7175 = select(_7173, float3(0.0), isnan(_7173));
                                                        float _2064 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, _7175.xy, uint(rint(_7175.z))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, _7175.xy, uint(rint(_7175.z))).x;
                                                        float _2066 = fma(_960, 13.0, _578);
                                                        float _2068 = -_2066;
                                                        float _2070 = _2068 + _2064;
                                                        float _2072 = _960 * 21.0;
                                                        float _2074 = _2070 + (*spvDescriptorSet0.fp_c3)._m0[5].x;
                                                        float _2076 = precise::max(_2074, _2072);
                                                        float _2078 = precise::min(0.0, _2076);
                                                        bool _2080 = _2078 != _2074;
                                                        bool _2082 = isnan(_2078);
                                                        bool _2084 = _2080 || _2082;
                                                        bool _2086 = isnan(_2074);
                                                        bool _2088 = _2084 || _2086;
                                                        bool _2090 = !_2088;
                                                        if (!_2090)
                                                        {
                                                            float _2092 = fma(_958, 14.0, _318);
                                                            float _2094 = fma(_956, 14.0, _320);
                                                            float3 _7227 = float3(_2094, _2092, float(as_type<int>(_1648)));
                                                            float3 _7229 = select(_7227, float3(0.0), isnan(_7227));
                                                            float _2096 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, _7229.xy, uint(rint(_7229.z))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, _7229.xy, uint(rint(_7229.z))).x;
                                                            float _2098 = fma(_960, 14.0, _578);
                                                            float _2100 = -_2098;
                                                            float _2102 = _2100 + _2096;
                                                            float _2104 = _960 * 22.5;
                                                            float _2106 = _2102 + (*spvDescriptorSet0.fp_c3)._m0[5].x;
                                                            float _2108 = precise::max(_2106, _2104);
                                                            float _2110 = precise::min(0.0, _2108);
                                                            bool _2112 = _2110 != _2106;
                                                            bool _2114 = isnan(_2110);
                                                            bool _2116 = _2112 || _2114;
                                                            bool _2118 = isnan(_2106);
                                                            bool _2120 = _2116 || _2118;
                                                            bool _2122 = !_2120;
                                                            if (!_2122)
                                                            {
                                                                float _2124 = fma(_958, 15.0, _318);
                                                                float _2126 = fma(_956, 15.0, _320);
                                                                float3 _7281 = float3(_2126, _2124, float(as_type<int>(_1648)));
                                                                float3 _7283 = select(_7281, float3(0.0), isnan(_7281));
                                                                float _2128 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, _7283.xy, uint(rint(_7283.z))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, _7283.xy, uint(rint(_7283.z))).x;
                                                                float _2130 = fma(_960, 15.0, _578);
                                                                float _2132 = -_2130;
                                                                float _2134 = _2132 + _2128;
                                                                float _2136 = _960 * 24.0;
                                                                float _2138 = _2134 + (*spvDescriptorSet0.fp_c3)._m0[5].x;
                                                                float _2140 = precise::max(_2138, _2136);
                                                                float _2142 = precise::min(0.0, _2140);
                                                                bool _2144 = _2142 != _2138;
                                                                bool _2146 = isnan(_2142);
                                                                bool _2148 = _2144 || _2146;
                                                                bool _2150 = isnan(_2138);
                                                                bool _2152 = _2148 || _2150;
                                                                bool _2154 = !_2152;
                                                                if (!_2154)
                                                                {
                                                                    float _2156 = fma(_958, 16.0, _318);
                                                                    float _2158 = fma(_956, 16.0, _320);
                                                                    float3 _7335 = float3(_2158, _2156, float(as_type<int>(_1648)));
                                                                    float3 _7337 = select(_7335, float3(0.0), isnan(_7335));
                                                                    float _2160 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, _7337.xy, uint(rint(_7337.z))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, _7337.xy, uint(rint(_7337.z))).x;
                                                                    float _2162 = fma(_960, 16.0, _578);
                                                                    float _2164 = -_2162;
                                                                    float _2166 = _2164 + _2160;
                                                                    float _2168 = _960 * 25.5;
                                                                    float _2170 = _2166 + (*spvDescriptorSet0.fp_c3)._m0[5].x;
                                                                    float _2172 = precise::max(_2170, _2168);
                                                                    float _2174 = precise::min(0.0, _2172);
                                                                    bool _2176 = _2174 != _2170;
                                                                    bool _2178 = isnan(_2174);
                                                                    bool _2180 = _2176 || _2178;
                                                                    bool _2182 = isnan(_2170);
                                                                    bool _2184 = _2180 || _2182;
                                                                    bool _2186 = !_2184;
                                                                    if (!_2186)
                                                                    {
                                                                        float _2188 = fma(_958, 17.0, _318);
                                                                        float _2190 = fma(_956, 17.0, _320);
                                                                        float3 _7389 = float3(_2190, _2188, float(as_type<int>(_1648)));
                                                                        float3 _7391 = select(_7389, float3(0.0), isnan(_7389));
                                                                        float _2192 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, _7391.xy, uint(rint(_7391.z))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, _7391.xy, uint(rint(_7391.z))).x;
                                                                        float _2194 = fma(_960, 17.0, _578);
                                                                        float _2196 = -_2194;
                                                                        float _2198 = _2196 + _2192;
                                                                        float _2200 = _960 * 27.0;
                                                                        float _2202 = _2198 + (*spvDescriptorSet0.fp_c3)._m0[5].x;
                                                                        float _2204 = precise::max(_2202, _2200);
                                                                        float _2206 = precise::min(0.0, _2204);
                                                                        bool _2208 = _2206 != _2202;
                                                                        bool _2210 = isnan(_2206);
                                                                        bool _2212 = _2208 || _2210;
                                                                        bool _2214 = isnan(_2202);
                                                                        bool _2216 = _2212 || _2214;
                                                                        bool _2218 = !_2216;
                                                                        if (!_2218)
                                                                        {
                                                                            float _2220 = fma(_958, 18.0, _318);
                                                                            float _2222 = fma(_956, 18.0, _320);
                                                                            float3 _7443 = float3(_2222, _2220, float(as_type<int>(_1648)));
                                                                            float3 _7445 = select(_7443, float3(0.0), isnan(_7443));
                                                                            float _2224 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, _7445.xy, uint(rint(_7445.z))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, _7445.xy, uint(rint(_7445.z))).x;
                                                                            float _2226 = fma(_960, 18.0, _578);
                                                                            float _2228 = -_2226;
                                                                            float _2230 = _2228 + _2224;
                                                                            float _2232 = fma(_960, 28.5, -1.0);
                                                                            float _2234 = _2230 + (*spvDescriptorSet0.fp_c3)._m0[5].x;
                                                                            float _2236 = precise::max(_2234, _2232);
                                                                            float _2238 = precise::min(0.0, _2236);
                                                                            bool _2240 = _2238 != _2234;
                                                                            bool _2242 = isnan(_2238);
                                                                            bool _2244 = _2240 || _2242;
                                                                            bool _2246 = isnan(_2234);
                                                                            bool _2248 = _2244 || _2246;
                                                                            bool _2250 = !_2248;
                                                                            if (!_2250)
                                                                            {
                                                                                float _2252 = fma(_958, 19.0, _318);
                                                                                float _2254 = fma(_956, 19.0, _320);
                                                                                float3 _7497 = float3(_2254, _2252, float(as_type<int>(_1648)));
                                                                                float3 _7499 = select(_7497, float3(0.0), isnan(_7497));
                                                                                float _2256 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, _7499.xy, uint(rint(_7499.z))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, _7499.xy, uint(rint(_7499.z))).x;
                                                                                float _2258 = fma(_960, 19.0, _578);
                                                                                float _2260 = fma(_960, 30.0, -1.0);
                                                                                float _2262 = -_2258;
                                                                                float _2264 = _2262 + _2256;
                                                                                float _2266 = _2264 + (*spvDescriptorSet0.fp_c3)._m0[5].x;
                                                                                float _2268 = precise::max(_2266, _2260);
                                                                                float _2270 = precise::min(0.0, _2268);
                                                                                bool _2272 = _2270 != _2266;
                                                                                bool _2274 = isnan(_2270);
                                                                                bool _2276 = _2272 || _2274;
                                                                                bool _2278 = isnan(_2266);
                                                                                bool _2280 = _2276 || _2278;
                                                                                float _2282 = _2266;
                                                                                if (_2280)
                                                                                {
                                                                                    _2282 = _1642;
                                                                                }
                                                                                float _2284 = _2282;
                                                                                _2286 = _2284;
                                                                                _2288 = _2280;
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
                    }
                }
            }
        }
    }
    if (!_2288)
    {
        float _2290 = _1642 + 1.0;
        _2286 = _2290;
    }
    _2288 = false;
    float _2292 = _2286;
    float _2294 = _994 * 1.5;
    float _2296 = precise::max(_1658, _2294);
    float _2298 = precise::min(0.0, _2296);
    bool _2300 = _2298 != _1658;
    bool _2302 = isnan(_2298);
    bool _2304 = _2300 || _2302;
    bool _2306 = isnan(_1658);
    bool _2308 = _2304 || _2306;
    bool _2310 = !_2308;
    float _2312 = _2292;
    if (!_2310)
    {
        float _2314 = _318 + _1018;
        float _2316 = _320 + _992;
        float3 _7607 = float3(_2316, _2314, float(as_type<int>(_1648)));
        float3 _7609 = select(_7607, float3(0.0), isnan(_7607));
        float _2318 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, _7609.xy, uint(rint(_7609.z))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, _7609.xy, uint(rint(_7609.z))).x;
        float _2320 = _578 + _994;
        float _2322 = _994 * 3.0;
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
            float _2346 = fma(_1018, 2.0, _318);
            float _2348 = fma(_992, 2.0, _320);
            float3 _7661 = float3(_2348, _2346, float(as_type<int>(_1648)));
            float3 _7663 = select(_7661, float3(0.0), isnan(_7661));
            float _2350 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, _7663.xy, uint(rint(_7663.z))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, _7663.xy, uint(rint(_7663.z))).x;
            float _2352 = fma(_994, 2.0, _578);
            float _2354 = _994 * 4.5;
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
                float _2378 = fma(_1018, 3.0, _318);
                float _2380 = fma(_992, 3.0, _320);
                float3 _7715 = float3(_2380, _2378, float(as_type<int>(_1648)));
                float3 _7717 = select(_7715, float3(0.0), isnan(_7715));
                float _2382 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, _7717.xy, uint(rint(_7717.z))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, _7717.xy, uint(rint(_7717.z))).x;
                float _2384 = fma(_994, 3.0, _578);
                float _2386 = _994 * 6.0;
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
                    float _2410 = fma(_1018, 4.0, _318);
                    float _2412 = fma(_992, 4.0, _320);
                    float3 _7769 = float3(_2412, _2410, float(as_type<int>(_1648)));
                    float3 _7771 = select(_7769, float3(0.0), isnan(_7769));
                    float _2414 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, _7771.xy, uint(rint(_7771.z))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, _7771.xy, uint(rint(_7771.z))).x;
                    float _2416 = fma(_994, 4.0, _578);
                    float _2418 = _994 * 7.5;
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
                    bool _2440 = !_2438;
                    if (!_2440)
                    {
                        float _2442 = fma(_1018, 5.0, _318);
                        float _2444 = fma(_992, 5.0, _320);
                        float3 _7823 = float3(_2444, _2442, float(as_type<int>(_1648)));
                        float3 _7825 = select(_7823, float3(0.0), isnan(_7823));
                        float _2446 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, _7825.xy, uint(rint(_7825.z))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, _7825.xy, uint(rint(_7825.z))).x;
                        float _2448 = fma(_994, 5.0, _578);
                        float _2450 = _994 * 9.0;
                        float _2452 = -_2448;
                        float _2454 = _2452 + _2446;
                        float _2456 = _2454 + (*spvDescriptorSet0.fp_c3)._m0[5].x;
                        float _2458 = precise::max(_2456, _2450);
                        float _2460 = precise::min(0.0, _2458);
                        bool _2462 = _2460 != _2456;
                        bool _2464 = isnan(_2460);
                        bool _2466 = _2462 || _2464;
                        bool _2468 = isnan(_2456);
                        bool _2470 = _2466 || _2468;
                        bool _2472 = !_2470;
                        if (!_2472)
                        {
                            float _2474 = fma(_1018, 6.0, _318);
                            float _2476 = fma(_992, 6.0, _320);
                            float3 _7877 = float3(_2476, _2474, float(as_type<int>(_1648)));
                            float3 _7879 = select(_7877, float3(0.0), isnan(_7877));
                            float _2478 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, _7879.xy, uint(rint(_7879.z))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, _7879.xy, uint(rint(_7879.z))).x;
                            float _2480 = fma(_994, 6.0, _578);
                            float _2482 = _994 * 10.5;
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
                                float _2506 = fma(_1018, 7.0, _318);
                                float _2508 = fma(_992, 7.0, _320);
                                float3 _7931 = float3(_2508, _2506, float(as_type<int>(_1648)));
                                float3 _7933 = select(_7931, float3(0.0), isnan(_7931));
                                float _2510 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, _7933.xy, uint(rint(_7933.z))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, _7933.xy, uint(rint(_7933.z))).x;
                                float _2512 = fma(_994, 7.0, _578);
                                float _2514 = _994 * 12.0;
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
                                    float _2538 = fma(_1018, 8.0, _318);
                                    float _2540 = fma(_992, 8.0, _320);
                                    float3 _7985 = float3(_2540, _2538, float(as_type<int>(_1648)));
                                    float3 _7987 = select(_7985, float3(0.0), isnan(_7985));
                                    float _2542 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, _7987.xy, uint(rint(_7987.z))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, _7987.xy, uint(rint(_7987.z))).x;
                                    float _2544 = fma(_994, 8.0, _578);
                                    float _2546 = _994 * 13.5;
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
                                        float _2570 = fma(_1018, 9.0, _318);
                                        float _2572 = fma(_992, 9.0, _320);
                                        float3 _8039 = float3(_2572, _2570, float(as_type<int>(_1648)));
                                        float3 _8041 = select(_8039, float3(0.0), isnan(_8039));
                                        float _2574 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, _8041.xy, uint(rint(_8041.z))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, _8041.xy, uint(rint(_8041.z))).x;
                                        float _2576 = fma(_994, 9.0, _578);
                                        float _2578 = _994 * 15.0;
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
                                            float _2602 = fma(_1018, 10.0, _318);
                                            float _2604 = fma(_992, 10.0, _320);
                                            float3 _8093 = float3(_2604, _2602, float(as_type<int>(_1648)));
                                            float3 _8095 = select(_8093, float3(0.0), isnan(_8093));
                                            float _2606 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, _8095.xy, uint(rint(_8095.z))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, _8095.xy, uint(rint(_8095.z))).x;
                                            float _2608 = fma(_994, 10.0, _578);
                                            float _2610 = _994 * 16.5;
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
                                                float _2634 = fma(_1018, 11.0, _318);
                                                float _2636 = fma(_992, 11.0, _320);
                                                float3 _8147 = float3(_2636, _2634, float(as_type<int>(_1648)));
                                                float3 _8149 = select(_8147, float3(0.0), isnan(_8147));
                                                float _2638 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, _8149.xy, uint(rint(_8149.z))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, _8149.xy, uint(rint(_8149.z))).x;
                                                float _2640 = fma(_994, 11.0, _578);
                                                float _2642 = _994 * 18.0;
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
                                                    float _2666 = fma(_1018, 12.0, _318);
                                                    float _2668 = fma(_992, 12.0, _320);
                                                    float3 _8201 = float3(_2668, _2666, float(as_type<int>(_1648)));
                                                    float3 _8203 = select(_8201, float3(0.0), isnan(_8201));
                                                    float _2670 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, _8203.xy, uint(rint(_8203.z))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, _8203.xy, uint(rint(_8203.z))).x;
                                                    float _2672 = fma(_994, 12.0, _578);
                                                    float _2674 = _994 * 19.5;
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
                                                        float _2698 = fma(_1018, 13.0, _318);
                                                        float _2700 = fma(_992, 13.0, _320);
                                                        float3 _8255 = float3(_2700, _2698, float(as_type<int>(_1648)));
                                                        float3 _8257 = select(_8255, float3(0.0), isnan(_8255));
                                                        float _2702 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, _8257.xy, uint(rint(_8257.z))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, _8257.xy, uint(rint(_8257.z))).x;
                                                        float _2704 = fma(_994, 13.0, _578);
                                                        float _2706 = _994 * 21.0;
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
                                                            float _2730 = fma(_1018, 14.0, _318);
                                                            float _2732 = fma(_992, 14.0, _320);
                                                            float3 _8309 = float3(_2732, _2730, float(as_type<int>(_1648)));
                                                            float3 _8311 = select(_8309, float3(0.0), isnan(_8309));
                                                            float _2734 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, _8311.xy, uint(rint(_8311.z))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, _8311.xy, uint(rint(_8311.z))).x;
                                                            float _2736 = fma(_994, 14.0, _578);
                                                            float _2738 = _994 * 22.5;
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
                                                                float _2762 = fma(_1018, 15.0, _318);
                                                                float _2764 = fma(_992, 15.0, _320);
                                                                float3 _8363 = float3(_2764, _2762, float(as_type<int>(_1648)));
                                                                float3 _8365 = select(_8363, float3(0.0), isnan(_8363));
                                                                float _2766 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, _8365.xy, uint(rint(_8365.z))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, _8365.xy, uint(rint(_8365.z))).x;
                                                                float _2768 = fma(_994, 15.0, _578);
                                                                float _2770 = _994 * 24.0;
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
                                                                    float _2794 = fma(_1018, 16.0, _318);
                                                                    float _2796 = fma(_992, 16.0, _320);
                                                                    float3 _8417 = float3(_2796, _2794, float(as_type<int>(_1648)));
                                                                    float3 _8419 = select(_8417, float3(0.0), isnan(_8417));
                                                                    float _2798 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, _8419.xy, uint(rint(_8419.z))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, _8419.xy, uint(rint(_8419.z))).x;
                                                                    float _2800 = fma(_994, 16.0, _578);
                                                                    float _2802 = _994 * 25.5;
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
                                                                        float _2826 = fma(_1018, 17.0, _318);
                                                                        float _2828 = fma(_992, 17.0, _320);
                                                                        float3 _8471 = float3(_2828, _2826, float(as_type<int>(_1648)));
                                                                        float3 _8473 = select(_8471, float3(0.0), isnan(_8471));
                                                                        float _2830 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, _8473.xy, uint(rint(_8473.z))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, _8473.xy, uint(rint(_8473.z))).x;
                                                                        float _2832 = fma(_994, 17.0, _578);
                                                                        float _2834 = _994 * 27.0;
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
                                                                            float _2858 = fma(_1018, 18.0, _318);
                                                                            float _2860 = fma(_992, 18.0, _320);
                                                                            float3 _8525 = float3(_2860, _2858, float(as_type<int>(_1648)));
                                                                            float3 _8527 = select(_8525, float3(0.0), isnan(_8525));
                                                                            float _2862 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, _8527.xy, uint(rint(_8527.z))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, _8527.xy, uint(rint(_8527.z))).x;
                                                                            float _2864 = fma(_994, 18.0, _578);
                                                                            float _2866 = fma(_994, 28.5, -1.0);
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
                                                                                float _2890 = fma(_1018, 19.0, _318);
                                                                                float _2892 = fma(_992, 19.0, _320);
                                                                                float3 _8579 = float3(_2892, _2890, float(as_type<int>(_1648)));
                                                                                float3 _8581 = select(_8579, float3(0.0), isnan(_8579));
                                                                                float _2894 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, _8581.xy, uint(rint(_8581.z))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, _8581.xy, uint(rint(_8581.z))).x;
                                                                                float _2896 = fma(_994, 19.0, _578);
                                                                                float _2898 = fma(_994, 30.0, -1.0);
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
                    }
                }
            }
        }
    }
    if (!_2920)
    {
        float _2922 = _2292 + 1.0;
        _2312 = _2922;
    }
    _2920 = false;
    float _2924 = _2312;
    float _2926 = _1024 * 1.5;
    float _2928 = precise::max(_1658, _2926);
    float _2930 = -(*spvDescriptorSet0.fp_c3)._m0[5].w;
    float _2932 = 1.0 + _2930;
    float _2934 = precise::min(0.0, _2928);
    bool _2936 = _2934 != _1658;
    bool _2938 = isnan(_2934);
    bool _2940 = _2936 || _2938;
    bool _2942 = isnan(_1658);
    bool _2944 = _2940 || _2942;
    float _2946 = fma(_2932, (*spvDescriptorSet0.fp_c3)._m0[6].x, (*spvDescriptorSet0.fp_c3)._m0[6].z);
    float _2948 = _2946 * (*spvDescriptorSet0.fp_c3)._m0[7].x;
    bool _2950 = !_2944;
    float _2952 = _2924;
    if (!_2950)
    {
        float _2954 = _318 + _1022;
        float _2956 = _320 + _1020;
        float3 _8697 = float3(_2956, _2954, float(as_type<int>(_1648)));
        float3 _8699 = select(_8697, float3(0.0), isnan(_8697));
        float _2958 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, _8699.xy, uint(rint(_8699.z))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, _8699.xy, uint(rint(_8699.z))).x;
        float _2960 = _578 + _1024;
        float _2962 = _1024 * 3.0;
        float _2964 = -_2960;
        float _2966 = _2964 + _2958;
        float _2968 = _2966 + (*spvDescriptorSet0.fp_c3)._m0[5].x;
        float _2970 = precise::max(_2968, _2962);
        float _2972 = precise::min(0.0, _2970);
        bool _2974 = _2972 != _2968;
        bool _2976 = isnan(_2972);
        bool _2978 = _2974 || _2976;
        bool _2980 = isnan(_2968);
        bool _2982 = _2978 || _2980;
        bool _2984 = !_2982;
        if (!_2984)
        {
            float _2986 = fma(_1022, 2.0, _318);
            float _2988 = fma(_1020, 2.0, _320);
            float3 _8751 = float3(_2988, _2986, float(as_type<int>(_1648)));
            float3 _8753 = select(_8751, float3(0.0), isnan(_8751));
            float _2990 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, _8753.xy, uint(rint(_8753.z))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, _8753.xy, uint(rint(_8753.z))).x;
            float _2992 = fma(_1024, 2.0, _578);
            float _2994 = _1024 * 4.5;
            float _2996 = -_2992;
            float _2998 = _2996 + _2990;
            float _3000 = _2998 + (*spvDescriptorSet0.fp_c3)._m0[5].x;
            float _3002 = precise::max(_3000, _2994);
            float _3004 = precise::min(0.0, _3002);
            bool _3006 = _3004 != _3000;
            bool _3008 = isnan(_3004);
            bool _3010 = _3006 || _3008;
            bool _3012 = isnan(_3000);
            bool _3014 = _3010 || _3012;
            bool _3016 = !_3014;
            if (!_3016)
            {
                float _3018 = fma(_1022, 3.0, _318);
                float _3020 = fma(_1020, 3.0, _320);
                float3 _8805 = float3(_3020, _3018, float(as_type<int>(_1648)));
                float3 _8807 = select(_8805, float3(0.0), isnan(_8805));
                float _3022 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, _8807.xy, uint(rint(_8807.z))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, _8807.xy, uint(rint(_8807.z))).x;
                float _3024 = fma(_1024, 3.0, _578);
                float _3026 = _1024 * 6.0;
                float _3028 = -_3024;
                float _3030 = _3028 + _3022;
                float _3032 = _3030 + (*spvDescriptorSet0.fp_c3)._m0[5].x;
                float _3034 = precise::max(_3032, _3026);
                float _3036 = precise::min(0.0, _3034);
                bool _3038 = _3036 != _3032;
                bool _3040 = isnan(_3036);
                bool _3042 = _3038 || _3040;
                bool _3044 = isnan(_3032);
                bool _3046 = _3042 || _3044;
                bool _3048 = !_3046;
                if (!_3048)
                {
                    float _3050 = fma(_1022, 4.0, _318);
                    float _3052 = fma(_1020, 4.0, _320);
                    float3 _8859 = float3(_3052, _3050, float(as_type<int>(_1648)));
                    float3 _8861 = select(_8859, float3(0.0), isnan(_8859));
                    float _3054 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, _8861.xy, uint(rint(_8861.z))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, _8861.xy, uint(rint(_8861.z))).x;
                    float _3056 = fma(_1024, 4.0, _578);
                    float _3058 = _1024 * 7.5;
                    float _3060 = -_3056;
                    float _3062 = _3060 + _3054;
                    float _3064 = _3062 + (*spvDescriptorSet0.fp_c3)._m0[5].x;
                    float _3066 = precise::max(_3064, _3058);
                    float _3068 = precise::min(0.0, _3066);
                    bool _3070 = _3068 != _3064;
                    bool _3072 = isnan(_3068);
                    bool _3074 = _3070 || _3072;
                    bool _3076 = isnan(_3064);
                    bool _3078 = _3074 || _3076;
                    bool _3080 = !_3078;
                    if (!_3080)
                    {
                        float _3082 = fma(_1022, 5.0, _318);
                        float _3084 = fma(_1020, 5.0, _320);
                        float3 _8913 = float3(_3084, _3082, float(as_type<int>(_1648)));
                        float3 _8915 = select(_8913, float3(0.0), isnan(_8913));
                        float _3086 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, _8915.xy, uint(rint(_8915.z))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, _8915.xy, uint(rint(_8915.z))).x;
                        float _3088 = fma(_1024, 5.0, _578);
                        float _3090 = _1024 * 9.0;
                        float _3092 = -_3088;
                        float _3094 = _3092 + _3086;
                        float _3096 = _3094 + (*spvDescriptorSet0.fp_c3)._m0[5].x;
                        float _3098 = precise::max(_3096, _3090);
                        float _3100 = precise::min(0.0, _3098);
                        bool _3102 = _3100 != _3096;
                        bool _3104 = isnan(_3100);
                        bool _3106 = _3102 || _3104;
                        bool _3108 = isnan(_3096);
                        bool _3110 = _3106 || _3108;
                        bool _3112 = !_3110;
                        if (!_3112)
                        {
                            float _3114 = fma(_1022, 6.0, _318);
                            float _3116 = fma(_1020, 6.0, _320);
                            float3 _8967 = float3(_3116, _3114, float(as_type<int>(_1648)));
                            float3 _8969 = select(_8967, float3(0.0), isnan(_8967));
                            float _3118 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, _8969.xy, uint(rint(_8969.z))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, _8969.xy, uint(rint(_8969.z))).x;
                            float _3120 = fma(_1024, 6.0, _578);
                            float _3122 = _1024 * 10.5;
                            float _3124 = -_3120;
                            float _3126 = _3124 + _3118;
                            float _3128 = _3126 + (*spvDescriptorSet0.fp_c3)._m0[5].x;
                            float _3130 = precise::max(_3128, _3122);
                            float _3132 = precise::min(0.0, _3130);
                            bool _3134 = _3132 != _3128;
                            bool _3136 = isnan(_3132);
                            bool _3138 = _3134 || _3136;
                            bool _3140 = isnan(_3128);
                            bool _3142 = _3138 || _3140;
                            bool _3144 = !_3142;
                            if (!_3144)
                            {
                                float _3146 = fma(_1022, 7.0, _318);
                                float _3148 = fma(_1020, 7.0, _320);
                                float3 _9021 = float3(_3148, _3146, float(as_type<int>(_1648)));
                                float3 _9023 = select(_9021, float3(0.0), isnan(_9021));
                                float _3150 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, _9023.xy, uint(rint(_9023.z))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, _9023.xy, uint(rint(_9023.z))).x;
                                float _3152 = fma(_1024, 7.0, _578);
                                float _3154 = _1024 * 12.0;
                                float _3156 = -_3152;
                                float _3158 = _3156 + _3150;
                                float _3160 = _3158 + (*spvDescriptorSet0.fp_c3)._m0[5].x;
                                float _3162 = precise::max(_3160, _3154);
                                float _3164 = precise::min(0.0, _3162);
                                bool _3166 = _3164 != _3160;
                                bool _3168 = isnan(_3164);
                                bool _3170 = _3166 || _3168;
                                bool _3172 = isnan(_3160);
                                bool _3174 = _3170 || _3172;
                                bool _3176 = !_3174;
                                if (!_3176)
                                {
                                    float _3178 = fma(_1022, 8.0, _318);
                                    float _3180 = fma(_1020, 8.0, _320);
                                    float3 _9075 = float3(_3180, _3178, float(as_type<int>(_1648)));
                                    float3 _9077 = select(_9075, float3(0.0), isnan(_9075));
                                    float _3182 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, _9077.xy, uint(rint(_9077.z))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, _9077.xy, uint(rint(_9077.z))).x;
                                    float _3184 = fma(_1024, 8.0, _578);
                                    float _3186 = _1024 * 13.5;
                                    float _3188 = -_3184;
                                    float _3190 = _3188 + _3182;
                                    float _3192 = _3190 + (*spvDescriptorSet0.fp_c3)._m0[5].x;
                                    float _3194 = precise::max(_3192, _3186);
                                    float _3196 = precise::min(0.0, _3194);
                                    bool _3198 = _3196 != _3192;
                                    bool _3200 = isnan(_3196);
                                    bool _3202 = _3198 || _3200;
                                    bool _3204 = isnan(_3192);
                                    bool _3206 = _3202 || _3204;
                                    bool _3208 = !_3206;
                                    if (!_3208)
                                    {
                                        float _3210 = fma(_1022, 9.0, _318);
                                        float _3212 = fma(_1020, 9.0, _320);
                                        float3 _9129 = float3(_3212, _3210, float(as_type<int>(_1648)));
                                        float3 _9131 = select(_9129, float3(0.0), isnan(_9129));
                                        float _3214 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, _9131.xy, uint(rint(_9131.z))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, _9131.xy, uint(rint(_9131.z))).x;
                                        float _3216 = fma(_1024, 9.0, _578);
                                        float _3218 = _1024 * 15.0;
                                        float _3220 = -_3216;
                                        float _3222 = _3220 + _3214;
                                        float _3224 = _3222 + (*spvDescriptorSet0.fp_c3)._m0[5].x;
                                        float _3226 = precise::max(_3224, _3218);
                                        float _3228 = precise::min(0.0, _3226);
                                        bool _3230 = _3228 != _3224;
                                        bool _3232 = isnan(_3228);
                                        bool _3234 = _3230 || _3232;
                                        bool _3236 = isnan(_3224);
                                        bool _3238 = _3234 || _3236;
                                        bool _3240 = !_3238;
                                        if (!_3240)
                                        {
                                            float _3242 = fma(_1022, 10.0, _318);
                                            float _3244 = fma(_1020, 10.0, _320);
                                            float3 _9183 = float3(_3244, _3242, float(as_type<int>(_1648)));
                                            float3 _9185 = select(_9183, float3(0.0), isnan(_9183));
                                            float _3246 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, _9185.xy, uint(rint(_9185.z))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, _9185.xy, uint(rint(_9185.z))).x;
                                            float _3248 = fma(_1024, 10.0, _578);
                                            float _3250 = _1024 * 16.5;
                                            float _3252 = -_3248;
                                            float _3254 = _3252 + _3246;
                                            float _3256 = _3254 + (*spvDescriptorSet0.fp_c3)._m0[5].x;
                                            float _3258 = precise::max(_3256, _3250);
                                            float _3260 = precise::min(0.0, _3258);
                                            bool _3262 = _3260 != _3256;
                                            bool _3264 = isnan(_3260);
                                            bool _3266 = _3262 || _3264;
                                            bool _3268 = isnan(_3256);
                                            bool _3270 = _3266 || _3268;
                                            bool _3272 = !_3270;
                                            if (!_3272)
                                            {
                                                float _3274 = fma(_1022, 11.0, _318);
                                                float _3276 = fma(_1020, 11.0, _320);
                                                float3 _9237 = float3(_3276, _3274, float(as_type<int>(_1648)));
                                                float3 _9239 = select(_9237, float3(0.0), isnan(_9237));
                                                float _3278 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, _9239.xy, uint(rint(_9239.z))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, _9239.xy, uint(rint(_9239.z))).x;
                                                float _3280 = fma(_1024, 11.0, _578);
                                                float _3282 = _1024 * 18.0;
                                                float _3284 = -_3280;
                                                float _3286 = _3284 + _3278;
                                                float _3288 = _3286 + (*spvDescriptorSet0.fp_c3)._m0[5].x;
                                                float _3290 = precise::max(_3288, _3282);
                                                float _3292 = precise::min(0.0, _3290);
                                                bool _3294 = _3292 != _3288;
                                                bool _3296 = isnan(_3292);
                                                bool _3298 = _3294 || _3296;
                                                bool _3300 = isnan(_3288);
                                                bool _3302 = _3298 || _3300;
                                                bool _3304 = !_3302;
                                                if (!_3304)
                                                {
                                                    float _3306 = fma(_1022, 12.0, _318);
                                                    float _3308 = fma(_1020, 12.0, _320);
                                                    float3 _9291 = float3(_3308, _3306, float(as_type<int>(_1648)));
                                                    float3 _9293 = select(_9291, float3(0.0), isnan(_9291));
                                                    float _3310 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, _9293.xy, uint(rint(_9293.z))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, _9293.xy, uint(rint(_9293.z))).x;
                                                    float _3312 = fma(_1024, 12.0, _578);
                                                    float _3314 = _1024 * 19.5;
                                                    float _3316 = -_3312;
                                                    float _3318 = _3316 + _3310;
                                                    float _3320 = _3318 + (*spvDescriptorSet0.fp_c3)._m0[5].x;
                                                    float _3322 = precise::max(_3320, _3314);
                                                    float _3324 = precise::min(0.0, _3322);
                                                    bool _3326 = _3324 != _3320;
                                                    bool _3328 = isnan(_3324);
                                                    bool _3330 = _3326 || _3328;
                                                    bool _3332 = isnan(_3320);
                                                    bool _3334 = _3330 || _3332;
                                                    bool _3336 = !_3334;
                                                    if (!_3336)
                                                    {
                                                        float _3338 = fma(_1022, 13.0, _318);
                                                        float _3340 = fma(_1020, 13.0, _320);
                                                        float3 _9345 = float3(_3340, _3338, float(as_type<int>(_1648)));
                                                        float3 _9347 = select(_9345, float3(0.0), isnan(_9345));
                                                        float _3342 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, _9347.xy, uint(rint(_9347.z))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, _9347.xy, uint(rint(_9347.z))).x;
                                                        float _3344 = fma(_1024, 13.0, _578);
                                                        float _3346 = _1024 * 21.0;
                                                        float _3348 = -_3344;
                                                        float _3350 = _3348 + _3342;
                                                        float _3352 = _3350 + (*spvDescriptorSet0.fp_c3)._m0[5].x;
                                                        float _3354 = precise::max(_3352, _3346);
                                                        float _3356 = precise::min(0.0, _3354);
                                                        bool _3358 = _3356 != _3352;
                                                        bool _3360 = isnan(_3356);
                                                        bool _3362 = _3358 || _3360;
                                                        bool _3364 = isnan(_3352);
                                                        bool _3366 = _3362 || _3364;
                                                        bool _3368 = !_3366;
                                                        if (!_3368)
                                                        {
                                                            float _3370 = fma(_1022, 14.0, _318);
                                                            float _3372 = fma(_1020, 14.0, _320);
                                                            float3 _9399 = float3(_3372, _3370, float(as_type<int>(_1648)));
                                                            float3 _9401 = select(_9399, float3(0.0), isnan(_9399));
                                                            float _3374 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, _9401.xy, uint(rint(_9401.z))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, _9401.xy, uint(rint(_9401.z))).x;
                                                            float _3376 = fma(_1024, 14.0, _578);
                                                            float _3378 = _1024 * 22.5;
                                                            float _3380 = -_3376;
                                                            float _3382 = _3380 + _3374;
                                                            float _3384 = _3382 + (*spvDescriptorSet0.fp_c3)._m0[5].x;
                                                            float _3386 = precise::max(_3384, _3378);
                                                            float _3388 = precise::min(0.0, _3386);
                                                            bool _3390 = _3388 != _3384;
                                                            bool _3392 = isnan(_3388);
                                                            bool _3394 = _3390 || _3392;
                                                            bool _3396 = isnan(_3384);
                                                            bool _3398 = _3394 || _3396;
                                                            bool _3400 = !_3398;
                                                            if (!_3400)
                                                            {
                                                                float _3402 = fma(_1022, 15.0, _318);
                                                                float _3404 = fma(_1020, 15.0, _320);
                                                                float3 _9453 = float3(_3404, _3402, float(as_type<int>(_1648)));
                                                                float3 _9455 = select(_9453, float3(0.0), isnan(_9453));
                                                                float _3406 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, _9455.xy, uint(rint(_9455.z))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, _9455.xy, uint(rint(_9455.z))).x;
                                                                float _3408 = fma(_1024, 15.0, _578);
                                                                float _3410 = _1024 * 24.0;
                                                                float _3412 = -_3408;
                                                                float _3414 = _3412 + _3406;
                                                                float _3416 = _3414 + (*spvDescriptorSet0.fp_c3)._m0[5].x;
                                                                float _3418 = precise::max(_3416, _3410);
                                                                float _3420 = precise::min(0.0, _3418);
                                                                bool _3422 = _3420 != _3416;
                                                                bool _3424 = isnan(_3420);
                                                                bool _3426 = _3422 || _3424;
                                                                bool _3428 = isnan(_3416);
                                                                bool _3430 = _3426 || _3428;
                                                                bool _3432 = !_3430;
                                                                if (!_3432)
                                                                {
                                                                    float _3434 = fma(_1022, 16.0, _318);
                                                                    float _3436 = fma(_1020, 16.0, _320);
                                                                    float3 _9507 = float3(_3436, _3434, float(as_type<int>(_1648)));
                                                                    float3 _9509 = select(_9507, float3(0.0), isnan(_9507));
                                                                    float _3438 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, _9509.xy, uint(rint(_9509.z))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, _9509.xy, uint(rint(_9509.z))).x;
                                                                    float _3440 = fma(_1024, 16.0, _578);
                                                                    float _3442 = _1024 * 25.5;
                                                                    float _3444 = -_3440;
                                                                    float _3446 = _3444 + _3438;
                                                                    float _3448 = _3446 + (*spvDescriptorSet0.fp_c3)._m0[5].x;
                                                                    float _3450 = precise::max(_3448, _3442);
                                                                    float _3452 = precise::min(0.0, _3450);
                                                                    bool _3454 = _3452 != _3448;
                                                                    bool _3456 = isnan(_3452);
                                                                    bool _3458 = _3454 || _3456;
                                                                    bool _3460 = isnan(_3448);
                                                                    bool _3462 = _3458 || _3460;
                                                                    bool _3464 = !_3462;
                                                                    if (!_3464)
                                                                    {
                                                                        float _3466 = fma(_1022, 17.0, _318);
                                                                        float _3468 = fma(_1020, 17.0, _320);
                                                                        float3 _9561 = float3(_3468, _3466, float(as_type<int>(_1648)));
                                                                        float3 _9563 = select(_9561, float3(0.0), isnan(_9561));
                                                                        float _3470 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, _9563.xy, uint(rint(_9563.z))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, _9563.xy, uint(rint(_9563.z))).x;
                                                                        float _3472 = fma(_1024, 17.0, _578);
                                                                        float _3474 = _1024 * 27.0;
                                                                        float _3476 = -_3472;
                                                                        float _3478 = _3476 + _3470;
                                                                        float _3480 = _3478 + (*spvDescriptorSet0.fp_c3)._m0[5].x;
                                                                        float _3482 = precise::max(_3480, _3474);
                                                                        float _3484 = precise::min(0.0, _3482);
                                                                        bool _3486 = _3484 != _3480;
                                                                        bool _3488 = isnan(_3484);
                                                                        bool _3490 = _3486 || _3488;
                                                                        bool _3492 = isnan(_3480);
                                                                        bool _3494 = _3490 || _3492;
                                                                        bool _3496 = !_3494;
                                                                        if (!_3496)
                                                                        {
                                                                            float _3498 = fma(_1022, 18.0, _318);
                                                                            float _3500 = fma(_1020, 18.0, _320);
                                                                            float3 _9615 = float3(_3500, _3498, float(as_type<int>(_1648)));
                                                                            float3 _9617 = select(_9615, float3(0.0), isnan(_9615));
                                                                            float _3502 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, _9617.xy, uint(rint(_9617.z))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, _9617.xy, uint(rint(_9617.z))).x;
                                                                            float _3504 = fma(_1024, 18.0, _578);
                                                                            float _3506 = fma(_1024, 28.5, -1.0);
                                                                            float _3508 = -_3504;
                                                                            float _3510 = _3508 + _3502;
                                                                            float _3512 = _3510 + (*spvDescriptorSet0.fp_c3)._m0[5].x;
                                                                            float _3514 = precise::max(_3512, _3506);
                                                                            float _3516 = precise::min(0.0, _3514);
                                                                            bool _3518 = _3516 != _3512;
                                                                            bool _3520 = isnan(_3516);
                                                                            bool _3522 = _3518 || _3520;
                                                                            bool _3524 = isnan(_3512);
                                                                            bool _3526 = _3522 || _3524;
                                                                            bool _3528 = !_3526;
                                                                            if (!_3528)
                                                                            {
                                                                                float _3530 = fma(_1022, 19.0, _318);
                                                                                float _3532 = fma(_1020, 19.0, _320);
                                                                                float3 _9669 = float3(_3532, _3530, float(as_type<int>(_1648)));
                                                                                float3 _9671 = select(_9669, float3(0.0), isnan(_9669));
                                                                                float _3534 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, _9671.xy, uint(rint(_9671.z))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, _9671.xy, uint(rint(_9671.z))).x;
                                                                                float _3536 = fma(_1024, 19.0, _578);
                                                                                float _3538 = fma(_1024, 30.0, -1.0);
                                                                                float _3540 = -_3536;
                                                                                float _3542 = _3540 + _3534;
                                                                                float _3544 = _3542 + (*spvDescriptorSet0.fp_c3)._m0[5].x;
                                                                                float _3546 = precise::max(_3544, _3538);
                                                                                float _3548 = precise::min(0.0, _3546);
                                                                                bool _3550 = _3548 != _3544;
                                                                                bool _3552 = isnan(_3548);
                                                                                bool _3554 = _3550 || _3552;
                                                                                bool _3556 = isnan(_3544);
                                                                                bool _3558 = _3554 || _3556;
                                                                                _3560 = _3558;
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
                    }
                }
            }
        }
    }
    if (!_3560)
    {
        float _3562 = _2924 + 1.0;
        _2952 = _3562;
    }
    _3560 = false;
    float _3564 = _2952;
    float _3566 = _3564 * 0.25;
    float _3568 = -_3566;
    float _3570 = fma(_3568, _2948, 1.0);
    out.m_39.x = _3570;
    return out;
}

