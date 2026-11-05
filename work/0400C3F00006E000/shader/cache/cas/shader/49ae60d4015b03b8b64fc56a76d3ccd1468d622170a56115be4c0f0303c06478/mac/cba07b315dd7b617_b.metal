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
    bool _780 = false;
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
    float2 _823 = float2(_62, _64);
    float _66 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_823, float2(0.0), isnan(_823))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_823, float2(0.0), isnan(_823))).x;
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
    float _109 = -(*spvDescriptorSet0.fp_c3)._m0[4].y;
    float _111 = _80 * _109;
    float _113 = -_78;
    float _115 = fma(_113, (*spvDescriptorSet0.fp_c3)._m0[3].z, _100);
    float _117 = -_78;
    float _119 = fma(_117, (*spvDescriptorSet0.fp_c3)._m0[2].z, _107);
    float _121 = fma(_82, (*spvDescriptorSet0.fp_c3)._m0[4].x, _111);
    int _123 = 2;
    if (!_86)
    {
        _123 = 1;
    }
    int _125 = _123;
    int _127 = _125;
    if (!_92)
    {
        _127 = _105;
    }
    int _129 = _127;
    int _131 = _129 + 1;
    int _133 = _131;
    if (!_98)
    {
        _133 = _129;
    }
    int _135 = _133;
    bool _137 = _135 != 1;
    bool _139 = _135 != 0;
    bool _141 = !_137;
    int _143 = _141 ? as_type<int>((*spvDescriptorSet0.fp_c4)._m0[28].y) : as_type<int>((*spvDescriptorSet0.fp_c4)._m0[32].y);
    bool _145 = !_137;
    int _147 = _145 ? as_type<int>((*spvDescriptorSet0.fp_c4)._m0[28].x) : as_type<int>((*spvDescriptorSet0.fp_c4)._m0[32].x);
    float _149 = _119 + (*spvDescriptorSet0.fp_c3)._m0[2].w;
    float _151 = _139 ? as_type<float>(_143) : (*spvDescriptorSet0.fp_c4)._m0[24].y;
    float _153 = _115 + (*spvDescriptorSet0.fp_c3)._m0[3].w;
    float _155 = _139 ? as_type<float>(_147) : (*spvDescriptorSet0.fp_c4)._m0[24].x;
    float _157 = -_78;
    float _159 = fma(_157, (*spvDescriptorSet0.fp_c3)._m0[4].z, _121);
    float _161 = _153 * _151;
    float _163 = _159 + (*spvDescriptorSet0.fp_c3)._m0[4].w;
    float _165 = fma(_149, _155, _161);
    bool _167 = !_137;
    int _169 = _167 ? as_type<int>((*spvDescriptorSet0.fp_c4)._m0[25].x) : as_type<int>((*spvDescriptorSet0.fp_c4)._m0[29].x);
    bool _171 = !_137;
    int _173 = _171 ? as_type<int>((*spvDescriptorSet0.fp_c4)._m0[25].y) : as_type<int>((*spvDescriptorSet0.fp_c4)._m0[29].y);
    bool _175 = !_137;
    int _177 = _175 ? as_type<int>((*spvDescriptorSet0.fp_c4)._m0[26].y) : as_type<int>((*spvDescriptorSet0.fp_c4)._m0[30].y);
    bool _179 = !_137;
    int _181 = _179 ? as_type<int>((*spvDescriptorSet0.fp_c4)._m0[28].z) : as_type<int>((*spvDescriptorSet0.fp_c4)._m0[32].z);
    float _183 = _139 ? as_type<float>(_173) : (*spvDescriptorSet0.fp_c4)._m0[21].y;
    bool _185 = !_137;
    int _187 = _185 ? as_type<int>((*spvDescriptorSet0.fp_c4)._m0[26].x) : as_type<int>((*spvDescriptorSet0.fp_c4)._m0[30].x);
    float _189 = _139 ? as_type<float>(_177) : (*spvDescriptorSet0.fp_c4)._m0[22].y;
    float _191 = _153 * _183;
    float _193 = _139 ? as_type<float>(_169) : (*spvDescriptorSet0.fp_c4)._m0[21].x;
    bool _195 = !_137;
    int _197 = _195 ? as_type<int>((*spvDescriptorSet0.fp_c4)._m0[28].w) : as_type<int>((*spvDescriptorSet0.fp_c4)._m0[32].w);
    float _199 = _153 * _189;
    float _201 = _139 ? as_type<float>(_181) : (*spvDescriptorSet0.fp_c4)._m0[24].z;
    float _203 = fma(_149, _193, _191);
    float _205 = _139 ? as_type<float>(_187) : (*spvDescriptorSet0.fp_c4)._m0[22].x;
    float _207 = _139 ? as_type<float>(_197) : (*spvDescriptorSet0.fp_c4)._m0[24].w;
    float _209 = fma(_163, _201, _165);
    float _211 = fma(_149, _205, _199);
    float _213 = _207 + _209;
    bool _215 = !_137;
    int _217 = _215 ? as_type<int>((*spvDescriptorSet0.fp_c4)._m0[26].z) : as_type<int>((*spvDescriptorSet0.fp_c4)._m0[30].z);
    float _219 = float(_135);
    float _221 = 1.0 / _213;
    bool _223 = !_137;
    int _225 = _223 ? as_type<int>((*spvDescriptorSet0.fp_c4)._m0[25].z) : as_type<int>((*spvDescriptorSet0.fp_c4)._m0[29].z);
    float _227 = _139 ? as_type<float>(_217) : (*spvDescriptorSet0.fp_c4)._m0[22].z;
    bool _229 = !_137;
    int _231 = _229 ? as_type<int>((*spvDescriptorSet0.fp_c4)._m0[25].w) : as_type<int>((*spvDescriptorSet0.fp_c4)._m0[29].w);
    bool _233 = !_137;
    int _235 = _233 ? as_type<int>((*spvDescriptorSet0.fp_c4)._m0[26].w) : as_type<int>((*spvDescriptorSet0.fp_c4)._m0[30].w);
    float _237 = rint(_219);
    float _239 = precise::max(_237, 0.0);
    uint _242 = uint(_239);
    uint _244 = clamp(_242, 0u, 65535u);
    float _246 = _139 ? as_type<float>(_225) : (*spvDescriptorSet0.fp_c4)._m0[21].z;
    float _248 = fma(_163, _227, _211);
    float _250 = _139 ? as_type<float>(_235) : (*spvDescriptorSet0.fp_c4)._m0[22].w;
    float _252 = _139 ? as_type<float>(_231) : (*spvDescriptorSet0.fp_c4)._m0[21].w;
    float _254 = fma(_163, _246, _203);
    float _256 = _250 + _248;
    float _258 = _252 + _254;
    float _260 = _256 * _221;
    float _262 = _258 * _221;
    float3 _1243 = float3(_262, _260, float(int(_244)));
    float3 _1247 = select(_1243, float3(0.0), isnan(_1243));
    float _264 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, _1247.xy, uint(rint(_1247.z))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, _1247.xy, uint(rint(_1247.z))).x;
    float _266 = _153 * 78.233001708984375;
    float _268 = fma(_163, 12.98980045318603515625, _266);
    float _270 = fma(_149, 12.98980045318603515625, _266);
    float _272 = fma(_149, 45.16400146484375, _268);
    float _274 = fma(_163, 45.16400146484375, _270);
    float _276 = _272 + 94.67299652099609375;
    float _278 = _274 + 94.67299652099609375;
    float _280 = _276 * 0.15915493667125701904296875;
    float _282 = _278 * 0.15915493667125701904296875;
    bool _284 = !_137;
    int _286 = _284 ? as_type<int>((*spvDescriptorSet0.fp_c4)._m0[27].x) : as_type<int>((*spvDescriptorSet0.fp_c4)._m0[31].x);
    bool _288 = !_137;
    int _290 = _288 ? as_type<int>((*spvDescriptorSet0.fp_c4)._m0[3].y) : as_type<int>((*spvDescriptorSet0.fp_c4)._m0[6].y);
    float _292 = _280 * 6.283185482025146484375;
    float _294 = sin(_292);
    bool _296 = !_137;
    int _298 = _296 ? as_type<int>((*spvDescriptorSet0.fp_c4)._m0[3].x) : as_type<int>((*spvDescriptorSet0.fp_c4)._m0[6].x);
    bool _300 = !_137;
    int _302 = _300 ? as_type<int>((*spvDescriptorSet0.fp_c4)._m0[27].y) : as_type<int>((*spvDescriptorSet0.fp_c4)._m0[31].y);
    bool _304 = !_137;
    int _306 = _304 ? as_type<int>((*spvDescriptorSet0.fp_c4)._m0[4].x) : as_type<int>((*spvDescriptorSet0.fp_c4)._m0[7].x);
    bool _308 = !_137;
    int _310 = _308 ? as_type<int>((*spvDescriptorSet0.fp_c4)._m0[4].y) : as_type<int>((*spvDescriptorSet0.fp_c4)._m0[7].y);
    float _312 = _282 * 6.283185482025146484375;
    float _314 = sin(_312);
    bool _316 = !_137;
    int _318 = _316 ? as_type<int>((*spvDescriptorSet0.fp_c4)._m0[5].y) : as_type<int>((*spvDescriptorSet0.fp_c4)._m0[8].y);
    float _320 = _139 ? as_type<float>(_286) : (*spvDescriptorSet0.fp_c4)._m0[23].x;
    float _322 = _139 ? as_type<float>(_298) : (*spvDescriptorSet0.fp_c4)._m0[0].x;
    float _324 = _294 * 43758.546875;
    float _326 = _139 ? as_type<float>(_290) : (*spvDescriptorSet0.fp_c4)._m0[0].y;
    float _328 = _139 ? as_type<float>(_302) : (*spvDescriptorSet0.fp_c4)._m0[23].y;
    float _330 = floor(_324);
    float _332 = _139 ? as_type<float>(_306) : (*spvDescriptorSet0.fp_c4)._m0[1].x;
    float _334 = _153 * _326;
    float _336 = _139 ? as_type<float>(_310) : (*spvDescriptorSet0.fp_c4)._m0[1].y;
    float _338 = _314 * 43758.546875;
    float _340 = _139 ? as_type<float>(_318) : (*spvDescriptorSet0.fp_c4)._m0[2].y;
    float _342 = _153 * _328;
    bool _344 = !_137;
    int _346 = _344 ? as_type<int>((*spvDescriptorSet0.fp_c4)._m0[5].x) : as_type<int>((*spvDescriptorSet0.fp_c4)._m0[8].x);
    float _348 = floor(_338);
    float _350 = _153 * _336;
    float _352 = _153 * _340;
    float _354 = _139 ? as_type<float>(_346) : (*spvDescriptorSet0.fp_c4)._m0[2].x;
    float _356 = fma(_149, _332, _350);
    float _358 = fma(_149, _322, _334);
    float _360 = -(*spvDescriptorSet0.fp_c3)._m0[5].w;
    float _362 = _360 + 1.0;
    float _364 = fma(_149, _320, _342);
    float _366 = fma(_149, _354, _352);
    float _368 = -_330;
    float _370 = _324 + _368;
    float _372 = fma(_362, (*spvDescriptorSet0.fp_c3)._m0[6].y, (*spvDescriptorSet0.fp_c3)._m0[6].w);
    float _374 = -_348;
    float _376 = _338 + _374;
    float _378 = fma(_370, 2.0, -1.0);
    bool _380 = !_137;
    int _382 = _380 ? as_type<int>((*spvDescriptorSet0.fp_c4)._m0[27].z) : as_type<int>((*spvDescriptorSet0.fp_c4)._m0[31].z);
    float _384 = _372 * (*spvDescriptorSet0.fp_c3)._m0[5].z;
    float _386 = fma(_376, 2.0, -1.0);
    float _388 = _139 ? as_type<float>(_382) : (*spvDescriptorSet0.fp_c4)._m0[23].z;
    float _390 = _384 * _386;
    bool _392 = !_137;
    int _394 = _392 ? as_type<int>((*spvDescriptorSet0.fp_c4)._m0[3].z) : as_type<int>((*spvDescriptorSet0.fp_c4)._m0[6].z);
    bool _396 = !_137;
    int _398 = _396 ? as_type<int>((*spvDescriptorSet0.fp_c4)._m0[4].z) : as_type<int>((*spvDescriptorSet0.fp_c4)._m0[7].z);
    float _400 = _390 * _390;
    float _402 = _139 ? as_type<float>(_394) : (*spvDescriptorSet0.fp_c4)._m0[0].z;
    float _404 = _384 * _378;
    float _406 = _139 ? as_type<float>(_398) : (*spvDescriptorSet0.fp_c4)._m0[1].z;
    float _408 = fma(_163, _388, _364);
    float _410 = fma(_163, _402, _358);
    float _412 = fma(_404, _404, _400);
    float _414 = fma(_163, _406, _356);
    float _416 = _412 + 1.0;
    bool _418 = !_137;
    int _420 = _418 ? as_type<int>((*spvDescriptorSet0.fp_c4)._m0[5].z) : as_type<int>((*spvDescriptorSet0.fp_c4)._m0[8].z);
    bool _422 = !_137;
    int _424 = _422 ? as_type<int>((*spvDescriptorSet0.fp_c4)._m0[5].w) : as_type<int>((*spvDescriptorSet0.fp_c4)._m0[8].w);
    float _426 = rsqrt(_416);
    float _428 = _139 ? as_type<float>(_420) : (*spvDescriptorSet0.fp_c4)._m0[2].z;
    bool _430 = !_137;
    int _432 = _430 ? as_type<int>((*spvDescriptorSet0.fp_c4)._m0[27].w) : as_type<int>((*spvDescriptorSet0.fp_c4)._m0[31].w);
    bool _434 = !_137;
    int _436 = _434 ? as_type<int>((*spvDescriptorSet0.fp_c4)._m0[3].w) : as_type<int>((*spvDescriptorSet0.fp_c4)._m0[6].w);
    float _438 = fma(_163, _428, _366);
    float _440 = _139 ? as_type<float>(_424) : (*spvDescriptorSet0.fp_c4)._m0[2].w;
    bool _442 = !_137;
    int _444 = _442 ? as_type<int>((*spvDescriptorSet0.fp_c4)._m0[4].w) : as_type<int>((*spvDescriptorSet0.fp_c4)._m0[7].w);
    float _446 = _139 ? as_type<float>(_432) : (*spvDescriptorSet0.fp_c4)._m0[23].w;
    float _448 = _440 + _438;
    float _450 = _139 ? as_type<float>(_436) : (*spvDescriptorSet0.fp_c4)._m0[0].w;
    float _452 = _139 ? as_type<float>(_444) : (*spvDescriptorSet0.fp_c4)._m0[1].w;
    float _454 = _446 + _408;
    float _456 = _450 + _410;
    float _458 = _452 + _414;
    bool _460 = !_137;
    int _462 = _460 ? as_type<int>((*spvDescriptorSet0.fp_c4)._m0[16].y) : as_type<int>((*spvDescriptorSet0.fp_c4)._m0[20].y);
    float _464 = _454 * _221;
    float _466 = fma(_404, _426, _456);
    bool _468 = !_137;
    int _470 = _468 ? as_type<int>((*spvDescriptorSet0.fp_c4)._m0[14].y) : as_type<int>((*spvDescriptorSet0.fp_c4)._m0[18].y);
    float _472 = fma(_390, _426, _458);
    float _474 = -_426;
    float _476 = _448 + _474;
    float _478 = _139 ? as_type<float>(_462) : (*spvDescriptorSet0.fp_c4)._m0[12].y;
    bool _480 = !_137;
    int _482 = _480 ? as_type<int>((*spvDescriptorSet0.fp_c4)._m0[13].y) : as_type<int>((*spvDescriptorSet0.fp_c4)._m0[17].y);
    bool _484 = !_137;
    int _486 = _484 ? as_type<int>((*spvDescriptorSet0.fp_c4)._m0[16].x) : as_type<int>((*spvDescriptorSet0.fp_c4)._m0[20].x);
    float _488 = _478 * _472;
    bool _490 = !_137;
    int _492 = _490 ? as_type<int>((*spvDescriptorSet0.fp_c4)._m0[16].z) : as_type<int>((*spvDescriptorSet0.fp_c4)._m0[20].z);
    float _494 = _139 ? as_type<float>(_470) : (*spvDescriptorSet0.fp_c4)._m0[10].y;
    bool _496 = !_137;
    int _498 = _496 ? as_type<int>((*spvDescriptorSet0.fp_c4)._m0[15].y) : as_type<int>((*spvDescriptorSet0.fp_c4)._m0[19].y);
    float _500 = _139 ? as_type<float>(_482) : (*spvDescriptorSet0.fp_c4)._m0[9].y;
    float _502 = _139 ? as_type<float>(_486) : (*spvDescriptorSet0.fp_c4)._m0[12].x;
    float _504 = _139 ? as_type<float>(_492) : (*spvDescriptorSet0.fp_c4)._m0[12].z;
    float _506 = _494 * _472;
    bool _508 = !_137;
    int _510 = _508 ? as_type<int>((*spvDescriptorSet0.fp_c4)._m0[13].x) : as_type<int>((*spvDescriptorSet0.fp_c4)._m0[17].x);
    float _512 = _139 ? as_type<float>(_498) : (*spvDescriptorSet0.fp_c4)._m0[11].y;
    float _514 = _500 * _472;
    float _516 = fma(_502, _466, _488);
    float _518 = _139 ? as_type<float>(_510) : (*spvDescriptorSet0.fp_c4)._m0[9].x;
    float _520 = _512 * _472;
    float _522 = fma(_504, _476, _516);
    bool _524 = !_137;
    int _526 = _524 ? as_type<int>((*spvDescriptorSet0.fp_c4)._m0[16].w) : as_type<int>((*spvDescriptorSet0.fp_c4)._m0[20].w);
    float _528 = fma(_518, _466, _514);
    bool _530 = !_137;
    int _532 = _530 ? as_type<int>((*spvDescriptorSet0.fp_c4)._m0[14].x) : as_type<int>((*spvDescriptorSet0.fp_c4)._m0[18].x);
    bool _534 = !_137;
    int _536 = _534 ? as_type<int>((*spvDescriptorSet0.fp_c4)._m0[15].x) : as_type<int>((*spvDescriptorSet0.fp_c4)._m0[19].x);
    float _538 = _139 ? as_type<float>(_526) : (*spvDescriptorSet0.fp_c4)._m0[12].w;
    bool _540 = !_137;
    int _542 = _540 ? as_type<int>((*spvDescriptorSet0.fp_c4)._m0[14].z) : as_type<int>((*spvDescriptorSet0.fp_c4)._m0[18].z);
    float _544 = _139 ? as_type<float>(_532) : (*spvDescriptorSet0.fp_c4)._m0[10].x;
    float _546 = _538 + _522;
    bool _548 = !_137;
    int _550 = _548 ? as_type<int>((*spvDescriptorSet0.fp_c4)._m0[15].z) : as_type<int>((*spvDescriptorSet0.fp_c4)._m0[19].z);
    float _552 = _139 ? as_type<float>(_536) : (*spvDescriptorSet0.fp_c4)._m0[11].x;
    float _554 = fma(_544, _466, _506);
    float _556 = _139 ? as_type<float>(_550) : (*spvDescriptorSet0.fp_c4)._m0[11].z;
    float _558 = _139 ? as_type<float>(_542) : (*spvDescriptorSet0.fp_c4)._m0[10].z;
    float _560 = fma(_552, _466, _520);
    float _562 = 1.0 / _546;
    float _564 = fma(_556, _476, _560);
    float _566 = fma(_558, _476, _554);
    bool _568 = !_137;
    int _570 = _568 ? as_type<int>((*spvDescriptorSet0.fp_c4)._m0[15].w) : as_type<int>((*spvDescriptorSet0.fp_c4)._m0[19].w);
    bool _572 = !_137;
    int _574 = _572 ? as_type<int>((*spvDescriptorSet0.fp_c4)._m0[14].w) : as_type<int>((*spvDescriptorSet0.fp_c4)._m0[18].w);
    bool _576 = !_137;
    int _578 = _576 ? as_type<int>((*spvDescriptorSet0.fp_c4)._m0[13].z) : as_type<int>((*spvDescriptorSet0.fp_c4)._m0[17].z);
    float _580 = _139 ? as_type<float>(_570) : (*spvDescriptorSet0.fp_c4)._m0[11].w;
    float _582 = _139 ? as_type<float>(_574) : (*spvDescriptorSet0.fp_c4)._m0[10].w;
    float _584 = _580 + _564;
    float _586 = _139 ? as_type<float>(_578) : (*spvDescriptorSet0.fp_c4)._m0[9].z;
    bool _588 = !_137;
    int _590 = _588 ? as_type<int>((*spvDescriptorSet0.fp_c4)._m0[13].w) : as_type<int>((*spvDescriptorSet0.fp_c4)._m0[17].w);
    float _592 = _562 * 0.5;
    float _594 = _582 + _566;
    float _596 = fma(_586, _476, _528);
    float _598 = _139 ? as_type<float>(_590) : (*spvDescriptorSet0.fp_c4)._m0[9].w;
    float _600 = fma(_584, _592, 0.5);
    float _602 = _594 * _562;
    float _604 = -_600;
    float _606 = _464 + _604;
    float _608 = _598 + _596;
    float _610 = fma(_602, -0.5, 0.5);
    float _612 = _606 * (*spvDescriptorSet0.fp_c3)._m0[5].y;
    float _614 = fma(_608, _592, 0.5);
    float _616 = _612 * 0.300000011920928955078125;
    float _618 = -_464;
    float _620 = _618 + _264;
    float _622 = _620 + (*spvDescriptorSet0.fp_c3)._m0[5].x;
    float _624 = precise::max(_622, _616);
    float _626 = precise::min(0.0, _624);
    bool _628 = _626 != _622;
    bool _630 = isnan(_626);
    bool _632 = _628 || _630;
    bool _634 = isnan(_622);
    bool _636 = _632 || _634;
    float _638 = fma(_362, (*spvDescriptorSet0.fp_c3)._m0[6].x, (*spvDescriptorSet0.fp_c3)._m0[6].z);
    float _640 = _622;
    if (!_636)
    {
        _640 = 1.0;
    }
    float _642 = _640;
    bool _644 = !_636;
    float _646 = _642;
    if (!_644)
    {
        float _648 = -_610;
        float _650 = _260 + _648;
        float _652 = -_614;
        float _654 = _262 + _652;
        float _656 = _650 * (*spvDescriptorSet0.fp_c3)._m0[5].y;
        float _658 = _654 * (*spvDescriptorSet0.fp_c3)._m0[5].y;
        float _660 = fma(_656, 0.20000000298023223876953125, _260);
        float _662 = fma(_658, 0.20000000298023223876953125, _262);
        float _664 = fma(_656, 0.4000000059604644775390625, _260);
        float _666 = fma(_658, 0.4000000059604644775390625, _262);
        float _668 = fma(_658, 0.60000002384185791015625, _262);
        float _670 = fma(_658, 0.800000011920928955078125, _262);
        float3 _2120 = float3(_662, _660, float(int(_244)));
        float3 _2122 = select(_2120, float3(0.0), isnan(_2120));
        float _672 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, _2122.xy, uint(rint(_2122.z))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, _2122.xy, uint(rint(_2122.z))).x;
        float _674 = fma(_656, 0.60000002384185791015625, _260);
        float _676 = fma(_656, 0.800000011920928955078125, _260);
        float3 _2137 = float3(_666, _664, float(int(_244)));
        float3 _2139 = select(_2137, float3(0.0), isnan(_2137));
        float _678 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, _2139.xy, uint(rint(_2139.z))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, _2139.xy, uint(rint(_2139.z))).x;
        float3 _2148 = float3(_668, _674, float(int(_244)));
        float3 _2150 = select(_2148, float3(0.0), isnan(_2148));
        float _680 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, _2150.xy, uint(rint(_2150.z))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, _2150.xy, uint(rint(_2150.z))).x;
        float3 _2159 = float3(_670, _676, float(int(_244)));
        float3 _2161 = select(_2159, float3(0.0), isnan(_2159));
        float _682 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, _2161.xy, uint(rint(_2161.z))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, _2161.xy, uint(rint(_2161.z))).x;
        float _684 = fma(_612, 0.20000000298023223876953125, _464);
        float _686 = _612 * 0.60000002384185791015625;
        float _688 = -_684;
        float _690 = _688 + _672;
        float _692 = _690 + (*spvDescriptorSet0.fp_c3)._m0[5].x;
        float _694 = precise::max(_692, _686);
        float _696 = precise::min(0.0, _694);
        bool _698 = _696 != _692;
        bool _700 = isnan(_696);
        bool _702 = _698 || _700;
        bool _704 = isnan(_692);
        bool _706 = _702 || _704;
        bool _708 = !_706;
        if (!_708)
        {
            float _710 = fma(_612, 0.4000000059604644775390625, _464);
            float _712 = _612 * 0.900000035762786865234375;
            float _714 = -_710;
            float _716 = _714 + _678;
            float _718 = _716 + (*spvDescriptorSet0.fp_c3)._m0[5].x;
            float _720 = precise::max(_718, _712);
            float _722 = precise::min(0.0, _720);
            bool _724 = _722 != _718;
            bool _726 = isnan(_722);
            bool _728 = _724 || _726;
            bool _730 = isnan(_718);
            bool _732 = _728 || _730;
            bool _734 = !_732;
            if (!_734)
            {
                float _736 = _464 + _686;
                float _738 = -_736;
                float _740 = _738 + _680;
                float _742 = fma(_612, 1.2000000476837158203125, -1.0);
                float _744 = _740 + (*spvDescriptorSet0.fp_c3)._m0[5].x;
                float _746 = precise::max(_744, _742);
                float _748 = precise::min(0.0, _746);
                bool _750 = _748 != _744;
                bool _752 = isnan(_748);
                bool _754 = _750 || _752;
                bool _756 = isnan(_744);
                bool _758 = _754 || _756;
                bool _760 = !_758;
                if (!_760)
                {
                    float _762 = fma(_612, 0.800000011920928955078125, _464);
                    float _764 = fma(_612, 1.5, -1.0);
                    float _766 = -_762;
                    float _768 = _766 + _682;
                    float _770 = _768 + (*spvDescriptorSet0.fp_c3)._m0[5].x;
                    float _772 = precise::max(_770, _764);
                    float _774 = precise::min(0.0, _772);
                    bool _776 = _774 == _770;
                    float _778 = float(_776);
                    _646 = _778;
                    _780 = true;
                }
                else
                {
                    _646 = 1.0;
                    _780 = true;
                }
            }
            else
            {
                _646 = 1.0;
                _780 = true;
            }
        }
        else
        {
            _646 = 1.0;
        }
    }
    _780 = false;
    float _782 = _646;
    float _784 = _638 * (*spvDescriptorSet0.fp_c3)._m0[7].x;
    float _786 = -_782;
    float _788 = fma(_784, _786, 1.0);
    out.m_39.x = _788;
    return out;
}

