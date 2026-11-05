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
    bool _950 = false;
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
    float2 _991 = float2(_62, _64);
    float _66 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_991, float2(0.0), isnan(_991))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_991, float2(0.0), isnan(_991))).x;
    float _68 = fma(_66, (*spvDescriptorSet0.fp_c3)._m0[0].w, (*spvDescriptorSet0.fp_c3)._m0[0].z);
    float _70 = _68 * (*spvDescriptorSet0.fp_c3)._m0[1].y;
    float _72 = fma(_64, 2.0, -1.0);
    float _74 = fma(_62, 2.0, -1.0);
    bool _78 = _70 > (*spvDescriptorSet0.fp_c4)._m0[33].y;
    float _80 = _72 * (*spvDescriptorSet0.fp_c3)._m0[0].y;
    bool _82 = _70 > (*spvDescriptorSet0.fp_c4)._m0[33].x;
    bool _84 = _70 > (*spvDescriptorSet0.fp_c4)._m0[33].z;
    float _86 = _68 * _80;
    bool _88 = !_78;
    int _91 = _88 ? 0 : 1;
    float _93 = -(*spvDescriptorSet0.fp_c3)._m0[3].y;
    float _95 = _86 * _93;
    float _97 = -(*spvDescriptorSet0.fp_c3)._m0[4].y;
    float _99 = _86 * _97;
    int _101 = 2;
    if (!_78)
    {
        _101 = 1;
    }
    int _103 = _101;
    int _105 = _103;
    if (!_82)
    {
        _105 = _91;
    }
    int _107 = _105;
    float _109 = _74 * (*spvDescriptorSet0.fp_c3)._m0[0].x;
    int _111 = _107 + 1;
    float _113 = _68 * _109;
    int _115 = _111;
    if (!_84)
    {
        _115 = _107;
    }
    int _117 = _115;
    float _119 = -(*spvDescriptorSet0.fp_c3)._m0[2].y;
    float _121 = _86 * _119;
    float _123 = fma(_113, (*spvDescriptorSet0.fp_c3)._m0[3].x, _95);
    bool _125 = _117 != 1;
    float _127 = fma(_113, (*spvDescriptorSet0.fp_c3)._m0[2].x, _121);
    bool _129 = _117 != 0;
    float _131 = -_70;
    float _133 = fma(_131, (*spvDescriptorSet0.fp_c3)._m0[3].z, _123);
    bool _135 = !_125;
    int _137 = _135 ? as_type<int>((*spvDescriptorSet0.fp_c4)._m0[28].y) : as_type<int>((*spvDescriptorSet0.fp_c4)._m0[32].y);
    float _139 = -_70;
    float _141 = fma(_139, (*spvDescriptorSet0.fp_c3)._m0[2].z, _127);
    bool _143 = !_125;
    int _145 = _143 ? as_type<int>((*spvDescriptorSet0.fp_c4)._m0[28].x) : as_type<int>((*spvDescriptorSet0.fp_c4)._m0[32].x);
    float _147 = fma(_113, (*spvDescriptorSet0.fp_c3)._m0[4].x, _99);
    float _149 = _129 ? as_type<float>(_137) : (*spvDescriptorSet0.fp_c4)._m0[24].y;
    float _151 = _133 + (*spvDescriptorSet0.fp_c3)._m0[3].w;
    float _153 = _129 ? as_type<float>(_145) : (*spvDescriptorSet0.fp_c4)._m0[24].x;
    float _155 = _141 + (*spvDescriptorSet0.fp_c3)._m0[2].w;
    float _157 = -_70;
    float _159 = fma(_157, (*spvDescriptorSet0.fp_c3)._m0[4].z, _147);
    float _161 = _151 * _149;
    float _163 = _159 + (*spvDescriptorSet0.fp_c3)._m0[4].w;
    float _165 = fma(_155, _153, _161);
    bool _167 = !_125;
    int _169 = _167 ? as_type<int>((*spvDescriptorSet0.fp_c4)._m0[25].y) : as_type<int>((*spvDescriptorSet0.fp_c4)._m0[29].y);
    bool _171 = !_125;
    int _173 = _171 ? as_type<int>((*spvDescriptorSet0.fp_c4)._m0[26].x) : as_type<int>((*spvDescriptorSet0.fp_c4)._m0[30].x);
    bool _175 = !_125;
    int _177 = _175 ? as_type<int>((*spvDescriptorSet0.fp_c4)._m0[26].y) : as_type<int>((*spvDescriptorSet0.fp_c4)._m0[30].y);
    bool _179 = !_125;
    int _181 = _179 ? as_type<int>((*spvDescriptorSet0.fp_c4)._m0[28].z) : as_type<int>((*spvDescriptorSet0.fp_c4)._m0[32].z);
    bool _183 = !_125;
    int _185 = _183 ? as_type<int>((*spvDescriptorSet0.fp_c4)._m0[25].x) : as_type<int>((*spvDescriptorSet0.fp_c4)._m0[29].x);
    float _187 = _129 ? as_type<float>(_169) : (*spvDescriptorSet0.fp_c4)._m0[21].y;
    float _189 = _129 ? as_type<float>(_177) : (*spvDescriptorSet0.fp_c4)._m0[22].y;
    bool _191 = !_125;
    int _193 = _191 ? as_type<int>((*spvDescriptorSet0.fp_c4)._m0[28].w) : as_type<int>((*spvDescriptorSet0.fp_c4)._m0[32].w);
    float _195 = _151 * _187;
    float _197 = _129 ? as_type<float>(_181) : (*spvDescriptorSet0.fp_c4)._m0[24].z;
    float _199 = _151 * _189;
    float _201 = _129 ? as_type<float>(_185) : (*spvDescriptorSet0.fp_c4)._m0[21].x;
    float _203 = _129 ? as_type<float>(_173) : (*spvDescriptorSet0.fp_c4)._m0[22].x;
    float _205 = fma(_163, _197, _165);
    float _207 = _129 ? as_type<float>(_193) : (*spvDescriptorSet0.fp_c4)._m0[24].w;
    float _209 = fma(_155, _201, _195);
    float _211 = fma(_155, _203, _199);
    float _213 = _207 + _205;
    bool _215 = !_125;
    int _217 = _215 ? as_type<int>((*spvDescriptorSet0.fp_c4)._m0[26].z) : as_type<int>((*spvDescriptorSet0.fp_c4)._m0[30].z);
    float _219 = float(_117);
    float _221 = 1.0 / _213;
    bool _223 = !_125;
    int _225 = _223 ? as_type<int>((*spvDescriptorSet0.fp_c4)._m0[25].z) : as_type<int>((*spvDescriptorSet0.fp_c4)._m0[29].z);
    bool _227 = !_125;
    int _229 = _227 ? as_type<int>((*spvDescriptorSet0.fp_c4)._m0[25].w) : as_type<int>((*spvDescriptorSet0.fp_c4)._m0[29].w);
    float _231 = _129 ? as_type<float>(_217) : (*spvDescriptorSet0.fp_c4)._m0[22].z;
    bool _233 = !_125;
    int _235 = _233 ? as_type<int>((*spvDescriptorSet0.fp_c4)._m0[26].w) : as_type<int>((*spvDescriptorSet0.fp_c4)._m0[30].w);
    float _237 = rint(_219);
    float _239 = precise::max(_237, 0.0);
    uint _242 = uint(_239);
    uint _244 = clamp(_242, 0u, 65535u);
    float _246 = _129 ? as_type<float>(_225) : (*spvDescriptorSet0.fp_c4)._m0[21].z;
    float _248 = fma(_163, _231, _211);
    float _250 = _129 ? as_type<float>(_235) : (*spvDescriptorSet0.fp_c4)._m0[22].w;
    float _252 = _129 ? as_type<float>(_229) : (*spvDescriptorSet0.fp_c4)._m0[21].w;
    float _254 = fma(_163, _246, _209);
    float _256 = _250 + _248;
    float _258 = _252 + _254;
    float _260 = _256 * _221;
    float _262 = _258 * _221;
    float3 _1411 = float3(_262, _260, float(int(_244)));
    float3 _1415 = select(_1411, float3(0.0), isnan(_1411));
    float _264 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, _1415.xy, uint(rint(_1415.z))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, _1415.xy, uint(rint(_1415.z))).x;
    float _266 = _151 * 78.233001708984375;
    float _268 = fma(_163, 12.98980045318603515625, _266);
    float _270 = fma(_155, 12.98980045318603515625, _266);
    bool _272 = !_125;
    int _274 = _272 ? as_type<int>((*spvDescriptorSet0.fp_c4)._m0[27].y) : as_type<int>((*spvDescriptorSet0.fp_c4)._m0[31].y);
    float _276 = fma(_155, 45.16400146484375, _268);
    float _278 = fma(_163, 45.16400146484375, _270);
    float _280 = _276 + 94.67299652099609375;
    float _282 = _278 + 94.67299652099609375;
    float _284 = _280 * 0.15915493667125701904296875;
    float _286 = _282 * 0.15915493667125701904296875;
    float _288 = _284 * 6.283185482025146484375;
    float _290 = sin(_288);
    bool _292 = !_125;
    int _294 = _292 ? as_type<int>((*spvDescriptorSet0.fp_c4)._m0[4].y) : as_type<int>((*spvDescriptorSet0.fp_c4)._m0[7].y);
    float _296 = _129 ? as_type<float>(_294) : (*spvDescriptorSet0.fp_c4)._m0[1].y;
    float _298 = _286 * 6.283185482025146484375;
    float _300 = sin(_298);
    float _302 = _290 * 43758.546875;
    float _304 = floor(_302);
    bool _306 = !_125;
    int _308 = _306 ? as_type<int>((*spvDescriptorSet0.fp_c4)._m0[3].y) : as_type<int>((*spvDescriptorSet0.fp_c4)._m0[6].y);
    float _310 = _300 * 43758.546875;
    bool _312 = !_125;
    int _314 = _312 ? as_type<int>((*spvDescriptorSet0.fp_c4)._m0[5].y) : as_type<int>((*spvDescriptorSet0.fp_c4)._m0[8].y);
    float _316 = _129 ? as_type<float>(_274) : (*spvDescriptorSet0.fp_c4)._m0[23].y;
    float _318 = floor(_310);
    float _320 = _129 ? as_type<float>(_314) : (*spvDescriptorSet0.fp_c4)._m0[2].y;
    float _322 = _129 ? as_type<float>(_308) : (*spvDescriptorSet0.fp_c4)._m0[0].y;
    float _324 = _151 * _316;
    float _326 = _151 * _296;
    float _328 = _151 * _320;
    float _330 = _151 * _322;
    float _332 = -(*spvDescriptorSet0.fp_c3)._m0[5].w;
    float _334 = _332 + 1.0;
    float _336 = -_304;
    float _338 = _302 + _336;
    float _340 = fma(_334, (*spvDescriptorSet0.fp_c3)._m0[6].y, (*spvDescriptorSet0.fp_c3)._m0[6].w);
    bool _342 = !_125;
    int _344 = _342 ? as_type<int>((*spvDescriptorSet0.fp_c4)._m0[3].x) : as_type<int>((*spvDescriptorSet0.fp_c4)._m0[6].x);
    float _346 = fma(_338, 2.0, -1.0);
    float _348 = -_318;
    float _350 = _310 + _348;
    bool _352 = !_125;
    int _354 = _352 ? as_type<int>((*spvDescriptorSet0.fp_c4)._m0[4].x) : as_type<int>((*spvDescriptorSet0.fp_c4)._m0[7].x);
    float _356 = _340 * (*spvDescriptorSet0.fp_c3)._m0[5].z;
    float _358 = _129 ? as_type<float>(_344) : (*spvDescriptorSet0.fp_c4)._m0[0].x;
    float _360 = fma(_350, 2.0, -1.0);
    float _362 = _129 ? as_type<float>(_354) : (*spvDescriptorSet0.fp_c4)._m0[1].x;
    float _364 = _356 * _346;
    float _366 = _356 * _360;
    float _368 = fma(_155, _358, _330);
    float _370 = fma(_155, _362, _326);
    float _372 = _366 * _366;
    bool _374 = !_125;
    int _376 = _374 ? as_type<int>((*spvDescriptorSet0.fp_c4)._m0[5].x) : as_type<int>((*spvDescriptorSet0.fp_c4)._m0[8].x);
    bool _378 = !_125;
    int _380 = _378 ? as_type<int>((*spvDescriptorSet0.fp_c4)._m0[3].z) : as_type<int>((*spvDescriptorSet0.fp_c4)._m0[6].z);
    float _382 = fma(_364, _364, _372);
    bool _384 = !_125;
    int _386 = _384 ? as_type<int>((*spvDescriptorSet0.fp_c4)._m0[4].z) : as_type<int>((*spvDescriptorSet0.fp_c4)._m0[7].z);
    bool _388 = !_125;
    int _390 = _388 ? as_type<int>((*spvDescriptorSet0.fp_c4)._m0[5].z) : as_type<int>((*spvDescriptorSet0.fp_c4)._m0[8].z);
    float _392 = _382 + 1.0;
    float _394 = _129 ? as_type<float>(_376) : (*spvDescriptorSet0.fp_c4)._m0[2].x;
    float _396 = _129 ? as_type<float>(_380) : (*spvDescriptorSet0.fp_c4)._m0[0].z;
    float _398 = rsqrt(_392);
    float _400 = _129 ? as_type<float>(_386) : (*spvDescriptorSet0.fp_c4)._m0[1].z;
    float _402 = fma(_155, _394, _328);
    float _404 = _129 ? as_type<float>(_390) : (*spvDescriptorSet0.fp_c4)._m0[2].z;
    float _406 = fma(_163, _396, _368);
    float _408 = fma(_163, _400, _370);
    float _410 = fma(_163, _404, _402);
    bool _412 = !_125;
    int _414 = _412 ? as_type<int>((*spvDescriptorSet0.fp_c4)._m0[3].w) : as_type<int>((*spvDescriptorSet0.fp_c4)._m0[6].w);
    bool _416 = !_125;
    int _418 = _416 ? as_type<int>((*spvDescriptorSet0.fp_c4)._m0[4].w) : as_type<int>((*spvDescriptorSet0.fp_c4)._m0[7].w);
    bool _420 = !_125;
    int _422 = _420 ? as_type<int>((*spvDescriptorSet0.fp_c4)._m0[5].w) : as_type<int>((*spvDescriptorSet0.fp_c4)._m0[8].w);
    bool _424 = !_125;
    int _426 = _424 ? as_type<int>((*spvDescriptorSet0.fp_c4)._m0[27].x) : as_type<int>((*spvDescriptorSet0.fp_c4)._m0[31].x);
    float _428 = _129 ? as_type<float>(_414) : (*spvDescriptorSet0.fp_c4)._m0[0].w;
    float _430 = _129 ? as_type<float>(_418) : (*spvDescriptorSet0.fp_c4)._m0[1].w;
    float _432 = _129 ? as_type<float>(_422) : (*spvDescriptorSet0.fp_c4)._m0[2].w;
    float _434 = _428 + _406;
    float _436 = _129 ? as_type<float>(_426) : (*spvDescriptorSet0.fp_c4)._m0[23].x;
    float _438 = _430 + _408;
    float _440 = _432 + _410;
    float _442 = fma(_364, _398, _434);
    float _444 = fma(_155, _436, _324);
    bool _446 = !_125;
    int _448 = _446 ? as_type<int>((*spvDescriptorSet0.fp_c4)._m0[27].z) : as_type<int>((*spvDescriptorSet0.fp_c4)._m0[31].z);
    float _450 = fma(_366, _398, _438);
    float _452 = -_398;
    float _454 = _440 + _452;
    float _456 = _129 ? as_type<float>(_448) : (*spvDescriptorSet0.fp_c4)._m0[23].z;
    bool _458 = !_125;
    int _460 = _458 ? as_type<int>((*spvDescriptorSet0.fp_c4)._m0[13].y) : as_type<int>((*spvDescriptorSet0.fp_c4)._m0[17].y);
    bool _462 = !_125;
    int _464 = _462 ? as_type<int>((*spvDescriptorSet0.fp_c4)._m0[14].y) : as_type<int>((*spvDescriptorSet0.fp_c4)._m0[18].y);
    float _466 = fma(_163, _456, _444);
    bool _468 = !_125;
    int _470 = _468 ? as_type<int>((*spvDescriptorSet0.fp_c4)._m0[15].y) : as_type<int>((*spvDescriptorSet0.fp_c4)._m0[19].y);
    bool _472 = !_125;
    int _474 = _472 ? as_type<int>((*spvDescriptorSet0.fp_c4)._m0[16].y) : as_type<int>((*spvDescriptorSet0.fp_c4)._m0[20].y);
    bool _476 = !_125;
    int _478 = _476 ? as_type<int>((*spvDescriptorSet0.fp_c4)._m0[14].x) : as_type<int>((*spvDescriptorSet0.fp_c4)._m0[18].x);
    float _480 = _129 ? as_type<float>(_460) : (*spvDescriptorSet0.fp_c4)._m0[9].y;
    float _482 = _129 ? as_type<float>(_474) : (*spvDescriptorSet0.fp_c4)._m0[12].y;
    float _484 = _129 ? as_type<float>(_464) : (*spvDescriptorSet0.fp_c4)._m0[10].y;
    float _486 = _129 ? as_type<float>(_470) : (*spvDescriptorSet0.fp_c4)._m0[11].y;
    float _488 = _482 * _450;
    float _490 = _484 * _450;
    bool _492 = !_125;
    int _494 = _492 ? as_type<int>((*spvDescriptorSet0.fp_c4)._m0[16].x) : as_type<int>((*spvDescriptorSet0.fp_c4)._m0[20].x);
    float _496 = _486 * _450;
    float _498 = _129 ? as_type<float>(_478) : (*spvDescriptorSet0.fp_c4)._m0[10].x;
    float _500 = _480 * _450;
    bool _502 = !_125;
    int _504 = _502 ? as_type<int>((*spvDescriptorSet0.fp_c4)._m0[13].x) : as_type<int>((*spvDescriptorSet0.fp_c4)._m0[17].x);
    float _506 = fma(_498, _442, _490);
    bool _508 = !_125;
    int _510 = _508 ? as_type<int>((*spvDescriptorSet0.fp_c4)._m0[16].z) : as_type<int>((*spvDescriptorSet0.fp_c4)._m0[20].z);
    float _512 = _129 ? as_type<float>(_494) : (*spvDescriptorSet0.fp_c4)._m0[12].x;
    float _514 = _129 ? as_type<float>(_504) : (*spvDescriptorSet0.fp_c4)._m0[9].x;
    bool _516 = !_125;
    int _518 = _516 ? as_type<int>((*spvDescriptorSet0.fp_c4)._m0[15].x) : as_type<int>((*spvDescriptorSet0.fp_c4)._m0[19].x);
    float _520 = fma(_512, _442, _488);
    bool _522 = !_125;
    int _524 = _522 ? as_type<int>((*spvDescriptorSet0.fp_c4)._m0[13].z) : as_type<int>((*spvDescriptorSet0.fp_c4)._m0[17].z);
    float _526 = fma(_514, _442, _500);
    float _528 = _129 ? as_type<float>(_510) : (*spvDescriptorSet0.fp_c4)._m0[12].z;
    bool _530 = !_125;
    int _532 = _530 ? as_type<int>((*spvDescriptorSet0.fp_c4)._m0[16].w) : as_type<int>((*spvDescriptorSet0.fp_c4)._m0[20].w);
    float _534 = _129 ? as_type<float>(_518) : (*spvDescriptorSet0.fp_c4)._m0[11].x;
    float _536 = fma(_528, _454, _520);
    float _538 = _129 ? as_type<float>(_524) : (*spvDescriptorSet0.fp_c4)._m0[9].z;
    float _540 = fma(_534, _442, _496);
    float _542 = fma(_538, _454, _526);
    float _544 = _129 ? as_type<float>(_532) : (*spvDescriptorSet0.fp_c4)._m0[12].w;
    bool _546 = !_125;
    int _548 = _546 ? as_type<int>((*spvDescriptorSet0.fp_c4)._m0[14].z) : as_type<int>((*spvDescriptorSet0.fp_c4)._m0[18].z);
    bool _550 = !_125;
    int _552 = _550 ? as_type<int>((*spvDescriptorSet0.fp_c4)._m0[15].z) : as_type<int>((*spvDescriptorSet0.fp_c4)._m0[19].z);
    float _554 = _544 + _536;
    float _556 = _129 ? as_type<float>(_548) : (*spvDescriptorSet0.fp_c4)._m0[10].z;
    float _558 = _129 ? as_type<float>(_552) : (*spvDescriptorSet0.fp_c4)._m0[11].z;
    float _560 = 1.0 / _554;
    float _562 = fma(_556, _454, _506);
    float _564 = fma(_558, _454, _540);
    bool _566 = !_125;
    int _568 = _566 ? as_type<int>((*spvDescriptorSet0.fp_c4)._m0[14].w) : as_type<int>((*spvDescriptorSet0.fp_c4)._m0[18].w);
    bool _570 = !_125;
    int _572 = _570 ? as_type<int>((*spvDescriptorSet0.fp_c4)._m0[27].w) : as_type<int>((*spvDescriptorSet0.fp_c4)._m0[31].w);
    float _574 = _129 ? as_type<float>(_568) : (*spvDescriptorSet0.fp_c4)._m0[10].w;
    bool _576 = !_125;
    int _578 = _576 ? as_type<int>((*spvDescriptorSet0.fp_c4)._m0[15].w) : as_type<int>((*spvDescriptorSet0.fp_c4)._m0[19].w);
    bool _580 = !_125;
    int _582 = _580 ? as_type<int>((*spvDescriptorSet0.fp_c4)._m0[13].w) : as_type<int>((*spvDescriptorSet0.fp_c4)._m0[17].w);
    float _584 = _574 + _562;
    float _586 = _129 ? as_type<float>(_572) : (*spvDescriptorSet0.fp_c4)._m0[23].w;
    float _588 = _129 ? as_type<float>(_578) : (*spvDescriptorSet0.fp_c4)._m0[11].w;
    float _590 = _584 * _560;
    float _592 = _129 ? as_type<float>(_582) : (*spvDescriptorSet0.fp_c4)._m0[9].w;
    float _594 = _586 + _466;
    float _596 = _560 * 0.5;
    float _598 = _588 + _564;
    float _600 = _592 + _542;
    float _602 = fma(_590, -0.5, 0.5);
    float _604 = _594 * _221;
    float _606 = fma(_598, _596, 0.5);
    float _608 = fma(_600, _596, 0.5);
    float _610 = (*spvDescriptorSet0.fp_c3)._m0[5].y * 0.100000001490116119384765625;
    float _612 = -_602;
    float _614 = _260 + _612;
    float _616 = -_606;
    float _618 = _604 + _616;
    float _620 = -_608;
    float _622 = _262 + _620;
    float _624 = _614 * _610;
    float _626 = _618 * _610;
    float _628 = _622 * _610;
    float _630 = _626 * 1.5;
    float _632 = fma(_334, (*spvDescriptorSet0.fp_c3)._m0[6].x, (*spvDescriptorSet0.fp_c3)._m0[6].z);
    float _634 = _632 * (*spvDescriptorSet0.fp_c3)._m0[7].x;
    float _636 = -_604;
    float _638 = _636 + _264;
    float _640 = _638 + (*spvDescriptorSet0.fp_c3)._m0[5].x;
    float _642 = precise::max(_640, _630);
    float _644 = precise::min(0.0, _642);
    bool _646 = _644 != _640;
    bool _648 = isnan(_644);
    bool _650 = _646 || _648;
    bool _652 = isnan(_640);
    bool _654 = _650 || _652;
    bool _656 = !_654;
    float _948;
    if (!_656)
    {
        float _658 = _260 + _624;
        float _660 = _262 + _628;
        float3 _2270 = float3(_660, _658, float(int(_244)));
        float3 _2272 = select(_2270, float3(0.0), isnan(_2270));
        float _662 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, _2272.xy, uint(rint(_2272.z))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, _2272.xy, uint(rint(_2272.z))).x;
        float _664 = _604 + _626;
        float _666 = _626 * 3.0;
        float _668 = -_664;
        float _670 = _668 + _662;
        float _672 = _670 + (*spvDescriptorSet0.fp_c3)._m0[5].x;
        float _674 = precise::max(_672, _666);
        float _676 = precise::min(0.0, _674);
        bool _678 = _676 != _672;
        bool _680 = isnan(_676);
        bool _682 = _678 || _680;
        bool _684 = isnan(_672);
        bool _686 = _682 || _684;
        bool _688 = !_686;
        if (!_688)
        {
            float _690 = fma(_624, 2.0, _260);
            float _692 = fma(_628, 2.0, _262);
            float3 _2325 = float3(_692, _690, float(int(_244)));
            float3 _2327 = select(_2325, float3(0.0), isnan(_2325));
            float _694 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, _2327.xy, uint(rint(_2327.z))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, _2327.xy, uint(rint(_2327.z))).x;
            float _696 = fma(_626, 2.0, _604);
            float _698 = _626 * 4.5;
            float _700 = -_696;
            float _702 = _700 + _694;
            float _704 = _702 + (*spvDescriptorSet0.fp_c3)._m0[5].x;
            float _706 = precise::max(_704, _698);
            float _708 = precise::min(0.0, _706);
            bool _710 = _708 != _704;
            bool _712 = isnan(_708);
            bool _714 = _710 || _712;
            bool _716 = isnan(_704);
            bool _718 = _714 || _716;
            bool _720 = !_718;
            if (!_720)
            {
                float _722 = fma(_624, 3.0, _260);
                float _724 = fma(_628, 3.0, _262);
                float3 _2380 = float3(_724, _722, float(int(_244)));
                float3 _2382 = select(_2380, float3(0.0), isnan(_2380));
                float _726 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, _2382.xy, uint(rint(_2382.z))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, _2382.xy, uint(rint(_2382.z))).x;
                float _728 = fma(_626, 3.0, _604);
                float _730 = _626 * 6.0;
                float _732 = -_728;
                float _734 = _732 + _726;
                float _736 = _734 + (*spvDescriptorSet0.fp_c3)._m0[5].x;
                float _738 = precise::max(_736, _730);
                float _740 = precise::min(0.0, _738);
                bool _742 = _740 != _736;
                bool _744 = isnan(_740);
                bool _746 = _742 || _744;
                bool _748 = isnan(_736);
                bool _750 = _746 || _748;
                bool _752 = !_750;
                if (!_752)
                {
                    float _754 = fma(_624, 4.0, _260);
                    float _756 = fma(_628, 4.0, _262);
                    float3 _2436 = float3(_756, _754, float(int(_244)));
                    float3 _2438 = select(_2436, float3(0.0), isnan(_2436));
                    float _758 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, _2438.xy, uint(rint(_2438.z))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, _2438.xy, uint(rint(_2438.z))).x;
                    float _760 = fma(_626, 4.0, _604);
                    float _762 = _626 * 7.5;
                    float _764 = -_760;
                    float _766 = _764 + _758;
                    float _768 = _766 + (*spvDescriptorSet0.fp_c3)._m0[5].x;
                    float _770 = precise::max(_768, _762);
                    float _772 = precise::min(0.0, _770);
                    bool _774 = _772 != _768;
                    bool _776 = isnan(_772);
                    bool _778 = _774 || _776;
                    bool _780 = isnan(_768);
                    bool _782 = _778 || _780;
                    bool _784 = !_782;
                    if (!_784)
                    {
                        float _786 = fma(_624, 5.0, _260);
                        float _788 = fma(_628, 5.0, _262);
                        float3 _2492 = float3(_788, _786, float(int(_244)));
                        float3 _2494 = select(_2492, float3(0.0), isnan(_2492));
                        float _790 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, _2494.xy, uint(rint(_2494.z))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, _2494.xy, uint(rint(_2494.z))).x;
                        float _792 = fma(_626, 5.0, _604);
                        float _794 = _626 * 9.0;
                        float _796 = -_792;
                        float _798 = _796 + _790;
                        float _800 = _798 + (*spvDescriptorSet0.fp_c3)._m0[5].x;
                        float _802 = precise::max(_800, _794);
                        float _804 = precise::min(0.0, _802);
                        bool _806 = _804 != _800;
                        bool _808 = isnan(_804);
                        bool _810 = _806 || _808;
                        bool _812 = isnan(_800);
                        bool _814 = _810 || _812;
                        bool _816 = !_814;
                        if (!_816)
                        {
                            float _818 = fma(_624, 6.0, _260);
                            float _820 = fma(_628, 6.0, _262);
                            float3 _2547 = float3(_820, _818, float(int(_244)));
                            float3 _2549 = select(_2547, float3(0.0), isnan(_2547));
                            float _822 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, _2549.xy, uint(rint(_2549.z))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, _2549.xy, uint(rint(_2549.z))).x;
                            float _824 = fma(_626, 6.0, _604);
                            float _826 = _626 * 10.5;
                            float _828 = -_824;
                            float _830 = _828 + _822;
                            float _832 = _830 + (*spvDescriptorSet0.fp_c3)._m0[5].x;
                            float _834 = precise::max(_832, _826);
                            float _836 = precise::min(0.0, _834);
                            bool _838 = _836 != _832;
                            bool _840 = isnan(_836);
                            bool _842 = _838 || _840;
                            bool _844 = isnan(_832);
                            bool _846 = _842 || _844;
                            bool _848 = !_846;
                            if (!_848)
                            {
                                float _850 = fma(_624, 7.0, _260);
                                float _852 = fma(_628, 7.0, _262);
                                float3 _2603 = float3(_852, _850, float(int(_244)));
                                float3 _2605 = select(_2603, float3(0.0), isnan(_2603));
                                float _854 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, _2605.xy, uint(rint(_2605.z))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, _2605.xy, uint(rint(_2605.z))).x;
                                float _856 = fma(_626, 7.0, _604);
                                float _858 = _626 * 12.0;
                                float _860 = -_856;
                                float _862 = _860 + _854;
                                float _864 = _862 + (*spvDescriptorSet0.fp_c3)._m0[5].x;
                                float _866 = precise::max(_864, _858);
                                float _868 = precise::min(0.0, _866);
                                bool _870 = _868 != _864;
                                bool _872 = isnan(_868);
                                bool _874 = _870 || _872;
                                bool _876 = isnan(_864);
                                bool _878 = _874 || _876;
                                bool _880 = !_878;
                                if (!_880)
                                {
                                    float _882 = fma(_624, 8.0, _260);
                                    float _884 = fma(_628, 8.0, _262);
                                    float3 _2659 = float3(_884, _882, float(int(_244)));
                                    float3 _2661 = select(_2659, float3(0.0), isnan(_2659));
                                    float _886 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, _2661.xy, uint(rint(_2661.z))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, _2661.xy, uint(rint(_2661.z))).x;
                                    float _888 = fma(_626, 8.0, _604);
                                    float _890 = fma(_626, 13.5, -1.0);
                                    float _892 = -_888;
                                    float _894 = _892 + _886;
                                    float _896 = _894 + (*spvDescriptorSet0.fp_c3)._m0[5].x;
                                    float _898 = precise::max(_896, _890);
                                    float _900 = precise::min(0.0, _898);
                                    bool _902 = _900 != _896;
                                    bool _904 = isnan(_900);
                                    bool _906 = _902 || _904;
                                    bool _908 = isnan(_896);
                                    bool _910 = _906 || _908;
                                    bool _912 = !_910;
                                    if (!_912)
                                    {
                                        float _914 = fma(_624, 9.0, _260);
                                        float _916 = fma(_628, 9.0, _262);
                                        float3 _2714 = float3(_916, _914, float(int(_244)));
                                        float3 _2716 = select(_2714, float3(0.0), isnan(_2714));
                                        float _918 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, _2716.xy, uint(rint(_2716.z))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, _2716.xy, uint(rint(_2716.z))).x;
                                        float _920 = fma(_626, 9.0, _604);
                                        float _922 = fma(_626, 15.0, -1.0);
                                        float _924 = -_920;
                                        float _926 = _924 + _918;
                                        float _928 = _926 + (*spvDescriptorSet0.fp_c3)._m0[5].x;
                                        float _930 = precise::max(_928, _922);
                                        float _932 = precise::min(0.0, _930);
                                        bool _934 = _932 != _928;
                                        bool _936 = isnan(_932);
                                        bool _938 = _934 || _936;
                                        bool _940 = isnan(_928);
                                        bool _942 = _938 || _940;
                                        float _944 = 15.0;
                                        if (_942)
                                        {
                                            _944 = 0.0;
                                        }
                                        float _946 = _944;
                                        _948 = _946;
                                        _950 = _942;
                                    }
                                }
                            }
                        }
                    }
                }
            }
        }
    }
    if (!_950)
    {
        _948 = 1.0;
    }
    _950 = false;
    float _952 = _948;
    float _954 = -_952;
    float _956 = fma(_634, _954, 1.0);
    out.m_39.x = _956;
    return out;
}

