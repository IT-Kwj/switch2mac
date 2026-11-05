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
    bool _844 = false;
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
    float2 _887 = float2(_62, _64);
    float _66 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_887, float2(0.0), isnan(_887))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_887, float2(0.0), isnan(_887))).x;
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
    float3 _1307 = float3(_262, _260, float(int(_244)));
    float3 _1311 = select(_1307, float3(0.0), isnan(_1307));
    float _264 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, _1311.xy, uint(rint(_1311.z))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, _1311.xy, uint(rint(_1311.z))).x;
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
    float _288 = _280 * 6.283185482025146484375;
    float _290 = sin(_288);
    bool _292 = !_137;
    int _294 = _292 ? as_type<int>((*spvDescriptorSet0.fp_c4)._m0[3].x) : as_type<int>((*spvDescriptorSet0.fp_c4)._m0[6].x);
    bool _296 = !_137;
    int _298 = _296 ? as_type<int>((*spvDescriptorSet0.fp_c4)._m0[3].y) : as_type<int>((*spvDescriptorSet0.fp_c4)._m0[6].y);
    bool _300 = !_137;
    int _302 = _300 ? as_type<int>((*spvDescriptorSet0.fp_c4)._m0[27].y) : as_type<int>((*spvDescriptorSet0.fp_c4)._m0[31].y);
    bool _304 = !_137;
    int _306 = _304 ? as_type<int>((*spvDescriptorSet0.fp_c4)._m0[4].x) : as_type<int>((*spvDescriptorSet0.fp_c4)._m0[7].x);
    float _308 = _282 * 6.283185482025146484375;
    float _310 = sin(_308);
    bool _312 = !_137;
    int _314 = _312 ? as_type<int>((*spvDescriptorSet0.fp_c4)._m0[4].y) : as_type<int>((*spvDescriptorSet0.fp_c4)._m0[7].y);
    bool _316 = !_137;
    int _318 = _316 ? as_type<int>((*spvDescriptorSet0.fp_c4)._m0[5].y) : as_type<int>((*spvDescriptorSet0.fp_c4)._m0[8].y);
    float _320 = _139 ? as_type<float>(_286) : (*spvDescriptorSet0.fp_c4)._m0[23].x;
    float _322 = _139 ? as_type<float>(_294) : (*spvDescriptorSet0.fp_c4)._m0[0].x;
    float _324 = _290 * 43758.546875;
    float _326 = _139 ? as_type<float>(_298) : (*spvDescriptorSet0.fp_c4)._m0[0].y;
    float _328 = _139 ? as_type<float>(_302) : (*spvDescriptorSet0.fp_c4)._m0[23].y;
    float _330 = floor(_324);
    float _332 = _139 ? as_type<float>(_306) : (*spvDescriptorSet0.fp_c4)._m0[1].x;
    float _334 = _153 * _326;
    float _336 = _139 ? as_type<float>(_314) : (*spvDescriptorSet0.fp_c4)._m0[1].y;
    float _338 = _310 * 43758.546875;
    float _340 = _139 ? as_type<float>(_318) : (*spvDescriptorSet0.fp_c4)._m0[2].y;
    float _342 = _153 * _328;
    bool _344 = !_137;
    int _346 = _344 ? as_type<int>((*spvDescriptorSet0.fp_c4)._m0[5].x) : as_type<int>((*spvDescriptorSet0.fp_c4)._m0[8].x);
    float _348 = floor(_338);
    float _350 = _153 * _336;
    float _352 = _153 * _340;
    float _354 = fma(_149, _322, _334);
    float _356 = _139 ? as_type<float>(_346) : (*spvDescriptorSet0.fp_c4)._m0[2].x;
    float _358 = fma(_149, _332, _350);
    float _360 = -(*spvDescriptorSet0.fp_c3)._m0[5].w;
    float _362 = _360 + 1.0;
    float _364 = fma(_149, _320, _342);
    float _366 = fma(_149, _356, _352);
    float _368 = -_330;
    float _370 = _324 + _368;
    float _372 = fma(_362, (*spvDescriptorSet0.fp_c3)._m0[6].y, (*spvDescriptorSet0.fp_c3)._m0[6].w);
    float _374 = fma(_370, 2.0, -1.0);
    float _376 = -_348;
    float _378 = _338 + _376;
    bool _380 = !_137;
    int _382 = _380 ? as_type<int>((*spvDescriptorSet0.fp_c4)._m0[27].z) : as_type<int>((*spvDescriptorSet0.fp_c4)._m0[31].z);
    float _384 = _372 * (*spvDescriptorSet0.fp_c3)._m0[5].z;
    float _386 = fma(_378, 2.0, -1.0);
    float _388 = _139 ? as_type<float>(_382) : (*spvDescriptorSet0.fp_c4)._m0[23].z;
    float _390 = _384 * _386;
    bool _392 = !_137;
    int _394 = _392 ? as_type<int>((*spvDescriptorSet0.fp_c4)._m0[3].z) : as_type<int>((*spvDescriptorSet0.fp_c4)._m0[6].z);
    bool _396 = !_137;
    int _398 = _396 ? as_type<int>((*spvDescriptorSet0.fp_c4)._m0[4].z) : as_type<int>((*spvDescriptorSet0.fp_c4)._m0[7].z);
    float _400 = _390 * _390;
    float _402 = _139 ? as_type<float>(_394) : (*spvDescriptorSet0.fp_c4)._m0[0].z;
    float _404 = _384 * _374;
    float _406 = _139 ? as_type<float>(_398) : (*spvDescriptorSet0.fp_c4)._m0[1].z;
    float _408 = fma(_163, _388, _364);
    float _410 = fma(_163, _402, _354);
    float _412 = fma(_404, _404, _400);
    float _414 = fma(_163, _406, _358);
    float _416 = _412 + 1.0;
    bool _418 = !_137;
    int _420 = _418 ? as_type<int>((*spvDescriptorSet0.fp_c4)._m0[5].z) : as_type<int>((*spvDescriptorSet0.fp_c4)._m0[8].z);
    bool _422 = !_137;
    int _424 = _422 ? as_type<int>((*spvDescriptorSet0.fp_c4)._m0[5].w) : as_type<int>((*spvDescriptorSet0.fp_c4)._m0[8].w);
    float _426 = rsqrt(_416);
    float _428 = _139 ? as_type<float>(_420) : (*spvDescriptorSet0.fp_c4)._m0[2].z;
    bool _430 = !_137;
    int _432 = _430 ? as_type<int>((*spvDescriptorSet0.fp_c4)._m0[27].w) : as_type<int>((*spvDescriptorSet0.fp_c4)._m0[31].w);
    float _434 = fma(_163, _428, _366);
    bool _436 = !_137;
    int _438 = _436 ? as_type<int>((*spvDescriptorSet0.fp_c4)._m0[3].w) : as_type<int>((*spvDescriptorSet0.fp_c4)._m0[6].w);
    float _440 = _139 ? as_type<float>(_424) : (*spvDescriptorSet0.fp_c4)._m0[2].w;
    bool _442 = !_137;
    int _444 = _442 ? as_type<int>((*spvDescriptorSet0.fp_c4)._m0[4].w) : as_type<int>((*spvDescriptorSet0.fp_c4)._m0[7].w);
    float _446 = _139 ? as_type<float>(_432) : (*spvDescriptorSet0.fp_c4)._m0[23].w;
    float _448 = _440 + _434;
    float _450 = _139 ? as_type<float>(_438) : (*spvDescriptorSet0.fp_c4)._m0[0].w;
    float _452 = _139 ? as_type<float>(_444) : (*spvDescriptorSet0.fp_c4)._m0[1].w;
    float _454 = _446 + _408;
    float _456 = _450 + _410;
    float _458 = _452 + _414;
    bool _460 = !_137;
    int _462 = _460 ? as_type<int>((*spvDescriptorSet0.fp_c4)._m0[16].y) : as_type<int>((*spvDescriptorSet0.fp_c4)._m0[20].y);
    float _464 = _454 * _221;
    float _466 = fma(_404, _426, _456);
    float _468 = fma(_390, _426, _458);
    bool _470 = !_137;
    int _472 = _470 ? as_type<int>((*spvDescriptorSet0.fp_c4)._m0[14].y) : as_type<int>((*spvDescriptorSet0.fp_c4)._m0[18].y);
    float _474 = -_426;
    float _476 = _448 + _474;
    float _478 = _139 ? as_type<float>(_462) : (*spvDescriptorSet0.fp_c4)._m0[12].y;
    bool _480 = !_137;
    int _482 = _480 ? as_type<int>((*spvDescriptorSet0.fp_c4)._m0[13].y) : as_type<int>((*spvDescriptorSet0.fp_c4)._m0[17].y);
    bool _484 = !_137;
    int _486 = _484 ? as_type<int>((*spvDescriptorSet0.fp_c4)._m0[16].x) : as_type<int>((*spvDescriptorSet0.fp_c4)._m0[20].x);
    float _488 = _478 * _468;
    bool _490 = !_137;
    int _492 = _490 ? as_type<int>((*spvDescriptorSet0.fp_c4)._m0[16].z) : as_type<int>((*spvDescriptorSet0.fp_c4)._m0[20].z);
    float _494 = _139 ? as_type<float>(_472) : (*spvDescriptorSet0.fp_c4)._m0[10].y;
    bool _496 = !_137;
    int _498 = _496 ? as_type<int>((*spvDescriptorSet0.fp_c4)._m0[15].y) : as_type<int>((*spvDescriptorSet0.fp_c4)._m0[19].y);
    float _500 = _139 ? as_type<float>(_482) : (*spvDescriptorSet0.fp_c4)._m0[9].y;
    float _502 = _139 ? as_type<float>(_486) : (*spvDescriptorSet0.fp_c4)._m0[12].x;
    float _504 = _139 ? as_type<float>(_492) : (*spvDescriptorSet0.fp_c4)._m0[12].z;
    float _506 = _494 * _468;
    bool _508 = !_137;
    int _510 = _508 ? as_type<int>((*spvDescriptorSet0.fp_c4)._m0[13].x) : as_type<int>((*spvDescriptorSet0.fp_c4)._m0[17].x);
    float _512 = _139 ? as_type<float>(_498) : (*spvDescriptorSet0.fp_c4)._m0[11].y;
    float _514 = _500 * _468;
    float _516 = fma(_502, _466, _488);
    float _518 = _139 ? as_type<float>(_510) : (*spvDescriptorSet0.fp_c4)._m0[9].x;
    float _520 = _512 * _468;
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
    float _616 = _612 * 0.21428573131561279296875;
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
        float _660 = fma(_656, 0.14285714924335479736328125, _260);
        float _662 = fma(_658, 0.14285714924335479736328125, _262);
        float3 _2169 = float3(_662, _660, float(int(_244)));
        float3 _2171 = select(_2169, float3(0.0), isnan(_2169));
        float _664 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, _2171.xy, uint(rint(_2171.z))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, _2171.xy, uint(rint(_2171.z))).x;
        float _666 = fma(_656, 0.2857142984867095947265625, _260);
        float _668 = fma(_658, 0.2857142984867095947265625, _262);
        float _670 = fma(_656, 0.4285714626312255859375, _260);
        float _672 = fma(_658, 0.4285714626312255859375, _262);
        float _674 = fma(_656, 0.571428596973419189453125, _260);
        float _676 = fma(_658, 0.571428596973419189453125, _262);
        float _678 = fma(_656, 0.71428573131561279296875, _260);
        float _680 = fma(_658, 0.71428573131561279296875, _262);
        float _682 = fma(_658, 0.857142925262451171875, _262);
        float _684 = fma(_656, 0.857142925262451171875, _260);
        float3 _2215 = float3(_668, _666, float(int(_244)));
        float3 _2217 = select(_2215, float3(0.0), isnan(_2215));
        float _686 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, _2217.xy, uint(rint(_2217.z))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, _2217.xy, uint(rint(_2217.z))).x;
        float3 _2226 = float3(_672, _670, float(int(_244)));
        float3 _2228 = select(_2226, float3(0.0), isnan(_2226));
        float _688 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, _2228.xy, uint(rint(_2228.z))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, _2228.xy, uint(rint(_2228.z))).x;
        float3 _2237 = float3(_676, _674, float(int(_244)));
        float3 _2239 = select(_2237, float3(0.0), isnan(_2237));
        float _690 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, _2239.xy, uint(rint(_2239.z))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, _2239.xy, uint(rint(_2239.z))).x;
        float3 _2248 = float3(_680, _678, float(int(_244)));
        float3 _2250 = select(_2248, float3(0.0), isnan(_2248));
        float _692 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, _2250.xy, uint(rint(_2250.z))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, _2250.xy, uint(rint(_2250.z))).x;
        float3 _2259 = float3(_682, _684, float(int(_244)));
        float3 _2261 = select(_2259, float3(0.0), isnan(_2259));
        float _694 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, _2261.xy, uint(rint(_2261.z))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, _2261.xy, uint(rint(_2261.z))).x;
        float _696 = fma(_612, 0.14285714924335479736328125, _464);
        float _698 = -_696;
        float _700 = _698 + _664;
        float _702 = _612 * 0.4285714626312255859375;
        float _704 = _700 + (*spvDescriptorSet0.fp_c3)._m0[5].x;
        float _706 = precise::max(_704, _702);
        float _708 = precise::min(0.0, _706);
        bool _710 = _708 != _704;
        bool _712 = isnan(_708);
        bool _714 = _710 || _712;
        bool _716 = isnan(_704);
        bool _718 = _714 || _716;
        bool _720 = !_718;
        if (!_720)
        {
            float _722 = fma(_612, 0.2857142984867095947265625, _464);
            float _724 = _612 * 0.64285719394683837890625;
            float _726 = -_722;
            float _728 = _726 + _686;
            float _730 = _728 + (*spvDescriptorSet0.fp_c3)._m0[5].x;
            float _732 = precise::max(_730, _724);
            float _734 = precise::min(0.0, _732);
            bool _736 = _734 != _730;
            bool _738 = isnan(_734);
            bool _740 = _736 || _738;
            bool _742 = isnan(_730);
            bool _744 = _740 || _742;
            bool _746 = !_744;
            if (!_746)
            {
                float _748 = _464 + _702;
                float _750 = _612 * 0.857142925262451171875;
                float _752 = -_748;
                float _754 = _752 + _688;
                float _756 = _754 + (*spvDescriptorSet0.fp_c3)._m0[5].x;
                float _758 = precise::max(_756, _750);
                float _760 = precise::min(0.0, _758);
                bool _762 = _760 != _756;
                bool _764 = isnan(_760);
                bool _766 = _762 || _764;
                bool _768 = isnan(_756);
                bool _770 = _766 || _768;
                bool _772 = !_770;
                if (!_772)
                {
                    float _774 = fma(_612, 0.571428596973419189453125, _464);
                    float _776 = _612 * 1.07142865657806396484375;
                    float _778 = -_774;
                    float _780 = _778 + _690;
                    float _782 = _780 + (*spvDescriptorSet0.fp_c3)._m0[5].x;
                    float _784 = precise::max(_782, _776);
                    float _786 = precise::min(0.0, _784);
                    bool _788 = _786 != _782;
                    bool _790 = isnan(_786);
                    bool _792 = _788 || _790;
                    bool _794 = isnan(_782);
                    bool _796 = _792 || _794;
                    bool _798 = !_796;
                    if (!_798)
                    {
                        float _800 = fma(_612, 0.71428573131561279296875, _464);
                        float _802 = -_800;
                        float _804 = _802 + _692;
                        float _806 = fma(_612, 1.2857143878936767578125, -1.0);
                        float _808 = _804 + (*spvDescriptorSet0.fp_c3)._m0[5].x;
                        float _810 = precise::max(_808, _806);
                        float _812 = precise::min(0.0, _810);
                        bool _814 = _812 != _808;
                        bool _816 = isnan(_812);
                        bool _818 = _814 || _816;
                        bool _820 = isnan(_808);
                        bool _822 = _818 || _820;
                        bool _824 = !_822;
                        if (!_824)
                        {
                            float _826 = _464 + _750;
                            float _828 = fma(_612, 1.50000011920928955078125, -1.0);
                            float _830 = -_826;
                            float _832 = _830 + _694;
                            float _834 = _832 + (*spvDescriptorSet0.fp_c3)._m0[5].x;
                            float _836 = precise::max(_834, _828);
                            float _838 = precise::min(0.0, _836);
                            bool _840 = _838 == _834;
                            float _842 = float(_840);
                            _646 = _842;
                            _844 = true;
                        }
                        else
                        {
                            _646 = 1.0;
                            _844 = true;
                        }
                    }
                    else
                    {
                        _646 = 1.0;
                        _844 = true;
                    }
                }
                else
                {
                    _646 = 1.0;
                    _844 = true;
                }
            }
            else
            {
                _646 = 1.0;
                _844 = true;
            }
        }
        else
        {
            _646 = 1.0;
        }
    }
    _844 = false;
    float _846 = _646;
    float _848 = _638 * (*spvDescriptorSet0.fp_c3)._m0[7].x;
    float _850 = -_846;
    float _852 = fma(_848, _850, 1.0);
    out.m_39.x = _852;
    return out;
}

