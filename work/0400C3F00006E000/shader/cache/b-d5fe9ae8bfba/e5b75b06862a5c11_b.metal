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
    constant _16* vp_c9 [[id(0)]];
    constant _16* vp_c8 [[id(1)]];
    constant _16* vp_c10 [[id(2)]];
    constant _16* vp_c13 [[id(3)]];
    constant _16* vp_c15 [[id(4)]];
    constant _16* vp_c7 [[id(5)]];
    texture2d<float> vp_t_tcb_24 [[id(6)]];
    sampler vp_t_tcb_24Smplr [[id(7)]];
    texture3d<float> vp_t_tcb_32 [[id(8)]];
    sampler vp_t_tcb_32Smplr [[id(9)]];
    texture3d<float> vp_t_tcb_30 [[id(10)]];
    sampler vp_t_tcb_30Smplr [[id(11)]];
    texture2d<float> vp_t_tcb_1C [[id(12)]];
    sampler vp_t_tcb_1CSmplr [[id(13)]];
    sampler vp_t_tcb_24Smplr_w [[id(14)]];
    sampler vp_t_tcb_32Smplr_w [[id(15)]];
    sampler vp_t_tcb_30Smplr_w [[id(16)]];
    sampler vp_t_tcb_1CSmplr_w [[id(17)]];
    constant dm_border_t* dm_border [[id(18)]];
};

struct main0_out
{
    float4 m_59 [[user(locn0)]];
    float4 m_81 [[user(locn1)]];
    float4 m_91 [[user(locn2)]];
    float4 m_65 [[user(locn3)]];
    float4 m_67 [[user(locn4)]];
    float4 m_87 [[user(locn5)]];
    float4 m_77 [[user(locn6)]];
    float4 m_71 [[user(locn7)]];
    float4 m_85 [[user(locn8)]];
    float4 m_95 [[user(locn9)]];
    float4 m_89 [[user(locn10)]];
    float4 m_93 [[user(locn11)]];
    float4 m_49 [[user(locn12)]];
    float4 m_69 [[user(locn13)]];
    float4 gl_Position [[position, invariant]];
    float gl_PointSize [[point_size]];
};

struct main0_in
{
    float4 m_83 [[attribute(0)]];
    float4 m_61 [[attribute(1)]];
    float4 m_53 [[attribute(2)]];
    float4 m_46 [[attribute(3)]];
    float4 m_51 [[attribute(4)]];
    float4 m_79 [[attribute(5)]];
    float4 m_63 [[attribute(6)]];
    float4 m_55 [[attribute(7)]];
    float4 m_57 [[attribute(8)]];
    float4 m_75 [[attribute(10)]];
    float4 m_73 [[attribute(11)]];
};

vertex main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]])
{
    main0_out out = {};
    out.m_59 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_81 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_91 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_65 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_67 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_87 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_77 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_71 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_85 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_95 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_89 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_93 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_49 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_69 = float4(0.0, 0.0, 0.0, 1.0);
    bool _3056 = false;
    bool _484 = false;
    bool _342 = false;
    bool _216 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _109 = in.m_46.w;
    float _111 = trunc(_109);
    int _114 = int(_111);
    bool _118 = _114 >= 1;
    float _120 = 0.0;
    if (!_118)
    {
        _120 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _122 = _120;
    float _124 = _122;
    if (!_118)
    {
        out.m_49.x = 0.0;
    }
    int _126 = 0;
    if (!_118)
    {
        float _128 = _122 * 5.0;
        _126 = as_type<int>(_128);
    }
    int _130 = _126;
    int _132 = _130;
    if (!_118)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _3361 = as_type<float>(_130);
        out.gl_Position.z = _3361;
    }
    if (!_118)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _134 = in.m_51.w;
    bool _136 = _134 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _138 = isnan(_134);
    bool _140 = _136 || _138;
    bool _142 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _144 = _140 || _142;
    float _146 = -_134;
    float _148 = _146 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    float _150 = 0.0;
    float _152 = _148;
    if (_144)
    {
        float _154 = float(_114);
        _150 = _154;
    }
    float _156 = _150;
    bool _158 = _148 >= _156;
    bool _160 = !_144;
    bool _162 = _158 || _160;
    if (_162)
    {
        _124 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _164 = _124;
    if (_162)
    {
        out.m_49.x = 0.0;
    }
    if (_162)
    {
        float _166 = _164 * 5.0;
        _132 = as_type<int>(_166);
    }
    int _168 = _132;
    if (_162)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _3430 = as_type<float>(_168);
        out.gl_Position.z = _3430;
    }
    if (_162)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _170 = in.m_53.x;
    float _172 = in.m_53.y;
    float _174 = in.m_53.z;
    bool _176 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _178 = _172 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _180 = _172 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _182 = _172 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _184 = fma(_170, (*spvDescriptorSet0.vp_c10)._m0[4].x, _178);
    float _186 = fma(_170, (*spvDescriptorSet0.vp_c10)._m0[5].x, _180);
    float _188 = fma(_170, (*spvDescriptorSet0.vp_c10)._m0[6].x, _182);
    float _190 = fma(_174, (*spvDescriptorSet0.vp_c10)._m0[4].z, _184);
    float _192 = fma(_174, (*spvDescriptorSet0.vp_c10)._m0[5].z, _186);
    float _194 = fma(_174, (*spvDescriptorSet0.vp_c10)._m0[6].z, _188);
    bool _196 = !_176;
    float _214;
    if (!_196)
    {
        float _198 = in.m_55.x;
        float _200 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _202 = _198 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _204 = fma(_202, (*spvDescriptorSet0.vp_c9)._m0[12].x, _148);
        float _206 = _204 * _200;
        float _208 = floor(_206);
        float _210 = -_208;
        float _212 = _206 + _210;
        _214 = _212;
        _216 = true;
    }
    else
    {
        float _218 = float(_114);
        float _220 = 1.0 / _218;
        float _222 = _148 * _220;
        _214 = _222;
    }
    _216 = false;
    float _224 = _214;
    float _226 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _228 = _224 + _226;
    bool _230 = _224 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _232 = isnan(_224);
    bool _234 = _230 || _232;
    bool _236 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _238 = _234 || _236;
    float _240 = float(_238);
    float _242 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _244 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _242;
    float _246 = 1.0 / _244;
    bool _248 = _224 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _250 = isnan(_224);
    bool _252 = _248 || _250;
    bool _254 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _256 = _252 || _254;
    float _258 = float(_256);
    float _260 = -_240;
    float _262 = _260 + 1.0;
    float _264 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _266 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _264;
    float _268 = -(*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _270 = (*spvDescriptorSet0.vp_c9)._m0[144].z + _268;
    bool _272 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _274 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _276 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _274;
    float _278 = _258 * _262;
    float _280 = -_258;
    float _282 = _280 + 1.0;
    float _284 = _228 * _246;
    float _286 = in.m_57.x;
    float _288 = in.m_57.y;
    float _290 = in.m_57.z;
    float _292 = fma(_266, _284, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _294 = fma(_276, _284, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _296 = fma(_270, _284, (*spvDescriptorSet0.vp_c9)._m0[143].z);
    float _298 = _292 * _278;
    float _300 = _294 * _278;
    float _302 = _296 * _278;
    float _304 = fma(_282, (*spvDescriptorSet0.vp_c9)._m0[143].x, _298);
    float _306 = fma(_282, (*spvDescriptorSet0.vp_c9)._m0[143].y, _300);
    float _308 = fma(_282, (*spvDescriptorSet0.vp_c9)._m0[143].z, _302);
    float _310 = fma(_240, (*spvDescriptorSet0.vp_c9)._m0[144].x, _304);
    float _312 = fma(_240, (*spvDescriptorSet0.vp_c9)._m0[144].y, _306);
    float _314 = fma(_240, (*spvDescriptorSet0.vp_c9)._m0[144].z, _308);
    float _316 = _312 * _288;
    float _318 = _310 * _286;
    float _320 = _314 * _290;
    bool _322 = !_272;
    float _340;
    if (!_322)
    {
        float _324 = in.m_55.x;
        float _326 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _328 = _324 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _330 = fma(_328, (*spvDescriptorSet0.vp_c9)._m0[11].y, _148);
        float _332 = _330 * _326;
        float _334 = floor(_332);
        float _336 = -_334;
        float _338 = _332 + _336;
        _340 = _338;
        _342 = true;
    }
    else
    {
        float _344 = float(_114);
        float _346 = 1.0 / _344;
        float _348 = _148 * _346;
        _340 = _348;
    }
    _342 = false;
    float _350 = _340;
    float _352 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _354 = _350 + _352;
    float _356 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _358 = _356 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _360 = _350 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _362 = isnan(_350);
    bool _364 = _360 || _362;
    bool _366 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _368 = _364 || _366;
    float _370 = float(_368);
    float _372 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _374 = _372 + (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _376 = _350 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _378 = isnan(_350);
    bool _380 = _376 || _378;
    bool _382 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _384 = _380 || _382;
    float _386 = float(_384);
    float _388 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _390 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _388;
    bool _392 = _350 >= (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _394 = isnan(_350);
    bool _396 = _392 || _394;
    bool _398 = isnan((*spvDescriptorSet0.vp_c9)._m0[117].w);
    bool _400 = _396 || _398;
    float _402 = float(_400);
    float _404 = 1.0 / _358;
    float _406 = -_370;
    float _408 = _406 + 1.0;
    bool _410 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].w;
    float _412 = 1.0 / _374;
    float _414 = _390 * _404;
    float _416 = -(*spvDescriptorSet0.vp_c9)._m0[116].x;
    float _418 = _416 + (*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _420 = -_402;
    float _422 = _420 + 1.0;
    float _424 = fma(_414, _354, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _426 = _386 * _408;
    float _428 = -_386;
    float _430 = _428 + 1.0;
    float _432 = _370 * _422;
    float _434 = _418 * _412;
    float _436 = _424 * _426;
    float _438 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _440 = _350 + _438;
    float _442 = fma(_430, (*spvDescriptorSet0.vp_c9)._m0[115].x, _436);
    float _444 = fma(_434, _440, (*spvDescriptorSet0.vp_c9)._m0[116].x);
    float _446 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _448 = fma(_444, _432, _442);
    float _450 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _452 = _446 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _454 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _456 = fma(_402, (*spvDescriptorSet0.vp_c9)._m0[117].x, _448);
    float _458 = _450 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _460 = _454 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _462 = _456 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    out.m_59.x = _452;
    out.m_59.y = _458;
    out.m_59.z = _460;
    out.m_59.w = _462;
    bool _464 = !_410;
    float _482;
    if (!_464)
    {
        float _466 = in.m_55.x;
        float _468 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].w;
        float _470 = _466 * (*spvDescriptorSet0.vp_c9)._m0[13].x;
        float _472 = fma(_470, (*spvDescriptorSet0.vp_c9)._m0[11].w, _148);
        float _474 = _472 * _468;
        float _476 = floor(_474);
        float _478 = -_476;
        float _480 = _474 + _478;
        _482 = _480;
        _484 = true;
    }
    else
    {
        float _486 = float(_114);
        float _488 = 1.0 / _486;
        float _490 = _148 * _488;
        _482 = _490;
    }
    _484 = false;
    float _492 = _482;
    float _494 = in.m_55.x;
    float _496 = in.m_55.y;
    float _498 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _500 = log2(_498);
    float _502 = _316 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _504 = in.m_46.x;
    float _506 = in.m_46.y;
    float _508 = in.m_46.z;
    float _510 = _320 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _512 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    float _514 = in.m_55.z;
    float _516 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].y);
    int _518 = int(_516);
    float _520 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    bool _522 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _524 = isnan(0.0);
    bool _526 = _522 || _524;
    bool _528 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _530 = _526 || _528;
    float _532 = _500 * _148;
    float _534 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].x);
    int _536 = int(_534);
    float _538 = _494 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    float _540 = _496 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    float _542 = _494 * 2.0;
    float _544 = exp2(_532);
    float _546 = -_512;
    float _548 = fma(_538, 2.0, _546);
    float _550 = fma(_540, -2.0, _520);
    float _552 = _496 + _494;
    float _554 = _506 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _556 = _506 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _558 = _506 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _560 = _552 + (-1.0);
    float _562 = floor(_542);
    float _564 = _496 * 2.0;
    float _566 = fma(_504, (*spvDescriptorSet0.vp_c10)._m0[6].x, _558);
    float _568 = _514 * 2.0;
    float _570 = fma(_504, (*spvDescriptorSet0.vp_c10)._m0[4].x, _554);
    float _572 = fma(_504, (*spvDescriptorSet0.vp_c10)._m0[5].x, _556);
    float _574 = fma(_560, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    float _576 = _496 + _514;
    float _578 = floor(_564);
    float _580 = float(_518);
    float _582 = _576 + (-1.0);
    bool _584 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _586 = isnan(1.0);
    bool _588 = _584 || _586;
    bool _590 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _592 = _588 || _590;
    float _594 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _596 = 1.0 + _594;
    float _598 = -_544;
    float _600 = _598 + 1.0;
    bool _602 = _562 > 0.0;
    float _604 = floor(_568);
    float _606 = fma(_148, (*spvDescriptorSet0.vp_c9)._m0[76].y, _550);
    bool _608 = _562 >= 0.0;
    bool _610 = isnan(_562);
    bool _612 = _608 || _610;
    bool _614 = isnan(0.0);
    bool _616 = _612 || _614;
    float _618 = fma(_508, (*spvDescriptorSet0.vp_c10)._m0[5].z, _572);
    float _620 = _530 ? _600 : 0.0;
    float _622 = fma(_582, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    float _624 = 1.0 / _580;
    bool _626 = _578 > 0.0;
    float _628 = _618 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    bool _630 = _578 >= 0.0;
    bool _632 = isnan(_578);
    bool _634 = _630 || _632;
    bool _636 = isnan(0.0);
    bool _638 = _634 || _636;
    float _640 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    float _642 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    float _644 = float(_536);
    float _646 = 1.0 / _596;
    bool _648 = _604 > 0.0;
    float _650 = fma(_494, (*spvDescriptorSet0.vp_c9)._m0[78].z, _640);
    bool _652 = _604 >= 0.0;
    bool _654 = isnan(_604);
    bool _656 = _652 || _654;
    bool _658 = isnan(0.0);
    bool _660 = _656 || _658;
    float _662 = fma(_496, (*spvDescriptorSet0.vp_c9)._m0[78].w, _642);
    int _664 = _616 ? 0 : 1;
    float _666 = _644 * _148;
    int _668 = _660 ? 0 : 1;
    float _670 = _624 * _148;
    float _672 = -_148;
    float _674 = fma(_672, (*spvDescriptorSet0.vp_c9)._m0[76].x, _548);
    float _676 = fma(_148, (*spvDescriptorSet0.vp_c9)._m0[77].z, _650);
    int _678 = ~_664;
    int _680 = _678 + 1;
    int _682 = _680 + 1;
    float _684 = fma(_148, (*spvDescriptorSet0.vp_c9)._m0[77].w, _662);
    int _686 = _682;
    if (!_602)
    {
        int _688 = ~_664;
        int _690 = _688 + 1;
        _686 = _690;
    }
    int _692 = _686;
    float _694 = fma(_508, (*spvDescriptorSet0.vp_c10)._m0[6].z, _566);
    int _696 = _638 ? 0 : 1;
    if (_592)
    {
        float _698 = _620 * _646;
        _152 = _698;
    }
    float _700 = _152;
    int _702 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 16;
    bool _704 = _702 != 0;
    int _706 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 32;
    bool _708 = _706 != 0;
    int _710 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 64;
    bool _712 = _710 != 0;
    float _714 = fma(_508, (*spvDescriptorSet0.vp_c10)._m0[4].z, _570);
    int _716 = ~_696;
    int _718 = _716 + 1;
    int _720 = _718 + 1;
    float _722 = _694 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    int _724 = _720;
    if (!_626)
    {
        int _726 = ~_696;
        int _728 = _726 + 1;
        _724 = _728;
    }
    int _730 = _724;
    float _732 = _714 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    bool _734 = !_708;
    int _736 = _734 ? 0 : 1;
    float _738 = in.m_61.x;
    float _740 = in.m_61.y;
    float _742 = in.m_61.z;
    bool _744 = !_704;
    int _746 = _744 ? 0 : 1;
    float _748 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _750 = _732 + _748;
    bool _752 = !_712;
    int _754 = _752 ? 0 : 1;
    int _756 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _758 = _756 != 0;
    int _760 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _762 = _760 != 0;
    int _764 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _766 = _764 != 0;
    float _768 = float(_692);
    int _770 = ~_668;
    int _772 = _770 + 1;
    int _774 = _772 + 1;
    bool _776 = !_758;
    int _778 = _776 ? 0 : 1;
    bool _780 = !_762;
    int _782 = _780 ? 0 : 1;
    int _784 = abs(_778);
    float _786 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _788 = _628 + _786;
    int _790 = abs(_782);
    int _792 = _774;
    if (!_648)
    {
        int _794 = ~_668;
        int _796 = _794 + 1;
        _792 = _796;
    }
    int _798 = _792;
    float _800 = _788 * _788;
    float _802 = float(_790);
    float _804 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _806 = _722 + _804;
    float _808 = fma(_750, _750, _800);
    float _810 = _802 * _768;
    float _812 = float(_784);
    float _814 = fma(_806, _806, _808);
    float _816 = float(_798);
    float _818 = _810 * (-2.0);
    float _820 = _496 + (-0.5);
    float _822 = sqrt(_814);
    bool _824 = !_766;
    int _826 = _824 ? 0 : 1;
    float _828 = fma(_818, _740, _740);
    float _830 = fma(_622, _818, _622);
    float _832 = _812 * _816;
    int _834 = abs(_826);
    float _836 = fma(_820, (*spvDescriptorSet0.vp_c9)._m0[196].y, _828);
    float _838 = _318 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _840 = rsqrt(_814);
    float _842 = float(_730);
    float _844 = _514 + _494;
    float _846 = float(_834);
    float _848 = _838 * (*spvDescriptorSet0.vp_c13)._m0[2].y;
    float _850 = _832 * (-2.0);
    float _852 = _844 + (-1.0);
    float _854 = _514 + (-0.5);
    float _856 = _822 * (*spvDescriptorSet0.vp_c13)._m0[2].x;
    float _858 = _846 * _842;
    float _860 = fma(_852, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _862 = _494 + (-0.5);
    float _864 = fma(_850, _738, _738);
    float _866 = precise::min(_848, _856);
    float _868 = _858 * (-2.0);
    float _870 = fma(_574, _850, _574);
    float _872 = fma(_862, (*spvDescriptorSet0.vp_c9)._m0[196].x, _864);
    float _874 = fma(_830, _700, _836);
    float _876 = _840 * _866;
    float _878 = fma(_860, _868, _860);
    float _880 = fma(_868, _742, _742);
    float _882 = fma(_870, _700, _872);
    float _884 = _788 * _876;
    float _886 = _874 * 0.15915493667125701904296875;
    float _888 = fma(_854, (*spvDescriptorSet0.vp_c9)._m0[196].z, _880);
    float _890 = _750 * _876;
    float _892 = -_884;
    float _894 = _788 + _892;
    float _896 = _882 * 0.15915493667125701904296875;
    float _898 = _806 * _876;
    float _900 = -_890;
    float _902 = _750 + _900;
    float _904 = _894 * _894;
    float _906 = fma(_878, _700, _888);
    float _908 = -_898;
    float _910 = _806 + _908;
    float _912 = _886 * 6.283185482025146484375;
    float _914 = sin(_912);
    float _916 = fma(_902, _902, _904);
    float _918 = _906 * 0.15915493667125701904296875;
    float _920 = in.m_63.x;
    float _922 = in.m_63.y;
    float _924 = in.m_63.z;
    float _926 = fma(_910, _910, _916);
    float _928 = _886 * 6.283185482025146484375;
    float _930 = cos(_928);
    float _932 = sqrt(_926);
    float _934 = _896 * 6.283185482025146484375;
    float _936 = sin(_934);
    float _938 = _896 * 6.283185482025146484375;
    float _940 = cos(_938);
    float _942 = _840 * _932;
    float _944 = _502 * _942;
    float _946 = _838 * _942;
    float _948 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _922);
    float _950 = _918 * 6.283185482025146484375;
    float _952 = cos(_950);
    float _954 = _936 * _914;
    float _956 = _936 * _930;
    float _958 = _944 * _948;
    float _960 = _510 * _942;
    float _962 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _924);
    float _964 = _918 * 6.283185482025146484375;
    float _966 = sin(_964);
    float _968 = _940 * _930;
    float _970 = _940 * _914;
    float _972 = _960 * _962;
    float _974 = _936 * _952;
    float _976 = _930 * _952;
    float _978 = _940 * _952;
    float _980 = _914 * _952;
    float _982 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _920);
    float _984 = _978 * _958;
    float _986 = fma(_966, _968, _954);
    float _988 = _946 * _982;
    float _990 = -_956;
    float _992 = fma(_966, _970, _990);
    float _994 = -_958;
    float _996 = _966 * _994;
    float _998 = -_970;
    float _1000 = fma(_966, _956, _998);
    float _1002 = fma(_986, _988, _984);
    float _1004 = _974 * _958;
    float _1006 = fma(_976, _988, _996);
    float _1008 = fma(_966, _954, _968);
    float _1010 = fma(_992, _972, _1002);
    float _1012 = fma(_1000, _988, _1004);
    float _1014 = fma(_980, _972, _1006);
    float _1016 = _1010 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _1018 = fma(_1008, _972, _1012);
    float _1020 = _1010 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _1022 = _1010 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _1024 = fma(_1014, (*spvDescriptorSet0.vp_c8)._m0[26].x, _1016);
    float _1026 = fma(_1014, (*spvDescriptorSet0.vp_c8)._m0[24].x, _1020);
    float _1028 = fma(_1018, (*spvDescriptorSet0.vp_c8)._m0[26].z, _1024);
    float _1030 = fma(_1018, (*spvDescriptorSet0.vp_c8)._m0[24].z, _1026);
    float _1032 = _1028 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _1034 = _1030 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _1036 = _722 + _1032;
    float _1038 = _732 + _1034;
    float _1040 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1042 = _1036 + _1040;
    float _1044 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1046 = _1038 + _1044;
    float _1048 = _1042 * _1042;
    float _1050 = fma(_1046, _1046, _1048);
    float _1052 = fma(_1014, (*spvDescriptorSet0.vp_c8)._m0[25].x, _1022);
    float _1054 = -_884;
    float _1056 = _628 + _1054;
    float _1058 = -_890;
    float _1060 = _732 + _1058;
    float _1062 = sqrt(_1050);
    float _1064 = fma(_1018, (*spvDescriptorSet0.vp_c8)._m0[25].z, _1052);
    float _1066 = _1056 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _1068 = -_898;
    float _1070 = _722 + _1068;
    float _1072 = _1064 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _1074 = fma(_1060, (*spvDescriptorSet0.vp_c8)._m0[11].x, _1066);
    float _1076 = _628 + _1072;
    float _1078 = fma(_1070, (*spvDescriptorSet0.vp_c8)._m0[11].z, _1074);
    bool _1080 = _1062 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1082 = _1072;
    float _1084 = _1074;
    float _1086 = _1038;
    float _1088 = _898;
    float _1090 = _884;
    float _1092 = _890;
    float _1094 = _1050;
    float _1096 = _920;
    if (!_1080)
    {
        _1082 = _1036;
    }
    float _1098 = _1082;
    float _1100 = _1098;
    if (!_1080)
    {
        _1084 = _1076;
    }
    float _1102 = _1084;
    bool _1104 = !_1080;
    float _1106 = _1102;
    if (!_1104)
    {
        float _1108 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1110 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1112 = _1062 + _1110;
        float _1114 = _1076 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1116 = rsqrt(_1050);
        float _1118 = _1112 * _1108;
        float _1120 = _1118 * 0.15915493667125701904296875;
        float _1122 = _1120 * 6.283185482025146484375;
        float _1124 = sin(_1122);
        float _1126 = _1120 * 6.283185482025146484375;
        float _1128 = cos(_1126);
        float _1130 = fma(_1124, _1114, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1132 = _1116 * _1130;
        float _1134 = _1128 + (-1.0);
        float _1136 = fma(_1046, _1132, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1138 = fma(_1042, _1132, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        float _1140 = _1134 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1142 = fma(_1076, _1128, _1140);
        _1106 = _1142;
        _1086 = _1136;
        _1100 = _1138;
    }
    float _1144 = _1106;
    float _1146 = _1086;
    float _1148 = _1100;
    float _1150 = -_628;
    float _1152 = _1150 + _1144;
    float _1154 = _1078 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _1156 = -_732;
    float _1158 = _1156 + _1146;
    float _1160 = -_722;
    float _1162 = _1160 + _1148;
    float _1164 = _1152 * _1152;
    float _1166 = 1.0 / _1154;
    float _1168 = -_890;
    float _1170 = _1168 + _1146;
    float _1172 = fma(_1158, _1158, _1164);
    float _1174 = _1056 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _1176 = -_898;
    float _1178 = _1176 + _1148;
    float _1180 = fma(_1162, _1162, _1172);
    float _1182 = fma(_1060, (*spvDescriptorSet0.vp_c8)._m0[10].x, _1174);
    bool _1184 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[660].y;
    bool _1186 = isnan(0.5);
    bool _1188 = _1184 || _1186;
    bool _1190 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _1192 = _1188 || _1190;
    float _1194 = sqrt(_1180);
    float _1196 = fma(_1070, (*spvDescriptorSet0.vp_c8)._m0[10].z, _1182);
    bool _1198 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[653].w;
    bool _1200 = isnan(0.5);
    bool _1202 = _1198 || _1200;
    bool _1204 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _1206 = _1202 || _1204;
    float _1208 = _1196 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _1210 = _1208 + _1154;
    float _1212 = -_884;
    float _1214 = _1212 + _1144;
    float _1216 = _1210 * _1166;
    float _1218 = _1216 * 0.5;
    bool _1220 = _1194 > 0.0;
    float _1222 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _1224 = fma(_1218, (*spvDescriptorSet0.vp_c8)._m0[30].w, _1222);
    float _1226 = 1.0 / _1224;
    float _1228 = _1194;
    float _1230 = _1144;
    float _1232 = _1224;
    float _1234 = _1166;
    float _1236 = _1178;
    if (!_1220)
    {
        _1088 = _1170;
    }
    float _1238 = _1088;
    float _1240 = _1238;
    if (!_1220)
    {
        _1090 = _1214;
    }
    float _1242 = _1090;
    float _1244 = _1242;
    if (!_1220)
    {
        _1228 = _1178;
    }
    float _1246 = _1228;
    bool _1248 = !_1220;
    float _1250 = _1246;
    float _1252 = _1246;
    if (!_1248)
    {
        float _1254 = _192 * _192;
        float _1256 = fma(_190, _190, _1254);
        float _1258 = fma(_194, _194, _1256);
        float _1260 = rsqrt(_1180);
        float _1262 = sqrt(_1258);
        float _1264 = _1152 * _1260;
        float _1266 = _1158 * _1260;
        float _1268 = _1162 * _1260;
        bool _1270 = _1262 > 0.0;
        float _1272 = _1262;
        float _1274 = _1260;
        _1092 = _1258;
        _1230 = _1266;
        _1232 = _1264;
        if (!_1270)
        {
            _1272 = _1170;
        }
        float _1276 = _1272;
        _1240 = _1276;
        if (!_1270)
        {
            _1274 = _1214;
        }
        float _1278 = _1274;
        _1244 = _1278;
        if (!_1270)
        {
            _1250 = _1178;
        }
        float _1280 = _1250;
        bool _1282 = !_1270;
        _1252 = _1280;
        if (!_1282)
        {
            float _1284 = rsqrt(_1258);
            float _1286 = 1.0 / (*spvDescriptorSet0.vp_c10)._m0[2].z;
            float _1288 = _192 * _1284;
            float _1290 = _190 * _1284;
            float _1292 = _194 * _1284;
            float _1294 = _1264 * _1288;
            float _1296 = fma(_1266, _1290, _1294);
            float _1298 = _1286 * (*spvDescriptorSet0.vp_c9)._m0[142].x;
            float _1300 = fma(_1268, _1292, _1296);
            float _1302 = _1300 * _1298;
            float _1304 = fma(_190, _1302, _1170);
            float _1306 = fma(_192, _1302, _1214);
            float _1308 = fma(_194, _1302, _1178);
            _1240 = _1304;
            _1244 = _1306;
            _1252 = _1308;
        }
    }
    float _1310 = _1240;
    float _1312 = _1244;
    float _1314 = _1252;
    float _1316 = _1092;
    float _1318 = _1230;
    float _1320 = _1232;
    float _1322 = _1312;
    float _1324 = _1310;
    float _1326 = _1314;
    float _1328 = _1320;
    float _1330 = _1316;
    float _1332 = _1318;
    if (_1206)
    {
        _1234 = 1.0;
    }
    float _1334 = _1234;
    float _1336 = _1334;
    if (!_1192)
    {
        float _1338 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
        float _1340 = _1056 + _1338;
        float _1342 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
        float _1344 = _1060 + _1342;
        float _1346 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1348 = _1340 * _1340;
        float _1350 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
        float _1352 = _1070 + _1350;
        float _1354 = fma(_1344, _1344, _1348);
        float _1356 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _1358 = fma(_1352, _1352, _1354);
        float _1360 = sqrt(_1358);
        float _1362 = _1346 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1364 = precise::min(_1360, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _1366 = _1364 * _1356;
        float _1368 = -_1060;
        float _1370 = _1368 + _1310;
        float _1372 = _1362 * _1366;
        float _1374 = -_1056;
        float _1376 = _1374 + _1312;
        float _1378 = -_1070;
        float _1380 = _1378 + _1314;
        float _1382 = fma(_1370, _1372, _1060);
        float _1384 = fma(_1376, _1372, _1056);
        float _1386 = fma(_1380, _1372, _1070);
        _1322 = _1384;
        _1324 = _1382;
        _1326 = _1386;
    }
    float _1388 = _1322;
    float _1390 = _1324;
    float _1392 = _1326;
    if (_1206)
    {
        _1328 = 1.0;
    }
    float _1394 = _1328;
    float _1396 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _1398 = _1226 * _1396;
    float _1400 = _1394;
    if (!_1206)
    {
        float _1402 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1404 = _1402 * 0.15915493667125701904296875;
        float _1406 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1408 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1410 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _1408;
        float _1412 = _1404 * 6.283185482025146484375;
        float _1414 = cos(_1412);
        float _1416 = _1406 * 0.15915493667125701904296875;
        float _1418 = _1404 * 6.283185482025146484375;
        float _1420 = sin(_1418);
        float _1422 = 1.0 / _1414;
        float _1424 = _1416 * 6.283185482025146484375;
        float _1426 = cos(_1424);
        float _1428 = _1420 * _1422;
        float _1430 = _1416 * 6.283185482025146484375;
        float _1432 = sin(_1430);
        float _1434 = _1426 * _1428;
        float _1436 = 1.0 / _1410;
        float _1438 = 1.0 / _1434;
        float _1440 = _1432 * _1438;
        float _1442 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1444 = fma(_1398, _1440, _1442);
        float _1446 = _1444 * _1436;
        float _1448 = precise::clamp(_1446, 0.0, 1.0);
        _1330 = _1416;
        _1336 = _1448;
    }
    float _1450 = _1330;
    float _1452 = _1336;
    if (!_1206)
    {
        float _1454 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1456 = _1454 * 0.15915493667125701904296875;
        float _1458 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1460 = _1456 * 6.283185482025146484375;
        float _1462 = cos(_1460);
        float _1464 = _1458 * 0.15915493667125701904296875;
        float _1466 = _1456 * 6.283185482025146484375;
        float _1468 = sin(_1466);
        float _1470 = 1.0 / _1462;
        float _1472 = _1464 * 6.283185482025146484375;
        float _1474 = cos(_1472);
        float _1476 = _1468 * _1470;
        float _1478 = _1464 * 6.283185482025146484375;
        float _1480 = sin(_1478);
        float _1482 = _1474 * _1476;
        float _1484 = 1.0 / _1482;
        float _1486 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _1488 = (*spvDescriptorSet0.vp_c9)._m0[140].w + _1486;
        float _1490 = 1.0 / _1488;
        float _1492 = _1480 * _1484;
        float _1494 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _1496 = fma(_1398, _1492, _1494);
        float _1498 = _1496 * _1490;
        float _1500 = precise::clamp(_1498, 0.0, 1.0);
        float _1502 = -_1500;
        float _1504 = _1502 + 1.0;
        _1400 = _1504;
    }
    float _1506 = _1400;
    float _1508 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1510 = _1388 + _1508;
    float _1512 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1514 = _1390 + _1512;
    float _1516 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1518 = _1392 + _1516;
    float _1520 = _1388 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1522 = _1510 * _1510;
    float _1524 = _1388 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1526 = fma(_1390, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1520);
    float _1528 = fma(_1514, _1514, _1522);
    float _1530 = fma(_1390, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1524);
    float _1532 = fma(_1392, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1526);
    float _1534 = fma(_1518, _1518, _1528);
    float _1536 = fma(_1392, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1530);
    float _1538 = _1532 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1540 = rsqrt(_1534);
    float _1542 = _1536 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1544 = sqrt(_1534);
    float _1546 = _1540 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1548 = _1514 * _1546;
    float _1550 = _1518 * _1546;
    float _1552 = _1548 * _1548;
    float _1554 = _1550 * _1550;
    float _1556 = _1552 + _1554;
    float _1558 = sqrt(_1556);
    bool _1560 = _1558 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1562 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1564 = _1558 + _1562;
    float _1566 = _1522;
    float _1568 = _1556;
    float _1570 = _1564;
    float _1572 = _1548;
    float _1574 = _1550;
    float _1576 = _1552;
    if (_1560)
    {
        float _1578 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1566 = _1578;
    }
    float _1580 = _1566;
    if (_1560)
    {
        float _1582 = rsqrt(_1556);
        _1568 = _1582;
    }
    float _1584 = _1568;
    float _1586 = _1584;
    if (_1560)
    {
        float _1588 = _1564 * _1580;
        _1570 = _1588;
    }
    float _1590 = _1570;
    if (_1560)
    {
        float _1592 = _1590 * 0.15915493667125701904296875;
        _1094 = _1592;
    }
    float _1594 = _1094;
    float _1596 = _1580;
    if (_1560)
    {
        float _1598 = _1594 * 6.283185482025146484375;
        float _1600 = sin(_1598);
        _1596 = _1600;
    }
    float _1602 = _1596;
    float _1604 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _1606 = precise::max(0.0, _1604);
    float _1608 = _1450;
    if (_1560)
    {
        float _1610 = _1594 * 6.283185482025146484375;
        float _1612 = cos(_1610);
        _1608 = _1612;
    }
    float _1614 = _1608;
    float _1616 = -_1546;
    float _1618 = -_1606;
    float _1620 = fma(_1510, _1616, _1618);
    if (_1560)
    {
        float _1622 = _1620 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1236 = _1622;
    }
    float _1624 = _1236;
    float _1626 = _1538 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _1628 = fma(_1060, (*spvDescriptorSet0.vp_c15)._m0[652].x, (*spvDescriptorSet0.vp_c15)._m0[652].z);
    float _1630 = _1602;
    float _1632 = _1624;
    if (_1560)
    {
        float _1634 = fma(_1602, _1624, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1332 = _1634;
    }
    float _1636 = _1332;
    float _1638 = _1636;
    if (!_1560)
    {
        _1630 = _1620;
    }
    float _1640 = _1630;
    float _1642 = floor(_1628);
    float _1644 = _1640;
    float _1646 = _1614;
    if (_1560)
    {
        float _1648 = _1614 + (-1.0);
        _1632 = _1648;
    }
    float _1650 = _1632;
    if (_1560)
    {
        float _1652 = _1584 * _1636;
        _1638 = _1652;
    }
    float _1654 = _1638;
    if (_1560)
    {
        float _1656 = _1650 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1586 = _1656;
    }
    float _1658 = _1586;
    if (_1560)
    {
        float _1660 = _1548 * _1654;
        _1572 = _1660;
    }
    float _1662 = _1572;
    if (_1560)
    {
        float _1664 = _1550 * _1654;
        _1574 = _1664;
    }
    float _1666 = _1574;
    if (_1560)
    {
        float _1668 = fma(_1620, _1614, _1658);
        _1644 = _1668;
    }
    float _1670 = _1644;
    if (_1560)
    {
        float _1672 = _1662 * _1662;
        _1576 = _1672;
    }
    float _1674 = _1576;
    if (!_1560)
    {
        _1646 = _1554;
    }
    float _1676 = _1646;
    float _1678 = _1676;
    if (_1560)
    {
        float _1680 = _1666 * _1666;
        _1678 = _1680;
    }
    float _1682 = _1678;
    float _1684 = _1388 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1686 = fma(_1670, _1670, _1674);
    float _1688 = fma(_1390, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1684);
    float _1690 = _1686 + _1682;
    float _1692 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _1694 = _1388 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1696 = fma(_1392, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1688);
    float _1698 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _1700 = fma(_1544, (*spvDescriptorSet0.vp_c15)._m0[23].w, _1698);
    float _1702 = precise::clamp(_1700, 0.0, 1.0);
    float _1704 = fma(_1390, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1694);
    float _1706 = _1696 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1708 = rsqrt(_1690);
    float _1710 = -_1702;
    float _1712 = _1710 + 1.0;
    float _1714 = fma(_1392, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1704);
    float _1716 = -_1626;
    float _1718 = fma(_1716, _1692, 1.0);
    float _1720 = fma(_1070, (*spvDescriptorSet0.vp_c15)._m0[652].y, (*spvDescriptorSet0.vp_c15)._m0[652].w);
    float _1722 = _1706 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1724 = _1714 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1726 = _1706 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1728 = abs(_1712);
    float _1730 = log2(_1728);
    float _1732 = fma(_1724, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1726);
    float _1734 = fma(_1538, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1732);
    float _1736 = _1708 * _1662;
    float _1738 = _1708 * _1670;
    float _1740 = floor(_1720);
    float _1742 = fma(_1542, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1734);
    float _1744 = _1736 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _1746 = _1708 * _1666;
    float _1748 = -_1642;
    float _1750 = _1628 + _1748;
    float _1752 = _1706 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1754 = -_1744;
    float _1756 = fma(_1738, (*spvDescriptorSet0.vp_c15)._m0[21].y, _1754);
    float _1758 = _1730 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _1760 = log2(_1718);
    float _1762 = fma(_1724, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1752);
    float _1764 = -_1746;
    float _1766 = fma(_1764, (*spvDescriptorSet0.vp_c15)._m0[21].z, _1756);
    float _1768 = fma(_1538, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1762);
    float _1770 = fma(_1766, -0.5, 0.5);
    float _1772 = fma(_1766, 0.5, 0.5);
    float _1774 = 1.0 / _1742;
    float _1776 = -_1740;
    float _1778 = _1720 + _1776;
    float _1780 = fma(_1724, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1722);
    float _1782 = fma(_1772, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _1784 = fma(_1542, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1768);
    float _1786 = _1738 + 1.0;
    float _1788 = fma(_1538, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1780);
    float _1790 = fma(_1772, _1782, -0.212114393711090087890625);
    float _1792 = exp2(_1758);
    float _1794 = _1760 * 0.693147182464599609375;
    float _1796 = fma(_1542, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1788);
    float _1798 = fma(_1772, _1790, 1.570728778839111328125);
    float _1800 = _1794 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _1802 = sqrt(_1770);
    float _1804 = _1784 * _1774;
    float _1806 = _1796 * _1774;
    float _1808 = -_1738;
    float _1810 = fma(_1792, _1786, _1808);
    float2 _5983 = float2(_1750, _1778);
    float _1812 = dm_bs(spvDescriptorSet0.vp_t_tcb_24.sample(spvDescriptorSet0.vp_t_tcb_24Smplr, select(_5983, float2(0.0), isnan(_5983)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_24, spvDescriptorSet0.vp_t_tcb_24Smplr_w, select(_5983, float2(0.0), isnan(_5983)), level(0.0)).x;
    float _1814 = fma(_1810, 0.5, 0.5);
    float _1816 = _1802 * 0.636619746685028076171875;
    float _1818 = fma(_1804, 0.5, 0.5);
    float _1820 = fma(_1806, -0.5, 0.5);
    float _1822 = -_1798;
    float _1824 = fma(_1816, _1822, 1.0);
    float3 _6008 = float3(_1818, _1820, _1800);
    float _1826 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_6008, float3(0.0), isnan(_6008)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_6008, float3(0.0), isnan(_6008)), level(0.0)).x;
    float3 _6019 = float3(_1818, _1820, _1800);
    float4 _1829 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_6019, float3(0.0), isnan(_6019)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_6019, float3(0.0), isnan(_6019)), level(0.0)).xyzw;
    float _1831 = _1829.x;
    float _1833 = _1829.y;
    float _1835 = _1829.z;
    float _1837 = _1829.w;
    float2 _6035 = float2(_1824, _1814);
    float3 _1841 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_6035, float2(0.0), isnan(_6035)), level(0.0)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_6035, float2(0.0), isnan(_6035)), level(0.0)).xyz;
    float _1843 = _1841.x;
    float _1845 = _1841.y;
    float _1847 = _1841.z;
    float _1849 = float(uint(_536));
    float _1851 = trunc(_670);
    int _1853 = int(_1851);
    bool _1855 = _536 == 0;
    out.m_65.x = _1060;
    out.m_65.y = _1056;
    out.m_65.z = _1070;
    int _1857 = abs(_754);
    float _1859 = _1730 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    bool _1861 = _496 > 0.5;
    out.m_67.w = _866;
    float _1863 = 1.0 / _1849;
    int _1865 = ~_536;
    int _1867 = _1865 + 1;
    out.m_69.x = _946;
    float _1869 = float(_114);
    out.m_71.x = _1390;
    out.m_71.y = _1388;
    out.m_71.z = _1392;
    float _1871 = float(uint(_1853));
    float _1873 = 1.0 / _1869;
    int _1875 = as_type<int>(_1863) + (-2);
    float _1877 = exp2(_1859);
    float _1879 = as_type<float>(_1875) * _1871;
    int _1881 = ~_536;
    int _1883 = _1881 + 1;
    float _1885 = trunc(_1879);
    float _1887 = precise::max(_1885, 0.0);
    uint _1890 = uint(_1887);
    float _1892 = -(*spvDescriptorSet0.vp_c9)._m0[133].x;
    float _1894 = (*spvDescriptorSet0.vp_c9)._m0[134].x + _1892;
    float _1896 = -_1877;
    float _1898 = _1896 + 1.0;
    int _1900 = _1867 * int(_1890);
    int _1902 = _1900 + _1853;
    float _1904 = float(uint(_1902));
    float _1906 = as_type<float>(_1875) * _1904;
    int _1908 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _1910 = _1908 != 0;
    float _1912 = float(_1853);
    float _1914 = trunc(_1906);
    float _1916 = precise::max(_1914, 0.0);
    uint _1918 = uint(_1916);
    bool _1920 = !_1910;
    float _1922 = _1920 ? 7.345489978790283203125 : 1.0;
    bool _1924 = _1912 >= _644;
    bool _1926 = isnan(_1912);
    bool _1928 = _1924 || _1926;
    bool _1930 = isnan(_644);
    bool _1932 = _1928 || _1930;
    float _1934 = float(_1932);
    float _1936 = _1922 * _494;
    float _1938 = trunc(_1934);
    int _1940 = int(_1938);
    int _1942 = int(_1890) + int(_1918);
    float _1944 = floor(_1936);
    int _1946 = _1883 * _1942;
    int _1948 = _1946 + _1853;
    bool _1950 = uint(_1948) >= uint(_536);
    bool _1952 = !_1950;
    int _1954 = _1952 ? 0 : (-1);
    float _1956 = -_1944;
    float _1958 = _1936 + _1956;
    int _1960 = ~_1942;
    int _1962 = _1960 + _1954;
    int _1964 = _1962 + 1;
    float _1966 = _666 * _1873;
    int _1968 = ~_1940;
    int _1970 = _1968 + 1;
    int _1972 = _1970 + 1;
    float _1974 = _1958 * _644;
    int _1976 = _536 * _1964;
    int _1978 = _1976 + _1853;
    int _1980 = _536 + (-1);
    float _1982 = trunc(_1966);
    int _1984 = int(_1982);
    int _1986 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4096;
    bool _1988 = _1986 != 0;
    bool _1990 = !_1855;
    int _1992 = _1990 ? _1978 : (-1);
    float _1994 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _1996 = _492 + _1994;
    bool _1998 = !_1988;
    int _2000 = _1998 ? 0 : 1;
    int _2002 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 128;
    bool _2004 = _2002 != 0;
    float _2006 = trunc(_1974);
    int _2008 = int(_2006);
    int _2010 = _1992 * _1972;
    int _2012 = abs(_2000);
    int _2014 = abs(_736);
    int _2016 = _1940 * _1980;
    int _2018 = _2016 + _2010;
    bool _2020 = !_2004;
    int _2022 = _2020 ? 0 : 1;
    int _2024 = _2018 * _2014;
    int _2026 = abs(_746);
    int _2028 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _2030 = _2028 != 0;
    int _2032 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _2034 = _2032 != 0;
    int _2036 = _1984 * _2026;
    int _2038 = _2036 + _2024;
    int _2040 = _2008 * _2012;
    int _2042 = _2040 + _1853;
    int _2044 = abs(_2022);
    float _2046 = in.m_73.x;
    int _2048 = _2042 * _1857;
    int _2050 = _2048 + _2038;
    float _2052 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _2054 = _2052 + (*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _2056 = in.m_75.y;
    int _2058 = _2008 * _2044;
    int _2060 = _2058 + _2050;
    int _2062 = ~_536;
    int _2064 = _2062 + 1;
    float _2066 = 1.0 / _2054;
    float _2068 = float(uint(_2060));
    float _2070 = as_type<float>(_1875) * _2068;
    float _2072 = trunc(_2070);
    float _2074 = precise::max(_2072, 0.0);
    uint _2076 = uint(_2074);
    out.m_77.x = _2046;
    int _2078 = _2064 * int(_2076);
    int _2080 = _2078 + _2060;
    float _2082 = float(uint(_2080));
    int _2084 = ~_536;
    int _2086 = _2084 + 1;
    float _2088 = as_type<float>(_1875) * _2082;
    float _2090 = trunc(_2088);
    float _2092 = precise::max(_2090, 0.0);
    uint _2094 = uint(_2092);
    int _2096 = int(_2076) + int(_2094);
    float _2098 = in.m_73.y;
    int _2100 = _2086 * _2096;
    int _2102 = _2100 + _2060;
    float _2104 = in.m_73.z;
    bool _2106 = uint(_2102) >= uint(_536);
    float _2108 = in.m_73.w;
    bool _2110 = !_2106;
    int _2112 = _2110 ? 0 : (-1);
    int _2114 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2097152;
    bool _2116 = _2114 != 0;
    float _2118 = -(*spvDescriptorSet0.vp_c9)._m0[131].x;
    float _2120 = (*spvDescriptorSet0.vp_c9)._m0[132].x + _2118;
    int _2122 = ~_2096;
    int _2124 = _2122 + _2112;
    int _2126 = _2124 + 1;
    float _2128 = -(*spvDescriptorSet0.vp_c9)._m0[132].x;
    float _2130 = _2128 + (*spvDescriptorSet0.vp_c9)._m0[133].x;
    float _2132 = _2120 * _2066;
    int _2134 = ~_536;
    int _2136 = _2134 + 1;
    int _2138 = _536 * _2126;
    int _2140 = _2138 + _2060;
    float _2142 = float(uint(_2042));
    float _2144 = -(*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _2146 = _2144 + (*spvDescriptorSet0.vp_c9)._m0[133].w;
    float _2148 = fma(_2132, _1996, (*spvDescriptorSet0.vp_c9)._m0[131].x);
    out.m_77.y = _2098;
    bool _2150 = !_1855;
    int _2152 = _2150 ? _2140 : (-1);
    float _2154 = as_type<float>(_1875) * _2142;
    float _2156 = 1.0 / _2146;
    float _2158 = -_2056;
    float _2160 = _2158 + 1.0;
    int _2162 = _2152 >> 31;
    out.m_77.z = _2104;
    int _2164 = _2152 & 3;
    bool _2166 = _2164 != 0;
    int _2168 = _2162 & 3;
    out.m_77.w = _2108;
    float _2170 = trunc(_2154);
    float _2172 = precise::max(_2170, 0.0);
    uint _2174 = uint(_2172);
    float _2176 = _2056;
    float _2178 = _1742;
    float _2180 = _1796;
    float _2182 = _1784;
    if (_2034)
    {
        float _2184 = _1861 ? _2160 : _2056;
        _2176 = _2184;
    }
    float _2186 = _2176;
    int _2188 = _2152 + _2168;
    bool _2190 = _492 >= (*spvDescriptorSet0.vp_c9)._m0[134].w;
    bool _2192 = isnan(_492);
    bool _2194 = _2190 || _2192;
    bool _2196 = isnan((*spvDescriptorSet0.vp_c9)._m0[134].w);
    bool _2198 = _2194 || _2196;
    float _2200 = float(_2198);
    int _2202 = _2188 >> 2;
    float _2204 = _2130 * _2156;
    float _2206 = -_2200;
    float _2208 = _2206 + 1.0;
    int _2210 = _2202 << 4;
    int _2212 = _2210 + 368;
    bool _2214 = _492 >= (*spvDescriptorSet0.vp_c9)._m0[133].w;
    bool _2216 = isnan(_492);
    bool _2218 = _2214 || _2216;
    bool _2220 = isnan((*spvDescriptorSet0.vp_c9)._m0[133].w);
    bool _2222 = _2218 || _2220;
    float _2224 = float(_2222);
    float _2226 = -(*spvDescriptorSet0.vp_c9)._m0[133].w;
    float _2228 = _2226 + (*spvDescriptorSet0.vp_c9)._m0[134].w;
    int _2230 = _2136 * int(_2174);
    int _2232 = _2230 + _2042;
    uint _2234 = uint(int(uint(_2212) >> uint(2)));
    uint _2236 = uint(int(uint(int(_2234)) >> uint(2)));
    int _2238 = int(_2234) & 3;
    float _2240 = (*spvDescriptorSet0.vp_c9)._m0[int(_2236)][_2238];
    int _2242 = int(_2234) + 1;
    uint _2244 = uint(int(uint(_2242) >> uint(2)));
    int _2246 = _2242 & 3;
    float _2248 = (*spvDescriptorSet0.vp_c9)._m0[int(_2244)][_2246];
    float _2250 = -_2224;
    float _2252 = _2250 + 1.0;
    float _2254 = 1.0 / _2228;
    float _2256 = float(uint(_2232));
    float _2258 = _2224 * _2208;
    bool _2260 = _492 >= (*spvDescriptorSet0.vp_c9)._m0[132].w;
    bool _2262 = isnan(_492);
    bool _2264 = _2260 || _2262;
    bool _2266 = isnan((*spvDescriptorSet0.vp_c9)._m0[132].w);
    bool _2268 = _2264 || _2266;
    float _2270 = float(_2268);
    int _2272 = _2152 & 3;
    bool _2274 = _2272 != 0;
    float _2276 = as_type<float>(_1875) * _2256;
    bool _2278 = _492 >= (*spvDescriptorSet0.vp_c9)._m0[131].w;
    bool _2280 = isnan(_492);
    bool _2282 = _2278 || _2280;
    bool _2284 = isnan((*spvDescriptorSet0.vp_c9)._m0[131].w);
    bool _2286 = _2282 || _2284;
    float _2288 = float(_2286);
    float _2290 = _2270 * _2252;
    float _2292 = -_2270;
    float _2294 = _2292 + 1.0;
    bool _2296 = uint(_2272) > 1u;
    int _2298 = _2212 + 8;
    uint _2300 = uint(int(uint(_2298) >> uint(2)));
    uint _2302 = uint(int(uint(int(_2300)) >> uint(2)));
    int _2304 = int(_2300) & 3;
    float _2306 = (*spvDescriptorSet0.vp_c9)._m0[int(_2302)][_2304];
    int _2308 = int(_2300) + 1;
    uint _2310 = uint(int(uint(_2308) >> uint(2)));
    int _2312 = _2308 & 3;
    float _2314 = (*spvDescriptorSet0.vp_c9)._m0[int(_2310)][_2312];
    float _2316 = trunc(_2276);
    float _2318 = precise::max(_2316, 0.0);
    uint _2320 = uint(_2318);
    float _2322 = _2288 * _2294;
    int _2324 = _2166 ? 0 : 1;
    float _2326 = -_2288;
    float _2328 = _2326 + 1.0;
    float _2330 = _1894 * _2254;
    float _2332 = _2148 * _2322;
    float _2334 = -(*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _2336 = _492 + _2334;
    float _2338 = -(*spvDescriptorSet0.vp_c9)._m0[133].w;
    float _2340 = _492 + _2338;
    int _2342 = ~_2324;
    int _2344 = _2342 + 1;
    int _2346 = _2344 + 1;
    float _2348 = fma(_2328, (*spvDescriptorSet0.vp_c9)._m0[131].x, _2332);
    bool _2350 = uint(_2272) >= 2u;
    float _2352 = fma(_2204, _2336, (*spvDescriptorSet0.vp_c9)._m0[132].x);
    int _2354 = _2346;
    if (!_2296)
    {
        int _2356 = ~_2324;
        int _2358 = _2356 + 1;
        _2354 = _2358;
    }
    int _2360 = _2354;
    float _2362 = fma(_2330, _2340, (*spvDescriptorSet0.vp_c9)._m0[133].x);
    bool _2364 = _2272 != 3;
    float _2366 = fma(_2352, _2290, _2348);
    int _2368 = ~_536;
    int _2370 = _2368 + 1;
    float _2372 = -_1812;
    float _2374 = _2372 + 1.0;
    int _2376 = int(_2174) + int(_2320);
    bool _2378 = !_2274;
    int _2380 = _2378 ? 0 : 1;
    int _2382 = abs(_2360);
    int _2384 = _2350 ? 0 : 1;
    int _2386 = abs(_2380);
    int _2388 = ~_2382;
    int _2390 = _2388 + 1;
    int _2392 = _2390 + 1;
    int _2394 = _2370 * _2376;
    int _2396 = _2394 + _2042;
    int _2398 = ~_2384;
    int _2400 = _2398 + 1;
    int _2402 = _2400 + 1;
    float _2404 = fma(_2362, _2258, _2366);
    int _2406 = _2402;
    if (_2364)
    {
        int _2408 = ~_2384;
        int _2410 = _2408 + 1;
        _2406 = _2410;
    }
    int _2412 = _2406;
    int _2414 = _2392 * as_type<int>(_2248);
    int _2416 = ~_2386;
    int _2418 = _2416 + 1;
    int _2420 = _2418 + 1;
    float _2422 = _978 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    int _2424 = abs(_2412);
    bool _2426 = _2272 != 3;
    int _2428 = _2420 * as_type<int>(_2240);
    int _2430 = _2428 + _2414;
    bool _2432 = uint(_2396) >= uint(_536);
    float _2434 = trunc((*spvDescriptorSet0.vp_c9)._m0[80].z);
    int _2436 = int(_2434);
    float _2438 = as_type<float>(_2396);
    if (_2030)
    {
        float _2440 = in.m_55.x;
        _2438 = _2440;
    }
    float _2442 = _2438;
    bool _2444 = !_2426;
    int _2446 = _2444 ? 0 : (-1);
    bool _2448 = !_2432;
    int _2450 = _2448 ? 0 : (-1);
    int _2452 = ~_2424;
    int _2454 = _2452 + 1;
    int _2456 = _2454 + 1;
    int _2458 = abs(_2446);
    bool _2460 = !_2116;
    int _2462 = _2460 ? 0 : 1;
    int _2464 = ~_2376;
    int _2466 = _2464 + _2450;
    int _2468 = _2466 + 1;
    int _2470 = _2456 * as_type<int>(_2306);
    int _2472 = _2470 + _2430;
    int _2474 = abs(_2462);
    float _2476 = in.m_75.x;
    int _2478 = ~_2458;
    int _2480 = _2478 + 1;
    int _2482 = _2480 + 1;
    int _2484 = _536 * _2468;
    int _2486 = _2484 + _2042;
    bool _2488 = _922 != 0.0;
    bool _2490 = isnan(_922);
    bool _2492 = _2488 || _2490;
    bool _2494 = isnan(0.0);
    bool _2496 = _2492 || _2494;
    float _2498 = in.m_79.x;
    float _2500 = in.m_79.y;
    float _2502 = in.m_79.z;
    int _2504 = ~_2474;
    int _2506 = _2504 + 1;
    int _2508 = _2506 + 1;
    int _2510 = _2482 * as_type<int>(_2314);
    int _2512 = _2510 + _2472;
    float _2514 = float(uint(_2436));
    int _2516 = abs(_2436);
    int _2518 = _2512 * _2508;
    bool _2520 = _920 == 0.0;
    bool _2522 = !_2496;
    bool _2524 = _2520 && _2522;
    bool _2526 = !_1855;
    int _2528 = _2526 ? _2486 : (-1);
    float _2530 = 1.0 / _2514;
    float _2532 = fma(_2200, (*spvDescriptorSet0.vp_c9)._m0[134].x, _2404);
    bool _2534 = _924 == 0.0;
    bool _2536 = _2534 && _2524;
    int _2538 = _2528 * _2474;
    int _2540 = _2538 + _2518;
    float _2542 = float(uint(_2516));
    float _2544 = _2532 * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    bool _2546 = _2442 > 0.5;
    bool _2548 = _2546 && _2030;
    float _2550 = _2442;
    if (_2030)
    {
        _2550 = _2476;
    }
    float _2552 = _2550;
    float _2554 = 1.0 / _2542;
    int _2556 = abs(_2540);
    float _2558 = _2498;
    float _2560 = _2502;
    float _2562 = _2552;
    float _2564 = _2500;
    if (!_2536)
    {
        float _2566 = fma(_920, (*spvDescriptorSet0.vp_c9)._m0[17].y, _2498);
        _2558 = _2566;
    }
    float _2568 = _2558;
    if (!_2030)
    {
        _1096 = _2476;
    }
    float _2570 = _1096;
    float _2572 = _2570;
    if (!_2536)
    {
        float _2574 = fma(_924, (*spvDescriptorSet0.vp_c9)._m0[17].y, _2502);
        _2560 = _2574;
    }
    float _2576 = _2560;
    int _2578 = as_type<int>(_2530) + (-2);
    if (_2548)
    {
        float _2580 = -_2552;
        float _2582 = _2580 + 1.0;
        _2562 = _2582;
    }
    float _2584 = _2562;
    float _2586 = float(uint(_2540));
    float _2588 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    if (!_2536)
    {
        float _2590 = fma(_922, (*spvDescriptorSet0.vp_c9)._m0[17].y, _2500);
        _2564 = _2590;
    }
    float _2592 = _2564;
    float _2594 = as_type<float>(_2578) * _2586;
    float _2596 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    int _2598 = as_type<int>(_2554) + (-2);
    float _2600 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _2602 = float(uint(_2556));
    float _2604 = trunc(_2594);
    float _2606 = precise::max(_2604, 0.0);
    uint _2608 = uint(_2606);
    float _2610 = _2588 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2612 = _2596 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2614 = _2600 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2616 = as_type<float>(_2598) * _2602;
    if (_2030)
    {
        _2572 = _2584;
    }
    float _2618 = _2572;
    float _2620 = _978 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    int _2622 = ~_2436;
    int _2624 = _2622 + 1;
    out.m_81.x = _2610;
    out.m_81.y = _2612;
    out.m_81.z = _2614;
    out.m_81.w = _2544;
    int _2626 = ~_2516;
    int _2628 = _2626 + 1;
    float _2630 = trunc(_2616);
    float _2632 = precise::max(_2630, 0.0);
    uint _2634 = uint(_2632);
    float _2636 = _978 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _2638 = -_966;
    float _2640 = fma(_2638, (*spvDescriptorSet0.vp_c8)._m0[24].x, _2620);
    float _2642 = fma(_974, (*spvDescriptorSet0.vp_c8)._m0[24].z, _2640);
    float _2644 = abs(_1398);
    float _2646 = log2(_2644);
    int _2648 = _2624 * int(_2608);
    int _2650 = _2648 + _2540;
    float _2652 = -_966;
    float _2654 = fma(_2652, (*spvDescriptorSet0.vp_c8)._m0[25].x, _2422);
    float _2656 = -_966;
    float _2658 = fma(_2656, (*spvDescriptorSet0.vp_c8)._m0[26].x, _2636);
    float _2660 = float(uint(_2650));
    float _2662 = fma(_974, (*spvDescriptorSet0.vp_c8)._m0[25].z, _2654);
    int _2664 = _2628 * int(_2634);
    int _2666 = _2664 + _2556;
    float _2668 = _986 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _2670 = _986 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _2672 = as_type<float>(_2578) * _2660;
    float _2674 = _986 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _2676 = float(uint(_2666));
    float _2678 = fma(_976, (*spvDescriptorSet0.vp_c8)._m0[24].x, _2668);
    float _2680 = fma(_976, (*spvDescriptorSet0.vp_c8)._m0[25].x, _2670);
    float _2682 = fma(_976, (*spvDescriptorSet0.vp_c8)._m0[26].x, _2674);
    float _2684 = trunc(_2672);
    float _2686 = precise::max(_2684, 0.0);
    uint _2688 = uint(_2686);
    float _2690 = as_type<float>(_2598) * _2676;
    float _2692 = _992 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _2694 = _992 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _2696 = _992 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _2698 = fma(_974, (*spvDescriptorSet0.vp_c8)._m0[26].z, _2658);
    float _2700 = fma(_980, (*spvDescriptorSet0.vp_c8)._m0[24].x, _2692);
    float _2702 = fma(_980, (*spvDescriptorSet0.vp_c8)._m0[25].x, _2694);
    float _2704 = trunc(_2690);
    float _2706 = precise::max(_2704, 0.0);
    uint _2708 = uint(_2706);
    float _2710 = fma(_980, (*spvDescriptorSet0.vp_c8)._m0[26].x, _2696);
    int _2712 = ~_2436;
    int _2714 = _2712 + 1;
    float _2716 = _2698 * _2592;
    float _2718 = _2646 * (*spvDescriptorSet0.vp_c15)._m0[654].z;
    int _2720 = ~_2516;
    int _2722 = _2720 + 1;
    float _2724 = _2642 * _2592;
    float _2726 = fma(_1000, (*spvDescriptorSet0.vp_c8)._m0[24].z, _2678);
    int _2728 = int(_2608) + int(_2688);
    float _2730 = _2662 * _2592;
    float _2732 = exp2(_2718);
    float _2734 = fma(_1008, (*spvDescriptorSet0.vp_c8)._m0[24].z, _2700);
    float _2736 = fma(_1008, (*spvDescriptorSet0.vp_c8)._m0[25].z, _2702);
    int _2738 = _2714 * _2728;
    int _2740 = _2738 + _2540;
    int _2742 = int(_2634) + int(_2708);
    float _2744 = fma(_1000, (*spvDescriptorSet0.vp_c8)._m0[25].z, _2680);
    float _2746 = fma(_1000, (*spvDescriptorSet0.vp_c8)._m0[26].z, _2682);
    bool _2748 = uint(_2740) >= uint(_2436);
    int _2750 = _2722 * _2742;
    int _2752 = _2750 + _2556;
    float _2754 = fma(_2726, _2568, _2724);
    float _2756 = fma(_2746, _2568, _2716);
    bool _2758 = !_2748;
    int _2760 = _2758 ? 0 : (-1);
    float _2762 = fma(_2744, _2568, _2730);
    bool _2764 = uint(_2752) >= uint(_2516);
    float _2766 = fma(_2732, (*spvDescriptorSet0.vp_c15)._m0[654].x, (*spvDescriptorSet0.vp_c15)._m0[654].y);
    float _2768 = precise::clamp(_2766, 0.0, 1.0);
    int _2770 = ~_2728;
    int _2772 = _2770 + _2760;
    int _2774 = _2772 + 1;
    float _2776 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    bool _2778 = !_2764;
    int _2780 = _2778 ? 0 : (-1);
    float _2782 = fma(_2734, _2576, _2754);
    bool _2784 = _2436 == 0;
    float _2786 = fma(_2736, _2576, _2762);
    int _2788 = _2540 ^ _2436;
    float _2790 = fma(_1008, (*spvDescriptorSet0.vp_c8)._m0[26].z, _2710);
    bool _2792 = _2436 == 0;
    int _2794 = _2436 * _2774;
    int _2796 = _2794 + _2540;
    float _2798 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    uint _2800 = uint(int(uint(_2788) >> uint(31)));
    float _2802 = fma(_2790, _2576, _2756);
    int _2804 = ~_2780;
    int _2806 = _2742 + _2804;
    int _2808 = _2806 + 1;
    float _2810 = fma(_2768, -2.0, 3.0);
    float _2812 = _2768 * _2768;
    int _2814 = ~int(_2800);
    int _2816 = _2814 + 1;
    float _2818 = _1706 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _2820 = _2776 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _2822 = _2812 * _2810;
    bool _2824 = !_2784;
    int _2826 = _2824 ? _2796 : (-1);
    float _2828 = fma(_1724, (*spvDescriptorSet0.vp_c8)._m0[6].x, _2818);
    int _2830 = _2808 ^ _2816;
    float _2832 = -_2822;
    float _2834 = _2832 + 1.0;
    float _2836 = float(_2826);
    float _2838 = fma(_2820, _2618, -0.5);
    float _2840 = _2798 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    int _2842 = ~_2816;
    int _2844 = _2842 + _2830;
    int _2846 = _2844 + 1;
    float _2848 = in.m_83.x;
    bool _2850 = _1398 <= 8000.0;
    bool _2852 = isnan(_1398);
    bool _2854 = _2850 || _2852;
    bool _2856 = isnan(8000.0);
    bool _2858 = _2854 || _2856;
    float _2860 = float(_2858);
    float _2862 = fma(_2834, (*spvDescriptorSet0.vp_c15)._m0[654].w, _2822);
    bool _2864 = !_2792;
    int _2866 = _2864 ? _2846 : (-1);
    float _2868 = fma(_2820, _2836, _674);
    float _2870 = fma(_2840, _2186, -0.5);
    float _2872 = _2860 * _2862;
    float _2874 = float(_2866);
    float _2876 = _1898 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _2878 = _2872 * (*spvDescriptorSet0.vp_c15)._m0[653].x;
    float _2880 = _1742 * 0.5;
    float _2882 = -_606;
    float _2884 = fma(_2840, _2874, _2882);
    float _2886 = fma(_676, _2838, _2868);
    float _2888 = _2374 * _2878;
    float _2890 = precise::clamp(_2888, 0.0, 1.0);
    float _2892 = _2876 * _1826;
    float _2894 = fma(_684, _2870, _2884);
    float _2896 = fma(_1796, -0.5, _2880);
    float _2898 = -_2890;
    float _2900 = fma(_2898, (*spvDescriptorSet0.vp_c15)._m0[653].y, 1.0);
    float _2902 = _2886 + 0.5;
    float _2904 = _2894 + 0.5;
    float _2906 = -_2876;
    float _2908 = _2906 + 1.0;
    float _2910 = _1837 * _2892;
    float _2912 = _1847 * _2892;
    float _2914 = _2900 * _2848;
    out.m_85.x = _2902;
    out.m_85.y = _2904;
    float _2916 = _1837 * _2908;
    float _2918 = fma(_1837, _2912, _1835);
    float _2920 = _2914 * (*spvDescriptorSet0.vp_c13)._m0[1].w;
    out.m_87.x = _2782;
    out.m_87.y = _2786;
    out.m_87.z = _2802;
    float _2922 = fma(_1538, (*spvDescriptorSet0.vp_c8)._m0[6].z, _2828);
    bool _2924 = _1544 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _2926 = isnan(_1544);
    bool _2928 = _2924 || _2926;
    bool _2930 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _2932 = _2928 || _2930;
    float _2934 = _1784 + _1742;
    out.m_89.x = _2920;
    float _2936 = fma(_1542, (*spvDescriptorSet0.vp_c8)._m0[6].w, _2922);
    float _2938 = fma(_1843, _2910, _1831);
    float _2940 = fma(_1845, _2910, _1833);
    float _2942 = _2936 + _1742;
    float _2944 = _2934 * 0.5;
    float _2946 = _1452 * _1506;
    out.m_91.x = _2938;
    out.m_91.y = _2940;
    out.m_91.z = _2918;
    out.m_91.w = _2916;
    float _2948 = _2942 * 0.5;
    out.gl_Position.x = _1784;
    out.gl_Position.y = _1796;
    out.gl_Position.z = _2936;
    out.gl_Position.w = _1742;
    out.m_93.x = _2944;
    out.m_93.y = _2896;
    out.m_93.z = _2948;
    out.m_93.w = _1742;
    float _2950 = _2936;
    float _2952 = _2944;
    float _2954 = _2946;
    if (!_2932)
    {
        _2178 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _2956 = _2178;
    float _2958 = _2956;
    float _2960 = _2956;
    if (!_2932)
    {
        _2950 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _2962 = _2950;
    float _2964 = _2946 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _2966 = _2962;
    float _2968 = _2962;
    if (!_2932)
    {
        _2952 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _2970 = _2952;
    float _2972 = _2970;
    float _2974 = _2970;
    if (!_2932)
    {
        _2180 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _2976 = _2180;
    float _2978 = _2976;
    float _2980 = _2976;
    if (!_2932)
    {
        _2182 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _2982 = _2182;
    float _2984 = _2982;
    float _2986 = _2982;
    if (!_2932)
    {
        _2954 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _2988 = _2954;
    bool _2990 = !_2932;
    float _2992 = _2988;
    float _2994 = _2988;
    if (!_2990)
    {
        bool _2996 = _1544 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _2998 = isnan(_1544);
        bool _3000 = _2996 || _2998;
        bool _3002 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _3004 = _3000 || _3002;
        if (!_3004)
        {
            float _3006 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _3008 = _1544 + _3006;
            float _3010 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _3012 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _3010;
            float _3014 = 1.0 / _3012;
            float _3016 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _3018 = _3016 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _3020 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _3022 = _3020 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _3024 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _3026 = _3024 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _3028 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _3030 = _3028 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _3032 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _3034 = _3032 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _3036 = _3008 * _3014;
            float _3038 = precise::clamp(_3036, 0.0, 1.0);
            float _3040 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _3042 = _3040 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _3044 = fma(_3038, _3018, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _3046 = fma(_3038, _3042, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _3048 = fma(_3038, _3022, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _3050 = fma(_3038, _3026, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _3052 = fma(_3038, _3030, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _3054 = fma(_3038, _3034, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            _2960 = _3046;
            _2986 = _3052;
            _2974 = _3044;
            _2980 = _3050;
            _2968 = _3048;
            _2994 = _3054;
            _3056 = true;
        }
        else
        {
            bool _3058 = _1544 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _3060 = isnan(_1544);
            bool _3062 = _3058 || _3060;
            bool _3064 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _3066 = _3062 || _3064;
            if (!_3066)
            {
                _2972 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _3068 = _2972;
            _2974 = _3068;
            if (!_3066)
            {
                _2958 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _3070 = _2958;
            _2960 = _3070;
            if (!_3066)
            {
                _2966 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _3072 = _2966;
            _2968 = _3072;
            if (!_3066)
            {
                _2978 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _3074 = _2978;
            _2980 = _3074;
            if (!_3066)
            {
                _2984 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _3076 = _2984;
            _2986 = _3076;
            if (!_3066)
            {
                _2992 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _3078 = _2992;
            bool _3080 = !_3066;
            _2994 = _3078;
            if (!_3080)
            {
                bool _3082 = _1544 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _3084 = isnan(_1544);
                bool _3086 = _3082 || _3084;
                bool _3088 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _3090 = _3086 || _3088;
                if (!_3090)
                {
                    float _3092 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _3094 = _1544 + _3092;
                    float _3096 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _3098 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _3096;
                    float _3100 = 1.0 / _3098;
                    float _3102 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _3104 = _3102 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _3106 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _3108 = _3106 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _3110 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _3112 = _3110 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _3114 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _3116 = _3114 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _3118 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _3120 = _3118 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _3122 = _3094 * _3100;
                    float _3124 = precise::clamp(_3122, 0.0, 1.0);
                    float _3126 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _3128 = _3126 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _3130 = fma(_3124, _3104, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _3132 = fma(_3124, _3128, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _3134 = fma(_3124, _3108, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _3136 = fma(_3124, _3112, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _3138 = fma(_3124, _3116, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _3140 = fma(_3124, _3120, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    _2960 = _3132;
                    _2986 = _3138;
                    _2974 = _3130;
                    _2980 = _3136;
                    _2968 = _3134;
                    _2994 = _3140;
                    _3056 = true;
                }
                else
                {
                    _2960 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _2986 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _2974 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _2980 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _2968 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _2994 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _3056 = false;
    float _3142 = _2960;
    float _3144 = _2986;
    float _3146 = _2974;
    float _3148 = _2980;
    float _3150 = _2968;
    float _3152 = _2994;
    float _3154 = _2964 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _3156 = fma(_2786, -0.5, 0.5);
    float _3158 = precise::clamp(_3156, 0.0, 1.0);
    float _3160 = -_3142;
    float _3162 = _3160 + _3144;
    float _3164 = -_3146;
    float _3166 = _3164 + _3148;
    out.m_49.x = _3154;
    float _3168 = fma(_3158, _3162, _3142);
    float _3170 = -_3150;
    float _3172 = _3170 + _3152;
    float _3174 = fma(_3158, _3166, _3146);
    float _3176 = _3168 * 0.586610972881317138671875;
    bool _3178 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _3180 = fma(_3158, _3172, _3150);
    out.m_95.x = 0.0;
    float _3182 = fma(_3174, 0.298911988735198974609375, _3176);
    bool _3184 = _1452 > 0.0;
    bool _3186 = isnan(_1452);
    bool _3188 = _3184 || _3186;
    bool _3190 = isnan(0.0);
    bool _3192 = _3188 || _3190;
    float _3194 = fma(_3180, 0.114477999508380889892578125, _3182);
    bool _3196 = _1506 <= 0.0;
    bool _3198 = !_3192;
    bool _3200 = _3196 || _3198;
    float _3202 = -_3194;
    float _3204 = _3174 + _3202;
    float _3206 = -_3194;
    float _3208 = _3168 + _3206;
    float _3210 = -_3194;
    float _3212 = _3180 + _3210;
    float _3214 = fma(_3204, (*spvDescriptorSet0.vp_c13)._m0[1].z, _3194);
    float _3216 = fma(_3208, (*spvDescriptorSet0.vp_c13)._m0[1].z, _3194);
    float _3218 = fma(_3212, (*spvDescriptorSet0.vp_c13)._m0[1].z, _3194);
    bool _3220 = !_3178;
    if (!_3220)
    {
        float _3222 = -_1388;
        float _3224 = _3222 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
        float _3226 = -_1390;
        float _3228 = _3226 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
        float _3230 = -_1392;
        float _3232 = _3230 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
        float _3234 = _3224 * _3224;
        float _3236 = fma(_3228, _3228, _3234);
        float _3238 = fma(_3232, _3232, _3236);
        float _3240 = sqrt(_3238);
        float _3242 = rsqrt(_3238);
        float _3244 = -_3240;
        float _3246 = _3244 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
        float _3248 = _3246 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
        float _3250 = precise::clamp(_3248, 0.0, 1.0);
        float _3252 = _3228 * _3242;
        float _3254 = _3224 * _3242;
        float _3256 = abs(_3250);
        float _3258 = log2(_3256);
        float _3260 = _3232 * _3242;
        float _3262 = _3252 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
        float _3264 = _2786 * _3254;
        float _3266 = -_3254;
        float _3268 = -_3262;
        float _3270 = fma(_3266, (*spvDescriptorSet0.vp_c15)._m0[656].y, _3268);
        float _3272 = fma(_2782, _3252, _3264);
        float _3274 = -_3260;
        float _3276 = fma(_3274, (*spvDescriptorSet0.vp_c15)._m0[656].z, _3270);
        float _3278 = fma(_2802, _3260, _3272);
        float _3280 = precise::clamp(_3278, 0.0, 1.0);
        float _3282 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
        float _3284 = _3276 + _3282;
        float _3286 = _3258 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
        float _3288 = _3284 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
        float _3290 = precise::clamp(_3288, 0.0, 1.0);
        float _3292 = exp2(_3286);
        float _3294 = _3292 * _3290;
        float _3296 = _3280 * _3294;
        float _3298 = _3296 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
        float _3300 = _3296 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
        float _3302 = _3296 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
        out.m_95.x = _3298;
        out.m_95.y = _3300;
        out.m_95.z = _3302;
    }
    out.m_67.x = _3214;
    out.m_67.y = _3216;
    out.m_67.z = _3218;
    if (!_3200)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    out.m_49.x = 0.0;
    float _3304 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _3304;
    out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
}


vertex main0_out main0_z(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]])
{
    main0_out out = {};
    out.m_59 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_81 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_91 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_65 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_67 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_87 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_77 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_71 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_85 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_95 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_89 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_93 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_49 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_69 = float4(0.0, 0.0, 0.0, 1.0);
    bool _3056 = false;
    bool _484 = false;
    bool _342 = false;
    bool _216 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _109 = in.m_46.w;
    float _111 = trunc(_109);
    int _114 = int(_111);
    bool _118 = _114 >= 1;
    float _120 = 0.0;
    if (!_118)
    {
        _120 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _122 = _120;
    float _124 = _122;
    if (!_118)
    {
        out.m_49.x = 0.0;
    }
    int _126 = 0;
    if (!_118)
    {
        float _128 = _122 * 5.0;
        _126 = as_type<int>(_128);
    }
    int _130 = _126;
    int _132 = _130;
    if (!_118)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _3361 = as_type<float>(_130);
        out.gl_Position.z = _3361;
    }
    if (!_118)
    {
        return out;
    }
    float _134 = in.m_51.w;
    bool _136 = _134 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _138 = isnan(_134);
    bool _140 = _136 || _138;
    bool _142 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _144 = _140 || _142;
    float _146 = -_134;
    float _148 = _146 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    float _150 = 0.0;
    float _152 = _148;
    if (_144)
    {
        float _154 = float(_114);
        _150 = _154;
    }
    float _156 = _150;
    bool _158 = _148 >= _156;
    bool _160 = !_144;
    bool _162 = _158 || _160;
    if (_162)
    {
        _124 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _164 = _124;
    if (_162)
    {
        out.m_49.x = 0.0;
    }
    if (_162)
    {
        float _166 = _164 * 5.0;
        _132 = as_type<int>(_166);
    }
    int _168 = _132;
    if (_162)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _3430 = as_type<float>(_168);
        out.gl_Position.z = _3430;
    }
    if (_162)
    {
        return out;
    }
    float _170 = in.m_53.x;
    float _172 = in.m_53.y;
    float _174 = in.m_53.z;
    bool _176 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _178 = _172 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _180 = _172 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _182 = _172 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _184 = fma(_170, (*spvDescriptorSet0.vp_c10)._m0[4].x, _178);
    float _186 = fma(_170, (*spvDescriptorSet0.vp_c10)._m0[5].x, _180);
    float _188 = fma(_170, (*spvDescriptorSet0.vp_c10)._m0[6].x, _182);
    float _190 = fma(_174, (*spvDescriptorSet0.vp_c10)._m0[4].z, _184);
    float _192 = fma(_174, (*spvDescriptorSet0.vp_c10)._m0[5].z, _186);
    float _194 = fma(_174, (*spvDescriptorSet0.vp_c10)._m0[6].z, _188);
    bool _196 = !_176;
    float _214;
    if (!_196)
    {
        float _198 = in.m_55.x;
        float _200 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _202 = _198 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _204 = fma(_202, (*spvDescriptorSet0.vp_c9)._m0[12].x, _148);
        float _206 = _204 * _200;
        float _208 = floor(_206);
        float _210 = -_208;
        float _212 = _206 + _210;
        _214 = _212;
        _216 = true;
    }
    else
    {
        float _218 = float(_114);
        float _220 = 1.0 / _218;
        float _222 = _148 * _220;
        _214 = _222;
    }
    _216 = false;
    float _224 = _214;
    float _226 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _228 = _224 + _226;
    bool _230 = _224 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _232 = isnan(_224);
    bool _234 = _230 || _232;
    bool _236 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _238 = _234 || _236;
    float _240 = float(_238);
    float _242 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _244 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _242;
    float _246 = 1.0 / _244;
    bool _248 = _224 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _250 = isnan(_224);
    bool _252 = _248 || _250;
    bool _254 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _256 = _252 || _254;
    float _258 = float(_256);
    float _260 = -_240;
    float _262 = _260 + 1.0;
    float _264 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _266 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _264;
    float _268 = -(*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _270 = (*spvDescriptorSet0.vp_c9)._m0[144].z + _268;
    bool _272 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _274 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _276 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _274;
    float _278 = _258 * _262;
    float _280 = -_258;
    float _282 = _280 + 1.0;
    float _284 = _228 * _246;
    float _286 = in.m_57.x;
    float _288 = in.m_57.y;
    float _290 = in.m_57.z;
    float _292 = fma(_266, _284, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _294 = fma(_276, _284, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _296 = fma(_270, _284, (*spvDescriptorSet0.vp_c9)._m0[143].z);
    float _298 = _292 * _278;
    float _300 = _294 * _278;
    float _302 = _296 * _278;
    float _304 = fma(_282, (*spvDescriptorSet0.vp_c9)._m0[143].x, _298);
    float _306 = fma(_282, (*spvDescriptorSet0.vp_c9)._m0[143].y, _300);
    float _308 = fma(_282, (*spvDescriptorSet0.vp_c9)._m0[143].z, _302);
    float _310 = fma(_240, (*spvDescriptorSet0.vp_c9)._m0[144].x, _304);
    float _312 = fma(_240, (*spvDescriptorSet0.vp_c9)._m0[144].y, _306);
    float _314 = fma(_240, (*spvDescriptorSet0.vp_c9)._m0[144].z, _308);
    float _316 = _312 * _288;
    float _318 = _310 * _286;
    float _320 = _314 * _290;
    bool _322 = !_272;
    float _340;
    if (!_322)
    {
        float _324 = in.m_55.x;
        float _326 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _328 = _324 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _330 = fma(_328, (*spvDescriptorSet0.vp_c9)._m0[11].y, _148);
        float _332 = _330 * _326;
        float _334 = floor(_332);
        float _336 = -_334;
        float _338 = _332 + _336;
        _340 = _338;
        _342 = true;
    }
    else
    {
        float _344 = float(_114);
        float _346 = 1.0 / _344;
        float _348 = _148 * _346;
        _340 = _348;
    }
    _342 = false;
    float _350 = _340;
    float _352 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _354 = _350 + _352;
    float _356 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _358 = _356 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _360 = _350 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _362 = isnan(_350);
    bool _364 = _360 || _362;
    bool _366 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _368 = _364 || _366;
    float _370 = float(_368);
    float _372 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _374 = _372 + (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _376 = _350 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _378 = isnan(_350);
    bool _380 = _376 || _378;
    bool _382 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _384 = _380 || _382;
    float _386 = float(_384);
    float _388 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _390 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _388;
    bool _392 = _350 >= (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _394 = isnan(_350);
    bool _396 = _392 || _394;
    bool _398 = isnan((*spvDescriptorSet0.vp_c9)._m0[117].w);
    bool _400 = _396 || _398;
    float _402 = float(_400);
    float _404 = 1.0 / _358;
    float _406 = -_370;
    float _408 = _406 + 1.0;
    bool _410 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].w;
    float _412 = 1.0 / _374;
    float _414 = _390 * _404;
    float _416 = -(*spvDescriptorSet0.vp_c9)._m0[116].x;
    float _418 = _416 + (*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _420 = -_402;
    float _422 = _420 + 1.0;
    float _424 = fma(_414, _354, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _426 = _386 * _408;
    float _428 = -_386;
    float _430 = _428 + 1.0;
    float _432 = _370 * _422;
    float _434 = _418 * _412;
    float _436 = _424 * _426;
    float _438 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _440 = _350 + _438;
    float _442 = fma(_430, (*spvDescriptorSet0.vp_c9)._m0[115].x, _436);
    float _444 = fma(_434, _440, (*spvDescriptorSet0.vp_c9)._m0[116].x);
    float _446 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _448 = fma(_444, _432, _442);
    float _450 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _452 = _446 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _454 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _456 = fma(_402, (*spvDescriptorSet0.vp_c9)._m0[117].x, _448);
    float _458 = _450 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _460 = _454 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _462 = _456 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    out.m_59.x = _452;
    out.m_59.y = _458;
    out.m_59.z = _460;
    out.m_59.w = _462;
    bool _464 = !_410;
    float _482;
    if (!_464)
    {
        float _466 = in.m_55.x;
        float _468 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].w;
        float _470 = _466 * (*spvDescriptorSet0.vp_c9)._m0[13].x;
        float _472 = fma(_470, (*spvDescriptorSet0.vp_c9)._m0[11].w, _148);
        float _474 = _472 * _468;
        float _476 = floor(_474);
        float _478 = -_476;
        float _480 = _474 + _478;
        _482 = _480;
        _484 = true;
    }
    else
    {
        float _486 = float(_114);
        float _488 = 1.0 / _486;
        float _490 = _148 * _488;
        _482 = _490;
    }
    _484 = false;
    float _492 = _482;
    float _494 = in.m_55.x;
    float _496 = in.m_55.y;
    float _498 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _500 = log2(_498);
    float _502 = _316 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _504 = in.m_46.x;
    float _506 = in.m_46.y;
    float _508 = in.m_46.z;
    float _510 = _320 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _512 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    float _514 = in.m_55.z;
    float _516 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].y);
    int _518 = int(_516);
    float _520 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    bool _522 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _524 = isnan(0.0);
    bool _526 = _522 || _524;
    bool _528 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _530 = _526 || _528;
    float _532 = _500 * _148;
    float _534 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].x);
    int _536 = int(_534);
    float _538 = _494 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    float _540 = _496 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    float _542 = _494 * 2.0;
    float _544 = exp2(_532);
    float _546 = -_512;
    float _548 = fma(_538, 2.0, _546);
    float _550 = fma(_540, -2.0, _520);
    float _552 = _496 + _494;
    float _554 = _506 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _556 = _506 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _558 = _506 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _560 = _552 + (-1.0);
    float _562 = floor(_542);
    float _564 = _496 * 2.0;
    float _566 = fma(_504, (*spvDescriptorSet0.vp_c10)._m0[6].x, _558);
    float _568 = _514 * 2.0;
    float _570 = fma(_504, (*spvDescriptorSet0.vp_c10)._m0[4].x, _554);
    float _572 = fma(_504, (*spvDescriptorSet0.vp_c10)._m0[5].x, _556);
    float _574 = fma(_560, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    float _576 = _496 + _514;
    float _578 = floor(_564);
    float _580 = float(_518);
    float _582 = _576 + (-1.0);
    bool _584 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _586 = isnan(1.0);
    bool _588 = _584 || _586;
    bool _590 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _592 = _588 || _590;
    float _594 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _596 = 1.0 + _594;
    float _598 = -_544;
    float _600 = _598 + 1.0;
    bool _602 = _562 > 0.0;
    float _604 = floor(_568);
    float _606 = fma(_148, (*spvDescriptorSet0.vp_c9)._m0[76].y, _550);
    bool _608 = _562 >= 0.0;
    bool _610 = isnan(_562);
    bool _612 = _608 || _610;
    bool _614 = isnan(0.0);
    bool _616 = _612 || _614;
    float _618 = fma(_508, (*spvDescriptorSet0.vp_c10)._m0[5].z, _572);
    float _620 = _530 ? _600 : 0.0;
    float _622 = fma(_582, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    float _624 = 1.0 / _580;
    bool _626 = _578 > 0.0;
    float _628 = _618 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    bool _630 = _578 >= 0.0;
    bool _632 = isnan(_578);
    bool _634 = _630 || _632;
    bool _636 = isnan(0.0);
    bool _638 = _634 || _636;
    float _640 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    float _642 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    float _644 = float(_536);
    float _646 = 1.0 / _596;
    bool _648 = _604 > 0.0;
    float _650 = fma(_494, (*spvDescriptorSet0.vp_c9)._m0[78].z, _640);
    bool _652 = _604 >= 0.0;
    bool _654 = isnan(_604);
    bool _656 = _652 || _654;
    bool _658 = isnan(0.0);
    bool _660 = _656 || _658;
    float _662 = fma(_496, (*spvDescriptorSet0.vp_c9)._m0[78].w, _642);
    int _664 = _616 ? 0 : 1;
    float _666 = _644 * _148;
    int _668 = _660 ? 0 : 1;
    float _670 = _624 * _148;
    float _672 = -_148;
    float _674 = fma(_672, (*spvDescriptorSet0.vp_c9)._m0[76].x, _548);
    float _676 = fma(_148, (*spvDescriptorSet0.vp_c9)._m0[77].z, _650);
    int _678 = ~_664;
    int _680 = _678 + 1;
    int _682 = _680 + 1;
    float _684 = fma(_148, (*spvDescriptorSet0.vp_c9)._m0[77].w, _662);
    int _686 = _682;
    if (!_602)
    {
        int _688 = ~_664;
        int _690 = _688 + 1;
        _686 = _690;
    }
    int _692 = _686;
    float _694 = fma(_508, (*spvDescriptorSet0.vp_c10)._m0[6].z, _566);
    int _696 = _638 ? 0 : 1;
    if (_592)
    {
        float _698 = _620 * _646;
        _152 = _698;
    }
    float _700 = _152;
    int _702 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 16;
    bool _704 = _702 != 0;
    int _706 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 32;
    bool _708 = _706 != 0;
    int _710 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 64;
    bool _712 = _710 != 0;
    float _714 = fma(_508, (*spvDescriptorSet0.vp_c10)._m0[4].z, _570);
    int _716 = ~_696;
    int _718 = _716 + 1;
    int _720 = _718 + 1;
    float _722 = _694 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    int _724 = _720;
    if (!_626)
    {
        int _726 = ~_696;
        int _728 = _726 + 1;
        _724 = _728;
    }
    int _730 = _724;
    float _732 = _714 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    bool _734 = !_708;
    int _736 = _734 ? 0 : 1;
    float _738 = in.m_61.x;
    float _740 = in.m_61.y;
    float _742 = in.m_61.z;
    bool _744 = !_704;
    int _746 = _744 ? 0 : 1;
    float _748 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _750 = _732 + _748;
    bool _752 = !_712;
    int _754 = _752 ? 0 : 1;
    int _756 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _758 = _756 != 0;
    int _760 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _762 = _760 != 0;
    int _764 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _766 = _764 != 0;
    float _768 = float(_692);
    int _770 = ~_668;
    int _772 = _770 + 1;
    int _774 = _772 + 1;
    bool _776 = !_758;
    int _778 = _776 ? 0 : 1;
    bool _780 = !_762;
    int _782 = _780 ? 0 : 1;
    int _784 = abs(_778);
    float _786 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _788 = _628 + _786;
    int _790 = abs(_782);
    int _792 = _774;
    if (!_648)
    {
        int _794 = ~_668;
        int _796 = _794 + 1;
        _792 = _796;
    }
    int _798 = _792;
    float _800 = _788 * _788;
    float _802 = float(_790);
    float _804 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _806 = _722 + _804;
    float _808 = fma(_750, _750, _800);
    float _810 = _802 * _768;
    float _812 = float(_784);
    float _814 = fma(_806, _806, _808);
    float _816 = float(_798);
    float _818 = _810 * (-2.0);
    float _820 = _496 + (-0.5);
    float _822 = sqrt(_814);
    bool _824 = !_766;
    int _826 = _824 ? 0 : 1;
    float _828 = fma(_818, _740, _740);
    float _830 = fma(_622, _818, _622);
    float _832 = _812 * _816;
    int _834 = abs(_826);
    float _836 = fma(_820, (*spvDescriptorSet0.vp_c9)._m0[196].y, _828);
    float _838 = _318 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _840 = rsqrt(_814);
    float _842 = float(_730);
    float _844 = _514 + _494;
    float _846 = float(_834);
    float _848 = _838 * (*spvDescriptorSet0.vp_c13)._m0[2].y;
    float _850 = _832 * (-2.0);
    float _852 = _844 + (-1.0);
    float _854 = _514 + (-0.5);
    float _856 = _822 * (*spvDescriptorSet0.vp_c13)._m0[2].x;
    float _858 = _846 * _842;
    float _860 = fma(_852, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _862 = _494 + (-0.5);
    float _864 = fma(_850, _738, _738);
    float _866 = precise::min(_848, _856);
    float _868 = _858 * (-2.0);
    float _870 = fma(_574, _850, _574);
    float _872 = fma(_862, (*spvDescriptorSet0.vp_c9)._m0[196].x, _864);
    float _874 = fma(_830, _700, _836);
    float _876 = _840 * _866;
    float _878 = fma(_860, _868, _860);
    float _880 = fma(_868, _742, _742);
    float _882 = fma(_870, _700, _872);
    float _884 = _788 * _876;
    float _886 = _874 * 0.15915493667125701904296875;
    float _888 = fma(_854, (*spvDescriptorSet0.vp_c9)._m0[196].z, _880);
    float _890 = _750 * _876;
    float _892 = -_884;
    float _894 = _788 + _892;
    float _896 = _882 * 0.15915493667125701904296875;
    float _898 = _806 * _876;
    float _900 = -_890;
    float _902 = _750 + _900;
    float _904 = _894 * _894;
    float _906 = fma(_878, _700, _888);
    float _908 = -_898;
    float _910 = _806 + _908;
    float _912 = _886 * 6.283185482025146484375;
    float _914 = sin(_912);
    float _916 = fma(_902, _902, _904);
    float _918 = _906 * 0.15915493667125701904296875;
    float _920 = in.m_63.x;
    float _922 = in.m_63.y;
    float _924 = in.m_63.z;
    float _926 = fma(_910, _910, _916);
    float _928 = _886 * 6.283185482025146484375;
    float _930 = cos(_928);
    float _932 = sqrt(_926);
    float _934 = _896 * 6.283185482025146484375;
    float _936 = sin(_934);
    float _938 = _896 * 6.283185482025146484375;
    float _940 = cos(_938);
    float _942 = _840 * _932;
    float _944 = _502 * _942;
    float _946 = _838 * _942;
    float _948 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _922);
    float _950 = _918 * 6.283185482025146484375;
    float _952 = cos(_950);
    float _954 = _936 * _914;
    float _956 = _936 * _930;
    float _958 = _944 * _948;
    float _960 = _510 * _942;
    float _962 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _924);
    float _964 = _918 * 6.283185482025146484375;
    float _966 = sin(_964);
    float _968 = _940 * _930;
    float _970 = _940 * _914;
    float _972 = _960 * _962;
    float _974 = _936 * _952;
    float _976 = _930 * _952;
    float _978 = _940 * _952;
    float _980 = _914 * _952;
    float _982 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _920);
    float _984 = _978 * _958;
    float _986 = fma(_966, _968, _954);
    float _988 = _946 * _982;
    float _990 = -_956;
    float _992 = fma(_966, _970, _990);
    float _994 = -_958;
    float _996 = _966 * _994;
    float _998 = -_970;
    float _1000 = fma(_966, _956, _998);
    float _1002 = fma(_986, _988, _984);
    float _1004 = _974 * _958;
    float _1006 = fma(_976, _988, _996);
    float _1008 = fma(_966, _954, _968);
    float _1010 = fma(_992, _972, _1002);
    float _1012 = fma(_1000, _988, _1004);
    float _1014 = fma(_980, _972, _1006);
    float _1016 = _1010 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _1018 = fma(_1008, _972, _1012);
    float _1020 = _1010 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _1022 = _1010 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _1024 = fma(_1014, (*spvDescriptorSet0.vp_c8)._m0[26].x, _1016);
    float _1026 = fma(_1014, (*spvDescriptorSet0.vp_c8)._m0[24].x, _1020);
    float _1028 = fma(_1018, (*spvDescriptorSet0.vp_c8)._m0[26].z, _1024);
    float _1030 = fma(_1018, (*spvDescriptorSet0.vp_c8)._m0[24].z, _1026);
    float _1032 = _1028 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _1034 = _1030 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _1036 = _722 + _1032;
    float _1038 = _732 + _1034;
    float _1040 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1042 = _1036 + _1040;
    float _1044 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1046 = _1038 + _1044;
    float _1048 = _1042 * _1042;
    float _1050 = fma(_1046, _1046, _1048);
    float _1052 = fma(_1014, (*spvDescriptorSet0.vp_c8)._m0[25].x, _1022);
    float _1054 = -_884;
    float _1056 = _628 + _1054;
    float _1058 = -_890;
    float _1060 = _732 + _1058;
    float _1062 = sqrt(_1050);
    float _1064 = fma(_1018, (*spvDescriptorSet0.vp_c8)._m0[25].z, _1052);
    float _1066 = _1056 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _1068 = -_898;
    float _1070 = _722 + _1068;
    float _1072 = _1064 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _1074 = fma(_1060, (*spvDescriptorSet0.vp_c8)._m0[11].x, _1066);
    float _1076 = _628 + _1072;
    float _1078 = fma(_1070, (*spvDescriptorSet0.vp_c8)._m0[11].z, _1074);
    bool _1080 = _1062 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1082 = _1072;
    float _1084 = _1074;
    float _1086 = _1038;
    float _1088 = _898;
    float _1090 = _884;
    float _1092 = _890;
    float _1094 = _1050;
    float _1096 = _920;
    if (!_1080)
    {
        _1082 = _1036;
    }
    float _1098 = _1082;
    float _1100 = _1098;
    if (!_1080)
    {
        _1084 = _1076;
    }
    float _1102 = _1084;
    bool _1104 = !_1080;
    float _1106 = _1102;
    if (!_1104)
    {
        float _1108 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1110 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1112 = _1062 + _1110;
        float _1114 = _1076 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1116 = rsqrt(_1050);
        float _1118 = _1112 * _1108;
        float _1120 = _1118 * 0.15915493667125701904296875;
        float _1122 = _1120 * 6.283185482025146484375;
        float _1124 = sin(_1122);
        float _1126 = _1120 * 6.283185482025146484375;
        float _1128 = cos(_1126);
        float _1130 = fma(_1124, _1114, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1132 = _1116 * _1130;
        float _1134 = _1128 + (-1.0);
        float _1136 = fma(_1046, _1132, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1138 = fma(_1042, _1132, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        float _1140 = _1134 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1142 = fma(_1076, _1128, _1140);
        _1106 = _1142;
        _1086 = _1136;
        _1100 = _1138;
    }
    float _1144 = _1106;
    float _1146 = _1086;
    float _1148 = _1100;
    float _1150 = -_628;
    float _1152 = _1150 + _1144;
    float _1154 = _1078 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _1156 = -_732;
    float _1158 = _1156 + _1146;
    float _1160 = -_722;
    float _1162 = _1160 + _1148;
    float _1164 = _1152 * _1152;
    float _1166 = 1.0 / _1154;
    float _1168 = -_890;
    float _1170 = _1168 + _1146;
    float _1172 = fma(_1158, _1158, _1164);
    float _1174 = _1056 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _1176 = -_898;
    float _1178 = _1176 + _1148;
    float _1180 = fma(_1162, _1162, _1172);
    float _1182 = fma(_1060, (*spvDescriptorSet0.vp_c8)._m0[10].x, _1174);
    bool _1184 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[660].y;
    bool _1186 = isnan(0.5);
    bool _1188 = _1184 || _1186;
    bool _1190 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _1192 = _1188 || _1190;
    float _1194 = sqrt(_1180);
    float _1196 = fma(_1070, (*spvDescriptorSet0.vp_c8)._m0[10].z, _1182);
    bool _1198 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[653].w;
    bool _1200 = isnan(0.5);
    bool _1202 = _1198 || _1200;
    bool _1204 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _1206 = _1202 || _1204;
    float _1208 = _1196 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _1210 = _1208 + _1154;
    float _1212 = -_884;
    float _1214 = _1212 + _1144;
    float _1216 = _1210 * _1166;
    float _1218 = _1216 * 0.5;
    bool _1220 = _1194 > 0.0;
    float _1222 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _1224 = fma(_1218, (*spvDescriptorSet0.vp_c8)._m0[30].w, _1222);
    float _1226 = 1.0 / _1224;
    float _1228 = _1194;
    float _1230 = _1144;
    float _1232 = _1224;
    float _1234 = _1166;
    float _1236 = _1178;
    if (!_1220)
    {
        _1088 = _1170;
    }
    float _1238 = _1088;
    float _1240 = _1238;
    if (!_1220)
    {
        _1090 = _1214;
    }
    float _1242 = _1090;
    float _1244 = _1242;
    if (!_1220)
    {
        _1228 = _1178;
    }
    float _1246 = _1228;
    bool _1248 = !_1220;
    float _1250 = _1246;
    float _1252 = _1246;
    if (!_1248)
    {
        float _1254 = _192 * _192;
        float _1256 = fma(_190, _190, _1254);
        float _1258 = fma(_194, _194, _1256);
        float _1260 = rsqrt(_1180);
        float _1262 = sqrt(_1258);
        float _1264 = _1152 * _1260;
        float _1266 = _1158 * _1260;
        float _1268 = _1162 * _1260;
        bool _1270 = _1262 > 0.0;
        float _1272 = _1262;
        float _1274 = _1260;
        _1092 = _1258;
        _1230 = _1266;
        _1232 = _1264;
        if (!_1270)
        {
            _1272 = _1170;
        }
        float _1276 = _1272;
        _1240 = _1276;
        if (!_1270)
        {
            _1274 = _1214;
        }
        float _1278 = _1274;
        _1244 = _1278;
        if (!_1270)
        {
            _1250 = _1178;
        }
        float _1280 = _1250;
        bool _1282 = !_1270;
        _1252 = _1280;
        if (!_1282)
        {
            float _1284 = rsqrt(_1258);
            float _1286 = 1.0 / (*spvDescriptorSet0.vp_c10)._m0[2].z;
            float _1288 = _192 * _1284;
            float _1290 = _190 * _1284;
            float _1292 = _194 * _1284;
            float _1294 = _1264 * _1288;
            float _1296 = fma(_1266, _1290, _1294);
            float _1298 = _1286 * (*spvDescriptorSet0.vp_c9)._m0[142].x;
            float _1300 = fma(_1268, _1292, _1296);
            float _1302 = _1300 * _1298;
            float _1304 = fma(_190, _1302, _1170);
            float _1306 = fma(_192, _1302, _1214);
            float _1308 = fma(_194, _1302, _1178);
            _1240 = _1304;
            _1244 = _1306;
            _1252 = _1308;
        }
    }
    float _1310 = _1240;
    float _1312 = _1244;
    float _1314 = _1252;
    float _1316 = _1092;
    float _1318 = _1230;
    float _1320 = _1232;
    float _1322 = _1312;
    float _1324 = _1310;
    float _1326 = _1314;
    float _1328 = _1320;
    float _1330 = _1316;
    float _1332 = _1318;
    if (_1206)
    {
        _1234 = 1.0;
    }
    float _1334 = _1234;
    float _1336 = _1334;
    if (!_1192)
    {
        float _1338 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
        float _1340 = _1056 + _1338;
        float _1342 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
        float _1344 = _1060 + _1342;
        float _1346 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1348 = _1340 * _1340;
        float _1350 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
        float _1352 = _1070 + _1350;
        float _1354 = fma(_1344, _1344, _1348);
        float _1356 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _1358 = fma(_1352, _1352, _1354);
        float _1360 = sqrt(_1358);
        float _1362 = _1346 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1364 = precise::min(_1360, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _1366 = _1364 * _1356;
        float _1368 = -_1060;
        float _1370 = _1368 + _1310;
        float _1372 = _1362 * _1366;
        float _1374 = -_1056;
        float _1376 = _1374 + _1312;
        float _1378 = -_1070;
        float _1380 = _1378 + _1314;
        float _1382 = fma(_1370, _1372, _1060);
        float _1384 = fma(_1376, _1372, _1056);
        float _1386 = fma(_1380, _1372, _1070);
        _1322 = _1384;
        _1324 = _1382;
        _1326 = _1386;
    }
    float _1388 = _1322;
    float _1390 = _1324;
    float _1392 = _1326;
    if (_1206)
    {
        _1328 = 1.0;
    }
    float _1394 = _1328;
    float _1396 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _1398 = _1226 * _1396;
    float _1400 = _1394;
    if (!_1206)
    {
        float _1402 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1404 = _1402 * 0.15915493667125701904296875;
        float _1406 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1408 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1410 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _1408;
        float _1412 = _1404 * 6.283185482025146484375;
        float _1414 = cos(_1412);
        float _1416 = _1406 * 0.15915493667125701904296875;
        float _1418 = _1404 * 6.283185482025146484375;
        float _1420 = sin(_1418);
        float _1422 = 1.0 / _1414;
        float _1424 = _1416 * 6.283185482025146484375;
        float _1426 = cos(_1424);
        float _1428 = _1420 * _1422;
        float _1430 = _1416 * 6.283185482025146484375;
        float _1432 = sin(_1430);
        float _1434 = _1426 * _1428;
        float _1436 = 1.0 / _1410;
        float _1438 = 1.0 / _1434;
        float _1440 = _1432 * _1438;
        float _1442 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1444 = fma(_1398, _1440, _1442);
        float _1446 = _1444 * _1436;
        float _1448 = precise::clamp(_1446, 0.0, 1.0);
        _1330 = _1416;
        _1336 = _1448;
    }
    float _1450 = _1330;
    float _1452 = _1336;
    if (!_1206)
    {
        float _1454 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1456 = _1454 * 0.15915493667125701904296875;
        float _1458 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1460 = _1456 * 6.283185482025146484375;
        float _1462 = cos(_1460);
        float _1464 = _1458 * 0.15915493667125701904296875;
        float _1466 = _1456 * 6.283185482025146484375;
        float _1468 = sin(_1466);
        float _1470 = 1.0 / _1462;
        float _1472 = _1464 * 6.283185482025146484375;
        float _1474 = cos(_1472);
        float _1476 = _1468 * _1470;
        float _1478 = _1464 * 6.283185482025146484375;
        float _1480 = sin(_1478);
        float _1482 = _1474 * _1476;
        float _1484 = 1.0 / _1482;
        float _1486 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _1488 = (*spvDescriptorSet0.vp_c9)._m0[140].w + _1486;
        float _1490 = 1.0 / _1488;
        float _1492 = _1480 * _1484;
        float _1494 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _1496 = fma(_1398, _1492, _1494);
        float _1498 = _1496 * _1490;
        float _1500 = precise::clamp(_1498, 0.0, 1.0);
        float _1502 = -_1500;
        float _1504 = _1502 + 1.0;
        _1400 = _1504;
    }
    float _1506 = _1400;
    float _1508 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1510 = _1388 + _1508;
    float _1512 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1514 = _1390 + _1512;
    float _1516 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1518 = _1392 + _1516;
    float _1520 = _1388 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1522 = _1510 * _1510;
    float _1524 = _1388 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1526 = fma(_1390, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1520);
    float _1528 = fma(_1514, _1514, _1522);
    float _1530 = fma(_1390, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1524);
    float _1532 = fma(_1392, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1526);
    float _1534 = fma(_1518, _1518, _1528);
    float _1536 = fma(_1392, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1530);
    float _1538 = _1532 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1540 = rsqrt(_1534);
    float _1542 = _1536 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1544 = sqrt(_1534);
    float _1546 = _1540 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1548 = _1514 * _1546;
    float _1550 = _1518 * _1546;
    float _1552 = _1548 * _1548;
    float _1554 = _1550 * _1550;
    float _1556 = _1552 + _1554;
    float _1558 = sqrt(_1556);
    bool _1560 = _1558 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1562 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1564 = _1558 + _1562;
    float _1566 = _1522;
    float _1568 = _1556;
    float _1570 = _1564;
    float _1572 = _1548;
    float _1574 = _1550;
    float _1576 = _1552;
    if (_1560)
    {
        float _1578 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1566 = _1578;
    }
    float _1580 = _1566;
    if (_1560)
    {
        float _1582 = rsqrt(_1556);
        _1568 = _1582;
    }
    float _1584 = _1568;
    float _1586 = _1584;
    if (_1560)
    {
        float _1588 = _1564 * _1580;
        _1570 = _1588;
    }
    float _1590 = _1570;
    if (_1560)
    {
        float _1592 = _1590 * 0.15915493667125701904296875;
        _1094 = _1592;
    }
    float _1594 = _1094;
    float _1596 = _1580;
    if (_1560)
    {
        float _1598 = _1594 * 6.283185482025146484375;
        float _1600 = sin(_1598);
        _1596 = _1600;
    }
    float _1602 = _1596;
    float _1604 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _1606 = precise::max(0.0, _1604);
    float _1608 = _1450;
    if (_1560)
    {
        float _1610 = _1594 * 6.283185482025146484375;
        float _1612 = cos(_1610);
        _1608 = _1612;
    }
    float _1614 = _1608;
    float _1616 = -_1546;
    float _1618 = -_1606;
    float _1620 = fma(_1510, _1616, _1618);
    if (_1560)
    {
        float _1622 = _1620 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1236 = _1622;
    }
    float _1624 = _1236;
    float _1626 = _1538 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _1628 = fma(_1060, (*spvDescriptorSet0.vp_c15)._m0[652].x, (*spvDescriptorSet0.vp_c15)._m0[652].z);
    float _1630 = _1602;
    float _1632 = _1624;
    if (_1560)
    {
        float _1634 = fma(_1602, _1624, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1332 = _1634;
    }
    float _1636 = _1332;
    float _1638 = _1636;
    if (!_1560)
    {
        _1630 = _1620;
    }
    float _1640 = _1630;
    float _1642 = floor(_1628);
    float _1644 = _1640;
    float _1646 = _1614;
    if (_1560)
    {
        float _1648 = _1614 + (-1.0);
        _1632 = _1648;
    }
    float _1650 = _1632;
    if (_1560)
    {
        float _1652 = _1584 * _1636;
        _1638 = _1652;
    }
    float _1654 = _1638;
    if (_1560)
    {
        float _1656 = _1650 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1586 = _1656;
    }
    float _1658 = _1586;
    if (_1560)
    {
        float _1660 = _1548 * _1654;
        _1572 = _1660;
    }
    float _1662 = _1572;
    if (_1560)
    {
        float _1664 = _1550 * _1654;
        _1574 = _1664;
    }
    float _1666 = _1574;
    if (_1560)
    {
        float _1668 = fma(_1620, _1614, _1658);
        _1644 = _1668;
    }
    float _1670 = _1644;
    if (_1560)
    {
        float _1672 = _1662 * _1662;
        _1576 = _1672;
    }
    float _1674 = _1576;
    if (!_1560)
    {
        _1646 = _1554;
    }
    float _1676 = _1646;
    float _1678 = _1676;
    if (_1560)
    {
        float _1680 = _1666 * _1666;
        _1678 = _1680;
    }
    float _1682 = _1678;
    float _1684 = _1388 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1686 = fma(_1670, _1670, _1674);
    float _1688 = fma(_1390, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1684);
    float _1690 = _1686 + _1682;
    float _1692 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _1694 = _1388 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1696 = fma(_1392, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1688);
    float _1698 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _1700 = fma(_1544, (*spvDescriptorSet0.vp_c15)._m0[23].w, _1698);
    float _1702 = precise::clamp(_1700, 0.0, 1.0);
    float _1704 = fma(_1390, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1694);
    float _1706 = _1696 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1708 = rsqrt(_1690);
    float _1710 = -_1702;
    float _1712 = _1710 + 1.0;
    float _1714 = fma(_1392, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1704);
    float _1716 = -_1626;
    float _1718 = fma(_1716, _1692, 1.0);
    float _1720 = fma(_1070, (*spvDescriptorSet0.vp_c15)._m0[652].y, (*spvDescriptorSet0.vp_c15)._m0[652].w);
    float _1722 = _1706 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1724 = _1714 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1726 = _1706 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1728 = abs(_1712);
    float _1730 = log2(_1728);
    float _1732 = fma(_1724, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1726);
    float _1734 = fma(_1538, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1732);
    float _1736 = _1708 * _1662;
    float _1738 = _1708 * _1670;
    float _1740 = floor(_1720);
    float _1742 = fma(_1542, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1734);
    float _1744 = _1736 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _1746 = _1708 * _1666;
    float _1748 = -_1642;
    float _1750 = _1628 + _1748;
    float _1752 = _1706 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1754 = -_1744;
    float _1756 = fma(_1738, (*spvDescriptorSet0.vp_c15)._m0[21].y, _1754);
    float _1758 = _1730 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _1760 = log2(_1718);
    float _1762 = fma(_1724, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1752);
    float _1764 = -_1746;
    float _1766 = fma(_1764, (*spvDescriptorSet0.vp_c15)._m0[21].z, _1756);
    float _1768 = fma(_1538, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1762);
    float _1770 = fma(_1766, -0.5, 0.5);
    float _1772 = fma(_1766, 0.5, 0.5);
    float _1774 = 1.0 / _1742;
    float _1776 = -_1740;
    float _1778 = _1720 + _1776;
    float _1780 = fma(_1724, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1722);
    float _1782 = fma(_1772, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _1784 = fma(_1542, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1768);
    float _1786 = _1738 + 1.0;
    float _1788 = fma(_1538, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1780);
    float _1790 = fma(_1772, _1782, -0.212114393711090087890625);
    float _1792 = exp2(_1758);
    float _1794 = _1760 * 0.693147182464599609375;
    float _1796 = fma(_1542, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1788);
    float _1798 = fma(_1772, _1790, 1.570728778839111328125);
    float _1800 = _1794 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _1802 = sqrt(_1770);
    float _1804 = _1784 * _1774;
    float _1806 = _1796 * _1774;
    float _1808 = -_1738;
    float _1810 = fma(_1792, _1786, _1808);
    float2 _5983 = float2(_1750, _1778);
    float _1812 = dm_bs(spvDescriptorSet0.vp_t_tcb_24.sample(spvDescriptorSet0.vp_t_tcb_24Smplr, select(_5983, float2(0.0), isnan(_5983)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_24, spvDescriptorSet0.vp_t_tcb_24Smplr_w, select(_5983, float2(0.0), isnan(_5983)), level(0.0)).x;
    float _1814 = fma(_1810, 0.5, 0.5);
    float _1816 = _1802 * 0.636619746685028076171875;
    float _1818 = fma(_1804, 0.5, 0.5);
    float _1820 = fma(_1806, -0.5, 0.5);
    float _1822 = -_1798;
    float _1824 = fma(_1816, _1822, 1.0);
    float3 _6008 = float3(_1818, _1820, _1800);
    float _1826 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_6008, float3(0.0), isnan(_6008)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_6008, float3(0.0), isnan(_6008)), level(0.0)).x;
    float3 _6019 = float3(_1818, _1820, _1800);
    float4 _1829 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_6019, float3(0.0), isnan(_6019)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_6019, float3(0.0), isnan(_6019)), level(0.0)).xyzw;
    float _1831 = _1829.x;
    float _1833 = _1829.y;
    float _1835 = _1829.z;
    float _1837 = _1829.w;
    float2 _6035 = float2(_1824, _1814);
    float3 _1841 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_6035, float2(0.0), isnan(_6035)), level(0.0)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_6035, float2(0.0), isnan(_6035)), level(0.0)).xyz;
    float _1843 = _1841.x;
    float _1845 = _1841.y;
    float _1847 = _1841.z;
    float _1849 = float(uint(_536));
    float _1851 = trunc(_670);
    int _1853 = int(_1851);
    bool _1855 = _536 == 0;
    out.m_65.x = _1060;
    out.m_65.y = _1056;
    out.m_65.z = _1070;
    int _1857 = abs(_754);
    float _1859 = _1730 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    bool _1861 = _496 > 0.5;
    out.m_67.w = _866;
    float _1863 = 1.0 / _1849;
    int _1865 = ~_536;
    int _1867 = _1865 + 1;
    out.m_69.x = _946;
    float _1869 = float(_114);
    out.m_71.x = _1390;
    out.m_71.y = _1388;
    out.m_71.z = _1392;
    float _1871 = float(uint(_1853));
    float _1873 = 1.0 / _1869;
    int _1875 = as_type<int>(_1863) + (-2);
    float _1877 = exp2(_1859);
    float _1879 = as_type<float>(_1875) * _1871;
    int _1881 = ~_536;
    int _1883 = _1881 + 1;
    float _1885 = trunc(_1879);
    float _1887 = precise::max(_1885, 0.0);
    uint _1890 = uint(_1887);
    float _1892 = -(*spvDescriptorSet0.vp_c9)._m0[133].x;
    float _1894 = (*spvDescriptorSet0.vp_c9)._m0[134].x + _1892;
    float _1896 = -_1877;
    float _1898 = _1896 + 1.0;
    int _1900 = _1867 * int(_1890);
    int _1902 = _1900 + _1853;
    float _1904 = float(uint(_1902));
    float _1906 = as_type<float>(_1875) * _1904;
    int _1908 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _1910 = _1908 != 0;
    float _1912 = float(_1853);
    float _1914 = trunc(_1906);
    float _1916 = precise::max(_1914, 0.0);
    uint _1918 = uint(_1916);
    bool _1920 = !_1910;
    float _1922 = _1920 ? 7.345489978790283203125 : 1.0;
    bool _1924 = _1912 >= _644;
    bool _1926 = isnan(_1912);
    bool _1928 = _1924 || _1926;
    bool _1930 = isnan(_644);
    bool _1932 = _1928 || _1930;
    float _1934 = float(_1932);
    float _1936 = _1922 * _494;
    float _1938 = trunc(_1934);
    int _1940 = int(_1938);
    int _1942 = int(_1890) + int(_1918);
    float _1944 = floor(_1936);
    int _1946 = _1883 * _1942;
    int _1948 = _1946 + _1853;
    bool _1950 = uint(_1948) >= uint(_536);
    bool _1952 = !_1950;
    int _1954 = _1952 ? 0 : (-1);
    float _1956 = -_1944;
    float _1958 = _1936 + _1956;
    int _1960 = ~_1942;
    int _1962 = _1960 + _1954;
    int _1964 = _1962 + 1;
    float _1966 = _666 * _1873;
    int _1968 = ~_1940;
    int _1970 = _1968 + 1;
    int _1972 = _1970 + 1;
    float _1974 = _1958 * _644;
    int _1976 = _536 * _1964;
    int _1978 = _1976 + _1853;
    int _1980 = _536 + (-1);
    float _1982 = trunc(_1966);
    int _1984 = int(_1982);
    int _1986 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4096;
    bool _1988 = _1986 != 0;
    bool _1990 = !_1855;
    int _1992 = _1990 ? _1978 : (-1);
    float _1994 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _1996 = _492 + _1994;
    bool _1998 = !_1988;
    int _2000 = _1998 ? 0 : 1;
    int _2002 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 128;
    bool _2004 = _2002 != 0;
    float _2006 = trunc(_1974);
    int _2008 = int(_2006);
    int _2010 = _1992 * _1972;
    int _2012 = abs(_2000);
    int _2014 = abs(_736);
    int _2016 = _1940 * _1980;
    int _2018 = _2016 + _2010;
    bool _2020 = !_2004;
    int _2022 = _2020 ? 0 : 1;
    int _2024 = _2018 * _2014;
    int _2026 = abs(_746);
    int _2028 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _2030 = _2028 != 0;
    int _2032 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _2034 = _2032 != 0;
    int _2036 = _1984 * _2026;
    int _2038 = _2036 + _2024;
    int _2040 = _2008 * _2012;
    int _2042 = _2040 + _1853;
    int _2044 = abs(_2022);
    float _2046 = in.m_73.x;
    int _2048 = _2042 * _1857;
    int _2050 = _2048 + _2038;
    float _2052 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _2054 = _2052 + (*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _2056 = in.m_75.y;
    int _2058 = _2008 * _2044;
    int _2060 = _2058 + _2050;
    int _2062 = ~_536;
    int _2064 = _2062 + 1;
    float _2066 = 1.0 / _2054;
    float _2068 = float(uint(_2060));
    float _2070 = as_type<float>(_1875) * _2068;
    float _2072 = trunc(_2070);
    float _2074 = precise::max(_2072, 0.0);
    uint _2076 = uint(_2074);
    out.m_77.x = _2046;
    int _2078 = _2064 * int(_2076);
    int _2080 = _2078 + _2060;
    float _2082 = float(uint(_2080));
    int _2084 = ~_536;
    int _2086 = _2084 + 1;
    float _2088 = as_type<float>(_1875) * _2082;
    float _2090 = trunc(_2088);
    float _2092 = precise::max(_2090, 0.0);
    uint _2094 = uint(_2092);
    int _2096 = int(_2076) + int(_2094);
    float _2098 = in.m_73.y;
    int _2100 = _2086 * _2096;
    int _2102 = _2100 + _2060;
    float _2104 = in.m_73.z;
    bool _2106 = uint(_2102) >= uint(_536);
    float _2108 = in.m_73.w;
    bool _2110 = !_2106;
    int _2112 = _2110 ? 0 : (-1);
    int _2114 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2097152;
    bool _2116 = _2114 != 0;
    float _2118 = -(*spvDescriptorSet0.vp_c9)._m0[131].x;
    float _2120 = (*spvDescriptorSet0.vp_c9)._m0[132].x + _2118;
    int _2122 = ~_2096;
    int _2124 = _2122 + _2112;
    int _2126 = _2124 + 1;
    float _2128 = -(*spvDescriptorSet0.vp_c9)._m0[132].x;
    float _2130 = _2128 + (*spvDescriptorSet0.vp_c9)._m0[133].x;
    float _2132 = _2120 * _2066;
    int _2134 = ~_536;
    int _2136 = _2134 + 1;
    int _2138 = _536 * _2126;
    int _2140 = _2138 + _2060;
    float _2142 = float(uint(_2042));
    float _2144 = -(*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _2146 = _2144 + (*spvDescriptorSet0.vp_c9)._m0[133].w;
    float _2148 = fma(_2132, _1996, (*spvDescriptorSet0.vp_c9)._m0[131].x);
    out.m_77.y = _2098;
    bool _2150 = !_1855;
    int _2152 = _2150 ? _2140 : (-1);
    float _2154 = as_type<float>(_1875) * _2142;
    float _2156 = 1.0 / _2146;
    float _2158 = -_2056;
    float _2160 = _2158 + 1.0;
    int _2162 = _2152 >> 31;
    out.m_77.z = _2104;
    int _2164 = _2152 & 3;
    bool _2166 = _2164 != 0;
    int _2168 = _2162 & 3;
    out.m_77.w = _2108;
    float _2170 = trunc(_2154);
    float _2172 = precise::max(_2170, 0.0);
    uint _2174 = uint(_2172);
    float _2176 = _2056;
    float _2178 = _1742;
    float _2180 = _1796;
    float _2182 = _1784;
    if (_2034)
    {
        float _2184 = _1861 ? _2160 : _2056;
        _2176 = _2184;
    }
    float _2186 = _2176;
    int _2188 = _2152 + _2168;
    bool _2190 = _492 >= (*spvDescriptorSet0.vp_c9)._m0[134].w;
    bool _2192 = isnan(_492);
    bool _2194 = _2190 || _2192;
    bool _2196 = isnan((*spvDescriptorSet0.vp_c9)._m0[134].w);
    bool _2198 = _2194 || _2196;
    float _2200 = float(_2198);
    int _2202 = _2188 >> 2;
    float _2204 = _2130 * _2156;
    float _2206 = -_2200;
    float _2208 = _2206 + 1.0;
    int _2210 = _2202 << 4;
    int _2212 = _2210 + 368;
    bool _2214 = _492 >= (*spvDescriptorSet0.vp_c9)._m0[133].w;
    bool _2216 = isnan(_492);
    bool _2218 = _2214 || _2216;
    bool _2220 = isnan((*spvDescriptorSet0.vp_c9)._m0[133].w);
    bool _2222 = _2218 || _2220;
    float _2224 = float(_2222);
    float _2226 = -(*spvDescriptorSet0.vp_c9)._m0[133].w;
    float _2228 = _2226 + (*spvDescriptorSet0.vp_c9)._m0[134].w;
    int _2230 = _2136 * int(_2174);
    int _2232 = _2230 + _2042;
    uint _2234 = uint(int(uint(_2212) >> uint(2)));
    uint _2236 = uint(int(uint(int(_2234)) >> uint(2)));
    int _2238 = int(_2234) & 3;
    float _2240 = (*spvDescriptorSet0.vp_c9)._m0[int(_2236)][_2238];
    int _2242 = int(_2234) + 1;
    uint _2244 = uint(int(uint(_2242) >> uint(2)));
    int _2246 = _2242 & 3;
    float _2248 = (*spvDescriptorSet0.vp_c9)._m0[int(_2244)][_2246];
    float _2250 = -_2224;
    float _2252 = _2250 + 1.0;
    float _2254 = 1.0 / _2228;
    float _2256 = float(uint(_2232));
    float _2258 = _2224 * _2208;
    bool _2260 = _492 >= (*spvDescriptorSet0.vp_c9)._m0[132].w;
    bool _2262 = isnan(_492);
    bool _2264 = _2260 || _2262;
    bool _2266 = isnan((*spvDescriptorSet0.vp_c9)._m0[132].w);
    bool _2268 = _2264 || _2266;
    float _2270 = float(_2268);
    int _2272 = _2152 & 3;
    bool _2274 = _2272 != 0;
    float _2276 = as_type<float>(_1875) * _2256;
    bool _2278 = _492 >= (*spvDescriptorSet0.vp_c9)._m0[131].w;
    bool _2280 = isnan(_492);
    bool _2282 = _2278 || _2280;
    bool _2284 = isnan((*spvDescriptorSet0.vp_c9)._m0[131].w);
    bool _2286 = _2282 || _2284;
    float _2288 = float(_2286);
    float _2290 = _2270 * _2252;
    float _2292 = -_2270;
    float _2294 = _2292 + 1.0;
    bool _2296 = uint(_2272) > 1u;
    int _2298 = _2212 + 8;
    uint _2300 = uint(int(uint(_2298) >> uint(2)));
    uint _2302 = uint(int(uint(int(_2300)) >> uint(2)));
    int _2304 = int(_2300) & 3;
    float _2306 = (*spvDescriptorSet0.vp_c9)._m0[int(_2302)][_2304];
    int _2308 = int(_2300) + 1;
    uint _2310 = uint(int(uint(_2308) >> uint(2)));
    int _2312 = _2308 & 3;
    float _2314 = (*spvDescriptorSet0.vp_c9)._m0[int(_2310)][_2312];
    float _2316 = trunc(_2276);
    float _2318 = precise::max(_2316, 0.0);
    uint _2320 = uint(_2318);
    float _2322 = _2288 * _2294;
    int _2324 = _2166 ? 0 : 1;
    float _2326 = -_2288;
    float _2328 = _2326 + 1.0;
    float _2330 = _1894 * _2254;
    float _2332 = _2148 * _2322;
    float _2334 = -(*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _2336 = _492 + _2334;
    float _2338 = -(*spvDescriptorSet0.vp_c9)._m0[133].w;
    float _2340 = _492 + _2338;
    int _2342 = ~_2324;
    int _2344 = _2342 + 1;
    int _2346 = _2344 + 1;
    float _2348 = fma(_2328, (*spvDescriptorSet0.vp_c9)._m0[131].x, _2332);
    bool _2350 = uint(_2272) >= 2u;
    float _2352 = fma(_2204, _2336, (*spvDescriptorSet0.vp_c9)._m0[132].x);
    int _2354 = _2346;
    if (!_2296)
    {
        int _2356 = ~_2324;
        int _2358 = _2356 + 1;
        _2354 = _2358;
    }
    int _2360 = _2354;
    float _2362 = fma(_2330, _2340, (*spvDescriptorSet0.vp_c9)._m0[133].x);
    bool _2364 = _2272 != 3;
    float _2366 = fma(_2352, _2290, _2348);
    int _2368 = ~_536;
    int _2370 = _2368 + 1;
    float _2372 = -_1812;
    float _2374 = _2372 + 1.0;
    int _2376 = int(_2174) + int(_2320);
    bool _2378 = !_2274;
    int _2380 = _2378 ? 0 : 1;
    int _2382 = abs(_2360);
    int _2384 = _2350 ? 0 : 1;
    int _2386 = abs(_2380);
    int _2388 = ~_2382;
    int _2390 = _2388 + 1;
    int _2392 = _2390 + 1;
    int _2394 = _2370 * _2376;
    int _2396 = _2394 + _2042;
    int _2398 = ~_2384;
    int _2400 = _2398 + 1;
    int _2402 = _2400 + 1;
    float _2404 = fma(_2362, _2258, _2366);
    int _2406 = _2402;
    if (_2364)
    {
        int _2408 = ~_2384;
        int _2410 = _2408 + 1;
        _2406 = _2410;
    }
    int _2412 = _2406;
    int _2414 = _2392 * as_type<int>(_2248);
    int _2416 = ~_2386;
    int _2418 = _2416 + 1;
    int _2420 = _2418 + 1;
    float _2422 = _978 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    int _2424 = abs(_2412);
    bool _2426 = _2272 != 3;
    int _2428 = _2420 * as_type<int>(_2240);
    int _2430 = _2428 + _2414;
    bool _2432 = uint(_2396) >= uint(_536);
    float _2434 = trunc((*spvDescriptorSet0.vp_c9)._m0[80].z);
    int _2436 = int(_2434);
    float _2438 = as_type<float>(_2396);
    if (_2030)
    {
        float _2440 = in.m_55.x;
        _2438 = _2440;
    }
    float _2442 = _2438;
    bool _2444 = !_2426;
    int _2446 = _2444 ? 0 : (-1);
    bool _2448 = !_2432;
    int _2450 = _2448 ? 0 : (-1);
    int _2452 = ~_2424;
    int _2454 = _2452 + 1;
    int _2456 = _2454 + 1;
    int _2458 = abs(_2446);
    bool _2460 = !_2116;
    int _2462 = _2460 ? 0 : 1;
    int _2464 = ~_2376;
    int _2466 = _2464 + _2450;
    int _2468 = _2466 + 1;
    int _2470 = _2456 * as_type<int>(_2306);
    int _2472 = _2470 + _2430;
    int _2474 = abs(_2462);
    float _2476 = in.m_75.x;
    int _2478 = ~_2458;
    int _2480 = _2478 + 1;
    int _2482 = _2480 + 1;
    int _2484 = _536 * _2468;
    int _2486 = _2484 + _2042;
    bool _2488 = _922 != 0.0;
    bool _2490 = isnan(_922);
    bool _2492 = _2488 || _2490;
    bool _2494 = isnan(0.0);
    bool _2496 = _2492 || _2494;
    float _2498 = in.m_79.x;
    float _2500 = in.m_79.y;
    float _2502 = in.m_79.z;
    int _2504 = ~_2474;
    int _2506 = _2504 + 1;
    int _2508 = _2506 + 1;
    int _2510 = _2482 * as_type<int>(_2314);
    int _2512 = _2510 + _2472;
    float _2514 = float(uint(_2436));
    int _2516 = abs(_2436);
    int _2518 = _2512 * _2508;
    bool _2520 = _920 == 0.0;
    bool _2522 = !_2496;
    bool _2524 = _2520 && _2522;
    bool _2526 = !_1855;
    int _2528 = _2526 ? _2486 : (-1);
    float _2530 = 1.0 / _2514;
    float _2532 = fma(_2200, (*spvDescriptorSet0.vp_c9)._m0[134].x, _2404);
    bool _2534 = _924 == 0.0;
    bool _2536 = _2534 && _2524;
    int _2538 = _2528 * _2474;
    int _2540 = _2538 + _2518;
    float _2542 = float(uint(_2516));
    float _2544 = _2532 * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    bool _2546 = _2442 > 0.5;
    bool _2548 = _2546 && _2030;
    float _2550 = _2442;
    if (_2030)
    {
        _2550 = _2476;
    }
    float _2552 = _2550;
    float _2554 = 1.0 / _2542;
    int _2556 = abs(_2540);
    float _2558 = _2498;
    float _2560 = _2502;
    float _2562 = _2552;
    float _2564 = _2500;
    if (!_2536)
    {
        float _2566 = fma(_920, (*spvDescriptorSet0.vp_c9)._m0[17].y, _2498);
        _2558 = _2566;
    }
    float _2568 = _2558;
    if (!_2030)
    {
        _1096 = _2476;
    }
    float _2570 = _1096;
    float _2572 = _2570;
    if (!_2536)
    {
        float _2574 = fma(_924, (*spvDescriptorSet0.vp_c9)._m0[17].y, _2502);
        _2560 = _2574;
    }
    float _2576 = _2560;
    int _2578 = as_type<int>(_2530) + (-2);
    if (_2548)
    {
        float _2580 = -_2552;
        float _2582 = _2580 + 1.0;
        _2562 = _2582;
    }
    float _2584 = _2562;
    float _2586 = float(uint(_2540));
    float _2588 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    if (!_2536)
    {
        float _2590 = fma(_922, (*spvDescriptorSet0.vp_c9)._m0[17].y, _2500);
        _2564 = _2590;
    }
    float _2592 = _2564;
    float _2594 = as_type<float>(_2578) * _2586;
    float _2596 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    int _2598 = as_type<int>(_2554) + (-2);
    float _2600 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _2602 = float(uint(_2556));
    float _2604 = trunc(_2594);
    float _2606 = precise::max(_2604, 0.0);
    uint _2608 = uint(_2606);
    float _2610 = _2588 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2612 = _2596 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2614 = _2600 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2616 = as_type<float>(_2598) * _2602;
    if (_2030)
    {
        _2572 = _2584;
    }
    float _2618 = _2572;
    float _2620 = _978 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    int _2622 = ~_2436;
    int _2624 = _2622 + 1;
    out.m_81.x = _2610;
    out.m_81.y = _2612;
    out.m_81.z = _2614;
    out.m_81.w = _2544;
    int _2626 = ~_2516;
    int _2628 = _2626 + 1;
    float _2630 = trunc(_2616);
    float _2632 = precise::max(_2630, 0.0);
    uint _2634 = uint(_2632);
    float _2636 = _978 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _2638 = -_966;
    float _2640 = fma(_2638, (*spvDescriptorSet0.vp_c8)._m0[24].x, _2620);
    float _2642 = fma(_974, (*spvDescriptorSet0.vp_c8)._m0[24].z, _2640);
    float _2644 = abs(_1398);
    float _2646 = log2(_2644);
    int _2648 = _2624 * int(_2608);
    int _2650 = _2648 + _2540;
    float _2652 = -_966;
    float _2654 = fma(_2652, (*spvDescriptorSet0.vp_c8)._m0[25].x, _2422);
    float _2656 = -_966;
    float _2658 = fma(_2656, (*spvDescriptorSet0.vp_c8)._m0[26].x, _2636);
    float _2660 = float(uint(_2650));
    float _2662 = fma(_974, (*spvDescriptorSet0.vp_c8)._m0[25].z, _2654);
    int _2664 = _2628 * int(_2634);
    int _2666 = _2664 + _2556;
    float _2668 = _986 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _2670 = _986 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _2672 = as_type<float>(_2578) * _2660;
    float _2674 = _986 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _2676 = float(uint(_2666));
    float _2678 = fma(_976, (*spvDescriptorSet0.vp_c8)._m0[24].x, _2668);
    float _2680 = fma(_976, (*spvDescriptorSet0.vp_c8)._m0[25].x, _2670);
    float _2682 = fma(_976, (*spvDescriptorSet0.vp_c8)._m0[26].x, _2674);
    float _2684 = trunc(_2672);
    float _2686 = precise::max(_2684, 0.0);
    uint _2688 = uint(_2686);
    float _2690 = as_type<float>(_2598) * _2676;
    float _2692 = _992 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _2694 = _992 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _2696 = _992 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _2698 = fma(_974, (*spvDescriptorSet0.vp_c8)._m0[26].z, _2658);
    float _2700 = fma(_980, (*spvDescriptorSet0.vp_c8)._m0[24].x, _2692);
    float _2702 = fma(_980, (*spvDescriptorSet0.vp_c8)._m0[25].x, _2694);
    float _2704 = trunc(_2690);
    float _2706 = precise::max(_2704, 0.0);
    uint _2708 = uint(_2706);
    float _2710 = fma(_980, (*spvDescriptorSet0.vp_c8)._m0[26].x, _2696);
    int _2712 = ~_2436;
    int _2714 = _2712 + 1;
    float _2716 = _2698 * _2592;
    float _2718 = _2646 * (*spvDescriptorSet0.vp_c15)._m0[654].z;
    int _2720 = ~_2516;
    int _2722 = _2720 + 1;
    float _2724 = _2642 * _2592;
    float _2726 = fma(_1000, (*spvDescriptorSet0.vp_c8)._m0[24].z, _2678);
    int _2728 = int(_2608) + int(_2688);
    float _2730 = _2662 * _2592;
    float _2732 = exp2(_2718);
    float _2734 = fma(_1008, (*spvDescriptorSet0.vp_c8)._m0[24].z, _2700);
    float _2736 = fma(_1008, (*spvDescriptorSet0.vp_c8)._m0[25].z, _2702);
    int _2738 = _2714 * _2728;
    int _2740 = _2738 + _2540;
    int _2742 = int(_2634) + int(_2708);
    float _2744 = fma(_1000, (*spvDescriptorSet0.vp_c8)._m0[25].z, _2680);
    float _2746 = fma(_1000, (*spvDescriptorSet0.vp_c8)._m0[26].z, _2682);
    bool _2748 = uint(_2740) >= uint(_2436);
    int _2750 = _2722 * _2742;
    int _2752 = _2750 + _2556;
    float _2754 = fma(_2726, _2568, _2724);
    float _2756 = fma(_2746, _2568, _2716);
    bool _2758 = !_2748;
    int _2760 = _2758 ? 0 : (-1);
    float _2762 = fma(_2744, _2568, _2730);
    bool _2764 = uint(_2752) >= uint(_2516);
    float _2766 = fma(_2732, (*spvDescriptorSet0.vp_c15)._m0[654].x, (*spvDescriptorSet0.vp_c15)._m0[654].y);
    float _2768 = precise::clamp(_2766, 0.0, 1.0);
    int _2770 = ~_2728;
    int _2772 = _2770 + _2760;
    int _2774 = _2772 + 1;
    float _2776 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    bool _2778 = !_2764;
    int _2780 = _2778 ? 0 : (-1);
    float _2782 = fma(_2734, _2576, _2754);
    bool _2784 = _2436 == 0;
    float _2786 = fma(_2736, _2576, _2762);
    int _2788 = _2540 ^ _2436;
    float _2790 = fma(_1008, (*spvDescriptorSet0.vp_c8)._m0[26].z, _2710);
    bool _2792 = _2436 == 0;
    int _2794 = _2436 * _2774;
    int _2796 = _2794 + _2540;
    float _2798 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    uint _2800 = uint(int(uint(_2788) >> uint(31)));
    float _2802 = fma(_2790, _2576, _2756);
    int _2804 = ~_2780;
    int _2806 = _2742 + _2804;
    int _2808 = _2806 + 1;
    float _2810 = fma(_2768, -2.0, 3.0);
    float _2812 = _2768 * _2768;
    int _2814 = ~int(_2800);
    int _2816 = _2814 + 1;
    float _2818 = _1706 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _2820 = _2776 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _2822 = _2812 * _2810;
    bool _2824 = !_2784;
    int _2826 = _2824 ? _2796 : (-1);
    float _2828 = fma(_1724, (*spvDescriptorSet0.vp_c8)._m0[6].x, _2818);
    int _2830 = _2808 ^ _2816;
    float _2832 = -_2822;
    float _2834 = _2832 + 1.0;
    float _2836 = float(_2826);
    float _2838 = fma(_2820, _2618, -0.5);
    float _2840 = _2798 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    int _2842 = ~_2816;
    int _2844 = _2842 + _2830;
    int _2846 = _2844 + 1;
    float _2848 = in.m_83.x;
    bool _2850 = _1398 <= 8000.0;
    bool _2852 = isnan(_1398);
    bool _2854 = _2850 || _2852;
    bool _2856 = isnan(8000.0);
    bool _2858 = _2854 || _2856;
    float _2860 = float(_2858);
    float _2862 = fma(_2834, (*spvDescriptorSet0.vp_c15)._m0[654].w, _2822);
    bool _2864 = !_2792;
    int _2866 = _2864 ? _2846 : (-1);
    float _2868 = fma(_2820, _2836, _674);
    float _2870 = fma(_2840, _2186, -0.5);
    float _2872 = _2860 * _2862;
    float _2874 = float(_2866);
    float _2876 = _1898 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _2878 = _2872 * (*spvDescriptorSet0.vp_c15)._m0[653].x;
    float _2880 = _1742 * 0.5;
    float _2882 = -_606;
    float _2884 = fma(_2840, _2874, _2882);
    float _2886 = fma(_676, _2838, _2868);
    float _2888 = _2374 * _2878;
    float _2890 = precise::clamp(_2888, 0.0, 1.0);
    float _2892 = _2876 * _1826;
    float _2894 = fma(_684, _2870, _2884);
    float _2896 = fma(_1796, -0.5, _2880);
    float _2898 = -_2890;
    float _2900 = fma(_2898, (*spvDescriptorSet0.vp_c15)._m0[653].y, 1.0);
    float _2902 = _2886 + 0.5;
    float _2904 = _2894 + 0.5;
    float _2906 = -_2876;
    float _2908 = _2906 + 1.0;
    float _2910 = _1837 * _2892;
    float _2912 = _1847 * _2892;
    float _2914 = _2900 * _2848;
    out.m_85.x = _2902;
    out.m_85.y = _2904;
    float _2916 = _1837 * _2908;
    float _2918 = fma(_1837, _2912, _1835);
    float _2920 = _2914 * (*spvDescriptorSet0.vp_c13)._m0[1].w;
    out.m_87.x = _2782;
    out.m_87.y = _2786;
    out.m_87.z = _2802;
    float _2922 = fma(_1538, (*spvDescriptorSet0.vp_c8)._m0[6].z, _2828);
    bool _2924 = _1544 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _2926 = isnan(_1544);
    bool _2928 = _2924 || _2926;
    bool _2930 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _2932 = _2928 || _2930;
    float _2934 = _1784 + _1742;
    out.m_89.x = _2920;
    float _2936 = fma(_1542, (*spvDescriptorSet0.vp_c8)._m0[6].w, _2922);
    float _2938 = fma(_1843, _2910, _1831);
    float _2940 = fma(_1845, _2910, _1833);
    float _2942 = _2936 + _1742;
    float _2944 = _2934 * 0.5;
    float _2946 = _1452 * _1506;
    out.m_91.x = _2938;
    out.m_91.y = _2940;
    out.m_91.z = _2918;
    out.m_91.w = _2916;
    float _2948 = _2942 * 0.5;
    out.gl_Position.x = _1784;
    out.gl_Position.y = _1796;
    out.gl_Position.z = _2936;
    out.gl_Position.w = _1742;
    out.m_93.x = _2944;
    out.m_93.y = _2896;
    out.m_93.z = _2948;
    out.m_93.w = _1742;
    float _2950 = _2936;
    float _2952 = _2944;
    float _2954 = _2946;
    if (!_2932)
    {
        _2178 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _2956 = _2178;
    float _2958 = _2956;
    float _2960 = _2956;
    if (!_2932)
    {
        _2950 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _2962 = _2950;
    float _2964 = _2946 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _2966 = _2962;
    float _2968 = _2962;
    if (!_2932)
    {
        _2952 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _2970 = _2952;
    float _2972 = _2970;
    float _2974 = _2970;
    if (!_2932)
    {
        _2180 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _2976 = _2180;
    float _2978 = _2976;
    float _2980 = _2976;
    if (!_2932)
    {
        _2182 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _2982 = _2182;
    float _2984 = _2982;
    float _2986 = _2982;
    if (!_2932)
    {
        _2954 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _2988 = _2954;
    bool _2990 = !_2932;
    float _2992 = _2988;
    float _2994 = _2988;
    if (!_2990)
    {
        bool _2996 = _1544 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _2998 = isnan(_1544);
        bool _3000 = _2996 || _2998;
        bool _3002 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _3004 = _3000 || _3002;
        if (!_3004)
        {
            float _3006 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _3008 = _1544 + _3006;
            float _3010 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _3012 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _3010;
            float _3014 = 1.0 / _3012;
            float _3016 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _3018 = _3016 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _3020 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _3022 = _3020 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _3024 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _3026 = _3024 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _3028 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _3030 = _3028 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _3032 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _3034 = _3032 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _3036 = _3008 * _3014;
            float _3038 = precise::clamp(_3036, 0.0, 1.0);
            float _3040 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _3042 = _3040 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _3044 = fma(_3038, _3018, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _3046 = fma(_3038, _3042, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _3048 = fma(_3038, _3022, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _3050 = fma(_3038, _3026, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _3052 = fma(_3038, _3030, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _3054 = fma(_3038, _3034, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            _2960 = _3046;
            _2986 = _3052;
            _2974 = _3044;
            _2980 = _3050;
            _2968 = _3048;
            _2994 = _3054;
            _3056 = true;
        }
        else
        {
            bool _3058 = _1544 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _3060 = isnan(_1544);
            bool _3062 = _3058 || _3060;
            bool _3064 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _3066 = _3062 || _3064;
            if (!_3066)
            {
                _2972 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _3068 = _2972;
            _2974 = _3068;
            if (!_3066)
            {
                _2958 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _3070 = _2958;
            _2960 = _3070;
            if (!_3066)
            {
                _2966 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _3072 = _2966;
            _2968 = _3072;
            if (!_3066)
            {
                _2978 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _3074 = _2978;
            _2980 = _3074;
            if (!_3066)
            {
                _2984 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _3076 = _2984;
            _2986 = _3076;
            if (!_3066)
            {
                _2992 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _3078 = _2992;
            bool _3080 = !_3066;
            _2994 = _3078;
            if (!_3080)
            {
                bool _3082 = _1544 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _3084 = isnan(_1544);
                bool _3086 = _3082 || _3084;
                bool _3088 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _3090 = _3086 || _3088;
                if (!_3090)
                {
                    float _3092 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _3094 = _1544 + _3092;
                    float _3096 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _3098 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _3096;
                    float _3100 = 1.0 / _3098;
                    float _3102 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _3104 = _3102 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _3106 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _3108 = _3106 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _3110 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _3112 = _3110 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _3114 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _3116 = _3114 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _3118 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _3120 = _3118 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _3122 = _3094 * _3100;
                    float _3124 = precise::clamp(_3122, 0.0, 1.0);
                    float _3126 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _3128 = _3126 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _3130 = fma(_3124, _3104, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _3132 = fma(_3124, _3128, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _3134 = fma(_3124, _3108, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _3136 = fma(_3124, _3112, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _3138 = fma(_3124, _3116, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _3140 = fma(_3124, _3120, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    _2960 = _3132;
                    _2986 = _3138;
                    _2974 = _3130;
                    _2980 = _3136;
                    _2968 = _3134;
                    _2994 = _3140;
                    _3056 = true;
                }
                else
                {
                    _2960 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _2986 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _2974 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _2980 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _2968 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _2994 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _3056 = false;
    float _3142 = _2960;
    float _3144 = _2986;
    float _3146 = _2974;
    float _3148 = _2980;
    float _3150 = _2968;
    float _3152 = _2994;
    float _3154 = _2964 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _3156 = fma(_2786, -0.5, 0.5);
    float _3158 = precise::clamp(_3156, 0.0, 1.0);
    float _3160 = -_3142;
    float _3162 = _3160 + _3144;
    float _3164 = -_3146;
    float _3166 = _3164 + _3148;
    out.m_49.x = _3154;
    float _3168 = fma(_3158, _3162, _3142);
    float _3170 = -_3150;
    float _3172 = _3170 + _3152;
    float _3174 = fma(_3158, _3166, _3146);
    float _3176 = _3168 * 0.586610972881317138671875;
    bool _3178 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _3180 = fma(_3158, _3172, _3150);
    out.m_95.x = 0.0;
    float _3182 = fma(_3174, 0.298911988735198974609375, _3176);
    bool _3184 = _1452 > 0.0;
    bool _3186 = isnan(_1452);
    bool _3188 = _3184 || _3186;
    bool _3190 = isnan(0.0);
    bool _3192 = _3188 || _3190;
    float _3194 = fma(_3180, 0.114477999508380889892578125, _3182);
    bool _3196 = _1506 <= 0.0;
    bool _3198 = !_3192;
    bool _3200 = _3196 || _3198;
    float _3202 = -_3194;
    float _3204 = _3174 + _3202;
    float _3206 = -_3194;
    float _3208 = _3168 + _3206;
    float _3210 = -_3194;
    float _3212 = _3180 + _3210;
    float _3214 = fma(_3204, (*spvDescriptorSet0.vp_c13)._m0[1].z, _3194);
    float _3216 = fma(_3208, (*spvDescriptorSet0.vp_c13)._m0[1].z, _3194);
    float _3218 = fma(_3212, (*spvDescriptorSet0.vp_c13)._m0[1].z, _3194);
    bool _3220 = !_3178;
    if (!_3220)
    {
        float _3222 = -_1388;
        float _3224 = _3222 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
        float _3226 = -_1390;
        float _3228 = _3226 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
        float _3230 = -_1392;
        float _3232 = _3230 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
        float _3234 = _3224 * _3224;
        float _3236 = fma(_3228, _3228, _3234);
        float _3238 = fma(_3232, _3232, _3236);
        float _3240 = sqrt(_3238);
        float _3242 = rsqrt(_3238);
        float _3244 = -_3240;
        float _3246 = _3244 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
        float _3248 = _3246 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
        float _3250 = precise::clamp(_3248, 0.0, 1.0);
        float _3252 = _3228 * _3242;
        float _3254 = _3224 * _3242;
        float _3256 = abs(_3250);
        float _3258 = log2(_3256);
        float _3260 = _3232 * _3242;
        float _3262 = _3252 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
        float _3264 = _2786 * _3254;
        float _3266 = -_3254;
        float _3268 = -_3262;
        float _3270 = fma(_3266, (*spvDescriptorSet0.vp_c15)._m0[656].y, _3268);
        float _3272 = fma(_2782, _3252, _3264);
        float _3274 = -_3260;
        float _3276 = fma(_3274, (*spvDescriptorSet0.vp_c15)._m0[656].z, _3270);
        float _3278 = fma(_2802, _3260, _3272);
        float _3280 = precise::clamp(_3278, 0.0, 1.0);
        float _3282 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
        float _3284 = _3276 + _3282;
        float _3286 = _3258 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
        float _3288 = _3284 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
        float _3290 = precise::clamp(_3288, 0.0, 1.0);
        float _3292 = exp2(_3286);
        float _3294 = _3292 * _3290;
        float _3296 = _3280 * _3294;
        float _3298 = _3296 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
        float _3300 = _3296 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
        float _3302 = _3296 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
        out.m_95.x = _3298;
        out.m_95.y = _3300;
        out.m_95.z = _3302;
    }
    out.m_67.x = _3214;
    out.m_67.y = _3216;
    out.m_67.z = _3218;
    if (!_3200)
    {
        return out;
    }
    out.m_49.x = 0.0;
    float _3304 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _3304;
    return out;
}


struct dm_geometry_capture { device uint* dst; uint4 info; uint stride; short slot[144]; };
static inline void dm_cw(constant dm_geometry_capture& g, device uint* p, uint k, uint v) { short s = g.slot[k]; if (s >= 0) p[s] = v; }
vertex void main0_gs(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], uint dm_vid [[vertex_id]], uint dm_iid [[instance_id]], constant dm_geometry_capture& dm_gs [[buffer(13)]])
{
    uint4 dm_ci = dm_gs.info; device uint* dm_capture = dm_gs.dst;
    if (dm_vid - dm_ci.x >= dm_ci.y || dm_iid - dm_ci.z >= dm_ci.w) return;
    device uint* dm_p = dm_capture + ((ulong(dm_iid - dm_ci.z) * dm_ci.y + dm_vid - dm_ci.x) * dm_gs.stride);

    main0_out out = {};
    out.m_59 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_81 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_91 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_65 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_67 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_87 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_77 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_71 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_85 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_95 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_89 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_93 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_49 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_69 = float4(0.0, 0.0, 0.0, 1.0);
    bool _3056 = false;
    bool _484 = false;
    bool _342 = false;
    bool _216 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _109 = in.m_46.w;
    float _111 = trunc(_109);
    int _114 = int(_111);
    bool _118 = _114 >= 1;
    float _120 = 0.0;
    if (!_118)
    {
        _120 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _122 = _120;
    float _124 = _122;
    if (!_118)
    {
        out.m_49.x = 0.0;
    }
    int _126 = 0;
    if (!_118)
    {
        float _128 = _122 * 5.0;
        _126 = as_type<int>(_128);
    }
    int _130 = _126;
    int _132 = _130;
    if (!_118)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _3361 = as_type<float>(_130);
        out.gl_Position.z = _3361;
    }
    if (!_118)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_59.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_59.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_59.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_59.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_81.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_81.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_81.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_81.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_91.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_91.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_91.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_91.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_65.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_65.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_65.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_65.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_67.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_67.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_67.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_67.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_87.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_87.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_87.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_87.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_77.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_77.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_77.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_77.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_71.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_71.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_71.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_71.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_85.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_85.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_85.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_85.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_95.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_95.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_95.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_95.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_89.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_89.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_89.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_89.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_93.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_93.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_93.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_93.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_49.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_49.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_49.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_49.w)); dm_cw(dm_gs, dm_p, 68, as_type<uint>(out.m_69.x)); dm_cw(dm_gs, dm_p, 69, as_type<uint>(out.m_69.y)); dm_cw(dm_gs, dm_p, 70, as_type<uint>(out.m_69.z)); dm_cw(dm_gs, dm_p, 71, as_type<uint>(out.m_69.w)); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _134 = in.m_51.w;
    bool _136 = _134 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _138 = isnan(_134);
    bool _140 = _136 || _138;
    bool _142 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _144 = _140 || _142;
    float _146 = -_134;
    float _148 = _146 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    float _150 = 0.0;
    float _152 = _148;
    if (_144)
    {
        float _154 = float(_114);
        _150 = _154;
    }
    float _156 = _150;
    bool _158 = _148 >= _156;
    bool _160 = !_144;
    bool _162 = _158 || _160;
    if (_162)
    {
        _124 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _164 = _124;
    if (_162)
    {
        out.m_49.x = 0.0;
    }
    if (_162)
    {
        float _166 = _164 * 5.0;
        _132 = as_type<int>(_166);
    }
    int _168 = _132;
    if (_162)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _3430 = as_type<float>(_168);
        out.gl_Position.z = _3430;
    }
    if (_162)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_59.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_59.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_59.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_59.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_81.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_81.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_81.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_81.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_91.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_91.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_91.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_91.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_65.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_65.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_65.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_65.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_67.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_67.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_67.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_67.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_87.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_87.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_87.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_87.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_77.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_77.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_77.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_77.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_71.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_71.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_71.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_71.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_85.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_85.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_85.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_85.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_95.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_95.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_95.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_95.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_89.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_89.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_89.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_89.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_93.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_93.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_93.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_93.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_49.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_49.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_49.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_49.w)); dm_cw(dm_gs, dm_p, 68, as_type<uint>(out.m_69.x)); dm_cw(dm_gs, dm_p, 69, as_type<uint>(out.m_69.y)); dm_cw(dm_gs, dm_p, 70, as_type<uint>(out.m_69.z)); dm_cw(dm_gs, dm_p, 71, as_type<uint>(out.m_69.w)); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _170 = in.m_53.x;
    float _172 = in.m_53.y;
    float _174 = in.m_53.z;
    bool _176 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _178 = _172 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _180 = _172 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _182 = _172 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _184 = fma(_170, (*spvDescriptorSet0.vp_c10)._m0[4].x, _178);
    float _186 = fma(_170, (*spvDescriptorSet0.vp_c10)._m0[5].x, _180);
    float _188 = fma(_170, (*spvDescriptorSet0.vp_c10)._m0[6].x, _182);
    float _190 = fma(_174, (*spvDescriptorSet0.vp_c10)._m0[4].z, _184);
    float _192 = fma(_174, (*spvDescriptorSet0.vp_c10)._m0[5].z, _186);
    float _194 = fma(_174, (*spvDescriptorSet0.vp_c10)._m0[6].z, _188);
    bool _196 = !_176;
    float _214;
    if (!_196)
    {
        float _198 = in.m_55.x;
        float _200 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _202 = _198 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _204 = fma(_202, (*spvDescriptorSet0.vp_c9)._m0[12].x, _148);
        float _206 = _204 * _200;
        float _208 = floor(_206);
        float _210 = -_208;
        float _212 = _206 + _210;
        _214 = _212;
        _216 = true;
    }
    else
    {
        float _218 = float(_114);
        float _220 = 1.0 / _218;
        float _222 = _148 * _220;
        _214 = _222;
    }
    _216 = false;
    float _224 = _214;
    float _226 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _228 = _224 + _226;
    bool _230 = _224 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _232 = isnan(_224);
    bool _234 = _230 || _232;
    bool _236 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _238 = _234 || _236;
    float _240 = float(_238);
    float _242 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _244 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _242;
    float _246 = 1.0 / _244;
    bool _248 = _224 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _250 = isnan(_224);
    bool _252 = _248 || _250;
    bool _254 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _256 = _252 || _254;
    float _258 = float(_256);
    float _260 = -_240;
    float _262 = _260 + 1.0;
    float _264 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _266 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _264;
    float _268 = -(*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _270 = (*spvDescriptorSet0.vp_c9)._m0[144].z + _268;
    bool _272 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _274 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _276 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _274;
    float _278 = _258 * _262;
    float _280 = -_258;
    float _282 = _280 + 1.0;
    float _284 = _228 * _246;
    float _286 = in.m_57.x;
    float _288 = in.m_57.y;
    float _290 = in.m_57.z;
    float _292 = fma(_266, _284, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _294 = fma(_276, _284, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _296 = fma(_270, _284, (*spvDescriptorSet0.vp_c9)._m0[143].z);
    float _298 = _292 * _278;
    float _300 = _294 * _278;
    float _302 = _296 * _278;
    float _304 = fma(_282, (*spvDescriptorSet0.vp_c9)._m0[143].x, _298);
    float _306 = fma(_282, (*spvDescriptorSet0.vp_c9)._m0[143].y, _300);
    float _308 = fma(_282, (*spvDescriptorSet0.vp_c9)._m0[143].z, _302);
    float _310 = fma(_240, (*spvDescriptorSet0.vp_c9)._m0[144].x, _304);
    float _312 = fma(_240, (*spvDescriptorSet0.vp_c9)._m0[144].y, _306);
    float _314 = fma(_240, (*spvDescriptorSet0.vp_c9)._m0[144].z, _308);
    float _316 = _312 * _288;
    float _318 = _310 * _286;
    float _320 = _314 * _290;
    bool _322 = !_272;
    float _340;
    if (!_322)
    {
        float _324 = in.m_55.x;
        float _326 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _328 = _324 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _330 = fma(_328, (*spvDescriptorSet0.vp_c9)._m0[11].y, _148);
        float _332 = _330 * _326;
        float _334 = floor(_332);
        float _336 = -_334;
        float _338 = _332 + _336;
        _340 = _338;
        _342 = true;
    }
    else
    {
        float _344 = float(_114);
        float _346 = 1.0 / _344;
        float _348 = _148 * _346;
        _340 = _348;
    }
    _342 = false;
    float _350 = _340;
    float _352 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _354 = _350 + _352;
    float _356 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _358 = _356 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _360 = _350 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _362 = isnan(_350);
    bool _364 = _360 || _362;
    bool _366 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _368 = _364 || _366;
    float _370 = float(_368);
    float _372 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _374 = _372 + (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _376 = _350 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _378 = isnan(_350);
    bool _380 = _376 || _378;
    bool _382 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _384 = _380 || _382;
    float _386 = float(_384);
    float _388 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _390 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _388;
    bool _392 = _350 >= (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _394 = isnan(_350);
    bool _396 = _392 || _394;
    bool _398 = isnan((*spvDescriptorSet0.vp_c9)._m0[117].w);
    bool _400 = _396 || _398;
    float _402 = float(_400);
    float _404 = 1.0 / _358;
    float _406 = -_370;
    float _408 = _406 + 1.0;
    bool _410 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].w;
    float _412 = 1.0 / _374;
    float _414 = _390 * _404;
    float _416 = -(*spvDescriptorSet0.vp_c9)._m0[116].x;
    float _418 = _416 + (*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _420 = -_402;
    float _422 = _420 + 1.0;
    float _424 = fma(_414, _354, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _426 = _386 * _408;
    float _428 = -_386;
    float _430 = _428 + 1.0;
    float _432 = _370 * _422;
    float _434 = _418 * _412;
    float _436 = _424 * _426;
    float _438 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _440 = _350 + _438;
    float _442 = fma(_430, (*spvDescriptorSet0.vp_c9)._m0[115].x, _436);
    float _444 = fma(_434, _440, (*spvDescriptorSet0.vp_c9)._m0[116].x);
    float _446 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _448 = fma(_444, _432, _442);
    float _450 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _452 = _446 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _454 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _456 = fma(_402, (*spvDescriptorSet0.vp_c9)._m0[117].x, _448);
    float _458 = _450 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _460 = _454 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _462 = _456 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    out.m_59.x = _452;
    out.m_59.y = _458;
    out.m_59.z = _460;
    out.m_59.w = _462;
    bool _464 = !_410;
    float _482;
    if (!_464)
    {
        float _466 = in.m_55.x;
        float _468 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].w;
        float _470 = _466 * (*spvDescriptorSet0.vp_c9)._m0[13].x;
        float _472 = fma(_470, (*spvDescriptorSet0.vp_c9)._m0[11].w, _148);
        float _474 = _472 * _468;
        float _476 = floor(_474);
        float _478 = -_476;
        float _480 = _474 + _478;
        _482 = _480;
        _484 = true;
    }
    else
    {
        float _486 = float(_114);
        float _488 = 1.0 / _486;
        float _490 = _148 * _488;
        _482 = _490;
    }
    _484 = false;
    float _492 = _482;
    float _494 = in.m_55.x;
    float _496 = in.m_55.y;
    float _498 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _500 = log2(_498);
    float _502 = _316 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _504 = in.m_46.x;
    float _506 = in.m_46.y;
    float _508 = in.m_46.z;
    float _510 = _320 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _512 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    float _514 = in.m_55.z;
    float _516 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].y);
    int _518 = int(_516);
    float _520 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    bool _522 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _524 = isnan(0.0);
    bool _526 = _522 || _524;
    bool _528 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _530 = _526 || _528;
    float _532 = _500 * _148;
    float _534 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].x);
    int _536 = int(_534);
    float _538 = _494 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    float _540 = _496 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    float _542 = _494 * 2.0;
    float _544 = exp2(_532);
    float _546 = -_512;
    float _548 = fma(_538, 2.0, _546);
    float _550 = fma(_540, -2.0, _520);
    float _552 = _496 + _494;
    float _554 = _506 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _556 = _506 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _558 = _506 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _560 = _552 + (-1.0);
    float _562 = floor(_542);
    float _564 = _496 * 2.0;
    float _566 = fma(_504, (*spvDescriptorSet0.vp_c10)._m0[6].x, _558);
    float _568 = _514 * 2.0;
    float _570 = fma(_504, (*spvDescriptorSet0.vp_c10)._m0[4].x, _554);
    float _572 = fma(_504, (*spvDescriptorSet0.vp_c10)._m0[5].x, _556);
    float _574 = fma(_560, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    float _576 = _496 + _514;
    float _578 = floor(_564);
    float _580 = float(_518);
    float _582 = _576 + (-1.0);
    bool _584 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _586 = isnan(1.0);
    bool _588 = _584 || _586;
    bool _590 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _592 = _588 || _590;
    float _594 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _596 = 1.0 + _594;
    float _598 = -_544;
    float _600 = _598 + 1.0;
    bool _602 = _562 > 0.0;
    float _604 = floor(_568);
    float _606 = fma(_148, (*spvDescriptorSet0.vp_c9)._m0[76].y, _550);
    bool _608 = _562 >= 0.0;
    bool _610 = isnan(_562);
    bool _612 = _608 || _610;
    bool _614 = isnan(0.0);
    bool _616 = _612 || _614;
    float _618 = fma(_508, (*spvDescriptorSet0.vp_c10)._m0[5].z, _572);
    float _620 = _530 ? _600 : 0.0;
    float _622 = fma(_582, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    float _624 = 1.0 / _580;
    bool _626 = _578 > 0.0;
    float _628 = _618 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    bool _630 = _578 >= 0.0;
    bool _632 = isnan(_578);
    bool _634 = _630 || _632;
    bool _636 = isnan(0.0);
    bool _638 = _634 || _636;
    float _640 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    float _642 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    float _644 = float(_536);
    float _646 = 1.0 / _596;
    bool _648 = _604 > 0.0;
    float _650 = fma(_494, (*spvDescriptorSet0.vp_c9)._m0[78].z, _640);
    bool _652 = _604 >= 0.0;
    bool _654 = isnan(_604);
    bool _656 = _652 || _654;
    bool _658 = isnan(0.0);
    bool _660 = _656 || _658;
    float _662 = fma(_496, (*spvDescriptorSet0.vp_c9)._m0[78].w, _642);
    int _664 = _616 ? 0 : 1;
    float _666 = _644 * _148;
    int _668 = _660 ? 0 : 1;
    float _670 = _624 * _148;
    float _672 = -_148;
    float _674 = fma(_672, (*spvDescriptorSet0.vp_c9)._m0[76].x, _548);
    float _676 = fma(_148, (*spvDescriptorSet0.vp_c9)._m0[77].z, _650);
    int _678 = ~_664;
    int _680 = _678 + 1;
    int _682 = _680 + 1;
    float _684 = fma(_148, (*spvDescriptorSet0.vp_c9)._m0[77].w, _662);
    int _686 = _682;
    if (!_602)
    {
        int _688 = ~_664;
        int _690 = _688 + 1;
        _686 = _690;
    }
    int _692 = _686;
    float _694 = fma(_508, (*spvDescriptorSet0.vp_c10)._m0[6].z, _566);
    int _696 = _638 ? 0 : 1;
    if (_592)
    {
        float _698 = _620 * _646;
        _152 = _698;
    }
    float _700 = _152;
    int _702 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 16;
    bool _704 = _702 != 0;
    int _706 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 32;
    bool _708 = _706 != 0;
    int _710 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 64;
    bool _712 = _710 != 0;
    float _714 = fma(_508, (*spvDescriptorSet0.vp_c10)._m0[4].z, _570);
    int _716 = ~_696;
    int _718 = _716 + 1;
    int _720 = _718 + 1;
    float _722 = _694 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    int _724 = _720;
    if (!_626)
    {
        int _726 = ~_696;
        int _728 = _726 + 1;
        _724 = _728;
    }
    int _730 = _724;
    float _732 = _714 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    bool _734 = !_708;
    int _736 = _734 ? 0 : 1;
    float _738 = in.m_61.x;
    float _740 = in.m_61.y;
    float _742 = in.m_61.z;
    bool _744 = !_704;
    int _746 = _744 ? 0 : 1;
    float _748 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _750 = _732 + _748;
    bool _752 = !_712;
    int _754 = _752 ? 0 : 1;
    int _756 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _758 = _756 != 0;
    int _760 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _762 = _760 != 0;
    int _764 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _766 = _764 != 0;
    float _768 = float(_692);
    int _770 = ~_668;
    int _772 = _770 + 1;
    int _774 = _772 + 1;
    bool _776 = !_758;
    int _778 = _776 ? 0 : 1;
    bool _780 = !_762;
    int _782 = _780 ? 0 : 1;
    int _784 = abs(_778);
    float _786 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _788 = _628 + _786;
    int _790 = abs(_782);
    int _792 = _774;
    if (!_648)
    {
        int _794 = ~_668;
        int _796 = _794 + 1;
        _792 = _796;
    }
    int _798 = _792;
    float _800 = _788 * _788;
    float _802 = float(_790);
    float _804 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _806 = _722 + _804;
    float _808 = fma(_750, _750, _800);
    float _810 = _802 * _768;
    float _812 = float(_784);
    float _814 = fma(_806, _806, _808);
    float _816 = float(_798);
    float _818 = _810 * (-2.0);
    float _820 = _496 + (-0.5);
    float _822 = sqrt(_814);
    bool _824 = !_766;
    int _826 = _824 ? 0 : 1;
    float _828 = fma(_818, _740, _740);
    float _830 = fma(_622, _818, _622);
    float _832 = _812 * _816;
    int _834 = abs(_826);
    float _836 = fma(_820, (*spvDescriptorSet0.vp_c9)._m0[196].y, _828);
    float _838 = _318 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _840 = rsqrt(_814);
    float _842 = float(_730);
    float _844 = _514 + _494;
    float _846 = float(_834);
    float _848 = _838 * (*spvDescriptorSet0.vp_c13)._m0[2].y;
    float _850 = _832 * (-2.0);
    float _852 = _844 + (-1.0);
    float _854 = _514 + (-0.5);
    float _856 = _822 * (*spvDescriptorSet0.vp_c13)._m0[2].x;
    float _858 = _846 * _842;
    float _860 = fma(_852, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _862 = _494 + (-0.5);
    float _864 = fma(_850, _738, _738);
    float _866 = precise::min(_848, _856);
    float _868 = _858 * (-2.0);
    float _870 = fma(_574, _850, _574);
    float _872 = fma(_862, (*spvDescriptorSet0.vp_c9)._m0[196].x, _864);
    float _874 = fma(_830, _700, _836);
    float _876 = _840 * _866;
    float _878 = fma(_860, _868, _860);
    float _880 = fma(_868, _742, _742);
    float _882 = fma(_870, _700, _872);
    float _884 = _788 * _876;
    float _886 = _874 * 0.15915493667125701904296875;
    float _888 = fma(_854, (*spvDescriptorSet0.vp_c9)._m0[196].z, _880);
    float _890 = _750 * _876;
    float _892 = -_884;
    float _894 = _788 + _892;
    float _896 = _882 * 0.15915493667125701904296875;
    float _898 = _806 * _876;
    float _900 = -_890;
    float _902 = _750 + _900;
    float _904 = _894 * _894;
    float _906 = fma(_878, _700, _888);
    float _908 = -_898;
    float _910 = _806 + _908;
    float _912 = _886 * 6.283185482025146484375;
    float _914 = sin(_912);
    float _916 = fma(_902, _902, _904);
    float _918 = _906 * 0.15915493667125701904296875;
    float _920 = in.m_63.x;
    float _922 = in.m_63.y;
    float _924 = in.m_63.z;
    float _926 = fma(_910, _910, _916);
    float _928 = _886 * 6.283185482025146484375;
    float _930 = cos(_928);
    float _932 = sqrt(_926);
    float _934 = _896 * 6.283185482025146484375;
    float _936 = sin(_934);
    float _938 = _896 * 6.283185482025146484375;
    float _940 = cos(_938);
    float _942 = _840 * _932;
    float _944 = _502 * _942;
    float _946 = _838 * _942;
    float _948 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _922);
    float _950 = _918 * 6.283185482025146484375;
    float _952 = cos(_950);
    float _954 = _936 * _914;
    float _956 = _936 * _930;
    float _958 = _944 * _948;
    float _960 = _510 * _942;
    float _962 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _924);
    float _964 = _918 * 6.283185482025146484375;
    float _966 = sin(_964);
    float _968 = _940 * _930;
    float _970 = _940 * _914;
    float _972 = _960 * _962;
    float _974 = _936 * _952;
    float _976 = _930 * _952;
    float _978 = _940 * _952;
    float _980 = _914 * _952;
    float _982 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _920);
    float _984 = _978 * _958;
    float _986 = fma(_966, _968, _954);
    float _988 = _946 * _982;
    float _990 = -_956;
    float _992 = fma(_966, _970, _990);
    float _994 = -_958;
    float _996 = _966 * _994;
    float _998 = -_970;
    float _1000 = fma(_966, _956, _998);
    float _1002 = fma(_986, _988, _984);
    float _1004 = _974 * _958;
    float _1006 = fma(_976, _988, _996);
    float _1008 = fma(_966, _954, _968);
    float _1010 = fma(_992, _972, _1002);
    float _1012 = fma(_1000, _988, _1004);
    float _1014 = fma(_980, _972, _1006);
    float _1016 = _1010 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _1018 = fma(_1008, _972, _1012);
    float _1020 = _1010 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _1022 = _1010 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _1024 = fma(_1014, (*spvDescriptorSet0.vp_c8)._m0[26].x, _1016);
    float _1026 = fma(_1014, (*spvDescriptorSet0.vp_c8)._m0[24].x, _1020);
    float _1028 = fma(_1018, (*spvDescriptorSet0.vp_c8)._m0[26].z, _1024);
    float _1030 = fma(_1018, (*spvDescriptorSet0.vp_c8)._m0[24].z, _1026);
    float _1032 = _1028 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _1034 = _1030 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _1036 = _722 + _1032;
    float _1038 = _732 + _1034;
    float _1040 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1042 = _1036 + _1040;
    float _1044 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1046 = _1038 + _1044;
    float _1048 = _1042 * _1042;
    float _1050 = fma(_1046, _1046, _1048);
    float _1052 = fma(_1014, (*spvDescriptorSet0.vp_c8)._m0[25].x, _1022);
    float _1054 = -_884;
    float _1056 = _628 + _1054;
    float _1058 = -_890;
    float _1060 = _732 + _1058;
    float _1062 = sqrt(_1050);
    float _1064 = fma(_1018, (*spvDescriptorSet0.vp_c8)._m0[25].z, _1052);
    float _1066 = _1056 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _1068 = -_898;
    float _1070 = _722 + _1068;
    float _1072 = _1064 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _1074 = fma(_1060, (*spvDescriptorSet0.vp_c8)._m0[11].x, _1066);
    float _1076 = _628 + _1072;
    float _1078 = fma(_1070, (*spvDescriptorSet0.vp_c8)._m0[11].z, _1074);
    bool _1080 = _1062 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1082 = _1072;
    float _1084 = _1074;
    float _1086 = _1038;
    float _1088 = _898;
    float _1090 = _884;
    float _1092 = _890;
    float _1094 = _1050;
    float _1096 = _920;
    if (!_1080)
    {
        _1082 = _1036;
    }
    float _1098 = _1082;
    float _1100 = _1098;
    if (!_1080)
    {
        _1084 = _1076;
    }
    float _1102 = _1084;
    bool _1104 = !_1080;
    float _1106 = _1102;
    if (!_1104)
    {
        float _1108 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1110 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1112 = _1062 + _1110;
        float _1114 = _1076 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1116 = rsqrt(_1050);
        float _1118 = _1112 * _1108;
        float _1120 = _1118 * 0.15915493667125701904296875;
        float _1122 = _1120 * 6.283185482025146484375;
        float _1124 = sin(_1122);
        float _1126 = _1120 * 6.283185482025146484375;
        float _1128 = cos(_1126);
        float _1130 = fma(_1124, _1114, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1132 = _1116 * _1130;
        float _1134 = _1128 + (-1.0);
        float _1136 = fma(_1046, _1132, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1138 = fma(_1042, _1132, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        float _1140 = _1134 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1142 = fma(_1076, _1128, _1140);
        _1106 = _1142;
        _1086 = _1136;
        _1100 = _1138;
    }
    float _1144 = _1106;
    float _1146 = _1086;
    float _1148 = _1100;
    float _1150 = -_628;
    float _1152 = _1150 + _1144;
    float _1154 = _1078 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _1156 = -_732;
    float _1158 = _1156 + _1146;
    float _1160 = -_722;
    float _1162 = _1160 + _1148;
    float _1164 = _1152 * _1152;
    float _1166 = 1.0 / _1154;
    float _1168 = -_890;
    float _1170 = _1168 + _1146;
    float _1172 = fma(_1158, _1158, _1164);
    float _1174 = _1056 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _1176 = -_898;
    float _1178 = _1176 + _1148;
    float _1180 = fma(_1162, _1162, _1172);
    float _1182 = fma(_1060, (*spvDescriptorSet0.vp_c8)._m0[10].x, _1174);
    bool _1184 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[660].y;
    bool _1186 = isnan(0.5);
    bool _1188 = _1184 || _1186;
    bool _1190 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _1192 = _1188 || _1190;
    float _1194 = sqrt(_1180);
    float _1196 = fma(_1070, (*spvDescriptorSet0.vp_c8)._m0[10].z, _1182);
    bool _1198 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[653].w;
    bool _1200 = isnan(0.5);
    bool _1202 = _1198 || _1200;
    bool _1204 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _1206 = _1202 || _1204;
    float _1208 = _1196 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _1210 = _1208 + _1154;
    float _1212 = -_884;
    float _1214 = _1212 + _1144;
    float _1216 = _1210 * _1166;
    float _1218 = _1216 * 0.5;
    bool _1220 = _1194 > 0.0;
    float _1222 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _1224 = fma(_1218, (*spvDescriptorSet0.vp_c8)._m0[30].w, _1222);
    float _1226 = 1.0 / _1224;
    float _1228 = _1194;
    float _1230 = _1144;
    float _1232 = _1224;
    float _1234 = _1166;
    float _1236 = _1178;
    if (!_1220)
    {
        _1088 = _1170;
    }
    float _1238 = _1088;
    float _1240 = _1238;
    if (!_1220)
    {
        _1090 = _1214;
    }
    float _1242 = _1090;
    float _1244 = _1242;
    if (!_1220)
    {
        _1228 = _1178;
    }
    float _1246 = _1228;
    bool _1248 = !_1220;
    float _1250 = _1246;
    float _1252 = _1246;
    if (!_1248)
    {
        float _1254 = _192 * _192;
        float _1256 = fma(_190, _190, _1254);
        float _1258 = fma(_194, _194, _1256);
        float _1260 = rsqrt(_1180);
        float _1262 = sqrt(_1258);
        float _1264 = _1152 * _1260;
        float _1266 = _1158 * _1260;
        float _1268 = _1162 * _1260;
        bool _1270 = _1262 > 0.0;
        float _1272 = _1262;
        float _1274 = _1260;
        _1092 = _1258;
        _1230 = _1266;
        _1232 = _1264;
        if (!_1270)
        {
            _1272 = _1170;
        }
        float _1276 = _1272;
        _1240 = _1276;
        if (!_1270)
        {
            _1274 = _1214;
        }
        float _1278 = _1274;
        _1244 = _1278;
        if (!_1270)
        {
            _1250 = _1178;
        }
        float _1280 = _1250;
        bool _1282 = !_1270;
        _1252 = _1280;
        if (!_1282)
        {
            float _1284 = rsqrt(_1258);
            float _1286 = 1.0 / (*spvDescriptorSet0.vp_c10)._m0[2].z;
            float _1288 = _192 * _1284;
            float _1290 = _190 * _1284;
            float _1292 = _194 * _1284;
            float _1294 = _1264 * _1288;
            float _1296 = fma(_1266, _1290, _1294);
            float _1298 = _1286 * (*spvDescriptorSet0.vp_c9)._m0[142].x;
            float _1300 = fma(_1268, _1292, _1296);
            float _1302 = _1300 * _1298;
            float _1304 = fma(_190, _1302, _1170);
            float _1306 = fma(_192, _1302, _1214);
            float _1308 = fma(_194, _1302, _1178);
            _1240 = _1304;
            _1244 = _1306;
            _1252 = _1308;
        }
    }
    float _1310 = _1240;
    float _1312 = _1244;
    float _1314 = _1252;
    float _1316 = _1092;
    float _1318 = _1230;
    float _1320 = _1232;
    float _1322 = _1312;
    float _1324 = _1310;
    float _1326 = _1314;
    float _1328 = _1320;
    float _1330 = _1316;
    float _1332 = _1318;
    if (_1206)
    {
        _1234 = 1.0;
    }
    float _1334 = _1234;
    float _1336 = _1334;
    if (!_1192)
    {
        float _1338 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
        float _1340 = _1056 + _1338;
        float _1342 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
        float _1344 = _1060 + _1342;
        float _1346 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1348 = _1340 * _1340;
        float _1350 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
        float _1352 = _1070 + _1350;
        float _1354 = fma(_1344, _1344, _1348);
        float _1356 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _1358 = fma(_1352, _1352, _1354);
        float _1360 = sqrt(_1358);
        float _1362 = _1346 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1364 = precise::min(_1360, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _1366 = _1364 * _1356;
        float _1368 = -_1060;
        float _1370 = _1368 + _1310;
        float _1372 = _1362 * _1366;
        float _1374 = -_1056;
        float _1376 = _1374 + _1312;
        float _1378 = -_1070;
        float _1380 = _1378 + _1314;
        float _1382 = fma(_1370, _1372, _1060);
        float _1384 = fma(_1376, _1372, _1056);
        float _1386 = fma(_1380, _1372, _1070);
        _1322 = _1384;
        _1324 = _1382;
        _1326 = _1386;
    }
    float _1388 = _1322;
    float _1390 = _1324;
    float _1392 = _1326;
    if (_1206)
    {
        _1328 = 1.0;
    }
    float _1394 = _1328;
    float _1396 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _1398 = _1226 * _1396;
    float _1400 = _1394;
    if (!_1206)
    {
        float _1402 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1404 = _1402 * 0.15915493667125701904296875;
        float _1406 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1408 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1410 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _1408;
        float _1412 = _1404 * 6.283185482025146484375;
        float _1414 = cos(_1412);
        float _1416 = _1406 * 0.15915493667125701904296875;
        float _1418 = _1404 * 6.283185482025146484375;
        float _1420 = sin(_1418);
        float _1422 = 1.0 / _1414;
        float _1424 = _1416 * 6.283185482025146484375;
        float _1426 = cos(_1424);
        float _1428 = _1420 * _1422;
        float _1430 = _1416 * 6.283185482025146484375;
        float _1432 = sin(_1430);
        float _1434 = _1426 * _1428;
        float _1436 = 1.0 / _1410;
        float _1438 = 1.0 / _1434;
        float _1440 = _1432 * _1438;
        float _1442 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1444 = fma(_1398, _1440, _1442);
        float _1446 = _1444 * _1436;
        float _1448 = precise::clamp(_1446, 0.0, 1.0);
        _1330 = _1416;
        _1336 = _1448;
    }
    float _1450 = _1330;
    float _1452 = _1336;
    if (!_1206)
    {
        float _1454 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1456 = _1454 * 0.15915493667125701904296875;
        float _1458 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1460 = _1456 * 6.283185482025146484375;
        float _1462 = cos(_1460);
        float _1464 = _1458 * 0.15915493667125701904296875;
        float _1466 = _1456 * 6.283185482025146484375;
        float _1468 = sin(_1466);
        float _1470 = 1.0 / _1462;
        float _1472 = _1464 * 6.283185482025146484375;
        float _1474 = cos(_1472);
        float _1476 = _1468 * _1470;
        float _1478 = _1464 * 6.283185482025146484375;
        float _1480 = sin(_1478);
        float _1482 = _1474 * _1476;
        float _1484 = 1.0 / _1482;
        float _1486 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _1488 = (*spvDescriptorSet0.vp_c9)._m0[140].w + _1486;
        float _1490 = 1.0 / _1488;
        float _1492 = _1480 * _1484;
        float _1494 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _1496 = fma(_1398, _1492, _1494);
        float _1498 = _1496 * _1490;
        float _1500 = precise::clamp(_1498, 0.0, 1.0);
        float _1502 = -_1500;
        float _1504 = _1502 + 1.0;
        _1400 = _1504;
    }
    float _1506 = _1400;
    float _1508 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1510 = _1388 + _1508;
    float _1512 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1514 = _1390 + _1512;
    float _1516 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1518 = _1392 + _1516;
    float _1520 = _1388 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1522 = _1510 * _1510;
    float _1524 = _1388 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1526 = fma(_1390, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1520);
    float _1528 = fma(_1514, _1514, _1522);
    float _1530 = fma(_1390, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1524);
    float _1532 = fma(_1392, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1526);
    float _1534 = fma(_1518, _1518, _1528);
    float _1536 = fma(_1392, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1530);
    float _1538 = _1532 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1540 = rsqrt(_1534);
    float _1542 = _1536 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1544 = sqrt(_1534);
    float _1546 = _1540 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1548 = _1514 * _1546;
    float _1550 = _1518 * _1546;
    float _1552 = _1548 * _1548;
    float _1554 = _1550 * _1550;
    float _1556 = _1552 + _1554;
    float _1558 = sqrt(_1556);
    bool _1560 = _1558 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1562 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1564 = _1558 + _1562;
    float _1566 = _1522;
    float _1568 = _1556;
    float _1570 = _1564;
    float _1572 = _1548;
    float _1574 = _1550;
    float _1576 = _1552;
    if (_1560)
    {
        float _1578 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1566 = _1578;
    }
    float _1580 = _1566;
    if (_1560)
    {
        float _1582 = rsqrt(_1556);
        _1568 = _1582;
    }
    float _1584 = _1568;
    float _1586 = _1584;
    if (_1560)
    {
        float _1588 = _1564 * _1580;
        _1570 = _1588;
    }
    float _1590 = _1570;
    if (_1560)
    {
        float _1592 = _1590 * 0.15915493667125701904296875;
        _1094 = _1592;
    }
    float _1594 = _1094;
    float _1596 = _1580;
    if (_1560)
    {
        float _1598 = _1594 * 6.283185482025146484375;
        float _1600 = sin(_1598);
        _1596 = _1600;
    }
    float _1602 = _1596;
    float _1604 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _1606 = precise::max(0.0, _1604);
    float _1608 = _1450;
    if (_1560)
    {
        float _1610 = _1594 * 6.283185482025146484375;
        float _1612 = cos(_1610);
        _1608 = _1612;
    }
    float _1614 = _1608;
    float _1616 = -_1546;
    float _1618 = -_1606;
    float _1620 = fma(_1510, _1616, _1618);
    if (_1560)
    {
        float _1622 = _1620 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1236 = _1622;
    }
    float _1624 = _1236;
    float _1626 = _1538 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _1628 = fma(_1060, (*spvDescriptorSet0.vp_c15)._m0[652].x, (*spvDescriptorSet0.vp_c15)._m0[652].z);
    float _1630 = _1602;
    float _1632 = _1624;
    if (_1560)
    {
        float _1634 = fma(_1602, _1624, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1332 = _1634;
    }
    float _1636 = _1332;
    float _1638 = _1636;
    if (!_1560)
    {
        _1630 = _1620;
    }
    float _1640 = _1630;
    float _1642 = floor(_1628);
    float _1644 = _1640;
    float _1646 = _1614;
    if (_1560)
    {
        float _1648 = _1614 + (-1.0);
        _1632 = _1648;
    }
    float _1650 = _1632;
    if (_1560)
    {
        float _1652 = _1584 * _1636;
        _1638 = _1652;
    }
    float _1654 = _1638;
    if (_1560)
    {
        float _1656 = _1650 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1586 = _1656;
    }
    float _1658 = _1586;
    if (_1560)
    {
        float _1660 = _1548 * _1654;
        _1572 = _1660;
    }
    float _1662 = _1572;
    if (_1560)
    {
        float _1664 = _1550 * _1654;
        _1574 = _1664;
    }
    float _1666 = _1574;
    if (_1560)
    {
        float _1668 = fma(_1620, _1614, _1658);
        _1644 = _1668;
    }
    float _1670 = _1644;
    if (_1560)
    {
        float _1672 = _1662 * _1662;
        _1576 = _1672;
    }
    float _1674 = _1576;
    if (!_1560)
    {
        _1646 = _1554;
    }
    float _1676 = _1646;
    float _1678 = _1676;
    if (_1560)
    {
        float _1680 = _1666 * _1666;
        _1678 = _1680;
    }
    float _1682 = _1678;
    float _1684 = _1388 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1686 = fma(_1670, _1670, _1674);
    float _1688 = fma(_1390, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1684);
    float _1690 = _1686 + _1682;
    float _1692 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _1694 = _1388 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1696 = fma(_1392, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1688);
    float _1698 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _1700 = fma(_1544, (*spvDescriptorSet0.vp_c15)._m0[23].w, _1698);
    float _1702 = precise::clamp(_1700, 0.0, 1.0);
    float _1704 = fma(_1390, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1694);
    float _1706 = _1696 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1708 = rsqrt(_1690);
    float _1710 = -_1702;
    float _1712 = _1710 + 1.0;
    float _1714 = fma(_1392, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1704);
    float _1716 = -_1626;
    float _1718 = fma(_1716, _1692, 1.0);
    float _1720 = fma(_1070, (*spvDescriptorSet0.vp_c15)._m0[652].y, (*spvDescriptorSet0.vp_c15)._m0[652].w);
    float _1722 = _1706 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1724 = _1714 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1726 = _1706 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1728 = abs(_1712);
    float _1730 = log2(_1728);
    float _1732 = fma(_1724, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1726);
    float _1734 = fma(_1538, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1732);
    float _1736 = _1708 * _1662;
    float _1738 = _1708 * _1670;
    float _1740 = floor(_1720);
    float _1742 = fma(_1542, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1734);
    float _1744 = _1736 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _1746 = _1708 * _1666;
    float _1748 = -_1642;
    float _1750 = _1628 + _1748;
    float _1752 = _1706 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1754 = -_1744;
    float _1756 = fma(_1738, (*spvDescriptorSet0.vp_c15)._m0[21].y, _1754);
    float _1758 = _1730 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _1760 = log2(_1718);
    float _1762 = fma(_1724, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1752);
    float _1764 = -_1746;
    float _1766 = fma(_1764, (*spvDescriptorSet0.vp_c15)._m0[21].z, _1756);
    float _1768 = fma(_1538, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1762);
    float _1770 = fma(_1766, -0.5, 0.5);
    float _1772 = fma(_1766, 0.5, 0.5);
    float _1774 = 1.0 / _1742;
    float _1776 = -_1740;
    float _1778 = _1720 + _1776;
    float _1780 = fma(_1724, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1722);
    float _1782 = fma(_1772, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _1784 = fma(_1542, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1768);
    float _1786 = _1738 + 1.0;
    float _1788 = fma(_1538, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1780);
    float _1790 = fma(_1772, _1782, -0.212114393711090087890625);
    float _1792 = exp2(_1758);
    float _1794 = _1760 * 0.693147182464599609375;
    float _1796 = fma(_1542, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1788);
    float _1798 = fma(_1772, _1790, 1.570728778839111328125);
    float _1800 = _1794 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _1802 = sqrt(_1770);
    float _1804 = _1784 * _1774;
    float _1806 = _1796 * _1774;
    float _1808 = -_1738;
    float _1810 = fma(_1792, _1786, _1808);
    float2 _5983 = float2(_1750, _1778);
    float _1812 = dm_bs(spvDescriptorSet0.vp_t_tcb_24.sample(spvDescriptorSet0.vp_t_tcb_24Smplr, select(_5983, float2(0.0), isnan(_5983)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_24, spvDescriptorSet0.vp_t_tcb_24Smplr_w, select(_5983, float2(0.0), isnan(_5983)), level(0.0)).x;
    float _1814 = fma(_1810, 0.5, 0.5);
    float _1816 = _1802 * 0.636619746685028076171875;
    float _1818 = fma(_1804, 0.5, 0.5);
    float _1820 = fma(_1806, -0.5, 0.5);
    float _1822 = -_1798;
    float _1824 = fma(_1816, _1822, 1.0);
    float3 _6008 = float3(_1818, _1820, _1800);
    float _1826 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_6008, float3(0.0), isnan(_6008)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_6008, float3(0.0), isnan(_6008)), level(0.0)).x;
    float3 _6019 = float3(_1818, _1820, _1800);
    float4 _1829 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_6019, float3(0.0), isnan(_6019)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_6019, float3(0.0), isnan(_6019)), level(0.0)).xyzw;
    float _1831 = _1829.x;
    float _1833 = _1829.y;
    float _1835 = _1829.z;
    float _1837 = _1829.w;
    float2 _6035 = float2(_1824, _1814);
    float3 _1841 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_6035, float2(0.0), isnan(_6035)), level(0.0)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_6035, float2(0.0), isnan(_6035)), level(0.0)).xyz;
    float _1843 = _1841.x;
    float _1845 = _1841.y;
    float _1847 = _1841.z;
    float _1849 = float(uint(_536));
    float _1851 = trunc(_670);
    int _1853 = int(_1851);
    bool _1855 = _536 == 0;
    out.m_65.x = _1060;
    out.m_65.y = _1056;
    out.m_65.z = _1070;
    int _1857 = abs(_754);
    float _1859 = _1730 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    bool _1861 = _496 > 0.5;
    out.m_67.w = _866;
    float _1863 = 1.0 / _1849;
    int _1865 = ~_536;
    int _1867 = _1865 + 1;
    out.m_69.x = _946;
    float _1869 = float(_114);
    out.m_71.x = _1390;
    out.m_71.y = _1388;
    out.m_71.z = _1392;
    float _1871 = float(uint(_1853));
    float _1873 = 1.0 / _1869;
    int _1875 = as_type<int>(_1863) + (-2);
    float _1877 = exp2(_1859);
    float _1879 = as_type<float>(_1875) * _1871;
    int _1881 = ~_536;
    int _1883 = _1881 + 1;
    float _1885 = trunc(_1879);
    float _1887 = precise::max(_1885, 0.0);
    uint _1890 = uint(_1887);
    float _1892 = -(*spvDescriptorSet0.vp_c9)._m0[133].x;
    float _1894 = (*spvDescriptorSet0.vp_c9)._m0[134].x + _1892;
    float _1896 = -_1877;
    float _1898 = _1896 + 1.0;
    int _1900 = _1867 * int(_1890);
    int _1902 = _1900 + _1853;
    float _1904 = float(uint(_1902));
    float _1906 = as_type<float>(_1875) * _1904;
    int _1908 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _1910 = _1908 != 0;
    float _1912 = float(_1853);
    float _1914 = trunc(_1906);
    float _1916 = precise::max(_1914, 0.0);
    uint _1918 = uint(_1916);
    bool _1920 = !_1910;
    float _1922 = _1920 ? 7.345489978790283203125 : 1.0;
    bool _1924 = _1912 >= _644;
    bool _1926 = isnan(_1912);
    bool _1928 = _1924 || _1926;
    bool _1930 = isnan(_644);
    bool _1932 = _1928 || _1930;
    float _1934 = float(_1932);
    float _1936 = _1922 * _494;
    float _1938 = trunc(_1934);
    int _1940 = int(_1938);
    int _1942 = int(_1890) + int(_1918);
    float _1944 = floor(_1936);
    int _1946 = _1883 * _1942;
    int _1948 = _1946 + _1853;
    bool _1950 = uint(_1948) >= uint(_536);
    bool _1952 = !_1950;
    int _1954 = _1952 ? 0 : (-1);
    float _1956 = -_1944;
    float _1958 = _1936 + _1956;
    int _1960 = ~_1942;
    int _1962 = _1960 + _1954;
    int _1964 = _1962 + 1;
    float _1966 = _666 * _1873;
    int _1968 = ~_1940;
    int _1970 = _1968 + 1;
    int _1972 = _1970 + 1;
    float _1974 = _1958 * _644;
    int _1976 = _536 * _1964;
    int _1978 = _1976 + _1853;
    int _1980 = _536 + (-1);
    float _1982 = trunc(_1966);
    int _1984 = int(_1982);
    int _1986 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4096;
    bool _1988 = _1986 != 0;
    bool _1990 = !_1855;
    int _1992 = _1990 ? _1978 : (-1);
    float _1994 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _1996 = _492 + _1994;
    bool _1998 = !_1988;
    int _2000 = _1998 ? 0 : 1;
    int _2002 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 128;
    bool _2004 = _2002 != 0;
    float _2006 = trunc(_1974);
    int _2008 = int(_2006);
    int _2010 = _1992 * _1972;
    int _2012 = abs(_2000);
    int _2014 = abs(_736);
    int _2016 = _1940 * _1980;
    int _2018 = _2016 + _2010;
    bool _2020 = !_2004;
    int _2022 = _2020 ? 0 : 1;
    int _2024 = _2018 * _2014;
    int _2026 = abs(_746);
    int _2028 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _2030 = _2028 != 0;
    int _2032 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _2034 = _2032 != 0;
    int _2036 = _1984 * _2026;
    int _2038 = _2036 + _2024;
    int _2040 = _2008 * _2012;
    int _2042 = _2040 + _1853;
    int _2044 = abs(_2022);
    float _2046 = in.m_73.x;
    int _2048 = _2042 * _1857;
    int _2050 = _2048 + _2038;
    float _2052 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _2054 = _2052 + (*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _2056 = in.m_75.y;
    int _2058 = _2008 * _2044;
    int _2060 = _2058 + _2050;
    int _2062 = ~_536;
    int _2064 = _2062 + 1;
    float _2066 = 1.0 / _2054;
    float _2068 = float(uint(_2060));
    float _2070 = as_type<float>(_1875) * _2068;
    float _2072 = trunc(_2070);
    float _2074 = precise::max(_2072, 0.0);
    uint _2076 = uint(_2074);
    out.m_77.x = _2046;
    int _2078 = _2064 * int(_2076);
    int _2080 = _2078 + _2060;
    float _2082 = float(uint(_2080));
    int _2084 = ~_536;
    int _2086 = _2084 + 1;
    float _2088 = as_type<float>(_1875) * _2082;
    float _2090 = trunc(_2088);
    float _2092 = precise::max(_2090, 0.0);
    uint _2094 = uint(_2092);
    int _2096 = int(_2076) + int(_2094);
    float _2098 = in.m_73.y;
    int _2100 = _2086 * _2096;
    int _2102 = _2100 + _2060;
    float _2104 = in.m_73.z;
    bool _2106 = uint(_2102) >= uint(_536);
    float _2108 = in.m_73.w;
    bool _2110 = !_2106;
    int _2112 = _2110 ? 0 : (-1);
    int _2114 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2097152;
    bool _2116 = _2114 != 0;
    float _2118 = -(*spvDescriptorSet0.vp_c9)._m0[131].x;
    float _2120 = (*spvDescriptorSet0.vp_c9)._m0[132].x + _2118;
    int _2122 = ~_2096;
    int _2124 = _2122 + _2112;
    int _2126 = _2124 + 1;
    float _2128 = -(*spvDescriptorSet0.vp_c9)._m0[132].x;
    float _2130 = _2128 + (*spvDescriptorSet0.vp_c9)._m0[133].x;
    float _2132 = _2120 * _2066;
    int _2134 = ~_536;
    int _2136 = _2134 + 1;
    int _2138 = _536 * _2126;
    int _2140 = _2138 + _2060;
    float _2142 = float(uint(_2042));
    float _2144 = -(*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _2146 = _2144 + (*spvDescriptorSet0.vp_c9)._m0[133].w;
    float _2148 = fma(_2132, _1996, (*spvDescriptorSet0.vp_c9)._m0[131].x);
    out.m_77.y = _2098;
    bool _2150 = !_1855;
    int _2152 = _2150 ? _2140 : (-1);
    float _2154 = as_type<float>(_1875) * _2142;
    float _2156 = 1.0 / _2146;
    float _2158 = -_2056;
    float _2160 = _2158 + 1.0;
    int _2162 = _2152 >> 31;
    out.m_77.z = _2104;
    int _2164 = _2152 & 3;
    bool _2166 = _2164 != 0;
    int _2168 = _2162 & 3;
    out.m_77.w = _2108;
    float _2170 = trunc(_2154);
    float _2172 = precise::max(_2170, 0.0);
    uint _2174 = uint(_2172);
    float _2176 = _2056;
    float _2178 = _1742;
    float _2180 = _1796;
    float _2182 = _1784;
    if (_2034)
    {
        float _2184 = _1861 ? _2160 : _2056;
        _2176 = _2184;
    }
    float _2186 = _2176;
    int _2188 = _2152 + _2168;
    bool _2190 = _492 >= (*spvDescriptorSet0.vp_c9)._m0[134].w;
    bool _2192 = isnan(_492);
    bool _2194 = _2190 || _2192;
    bool _2196 = isnan((*spvDescriptorSet0.vp_c9)._m0[134].w);
    bool _2198 = _2194 || _2196;
    float _2200 = float(_2198);
    int _2202 = _2188 >> 2;
    float _2204 = _2130 * _2156;
    float _2206 = -_2200;
    float _2208 = _2206 + 1.0;
    int _2210 = _2202 << 4;
    int _2212 = _2210 + 368;
    bool _2214 = _492 >= (*spvDescriptorSet0.vp_c9)._m0[133].w;
    bool _2216 = isnan(_492);
    bool _2218 = _2214 || _2216;
    bool _2220 = isnan((*spvDescriptorSet0.vp_c9)._m0[133].w);
    bool _2222 = _2218 || _2220;
    float _2224 = float(_2222);
    float _2226 = -(*spvDescriptorSet0.vp_c9)._m0[133].w;
    float _2228 = _2226 + (*spvDescriptorSet0.vp_c9)._m0[134].w;
    int _2230 = _2136 * int(_2174);
    int _2232 = _2230 + _2042;
    uint _2234 = uint(int(uint(_2212) >> uint(2)));
    uint _2236 = uint(int(uint(int(_2234)) >> uint(2)));
    int _2238 = int(_2234) & 3;
    float _2240 = (*spvDescriptorSet0.vp_c9)._m0[int(_2236)][_2238];
    int _2242 = int(_2234) + 1;
    uint _2244 = uint(int(uint(_2242) >> uint(2)));
    int _2246 = _2242 & 3;
    float _2248 = (*spvDescriptorSet0.vp_c9)._m0[int(_2244)][_2246];
    float _2250 = -_2224;
    float _2252 = _2250 + 1.0;
    float _2254 = 1.0 / _2228;
    float _2256 = float(uint(_2232));
    float _2258 = _2224 * _2208;
    bool _2260 = _492 >= (*spvDescriptorSet0.vp_c9)._m0[132].w;
    bool _2262 = isnan(_492);
    bool _2264 = _2260 || _2262;
    bool _2266 = isnan((*spvDescriptorSet0.vp_c9)._m0[132].w);
    bool _2268 = _2264 || _2266;
    float _2270 = float(_2268);
    int _2272 = _2152 & 3;
    bool _2274 = _2272 != 0;
    float _2276 = as_type<float>(_1875) * _2256;
    bool _2278 = _492 >= (*spvDescriptorSet0.vp_c9)._m0[131].w;
    bool _2280 = isnan(_492);
    bool _2282 = _2278 || _2280;
    bool _2284 = isnan((*spvDescriptorSet0.vp_c9)._m0[131].w);
    bool _2286 = _2282 || _2284;
    float _2288 = float(_2286);
    float _2290 = _2270 * _2252;
    float _2292 = -_2270;
    float _2294 = _2292 + 1.0;
    bool _2296 = uint(_2272) > 1u;
    int _2298 = _2212 + 8;
    uint _2300 = uint(int(uint(_2298) >> uint(2)));
    uint _2302 = uint(int(uint(int(_2300)) >> uint(2)));
    int _2304 = int(_2300) & 3;
    float _2306 = (*spvDescriptorSet0.vp_c9)._m0[int(_2302)][_2304];
    int _2308 = int(_2300) + 1;
    uint _2310 = uint(int(uint(_2308) >> uint(2)));
    int _2312 = _2308 & 3;
    float _2314 = (*spvDescriptorSet0.vp_c9)._m0[int(_2310)][_2312];
    float _2316 = trunc(_2276);
    float _2318 = precise::max(_2316, 0.0);
    uint _2320 = uint(_2318);
    float _2322 = _2288 * _2294;
    int _2324 = _2166 ? 0 : 1;
    float _2326 = -_2288;
    float _2328 = _2326 + 1.0;
    float _2330 = _1894 * _2254;
    float _2332 = _2148 * _2322;
    float _2334 = -(*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _2336 = _492 + _2334;
    float _2338 = -(*spvDescriptorSet0.vp_c9)._m0[133].w;
    float _2340 = _492 + _2338;
    int _2342 = ~_2324;
    int _2344 = _2342 + 1;
    int _2346 = _2344 + 1;
    float _2348 = fma(_2328, (*spvDescriptorSet0.vp_c9)._m0[131].x, _2332);
    bool _2350 = uint(_2272) >= 2u;
    float _2352 = fma(_2204, _2336, (*spvDescriptorSet0.vp_c9)._m0[132].x);
    int _2354 = _2346;
    if (!_2296)
    {
        int _2356 = ~_2324;
        int _2358 = _2356 + 1;
        _2354 = _2358;
    }
    int _2360 = _2354;
    float _2362 = fma(_2330, _2340, (*spvDescriptorSet0.vp_c9)._m0[133].x);
    bool _2364 = _2272 != 3;
    float _2366 = fma(_2352, _2290, _2348);
    int _2368 = ~_536;
    int _2370 = _2368 + 1;
    float _2372 = -_1812;
    float _2374 = _2372 + 1.0;
    int _2376 = int(_2174) + int(_2320);
    bool _2378 = !_2274;
    int _2380 = _2378 ? 0 : 1;
    int _2382 = abs(_2360);
    int _2384 = _2350 ? 0 : 1;
    int _2386 = abs(_2380);
    int _2388 = ~_2382;
    int _2390 = _2388 + 1;
    int _2392 = _2390 + 1;
    int _2394 = _2370 * _2376;
    int _2396 = _2394 + _2042;
    int _2398 = ~_2384;
    int _2400 = _2398 + 1;
    int _2402 = _2400 + 1;
    float _2404 = fma(_2362, _2258, _2366);
    int _2406 = _2402;
    if (_2364)
    {
        int _2408 = ~_2384;
        int _2410 = _2408 + 1;
        _2406 = _2410;
    }
    int _2412 = _2406;
    int _2414 = _2392 * as_type<int>(_2248);
    int _2416 = ~_2386;
    int _2418 = _2416 + 1;
    int _2420 = _2418 + 1;
    float _2422 = _978 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    int _2424 = abs(_2412);
    bool _2426 = _2272 != 3;
    int _2428 = _2420 * as_type<int>(_2240);
    int _2430 = _2428 + _2414;
    bool _2432 = uint(_2396) >= uint(_536);
    float _2434 = trunc((*spvDescriptorSet0.vp_c9)._m0[80].z);
    int _2436 = int(_2434);
    float _2438 = as_type<float>(_2396);
    if (_2030)
    {
        float _2440 = in.m_55.x;
        _2438 = _2440;
    }
    float _2442 = _2438;
    bool _2444 = !_2426;
    int _2446 = _2444 ? 0 : (-1);
    bool _2448 = !_2432;
    int _2450 = _2448 ? 0 : (-1);
    int _2452 = ~_2424;
    int _2454 = _2452 + 1;
    int _2456 = _2454 + 1;
    int _2458 = abs(_2446);
    bool _2460 = !_2116;
    int _2462 = _2460 ? 0 : 1;
    int _2464 = ~_2376;
    int _2466 = _2464 + _2450;
    int _2468 = _2466 + 1;
    int _2470 = _2456 * as_type<int>(_2306);
    int _2472 = _2470 + _2430;
    int _2474 = abs(_2462);
    float _2476 = in.m_75.x;
    int _2478 = ~_2458;
    int _2480 = _2478 + 1;
    int _2482 = _2480 + 1;
    int _2484 = _536 * _2468;
    int _2486 = _2484 + _2042;
    bool _2488 = _922 != 0.0;
    bool _2490 = isnan(_922);
    bool _2492 = _2488 || _2490;
    bool _2494 = isnan(0.0);
    bool _2496 = _2492 || _2494;
    float _2498 = in.m_79.x;
    float _2500 = in.m_79.y;
    float _2502 = in.m_79.z;
    int _2504 = ~_2474;
    int _2506 = _2504 + 1;
    int _2508 = _2506 + 1;
    int _2510 = _2482 * as_type<int>(_2314);
    int _2512 = _2510 + _2472;
    float _2514 = float(uint(_2436));
    int _2516 = abs(_2436);
    int _2518 = _2512 * _2508;
    bool _2520 = _920 == 0.0;
    bool _2522 = !_2496;
    bool _2524 = _2520 && _2522;
    bool _2526 = !_1855;
    int _2528 = _2526 ? _2486 : (-1);
    float _2530 = 1.0 / _2514;
    float _2532 = fma(_2200, (*spvDescriptorSet0.vp_c9)._m0[134].x, _2404);
    bool _2534 = _924 == 0.0;
    bool _2536 = _2534 && _2524;
    int _2538 = _2528 * _2474;
    int _2540 = _2538 + _2518;
    float _2542 = float(uint(_2516));
    float _2544 = _2532 * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    bool _2546 = _2442 > 0.5;
    bool _2548 = _2546 && _2030;
    float _2550 = _2442;
    if (_2030)
    {
        _2550 = _2476;
    }
    float _2552 = _2550;
    float _2554 = 1.0 / _2542;
    int _2556 = abs(_2540);
    float _2558 = _2498;
    float _2560 = _2502;
    float _2562 = _2552;
    float _2564 = _2500;
    if (!_2536)
    {
        float _2566 = fma(_920, (*spvDescriptorSet0.vp_c9)._m0[17].y, _2498);
        _2558 = _2566;
    }
    float _2568 = _2558;
    if (!_2030)
    {
        _1096 = _2476;
    }
    float _2570 = _1096;
    float _2572 = _2570;
    if (!_2536)
    {
        float _2574 = fma(_924, (*spvDescriptorSet0.vp_c9)._m0[17].y, _2502);
        _2560 = _2574;
    }
    float _2576 = _2560;
    int _2578 = as_type<int>(_2530) + (-2);
    if (_2548)
    {
        float _2580 = -_2552;
        float _2582 = _2580 + 1.0;
        _2562 = _2582;
    }
    float _2584 = _2562;
    float _2586 = float(uint(_2540));
    float _2588 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    if (!_2536)
    {
        float _2590 = fma(_922, (*spvDescriptorSet0.vp_c9)._m0[17].y, _2500);
        _2564 = _2590;
    }
    float _2592 = _2564;
    float _2594 = as_type<float>(_2578) * _2586;
    float _2596 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    int _2598 = as_type<int>(_2554) + (-2);
    float _2600 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _2602 = float(uint(_2556));
    float _2604 = trunc(_2594);
    float _2606 = precise::max(_2604, 0.0);
    uint _2608 = uint(_2606);
    float _2610 = _2588 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2612 = _2596 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2614 = _2600 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2616 = as_type<float>(_2598) * _2602;
    if (_2030)
    {
        _2572 = _2584;
    }
    float _2618 = _2572;
    float _2620 = _978 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    int _2622 = ~_2436;
    int _2624 = _2622 + 1;
    out.m_81.x = _2610;
    out.m_81.y = _2612;
    out.m_81.z = _2614;
    out.m_81.w = _2544;
    int _2626 = ~_2516;
    int _2628 = _2626 + 1;
    float _2630 = trunc(_2616);
    float _2632 = precise::max(_2630, 0.0);
    uint _2634 = uint(_2632);
    float _2636 = _978 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _2638 = -_966;
    float _2640 = fma(_2638, (*spvDescriptorSet0.vp_c8)._m0[24].x, _2620);
    float _2642 = fma(_974, (*spvDescriptorSet0.vp_c8)._m0[24].z, _2640);
    float _2644 = abs(_1398);
    float _2646 = log2(_2644);
    int _2648 = _2624 * int(_2608);
    int _2650 = _2648 + _2540;
    float _2652 = -_966;
    float _2654 = fma(_2652, (*spvDescriptorSet0.vp_c8)._m0[25].x, _2422);
    float _2656 = -_966;
    float _2658 = fma(_2656, (*spvDescriptorSet0.vp_c8)._m0[26].x, _2636);
    float _2660 = float(uint(_2650));
    float _2662 = fma(_974, (*spvDescriptorSet0.vp_c8)._m0[25].z, _2654);
    int _2664 = _2628 * int(_2634);
    int _2666 = _2664 + _2556;
    float _2668 = _986 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _2670 = _986 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _2672 = as_type<float>(_2578) * _2660;
    float _2674 = _986 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _2676 = float(uint(_2666));
    float _2678 = fma(_976, (*spvDescriptorSet0.vp_c8)._m0[24].x, _2668);
    float _2680 = fma(_976, (*spvDescriptorSet0.vp_c8)._m0[25].x, _2670);
    float _2682 = fma(_976, (*spvDescriptorSet0.vp_c8)._m0[26].x, _2674);
    float _2684 = trunc(_2672);
    float _2686 = precise::max(_2684, 0.0);
    uint _2688 = uint(_2686);
    float _2690 = as_type<float>(_2598) * _2676;
    float _2692 = _992 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _2694 = _992 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _2696 = _992 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _2698 = fma(_974, (*spvDescriptorSet0.vp_c8)._m0[26].z, _2658);
    float _2700 = fma(_980, (*spvDescriptorSet0.vp_c8)._m0[24].x, _2692);
    float _2702 = fma(_980, (*spvDescriptorSet0.vp_c8)._m0[25].x, _2694);
    float _2704 = trunc(_2690);
    float _2706 = precise::max(_2704, 0.0);
    uint _2708 = uint(_2706);
    float _2710 = fma(_980, (*spvDescriptorSet0.vp_c8)._m0[26].x, _2696);
    int _2712 = ~_2436;
    int _2714 = _2712 + 1;
    float _2716 = _2698 * _2592;
    float _2718 = _2646 * (*spvDescriptorSet0.vp_c15)._m0[654].z;
    int _2720 = ~_2516;
    int _2722 = _2720 + 1;
    float _2724 = _2642 * _2592;
    float _2726 = fma(_1000, (*spvDescriptorSet0.vp_c8)._m0[24].z, _2678);
    int _2728 = int(_2608) + int(_2688);
    float _2730 = _2662 * _2592;
    float _2732 = exp2(_2718);
    float _2734 = fma(_1008, (*spvDescriptorSet0.vp_c8)._m0[24].z, _2700);
    float _2736 = fma(_1008, (*spvDescriptorSet0.vp_c8)._m0[25].z, _2702);
    int _2738 = _2714 * _2728;
    int _2740 = _2738 + _2540;
    int _2742 = int(_2634) + int(_2708);
    float _2744 = fma(_1000, (*spvDescriptorSet0.vp_c8)._m0[25].z, _2680);
    float _2746 = fma(_1000, (*spvDescriptorSet0.vp_c8)._m0[26].z, _2682);
    bool _2748 = uint(_2740) >= uint(_2436);
    int _2750 = _2722 * _2742;
    int _2752 = _2750 + _2556;
    float _2754 = fma(_2726, _2568, _2724);
    float _2756 = fma(_2746, _2568, _2716);
    bool _2758 = !_2748;
    int _2760 = _2758 ? 0 : (-1);
    float _2762 = fma(_2744, _2568, _2730);
    bool _2764 = uint(_2752) >= uint(_2516);
    float _2766 = fma(_2732, (*spvDescriptorSet0.vp_c15)._m0[654].x, (*spvDescriptorSet0.vp_c15)._m0[654].y);
    float _2768 = precise::clamp(_2766, 0.0, 1.0);
    int _2770 = ~_2728;
    int _2772 = _2770 + _2760;
    int _2774 = _2772 + 1;
    float _2776 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    bool _2778 = !_2764;
    int _2780 = _2778 ? 0 : (-1);
    float _2782 = fma(_2734, _2576, _2754);
    bool _2784 = _2436 == 0;
    float _2786 = fma(_2736, _2576, _2762);
    int _2788 = _2540 ^ _2436;
    float _2790 = fma(_1008, (*spvDescriptorSet0.vp_c8)._m0[26].z, _2710);
    bool _2792 = _2436 == 0;
    int _2794 = _2436 * _2774;
    int _2796 = _2794 + _2540;
    float _2798 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    uint _2800 = uint(int(uint(_2788) >> uint(31)));
    float _2802 = fma(_2790, _2576, _2756);
    int _2804 = ~_2780;
    int _2806 = _2742 + _2804;
    int _2808 = _2806 + 1;
    float _2810 = fma(_2768, -2.0, 3.0);
    float _2812 = _2768 * _2768;
    int _2814 = ~int(_2800);
    int _2816 = _2814 + 1;
    float _2818 = _1706 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _2820 = _2776 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _2822 = _2812 * _2810;
    bool _2824 = !_2784;
    int _2826 = _2824 ? _2796 : (-1);
    float _2828 = fma(_1724, (*spvDescriptorSet0.vp_c8)._m0[6].x, _2818);
    int _2830 = _2808 ^ _2816;
    float _2832 = -_2822;
    float _2834 = _2832 + 1.0;
    float _2836 = float(_2826);
    float _2838 = fma(_2820, _2618, -0.5);
    float _2840 = _2798 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    int _2842 = ~_2816;
    int _2844 = _2842 + _2830;
    int _2846 = _2844 + 1;
    float _2848 = in.m_83.x;
    bool _2850 = _1398 <= 8000.0;
    bool _2852 = isnan(_1398);
    bool _2854 = _2850 || _2852;
    bool _2856 = isnan(8000.0);
    bool _2858 = _2854 || _2856;
    float _2860 = float(_2858);
    float _2862 = fma(_2834, (*spvDescriptorSet0.vp_c15)._m0[654].w, _2822);
    bool _2864 = !_2792;
    int _2866 = _2864 ? _2846 : (-1);
    float _2868 = fma(_2820, _2836, _674);
    float _2870 = fma(_2840, _2186, -0.5);
    float _2872 = _2860 * _2862;
    float _2874 = float(_2866);
    float _2876 = _1898 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _2878 = _2872 * (*spvDescriptorSet0.vp_c15)._m0[653].x;
    float _2880 = _1742 * 0.5;
    float _2882 = -_606;
    float _2884 = fma(_2840, _2874, _2882);
    float _2886 = fma(_676, _2838, _2868);
    float _2888 = _2374 * _2878;
    float _2890 = precise::clamp(_2888, 0.0, 1.0);
    float _2892 = _2876 * _1826;
    float _2894 = fma(_684, _2870, _2884);
    float _2896 = fma(_1796, -0.5, _2880);
    float _2898 = -_2890;
    float _2900 = fma(_2898, (*spvDescriptorSet0.vp_c15)._m0[653].y, 1.0);
    float _2902 = _2886 + 0.5;
    float _2904 = _2894 + 0.5;
    float _2906 = -_2876;
    float _2908 = _2906 + 1.0;
    float _2910 = _1837 * _2892;
    float _2912 = _1847 * _2892;
    float _2914 = _2900 * _2848;
    out.m_85.x = _2902;
    out.m_85.y = _2904;
    float _2916 = _1837 * _2908;
    float _2918 = fma(_1837, _2912, _1835);
    float _2920 = _2914 * (*spvDescriptorSet0.vp_c13)._m0[1].w;
    out.m_87.x = _2782;
    out.m_87.y = _2786;
    out.m_87.z = _2802;
    float _2922 = fma(_1538, (*spvDescriptorSet0.vp_c8)._m0[6].z, _2828);
    bool _2924 = _1544 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _2926 = isnan(_1544);
    bool _2928 = _2924 || _2926;
    bool _2930 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _2932 = _2928 || _2930;
    float _2934 = _1784 + _1742;
    out.m_89.x = _2920;
    float _2936 = fma(_1542, (*spvDescriptorSet0.vp_c8)._m0[6].w, _2922);
    float _2938 = fma(_1843, _2910, _1831);
    float _2940 = fma(_1845, _2910, _1833);
    float _2942 = _2936 + _1742;
    float _2944 = _2934 * 0.5;
    float _2946 = _1452 * _1506;
    out.m_91.x = _2938;
    out.m_91.y = _2940;
    out.m_91.z = _2918;
    out.m_91.w = _2916;
    float _2948 = _2942 * 0.5;
    out.gl_Position.x = _1784;
    out.gl_Position.y = _1796;
    out.gl_Position.z = _2936;
    out.gl_Position.w = _1742;
    out.m_93.x = _2944;
    out.m_93.y = _2896;
    out.m_93.z = _2948;
    out.m_93.w = _1742;
    float _2950 = _2936;
    float _2952 = _2944;
    float _2954 = _2946;
    if (!_2932)
    {
        _2178 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _2956 = _2178;
    float _2958 = _2956;
    float _2960 = _2956;
    if (!_2932)
    {
        _2950 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _2962 = _2950;
    float _2964 = _2946 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _2966 = _2962;
    float _2968 = _2962;
    if (!_2932)
    {
        _2952 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _2970 = _2952;
    float _2972 = _2970;
    float _2974 = _2970;
    if (!_2932)
    {
        _2180 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _2976 = _2180;
    float _2978 = _2976;
    float _2980 = _2976;
    if (!_2932)
    {
        _2182 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _2982 = _2182;
    float _2984 = _2982;
    float _2986 = _2982;
    if (!_2932)
    {
        _2954 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _2988 = _2954;
    bool _2990 = !_2932;
    float _2992 = _2988;
    float _2994 = _2988;
    if (!_2990)
    {
        bool _2996 = _1544 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _2998 = isnan(_1544);
        bool _3000 = _2996 || _2998;
        bool _3002 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _3004 = _3000 || _3002;
        if (!_3004)
        {
            float _3006 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _3008 = _1544 + _3006;
            float _3010 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _3012 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _3010;
            float _3014 = 1.0 / _3012;
            float _3016 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _3018 = _3016 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _3020 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _3022 = _3020 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _3024 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _3026 = _3024 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _3028 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _3030 = _3028 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _3032 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _3034 = _3032 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _3036 = _3008 * _3014;
            float _3038 = precise::clamp(_3036, 0.0, 1.0);
            float _3040 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _3042 = _3040 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _3044 = fma(_3038, _3018, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _3046 = fma(_3038, _3042, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _3048 = fma(_3038, _3022, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _3050 = fma(_3038, _3026, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _3052 = fma(_3038, _3030, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _3054 = fma(_3038, _3034, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            _2960 = _3046;
            _2986 = _3052;
            _2974 = _3044;
            _2980 = _3050;
            _2968 = _3048;
            _2994 = _3054;
            _3056 = true;
        }
        else
        {
            bool _3058 = _1544 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _3060 = isnan(_1544);
            bool _3062 = _3058 || _3060;
            bool _3064 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _3066 = _3062 || _3064;
            if (!_3066)
            {
                _2972 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _3068 = _2972;
            _2974 = _3068;
            if (!_3066)
            {
                _2958 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _3070 = _2958;
            _2960 = _3070;
            if (!_3066)
            {
                _2966 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _3072 = _2966;
            _2968 = _3072;
            if (!_3066)
            {
                _2978 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _3074 = _2978;
            _2980 = _3074;
            if (!_3066)
            {
                _2984 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _3076 = _2984;
            _2986 = _3076;
            if (!_3066)
            {
                _2992 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _3078 = _2992;
            bool _3080 = !_3066;
            _2994 = _3078;
            if (!_3080)
            {
                bool _3082 = _1544 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _3084 = isnan(_1544);
                bool _3086 = _3082 || _3084;
                bool _3088 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _3090 = _3086 || _3088;
                if (!_3090)
                {
                    float _3092 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _3094 = _1544 + _3092;
                    float _3096 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _3098 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _3096;
                    float _3100 = 1.0 / _3098;
                    float _3102 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _3104 = _3102 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _3106 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _3108 = _3106 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _3110 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _3112 = _3110 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _3114 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _3116 = _3114 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _3118 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _3120 = _3118 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _3122 = _3094 * _3100;
                    float _3124 = precise::clamp(_3122, 0.0, 1.0);
                    float _3126 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _3128 = _3126 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _3130 = fma(_3124, _3104, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _3132 = fma(_3124, _3128, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _3134 = fma(_3124, _3108, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _3136 = fma(_3124, _3112, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _3138 = fma(_3124, _3116, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _3140 = fma(_3124, _3120, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    _2960 = _3132;
                    _2986 = _3138;
                    _2974 = _3130;
                    _2980 = _3136;
                    _2968 = _3134;
                    _2994 = _3140;
                    _3056 = true;
                }
                else
                {
                    _2960 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _2986 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _2974 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _2980 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _2968 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _2994 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _3056 = false;
    float _3142 = _2960;
    float _3144 = _2986;
    float _3146 = _2974;
    float _3148 = _2980;
    float _3150 = _2968;
    float _3152 = _2994;
    float _3154 = _2964 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _3156 = fma(_2786, -0.5, 0.5);
    float _3158 = precise::clamp(_3156, 0.0, 1.0);
    float _3160 = -_3142;
    float _3162 = _3160 + _3144;
    float _3164 = -_3146;
    float _3166 = _3164 + _3148;
    out.m_49.x = _3154;
    float _3168 = fma(_3158, _3162, _3142);
    float _3170 = -_3150;
    float _3172 = _3170 + _3152;
    float _3174 = fma(_3158, _3166, _3146);
    float _3176 = _3168 * 0.586610972881317138671875;
    bool _3178 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _3180 = fma(_3158, _3172, _3150);
    out.m_95.x = 0.0;
    float _3182 = fma(_3174, 0.298911988735198974609375, _3176);
    bool _3184 = _1452 > 0.0;
    bool _3186 = isnan(_1452);
    bool _3188 = _3184 || _3186;
    bool _3190 = isnan(0.0);
    bool _3192 = _3188 || _3190;
    float _3194 = fma(_3180, 0.114477999508380889892578125, _3182);
    bool _3196 = _1506 <= 0.0;
    bool _3198 = !_3192;
    bool _3200 = _3196 || _3198;
    float _3202 = -_3194;
    float _3204 = _3174 + _3202;
    float _3206 = -_3194;
    float _3208 = _3168 + _3206;
    float _3210 = -_3194;
    float _3212 = _3180 + _3210;
    float _3214 = fma(_3204, (*spvDescriptorSet0.vp_c13)._m0[1].z, _3194);
    float _3216 = fma(_3208, (*spvDescriptorSet0.vp_c13)._m0[1].z, _3194);
    float _3218 = fma(_3212, (*spvDescriptorSet0.vp_c13)._m0[1].z, _3194);
    bool _3220 = !_3178;
    if (!_3220)
    {
        float _3222 = -_1388;
        float _3224 = _3222 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
        float _3226 = -_1390;
        float _3228 = _3226 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
        float _3230 = -_1392;
        float _3232 = _3230 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
        float _3234 = _3224 * _3224;
        float _3236 = fma(_3228, _3228, _3234);
        float _3238 = fma(_3232, _3232, _3236);
        float _3240 = sqrt(_3238);
        float _3242 = rsqrt(_3238);
        float _3244 = -_3240;
        float _3246 = _3244 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
        float _3248 = _3246 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
        float _3250 = precise::clamp(_3248, 0.0, 1.0);
        float _3252 = _3228 * _3242;
        float _3254 = _3224 * _3242;
        float _3256 = abs(_3250);
        float _3258 = log2(_3256);
        float _3260 = _3232 * _3242;
        float _3262 = _3252 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
        float _3264 = _2786 * _3254;
        float _3266 = -_3254;
        float _3268 = -_3262;
        float _3270 = fma(_3266, (*spvDescriptorSet0.vp_c15)._m0[656].y, _3268);
        float _3272 = fma(_2782, _3252, _3264);
        float _3274 = -_3260;
        float _3276 = fma(_3274, (*spvDescriptorSet0.vp_c15)._m0[656].z, _3270);
        float _3278 = fma(_2802, _3260, _3272);
        float _3280 = precise::clamp(_3278, 0.0, 1.0);
        float _3282 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
        float _3284 = _3276 + _3282;
        float _3286 = _3258 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
        float _3288 = _3284 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
        float _3290 = precise::clamp(_3288, 0.0, 1.0);
        float _3292 = exp2(_3286);
        float _3294 = _3292 * _3290;
        float _3296 = _3280 * _3294;
        float _3298 = _3296 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
        float _3300 = _3296 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
        float _3302 = _3296 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
        out.m_95.x = _3298;
        out.m_95.y = _3300;
        out.m_95.z = _3302;
    }
    out.m_67.x = _3214;
    out.m_67.y = _3216;
    out.m_67.z = _3218;
    if (!_3200)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_59.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_59.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_59.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_59.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_81.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_81.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_81.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_81.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_91.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_91.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_91.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_91.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_65.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_65.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_65.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_65.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_67.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_67.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_67.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_67.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_87.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_87.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_87.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_87.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_77.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_77.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_77.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_77.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_71.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_71.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_71.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_71.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_85.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_85.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_85.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_85.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_95.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_95.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_95.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_95.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_89.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_89.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_89.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_89.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_93.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_93.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_93.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_93.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_49.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_49.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_49.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_49.w)); dm_cw(dm_gs, dm_p, 68, as_type<uint>(out.m_69.x)); dm_cw(dm_gs, dm_p, 69, as_type<uint>(out.m_69.y)); dm_cw(dm_gs, dm_p, 70, as_type<uint>(out.m_69.z)); dm_cw(dm_gs, dm_p, 71, as_type<uint>(out.m_69.w)); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    out.m_49.x = 0.0;
    float _3304 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _3304;
    { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_59.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_59.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_59.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_59.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_81.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_81.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_81.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_81.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_91.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_91.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_91.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_91.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_65.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_65.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_65.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_65.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_67.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_67.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_67.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_67.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_87.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_87.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_87.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_87.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_77.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_77.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_77.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_77.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_71.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_71.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_71.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_71.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_85.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_85.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_85.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_85.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_95.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_95.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_95.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_95.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_89.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_89.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_89.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_89.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_93.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_93.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_93.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_93.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_49.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_49.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_49.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_49.w)); dm_cw(dm_gs, dm_p, 68, as_type<uint>(out.m_69.x)); dm_cw(dm_gs, dm_p, 69, as_type<uint>(out.m_69.y)); dm_cw(dm_gs, dm_p, 70, as_type<uint>(out.m_69.z)); dm_cw(dm_gs, dm_p, 71, as_type<uint>(out.m_69.w)); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
}

