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
    float2 _600 = float2(_62, _64);
    float _66 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_600, float2(0.0), isnan(_600))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_600, float2(0.0), isnan(_600))).x;
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
    bool _94 = !_86;
    int _97 = _94 ? 0 : 1;
    float _99 = fma(_82, (*spvDescriptorSet0.fp_c3)._m0[3].x, _90);
    float _101 = -_78;
    float _103 = fma(_101, (*spvDescriptorSet0.fp_c3)._m0[3].z, _99);
    int _105 = 2;
    if (!_86)
    {
        _105 = 1;
    }
    int _107 = _105;
    bool _109 = _78 > (*spvDescriptorSet0.fp_c4)._m0[33].z;
    int _111 = _107;
    if (!_92)
    {
        _111 = _97;
    }
    int _113 = _111;
    float _115 = -(*spvDescriptorSet0.fp_c3)._m0[2].y;
    float _117 = _80 * _115;
    int _119 = _113 + 1;
    float _121 = fma(_82, (*spvDescriptorSet0.fp_c3)._m0[2].x, _117);
    int _123 = _119;
    if (!_109)
    {
        _123 = _113;
    }
    int _125 = _123;
    float _127 = -(*spvDescriptorSet0.fp_c3)._m0[4].y;
    float _129 = _80 * _127;
    float _131 = -_78;
    float _133 = fma(_131, (*spvDescriptorSet0.fp_c3)._m0[2].z, _121);
    float _135 = _103 + (*spvDescriptorSet0.fp_c3)._m0[3].w;
    bool _137 = _125 != 1;
    float _139 = _133 + (*spvDescriptorSet0.fp_c3)._m0[2].w;
    bool _141 = _125 != 0;
    float _143 = fma(_82, (*spvDescriptorSet0.fp_c3)._m0[4].x, _129);
    bool _145 = !_137;
    int _147 = _145 ? as_type<int>((*spvDescriptorSet0.fp_c4)._m0[28].y) : as_type<int>((*spvDescriptorSet0.fp_c4)._m0[32].y);
    bool _149 = !_137;
    int _151 = _149 ? as_type<int>((*spvDescriptorSet0.fp_c4)._m0[28].x) : as_type<int>((*spvDescriptorSet0.fp_c4)._m0[32].x);
    float _153 = -_78;
    float _155 = fma(_153, (*spvDescriptorSet0.fp_c3)._m0[4].z, _143);
    float _157 = _141 ? as_type<float>(_147) : (*spvDescriptorSet0.fp_c4)._m0[24].y;
    float _159 = _141 ? as_type<float>(_151) : (*spvDescriptorSet0.fp_c4)._m0[24].x;
    float _161 = _155 + (*spvDescriptorSet0.fp_c3)._m0[4].w;
    float _163 = _135 * _157;
    bool _165 = !_137;
    int _167 = _165 ? as_type<int>((*spvDescriptorSet0.fp_c4)._m0[25].x) : as_type<int>((*spvDescriptorSet0.fp_c4)._m0[29].x);
    float _169 = fma(_139, _159, _163);
    bool _171 = !_137;
    int _173 = _171 ? as_type<int>((*spvDescriptorSet0.fp_c4)._m0[26].y) : as_type<int>((*spvDescriptorSet0.fp_c4)._m0[30].y);
    bool _175 = !_137;
    int _177 = _175 ? as_type<int>((*spvDescriptorSet0.fp_c4)._m0[28].z) : as_type<int>((*spvDescriptorSet0.fp_c4)._m0[32].z);
    float _179 = _141 ? as_type<float>(_167) : (*spvDescriptorSet0.fp_c4)._m0[21].x;
    bool _181 = !_137;
    int _183 = _181 ? as_type<int>((*spvDescriptorSet0.fp_c4)._m0[25].y) : as_type<int>((*spvDescriptorSet0.fp_c4)._m0[29].y);
    bool _185 = !_137;
    int _187 = _185 ? as_type<int>((*spvDescriptorSet0.fp_c4)._m0[26].x) : as_type<int>((*spvDescriptorSet0.fp_c4)._m0[30].x);
    bool _189 = !_137;
    int _191 = _189 ? as_type<int>((*spvDescriptorSet0.fp_c4)._m0[28].w) : as_type<int>((*spvDescriptorSet0.fp_c4)._m0[32].w);
    float _193 = _141 ? as_type<float>(_173) : (*spvDescriptorSet0.fp_c4)._m0[22].y;
    float _195 = _141 ? as_type<float>(_177) : (*spvDescriptorSet0.fp_c4)._m0[24].z;
    float _197 = _141 ? as_type<float>(_183) : (*spvDescriptorSet0.fp_c4)._m0[21].y;
    float _199 = _135 * _193;
    float _201 = _141 ? as_type<float>(_187) : (*spvDescriptorSet0.fp_c4)._m0[22].x;
    float _203 = fma(_161, _195, _169);
    float _205 = _141 ? as_type<float>(_191) : (*spvDescriptorSet0.fp_c4)._m0[24].w;
    float _207 = _135 * _197;
    float _209 = float(_125);
    float _211 = fma(_139, _201, _199);
    float _213 = _205 + _203;
    float _215 = fma(_139, _179, _207);
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
    float _237 = rint(_209);
    float _239 = precise::max(_237, 0.0);
    uint _242 = uint(_239);
    uint _244 = clamp(_242, 0u, 65535u);
    float _246 = _141 ? as_type<float>(_225) : (*spvDescriptorSet0.fp_c4)._m0[21].z;
    float _248 = fma(_161, _227, _211);
    float _250 = _141 ? as_type<float>(_231) : (*spvDescriptorSet0.fp_c4)._m0[22].w;
    float _252 = _141 ? as_type<float>(_235) : (*spvDescriptorSet0.fp_c4)._m0[21].w;
    float _254 = fma(_161, _246, _215);
    float _256 = _250 + _248;
    float _258 = _252 + _254;
    float _260 = _256 * _221;
    float _262 = _258 * _221;
    float3 _1020 = float3(_262, _260, float(int(_244)));
    float3 _1024 = select(_1020, float3(0.0), isnan(_1020));
    float _264 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, _1024.xy, uint(rint(_1024.z))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, _1024.xy, uint(rint(_1024.z))).x;
    float _266 = _135 * 78.233001708984375;
    float _268 = fma(_161, 12.98980045318603515625, _266);
    float _270 = fma(_139, 12.98980045318603515625, _266);
    float _272 = fma(_139, 45.16400146484375, _268);
    float _274 = fma(_161, 45.16400146484375, _270);
    float _276 = _272 + 94.67299652099609375;
    float _278 = _274 + 94.67299652099609375;
    float _280 = _276 * 0.15915493667125701904296875;
    float _282 = _278 * 0.15915493667125701904296875;
    float _284 = _282 * 6.283185482025146484375;
    float _286 = sin(_284);
    float _288 = _280 * 6.283185482025146484375;
    float _290 = sin(_288);
    bool _292 = !_137;
    int _294 = _292 ? as_type<int>((*spvDescriptorSet0.fp_c4)._m0[4].x) : as_type<int>((*spvDescriptorSet0.fp_c4)._m0[7].x);
    float _296 = _286 * 43758.546875;
    bool _298 = !_137;
    int _300 = _298 ? as_type<int>((*spvDescriptorSet0.fp_c4)._m0[3].y) : as_type<int>((*spvDescriptorSet0.fp_c4)._m0[6].y);
    bool _302 = !_137;
    int _304 = _302 ? as_type<int>((*spvDescriptorSet0.fp_c4)._m0[4].y) : as_type<int>((*spvDescriptorSet0.fp_c4)._m0[7].y);
    float _306 = floor(_296);
    float _308 = _141 ? as_type<float>(_304) : (*spvDescriptorSet0.fp_c4)._m0[1].y;
    float _310 = _290 * 43758.546875;
    bool _312 = !_137;
    int _314 = _312 ? as_type<int>((*spvDescriptorSet0.fp_c4)._m0[3].x) : as_type<int>((*spvDescriptorSet0.fp_c4)._m0[6].x);
    float _316 = _141 ? as_type<float>(_300) : (*spvDescriptorSet0.fp_c4)._m0[0].y;
    float _318 = floor(_310);
    float _320 = _141 ? as_type<float>(_314) : (*spvDescriptorSet0.fp_c4)._m0[0].x;
    float _322 = _141 ? as_type<float>(_294) : (*spvDescriptorSet0.fp_c4)._m0[1].x;
    float _324 = _135 * _316;
    float _326 = _135 * _308;
    float _328 = fma(_139, _320, _324);
    float _330 = fma(_139, _322, _326);
    float _332 = -(*spvDescriptorSet0.fp_c3)._m0[5].w;
    float _334 = _332 + 1.0;
    float _336 = -_306;
    float _338 = _296 + _336;
    bool _340 = !_137;
    int _342 = _340 ? as_type<int>((*spvDescriptorSet0.fp_c4)._m0[5].y) : as_type<int>((*spvDescriptorSet0.fp_c4)._m0[8].y);
    float _344 = fma(_334, (*spvDescriptorSet0.fp_c3)._m0[6].y, (*spvDescriptorSet0.fp_c3)._m0[6].w);
    float _346 = -_318;
    float _348 = _310 + _346;
    bool _350 = !_137;
    int _352 = _350 ? as_type<int>((*spvDescriptorSet0.fp_c4)._m0[5].x) : as_type<int>((*spvDescriptorSet0.fp_c4)._m0[8].x);
    float _354 = _344 * (*spvDescriptorSet0.fp_c3)._m0[5].z;
    float _356 = _141 ? as_type<float>(_342) : (*spvDescriptorSet0.fp_c4)._m0[2].y;
    float _358 = fma(_338, 2.0, -1.0);
    bool _360 = !_137;
    int _362 = _360 ? as_type<int>((*spvDescriptorSet0.fp_c4)._m0[3].z) : as_type<int>((*spvDescriptorSet0.fp_c4)._m0[6].z);
    float _364 = fma(_348, 2.0, -1.0);
    float _366 = _141 ? as_type<float>(_352) : (*spvDescriptorSet0.fp_c4)._m0[2].x;
    float _368 = _135 * _356;
    float _370 = _141 ? as_type<float>(_362) : (*spvDescriptorSet0.fp_c4)._m0[0].z;
    float _372 = _354 * _358;
    float _374 = fma(_139, _366, _368);
    float _376 = _354 * _364;
    float _378 = _372 * _372;
    float _380 = fma(_161, _370, _328);
    float _382 = fma(_376, _376, _378);
    bool _384 = !_137;
    int _386 = _384 ? as_type<int>((*spvDescriptorSet0.fp_c4)._m0[4].z) : as_type<int>((*spvDescriptorSet0.fp_c4)._m0[7].z);
    bool _388 = !_137;
    int _390 = _388 ? as_type<int>((*spvDescriptorSet0.fp_c4)._m0[5].z) : as_type<int>((*spvDescriptorSet0.fp_c4)._m0[8].z);
    float _392 = _382 + 1.0;
    float _394 = _141 ? as_type<float>(_386) : (*spvDescriptorSet0.fp_c4)._m0[1].z;
    bool _396 = !_137;
    int _398 = _396 ? as_type<int>((*spvDescriptorSet0.fp_c4)._m0[4].w) : as_type<int>((*spvDescriptorSet0.fp_c4)._m0[7].w);
    float _400 = rsqrt(_392);
    float _402 = _141 ? as_type<float>(_390) : (*spvDescriptorSet0.fp_c4)._m0[2].z;
    float _404 = fma(_161, _394, _330);
    bool _406 = !_137;
    int _408 = _406 ? as_type<int>((*spvDescriptorSet0.fp_c4)._m0[3].w) : as_type<int>((*spvDescriptorSet0.fp_c4)._m0[6].w);
    float _410 = _141 ? as_type<float>(_398) : (*spvDescriptorSet0.fp_c4)._m0[1].w;
    float _412 = fma(_161, _402, _374);
    float _414 = _141 ? as_type<float>(_408) : (*spvDescriptorSet0.fp_c4)._m0[0].w;
    float _416 = _410 + _404;
    bool _418 = !_137;
    int _420 = _418 ? as_type<int>((*spvDescriptorSet0.fp_c4)._m0[16].y) : as_type<int>((*spvDescriptorSet0.fp_c4)._m0[20].y);
    float _422 = _414 + _380;
    bool _424 = !_137;
    int _426 = _424 ? as_type<int>((*spvDescriptorSet0.fp_c4)._m0[5].w) : as_type<int>((*spvDescriptorSet0.fp_c4)._m0[8].w);
    bool _428 = !_137;
    int _430 = _428 ? as_type<int>((*spvDescriptorSet0.fp_c4)._m0[16].x) : as_type<int>((*spvDescriptorSet0.fp_c4)._m0[20].x);
    float _432 = fma(_372, _400, _416);
    float _434 = _141 ? as_type<float>(_420) : (*spvDescriptorSet0.fp_c4)._m0[12].y;
    float _436 = fma(_376, _400, _422);
    float _438 = _141 ? as_type<float>(_426) : (*spvDescriptorSet0.fp_c4)._m0[2].w;
    float _440 = _141 ? as_type<float>(_430) : (*spvDescriptorSet0.fp_c4)._m0[12].x;
    float _442 = _434 * _432;
    float _444 = _438 + _412;
    float _446 = fma(_440, _436, _442);
    float _448 = -_400;
    float _450 = _444 + _448;
    bool _452 = !_137;
    int _454 = _452 ? as_type<int>((*spvDescriptorSet0.fp_c4)._m0[16].w) : as_type<int>((*spvDescriptorSet0.fp_c4)._m0[20].w);
    bool _456 = !_137;
    int _458 = _456 ? as_type<int>((*spvDescriptorSet0.fp_c4)._m0[27].y) : as_type<int>((*spvDescriptorSet0.fp_c4)._m0[31].y);
    bool _460 = !_137;
    int _462 = _460 ? as_type<int>((*spvDescriptorSet0.fp_c4)._m0[16].z) : as_type<int>((*spvDescriptorSet0.fp_c4)._m0[20].z);
    float _464 = _141 ? as_type<float>(_458) : (*spvDescriptorSet0.fp_c4)._m0[23].y;
    float _466 = _141 ? as_type<float>(_462) : (*spvDescriptorSet0.fp_c4)._m0[12].z;
    bool _468 = !_137;
    int _470 = _468 ? as_type<int>((*spvDescriptorSet0.fp_c4)._m0[15].y) : as_type<int>((*spvDescriptorSet0.fp_c4)._m0[19].y);
    float _472 = _135 * _464;
    float _474 = _141 ? as_type<float>(_454) : (*spvDescriptorSet0.fp_c4)._m0[12].w;
    float _476 = fma(_466, _450, _446);
    float _478 = _141 ? as_type<float>(_470) : (*spvDescriptorSet0.fp_c4)._m0[11].y;
    float _480 = _474 + _476;
    bool _482 = !_137;
    int _484 = _482 ? as_type<int>((*spvDescriptorSet0.fp_c4)._m0[15].x) : as_type<int>((*spvDescriptorSet0.fp_c4)._m0[19].x);
    float _486 = _478 * _432;
    float _488 = 1.0 / _480;
    bool _490 = !_137;
    int _492 = _490 ? as_type<int>((*spvDescriptorSet0.fp_c4)._m0[15].z) : as_type<int>((*spvDescriptorSet0.fp_c4)._m0[19].z);
    float _494 = _141 ? as_type<float>(_484) : (*spvDescriptorSet0.fp_c4)._m0[11].x;
    bool _496 = !_137;
    int _498 = _496 ? as_type<int>((*spvDescriptorSet0.fp_c4)._m0[27].x) : as_type<int>((*spvDescriptorSet0.fp_c4)._m0[31].x);
    float _500 = fma(_494, _436, _486);
    float _502 = _141 ? as_type<float>(_492) : (*spvDescriptorSet0.fp_c4)._m0[11].z;
    bool _504 = !_137;
    int _506 = _504 ? as_type<int>((*spvDescriptorSet0.fp_c4)._m0[15].w) : as_type<int>((*spvDescriptorSet0.fp_c4)._m0[19].w);
    float _508 = _141 ? as_type<float>(_498) : (*spvDescriptorSet0.fp_c4)._m0[23].x;
    float _510 = fma(_502, _450, _500);
    bool _512 = !_137;
    int _514 = _512 ? as_type<int>((*spvDescriptorSet0.fp_c4)._m0[27].z) : as_type<int>((*spvDescriptorSet0.fp_c4)._m0[31].z);
    float _516 = fma(_139, _508, _472);
    float _518 = _141 ? as_type<float>(_506) : (*spvDescriptorSet0.fp_c4)._m0[11].w;
    float _520 = _141 ? as_type<float>(_514) : (*spvDescriptorSet0.fp_c4)._m0[23].z;
    bool _522 = !_137;
    int _524 = _522 ? as_type<int>((*spvDescriptorSet0.fp_c4)._m0[27].w) : as_type<int>((*spvDescriptorSet0.fp_c4)._m0[31].w);
    float _526 = _518 + _510;
    float _528 = fma(_161, _520, _516);
    float _530 = _141 ? as_type<float>(_524) : (*spvDescriptorSet0.fp_c4)._m0[23].w;
    float _532 = _526 * _488;
    float _534 = _530 + _528;
    float _536 = fma(_532, 0.5, 0.5);
    float _538 = -_536;
    float _540 = fma(_534, _221, _538);
    float _542 = _540 * (*spvDescriptorSet0.fp_c3)._m0[5].y;
    float _544 = fma(_542, 1.5, -1.0);
    float _546 = -_534;
    float _548 = fma(_546, _221, _264);
    float _550 = _548 + (*spvDescriptorSet0.fp_c3)._m0[5].x;
    float _552 = fma(_334, (*spvDescriptorSet0.fp_c3)._m0[6].x, (*spvDescriptorSet0.fp_c3)._m0[6].z);
    float _554 = precise::max(_550, _544);
    float _556 = _552 * (*spvDescriptorSet0.fp_c3)._m0[7].x;
    float _558 = precise::min(0.0, _554);
    bool _560 = _558 == _550;
    float _562 = float(_560);
    float _564 = -_562;
    float _566 = fma(_556, _564, 1.0);
    out.m_39.x = _566;
    return out;
}

