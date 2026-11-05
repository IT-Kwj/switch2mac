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
    bool _1404 = false;
    bool _1072 = false;
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
    float2 _1449 = float2(_62, _64);
    float _66 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_1449, float2(0.0), isnan(_1449))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_1449, float2(0.0), isnan(_1449))).x;
    float _68 = fma(_66, (*spvDescriptorSet0.fp_c3)._m0[0].w, (*spvDescriptorSet0.fp_c3)._m0[0].z);
    float _70 = _68 * (*spvDescriptorSet0.fp_c3)._m0[1].y;
    float _72 = fma(_64, 2.0, -1.0);
    float _74 = fma(_62, 2.0, -1.0);
    bool _78 = _70 > (*spvDescriptorSet0.fp_c4)._m0[33].y;
    float _80 = _72 * (*spvDescriptorSet0.fp_c3)._m0[0].y;
    bool _82 = _70 > (*spvDescriptorSet0.fp_c4)._m0[33].x;
    float _84 = _74 * (*spvDescriptorSet0.fp_c3)._m0[0].x;
    bool _86 = _70 > (*spvDescriptorSet0.fp_c4)._m0[33].z;
    float _88 = _68 * _80;
    bool _90 = !_78;
    int _93 = _90 ? 0 : 1;
    float _95 = _68 * _84;
    float _97 = -(*spvDescriptorSet0.fp_c3)._m0[3].y;
    float _99 = _88 * _97;
    float _101 = -(*spvDescriptorSet0.fp_c3)._m0[2].y;
    float _103 = _88 * _101;
    int _105 = 2;
    if (!_78)
    {
        _105 = 1;
    }
    int _107 = _105;
    float _109 = fma(_95, (*spvDescriptorSet0.fp_c3)._m0[3].x, _99);
    int _111 = _107;
    if (!_82)
    {
        _111 = _93;
    }
    int _113 = _111;
    float _115 = -_70;
    float _117 = fma(_115, (*spvDescriptorSet0.fp_c3)._m0[3].z, _109);
    int _119 = _113 + 1;
    int _121 = _119;
    if (!_86)
    {
        _121 = _113;
    }
    int _123 = _121;
    float _125 = -(*spvDescriptorSet0.fp_c3)._m0[4].y;
    float _127 = _88 * _125;
    float _129 = fma(_95, (*spvDescriptorSet0.fp_c3)._m0[2].x, _103);
    float _131 = _117 + (*spvDescriptorSet0.fp_c3)._m0[3].w;
    bool _133 = _123 != 1;
    float _135 = fma(_95, (*spvDescriptorSet0.fp_c3)._m0[4].x, _127);
    bool _137 = _123 != 0;
    float _139 = -_70;
    float _141 = fma(_139, (*spvDescriptorSet0.fp_c3)._m0[2].z, _129);
    bool _143 = !_133;
    int _145 = _143 ? as_type<int>((*spvDescriptorSet0.fp_c4)._m0[28].y) : as_type<int>((*spvDescriptorSet0.fp_c4)._m0[32].y);
    float _147 = -_70;
    float _149 = fma(_147, (*spvDescriptorSet0.fp_c3)._m0[4].z, _135);
    bool _151 = !_133;
    int _153 = _151 ? as_type<int>((*spvDescriptorSet0.fp_c4)._m0[28].x) : as_type<int>((*spvDescriptorSet0.fp_c4)._m0[32].x);
    float _155 = _141 + (*spvDescriptorSet0.fp_c3)._m0[2].w;
    float _157 = _137 ? as_type<float>(_145) : (*spvDescriptorSet0.fp_c4)._m0[24].y;
    float _159 = _149 + (*spvDescriptorSet0.fp_c3)._m0[4].w;
    float _161 = _137 ? as_type<float>(_153) : (*spvDescriptorSet0.fp_c4)._m0[24].x;
    float _163 = _131 * _157;
    float _165 = fma(_155, _161, _163);
    bool _167 = !_133;
    int _169 = _167 ? as_type<int>((*spvDescriptorSet0.fp_c4)._m0[25].y) : as_type<int>((*spvDescriptorSet0.fp_c4)._m0[29].y);
    bool _171 = !_133;
    int _173 = _171 ? as_type<int>((*spvDescriptorSet0.fp_c4)._m0[26].y) : as_type<int>((*spvDescriptorSet0.fp_c4)._m0[30].y);
    bool _175 = !_133;
    int _177 = _175 ? as_type<int>((*spvDescriptorSet0.fp_c4)._m0[28].z) : as_type<int>((*spvDescriptorSet0.fp_c4)._m0[32].z);
    bool _179 = !_133;
    int _181 = _179 ? as_type<int>((*spvDescriptorSet0.fp_c4)._m0[25].x) : as_type<int>((*spvDescriptorSet0.fp_c4)._m0[29].x);
    float _183 = _137 ? as_type<float>(_169) : (*spvDescriptorSet0.fp_c4)._m0[21].y;
    bool _185 = !_133;
    int _187 = _185 ? as_type<int>((*spvDescriptorSet0.fp_c4)._m0[26].x) : as_type<int>((*spvDescriptorSet0.fp_c4)._m0[30].x);
    float _189 = _137 ? as_type<float>(_173) : (*spvDescriptorSet0.fp_c4)._m0[22].y;
    float _191 = _131 * _183;
    bool _193 = !_133;
    int _195 = _193 ? as_type<int>((*spvDescriptorSet0.fp_c4)._m0[28].w) : as_type<int>((*spvDescriptorSet0.fp_c4)._m0[32].w);
    float _197 = _137 ? as_type<float>(_177) : (*spvDescriptorSet0.fp_c4)._m0[24].z;
    float _199 = _137 ? as_type<float>(_181) : (*spvDescriptorSet0.fp_c4)._m0[21].x;
    float _201 = _131 * _189;
    float _203 = _137 ? as_type<float>(_187) : (*spvDescriptorSet0.fp_c4)._m0[22].x;
    float _205 = fma(_159, _197, _165);
    float _207 = _137 ? as_type<float>(_195) : (*spvDescriptorSet0.fp_c4)._m0[24].w;
    float _209 = fma(_155, _199, _191);
    float _211 = fma(_155, _203, _201);
    float _213 = _207 + _205;
    bool _215 = !_133;
    int _217 = _215 ? as_type<int>((*spvDescriptorSet0.fp_c4)._m0[26].z) : as_type<int>((*spvDescriptorSet0.fp_c4)._m0[30].z);
    float _219 = 1.0 / _213;
    bool _221 = !_133;
    int _223 = _221 ? as_type<int>((*spvDescriptorSet0.fp_c4)._m0[25].z) : as_type<int>((*spvDescriptorSet0.fp_c4)._m0[29].z);
    float _225 = float(_123);
    float _227 = _137 ? as_type<float>(_217) : (*spvDescriptorSet0.fp_c4)._m0[22].z;
    bool _229 = !_133;
    int _231 = _229 ? as_type<int>((*spvDescriptorSet0.fp_c4)._m0[25].w) : as_type<int>((*spvDescriptorSet0.fp_c4)._m0[29].w);
    bool _233 = !_133;
    int _235 = _233 ? as_type<int>((*spvDescriptorSet0.fp_c4)._m0[26].w) : as_type<int>((*spvDescriptorSet0.fp_c4)._m0[30].w);
    float _237 = fma(_159, _227, _211);
    float _239 = _137 ? as_type<float>(_223) : (*spvDescriptorSet0.fp_c4)._m0[21].z;
    float _241 = rint(_225);
    float _243 = precise::max(_241, 0.0);
    uint _246 = uint(_243);
    uint _248 = clamp(_246, 0u, 65535u);
    float _250 = _137 ? as_type<float>(_235) : (*spvDescriptorSet0.fp_c4)._m0[22].w;
    float _252 = _137 ? as_type<float>(_231) : (*spvDescriptorSet0.fp_c4)._m0[21].w;
    float _254 = fma(_159, _239, _209);
    float _256 = _250 + _237;
    float _258 = _252 + _254;
    float _260 = _256 * _219;
    float _262 = _258 * _219;
    float3 _1869 = float3(_262, _260, float(int(_248)));
    float3 _1873 = select(_1869, float3(0.0), isnan(_1869));
    float _264 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, _1873.xy, uint(rint(_1873.z))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, _1873.xy, uint(rint(_1873.z))).x;
    float _266 = _131 * 78.233001708984375;
    float _268 = rint(_225);
    float _270 = precise::max(_268, 0.0);
    uint _272 = uint(_270);
    float _274 = fma(_159, 12.98980045318603515625, _266);
    float _276 = fma(_155, 12.98980045318603515625, _266);
    float _278 = fma(_155, 45.16400146484375, _274);
    float _280 = fma(_159, 45.16400146484375, _276);
    bool _282 = !_133;
    int _284 = _282 ? as_type<int>((*spvDescriptorSet0.fp_c4)._m0[5].y) : as_type<int>((*spvDescriptorSet0.fp_c4)._m0[8].y);
    float _286 = _278 + 94.67299652099609375;
    float _288 = _137 ? as_type<float>(_284) : (*spvDescriptorSet0.fp_c4)._m0[2].y;
    float _290 = _286 * 0.15915493667125701904296875;
    float _292 = _278 + 189.3459930419921875;
    float _294 = _290 * 6.283185482025146484375;
    float _296 = sin(_294);
    float _298 = _292 * 0.15915493667125701904296875;
    float _300 = _280 + 94.67299652099609375;
    bool _302 = !_133;
    int _304 = _302 ? as_type<int>((*spvDescriptorSet0.fp_c4)._m0[27].x) : as_type<int>((*spvDescriptorSet0.fp_c4)._m0[31].x);
    bool _306 = !_133;
    int _308 = _306 ? as_type<int>((*spvDescriptorSet0.fp_c4)._m0[27].z) : as_type<int>((*spvDescriptorSet0.fp_c4)._m0[31].z);
    float _310 = _300 * 0.15915493667125701904296875;
    float _312 = _280 + 189.3459930419921875;
    float _314 = _298 * 6.283185482025146484375;
    float _316 = sin(_314);
    float _318 = -(*spvDescriptorSet0.fp_c3)._m0[5].w;
    float _320 = _318 + 1.0;
    float _322 = _312 * 0.15915493667125701904296875;
    float _324 = fma(_320, (*spvDescriptorSet0.fp_c3)._m0[6].y, (*spvDescriptorSet0.fp_c3)._m0[6].w);
    float _326 = _310 * 6.283185482025146484375;
    float _328 = sin(_326);
    bool _330 = !_133;
    int _332 = _330 ? as_type<int>((*spvDescriptorSet0.fp_c4)._m0[27].y) : as_type<int>((*spvDescriptorSet0.fp_c4)._m0[31].y);
    float _334 = _296 * 43758.546875;
    bool _336 = !_133;
    int _338 = _336 ? as_type<int>((*spvDescriptorSet0.fp_c4)._m0[3].y) : as_type<int>((*spvDescriptorSet0.fp_c4)._m0[6].y);
    bool _340 = !_133;
    int _342 = _340 ? as_type<int>((*spvDescriptorSet0.fp_c4)._m0[4].y) : as_type<int>((*spvDescriptorSet0.fp_c4)._m0[7].y);
    float _344 = _137 ? as_type<float>(_332) : (*spvDescriptorSet0.fp_c4)._m0[23].y;
    float _346 = _322 * 6.283185482025146484375;
    float _348 = sin(_346);
    float _350 = _316 * 43758.546875;
    float _352 = _137 ? as_type<float>(_342) : (*spvDescriptorSet0.fp_c4)._m0[1].y;
    float _354 = _131 * _344;
    float _356 = _131 * _352;
    float _358 = _328 * 43758.546875;
    float _360 = _137 ? as_type<float>(_338) : (*spvDescriptorSet0.fp_c4)._m0[0].y;
    float _362 = floor(_334);
    bool _364 = !_133;
    int _366 = _364 ? as_type<int>((*spvDescriptorSet0.fp_c4)._m0[5].x) : as_type<int>((*spvDescriptorSet0.fp_c4)._m0[8].x);
    float _368 = _137 ? as_type<float>(_304) : (*spvDescriptorSet0.fp_c4)._m0[23].x;
    float _370 = _131 * _360;
    float _372 = _348 * 43758.546875;
    float _374 = _131 * _288;
    float _376 = floor(_358);
    bool _378 = !_133;
    int _380 = _378 ? as_type<int>((*spvDescriptorSet0.fp_c4)._m0[3].x) : as_type<int>((*spvDescriptorSet0.fp_c4)._m0[6].x);
    float _382 = fma(_155, _368, _354);
    float _384 = _137 ? as_type<float>(_380) : (*spvDescriptorSet0.fp_c4)._m0[0].x;
    bool _386 = !_133;
    int _388 = _386 ? as_type<int>((*spvDescriptorSet0.fp_c4)._m0[4].x) : as_type<int>((*spvDescriptorSet0.fp_c4)._m0[7].x);
    float _390 = floor(_350);
    float _392 = -_362;
    float _394 = _334 + _392;
    float _396 = fma(_155, _384, _370);
    float _398 = _137 ? as_type<float>(_388) : (*spvDescriptorSet0.fp_c4)._m0[1].x;
    float _400 = _137 ? as_type<float>(_366) : (*spvDescriptorSet0.fp_c4)._m0[2].x;
    float _402 = floor(_372);
    float _404 = -_376;
    float _406 = _358 + _404;
    float _408 = fma(_155, _398, _356);
    float _410 = fma(_155, _400, _374);
    float _412 = _137 ? as_type<float>(_308) : (*spvDescriptorSet0.fp_c4)._m0[23].z;
    float _414 = -_390;
    float _416 = _350 + _414;
    float _418 = _324 * (*spvDescriptorSet0.fp_c3)._m0[5].z;
    float _420 = fma(_406, 2.0, -1.0);
    bool _422 = !_133;
    int _424 = _422 ? as_type<int>((*spvDescriptorSet0.fp_c4)._m0[3].z) : as_type<int>((*spvDescriptorSet0.fp_c4)._m0[6].z);
    float _426 = fma(_159, _412, _382);
    bool _428 = !_133;
    int _430 = _428 ? as_type<int>((*spvDescriptorSet0.fp_c4)._m0[4].z) : as_type<int>((*spvDescriptorSet0.fp_c4)._m0[7].z);
    float _432 = fma(_394, 2.0, -1.0);
    float _434 = _418 * _420;
    float _436 = -_402;
    float _438 = _372 + _436;
    float _440 = _137 ? as_type<float>(_424) : (*spvDescriptorSet0.fp_c4)._m0[0].z;
    float _442 = _418 * _432;
    float _444 = fma(_416, 2.0, -1.0);
    float _446 = fma(_438, 2.0, -1.0);
    float _448 = _137 ? as_type<float>(_430) : (*spvDescriptorSet0.fp_c4)._m0[1].z;
    float _450 = fma(_159, _440, _396);
    float _452 = _418 * _444;
    float _454 = _418 * _446;
    float _456 = _434 * _434;
    float _458 = fma(_159, _448, _408);
    float _460 = _454 * _454;
    float _462 = fma(_442, _442, _456);
    float _464 = fma(_452, _452, _460);
    float _466 = _462 + 1.0;
    float _468 = _464 + 1.0;
    bool _470 = !_133;
    int _472 = _470 ? as_type<int>((*spvDescriptorSet0.fp_c4)._m0[5].z) : as_type<int>((*spvDescriptorSet0.fp_c4)._m0[8].z);
    float _474 = rsqrt(_466);
    bool _476 = !_133;
    int _478 = _476 ? as_type<int>((*spvDescriptorSet0.fp_c4)._m0[3].w) : as_type<int>((*spvDescriptorSet0.fp_c4)._m0[6].w);
    bool _480 = !_133;
    int _482 = _480 ? as_type<int>((*spvDescriptorSet0.fp_c4)._m0[4].w) : as_type<int>((*spvDescriptorSet0.fp_c4)._m0[7].w);
    bool _484 = !_133;
    int _486 = _484 ? as_type<int>((*spvDescriptorSet0.fp_c4)._m0[5].w) : as_type<int>((*spvDescriptorSet0.fp_c4)._m0[8].w);
    float _488 = rsqrt(_468);
    float _490 = _137 ? as_type<float>(_472) : (*spvDescriptorSet0.fp_c4)._m0[2].z;
    bool _492 = !_133;
    int _494 = _492 ? as_type<int>((*spvDescriptorSet0.fp_c4)._m0[27].w) : as_type<int>((*spvDescriptorSet0.fp_c4)._m0[31].w);
    float _496 = _137 ? as_type<float>(_478) : (*spvDescriptorSet0.fp_c4)._m0[0].w;
    float _498 = fma(_159, _490, _410);
    float _500 = _137 ? as_type<float>(_482) : (*spvDescriptorSet0.fp_c4)._m0[1].w;
    float _502 = _137 ? as_type<float>(_486) : (*spvDescriptorSet0.fp_c4)._m0[2].w;
    float _504 = _496 + _450;
    float _506 = _137 ? as_type<float>(_494) : (*spvDescriptorSet0.fp_c4)._m0[23].w;
    float _508 = _500 + _458;
    float _510 = _502 + _498;
    float _512 = fma(_442, _474, _504);
    float _514 = _506 + _426;
    float _516 = fma(_434, _474, _508);
    float _518 = fma(_454, _488, _508);
    float _520 = -_474;
    float _522 = _510 + _520;
    float _524 = _514 * _219;
    float _526 = -_488;
    float _528 = _510 + _526;
    float _530 = fma(_452, _488, _504);
    bool _532 = !_133;
    int _534 = _532 ? as_type<int>((*spvDescriptorSet0.fp_c4)._m0[13].y) : as_type<int>((*spvDescriptorSet0.fp_c4)._m0[17].y);
    bool _536 = !_133;
    int _538 = _536 ? as_type<int>((*spvDescriptorSet0.fp_c4)._m0[14].y) : as_type<int>((*spvDescriptorSet0.fp_c4)._m0[18].y);
    bool _540 = !_133;
    int _542 = _540 ? as_type<int>((*spvDescriptorSet0.fp_c4)._m0[15].y) : as_type<int>((*spvDescriptorSet0.fp_c4)._m0[19].y);
    bool _544 = !_133;
    int _546 = _544 ? as_type<int>((*spvDescriptorSet0.fp_c4)._m0[16].y) : as_type<int>((*spvDescriptorSet0.fp_c4)._m0[20].y);
    float _548 = _137 ? as_type<float>(_534) : (*spvDescriptorSet0.fp_c4)._m0[9].y;
    float _550 = _137 ? as_type<float>(_538) : (*spvDescriptorSet0.fp_c4)._m0[10].y;
    float _552 = _137 ? as_type<float>(_542) : (*spvDescriptorSet0.fp_c4)._m0[11].y;
    float _554 = _548 * _516;
    float _556 = _137 ? as_type<float>(_546) : (*spvDescriptorSet0.fp_c4)._m0[12].y;
    float _558 = _550 * _516;
    bool _560 = !_133;
    int _562 = _560 ? as_type<int>((*spvDescriptorSet0.fp_c4)._m0[13].x) : as_type<int>((*spvDescriptorSet0.fp_c4)._m0[17].x);
    float _564 = _552 * _516;
    float _566 = _556 * _516;
    bool _568 = !_133;
    int _570 = _568 ? as_type<int>((*spvDescriptorSet0.fp_c4)._m0[14].x) : as_type<int>((*spvDescriptorSet0.fp_c4)._m0[18].x);
    float _572 = _548 * _518;
    bool _574 = !_133;
    int _576 = _574 ? as_type<int>((*spvDescriptorSet0.fp_c4)._m0[15].x) : as_type<int>((*spvDescriptorSet0.fp_c4)._m0[19].x);
    float _578 = _550 * _518;
    float _580 = _137 ? as_type<float>(_562) : (*spvDescriptorSet0.fp_c4)._m0[9].x;
    float _582 = _552 * _518;
    bool _584 = !_133;
    int _586 = _584 ? as_type<int>((*spvDescriptorSet0.fp_c4)._m0[16].x) : as_type<int>((*spvDescriptorSet0.fp_c4)._m0[20].x);
    float _588 = _556 * _518;
    float _590 = _137 ? as_type<float>(_570) : (*spvDescriptorSet0.fp_c4)._m0[10].x;
    float _592 = fma(_580, _512, _554);
    float _594 = _137 ? as_type<float>(_576) : (*spvDescriptorSet0.fp_c4)._m0[11].x;
    float _596 = fma(_580, _530, _572);
    float _598 = _137 ? as_type<float>(_586) : (*spvDescriptorSet0.fp_c4)._m0[12].x;
    float _600 = fma(_590, _512, _558);
    float _602 = fma(_590, _530, _578);
    float _604 = fma(_594, _512, _564);
    float _606 = fma(_594, _530, _582);
    float _608 = fma(_598, _512, _566);
    float _610 = fma(_598, _530, _588);
    bool _612 = !_133;
    int _614 = _612 ? as_type<int>((*spvDescriptorSet0.fp_c4)._m0[13].z) : as_type<int>((*spvDescriptorSet0.fp_c4)._m0[17].z);
    bool _616 = !_133;
    int _618 = _616 ? as_type<int>((*spvDescriptorSet0.fp_c4)._m0[14].z) : as_type<int>((*spvDescriptorSet0.fp_c4)._m0[18].z);
    bool _620 = !_133;
    int _622 = _620 ? as_type<int>((*spvDescriptorSet0.fp_c4)._m0[16].z) : as_type<int>((*spvDescriptorSet0.fp_c4)._m0[20].z);
    float _624 = _137 ? as_type<float>(_614) : (*spvDescriptorSet0.fp_c4)._m0[9].z;
    bool _626 = !_133;
    int _628 = _626 ? as_type<int>((*spvDescriptorSet0.fp_c4)._m0[16].w) : as_type<int>((*spvDescriptorSet0.fp_c4)._m0[20].w);
    float _630 = _137 ? as_type<float>(_622) : (*spvDescriptorSet0.fp_c4)._m0[12].z;
    float _632 = fma(_624, _528, _596);
    float _634 = _137 ? as_type<float>(_628) : (*spvDescriptorSet0.fp_c4)._m0[12].w;
    float _636 = fma(_624, _522, _592);
    float _638 = _137 ? as_type<float>(_618) : (*spvDescriptorSet0.fp_c4)._m0[10].z;
    float _640 = fma(_630, _522, _608);
    float _642 = fma(_630, _528, _610);
    float _644 = _634 + _640;
    float _646 = fma(_638, _522, _600);
    float _648 = fma(_638, _528, _602);
    float _650 = _634 + _642;
    float _652 = 1.0 / _644;
    bool _654 = !_133;
    int _656 = _654 ? as_type<int>((*spvDescriptorSet0.fp_c4)._m0[15].z) : as_type<int>((*spvDescriptorSet0.fp_c4)._m0[19].z);
    float _658 = _137 ? as_type<float>(_656) : (*spvDescriptorSet0.fp_c4)._m0[11].z;
    bool _660 = !_133;
    int _662 = _660 ? as_type<int>((*spvDescriptorSet0.fp_c4)._m0[14].w) : as_type<int>((*spvDescriptorSet0.fp_c4)._m0[18].w);
    bool _664 = !_133;
    int _666 = _664 ? as_type<int>((*spvDescriptorSet0.fp_c4)._m0[15].w) : as_type<int>((*spvDescriptorSet0.fp_c4)._m0[19].w);
    float _668 = fma(_658, _522, _604);
    bool _670 = !_133;
    int _672 = _670 ? as_type<int>((*spvDescriptorSet0.fp_c4)._m0[13].w) : as_type<int>((*spvDescriptorSet0.fp_c4)._m0[17].w);
    float _674 = 1.0 / _650;
    float _676 = _137 ? as_type<float>(_666) : (*spvDescriptorSet0.fp_c4)._m0[11].w;
    float _678 = fma(_658, _528, _606);
    float _680 = _137 ? as_type<float>(_672) : (*spvDescriptorSet0.fp_c4)._m0[9].w;
    float _682 = _676 + _668;
    float _684 = _137 ? as_type<float>(_662) : (*spvDescriptorSet0.fp_c4)._m0[10].w;
    float _686 = _652 * 0.5;
    float _688 = _676 + _678;
    float _690 = _680 + _636;
    float _692 = _680 + _632;
    float _694 = fma(_682, _686, 0.5);
    float _696 = _684 + _646;
    float _698 = _684 + _648;
    float _700 = fma(_690, _686, 0.5);
    float _702 = (*spvDescriptorSet0.fp_c3)._m0[5].y * 0.100000001490116119384765625;
    float _704 = -_694;
    float _706 = _524 + _704;
    float _708 = _696 * _652;
    float _710 = _698 * _674;
    float _712 = _674 * 0.5;
    float _714 = _706 * _702;
    float _716 = fma(_708, -0.5, 0.5);
    float _718 = fma(_710, -0.5, 0.5);
    float _720 = fma(_692, _712, 0.5);
    float _722 = _714 * 1.5;
    float _724 = -_716;
    float _726 = _260 + _724;
    float _728 = -_700;
    float _730 = _262 + _728;
    float _732 = fma(_688, _712, 0.5);
    float _734 = _726 * _702;
    float _736 = _730 * _702;
    float _738 = (*spvDescriptorSet0.fp_c3)._m0[5].y * 0.100000001490116119384765625;
    float _740 = -_732;
    float _742 = _524 + _740;
    float _744 = _742 * _738;
    float _746 = -_524;
    float _748 = _746 + _264;
    float _750 = _748 + (*spvDescriptorSet0.fp_c3)._m0[5].x;
    float _752 = precise::max(_750, _722);
    float _754 = precise::min(0.0, _752);
    bool _756 = _754 != _750;
    bool _758 = isnan(_754);
    bool _760 = _756 || _758;
    bool _762 = isnan(_750);
    bool _764 = _760 || _762;
    float _766 = -_720;
    float _768 = _262 + _766;
    float _770 = -_718;
    float _772 = _260 + _770;
    float _774 = _768 * _738;
    float _776 = _772 * _738;
    bool _778 = !_764;
    float _780 = as_type<float>(_272);
    float _1070;
    if (!_778)
    {
        float _782 = _260 + _734;
        float _784 = _262 + _736;
        float3 _2893 = float3(_784, _782, float(int(_248)));
        float3 _2895 = select(_2893, float3(0.0), isnan(_2893));
        float _786 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, _2895.xy, uint(rint(_2895.z))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, _2895.xy, uint(rint(_2895.z))).x;
        float _788 = _524 + _714;
        float _790 = _714 * 3.0;
        float _792 = -_788;
        float _794 = _792 + _786;
        float _796 = _794 + (*spvDescriptorSet0.fp_c3)._m0[5].x;
        float _798 = precise::max(_796, _790);
        float _800 = precise::min(0.0, _798);
        bool _802 = _800 != _796;
        bool _804 = isnan(_800);
        bool _806 = _802 || _804;
        bool _808 = isnan(_796);
        bool _810 = _806 || _808;
        bool _812 = !_810;
        if (!_812)
        {
            float _814 = fma(_734, 2.0, _260);
            float _816 = fma(_736, 2.0, _262);
            float3 _2948 = float3(_816, _814, float(int(_248)));
            float3 _2950 = select(_2948, float3(0.0), isnan(_2948));
            float _818 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, _2950.xy, uint(rint(_2950.z))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, _2950.xy, uint(rint(_2950.z))).x;
            float _820 = fma(_714, 2.0, _524);
            float _822 = _714 * 4.5;
            float _824 = -_820;
            float _826 = _824 + _818;
            float _828 = _826 + (*spvDescriptorSet0.fp_c3)._m0[5].x;
            float _830 = precise::max(_828, _822);
            float _832 = precise::min(0.0, _830);
            bool _834 = _832 != _828;
            bool _836 = isnan(_832);
            bool _838 = _834 || _836;
            bool _840 = isnan(_828);
            bool _842 = _838 || _840;
            bool _844 = !_842;
            if (!_844)
            {
                float _846 = fma(_734, 3.0, _260);
                float _848 = fma(_736, 3.0, _262);
                float3 _3003 = float3(_848, _846, float(int(_248)));
                float3 _3005 = select(_3003, float3(0.0), isnan(_3003));
                float _850 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, _3005.xy, uint(rint(_3005.z))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, _3005.xy, uint(rint(_3005.z))).x;
                float _852 = fma(_714, 3.0, _524);
                float _854 = _714 * 6.0;
                float _856 = -_852;
                float _858 = _856 + _850;
                float _860 = _858 + (*spvDescriptorSet0.fp_c3)._m0[5].x;
                float _862 = precise::max(_860, _854);
                float _864 = precise::min(0.0, _862);
                bool _866 = _864 != _860;
                bool _868 = isnan(_864);
                bool _870 = _866 || _868;
                bool _872 = isnan(_860);
                bool _874 = _870 || _872;
                bool _876 = !_874;
                if (!_876)
                {
                    float _878 = fma(_734, 4.0, _260);
                    float _880 = fma(_736, 4.0, _262);
                    float3 _3059 = float3(_880, _878, float(int(_248)));
                    float3 _3061 = select(_3059, float3(0.0), isnan(_3059));
                    float _882 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, _3061.xy, uint(rint(_3061.z))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, _3061.xy, uint(rint(_3061.z))).x;
                    float _884 = fma(_714, 4.0, _524);
                    float _886 = _714 * 7.5;
                    float _888 = -_884;
                    float _890 = _888 + _882;
                    float _892 = _890 + (*spvDescriptorSet0.fp_c3)._m0[5].x;
                    float _894 = precise::max(_892, _886);
                    float _896 = precise::min(0.0, _894);
                    bool _898 = _896 != _892;
                    bool _900 = isnan(_896);
                    bool _902 = _898 || _900;
                    bool _904 = isnan(_892);
                    bool _906 = _902 || _904;
                    bool _908 = !_906;
                    if (!_908)
                    {
                        float _910 = fma(_734, 5.0, _260);
                        float _912 = fma(_736, 5.0, _262);
                        float3 _3115 = float3(_912, _910, float(int(_248)));
                        float3 _3117 = select(_3115, float3(0.0), isnan(_3115));
                        float _914 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, _3117.xy, uint(rint(_3117.z))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, _3117.xy, uint(rint(_3117.z))).x;
                        float _916 = fma(_714, 5.0, _524);
                        float _918 = _714 * 9.0;
                        float _920 = -_916;
                        float _922 = _920 + _914;
                        float _924 = _922 + (*spvDescriptorSet0.fp_c3)._m0[5].x;
                        float _926 = precise::max(_924, _918);
                        float _928 = precise::min(0.0, _926);
                        bool _930 = _928 != _924;
                        bool _932 = isnan(_928);
                        bool _934 = _930 || _932;
                        bool _936 = isnan(_924);
                        bool _938 = _934 || _936;
                        bool _940 = !_938;
                        if (!_940)
                        {
                            float _942 = fma(_734, 6.0, _260);
                            float _944 = fma(_736, 6.0, _262);
                            float3 _3170 = float3(_944, _942, float(int(_248)));
                            float3 _3172 = select(_3170, float3(0.0), isnan(_3170));
                            float _946 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, _3172.xy, uint(rint(_3172.z))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, _3172.xy, uint(rint(_3172.z))).x;
                            float _948 = fma(_714, 6.0, _524);
                            float _950 = _714 * 10.5;
                            float _952 = -_948;
                            float _954 = _952 + _946;
                            float _956 = _954 + (*spvDescriptorSet0.fp_c3)._m0[5].x;
                            float _958 = precise::max(_956, _950);
                            float _960 = precise::min(0.0, _958);
                            bool _962 = _960 != _956;
                            bool _964 = isnan(_960);
                            bool _966 = _962 || _964;
                            bool _968 = isnan(_956);
                            bool _970 = _966 || _968;
                            bool _972 = !_970;
                            if (!_972)
                            {
                                float _974 = fma(_734, 7.0, _260);
                                float _976 = fma(_736, 7.0, _262);
                                float3 _3226 = float3(_976, _974, float(int(_248)));
                                float3 _3228 = select(_3226, float3(0.0), isnan(_3226));
                                float _978 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, _3228.xy, uint(rint(_3228.z))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, _3228.xy, uint(rint(_3228.z))).x;
                                float _980 = fma(_714, 7.0, _524);
                                float _982 = _714 * 12.0;
                                float _984 = -_980;
                                float _986 = _984 + _978;
                                float _988 = _986 + (*spvDescriptorSet0.fp_c3)._m0[5].x;
                                float _990 = precise::max(_988, _982);
                                float _992 = precise::min(0.0, _990);
                                bool _994 = _992 != _988;
                                bool _996 = isnan(_992);
                                bool _998 = _994 || _996;
                                bool _1000 = isnan(_988);
                                bool _1002 = _998 || _1000;
                                bool _1004 = !_1002;
                                if (!_1004)
                                {
                                    float _1006 = fma(_734, 8.0, _260);
                                    float _1008 = fma(_736, 8.0, _262);
                                    float3 _3282 = float3(_1008, _1006, float(int(_248)));
                                    float3 _3284 = select(_3282, float3(0.0), isnan(_3282));
                                    float _1010 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, _3284.xy, uint(rint(_3284.z))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, _3284.xy, uint(rint(_3284.z))).x;
                                    float _1012 = fma(_714, 8.0, _524);
                                    float _1014 = fma(_714, 13.5, -1.0);
                                    float _1016 = -_1012;
                                    float _1018 = _1016 + _1010;
                                    float _1020 = _1018 + (*spvDescriptorSet0.fp_c3)._m0[5].x;
                                    float _1022 = precise::max(_1020, _1014);
                                    float _1024 = precise::min(0.0, _1022);
                                    bool _1026 = _1024 != _1020;
                                    bool _1028 = isnan(_1024);
                                    bool _1030 = _1026 || _1028;
                                    bool _1032 = isnan(_1020);
                                    bool _1034 = _1030 || _1032;
                                    bool _1036 = !_1034;
                                    if (!_1036)
                                    {
                                        float _1038 = fma(_734, 9.0, _260);
                                        float _1040 = fma(_736, 9.0, _262);
                                        float3 _3337 = float3(_1040, _1038, float(int(_248)));
                                        float3 _3339 = select(_3337, float3(0.0), isnan(_3337));
                                        float _1042 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, _3339.xy, uint(rint(_3339.z))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, _3339.xy, uint(rint(_3339.z))).x;
                                        float _1044 = fma(_714, 9.0, _524);
                                        float _1046 = fma(_714, 15.0, -1.0);
                                        float _1048 = -_1044;
                                        float _1050 = _1048 + _1042;
                                        float _1052 = _1050 + (*spvDescriptorSet0.fp_c3)._m0[5].x;
                                        float _1054 = precise::max(_1052, _1046);
                                        float _1056 = precise::min(0.0, _1054);
                                        bool _1058 = _1056 != _1052;
                                        bool _1060 = isnan(_1056);
                                        bool _1062 = _1058 || _1060;
                                        bool _1064 = isnan(_1052);
                                        bool _1066 = _1062 || _1064;
                                        if (_1066)
                                        {
                                            _780 = 0.0;
                                        }
                                        float _1068 = _780;
                                        _1070 = _1068;
                                        _1072 = _1066;
                                    }
                                }
                            }
                        }
                    }
                }
            }
        }
    }
    if (!_1072)
    {
        _1070 = 1.0;
    }
    _1072 = false;
    float _1074 = _1070;
    bool _1076 = _272 > 65535u;
    bool _1078 = !_1076;
    float _1080 = _1078 ? as_type<float>(_272) : 9.1834094859526886742986618240905e-41;
    float3 _3410 = float3(_262, _260, float(as_type<int>(_1080)));
    float3 _3412 = select(_3410, float3(0.0), isnan(_3410));
    float _1082 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, _3412.xy, uint(rint(_3412.z))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, _3412.xy, uint(rint(_3412.z))).x;
    float _1084 = _744 * 1.5;
    float _1086 = -(*spvDescriptorSet0.fp_c3)._m0[5].w;
    float _1088 = 1.0 + _1086;
    float _1090 = -_524;
    float _1092 = _1090 + _1082;
    float _1094 = _1092 + (*spvDescriptorSet0.fp_c3)._m0[5].x;
    float _1096 = precise::max(_1094, _1084);
    float _1098 = precise::min(0.0, _1096);
    bool _1100 = _1098 != _1094;
    bool _1102 = isnan(_1098);
    bool _1104 = _1100 || _1102;
    bool _1106 = isnan(_1094);
    bool _1108 = _1104 || _1106;
    float _1110 = fma(_1088, (*spvDescriptorSet0.fp_c3)._m0[6].x, (*spvDescriptorSet0.fp_c3)._m0[6].z);
    float _1112 = _1110 * (*spvDescriptorSet0.fp_c3)._m0[7].x;
    bool _1114 = !_1108;
    float _1116 = _1074;
    if (!_1114)
    {
        float _1118 = _260 + _776;
        float _1120 = _262 + _774;
        float3 _3477 = float3(_1120, _1118, float(as_type<int>(_1080)));
        float3 _3479 = select(_3477, float3(0.0), isnan(_3477));
        float _1122 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, _3479.xy, uint(rint(_3479.z))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, _3479.xy, uint(rint(_3479.z))).x;
        float _1124 = _524 + _744;
        float _1126 = _744 * 3.0;
        float _1128 = -_1124;
        float _1130 = _1128 + _1122;
        float _1132 = _1130 + (*spvDescriptorSet0.fp_c3)._m0[5].x;
        float _1134 = precise::max(_1132, _1126);
        float _1136 = precise::min(0.0, _1134);
        bool _1138 = _1136 != _1132;
        bool _1140 = isnan(_1136);
        bool _1142 = _1138 || _1140;
        bool _1144 = isnan(_1132);
        bool _1146 = _1142 || _1144;
        bool _1148 = !_1146;
        if (!_1148)
        {
            float _1150 = fma(_776, 2.0, _260);
            float _1152 = fma(_774, 2.0, _262);
            float3 _3531 = float3(_1152, _1150, float(as_type<int>(_1080)));
            float3 _3533 = select(_3531, float3(0.0), isnan(_3531));
            float _1154 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, _3533.xy, uint(rint(_3533.z))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, _3533.xy, uint(rint(_3533.z))).x;
            float _1156 = fma(_744, 2.0, _524);
            float _1158 = _744 * 4.5;
            float _1160 = -_1156;
            float _1162 = _1160 + _1154;
            float _1164 = _1162 + (*spvDescriptorSet0.fp_c3)._m0[5].x;
            float _1166 = precise::max(_1164, _1158);
            float _1168 = precise::min(0.0, _1166);
            bool _1170 = _1168 != _1164;
            bool _1172 = isnan(_1168);
            bool _1174 = _1170 || _1172;
            bool _1176 = isnan(_1164);
            bool _1178 = _1174 || _1176;
            bool _1180 = !_1178;
            if (!_1180)
            {
                float _1182 = fma(_776, 3.0, _260);
                float _1184 = fma(_774, 3.0, _262);
                float3 _3585 = float3(_1184, _1182, float(as_type<int>(_1080)));
                float3 _3587 = select(_3585, float3(0.0), isnan(_3585));
                float _1186 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, _3587.xy, uint(rint(_3587.z))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, _3587.xy, uint(rint(_3587.z))).x;
                float _1188 = fma(_744, 3.0, _524);
                float _1190 = _744 * 6.0;
                float _1192 = -_1188;
                float _1194 = _1192 + _1186;
                float _1196 = _1194 + (*spvDescriptorSet0.fp_c3)._m0[5].x;
                float _1198 = precise::max(_1196, _1190);
                float _1200 = precise::min(0.0, _1198);
                bool _1202 = _1200 != _1196;
                bool _1204 = isnan(_1200);
                bool _1206 = _1202 || _1204;
                bool _1208 = isnan(_1196);
                bool _1210 = _1206 || _1208;
                bool _1212 = !_1210;
                if (!_1212)
                {
                    float _1214 = fma(_776, 4.0, _260);
                    float _1216 = fma(_774, 4.0, _262);
                    float3 _3639 = float3(_1216, _1214, float(as_type<int>(_1080)));
                    float3 _3641 = select(_3639, float3(0.0), isnan(_3639));
                    float _1218 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, _3641.xy, uint(rint(_3641.z))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, _3641.xy, uint(rint(_3641.z))).x;
                    float _1220 = fma(_744, 4.0, _524);
                    float _1222 = _744 * 7.5;
                    float _1224 = -_1220;
                    float _1226 = _1224 + _1218;
                    float _1228 = _1226 + (*spvDescriptorSet0.fp_c3)._m0[5].x;
                    float _1230 = precise::max(_1228, _1222);
                    float _1232 = precise::min(0.0, _1230);
                    bool _1234 = _1232 != _1228;
                    bool _1236 = isnan(_1232);
                    bool _1238 = _1234 || _1236;
                    bool _1240 = isnan(_1228);
                    bool _1242 = _1238 || _1240;
                    bool _1244 = !_1242;
                    if (!_1244)
                    {
                        float _1246 = fma(_776, 5.0, _260);
                        float _1248 = fma(_774, 5.0, _262);
                        float3 _3693 = float3(_1248, _1246, float(as_type<int>(_1080)));
                        float3 _3695 = select(_3693, float3(0.0), isnan(_3693));
                        float _1250 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, _3695.xy, uint(rint(_3695.z))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, _3695.xy, uint(rint(_3695.z))).x;
                        float _1252 = fma(_744, 5.0, _524);
                        float _1254 = _744 * 9.0;
                        float _1256 = -_1252;
                        float _1258 = _1256 + _1250;
                        float _1260 = _1258 + (*spvDescriptorSet0.fp_c3)._m0[5].x;
                        float _1262 = precise::max(_1260, _1254);
                        float _1264 = precise::min(0.0, _1262);
                        bool _1266 = _1264 != _1260;
                        bool _1268 = isnan(_1264);
                        bool _1270 = _1266 || _1268;
                        bool _1272 = isnan(_1260);
                        bool _1274 = _1270 || _1272;
                        bool _1276 = !_1274;
                        if (!_1276)
                        {
                            float _1278 = fma(_776, 6.0, _260);
                            float _1280 = fma(_774, 6.0, _262);
                            float3 _3747 = float3(_1280, _1278, float(as_type<int>(_1080)));
                            float3 _3749 = select(_3747, float3(0.0), isnan(_3747));
                            float _1282 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, _3749.xy, uint(rint(_3749.z))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, _3749.xy, uint(rint(_3749.z))).x;
                            float _1284 = fma(_744, 6.0, _524);
                            float _1286 = _744 * 10.5;
                            float _1288 = -_1284;
                            float _1290 = _1288 + _1282;
                            float _1292 = _1290 + (*spvDescriptorSet0.fp_c3)._m0[5].x;
                            float _1294 = precise::max(_1292, _1286);
                            float _1296 = precise::min(0.0, _1294);
                            bool _1298 = _1296 != _1292;
                            bool _1300 = isnan(_1296);
                            bool _1302 = _1298 || _1300;
                            bool _1304 = isnan(_1292);
                            bool _1306 = _1302 || _1304;
                            bool _1308 = !_1306;
                            if (!_1308)
                            {
                                float _1310 = fma(_776, 7.0, _260);
                                float _1312 = fma(_774, 7.0, _262);
                                float3 _3801 = float3(_1312, _1310, float(as_type<int>(_1080)));
                                float3 _3803 = select(_3801, float3(0.0), isnan(_3801));
                                float _1314 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, _3803.xy, uint(rint(_3803.z))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, _3803.xy, uint(rint(_3803.z))).x;
                                float _1316 = fma(_744, 7.0, _524);
                                float _1318 = _744 * 12.0;
                                float _1320 = -_1316;
                                float _1322 = _1320 + _1314;
                                float _1324 = _1322 + (*spvDescriptorSet0.fp_c3)._m0[5].x;
                                float _1326 = precise::max(_1324, _1318);
                                float _1328 = precise::min(0.0, _1326);
                                bool _1330 = _1328 != _1324;
                                bool _1332 = isnan(_1328);
                                bool _1334 = _1330 || _1332;
                                bool _1336 = isnan(_1324);
                                bool _1338 = _1334 || _1336;
                                bool _1340 = !_1338;
                                if (!_1340)
                                {
                                    float _1342 = fma(_776, 8.0, _260);
                                    float _1344 = fma(_774, 8.0, _262);
                                    float3 _3855 = float3(_1344, _1342, float(as_type<int>(_1080)));
                                    float3 _3857 = select(_3855, float3(0.0), isnan(_3855));
                                    float _1346 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, _3857.xy, uint(rint(_3857.z))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, _3857.xy, uint(rint(_3857.z))).x;
                                    float _1348 = fma(_744, 8.0, _524);
                                    float _1350 = fma(_744, 13.5, -1.0);
                                    float _1352 = -_1348;
                                    float _1354 = _1352 + _1346;
                                    float _1356 = _1354 + (*spvDescriptorSet0.fp_c3)._m0[5].x;
                                    float _1358 = precise::max(_1356, _1350);
                                    float _1360 = precise::min(0.0, _1358);
                                    bool _1362 = _1360 != _1356;
                                    bool _1364 = isnan(_1360);
                                    bool _1366 = _1362 || _1364;
                                    bool _1368 = isnan(_1356);
                                    bool _1370 = _1366 || _1368;
                                    bool _1372 = !_1370;
                                    if (!_1372)
                                    {
                                        float _1374 = fma(_776, 9.0, _260);
                                        float _1376 = fma(_774, 9.0, _262);
                                        float3 _3909 = float3(_1376, _1374, float(as_type<int>(_1080)));
                                        float3 _3911 = select(_3909, float3(0.0), isnan(_3909));
                                        float _1378 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, _3911.xy, uint(rint(_3911.z))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, _3911.xy, uint(rint(_3911.z))).x;
                                        float _1380 = fma(_744, 9.0, _524);
                                        float _1382 = fma(_744, 15.0, -1.0);
                                        float _1384 = -_1380;
                                        float _1386 = _1384 + _1378;
                                        float _1388 = _1386 + (*spvDescriptorSet0.fp_c3)._m0[5].x;
                                        float _1390 = precise::max(_1388, _1382);
                                        float _1392 = precise::min(0.0, _1390);
                                        bool _1394 = _1392 != _1388;
                                        bool _1396 = isnan(_1392);
                                        bool _1398 = _1394 || _1396;
                                        bool _1400 = isnan(_1388);
                                        bool _1402 = _1398 || _1400;
                                        _1404 = _1402;
                                    }
                                }
                            }
                        }
                    }
                }
            }
        }
    }
    if (!_1404)
    {
        float _1406 = _1074 + 1.0;
        _1116 = _1406;
    }
    _1404 = false;
    float _1408 = _1116;
    float _1410 = _1408 * 0.5;
    float _1412 = -_1410;
    float _1414 = fma(_1412, _1112, 1.0);
    out.m_39.x = _1414;
    return out;
}

