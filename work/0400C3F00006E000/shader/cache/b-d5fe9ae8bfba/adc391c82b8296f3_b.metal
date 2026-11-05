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
    float2 _706 = float2(_62, _64);
    float _66 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_706, float2(0.0), isnan(_706))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_706, float2(0.0), isnan(_706))).x;
    float _68 = fma(_62, 2.0, -1.0);
    float _70 = fma(_64, 2.0, -1.0);
    float _72 = _68 * (*spvDescriptorSet0.fp_c3)._m0[0].x;
    float _74 = fma(_66, (*spvDescriptorSet0.fp_c3)._m0[0].w, (*spvDescriptorSet0.fp_c3)._m0[0].z);
    float _76 = _74 * (*spvDescriptorSet0.fp_c3)._m0[1].y;
    float _78 = _74 * _72;
    bool _82 = _76 > (*spvDescriptorSet0.fp_c4)._m0[33].y;
    bool _84 = _76 > (*spvDescriptorSet0.fp_c4)._m0[33].x;
    bool _86 = !_82;
    int _89 = _86 ? 0 : 1;
    int _91 = 2;
    if (!_82)
    {
        _91 = 1;
    }
    int _93 = _91;
    bool _95 = _76 > (*spvDescriptorSet0.fp_c4)._m0[33].z;
    int _97 = _93;
    if (!_84)
    {
        _97 = _89;
    }
    int _99 = _97;
    float _101 = _70 * (*spvDescriptorSet0.fp_c3)._m0[0].y;
    int _103 = _99 + 1;
    float _105 = _74 * _101;
    int _107 = _103;
    if (!_95)
    {
        _107 = _99;
    }
    int _109 = _107;
    float _111 = -(*spvDescriptorSet0.fp_c3)._m0[3].y;
    float _113 = _105 * _111;
    float _115 = -(*spvDescriptorSet0.fp_c3)._m0[2].y;
    float _117 = _105 * _115;
    bool _119 = _109 != 1;
    float _121 = -(*spvDescriptorSet0.fp_c3)._m0[4].y;
    float _123 = _105 * _121;
    float _125 = fma(_78, (*spvDescriptorSet0.fp_c3)._m0[3].x, _113);
    bool _127 = _109 != 0;
    float _129 = fma(_78, (*spvDescriptorSet0.fp_c3)._m0[2].x, _117);
    bool _131 = !_119;
    int _133 = _131 ? as_type<int>((*spvDescriptorSet0.fp_c4)._m0[28].y) : as_type<int>((*spvDescriptorSet0.fp_c4)._m0[32].y);
    float _135 = -_76;
    float _137 = fma(_135, (*spvDescriptorSet0.fp_c3)._m0[3].z, _125);
    bool _139 = !_119;
    int _141 = _139 ? as_type<int>((*spvDescriptorSet0.fp_c4)._m0[28].x) : as_type<int>((*spvDescriptorSet0.fp_c4)._m0[32].x);
    float _143 = -_76;
    float _145 = fma(_143, (*spvDescriptorSet0.fp_c3)._m0[2].z, _129);
    float _147 = _127 ? as_type<float>(_133) : (*spvDescriptorSet0.fp_c4)._m0[24].y;
    float _149 = _137 + (*spvDescriptorSet0.fp_c3)._m0[3].w;
    float _151 = _127 ? as_type<float>(_141) : (*spvDescriptorSet0.fp_c4)._m0[24].x;
    float _153 = _145 + (*spvDescriptorSet0.fp_c3)._m0[2].w;
    float _155 = fma(_78, (*spvDescriptorSet0.fp_c3)._m0[4].x, _123);
    float _157 = _149 * _147;
    float _159 = fma(_153, _151, _157);
    float _161 = -_76;
    float _163 = fma(_161, (*spvDescriptorSet0.fp_c3)._m0[4].z, _155);
    float _165 = _163 + (*spvDescriptorSet0.fp_c3)._m0[4].w;
    bool _167 = !_119;
    int _169 = _167 ? as_type<int>((*spvDescriptorSet0.fp_c4)._m0[26].y) : as_type<int>((*spvDescriptorSet0.fp_c4)._m0[30].y);
    bool _171 = !_119;
    int _173 = _171 ? as_type<int>((*spvDescriptorSet0.fp_c4)._m0[28].z) : as_type<int>((*spvDescriptorSet0.fp_c4)._m0[32].z);
    bool _175 = !_119;
    int _177 = _175 ? as_type<int>((*spvDescriptorSet0.fp_c4)._m0[25].y) : as_type<int>((*spvDescriptorSet0.fp_c4)._m0[29].y);
    bool _179 = !_119;
    int _181 = _179 ? as_type<int>((*spvDescriptorSet0.fp_c4)._m0[25].x) : as_type<int>((*spvDescriptorSet0.fp_c4)._m0[29].x);
    bool _183 = !_119;
    int _185 = _183 ? as_type<int>((*spvDescriptorSet0.fp_c4)._m0[26].x) : as_type<int>((*spvDescriptorSet0.fp_c4)._m0[30].x);
    float _187 = _127 ? as_type<float>(_169) : (*spvDescriptorSet0.fp_c4)._m0[22].y;
    bool _189 = !_119;
    int _191 = _189 ? as_type<int>((*spvDescriptorSet0.fp_c4)._m0[28].w) : as_type<int>((*spvDescriptorSet0.fp_c4)._m0[32].w);
    float _193 = _127 ? as_type<float>(_173) : (*spvDescriptorSet0.fp_c4)._m0[24].z;
    float _195 = _127 ? as_type<float>(_177) : (*spvDescriptorSet0.fp_c4)._m0[21].y;
    float _197 = _127 ? as_type<float>(_181) : (*spvDescriptorSet0.fp_c4)._m0[21].x;
    float _199 = _149 * _187;
    float _201 = _127 ? as_type<float>(_185) : (*spvDescriptorSet0.fp_c4)._m0[22].x;
    float _203 = fma(_165, _193, _159);
    float _205 = _127 ? as_type<float>(_191) : (*spvDescriptorSet0.fp_c4)._m0[24].w;
    float _207 = _149 * _195;
    float _209 = fma(_153, _201, _199);
    float _211 = _205 + _203;
    float _213 = fma(_153, _197, _207);
    bool _215 = !_119;
    int _217 = _215 ? as_type<int>((*spvDescriptorSet0.fp_c4)._m0[26].z) : as_type<int>((*spvDescriptorSet0.fp_c4)._m0[30].z);
    float _219 = 1.0 / _211;
    float _221 = float(_109);
    bool _223 = !_119;
    int _225 = _223 ? as_type<int>((*spvDescriptorSet0.fp_c4)._m0[25].z) : as_type<int>((*spvDescriptorSet0.fp_c4)._m0[29].z);
    float _227 = _127 ? as_type<float>(_217) : (*spvDescriptorSet0.fp_c4)._m0[22].z;
    bool _229 = !_119;
    int _231 = _229 ? as_type<int>((*spvDescriptorSet0.fp_c4)._m0[26].w) : as_type<int>((*spvDescriptorSet0.fp_c4)._m0[30].w);
    float _233 = rint(_221);
    float _235 = precise::max(_233, 0.0);
    uint _238 = uint(_235);
    uint _240 = clamp(_238, 0u, 65535u);
    bool _242 = !_119;
    int _244 = _242 ? as_type<int>((*spvDescriptorSet0.fp_c4)._m0[25].w) : as_type<int>((*spvDescriptorSet0.fp_c4)._m0[29].w);
    float _246 = fma(_165, _227, _209);
    float _248 = _127 ? as_type<float>(_225) : (*spvDescriptorSet0.fp_c4)._m0[21].z;
    float _250 = _127 ? as_type<float>(_231) : (*spvDescriptorSet0.fp_c4)._m0[22].w;
    float _252 = _127 ? as_type<float>(_244) : (*spvDescriptorSet0.fp_c4)._m0[21].w;
    float _254 = fma(_165, _248, _213);
    float _256 = _250 + _246;
    float _258 = _252 + _254;
    float _260 = _256 * _219;
    float _262 = _258 * _219;
    float3 _1126 = float3(_262, _260, float(int(_240)));
    float3 _1130 = select(_1126, float3(0.0), isnan(_1126));
    float _264 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, _1130.xy, uint(rint(_1130.z))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, _1130.xy, uint(rint(_1130.z))).x;
    float _266 = _149 * 78.233001708984375;
    float _268 = fma(_165, 12.98980045318603515625, _266);
    float _270 = fma(_153, 12.98980045318603515625, _266);
    float _272 = fma(_153, 45.16400146484375, _268);
    float _274 = fma(_165, 45.16400146484375, _270);
    float _276 = _272 + 94.67299652099609375;
    float _278 = _272 + 189.3459930419921875;
    float _280 = _276 * 0.15915493667125701904296875;
    float _282 = _278 * 0.15915493667125701904296875;
    float _284 = _274 + 94.67299652099609375;
    float _286 = _274 + 189.3459930419921875;
    float _288 = _280 * 6.283185482025146484375;
    float _290 = sin(_288);
    float _292 = _284 * 0.15915493667125701904296875;
    float _294 = _286 * 0.15915493667125701904296875;
    float _296 = _282 * 6.283185482025146484375;
    float _298 = sin(_296);
    float _300 = _294 * 6.283185482025146484375;
    float _302 = sin(_300);
    float _304 = _290 * 43758.546875;
    bool _306 = !_119;
    int _308 = _306 ? as_type<int>((*spvDescriptorSet0.fp_c4)._m0[4].x) : as_type<int>((*spvDescriptorSet0.fp_c4)._m0[7].x);
    bool _310 = !_119;
    int _312 = _310 ? as_type<int>((*spvDescriptorSet0.fp_c4)._m0[5].x) : as_type<int>((*spvDescriptorSet0.fp_c4)._m0[8].x);
    float _314 = _292 * 6.283185482025146484375;
    float _316 = sin(_314);
    bool _318 = !_119;
    int _320 = _318 ? as_type<int>((*spvDescriptorSet0.fp_c4)._m0[3].x) : as_type<int>((*spvDescriptorSet0.fp_c4)._m0[6].x);
    bool _322 = !_119;
    int _324 = _322 ? as_type<int>((*spvDescriptorSet0.fp_c4)._m0[3].y) : as_type<int>((*spvDescriptorSet0.fp_c4)._m0[6].y);
    bool _326 = !_119;
    int _328 = _326 ? as_type<int>((*spvDescriptorSet0.fp_c4)._m0[4].y) : as_type<int>((*spvDescriptorSet0.fp_c4)._m0[7].y);
    float _330 = _127 ? as_type<float>(_324) : (*spvDescriptorSet0.fp_c4)._m0[0].y;
    float _332 = _302 * 43758.546875;
    float _334 = _298 * 43758.546875;
    bool _336 = !_119;
    int _338 = _336 ? as_type<int>((*spvDescriptorSet0.fp_c4)._m0[5].y) : as_type<int>((*spvDescriptorSet0.fp_c4)._m0[8].y);
    float _340 = floor(_304);
    bool _342 = !_119;
    int _344 = _342 ? as_type<int>((*spvDescriptorSet0.fp_c4)._m0[27].y) : as_type<int>((*spvDescriptorSet0.fp_c4)._m0[31].y);
    float _346 = _149 * _330;
    float _348 = _127 ? as_type<float>(_338) : (*spvDescriptorSet0.fp_c4)._m0[2].y;
    float _350 = _316 * 43758.546875;
    float _352 = _127 ? as_type<float>(_328) : (*spvDescriptorSet0.fp_c4)._m0[1].y;
    float _354 = floor(_332);
    float _356 = _127 ? as_type<float>(_344) : (*spvDescriptorSet0.fp_c4)._m0[23].y;
    float _358 = _127 ? as_type<float>(_308) : (*spvDescriptorSet0.fp_c4)._m0[1].x;
    float _360 = _149 * _348;
    float _362 = _127 ? as_type<float>(_312) : (*spvDescriptorSet0.fp_c4)._m0[2].x;
    float _364 = _149 * _352;
    float _366 = _149 * _356;
    float _368 = floor(_350);
    float _370 = _127 ? as_type<float>(_320) : (*spvDescriptorSet0.fp_c4)._m0[0].x;
    float _372 = fma(_153, _362, _360);
    float _374 = -(*spvDescriptorSet0.fp_c3)._m0[5].w;
    float _376 = _374 + 1.0;
    float _378 = -_340;
    float _380 = _304 + _378;
    float _382 = fma(_153, _370, _346);
    float _384 = floor(_334);
    float _386 = fma(_376, (*spvDescriptorSet0.fp_c3)._m0[6].y, (*spvDescriptorSet0.fp_c3)._m0[6].w);
    float _388 = -_354;
    float _390 = _332 + _388;
    float _392 = fma(_153, _358, _364);
    float _394 = fma(_390, 2.0, -1.0);
    float _396 = -_368;
    float _398 = _350 + _396;
    float _400 = _386 * (*spvDescriptorSet0.fp_c3)._m0[5].z;
    bool _402 = !_119;
    int _404 = _402 ? as_type<int>((*spvDescriptorSet0.fp_c4)._m0[4].z) : as_type<int>((*spvDescriptorSet0.fp_c4)._m0[7].z);
    float _406 = fma(_398, 2.0, -1.0);
    float _408 = fma(_380, 2.0, -1.0);
    float _410 = _400 * _394;
    float _412 = _127 ? as_type<float>(_404) : (*spvDescriptorSet0.fp_c4)._m0[1].z;
    float _414 = -_384;
    float _416 = _334 + _414;
    float _418 = _400 * _406;
    float _420 = _400 * _408;
    float _422 = fma(_416, 2.0, -1.0);
    bool _424 = !_119;
    int _426 = _424 ? as_type<int>((*spvDescriptorSet0.fp_c4)._m0[3].z) : as_type<int>((*spvDescriptorSet0.fp_c4)._m0[6].z);
    float _428 = _418 * _418;
    float _430 = fma(_165, _412, _392);
    float _432 = _400 * _422;
    float _434 = _410 * _410;
    float _436 = _127 ? as_type<float>(_426) : (*spvDescriptorSet0.fp_c4)._m0[0].z;
    float _438 = fma(_420, _420, _428);
    float _440 = fma(_432, _432, _434);
    float _442 = fma(_165, _436, _382);
    float _444 = _438 + 1.0;
    float _446 = _440 + 1.0;
    float _448 = rsqrt(_444);
    bool _450 = !_119;
    int _452 = _450 ? as_type<int>((*spvDescriptorSet0.fp_c4)._m0[3].w) : as_type<int>((*spvDescriptorSet0.fp_c4)._m0[6].w);
    bool _454 = !_119;
    int _456 = _454 ? as_type<int>((*spvDescriptorSet0.fp_c4)._m0[5].z) : as_type<int>((*spvDescriptorSet0.fp_c4)._m0[8].z);
    bool _458 = !_119;
    int _460 = _458 ? as_type<int>((*spvDescriptorSet0.fp_c4)._m0[27].x) : as_type<int>((*spvDescriptorSet0.fp_c4)._m0[31].x);
    bool _462 = !_119;
    int _464 = _462 ? as_type<int>((*spvDescriptorSet0.fp_c4)._m0[4].w) : as_type<int>((*spvDescriptorSet0.fp_c4)._m0[7].w);
    float _466 = rsqrt(_446);
    float _468 = _127 ? as_type<float>(_452) : (*spvDescriptorSet0.fp_c4)._m0[0].w;
    float _470 = _127 ? as_type<float>(_460) : (*spvDescriptorSet0.fp_c4)._m0[23].x;
    float _472 = _468 + _442;
    float _474 = _127 ? as_type<float>(_464) : (*spvDescriptorSet0.fp_c4)._m0[1].w;
    bool _476 = !_119;
    int _478 = _476 ? as_type<int>((*spvDescriptorSet0.fp_c4)._m0[5].w) : as_type<int>((*spvDescriptorSet0.fp_c4)._m0[8].w);
    float _480 = fma(_153, _470, _366);
    float _482 = _127 ? as_type<float>(_456) : (*spvDescriptorSet0.fp_c4)._m0[2].z;
    float _484 = _474 + _430;
    float _486 = fma(_420, _448, _472);
    float _488 = _127 ? as_type<float>(_478) : (*spvDescriptorSet0.fp_c4)._m0[2].w;
    float _490 = fma(_432, _466, _472);
    float _492 = fma(_165, _482, _372);
    float _494 = fma(_418, _448, _484);
    float _496 = fma(_410, _466, _484);
    float _498 = _488 + _492;
    bool _500 = !_119;
    int _502 = _500 ? as_type<int>((*spvDescriptorSet0.fp_c4)._m0[16].y) : as_type<int>((*spvDescriptorSet0.fp_c4)._m0[20].y);
    float _504 = -_448;
    float _506 = _498 + _504;
    float _508 = -_466;
    float _510 = _498 + _508;
    bool _512 = !_119;
    int _514 = _512 ? as_type<int>((*spvDescriptorSet0.fp_c4)._m0[16].x) : as_type<int>((*spvDescriptorSet0.fp_c4)._m0[20].x);
    float _516 = _127 ? as_type<float>(_502) : (*spvDescriptorSet0.fp_c4)._m0[12].y;
    bool _518 = !_119;
    int _520 = _518 ? as_type<int>((*spvDescriptorSet0.fp_c4)._m0[15].x) : as_type<int>((*spvDescriptorSet0.fp_c4)._m0[19].x);
    bool _522 = !_119;
    int _524 = _522 ? as_type<int>((*spvDescriptorSet0.fp_c4)._m0[15].y) : as_type<int>((*spvDescriptorSet0.fp_c4)._m0[19].y);
    float _526 = _516 * _494;
    bool _528 = !_119;
    int _530 = _528 ? as_type<int>((*spvDescriptorSet0.fp_c4)._m0[16].z) : as_type<int>((*spvDescriptorSet0.fp_c4)._m0[20].z);
    float _532 = _127 ? as_type<float>(_514) : (*spvDescriptorSet0.fp_c4)._m0[12].x;
    bool _534 = !_119;
    int _536 = _534 ? as_type<int>((*spvDescriptorSet0.fp_c4)._m0[16].w) : as_type<int>((*spvDescriptorSet0.fp_c4)._m0[20].w);
    float _538 = _127 ? as_type<float>(_524) : (*spvDescriptorSet0.fp_c4)._m0[11].y;
    float _540 = fma(_532, _486, _526);
    float _542 = _516 * _496;
    float _544 = _127 ? as_type<float>(_530) : (*spvDescriptorSet0.fp_c4)._m0[12].z;
    float _546 = _127 ? as_type<float>(_520) : (*spvDescriptorSet0.fp_c4)._m0[11].x;
    float _548 = fma(_532, _490, _542);
    float _550 = _538 * _494;
    float _552 = _127 ? as_type<float>(_536) : (*spvDescriptorSet0.fp_c4)._m0[12].w;
    float _554 = fma(_544, _506, _540);
    float _556 = fma(_544, _510, _548);
    float _558 = fma(_546, _486, _550);
    float _560 = _538 * _496;
    float _562 = _552 + _556;
    float _564 = _552 + _554;
    bool _566 = !_119;
    int _568 = _566 ? as_type<int>((*spvDescriptorSet0.fp_c4)._m0[15].z) : as_type<int>((*spvDescriptorSet0.fp_c4)._m0[19].z);
    float _570 = fma(_546, _490, _560);
    float _572 = 1.0 / _562;
    float _574 = _127 ? as_type<float>(_568) : (*spvDescriptorSet0.fp_c4)._m0[11].z;
    bool _576 = !_119;
    int _578 = _576 ? as_type<int>((*spvDescriptorSet0.fp_c4)._m0[15].w) : as_type<int>((*spvDescriptorSet0.fp_c4)._m0[19].w);
    float _580 = fma(_574, _506, _558);
    bool _582 = !_119;
    int _584 = _582 ? as_type<int>((*spvDescriptorSet0.fp_c4)._m0[27].z) : as_type<int>((*spvDescriptorSet0.fp_c4)._m0[31].z);
    float _586 = 1.0 / _564;
    float _588 = fma(_574, _510, _570);
    float _590 = _127 ? as_type<float>(_578) : (*spvDescriptorSet0.fp_c4)._m0[11].w;
    float _592 = _127 ? as_type<float>(_584) : (*spvDescriptorSet0.fp_c4)._m0[23].z;
    bool _594 = !_119;
    int _596 = _594 ? as_type<int>((*spvDescriptorSet0.fp_c4)._m0[27].w) : as_type<int>((*spvDescriptorSet0.fp_c4)._m0[31].w);
    float _598 = _590 + _588;
    float _600 = _590 + _580;
    float _602 = fma(_165, _592, _480);
    float _604 = _127 ? as_type<float>(_596) : (*spvDescriptorSet0.fp_c4)._m0[23].w;
    float _606 = _598 * _572;
    float _608 = _600 * _586;
    float _610 = _604 + _602;
    float _612 = fma(_606, 0.5, 0.5);
    float _614 = 1.5 * (*spvDescriptorSet0.fp_c3)._m0[5].y;
    float _616 = fma(_608, 0.5, 0.5);
    float _618 = -_612;
    float _620 = fma(_610, _219, _618);
    float _622 = -_616;
    float _624 = fma(_610, _219, _622);
    float _626 = fma(_624, _614, -1.0);
    float _628 = -_610;
    float _630 = fma(_628, _219, _264);
    float _632 = fma(_620, _614, -1.0);
    float _634 = _630 + (*spvDescriptorSet0.fp_c3)._m0[5].x;
    float _636 = precise::max(_634, _632);
    float _638 = precise::max(_634, _626);
    float _640 = precise::min(0.0, _636);
    float _642 = precise::min(0.0, _638);
    bool _644 = _640 != _634;
    bool _646 = isnan(_640);
    bool _648 = _644 || _646;
    bool _650 = isnan(_634);
    bool _652 = _648 || _650;
    float _654 = fma(_376, (*spvDescriptorSet0.fp_c3)._m0[6].x, (*spvDescriptorSet0.fp_c3)._m0[6].z);
    bool _656 = _642 == _634;
    float _658 = float(_656);
    float _660 = _654 * (*spvDescriptorSet0.fp_c3)._m0[7].x;
    float _662 = _658;
    if (!_652)
    {
        float _664 = _658 + 1.0;
        _662 = _664;
    }
    float _666 = _662;
    float _668 = _666 * 0.5;
    float _670 = -_668;
    float _672 = fma(_660, _670, 1.0);
    out.m_39.x = _672;
    return out;
}

