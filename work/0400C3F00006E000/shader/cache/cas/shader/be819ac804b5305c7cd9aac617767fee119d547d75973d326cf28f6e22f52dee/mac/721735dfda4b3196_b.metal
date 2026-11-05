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
    float4 m_77 [[user(locn1)]];
    float4 m_87 [[user(locn2)]];
    float4 m_65 [[user(locn3)]];
    float4 m_67 [[user(locn4)]];
    float4 m_83 [[user(locn5)]];
    float4 m_71 [[user(locn7)]];
    float4 m_81 [[user(locn8)]];
    float4 m_91 [[user(locn9)]];
    float4 m_85 [[user(locn10)]];
    float4 m_89 [[user(locn11)]];
    float4 m_49 [[user(locn12)]];
    float4 m_69 [[user(locn13)]];
    float4 gl_Position [[position, invariant]];
    float gl_PointSize [[point_size]];
    float4 dm_pad6 [[user(locn6)]];
};

struct main0_in
{
    float4 m_79 [[attribute(0)]];
    float4 m_61 [[attribute(1)]];
    float4 m_53 [[attribute(2)]];
    float4 m_46 [[attribute(3)]];
    float4 m_51 [[attribute(4)]];
    float4 m_75 [[attribute(5)]];
    float4 m_63 [[attribute(6)]];
    float4 m_55 [[attribute(7)]];
    float4 m_57 [[attribute(8)]];
    float4 m_73 [[attribute(10)]];
};

vertex main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]])
{
    main0_out out = {};
    out.dm_pad6 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_59 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_77 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_87 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_65 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_67 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_83 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_71 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_81 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_91 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_85 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_89 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_49 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_69 = float4(0.0, 0.0, 0.0, 1.0);
    bool _3006 = false;
    bool _442 = false;
    bool _338 = false;
    bool _212 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _105 = in.m_46.w;
    float _107 = trunc(_105);
    int _110 = int(_107);
    bool _114 = _110 >= 1;
    float _116 = 0.0;
    if (!_114)
    {
        _116 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _118 = _116;
    float _120 = _118;
    if (!_114)
    {
        out.m_49.x = 0.0;
    }
    int _122 = 0;
    if (!_114)
    {
        float _124 = _118 * 5.0;
        _122 = as_type<int>(_124);
    }
    int _126 = _122;
    int _128 = _126;
    if (!_114)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _3311 = as_type<float>(_126);
        out.gl_Position.z = _3311;
    }
    if (!_114)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _130 = in.m_51.w;
    bool _132 = _130 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _134 = isnan(_130);
    bool _136 = _132 || _134;
    bool _138 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _140 = _136 || _138;
    float _142 = -_130;
    float _144 = _142 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    float _146 = 0.0;
    float _148 = _144;
    if (_140)
    {
        float _150 = float(_110);
        _146 = _150;
    }
    float _152 = _146;
    bool _154 = _144 >= _152;
    bool _156 = !_140;
    bool _158 = _154 || _156;
    if (_158)
    {
        _120 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _160 = _120;
    if (_158)
    {
        out.m_49.x = 0.0;
    }
    if (_158)
    {
        float _162 = _160 * 5.0;
        _128 = as_type<int>(_162);
    }
    int _164 = _128;
    if (_158)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _3380 = as_type<float>(_164);
        out.gl_Position.z = _3380;
    }
    if (_158)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _166 = in.m_53.x;
    float _168 = in.m_53.y;
    float _170 = in.m_53.z;
    bool _172 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _174 = _168 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _176 = _168 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _178 = _168 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _180 = fma(_166, (*spvDescriptorSet0.vp_c10)._m0[4].x, _174);
    float _182 = fma(_166, (*spvDescriptorSet0.vp_c10)._m0[5].x, _176);
    float _184 = fma(_166, (*spvDescriptorSet0.vp_c10)._m0[6].x, _178);
    float _186 = fma(_170, (*spvDescriptorSet0.vp_c10)._m0[4].z, _180);
    float _188 = fma(_170, (*spvDescriptorSet0.vp_c10)._m0[5].z, _182);
    float _190 = fma(_170, (*spvDescriptorSet0.vp_c10)._m0[6].z, _184);
    bool _192 = !_172;
    float _210;
    if (!_192)
    {
        float _194 = in.m_55.x;
        float _196 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _198 = _194 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _200 = fma(_198, (*spvDescriptorSet0.vp_c9)._m0[12].x, _144);
        float _202 = _200 * _196;
        float _204 = floor(_202);
        float _206 = -_204;
        float _208 = _202 + _206;
        _210 = _208;
        _212 = true;
    }
    else
    {
        float _214 = float(_110);
        float _216 = 1.0 / _214;
        float _218 = _144 * _216;
        _210 = _218;
    }
    _212 = false;
    float _220 = _210;
    float _222 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _224 = _220 + _222;
    bool _226 = _220 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _228 = isnan(_220);
    bool _230 = _226 || _228;
    bool _232 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _234 = _230 || _232;
    float _236 = float(_234);
    float _238 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _240 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _238;
    float _242 = 1.0 / _240;
    bool _244 = _220 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _246 = isnan(_220);
    bool _248 = _244 || _246;
    bool _250 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _252 = _248 || _250;
    float _254 = float(_252);
    float _256 = -_236;
    float _258 = _256 + 1.0;
    float _260 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _262 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _260;
    float _264 = -(*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _266 = (*spvDescriptorSet0.vp_c9)._m0[144].z + _264;
    bool _268 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _270 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _272 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _270;
    float _274 = _254 * _258;
    float _276 = -_254;
    float _278 = _276 + 1.0;
    float _280 = _224 * _242;
    float _282 = in.m_57.x;
    float _284 = in.m_57.y;
    float _286 = in.m_57.z;
    float _288 = fma(_262, _280, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _290 = fma(_272, _280, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _292 = fma(_266, _280, (*spvDescriptorSet0.vp_c9)._m0[143].z);
    float _294 = _288 * _274;
    float _296 = _290 * _274;
    float _298 = _292 * _274;
    float _300 = fma(_278, (*spvDescriptorSet0.vp_c9)._m0[143].x, _294);
    float _302 = fma(_278, (*spvDescriptorSet0.vp_c9)._m0[143].y, _296);
    float _304 = fma(_278, (*spvDescriptorSet0.vp_c9)._m0[143].z, _298);
    float _306 = fma(_236, (*spvDescriptorSet0.vp_c9)._m0[144].x, _300);
    float _308 = fma(_236, (*spvDescriptorSet0.vp_c9)._m0[144].y, _302);
    float _310 = fma(_236, (*spvDescriptorSet0.vp_c9)._m0[144].z, _304);
    float _312 = _308 * _284;
    float _314 = _306 * _282;
    float _316 = _310 * _286;
    bool _318 = !_268;
    float _336;
    if (!_318)
    {
        float _320 = in.m_55.x;
        float _322 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _324 = _320 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _326 = fma(_324, (*spvDescriptorSet0.vp_c9)._m0[11].y, _144);
        float _328 = _326 * _322;
        float _330 = floor(_328);
        float _332 = -_330;
        float _334 = _328 + _332;
        _336 = _334;
        _338 = true;
    }
    else
    {
        float _340 = float(_110);
        float _342 = 1.0 / _340;
        float _344 = _144 * _342;
        _336 = _344;
    }
    _338 = false;
    float _346 = _336;
    bool _348 = _346 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _350 = isnan(_346);
    bool _352 = _348 || _350;
    bool _354 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _356 = _352 || _354;
    float _358 = float(_356);
    float _360 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _362 = _360 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _364 = _346 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _366 = isnan(_346);
    bool _368 = _364 || _366;
    bool _370 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _372 = _368 || _370;
    float _374 = float(_372);
    float _376 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _378 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _376;
    float _380 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _382 = _346 + _380;
    float _384 = -_358;
    float _386 = _384 + 1.0;
    bool _388 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].w;
    float _390 = 1.0 / _362;
    float _392 = _374 * _386;
    float _394 = -_374;
    float _396 = _394 + 1.0;
    float _398 = _378 * _390;
    float _400 = fma(_398, _382, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _402 = _400 * _392;
    float _404 = fma(_396, (*spvDescriptorSet0.vp_c9)._m0[115].x, _402);
    float _406 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _408 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _410 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _412 = fma(_358, (*spvDescriptorSet0.vp_c9)._m0[116].x, _404);
    float _414 = _406 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _416 = _408 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _418 = _410 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _420 = _412 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    out.m_59.x = _414;
    out.m_59.y = _416;
    out.m_59.z = _418;
    out.m_59.w = _420;
    bool _422 = !_388;
    float _440;
    if (!_422)
    {
        float _424 = in.m_55.x;
        float _426 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].w;
        float _428 = _424 * (*spvDescriptorSet0.vp_c9)._m0[13].x;
        float _430 = fma(_428, (*spvDescriptorSet0.vp_c9)._m0[11].w, _144);
        float _432 = _430 * _426;
        float _434 = floor(_432);
        float _436 = -_434;
        float _438 = _432 + _436;
        _440 = _438;
        _442 = true;
    }
    else
    {
        float _444 = float(_110);
        float _446 = 1.0 / _444;
        float _448 = _144 * _446;
        _440 = _448;
    }
    _442 = false;
    float _450 = _440;
    float _452 = in.m_55.x;
    float _454 = in.m_55.y;
    float _456 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _458 = log2(_456);
    float _460 = _312 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _462 = in.m_46.x;
    float _464 = in.m_46.y;
    float _466 = in.m_46.z;
    float _468 = _316 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _470 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    float _472 = in.m_55.z;
    float _474 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].y);
    int _476 = int(_474);
    float _478 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    bool _480 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _482 = isnan(0.0);
    bool _484 = _480 || _482;
    bool _486 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _488 = _484 || _486;
    float _490 = _458 * _144;
    float _492 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].x);
    int _494 = int(_492);
    float _496 = _452 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    float _498 = _454 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    float _500 = _452 * 2.0;
    float _502 = exp2(_490);
    float _504 = -_470;
    float _506 = fma(_496, 2.0, _504);
    float _508 = fma(_498, -2.0, _478);
    float _510 = _454 + _452;
    float _512 = _464 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _514 = _464 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _516 = _464 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _518 = _510 + (-1.0);
    float _520 = floor(_500);
    float _522 = _454 * 2.0;
    float _524 = fma(_462, (*spvDescriptorSet0.vp_c10)._m0[6].x, _516);
    float _526 = _472 * 2.0;
    float _528 = fma(_462, (*spvDescriptorSet0.vp_c10)._m0[4].x, _512);
    float _530 = fma(_462, (*spvDescriptorSet0.vp_c10)._m0[5].x, _514);
    float _532 = fma(_518, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    float _534 = _454 + _472;
    float _536 = floor(_522);
    float _538 = float(_476);
    float _540 = _534 + (-1.0);
    bool _542 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _544 = isnan(1.0);
    bool _546 = _542 || _544;
    bool _548 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _550 = _546 || _548;
    float _552 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _554 = 1.0 + _552;
    float _556 = -_502;
    float _558 = _556 + 1.0;
    bool _560 = _520 > 0.0;
    float _562 = floor(_526);
    float _564 = fma(_144, (*spvDescriptorSet0.vp_c9)._m0[76].y, _508);
    bool _566 = _520 >= 0.0;
    bool _568 = isnan(_520);
    bool _570 = _566 || _568;
    bool _572 = isnan(0.0);
    bool _574 = _570 || _572;
    float _576 = fma(_466, (*spvDescriptorSet0.vp_c10)._m0[5].z, _530);
    float _578 = _488 ? _558 : 0.0;
    float _580 = fma(_540, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    float _582 = 1.0 / _538;
    bool _584 = _536 > 0.0;
    float _586 = _576 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    bool _588 = _536 >= 0.0;
    bool _590 = isnan(_536);
    bool _592 = _588 || _590;
    bool _594 = isnan(0.0);
    bool _596 = _592 || _594;
    float _598 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    float _600 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    float _602 = float(_494);
    float _604 = 1.0 / _554;
    bool _606 = _562 > 0.0;
    float _608 = fma(_452, (*spvDescriptorSet0.vp_c9)._m0[78].z, _598);
    bool _610 = _562 >= 0.0;
    bool _612 = isnan(_562);
    bool _614 = _610 || _612;
    bool _616 = isnan(0.0);
    bool _618 = _614 || _616;
    float _620 = fma(_454, (*spvDescriptorSet0.vp_c9)._m0[78].w, _600);
    int _622 = _574 ? 0 : 1;
    float _624 = _602 * _144;
    int _626 = _618 ? 0 : 1;
    float _628 = _582 * _144;
    float _630 = -_144;
    float _632 = fma(_630, (*spvDescriptorSet0.vp_c9)._m0[76].x, _506);
    float _634 = fma(_144, (*spvDescriptorSet0.vp_c9)._m0[77].z, _608);
    int _636 = ~_622;
    int _638 = _636 + 1;
    int _640 = _638 + 1;
    float _642 = fma(_144, (*spvDescriptorSet0.vp_c9)._m0[77].w, _620);
    int _644 = _640;
    if (!_560)
    {
        int _646 = ~_622;
        int _648 = _646 + 1;
        _644 = _648;
    }
    int _650 = _644;
    float _652 = fma(_466, (*spvDescriptorSet0.vp_c10)._m0[6].z, _524);
    int _654 = _596 ? 0 : 1;
    if (_550)
    {
        float _656 = _578 * _604;
        _148 = _656;
    }
    float _658 = _148;
    int _660 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 16;
    bool _662 = _660 != 0;
    int _664 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 32;
    bool _666 = _664 != 0;
    int _668 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 64;
    bool _670 = _668 != 0;
    float _672 = fma(_466, (*spvDescriptorSet0.vp_c10)._m0[4].z, _528);
    int _674 = ~_654;
    int _676 = _674 + 1;
    int _678 = _676 + 1;
    float _680 = _652 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    int _682 = _678;
    if (!_584)
    {
        int _684 = ~_654;
        int _686 = _684 + 1;
        _682 = _686;
    }
    int _688 = _682;
    float _690 = _672 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    bool _692 = !_666;
    int _694 = _692 ? 0 : 1;
    float _696 = in.m_61.x;
    float _698 = in.m_61.y;
    float _700 = in.m_61.z;
    bool _702 = !_662;
    int _704 = _702 ? 0 : 1;
    float _706 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _708 = _690 + _706;
    bool _710 = !_670;
    int _712 = _710 ? 0 : 1;
    int _714 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _716 = _714 != 0;
    int _718 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _720 = _718 != 0;
    int _722 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _724 = _722 != 0;
    float _726 = float(_650);
    int _728 = ~_626;
    int _730 = _728 + 1;
    int _732 = _730 + 1;
    bool _734 = !_716;
    int _736 = _734 ? 0 : 1;
    bool _738 = !_720;
    int _740 = _738 ? 0 : 1;
    int _742 = abs(_736);
    float _744 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _746 = _586 + _744;
    int _748 = abs(_740);
    int _750 = _732;
    if (!_606)
    {
        int _752 = ~_626;
        int _754 = _752 + 1;
        _750 = _754;
    }
    int _756 = _750;
    float _758 = _746 * _746;
    float _760 = float(_748);
    float _762 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _764 = _680 + _762;
    float _766 = fma(_708, _708, _758);
    float _768 = _760 * _726;
    float _770 = float(_742);
    float _772 = fma(_764, _764, _766);
    float _774 = float(_756);
    float _776 = _768 * (-2.0);
    float _778 = _454 + (-0.5);
    float _780 = sqrt(_772);
    bool _782 = !_724;
    int _784 = _782 ? 0 : 1;
    float _786 = fma(_776, _698, _698);
    float _788 = fma(_580, _776, _580);
    float _790 = _770 * _774;
    int _792 = abs(_784);
    float _794 = fma(_778, (*spvDescriptorSet0.vp_c9)._m0[196].y, _786);
    float _796 = _314 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _798 = rsqrt(_772);
    float _800 = float(_688);
    float _802 = _472 + _452;
    float _804 = float(_792);
    float _806 = _796 * (*spvDescriptorSet0.vp_c13)._m0[2].y;
    float _808 = _790 * (-2.0);
    float _810 = _802 + (-1.0);
    float _812 = _472 + (-0.5);
    float _814 = _780 * (*spvDescriptorSet0.vp_c13)._m0[2].x;
    float _816 = _804 * _800;
    float _818 = fma(_810, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _820 = _452 + (-0.5);
    float _822 = fma(_808, _696, _696);
    float _824 = precise::min(_806, _814);
    float _826 = _816 * (-2.0);
    float _828 = fma(_532, _808, _532);
    float _830 = fma(_820, (*spvDescriptorSet0.vp_c9)._m0[196].x, _822);
    float _832 = fma(_788, _658, _794);
    float _834 = _798 * _824;
    float _836 = fma(_818, _826, _818);
    float _838 = fma(_826, _700, _700);
    float _840 = fma(_828, _658, _830);
    float _842 = _746 * _834;
    float _844 = _832 * 0.15915493667125701904296875;
    float _846 = fma(_812, (*spvDescriptorSet0.vp_c9)._m0[196].z, _838);
    float _848 = _708 * _834;
    float _850 = -_842;
    float _852 = _746 + _850;
    float _854 = _840 * 0.15915493667125701904296875;
    float _856 = _764 * _834;
    float _858 = -_848;
    float _860 = _708 + _858;
    float _862 = _852 * _852;
    float _864 = fma(_836, _658, _846);
    float _866 = -_856;
    float _868 = _764 + _866;
    float _870 = _844 * 6.283185482025146484375;
    float _872 = sin(_870);
    float _874 = fma(_860, _860, _862);
    float _876 = _864 * 0.15915493667125701904296875;
    float _878 = in.m_63.x;
    float _880 = in.m_63.y;
    float _882 = in.m_63.z;
    float _884 = fma(_868, _868, _874);
    float _886 = _844 * 6.283185482025146484375;
    float _888 = cos(_886);
    float _890 = sqrt(_884);
    float _892 = _854 * 6.283185482025146484375;
    float _894 = sin(_892);
    float _896 = _854 * 6.283185482025146484375;
    float _898 = cos(_896);
    float _900 = _798 * _890;
    float _902 = _460 * _900;
    float _904 = _796 * _900;
    float _906 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _880);
    float _908 = _876 * 6.283185482025146484375;
    float _910 = cos(_908);
    float _912 = _894 * _872;
    float _914 = _894 * _888;
    float _916 = _902 * _906;
    float _918 = _468 * _900;
    float _920 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _882);
    float _922 = _876 * 6.283185482025146484375;
    float _924 = sin(_922);
    float _926 = _898 * _888;
    float _928 = _898 * _872;
    float _930 = _918 * _920;
    float _932 = _894 * _910;
    float _934 = _888 * _910;
    float _936 = _898 * _910;
    float _938 = _872 * _910;
    float _940 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _878);
    float _942 = _936 * _916;
    float _944 = fma(_924, _926, _912);
    float _946 = _904 * _940;
    float _948 = -_914;
    float _950 = fma(_924, _928, _948);
    float _952 = -_916;
    float _954 = _924 * _952;
    float _956 = -_928;
    float _958 = fma(_924, _914, _956);
    float _960 = fma(_944, _946, _942);
    float _962 = _932 * _916;
    float _964 = fma(_934, _946, _954);
    float _966 = fma(_924, _912, _926);
    float _968 = fma(_950, _930, _960);
    float _970 = fma(_958, _946, _962);
    float _972 = fma(_938, _930, _964);
    float _974 = _968 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _976 = fma(_966, _930, _970);
    float _978 = _968 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _980 = _968 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _982 = fma(_972, (*spvDescriptorSet0.vp_c8)._m0[26].x, _974);
    float _984 = fma(_972, (*spvDescriptorSet0.vp_c8)._m0[24].x, _978);
    float _986 = fma(_976, (*spvDescriptorSet0.vp_c8)._m0[26].z, _982);
    float _988 = fma(_976, (*spvDescriptorSet0.vp_c8)._m0[24].z, _984);
    float _990 = _986 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _992 = _988 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _994 = _680 + _990;
    float _996 = _690 + _992;
    float _998 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1000 = _994 + _998;
    float _1002 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1004 = _996 + _1002;
    float _1006 = _1000 * _1000;
    float _1008 = fma(_1004, _1004, _1006);
    float _1010 = fma(_972, (*spvDescriptorSet0.vp_c8)._m0[25].x, _980);
    float _1012 = -_842;
    float _1014 = _586 + _1012;
    float _1016 = -_848;
    float _1018 = _690 + _1016;
    float _1020 = sqrt(_1008);
    float _1022 = fma(_976, (*spvDescriptorSet0.vp_c8)._m0[25].z, _1010);
    float _1024 = _1014 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _1026 = -_856;
    float _1028 = _680 + _1026;
    float _1030 = _1022 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _1032 = fma(_1018, (*spvDescriptorSet0.vp_c8)._m0[11].x, _1024);
    float _1034 = _586 + _1030;
    float _1036 = fma(_1028, (*spvDescriptorSet0.vp_c8)._m0[11].z, _1032);
    bool _1038 = _1020 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1040 = _1030;
    float _1042 = _1032;
    float _1044 = _996;
    float _1046 = _856;
    float _1048 = _842;
    float _1050 = _848;
    float _1052 = _1008;
    float _1054 = _878;
    if (!_1038)
    {
        _1040 = _994;
    }
    float _1056 = _1040;
    float _1058 = _1056;
    if (!_1038)
    {
        _1042 = _1034;
    }
    float _1060 = _1042;
    bool _1062 = !_1038;
    float _1064 = _1060;
    if (!_1062)
    {
        float _1066 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1068 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1070 = _1020 + _1068;
        float _1072 = _1034 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1074 = rsqrt(_1008);
        float _1076 = _1070 * _1066;
        float _1078 = _1076 * 0.15915493667125701904296875;
        float _1080 = _1078 * 6.283185482025146484375;
        float _1082 = sin(_1080);
        float _1084 = _1078 * 6.283185482025146484375;
        float _1086 = cos(_1084);
        float _1088 = fma(_1082, _1072, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1090 = _1074 * _1088;
        float _1092 = _1086 + (-1.0);
        float _1094 = fma(_1004, _1090, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1096 = fma(_1000, _1090, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        float _1098 = _1092 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1100 = fma(_1034, _1086, _1098);
        _1064 = _1100;
        _1044 = _1094;
        _1058 = _1096;
    }
    float _1102 = _1064;
    float _1104 = _1044;
    float _1106 = _1058;
    float _1108 = -_586;
    float _1110 = _1108 + _1102;
    float _1112 = _1036 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _1114 = -_690;
    float _1116 = _1114 + _1104;
    float _1118 = -_680;
    float _1120 = _1118 + _1106;
    float _1122 = _1110 * _1110;
    float _1124 = 1.0 / _1112;
    float _1126 = -_848;
    float _1128 = _1126 + _1104;
    float _1130 = fma(_1116, _1116, _1122);
    float _1132 = _1014 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _1134 = -_856;
    float _1136 = _1134 + _1106;
    float _1138 = fma(_1120, _1120, _1130);
    float _1140 = fma(_1018, (*spvDescriptorSet0.vp_c8)._m0[10].x, _1132);
    bool _1142 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[660].y;
    bool _1144 = isnan(0.5);
    bool _1146 = _1142 || _1144;
    bool _1148 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _1150 = _1146 || _1148;
    float _1152 = sqrt(_1138);
    float _1154 = fma(_1028, (*spvDescriptorSet0.vp_c8)._m0[10].z, _1140);
    bool _1156 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[653].w;
    bool _1158 = isnan(0.5);
    bool _1160 = _1156 || _1158;
    bool _1162 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _1164 = _1160 || _1162;
    float _1166 = _1154 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _1168 = _1166 + _1112;
    float _1170 = -_842;
    float _1172 = _1170 + _1102;
    float _1174 = _1168 * _1124;
    float _1176 = _1174 * 0.5;
    bool _1178 = _1152 > 0.0;
    float _1180 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _1182 = fma(_1176, (*spvDescriptorSet0.vp_c8)._m0[30].w, _1180);
    float _1184 = 1.0 / _1182;
    float _1186 = _1152;
    float _1188 = _1102;
    float _1190 = _1182;
    float _1192 = _1124;
    float _1194 = _1136;
    if (!_1178)
    {
        _1046 = _1128;
    }
    float _1196 = _1046;
    float _1198 = _1196;
    if (!_1178)
    {
        _1048 = _1172;
    }
    float _1200 = _1048;
    float _1202 = _1200;
    if (!_1178)
    {
        _1186 = _1136;
    }
    float _1204 = _1186;
    bool _1206 = !_1178;
    float _1208 = _1204;
    float _1210 = _1204;
    if (!_1206)
    {
        float _1212 = _188 * _188;
        float _1214 = fma(_186, _186, _1212);
        float _1216 = fma(_190, _190, _1214);
        float _1218 = rsqrt(_1138);
        float _1220 = sqrt(_1216);
        float _1222 = _1110 * _1218;
        float _1224 = _1116 * _1218;
        float _1226 = _1120 * _1218;
        bool _1228 = _1220 > 0.0;
        float _1230 = _1220;
        float _1232 = _1218;
        _1050 = _1216;
        _1188 = _1224;
        _1190 = _1222;
        if (!_1228)
        {
            _1230 = _1128;
        }
        float _1234 = _1230;
        _1198 = _1234;
        if (!_1228)
        {
            _1232 = _1172;
        }
        float _1236 = _1232;
        _1202 = _1236;
        if (!_1228)
        {
            _1208 = _1136;
        }
        float _1238 = _1208;
        bool _1240 = !_1228;
        _1210 = _1238;
        if (!_1240)
        {
            float _1242 = rsqrt(_1216);
            float _1244 = 1.0 / (*spvDescriptorSet0.vp_c10)._m0[2].z;
            float _1246 = _188 * _1242;
            float _1248 = _186 * _1242;
            float _1250 = _190 * _1242;
            float _1252 = _1222 * _1246;
            float _1254 = fma(_1224, _1248, _1252);
            float _1256 = _1244 * (*spvDescriptorSet0.vp_c9)._m0[142].x;
            float _1258 = fma(_1226, _1250, _1254);
            float _1260 = _1258 * _1256;
            float _1262 = fma(_186, _1260, _1128);
            float _1264 = fma(_188, _1260, _1172);
            float _1266 = fma(_190, _1260, _1136);
            _1198 = _1262;
            _1202 = _1264;
            _1210 = _1266;
        }
    }
    float _1268 = _1198;
    float _1270 = _1202;
    float _1272 = _1210;
    float _1274 = _1050;
    float _1276 = _1188;
    float _1278 = _1190;
    float _1280 = _1270;
    float _1282 = _1268;
    float _1284 = _1272;
    float _1286 = _1278;
    float _1288 = _1274;
    float _1290 = _1276;
    if (_1164)
    {
        _1192 = 1.0;
    }
    float _1292 = _1192;
    float _1294 = _1292;
    if (!_1150)
    {
        float _1296 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
        float _1298 = _1014 + _1296;
        float _1300 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
        float _1302 = _1018 + _1300;
        float _1304 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1306 = _1298 * _1298;
        float _1308 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
        float _1310 = _1028 + _1308;
        float _1312 = fma(_1302, _1302, _1306);
        float _1314 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _1316 = fma(_1310, _1310, _1312);
        float _1318 = sqrt(_1316);
        float _1320 = _1304 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1322 = precise::min(_1318, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _1324 = _1322 * _1314;
        float _1326 = -_1018;
        float _1328 = _1326 + _1268;
        float _1330 = _1320 * _1324;
        float _1332 = -_1014;
        float _1334 = _1332 + _1270;
        float _1336 = -_1028;
        float _1338 = _1336 + _1272;
        float _1340 = fma(_1328, _1330, _1018);
        float _1342 = fma(_1334, _1330, _1014);
        float _1344 = fma(_1338, _1330, _1028);
        _1280 = _1342;
        _1282 = _1340;
        _1284 = _1344;
    }
    float _1346 = _1280;
    float _1348 = _1282;
    float _1350 = _1284;
    if (_1164)
    {
        _1286 = 1.0;
    }
    float _1352 = _1286;
    float _1354 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _1356 = _1184 * _1354;
    float _1358 = _1352;
    if (!_1164)
    {
        float _1360 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1362 = _1360 * 0.15915493667125701904296875;
        float _1364 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1366 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1368 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _1366;
        float _1370 = _1362 * 6.283185482025146484375;
        float _1372 = cos(_1370);
        float _1374 = _1364 * 0.15915493667125701904296875;
        float _1376 = _1362 * 6.283185482025146484375;
        float _1378 = sin(_1376);
        float _1380 = 1.0 / _1372;
        float _1382 = _1374 * 6.283185482025146484375;
        float _1384 = cos(_1382);
        float _1386 = _1378 * _1380;
        float _1388 = _1374 * 6.283185482025146484375;
        float _1390 = sin(_1388);
        float _1392 = _1384 * _1386;
        float _1394 = 1.0 / _1368;
        float _1396 = 1.0 / _1392;
        float _1398 = _1390 * _1396;
        float _1400 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1402 = fma(_1356, _1398, _1400);
        float _1404 = _1402 * _1394;
        float _1406 = precise::clamp(_1404, 0.0, 1.0);
        _1288 = _1374;
        _1294 = _1406;
    }
    float _1408 = _1288;
    float _1410 = _1294;
    if (!_1164)
    {
        float _1412 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1414 = _1412 * 0.15915493667125701904296875;
        float _1416 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1418 = _1414 * 6.283185482025146484375;
        float _1420 = cos(_1418);
        float _1422 = _1416 * 0.15915493667125701904296875;
        float _1424 = _1414 * 6.283185482025146484375;
        float _1426 = sin(_1424);
        float _1428 = 1.0 / _1420;
        float _1430 = _1422 * 6.283185482025146484375;
        float _1432 = cos(_1430);
        float _1434 = _1426 * _1428;
        float _1436 = _1422 * 6.283185482025146484375;
        float _1438 = sin(_1436);
        float _1440 = _1432 * _1434;
        float _1442 = 1.0 / _1440;
        float _1444 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _1446 = (*spvDescriptorSet0.vp_c9)._m0[140].w + _1444;
        float _1448 = 1.0 / _1446;
        float _1450 = _1438 * _1442;
        float _1452 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _1454 = fma(_1356, _1450, _1452);
        float _1456 = _1454 * _1448;
        float _1458 = precise::clamp(_1456, 0.0, 1.0);
        float _1460 = -_1458;
        float _1462 = _1460 + 1.0;
        _1358 = _1462;
    }
    float _1464 = _1358;
    float _1466 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1468 = _1346 + _1466;
    float _1470 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1472 = _1348 + _1470;
    float _1474 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1476 = _1350 + _1474;
    float _1478 = _1346 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1480 = _1468 * _1468;
    float _1482 = _1346 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1484 = fma(_1348, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1478);
    float _1486 = fma(_1472, _1472, _1480);
    float _1488 = fma(_1348, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1482);
    float _1490 = fma(_1350, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1484);
    float _1492 = fma(_1476, _1476, _1486);
    float _1494 = fma(_1350, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1488);
    float _1496 = _1490 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1498 = rsqrt(_1492);
    float _1500 = _1494 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1502 = sqrt(_1492);
    float _1504 = _1498 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1506 = _1472 * _1504;
    float _1508 = _1476 * _1504;
    float _1510 = _1506 * _1506;
    float _1512 = _1508 * _1508;
    float _1514 = _1510 + _1512;
    float _1516 = sqrt(_1514);
    bool _1518 = _1516 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1520 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1522 = _1516 + _1520;
    float _1524 = _1480;
    float _1526 = _1514;
    float _1528 = _1522;
    float _1530 = _1506;
    float _1532 = _1508;
    float _1534 = _1510;
    if (_1518)
    {
        float _1536 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1524 = _1536;
    }
    float _1538 = _1524;
    if (_1518)
    {
        float _1540 = rsqrt(_1514);
        _1526 = _1540;
    }
    float _1542 = _1526;
    float _1544 = _1542;
    if (_1518)
    {
        float _1546 = _1522 * _1538;
        _1528 = _1546;
    }
    float _1548 = _1528;
    if (_1518)
    {
        float _1550 = _1548 * 0.15915493667125701904296875;
        _1052 = _1550;
    }
    float _1552 = _1052;
    float _1554 = _1538;
    if (_1518)
    {
        float _1556 = _1552 * 6.283185482025146484375;
        float _1558 = sin(_1556);
        _1554 = _1558;
    }
    float _1560 = _1554;
    float _1562 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _1564 = precise::max(0.0, _1562);
    float _1566 = _1408;
    if (_1518)
    {
        float _1568 = _1552 * 6.283185482025146484375;
        float _1570 = cos(_1568);
        _1566 = _1570;
    }
    float _1572 = _1566;
    float _1574 = -_1504;
    float _1576 = -_1564;
    float _1578 = fma(_1468, _1574, _1576);
    if (_1518)
    {
        float _1580 = _1578 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1194 = _1580;
    }
    float _1582 = _1194;
    float _1584 = _1496 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _1586 = fma(_1018, (*spvDescriptorSet0.vp_c15)._m0[652].x, (*spvDescriptorSet0.vp_c15)._m0[652].z);
    float _1588 = _1560;
    float _1590 = _1582;
    if (_1518)
    {
        float _1592 = fma(_1560, _1582, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1290 = _1592;
    }
    float _1594 = _1290;
    float _1596 = _1594;
    if (!_1518)
    {
        _1588 = _1578;
    }
    float _1598 = _1588;
    float _1600 = floor(_1586);
    float _1602 = _1598;
    float _1604 = _1572;
    if (_1518)
    {
        float _1606 = _1572 + (-1.0);
        _1590 = _1606;
    }
    float _1608 = _1590;
    if (_1518)
    {
        float _1610 = _1542 * _1594;
        _1596 = _1610;
    }
    float _1612 = _1596;
    if (_1518)
    {
        float _1614 = _1608 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1544 = _1614;
    }
    float _1616 = _1544;
    if (_1518)
    {
        float _1618 = _1506 * _1612;
        _1530 = _1618;
    }
    float _1620 = _1530;
    if (_1518)
    {
        float _1622 = _1508 * _1612;
        _1532 = _1622;
    }
    float _1624 = _1532;
    if (_1518)
    {
        float _1626 = fma(_1578, _1572, _1616);
        _1602 = _1626;
    }
    float _1628 = _1602;
    if (_1518)
    {
        float _1630 = _1620 * _1620;
        _1534 = _1630;
    }
    float _1632 = _1534;
    if (!_1518)
    {
        _1604 = _1512;
    }
    float _1634 = _1604;
    float _1636 = _1634;
    if (_1518)
    {
        float _1638 = _1624 * _1624;
        _1636 = _1638;
    }
    float _1640 = _1636;
    float _1642 = _1346 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1644 = fma(_1628, _1628, _1632);
    float _1646 = fma(_1348, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1642);
    float _1648 = _1644 + _1640;
    float _1650 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _1652 = _1346 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1654 = fma(_1350, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1646);
    float _1656 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _1658 = fma(_1502, (*spvDescriptorSet0.vp_c15)._m0[23].w, _1656);
    float _1660 = precise::clamp(_1658, 0.0, 1.0);
    float _1662 = fma(_1348, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1652);
    float _1664 = _1654 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1666 = rsqrt(_1648);
    float _1668 = -_1660;
    float _1670 = _1668 + 1.0;
    float _1672 = fma(_1350, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1662);
    float _1674 = -_1584;
    float _1676 = fma(_1674, _1650, 1.0);
    float _1678 = fma(_1028, (*spvDescriptorSet0.vp_c15)._m0[652].y, (*spvDescriptorSet0.vp_c15)._m0[652].w);
    float _1680 = _1664 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1682 = _1672 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1684 = _1664 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1686 = abs(_1670);
    float _1688 = log2(_1686);
    float _1690 = fma(_1682, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1684);
    float _1692 = fma(_1496, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1690);
    float _1694 = _1666 * _1620;
    float _1696 = _1666 * _1628;
    float _1698 = floor(_1678);
    float _1700 = fma(_1500, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1692);
    float _1702 = _1694 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _1704 = _1666 * _1624;
    float _1706 = -_1600;
    float _1708 = _1586 + _1706;
    float _1710 = _1664 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1712 = -_1702;
    float _1714 = fma(_1696, (*spvDescriptorSet0.vp_c15)._m0[21].y, _1712);
    float _1716 = _1688 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _1718 = log2(_1676);
    float _1720 = fma(_1682, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1710);
    float _1722 = -_1704;
    float _1724 = fma(_1722, (*spvDescriptorSet0.vp_c15)._m0[21].z, _1714);
    float _1726 = fma(_1496, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1720);
    float _1728 = fma(_1724, -0.5, 0.5);
    float _1730 = fma(_1724, 0.5, 0.5);
    float _1732 = 1.0 / _1700;
    float _1734 = -_1698;
    float _1736 = _1678 + _1734;
    float _1738 = fma(_1682, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1680);
    float _1740 = fma(_1730, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _1742 = fma(_1500, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1726);
    float _1744 = _1696 + 1.0;
    float _1746 = fma(_1496, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1738);
    float _1748 = fma(_1730, _1740, -0.212114393711090087890625);
    float _1750 = exp2(_1716);
    float _1752 = _1718 * 0.693147182464599609375;
    float _1754 = fma(_1500, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1746);
    float _1756 = fma(_1730, _1748, 1.570728778839111328125);
    float _1758 = _1752 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _1760 = sqrt(_1728);
    float _1762 = _1742 * _1732;
    float _1764 = _1754 * _1732;
    float _1766 = -_1696;
    float _1768 = fma(_1750, _1744, _1766);
    float2 _5874 = float2(_1708, _1736);
    float _1770 = dm_bs(spvDescriptorSet0.vp_t_tcb_24.sample(spvDescriptorSet0.vp_t_tcb_24Smplr, select(_5874, float2(0.0), isnan(_5874)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_24, spvDescriptorSet0.vp_t_tcb_24Smplr_w, select(_5874, float2(0.0), isnan(_5874)), level(0.0)).x;
    float _1772 = fma(_1768, 0.5, 0.5);
    float _1774 = _1760 * 0.636619746685028076171875;
    float _1776 = fma(_1762, 0.5, 0.5);
    float _1778 = fma(_1764, -0.5, 0.5);
    float _1780 = -_1756;
    float _1782 = fma(_1774, _1780, 1.0);
    float3 _5899 = float3(_1776, _1778, _1758);
    float _1784 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_5899, float3(0.0), isnan(_5899)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_5899, float3(0.0), isnan(_5899)), level(0.0)).x;
    float3 _5910 = float3(_1776, _1778, _1758);
    float4 _1787 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_5910, float3(0.0), isnan(_5910)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_5910, float3(0.0), isnan(_5910)), level(0.0)).xyzw;
    float _1789 = _1787.x;
    float _1791 = _1787.y;
    float _1793 = _1787.z;
    float _1795 = _1787.w;
    float2 _5926 = float2(_1782, _1772);
    float3 _1799 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_5926, float2(0.0), isnan(_5926)), level(0.0)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_5926, float2(0.0), isnan(_5926)), level(0.0)).xyz;
    float _1801 = _1799.x;
    float _1803 = _1799.y;
    float _1805 = _1799.z;
    float _1807 = float(uint(_494));
    float _1809 = trunc(_628);
    int _1811 = int(_1809);
    bool _1813 = _494 == 0;
    out.m_65.x = _1018;
    out.m_65.y = _1014;
    out.m_65.z = _1028;
    int _1815 = abs(_712);
    float _1817 = _1688 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    bool _1819 = _454 > 0.5;
    out.m_67.w = _824;
    float _1821 = 1.0 / _1807;
    int _1823 = ~_494;
    int _1825 = _1823 + 1;
    out.m_69.x = _904;
    float _1827 = float(_110);
    out.m_71.x = _1348;
    out.m_71.y = _1346;
    out.m_71.z = _1350;
    float _1829 = float(uint(_1811));
    float _1831 = 1.0 / _1827;
    float _1833 = -(*spvDescriptorSet0.vp_c9)._m0[133].w;
    float _1835 = _1833 + (*spvDescriptorSet0.vp_c9)._m0[134].w;
    int _1837 = as_type<int>(_1821) + (-2);
    float _1839 = exp2(_1817);
    float _1841 = as_type<float>(_1837) * _1829;
    int _1843 = ~_494;
    int _1845 = _1843 + 1;
    float _1847 = 1.0 / _1835;
    float _1849 = trunc(_1841);
    float _1851 = precise::max(_1849, 0.0);
    uint _1854 = uint(_1851);
    float _1856 = -_1839;
    float _1858 = _1856 + 1.0;
    float _1860 = -(*spvDescriptorSet0.vp_c9)._m0[133].x;
    float _1862 = (*spvDescriptorSet0.vp_c9)._m0[134].x + _1860;
    float _1864 = _1862 * _1847;
    float _1866 = -(*spvDescriptorSet0.vp_c9)._m0[133].w;
    float _1868 = _450 + _1866;
    float _1870 = fma(_1864, _1868, (*spvDescriptorSet0.vp_c9)._m0[133].x);
    int _1872 = _1825 * int(_1854);
    int _1874 = _1872 + _1811;
    float _1876 = float(uint(_1874));
    float _1878 = as_type<float>(_1837) * _1876;
    int _1880 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _1882 = _1880 != 0;
    float _1884 = float(_1811);
    float _1886 = trunc(_1878);
    float _1888 = precise::max(_1886, 0.0);
    uint _1890 = uint(_1888);
    bool _1892 = !_1882;
    float _1894 = _1892 ? 7.345489978790283203125 : 1.0;
    bool _1896 = _1884 >= _602;
    bool _1898 = isnan(_1884);
    bool _1900 = _1896 || _1898;
    bool _1902 = isnan(_602);
    bool _1904 = _1900 || _1902;
    float _1906 = float(_1904);
    float _1908 = _1894 * _452;
    float _1910 = trunc(_1906);
    int _1912 = int(_1910);
    int _1914 = int(_1854) + int(_1890);
    float _1916 = floor(_1908);
    int _1918 = _1845 * _1914;
    int _1920 = _1918 + _1811;
    bool _1922 = uint(_1920) >= uint(_494);
    bool _1924 = !_1922;
    int _1926 = _1924 ? 0 : (-1);
    float _1928 = -_1916;
    float _1930 = _1908 + _1928;
    int _1932 = ~_1914;
    int _1934 = _1932 + _1926;
    int _1936 = _1934 + 1;
    float _1938 = _624 * _1831;
    int _1940 = ~_1912;
    int _1942 = _1940 + 1;
    int _1944 = _1942 + 1;
    float _1946 = _1930 * _602;
    int _1948 = _494 * _1936;
    int _1950 = _1948 + _1811;
    int _1952 = _494 + (-1);
    float _1954 = trunc(_1938);
    int _1956 = int(_1954);
    int _1958 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4096;
    bool _1960 = _1958 != 0;
    bool _1962 = !_1813;
    int _1964 = _1962 ? _1950 : (-1);
    bool _1966 = !_1960;
    int _1968 = _1966 ? 0 : 1;
    int _1970 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 128;
    bool _1972 = _1970 != 0;
    float _1974 = trunc(_1946);
    int _1976 = int(_1974);
    int _1978 = _1964 * _1944;
    int _1980 = abs(_1968);
    int _1982 = abs(_694);
    int _1984 = _1912 * _1952;
    int _1986 = _1984 + _1978;
    bool _1988 = !_1972;
    int _1990 = _1988 ? 0 : 1;
    int _1992 = _1986 * _1982;
    int _1994 = abs(_704);
    int _1996 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _1998 = _1996 != 0;
    int _2000 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _2002 = _2000 != 0;
    int _2004 = _1956 * _1994;
    int _2006 = _2004 + _1992;
    int _2008 = _1976 * _1980;
    int _2010 = _2008 + _1811;
    int _2012 = abs(_1990);
    int _2014 = ~_494;
    int _2016 = _2014 + 1;
    float _2018 = float(uint(_2010));
    int _2020 = _2010 * _1815;
    int _2022 = _2020 + _2006;
    float _2024 = in.m_73.y;
    int _2026 = _1976 * _2012;
    int _2028 = _2026 + _2022;
    int _2030 = ~_494;
    int _2032 = _2030 + 1;
    float _2034 = float(uint(_2028));
    float _2036 = as_type<float>(_1837) * _2034;
    float _2038 = trunc(_2036);
    float _2040 = precise::max(_2038, 0.0);
    uint _2042 = uint(_2040);
    int _2044 = _2032 * int(_2042);
    int _2046 = _2044 + _2028;
    float _2048 = float(uint(_2046));
    float _2050 = as_type<float>(_1837) * _2048;
    float _2052 = trunc(_2050);
    float _2054 = precise::max(_2052, 0.0);
    uint _2056 = uint(_2054);
    int _2058 = int(_2042) + int(_2056);
    int _2060 = _2016 * _2058;
    int _2062 = _2060 + _2028;
    float _2064 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _2066 = _2064 + (*spvDescriptorSet0.vp_c9)._m0[132].w;
    bool _2068 = uint(_2062) >= uint(_494);
    float _2070 = 1.0 / _2066;
    bool _2072 = !_2068;
    int _2074 = _2072 ? 0 : (-1);
    int _2076 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2097152;
    bool _2078 = _2076 != 0;
    float _2080 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _2082 = _450 + _2080;
    int _2084 = ~_2058;
    int _2086 = _2084 + _2074;
    int _2088 = _2086 + 1;
    float _2090 = -(*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _2092 = _2090 + (*spvDescriptorSet0.vp_c9)._m0[133].w;
    float _2094 = as_type<float>(_1837) * _2018;
    float _2096 = -(*spvDescriptorSet0.vp_c9)._m0[131].x;
    float _2098 = (*spvDescriptorSet0.vp_c9)._m0[132].x + _2096;
    float _2100 = -(*spvDescriptorSet0.vp_c9)._m0[132].x;
    float _2102 = _2100 + (*spvDescriptorSet0.vp_c9)._m0[133].x;
    int _2104 = _494 * _2088;
    int _2106 = _2104 + _2028;
    float _2108 = -_2024;
    float _2110 = _2108 + 1.0;
    float _2112 = 1.0 / _2092;
    bool _2114 = !_1813;
    int _2116 = _2114 ? _2106 : (-1);
    float _2118 = _2098 * _2070;
    int _2120 = ~_494;
    int _2122 = _2120 + 1;
    int _2124 = _2116 >> 31;
    float _2126 = trunc(_2094);
    float _2128 = precise::max(_2126, 0.0);
    uint _2130 = uint(_2128);
    float _2132 = fma(_2118, _2082, (*spvDescriptorSet0.vp_c9)._m0[131].x);
    float _2134 = _2024;
    float _2136 = _1700;
    float _2138 = _1754;
    float _2140 = _1742;
    if (_1998)
    {
        float _2142 = _1819 ? _2110 : _2024;
        _2134 = _2142;
    }
    float _2144 = _2134;
    int _2146 = _2124 & 3;
    bool _2148 = _450 >= (*spvDescriptorSet0.vp_c9)._m0[133].w;
    bool _2150 = isnan(_450);
    bool _2152 = _2148 || _2150;
    bool _2154 = isnan((*spvDescriptorSet0.vp_c9)._m0[133].w);
    bool _2156 = _2152 || _2154;
    float _2158 = float(_2156);
    int _2160 = _2116 + _2146;
    float _2162 = _2102 * _2112;
    bool _2164 = _450 >= (*spvDescriptorSet0.vp_c9)._m0[134].w;
    bool _2166 = isnan(_450);
    bool _2168 = _2164 || _2166;
    bool _2170 = isnan((*spvDescriptorSet0.vp_c9)._m0[134].w);
    bool _2172 = _2168 || _2170;
    float _2174 = float(_2172);
    float _2176 = -_2158;
    float _2178 = _2176 + 1.0;
    int _2180 = _2160 >> 2;
    int _2182 = _2116 & 3;
    bool _2184 = _2182 != 0;
    float _2186 = -_2174;
    float _2188 = _2186 + 1.0;
    int _2190 = _2180 << 4;
    int _2192 = _2190 + 368;
    int _2194 = _2122 * int(_2130);
    int _2196 = _2194 + _2010;
    float _2198 = _2158 * _2188;
    uint _2200 = uint(int(uint(_2192) >> uint(2)));
    uint _2202 = uint(int(uint(int(_2200)) >> uint(2)));
    int _2204 = int(_2200) & 3;
    float _2206 = (*spvDescriptorSet0.vp_c9)._m0[int(_2202)][_2204];
    int _2208 = int(_2200) + 1;
    uint _2210 = uint(int(uint(_2208) >> uint(2)));
    int _2212 = _2208 & 3;
    float _2214 = (*spvDescriptorSet0.vp_c9)._m0[int(_2210)][_2212];
    int _2216 = _2116 & 3;
    bool _2218 = _2216 != 0;
    float _2220 = float(uint(_2196));
    bool _2222 = _450 >= (*spvDescriptorSet0.vp_c9)._m0[132].w;
    bool _2224 = isnan(_450);
    bool _2226 = _2222 || _2224;
    bool _2228 = isnan((*spvDescriptorSet0.vp_c9)._m0[132].w);
    bool _2230 = _2226 || _2228;
    float _2232 = float(_2230);
    bool _2234 = uint(_2216) > 1u;
    float _2236 = as_type<float>(_1837) * _2220;
    bool _2238 = _450 >= (*spvDescriptorSet0.vp_c9)._m0[131].w;
    bool _2240 = isnan(_450);
    bool _2242 = _2238 || _2240;
    bool _2244 = isnan((*spvDescriptorSet0.vp_c9)._m0[131].w);
    bool _2246 = _2242 || _2244;
    float _2248 = float(_2246);
    float _2250 = _2232 * _2178;
    float _2252 = -_2232;
    float _2254 = _2252 + 1.0;
    int _2256 = _2184 ? 0 : 1;
    int _2258 = _2192 + 8;
    uint _2260 = uint(int(uint(_2258) >> uint(2)));
    uint _2262 = uint(int(uint(int(_2260)) >> uint(2)));
    int _2264 = int(_2260) & 3;
    float _2266 = (*spvDescriptorSet0.vp_c9)._m0[int(_2262)][_2264];
    int _2268 = int(_2260) + 1;
    uint _2270 = uint(int(uint(_2268) >> uint(2)));
    int _2272 = _2268 & 3;
    float _2274 = (*spvDescriptorSet0.vp_c9)._m0[int(_2270)][_2272];
    float _2276 = trunc(_2236);
    float _2278 = precise::max(_2276, 0.0);
    uint _2280 = uint(_2278);
    float _2282 = _2248 * _2254;
    float _2284 = -_2248;
    float _2286 = _2284 + 1.0;
    bool _2288 = uint(_2216) >= 2u;
    float _2290 = -_1770;
    float _2292 = _2290 + 1.0;
    float _2294 = _2132 * _2282;
    float _2296 = -(*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _2298 = _450 + _2296;
    int _2300 = ~_2256;
    int _2302 = _2300 + 1;
    int _2304 = _2302 + 1;
    int _2306 = _2304;
    if (!_2234)
    {
        int _2308 = ~_2256;
        int _2310 = _2308 + 1;
        _2306 = _2310;
    }
    int _2312 = _2306;
    float _2314 = fma(_2162, _2298, (*spvDescriptorSet0.vp_c9)._m0[132].x);
    bool _2316 = _2216 != 3;
    float _2318 = fma(_2286, (*spvDescriptorSet0.vp_c9)._m0[131].x, _2294);
    int _2320 = ~_494;
    int _2322 = _2320 + 1;
    int _2324 = abs(_2312);
    float _2326 = fma(_2314, _2250, _2318);
    int _2328 = int(_2130) + int(_2280);
    bool _2330 = !_2218;
    int _2332 = _2330 ? 0 : 1;
    int _2334 = _2288 ? 0 : 1;
    int _2336 = abs(_2332);
    int _2338 = ~_2324;
    int _2340 = _2338 + 1;
    int _2342 = _2340 + 1;
    int _2344 = _2322 * _2328;
    int _2346 = _2344 + _2010;
    int _2348 = ~_2334;
    int _2350 = _2348 + 1;
    int _2352 = _2350 + 1;
    float _2354 = fma(_1870, _2198, _2326);
    int _2356 = _2352;
    if (_2316)
    {
        int _2358 = ~_2334;
        int _2360 = _2358 + 1;
        _2356 = _2360;
    }
    int _2362 = _2356;
    float _2364 = _936 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    int _2366 = ~_2336;
    int _2368 = _2366 + 1;
    int _2370 = _2368 + 1;
    int _2372 = _2342 * as_type<int>(_2214);
    int _2374 = abs(_2362);
    bool _2376 = _2216 != 3;
    int _2378 = _2370 * as_type<int>(_2206);
    int _2380 = _2378 + _2372;
    bool _2382 = uint(_2346) >= uint(_494);
    float _2384 = trunc((*spvDescriptorSet0.vp_c9)._m0[80].z);
    int _2386 = int(_2384);
    float _2388 = as_type<float>(_2346);
    if (_2002)
    {
        float _2390 = in.m_55.x;
        _2388 = _2390;
    }
    float _2392 = _2388;
    bool _2394 = !_2376;
    int _2396 = _2394 ? 0 : (-1);
    bool _2398 = !_2382;
    int _2400 = _2398 ? 0 : (-1);
    int _2402 = ~_2374;
    int _2404 = _2402 + 1;
    int _2406 = _2404 + 1;
    int _2408 = abs(_2396);
    bool _2410 = !_2078;
    int _2412 = _2410 ? 0 : 1;
    int _2414 = ~_2328;
    int _2416 = _2414 + _2400;
    int _2418 = _2416 + 1;
    int _2420 = _2406 * as_type<int>(_2266);
    int _2422 = _2420 + _2380;
    int _2424 = abs(_2412);
    float _2426 = in.m_73.x;
    int _2428 = ~_2408;
    int _2430 = _2428 + 1;
    int _2432 = _2430 + 1;
    int _2434 = _494 * _2418;
    int _2436 = _2434 + _2010;
    bool _2438 = _880 != 0.0;
    bool _2440 = isnan(_880);
    bool _2442 = _2438 || _2440;
    bool _2444 = isnan(0.0);
    bool _2446 = _2442 || _2444;
    float _2448 = in.m_75.x;
    float _2450 = in.m_75.y;
    float _2452 = in.m_75.z;
    int _2454 = ~_2424;
    int _2456 = _2454 + 1;
    int _2458 = _2456 + 1;
    int _2460 = _2432 * as_type<int>(_2274);
    int _2462 = _2460 + _2422;
    float _2464 = float(uint(_2386));
    int _2466 = abs(_2386);
    int _2468 = _2462 * _2458;
    bool _2470 = _878 == 0.0;
    bool _2472 = !_2446;
    bool _2474 = _2470 && _2472;
    bool _2476 = !_1813;
    int _2478 = _2476 ? _2436 : (-1);
    float _2480 = 1.0 / _2464;
    float _2482 = fma(_2174, (*spvDescriptorSet0.vp_c9)._m0[134].x, _2354);
    bool _2484 = _882 == 0.0;
    bool _2486 = _2484 && _2474;
    int _2488 = _2478 * _2424;
    int _2490 = _2488 + _2468;
    float _2492 = float(uint(_2466));
    float _2494 = _2482 * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    bool _2496 = _2392 > 0.5;
    bool _2498 = _2496 && _2002;
    float _2500 = _2392;
    if (_2002)
    {
        _2500 = _2426;
    }
    float _2502 = _2500;
    float _2504 = 1.0 / _2492;
    int _2506 = abs(_2490);
    float _2508 = _2448;
    float _2510 = _2452;
    float _2512 = _2502;
    float _2514 = _2450;
    if (!_2486)
    {
        float _2516 = fma(_878, (*spvDescriptorSet0.vp_c9)._m0[17].y, _2448);
        _2508 = _2516;
    }
    float _2518 = _2508;
    if (!_2002)
    {
        _1054 = _2426;
    }
    float _2520 = _1054;
    float _2522 = _2520;
    if (!_2486)
    {
        float _2524 = fma(_882, (*spvDescriptorSet0.vp_c9)._m0[17].y, _2452);
        _2510 = _2524;
    }
    float _2526 = _2510;
    int _2528 = as_type<int>(_2480) + (-2);
    if (_2498)
    {
        float _2530 = -_2502;
        float _2532 = _2530 + 1.0;
        _2512 = _2532;
    }
    float _2534 = _2512;
    float _2536 = float(uint(_2490));
    float _2538 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    if (!_2486)
    {
        float _2540 = fma(_880, (*spvDescriptorSet0.vp_c9)._m0[17].y, _2450);
        _2514 = _2540;
    }
    float _2542 = _2514;
    float _2544 = as_type<float>(_2528) * _2536;
    float _2546 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    int _2548 = as_type<int>(_2504) + (-2);
    float _2550 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _2552 = float(uint(_2506));
    float _2554 = trunc(_2544);
    float _2556 = precise::max(_2554, 0.0);
    uint _2558 = uint(_2556);
    float _2560 = _2538 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2562 = _2546 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2564 = _2550 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2566 = as_type<float>(_2548) * _2552;
    if (_2002)
    {
        _2522 = _2534;
    }
    float _2568 = _2522;
    float _2570 = _936 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    int _2572 = ~_2386;
    int _2574 = _2572 + 1;
    out.m_77.x = _2560;
    out.m_77.y = _2562;
    out.m_77.z = _2564;
    out.m_77.w = _2494;
    int _2576 = ~_2466;
    int _2578 = _2576 + 1;
    float _2580 = trunc(_2566);
    float _2582 = precise::max(_2580, 0.0);
    uint _2584 = uint(_2582);
    float _2586 = _936 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _2588 = -_924;
    float _2590 = fma(_2588, (*spvDescriptorSet0.vp_c8)._m0[24].x, _2570);
    float _2592 = fma(_932, (*spvDescriptorSet0.vp_c8)._m0[24].z, _2590);
    float _2594 = abs(_1356);
    float _2596 = log2(_2594);
    int _2598 = _2574 * int(_2558);
    int _2600 = _2598 + _2490;
    float _2602 = -_924;
    float _2604 = fma(_2602, (*spvDescriptorSet0.vp_c8)._m0[25].x, _2364);
    float _2606 = -_924;
    float _2608 = fma(_2606, (*spvDescriptorSet0.vp_c8)._m0[26].x, _2586);
    float _2610 = float(uint(_2600));
    float _2612 = fma(_932, (*spvDescriptorSet0.vp_c8)._m0[25].z, _2604);
    int _2614 = _2578 * int(_2584);
    int _2616 = _2614 + _2506;
    float _2618 = _944 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _2620 = _944 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _2622 = as_type<float>(_2528) * _2610;
    float _2624 = _944 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _2626 = float(uint(_2616));
    float _2628 = fma(_934, (*spvDescriptorSet0.vp_c8)._m0[24].x, _2618);
    float _2630 = fma(_934, (*spvDescriptorSet0.vp_c8)._m0[25].x, _2620);
    float _2632 = fma(_934, (*spvDescriptorSet0.vp_c8)._m0[26].x, _2624);
    float _2634 = trunc(_2622);
    float _2636 = precise::max(_2634, 0.0);
    uint _2638 = uint(_2636);
    float _2640 = as_type<float>(_2548) * _2626;
    float _2642 = _950 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _2644 = _950 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _2646 = _950 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _2648 = fma(_932, (*spvDescriptorSet0.vp_c8)._m0[26].z, _2608);
    float _2650 = fma(_938, (*spvDescriptorSet0.vp_c8)._m0[24].x, _2642);
    float _2652 = fma(_938, (*spvDescriptorSet0.vp_c8)._m0[25].x, _2644);
    float _2654 = trunc(_2640);
    float _2656 = precise::max(_2654, 0.0);
    uint _2658 = uint(_2656);
    float _2660 = fma(_938, (*spvDescriptorSet0.vp_c8)._m0[26].x, _2646);
    int _2662 = ~_2386;
    int _2664 = _2662 + 1;
    float _2666 = _2648 * _2542;
    float _2668 = _2596 * (*spvDescriptorSet0.vp_c15)._m0[654].z;
    int _2670 = ~_2466;
    int _2672 = _2670 + 1;
    float _2674 = _2592 * _2542;
    float _2676 = fma(_958, (*spvDescriptorSet0.vp_c8)._m0[24].z, _2628);
    int _2678 = int(_2558) + int(_2638);
    float _2680 = _2612 * _2542;
    float _2682 = exp2(_2668);
    float _2684 = fma(_966, (*spvDescriptorSet0.vp_c8)._m0[24].z, _2650);
    float _2686 = fma(_966, (*spvDescriptorSet0.vp_c8)._m0[25].z, _2652);
    int _2688 = _2664 * _2678;
    int _2690 = _2688 + _2490;
    int _2692 = int(_2584) + int(_2658);
    float _2694 = fma(_958, (*spvDescriptorSet0.vp_c8)._m0[25].z, _2630);
    float _2696 = fma(_958, (*spvDescriptorSet0.vp_c8)._m0[26].z, _2632);
    bool _2698 = uint(_2690) >= uint(_2386);
    int _2700 = _2672 * _2692;
    int _2702 = _2700 + _2506;
    float _2704 = fma(_2676, _2518, _2674);
    float _2706 = fma(_2696, _2518, _2666);
    bool _2708 = !_2698;
    int _2710 = _2708 ? 0 : (-1);
    float _2712 = fma(_2694, _2518, _2680);
    bool _2714 = uint(_2702) >= uint(_2466);
    float _2716 = fma(_2682, (*spvDescriptorSet0.vp_c15)._m0[654].x, (*spvDescriptorSet0.vp_c15)._m0[654].y);
    float _2718 = precise::clamp(_2716, 0.0, 1.0);
    int _2720 = ~_2678;
    int _2722 = _2720 + _2710;
    int _2724 = _2722 + 1;
    float _2726 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    bool _2728 = !_2714;
    int _2730 = _2728 ? 0 : (-1);
    float _2732 = fma(_2684, _2526, _2704);
    bool _2734 = _2386 == 0;
    float _2736 = fma(_2686, _2526, _2712);
    int _2738 = _2490 ^ _2386;
    float _2740 = fma(_966, (*spvDescriptorSet0.vp_c8)._m0[26].z, _2660);
    bool _2742 = _2386 == 0;
    int _2744 = _2386 * _2724;
    int _2746 = _2744 + _2490;
    float _2748 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    uint _2750 = uint(int(uint(_2738) >> uint(31)));
    float _2752 = fma(_2740, _2526, _2706);
    int _2754 = ~_2730;
    int _2756 = _2692 + _2754;
    int _2758 = _2756 + 1;
    float _2760 = fma(_2718, -2.0, 3.0);
    float _2762 = _2718 * _2718;
    int _2764 = ~int(_2750);
    int _2766 = _2764 + 1;
    float _2768 = _1664 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _2770 = _2726 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _2772 = _2762 * _2760;
    bool _2774 = !_2734;
    int _2776 = _2774 ? _2746 : (-1);
    float _2778 = fma(_1682, (*spvDescriptorSet0.vp_c8)._m0[6].x, _2768);
    int _2780 = _2758 ^ _2766;
    float _2782 = -_2772;
    float _2784 = _2782 + 1.0;
    float _2786 = float(_2776);
    float _2788 = fma(_2770, _2568, -0.5);
    float _2790 = _2748 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    int _2792 = ~_2766;
    int _2794 = _2792 + _2780;
    int _2796 = _2794 + 1;
    float _2798 = in.m_79.x;
    bool _2800 = _1356 <= 8000.0;
    bool _2802 = isnan(_1356);
    bool _2804 = _2800 || _2802;
    bool _2806 = isnan(8000.0);
    bool _2808 = _2804 || _2806;
    float _2810 = float(_2808);
    float _2812 = fma(_2784, (*spvDescriptorSet0.vp_c15)._m0[654].w, _2772);
    bool _2814 = !_2742;
    int _2816 = _2814 ? _2796 : (-1);
    float _2818 = fma(_2770, _2786, _632);
    float _2820 = fma(_2790, _2144, -0.5);
    float _2822 = _2810 * _2812;
    float _2824 = float(_2816);
    float _2826 = _1858 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _2828 = _2822 * (*spvDescriptorSet0.vp_c15)._m0[653].x;
    float _2830 = _1700 * 0.5;
    float _2832 = -_564;
    float _2834 = fma(_2790, _2824, _2832);
    float _2836 = fma(_634, _2788, _2818);
    float _2838 = _2292 * _2828;
    float _2840 = precise::clamp(_2838, 0.0, 1.0);
    float _2842 = _2826 * _1784;
    float _2844 = fma(_642, _2820, _2834);
    float _2846 = fma(_1754, -0.5, _2830);
    float _2848 = -_2840;
    float _2850 = fma(_2848, (*spvDescriptorSet0.vp_c15)._m0[653].y, 1.0);
    float _2852 = _2836 + 0.5;
    float _2854 = _2844 + 0.5;
    float _2856 = -_2826;
    float _2858 = _2856 + 1.0;
    float _2860 = _1795 * _2842;
    float _2862 = _1805 * _2842;
    float _2864 = _2850 * _2798;
    out.m_81.x = _2852;
    out.m_81.y = _2854;
    float _2866 = _1795 * _2858;
    float _2868 = fma(_1795, _2862, _1793);
    float _2870 = _2864 * (*spvDescriptorSet0.vp_c13)._m0[1].w;
    out.m_83.x = _2732;
    out.m_83.y = _2736;
    out.m_83.z = _2752;
    float _2872 = fma(_1496, (*spvDescriptorSet0.vp_c8)._m0[6].z, _2778);
    bool _2874 = _1502 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _2876 = isnan(_1502);
    bool _2878 = _2874 || _2876;
    bool _2880 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _2882 = _2878 || _2880;
    float _2884 = _1742 + _1700;
    out.m_85.x = _2870;
    float _2886 = fma(_1500, (*spvDescriptorSet0.vp_c8)._m0[6].w, _2872);
    float _2888 = fma(_1801, _2860, _1789);
    float _2890 = fma(_1803, _2860, _1791);
    float _2892 = _2886 + _1700;
    float _2894 = _2884 * 0.5;
    float _2896 = _1410 * _1464;
    out.m_87.x = _2888;
    out.m_87.y = _2890;
    out.m_87.z = _2868;
    out.m_87.w = _2866;
    float _2898 = _2892 * 0.5;
    out.gl_Position.x = _1742;
    out.gl_Position.y = _1754;
    out.gl_Position.z = _2886;
    out.gl_Position.w = _1700;
    out.m_89.x = _2894;
    out.m_89.y = _2846;
    out.m_89.z = _2898;
    out.m_89.w = _1700;
    float _2900 = _2886;
    float _2902 = _2894;
    float _2904 = _2896;
    if (!_2882)
    {
        _2136 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _2906 = _2136;
    float _2908 = _2906;
    float _2910 = _2906;
    if (!_2882)
    {
        _2900 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _2912 = _2900;
    float _2914 = _2896 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _2916 = _2912;
    float _2918 = _2912;
    if (!_2882)
    {
        _2902 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _2920 = _2902;
    float _2922 = _2920;
    float _2924 = _2920;
    if (!_2882)
    {
        _2138 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _2926 = _2138;
    float _2928 = _2926;
    float _2930 = _2926;
    if (!_2882)
    {
        _2140 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _2932 = _2140;
    float _2934 = _2932;
    float _2936 = _2932;
    if (!_2882)
    {
        _2904 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _2938 = _2904;
    bool _2940 = !_2882;
    float _2942 = _2938;
    float _2944 = _2938;
    if (!_2940)
    {
        bool _2946 = _1502 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _2948 = isnan(_1502);
        bool _2950 = _2946 || _2948;
        bool _2952 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _2954 = _2950 || _2952;
        if (!_2954)
        {
            float _2956 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2958 = _1502 + _2956;
            float _2960 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2962 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _2960;
            float _2964 = 1.0 / _2962;
            float _2966 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _2968 = _2966 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _2970 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _2972 = _2970 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _2974 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _2976 = _2974 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _2978 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _2980 = _2978 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _2982 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _2984 = _2982 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _2986 = _2958 * _2964;
            float _2988 = precise::clamp(_2986, 0.0, 1.0);
            float _2990 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _2992 = _2990 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _2994 = fma(_2988, _2968, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _2996 = fma(_2988, _2992, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _2998 = fma(_2988, _2972, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _3000 = fma(_2988, _2976, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _3002 = fma(_2988, _2980, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _3004 = fma(_2988, _2984, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            _2910 = _2996;
            _2936 = _3002;
            _2924 = _2994;
            _2930 = _3000;
            _2918 = _2998;
            _2944 = _3004;
            _3006 = true;
        }
        else
        {
            bool _3008 = _1502 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _3010 = isnan(_1502);
            bool _3012 = _3008 || _3010;
            bool _3014 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _3016 = _3012 || _3014;
            if (!_3016)
            {
                _2922 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _3018 = _2922;
            _2924 = _3018;
            if (!_3016)
            {
                _2908 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _3020 = _2908;
            _2910 = _3020;
            if (!_3016)
            {
                _2916 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _3022 = _2916;
            _2918 = _3022;
            if (!_3016)
            {
                _2928 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _3024 = _2928;
            _2930 = _3024;
            if (!_3016)
            {
                _2934 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _3026 = _2934;
            _2936 = _3026;
            if (!_3016)
            {
                _2942 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _3028 = _2942;
            bool _3030 = !_3016;
            _2944 = _3028;
            if (!_3030)
            {
                bool _3032 = _1502 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _3034 = isnan(_1502);
                bool _3036 = _3032 || _3034;
                bool _3038 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _3040 = _3036 || _3038;
                if (!_3040)
                {
                    float _3042 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _3044 = _1502 + _3042;
                    float _3046 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _3048 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _3046;
                    float _3050 = 1.0 / _3048;
                    float _3052 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _3054 = _3052 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _3056 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _3058 = _3056 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _3060 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _3062 = _3060 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _3064 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _3066 = _3064 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _3068 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _3070 = _3068 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _3072 = _3044 * _3050;
                    float _3074 = precise::clamp(_3072, 0.0, 1.0);
                    float _3076 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _3078 = _3076 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _3080 = fma(_3074, _3054, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _3082 = fma(_3074, _3078, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _3084 = fma(_3074, _3058, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _3086 = fma(_3074, _3062, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _3088 = fma(_3074, _3066, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _3090 = fma(_3074, _3070, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    _2910 = _3082;
                    _2936 = _3088;
                    _2924 = _3080;
                    _2930 = _3086;
                    _2918 = _3084;
                    _2944 = _3090;
                    _3006 = true;
                }
                else
                {
                    _2910 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _2936 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _2924 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _2930 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _2918 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _2944 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _3006 = false;
    float _3092 = _2910;
    float _3094 = _2936;
    float _3096 = _2924;
    float _3098 = _2930;
    float _3100 = _2918;
    float _3102 = _2944;
    float _3104 = _2914 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _3106 = fma(_2736, -0.5, 0.5);
    float _3108 = precise::clamp(_3106, 0.0, 1.0);
    float _3110 = -_3092;
    float _3112 = _3110 + _3094;
    float _3114 = -_3096;
    float _3116 = _3114 + _3098;
    out.m_49.x = _3104;
    float _3118 = fma(_3108, _3112, _3092);
    float _3120 = -_3100;
    float _3122 = _3120 + _3102;
    float _3124 = fma(_3108, _3116, _3096);
    float _3126 = _3118 * 0.586610972881317138671875;
    bool _3128 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _3130 = fma(_3108, _3122, _3100);
    out.m_91.x = 0.0;
    float _3132 = fma(_3124, 0.298911988735198974609375, _3126);
    bool _3134 = _1410 > 0.0;
    bool _3136 = isnan(_1410);
    bool _3138 = _3134 || _3136;
    bool _3140 = isnan(0.0);
    bool _3142 = _3138 || _3140;
    float _3144 = fma(_3130, 0.114477999508380889892578125, _3132);
    bool _3146 = _1464 <= 0.0;
    bool _3148 = !_3142;
    bool _3150 = _3146 || _3148;
    float _3152 = -_3144;
    float _3154 = _3124 + _3152;
    float _3156 = -_3144;
    float _3158 = _3118 + _3156;
    float _3160 = -_3144;
    float _3162 = _3130 + _3160;
    float _3164 = fma(_3154, (*spvDescriptorSet0.vp_c13)._m0[1].z, _3144);
    float _3166 = fma(_3158, (*spvDescriptorSet0.vp_c13)._m0[1].z, _3144);
    float _3168 = fma(_3162, (*spvDescriptorSet0.vp_c13)._m0[1].z, _3144);
    bool _3170 = !_3128;
    if (!_3170)
    {
        float _3172 = -_1346;
        float _3174 = _3172 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
        float _3176 = -_1348;
        float _3178 = _3176 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
        float _3180 = -_1350;
        float _3182 = _3180 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
        float _3184 = _3174 * _3174;
        float _3186 = fma(_3178, _3178, _3184);
        float _3188 = fma(_3182, _3182, _3186);
        float _3190 = sqrt(_3188);
        float _3192 = rsqrt(_3188);
        float _3194 = -_3190;
        float _3196 = _3194 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
        float _3198 = _3196 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
        float _3200 = precise::clamp(_3198, 0.0, 1.0);
        float _3202 = _3178 * _3192;
        float _3204 = _3174 * _3192;
        float _3206 = abs(_3200);
        float _3208 = log2(_3206);
        float _3210 = _3182 * _3192;
        float _3212 = _3202 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
        float _3214 = _2736 * _3204;
        float _3216 = -_3204;
        float _3218 = -_3212;
        float _3220 = fma(_3216, (*spvDescriptorSet0.vp_c15)._m0[656].y, _3218);
        float _3222 = fma(_2732, _3202, _3214);
        float _3224 = -_3210;
        float _3226 = fma(_3224, (*spvDescriptorSet0.vp_c15)._m0[656].z, _3220);
        float _3228 = fma(_2752, _3210, _3222);
        float _3230 = precise::clamp(_3228, 0.0, 1.0);
        float _3232 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
        float _3234 = _3226 + _3232;
        float _3236 = _3208 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
        float _3238 = _3234 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
        float _3240 = precise::clamp(_3238, 0.0, 1.0);
        float _3242 = exp2(_3236);
        float _3244 = _3242 * _3240;
        float _3246 = _3230 * _3244;
        float _3248 = _3246 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
        float _3250 = _3246 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
        float _3252 = _3246 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
        out.m_91.x = _3248;
        out.m_91.y = _3250;
        out.m_91.z = _3252;
    }
    out.m_67.x = _3164;
    out.m_67.y = _3166;
    out.m_67.z = _3168;
    if (!_3150)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    out.m_49.x = 0.0;
    float _3254 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _3254;
    out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
}


vertex main0_out main0_z(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]])
{
    main0_out out = {};
    out.dm_pad6 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_59 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_77 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_87 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_65 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_67 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_83 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_71 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_81 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_91 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_85 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_89 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_49 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_69 = float4(0.0, 0.0, 0.0, 1.0);
    bool _3006 = false;
    bool _442 = false;
    bool _338 = false;
    bool _212 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _105 = in.m_46.w;
    float _107 = trunc(_105);
    int _110 = int(_107);
    bool _114 = _110 >= 1;
    float _116 = 0.0;
    if (!_114)
    {
        _116 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _118 = _116;
    float _120 = _118;
    if (!_114)
    {
        out.m_49.x = 0.0;
    }
    int _122 = 0;
    if (!_114)
    {
        float _124 = _118 * 5.0;
        _122 = as_type<int>(_124);
    }
    int _126 = _122;
    int _128 = _126;
    if (!_114)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _3311 = as_type<float>(_126);
        out.gl_Position.z = _3311;
    }
    if (!_114)
    {
        return out;
    }
    float _130 = in.m_51.w;
    bool _132 = _130 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _134 = isnan(_130);
    bool _136 = _132 || _134;
    bool _138 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _140 = _136 || _138;
    float _142 = -_130;
    float _144 = _142 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    float _146 = 0.0;
    float _148 = _144;
    if (_140)
    {
        float _150 = float(_110);
        _146 = _150;
    }
    float _152 = _146;
    bool _154 = _144 >= _152;
    bool _156 = !_140;
    bool _158 = _154 || _156;
    if (_158)
    {
        _120 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _160 = _120;
    if (_158)
    {
        out.m_49.x = 0.0;
    }
    if (_158)
    {
        float _162 = _160 * 5.0;
        _128 = as_type<int>(_162);
    }
    int _164 = _128;
    if (_158)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _3380 = as_type<float>(_164);
        out.gl_Position.z = _3380;
    }
    if (_158)
    {
        return out;
    }
    float _166 = in.m_53.x;
    float _168 = in.m_53.y;
    float _170 = in.m_53.z;
    bool _172 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _174 = _168 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _176 = _168 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _178 = _168 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _180 = fma(_166, (*spvDescriptorSet0.vp_c10)._m0[4].x, _174);
    float _182 = fma(_166, (*spvDescriptorSet0.vp_c10)._m0[5].x, _176);
    float _184 = fma(_166, (*spvDescriptorSet0.vp_c10)._m0[6].x, _178);
    float _186 = fma(_170, (*spvDescriptorSet0.vp_c10)._m0[4].z, _180);
    float _188 = fma(_170, (*spvDescriptorSet0.vp_c10)._m0[5].z, _182);
    float _190 = fma(_170, (*spvDescriptorSet0.vp_c10)._m0[6].z, _184);
    bool _192 = !_172;
    float _210;
    if (!_192)
    {
        float _194 = in.m_55.x;
        float _196 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _198 = _194 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _200 = fma(_198, (*spvDescriptorSet0.vp_c9)._m0[12].x, _144);
        float _202 = _200 * _196;
        float _204 = floor(_202);
        float _206 = -_204;
        float _208 = _202 + _206;
        _210 = _208;
        _212 = true;
    }
    else
    {
        float _214 = float(_110);
        float _216 = 1.0 / _214;
        float _218 = _144 * _216;
        _210 = _218;
    }
    _212 = false;
    float _220 = _210;
    float _222 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _224 = _220 + _222;
    bool _226 = _220 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _228 = isnan(_220);
    bool _230 = _226 || _228;
    bool _232 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _234 = _230 || _232;
    float _236 = float(_234);
    float _238 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _240 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _238;
    float _242 = 1.0 / _240;
    bool _244 = _220 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _246 = isnan(_220);
    bool _248 = _244 || _246;
    bool _250 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _252 = _248 || _250;
    float _254 = float(_252);
    float _256 = -_236;
    float _258 = _256 + 1.0;
    float _260 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _262 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _260;
    float _264 = -(*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _266 = (*spvDescriptorSet0.vp_c9)._m0[144].z + _264;
    bool _268 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _270 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _272 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _270;
    float _274 = _254 * _258;
    float _276 = -_254;
    float _278 = _276 + 1.0;
    float _280 = _224 * _242;
    float _282 = in.m_57.x;
    float _284 = in.m_57.y;
    float _286 = in.m_57.z;
    float _288 = fma(_262, _280, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _290 = fma(_272, _280, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _292 = fma(_266, _280, (*spvDescriptorSet0.vp_c9)._m0[143].z);
    float _294 = _288 * _274;
    float _296 = _290 * _274;
    float _298 = _292 * _274;
    float _300 = fma(_278, (*spvDescriptorSet0.vp_c9)._m0[143].x, _294);
    float _302 = fma(_278, (*spvDescriptorSet0.vp_c9)._m0[143].y, _296);
    float _304 = fma(_278, (*spvDescriptorSet0.vp_c9)._m0[143].z, _298);
    float _306 = fma(_236, (*spvDescriptorSet0.vp_c9)._m0[144].x, _300);
    float _308 = fma(_236, (*spvDescriptorSet0.vp_c9)._m0[144].y, _302);
    float _310 = fma(_236, (*spvDescriptorSet0.vp_c9)._m0[144].z, _304);
    float _312 = _308 * _284;
    float _314 = _306 * _282;
    float _316 = _310 * _286;
    bool _318 = !_268;
    float _336;
    if (!_318)
    {
        float _320 = in.m_55.x;
        float _322 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _324 = _320 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _326 = fma(_324, (*spvDescriptorSet0.vp_c9)._m0[11].y, _144);
        float _328 = _326 * _322;
        float _330 = floor(_328);
        float _332 = -_330;
        float _334 = _328 + _332;
        _336 = _334;
        _338 = true;
    }
    else
    {
        float _340 = float(_110);
        float _342 = 1.0 / _340;
        float _344 = _144 * _342;
        _336 = _344;
    }
    _338 = false;
    float _346 = _336;
    bool _348 = _346 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _350 = isnan(_346);
    bool _352 = _348 || _350;
    bool _354 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _356 = _352 || _354;
    float _358 = float(_356);
    float _360 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _362 = _360 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _364 = _346 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _366 = isnan(_346);
    bool _368 = _364 || _366;
    bool _370 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _372 = _368 || _370;
    float _374 = float(_372);
    float _376 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _378 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _376;
    float _380 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _382 = _346 + _380;
    float _384 = -_358;
    float _386 = _384 + 1.0;
    bool _388 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].w;
    float _390 = 1.0 / _362;
    float _392 = _374 * _386;
    float _394 = -_374;
    float _396 = _394 + 1.0;
    float _398 = _378 * _390;
    float _400 = fma(_398, _382, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _402 = _400 * _392;
    float _404 = fma(_396, (*spvDescriptorSet0.vp_c9)._m0[115].x, _402);
    float _406 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _408 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _410 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _412 = fma(_358, (*spvDescriptorSet0.vp_c9)._m0[116].x, _404);
    float _414 = _406 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _416 = _408 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _418 = _410 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _420 = _412 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    out.m_59.x = _414;
    out.m_59.y = _416;
    out.m_59.z = _418;
    out.m_59.w = _420;
    bool _422 = !_388;
    float _440;
    if (!_422)
    {
        float _424 = in.m_55.x;
        float _426 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].w;
        float _428 = _424 * (*spvDescriptorSet0.vp_c9)._m0[13].x;
        float _430 = fma(_428, (*spvDescriptorSet0.vp_c9)._m0[11].w, _144);
        float _432 = _430 * _426;
        float _434 = floor(_432);
        float _436 = -_434;
        float _438 = _432 + _436;
        _440 = _438;
        _442 = true;
    }
    else
    {
        float _444 = float(_110);
        float _446 = 1.0 / _444;
        float _448 = _144 * _446;
        _440 = _448;
    }
    _442 = false;
    float _450 = _440;
    float _452 = in.m_55.x;
    float _454 = in.m_55.y;
    float _456 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _458 = log2(_456);
    float _460 = _312 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _462 = in.m_46.x;
    float _464 = in.m_46.y;
    float _466 = in.m_46.z;
    float _468 = _316 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _470 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    float _472 = in.m_55.z;
    float _474 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].y);
    int _476 = int(_474);
    float _478 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    bool _480 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _482 = isnan(0.0);
    bool _484 = _480 || _482;
    bool _486 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _488 = _484 || _486;
    float _490 = _458 * _144;
    float _492 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].x);
    int _494 = int(_492);
    float _496 = _452 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    float _498 = _454 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    float _500 = _452 * 2.0;
    float _502 = exp2(_490);
    float _504 = -_470;
    float _506 = fma(_496, 2.0, _504);
    float _508 = fma(_498, -2.0, _478);
    float _510 = _454 + _452;
    float _512 = _464 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _514 = _464 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _516 = _464 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _518 = _510 + (-1.0);
    float _520 = floor(_500);
    float _522 = _454 * 2.0;
    float _524 = fma(_462, (*spvDescriptorSet0.vp_c10)._m0[6].x, _516);
    float _526 = _472 * 2.0;
    float _528 = fma(_462, (*spvDescriptorSet0.vp_c10)._m0[4].x, _512);
    float _530 = fma(_462, (*spvDescriptorSet0.vp_c10)._m0[5].x, _514);
    float _532 = fma(_518, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    float _534 = _454 + _472;
    float _536 = floor(_522);
    float _538 = float(_476);
    float _540 = _534 + (-1.0);
    bool _542 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _544 = isnan(1.0);
    bool _546 = _542 || _544;
    bool _548 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _550 = _546 || _548;
    float _552 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _554 = 1.0 + _552;
    float _556 = -_502;
    float _558 = _556 + 1.0;
    bool _560 = _520 > 0.0;
    float _562 = floor(_526);
    float _564 = fma(_144, (*spvDescriptorSet0.vp_c9)._m0[76].y, _508);
    bool _566 = _520 >= 0.0;
    bool _568 = isnan(_520);
    bool _570 = _566 || _568;
    bool _572 = isnan(0.0);
    bool _574 = _570 || _572;
    float _576 = fma(_466, (*spvDescriptorSet0.vp_c10)._m0[5].z, _530);
    float _578 = _488 ? _558 : 0.0;
    float _580 = fma(_540, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    float _582 = 1.0 / _538;
    bool _584 = _536 > 0.0;
    float _586 = _576 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    bool _588 = _536 >= 0.0;
    bool _590 = isnan(_536);
    bool _592 = _588 || _590;
    bool _594 = isnan(0.0);
    bool _596 = _592 || _594;
    float _598 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    float _600 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    float _602 = float(_494);
    float _604 = 1.0 / _554;
    bool _606 = _562 > 0.0;
    float _608 = fma(_452, (*spvDescriptorSet0.vp_c9)._m0[78].z, _598);
    bool _610 = _562 >= 0.0;
    bool _612 = isnan(_562);
    bool _614 = _610 || _612;
    bool _616 = isnan(0.0);
    bool _618 = _614 || _616;
    float _620 = fma(_454, (*spvDescriptorSet0.vp_c9)._m0[78].w, _600);
    int _622 = _574 ? 0 : 1;
    float _624 = _602 * _144;
    int _626 = _618 ? 0 : 1;
    float _628 = _582 * _144;
    float _630 = -_144;
    float _632 = fma(_630, (*spvDescriptorSet0.vp_c9)._m0[76].x, _506);
    float _634 = fma(_144, (*spvDescriptorSet0.vp_c9)._m0[77].z, _608);
    int _636 = ~_622;
    int _638 = _636 + 1;
    int _640 = _638 + 1;
    float _642 = fma(_144, (*spvDescriptorSet0.vp_c9)._m0[77].w, _620);
    int _644 = _640;
    if (!_560)
    {
        int _646 = ~_622;
        int _648 = _646 + 1;
        _644 = _648;
    }
    int _650 = _644;
    float _652 = fma(_466, (*spvDescriptorSet0.vp_c10)._m0[6].z, _524);
    int _654 = _596 ? 0 : 1;
    if (_550)
    {
        float _656 = _578 * _604;
        _148 = _656;
    }
    float _658 = _148;
    int _660 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 16;
    bool _662 = _660 != 0;
    int _664 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 32;
    bool _666 = _664 != 0;
    int _668 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 64;
    bool _670 = _668 != 0;
    float _672 = fma(_466, (*spvDescriptorSet0.vp_c10)._m0[4].z, _528);
    int _674 = ~_654;
    int _676 = _674 + 1;
    int _678 = _676 + 1;
    float _680 = _652 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    int _682 = _678;
    if (!_584)
    {
        int _684 = ~_654;
        int _686 = _684 + 1;
        _682 = _686;
    }
    int _688 = _682;
    float _690 = _672 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    bool _692 = !_666;
    int _694 = _692 ? 0 : 1;
    float _696 = in.m_61.x;
    float _698 = in.m_61.y;
    float _700 = in.m_61.z;
    bool _702 = !_662;
    int _704 = _702 ? 0 : 1;
    float _706 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _708 = _690 + _706;
    bool _710 = !_670;
    int _712 = _710 ? 0 : 1;
    int _714 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _716 = _714 != 0;
    int _718 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _720 = _718 != 0;
    int _722 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _724 = _722 != 0;
    float _726 = float(_650);
    int _728 = ~_626;
    int _730 = _728 + 1;
    int _732 = _730 + 1;
    bool _734 = !_716;
    int _736 = _734 ? 0 : 1;
    bool _738 = !_720;
    int _740 = _738 ? 0 : 1;
    int _742 = abs(_736);
    float _744 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _746 = _586 + _744;
    int _748 = abs(_740);
    int _750 = _732;
    if (!_606)
    {
        int _752 = ~_626;
        int _754 = _752 + 1;
        _750 = _754;
    }
    int _756 = _750;
    float _758 = _746 * _746;
    float _760 = float(_748);
    float _762 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _764 = _680 + _762;
    float _766 = fma(_708, _708, _758);
    float _768 = _760 * _726;
    float _770 = float(_742);
    float _772 = fma(_764, _764, _766);
    float _774 = float(_756);
    float _776 = _768 * (-2.0);
    float _778 = _454 + (-0.5);
    float _780 = sqrt(_772);
    bool _782 = !_724;
    int _784 = _782 ? 0 : 1;
    float _786 = fma(_776, _698, _698);
    float _788 = fma(_580, _776, _580);
    float _790 = _770 * _774;
    int _792 = abs(_784);
    float _794 = fma(_778, (*spvDescriptorSet0.vp_c9)._m0[196].y, _786);
    float _796 = _314 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _798 = rsqrt(_772);
    float _800 = float(_688);
    float _802 = _472 + _452;
    float _804 = float(_792);
    float _806 = _796 * (*spvDescriptorSet0.vp_c13)._m0[2].y;
    float _808 = _790 * (-2.0);
    float _810 = _802 + (-1.0);
    float _812 = _472 + (-0.5);
    float _814 = _780 * (*spvDescriptorSet0.vp_c13)._m0[2].x;
    float _816 = _804 * _800;
    float _818 = fma(_810, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _820 = _452 + (-0.5);
    float _822 = fma(_808, _696, _696);
    float _824 = precise::min(_806, _814);
    float _826 = _816 * (-2.0);
    float _828 = fma(_532, _808, _532);
    float _830 = fma(_820, (*spvDescriptorSet0.vp_c9)._m0[196].x, _822);
    float _832 = fma(_788, _658, _794);
    float _834 = _798 * _824;
    float _836 = fma(_818, _826, _818);
    float _838 = fma(_826, _700, _700);
    float _840 = fma(_828, _658, _830);
    float _842 = _746 * _834;
    float _844 = _832 * 0.15915493667125701904296875;
    float _846 = fma(_812, (*spvDescriptorSet0.vp_c9)._m0[196].z, _838);
    float _848 = _708 * _834;
    float _850 = -_842;
    float _852 = _746 + _850;
    float _854 = _840 * 0.15915493667125701904296875;
    float _856 = _764 * _834;
    float _858 = -_848;
    float _860 = _708 + _858;
    float _862 = _852 * _852;
    float _864 = fma(_836, _658, _846);
    float _866 = -_856;
    float _868 = _764 + _866;
    float _870 = _844 * 6.283185482025146484375;
    float _872 = sin(_870);
    float _874 = fma(_860, _860, _862);
    float _876 = _864 * 0.15915493667125701904296875;
    float _878 = in.m_63.x;
    float _880 = in.m_63.y;
    float _882 = in.m_63.z;
    float _884 = fma(_868, _868, _874);
    float _886 = _844 * 6.283185482025146484375;
    float _888 = cos(_886);
    float _890 = sqrt(_884);
    float _892 = _854 * 6.283185482025146484375;
    float _894 = sin(_892);
    float _896 = _854 * 6.283185482025146484375;
    float _898 = cos(_896);
    float _900 = _798 * _890;
    float _902 = _460 * _900;
    float _904 = _796 * _900;
    float _906 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _880);
    float _908 = _876 * 6.283185482025146484375;
    float _910 = cos(_908);
    float _912 = _894 * _872;
    float _914 = _894 * _888;
    float _916 = _902 * _906;
    float _918 = _468 * _900;
    float _920 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _882);
    float _922 = _876 * 6.283185482025146484375;
    float _924 = sin(_922);
    float _926 = _898 * _888;
    float _928 = _898 * _872;
    float _930 = _918 * _920;
    float _932 = _894 * _910;
    float _934 = _888 * _910;
    float _936 = _898 * _910;
    float _938 = _872 * _910;
    float _940 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _878);
    float _942 = _936 * _916;
    float _944 = fma(_924, _926, _912);
    float _946 = _904 * _940;
    float _948 = -_914;
    float _950 = fma(_924, _928, _948);
    float _952 = -_916;
    float _954 = _924 * _952;
    float _956 = -_928;
    float _958 = fma(_924, _914, _956);
    float _960 = fma(_944, _946, _942);
    float _962 = _932 * _916;
    float _964 = fma(_934, _946, _954);
    float _966 = fma(_924, _912, _926);
    float _968 = fma(_950, _930, _960);
    float _970 = fma(_958, _946, _962);
    float _972 = fma(_938, _930, _964);
    float _974 = _968 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _976 = fma(_966, _930, _970);
    float _978 = _968 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _980 = _968 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _982 = fma(_972, (*spvDescriptorSet0.vp_c8)._m0[26].x, _974);
    float _984 = fma(_972, (*spvDescriptorSet0.vp_c8)._m0[24].x, _978);
    float _986 = fma(_976, (*spvDescriptorSet0.vp_c8)._m0[26].z, _982);
    float _988 = fma(_976, (*spvDescriptorSet0.vp_c8)._m0[24].z, _984);
    float _990 = _986 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _992 = _988 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _994 = _680 + _990;
    float _996 = _690 + _992;
    float _998 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1000 = _994 + _998;
    float _1002 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1004 = _996 + _1002;
    float _1006 = _1000 * _1000;
    float _1008 = fma(_1004, _1004, _1006);
    float _1010 = fma(_972, (*spvDescriptorSet0.vp_c8)._m0[25].x, _980);
    float _1012 = -_842;
    float _1014 = _586 + _1012;
    float _1016 = -_848;
    float _1018 = _690 + _1016;
    float _1020 = sqrt(_1008);
    float _1022 = fma(_976, (*spvDescriptorSet0.vp_c8)._m0[25].z, _1010);
    float _1024 = _1014 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _1026 = -_856;
    float _1028 = _680 + _1026;
    float _1030 = _1022 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _1032 = fma(_1018, (*spvDescriptorSet0.vp_c8)._m0[11].x, _1024);
    float _1034 = _586 + _1030;
    float _1036 = fma(_1028, (*spvDescriptorSet0.vp_c8)._m0[11].z, _1032);
    bool _1038 = _1020 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1040 = _1030;
    float _1042 = _1032;
    float _1044 = _996;
    float _1046 = _856;
    float _1048 = _842;
    float _1050 = _848;
    float _1052 = _1008;
    float _1054 = _878;
    if (!_1038)
    {
        _1040 = _994;
    }
    float _1056 = _1040;
    float _1058 = _1056;
    if (!_1038)
    {
        _1042 = _1034;
    }
    float _1060 = _1042;
    bool _1062 = !_1038;
    float _1064 = _1060;
    if (!_1062)
    {
        float _1066 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1068 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1070 = _1020 + _1068;
        float _1072 = _1034 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1074 = rsqrt(_1008);
        float _1076 = _1070 * _1066;
        float _1078 = _1076 * 0.15915493667125701904296875;
        float _1080 = _1078 * 6.283185482025146484375;
        float _1082 = sin(_1080);
        float _1084 = _1078 * 6.283185482025146484375;
        float _1086 = cos(_1084);
        float _1088 = fma(_1082, _1072, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1090 = _1074 * _1088;
        float _1092 = _1086 + (-1.0);
        float _1094 = fma(_1004, _1090, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1096 = fma(_1000, _1090, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        float _1098 = _1092 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1100 = fma(_1034, _1086, _1098);
        _1064 = _1100;
        _1044 = _1094;
        _1058 = _1096;
    }
    float _1102 = _1064;
    float _1104 = _1044;
    float _1106 = _1058;
    float _1108 = -_586;
    float _1110 = _1108 + _1102;
    float _1112 = _1036 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _1114 = -_690;
    float _1116 = _1114 + _1104;
    float _1118 = -_680;
    float _1120 = _1118 + _1106;
    float _1122 = _1110 * _1110;
    float _1124 = 1.0 / _1112;
    float _1126 = -_848;
    float _1128 = _1126 + _1104;
    float _1130 = fma(_1116, _1116, _1122);
    float _1132 = _1014 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _1134 = -_856;
    float _1136 = _1134 + _1106;
    float _1138 = fma(_1120, _1120, _1130);
    float _1140 = fma(_1018, (*spvDescriptorSet0.vp_c8)._m0[10].x, _1132);
    bool _1142 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[660].y;
    bool _1144 = isnan(0.5);
    bool _1146 = _1142 || _1144;
    bool _1148 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _1150 = _1146 || _1148;
    float _1152 = sqrt(_1138);
    float _1154 = fma(_1028, (*spvDescriptorSet0.vp_c8)._m0[10].z, _1140);
    bool _1156 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[653].w;
    bool _1158 = isnan(0.5);
    bool _1160 = _1156 || _1158;
    bool _1162 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _1164 = _1160 || _1162;
    float _1166 = _1154 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _1168 = _1166 + _1112;
    float _1170 = -_842;
    float _1172 = _1170 + _1102;
    float _1174 = _1168 * _1124;
    float _1176 = _1174 * 0.5;
    bool _1178 = _1152 > 0.0;
    float _1180 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _1182 = fma(_1176, (*spvDescriptorSet0.vp_c8)._m0[30].w, _1180);
    float _1184 = 1.0 / _1182;
    float _1186 = _1152;
    float _1188 = _1102;
    float _1190 = _1182;
    float _1192 = _1124;
    float _1194 = _1136;
    if (!_1178)
    {
        _1046 = _1128;
    }
    float _1196 = _1046;
    float _1198 = _1196;
    if (!_1178)
    {
        _1048 = _1172;
    }
    float _1200 = _1048;
    float _1202 = _1200;
    if (!_1178)
    {
        _1186 = _1136;
    }
    float _1204 = _1186;
    bool _1206 = !_1178;
    float _1208 = _1204;
    float _1210 = _1204;
    if (!_1206)
    {
        float _1212 = _188 * _188;
        float _1214 = fma(_186, _186, _1212);
        float _1216 = fma(_190, _190, _1214);
        float _1218 = rsqrt(_1138);
        float _1220 = sqrt(_1216);
        float _1222 = _1110 * _1218;
        float _1224 = _1116 * _1218;
        float _1226 = _1120 * _1218;
        bool _1228 = _1220 > 0.0;
        float _1230 = _1220;
        float _1232 = _1218;
        _1050 = _1216;
        _1188 = _1224;
        _1190 = _1222;
        if (!_1228)
        {
            _1230 = _1128;
        }
        float _1234 = _1230;
        _1198 = _1234;
        if (!_1228)
        {
            _1232 = _1172;
        }
        float _1236 = _1232;
        _1202 = _1236;
        if (!_1228)
        {
            _1208 = _1136;
        }
        float _1238 = _1208;
        bool _1240 = !_1228;
        _1210 = _1238;
        if (!_1240)
        {
            float _1242 = rsqrt(_1216);
            float _1244 = 1.0 / (*spvDescriptorSet0.vp_c10)._m0[2].z;
            float _1246 = _188 * _1242;
            float _1248 = _186 * _1242;
            float _1250 = _190 * _1242;
            float _1252 = _1222 * _1246;
            float _1254 = fma(_1224, _1248, _1252);
            float _1256 = _1244 * (*spvDescriptorSet0.vp_c9)._m0[142].x;
            float _1258 = fma(_1226, _1250, _1254);
            float _1260 = _1258 * _1256;
            float _1262 = fma(_186, _1260, _1128);
            float _1264 = fma(_188, _1260, _1172);
            float _1266 = fma(_190, _1260, _1136);
            _1198 = _1262;
            _1202 = _1264;
            _1210 = _1266;
        }
    }
    float _1268 = _1198;
    float _1270 = _1202;
    float _1272 = _1210;
    float _1274 = _1050;
    float _1276 = _1188;
    float _1278 = _1190;
    float _1280 = _1270;
    float _1282 = _1268;
    float _1284 = _1272;
    float _1286 = _1278;
    float _1288 = _1274;
    float _1290 = _1276;
    if (_1164)
    {
        _1192 = 1.0;
    }
    float _1292 = _1192;
    float _1294 = _1292;
    if (!_1150)
    {
        float _1296 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
        float _1298 = _1014 + _1296;
        float _1300 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
        float _1302 = _1018 + _1300;
        float _1304 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1306 = _1298 * _1298;
        float _1308 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
        float _1310 = _1028 + _1308;
        float _1312 = fma(_1302, _1302, _1306);
        float _1314 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _1316 = fma(_1310, _1310, _1312);
        float _1318 = sqrt(_1316);
        float _1320 = _1304 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1322 = precise::min(_1318, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _1324 = _1322 * _1314;
        float _1326 = -_1018;
        float _1328 = _1326 + _1268;
        float _1330 = _1320 * _1324;
        float _1332 = -_1014;
        float _1334 = _1332 + _1270;
        float _1336 = -_1028;
        float _1338 = _1336 + _1272;
        float _1340 = fma(_1328, _1330, _1018);
        float _1342 = fma(_1334, _1330, _1014);
        float _1344 = fma(_1338, _1330, _1028);
        _1280 = _1342;
        _1282 = _1340;
        _1284 = _1344;
    }
    float _1346 = _1280;
    float _1348 = _1282;
    float _1350 = _1284;
    if (_1164)
    {
        _1286 = 1.0;
    }
    float _1352 = _1286;
    float _1354 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _1356 = _1184 * _1354;
    float _1358 = _1352;
    if (!_1164)
    {
        float _1360 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1362 = _1360 * 0.15915493667125701904296875;
        float _1364 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1366 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1368 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _1366;
        float _1370 = _1362 * 6.283185482025146484375;
        float _1372 = cos(_1370);
        float _1374 = _1364 * 0.15915493667125701904296875;
        float _1376 = _1362 * 6.283185482025146484375;
        float _1378 = sin(_1376);
        float _1380 = 1.0 / _1372;
        float _1382 = _1374 * 6.283185482025146484375;
        float _1384 = cos(_1382);
        float _1386 = _1378 * _1380;
        float _1388 = _1374 * 6.283185482025146484375;
        float _1390 = sin(_1388);
        float _1392 = _1384 * _1386;
        float _1394 = 1.0 / _1368;
        float _1396 = 1.0 / _1392;
        float _1398 = _1390 * _1396;
        float _1400 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1402 = fma(_1356, _1398, _1400);
        float _1404 = _1402 * _1394;
        float _1406 = precise::clamp(_1404, 0.0, 1.0);
        _1288 = _1374;
        _1294 = _1406;
    }
    float _1408 = _1288;
    float _1410 = _1294;
    if (!_1164)
    {
        float _1412 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1414 = _1412 * 0.15915493667125701904296875;
        float _1416 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1418 = _1414 * 6.283185482025146484375;
        float _1420 = cos(_1418);
        float _1422 = _1416 * 0.15915493667125701904296875;
        float _1424 = _1414 * 6.283185482025146484375;
        float _1426 = sin(_1424);
        float _1428 = 1.0 / _1420;
        float _1430 = _1422 * 6.283185482025146484375;
        float _1432 = cos(_1430);
        float _1434 = _1426 * _1428;
        float _1436 = _1422 * 6.283185482025146484375;
        float _1438 = sin(_1436);
        float _1440 = _1432 * _1434;
        float _1442 = 1.0 / _1440;
        float _1444 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _1446 = (*spvDescriptorSet0.vp_c9)._m0[140].w + _1444;
        float _1448 = 1.0 / _1446;
        float _1450 = _1438 * _1442;
        float _1452 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _1454 = fma(_1356, _1450, _1452);
        float _1456 = _1454 * _1448;
        float _1458 = precise::clamp(_1456, 0.0, 1.0);
        float _1460 = -_1458;
        float _1462 = _1460 + 1.0;
        _1358 = _1462;
    }
    float _1464 = _1358;
    float _1466 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1468 = _1346 + _1466;
    float _1470 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1472 = _1348 + _1470;
    float _1474 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1476 = _1350 + _1474;
    float _1478 = _1346 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1480 = _1468 * _1468;
    float _1482 = _1346 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1484 = fma(_1348, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1478);
    float _1486 = fma(_1472, _1472, _1480);
    float _1488 = fma(_1348, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1482);
    float _1490 = fma(_1350, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1484);
    float _1492 = fma(_1476, _1476, _1486);
    float _1494 = fma(_1350, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1488);
    float _1496 = _1490 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1498 = rsqrt(_1492);
    float _1500 = _1494 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1502 = sqrt(_1492);
    float _1504 = _1498 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1506 = _1472 * _1504;
    float _1508 = _1476 * _1504;
    float _1510 = _1506 * _1506;
    float _1512 = _1508 * _1508;
    float _1514 = _1510 + _1512;
    float _1516 = sqrt(_1514);
    bool _1518 = _1516 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1520 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1522 = _1516 + _1520;
    float _1524 = _1480;
    float _1526 = _1514;
    float _1528 = _1522;
    float _1530 = _1506;
    float _1532 = _1508;
    float _1534 = _1510;
    if (_1518)
    {
        float _1536 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1524 = _1536;
    }
    float _1538 = _1524;
    if (_1518)
    {
        float _1540 = rsqrt(_1514);
        _1526 = _1540;
    }
    float _1542 = _1526;
    float _1544 = _1542;
    if (_1518)
    {
        float _1546 = _1522 * _1538;
        _1528 = _1546;
    }
    float _1548 = _1528;
    if (_1518)
    {
        float _1550 = _1548 * 0.15915493667125701904296875;
        _1052 = _1550;
    }
    float _1552 = _1052;
    float _1554 = _1538;
    if (_1518)
    {
        float _1556 = _1552 * 6.283185482025146484375;
        float _1558 = sin(_1556);
        _1554 = _1558;
    }
    float _1560 = _1554;
    float _1562 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _1564 = precise::max(0.0, _1562);
    float _1566 = _1408;
    if (_1518)
    {
        float _1568 = _1552 * 6.283185482025146484375;
        float _1570 = cos(_1568);
        _1566 = _1570;
    }
    float _1572 = _1566;
    float _1574 = -_1504;
    float _1576 = -_1564;
    float _1578 = fma(_1468, _1574, _1576);
    if (_1518)
    {
        float _1580 = _1578 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1194 = _1580;
    }
    float _1582 = _1194;
    float _1584 = _1496 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _1586 = fma(_1018, (*spvDescriptorSet0.vp_c15)._m0[652].x, (*spvDescriptorSet0.vp_c15)._m0[652].z);
    float _1588 = _1560;
    float _1590 = _1582;
    if (_1518)
    {
        float _1592 = fma(_1560, _1582, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1290 = _1592;
    }
    float _1594 = _1290;
    float _1596 = _1594;
    if (!_1518)
    {
        _1588 = _1578;
    }
    float _1598 = _1588;
    float _1600 = floor(_1586);
    float _1602 = _1598;
    float _1604 = _1572;
    if (_1518)
    {
        float _1606 = _1572 + (-1.0);
        _1590 = _1606;
    }
    float _1608 = _1590;
    if (_1518)
    {
        float _1610 = _1542 * _1594;
        _1596 = _1610;
    }
    float _1612 = _1596;
    if (_1518)
    {
        float _1614 = _1608 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1544 = _1614;
    }
    float _1616 = _1544;
    if (_1518)
    {
        float _1618 = _1506 * _1612;
        _1530 = _1618;
    }
    float _1620 = _1530;
    if (_1518)
    {
        float _1622 = _1508 * _1612;
        _1532 = _1622;
    }
    float _1624 = _1532;
    if (_1518)
    {
        float _1626 = fma(_1578, _1572, _1616);
        _1602 = _1626;
    }
    float _1628 = _1602;
    if (_1518)
    {
        float _1630 = _1620 * _1620;
        _1534 = _1630;
    }
    float _1632 = _1534;
    if (!_1518)
    {
        _1604 = _1512;
    }
    float _1634 = _1604;
    float _1636 = _1634;
    if (_1518)
    {
        float _1638 = _1624 * _1624;
        _1636 = _1638;
    }
    float _1640 = _1636;
    float _1642 = _1346 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1644 = fma(_1628, _1628, _1632);
    float _1646 = fma(_1348, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1642);
    float _1648 = _1644 + _1640;
    float _1650 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _1652 = _1346 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1654 = fma(_1350, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1646);
    float _1656 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _1658 = fma(_1502, (*spvDescriptorSet0.vp_c15)._m0[23].w, _1656);
    float _1660 = precise::clamp(_1658, 0.0, 1.0);
    float _1662 = fma(_1348, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1652);
    float _1664 = _1654 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1666 = rsqrt(_1648);
    float _1668 = -_1660;
    float _1670 = _1668 + 1.0;
    float _1672 = fma(_1350, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1662);
    float _1674 = -_1584;
    float _1676 = fma(_1674, _1650, 1.0);
    float _1678 = fma(_1028, (*spvDescriptorSet0.vp_c15)._m0[652].y, (*spvDescriptorSet0.vp_c15)._m0[652].w);
    float _1680 = _1664 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1682 = _1672 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1684 = _1664 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1686 = abs(_1670);
    float _1688 = log2(_1686);
    float _1690 = fma(_1682, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1684);
    float _1692 = fma(_1496, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1690);
    float _1694 = _1666 * _1620;
    float _1696 = _1666 * _1628;
    float _1698 = floor(_1678);
    float _1700 = fma(_1500, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1692);
    float _1702 = _1694 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _1704 = _1666 * _1624;
    float _1706 = -_1600;
    float _1708 = _1586 + _1706;
    float _1710 = _1664 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1712 = -_1702;
    float _1714 = fma(_1696, (*spvDescriptorSet0.vp_c15)._m0[21].y, _1712);
    float _1716 = _1688 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _1718 = log2(_1676);
    float _1720 = fma(_1682, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1710);
    float _1722 = -_1704;
    float _1724 = fma(_1722, (*spvDescriptorSet0.vp_c15)._m0[21].z, _1714);
    float _1726 = fma(_1496, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1720);
    float _1728 = fma(_1724, -0.5, 0.5);
    float _1730 = fma(_1724, 0.5, 0.5);
    float _1732 = 1.0 / _1700;
    float _1734 = -_1698;
    float _1736 = _1678 + _1734;
    float _1738 = fma(_1682, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1680);
    float _1740 = fma(_1730, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _1742 = fma(_1500, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1726);
    float _1744 = _1696 + 1.0;
    float _1746 = fma(_1496, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1738);
    float _1748 = fma(_1730, _1740, -0.212114393711090087890625);
    float _1750 = exp2(_1716);
    float _1752 = _1718 * 0.693147182464599609375;
    float _1754 = fma(_1500, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1746);
    float _1756 = fma(_1730, _1748, 1.570728778839111328125);
    float _1758 = _1752 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _1760 = sqrt(_1728);
    float _1762 = _1742 * _1732;
    float _1764 = _1754 * _1732;
    float _1766 = -_1696;
    float _1768 = fma(_1750, _1744, _1766);
    float2 _5874 = float2(_1708, _1736);
    float _1770 = dm_bs(spvDescriptorSet0.vp_t_tcb_24.sample(spvDescriptorSet0.vp_t_tcb_24Smplr, select(_5874, float2(0.0), isnan(_5874)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_24, spvDescriptorSet0.vp_t_tcb_24Smplr_w, select(_5874, float2(0.0), isnan(_5874)), level(0.0)).x;
    float _1772 = fma(_1768, 0.5, 0.5);
    float _1774 = _1760 * 0.636619746685028076171875;
    float _1776 = fma(_1762, 0.5, 0.5);
    float _1778 = fma(_1764, -0.5, 0.5);
    float _1780 = -_1756;
    float _1782 = fma(_1774, _1780, 1.0);
    float3 _5899 = float3(_1776, _1778, _1758);
    float _1784 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_5899, float3(0.0), isnan(_5899)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_5899, float3(0.0), isnan(_5899)), level(0.0)).x;
    float3 _5910 = float3(_1776, _1778, _1758);
    float4 _1787 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_5910, float3(0.0), isnan(_5910)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_5910, float3(0.0), isnan(_5910)), level(0.0)).xyzw;
    float _1789 = _1787.x;
    float _1791 = _1787.y;
    float _1793 = _1787.z;
    float _1795 = _1787.w;
    float2 _5926 = float2(_1782, _1772);
    float3 _1799 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_5926, float2(0.0), isnan(_5926)), level(0.0)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_5926, float2(0.0), isnan(_5926)), level(0.0)).xyz;
    float _1801 = _1799.x;
    float _1803 = _1799.y;
    float _1805 = _1799.z;
    float _1807 = float(uint(_494));
    float _1809 = trunc(_628);
    int _1811 = int(_1809);
    bool _1813 = _494 == 0;
    out.m_65.x = _1018;
    out.m_65.y = _1014;
    out.m_65.z = _1028;
    int _1815 = abs(_712);
    float _1817 = _1688 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    bool _1819 = _454 > 0.5;
    out.m_67.w = _824;
    float _1821 = 1.0 / _1807;
    int _1823 = ~_494;
    int _1825 = _1823 + 1;
    out.m_69.x = _904;
    float _1827 = float(_110);
    out.m_71.x = _1348;
    out.m_71.y = _1346;
    out.m_71.z = _1350;
    float _1829 = float(uint(_1811));
    float _1831 = 1.0 / _1827;
    float _1833 = -(*spvDescriptorSet0.vp_c9)._m0[133].w;
    float _1835 = _1833 + (*spvDescriptorSet0.vp_c9)._m0[134].w;
    int _1837 = as_type<int>(_1821) + (-2);
    float _1839 = exp2(_1817);
    float _1841 = as_type<float>(_1837) * _1829;
    int _1843 = ~_494;
    int _1845 = _1843 + 1;
    float _1847 = 1.0 / _1835;
    float _1849 = trunc(_1841);
    float _1851 = precise::max(_1849, 0.0);
    uint _1854 = uint(_1851);
    float _1856 = -_1839;
    float _1858 = _1856 + 1.0;
    float _1860 = -(*spvDescriptorSet0.vp_c9)._m0[133].x;
    float _1862 = (*spvDescriptorSet0.vp_c9)._m0[134].x + _1860;
    float _1864 = _1862 * _1847;
    float _1866 = -(*spvDescriptorSet0.vp_c9)._m0[133].w;
    float _1868 = _450 + _1866;
    float _1870 = fma(_1864, _1868, (*spvDescriptorSet0.vp_c9)._m0[133].x);
    int _1872 = _1825 * int(_1854);
    int _1874 = _1872 + _1811;
    float _1876 = float(uint(_1874));
    float _1878 = as_type<float>(_1837) * _1876;
    int _1880 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _1882 = _1880 != 0;
    float _1884 = float(_1811);
    float _1886 = trunc(_1878);
    float _1888 = precise::max(_1886, 0.0);
    uint _1890 = uint(_1888);
    bool _1892 = !_1882;
    float _1894 = _1892 ? 7.345489978790283203125 : 1.0;
    bool _1896 = _1884 >= _602;
    bool _1898 = isnan(_1884);
    bool _1900 = _1896 || _1898;
    bool _1902 = isnan(_602);
    bool _1904 = _1900 || _1902;
    float _1906 = float(_1904);
    float _1908 = _1894 * _452;
    float _1910 = trunc(_1906);
    int _1912 = int(_1910);
    int _1914 = int(_1854) + int(_1890);
    float _1916 = floor(_1908);
    int _1918 = _1845 * _1914;
    int _1920 = _1918 + _1811;
    bool _1922 = uint(_1920) >= uint(_494);
    bool _1924 = !_1922;
    int _1926 = _1924 ? 0 : (-1);
    float _1928 = -_1916;
    float _1930 = _1908 + _1928;
    int _1932 = ~_1914;
    int _1934 = _1932 + _1926;
    int _1936 = _1934 + 1;
    float _1938 = _624 * _1831;
    int _1940 = ~_1912;
    int _1942 = _1940 + 1;
    int _1944 = _1942 + 1;
    float _1946 = _1930 * _602;
    int _1948 = _494 * _1936;
    int _1950 = _1948 + _1811;
    int _1952 = _494 + (-1);
    float _1954 = trunc(_1938);
    int _1956 = int(_1954);
    int _1958 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4096;
    bool _1960 = _1958 != 0;
    bool _1962 = !_1813;
    int _1964 = _1962 ? _1950 : (-1);
    bool _1966 = !_1960;
    int _1968 = _1966 ? 0 : 1;
    int _1970 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 128;
    bool _1972 = _1970 != 0;
    float _1974 = trunc(_1946);
    int _1976 = int(_1974);
    int _1978 = _1964 * _1944;
    int _1980 = abs(_1968);
    int _1982 = abs(_694);
    int _1984 = _1912 * _1952;
    int _1986 = _1984 + _1978;
    bool _1988 = !_1972;
    int _1990 = _1988 ? 0 : 1;
    int _1992 = _1986 * _1982;
    int _1994 = abs(_704);
    int _1996 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _1998 = _1996 != 0;
    int _2000 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _2002 = _2000 != 0;
    int _2004 = _1956 * _1994;
    int _2006 = _2004 + _1992;
    int _2008 = _1976 * _1980;
    int _2010 = _2008 + _1811;
    int _2012 = abs(_1990);
    int _2014 = ~_494;
    int _2016 = _2014 + 1;
    float _2018 = float(uint(_2010));
    int _2020 = _2010 * _1815;
    int _2022 = _2020 + _2006;
    float _2024 = in.m_73.y;
    int _2026 = _1976 * _2012;
    int _2028 = _2026 + _2022;
    int _2030 = ~_494;
    int _2032 = _2030 + 1;
    float _2034 = float(uint(_2028));
    float _2036 = as_type<float>(_1837) * _2034;
    float _2038 = trunc(_2036);
    float _2040 = precise::max(_2038, 0.0);
    uint _2042 = uint(_2040);
    int _2044 = _2032 * int(_2042);
    int _2046 = _2044 + _2028;
    float _2048 = float(uint(_2046));
    float _2050 = as_type<float>(_1837) * _2048;
    float _2052 = trunc(_2050);
    float _2054 = precise::max(_2052, 0.0);
    uint _2056 = uint(_2054);
    int _2058 = int(_2042) + int(_2056);
    int _2060 = _2016 * _2058;
    int _2062 = _2060 + _2028;
    float _2064 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _2066 = _2064 + (*spvDescriptorSet0.vp_c9)._m0[132].w;
    bool _2068 = uint(_2062) >= uint(_494);
    float _2070 = 1.0 / _2066;
    bool _2072 = !_2068;
    int _2074 = _2072 ? 0 : (-1);
    int _2076 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2097152;
    bool _2078 = _2076 != 0;
    float _2080 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _2082 = _450 + _2080;
    int _2084 = ~_2058;
    int _2086 = _2084 + _2074;
    int _2088 = _2086 + 1;
    float _2090 = -(*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _2092 = _2090 + (*spvDescriptorSet0.vp_c9)._m0[133].w;
    float _2094 = as_type<float>(_1837) * _2018;
    float _2096 = -(*spvDescriptorSet0.vp_c9)._m0[131].x;
    float _2098 = (*spvDescriptorSet0.vp_c9)._m0[132].x + _2096;
    float _2100 = -(*spvDescriptorSet0.vp_c9)._m0[132].x;
    float _2102 = _2100 + (*spvDescriptorSet0.vp_c9)._m0[133].x;
    int _2104 = _494 * _2088;
    int _2106 = _2104 + _2028;
    float _2108 = -_2024;
    float _2110 = _2108 + 1.0;
    float _2112 = 1.0 / _2092;
    bool _2114 = !_1813;
    int _2116 = _2114 ? _2106 : (-1);
    float _2118 = _2098 * _2070;
    int _2120 = ~_494;
    int _2122 = _2120 + 1;
    int _2124 = _2116 >> 31;
    float _2126 = trunc(_2094);
    float _2128 = precise::max(_2126, 0.0);
    uint _2130 = uint(_2128);
    float _2132 = fma(_2118, _2082, (*spvDescriptorSet0.vp_c9)._m0[131].x);
    float _2134 = _2024;
    float _2136 = _1700;
    float _2138 = _1754;
    float _2140 = _1742;
    if (_1998)
    {
        float _2142 = _1819 ? _2110 : _2024;
        _2134 = _2142;
    }
    float _2144 = _2134;
    int _2146 = _2124 & 3;
    bool _2148 = _450 >= (*spvDescriptorSet0.vp_c9)._m0[133].w;
    bool _2150 = isnan(_450);
    bool _2152 = _2148 || _2150;
    bool _2154 = isnan((*spvDescriptorSet0.vp_c9)._m0[133].w);
    bool _2156 = _2152 || _2154;
    float _2158 = float(_2156);
    int _2160 = _2116 + _2146;
    float _2162 = _2102 * _2112;
    bool _2164 = _450 >= (*spvDescriptorSet0.vp_c9)._m0[134].w;
    bool _2166 = isnan(_450);
    bool _2168 = _2164 || _2166;
    bool _2170 = isnan((*spvDescriptorSet0.vp_c9)._m0[134].w);
    bool _2172 = _2168 || _2170;
    float _2174 = float(_2172);
    float _2176 = -_2158;
    float _2178 = _2176 + 1.0;
    int _2180 = _2160 >> 2;
    int _2182 = _2116 & 3;
    bool _2184 = _2182 != 0;
    float _2186 = -_2174;
    float _2188 = _2186 + 1.0;
    int _2190 = _2180 << 4;
    int _2192 = _2190 + 368;
    int _2194 = _2122 * int(_2130);
    int _2196 = _2194 + _2010;
    float _2198 = _2158 * _2188;
    uint _2200 = uint(int(uint(_2192) >> uint(2)));
    uint _2202 = uint(int(uint(int(_2200)) >> uint(2)));
    int _2204 = int(_2200) & 3;
    float _2206 = (*spvDescriptorSet0.vp_c9)._m0[int(_2202)][_2204];
    int _2208 = int(_2200) + 1;
    uint _2210 = uint(int(uint(_2208) >> uint(2)));
    int _2212 = _2208 & 3;
    float _2214 = (*spvDescriptorSet0.vp_c9)._m0[int(_2210)][_2212];
    int _2216 = _2116 & 3;
    bool _2218 = _2216 != 0;
    float _2220 = float(uint(_2196));
    bool _2222 = _450 >= (*spvDescriptorSet0.vp_c9)._m0[132].w;
    bool _2224 = isnan(_450);
    bool _2226 = _2222 || _2224;
    bool _2228 = isnan((*spvDescriptorSet0.vp_c9)._m0[132].w);
    bool _2230 = _2226 || _2228;
    float _2232 = float(_2230);
    bool _2234 = uint(_2216) > 1u;
    float _2236 = as_type<float>(_1837) * _2220;
    bool _2238 = _450 >= (*spvDescriptorSet0.vp_c9)._m0[131].w;
    bool _2240 = isnan(_450);
    bool _2242 = _2238 || _2240;
    bool _2244 = isnan((*spvDescriptorSet0.vp_c9)._m0[131].w);
    bool _2246 = _2242 || _2244;
    float _2248 = float(_2246);
    float _2250 = _2232 * _2178;
    float _2252 = -_2232;
    float _2254 = _2252 + 1.0;
    int _2256 = _2184 ? 0 : 1;
    int _2258 = _2192 + 8;
    uint _2260 = uint(int(uint(_2258) >> uint(2)));
    uint _2262 = uint(int(uint(int(_2260)) >> uint(2)));
    int _2264 = int(_2260) & 3;
    float _2266 = (*spvDescriptorSet0.vp_c9)._m0[int(_2262)][_2264];
    int _2268 = int(_2260) + 1;
    uint _2270 = uint(int(uint(_2268) >> uint(2)));
    int _2272 = _2268 & 3;
    float _2274 = (*spvDescriptorSet0.vp_c9)._m0[int(_2270)][_2272];
    float _2276 = trunc(_2236);
    float _2278 = precise::max(_2276, 0.0);
    uint _2280 = uint(_2278);
    float _2282 = _2248 * _2254;
    float _2284 = -_2248;
    float _2286 = _2284 + 1.0;
    bool _2288 = uint(_2216) >= 2u;
    float _2290 = -_1770;
    float _2292 = _2290 + 1.0;
    float _2294 = _2132 * _2282;
    float _2296 = -(*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _2298 = _450 + _2296;
    int _2300 = ~_2256;
    int _2302 = _2300 + 1;
    int _2304 = _2302 + 1;
    int _2306 = _2304;
    if (!_2234)
    {
        int _2308 = ~_2256;
        int _2310 = _2308 + 1;
        _2306 = _2310;
    }
    int _2312 = _2306;
    float _2314 = fma(_2162, _2298, (*spvDescriptorSet0.vp_c9)._m0[132].x);
    bool _2316 = _2216 != 3;
    float _2318 = fma(_2286, (*spvDescriptorSet0.vp_c9)._m0[131].x, _2294);
    int _2320 = ~_494;
    int _2322 = _2320 + 1;
    int _2324 = abs(_2312);
    float _2326 = fma(_2314, _2250, _2318);
    int _2328 = int(_2130) + int(_2280);
    bool _2330 = !_2218;
    int _2332 = _2330 ? 0 : 1;
    int _2334 = _2288 ? 0 : 1;
    int _2336 = abs(_2332);
    int _2338 = ~_2324;
    int _2340 = _2338 + 1;
    int _2342 = _2340 + 1;
    int _2344 = _2322 * _2328;
    int _2346 = _2344 + _2010;
    int _2348 = ~_2334;
    int _2350 = _2348 + 1;
    int _2352 = _2350 + 1;
    float _2354 = fma(_1870, _2198, _2326);
    int _2356 = _2352;
    if (_2316)
    {
        int _2358 = ~_2334;
        int _2360 = _2358 + 1;
        _2356 = _2360;
    }
    int _2362 = _2356;
    float _2364 = _936 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    int _2366 = ~_2336;
    int _2368 = _2366 + 1;
    int _2370 = _2368 + 1;
    int _2372 = _2342 * as_type<int>(_2214);
    int _2374 = abs(_2362);
    bool _2376 = _2216 != 3;
    int _2378 = _2370 * as_type<int>(_2206);
    int _2380 = _2378 + _2372;
    bool _2382 = uint(_2346) >= uint(_494);
    float _2384 = trunc((*spvDescriptorSet0.vp_c9)._m0[80].z);
    int _2386 = int(_2384);
    float _2388 = as_type<float>(_2346);
    if (_2002)
    {
        float _2390 = in.m_55.x;
        _2388 = _2390;
    }
    float _2392 = _2388;
    bool _2394 = !_2376;
    int _2396 = _2394 ? 0 : (-1);
    bool _2398 = !_2382;
    int _2400 = _2398 ? 0 : (-1);
    int _2402 = ~_2374;
    int _2404 = _2402 + 1;
    int _2406 = _2404 + 1;
    int _2408 = abs(_2396);
    bool _2410 = !_2078;
    int _2412 = _2410 ? 0 : 1;
    int _2414 = ~_2328;
    int _2416 = _2414 + _2400;
    int _2418 = _2416 + 1;
    int _2420 = _2406 * as_type<int>(_2266);
    int _2422 = _2420 + _2380;
    int _2424 = abs(_2412);
    float _2426 = in.m_73.x;
    int _2428 = ~_2408;
    int _2430 = _2428 + 1;
    int _2432 = _2430 + 1;
    int _2434 = _494 * _2418;
    int _2436 = _2434 + _2010;
    bool _2438 = _880 != 0.0;
    bool _2440 = isnan(_880);
    bool _2442 = _2438 || _2440;
    bool _2444 = isnan(0.0);
    bool _2446 = _2442 || _2444;
    float _2448 = in.m_75.x;
    float _2450 = in.m_75.y;
    float _2452 = in.m_75.z;
    int _2454 = ~_2424;
    int _2456 = _2454 + 1;
    int _2458 = _2456 + 1;
    int _2460 = _2432 * as_type<int>(_2274);
    int _2462 = _2460 + _2422;
    float _2464 = float(uint(_2386));
    int _2466 = abs(_2386);
    int _2468 = _2462 * _2458;
    bool _2470 = _878 == 0.0;
    bool _2472 = !_2446;
    bool _2474 = _2470 && _2472;
    bool _2476 = !_1813;
    int _2478 = _2476 ? _2436 : (-1);
    float _2480 = 1.0 / _2464;
    float _2482 = fma(_2174, (*spvDescriptorSet0.vp_c9)._m0[134].x, _2354);
    bool _2484 = _882 == 0.0;
    bool _2486 = _2484 && _2474;
    int _2488 = _2478 * _2424;
    int _2490 = _2488 + _2468;
    float _2492 = float(uint(_2466));
    float _2494 = _2482 * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    bool _2496 = _2392 > 0.5;
    bool _2498 = _2496 && _2002;
    float _2500 = _2392;
    if (_2002)
    {
        _2500 = _2426;
    }
    float _2502 = _2500;
    float _2504 = 1.0 / _2492;
    int _2506 = abs(_2490);
    float _2508 = _2448;
    float _2510 = _2452;
    float _2512 = _2502;
    float _2514 = _2450;
    if (!_2486)
    {
        float _2516 = fma(_878, (*spvDescriptorSet0.vp_c9)._m0[17].y, _2448);
        _2508 = _2516;
    }
    float _2518 = _2508;
    if (!_2002)
    {
        _1054 = _2426;
    }
    float _2520 = _1054;
    float _2522 = _2520;
    if (!_2486)
    {
        float _2524 = fma(_882, (*spvDescriptorSet0.vp_c9)._m0[17].y, _2452);
        _2510 = _2524;
    }
    float _2526 = _2510;
    int _2528 = as_type<int>(_2480) + (-2);
    if (_2498)
    {
        float _2530 = -_2502;
        float _2532 = _2530 + 1.0;
        _2512 = _2532;
    }
    float _2534 = _2512;
    float _2536 = float(uint(_2490));
    float _2538 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    if (!_2486)
    {
        float _2540 = fma(_880, (*spvDescriptorSet0.vp_c9)._m0[17].y, _2450);
        _2514 = _2540;
    }
    float _2542 = _2514;
    float _2544 = as_type<float>(_2528) * _2536;
    float _2546 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    int _2548 = as_type<int>(_2504) + (-2);
    float _2550 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _2552 = float(uint(_2506));
    float _2554 = trunc(_2544);
    float _2556 = precise::max(_2554, 0.0);
    uint _2558 = uint(_2556);
    float _2560 = _2538 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2562 = _2546 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2564 = _2550 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2566 = as_type<float>(_2548) * _2552;
    if (_2002)
    {
        _2522 = _2534;
    }
    float _2568 = _2522;
    float _2570 = _936 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    int _2572 = ~_2386;
    int _2574 = _2572 + 1;
    out.m_77.x = _2560;
    out.m_77.y = _2562;
    out.m_77.z = _2564;
    out.m_77.w = _2494;
    int _2576 = ~_2466;
    int _2578 = _2576 + 1;
    float _2580 = trunc(_2566);
    float _2582 = precise::max(_2580, 0.0);
    uint _2584 = uint(_2582);
    float _2586 = _936 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _2588 = -_924;
    float _2590 = fma(_2588, (*spvDescriptorSet0.vp_c8)._m0[24].x, _2570);
    float _2592 = fma(_932, (*spvDescriptorSet0.vp_c8)._m0[24].z, _2590);
    float _2594 = abs(_1356);
    float _2596 = log2(_2594);
    int _2598 = _2574 * int(_2558);
    int _2600 = _2598 + _2490;
    float _2602 = -_924;
    float _2604 = fma(_2602, (*spvDescriptorSet0.vp_c8)._m0[25].x, _2364);
    float _2606 = -_924;
    float _2608 = fma(_2606, (*spvDescriptorSet0.vp_c8)._m0[26].x, _2586);
    float _2610 = float(uint(_2600));
    float _2612 = fma(_932, (*spvDescriptorSet0.vp_c8)._m0[25].z, _2604);
    int _2614 = _2578 * int(_2584);
    int _2616 = _2614 + _2506;
    float _2618 = _944 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _2620 = _944 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _2622 = as_type<float>(_2528) * _2610;
    float _2624 = _944 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _2626 = float(uint(_2616));
    float _2628 = fma(_934, (*spvDescriptorSet0.vp_c8)._m0[24].x, _2618);
    float _2630 = fma(_934, (*spvDescriptorSet0.vp_c8)._m0[25].x, _2620);
    float _2632 = fma(_934, (*spvDescriptorSet0.vp_c8)._m0[26].x, _2624);
    float _2634 = trunc(_2622);
    float _2636 = precise::max(_2634, 0.0);
    uint _2638 = uint(_2636);
    float _2640 = as_type<float>(_2548) * _2626;
    float _2642 = _950 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _2644 = _950 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _2646 = _950 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _2648 = fma(_932, (*spvDescriptorSet0.vp_c8)._m0[26].z, _2608);
    float _2650 = fma(_938, (*spvDescriptorSet0.vp_c8)._m0[24].x, _2642);
    float _2652 = fma(_938, (*spvDescriptorSet0.vp_c8)._m0[25].x, _2644);
    float _2654 = trunc(_2640);
    float _2656 = precise::max(_2654, 0.0);
    uint _2658 = uint(_2656);
    float _2660 = fma(_938, (*spvDescriptorSet0.vp_c8)._m0[26].x, _2646);
    int _2662 = ~_2386;
    int _2664 = _2662 + 1;
    float _2666 = _2648 * _2542;
    float _2668 = _2596 * (*spvDescriptorSet0.vp_c15)._m0[654].z;
    int _2670 = ~_2466;
    int _2672 = _2670 + 1;
    float _2674 = _2592 * _2542;
    float _2676 = fma(_958, (*spvDescriptorSet0.vp_c8)._m0[24].z, _2628);
    int _2678 = int(_2558) + int(_2638);
    float _2680 = _2612 * _2542;
    float _2682 = exp2(_2668);
    float _2684 = fma(_966, (*spvDescriptorSet0.vp_c8)._m0[24].z, _2650);
    float _2686 = fma(_966, (*spvDescriptorSet0.vp_c8)._m0[25].z, _2652);
    int _2688 = _2664 * _2678;
    int _2690 = _2688 + _2490;
    int _2692 = int(_2584) + int(_2658);
    float _2694 = fma(_958, (*spvDescriptorSet0.vp_c8)._m0[25].z, _2630);
    float _2696 = fma(_958, (*spvDescriptorSet0.vp_c8)._m0[26].z, _2632);
    bool _2698 = uint(_2690) >= uint(_2386);
    int _2700 = _2672 * _2692;
    int _2702 = _2700 + _2506;
    float _2704 = fma(_2676, _2518, _2674);
    float _2706 = fma(_2696, _2518, _2666);
    bool _2708 = !_2698;
    int _2710 = _2708 ? 0 : (-1);
    float _2712 = fma(_2694, _2518, _2680);
    bool _2714 = uint(_2702) >= uint(_2466);
    float _2716 = fma(_2682, (*spvDescriptorSet0.vp_c15)._m0[654].x, (*spvDescriptorSet0.vp_c15)._m0[654].y);
    float _2718 = precise::clamp(_2716, 0.0, 1.0);
    int _2720 = ~_2678;
    int _2722 = _2720 + _2710;
    int _2724 = _2722 + 1;
    float _2726 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    bool _2728 = !_2714;
    int _2730 = _2728 ? 0 : (-1);
    float _2732 = fma(_2684, _2526, _2704);
    bool _2734 = _2386 == 0;
    float _2736 = fma(_2686, _2526, _2712);
    int _2738 = _2490 ^ _2386;
    float _2740 = fma(_966, (*spvDescriptorSet0.vp_c8)._m0[26].z, _2660);
    bool _2742 = _2386 == 0;
    int _2744 = _2386 * _2724;
    int _2746 = _2744 + _2490;
    float _2748 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    uint _2750 = uint(int(uint(_2738) >> uint(31)));
    float _2752 = fma(_2740, _2526, _2706);
    int _2754 = ~_2730;
    int _2756 = _2692 + _2754;
    int _2758 = _2756 + 1;
    float _2760 = fma(_2718, -2.0, 3.0);
    float _2762 = _2718 * _2718;
    int _2764 = ~int(_2750);
    int _2766 = _2764 + 1;
    float _2768 = _1664 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _2770 = _2726 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _2772 = _2762 * _2760;
    bool _2774 = !_2734;
    int _2776 = _2774 ? _2746 : (-1);
    float _2778 = fma(_1682, (*spvDescriptorSet0.vp_c8)._m0[6].x, _2768);
    int _2780 = _2758 ^ _2766;
    float _2782 = -_2772;
    float _2784 = _2782 + 1.0;
    float _2786 = float(_2776);
    float _2788 = fma(_2770, _2568, -0.5);
    float _2790 = _2748 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    int _2792 = ~_2766;
    int _2794 = _2792 + _2780;
    int _2796 = _2794 + 1;
    float _2798 = in.m_79.x;
    bool _2800 = _1356 <= 8000.0;
    bool _2802 = isnan(_1356);
    bool _2804 = _2800 || _2802;
    bool _2806 = isnan(8000.0);
    bool _2808 = _2804 || _2806;
    float _2810 = float(_2808);
    float _2812 = fma(_2784, (*spvDescriptorSet0.vp_c15)._m0[654].w, _2772);
    bool _2814 = !_2742;
    int _2816 = _2814 ? _2796 : (-1);
    float _2818 = fma(_2770, _2786, _632);
    float _2820 = fma(_2790, _2144, -0.5);
    float _2822 = _2810 * _2812;
    float _2824 = float(_2816);
    float _2826 = _1858 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _2828 = _2822 * (*spvDescriptorSet0.vp_c15)._m0[653].x;
    float _2830 = _1700 * 0.5;
    float _2832 = -_564;
    float _2834 = fma(_2790, _2824, _2832);
    float _2836 = fma(_634, _2788, _2818);
    float _2838 = _2292 * _2828;
    float _2840 = precise::clamp(_2838, 0.0, 1.0);
    float _2842 = _2826 * _1784;
    float _2844 = fma(_642, _2820, _2834);
    float _2846 = fma(_1754, -0.5, _2830);
    float _2848 = -_2840;
    float _2850 = fma(_2848, (*spvDescriptorSet0.vp_c15)._m0[653].y, 1.0);
    float _2852 = _2836 + 0.5;
    float _2854 = _2844 + 0.5;
    float _2856 = -_2826;
    float _2858 = _2856 + 1.0;
    float _2860 = _1795 * _2842;
    float _2862 = _1805 * _2842;
    float _2864 = _2850 * _2798;
    out.m_81.x = _2852;
    out.m_81.y = _2854;
    float _2866 = _1795 * _2858;
    float _2868 = fma(_1795, _2862, _1793);
    float _2870 = _2864 * (*spvDescriptorSet0.vp_c13)._m0[1].w;
    out.m_83.x = _2732;
    out.m_83.y = _2736;
    out.m_83.z = _2752;
    float _2872 = fma(_1496, (*spvDescriptorSet0.vp_c8)._m0[6].z, _2778);
    bool _2874 = _1502 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _2876 = isnan(_1502);
    bool _2878 = _2874 || _2876;
    bool _2880 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _2882 = _2878 || _2880;
    float _2884 = _1742 + _1700;
    out.m_85.x = _2870;
    float _2886 = fma(_1500, (*spvDescriptorSet0.vp_c8)._m0[6].w, _2872);
    float _2888 = fma(_1801, _2860, _1789);
    float _2890 = fma(_1803, _2860, _1791);
    float _2892 = _2886 + _1700;
    float _2894 = _2884 * 0.5;
    float _2896 = _1410 * _1464;
    out.m_87.x = _2888;
    out.m_87.y = _2890;
    out.m_87.z = _2868;
    out.m_87.w = _2866;
    float _2898 = _2892 * 0.5;
    out.gl_Position.x = _1742;
    out.gl_Position.y = _1754;
    out.gl_Position.z = _2886;
    out.gl_Position.w = _1700;
    out.m_89.x = _2894;
    out.m_89.y = _2846;
    out.m_89.z = _2898;
    out.m_89.w = _1700;
    float _2900 = _2886;
    float _2902 = _2894;
    float _2904 = _2896;
    if (!_2882)
    {
        _2136 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _2906 = _2136;
    float _2908 = _2906;
    float _2910 = _2906;
    if (!_2882)
    {
        _2900 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _2912 = _2900;
    float _2914 = _2896 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _2916 = _2912;
    float _2918 = _2912;
    if (!_2882)
    {
        _2902 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _2920 = _2902;
    float _2922 = _2920;
    float _2924 = _2920;
    if (!_2882)
    {
        _2138 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _2926 = _2138;
    float _2928 = _2926;
    float _2930 = _2926;
    if (!_2882)
    {
        _2140 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _2932 = _2140;
    float _2934 = _2932;
    float _2936 = _2932;
    if (!_2882)
    {
        _2904 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _2938 = _2904;
    bool _2940 = !_2882;
    float _2942 = _2938;
    float _2944 = _2938;
    if (!_2940)
    {
        bool _2946 = _1502 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _2948 = isnan(_1502);
        bool _2950 = _2946 || _2948;
        bool _2952 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _2954 = _2950 || _2952;
        if (!_2954)
        {
            float _2956 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2958 = _1502 + _2956;
            float _2960 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2962 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _2960;
            float _2964 = 1.0 / _2962;
            float _2966 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _2968 = _2966 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _2970 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _2972 = _2970 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _2974 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _2976 = _2974 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _2978 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _2980 = _2978 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _2982 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _2984 = _2982 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _2986 = _2958 * _2964;
            float _2988 = precise::clamp(_2986, 0.0, 1.0);
            float _2990 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _2992 = _2990 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _2994 = fma(_2988, _2968, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _2996 = fma(_2988, _2992, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _2998 = fma(_2988, _2972, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _3000 = fma(_2988, _2976, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _3002 = fma(_2988, _2980, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _3004 = fma(_2988, _2984, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            _2910 = _2996;
            _2936 = _3002;
            _2924 = _2994;
            _2930 = _3000;
            _2918 = _2998;
            _2944 = _3004;
            _3006 = true;
        }
        else
        {
            bool _3008 = _1502 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _3010 = isnan(_1502);
            bool _3012 = _3008 || _3010;
            bool _3014 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _3016 = _3012 || _3014;
            if (!_3016)
            {
                _2922 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _3018 = _2922;
            _2924 = _3018;
            if (!_3016)
            {
                _2908 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _3020 = _2908;
            _2910 = _3020;
            if (!_3016)
            {
                _2916 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _3022 = _2916;
            _2918 = _3022;
            if (!_3016)
            {
                _2928 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _3024 = _2928;
            _2930 = _3024;
            if (!_3016)
            {
                _2934 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _3026 = _2934;
            _2936 = _3026;
            if (!_3016)
            {
                _2942 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _3028 = _2942;
            bool _3030 = !_3016;
            _2944 = _3028;
            if (!_3030)
            {
                bool _3032 = _1502 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _3034 = isnan(_1502);
                bool _3036 = _3032 || _3034;
                bool _3038 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _3040 = _3036 || _3038;
                if (!_3040)
                {
                    float _3042 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _3044 = _1502 + _3042;
                    float _3046 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _3048 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _3046;
                    float _3050 = 1.0 / _3048;
                    float _3052 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _3054 = _3052 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _3056 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _3058 = _3056 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _3060 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _3062 = _3060 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _3064 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _3066 = _3064 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _3068 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _3070 = _3068 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _3072 = _3044 * _3050;
                    float _3074 = precise::clamp(_3072, 0.0, 1.0);
                    float _3076 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _3078 = _3076 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _3080 = fma(_3074, _3054, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _3082 = fma(_3074, _3078, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _3084 = fma(_3074, _3058, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _3086 = fma(_3074, _3062, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _3088 = fma(_3074, _3066, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _3090 = fma(_3074, _3070, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    _2910 = _3082;
                    _2936 = _3088;
                    _2924 = _3080;
                    _2930 = _3086;
                    _2918 = _3084;
                    _2944 = _3090;
                    _3006 = true;
                }
                else
                {
                    _2910 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _2936 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _2924 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _2930 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _2918 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _2944 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _3006 = false;
    float _3092 = _2910;
    float _3094 = _2936;
    float _3096 = _2924;
    float _3098 = _2930;
    float _3100 = _2918;
    float _3102 = _2944;
    float _3104 = _2914 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _3106 = fma(_2736, -0.5, 0.5);
    float _3108 = precise::clamp(_3106, 0.0, 1.0);
    float _3110 = -_3092;
    float _3112 = _3110 + _3094;
    float _3114 = -_3096;
    float _3116 = _3114 + _3098;
    out.m_49.x = _3104;
    float _3118 = fma(_3108, _3112, _3092);
    float _3120 = -_3100;
    float _3122 = _3120 + _3102;
    float _3124 = fma(_3108, _3116, _3096);
    float _3126 = _3118 * 0.586610972881317138671875;
    bool _3128 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _3130 = fma(_3108, _3122, _3100);
    out.m_91.x = 0.0;
    float _3132 = fma(_3124, 0.298911988735198974609375, _3126);
    bool _3134 = _1410 > 0.0;
    bool _3136 = isnan(_1410);
    bool _3138 = _3134 || _3136;
    bool _3140 = isnan(0.0);
    bool _3142 = _3138 || _3140;
    float _3144 = fma(_3130, 0.114477999508380889892578125, _3132);
    bool _3146 = _1464 <= 0.0;
    bool _3148 = !_3142;
    bool _3150 = _3146 || _3148;
    float _3152 = -_3144;
    float _3154 = _3124 + _3152;
    float _3156 = -_3144;
    float _3158 = _3118 + _3156;
    float _3160 = -_3144;
    float _3162 = _3130 + _3160;
    float _3164 = fma(_3154, (*spvDescriptorSet0.vp_c13)._m0[1].z, _3144);
    float _3166 = fma(_3158, (*spvDescriptorSet0.vp_c13)._m0[1].z, _3144);
    float _3168 = fma(_3162, (*spvDescriptorSet0.vp_c13)._m0[1].z, _3144);
    bool _3170 = !_3128;
    if (!_3170)
    {
        float _3172 = -_1346;
        float _3174 = _3172 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
        float _3176 = -_1348;
        float _3178 = _3176 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
        float _3180 = -_1350;
        float _3182 = _3180 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
        float _3184 = _3174 * _3174;
        float _3186 = fma(_3178, _3178, _3184);
        float _3188 = fma(_3182, _3182, _3186);
        float _3190 = sqrt(_3188);
        float _3192 = rsqrt(_3188);
        float _3194 = -_3190;
        float _3196 = _3194 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
        float _3198 = _3196 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
        float _3200 = precise::clamp(_3198, 0.0, 1.0);
        float _3202 = _3178 * _3192;
        float _3204 = _3174 * _3192;
        float _3206 = abs(_3200);
        float _3208 = log2(_3206);
        float _3210 = _3182 * _3192;
        float _3212 = _3202 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
        float _3214 = _2736 * _3204;
        float _3216 = -_3204;
        float _3218 = -_3212;
        float _3220 = fma(_3216, (*spvDescriptorSet0.vp_c15)._m0[656].y, _3218);
        float _3222 = fma(_2732, _3202, _3214);
        float _3224 = -_3210;
        float _3226 = fma(_3224, (*spvDescriptorSet0.vp_c15)._m0[656].z, _3220);
        float _3228 = fma(_2752, _3210, _3222);
        float _3230 = precise::clamp(_3228, 0.0, 1.0);
        float _3232 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
        float _3234 = _3226 + _3232;
        float _3236 = _3208 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
        float _3238 = _3234 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
        float _3240 = precise::clamp(_3238, 0.0, 1.0);
        float _3242 = exp2(_3236);
        float _3244 = _3242 * _3240;
        float _3246 = _3230 * _3244;
        float _3248 = _3246 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
        float _3250 = _3246 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
        float _3252 = _3246 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
        out.m_91.x = _3248;
        out.m_91.y = _3250;
        out.m_91.z = _3252;
    }
    out.m_67.x = _3164;
    out.m_67.y = _3166;
    out.m_67.z = _3168;
    if (!_3150)
    {
        return out;
    }
    out.m_49.x = 0.0;
    float _3254 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _3254;
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
    out.dm_pad6 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_59 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_77 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_87 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_65 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_67 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_83 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_71 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_81 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_91 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_85 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_89 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_49 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_69 = float4(0.0, 0.0, 0.0, 1.0);
    bool _3006 = false;
    bool _442 = false;
    bool _338 = false;
    bool _212 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _105 = in.m_46.w;
    float _107 = trunc(_105);
    int _110 = int(_107);
    bool _114 = _110 >= 1;
    float _116 = 0.0;
    if (!_114)
    {
        _116 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _118 = _116;
    float _120 = _118;
    if (!_114)
    {
        out.m_49.x = 0.0;
    }
    int _122 = 0;
    if (!_114)
    {
        float _124 = _118 * 5.0;
        _122 = as_type<int>(_124);
    }
    int _126 = _122;
    int _128 = _126;
    if (!_114)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _3311 = as_type<float>(_126);
        out.gl_Position.z = _3311;
    }
    if (!_114)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_59.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_59.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_59.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_59.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_77.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_77.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_77.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_77.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_87.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_87.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_87.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_87.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_65.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_65.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_65.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_65.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_67.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_67.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_67.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_67.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_83.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_83.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_83.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_83.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.dm_pad6.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.dm_pad6.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.dm_pad6.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.dm_pad6.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_71.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_71.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_71.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_71.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_81.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_81.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_81.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_81.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_91.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_91.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_91.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_91.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_85.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_85.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_85.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_85.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_89.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_89.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_89.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_89.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_49.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_49.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_49.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_49.w)); dm_cw(dm_gs, dm_p, 68, as_type<uint>(out.m_69.x)); dm_cw(dm_gs, dm_p, 69, as_type<uint>(out.m_69.y)); dm_cw(dm_gs, dm_p, 70, as_type<uint>(out.m_69.z)); dm_cw(dm_gs, dm_p, 71, as_type<uint>(out.m_69.w)); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _130 = in.m_51.w;
    bool _132 = _130 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _134 = isnan(_130);
    bool _136 = _132 || _134;
    bool _138 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _140 = _136 || _138;
    float _142 = -_130;
    float _144 = _142 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    float _146 = 0.0;
    float _148 = _144;
    if (_140)
    {
        float _150 = float(_110);
        _146 = _150;
    }
    float _152 = _146;
    bool _154 = _144 >= _152;
    bool _156 = !_140;
    bool _158 = _154 || _156;
    if (_158)
    {
        _120 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _160 = _120;
    if (_158)
    {
        out.m_49.x = 0.0;
    }
    if (_158)
    {
        float _162 = _160 * 5.0;
        _128 = as_type<int>(_162);
    }
    int _164 = _128;
    if (_158)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _3380 = as_type<float>(_164);
        out.gl_Position.z = _3380;
    }
    if (_158)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_59.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_59.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_59.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_59.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_77.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_77.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_77.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_77.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_87.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_87.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_87.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_87.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_65.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_65.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_65.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_65.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_67.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_67.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_67.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_67.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_83.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_83.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_83.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_83.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.dm_pad6.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.dm_pad6.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.dm_pad6.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.dm_pad6.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_71.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_71.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_71.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_71.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_81.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_81.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_81.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_81.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_91.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_91.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_91.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_91.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_85.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_85.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_85.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_85.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_89.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_89.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_89.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_89.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_49.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_49.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_49.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_49.w)); dm_cw(dm_gs, dm_p, 68, as_type<uint>(out.m_69.x)); dm_cw(dm_gs, dm_p, 69, as_type<uint>(out.m_69.y)); dm_cw(dm_gs, dm_p, 70, as_type<uint>(out.m_69.z)); dm_cw(dm_gs, dm_p, 71, as_type<uint>(out.m_69.w)); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _166 = in.m_53.x;
    float _168 = in.m_53.y;
    float _170 = in.m_53.z;
    bool _172 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _174 = _168 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _176 = _168 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _178 = _168 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _180 = fma(_166, (*spvDescriptorSet0.vp_c10)._m0[4].x, _174);
    float _182 = fma(_166, (*spvDescriptorSet0.vp_c10)._m0[5].x, _176);
    float _184 = fma(_166, (*spvDescriptorSet0.vp_c10)._m0[6].x, _178);
    float _186 = fma(_170, (*spvDescriptorSet0.vp_c10)._m0[4].z, _180);
    float _188 = fma(_170, (*spvDescriptorSet0.vp_c10)._m0[5].z, _182);
    float _190 = fma(_170, (*spvDescriptorSet0.vp_c10)._m0[6].z, _184);
    bool _192 = !_172;
    float _210;
    if (!_192)
    {
        float _194 = in.m_55.x;
        float _196 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _198 = _194 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _200 = fma(_198, (*spvDescriptorSet0.vp_c9)._m0[12].x, _144);
        float _202 = _200 * _196;
        float _204 = floor(_202);
        float _206 = -_204;
        float _208 = _202 + _206;
        _210 = _208;
        _212 = true;
    }
    else
    {
        float _214 = float(_110);
        float _216 = 1.0 / _214;
        float _218 = _144 * _216;
        _210 = _218;
    }
    _212 = false;
    float _220 = _210;
    float _222 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _224 = _220 + _222;
    bool _226 = _220 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _228 = isnan(_220);
    bool _230 = _226 || _228;
    bool _232 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _234 = _230 || _232;
    float _236 = float(_234);
    float _238 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _240 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _238;
    float _242 = 1.0 / _240;
    bool _244 = _220 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _246 = isnan(_220);
    bool _248 = _244 || _246;
    bool _250 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _252 = _248 || _250;
    float _254 = float(_252);
    float _256 = -_236;
    float _258 = _256 + 1.0;
    float _260 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _262 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _260;
    float _264 = -(*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _266 = (*spvDescriptorSet0.vp_c9)._m0[144].z + _264;
    bool _268 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _270 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _272 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _270;
    float _274 = _254 * _258;
    float _276 = -_254;
    float _278 = _276 + 1.0;
    float _280 = _224 * _242;
    float _282 = in.m_57.x;
    float _284 = in.m_57.y;
    float _286 = in.m_57.z;
    float _288 = fma(_262, _280, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _290 = fma(_272, _280, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _292 = fma(_266, _280, (*spvDescriptorSet0.vp_c9)._m0[143].z);
    float _294 = _288 * _274;
    float _296 = _290 * _274;
    float _298 = _292 * _274;
    float _300 = fma(_278, (*spvDescriptorSet0.vp_c9)._m0[143].x, _294);
    float _302 = fma(_278, (*spvDescriptorSet0.vp_c9)._m0[143].y, _296);
    float _304 = fma(_278, (*spvDescriptorSet0.vp_c9)._m0[143].z, _298);
    float _306 = fma(_236, (*spvDescriptorSet0.vp_c9)._m0[144].x, _300);
    float _308 = fma(_236, (*spvDescriptorSet0.vp_c9)._m0[144].y, _302);
    float _310 = fma(_236, (*spvDescriptorSet0.vp_c9)._m0[144].z, _304);
    float _312 = _308 * _284;
    float _314 = _306 * _282;
    float _316 = _310 * _286;
    bool _318 = !_268;
    float _336;
    if (!_318)
    {
        float _320 = in.m_55.x;
        float _322 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _324 = _320 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _326 = fma(_324, (*spvDescriptorSet0.vp_c9)._m0[11].y, _144);
        float _328 = _326 * _322;
        float _330 = floor(_328);
        float _332 = -_330;
        float _334 = _328 + _332;
        _336 = _334;
        _338 = true;
    }
    else
    {
        float _340 = float(_110);
        float _342 = 1.0 / _340;
        float _344 = _144 * _342;
        _336 = _344;
    }
    _338 = false;
    float _346 = _336;
    bool _348 = _346 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _350 = isnan(_346);
    bool _352 = _348 || _350;
    bool _354 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _356 = _352 || _354;
    float _358 = float(_356);
    float _360 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _362 = _360 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _364 = _346 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _366 = isnan(_346);
    bool _368 = _364 || _366;
    bool _370 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _372 = _368 || _370;
    float _374 = float(_372);
    float _376 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _378 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _376;
    float _380 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _382 = _346 + _380;
    float _384 = -_358;
    float _386 = _384 + 1.0;
    bool _388 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].w;
    float _390 = 1.0 / _362;
    float _392 = _374 * _386;
    float _394 = -_374;
    float _396 = _394 + 1.0;
    float _398 = _378 * _390;
    float _400 = fma(_398, _382, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _402 = _400 * _392;
    float _404 = fma(_396, (*spvDescriptorSet0.vp_c9)._m0[115].x, _402);
    float _406 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _408 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _410 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _412 = fma(_358, (*spvDescriptorSet0.vp_c9)._m0[116].x, _404);
    float _414 = _406 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _416 = _408 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _418 = _410 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _420 = _412 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    out.m_59.x = _414;
    out.m_59.y = _416;
    out.m_59.z = _418;
    out.m_59.w = _420;
    bool _422 = !_388;
    float _440;
    if (!_422)
    {
        float _424 = in.m_55.x;
        float _426 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].w;
        float _428 = _424 * (*spvDescriptorSet0.vp_c9)._m0[13].x;
        float _430 = fma(_428, (*spvDescriptorSet0.vp_c9)._m0[11].w, _144);
        float _432 = _430 * _426;
        float _434 = floor(_432);
        float _436 = -_434;
        float _438 = _432 + _436;
        _440 = _438;
        _442 = true;
    }
    else
    {
        float _444 = float(_110);
        float _446 = 1.0 / _444;
        float _448 = _144 * _446;
        _440 = _448;
    }
    _442 = false;
    float _450 = _440;
    float _452 = in.m_55.x;
    float _454 = in.m_55.y;
    float _456 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _458 = log2(_456);
    float _460 = _312 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _462 = in.m_46.x;
    float _464 = in.m_46.y;
    float _466 = in.m_46.z;
    float _468 = _316 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _470 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    float _472 = in.m_55.z;
    float _474 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].y);
    int _476 = int(_474);
    float _478 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    bool _480 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _482 = isnan(0.0);
    bool _484 = _480 || _482;
    bool _486 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _488 = _484 || _486;
    float _490 = _458 * _144;
    float _492 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].x);
    int _494 = int(_492);
    float _496 = _452 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    float _498 = _454 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    float _500 = _452 * 2.0;
    float _502 = exp2(_490);
    float _504 = -_470;
    float _506 = fma(_496, 2.0, _504);
    float _508 = fma(_498, -2.0, _478);
    float _510 = _454 + _452;
    float _512 = _464 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _514 = _464 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _516 = _464 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _518 = _510 + (-1.0);
    float _520 = floor(_500);
    float _522 = _454 * 2.0;
    float _524 = fma(_462, (*spvDescriptorSet0.vp_c10)._m0[6].x, _516);
    float _526 = _472 * 2.0;
    float _528 = fma(_462, (*spvDescriptorSet0.vp_c10)._m0[4].x, _512);
    float _530 = fma(_462, (*spvDescriptorSet0.vp_c10)._m0[5].x, _514);
    float _532 = fma(_518, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    float _534 = _454 + _472;
    float _536 = floor(_522);
    float _538 = float(_476);
    float _540 = _534 + (-1.0);
    bool _542 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _544 = isnan(1.0);
    bool _546 = _542 || _544;
    bool _548 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _550 = _546 || _548;
    float _552 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _554 = 1.0 + _552;
    float _556 = -_502;
    float _558 = _556 + 1.0;
    bool _560 = _520 > 0.0;
    float _562 = floor(_526);
    float _564 = fma(_144, (*spvDescriptorSet0.vp_c9)._m0[76].y, _508);
    bool _566 = _520 >= 0.0;
    bool _568 = isnan(_520);
    bool _570 = _566 || _568;
    bool _572 = isnan(0.0);
    bool _574 = _570 || _572;
    float _576 = fma(_466, (*spvDescriptorSet0.vp_c10)._m0[5].z, _530);
    float _578 = _488 ? _558 : 0.0;
    float _580 = fma(_540, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    float _582 = 1.0 / _538;
    bool _584 = _536 > 0.0;
    float _586 = _576 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    bool _588 = _536 >= 0.0;
    bool _590 = isnan(_536);
    bool _592 = _588 || _590;
    bool _594 = isnan(0.0);
    bool _596 = _592 || _594;
    float _598 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    float _600 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    float _602 = float(_494);
    float _604 = 1.0 / _554;
    bool _606 = _562 > 0.0;
    float _608 = fma(_452, (*spvDescriptorSet0.vp_c9)._m0[78].z, _598);
    bool _610 = _562 >= 0.0;
    bool _612 = isnan(_562);
    bool _614 = _610 || _612;
    bool _616 = isnan(0.0);
    bool _618 = _614 || _616;
    float _620 = fma(_454, (*spvDescriptorSet0.vp_c9)._m0[78].w, _600);
    int _622 = _574 ? 0 : 1;
    float _624 = _602 * _144;
    int _626 = _618 ? 0 : 1;
    float _628 = _582 * _144;
    float _630 = -_144;
    float _632 = fma(_630, (*spvDescriptorSet0.vp_c9)._m0[76].x, _506);
    float _634 = fma(_144, (*spvDescriptorSet0.vp_c9)._m0[77].z, _608);
    int _636 = ~_622;
    int _638 = _636 + 1;
    int _640 = _638 + 1;
    float _642 = fma(_144, (*spvDescriptorSet0.vp_c9)._m0[77].w, _620);
    int _644 = _640;
    if (!_560)
    {
        int _646 = ~_622;
        int _648 = _646 + 1;
        _644 = _648;
    }
    int _650 = _644;
    float _652 = fma(_466, (*spvDescriptorSet0.vp_c10)._m0[6].z, _524);
    int _654 = _596 ? 0 : 1;
    if (_550)
    {
        float _656 = _578 * _604;
        _148 = _656;
    }
    float _658 = _148;
    int _660 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 16;
    bool _662 = _660 != 0;
    int _664 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 32;
    bool _666 = _664 != 0;
    int _668 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 64;
    bool _670 = _668 != 0;
    float _672 = fma(_466, (*spvDescriptorSet0.vp_c10)._m0[4].z, _528);
    int _674 = ~_654;
    int _676 = _674 + 1;
    int _678 = _676 + 1;
    float _680 = _652 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    int _682 = _678;
    if (!_584)
    {
        int _684 = ~_654;
        int _686 = _684 + 1;
        _682 = _686;
    }
    int _688 = _682;
    float _690 = _672 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    bool _692 = !_666;
    int _694 = _692 ? 0 : 1;
    float _696 = in.m_61.x;
    float _698 = in.m_61.y;
    float _700 = in.m_61.z;
    bool _702 = !_662;
    int _704 = _702 ? 0 : 1;
    float _706 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _708 = _690 + _706;
    bool _710 = !_670;
    int _712 = _710 ? 0 : 1;
    int _714 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _716 = _714 != 0;
    int _718 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _720 = _718 != 0;
    int _722 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _724 = _722 != 0;
    float _726 = float(_650);
    int _728 = ~_626;
    int _730 = _728 + 1;
    int _732 = _730 + 1;
    bool _734 = !_716;
    int _736 = _734 ? 0 : 1;
    bool _738 = !_720;
    int _740 = _738 ? 0 : 1;
    int _742 = abs(_736);
    float _744 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _746 = _586 + _744;
    int _748 = abs(_740);
    int _750 = _732;
    if (!_606)
    {
        int _752 = ~_626;
        int _754 = _752 + 1;
        _750 = _754;
    }
    int _756 = _750;
    float _758 = _746 * _746;
    float _760 = float(_748);
    float _762 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _764 = _680 + _762;
    float _766 = fma(_708, _708, _758);
    float _768 = _760 * _726;
    float _770 = float(_742);
    float _772 = fma(_764, _764, _766);
    float _774 = float(_756);
    float _776 = _768 * (-2.0);
    float _778 = _454 + (-0.5);
    float _780 = sqrt(_772);
    bool _782 = !_724;
    int _784 = _782 ? 0 : 1;
    float _786 = fma(_776, _698, _698);
    float _788 = fma(_580, _776, _580);
    float _790 = _770 * _774;
    int _792 = abs(_784);
    float _794 = fma(_778, (*spvDescriptorSet0.vp_c9)._m0[196].y, _786);
    float _796 = _314 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _798 = rsqrt(_772);
    float _800 = float(_688);
    float _802 = _472 + _452;
    float _804 = float(_792);
    float _806 = _796 * (*spvDescriptorSet0.vp_c13)._m0[2].y;
    float _808 = _790 * (-2.0);
    float _810 = _802 + (-1.0);
    float _812 = _472 + (-0.5);
    float _814 = _780 * (*spvDescriptorSet0.vp_c13)._m0[2].x;
    float _816 = _804 * _800;
    float _818 = fma(_810, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _820 = _452 + (-0.5);
    float _822 = fma(_808, _696, _696);
    float _824 = precise::min(_806, _814);
    float _826 = _816 * (-2.0);
    float _828 = fma(_532, _808, _532);
    float _830 = fma(_820, (*spvDescriptorSet0.vp_c9)._m0[196].x, _822);
    float _832 = fma(_788, _658, _794);
    float _834 = _798 * _824;
    float _836 = fma(_818, _826, _818);
    float _838 = fma(_826, _700, _700);
    float _840 = fma(_828, _658, _830);
    float _842 = _746 * _834;
    float _844 = _832 * 0.15915493667125701904296875;
    float _846 = fma(_812, (*spvDescriptorSet0.vp_c9)._m0[196].z, _838);
    float _848 = _708 * _834;
    float _850 = -_842;
    float _852 = _746 + _850;
    float _854 = _840 * 0.15915493667125701904296875;
    float _856 = _764 * _834;
    float _858 = -_848;
    float _860 = _708 + _858;
    float _862 = _852 * _852;
    float _864 = fma(_836, _658, _846);
    float _866 = -_856;
    float _868 = _764 + _866;
    float _870 = _844 * 6.283185482025146484375;
    float _872 = sin(_870);
    float _874 = fma(_860, _860, _862);
    float _876 = _864 * 0.15915493667125701904296875;
    float _878 = in.m_63.x;
    float _880 = in.m_63.y;
    float _882 = in.m_63.z;
    float _884 = fma(_868, _868, _874);
    float _886 = _844 * 6.283185482025146484375;
    float _888 = cos(_886);
    float _890 = sqrt(_884);
    float _892 = _854 * 6.283185482025146484375;
    float _894 = sin(_892);
    float _896 = _854 * 6.283185482025146484375;
    float _898 = cos(_896);
    float _900 = _798 * _890;
    float _902 = _460 * _900;
    float _904 = _796 * _900;
    float _906 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _880);
    float _908 = _876 * 6.283185482025146484375;
    float _910 = cos(_908);
    float _912 = _894 * _872;
    float _914 = _894 * _888;
    float _916 = _902 * _906;
    float _918 = _468 * _900;
    float _920 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _882);
    float _922 = _876 * 6.283185482025146484375;
    float _924 = sin(_922);
    float _926 = _898 * _888;
    float _928 = _898 * _872;
    float _930 = _918 * _920;
    float _932 = _894 * _910;
    float _934 = _888 * _910;
    float _936 = _898 * _910;
    float _938 = _872 * _910;
    float _940 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _878);
    float _942 = _936 * _916;
    float _944 = fma(_924, _926, _912);
    float _946 = _904 * _940;
    float _948 = -_914;
    float _950 = fma(_924, _928, _948);
    float _952 = -_916;
    float _954 = _924 * _952;
    float _956 = -_928;
    float _958 = fma(_924, _914, _956);
    float _960 = fma(_944, _946, _942);
    float _962 = _932 * _916;
    float _964 = fma(_934, _946, _954);
    float _966 = fma(_924, _912, _926);
    float _968 = fma(_950, _930, _960);
    float _970 = fma(_958, _946, _962);
    float _972 = fma(_938, _930, _964);
    float _974 = _968 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _976 = fma(_966, _930, _970);
    float _978 = _968 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _980 = _968 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _982 = fma(_972, (*spvDescriptorSet0.vp_c8)._m0[26].x, _974);
    float _984 = fma(_972, (*spvDescriptorSet0.vp_c8)._m0[24].x, _978);
    float _986 = fma(_976, (*spvDescriptorSet0.vp_c8)._m0[26].z, _982);
    float _988 = fma(_976, (*spvDescriptorSet0.vp_c8)._m0[24].z, _984);
    float _990 = _986 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _992 = _988 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _994 = _680 + _990;
    float _996 = _690 + _992;
    float _998 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1000 = _994 + _998;
    float _1002 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1004 = _996 + _1002;
    float _1006 = _1000 * _1000;
    float _1008 = fma(_1004, _1004, _1006);
    float _1010 = fma(_972, (*spvDescriptorSet0.vp_c8)._m0[25].x, _980);
    float _1012 = -_842;
    float _1014 = _586 + _1012;
    float _1016 = -_848;
    float _1018 = _690 + _1016;
    float _1020 = sqrt(_1008);
    float _1022 = fma(_976, (*spvDescriptorSet0.vp_c8)._m0[25].z, _1010);
    float _1024 = _1014 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _1026 = -_856;
    float _1028 = _680 + _1026;
    float _1030 = _1022 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _1032 = fma(_1018, (*spvDescriptorSet0.vp_c8)._m0[11].x, _1024);
    float _1034 = _586 + _1030;
    float _1036 = fma(_1028, (*spvDescriptorSet0.vp_c8)._m0[11].z, _1032);
    bool _1038 = _1020 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1040 = _1030;
    float _1042 = _1032;
    float _1044 = _996;
    float _1046 = _856;
    float _1048 = _842;
    float _1050 = _848;
    float _1052 = _1008;
    float _1054 = _878;
    if (!_1038)
    {
        _1040 = _994;
    }
    float _1056 = _1040;
    float _1058 = _1056;
    if (!_1038)
    {
        _1042 = _1034;
    }
    float _1060 = _1042;
    bool _1062 = !_1038;
    float _1064 = _1060;
    if (!_1062)
    {
        float _1066 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1068 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1070 = _1020 + _1068;
        float _1072 = _1034 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1074 = rsqrt(_1008);
        float _1076 = _1070 * _1066;
        float _1078 = _1076 * 0.15915493667125701904296875;
        float _1080 = _1078 * 6.283185482025146484375;
        float _1082 = sin(_1080);
        float _1084 = _1078 * 6.283185482025146484375;
        float _1086 = cos(_1084);
        float _1088 = fma(_1082, _1072, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1090 = _1074 * _1088;
        float _1092 = _1086 + (-1.0);
        float _1094 = fma(_1004, _1090, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1096 = fma(_1000, _1090, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        float _1098 = _1092 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1100 = fma(_1034, _1086, _1098);
        _1064 = _1100;
        _1044 = _1094;
        _1058 = _1096;
    }
    float _1102 = _1064;
    float _1104 = _1044;
    float _1106 = _1058;
    float _1108 = -_586;
    float _1110 = _1108 + _1102;
    float _1112 = _1036 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _1114 = -_690;
    float _1116 = _1114 + _1104;
    float _1118 = -_680;
    float _1120 = _1118 + _1106;
    float _1122 = _1110 * _1110;
    float _1124 = 1.0 / _1112;
    float _1126 = -_848;
    float _1128 = _1126 + _1104;
    float _1130 = fma(_1116, _1116, _1122);
    float _1132 = _1014 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _1134 = -_856;
    float _1136 = _1134 + _1106;
    float _1138 = fma(_1120, _1120, _1130);
    float _1140 = fma(_1018, (*spvDescriptorSet0.vp_c8)._m0[10].x, _1132);
    bool _1142 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[660].y;
    bool _1144 = isnan(0.5);
    bool _1146 = _1142 || _1144;
    bool _1148 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _1150 = _1146 || _1148;
    float _1152 = sqrt(_1138);
    float _1154 = fma(_1028, (*spvDescriptorSet0.vp_c8)._m0[10].z, _1140);
    bool _1156 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[653].w;
    bool _1158 = isnan(0.5);
    bool _1160 = _1156 || _1158;
    bool _1162 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _1164 = _1160 || _1162;
    float _1166 = _1154 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _1168 = _1166 + _1112;
    float _1170 = -_842;
    float _1172 = _1170 + _1102;
    float _1174 = _1168 * _1124;
    float _1176 = _1174 * 0.5;
    bool _1178 = _1152 > 0.0;
    float _1180 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _1182 = fma(_1176, (*spvDescriptorSet0.vp_c8)._m0[30].w, _1180);
    float _1184 = 1.0 / _1182;
    float _1186 = _1152;
    float _1188 = _1102;
    float _1190 = _1182;
    float _1192 = _1124;
    float _1194 = _1136;
    if (!_1178)
    {
        _1046 = _1128;
    }
    float _1196 = _1046;
    float _1198 = _1196;
    if (!_1178)
    {
        _1048 = _1172;
    }
    float _1200 = _1048;
    float _1202 = _1200;
    if (!_1178)
    {
        _1186 = _1136;
    }
    float _1204 = _1186;
    bool _1206 = !_1178;
    float _1208 = _1204;
    float _1210 = _1204;
    if (!_1206)
    {
        float _1212 = _188 * _188;
        float _1214 = fma(_186, _186, _1212);
        float _1216 = fma(_190, _190, _1214);
        float _1218 = rsqrt(_1138);
        float _1220 = sqrt(_1216);
        float _1222 = _1110 * _1218;
        float _1224 = _1116 * _1218;
        float _1226 = _1120 * _1218;
        bool _1228 = _1220 > 0.0;
        float _1230 = _1220;
        float _1232 = _1218;
        _1050 = _1216;
        _1188 = _1224;
        _1190 = _1222;
        if (!_1228)
        {
            _1230 = _1128;
        }
        float _1234 = _1230;
        _1198 = _1234;
        if (!_1228)
        {
            _1232 = _1172;
        }
        float _1236 = _1232;
        _1202 = _1236;
        if (!_1228)
        {
            _1208 = _1136;
        }
        float _1238 = _1208;
        bool _1240 = !_1228;
        _1210 = _1238;
        if (!_1240)
        {
            float _1242 = rsqrt(_1216);
            float _1244 = 1.0 / (*spvDescriptorSet0.vp_c10)._m0[2].z;
            float _1246 = _188 * _1242;
            float _1248 = _186 * _1242;
            float _1250 = _190 * _1242;
            float _1252 = _1222 * _1246;
            float _1254 = fma(_1224, _1248, _1252);
            float _1256 = _1244 * (*spvDescriptorSet0.vp_c9)._m0[142].x;
            float _1258 = fma(_1226, _1250, _1254);
            float _1260 = _1258 * _1256;
            float _1262 = fma(_186, _1260, _1128);
            float _1264 = fma(_188, _1260, _1172);
            float _1266 = fma(_190, _1260, _1136);
            _1198 = _1262;
            _1202 = _1264;
            _1210 = _1266;
        }
    }
    float _1268 = _1198;
    float _1270 = _1202;
    float _1272 = _1210;
    float _1274 = _1050;
    float _1276 = _1188;
    float _1278 = _1190;
    float _1280 = _1270;
    float _1282 = _1268;
    float _1284 = _1272;
    float _1286 = _1278;
    float _1288 = _1274;
    float _1290 = _1276;
    if (_1164)
    {
        _1192 = 1.0;
    }
    float _1292 = _1192;
    float _1294 = _1292;
    if (!_1150)
    {
        float _1296 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
        float _1298 = _1014 + _1296;
        float _1300 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
        float _1302 = _1018 + _1300;
        float _1304 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1306 = _1298 * _1298;
        float _1308 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
        float _1310 = _1028 + _1308;
        float _1312 = fma(_1302, _1302, _1306);
        float _1314 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _1316 = fma(_1310, _1310, _1312);
        float _1318 = sqrt(_1316);
        float _1320 = _1304 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1322 = precise::min(_1318, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _1324 = _1322 * _1314;
        float _1326 = -_1018;
        float _1328 = _1326 + _1268;
        float _1330 = _1320 * _1324;
        float _1332 = -_1014;
        float _1334 = _1332 + _1270;
        float _1336 = -_1028;
        float _1338 = _1336 + _1272;
        float _1340 = fma(_1328, _1330, _1018);
        float _1342 = fma(_1334, _1330, _1014);
        float _1344 = fma(_1338, _1330, _1028);
        _1280 = _1342;
        _1282 = _1340;
        _1284 = _1344;
    }
    float _1346 = _1280;
    float _1348 = _1282;
    float _1350 = _1284;
    if (_1164)
    {
        _1286 = 1.0;
    }
    float _1352 = _1286;
    float _1354 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _1356 = _1184 * _1354;
    float _1358 = _1352;
    if (!_1164)
    {
        float _1360 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1362 = _1360 * 0.15915493667125701904296875;
        float _1364 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1366 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1368 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _1366;
        float _1370 = _1362 * 6.283185482025146484375;
        float _1372 = cos(_1370);
        float _1374 = _1364 * 0.15915493667125701904296875;
        float _1376 = _1362 * 6.283185482025146484375;
        float _1378 = sin(_1376);
        float _1380 = 1.0 / _1372;
        float _1382 = _1374 * 6.283185482025146484375;
        float _1384 = cos(_1382);
        float _1386 = _1378 * _1380;
        float _1388 = _1374 * 6.283185482025146484375;
        float _1390 = sin(_1388);
        float _1392 = _1384 * _1386;
        float _1394 = 1.0 / _1368;
        float _1396 = 1.0 / _1392;
        float _1398 = _1390 * _1396;
        float _1400 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1402 = fma(_1356, _1398, _1400);
        float _1404 = _1402 * _1394;
        float _1406 = precise::clamp(_1404, 0.0, 1.0);
        _1288 = _1374;
        _1294 = _1406;
    }
    float _1408 = _1288;
    float _1410 = _1294;
    if (!_1164)
    {
        float _1412 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1414 = _1412 * 0.15915493667125701904296875;
        float _1416 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1418 = _1414 * 6.283185482025146484375;
        float _1420 = cos(_1418);
        float _1422 = _1416 * 0.15915493667125701904296875;
        float _1424 = _1414 * 6.283185482025146484375;
        float _1426 = sin(_1424);
        float _1428 = 1.0 / _1420;
        float _1430 = _1422 * 6.283185482025146484375;
        float _1432 = cos(_1430);
        float _1434 = _1426 * _1428;
        float _1436 = _1422 * 6.283185482025146484375;
        float _1438 = sin(_1436);
        float _1440 = _1432 * _1434;
        float _1442 = 1.0 / _1440;
        float _1444 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _1446 = (*spvDescriptorSet0.vp_c9)._m0[140].w + _1444;
        float _1448 = 1.0 / _1446;
        float _1450 = _1438 * _1442;
        float _1452 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _1454 = fma(_1356, _1450, _1452);
        float _1456 = _1454 * _1448;
        float _1458 = precise::clamp(_1456, 0.0, 1.0);
        float _1460 = -_1458;
        float _1462 = _1460 + 1.0;
        _1358 = _1462;
    }
    float _1464 = _1358;
    float _1466 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1468 = _1346 + _1466;
    float _1470 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1472 = _1348 + _1470;
    float _1474 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1476 = _1350 + _1474;
    float _1478 = _1346 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1480 = _1468 * _1468;
    float _1482 = _1346 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1484 = fma(_1348, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1478);
    float _1486 = fma(_1472, _1472, _1480);
    float _1488 = fma(_1348, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1482);
    float _1490 = fma(_1350, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1484);
    float _1492 = fma(_1476, _1476, _1486);
    float _1494 = fma(_1350, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1488);
    float _1496 = _1490 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1498 = rsqrt(_1492);
    float _1500 = _1494 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1502 = sqrt(_1492);
    float _1504 = _1498 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1506 = _1472 * _1504;
    float _1508 = _1476 * _1504;
    float _1510 = _1506 * _1506;
    float _1512 = _1508 * _1508;
    float _1514 = _1510 + _1512;
    float _1516 = sqrt(_1514);
    bool _1518 = _1516 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1520 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1522 = _1516 + _1520;
    float _1524 = _1480;
    float _1526 = _1514;
    float _1528 = _1522;
    float _1530 = _1506;
    float _1532 = _1508;
    float _1534 = _1510;
    if (_1518)
    {
        float _1536 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1524 = _1536;
    }
    float _1538 = _1524;
    if (_1518)
    {
        float _1540 = rsqrt(_1514);
        _1526 = _1540;
    }
    float _1542 = _1526;
    float _1544 = _1542;
    if (_1518)
    {
        float _1546 = _1522 * _1538;
        _1528 = _1546;
    }
    float _1548 = _1528;
    if (_1518)
    {
        float _1550 = _1548 * 0.15915493667125701904296875;
        _1052 = _1550;
    }
    float _1552 = _1052;
    float _1554 = _1538;
    if (_1518)
    {
        float _1556 = _1552 * 6.283185482025146484375;
        float _1558 = sin(_1556);
        _1554 = _1558;
    }
    float _1560 = _1554;
    float _1562 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _1564 = precise::max(0.0, _1562);
    float _1566 = _1408;
    if (_1518)
    {
        float _1568 = _1552 * 6.283185482025146484375;
        float _1570 = cos(_1568);
        _1566 = _1570;
    }
    float _1572 = _1566;
    float _1574 = -_1504;
    float _1576 = -_1564;
    float _1578 = fma(_1468, _1574, _1576);
    if (_1518)
    {
        float _1580 = _1578 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1194 = _1580;
    }
    float _1582 = _1194;
    float _1584 = _1496 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _1586 = fma(_1018, (*spvDescriptorSet0.vp_c15)._m0[652].x, (*spvDescriptorSet0.vp_c15)._m0[652].z);
    float _1588 = _1560;
    float _1590 = _1582;
    if (_1518)
    {
        float _1592 = fma(_1560, _1582, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1290 = _1592;
    }
    float _1594 = _1290;
    float _1596 = _1594;
    if (!_1518)
    {
        _1588 = _1578;
    }
    float _1598 = _1588;
    float _1600 = floor(_1586);
    float _1602 = _1598;
    float _1604 = _1572;
    if (_1518)
    {
        float _1606 = _1572 + (-1.0);
        _1590 = _1606;
    }
    float _1608 = _1590;
    if (_1518)
    {
        float _1610 = _1542 * _1594;
        _1596 = _1610;
    }
    float _1612 = _1596;
    if (_1518)
    {
        float _1614 = _1608 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1544 = _1614;
    }
    float _1616 = _1544;
    if (_1518)
    {
        float _1618 = _1506 * _1612;
        _1530 = _1618;
    }
    float _1620 = _1530;
    if (_1518)
    {
        float _1622 = _1508 * _1612;
        _1532 = _1622;
    }
    float _1624 = _1532;
    if (_1518)
    {
        float _1626 = fma(_1578, _1572, _1616);
        _1602 = _1626;
    }
    float _1628 = _1602;
    if (_1518)
    {
        float _1630 = _1620 * _1620;
        _1534 = _1630;
    }
    float _1632 = _1534;
    if (!_1518)
    {
        _1604 = _1512;
    }
    float _1634 = _1604;
    float _1636 = _1634;
    if (_1518)
    {
        float _1638 = _1624 * _1624;
        _1636 = _1638;
    }
    float _1640 = _1636;
    float _1642 = _1346 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1644 = fma(_1628, _1628, _1632);
    float _1646 = fma(_1348, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1642);
    float _1648 = _1644 + _1640;
    float _1650 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _1652 = _1346 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1654 = fma(_1350, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1646);
    float _1656 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _1658 = fma(_1502, (*spvDescriptorSet0.vp_c15)._m0[23].w, _1656);
    float _1660 = precise::clamp(_1658, 0.0, 1.0);
    float _1662 = fma(_1348, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1652);
    float _1664 = _1654 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1666 = rsqrt(_1648);
    float _1668 = -_1660;
    float _1670 = _1668 + 1.0;
    float _1672 = fma(_1350, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1662);
    float _1674 = -_1584;
    float _1676 = fma(_1674, _1650, 1.0);
    float _1678 = fma(_1028, (*spvDescriptorSet0.vp_c15)._m0[652].y, (*spvDescriptorSet0.vp_c15)._m0[652].w);
    float _1680 = _1664 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1682 = _1672 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1684 = _1664 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1686 = abs(_1670);
    float _1688 = log2(_1686);
    float _1690 = fma(_1682, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1684);
    float _1692 = fma(_1496, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1690);
    float _1694 = _1666 * _1620;
    float _1696 = _1666 * _1628;
    float _1698 = floor(_1678);
    float _1700 = fma(_1500, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1692);
    float _1702 = _1694 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _1704 = _1666 * _1624;
    float _1706 = -_1600;
    float _1708 = _1586 + _1706;
    float _1710 = _1664 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1712 = -_1702;
    float _1714 = fma(_1696, (*spvDescriptorSet0.vp_c15)._m0[21].y, _1712);
    float _1716 = _1688 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _1718 = log2(_1676);
    float _1720 = fma(_1682, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1710);
    float _1722 = -_1704;
    float _1724 = fma(_1722, (*spvDescriptorSet0.vp_c15)._m0[21].z, _1714);
    float _1726 = fma(_1496, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1720);
    float _1728 = fma(_1724, -0.5, 0.5);
    float _1730 = fma(_1724, 0.5, 0.5);
    float _1732 = 1.0 / _1700;
    float _1734 = -_1698;
    float _1736 = _1678 + _1734;
    float _1738 = fma(_1682, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1680);
    float _1740 = fma(_1730, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _1742 = fma(_1500, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1726);
    float _1744 = _1696 + 1.0;
    float _1746 = fma(_1496, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1738);
    float _1748 = fma(_1730, _1740, -0.212114393711090087890625);
    float _1750 = exp2(_1716);
    float _1752 = _1718 * 0.693147182464599609375;
    float _1754 = fma(_1500, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1746);
    float _1756 = fma(_1730, _1748, 1.570728778839111328125);
    float _1758 = _1752 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _1760 = sqrt(_1728);
    float _1762 = _1742 * _1732;
    float _1764 = _1754 * _1732;
    float _1766 = -_1696;
    float _1768 = fma(_1750, _1744, _1766);
    float2 _5874 = float2(_1708, _1736);
    float _1770 = dm_bs(spvDescriptorSet0.vp_t_tcb_24.sample(spvDescriptorSet0.vp_t_tcb_24Smplr, select(_5874, float2(0.0), isnan(_5874)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_24, spvDescriptorSet0.vp_t_tcb_24Smplr_w, select(_5874, float2(0.0), isnan(_5874)), level(0.0)).x;
    float _1772 = fma(_1768, 0.5, 0.5);
    float _1774 = _1760 * 0.636619746685028076171875;
    float _1776 = fma(_1762, 0.5, 0.5);
    float _1778 = fma(_1764, -0.5, 0.5);
    float _1780 = -_1756;
    float _1782 = fma(_1774, _1780, 1.0);
    float3 _5899 = float3(_1776, _1778, _1758);
    float _1784 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_5899, float3(0.0), isnan(_5899)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_5899, float3(0.0), isnan(_5899)), level(0.0)).x;
    float3 _5910 = float3(_1776, _1778, _1758);
    float4 _1787 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_5910, float3(0.0), isnan(_5910)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_5910, float3(0.0), isnan(_5910)), level(0.0)).xyzw;
    float _1789 = _1787.x;
    float _1791 = _1787.y;
    float _1793 = _1787.z;
    float _1795 = _1787.w;
    float2 _5926 = float2(_1782, _1772);
    float3 _1799 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_5926, float2(0.0), isnan(_5926)), level(0.0)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_5926, float2(0.0), isnan(_5926)), level(0.0)).xyz;
    float _1801 = _1799.x;
    float _1803 = _1799.y;
    float _1805 = _1799.z;
    float _1807 = float(uint(_494));
    float _1809 = trunc(_628);
    int _1811 = int(_1809);
    bool _1813 = _494 == 0;
    out.m_65.x = _1018;
    out.m_65.y = _1014;
    out.m_65.z = _1028;
    int _1815 = abs(_712);
    float _1817 = _1688 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    bool _1819 = _454 > 0.5;
    out.m_67.w = _824;
    float _1821 = 1.0 / _1807;
    int _1823 = ~_494;
    int _1825 = _1823 + 1;
    out.m_69.x = _904;
    float _1827 = float(_110);
    out.m_71.x = _1348;
    out.m_71.y = _1346;
    out.m_71.z = _1350;
    float _1829 = float(uint(_1811));
    float _1831 = 1.0 / _1827;
    float _1833 = -(*spvDescriptorSet0.vp_c9)._m0[133].w;
    float _1835 = _1833 + (*spvDescriptorSet0.vp_c9)._m0[134].w;
    int _1837 = as_type<int>(_1821) + (-2);
    float _1839 = exp2(_1817);
    float _1841 = as_type<float>(_1837) * _1829;
    int _1843 = ~_494;
    int _1845 = _1843 + 1;
    float _1847 = 1.0 / _1835;
    float _1849 = trunc(_1841);
    float _1851 = precise::max(_1849, 0.0);
    uint _1854 = uint(_1851);
    float _1856 = -_1839;
    float _1858 = _1856 + 1.0;
    float _1860 = -(*spvDescriptorSet0.vp_c9)._m0[133].x;
    float _1862 = (*spvDescriptorSet0.vp_c9)._m0[134].x + _1860;
    float _1864 = _1862 * _1847;
    float _1866 = -(*spvDescriptorSet0.vp_c9)._m0[133].w;
    float _1868 = _450 + _1866;
    float _1870 = fma(_1864, _1868, (*spvDescriptorSet0.vp_c9)._m0[133].x);
    int _1872 = _1825 * int(_1854);
    int _1874 = _1872 + _1811;
    float _1876 = float(uint(_1874));
    float _1878 = as_type<float>(_1837) * _1876;
    int _1880 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _1882 = _1880 != 0;
    float _1884 = float(_1811);
    float _1886 = trunc(_1878);
    float _1888 = precise::max(_1886, 0.0);
    uint _1890 = uint(_1888);
    bool _1892 = !_1882;
    float _1894 = _1892 ? 7.345489978790283203125 : 1.0;
    bool _1896 = _1884 >= _602;
    bool _1898 = isnan(_1884);
    bool _1900 = _1896 || _1898;
    bool _1902 = isnan(_602);
    bool _1904 = _1900 || _1902;
    float _1906 = float(_1904);
    float _1908 = _1894 * _452;
    float _1910 = trunc(_1906);
    int _1912 = int(_1910);
    int _1914 = int(_1854) + int(_1890);
    float _1916 = floor(_1908);
    int _1918 = _1845 * _1914;
    int _1920 = _1918 + _1811;
    bool _1922 = uint(_1920) >= uint(_494);
    bool _1924 = !_1922;
    int _1926 = _1924 ? 0 : (-1);
    float _1928 = -_1916;
    float _1930 = _1908 + _1928;
    int _1932 = ~_1914;
    int _1934 = _1932 + _1926;
    int _1936 = _1934 + 1;
    float _1938 = _624 * _1831;
    int _1940 = ~_1912;
    int _1942 = _1940 + 1;
    int _1944 = _1942 + 1;
    float _1946 = _1930 * _602;
    int _1948 = _494 * _1936;
    int _1950 = _1948 + _1811;
    int _1952 = _494 + (-1);
    float _1954 = trunc(_1938);
    int _1956 = int(_1954);
    int _1958 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4096;
    bool _1960 = _1958 != 0;
    bool _1962 = !_1813;
    int _1964 = _1962 ? _1950 : (-1);
    bool _1966 = !_1960;
    int _1968 = _1966 ? 0 : 1;
    int _1970 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 128;
    bool _1972 = _1970 != 0;
    float _1974 = trunc(_1946);
    int _1976 = int(_1974);
    int _1978 = _1964 * _1944;
    int _1980 = abs(_1968);
    int _1982 = abs(_694);
    int _1984 = _1912 * _1952;
    int _1986 = _1984 + _1978;
    bool _1988 = !_1972;
    int _1990 = _1988 ? 0 : 1;
    int _1992 = _1986 * _1982;
    int _1994 = abs(_704);
    int _1996 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _1998 = _1996 != 0;
    int _2000 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _2002 = _2000 != 0;
    int _2004 = _1956 * _1994;
    int _2006 = _2004 + _1992;
    int _2008 = _1976 * _1980;
    int _2010 = _2008 + _1811;
    int _2012 = abs(_1990);
    int _2014 = ~_494;
    int _2016 = _2014 + 1;
    float _2018 = float(uint(_2010));
    int _2020 = _2010 * _1815;
    int _2022 = _2020 + _2006;
    float _2024 = in.m_73.y;
    int _2026 = _1976 * _2012;
    int _2028 = _2026 + _2022;
    int _2030 = ~_494;
    int _2032 = _2030 + 1;
    float _2034 = float(uint(_2028));
    float _2036 = as_type<float>(_1837) * _2034;
    float _2038 = trunc(_2036);
    float _2040 = precise::max(_2038, 0.0);
    uint _2042 = uint(_2040);
    int _2044 = _2032 * int(_2042);
    int _2046 = _2044 + _2028;
    float _2048 = float(uint(_2046));
    float _2050 = as_type<float>(_1837) * _2048;
    float _2052 = trunc(_2050);
    float _2054 = precise::max(_2052, 0.0);
    uint _2056 = uint(_2054);
    int _2058 = int(_2042) + int(_2056);
    int _2060 = _2016 * _2058;
    int _2062 = _2060 + _2028;
    float _2064 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _2066 = _2064 + (*spvDescriptorSet0.vp_c9)._m0[132].w;
    bool _2068 = uint(_2062) >= uint(_494);
    float _2070 = 1.0 / _2066;
    bool _2072 = !_2068;
    int _2074 = _2072 ? 0 : (-1);
    int _2076 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2097152;
    bool _2078 = _2076 != 0;
    float _2080 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _2082 = _450 + _2080;
    int _2084 = ~_2058;
    int _2086 = _2084 + _2074;
    int _2088 = _2086 + 1;
    float _2090 = -(*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _2092 = _2090 + (*spvDescriptorSet0.vp_c9)._m0[133].w;
    float _2094 = as_type<float>(_1837) * _2018;
    float _2096 = -(*spvDescriptorSet0.vp_c9)._m0[131].x;
    float _2098 = (*spvDescriptorSet0.vp_c9)._m0[132].x + _2096;
    float _2100 = -(*spvDescriptorSet0.vp_c9)._m0[132].x;
    float _2102 = _2100 + (*spvDescriptorSet0.vp_c9)._m0[133].x;
    int _2104 = _494 * _2088;
    int _2106 = _2104 + _2028;
    float _2108 = -_2024;
    float _2110 = _2108 + 1.0;
    float _2112 = 1.0 / _2092;
    bool _2114 = !_1813;
    int _2116 = _2114 ? _2106 : (-1);
    float _2118 = _2098 * _2070;
    int _2120 = ~_494;
    int _2122 = _2120 + 1;
    int _2124 = _2116 >> 31;
    float _2126 = trunc(_2094);
    float _2128 = precise::max(_2126, 0.0);
    uint _2130 = uint(_2128);
    float _2132 = fma(_2118, _2082, (*spvDescriptorSet0.vp_c9)._m0[131].x);
    float _2134 = _2024;
    float _2136 = _1700;
    float _2138 = _1754;
    float _2140 = _1742;
    if (_1998)
    {
        float _2142 = _1819 ? _2110 : _2024;
        _2134 = _2142;
    }
    float _2144 = _2134;
    int _2146 = _2124 & 3;
    bool _2148 = _450 >= (*spvDescriptorSet0.vp_c9)._m0[133].w;
    bool _2150 = isnan(_450);
    bool _2152 = _2148 || _2150;
    bool _2154 = isnan((*spvDescriptorSet0.vp_c9)._m0[133].w);
    bool _2156 = _2152 || _2154;
    float _2158 = float(_2156);
    int _2160 = _2116 + _2146;
    float _2162 = _2102 * _2112;
    bool _2164 = _450 >= (*spvDescriptorSet0.vp_c9)._m0[134].w;
    bool _2166 = isnan(_450);
    bool _2168 = _2164 || _2166;
    bool _2170 = isnan((*spvDescriptorSet0.vp_c9)._m0[134].w);
    bool _2172 = _2168 || _2170;
    float _2174 = float(_2172);
    float _2176 = -_2158;
    float _2178 = _2176 + 1.0;
    int _2180 = _2160 >> 2;
    int _2182 = _2116 & 3;
    bool _2184 = _2182 != 0;
    float _2186 = -_2174;
    float _2188 = _2186 + 1.0;
    int _2190 = _2180 << 4;
    int _2192 = _2190 + 368;
    int _2194 = _2122 * int(_2130);
    int _2196 = _2194 + _2010;
    float _2198 = _2158 * _2188;
    uint _2200 = uint(int(uint(_2192) >> uint(2)));
    uint _2202 = uint(int(uint(int(_2200)) >> uint(2)));
    int _2204 = int(_2200) & 3;
    float _2206 = (*spvDescriptorSet0.vp_c9)._m0[int(_2202)][_2204];
    int _2208 = int(_2200) + 1;
    uint _2210 = uint(int(uint(_2208) >> uint(2)));
    int _2212 = _2208 & 3;
    float _2214 = (*spvDescriptorSet0.vp_c9)._m0[int(_2210)][_2212];
    int _2216 = _2116 & 3;
    bool _2218 = _2216 != 0;
    float _2220 = float(uint(_2196));
    bool _2222 = _450 >= (*spvDescriptorSet0.vp_c9)._m0[132].w;
    bool _2224 = isnan(_450);
    bool _2226 = _2222 || _2224;
    bool _2228 = isnan((*spvDescriptorSet0.vp_c9)._m0[132].w);
    bool _2230 = _2226 || _2228;
    float _2232 = float(_2230);
    bool _2234 = uint(_2216) > 1u;
    float _2236 = as_type<float>(_1837) * _2220;
    bool _2238 = _450 >= (*spvDescriptorSet0.vp_c9)._m0[131].w;
    bool _2240 = isnan(_450);
    bool _2242 = _2238 || _2240;
    bool _2244 = isnan((*spvDescriptorSet0.vp_c9)._m0[131].w);
    bool _2246 = _2242 || _2244;
    float _2248 = float(_2246);
    float _2250 = _2232 * _2178;
    float _2252 = -_2232;
    float _2254 = _2252 + 1.0;
    int _2256 = _2184 ? 0 : 1;
    int _2258 = _2192 + 8;
    uint _2260 = uint(int(uint(_2258) >> uint(2)));
    uint _2262 = uint(int(uint(int(_2260)) >> uint(2)));
    int _2264 = int(_2260) & 3;
    float _2266 = (*spvDescriptorSet0.vp_c9)._m0[int(_2262)][_2264];
    int _2268 = int(_2260) + 1;
    uint _2270 = uint(int(uint(_2268) >> uint(2)));
    int _2272 = _2268 & 3;
    float _2274 = (*spvDescriptorSet0.vp_c9)._m0[int(_2270)][_2272];
    float _2276 = trunc(_2236);
    float _2278 = precise::max(_2276, 0.0);
    uint _2280 = uint(_2278);
    float _2282 = _2248 * _2254;
    float _2284 = -_2248;
    float _2286 = _2284 + 1.0;
    bool _2288 = uint(_2216) >= 2u;
    float _2290 = -_1770;
    float _2292 = _2290 + 1.0;
    float _2294 = _2132 * _2282;
    float _2296 = -(*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _2298 = _450 + _2296;
    int _2300 = ~_2256;
    int _2302 = _2300 + 1;
    int _2304 = _2302 + 1;
    int _2306 = _2304;
    if (!_2234)
    {
        int _2308 = ~_2256;
        int _2310 = _2308 + 1;
        _2306 = _2310;
    }
    int _2312 = _2306;
    float _2314 = fma(_2162, _2298, (*spvDescriptorSet0.vp_c9)._m0[132].x);
    bool _2316 = _2216 != 3;
    float _2318 = fma(_2286, (*spvDescriptorSet0.vp_c9)._m0[131].x, _2294);
    int _2320 = ~_494;
    int _2322 = _2320 + 1;
    int _2324 = abs(_2312);
    float _2326 = fma(_2314, _2250, _2318);
    int _2328 = int(_2130) + int(_2280);
    bool _2330 = !_2218;
    int _2332 = _2330 ? 0 : 1;
    int _2334 = _2288 ? 0 : 1;
    int _2336 = abs(_2332);
    int _2338 = ~_2324;
    int _2340 = _2338 + 1;
    int _2342 = _2340 + 1;
    int _2344 = _2322 * _2328;
    int _2346 = _2344 + _2010;
    int _2348 = ~_2334;
    int _2350 = _2348 + 1;
    int _2352 = _2350 + 1;
    float _2354 = fma(_1870, _2198, _2326);
    int _2356 = _2352;
    if (_2316)
    {
        int _2358 = ~_2334;
        int _2360 = _2358 + 1;
        _2356 = _2360;
    }
    int _2362 = _2356;
    float _2364 = _936 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    int _2366 = ~_2336;
    int _2368 = _2366 + 1;
    int _2370 = _2368 + 1;
    int _2372 = _2342 * as_type<int>(_2214);
    int _2374 = abs(_2362);
    bool _2376 = _2216 != 3;
    int _2378 = _2370 * as_type<int>(_2206);
    int _2380 = _2378 + _2372;
    bool _2382 = uint(_2346) >= uint(_494);
    float _2384 = trunc((*spvDescriptorSet0.vp_c9)._m0[80].z);
    int _2386 = int(_2384);
    float _2388 = as_type<float>(_2346);
    if (_2002)
    {
        float _2390 = in.m_55.x;
        _2388 = _2390;
    }
    float _2392 = _2388;
    bool _2394 = !_2376;
    int _2396 = _2394 ? 0 : (-1);
    bool _2398 = !_2382;
    int _2400 = _2398 ? 0 : (-1);
    int _2402 = ~_2374;
    int _2404 = _2402 + 1;
    int _2406 = _2404 + 1;
    int _2408 = abs(_2396);
    bool _2410 = !_2078;
    int _2412 = _2410 ? 0 : 1;
    int _2414 = ~_2328;
    int _2416 = _2414 + _2400;
    int _2418 = _2416 + 1;
    int _2420 = _2406 * as_type<int>(_2266);
    int _2422 = _2420 + _2380;
    int _2424 = abs(_2412);
    float _2426 = in.m_73.x;
    int _2428 = ~_2408;
    int _2430 = _2428 + 1;
    int _2432 = _2430 + 1;
    int _2434 = _494 * _2418;
    int _2436 = _2434 + _2010;
    bool _2438 = _880 != 0.0;
    bool _2440 = isnan(_880);
    bool _2442 = _2438 || _2440;
    bool _2444 = isnan(0.0);
    bool _2446 = _2442 || _2444;
    float _2448 = in.m_75.x;
    float _2450 = in.m_75.y;
    float _2452 = in.m_75.z;
    int _2454 = ~_2424;
    int _2456 = _2454 + 1;
    int _2458 = _2456 + 1;
    int _2460 = _2432 * as_type<int>(_2274);
    int _2462 = _2460 + _2422;
    float _2464 = float(uint(_2386));
    int _2466 = abs(_2386);
    int _2468 = _2462 * _2458;
    bool _2470 = _878 == 0.0;
    bool _2472 = !_2446;
    bool _2474 = _2470 && _2472;
    bool _2476 = !_1813;
    int _2478 = _2476 ? _2436 : (-1);
    float _2480 = 1.0 / _2464;
    float _2482 = fma(_2174, (*spvDescriptorSet0.vp_c9)._m0[134].x, _2354);
    bool _2484 = _882 == 0.0;
    bool _2486 = _2484 && _2474;
    int _2488 = _2478 * _2424;
    int _2490 = _2488 + _2468;
    float _2492 = float(uint(_2466));
    float _2494 = _2482 * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    bool _2496 = _2392 > 0.5;
    bool _2498 = _2496 && _2002;
    float _2500 = _2392;
    if (_2002)
    {
        _2500 = _2426;
    }
    float _2502 = _2500;
    float _2504 = 1.0 / _2492;
    int _2506 = abs(_2490);
    float _2508 = _2448;
    float _2510 = _2452;
    float _2512 = _2502;
    float _2514 = _2450;
    if (!_2486)
    {
        float _2516 = fma(_878, (*spvDescriptorSet0.vp_c9)._m0[17].y, _2448);
        _2508 = _2516;
    }
    float _2518 = _2508;
    if (!_2002)
    {
        _1054 = _2426;
    }
    float _2520 = _1054;
    float _2522 = _2520;
    if (!_2486)
    {
        float _2524 = fma(_882, (*spvDescriptorSet0.vp_c9)._m0[17].y, _2452);
        _2510 = _2524;
    }
    float _2526 = _2510;
    int _2528 = as_type<int>(_2480) + (-2);
    if (_2498)
    {
        float _2530 = -_2502;
        float _2532 = _2530 + 1.0;
        _2512 = _2532;
    }
    float _2534 = _2512;
    float _2536 = float(uint(_2490));
    float _2538 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    if (!_2486)
    {
        float _2540 = fma(_880, (*spvDescriptorSet0.vp_c9)._m0[17].y, _2450);
        _2514 = _2540;
    }
    float _2542 = _2514;
    float _2544 = as_type<float>(_2528) * _2536;
    float _2546 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    int _2548 = as_type<int>(_2504) + (-2);
    float _2550 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _2552 = float(uint(_2506));
    float _2554 = trunc(_2544);
    float _2556 = precise::max(_2554, 0.0);
    uint _2558 = uint(_2556);
    float _2560 = _2538 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2562 = _2546 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2564 = _2550 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2566 = as_type<float>(_2548) * _2552;
    if (_2002)
    {
        _2522 = _2534;
    }
    float _2568 = _2522;
    float _2570 = _936 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    int _2572 = ~_2386;
    int _2574 = _2572 + 1;
    out.m_77.x = _2560;
    out.m_77.y = _2562;
    out.m_77.z = _2564;
    out.m_77.w = _2494;
    int _2576 = ~_2466;
    int _2578 = _2576 + 1;
    float _2580 = trunc(_2566);
    float _2582 = precise::max(_2580, 0.0);
    uint _2584 = uint(_2582);
    float _2586 = _936 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _2588 = -_924;
    float _2590 = fma(_2588, (*spvDescriptorSet0.vp_c8)._m0[24].x, _2570);
    float _2592 = fma(_932, (*spvDescriptorSet0.vp_c8)._m0[24].z, _2590);
    float _2594 = abs(_1356);
    float _2596 = log2(_2594);
    int _2598 = _2574 * int(_2558);
    int _2600 = _2598 + _2490;
    float _2602 = -_924;
    float _2604 = fma(_2602, (*spvDescriptorSet0.vp_c8)._m0[25].x, _2364);
    float _2606 = -_924;
    float _2608 = fma(_2606, (*spvDescriptorSet0.vp_c8)._m0[26].x, _2586);
    float _2610 = float(uint(_2600));
    float _2612 = fma(_932, (*spvDescriptorSet0.vp_c8)._m0[25].z, _2604);
    int _2614 = _2578 * int(_2584);
    int _2616 = _2614 + _2506;
    float _2618 = _944 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _2620 = _944 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _2622 = as_type<float>(_2528) * _2610;
    float _2624 = _944 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _2626 = float(uint(_2616));
    float _2628 = fma(_934, (*spvDescriptorSet0.vp_c8)._m0[24].x, _2618);
    float _2630 = fma(_934, (*spvDescriptorSet0.vp_c8)._m0[25].x, _2620);
    float _2632 = fma(_934, (*spvDescriptorSet0.vp_c8)._m0[26].x, _2624);
    float _2634 = trunc(_2622);
    float _2636 = precise::max(_2634, 0.0);
    uint _2638 = uint(_2636);
    float _2640 = as_type<float>(_2548) * _2626;
    float _2642 = _950 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _2644 = _950 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _2646 = _950 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _2648 = fma(_932, (*spvDescriptorSet0.vp_c8)._m0[26].z, _2608);
    float _2650 = fma(_938, (*spvDescriptorSet0.vp_c8)._m0[24].x, _2642);
    float _2652 = fma(_938, (*spvDescriptorSet0.vp_c8)._m0[25].x, _2644);
    float _2654 = trunc(_2640);
    float _2656 = precise::max(_2654, 0.0);
    uint _2658 = uint(_2656);
    float _2660 = fma(_938, (*spvDescriptorSet0.vp_c8)._m0[26].x, _2646);
    int _2662 = ~_2386;
    int _2664 = _2662 + 1;
    float _2666 = _2648 * _2542;
    float _2668 = _2596 * (*spvDescriptorSet0.vp_c15)._m0[654].z;
    int _2670 = ~_2466;
    int _2672 = _2670 + 1;
    float _2674 = _2592 * _2542;
    float _2676 = fma(_958, (*spvDescriptorSet0.vp_c8)._m0[24].z, _2628);
    int _2678 = int(_2558) + int(_2638);
    float _2680 = _2612 * _2542;
    float _2682 = exp2(_2668);
    float _2684 = fma(_966, (*spvDescriptorSet0.vp_c8)._m0[24].z, _2650);
    float _2686 = fma(_966, (*spvDescriptorSet0.vp_c8)._m0[25].z, _2652);
    int _2688 = _2664 * _2678;
    int _2690 = _2688 + _2490;
    int _2692 = int(_2584) + int(_2658);
    float _2694 = fma(_958, (*spvDescriptorSet0.vp_c8)._m0[25].z, _2630);
    float _2696 = fma(_958, (*spvDescriptorSet0.vp_c8)._m0[26].z, _2632);
    bool _2698 = uint(_2690) >= uint(_2386);
    int _2700 = _2672 * _2692;
    int _2702 = _2700 + _2506;
    float _2704 = fma(_2676, _2518, _2674);
    float _2706 = fma(_2696, _2518, _2666);
    bool _2708 = !_2698;
    int _2710 = _2708 ? 0 : (-1);
    float _2712 = fma(_2694, _2518, _2680);
    bool _2714 = uint(_2702) >= uint(_2466);
    float _2716 = fma(_2682, (*spvDescriptorSet0.vp_c15)._m0[654].x, (*spvDescriptorSet0.vp_c15)._m0[654].y);
    float _2718 = precise::clamp(_2716, 0.0, 1.0);
    int _2720 = ~_2678;
    int _2722 = _2720 + _2710;
    int _2724 = _2722 + 1;
    float _2726 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    bool _2728 = !_2714;
    int _2730 = _2728 ? 0 : (-1);
    float _2732 = fma(_2684, _2526, _2704);
    bool _2734 = _2386 == 0;
    float _2736 = fma(_2686, _2526, _2712);
    int _2738 = _2490 ^ _2386;
    float _2740 = fma(_966, (*spvDescriptorSet0.vp_c8)._m0[26].z, _2660);
    bool _2742 = _2386 == 0;
    int _2744 = _2386 * _2724;
    int _2746 = _2744 + _2490;
    float _2748 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    uint _2750 = uint(int(uint(_2738) >> uint(31)));
    float _2752 = fma(_2740, _2526, _2706);
    int _2754 = ~_2730;
    int _2756 = _2692 + _2754;
    int _2758 = _2756 + 1;
    float _2760 = fma(_2718, -2.0, 3.0);
    float _2762 = _2718 * _2718;
    int _2764 = ~int(_2750);
    int _2766 = _2764 + 1;
    float _2768 = _1664 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _2770 = _2726 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _2772 = _2762 * _2760;
    bool _2774 = !_2734;
    int _2776 = _2774 ? _2746 : (-1);
    float _2778 = fma(_1682, (*spvDescriptorSet0.vp_c8)._m0[6].x, _2768);
    int _2780 = _2758 ^ _2766;
    float _2782 = -_2772;
    float _2784 = _2782 + 1.0;
    float _2786 = float(_2776);
    float _2788 = fma(_2770, _2568, -0.5);
    float _2790 = _2748 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    int _2792 = ~_2766;
    int _2794 = _2792 + _2780;
    int _2796 = _2794 + 1;
    float _2798 = in.m_79.x;
    bool _2800 = _1356 <= 8000.0;
    bool _2802 = isnan(_1356);
    bool _2804 = _2800 || _2802;
    bool _2806 = isnan(8000.0);
    bool _2808 = _2804 || _2806;
    float _2810 = float(_2808);
    float _2812 = fma(_2784, (*spvDescriptorSet0.vp_c15)._m0[654].w, _2772);
    bool _2814 = !_2742;
    int _2816 = _2814 ? _2796 : (-1);
    float _2818 = fma(_2770, _2786, _632);
    float _2820 = fma(_2790, _2144, -0.5);
    float _2822 = _2810 * _2812;
    float _2824 = float(_2816);
    float _2826 = _1858 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _2828 = _2822 * (*spvDescriptorSet0.vp_c15)._m0[653].x;
    float _2830 = _1700 * 0.5;
    float _2832 = -_564;
    float _2834 = fma(_2790, _2824, _2832);
    float _2836 = fma(_634, _2788, _2818);
    float _2838 = _2292 * _2828;
    float _2840 = precise::clamp(_2838, 0.0, 1.0);
    float _2842 = _2826 * _1784;
    float _2844 = fma(_642, _2820, _2834);
    float _2846 = fma(_1754, -0.5, _2830);
    float _2848 = -_2840;
    float _2850 = fma(_2848, (*spvDescriptorSet0.vp_c15)._m0[653].y, 1.0);
    float _2852 = _2836 + 0.5;
    float _2854 = _2844 + 0.5;
    float _2856 = -_2826;
    float _2858 = _2856 + 1.0;
    float _2860 = _1795 * _2842;
    float _2862 = _1805 * _2842;
    float _2864 = _2850 * _2798;
    out.m_81.x = _2852;
    out.m_81.y = _2854;
    float _2866 = _1795 * _2858;
    float _2868 = fma(_1795, _2862, _1793);
    float _2870 = _2864 * (*spvDescriptorSet0.vp_c13)._m0[1].w;
    out.m_83.x = _2732;
    out.m_83.y = _2736;
    out.m_83.z = _2752;
    float _2872 = fma(_1496, (*spvDescriptorSet0.vp_c8)._m0[6].z, _2778);
    bool _2874 = _1502 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _2876 = isnan(_1502);
    bool _2878 = _2874 || _2876;
    bool _2880 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _2882 = _2878 || _2880;
    float _2884 = _1742 + _1700;
    out.m_85.x = _2870;
    float _2886 = fma(_1500, (*spvDescriptorSet0.vp_c8)._m0[6].w, _2872);
    float _2888 = fma(_1801, _2860, _1789);
    float _2890 = fma(_1803, _2860, _1791);
    float _2892 = _2886 + _1700;
    float _2894 = _2884 * 0.5;
    float _2896 = _1410 * _1464;
    out.m_87.x = _2888;
    out.m_87.y = _2890;
    out.m_87.z = _2868;
    out.m_87.w = _2866;
    float _2898 = _2892 * 0.5;
    out.gl_Position.x = _1742;
    out.gl_Position.y = _1754;
    out.gl_Position.z = _2886;
    out.gl_Position.w = _1700;
    out.m_89.x = _2894;
    out.m_89.y = _2846;
    out.m_89.z = _2898;
    out.m_89.w = _1700;
    float _2900 = _2886;
    float _2902 = _2894;
    float _2904 = _2896;
    if (!_2882)
    {
        _2136 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _2906 = _2136;
    float _2908 = _2906;
    float _2910 = _2906;
    if (!_2882)
    {
        _2900 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _2912 = _2900;
    float _2914 = _2896 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _2916 = _2912;
    float _2918 = _2912;
    if (!_2882)
    {
        _2902 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _2920 = _2902;
    float _2922 = _2920;
    float _2924 = _2920;
    if (!_2882)
    {
        _2138 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _2926 = _2138;
    float _2928 = _2926;
    float _2930 = _2926;
    if (!_2882)
    {
        _2140 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _2932 = _2140;
    float _2934 = _2932;
    float _2936 = _2932;
    if (!_2882)
    {
        _2904 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _2938 = _2904;
    bool _2940 = !_2882;
    float _2942 = _2938;
    float _2944 = _2938;
    if (!_2940)
    {
        bool _2946 = _1502 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _2948 = isnan(_1502);
        bool _2950 = _2946 || _2948;
        bool _2952 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _2954 = _2950 || _2952;
        if (!_2954)
        {
            float _2956 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2958 = _1502 + _2956;
            float _2960 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2962 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _2960;
            float _2964 = 1.0 / _2962;
            float _2966 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _2968 = _2966 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _2970 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _2972 = _2970 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _2974 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _2976 = _2974 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _2978 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _2980 = _2978 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _2982 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _2984 = _2982 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _2986 = _2958 * _2964;
            float _2988 = precise::clamp(_2986, 0.0, 1.0);
            float _2990 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _2992 = _2990 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _2994 = fma(_2988, _2968, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _2996 = fma(_2988, _2992, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _2998 = fma(_2988, _2972, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _3000 = fma(_2988, _2976, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _3002 = fma(_2988, _2980, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _3004 = fma(_2988, _2984, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            _2910 = _2996;
            _2936 = _3002;
            _2924 = _2994;
            _2930 = _3000;
            _2918 = _2998;
            _2944 = _3004;
            _3006 = true;
        }
        else
        {
            bool _3008 = _1502 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _3010 = isnan(_1502);
            bool _3012 = _3008 || _3010;
            bool _3014 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _3016 = _3012 || _3014;
            if (!_3016)
            {
                _2922 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _3018 = _2922;
            _2924 = _3018;
            if (!_3016)
            {
                _2908 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _3020 = _2908;
            _2910 = _3020;
            if (!_3016)
            {
                _2916 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _3022 = _2916;
            _2918 = _3022;
            if (!_3016)
            {
                _2928 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _3024 = _2928;
            _2930 = _3024;
            if (!_3016)
            {
                _2934 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _3026 = _2934;
            _2936 = _3026;
            if (!_3016)
            {
                _2942 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _3028 = _2942;
            bool _3030 = !_3016;
            _2944 = _3028;
            if (!_3030)
            {
                bool _3032 = _1502 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _3034 = isnan(_1502);
                bool _3036 = _3032 || _3034;
                bool _3038 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _3040 = _3036 || _3038;
                if (!_3040)
                {
                    float _3042 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _3044 = _1502 + _3042;
                    float _3046 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _3048 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _3046;
                    float _3050 = 1.0 / _3048;
                    float _3052 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _3054 = _3052 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _3056 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _3058 = _3056 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _3060 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _3062 = _3060 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _3064 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _3066 = _3064 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _3068 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _3070 = _3068 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _3072 = _3044 * _3050;
                    float _3074 = precise::clamp(_3072, 0.0, 1.0);
                    float _3076 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _3078 = _3076 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _3080 = fma(_3074, _3054, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _3082 = fma(_3074, _3078, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _3084 = fma(_3074, _3058, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _3086 = fma(_3074, _3062, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _3088 = fma(_3074, _3066, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _3090 = fma(_3074, _3070, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    _2910 = _3082;
                    _2936 = _3088;
                    _2924 = _3080;
                    _2930 = _3086;
                    _2918 = _3084;
                    _2944 = _3090;
                    _3006 = true;
                }
                else
                {
                    _2910 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _2936 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _2924 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _2930 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _2918 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _2944 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _3006 = false;
    float _3092 = _2910;
    float _3094 = _2936;
    float _3096 = _2924;
    float _3098 = _2930;
    float _3100 = _2918;
    float _3102 = _2944;
    float _3104 = _2914 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _3106 = fma(_2736, -0.5, 0.5);
    float _3108 = precise::clamp(_3106, 0.0, 1.0);
    float _3110 = -_3092;
    float _3112 = _3110 + _3094;
    float _3114 = -_3096;
    float _3116 = _3114 + _3098;
    out.m_49.x = _3104;
    float _3118 = fma(_3108, _3112, _3092);
    float _3120 = -_3100;
    float _3122 = _3120 + _3102;
    float _3124 = fma(_3108, _3116, _3096);
    float _3126 = _3118 * 0.586610972881317138671875;
    bool _3128 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _3130 = fma(_3108, _3122, _3100);
    out.m_91.x = 0.0;
    float _3132 = fma(_3124, 0.298911988735198974609375, _3126);
    bool _3134 = _1410 > 0.0;
    bool _3136 = isnan(_1410);
    bool _3138 = _3134 || _3136;
    bool _3140 = isnan(0.0);
    bool _3142 = _3138 || _3140;
    float _3144 = fma(_3130, 0.114477999508380889892578125, _3132);
    bool _3146 = _1464 <= 0.0;
    bool _3148 = !_3142;
    bool _3150 = _3146 || _3148;
    float _3152 = -_3144;
    float _3154 = _3124 + _3152;
    float _3156 = -_3144;
    float _3158 = _3118 + _3156;
    float _3160 = -_3144;
    float _3162 = _3130 + _3160;
    float _3164 = fma(_3154, (*spvDescriptorSet0.vp_c13)._m0[1].z, _3144);
    float _3166 = fma(_3158, (*spvDescriptorSet0.vp_c13)._m0[1].z, _3144);
    float _3168 = fma(_3162, (*spvDescriptorSet0.vp_c13)._m0[1].z, _3144);
    bool _3170 = !_3128;
    if (!_3170)
    {
        float _3172 = -_1346;
        float _3174 = _3172 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
        float _3176 = -_1348;
        float _3178 = _3176 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
        float _3180 = -_1350;
        float _3182 = _3180 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
        float _3184 = _3174 * _3174;
        float _3186 = fma(_3178, _3178, _3184);
        float _3188 = fma(_3182, _3182, _3186);
        float _3190 = sqrt(_3188);
        float _3192 = rsqrt(_3188);
        float _3194 = -_3190;
        float _3196 = _3194 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
        float _3198 = _3196 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
        float _3200 = precise::clamp(_3198, 0.0, 1.0);
        float _3202 = _3178 * _3192;
        float _3204 = _3174 * _3192;
        float _3206 = abs(_3200);
        float _3208 = log2(_3206);
        float _3210 = _3182 * _3192;
        float _3212 = _3202 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
        float _3214 = _2736 * _3204;
        float _3216 = -_3204;
        float _3218 = -_3212;
        float _3220 = fma(_3216, (*spvDescriptorSet0.vp_c15)._m0[656].y, _3218);
        float _3222 = fma(_2732, _3202, _3214);
        float _3224 = -_3210;
        float _3226 = fma(_3224, (*spvDescriptorSet0.vp_c15)._m0[656].z, _3220);
        float _3228 = fma(_2752, _3210, _3222);
        float _3230 = precise::clamp(_3228, 0.0, 1.0);
        float _3232 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
        float _3234 = _3226 + _3232;
        float _3236 = _3208 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
        float _3238 = _3234 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
        float _3240 = precise::clamp(_3238, 0.0, 1.0);
        float _3242 = exp2(_3236);
        float _3244 = _3242 * _3240;
        float _3246 = _3230 * _3244;
        float _3248 = _3246 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
        float _3250 = _3246 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
        float _3252 = _3246 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
        out.m_91.x = _3248;
        out.m_91.y = _3250;
        out.m_91.z = _3252;
    }
    out.m_67.x = _3164;
    out.m_67.y = _3166;
    out.m_67.z = _3168;
    if (!_3150)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_59.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_59.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_59.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_59.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_77.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_77.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_77.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_77.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_87.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_87.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_87.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_87.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_65.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_65.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_65.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_65.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_67.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_67.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_67.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_67.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_83.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_83.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_83.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_83.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.dm_pad6.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.dm_pad6.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.dm_pad6.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.dm_pad6.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_71.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_71.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_71.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_71.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_81.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_81.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_81.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_81.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_91.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_91.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_91.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_91.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_85.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_85.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_85.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_85.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_89.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_89.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_89.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_89.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_49.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_49.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_49.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_49.w)); dm_cw(dm_gs, dm_p, 68, as_type<uint>(out.m_69.x)); dm_cw(dm_gs, dm_p, 69, as_type<uint>(out.m_69.y)); dm_cw(dm_gs, dm_p, 70, as_type<uint>(out.m_69.z)); dm_cw(dm_gs, dm_p, 71, as_type<uint>(out.m_69.w)); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    out.m_49.x = 0.0;
    float _3254 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _3254;
    { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_59.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_59.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_59.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_59.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_77.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_77.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_77.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_77.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_87.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_87.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_87.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_87.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_65.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_65.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_65.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_65.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_67.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_67.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_67.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_67.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_83.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_83.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_83.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_83.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.dm_pad6.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.dm_pad6.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.dm_pad6.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.dm_pad6.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_71.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_71.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_71.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_71.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_81.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_81.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_81.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_81.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_91.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_91.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_91.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_91.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_85.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_85.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_85.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_85.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_89.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_89.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_89.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_89.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_49.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_49.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_49.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_49.w)); dm_cw(dm_gs, dm_p, 68, as_type<uint>(out.m_69.x)); dm_cw(dm_gs, dm_p, 69, as_type<uint>(out.m_69.y)); dm_cw(dm_gs, dm_p, 70, as_type<uint>(out.m_69.z)); dm_cw(dm_gs, dm_p, 71, as_type<uint>(out.m_69.w)); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
}

