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
    bool _1430 = false;
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
    float2 _1471 = float2(_62, _64);
    float _66 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_1471, float2(0.0), isnan(_1471))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_1471, float2(0.0), isnan(_1471))).x;
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
    float _163 = fma(_155, _153, _161);
    float _165 = _159 + (*spvDescriptorSet0.fp_c3)._m0[4].w;
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
    float _205 = fma(_165, _197, _163);
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
    float _248 = fma(_165, _231, _211);
    float _250 = _129 ? as_type<float>(_235) : (*spvDescriptorSet0.fp_c4)._m0[22].w;
    float _252 = _129 ? as_type<float>(_229) : (*spvDescriptorSet0.fp_c4)._m0[21].w;
    float _254 = fma(_165, _246, _209);
    float _256 = _250 + _248;
    float _258 = _252 + _254;
    float _260 = _256 * _221;
    float _262 = _258 * _221;
    float3 _1891 = float3(_262, _260, float(int(_244)));
    float3 _1895 = select(_1891, float3(0.0), isnan(_1891));
    float _264 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, _1895.xy, uint(rint(_1895.z))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, _1895.xy, uint(rint(_1895.z))).x;
    float _266 = _151 * 78.233001708984375;
    float _268 = fma(_165, 12.98980045318603515625, _266);
    float _270 = fma(_155, 12.98980045318603515625, _266);
    bool _272 = !_125;
    int _274 = _272 ? as_type<int>((*spvDescriptorSet0.fp_c4)._m0[27].y) : as_type<int>((*spvDescriptorSet0.fp_c4)._m0[31].y);
    float _276 = fma(_155, 45.16400146484375, _268);
    float _278 = fma(_165, 45.16400146484375, _270);
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
    float _406 = fma(_165, _396, _368);
    float _408 = fma(_165, _400, _370);
    float _410 = fma(_165, _404, _402);
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
    float _462 = fma(_165, _456, _444);
    bool _464 = !_125;
    int _466 = _464 ? as_type<int>((*spvDescriptorSet0.fp_c4)._m0[14].y) : as_type<int>((*spvDescriptorSet0.fp_c4)._m0[18].y);
    bool _468 = !_125;
    int _470 = _468 ? as_type<int>((*spvDescriptorSet0.fp_c4)._m0[15].y) : as_type<int>((*spvDescriptorSet0.fp_c4)._m0[19].y);
    bool _472 = !_125;
    int _474 = _472 ? as_type<int>((*spvDescriptorSet0.fp_c4)._m0[16].y) : as_type<int>((*spvDescriptorSet0.fp_c4)._m0[20].y);
    bool _476 = !_125;
    int _478 = _476 ? as_type<int>((*spvDescriptorSet0.fp_c4)._m0[14].x) : as_type<int>((*spvDescriptorSet0.fp_c4)._m0[18].x);
    float _480 = _129 ? as_type<float>(_460) : (*spvDescriptorSet0.fp_c4)._m0[9].y;
    float _482 = _129 ? as_type<float>(_474) : (*spvDescriptorSet0.fp_c4)._m0[12].y;
    float _484 = _129 ? as_type<float>(_466) : (*spvDescriptorSet0.fp_c4)._m0[10].y;
    float _486 = _129 ? as_type<float>(_470) : (*spvDescriptorSet0.fp_c4)._m0[11].y;
    float _488 = _482 * _450;
    float _490 = _484 * _450;
    float _492 = _486 * _450;
    bool _494 = !_125;
    int _496 = _494 ? as_type<int>((*spvDescriptorSet0.fp_c4)._m0[16].x) : as_type<int>((*spvDescriptorSet0.fp_c4)._m0[20].x);
    float _498 = _129 ? as_type<float>(_478) : (*spvDescriptorSet0.fp_c4)._m0[10].x;
    float _500 = _480 * _450;
    bool _502 = !_125;
    int _504 = _502 ? as_type<int>((*spvDescriptorSet0.fp_c4)._m0[13].x) : as_type<int>((*spvDescriptorSet0.fp_c4)._m0[17].x);
    float _506 = fma(_498, _442, _490);
    bool _508 = !_125;
    int _510 = _508 ? as_type<int>((*spvDescriptorSet0.fp_c4)._m0[16].z) : as_type<int>((*spvDescriptorSet0.fp_c4)._m0[20].z);
    float _512 = _129 ? as_type<float>(_496) : (*spvDescriptorSet0.fp_c4)._m0[12].x;
    float _514 = _129 ? as_type<float>(_504) : (*spvDescriptorSet0.fp_c4)._m0[9].x;
    float _516 = fma(_512, _442, _488);
    bool _518 = !_125;
    int _520 = _518 ? as_type<int>((*spvDescriptorSet0.fp_c4)._m0[15].x) : as_type<int>((*spvDescriptorSet0.fp_c4)._m0[19].x);
    bool _522 = !_125;
    int _524 = _522 ? as_type<int>((*spvDescriptorSet0.fp_c4)._m0[13].z) : as_type<int>((*spvDescriptorSet0.fp_c4)._m0[17].z);
    float _526 = fma(_514, _442, _500);
    float _528 = _129 ? as_type<float>(_510) : (*spvDescriptorSet0.fp_c4)._m0[12].z;
    bool _530 = !_125;
    int _532 = _530 ? as_type<int>((*spvDescriptorSet0.fp_c4)._m0[16].w) : as_type<int>((*spvDescriptorSet0.fp_c4)._m0[20].w);
    float _534 = _129 ? as_type<float>(_520) : (*spvDescriptorSet0.fp_c4)._m0[11].x;
    float _536 = fma(_528, _454, _516);
    float _538 = _129 ? as_type<float>(_524) : (*spvDescriptorSet0.fp_c4)._m0[9].z;
    float _540 = fma(_534, _442, _492);
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
    float _592 = _586 + _462;
    float _594 = _129 ? as_type<float>(_582) : (*spvDescriptorSet0.fp_c4)._m0[9].w;
    float _596 = _588 + _564;
    float _598 = _560 * 0.5;
    float _600 = fma(_590, -0.5, 0.5);
    float _602 = _594 + _542;
    float _604 = _592 * _221;
    float _606 = fma(_596, _598, 0.5);
    float _608 = -_600;
    float _610 = _260 + _608;
    float _612 = fma(_602, _598, 0.5);
    float _614 = (*spvDescriptorSet0.fp_c3)._m0[5].y * 0.039999999105930328369140625;
    float _616 = -_606;
    float _618 = _604 + _616;
    float _620 = -_612;
    float _622 = _262 + _620;
    float _624 = _610 * _614;
    float _626 = _618 * _614;
    float _628 = _622 * _614;
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
    float _1428;
    if (!_656)
    {
        float _658 = _260 + _624;
        float _660 = _262 + _628;
        float3 _2750 = float3(_660, _658, float(int(_244)));
        float3 _2752 = select(_2750, float3(0.0), isnan(_2750));
        float _662 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, _2752.xy, uint(rint(_2752.z))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, _2752.xy, uint(rint(_2752.z))).x;
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
            float3 _2805 = float3(_692, _690, float(int(_244)));
            float3 _2807 = select(_2805, float3(0.0), isnan(_2805));
            float _694 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, _2807.xy, uint(rint(_2807.z))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, _2807.xy, uint(rint(_2807.z))).x;
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
                float3 _2860 = float3(_724, _722, float(int(_244)));
                float3 _2862 = select(_2860, float3(0.0), isnan(_2860));
                float _726 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, _2862.xy, uint(rint(_2862.z))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, _2862.xy, uint(rint(_2862.z))).x;
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
                    float3 _2916 = float3(_756, _754, float(int(_244)));
                    float3 _2918 = select(_2916, float3(0.0), isnan(_2916));
                    float _758 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, _2918.xy, uint(rint(_2918.z))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, _2918.xy, uint(rint(_2918.z))).x;
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
                        float3 _2972 = float3(_788, _786, float(int(_244)));
                        float3 _2974 = select(_2972, float3(0.0), isnan(_2972));
                        float _790 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, _2974.xy, uint(rint(_2974.z))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, _2974.xy, uint(rint(_2974.z))).x;
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
                            float3 _3027 = float3(_820, _818, float(int(_244)));
                            float3 _3029 = select(_3027, float3(0.0), isnan(_3027));
                            float _822 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, _3029.xy, uint(rint(_3029.z))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, _3029.xy, uint(rint(_3029.z))).x;
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
                                float3 _3083 = float3(_852, _850, float(int(_244)));
                                float3 _3085 = select(_3083, float3(0.0), isnan(_3083));
                                float _854 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, _3085.xy, uint(rint(_3085.z))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, _3085.xy, uint(rint(_3085.z))).x;
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
                                    float3 _3139 = float3(_884, _882, float(int(_244)));
                                    float3 _3141 = select(_3139, float3(0.0), isnan(_3139));
                                    float _886 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, _3141.xy, uint(rint(_3141.z))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, _3141.xy, uint(rint(_3141.z))).x;
                                    float _888 = fma(_626, 8.0, _604);
                                    float _890 = _626 * 13.5;
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
                                        float3 _3194 = float3(_916, _914, float(int(_244)));
                                        float3 _3196 = select(_3194, float3(0.0), isnan(_3194));
                                        float _918 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, _3196.xy, uint(rint(_3196.z))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, _3196.xy, uint(rint(_3196.z))).x;
                                        float _920 = fma(_626, 9.0, _604);
                                        float _922 = _626 * 15.0;
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
                                        bool _944 = !_942;
                                        if (!_944)
                                        {
                                            float _946 = fma(_624, 10.0, _260);
                                            float _948 = fma(_628, 10.0, _262);
                                            float3 _3250 = float3(_948, _946, float(int(_244)));
                                            float3 _3252 = select(_3250, float3(0.0), isnan(_3250));
                                            float _950 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, _3252.xy, uint(rint(_3252.z))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, _3252.xy, uint(rint(_3252.z))).x;
                                            float _952 = fma(_626, 10.0, _604);
                                            float _954 = _626 * 16.5;
                                            float _956 = -_952;
                                            float _958 = _956 + _950;
                                            float _960 = _958 + (*spvDescriptorSet0.fp_c3)._m0[5].x;
                                            float _962 = precise::max(_960, _954);
                                            float _964 = precise::min(0.0, _962);
                                            bool _966 = _964 != _960;
                                            bool _968 = isnan(_964);
                                            bool _970 = _966 || _968;
                                            bool _972 = isnan(_960);
                                            bool _974 = _970 || _972;
                                            bool _976 = !_974;
                                            if (!_976)
                                            {
                                                float _978 = fma(_624, 11.0, _260);
                                                float _980 = fma(_628, 11.0, _262);
                                                float3 _3306 = float3(_980, _978, float(int(_244)));
                                                float3 _3308 = select(_3306, float3(0.0), isnan(_3306));
                                                float _982 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, _3308.xy, uint(rint(_3308.z))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, _3308.xy, uint(rint(_3308.z))).x;
                                                float _984 = fma(_626, 11.0, _604);
                                                float _986 = _626 * 18.0;
                                                float _988 = -_984;
                                                float _990 = _988 + _982;
                                                float _992 = _990 + (*spvDescriptorSet0.fp_c3)._m0[5].x;
                                                float _994 = precise::max(_992, _986);
                                                float _996 = precise::min(0.0, _994);
                                                bool _998 = _996 != _992;
                                                bool _1000 = isnan(_996);
                                                bool _1002 = _998 || _1000;
                                                bool _1004 = isnan(_992);
                                                bool _1006 = _1002 || _1004;
                                                bool _1008 = !_1006;
                                                if (!_1008)
                                                {
                                                    float _1010 = fma(_624, 12.0, _260);
                                                    float _1012 = fma(_628, 12.0, _262);
                                                    float3 _3361 = float3(_1012, _1010, float(int(_244)));
                                                    float3 _3363 = select(_3361, float3(0.0), isnan(_3361));
                                                    float _1014 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, _3363.xy, uint(rint(_3363.z))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, _3363.xy, uint(rint(_3363.z))).x;
                                                    float _1016 = fma(_626, 12.0, _604);
                                                    float _1018 = _626 * 19.5;
                                                    float _1020 = -_1016;
                                                    float _1022 = _1020 + _1014;
                                                    float _1024 = _1022 + (*spvDescriptorSet0.fp_c3)._m0[5].x;
                                                    float _1026 = precise::max(_1024, _1018);
                                                    float _1028 = precise::min(0.0, _1026);
                                                    bool _1030 = _1028 != _1024;
                                                    bool _1032 = isnan(_1028);
                                                    bool _1034 = _1030 || _1032;
                                                    bool _1036 = isnan(_1024);
                                                    bool _1038 = _1034 || _1036;
                                                    bool _1040 = !_1038;
                                                    if (!_1040)
                                                    {
                                                        float _1042 = fma(_624, 13.0, _260);
                                                        float _1044 = fma(_628, 13.0, _262);
                                                        float3 _3417 = float3(_1044, _1042, float(int(_244)));
                                                        float3 _3419 = select(_3417, float3(0.0), isnan(_3417));
                                                        float _1046 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, _3419.xy, uint(rint(_3419.z))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, _3419.xy, uint(rint(_3419.z))).x;
                                                        float _1048 = fma(_626, 13.0, _604);
                                                        float _1050 = _626 * 21.0;
                                                        float _1052 = -_1048;
                                                        float _1054 = _1052 + _1046;
                                                        float _1056 = _1054 + (*spvDescriptorSet0.fp_c3)._m0[5].x;
                                                        float _1058 = precise::max(_1056, _1050);
                                                        float _1060 = precise::min(0.0, _1058);
                                                        bool _1062 = _1060 != _1056;
                                                        bool _1064 = isnan(_1060);
                                                        bool _1066 = _1062 || _1064;
                                                        bool _1068 = isnan(_1056);
                                                        bool _1070 = _1066 || _1068;
                                                        bool _1072 = !_1070;
                                                        if (!_1072)
                                                        {
                                                            float _1074 = fma(_624, 14.0, _260);
                                                            float _1076 = fma(_628, 14.0, _262);
                                                            float3 _3473 = float3(_1076, _1074, float(int(_244)));
                                                            float3 _3475 = select(_3473, float3(0.0), isnan(_3473));
                                                            float _1078 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, _3475.xy, uint(rint(_3475.z))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, _3475.xy, uint(rint(_3475.z))).x;
                                                            float _1080 = fma(_626, 14.0, _604);
                                                            float _1082 = _626 * 22.5;
                                                            float _1084 = -_1080;
                                                            float _1086 = _1084 + _1078;
                                                            float _1088 = _1086 + (*spvDescriptorSet0.fp_c3)._m0[5].x;
                                                            float _1090 = precise::max(_1088, _1082);
                                                            float _1092 = precise::min(0.0, _1090);
                                                            bool _1094 = _1092 != _1088;
                                                            bool _1096 = isnan(_1092);
                                                            bool _1098 = _1094 || _1096;
                                                            bool _1100 = isnan(_1088);
                                                            bool _1102 = _1098 || _1100;
                                                            bool _1104 = !_1102;
                                                            if (!_1104)
                                                            {
                                                                float _1106 = fma(_624, 15.0, _260);
                                                                float _1108 = fma(_628, 15.0, _262);
                                                                float3 _3528 = float3(_1108, _1106, float(int(_244)));
                                                                float3 _3530 = select(_3528, float3(0.0), isnan(_3528));
                                                                float _1110 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, _3530.xy, uint(rint(_3530.z))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, _3530.xy, uint(rint(_3530.z))).x;
                                                                float _1112 = fma(_626, 15.0, _604);
                                                                float _1114 = _626 * 24.0;
                                                                float _1116 = -_1112;
                                                                float _1118 = _1116 + _1110;
                                                                float _1120 = _1118 + (*spvDescriptorSet0.fp_c3)._m0[5].x;
                                                                float _1122 = precise::max(_1120, _1114);
                                                                float _1124 = precise::min(0.0, _1122);
                                                                bool _1126 = _1124 != _1120;
                                                                bool _1128 = isnan(_1124);
                                                                bool _1130 = _1126 || _1128;
                                                                bool _1132 = isnan(_1120);
                                                                bool _1134 = _1130 || _1132;
                                                                bool _1136 = !_1134;
                                                                if (!_1136)
                                                                {
                                                                    float _1138 = fma(_624, 16.0, _260);
                                                                    float _1140 = fma(_628, 16.0, _262);
                                                                    float3 _3584 = float3(_1140, _1138, float(int(_244)));
                                                                    float3 _3586 = select(_3584, float3(0.0), isnan(_3584));
                                                                    float _1142 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, _3586.xy, uint(rint(_3586.z))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, _3586.xy, uint(rint(_3586.z))).x;
                                                                    float _1144 = fma(_626, 16.0, _604);
                                                                    float _1146 = _626 * 25.5;
                                                                    float _1148 = -_1144;
                                                                    float _1150 = _1148 + _1142;
                                                                    float _1152 = _1150 + (*spvDescriptorSet0.fp_c3)._m0[5].x;
                                                                    float _1154 = precise::max(_1152, _1146);
                                                                    float _1156 = precise::min(0.0, _1154);
                                                                    bool _1158 = _1156 != _1152;
                                                                    bool _1160 = isnan(_1156);
                                                                    bool _1162 = _1158 || _1160;
                                                                    bool _1164 = isnan(_1152);
                                                                    bool _1166 = _1162 || _1164;
                                                                    bool _1168 = !_1166;
                                                                    if (!_1168)
                                                                    {
                                                                        float _1170 = fma(_624, 17.0, _260);
                                                                        float _1172 = fma(_628, 17.0, _262);
                                                                        float3 _3640 = float3(_1172, _1170, float(int(_244)));
                                                                        float3 _3642 = select(_3640, float3(0.0), isnan(_3640));
                                                                        float _1174 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, _3642.xy, uint(rint(_3642.z))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, _3642.xy, uint(rint(_3642.z))).x;
                                                                        float _1176 = fma(_626, 17.0, _604);
                                                                        float _1178 = _626 * 27.0;
                                                                        float _1180 = -_1176;
                                                                        float _1182 = _1180 + _1174;
                                                                        float _1184 = _1182 + (*spvDescriptorSet0.fp_c3)._m0[5].x;
                                                                        float _1186 = precise::max(_1184, _1178);
                                                                        float _1188 = precise::min(0.0, _1186);
                                                                        bool _1190 = _1188 != _1184;
                                                                        bool _1192 = isnan(_1188);
                                                                        bool _1194 = _1190 || _1192;
                                                                        bool _1196 = isnan(_1184);
                                                                        bool _1198 = _1194 || _1196;
                                                                        bool _1200 = !_1198;
                                                                        if (!_1200)
                                                                        {
                                                                            float _1202 = fma(_624, 18.0, _260);
                                                                            float _1204 = fma(_628, 18.0, _262);
                                                                            float3 _3695 = float3(_1204, _1202, float(int(_244)));
                                                                            float3 _3697 = select(_3695, float3(0.0), isnan(_3695));
                                                                            float _1206 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, _3697.xy, uint(rint(_3697.z))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, _3697.xy, uint(rint(_3697.z))).x;
                                                                            float _1208 = fma(_626, 18.0, _604);
                                                                            float _1210 = _626 * 28.5;
                                                                            float _1212 = -_1208;
                                                                            float _1214 = _1212 + _1206;
                                                                            float _1216 = _1214 + (*spvDescriptorSet0.fp_c3)._m0[5].x;
                                                                            float _1218 = precise::max(_1216, _1210);
                                                                            float _1220 = precise::min(0.0, _1218);
                                                                            bool _1222 = _1220 != _1216;
                                                                            bool _1224 = isnan(_1220);
                                                                            bool _1226 = _1222 || _1224;
                                                                            bool _1228 = isnan(_1216);
                                                                            bool _1230 = _1226 || _1228;
                                                                            bool _1232 = !_1230;
                                                                            if (!_1232)
                                                                            {
                                                                                float _1234 = fma(_624, 19.0, _260);
                                                                                float _1236 = fma(_628, 19.0, _262);
                                                                                float3 _3751 = float3(_1236, _1234, float(int(_244)));
                                                                                float3 _3753 = select(_3751, float3(0.0), isnan(_3751));
                                                                                float _1238 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, _3753.xy, uint(rint(_3753.z))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, _3753.xy, uint(rint(_3753.z))).x;
                                                                                float _1240 = fma(_626, 19.0, _604);
                                                                                float _1242 = _626 * 30.0;
                                                                                float _1244 = -_1240;
                                                                                float _1246 = _1244 + _1238;
                                                                                float _1248 = _1246 + (*spvDescriptorSet0.fp_c3)._m0[5].x;
                                                                                float _1250 = precise::max(_1248, _1242);
                                                                                float _1252 = precise::min(0.0, _1250);
                                                                                bool _1254 = _1252 != _1248;
                                                                                bool _1256 = isnan(_1252);
                                                                                bool _1258 = _1254 || _1256;
                                                                                bool _1260 = isnan(_1248);
                                                                                bool _1262 = _1258 || _1260;
                                                                                bool _1264 = !_1262;
                                                                                if (!_1264)
                                                                                {
                                                                                    float _1266 = fma(_624, 20.0, _260);
                                                                                    float _1268 = fma(_628, 20.0, _262);
                                                                                    float3 _3807 = float3(_1268, _1266, float(int(_244)));
                                                                                    float3 _3809 = select(_3807, float3(0.0), isnan(_3807));
                                                                                    float _1270 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, _3809.xy, uint(rint(_3809.z))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, _3809.xy, uint(rint(_3809.z))).x;
                                                                                    float _1272 = fma(_626, 20.0, _604);
                                                                                    float _1274 = _626 * 31.5;
                                                                                    float _1276 = -_1272;
                                                                                    float _1278 = _1276 + _1270;
                                                                                    float _1280 = _1278 + (*spvDescriptorSet0.fp_c3)._m0[5].x;
                                                                                    float _1282 = precise::max(_1280, _1274);
                                                                                    float _1284 = precise::min(0.0, _1282);
                                                                                    bool _1286 = _1284 != _1280;
                                                                                    bool _1288 = isnan(_1284);
                                                                                    bool _1290 = _1286 || _1288;
                                                                                    bool _1292 = isnan(_1280);
                                                                                    bool _1294 = _1290 || _1292;
                                                                                    bool _1296 = !_1294;
                                                                                    if (!_1296)
                                                                                    {
                                                                                        float _1298 = fma(_624, 21.0, _260);
                                                                                        float _1300 = fma(_628, 21.0, _262);
                                                                                        float3 _3862 = float3(_1300, _1298, float(int(_244)));
                                                                                        float3 _3864 = select(_3862, float3(0.0), isnan(_3862));
                                                                                        float _1302 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, _3864.xy, uint(rint(_3864.z))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, _3864.xy, uint(rint(_3864.z))).x;
                                                                                        float _1304 = fma(_626, 21.0, _604);
                                                                                        float _1306 = _626 * 33.0;
                                                                                        float _1308 = -_1304;
                                                                                        float _1310 = _1308 + _1302;
                                                                                        float _1312 = _1310 + (*spvDescriptorSet0.fp_c3)._m0[5].x;
                                                                                        float _1314 = precise::max(_1312, _1306);
                                                                                        float _1316 = precise::min(0.0, _1314);
                                                                                        bool _1318 = _1316 != _1312;
                                                                                        bool _1320 = isnan(_1316);
                                                                                        bool _1322 = _1318 || _1320;
                                                                                        bool _1324 = isnan(_1312);
                                                                                        bool _1326 = _1322 || _1324;
                                                                                        bool _1328 = !_1326;
                                                                                        if (!_1328)
                                                                                        {
                                                                                            float _1330 = fma(_624, 22.0, _260);
                                                                                            float _1332 = fma(_628, 22.0, _262);
                                                                                            float3 _3918 = float3(_1332, _1330, float(int(_244)));
                                                                                            float3 _3920 = select(_3918, float3(0.0), isnan(_3918));
                                                                                            float _1334 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, _3920.xy, uint(rint(_3920.z))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, _3920.xy, uint(rint(_3920.z))).x;
                                                                                            float _1336 = fma(_626, 22.0, _604);
                                                                                            float _1338 = _626 * 34.5;
                                                                                            float _1340 = -_1336;
                                                                                            float _1342 = _1340 + _1334;
                                                                                            float _1344 = _1342 + (*spvDescriptorSet0.fp_c3)._m0[5].x;
                                                                                            float _1346 = precise::max(_1344, _1338);
                                                                                            float _1348 = precise::min(0.0, _1346);
                                                                                            bool _1350 = _1348 != _1344;
                                                                                            bool _1352 = isnan(_1348);
                                                                                            bool _1354 = _1350 || _1352;
                                                                                            bool _1356 = isnan(_1344);
                                                                                            bool _1358 = _1354 || _1356;
                                                                                            bool _1360 = !_1358;
                                                                                            if (!_1360)
                                                                                            {
                                                                                                float _1362 = fma(_624, 23.0, _260);
                                                                                                float _1364 = fma(_628, 23.0, _262);
                                                                                                float3 _3974 = float3(_1364, _1362, float(int(_244)));
                                                                                                float3 _3976 = select(_3974, float3(0.0), isnan(_3974));
                                                                                                float _1366 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, _3976.xy, uint(rint(_3976.z))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, _3976.xy, uint(rint(_3976.z))).x;
                                                                                                float _1368 = fma(_626, 23.0, _604);
                                                                                                float _1370 = fma(_626, 36.0, -1.0);
                                                                                                float _1372 = -_1368;
                                                                                                float _1374 = _1372 + _1366;
                                                                                                float _1376 = _1374 + (*spvDescriptorSet0.fp_c3)._m0[5].x;
                                                                                                float _1378 = precise::max(_1376, _1370);
                                                                                                float _1380 = precise::min(0.0, _1378);
                                                                                                bool _1382 = _1380 != _1376;
                                                                                                bool _1384 = isnan(_1380);
                                                                                                bool _1386 = _1382 || _1384;
                                                                                                bool _1388 = isnan(_1376);
                                                                                                bool _1390 = _1386 || _1388;
                                                                                                bool _1392 = !_1390;
                                                                                                if (!_1392)
                                                                                                {
                                                                                                    float _1394 = fma(_624, 24.0, _260);
                                                                                                    float _1396 = fma(_628, 24.0, _262);
                                                                                                    float3 _4029 = float3(_1396, _1394, float(int(_244)));
                                                                                                    float3 _4031 = select(_4029, float3(0.0), isnan(_4029));
                                                                                                    float _1398 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, _4031.xy, uint(rint(_4031.z))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, _4031.xy, uint(rint(_4031.z))).x;
                                                                                                    float _1400 = fma(_626, 24.0, _604);
                                                                                                    float _1402 = fma(_626, 37.5, -1.0);
                                                                                                    float _1404 = -_1400;
                                                                                                    float _1406 = _1404 + _1398;
                                                                                                    float _1408 = _1406 + (*spvDescriptorSet0.fp_c3)._m0[5].x;
                                                                                                    float _1410 = precise::max(_1408, _1402);
                                                                                                    float _1412 = precise::min(0.0, _1410);
                                                                                                    bool _1414 = _1412 != _1408;
                                                                                                    bool _1416 = isnan(_1412);
                                                                                                    bool _1418 = _1414 || _1416;
                                                                                                    bool _1420 = isnan(_1408);
                                                                                                    bool _1422 = _1418 || _1420;
                                                                                                    float _1424 = 37.5;
                                                                                                    if (_1422)
                                                                                                    {
                                                                                                        _1424 = 0.0;
                                                                                                    }
                                                                                                    float _1426 = _1424;
                                                                                                    _1428 = _1426;
                                                                                                    _1430 = _1422;
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
                    }
                }
            }
        }
    }
    if (!_1430)
    {
        _1428 = 1.0;
    }
    _1430 = false;
    float _1432 = _1428;
    float _1434 = -_1432;
    float _1436 = fma(_634, _1434, 1.0);
    out.m_39.x = _1436;
    return out;
}

