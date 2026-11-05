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
    bool _1062 = false;
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
    float2 _1109 = float2(_62, _64);
    float _66 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_1109, float2(0.0), isnan(_1109))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_1109, float2(0.0), isnan(_1109))).x;
    float _68 = fma(_62, 2.0, -1.0);
    float _70 = fma(_64, 2.0, -1.0);
    float _72 = _68 * (*spvDescriptorSet0.fp_c3)._m0[0].x;
    float _74 = _70 * (*spvDescriptorSet0.fp_c3)._m0[0].y;
    float _76 = fma(_66, (*spvDescriptorSet0.fp_c3)._m0[0].w, (*spvDescriptorSet0.fp_c3)._m0[0].z);
    float _78 = _76 * (*spvDescriptorSet0.fp_c3)._m0[1].y;
    float _80 = _76 * _74;
    float _82 = _76 * _72;
    bool _86 = _78 > (*spvDescriptorSet0.fp_c4)._m0[33].y;
    float _88 = -(*spvDescriptorSet0.fp_c3)._m0[3].y;
    float _90 = _80 * _88;
    bool _92 = _78 > (*spvDescriptorSet0.fp_c4)._m0[33].x;
    float _94 = -(*spvDescriptorSet0.fp_c3)._m0[2].y;
    float _96 = _80 * _94;
    bool _98 = _78 > (*spvDescriptorSet0.fp_c4)._m0[33].z;
    float _100 = fma(_82, (*spvDescriptorSet0.fp_c3)._m0[3].x, _90);
    bool _102 = !_86;
    int _105 = _102 ? 0 : 1;
    float _107 = fma(_82, (*spvDescriptorSet0.fp_c3)._m0[2].x, _96);
    float _109 = -_78;
    float _111 = fma(_109, (*spvDescriptorSet0.fp_c3)._m0[3].z, _100);
    float _113 = -_78;
    float _115 = fma(_113, (*spvDescriptorSet0.fp_c3)._m0[2].z, _107);
    int _117 = 2;
    if (!_86)
    {
        _117 = 1;
    }
    int _119 = _117;
    float _121 = _111 + (*spvDescriptorSet0.fp_c3)._m0[3].w;
    int _123 = _119;
    if (!_92)
    {
        _123 = _105;
    }
    int _125 = _123;
    int _127 = _125 + 1;
    int _129 = _127;
    if (!_98)
    {
        _129 = _125;
    }
    int _131 = _129;
    float _133 = -(*spvDescriptorSet0.fp_c3)._m0[4].y;
    float _135 = _80 * _133;
    bool _137 = _131 != 1;
    float _139 = fma(_82, (*spvDescriptorSet0.fp_c3)._m0[4].x, _135);
    bool _141 = _131 != 0;
    float _143 = _115 + (*spvDescriptorSet0.fp_c3)._m0[2].w;
    bool _145 = !_137;
    int _147 = _145 ? as_type<int>((*spvDescriptorSet0.fp_c4)._m0[28].y) : as_type<int>((*spvDescriptorSet0.fp_c4)._m0[32].y);
    float _149 = -_78;
    float _151 = fma(_149, (*spvDescriptorSet0.fp_c3)._m0[4].z, _139);
    bool _153 = !_137;
    int _155 = _153 ? as_type<int>((*spvDescriptorSet0.fp_c4)._m0[28].x) : as_type<int>((*spvDescriptorSet0.fp_c4)._m0[32].x);
    float _157 = _141 ? as_type<float>(_147) : (*spvDescriptorSet0.fp_c4)._m0[24].y;
    float _159 = _151 + (*spvDescriptorSet0.fp_c3)._m0[4].w;
    float _161 = _141 ? as_type<float>(_155) : (*spvDescriptorSet0.fp_c4)._m0[24].x;
    float _163 = _121 * _157;
    float _165 = fma(_143, _161, _163);
    bool _167 = !_137;
    int _169 = _167 ? as_type<int>((*spvDescriptorSet0.fp_c4)._m0[25].x) : as_type<int>((*spvDescriptorSet0.fp_c4)._m0[29].x);
    bool _171 = !_137;
    int _173 = _171 ? as_type<int>((*spvDescriptorSet0.fp_c4)._m0[25].y) : as_type<int>((*spvDescriptorSet0.fp_c4)._m0[29].y);
    bool _175 = !_137;
    int _177 = _175 ? as_type<int>((*spvDescriptorSet0.fp_c4)._m0[26].x) : as_type<int>((*spvDescriptorSet0.fp_c4)._m0[30].x);
    bool _179 = !_137;
    int _181 = _179 ? as_type<int>((*spvDescriptorSet0.fp_c4)._m0[26].y) : as_type<int>((*spvDescriptorSet0.fp_c4)._m0[30].y);
    bool _183 = !_137;
    int _185 = _183 ? as_type<int>((*spvDescriptorSet0.fp_c4)._m0[28].z) : as_type<int>((*spvDescriptorSet0.fp_c4)._m0[32].z);
    bool _187 = !_137;
    int _189 = _187 ? as_type<int>((*spvDescriptorSet0.fp_c4)._m0[28].w) : as_type<int>((*spvDescriptorSet0.fp_c4)._m0[32].w);
    float _191 = _141 ? as_type<float>(_173) : (*spvDescriptorSet0.fp_c4)._m0[21].y;
    float _193 = _141 ? as_type<float>(_181) : (*spvDescriptorSet0.fp_c4)._m0[22].y;
    float _195 = _141 ? as_type<float>(_185) : (*spvDescriptorSet0.fp_c4)._m0[24].z;
    float _197 = _121 * _191;
    float _199 = _141 ? as_type<float>(_169) : (*spvDescriptorSet0.fp_c4)._m0[21].x;
    float _201 = _121 * _193;
    float _203 = _141 ? as_type<float>(_177) : (*spvDescriptorSet0.fp_c4)._m0[22].x;
    float _205 = fma(_159, _195, _165);
    float _207 = _141 ? as_type<float>(_189) : (*spvDescriptorSet0.fp_c4)._m0[24].w;
    float _209 = fma(_143, _199, _197);
    float _211 = fma(_143, _203, _201);
    float _213 = _207 + _205;
    float _215 = float(_131);
    bool _217 = !_137;
    int _219 = _217 ? as_type<int>((*spvDescriptorSet0.fp_c4)._m0[26].z) : as_type<int>((*spvDescriptorSet0.fp_c4)._m0[30].z);
    float _221 = 1.0 / _213;
    bool _223 = !_137;
    int _225 = _223 ? as_type<int>((*spvDescriptorSet0.fp_c4)._m0[25].z) : as_type<int>((*spvDescriptorSet0.fp_c4)._m0[29].z);
    float _227 = _141 ? as_type<float>(_219) : (*spvDescriptorSet0.fp_c4)._m0[22].z;
    bool _229 = !_137;
    int _231 = _229 ? as_type<int>((*spvDescriptorSet0.fp_c4)._m0[26].w) : as_type<int>((*spvDescriptorSet0.fp_c4)._m0[30].w);
    bool _233 = !_137;
    int _235 = _233 ? as_type<int>((*spvDescriptorSet0.fp_c4)._m0[25].w) : as_type<int>((*spvDescriptorSet0.fp_c4)._m0[29].w);
    float _237 = fma(_159, _227, _211);
    float _239 = _141 ? as_type<float>(_225) : (*spvDescriptorSet0.fp_c4)._m0[21].z;
    float _241 = rint(_215);
    float _243 = precise::max(_241, 0.0);
    uint _246 = uint(_243);
    uint _248 = clamp(_246, 0u, 65535u);
    float _250 = _141 ? as_type<float>(_231) : (*spvDescriptorSet0.fp_c4)._m0[22].w;
    float _252 = _141 ? as_type<float>(_235) : (*spvDescriptorSet0.fp_c4)._m0[21].w;
    float _254 = fma(_159, _239, _209);
    float _256 = _250 + _237;
    float _258 = _252 + _254;
    float _260 = _256 * _221;
    float _262 = _258 * _221;
    float3 _1529 = float3(_262, _260, float(int(_248)));
    float3 _1533 = select(_1529, float3(0.0), isnan(_1529));
    float _264 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, _1533.xy, uint(rint(_1533.z))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, _1533.xy, uint(rint(_1533.z))).x;
    float _266 = _121 * 78.233001708984375;
    float _268 = fma(_159, 12.98980045318603515625, _266);
    float _270 = fma(_143, 12.98980045318603515625, _266);
    float _272 = fma(_143, 45.16400146484375, _268);
    float _274 = fma(_159, 45.16400146484375, _270);
    float _276 = _272 + 94.67299652099609375;
    float _278 = _272 + 189.3459930419921875;
    bool _280 = !_137;
    int _282 = _280 ? as_type<int>((*spvDescriptorSet0.fp_c4)._m0[27].y) : as_type<int>((*spvDescriptorSet0.fp_c4)._m0[31].y);
    float _284 = _276 * 0.15915493667125701904296875;
    float _286 = _278 * 0.15915493667125701904296875;
    float _288 = _274 + 94.67299652099609375;
    bool _290 = !_137;
    int _292 = _290 ? as_type<int>((*spvDescriptorSet0.fp_c4)._m0[4].y) : as_type<int>((*spvDescriptorSet0.fp_c4)._m0[7].y);
    float _294 = _141 ? as_type<float>(_282) : (*spvDescriptorSet0.fp_c4)._m0[23].y;
    float _296 = _288 * 0.15915493667125701904296875;
    float _298 = _274 + 189.3459930419921875;
    float _300 = _284 * 6.283185482025146484375;
    float _302 = sin(_300);
    float _304 = -(*spvDescriptorSet0.fp_c3)._m0[5].w;
    float _306 = _304 + 1.0;
    float _308 = _298 * 0.15915493667125701904296875;
    float _310 = _141 ? as_type<float>(_292) : (*spvDescriptorSet0.fp_c4)._m0[1].y;
    float _312 = fma(_306, (*spvDescriptorSet0.fp_c3)._m0[6].y, (*spvDescriptorSet0.fp_c3)._m0[6].w);
    float _314 = _121 * _294;
    float _316 = _296 * 6.283185482025146484375;
    float _318 = sin(_316);
    bool _320 = !_137;
    int _322 = _320 ? as_type<int>((*spvDescriptorSet0.fp_c4)._m0[3].y) : as_type<int>((*spvDescriptorSet0.fp_c4)._m0[6].y);
    bool _324 = !_137;
    int _326 = _324 ? as_type<int>((*spvDescriptorSet0.fp_c4)._m0[5].y) : as_type<int>((*spvDescriptorSet0.fp_c4)._m0[8].y);
    float _328 = _141 ? as_type<float>(_322) : (*spvDescriptorSet0.fp_c4)._m0[0].y;
    float _330 = _141 ? as_type<float>(_326) : (*spvDescriptorSet0.fp_c4)._m0[2].y;
    float _332 = _308 * 6.283185482025146484375;
    float _334 = sin(_332);
    float _336 = _302 * 43758.546875;
    float _338 = _121 * _310;
    float _340 = _121 * _330;
    bool _342 = !_137;
    int _344 = _342 ? as_type<int>((*spvDescriptorSet0.fp_c4)._m0[27].x) : as_type<int>((*spvDescriptorSet0.fp_c4)._m0[31].x);
    float _346 = _286 * 6.283185482025146484375;
    float _348 = sin(_346);
    float _350 = _318 * 43758.546875;
    float _352 = _121 * _328;
    float _354 = _141 ? as_type<float>(_344) : (*spvDescriptorSet0.fp_c4)._m0[23].x;
    bool _356 = !_137;
    int _358 = _356 ? as_type<int>((*spvDescriptorSet0.fp_c4)._m0[4].x) : as_type<int>((*spvDescriptorSet0.fp_c4)._m0[7].x);
    float _360 = _334 * 43758.546875;
    float _362 = floor(_336);
    bool _364 = !_137;
    int _366 = _364 ? as_type<int>((*spvDescriptorSet0.fp_c4)._m0[5].x) : as_type<int>((*spvDescriptorSet0.fp_c4)._m0[8].x);
    float _368 = fma(_143, _354, _314);
    float _370 = _141 ? as_type<float>(_358) : (*spvDescriptorSet0.fp_c4)._m0[1].x;
    float _372 = _348 * 43758.546875;
    float _374 = floor(_350);
    float _376 = _141 ? as_type<float>(_366) : (*spvDescriptorSet0.fp_c4)._m0[2].x;
    float _378 = fma(_143, _370, _338);
    bool _380 = !_137;
    int _382 = _380 ? as_type<int>((*spvDescriptorSet0.fp_c4)._m0[3].x) : as_type<int>((*spvDescriptorSet0.fp_c4)._m0[6].x);
    float _384 = floor(_360);
    float _386 = -_362;
    float _388 = _336 + _386;
    float _390 = _141 ? as_type<float>(_382) : (*spvDescriptorSet0.fp_c4)._m0[0].x;
    bool _392 = !_137;
    int _394 = _392 ? as_type<int>((*spvDescriptorSet0.fp_c4)._m0[27].z) : as_type<int>((*spvDescriptorSet0.fp_c4)._m0[31].z);
    float _396 = fma(_143, _390, _352);
    float _398 = floor(_372);
    float _400 = -_374;
    float _402 = _350 + _400;
    bool _404 = !_137;
    int _406 = _404 ? as_type<int>((*spvDescriptorSet0.fp_c4)._m0[3].z) : as_type<int>((*spvDescriptorSet0.fp_c4)._m0[6].z);
    float _408 = _312 * (*spvDescriptorSet0.fp_c3)._m0[5].z;
    float _410 = fma(_143, _376, _340);
    float _412 = _141 ? as_type<float>(_394) : (*spvDescriptorSet0.fp_c4)._m0[23].z;
    float _414 = -_384;
    float _416 = _360 + _414;
    float _418 = fma(_159, _412, _368);
    float _420 = fma(_416, 2.0, -1.0);
    bool _422 = !_137;
    int _424 = _422 ? as_type<int>((*spvDescriptorSet0.fp_c4)._m0[4].z) : as_type<int>((*spvDescriptorSet0.fp_c4)._m0[7].z);
    float _426 = fma(_388, 2.0, -1.0);
    float _428 = -_398;
    float _430 = _372 + _428;
    float _432 = fma(_402, 2.0, -1.0);
    float _434 = _141 ? as_type<float>(_406) : (*spvDescriptorSet0.fp_c4)._m0[0].z;
    float _436 = _408 * _420;
    float _438 = fma(_430, 2.0, -1.0);
    float _440 = _408 * _432;
    float _442 = _408 * _426;
    float _444 = _141 ? as_type<float>(_424) : (*spvDescriptorSet0.fp_c4)._m0[1].z;
    float _446 = fma(_159, _434, _396);
    float _448 = _440 * _440;
    float _450 = _408 * _438;
    float _452 = _436 * _436;
    float _454 = fma(_442, _442, _448);
    float _456 = fma(_450, _450, _452);
    bool _458 = !_137;
    int _460 = _458 ? as_type<int>((*spvDescriptorSet0.fp_c4)._m0[5].z) : as_type<int>((*spvDescriptorSet0.fp_c4)._m0[8].z);
    float _462 = _454 + 1.0;
    float _464 = fma(_159, _444, _378);
    float _466 = _456 + 1.0;
    float _468 = rsqrt(_462);
    bool _470 = !_137;
    int _472 = _470 ? as_type<int>((*spvDescriptorSet0.fp_c4)._m0[3].w) : as_type<int>((*spvDescriptorSet0.fp_c4)._m0[6].w);
    bool _474 = !_137;
    int _476 = _474 ? as_type<int>((*spvDescriptorSet0.fp_c4)._m0[4].w) : as_type<int>((*spvDescriptorSet0.fp_c4)._m0[7].w);
    bool _478 = !_137;
    int _480 = _478 ? as_type<int>((*spvDescriptorSet0.fp_c4)._m0[5].w) : as_type<int>((*spvDescriptorSet0.fp_c4)._m0[8].w);
    float _482 = rsqrt(_466);
    float _484 = _141 ? as_type<float>(_460) : (*spvDescriptorSet0.fp_c4)._m0[2].z;
    bool _486 = !_137;
    int _488 = _486 ? as_type<int>((*spvDescriptorSet0.fp_c4)._m0[27].w) : as_type<int>((*spvDescriptorSet0.fp_c4)._m0[31].w);
    float _490 = _141 ? as_type<float>(_472) : (*spvDescriptorSet0.fp_c4)._m0[0].w;
    float _492 = fma(_159, _484, _410);
    float _494 = _141 ? as_type<float>(_476) : (*spvDescriptorSet0.fp_c4)._m0[1].w;
    float _496 = _141 ? as_type<float>(_480) : (*spvDescriptorSet0.fp_c4)._m0[2].w;
    float _498 = _490 + _446;
    float _500 = _141 ? as_type<float>(_488) : (*spvDescriptorSet0.fp_c4)._m0[23].w;
    float _502 = _494 + _464;
    float _504 = _496 + _492;
    float _506 = fma(_442, _468, _498);
    float _508 = _500 + _418;
    float _510 = fma(_450, _482, _498);
    float _512 = fma(_440, _468, _502);
    float _514 = fma(_436, _482, _502);
    float _516 = -_468;
    float _518 = _504 + _516;
    float _520 = -_482;
    float _522 = _504 + _520;
    float _524 = _508 * _221;
    bool _526 = !_137;
    int _528 = _526 ? as_type<int>((*spvDescriptorSet0.fp_c4)._m0[13].y) : as_type<int>((*spvDescriptorSet0.fp_c4)._m0[17].y);
    bool _530 = !_137;
    int _532 = _530 ? as_type<int>((*spvDescriptorSet0.fp_c4)._m0[14].y) : as_type<int>((*spvDescriptorSet0.fp_c4)._m0[18].y);
    bool _534 = !_137;
    int _536 = _534 ? as_type<int>((*spvDescriptorSet0.fp_c4)._m0[15].y) : as_type<int>((*spvDescriptorSet0.fp_c4)._m0[19].y);
    bool _538 = !_137;
    int _540 = _538 ? as_type<int>((*spvDescriptorSet0.fp_c4)._m0[16].y) : as_type<int>((*spvDescriptorSet0.fp_c4)._m0[20].y);
    float _542 = _141 ? as_type<float>(_528) : (*spvDescriptorSet0.fp_c4)._m0[9].y;
    bool _544 = !_137;
    int _546 = _544 ? as_type<int>((*spvDescriptorSet0.fp_c4)._m0[14].x) : as_type<int>((*spvDescriptorSet0.fp_c4)._m0[18].x);
    float _548 = _542 * _512;
    float _550 = _141 ? as_type<float>(_532) : (*spvDescriptorSet0.fp_c4)._m0[10].y;
    float _552 = _542 * _514;
    float _554 = _141 ? as_type<float>(_536) : (*spvDescriptorSet0.fp_c4)._m0[11].y;
    bool _556 = !_137;
    int _558 = _556 ? as_type<int>((*spvDescriptorSet0.fp_c4)._m0[15].x) : as_type<int>((*spvDescriptorSet0.fp_c4)._m0[19].x);
    float _560 = _550 * _512;
    float _562 = _141 ? as_type<float>(_540) : (*spvDescriptorSet0.fp_c4)._m0[12].y;
    float _564 = _554 * _512;
    bool _566 = !_137;
    int _568 = _566 ? as_type<int>((*spvDescriptorSet0.fp_c4)._m0[16].x) : as_type<int>((*spvDescriptorSet0.fp_c4)._m0[20].x);
    float _570 = _554 * _514;
    float _572 = _141 ? as_type<float>(_546) : (*spvDescriptorSet0.fp_c4)._m0[10].x;
    float _574 = _550 * _514;
    float _576 = _141 ? as_type<float>(_558) : (*spvDescriptorSet0.fp_c4)._m0[11].x;
    float _578 = _562 * _512;
    float _580 = _562 * _514;
    float _582 = _141 ? as_type<float>(_568) : (*spvDescriptorSet0.fp_c4)._m0[12].x;
    float _584 = fma(_572, _506, _560);
    bool _586 = !_137;
    int _588 = _586 ? as_type<int>((*spvDescriptorSet0.fp_c4)._m0[13].x) : as_type<int>((*spvDescriptorSet0.fp_c4)._m0[17].x);
    float _590 = fma(_576, _506, _564);
    float _592 = fma(_576, _510, _570);
    float _594 = fma(_582, _510, _580);
    float _596 = _141 ? as_type<float>(_588) : (*spvDescriptorSet0.fp_c4)._m0[9].x;
    float _598 = fma(_572, _510, _574);
    bool _600 = !_137;
    int _602 = _600 ? as_type<int>((*spvDescriptorSet0.fp_c4)._m0[16].z) : as_type<int>((*spvDescriptorSet0.fp_c4)._m0[20].z);
    float _604 = fma(_596, _506, _548);
    bool _606 = !_137;
    int _608 = _606 ? as_type<int>((*spvDescriptorSet0.fp_c4)._m0[16].w) : as_type<int>((*spvDescriptorSet0.fp_c4)._m0[20].w);
    float _610 = fma(_582, _506, _578);
    float _612 = _141 ? as_type<float>(_602) : (*spvDescriptorSet0.fp_c4)._m0[12].z;
    float _614 = fma(_596, _510, _552);
    float _616 = fma(_612, _518, _610);
    float _618 = fma(_612, _522, _594);
    float _620 = _141 ? as_type<float>(_608) : (*spvDescriptorSet0.fp_c4)._m0[12].w;
    bool _622 = !_137;
    int _624 = _622 ? as_type<int>((*spvDescriptorSet0.fp_c4)._m0[13].z) : as_type<int>((*spvDescriptorSet0.fp_c4)._m0[17].z);
    bool _626 = !_137;
    int _628 = _626 ? as_type<int>((*spvDescriptorSet0.fp_c4)._m0[14].z) : as_type<int>((*spvDescriptorSet0.fp_c4)._m0[18].z);
    float _630 = _620 + _616;
    bool _632 = !_137;
    int _634 = _632 ? as_type<int>((*spvDescriptorSet0.fp_c4)._m0[15].z) : as_type<int>((*spvDescriptorSet0.fp_c4)._m0[19].z);
    float _636 = _620 + _618;
    float _638 = _141 ? as_type<float>(_624) : (*spvDescriptorSet0.fp_c4)._m0[9].z;
    float _640 = _141 ? as_type<float>(_628) : (*spvDescriptorSet0.fp_c4)._m0[10].z;
    float _642 = 1.0 / _630;
    float _644 = _141 ? as_type<float>(_634) : (*spvDescriptorSet0.fp_c4)._m0[11].z;
    float _646 = fma(_638, _518, _604);
    float _648 = fma(_638, _522, _614);
    float _650 = fma(_640, _522, _598);
    float _652 = fma(_640, _518, _584);
    float _654 = fma(_644, _518, _590);
    float _656 = fma(_644, _522, _592);
    float _658 = 1.0 / _636;
    bool _660 = !_137;
    int _662 = _660 ? as_type<int>((*spvDescriptorSet0.fp_c4)._m0[13].w) : as_type<int>((*spvDescriptorSet0.fp_c4)._m0[17].w);
    bool _664 = !_137;
    int _666 = _664 ? as_type<int>((*spvDescriptorSet0.fp_c4)._m0[15].w) : as_type<int>((*spvDescriptorSet0.fp_c4)._m0[19].w);
    float _668 = _141 ? as_type<float>(_662) : (*spvDescriptorSet0.fp_c4)._m0[9].w;
    float _670 = _141 ? as_type<float>(_666) : (*spvDescriptorSet0.fp_c4)._m0[11].w;
    float _672 = _668 + _646;
    float _674 = _642 * 0.5;
    float _676 = _668 + _648;
    float _678 = _670 + _654;
    float _680 = _670 + _656;
    float _682 = fma(_672, _674, 0.5);
    bool _684 = !_137;
    int _686 = _684 ? as_type<int>((*spvDescriptorSet0.fp_c4)._m0[14].w) : as_type<int>((*spvDescriptorSet0.fp_c4)._m0[18].w);
    float _688 = fma(_678, _674, 0.5);
    float _690 = _141 ? as_type<float>(_686) : (*spvDescriptorSet0.fp_c4)._m0[10].w;
    float _692 = -_688;
    float _694 = _524 + _692;
    float _696 = _694 * (*spvDescriptorSet0.fp_c3)._m0[5].y;
    float _698 = _690 + _650;
    float _700 = _690 + _652;
    float _702 = _696 * 0.300000011920928955078125;
    float _704 = _698 * _658;
    float _706 = _658 * 0.5;
    float _708 = _700 * _642;
    float _710 = fma(_704, -0.5, 0.5);
    float _712 = fma(_676, _706, 0.5);
    float _714 = fma(_680, _706, 0.5);
    float _716 = fma(_708, -0.5, 0.5);
    float _718 = -_710;
    float _720 = _260 + _718;
    float _722 = -_712;
    float _724 = _262 + _722;
    float _726 = -_714;
    float _728 = _524 + _726;
    float _730 = _720 * (*spvDescriptorSet0.fp_c3)._m0[5].y;
    float _732 = _724 * (*spvDescriptorSet0.fp_c3)._m0[5].y;
    float _734 = _728 * (*spvDescriptorSet0.fp_c3)._m0[5].y;
    float _736 = -_524;
    float _738 = _736 + _264;
    float _740 = _738 + (*spvDescriptorSet0.fp_c3)._m0[5].x;
    float _742 = precise::max(_740, _702);
    float _744 = precise::min(0.0, _742);
    bool _746 = _744 != _740;
    bool _748 = isnan(_744);
    bool _750 = _746 || _748;
    bool _752 = isnan(_740);
    bool _754 = _750 || _752;
    float _756 = _638;
    if (!_754)
    {
        _756 = 1.0;
    }
    float _758 = _756;
    bool _760 = !_754;
    float _762 = _758;
    if (!_760)
    {
        float _764 = -_716;
        float _766 = _260 + _764;
        float _768 = -_682;
        float _770 = _262 + _768;
        float _772 = _766 * (*spvDescriptorSet0.fp_c3)._m0[5].y;
        float _774 = _770 * (*spvDescriptorSet0.fp_c3)._m0[5].y;
        float _776 = fma(_772, 0.20000000298023223876953125, _260);
        float _778 = fma(_774, 0.20000000298023223876953125, _262);
        float _780 = fma(_772, 0.4000000059604644775390625, _260);
        float _782 = fma(_772, 0.60000002384185791015625, _260);
        float _784 = fma(_772, 0.800000011920928955078125, _260);
        float _786 = fma(_774, 0.4000000059604644775390625, _262);
        float3 _2567 = float3(_778, _776, float(int(_248)));
        float3 _2569 = select(_2567, float3(0.0), isnan(_2567));
        float _788 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, _2569.xy, uint(rint(_2569.z))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, _2569.xy, uint(rint(_2569.z))).x;
        float _790 = fma(_774, 0.60000002384185791015625, _262);
        float _792 = fma(_774, 0.800000011920928955078125, _262);
        float3 _2584 = float3(_786, _780, float(int(_248)));
        float3 _2586 = select(_2584, float3(0.0), isnan(_2584));
        float _794 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, _2586.xy, uint(rint(_2586.z))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, _2586.xy, uint(rint(_2586.z))).x;
        float3 _2595 = float3(_790, _782, float(int(_248)));
        float3 _2597 = select(_2595, float3(0.0), isnan(_2595));
        float _796 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, _2597.xy, uint(rint(_2597.z))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, _2597.xy, uint(rint(_2597.z))).x;
        float3 _2606 = float3(_792, _784, float(int(_248)));
        float3 _2608 = select(_2606, float3(0.0), isnan(_2606));
        float _798 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, _2608.xy, uint(rint(_2608.z))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, _2608.xy, uint(rint(_2608.z))).x;
        float _800 = fma(_696, 0.20000000298023223876953125, _524);
        float _802 = _696 * 0.60000002384185791015625;
        float _804 = -_800;
        float _806 = _804 + _788;
        float _808 = _806 + (*spvDescriptorSet0.fp_c3)._m0[5].x;
        float _810 = precise::max(_808, _802);
        float _812 = precise::min(0.0, _810);
        bool _814 = _812 != _808;
        bool _816 = isnan(_812);
        bool _818 = _814 || _816;
        bool _820 = isnan(_808);
        bool _822 = _818 || _820;
        float _824 = as_type<float>(_248);
        if (!_822)
        {
            _824 = 1.0;
        }
        float _826 = _824;
        bool _828 = !_822;
        float _830 = _826;
        _762 = _826;
        if (!_828)
        {
            float _832 = fma(_696, 0.4000000059604644775390625, _524);
            float _834 = _696 * 0.900000035762786865234375;
            float _836 = -_832;
            float _838 = _836 + _794;
            float _840 = _838 + (*spvDescriptorSet0.fp_c3)._m0[5].x;
            float _842 = precise::max(_840, _834);
            float _844 = precise::min(0.0, _842);
            bool _846 = _844 != _840;
            bool _848 = isnan(_844);
            bool _850 = _846 || _848;
            bool _852 = isnan(_840);
            bool _854 = _850 || _852;
            if (!_854)
            {
                _830 = 1.0;
            }
            float _856 = _830;
            bool _858 = !_854;
            float _860 = _856;
            _762 = _856;
            if (!_858)
            {
                float _862 = _524 + _802;
                float _864 = fma(_696, 1.2000000476837158203125, -1.0);
                float _866 = -_862;
                float _868 = _866 + _796;
                float _870 = _868 + (*spvDescriptorSet0.fp_c3)._m0[5].x;
                float _872 = precise::max(_870, _864);
                float _874 = precise::min(0.0, _872);
                bool _876 = _874 != _870;
                bool _878 = isnan(_874);
                bool _880 = _876 || _878;
                bool _882 = isnan(_870);
                bool _884 = _880 || _882;
                if (!_884)
                {
                    _860 = 1.0;
                }
                float _886 = _860;
                bool _888 = !_884;
                _762 = _886;
                if (!_888)
                {
                    float _890 = fma(_696, 0.800000011920928955078125, _524);
                    float _892 = fma(_696, 1.5, -1.0);
                    float _894 = -_890;
                    float _896 = _894 + _798;
                    float _898 = _896 + (*spvDescriptorSet0.fp_c3)._m0[5].x;
                    float _900 = precise::max(_898, _892);
                    float _902 = precise::min(0.0, _900);
                    bool _904 = _902 == _898;
                    float _906 = float(_904);
                    _762 = _906;
                }
            }
        }
    }
    float _908 = _762;
    float _910 = _734 * 0.300000011920928955078125;
    float _912 = precise::max(_740, _910);
    float _914 = precise::min(0.0, _912);
    bool _916 = _914 != _740;
    bool _918 = isnan(_914);
    bool _920 = _916 || _918;
    bool _922 = isnan(_740);
    bool _924 = _920 || _922;
    float _926 = -(*spvDescriptorSet0.fp_c3)._m0[5].w;
    float _928 = 1.0 + _926;
    float _930 = fma(_928, (*spvDescriptorSet0.fp_c3)._m0[6].x, (*spvDescriptorSet0.fp_c3)._m0[6].z);
    bool _932 = !_924;
    float _934 = _908;
    if (!_932)
    {
        float _936 = fma(_730, 0.20000000298023223876953125, _260);
        float _938 = fma(_732, 0.20000000298023223876953125, _262);
        float _940 = fma(_730, 0.60000002384185791015625, _260);
        float _942 = fma(_730, 0.4000000059604644775390625, _260);
        float _944 = fma(_732, 0.4000000059604644775390625, _262);
        float3 _2835 = float3(_938, _936, float(int(_248)));
        float3 _2837 = select(_2835, float3(0.0), isnan(_2835));
        float _946 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, _2837.xy, uint(rint(_2837.z))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, _2837.xy, uint(rint(_2837.z))).x;
        float _948 = fma(_732, 0.800000011920928955078125, _262);
        float _950 = fma(_732, 0.60000002384185791015625, _262);
        float _952 = fma(_730, 0.800000011920928955078125, _260);
        float3 _2855 = float3(_944, _942, float(int(_248)));
        float3 _2857 = select(_2855, float3(0.0), isnan(_2855));
        float _954 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, _2857.xy, uint(rint(_2857.z))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, _2857.xy, uint(rint(_2857.z))).x;
        float3 _2866 = float3(_950, _940, float(int(_248)));
        float3 _2868 = select(_2866, float3(0.0), isnan(_2866));
        float _956 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, _2868.xy, uint(rint(_2868.z))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, _2868.xy, uint(rint(_2868.z))).x;
        float3 _2877 = float3(_948, _952, float(int(_248)));
        float3 _2879 = select(_2877, float3(0.0), isnan(_2877));
        float _958 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, _2879.xy, uint(rint(_2879.z))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, _2879.xy, uint(rint(_2879.z))).x;
        float _960 = fma(_734, 0.20000000298023223876953125, _524);
        float _962 = _734 * 0.60000002384185791015625;
        float _964 = -_960;
        float _966 = _964 + _946;
        float _968 = _966 + (*spvDescriptorSet0.fp_c3)._m0[5].x;
        float _970 = precise::max(_968, _962);
        float _972 = precise::min(0.0, _970);
        bool _974 = _972 != _968;
        bool _976 = isnan(_972);
        bool _978 = _974 || _976;
        bool _980 = isnan(_968);
        bool _982 = _978 || _980;
        bool _984 = !_982;
        if (!_984)
        {
            float _986 = fma(_734, 0.4000000059604644775390625, _524);
            float _988 = _734 * 0.900000035762786865234375;
            float _990 = -_986;
            float _992 = _990 + _954;
            float _994 = _992 + (*spvDescriptorSet0.fp_c3)._m0[5].x;
            float _996 = precise::max(_994, _988);
            float _998 = precise::min(0.0, _996);
            bool _1000 = _998 != _994;
            bool _1002 = isnan(_998);
            bool _1004 = _1000 || _1002;
            bool _1006 = isnan(_994);
            bool _1008 = _1004 || _1006;
            bool _1010 = !_1008;
            if (!_1010)
            {
                float _1012 = _524 + _962;
                float _1014 = fma(_734, 1.2000000476837158203125, -1.0);
                float _1016 = -_1012;
                float _1018 = _1016 + _956;
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
                    float _1038 = fma(_734, 0.800000011920928955078125, _524);
                    float _1040 = fma(_734, 1.5, -1.0);
                    float _1042 = -_1038;
                    float _1044 = _1042 + _958;
                    float _1046 = _1044 + (*spvDescriptorSet0.fp_c3)._m0[5].x;
                    float _1048 = precise::max(_1046, _1040);
                    float _1050 = precise::min(0.0, _1048);
                    bool _1052 = _1050 != _1046;
                    bool _1054 = isnan(_1050);
                    bool _1056 = _1052 || _1054;
                    bool _1058 = isnan(_1046);
                    bool _1060 = _1056 || _1058;
                    _1062 = _1060;
                }
            }
        }
    }
    if (!_1062)
    {
        float _1064 = _908 + 1.0;
        _934 = _1064;
    }
    _1062 = false;
    float _1066 = _934;
    float _1068 = _1066 * 0.5;
    float _1070 = _930 * (*spvDescriptorSet0.fp_c3)._m0[7].x;
    float _1072 = -_1068;
    float _1074 = fma(_1072, _1070, 1.0);
    out.m_39.x = _1074;
    return out;
}

