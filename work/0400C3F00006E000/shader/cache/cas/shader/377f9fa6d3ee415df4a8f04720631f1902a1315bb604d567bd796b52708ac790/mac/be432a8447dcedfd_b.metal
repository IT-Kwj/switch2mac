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
    constant _16* vp_c8 [[id(0)]];
    constant _16* vp_c10 [[id(1)]];
    constant _16* vp_c9 [[id(2)]];
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
    float4 m_63 [[user(locn0)]];
    float4 m_81 [[user(locn1)]];
    float4 m_71 [[user(locn2)]];
    float4 m_77 [[user(locn3)]];
    float4 m_85 [[user(locn4)]];
    float4 m_75 [[user(locn5)]];
    float4 m_93 [[user(locn6)]];
    float4 m_91 [[user(locn7)]];
    float4 m_83 [[user(locn8)]];
    float4 m_53 [[user(locn9)]];
    float4 m_73 [[user(locn10)]];
    float4 m_87 [[user(locn11)]];
    float4 m_49 [[user(locn12)]];
    float4 m_89 [[user(locn13)]];
    float4 m_69 [[user(locn14)]];
    float4 gl_Position [[position, invariant]];
    float gl_PointSize [[point_size]];
};

struct main0_in
{
    float4 m_79 [[attribute(0)]];
    float4 m_55 [[attribute(2)]];
    float4 m_46 [[attribute(3)]];
    float4 m_51 [[attribute(4)]];
    float4 m_67 [[attribute(5)]];
    float4 m_61 [[attribute(6)]];
    float4 m_57 [[attribute(7)]];
    float4 m_59 [[attribute(8)]];
    float4 m_65 [[attribute(10)]];
};

vertex main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]])
{
    main0_out out = {};
    out.m_63 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_81 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_71 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_77 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_85 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_75 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_93 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_91 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_83 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_53 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_73 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_87 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_49 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_89 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_69 = float4(0.0, 0.0, 0.0, 1.0);
    bool _2647 = false;
    bool _692 = false;
    bool _554 = false;
    bool _446 = false;
    bool _218 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _107 = in.m_46.w;
    float _109 = trunc(_107);
    int _112 = int(_109);
    bool _116 = _112 >= 1;
    float _118 = 0.0;
    float _120 = as_type<float>(_112);
    if (!_116)
    {
        _118 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _122 = _118;
    if (!_116)
    {
        out.m_49.x = 0.0;
    }
    int _124 = 0;
    if (!_116)
    {
        float _126 = _122 * 5.0;
        _124 = as_type<int>(_126);
    }
    int _128 = _124;
    if (!_116)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2952 = as_type<float>(_128);
        out.gl_Position.z = _2952;
    }
    if (!_116)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _130 = in.m_51.w;
    float _132 = float(_112);
    float _134 = 1.0 / _132;
    float _136 = -_130;
    float _138 = _136 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _140 = _130 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _142 = isnan(_130);
    bool _144 = _140 || _142;
    bool _146 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _148 = _144 || _146;
    float _150 = _138 * _134;
    bool _152 = _138 >= _132;
    bool _154 = !_148;
    bool _156 = _152 || _154;
    out.m_53.x = _150;
    if (_156)
    {
        _120 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _158 = _120;
    if (_156)
    {
        out.m_49.x = 0.0;
    }
    int _160 = 0;
    if (_156)
    {
        float _162 = _158 * 5.0;
        _160 = as_type<int>(_162);
    }
    int _164 = _160;
    if (_156)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _3022 = as_type<float>(_164);
        out.gl_Position.z = _3022;
    }
    if (_156)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _166 = in.m_55.x;
    float _168 = in.m_55.y;
    float _170 = in.m_55.z;
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
    float _194 = _190;
    float _196 = _188;
    float _198 = _186;
    float _216;
    if (!_192)
    {
        float _200 = in.m_57.x;
        float _202 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _204 = _200 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _206 = fma(_204, (*spvDescriptorSet0.vp_c9)._m0[12].x, _138);
        float _208 = _206 * _202;
        float _210 = floor(_208);
        float _212 = -_210;
        float _214 = _208 + _212;
        _216 = _214;
        _218 = true;
    }
    else
    {
        _216 = _150;
    }
    _218 = false;
    float _220 = _216;
    float _222 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _224 = _220 + _222;
    float _226 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _228 = _220 + _226;
    float _230 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _232 = _220 + _230;
    float _234 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _236 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _234;
    float _238 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _240 = _238 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _242 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _244 = (*spvDescriptorSet0.vp_c9)._m0[146].w + _242;
    float _246 = 1.0 / _240;
    bool _248 = _220 >= (*spvDescriptorSet0.vp_c9)._m0[146].w;
    bool _250 = isnan(_220);
    bool _252 = _248 || _250;
    bool _254 = isnan((*spvDescriptorSet0.vp_c9)._m0[146].w);
    bool _256 = _252 || _254;
    float _258 = float(_256);
    bool _260 = _220 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _262 = isnan(_220);
    bool _264 = _260 || _262;
    bool _266 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _268 = _264 || _266;
    float _270 = float(_268);
    float _272 = 1.0 / _244;
    float _274 = -(*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _276 = (*spvDescriptorSet0.vp_c9)._m0[144].z + _274;
    bool _278 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].x;
    float _280 = 1.0 / _236;
    float _282 = _232 * _246;
    float _284 = -_258;
    float _286 = _284 + 1.0;
    float _288 = _224 * _272;
    bool _290 = _220 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _292 = isnan(_220);
    bool _294 = _290 || _292;
    bool _296 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _298 = _294 || _296;
    float _300 = float(_298);
    bool _302 = _220 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _304 = isnan(_220);
    bool _306 = _302 || _304;
    bool _308 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _310 = _306 || _308;
    float _312 = float(_310);
    float _314 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _316 = _314 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _318 = _300 * _286;
    float _320 = -_300;
    float _322 = _320 + 1.0;
    float _324 = _228 * _280;
    float _326 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _328 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _326;
    float _330 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _332 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _330;
    float _334 = fma(_276, _324, (*spvDescriptorSet0.vp_c9)._m0[143].z);
    float _336 = fma(_328, _324, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _338 = fma(_332, _324, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _340 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _342 = _340 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _344 = -(*spvDescriptorSet0.vp_c9)._m0[144].z;
    float _346 = _344 + (*spvDescriptorSet0.vp_c9)._m0[145].z;
    float _348 = -_312;
    float _350 = _348 + 1.0;
    float _352 = _312 * _322;
    float _354 = fma(_316, _282, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _356 = fma(_342, _282, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _358 = fma(_346, _282, (*spvDescriptorSet0.vp_c9)._m0[144].z);
    float _360 = _270 * _350;
    float _362 = in.m_59.x;
    float _364 = in.m_59.y;
    float _366 = in.m_59.z;
    float _368 = -_270;
    float _370 = _368 + 1.0;
    float _372 = _336 * _360;
    float _374 = _338 * _360;
    float _376 = _334 * _360;
    float _378 = -(*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _380 = (*spvDescriptorSet0.vp_c9)._m0[146].x + _378;
    float _382 = -(*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _384 = (*spvDescriptorSet0.vp_c9)._m0[146].y + _382;
    float _386 = fma(_370, (*spvDescriptorSet0.vp_c9)._m0[143].x, _372);
    float _388 = fma(_370, (*spvDescriptorSet0.vp_c9)._m0[143].y, _374);
    float _390 = -(*spvDescriptorSet0.vp_c9)._m0[145].z;
    float _392 = (*spvDescriptorSet0.vp_c9)._m0[146].z + _390;
    float _394 = fma(_370, (*spvDescriptorSet0.vp_c9)._m0[143].z, _376);
    float _396 = fma(_384, _288, (*spvDescriptorSet0.vp_c9)._m0[145].y);
    float _398 = fma(_356, _352, _388);
    float _400 = fma(_380, _288, (*spvDescriptorSet0.vp_c9)._m0[145].x);
    float _402 = fma(_392, _288, (*spvDescriptorSet0.vp_c9)._m0[145].z);
    float _404 = fma(_354, _352, _386);
    float _406 = fma(_358, _352, _394);
    float _408 = fma(_396, _318, _398);
    float _410 = fma(_400, _318, _404);
    float _412 = fma(_402, _318, _406);
    float _414 = fma(_258, (*spvDescriptorSet0.vp_c9)._m0[146].y, _408);
    float _416 = fma(_258, (*spvDescriptorSet0.vp_c9)._m0[146].x, _410);
    float _418 = fma(_258, (*spvDescriptorSet0.vp_c9)._m0[146].z, _412);
    float _420 = _414 * _364;
    float _422 = _416 * _362;
    float _424 = _418 * _366;
    bool _426 = !_278;
    float _444;
    if (!_426)
    {
        float _428 = in.m_57.x;
        float _430 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].x;
        float _432 = _428 * (*spvDescriptorSet0.vp_c9)._m0[12].y;
        float _434 = fma(_432, (*spvDescriptorSet0.vp_c9)._m0[11].x, _138);
        float _436 = _434 * _430;
        float _438 = floor(_436);
        float _440 = -_438;
        float _442 = _436 + _440;
        _444 = _442;
        _446 = true;
    }
    else
    {
        _444 = _150;
    }
    _446 = false;
    float _448 = _444;
    float _450 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _452 = _448 + _450;
    bool _454 = _448 >= (*spvDescriptorSet0.vp_c9)._m0[108].w;
    bool _456 = isnan(_448);
    bool _458 = _454 || _456;
    bool _460 = isnan((*spvDescriptorSet0.vp_c9)._m0[108].w);
    bool _462 = _458 || _460;
    float _464 = float(_462);
    float _466 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _468 = (*spvDescriptorSet0.vp_c9)._m0[108].w + _466;
    bool _470 = _448 >= (*spvDescriptorSet0.vp_c9)._m0[107].w;
    bool _472 = isnan(_448);
    bool _474 = _470 || _472;
    bool _476 = isnan((*spvDescriptorSet0.vp_c9)._m0[107].w);
    bool _478 = _474 || _476;
    float _480 = float(_478);
    float _482 = -_464;
    float _484 = _482 + 1.0;
    float _486 = -(*spvDescriptorSet0.vp_c9)._m0[107].x;
    float _488 = (*spvDescriptorSet0.vp_c9)._m0[108].x + _486;
    float _490 = 1.0 / _468;
    bool _492 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _494 = _480 * _484;
    float _496 = -_480;
    float _498 = _496 + 1.0;
    float _500 = _452 * _490;
    float _502 = -(*spvDescriptorSet0.vp_c9)._m0[107].z;
    float _504 = (*spvDescriptorSet0.vp_c9)._m0[108].z + _502;
    float _506 = fma(_488, _500, (*spvDescriptorSet0.vp_c9)._m0[107].x);
    float _508 = -(*spvDescriptorSet0.vp_c9)._m0[107].y;
    float _510 = (*spvDescriptorSet0.vp_c9)._m0[108].y + _508;
    float _512 = fma(_504, _500, (*spvDescriptorSet0.vp_c9)._m0[107].z);
    float _514 = _506 * _494;
    float _516 = fma(_510, _500, (*spvDescriptorSet0.vp_c9)._m0[107].y);
    float _518 = _512 * _494;
    float _520 = _516 * _494;
    float _522 = fma(_498, (*spvDescriptorSet0.vp_c9)._m0[107].x, _514);
    float _524 = fma(_498, (*spvDescriptorSet0.vp_c9)._m0[107].y, _520);
    float _526 = fma(_498, (*spvDescriptorSet0.vp_c9)._m0[107].z, _518);
    float _528 = fma(_464, (*spvDescriptorSet0.vp_c9)._m0[108].x, _522);
    float _530 = fma(_464, (*spvDescriptorSet0.vp_c9)._m0[108].y, _524);
    float _532 = fma(_464, (*spvDescriptorSet0.vp_c9)._m0[108].z, _526);
    bool _534 = !_492;
    float _552;
    if (!_534)
    {
        float _536 = in.m_57.x;
        float _538 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _540 = _536 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _542 = fma(_540, (*spvDescriptorSet0.vp_c9)._m0[11].y, _138);
        float _544 = _542 * _538;
        float _546 = floor(_544);
        float _548 = -_546;
        float _550 = _544 + _548;
        _552 = _550;
        _554 = true;
    }
    else
    {
        _552 = _150;
    }
    _554 = false;
    float _556 = _552;
    float _558 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _560 = _556 + _558;
    float _562 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _564 = _562 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _566 = _556 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _568 = isnan(_556);
    bool _570 = _566 || _568;
    bool _572 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _574 = _570 || _572;
    float _576 = float(_574);
    float _578 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _580 = _578 + (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _582 = _556 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _584 = isnan(_556);
    bool _586 = _582 || _584;
    bool _588 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _590 = _586 || _588;
    float _592 = float(_590);
    float _594 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _596 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _594;
    bool _598 = _556 >= (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _600 = isnan(_556);
    bool _602 = _598 || _600;
    bool _604 = isnan((*spvDescriptorSet0.vp_c9)._m0[117].w);
    bool _606 = _602 || _604;
    float _608 = float(_606);
    float _610 = 1.0 / _564;
    float _612 = -_576;
    float _614 = _612 + 1.0;
    bool _616 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].w;
    float _618 = _592 * _614;
    float _620 = -_592;
    float _622 = _620 + 1.0;
    float _624 = 1.0 / _580;
    float _626 = _596 * _610;
    float _628 = -(*spvDescriptorSet0.vp_c9)._m0[116].x;
    float _630 = _628 + (*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _632 = _528 * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _634 = _530 * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _636 = fma(_626, _560, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _638 = _532 * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _640 = _632 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _642 = _634 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _644 = _630 * _624;
    float _646 = _636 * _618;
    float _648 = -_608;
    float _650 = _648 + 1.0;
    float _652 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _654 = _556 + _652;
    float _656 = _638 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _658 = fma(_622, (*spvDescriptorSet0.vp_c9)._m0[115].x, _646);
    float _660 = _576 * _650;
    float _662 = fma(_644, _654, (*spvDescriptorSet0.vp_c9)._m0[116].x);
    float _664 = fma(_662, _660, _658);
    float _666 = fma(_608, (*spvDescriptorSet0.vp_c9)._m0[117].x, _664);
    float _668 = _666 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    bool _670 = !_616;
    float _672 = _668;
    float _690;
    if (!_670)
    {
        float _674 = in.m_57.x;
        float _676 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].w;
        float _678 = _674 * (*spvDescriptorSet0.vp_c9)._m0[13].x;
        float _680 = fma(_678, (*spvDescriptorSet0.vp_c9)._m0[11].w, _138);
        float _682 = _680 * _676;
        float _684 = floor(_682);
        float _686 = -_684;
        float _688 = _682 + _686;
        _690 = _688;
        _692 = true;
    }
    else
    {
        _690 = _150;
    }
    _692 = false;
    float _694 = _690;
    float _696 = in.m_46.x;
    float _698 = in.m_46.y;
    float _700 = in.m_46.z;
    float _702 = _422 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _704 = _420 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _706 = _702 * (*spvDescriptorSet0.vp_c13)._m0[2].y;
    float _708 = (*spvDescriptorSet0.vp_c8)._m0[28].y * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _710 = _424 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _712 = -(*spvDescriptorSet0.vp_c9)._m0[193].w;
    float _714 = _712 + (*spvDescriptorSet0.vp_c9)._m0[194].x;
    float _716 = fma(_150, _714, (*spvDescriptorSet0.vp_c9)._m0[193].w);
    float _718 = _698 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _720 = _698 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _722 = _698 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _724 = fma(_696, (*spvDescriptorSet0.vp_c10)._m0[5].x, _718);
    float _726 = fma(_696, (*spvDescriptorSet0.vp_c10)._m0[4].x, _720);
    float _728 = fma(_696, (*spvDescriptorSet0.vp_c10)._m0[6].x, _722);
    float _730 = fma(_700, (*spvDescriptorSet0.vp_c10)._m0[5].z, _724);
    float _732 = fma(_700, (*spvDescriptorSet0.vp_c10)._m0[4].z, _726);
    float _734 = fma(_700, (*spvDescriptorSet0.vp_c10)._m0[6].z, _728);
    float _736 = _730 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _738 = _732 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _740 = _734 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _742 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _744 = _736 + _742;
    float _746 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _748 = _738 + _746;
    float _750 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _752 = _740 + _750;
    float _754 = -_736;
    float _756 = _754 + (*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _758 = _744 * _744;
    float _760 = -_738;
    float _762 = _760 + (*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _764 = -_740;
    float _766 = _764 + (*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _768 = fma(_748, _748, _758);
    float _770 = fma(_752, _752, _768);
    float _772 = sqrt(_770);
    float _774 = rsqrt(_770);
    float _776 = _772 * (*spvDescriptorSet0.vp_c13)._m0[2].x;
    float _778 = fma((*spvDescriptorSet0.vp_c8)._m0[28].x, (*spvDescriptorSet0.vp_c8)._m0[28].x, _708);
    float _780 = _736 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _782 = precise::min(_706, _776);
    float _784 = _756 * _756;
    float _786 = (*spvDescriptorSet0.vp_c8)._m0[0].y * (*spvDescriptorSet0.vp_c10)._m0[9].w;
    float _788 = fma(_738, (*spvDescriptorSet0.vp_c8)._m0[0].x, _780);
    float _790 = fma(_762, _762, _784);
    float _792 = _774 * _782;
    float _794 = fma((*spvDescriptorSet0.vp_c8)._m0[0].x, (*spvDescriptorSet0.vp_c10)._m0[8].w, _786);
    float _796 = fma(_766, _766, _790);
    float _798 = _744 * _792;
    float _800 = fma(_740, (*spvDescriptorSet0.vp_c8)._m0[0].z, _788);
    float _802 = _748 * _792;
    float _804 = rsqrt(_796);
    float _806 = fma((*spvDescriptorSet0.vp_c8)._m0[0].z, (*spvDescriptorSet0.vp_c10)._m0[10].w, _794);
    float _808 = -_798;
    float _810 = _744 + _808;
    float _812 = _800 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _814 = -_802;
    float _816 = _748 + _814;
    float _818 = _806 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _820 = _810 * _810;
    float _822 = -(*spvDescriptorSet0.vp_c9)._m0[194].y;
    float _824 = (*spvDescriptorSet0.vp_c9)._m0[194].z + _822;
    float _826 = _752 * _792;
    float _828 = -_812;
    float _830 = _818 + _828;
    float _832 = fma(_816, _816, _820);
    float _834 = 1.0 / _824;
    float _836 = -_826;
    float _838 = _752 + _836;
    bool _840 = _812 >= _818;
    bool _842 = isnan(_812);
    bool _844 = _840 || _842;
    bool _846 = isnan(_818);
    bool _848 = _844 || _846;
    float _850 = abs(_830);
    float _852 = precise::max(_850, (*spvDescriptorSet0.vp_c9)._m0[194].y);
    float _854 = _762 * _804;
    float _856 = _766 * _804;
    float _858 = _756 * _804;
    float _860 = precise::min(_852, (*spvDescriptorSet0.vp_c9)._m0[194].z);
    float _862 = -(*spvDescriptorSet0.vp_c8)._m0[1].z;
    float _864 = _854 * _862;
    float _866 = -(*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _868 = _856 * _866;
    float _870 = sqrt(_796);
    float _872 = -(*spvDescriptorSet0.vp_c8)._m0[1].x;
    float _874 = _858 * _872;
    float _876 = -(*spvDescriptorSet0.vp_c8)._m0[1].x;
    float _878 = -_864;
    float _880 = fma(_856, _876, _878);
    float _882 = -(*spvDescriptorSet0.vp_c8)._m0[1].z;
    float _884 = -_868;
    float _886 = fma(_858, _882, _884);
    float _888 = fma(_838, _838, _832);
    float _890 = -(*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _892 = -_874;
    float _894 = fma(_854, _890, _892);
    float _896 = _880 * _880;
    float _898 = in.m_61.x;
    float _900 = in.m_61.y;
    float _902 = in.m_61.z;
    float _904 = -(*spvDescriptorSet0.vp_c9)._m0[194].y;
    float _906 = _860 + _904;
    float _908 = fma(_886, _886, _896);
    float _910 = sqrt(_888);
    float _912 = _906 * _834;
    float _914 = fma(_894, _894, _908);
    bool _916 = !_848;
    float _918 = _916 ? 1.0 : (-1.0);
    float _920 = abs(_870);
    float _922 = precise::max(0.0, _920);
    float _924 = rsqrt(_914);
    float _926 = fma((*spvDescriptorSet0.vp_c8)._m0[28].z, (*spvDescriptorSet0.vp_c8)._m0[28].z, _778);
    float _928 = precise::min(_922, 40.0);
    float _930 = _918 * _912;
    float _932 = _150 * (*spvDescriptorSet0.vp_c9)._m0[194].w;
    float _934 = fma(_928, -0.02500000037252902984619140625, 1.0);
    float _936 = _774 * _910;
    float _938 = rsqrt(_926);
    float _940 = _932 * _930;
    float _942 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _900);
    float _944 = _704 * _936;
    float _946 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _902);
    float _948 = _710 * _936;
    float _950 = _894 * _924;
    float _952 = _886 * _924;
    float _954 = _880 * _924;
    float _956 = _944 * _942;
    float _958 = _854 * _950;
    float _960 = _702 * _936;
    float _962 = _856 * _954;
    float _964 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _898);
    float _966 = -_958;
    float _968 = fma(_856, _952, _966);
    float _970 = _948 * _946;
    float _972 = -_962;
    float _974 = fma(_858, _950, _972);
    float _976 = _858 * _952;
    float _978 = _960 * _964;
    float _980 = _956 * _968;
    float _982 = _938 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _984 = _956 * _974;
    float _986 = -_976;
    float _988 = fma(_854, _954, _986);
    float _990 = fma(_978, _954, _980);
    float _992 = _938 * (*spvDescriptorSet0.vp_c8)._m0[28].x;
    float _994 = _982 * _982;
    float _996 = fma(_978, _952, _984);
    float _998 = _956 * _988;
    float _1000 = fma(_970, _858, _990);
    float _1002 = _938 * (*spvDescriptorSet0.vp_c8)._m0[28].z;
    float _1004 = fma(_992, _992, _994);
    float _1006 = fma(_978, _950, _998);
    float _1008 = fma(_970, _854, _996);
    float _1010 = _736 + _1000;
    float _1012 = fma(_1002, _1002, _1004);
    float _1014 = _940 * 0.15915493667125701904296875;
    float _1016 = _736 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1018 = fma(_970, _856, _1006);
    float _1020 = _738 + _1008;
    float _1022 = _1010 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1024 = _1010 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1026 = _1010 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1028 = fma(_738, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1016);
    float _1030 = _740 + _1018;
    float _1032 = fma(_1020, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1022);
    float _1034 = fma(_1020, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1024);
    float _1036 = fma(_1020, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1026);
    float _1038 = rsqrt(_1012);
    float _1040 = fma(_740, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1028);
    float _1042 = fma(_1030, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1034);
    float _1044 = fma(_1030, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1036);
    float _1046 = fma(_1030, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1032);
    float _1048 = _1040 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1050 = _1042 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1052 = _1044 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1054 = _1014 * 6.283185482025146484375;
    float _1056 = cos(_1054);
    float _1058 = _1046 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1060 = -_1050;
    float _1062 = _1060 + _1048;
    float _1064 = _1052 * (*spvDescriptorSet0.vp_c8)._m0[13].y;
    float _1066 = _1052 * (*spvDescriptorSet0.vp_c8)._m0[12].y;
    float _1068 = _1052 * (*spvDescriptorSet0.vp_c8)._m0[14].y;
    float _1070 = fma(_934, _1062, _1050);
    float _1072 = fma(_1058, (*spvDescriptorSet0.vp_c8)._m0[13].x, _1064);
    float _1074 = _1014 * 6.283185482025146484375;
    float _1076 = sin(_1074);
    float _1078 = fma(_1058, (*spvDescriptorSet0.vp_c8)._m0[12].x, _1066);
    float _1080 = fma(_1058, (*spvDescriptorSet0.vp_c8)._m0[14].x, _1068);
    float _1082 = fma(_1070, (*spvDescriptorSet0.vp_c8)._m0[13].z, _1072);
    float _1084 = fma(_1070, (*spvDescriptorSet0.vp_c8)._m0[12].z, _1078);
    float _1086 = fma(_1070, (*spvDescriptorSet0.vp_c8)._m0[14].z, _1080);
    float _1088 = -_1056;
    float _1090 = _1088 + 1.0;
    float _1092 = _992 * _1038;
    float _1094 = _982 * _1038;
    float _1096 = _1002 * _1038;
    float _1098 = _1084 + (*spvDescriptorSet0.vp_c8)._m0[12].w;
    float _1100 = _1094 * _1090;
    float _1102 = _1096 * _1096;
    float _1104 = _1092 * _1076;
    float _1106 = _1094 * _1076;
    float _1108 = _1096 * _1076;
    float _1110 = _1082 + (*spvDescriptorSet0.vp_c8)._m0[13].w;
    float _1112 = fma(_1090, _1102, _1056);
    float _1114 = _1092 * _1090;
    float _1116 = fma(_1096, _1100, _1104);
    float _1118 = -_736;
    float _1120 = _1118 + _1110;
    float _1122 = -_738;
    float _1124 = _1122 + _1098;
    float _1126 = -_1106;
    float _1128 = fma(_1096, _1114, _1126);
    float _1130 = -_1108;
    float _1132 = fma(_1094, _1114, _1130);
    float _1134 = _1116 * _1120;
    float _1136 = _1086 + (*spvDescriptorSet0.vp_c8)._m0[14].w;
    float _1138 = fma(_1092, _1114, _1056);
    float _1140 = _1132 * _1120;
    float _1142 = fma(_1128, _1124, _1134);
    float _1144 = -_740;
    float _1146 = _1144 + _1136;
    float _1148 = fma(_1096, _1114, _1106);
    float _1150 = fma(_1138, _1124, _1140);
    float _1152 = fma(_1094, _1100, _1056);
    float _1154 = fma(_1112, _1146, _1142);
    float _1156 = fma(_1094, _1114, _1108);
    float _1158 = fma(_1148, _1146, _1150);
    float _1160 = _1152 * _1120;
    float _1162 = fma(_1154, _716, _740);
    float _1164 = -_798;
    float _1166 = _736 + _1164;
    float _1168 = fma(_1158, _716, _738);
    float _1170 = -_1104;
    float _1172 = fma(_1096, _1100, _1170);
    float _1174 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1176 = _1162 + _1174;
    float _1178 = fma(_1156, _1124, _1160);
    float _1180 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1182 = _1168 + _1180;
    float _1184 = _1166 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _1186 = _1176 * _1176;
    float _1188 = fma(_1172, _1146, _1178);
    float _1190 = -_826;
    float _1192 = _740 + _1190;
    float _1194 = fma(_1182, _1182, _1186);
    float _1196 = -_802;
    float _1198 = _738 + _1196;
    float _1200 = _736 + _1188;
    float _1202 = sqrt(_1194);
    float _1204 = fma(_1198, (*spvDescriptorSet0.vp_c8)._m0[11].x, _1184);
    float _1206 = fma(_1192, (*spvDescriptorSet0.vp_c8)._m0[11].z, _1204);
    bool _1208 = _1202 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1210 = _1188;
    float _1212 = _1204;
    float _1214 = _1156;
    float _1216 = _1200;
    if (!_1208)
    {
        _1210 = _1168;
    }
    float _1218 = _1210;
    float _1220 = _1218;
    if (!_1208)
    {
        _1212 = _1162;
    }
    float _1222 = _1212;
    float _1224 = _1222;
    if (!_1208)
    {
        _1214 = _1200;
    }
    float _1226 = _1214;
    bool _1228 = !_1208;
    float _1230 = _1226;
    if (!_1228)
    {
        float _1232 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1234 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1236 = _1202 + _1234;
        float _1238 = _1200 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1240 = rsqrt(_1194);
        float _1242 = _1236 * _1232;
        float _1244 = _1242 * 0.15915493667125701904296875;
        float _1246 = _1244 * 6.283185482025146484375;
        float _1248 = cos(_1246);
        float _1250 = _1244 * 6.283185482025146484375;
        float _1252 = sin(_1250);
        float _1254 = _1248 + (-1.0);
        float _1256 = _1254 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1258 = fma(_1252, _1238, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1260 = fma(_1200, _1248, _1256);
        float _1262 = _1240 * _1258;
        float _1264 = fma(_1182, _1262, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1266 = fma(_1176, _1262, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _1230 = _1260;
        _1220 = _1264;
        _1224 = _1266;
    }
    float _1268 = _1230;
    float _1270 = _1220;
    float _1272 = _1224;
    float _1274 = -_736;
    float _1276 = _1274 + _1268;
    float _1278 = -_738;
    float _1280 = _1278 + _1270;
    float _1282 = _1206 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _1284 = _1166 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _1286 = _1276 * _1276;
    float _1288 = -_740;
    float _1290 = _1288 + _1272;
    float _1292 = 1.0 / _1282;
    float _1294 = fma(_1198, (*spvDescriptorSet0.vp_c8)._m0[10].x, _1284);
    float _1296 = fma(_1280, _1280, _1286);
    float _1298 = -_802;
    float _1300 = _1298 + _1270;
    float _1302 = fma(_1192, (*spvDescriptorSet0.vp_c8)._m0[10].z, _1294);
    float _1304 = fma(_1290, _1290, _1296);
    float _1306 = -_798;
    float _1308 = _1306 + _1268;
    float _1310 = -_826;
    float _1312 = _1310 + _1272;
    float _1314 = _1302 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _1316 = sqrt(_1304);
    float _1318 = _1314 + _1282;
    float _1320 = _1318 * _1292;
    float _1322 = _1320 * 0.5;
    float _1324 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _1326 = fma(_1322, (*spvDescriptorSet0.vp_c8)._m0[30].w, _1324);
    bool _1328 = _1316 > 0.0;
    float _1330 = 1.0 / _1326;
    bool _1332 = (*spvDescriptorSet0.vp_c15)._m0[653].w >= 0.5;
    bool _1334 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _1336 = _1332 || _1334;
    bool _1338 = isnan(0.5);
    bool _1340 = _1336 || _1338;
    bool _1342 = (*spvDescriptorSet0.vp_c15)._m0[660].y >= 0.5;
    bool _1344 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _1346 = _1342 || _1344;
    bool _1348 = isnan(0.5);
    bool _1350 = _1346 || _1348;
    float _1352 = (*spvDescriptorSet0.vp_c15)._m0[653].w;
    float _1354 = (*spvDescriptorSet0.vp_c8)._m0[30].w;
    float _1356 = (*spvDescriptorSet0.vp_c15)._m0[660].y;
    if (!_1328)
    {
        _1352 = _1300;
    }
    float _1358 = _1352;
    float _1360 = _1358;
    if (!_1328)
    {
        _1354 = _1308;
    }
    float _1362 = _1354;
    float _1364 = _1362;
    float _1366 = _1362;
    if (!_1328)
    {
        _1356 = _1312;
    }
    float _1368 = _1356;
    bool _1370 = !_1328;
    float _1372 = _1368;
    if (!_1370)
    {
        float _1374 = _188 * _188;
        float _1376 = fma(_186, _186, _1374);
        float _1378 = fma(_190, _190, _1376);
        float _1380 = rsqrt(_1304);
        float _1382 = sqrt(_1378);
        float _1384 = _1280 * _1380;
        float _1386 = _1276 * _1380;
        float _1388 = _1290 * _1380;
        bool _1390 = _1382 > 0.0;
        float _1392 = _1382;
        float _1394 = _1380;
        if (!_1390)
        {
            _1392 = _1300;
        }
        float _1396 = _1392;
        _1360 = _1396;
        if (!_1390)
        {
            _1364 = _1308;
        }
        float _1398 = _1364;
        _1366 = _1398;
        if (!_1390)
        {
            _1394 = _1312;
        }
        float _1400 = _1394;
        bool _1402 = !_1390;
        _1372 = _1400;
        if (!_1402)
        {
            float _1404 = rsqrt(_1378);
            float _1406 = 1.0 / (*spvDescriptorSet0.vp_c10)._m0[2].z;
            float _1408 = _188 * _1404;
            float _1410 = _186 * _1404;
            float _1412 = _190 * _1404;
            float _1414 = _1386 * _1408;
            float _1416 = fma(_1384, _1410, _1414);
            float _1418 = _1406 * (*spvDescriptorSet0.vp_c9)._m0[142].x;
            float _1420 = fma(_1388, _1412, _1416);
            float _1422 = _1420 * _1418;
            float _1424 = fma(_186, _1422, _1300);
            float _1426 = fma(_188, _1422, _1308);
            float _1428 = fma(_190, _1422, _1312);
            _1360 = _1424;
            _1366 = _1426;
            _1372 = _1428;
        }
    }
    float _1430 = _1360;
    float _1432 = _1366;
    float _1434 = _1372;
    float _1436 = _1434;
    if (_1340)
    {
        _194 = 1.0;
    }
    float _1438 = _194;
    float _1440 = _1438;
    if (_1350)
    {
        _196 = _1430;
    }
    float _1442 = _196;
    float _1444 = _1442;
    if (_1350)
    {
        _198 = _1432;
    }
    float _1446 = _198;
    float _1448 = _1446;
    if (!_1350)
    {
        float _1450 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
        float _1452 = _1166 + _1450;
        float _1454 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
        float _1456 = _1198 + _1454;
        float _1458 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1460 = -_1198;
        float _1462 = _1460 + _1430;
        float _1464 = _1452 * _1452;
        float _1466 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
        float _1468 = _1192 + _1466;
        float _1470 = -_1166;
        float _1472 = _1470 + _1432;
        float _1474 = fma(_1456, _1456, _1464);
        float _1476 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _1478 = fma(_1468, _1468, _1474);
        float _1480 = sqrt(_1478);
        float _1482 = _1458 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1484 = -_1192;
        float _1486 = _1484 + _1434;
        float _1488 = precise::min(_1480, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _1490 = _1488 * _1476;
        float _1492 = _1482 * _1490;
        float _1494 = fma(_1462, _1492, _1198);
        float _1496 = fma(_1472, _1492, _1166);
        float _1498 = fma(_1486, _1492, _1192);
        _1448 = _1496;
        _1444 = _1494;
        _1436 = _1498;
    }
    float _1500 = _1448;
    float _1502 = _1444;
    float _1504 = _1436;
    if (_1340)
    {
        _1216 = 1.0;
    }
    float _1506 = _1216;
    float _1508 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _1510 = _1330 * _1508;
    float _1512 = _1506;
    if (!_1340)
    {
        float _1514 = (*spvDescriptorSet0.vp_c8)._m0[31].x * 0.5;
        float _1516 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1518 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _1516;
        float _1520 = _1514 * 0.15915493667125701904296875;
        float _1522 = _1520 * 6.283185482025146484375;
        float _1524 = cos(_1522);
        float _1526 = (*spvDescriptorSet0.vp_c8)._m0[31].y * 0.5;
        float _1528 = _1526 * 0.15915493667125701904296875;
        float _1530 = _1520 * 6.283185482025146484375;
        float _1532 = sin(_1530);
        float _1534 = 1.0 / _1524;
        float _1536 = _1528 * 6.283185482025146484375;
        float _1538 = cos(_1536);
        float _1540 = _1532 * _1534;
        float _1542 = _1528 * 6.283185482025146484375;
        float _1544 = sin(_1542);
        float _1546 = _1538 * _1540;
        float _1548 = 1.0 / _1518;
        float _1550 = 1.0 / _1546;
        float _1552 = _1544 * _1550;
        float _1554 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1556 = fma(_1510, _1552, _1554);
        float _1558 = _1556 * _1548;
        float _1560 = precise::clamp(_1558, 0.0, 1.0);
        _1440 = _1560;
    }
    float _1562 = _1440;
    if (!_1340)
    {
        float _1564 = (*spvDescriptorSet0.vp_c8)._m0[31].x * 0.5;
        float _1566 = _1564 * 0.15915493667125701904296875;
        float _1568 = _1566 * 6.283185482025146484375;
        float _1570 = cos(_1568);
        float _1572 = (*spvDescriptorSet0.vp_c8)._m0[31].y * 0.5;
        float _1574 = _1572 * 0.15915493667125701904296875;
        float _1576 = _1566 * 6.283185482025146484375;
        float _1578 = sin(_1576);
        float _1580 = 1.0 / _1570;
        float _1582 = _1574 * 6.283185482025146484375;
        float _1584 = cos(_1582);
        float _1586 = _1578 * _1580;
        float _1588 = _1574 * 6.283185482025146484375;
        float _1590 = sin(_1588);
        float _1592 = _1584 * _1586;
        float _1594 = 1.0 / _1592;
        float _1596 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _1598 = (*spvDescriptorSet0.vp_c9)._m0[140].w + _1596;
        float _1600 = 1.0 / _1598;
        float _1602 = _1590 * _1594;
        float _1604 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _1606 = fma(_1510, _1602, _1604);
        float _1608 = _1606 * _1600;
        float _1610 = precise::clamp(_1608, 0.0, 1.0);
        float _1612 = -_1610;
        float _1614 = _1612 + 1.0;
        _1512 = _1614;
    }
    float _1616 = _1512;
    float _1618 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1620 = _1500 + _1618;
    float _1622 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1624 = _1502 + _1622;
    float _1626 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1628 = _1504 + _1626;
    float _1630 = _1500 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1632 = _1620 * _1620;
    float _1634 = fma(_1502, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1630);
    float _1636 = fma(_1624, _1624, _1632);
    float _1638 = fma(_1504, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1634);
    float _1640 = fma(_1628, _1628, _1636);
    float _1642 = _1638 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1644 = rsqrt(_1640);
    float _1646 = _1644 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1648 = _1624 * _1646;
    float _1650 = _1628 * _1646;
    float _1652 = _1648 * _1648;
    float _1654 = _1650 * _1650;
    float _1656 = _1652 + _1654;
    float _1658 = sqrt(_1656);
    bool _1660 = _1658 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1662 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1664 = _1658 + _1662;
    float _1666 = _1312;
    float _1668 = _1656;
    float _1670 = _1664;
    float _1672 = _1620;
    float _1674 = _1646;
    float _1676 = _1648;
    if (_1660)
    {
        float _1678 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1666 = _1678;
    }
    float _1680 = _1666;
    if (_1660)
    {
        float _1682 = rsqrt(_1656);
        _1668 = _1682;
    }
    float _1684 = _1668;
    float _1686 = _1680;
    float _1688 = _1684;
    if (_1660)
    {
        float _1690 = _1664 * _1680;
        _1670 = _1690;
    }
    float _1692 = _1670;
    if (_1660)
    {
        float _1694 = _1692 * 0.15915493667125701904296875;
        _1686 = _1694;
    }
    float _1696 = _1686;
    float _1698 = _1644;
    float _1700 = _1696;
    if (_1660)
    {
        float _1702 = _1696 * 6.283185482025146484375;
        float _1704 = sin(_1702);
        _1698 = _1704;
    }
    float _1706 = _1698;
    float _1708 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _1710 = precise::max(0.0, _1708);
    float _1712 = _1628;
    float _1714 = _1710;
    if (_1660)
    {
        float _1716 = _1696 * 6.283185482025146484375;
        float _1718 = cos(_1716);
        _1712 = _1718;
    }
    float _1720 = _1712;
    float _1722 = -_1646;
    float _1724 = -_1710;
    float _1726 = fma(_1620, _1722, _1724);
    float _1728 = _1726;
    if (_1660)
    {
        float _1730 = _1726 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1672 = _1730;
    }
    float _1732 = _1672;
    float _1734 = _1732;
    if (!_1660)
    {
        _1700 = _1648;
    }
    float _1736 = _1700;
    float _1738 = _1706;
    float _1740 = _1736;
    if (_1660)
    {
        float _1742 = fma(_1706, _1732, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1738 = _1742;
    }
    float _1744 = _1738;
    float _1746 = _1744;
    if (_1660)
    {
        float _1748 = _1720 + (-1.0);
        _1714 = _1748;
    }
    float _1750 = _1714;
    if (_1660)
    {
        float _1752 = _1684 * _1744;
        _1674 = _1752;
    }
    float _1754 = _1674;
    if (!_1660)
    {
        _1746 = _1650;
    }
    float _1756 = _1746;
    float _1758 = _1756;
    if (_1660)
    {
        float _1760 = _1750 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1734 = _1760;
    }
    float _1762 = _1734;
    if (_1660)
    {
        float _1764 = _1648 * _1754;
        _1740 = _1764;
    }
    float _1766 = _1740;
    if (!_1660)
    {
        _1688 = _1652;
    }
    float _1768 = _1688;
    float _1770 = _1768;
    if (_1660)
    {
        float _1772 = _1650 * _1754;
        _1758 = _1772;
    }
    float _1774 = _1758;
    if (_1660)
    {
        float _1776 = fma(_1726, _1720, _1762);
        _1728 = _1776;
    }
    float _1778 = _1728;
    if (_1660)
    {
        float _1780 = _1766 * _1766;
        _1770 = _1780;
    }
    float _1782 = _1770;
    float _1784 = sqrt(_1640);
    if (!_1660)
    {
        _1676 = _1654;
    }
    float _1786 = _1676;
    float _1788 = _1786;
    if (_1660)
    {
        float _1790 = _1774 * _1774;
        _1788 = _1790;
    }
    float _1792 = _1788;
    float _1794 = fma(_1778, _1778, _1782);
    float _1796 = _1500 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1798 = _1794 + _1792;
    float _1800 = fma(_1502, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1796);
    float _1802 = fma(_1198, (*spvDescriptorSet0.vp_c15)._m0[652].x, (*spvDescriptorSet0.vp_c15)._m0[652].z);
    float _1804 = rsqrt(_1798);
    float _1806 = fma(_1504, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1800);
    float _1808 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _1810 = fma(_1784, (*spvDescriptorSet0.vp_c15)._m0[23].w, _1808);
    float _1812 = precise::clamp(_1810, 0.0, 1.0);
    float _1814 = _1806 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1816 = floor(_1802);
    float _1818 = -_1812;
    float _1820 = _1818 + 1.0;
    float _1822 = _1500 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1824 = fma(_1192, (*spvDescriptorSet0.vp_c15)._m0[652].y, (*spvDescriptorSet0.vp_c15)._m0[652].w);
    float _1826 = _1500 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1828 = fma(_1502, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1822);
    float _1830 = _1814 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _1832 = abs(_1820);
    float _1834 = log2(_1832);
    float _1836 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _1838 = _1804 * _1766;
    float _1840 = fma(_1502, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1826);
    float _1842 = fma(_1504, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1828);
    float _1844 = -_1830;
    float _1846 = fma(_1844, _1836, 1.0);
    float _1848 = _1804 * _1778;
    float _1850 = _1838 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _1852 = fma(_1504, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1840);
    float _1854 = _1842 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1856 = _1804 * _1774;
    float _1858 = -_1850;
    float _1860 = fma(_1848, (*spvDescriptorSet0.vp_c15)._m0[21].y, _1858);
    float _1862 = _1852 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1864 = _1854 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1866 = floor(_1824);
    float _1868 = -_1856;
    float _1870 = fma(_1868, (*spvDescriptorSet0.vp_c15)._m0[21].z, _1860);
    float _1872 = _1834 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _1874 = fma(_1862, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1864);
    float _1876 = -_1816;
    float _1878 = _1802 + _1876;
    float _1880 = fma(_1870, -0.5, 0.5);
    float _1882 = fma(_1814, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1874);
    float _1884 = exp2(_1872);
    float _1886 = fma(_1870, 0.5, 0.5);
    float _1888 = _1854 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1890 = fma(_1642, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1882);
    float _1892 = _1854 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1894 = log2(_1846);
    float _1896 = fma(_1886, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _1898 = -_1866;
    float _1900 = _1824 + _1898;
    float _1902 = fma(_1862, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1888);
    float _1904 = fma(_1862, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1892);
    float _1906 = _1848 + 1.0;
    float _1908 = fma(_1886, _1896, -0.212114393711090087890625);
    float _1910 = fma(_1814, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1902);
    float _1912 = 1.0 / _1890;
    float _1914 = fma(_1814, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1904);
    float _1916 = -_1848;
    float _1918 = fma(_1884, _1906, _1916);
    float _1920 = fma(_1642, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1910);
    float _1922 = fma(_1886, _1908, 1.570728778839111328125);
    float _1924 = fma(_1642, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1914);
    float _1926 = fma(_1918, 0.5, 0.5);
    float _1928 = sqrt(_1880);
    float _1930 = _1894 * 0.693147182464599609375;
    float _1932 = _1930 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _1934 = _1920 * _1912;
    float _1936 = _1924 * _1912;
    float _1938 = fma(_1934, 0.5, 0.5);
    float _1940 = fma(_1936, -0.5, 0.5);
    float _1942 = _1928 * 0.636619746685028076171875;
    float2 _5920 = float2(_1878, _1900);
    float _1944 = dm_bs(spvDescriptorSet0.vp_t_tcb_24.sample(spvDescriptorSet0.vp_t_tcb_24Smplr, select(_5920, float2(0.0), isnan(_5920)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_24, spvDescriptorSet0.vp_t_tcb_24Smplr_w, select(_5920, float2(0.0), isnan(_5920)), level(0.0)).x;
    float3 _5931 = float3(_1938, _1940, _1932);
    float _1946 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_5931, float3(0.0), isnan(_5931)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_5931, float3(0.0), isnan(_5931)), level(0.0)).x;
    float _1948 = -_1922;
    float _1950 = fma(_1942, _1948, 1.0);
    float3 _5947 = float3(_1938, _1940, _1932);
    float4 _1953 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_5947, float3(0.0), isnan(_5947)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_5947, float3(0.0), isnan(_5947)), level(0.0)).xyzw;
    float _1955 = _1953.x;
    float _1957 = _1953.y;
    float _1959 = _1953.z;
    float _1961 = _1953.w;
    float2 _5963 = float2(_1950, _1926);
    float3 _1965 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_5963, float2(0.0), isnan(_5963)), level(0.0)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_5963, float2(0.0), isnan(_5963)), level(0.0)).xyz;
    float _1967 = _1965.x;
    float _1969 = _1965.y;
    float _1971 = _1965.z;
    float _1973 = in.m_57.x;
    float _1975 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _1977 = in.m_57.y;
    float _1979 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    out.m_63.x = _640;
    out.m_63.y = _642;
    out.m_63.z = _656;
    out.m_63.w = _668;
    float _1981 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _1983 = _1981 + (*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _1985 = -(*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _1987 = _1985 + (*spvDescriptorSet0.vp_c9)._m0[133].w;
    float _1989 = in.m_57.z;
    float _1991 = 1.0 / _1983;
    int _1993 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _1995 = _1993 != 0;
    float _1997 = _1834 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _1999 = -(*spvDescriptorSet0.vp_c9)._m0[133].x;
    float _2001 = (*spvDescriptorSet0.vp_c9)._m0[134].x + _1999;
    float _2003 = _1975 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    int _2005 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 16;
    bool _2007 = _2005 != 0;
    float _2009 = -(*spvDescriptorSet0.vp_c9)._m0[133].w;
    float _2011 = _2009 + (*spvDescriptorSet0.vp_c9)._m0[134].w;
    float _2013 = _1973 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    float _2015 = 1.0 / _1987;
    float _2017 = -(*spvDescriptorSet0.vp_c9)._m0[131].x;
    float _2019 = (*spvDescriptorSet0.vp_c9)._m0[132].x + _2017;
    float _2021 = -_1979;
    float _2023 = fma(_2013, 2.0, _2021);
    float _2025 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _2027 = in.m_65.y;
    float _2029 = _1977 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    int _2031 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _2033 = _2031 != 0;
    float _2035 = 1.0 / _2011;
    float _2037 = fma(_2029, -2.0, _2025);
    float _2039 = -(*spvDescriptorSet0.vp_c9)._m0[132].x;
    float _2041 = _2039 + (*spvDescriptorSet0.vp_c9)._m0[133].x;
    int _2043 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 32;
    bool _2045 = _2043 != 0;
    float _2047 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    int _2049 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _2051 = _2049 != 0;
    float _2053 = (*spvDescriptorSet0.vp_c9)._m0[88].w + (*spvDescriptorSet0.vp_c9)._m0[88].y;
    bool _2055 = _1989 > 0.5;
    float _2057 = (*spvDescriptorSet0.vp_c9)._m0[88].z + (*spvDescriptorSet0.vp_c9)._m0[88].x;
    float _2059 = _2019 * _1991;
    float _2061 = fma(_1977, (*spvDescriptorSet0.vp_c9)._m0[88].w, _2053);
    float _2063 = -(*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _2065 = _694 + _2063;
    float _2067 = _2041 * _2015;
    float _2069 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].w;
    float _2071 = _2001 * _2035;
    float _2073 = fma(_1973, (*spvDescriptorSet0.vp_c9)._m0[78].z, _2047);
    bool _2075 = _1977 > 0.5;
    float _2077 = fma(_2067, _2065, (*spvDescriptorSet0.vp_c9)._m0[132].x);
    float _2079 = -_2027;
    float _2081 = _2079 + 1.0;
    float _2083 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    float _2085 = _2083;
    bool _2087 = _2055;
    float _2089 = _2027;
    float _2091 = _2057;
    float _2093 = _1924;
    if (_2033)
    {
        _672 = _1973;
    }
    float _2095 = _672;
    float _2097 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _2099 = fma(_1977, (*spvDescriptorSet0.vp_c9)._m0[78].w, _2083);
    float _2101 = _2095;
    if (_2033)
    {
        _2085 = _1977;
    }
    float _2103 = _2085;
    float _2105 = fma(_1973, (*spvDescriptorSet0.vp_c9)._m0[88].z, _2057);
    int _2107 = _2055 ? as_type<int>(_2081) : as_type<int>(_2027);
    float _2109 = (*spvDescriptorSet0.vp_c9)._m0[79].z + (*spvDescriptorSet0.vp_c9)._m0[79].y;
    float _2111 = _2103;
    if (_1995)
    {
        bool _2113 = _1973 > 0.5;
        _2087 = _2113;
    }
    bool _2115 = _2087;
    float _2117 = -(*spvDescriptorSet0.vp_c9)._m0[133].w;
    float _2119 = _694 + _2117;
    if (!_2033)
    {
        _2111 = _1973;
    }
    float _2121 = _2111;
    float _2123 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _2125 = _694 + _2123;
    float _2127 = fma(_1989, (*spvDescriptorSet0.vp_c9)._m0[79].z, _2109);
    int _2129 = as_type<int>(_2121);
    if (!_2033)
    {
        _2101 = _1989;
    }
    float _2131 = _2101;
    float _2133 = fma(_2071, _2119, (*spvDescriptorSet0.vp_c9)._m0[133].x);
    float _2135 = fma(_2059, _2125, (*spvDescriptorSet0.vp_c9)._m0[131].x);
    bool _2137 = _694 >= (*spvDescriptorSet0.vp_c9)._m0[134].w;
    bool _2139 = isnan(_694);
    bool _2141 = _2137 || _2139;
    bool _2143 = isnan((*spvDescriptorSet0.vp_c9)._m0[134].w);
    bool _2145 = _2141 || _2143;
    float _2147 = float(_2145);
    float _2149 = in.m_65.x;
    bool _2151 = _694 >= (*spvDescriptorSet0.vp_c9)._m0[133].w;
    bool _2153 = isnan(_694);
    bool _2155 = _2151 || _2153;
    bool _2157 = isnan((*spvDescriptorSet0.vp_c9)._m0[133].w);
    bool _2159 = _2155 || _2157;
    float _2161 = float(_2159);
    float _2163 = _2069 * (*spvDescriptorSet0.vp_c9)._m0[90].y;
    bool _2165 = _694 >= (*spvDescriptorSet0.vp_c9)._m0[132].w;
    bool _2167 = isnan(_694);
    bool _2169 = _2165 || _2167;
    bool _2171 = isnan((*spvDescriptorSet0.vp_c9)._m0[132].w);
    bool _2173 = _2169 || _2171;
    float _2175 = float(_2173);
    float _2177 = -_2147;
    float _2179 = _2177 + 1.0;
    float _2181 = _2045 ? as_type<float>(_2107) : _2027;
    float _2183 = -_2161;
    float _2185 = _2183 + 1.0;
    if (_2051)
    {
        float _2187 = _2075 ? _2081 : _2027;
        _2089 = _2187;
    }
    float _2189 = _2089;
    float _2191 = _2161 * _2179;
    bool _2193 = _694 >= (*spvDescriptorSet0.vp_c9)._m0[131].w;
    bool _2195 = isnan(_694);
    bool _2197 = _2193 || _2195;
    bool _2199 = isnan((*spvDescriptorSet0.vp_c9)._m0[131].w);
    bool _2201 = _2197 || _2199;
    float _2203 = float(_2201);
    float _2205 = -_2175;
    float _2207 = _2205 + 1.0;
    float _2209 = fma(_2181, _2163, -0.5);
    float _2211 = _2131 * (*spvDescriptorSet0.vp_c9)._m0[87].x;
    float _2213 = _2097 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _2215 = _2175 * _2185;
    float _2217 = _2203 * _2207;
    float _2219 = (*spvDescriptorSet0.vp_c9)._m0[87].x + (*spvDescriptorSet0.vp_c9)._m0[86].z;
    float _2221 = fma(_2213, _2189, -0.5);
    float _2223 = (*spvDescriptorSet0.vp_c9)._m0[87].y + (*spvDescriptorSet0.vp_c9)._m0[86].w;
    float _2225 = _2121 * (*spvDescriptorSet0.vp_c9)._m0[87].y;
    float _2227 = -_2219;
    float _2229 = fma(_2211, 2.0, _2227);
    float _2231 = _2135 * _2217;
    float _2233 = fma(_138, (*spvDescriptorSet0.vp_c9)._m0[79].x, _2127);
    float _2235 = fma(_2225, -2.0, _2223);
    float _2237 = fma(_138, (*spvDescriptorSet0.vp_c9)._m0[77].z, _2073);
    float _2239 = -_138;
    float _2241 = fma(_2239, (*spvDescriptorSet0.vp_c9)._m0[76].x, _2023);
    float _2243 = fma(_138, (*spvDescriptorSet0.vp_c9)._m0[77].w, _2099);
    float _2245 = fma(_138, (*spvDescriptorSet0.vp_c9)._m0[76].y, _2037);
    float _2247 = fma(_138, (*spvDescriptorSet0.vp_c9)._m0[87].z, _2105);
    float _2249 = fma(_138, (*spvDescriptorSet0.vp_c9)._m0[87].w, _2061);
    float _2251 = -_138;
    float _2253 = fma(_2251, (*spvDescriptorSet0.vp_c9)._m0[86].x, _2229);
    float _2255 = fma(_138, (*spvDescriptorSet0.vp_c9)._m0[86].y, _2235);
    int _2257 = as_type<int>(_2213);
    float _2259 = _2149;
    if (_1995)
    {
        float _2261 = -_2149;
        float _2263 = _2261 + 1.0;
        _2257 = as_type<int>(_2263);
    }
    int _2265 = _2257;
    float _2267 = abs(_1510);
    float _2269 = log2(_2267);
    float _2271 = -_2203;
    float _2273 = _2271 + 1.0;
    if (_2007)
    {
        float _2275 = -_2149;
        float _2277 = _2275 + 1.0;
        _2129 = as_type<int>(_2277);
    }
    int _2279 = _2129;
    if (!_1995)
    {
        _2091 = _2149;
    }
    float _2281 = _2091;
    float _2283 = _2233 * (-0.15915493667125701904296875);
    float _2285 = _2281;
    if (_1995)
    {
        float _2287 = _2115 ? as_type<float>(_2265) : _2149;
        _2285 = _2287;
    }
    float _2289 = _2285;
    float _2291 = fma(_2273, (*spvDescriptorSet0.vp_c9)._m0[131].x, _2231);
    if (_2007)
    {
        float _2293 = _2075 ? as_type<float>(_2279) : _2149;
        _2259 = _2293;
    }
    float _2295 = _2259;
    float _2297 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].z;
    float _2299 = in.m_67.x;
    float _2301 = in.m_67.y;
    float _2303 = in.m_67.z;
    bool _2305 = _900 != 0.0;
    bool _2307 = isnan(_900);
    bool _2309 = _2305 || _2307;
    bool _2311 = isnan(0.0);
    bool _2313 = _2309 || _2311;
    float _2315 = fma(_2077, _2215, _2291);
    float _2317 = fma(_2003, _2289, -0.5);
    float _2319 = -_2255;
    float _2321 = fma(_2249, _2209, _2319);
    bool _2323 = _898 == 0.0;
    bool _2325 = !_2313;
    bool _2327 = _2323 && _2325;
    float _2329 = fma(_2133, _2191, _2315);
    float _2331 = _2283 * 6.283185482025146484375;
    float _2333 = sin(_2331);
    float _2335 = _2269 * (*spvDescriptorSet0.vp_c15)._m0[654].z;
    bool _2337 = _902 == 0.0;
    bool _2339 = _2337 && _2327;
    out.m_69.x = _1198;
    out.m_69.y = _1166;
    out.m_69.z = _1192;
    bool _2341 = _1510 <= 8000.0;
    bool _2343 = isnan(_1510);
    bool _2345 = _2341 || _2343;
    bool _2347 = isnan(8000.0);
    bool _2349 = _2345 || _2347;
    float _2351 = float(_2349);
    out.m_71.w = _782;
    float _2353 = _2283 * 6.283185482025146484375;
    float _2355 = cos(_2353);
    float _2357 = _2297 * (*spvDescriptorSet0.vp_c9)._m0[90].x;
    float _2359 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    out.m_73.x = _960;
    float _2361 = fma(_2357, _2295, -0.5);
    float _2363 = _2359 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    out.m_75.x = _1502;
    out.m_75.y = _1500;
    out.m_75.z = _1504;
    float _2365 = exp2(_2335);
    float _2367 = _2333 * _2221;
    float _2369 = _2303;
    float _2371 = _2299;
    float _2373 = _2301;
    if (!_2339)
    {
        float _2375 = fma(_902, (*spvDescriptorSet0.vp_c9)._m0[17].y, _2303);
        _2369 = _2375;
    }
    float _2377 = _2369;
    float _2379 = fma(_2247, _2361, _2253);
    if (!_2339)
    {
        float _2381 = fma(_898, (*spvDescriptorSet0.vp_c9)._m0[17].y, _2299);
        _2371 = _2381;
    }
    float _2383 = _2371;
    if (!_2339)
    {
        float _2385 = fma(_900, (*spvDescriptorSet0.vp_c9)._m0[17].y, _2301);
        _2373 = _2385;
    }
    float _2387 = _2373;
    float _2389 = _2321 + 0.5;
    float _2391 = _2355 * _2221;
    float _2393 = exp2(_1997);
    float _2395 = -_2367;
    float _2397 = fma(_2355, _2317, _2395);
    float _2399 = _2379 + 0.5;
    float _2401 = fma(_2333, _2317, _2391);
    float _2403 = fma(_2237, _2397, _2241);
    float _2405 = fma(_2365, (*spvDescriptorSet0.vp_c15)._m0[654].x, (*spvDescriptorSet0.vp_c15)._m0[654].y);
    float _2407 = precise::clamp(_2405, 0.0, 1.0);
    out.m_77.x = _2399;
    out.m_77.y = _2389;
    float _2409 = -_2245;
    float _2411 = fma(_2243, _2401, _2409);
    float _2413 = fma(_2407, -2.0, 3.0);
    float _2415 = _2407 * _2407;
    float _2417 = fma(_2147, (*spvDescriptorSet0.vp_c9)._m0[134].x, _2329);
    float _2419 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _2421 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _2423 = _2415 * _2413;
    float _2425 = -_2393;
    float _2427 = _2425 + 1.0;
    float _2429 = _1854 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _2431 = _2419 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2433 = -_2423;
    float _2435 = _2433 + 1.0;
    float _2437 = _2427 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _2439 = fma(_1862, (*spvDescriptorSet0.vp_c8)._m0[6].x, _2429);
    float _2441 = _2421 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2443 = _2417 * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    float _2445 = _2411 + 0.5;
    float _2447 = fma(_1814, (*spvDescriptorSet0.vp_c8)._m0[6].z, _2439);
    float _2449 = fma(_2435, (*spvDescriptorSet0.vp_c15)._m0[654].w, _2423);
    float _2451 = _974 * _2387;
    float _2453 = _968 * _2387;
    float _2455 = in.m_79.x;
    float _2457 = _1890 * 0.5;
    float _2459 = _988 * _2387;
    float _2461 = fma(_1642, (*spvDescriptorSet0.vp_c8)._m0[6].w, _2447);
    float _2463 = _2403 + 0.5;
    out.m_81.x = _2363;
    out.m_81.y = _2431;
    out.m_81.z = _2441;
    out.m_81.w = _2443;
    float _2465 = fma(_952, _2383, _2451);
    float _2467 = fma(_954, _2383, _2453);
    float _2469 = fma(_950, _2383, _2459);
    out.m_83.x = _2463;
    out.m_83.y = _2445;
    float _2471 = _2351 * _2449;
    float _2473 = fma(_854, _2377, _2465);
    float _2475 = fma(_858, _2377, _2467);
    float _2477 = fma(_856, _2377, _2469);
    float _2479 = _2471 * (*spvDescriptorSet0.vp_c15)._m0[653].x;
    out.gl_Position.x = _1920;
    out.gl_Position.y = _1924;
    out.gl_Position.z = _2461;
    out.gl_Position.w = _1890;
    bool _2481 = _1784 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _2483 = isnan(_1784);
    bool _2485 = _2481 || _2483;
    bool _2487 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _2489 = _2485 || _2487;
    float _2491 = fma(_1924, -0.5, _2457);
    float _2493 = _2461 + _1890;
    float _2495 = _1920 + _1890;
    float _2497 = -_2437;
    float _2499 = _2497 + 1.0;
    float _2501 = _2493 * 0.5;
    float _2503 = _2495 * 0.5;
    out.m_85.x = _2473;
    out.m_85.y = _2475;
    out.m_85.z = _2477;
    out.m_87.x = _2503;
    out.m_87.y = _2491;
    out.m_87.z = _2501;
    out.m_87.w = _1890;
    float _2505 = (*spvDescriptorSet0.vp_c15)._m0[653].y;
    if (!_2489)
    {
        _2093 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _2507 = _2093;
    float _2509 = -_1944;
    float _2511 = _2509 + 1.0;
    float _2513 = _2437 * _1946;
    float _2515 = _2511 * _2479;
    float _2517 = precise::clamp(_2515, 0.0, 1.0);
    float _2519 = _1961 * _2513;
    float _2521 = _1961 * _2499;
    float _2523 = _1562 * _1616;
    float _2525 = -_2517;
    float _2527 = fma(_2525, (*spvDescriptorSet0.vp_c15)._m0[653].y, 1.0);
    float _2529 = _1971 * _2513;
    float _2531 = fma(_1967, _2519, _1955);
    float _2533 = fma(_1969, _2519, _1957);
    float _2535 = _2527 * _2455;
    float _2537 = fma(_1961, _2529, _1959);
    float _2539 = _2523 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _2541 = _2519;
    float _2543 = _2535;
    float _2545 = _2523;
    float _2547 = _2507;
    float _2549 = _2507;
    if (!_2489)
    {
        _2541 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _2551 = _2541;
    float _2553 = _2535 * (*spvDescriptorSet0.vp_c13)._m0[1].w;
    float _2555 = _2553;
    float _2557 = _2551;
    float _2559 = _2551;
    if (!_2489)
    {
        _2505 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _2561 = _2505;
    out.m_89.x = _2531;
    out.m_89.y = _2533;
    out.m_89.z = _2537;
    out.m_89.w = _2521;
    float _2563 = _2561;
    float _2565 = _2561;
    if (!_2489)
    {
        _2543 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _2567 = _2543;
    float _2569 = _2567;
    float _2571 = _2567;
    if (!_2489)
    {
        _2545 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _2573 = _2545;
    out.m_91.x = _2553;
    float _2575 = _2573;
    float _2577 = _2573;
    if (!_2489)
    {
        _2555 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _2579 = _2555;
    bool _2581 = !_2489;
    float _2583 = _2579;
    float _2585 = _2579;
    if (!_2581)
    {
        bool _2587 = _1784 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _2589 = isnan(_1784);
        bool _2591 = _2587 || _2589;
        bool _2593 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _2595 = _2591 || _2593;
        if (!_2595)
        {
            float _2597 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2599 = _1784 + _2597;
            float _2601 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2603 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _2601;
            float _2605 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _2607 = _2605 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _2609 = 1.0 / _2603;
            float _2611 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _2613 = _2611 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _2615 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _2617 = _2615 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _2619 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _2621 = _2619 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _2623 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _2625 = _2623 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _2627 = _2599 * _2609;
            float _2629 = precise::clamp(_2627, 0.0, 1.0);
            float _2631 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _2633 = _2631 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _2635 = fma(_2629, _2607, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _2637 = fma(_2629, _2633, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _2639 = fma(_2629, _2613, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _2641 = fma(_2629, _2617, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _2643 = fma(_2629, _2621, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _2645 = fma(_2629, _2625, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            _2559 = _2639;
            _2585 = _2643;
            _2549 = _2635;
            _2571 = _2641;
            _2565 = _2637;
            _2577 = _2645;
            _2647 = true;
        }
        else
        {
            bool _2649 = _1784 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _2651 = isnan(_1784);
            bool _2653 = _2649 || _2651;
            bool _2655 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _2657 = _2653 || _2655;
            if (!_2657)
            {
                _2547 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _2659 = _2547;
            _2549 = _2659;
            if (!_2657)
            {
                _2557 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _2661 = _2557;
            _2559 = _2661;
            if (!_2657)
            {
                _2563 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _2663 = _2563;
            _2565 = _2663;
            if (!_2657)
            {
                _2569 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _2665 = _2569;
            _2571 = _2665;
            if (!_2657)
            {
                _2583 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _2667 = _2583;
            _2585 = _2667;
            if (!_2657)
            {
                _2575 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _2669 = _2575;
            bool _2671 = !_2657;
            _2577 = _2669;
            if (!_2671)
            {
                bool _2673 = _1784 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _2675 = isnan(_1784);
                bool _2677 = _2673 || _2675;
                bool _2679 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _2681 = _2677 || _2679;
                if (!_2681)
                {
                    float _2683 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2685 = _1784 + _2683;
                    float _2687 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2689 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _2687;
                    float _2691 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _2693 = _2691 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _2695 = 1.0 / _2689;
                    float _2697 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _2699 = _2697 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _2701 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _2703 = _2701 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _2705 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _2707 = _2705 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _2709 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _2711 = _2709 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _2713 = _2685 * _2695;
                    float _2715 = precise::clamp(_2713, 0.0, 1.0);
                    float _2717 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _2719 = _2717 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _2721 = fma(_2715, _2693, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _2723 = fma(_2715, _2719, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _2725 = fma(_2715, _2699, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _2727 = fma(_2715, _2703, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _2729 = fma(_2715, _2707, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _2731 = fma(_2715, _2711, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    _2559 = _2725;
                    _2585 = _2729;
                    _2549 = _2721;
                    _2571 = _2727;
                    _2565 = _2723;
                    _2577 = _2731;
                    _2647 = true;
                }
                else
                {
                    _2559 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _2585 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _2549 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _2571 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _2565 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _2577 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _2647 = false;
    float _2733 = _2559;
    float _2735 = _2585;
    float _2737 = _2549;
    float _2739 = _2571;
    float _2741 = _2565;
    float _2743 = _2577;
    float _2745 = fma(_2475, -0.5, 0.5);
    float _2747 = precise::clamp(_2745, 0.0, 1.0);
    float _2749 = -_2733;
    float _2751 = _2749 + _2735;
    float _2753 = _2539 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _2755 = -_2737;
    float _2757 = _2755 + _2739;
    float _2759 = fma(_2747, _2751, _2733);
    out.m_93.x = 0.0;
    float _2761 = -_2741;
    float _2763 = _2761 + _2743;
    float _2765 = fma(_2747, _2757, _2737);
    float _2767 = _2759 * 0.586610972881317138671875;
    out.m_49.x = _2753;
    bool _2769 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _2771 = fma(_2747, _2763, _2741);
    float _2773 = fma(_2765, 0.298911988735198974609375, _2767);
    bool _2775 = _1562 > 0.0;
    bool _2777 = isnan(_1562);
    bool _2779 = _2775 || _2777;
    bool _2781 = isnan(0.0);
    bool _2783 = _2779 || _2781;
    float _2785 = fma(_2771, 0.114477999508380889892578125, _2773);
    bool _2787 = _1616 <= 0.0;
    bool _2789 = !_2783;
    bool _2791 = _2787 || _2789;
    float _2793 = -_2785;
    float _2795 = _2765 + _2793;
    float _2797 = -_2785;
    float _2799 = _2759 + _2797;
    float _2801 = -_2785;
    float _2803 = _2771 + _2801;
    float _2805 = fma(_2795, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2785);
    float _2807 = fma(_2799, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2785);
    float _2809 = fma(_2803, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2785);
    bool _2811 = !_2769;
    if (!_2811)
    {
        float _2813 = -_1500;
        float _2815 = _2813 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
        float _2817 = -_1502;
        float _2819 = _2817 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
        float _2821 = -_1504;
        float _2823 = _2821 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
        float _2825 = _2815 * _2815;
        float _2827 = fma(_2819, _2819, _2825);
        float _2829 = fma(_2823, _2823, _2827);
        float _2831 = sqrt(_2829);
        float _2833 = rsqrt(_2829);
        float _2835 = -_2831;
        float _2837 = _2835 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
        float _2839 = _2837 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
        float _2841 = precise::clamp(_2839, 0.0, 1.0);
        float _2843 = _2819 * _2833;
        float _2845 = _2815 * _2833;
        float _2847 = abs(_2841);
        float _2849 = log2(_2847);
        float _2851 = _2823 * _2833;
        float _2853 = _2843 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
        float _2855 = _2475 * _2845;
        float _2857 = -_2845;
        float _2859 = -_2853;
        float _2861 = fma(_2857, (*spvDescriptorSet0.vp_c15)._m0[656].y, _2859);
        float _2863 = fma(_2473, _2843, _2855);
        float _2865 = -_2851;
        float _2867 = fma(_2865, (*spvDescriptorSet0.vp_c15)._m0[656].z, _2861);
        float _2869 = fma(_2477, _2851, _2863);
        float _2871 = precise::clamp(_2869, 0.0, 1.0);
        float _2873 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
        float _2875 = _2867 + _2873;
        float _2877 = _2849 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
        float _2879 = _2875 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
        float _2881 = precise::clamp(_2879, 0.0, 1.0);
        float _2883 = exp2(_2877);
        float _2885 = _2883 * _2881;
        float _2887 = _2871 * _2885;
        float _2889 = _2887 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
        float _2891 = _2887 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
        float _2893 = _2887 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
        out.m_93.x = _2889;
        out.m_93.y = _2891;
        out.m_93.z = _2893;
    }
    out.m_71.x = _2805;
    out.m_71.y = _2807;
    out.m_71.z = _2809;
    if (!_2791)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    out.m_49.x = 0.0;
    float _2895 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _2895;
    out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
}


vertex main0_out main0_z(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]])
{
    main0_out out = {};
    out.m_63 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_81 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_71 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_77 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_85 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_75 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_93 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_91 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_83 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_53 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_73 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_87 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_49 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_89 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_69 = float4(0.0, 0.0, 0.0, 1.0);
    bool _2647 = false;
    bool _692 = false;
    bool _554 = false;
    bool _446 = false;
    bool _218 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _107 = in.m_46.w;
    float _109 = trunc(_107);
    int _112 = int(_109);
    bool _116 = _112 >= 1;
    float _118 = 0.0;
    float _120 = as_type<float>(_112);
    if (!_116)
    {
        _118 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _122 = _118;
    if (!_116)
    {
        out.m_49.x = 0.0;
    }
    int _124 = 0;
    if (!_116)
    {
        float _126 = _122 * 5.0;
        _124 = as_type<int>(_126);
    }
    int _128 = _124;
    if (!_116)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2952 = as_type<float>(_128);
        out.gl_Position.z = _2952;
    }
    if (!_116)
    {
        return out;
    }
    float _130 = in.m_51.w;
    float _132 = float(_112);
    float _134 = 1.0 / _132;
    float _136 = -_130;
    float _138 = _136 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _140 = _130 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _142 = isnan(_130);
    bool _144 = _140 || _142;
    bool _146 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _148 = _144 || _146;
    float _150 = _138 * _134;
    bool _152 = _138 >= _132;
    bool _154 = !_148;
    bool _156 = _152 || _154;
    out.m_53.x = _150;
    if (_156)
    {
        _120 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _158 = _120;
    if (_156)
    {
        out.m_49.x = 0.0;
    }
    int _160 = 0;
    if (_156)
    {
        float _162 = _158 * 5.0;
        _160 = as_type<int>(_162);
    }
    int _164 = _160;
    if (_156)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _3022 = as_type<float>(_164);
        out.gl_Position.z = _3022;
    }
    if (_156)
    {
        return out;
    }
    float _166 = in.m_55.x;
    float _168 = in.m_55.y;
    float _170 = in.m_55.z;
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
    float _194 = _190;
    float _196 = _188;
    float _198 = _186;
    float _216;
    if (!_192)
    {
        float _200 = in.m_57.x;
        float _202 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _204 = _200 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _206 = fma(_204, (*spvDescriptorSet0.vp_c9)._m0[12].x, _138);
        float _208 = _206 * _202;
        float _210 = floor(_208);
        float _212 = -_210;
        float _214 = _208 + _212;
        _216 = _214;
        _218 = true;
    }
    else
    {
        _216 = _150;
    }
    _218 = false;
    float _220 = _216;
    float _222 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _224 = _220 + _222;
    float _226 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _228 = _220 + _226;
    float _230 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _232 = _220 + _230;
    float _234 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _236 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _234;
    float _238 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _240 = _238 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _242 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _244 = (*spvDescriptorSet0.vp_c9)._m0[146].w + _242;
    float _246 = 1.0 / _240;
    bool _248 = _220 >= (*spvDescriptorSet0.vp_c9)._m0[146].w;
    bool _250 = isnan(_220);
    bool _252 = _248 || _250;
    bool _254 = isnan((*spvDescriptorSet0.vp_c9)._m0[146].w);
    bool _256 = _252 || _254;
    float _258 = float(_256);
    bool _260 = _220 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _262 = isnan(_220);
    bool _264 = _260 || _262;
    bool _266 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _268 = _264 || _266;
    float _270 = float(_268);
    float _272 = 1.0 / _244;
    float _274 = -(*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _276 = (*spvDescriptorSet0.vp_c9)._m0[144].z + _274;
    bool _278 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].x;
    float _280 = 1.0 / _236;
    float _282 = _232 * _246;
    float _284 = -_258;
    float _286 = _284 + 1.0;
    float _288 = _224 * _272;
    bool _290 = _220 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _292 = isnan(_220);
    bool _294 = _290 || _292;
    bool _296 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _298 = _294 || _296;
    float _300 = float(_298);
    bool _302 = _220 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _304 = isnan(_220);
    bool _306 = _302 || _304;
    bool _308 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _310 = _306 || _308;
    float _312 = float(_310);
    float _314 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _316 = _314 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _318 = _300 * _286;
    float _320 = -_300;
    float _322 = _320 + 1.0;
    float _324 = _228 * _280;
    float _326 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _328 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _326;
    float _330 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _332 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _330;
    float _334 = fma(_276, _324, (*spvDescriptorSet0.vp_c9)._m0[143].z);
    float _336 = fma(_328, _324, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _338 = fma(_332, _324, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _340 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _342 = _340 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _344 = -(*spvDescriptorSet0.vp_c9)._m0[144].z;
    float _346 = _344 + (*spvDescriptorSet0.vp_c9)._m0[145].z;
    float _348 = -_312;
    float _350 = _348 + 1.0;
    float _352 = _312 * _322;
    float _354 = fma(_316, _282, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _356 = fma(_342, _282, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _358 = fma(_346, _282, (*spvDescriptorSet0.vp_c9)._m0[144].z);
    float _360 = _270 * _350;
    float _362 = in.m_59.x;
    float _364 = in.m_59.y;
    float _366 = in.m_59.z;
    float _368 = -_270;
    float _370 = _368 + 1.0;
    float _372 = _336 * _360;
    float _374 = _338 * _360;
    float _376 = _334 * _360;
    float _378 = -(*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _380 = (*spvDescriptorSet0.vp_c9)._m0[146].x + _378;
    float _382 = -(*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _384 = (*spvDescriptorSet0.vp_c9)._m0[146].y + _382;
    float _386 = fma(_370, (*spvDescriptorSet0.vp_c9)._m0[143].x, _372);
    float _388 = fma(_370, (*spvDescriptorSet0.vp_c9)._m0[143].y, _374);
    float _390 = -(*spvDescriptorSet0.vp_c9)._m0[145].z;
    float _392 = (*spvDescriptorSet0.vp_c9)._m0[146].z + _390;
    float _394 = fma(_370, (*spvDescriptorSet0.vp_c9)._m0[143].z, _376);
    float _396 = fma(_384, _288, (*spvDescriptorSet0.vp_c9)._m0[145].y);
    float _398 = fma(_356, _352, _388);
    float _400 = fma(_380, _288, (*spvDescriptorSet0.vp_c9)._m0[145].x);
    float _402 = fma(_392, _288, (*spvDescriptorSet0.vp_c9)._m0[145].z);
    float _404 = fma(_354, _352, _386);
    float _406 = fma(_358, _352, _394);
    float _408 = fma(_396, _318, _398);
    float _410 = fma(_400, _318, _404);
    float _412 = fma(_402, _318, _406);
    float _414 = fma(_258, (*spvDescriptorSet0.vp_c9)._m0[146].y, _408);
    float _416 = fma(_258, (*spvDescriptorSet0.vp_c9)._m0[146].x, _410);
    float _418 = fma(_258, (*spvDescriptorSet0.vp_c9)._m0[146].z, _412);
    float _420 = _414 * _364;
    float _422 = _416 * _362;
    float _424 = _418 * _366;
    bool _426 = !_278;
    float _444;
    if (!_426)
    {
        float _428 = in.m_57.x;
        float _430 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].x;
        float _432 = _428 * (*spvDescriptorSet0.vp_c9)._m0[12].y;
        float _434 = fma(_432, (*spvDescriptorSet0.vp_c9)._m0[11].x, _138);
        float _436 = _434 * _430;
        float _438 = floor(_436);
        float _440 = -_438;
        float _442 = _436 + _440;
        _444 = _442;
        _446 = true;
    }
    else
    {
        _444 = _150;
    }
    _446 = false;
    float _448 = _444;
    float _450 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _452 = _448 + _450;
    bool _454 = _448 >= (*spvDescriptorSet0.vp_c9)._m0[108].w;
    bool _456 = isnan(_448);
    bool _458 = _454 || _456;
    bool _460 = isnan((*spvDescriptorSet0.vp_c9)._m0[108].w);
    bool _462 = _458 || _460;
    float _464 = float(_462);
    float _466 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _468 = (*spvDescriptorSet0.vp_c9)._m0[108].w + _466;
    bool _470 = _448 >= (*spvDescriptorSet0.vp_c9)._m0[107].w;
    bool _472 = isnan(_448);
    bool _474 = _470 || _472;
    bool _476 = isnan((*spvDescriptorSet0.vp_c9)._m0[107].w);
    bool _478 = _474 || _476;
    float _480 = float(_478);
    float _482 = -_464;
    float _484 = _482 + 1.0;
    float _486 = -(*spvDescriptorSet0.vp_c9)._m0[107].x;
    float _488 = (*spvDescriptorSet0.vp_c9)._m0[108].x + _486;
    float _490 = 1.0 / _468;
    bool _492 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _494 = _480 * _484;
    float _496 = -_480;
    float _498 = _496 + 1.0;
    float _500 = _452 * _490;
    float _502 = -(*spvDescriptorSet0.vp_c9)._m0[107].z;
    float _504 = (*spvDescriptorSet0.vp_c9)._m0[108].z + _502;
    float _506 = fma(_488, _500, (*spvDescriptorSet0.vp_c9)._m0[107].x);
    float _508 = -(*spvDescriptorSet0.vp_c9)._m0[107].y;
    float _510 = (*spvDescriptorSet0.vp_c9)._m0[108].y + _508;
    float _512 = fma(_504, _500, (*spvDescriptorSet0.vp_c9)._m0[107].z);
    float _514 = _506 * _494;
    float _516 = fma(_510, _500, (*spvDescriptorSet0.vp_c9)._m0[107].y);
    float _518 = _512 * _494;
    float _520 = _516 * _494;
    float _522 = fma(_498, (*spvDescriptorSet0.vp_c9)._m0[107].x, _514);
    float _524 = fma(_498, (*spvDescriptorSet0.vp_c9)._m0[107].y, _520);
    float _526 = fma(_498, (*spvDescriptorSet0.vp_c9)._m0[107].z, _518);
    float _528 = fma(_464, (*spvDescriptorSet0.vp_c9)._m0[108].x, _522);
    float _530 = fma(_464, (*spvDescriptorSet0.vp_c9)._m0[108].y, _524);
    float _532 = fma(_464, (*spvDescriptorSet0.vp_c9)._m0[108].z, _526);
    bool _534 = !_492;
    float _552;
    if (!_534)
    {
        float _536 = in.m_57.x;
        float _538 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _540 = _536 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _542 = fma(_540, (*spvDescriptorSet0.vp_c9)._m0[11].y, _138);
        float _544 = _542 * _538;
        float _546 = floor(_544);
        float _548 = -_546;
        float _550 = _544 + _548;
        _552 = _550;
        _554 = true;
    }
    else
    {
        _552 = _150;
    }
    _554 = false;
    float _556 = _552;
    float _558 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _560 = _556 + _558;
    float _562 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _564 = _562 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _566 = _556 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _568 = isnan(_556);
    bool _570 = _566 || _568;
    bool _572 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _574 = _570 || _572;
    float _576 = float(_574);
    float _578 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _580 = _578 + (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _582 = _556 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _584 = isnan(_556);
    bool _586 = _582 || _584;
    bool _588 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _590 = _586 || _588;
    float _592 = float(_590);
    float _594 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _596 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _594;
    bool _598 = _556 >= (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _600 = isnan(_556);
    bool _602 = _598 || _600;
    bool _604 = isnan((*spvDescriptorSet0.vp_c9)._m0[117].w);
    bool _606 = _602 || _604;
    float _608 = float(_606);
    float _610 = 1.0 / _564;
    float _612 = -_576;
    float _614 = _612 + 1.0;
    bool _616 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].w;
    float _618 = _592 * _614;
    float _620 = -_592;
    float _622 = _620 + 1.0;
    float _624 = 1.0 / _580;
    float _626 = _596 * _610;
    float _628 = -(*spvDescriptorSet0.vp_c9)._m0[116].x;
    float _630 = _628 + (*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _632 = _528 * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _634 = _530 * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _636 = fma(_626, _560, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _638 = _532 * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _640 = _632 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _642 = _634 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _644 = _630 * _624;
    float _646 = _636 * _618;
    float _648 = -_608;
    float _650 = _648 + 1.0;
    float _652 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _654 = _556 + _652;
    float _656 = _638 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _658 = fma(_622, (*spvDescriptorSet0.vp_c9)._m0[115].x, _646);
    float _660 = _576 * _650;
    float _662 = fma(_644, _654, (*spvDescriptorSet0.vp_c9)._m0[116].x);
    float _664 = fma(_662, _660, _658);
    float _666 = fma(_608, (*spvDescriptorSet0.vp_c9)._m0[117].x, _664);
    float _668 = _666 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    bool _670 = !_616;
    float _672 = _668;
    float _690;
    if (!_670)
    {
        float _674 = in.m_57.x;
        float _676 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].w;
        float _678 = _674 * (*spvDescriptorSet0.vp_c9)._m0[13].x;
        float _680 = fma(_678, (*spvDescriptorSet0.vp_c9)._m0[11].w, _138);
        float _682 = _680 * _676;
        float _684 = floor(_682);
        float _686 = -_684;
        float _688 = _682 + _686;
        _690 = _688;
        _692 = true;
    }
    else
    {
        _690 = _150;
    }
    _692 = false;
    float _694 = _690;
    float _696 = in.m_46.x;
    float _698 = in.m_46.y;
    float _700 = in.m_46.z;
    float _702 = _422 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _704 = _420 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _706 = _702 * (*spvDescriptorSet0.vp_c13)._m0[2].y;
    float _708 = (*spvDescriptorSet0.vp_c8)._m0[28].y * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _710 = _424 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _712 = -(*spvDescriptorSet0.vp_c9)._m0[193].w;
    float _714 = _712 + (*spvDescriptorSet0.vp_c9)._m0[194].x;
    float _716 = fma(_150, _714, (*spvDescriptorSet0.vp_c9)._m0[193].w);
    float _718 = _698 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _720 = _698 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _722 = _698 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _724 = fma(_696, (*spvDescriptorSet0.vp_c10)._m0[5].x, _718);
    float _726 = fma(_696, (*spvDescriptorSet0.vp_c10)._m0[4].x, _720);
    float _728 = fma(_696, (*spvDescriptorSet0.vp_c10)._m0[6].x, _722);
    float _730 = fma(_700, (*spvDescriptorSet0.vp_c10)._m0[5].z, _724);
    float _732 = fma(_700, (*spvDescriptorSet0.vp_c10)._m0[4].z, _726);
    float _734 = fma(_700, (*spvDescriptorSet0.vp_c10)._m0[6].z, _728);
    float _736 = _730 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _738 = _732 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _740 = _734 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _742 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _744 = _736 + _742;
    float _746 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _748 = _738 + _746;
    float _750 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _752 = _740 + _750;
    float _754 = -_736;
    float _756 = _754 + (*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _758 = _744 * _744;
    float _760 = -_738;
    float _762 = _760 + (*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _764 = -_740;
    float _766 = _764 + (*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _768 = fma(_748, _748, _758);
    float _770 = fma(_752, _752, _768);
    float _772 = sqrt(_770);
    float _774 = rsqrt(_770);
    float _776 = _772 * (*spvDescriptorSet0.vp_c13)._m0[2].x;
    float _778 = fma((*spvDescriptorSet0.vp_c8)._m0[28].x, (*spvDescriptorSet0.vp_c8)._m0[28].x, _708);
    float _780 = _736 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _782 = precise::min(_706, _776);
    float _784 = _756 * _756;
    float _786 = (*spvDescriptorSet0.vp_c8)._m0[0].y * (*spvDescriptorSet0.vp_c10)._m0[9].w;
    float _788 = fma(_738, (*spvDescriptorSet0.vp_c8)._m0[0].x, _780);
    float _790 = fma(_762, _762, _784);
    float _792 = _774 * _782;
    float _794 = fma((*spvDescriptorSet0.vp_c8)._m0[0].x, (*spvDescriptorSet0.vp_c10)._m0[8].w, _786);
    float _796 = fma(_766, _766, _790);
    float _798 = _744 * _792;
    float _800 = fma(_740, (*spvDescriptorSet0.vp_c8)._m0[0].z, _788);
    float _802 = _748 * _792;
    float _804 = rsqrt(_796);
    float _806 = fma((*spvDescriptorSet0.vp_c8)._m0[0].z, (*spvDescriptorSet0.vp_c10)._m0[10].w, _794);
    float _808 = -_798;
    float _810 = _744 + _808;
    float _812 = _800 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _814 = -_802;
    float _816 = _748 + _814;
    float _818 = _806 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _820 = _810 * _810;
    float _822 = -(*spvDescriptorSet0.vp_c9)._m0[194].y;
    float _824 = (*spvDescriptorSet0.vp_c9)._m0[194].z + _822;
    float _826 = _752 * _792;
    float _828 = -_812;
    float _830 = _818 + _828;
    float _832 = fma(_816, _816, _820);
    float _834 = 1.0 / _824;
    float _836 = -_826;
    float _838 = _752 + _836;
    bool _840 = _812 >= _818;
    bool _842 = isnan(_812);
    bool _844 = _840 || _842;
    bool _846 = isnan(_818);
    bool _848 = _844 || _846;
    float _850 = abs(_830);
    float _852 = precise::max(_850, (*spvDescriptorSet0.vp_c9)._m0[194].y);
    float _854 = _762 * _804;
    float _856 = _766 * _804;
    float _858 = _756 * _804;
    float _860 = precise::min(_852, (*spvDescriptorSet0.vp_c9)._m0[194].z);
    float _862 = -(*spvDescriptorSet0.vp_c8)._m0[1].z;
    float _864 = _854 * _862;
    float _866 = -(*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _868 = _856 * _866;
    float _870 = sqrt(_796);
    float _872 = -(*spvDescriptorSet0.vp_c8)._m0[1].x;
    float _874 = _858 * _872;
    float _876 = -(*spvDescriptorSet0.vp_c8)._m0[1].x;
    float _878 = -_864;
    float _880 = fma(_856, _876, _878);
    float _882 = -(*spvDescriptorSet0.vp_c8)._m0[1].z;
    float _884 = -_868;
    float _886 = fma(_858, _882, _884);
    float _888 = fma(_838, _838, _832);
    float _890 = -(*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _892 = -_874;
    float _894 = fma(_854, _890, _892);
    float _896 = _880 * _880;
    float _898 = in.m_61.x;
    float _900 = in.m_61.y;
    float _902 = in.m_61.z;
    float _904 = -(*spvDescriptorSet0.vp_c9)._m0[194].y;
    float _906 = _860 + _904;
    float _908 = fma(_886, _886, _896);
    float _910 = sqrt(_888);
    float _912 = _906 * _834;
    float _914 = fma(_894, _894, _908);
    bool _916 = !_848;
    float _918 = _916 ? 1.0 : (-1.0);
    float _920 = abs(_870);
    float _922 = precise::max(0.0, _920);
    float _924 = rsqrt(_914);
    float _926 = fma((*spvDescriptorSet0.vp_c8)._m0[28].z, (*spvDescriptorSet0.vp_c8)._m0[28].z, _778);
    float _928 = precise::min(_922, 40.0);
    float _930 = _918 * _912;
    float _932 = _150 * (*spvDescriptorSet0.vp_c9)._m0[194].w;
    float _934 = fma(_928, -0.02500000037252902984619140625, 1.0);
    float _936 = _774 * _910;
    float _938 = rsqrt(_926);
    float _940 = _932 * _930;
    float _942 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _900);
    float _944 = _704 * _936;
    float _946 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _902);
    float _948 = _710 * _936;
    float _950 = _894 * _924;
    float _952 = _886 * _924;
    float _954 = _880 * _924;
    float _956 = _944 * _942;
    float _958 = _854 * _950;
    float _960 = _702 * _936;
    float _962 = _856 * _954;
    float _964 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _898);
    float _966 = -_958;
    float _968 = fma(_856, _952, _966);
    float _970 = _948 * _946;
    float _972 = -_962;
    float _974 = fma(_858, _950, _972);
    float _976 = _858 * _952;
    float _978 = _960 * _964;
    float _980 = _956 * _968;
    float _982 = _938 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _984 = _956 * _974;
    float _986 = -_976;
    float _988 = fma(_854, _954, _986);
    float _990 = fma(_978, _954, _980);
    float _992 = _938 * (*spvDescriptorSet0.vp_c8)._m0[28].x;
    float _994 = _982 * _982;
    float _996 = fma(_978, _952, _984);
    float _998 = _956 * _988;
    float _1000 = fma(_970, _858, _990);
    float _1002 = _938 * (*spvDescriptorSet0.vp_c8)._m0[28].z;
    float _1004 = fma(_992, _992, _994);
    float _1006 = fma(_978, _950, _998);
    float _1008 = fma(_970, _854, _996);
    float _1010 = _736 + _1000;
    float _1012 = fma(_1002, _1002, _1004);
    float _1014 = _940 * 0.15915493667125701904296875;
    float _1016 = _736 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1018 = fma(_970, _856, _1006);
    float _1020 = _738 + _1008;
    float _1022 = _1010 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1024 = _1010 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1026 = _1010 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1028 = fma(_738, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1016);
    float _1030 = _740 + _1018;
    float _1032 = fma(_1020, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1022);
    float _1034 = fma(_1020, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1024);
    float _1036 = fma(_1020, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1026);
    float _1038 = rsqrt(_1012);
    float _1040 = fma(_740, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1028);
    float _1042 = fma(_1030, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1034);
    float _1044 = fma(_1030, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1036);
    float _1046 = fma(_1030, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1032);
    float _1048 = _1040 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1050 = _1042 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1052 = _1044 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1054 = _1014 * 6.283185482025146484375;
    float _1056 = cos(_1054);
    float _1058 = _1046 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1060 = -_1050;
    float _1062 = _1060 + _1048;
    float _1064 = _1052 * (*spvDescriptorSet0.vp_c8)._m0[13].y;
    float _1066 = _1052 * (*spvDescriptorSet0.vp_c8)._m0[12].y;
    float _1068 = _1052 * (*spvDescriptorSet0.vp_c8)._m0[14].y;
    float _1070 = fma(_934, _1062, _1050);
    float _1072 = fma(_1058, (*spvDescriptorSet0.vp_c8)._m0[13].x, _1064);
    float _1074 = _1014 * 6.283185482025146484375;
    float _1076 = sin(_1074);
    float _1078 = fma(_1058, (*spvDescriptorSet0.vp_c8)._m0[12].x, _1066);
    float _1080 = fma(_1058, (*spvDescriptorSet0.vp_c8)._m0[14].x, _1068);
    float _1082 = fma(_1070, (*spvDescriptorSet0.vp_c8)._m0[13].z, _1072);
    float _1084 = fma(_1070, (*spvDescriptorSet0.vp_c8)._m0[12].z, _1078);
    float _1086 = fma(_1070, (*spvDescriptorSet0.vp_c8)._m0[14].z, _1080);
    float _1088 = -_1056;
    float _1090 = _1088 + 1.0;
    float _1092 = _992 * _1038;
    float _1094 = _982 * _1038;
    float _1096 = _1002 * _1038;
    float _1098 = _1084 + (*spvDescriptorSet0.vp_c8)._m0[12].w;
    float _1100 = _1094 * _1090;
    float _1102 = _1096 * _1096;
    float _1104 = _1092 * _1076;
    float _1106 = _1094 * _1076;
    float _1108 = _1096 * _1076;
    float _1110 = _1082 + (*spvDescriptorSet0.vp_c8)._m0[13].w;
    float _1112 = fma(_1090, _1102, _1056);
    float _1114 = _1092 * _1090;
    float _1116 = fma(_1096, _1100, _1104);
    float _1118 = -_736;
    float _1120 = _1118 + _1110;
    float _1122 = -_738;
    float _1124 = _1122 + _1098;
    float _1126 = -_1106;
    float _1128 = fma(_1096, _1114, _1126);
    float _1130 = -_1108;
    float _1132 = fma(_1094, _1114, _1130);
    float _1134 = _1116 * _1120;
    float _1136 = _1086 + (*spvDescriptorSet0.vp_c8)._m0[14].w;
    float _1138 = fma(_1092, _1114, _1056);
    float _1140 = _1132 * _1120;
    float _1142 = fma(_1128, _1124, _1134);
    float _1144 = -_740;
    float _1146 = _1144 + _1136;
    float _1148 = fma(_1096, _1114, _1106);
    float _1150 = fma(_1138, _1124, _1140);
    float _1152 = fma(_1094, _1100, _1056);
    float _1154 = fma(_1112, _1146, _1142);
    float _1156 = fma(_1094, _1114, _1108);
    float _1158 = fma(_1148, _1146, _1150);
    float _1160 = _1152 * _1120;
    float _1162 = fma(_1154, _716, _740);
    float _1164 = -_798;
    float _1166 = _736 + _1164;
    float _1168 = fma(_1158, _716, _738);
    float _1170 = -_1104;
    float _1172 = fma(_1096, _1100, _1170);
    float _1174 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1176 = _1162 + _1174;
    float _1178 = fma(_1156, _1124, _1160);
    float _1180 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1182 = _1168 + _1180;
    float _1184 = _1166 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _1186 = _1176 * _1176;
    float _1188 = fma(_1172, _1146, _1178);
    float _1190 = -_826;
    float _1192 = _740 + _1190;
    float _1194 = fma(_1182, _1182, _1186);
    float _1196 = -_802;
    float _1198 = _738 + _1196;
    float _1200 = _736 + _1188;
    float _1202 = sqrt(_1194);
    float _1204 = fma(_1198, (*spvDescriptorSet0.vp_c8)._m0[11].x, _1184);
    float _1206 = fma(_1192, (*spvDescriptorSet0.vp_c8)._m0[11].z, _1204);
    bool _1208 = _1202 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1210 = _1188;
    float _1212 = _1204;
    float _1214 = _1156;
    float _1216 = _1200;
    if (!_1208)
    {
        _1210 = _1168;
    }
    float _1218 = _1210;
    float _1220 = _1218;
    if (!_1208)
    {
        _1212 = _1162;
    }
    float _1222 = _1212;
    float _1224 = _1222;
    if (!_1208)
    {
        _1214 = _1200;
    }
    float _1226 = _1214;
    bool _1228 = !_1208;
    float _1230 = _1226;
    if (!_1228)
    {
        float _1232 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1234 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1236 = _1202 + _1234;
        float _1238 = _1200 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1240 = rsqrt(_1194);
        float _1242 = _1236 * _1232;
        float _1244 = _1242 * 0.15915493667125701904296875;
        float _1246 = _1244 * 6.283185482025146484375;
        float _1248 = cos(_1246);
        float _1250 = _1244 * 6.283185482025146484375;
        float _1252 = sin(_1250);
        float _1254 = _1248 + (-1.0);
        float _1256 = _1254 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1258 = fma(_1252, _1238, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1260 = fma(_1200, _1248, _1256);
        float _1262 = _1240 * _1258;
        float _1264 = fma(_1182, _1262, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1266 = fma(_1176, _1262, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _1230 = _1260;
        _1220 = _1264;
        _1224 = _1266;
    }
    float _1268 = _1230;
    float _1270 = _1220;
    float _1272 = _1224;
    float _1274 = -_736;
    float _1276 = _1274 + _1268;
    float _1278 = -_738;
    float _1280 = _1278 + _1270;
    float _1282 = _1206 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _1284 = _1166 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _1286 = _1276 * _1276;
    float _1288 = -_740;
    float _1290 = _1288 + _1272;
    float _1292 = 1.0 / _1282;
    float _1294 = fma(_1198, (*spvDescriptorSet0.vp_c8)._m0[10].x, _1284);
    float _1296 = fma(_1280, _1280, _1286);
    float _1298 = -_802;
    float _1300 = _1298 + _1270;
    float _1302 = fma(_1192, (*spvDescriptorSet0.vp_c8)._m0[10].z, _1294);
    float _1304 = fma(_1290, _1290, _1296);
    float _1306 = -_798;
    float _1308 = _1306 + _1268;
    float _1310 = -_826;
    float _1312 = _1310 + _1272;
    float _1314 = _1302 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _1316 = sqrt(_1304);
    float _1318 = _1314 + _1282;
    float _1320 = _1318 * _1292;
    float _1322 = _1320 * 0.5;
    float _1324 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _1326 = fma(_1322, (*spvDescriptorSet0.vp_c8)._m0[30].w, _1324);
    bool _1328 = _1316 > 0.0;
    float _1330 = 1.0 / _1326;
    bool _1332 = (*spvDescriptorSet0.vp_c15)._m0[653].w >= 0.5;
    bool _1334 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _1336 = _1332 || _1334;
    bool _1338 = isnan(0.5);
    bool _1340 = _1336 || _1338;
    bool _1342 = (*spvDescriptorSet0.vp_c15)._m0[660].y >= 0.5;
    bool _1344 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _1346 = _1342 || _1344;
    bool _1348 = isnan(0.5);
    bool _1350 = _1346 || _1348;
    float _1352 = (*spvDescriptorSet0.vp_c15)._m0[653].w;
    float _1354 = (*spvDescriptorSet0.vp_c8)._m0[30].w;
    float _1356 = (*spvDescriptorSet0.vp_c15)._m0[660].y;
    if (!_1328)
    {
        _1352 = _1300;
    }
    float _1358 = _1352;
    float _1360 = _1358;
    if (!_1328)
    {
        _1354 = _1308;
    }
    float _1362 = _1354;
    float _1364 = _1362;
    float _1366 = _1362;
    if (!_1328)
    {
        _1356 = _1312;
    }
    float _1368 = _1356;
    bool _1370 = !_1328;
    float _1372 = _1368;
    if (!_1370)
    {
        float _1374 = _188 * _188;
        float _1376 = fma(_186, _186, _1374);
        float _1378 = fma(_190, _190, _1376);
        float _1380 = rsqrt(_1304);
        float _1382 = sqrt(_1378);
        float _1384 = _1280 * _1380;
        float _1386 = _1276 * _1380;
        float _1388 = _1290 * _1380;
        bool _1390 = _1382 > 0.0;
        float _1392 = _1382;
        float _1394 = _1380;
        if (!_1390)
        {
            _1392 = _1300;
        }
        float _1396 = _1392;
        _1360 = _1396;
        if (!_1390)
        {
            _1364 = _1308;
        }
        float _1398 = _1364;
        _1366 = _1398;
        if (!_1390)
        {
            _1394 = _1312;
        }
        float _1400 = _1394;
        bool _1402 = !_1390;
        _1372 = _1400;
        if (!_1402)
        {
            float _1404 = rsqrt(_1378);
            float _1406 = 1.0 / (*spvDescriptorSet0.vp_c10)._m0[2].z;
            float _1408 = _188 * _1404;
            float _1410 = _186 * _1404;
            float _1412 = _190 * _1404;
            float _1414 = _1386 * _1408;
            float _1416 = fma(_1384, _1410, _1414);
            float _1418 = _1406 * (*spvDescriptorSet0.vp_c9)._m0[142].x;
            float _1420 = fma(_1388, _1412, _1416);
            float _1422 = _1420 * _1418;
            float _1424 = fma(_186, _1422, _1300);
            float _1426 = fma(_188, _1422, _1308);
            float _1428 = fma(_190, _1422, _1312);
            _1360 = _1424;
            _1366 = _1426;
            _1372 = _1428;
        }
    }
    float _1430 = _1360;
    float _1432 = _1366;
    float _1434 = _1372;
    float _1436 = _1434;
    if (_1340)
    {
        _194 = 1.0;
    }
    float _1438 = _194;
    float _1440 = _1438;
    if (_1350)
    {
        _196 = _1430;
    }
    float _1442 = _196;
    float _1444 = _1442;
    if (_1350)
    {
        _198 = _1432;
    }
    float _1446 = _198;
    float _1448 = _1446;
    if (!_1350)
    {
        float _1450 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
        float _1452 = _1166 + _1450;
        float _1454 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
        float _1456 = _1198 + _1454;
        float _1458 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1460 = -_1198;
        float _1462 = _1460 + _1430;
        float _1464 = _1452 * _1452;
        float _1466 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
        float _1468 = _1192 + _1466;
        float _1470 = -_1166;
        float _1472 = _1470 + _1432;
        float _1474 = fma(_1456, _1456, _1464);
        float _1476 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _1478 = fma(_1468, _1468, _1474);
        float _1480 = sqrt(_1478);
        float _1482 = _1458 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1484 = -_1192;
        float _1486 = _1484 + _1434;
        float _1488 = precise::min(_1480, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _1490 = _1488 * _1476;
        float _1492 = _1482 * _1490;
        float _1494 = fma(_1462, _1492, _1198);
        float _1496 = fma(_1472, _1492, _1166);
        float _1498 = fma(_1486, _1492, _1192);
        _1448 = _1496;
        _1444 = _1494;
        _1436 = _1498;
    }
    float _1500 = _1448;
    float _1502 = _1444;
    float _1504 = _1436;
    if (_1340)
    {
        _1216 = 1.0;
    }
    float _1506 = _1216;
    float _1508 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _1510 = _1330 * _1508;
    float _1512 = _1506;
    if (!_1340)
    {
        float _1514 = (*spvDescriptorSet0.vp_c8)._m0[31].x * 0.5;
        float _1516 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1518 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _1516;
        float _1520 = _1514 * 0.15915493667125701904296875;
        float _1522 = _1520 * 6.283185482025146484375;
        float _1524 = cos(_1522);
        float _1526 = (*spvDescriptorSet0.vp_c8)._m0[31].y * 0.5;
        float _1528 = _1526 * 0.15915493667125701904296875;
        float _1530 = _1520 * 6.283185482025146484375;
        float _1532 = sin(_1530);
        float _1534 = 1.0 / _1524;
        float _1536 = _1528 * 6.283185482025146484375;
        float _1538 = cos(_1536);
        float _1540 = _1532 * _1534;
        float _1542 = _1528 * 6.283185482025146484375;
        float _1544 = sin(_1542);
        float _1546 = _1538 * _1540;
        float _1548 = 1.0 / _1518;
        float _1550 = 1.0 / _1546;
        float _1552 = _1544 * _1550;
        float _1554 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1556 = fma(_1510, _1552, _1554);
        float _1558 = _1556 * _1548;
        float _1560 = precise::clamp(_1558, 0.0, 1.0);
        _1440 = _1560;
    }
    float _1562 = _1440;
    if (!_1340)
    {
        float _1564 = (*spvDescriptorSet0.vp_c8)._m0[31].x * 0.5;
        float _1566 = _1564 * 0.15915493667125701904296875;
        float _1568 = _1566 * 6.283185482025146484375;
        float _1570 = cos(_1568);
        float _1572 = (*spvDescriptorSet0.vp_c8)._m0[31].y * 0.5;
        float _1574 = _1572 * 0.15915493667125701904296875;
        float _1576 = _1566 * 6.283185482025146484375;
        float _1578 = sin(_1576);
        float _1580 = 1.0 / _1570;
        float _1582 = _1574 * 6.283185482025146484375;
        float _1584 = cos(_1582);
        float _1586 = _1578 * _1580;
        float _1588 = _1574 * 6.283185482025146484375;
        float _1590 = sin(_1588);
        float _1592 = _1584 * _1586;
        float _1594 = 1.0 / _1592;
        float _1596 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _1598 = (*spvDescriptorSet0.vp_c9)._m0[140].w + _1596;
        float _1600 = 1.0 / _1598;
        float _1602 = _1590 * _1594;
        float _1604 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _1606 = fma(_1510, _1602, _1604);
        float _1608 = _1606 * _1600;
        float _1610 = precise::clamp(_1608, 0.0, 1.0);
        float _1612 = -_1610;
        float _1614 = _1612 + 1.0;
        _1512 = _1614;
    }
    float _1616 = _1512;
    float _1618 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1620 = _1500 + _1618;
    float _1622 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1624 = _1502 + _1622;
    float _1626 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1628 = _1504 + _1626;
    float _1630 = _1500 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1632 = _1620 * _1620;
    float _1634 = fma(_1502, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1630);
    float _1636 = fma(_1624, _1624, _1632);
    float _1638 = fma(_1504, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1634);
    float _1640 = fma(_1628, _1628, _1636);
    float _1642 = _1638 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1644 = rsqrt(_1640);
    float _1646 = _1644 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1648 = _1624 * _1646;
    float _1650 = _1628 * _1646;
    float _1652 = _1648 * _1648;
    float _1654 = _1650 * _1650;
    float _1656 = _1652 + _1654;
    float _1658 = sqrt(_1656);
    bool _1660 = _1658 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1662 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1664 = _1658 + _1662;
    float _1666 = _1312;
    float _1668 = _1656;
    float _1670 = _1664;
    float _1672 = _1620;
    float _1674 = _1646;
    float _1676 = _1648;
    if (_1660)
    {
        float _1678 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1666 = _1678;
    }
    float _1680 = _1666;
    if (_1660)
    {
        float _1682 = rsqrt(_1656);
        _1668 = _1682;
    }
    float _1684 = _1668;
    float _1686 = _1680;
    float _1688 = _1684;
    if (_1660)
    {
        float _1690 = _1664 * _1680;
        _1670 = _1690;
    }
    float _1692 = _1670;
    if (_1660)
    {
        float _1694 = _1692 * 0.15915493667125701904296875;
        _1686 = _1694;
    }
    float _1696 = _1686;
    float _1698 = _1644;
    float _1700 = _1696;
    if (_1660)
    {
        float _1702 = _1696 * 6.283185482025146484375;
        float _1704 = sin(_1702);
        _1698 = _1704;
    }
    float _1706 = _1698;
    float _1708 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _1710 = precise::max(0.0, _1708);
    float _1712 = _1628;
    float _1714 = _1710;
    if (_1660)
    {
        float _1716 = _1696 * 6.283185482025146484375;
        float _1718 = cos(_1716);
        _1712 = _1718;
    }
    float _1720 = _1712;
    float _1722 = -_1646;
    float _1724 = -_1710;
    float _1726 = fma(_1620, _1722, _1724);
    float _1728 = _1726;
    if (_1660)
    {
        float _1730 = _1726 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1672 = _1730;
    }
    float _1732 = _1672;
    float _1734 = _1732;
    if (!_1660)
    {
        _1700 = _1648;
    }
    float _1736 = _1700;
    float _1738 = _1706;
    float _1740 = _1736;
    if (_1660)
    {
        float _1742 = fma(_1706, _1732, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1738 = _1742;
    }
    float _1744 = _1738;
    float _1746 = _1744;
    if (_1660)
    {
        float _1748 = _1720 + (-1.0);
        _1714 = _1748;
    }
    float _1750 = _1714;
    if (_1660)
    {
        float _1752 = _1684 * _1744;
        _1674 = _1752;
    }
    float _1754 = _1674;
    if (!_1660)
    {
        _1746 = _1650;
    }
    float _1756 = _1746;
    float _1758 = _1756;
    if (_1660)
    {
        float _1760 = _1750 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1734 = _1760;
    }
    float _1762 = _1734;
    if (_1660)
    {
        float _1764 = _1648 * _1754;
        _1740 = _1764;
    }
    float _1766 = _1740;
    if (!_1660)
    {
        _1688 = _1652;
    }
    float _1768 = _1688;
    float _1770 = _1768;
    if (_1660)
    {
        float _1772 = _1650 * _1754;
        _1758 = _1772;
    }
    float _1774 = _1758;
    if (_1660)
    {
        float _1776 = fma(_1726, _1720, _1762);
        _1728 = _1776;
    }
    float _1778 = _1728;
    if (_1660)
    {
        float _1780 = _1766 * _1766;
        _1770 = _1780;
    }
    float _1782 = _1770;
    float _1784 = sqrt(_1640);
    if (!_1660)
    {
        _1676 = _1654;
    }
    float _1786 = _1676;
    float _1788 = _1786;
    if (_1660)
    {
        float _1790 = _1774 * _1774;
        _1788 = _1790;
    }
    float _1792 = _1788;
    float _1794 = fma(_1778, _1778, _1782);
    float _1796 = _1500 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1798 = _1794 + _1792;
    float _1800 = fma(_1502, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1796);
    float _1802 = fma(_1198, (*spvDescriptorSet0.vp_c15)._m0[652].x, (*spvDescriptorSet0.vp_c15)._m0[652].z);
    float _1804 = rsqrt(_1798);
    float _1806 = fma(_1504, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1800);
    float _1808 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _1810 = fma(_1784, (*spvDescriptorSet0.vp_c15)._m0[23].w, _1808);
    float _1812 = precise::clamp(_1810, 0.0, 1.0);
    float _1814 = _1806 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1816 = floor(_1802);
    float _1818 = -_1812;
    float _1820 = _1818 + 1.0;
    float _1822 = _1500 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1824 = fma(_1192, (*spvDescriptorSet0.vp_c15)._m0[652].y, (*spvDescriptorSet0.vp_c15)._m0[652].w);
    float _1826 = _1500 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1828 = fma(_1502, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1822);
    float _1830 = _1814 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _1832 = abs(_1820);
    float _1834 = log2(_1832);
    float _1836 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _1838 = _1804 * _1766;
    float _1840 = fma(_1502, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1826);
    float _1842 = fma(_1504, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1828);
    float _1844 = -_1830;
    float _1846 = fma(_1844, _1836, 1.0);
    float _1848 = _1804 * _1778;
    float _1850 = _1838 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _1852 = fma(_1504, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1840);
    float _1854 = _1842 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1856 = _1804 * _1774;
    float _1858 = -_1850;
    float _1860 = fma(_1848, (*spvDescriptorSet0.vp_c15)._m0[21].y, _1858);
    float _1862 = _1852 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1864 = _1854 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1866 = floor(_1824);
    float _1868 = -_1856;
    float _1870 = fma(_1868, (*spvDescriptorSet0.vp_c15)._m0[21].z, _1860);
    float _1872 = _1834 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _1874 = fma(_1862, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1864);
    float _1876 = -_1816;
    float _1878 = _1802 + _1876;
    float _1880 = fma(_1870, -0.5, 0.5);
    float _1882 = fma(_1814, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1874);
    float _1884 = exp2(_1872);
    float _1886 = fma(_1870, 0.5, 0.5);
    float _1888 = _1854 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1890 = fma(_1642, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1882);
    float _1892 = _1854 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1894 = log2(_1846);
    float _1896 = fma(_1886, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _1898 = -_1866;
    float _1900 = _1824 + _1898;
    float _1902 = fma(_1862, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1888);
    float _1904 = fma(_1862, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1892);
    float _1906 = _1848 + 1.0;
    float _1908 = fma(_1886, _1896, -0.212114393711090087890625);
    float _1910 = fma(_1814, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1902);
    float _1912 = 1.0 / _1890;
    float _1914 = fma(_1814, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1904);
    float _1916 = -_1848;
    float _1918 = fma(_1884, _1906, _1916);
    float _1920 = fma(_1642, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1910);
    float _1922 = fma(_1886, _1908, 1.570728778839111328125);
    float _1924 = fma(_1642, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1914);
    float _1926 = fma(_1918, 0.5, 0.5);
    float _1928 = sqrt(_1880);
    float _1930 = _1894 * 0.693147182464599609375;
    float _1932 = _1930 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _1934 = _1920 * _1912;
    float _1936 = _1924 * _1912;
    float _1938 = fma(_1934, 0.5, 0.5);
    float _1940 = fma(_1936, -0.5, 0.5);
    float _1942 = _1928 * 0.636619746685028076171875;
    float2 _5920 = float2(_1878, _1900);
    float _1944 = dm_bs(spvDescriptorSet0.vp_t_tcb_24.sample(spvDescriptorSet0.vp_t_tcb_24Smplr, select(_5920, float2(0.0), isnan(_5920)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_24, spvDescriptorSet0.vp_t_tcb_24Smplr_w, select(_5920, float2(0.0), isnan(_5920)), level(0.0)).x;
    float3 _5931 = float3(_1938, _1940, _1932);
    float _1946 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_5931, float3(0.0), isnan(_5931)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_5931, float3(0.0), isnan(_5931)), level(0.0)).x;
    float _1948 = -_1922;
    float _1950 = fma(_1942, _1948, 1.0);
    float3 _5947 = float3(_1938, _1940, _1932);
    float4 _1953 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_5947, float3(0.0), isnan(_5947)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_5947, float3(0.0), isnan(_5947)), level(0.0)).xyzw;
    float _1955 = _1953.x;
    float _1957 = _1953.y;
    float _1959 = _1953.z;
    float _1961 = _1953.w;
    float2 _5963 = float2(_1950, _1926);
    float3 _1965 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_5963, float2(0.0), isnan(_5963)), level(0.0)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_5963, float2(0.0), isnan(_5963)), level(0.0)).xyz;
    float _1967 = _1965.x;
    float _1969 = _1965.y;
    float _1971 = _1965.z;
    float _1973 = in.m_57.x;
    float _1975 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _1977 = in.m_57.y;
    float _1979 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    out.m_63.x = _640;
    out.m_63.y = _642;
    out.m_63.z = _656;
    out.m_63.w = _668;
    float _1981 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _1983 = _1981 + (*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _1985 = -(*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _1987 = _1985 + (*spvDescriptorSet0.vp_c9)._m0[133].w;
    float _1989 = in.m_57.z;
    float _1991 = 1.0 / _1983;
    int _1993 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _1995 = _1993 != 0;
    float _1997 = _1834 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _1999 = -(*spvDescriptorSet0.vp_c9)._m0[133].x;
    float _2001 = (*spvDescriptorSet0.vp_c9)._m0[134].x + _1999;
    float _2003 = _1975 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    int _2005 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 16;
    bool _2007 = _2005 != 0;
    float _2009 = -(*spvDescriptorSet0.vp_c9)._m0[133].w;
    float _2011 = _2009 + (*spvDescriptorSet0.vp_c9)._m0[134].w;
    float _2013 = _1973 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    float _2015 = 1.0 / _1987;
    float _2017 = -(*spvDescriptorSet0.vp_c9)._m0[131].x;
    float _2019 = (*spvDescriptorSet0.vp_c9)._m0[132].x + _2017;
    float _2021 = -_1979;
    float _2023 = fma(_2013, 2.0, _2021);
    float _2025 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _2027 = in.m_65.y;
    float _2029 = _1977 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    int _2031 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _2033 = _2031 != 0;
    float _2035 = 1.0 / _2011;
    float _2037 = fma(_2029, -2.0, _2025);
    float _2039 = -(*spvDescriptorSet0.vp_c9)._m0[132].x;
    float _2041 = _2039 + (*spvDescriptorSet0.vp_c9)._m0[133].x;
    int _2043 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 32;
    bool _2045 = _2043 != 0;
    float _2047 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    int _2049 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _2051 = _2049 != 0;
    float _2053 = (*spvDescriptorSet0.vp_c9)._m0[88].w + (*spvDescriptorSet0.vp_c9)._m0[88].y;
    bool _2055 = _1989 > 0.5;
    float _2057 = (*spvDescriptorSet0.vp_c9)._m0[88].z + (*spvDescriptorSet0.vp_c9)._m0[88].x;
    float _2059 = _2019 * _1991;
    float _2061 = fma(_1977, (*spvDescriptorSet0.vp_c9)._m0[88].w, _2053);
    float _2063 = -(*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _2065 = _694 + _2063;
    float _2067 = _2041 * _2015;
    float _2069 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].w;
    float _2071 = _2001 * _2035;
    float _2073 = fma(_1973, (*spvDescriptorSet0.vp_c9)._m0[78].z, _2047);
    bool _2075 = _1977 > 0.5;
    float _2077 = fma(_2067, _2065, (*spvDescriptorSet0.vp_c9)._m0[132].x);
    float _2079 = -_2027;
    float _2081 = _2079 + 1.0;
    float _2083 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    float _2085 = _2083;
    bool _2087 = _2055;
    float _2089 = _2027;
    float _2091 = _2057;
    float _2093 = _1924;
    if (_2033)
    {
        _672 = _1973;
    }
    float _2095 = _672;
    float _2097 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _2099 = fma(_1977, (*spvDescriptorSet0.vp_c9)._m0[78].w, _2083);
    float _2101 = _2095;
    if (_2033)
    {
        _2085 = _1977;
    }
    float _2103 = _2085;
    float _2105 = fma(_1973, (*spvDescriptorSet0.vp_c9)._m0[88].z, _2057);
    int _2107 = _2055 ? as_type<int>(_2081) : as_type<int>(_2027);
    float _2109 = (*spvDescriptorSet0.vp_c9)._m0[79].z + (*spvDescriptorSet0.vp_c9)._m0[79].y;
    float _2111 = _2103;
    if (_1995)
    {
        bool _2113 = _1973 > 0.5;
        _2087 = _2113;
    }
    bool _2115 = _2087;
    float _2117 = -(*spvDescriptorSet0.vp_c9)._m0[133].w;
    float _2119 = _694 + _2117;
    if (!_2033)
    {
        _2111 = _1973;
    }
    float _2121 = _2111;
    float _2123 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _2125 = _694 + _2123;
    float _2127 = fma(_1989, (*spvDescriptorSet0.vp_c9)._m0[79].z, _2109);
    int _2129 = as_type<int>(_2121);
    if (!_2033)
    {
        _2101 = _1989;
    }
    float _2131 = _2101;
    float _2133 = fma(_2071, _2119, (*spvDescriptorSet0.vp_c9)._m0[133].x);
    float _2135 = fma(_2059, _2125, (*spvDescriptorSet0.vp_c9)._m0[131].x);
    bool _2137 = _694 >= (*spvDescriptorSet0.vp_c9)._m0[134].w;
    bool _2139 = isnan(_694);
    bool _2141 = _2137 || _2139;
    bool _2143 = isnan((*spvDescriptorSet0.vp_c9)._m0[134].w);
    bool _2145 = _2141 || _2143;
    float _2147 = float(_2145);
    float _2149 = in.m_65.x;
    bool _2151 = _694 >= (*spvDescriptorSet0.vp_c9)._m0[133].w;
    bool _2153 = isnan(_694);
    bool _2155 = _2151 || _2153;
    bool _2157 = isnan((*spvDescriptorSet0.vp_c9)._m0[133].w);
    bool _2159 = _2155 || _2157;
    float _2161 = float(_2159);
    float _2163 = _2069 * (*spvDescriptorSet0.vp_c9)._m0[90].y;
    bool _2165 = _694 >= (*spvDescriptorSet0.vp_c9)._m0[132].w;
    bool _2167 = isnan(_694);
    bool _2169 = _2165 || _2167;
    bool _2171 = isnan((*spvDescriptorSet0.vp_c9)._m0[132].w);
    bool _2173 = _2169 || _2171;
    float _2175 = float(_2173);
    float _2177 = -_2147;
    float _2179 = _2177 + 1.0;
    float _2181 = _2045 ? as_type<float>(_2107) : _2027;
    float _2183 = -_2161;
    float _2185 = _2183 + 1.0;
    if (_2051)
    {
        float _2187 = _2075 ? _2081 : _2027;
        _2089 = _2187;
    }
    float _2189 = _2089;
    float _2191 = _2161 * _2179;
    bool _2193 = _694 >= (*spvDescriptorSet0.vp_c9)._m0[131].w;
    bool _2195 = isnan(_694);
    bool _2197 = _2193 || _2195;
    bool _2199 = isnan((*spvDescriptorSet0.vp_c9)._m0[131].w);
    bool _2201 = _2197 || _2199;
    float _2203 = float(_2201);
    float _2205 = -_2175;
    float _2207 = _2205 + 1.0;
    float _2209 = fma(_2181, _2163, -0.5);
    float _2211 = _2131 * (*spvDescriptorSet0.vp_c9)._m0[87].x;
    float _2213 = _2097 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _2215 = _2175 * _2185;
    float _2217 = _2203 * _2207;
    float _2219 = (*spvDescriptorSet0.vp_c9)._m0[87].x + (*spvDescriptorSet0.vp_c9)._m0[86].z;
    float _2221 = fma(_2213, _2189, -0.5);
    float _2223 = (*spvDescriptorSet0.vp_c9)._m0[87].y + (*spvDescriptorSet0.vp_c9)._m0[86].w;
    float _2225 = _2121 * (*spvDescriptorSet0.vp_c9)._m0[87].y;
    float _2227 = -_2219;
    float _2229 = fma(_2211, 2.0, _2227);
    float _2231 = _2135 * _2217;
    float _2233 = fma(_138, (*spvDescriptorSet0.vp_c9)._m0[79].x, _2127);
    float _2235 = fma(_2225, -2.0, _2223);
    float _2237 = fma(_138, (*spvDescriptorSet0.vp_c9)._m0[77].z, _2073);
    float _2239 = -_138;
    float _2241 = fma(_2239, (*spvDescriptorSet0.vp_c9)._m0[76].x, _2023);
    float _2243 = fma(_138, (*spvDescriptorSet0.vp_c9)._m0[77].w, _2099);
    float _2245 = fma(_138, (*spvDescriptorSet0.vp_c9)._m0[76].y, _2037);
    float _2247 = fma(_138, (*spvDescriptorSet0.vp_c9)._m0[87].z, _2105);
    float _2249 = fma(_138, (*spvDescriptorSet0.vp_c9)._m0[87].w, _2061);
    float _2251 = -_138;
    float _2253 = fma(_2251, (*spvDescriptorSet0.vp_c9)._m0[86].x, _2229);
    float _2255 = fma(_138, (*spvDescriptorSet0.vp_c9)._m0[86].y, _2235);
    int _2257 = as_type<int>(_2213);
    float _2259 = _2149;
    if (_1995)
    {
        float _2261 = -_2149;
        float _2263 = _2261 + 1.0;
        _2257 = as_type<int>(_2263);
    }
    int _2265 = _2257;
    float _2267 = abs(_1510);
    float _2269 = log2(_2267);
    float _2271 = -_2203;
    float _2273 = _2271 + 1.0;
    if (_2007)
    {
        float _2275 = -_2149;
        float _2277 = _2275 + 1.0;
        _2129 = as_type<int>(_2277);
    }
    int _2279 = _2129;
    if (!_1995)
    {
        _2091 = _2149;
    }
    float _2281 = _2091;
    float _2283 = _2233 * (-0.15915493667125701904296875);
    float _2285 = _2281;
    if (_1995)
    {
        float _2287 = _2115 ? as_type<float>(_2265) : _2149;
        _2285 = _2287;
    }
    float _2289 = _2285;
    float _2291 = fma(_2273, (*spvDescriptorSet0.vp_c9)._m0[131].x, _2231);
    if (_2007)
    {
        float _2293 = _2075 ? as_type<float>(_2279) : _2149;
        _2259 = _2293;
    }
    float _2295 = _2259;
    float _2297 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].z;
    float _2299 = in.m_67.x;
    float _2301 = in.m_67.y;
    float _2303 = in.m_67.z;
    bool _2305 = _900 != 0.0;
    bool _2307 = isnan(_900);
    bool _2309 = _2305 || _2307;
    bool _2311 = isnan(0.0);
    bool _2313 = _2309 || _2311;
    float _2315 = fma(_2077, _2215, _2291);
    float _2317 = fma(_2003, _2289, -0.5);
    float _2319 = -_2255;
    float _2321 = fma(_2249, _2209, _2319);
    bool _2323 = _898 == 0.0;
    bool _2325 = !_2313;
    bool _2327 = _2323 && _2325;
    float _2329 = fma(_2133, _2191, _2315);
    float _2331 = _2283 * 6.283185482025146484375;
    float _2333 = sin(_2331);
    float _2335 = _2269 * (*spvDescriptorSet0.vp_c15)._m0[654].z;
    bool _2337 = _902 == 0.0;
    bool _2339 = _2337 && _2327;
    out.m_69.x = _1198;
    out.m_69.y = _1166;
    out.m_69.z = _1192;
    bool _2341 = _1510 <= 8000.0;
    bool _2343 = isnan(_1510);
    bool _2345 = _2341 || _2343;
    bool _2347 = isnan(8000.0);
    bool _2349 = _2345 || _2347;
    float _2351 = float(_2349);
    out.m_71.w = _782;
    float _2353 = _2283 * 6.283185482025146484375;
    float _2355 = cos(_2353);
    float _2357 = _2297 * (*spvDescriptorSet0.vp_c9)._m0[90].x;
    float _2359 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    out.m_73.x = _960;
    float _2361 = fma(_2357, _2295, -0.5);
    float _2363 = _2359 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    out.m_75.x = _1502;
    out.m_75.y = _1500;
    out.m_75.z = _1504;
    float _2365 = exp2(_2335);
    float _2367 = _2333 * _2221;
    float _2369 = _2303;
    float _2371 = _2299;
    float _2373 = _2301;
    if (!_2339)
    {
        float _2375 = fma(_902, (*spvDescriptorSet0.vp_c9)._m0[17].y, _2303);
        _2369 = _2375;
    }
    float _2377 = _2369;
    float _2379 = fma(_2247, _2361, _2253);
    if (!_2339)
    {
        float _2381 = fma(_898, (*spvDescriptorSet0.vp_c9)._m0[17].y, _2299);
        _2371 = _2381;
    }
    float _2383 = _2371;
    if (!_2339)
    {
        float _2385 = fma(_900, (*spvDescriptorSet0.vp_c9)._m0[17].y, _2301);
        _2373 = _2385;
    }
    float _2387 = _2373;
    float _2389 = _2321 + 0.5;
    float _2391 = _2355 * _2221;
    float _2393 = exp2(_1997);
    float _2395 = -_2367;
    float _2397 = fma(_2355, _2317, _2395);
    float _2399 = _2379 + 0.5;
    float _2401 = fma(_2333, _2317, _2391);
    float _2403 = fma(_2237, _2397, _2241);
    float _2405 = fma(_2365, (*spvDescriptorSet0.vp_c15)._m0[654].x, (*spvDescriptorSet0.vp_c15)._m0[654].y);
    float _2407 = precise::clamp(_2405, 0.0, 1.0);
    out.m_77.x = _2399;
    out.m_77.y = _2389;
    float _2409 = -_2245;
    float _2411 = fma(_2243, _2401, _2409);
    float _2413 = fma(_2407, -2.0, 3.0);
    float _2415 = _2407 * _2407;
    float _2417 = fma(_2147, (*spvDescriptorSet0.vp_c9)._m0[134].x, _2329);
    float _2419 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _2421 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _2423 = _2415 * _2413;
    float _2425 = -_2393;
    float _2427 = _2425 + 1.0;
    float _2429 = _1854 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _2431 = _2419 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2433 = -_2423;
    float _2435 = _2433 + 1.0;
    float _2437 = _2427 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _2439 = fma(_1862, (*spvDescriptorSet0.vp_c8)._m0[6].x, _2429);
    float _2441 = _2421 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2443 = _2417 * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    float _2445 = _2411 + 0.5;
    float _2447 = fma(_1814, (*spvDescriptorSet0.vp_c8)._m0[6].z, _2439);
    float _2449 = fma(_2435, (*spvDescriptorSet0.vp_c15)._m0[654].w, _2423);
    float _2451 = _974 * _2387;
    float _2453 = _968 * _2387;
    float _2455 = in.m_79.x;
    float _2457 = _1890 * 0.5;
    float _2459 = _988 * _2387;
    float _2461 = fma(_1642, (*spvDescriptorSet0.vp_c8)._m0[6].w, _2447);
    float _2463 = _2403 + 0.5;
    out.m_81.x = _2363;
    out.m_81.y = _2431;
    out.m_81.z = _2441;
    out.m_81.w = _2443;
    float _2465 = fma(_952, _2383, _2451);
    float _2467 = fma(_954, _2383, _2453);
    float _2469 = fma(_950, _2383, _2459);
    out.m_83.x = _2463;
    out.m_83.y = _2445;
    float _2471 = _2351 * _2449;
    float _2473 = fma(_854, _2377, _2465);
    float _2475 = fma(_858, _2377, _2467);
    float _2477 = fma(_856, _2377, _2469);
    float _2479 = _2471 * (*spvDescriptorSet0.vp_c15)._m0[653].x;
    out.gl_Position.x = _1920;
    out.gl_Position.y = _1924;
    out.gl_Position.z = _2461;
    out.gl_Position.w = _1890;
    bool _2481 = _1784 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _2483 = isnan(_1784);
    bool _2485 = _2481 || _2483;
    bool _2487 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _2489 = _2485 || _2487;
    float _2491 = fma(_1924, -0.5, _2457);
    float _2493 = _2461 + _1890;
    float _2495 = _1920 + _1890;
    float _2497 = -_2437;
    float _2499 = _2497 + 1.0;
    float _2501 = _2493 * 0.5;
    float _2503 = _2495 * 0.5;
    out.m_85.x = _2473;
    out.m_85.y = _2475;
    out.m_85.z = _2477;
    out.m_87.x = _2503;
    out.m_87.y = _2491;
    out.m_87.z = _2501;
    out.m_87.w = _1890;
    float _2505 = (*spvDescriptorSet0.vp_c15)._m0[653].y;
    if (!_2489)
    {
        _2093 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _2507 = _2093;
    float _2509 = -_1944;
    float _2511 = _2509 + 1.0;
    float _2513 = _2437 * _1946;
    float _2515 = _2511 * _2479;
    float _2517 = precise::clamp(_2515, 0.0, 1.0);
    float _2519 = _1961 * _2513;
    float _2521 = _1961 * _2499;
    float _2523 = _1562 * _1616;
    float _2525 = -_2517;
    float _2527 = fma(_2525, (*spvDescriptorSet0.vp_c15)._m0[653].y, 1.0);
    float _2529 = _1971 * _2513;
    float _2531 = fma(_1967, _2519, _1955);
    float _2533 = fma(_1969, _2519, _1957);
    float _2535 = _2527 * _2455;
    float _2537 = fma(_1961, _2529, _1959);
    float _2539 = _2523 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _2541 = _2519;
    float _2543 = _2535;
    float _2545 = _2523;
    float _2547 = _2507;
    float _2549 = _2507;
    if (!_2489)
    {
        _2541 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _2551 = _2541;
    float _2553 = _2535 * (*spvDescriptorSet0.vp_c13)._m0[1].w;
    float _2555 = _2553;
    float _2557 = _2551;
    float _2559 = _2551;
    if (!_2489)
    {
        _2505 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _2561 = _2505;
    out.m_89.x = _2531;
    out.m_89.y = _2533;
    out.m_89.z = _2537;
    out.m_89.w = _2521;
    float _2563 = _2561;
    float _2565 = _2561;
    if (!_2489)
    {
        _2543 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _2567 = _2543;
    float _2569 = _2567;
    float _2571 = _2567;
    if (!_2489)
    {
        _2545 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _2573 = _2545;
    out.m_91.x = _2553;
    float _2575 = _2573;
    float _2577 = _2573;
    if (!_2489)
    {
        _2555 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _2579 = _2555;
    bool _2581 = !_2489;
    float _2583 = _2579;
    float _2585 = _2579;
    if (!_2581)
    {
        bool _2587 = _1784 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _2589 = isnan(_1784);
        bool _2591 = _2587 || _2589;
        bool _2593 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _2595 = _2591 || _2593;
        if (!_2595)
        {
            float _2597 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2599 = _1784 + _2597;
            float _2601 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2603 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _2601;
            float _2605 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _2607 = _2605 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _2609 = 1.0 / _2603;
            float _2611 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _2613 = _2611 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _2615 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _2617 = _2615 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _2619 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _2621 = _2619 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _2623 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _2625 = _2623 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _2627 = _2599 * _2609;
            float _2629 = precise::clamp(_2627, 0.0, 1.0);
            float _2631 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _2633 = _2631 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _2635 = fma(_2629, _2607, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _2637 = fma(_2629, _2633, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _2639 = fma(_2629, _2613, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _2641 = fma(_2629, _2617, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _2643 = fma(_2629, _2621, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _2645 = fma(_2629, _2625, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            _2559 = _2639;
            _2585 = _2643;
            _2549 = _2635;
            _2571 = _2641;
            _2565 = _2637;
            _2577 = _2645;
            _2647 = true;
        }
        else
        {
            bool _2649 = _1784 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _2651 = isnan(_1784);
            bool _2653 = _2649 || _2651;
            bool _2655 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _2657 = _2653 || _2655;
            if (!_2657)
            {
                _2547 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _2659 = _2547;
            _2549 = _2659;
            if (!_2657)
            {
                _2557 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _2661 = _2557;
            _2559 = _2661;
            if (!_2657)
            {
                _2563 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _2663 = _2563;
            _2565 = _2663;
            if (!_2657)
            {
                _2569 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _2665 = _2569;
            _2571 = _2665;
            if (!_2657)
            {
                _2583 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _2667 = _2583;
            _2585 = _2667;
            if (!_2657)
            {
                _2575 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _2669 = _2575;
            bool _2671 = !_2657;
            _2577 = _2669;
            if (!_2671)
            {
                bool _2673 = _1784 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _2675 = isnan(_1784);
                bool _2677 = _2673 || _2675;
                bool _2679 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _2681 = _2677 || _2679;
                if (!_2681)
                {
                    float _2683 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2685 = _1784 + _2683;
                    float _2687 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2689 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _2687;
                    float _2691 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _2693 = _2691 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _2695 = 1.0 / _2689;
                    float _2697 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _2699 = _2697 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _2701 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _2703 = _2701 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _2705 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _2707 = _2705 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _2709 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _2711 = _2709 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _2713 = _2685 * _2695;
                    float _2715 = precise::clamp(_2713, 0.0, 1.0);
                    float _2717 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _2719 = _2717 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _2721 = fma(_2715, _2693, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _2723 = fma(_2715, _2719, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _2725 = fma(_2715, _2699, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _2727 = fma(_2715, _2703, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _2729 = fma(_2715, _2707, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _2731 = fma(_2715, _2711, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    _2559 = _2725;
                    _2585 = _2729;
                    _2549 = _2721;
                    _2571 = _2727;
                    _2565 = _2723;
                    _2577 = _2731;
                    _2647 = true;
                }
                else
                {
                    _2559 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _2585 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _2549 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _2571 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _2565 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _2577 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _2647 = false;
    float _2733 = _2559;
    float _2735 = _2585;
    float _2737 = _2549;
    float _2739 = _2571;
    float _2741 = _2565;
    float _2743 = _2577;
    float _2745 = fma(_2475, -0.5, 0.5);
    float _2747 = precise::clamp(_2745, 0.0, 1.0);
    float _2749 = -_2733;
    float _2751 = _2749 + _2735;
    float _2753 = _2539 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _2755 = -_2737;
    float _2757 = _2755 + _2739;
    float _2759 = fma(_2747, _2751, _2733);
    out.m_93.x = 0.0;
    float _2761 = -_2741;
    float _2763 = _2761 + _2743;
    float _2765 = fma(_2747, _2757, _2737);
    float _2767 = _2759 * 0.586610972881317138671875;
    out.m_49.x = _2753;
    bool _2769 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _2771 = fma(_2747, _2763, _2741);
    float _2773 = fma(_2765, 0.298911988735198974609375, _2767);
    bool _2775 = _1562 > 0.0;
    bool _2777 = isnan(_1562);
    bool _2779 = _2775 || _2777;
    bool _2781 = isnan(0.0);
    bool _2783 = _2779 || _2781;
    float _2785 = fma(_2771, 0.114477999508380889892578125, _2773);
    bool _2787 = _1616 <= 0.0;
    bool _2789 = !_2783;
    bool _2791 = _2787 || _2789;
    float _2793 = -_2785;
    float _2795 = _2765 + _2793;
    float _2797 = -_2785;
    float _2799 = _2759 + _2797;
    float _2801 = -_2785;
    float _2803 = _2771 + _2801;
    float _2805 = fma(_2795, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2785);
    float _2807 = fma(_2799, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2785);
    float _2809 = fma(_2803, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2785);
    bool _2811 = !_2769;
    if (!_2811)
    {
        float _2813 = -_1500;
        float _2815 = _2813 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
        float _2817 = -_1502;
        float _2819 = _2817 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
        float _2821 = -_1504;
        float _2823 = _2821 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
        float _2825 = _2815 * _2815;
        float _2827 = fma(_2819, _2819, _2825);
        float _2829 = fma(_2823, _2823, _2827);
        float _2831 = sqrt(_2829);
        float _2833 = rsqrt(_2829);
        float _2835 = -_2831;
        float _2837 = _2835 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
        float _2839 = _2837 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
        float _2841 = precise::clamp(_2839, 0.0, 1.0);
        float _2843 = _2819 * _2833;
        float _2845 = _2815 * _2833;
        float _2847 = abs(_2841);
        float _2849 = log2(_2847);
        float _2851 = _2823 * _2833;
        float _2853 = _2843 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
        float _2855 = _2475 * _2845;
        float _2857 = -_2845;
        float _2859 = -_2853;
        float _2861 = fma(_2857, (*spvDescriptorSet0.vp_c15)._m0[656].y, _2859);
        float _2863 = fma(_2473, _2843, _2855);
        float _2865 = -_2851;
        float _2867 = fma(_2865, (*spvDescriptorSet0.vp_c15)._m0[656].z, _2861);
        float _2869 = fma(_2477, _2851, _2863);
        float _2871 = precise::clamp(_2869, 0.0, 1.0);
        float _2873 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
        float _2875 = _2867 + _2873;
        float _2877 = _2849 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
        float _2879 = _2875 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
        float _2881 = precise::clamp(_2879, 0.0, 1.0);
        float _2883 = exp2(_2877);
        float _2885 = _2883 * _2881;
        float _2887 = _2871 * _2885;
        float _2889 = _2887 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
        float _2891 = _2887 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
        float _2893 = _2887 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
        out.m_93.x = _2889;
        out.m_93.y = _2891;
        out.m_93.z = _2893;
    }
    out.m_71.x = _2805;
    out.m_71.y = _2807;
    out.m_71.z = _2809;
    if (!_2791)
    {
        return out;
    }
    out.m_49.x = 0.0;
    float _2895 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _2895;
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
    out.m_63 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_81 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_71 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_77 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_85 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_75 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_93 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_91 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_83 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_53 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_73 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_87 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_49 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_89 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_69 = float4(0.0, 0.0, 0.0, 1.0);
    bool _2647 = false;
    bool _692 = false;
    bool _554 = false;
    bool _446 = false;
    bool _218 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _107 = in.m_46.w;
    float _109 = trunc(_107);
    int _112 = int(_109);
    bool _116 = _112 >= 1;
    float _118 = 0.0;
    float _120 = as_type<float>(_112);
    if (!_116)
    {
        _118 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _122 = _118;
    if (!_116)
    {
        out.m_49.x = 0.0;
    }
    int _124 = 0;
    if (!_116)
    {
        float _126 = _122 * 5.0;
        _124 = as_type<int>(_126);
    }
    int _128 = _124;
    if (!_116)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2952 = as_type<float>(_128);
        out.gl_Position.z = _2952;
    }
    if (!_116)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_63.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_63.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_63.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_63.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_81.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_81.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_81.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_81.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_71.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_71.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_71.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_71.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_77.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_77.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_77.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_77.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_85.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_85.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_85.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_85.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_75.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_75.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_75.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_75.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_93.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_93.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_93.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_93.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_91.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_91.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_91.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_91.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_83.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_83.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_83.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_83.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_53.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_53.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_53.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_53.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_73.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_73.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_73.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_73.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_87.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_87.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_87.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_87.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_49.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_49.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_49.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_49.w)); dm_cw(dm_gs, dm_p, 68, as_type<uint>(out.m_89.x)); dm_cw(dm_gs, dm_p, 69, as_type<uint>(out.m_89.y)); dm_cw(dm_gs, dm_p, 70, as_type<uint>(out.m_89.z)); dm_cw(dm_gs, dm_p, 71, as_type<uint>(out.m_89.w)); dm_cw(dm_gs, dm_p, 72, as_type<uint>(out.m_69.x)); dm_cw(dm_gs, dm_p, 73, as_type<uint>(out.m_69.y)); dm_cw(dm_gs, dm_p, 74, as_type<uint>(out.m_69.z)); dm_cw(dm_gs, dm_p, 75, as_type<uint>(out.m_69.w)); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _130 = in.m_51.w;
    float _132 = float(_112);
    float _134 = 1.0 / _132;
    float _136 = -_130;
    float _138 = _136 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _140 = _130 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _142 = isnan(_130);
    bool _144 = _140 || _142;
    bool _146 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _148 = _144 || _146;
    float _150 = _138 * _134;
    bool _152 = _138 >= _132;
    bool _154 = !_148;
    bool _156 = _152 || _154;
    out.m_53.x = _150;
    if (_156)
    {
        _120 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _158 = _120;
    if (_156)
    {
        out.m_49.x = 0.0;
    }
    int _160 = 0;
    if (_156)
    {
        float _162 = _158 * 5.0;
        _160 = as_type<int>(_162);
    }
    int _164 = _160;
    if (_156)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _3022 = as_type<float>(_164);
        out.gl_Position.z = _3022;
    }
    if (_156)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_63.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_63.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_63.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_63.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_81.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_81.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_81.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_81.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_71.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_71.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_71.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_71.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_77.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_77.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_77.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_77.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_85.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_85.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_85.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_85.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_75.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_75.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_75.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_75.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_93.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_93.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_93.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_93.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_91.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_91.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_91.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_91.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_83.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_83.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_83.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_83.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_53.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_53.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_53.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_53.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_73.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_73.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_73.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_73.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_87.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_87.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_87.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_87.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_49.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_49.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_49.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_49.w)); dm_cw(dm_gs, dm_p, 68, as_type<uint>(out.m_89.x)); dm_cw(dm_gs, dm_p, 69, as_type<uint>(out.m_89.y)); dm_cw(dm_gs, dm_p, 70, as_type<uint>(out.m_89.z)); dm_cw(dm_gs, dm_p, 71, as_type<uint>(out.m_89.w)); dm_cw(dm_gs, dm_p, 72, as_type<uint>(out.m_69.x)); dm_cw(dm_gs, dm_p, 73, as_type<uint>(out.m_69.y)); dm_cw(dm_gs, dm_p, 74, as_type<uint>(out.m_69.z)); dm_cw(dm_gs, dm_p, 75, as_type<uint>(out.m_69.w)); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _166 = in.m_55.x;
    float _168 = in.m_55.y;
    float _170 = in.m_55.z;
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
    float _194 = _190;
    float _196 = _188;
    float _198 = _186;
    float _216;
    if (!_192)
    {
        float _200 = in.m_57.x;
        float _202 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _204 = _200 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _206 = fma(_204, (*spvDescriptorSet0.vp_c9)._m0[12].x, _138);
        float _208 = _206 * _202;
        float _210 = floor(_208);
        float _212 = -_210;
        float _214 = _208 + _212;
        _216 = _214;
        _218 = true;
    }
    else
    {
        _216 = _150;
    }
    _218 = false;
    float _220 = _216;
    float _222 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _224 = _220 + _222;
    float _226 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _228 = _220 + _226;
    float _230 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _232 = _220 + _230;
    float _234 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _236 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _234;
    float _238 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _240 = _238 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _242 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _244 = (*spvDescriptorSet0.vp_c9)._m0[146].w + _242;
    float _246 = 1.0 / _240;
    bool _248 = _220 >= (*spvDescriptorSet0.vp_c9)._m0[146].w;
    bool _250 = isnan(_220);
    bool _252 = _248 || _250;
    bool _254 = isnan((*spvDescriptorSet0.vp_c9)._m0[146].w);
    bool _256 = _252 || _254;
    float _258 = float(_256);
    bool _260 = _220 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _262 = isnan(_220);
    bool _264 = _260 || _262;
    bool _266 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _268 = _264 || _266;
    float _270 = float(_268);
    float _272 = 1.0 / _244;
    float _274 = -(*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _276 = (*spvDescriptorSet0.vp_c9)._m0[144].z + _274;
    bool _278 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].x;
    float _280 = 1.0 / _236;
    float _282 = _232 * _246;
    float _284 = -_258;
    float _286 = _284 + 1.0;
    float _288 = _224 * _272;
    bool _290 = _220 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _292 = isnan(_220);
    bool _294 = _290 || _292;
    bool _296 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _298 = _294 || _296;
    float _300 = float(_298);
    bool _302 = _220 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _304 = isnan(_220);
    bool _306 = _302 || _304;
    bool _308 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _310 = _306 || _308;
    float _312 = float(_310);
    float _314 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _316 = _314 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _318 = _300 * _286;
    float _320 = -_300;
    float _322 = _320 + 1.0;
    float _324 = _228 * _280;
    float _326 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _328 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _326;
    float _330 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _332 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _330;
    float _334 = fma(_276, _324, (*spvDescriptorSet0.vp_c9)._m0[143].z);
    float _336 = fma(_328, _324, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _338 = fma(_332, _324, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _340 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _342 = _340 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _344 = -(*spvDescriptorSet0.vp_c9)._m0[144].z;
    float _346 = _344 + (*spvDescriptorSet0.vp_c9)._m0[145].z;
    float _348 = -_312;
    float _350 = _348 + 1.0;
    float _352 = _312 * _322;
    float _354 = fma(_316, _282, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _356 = fma(_342, _282, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _358 = fma(_346, _282, (*spvDescriptorSet0.vp_c9)._m0[144].z);
    float _360 = _270 * _350;
    float _362 = in.m_59.x;
    float _364 = in.m_59.y;
    float _366 = in.m_59.z;
    float _368 = -_270;
    float _370 = _368 + 1.0;
    float _372 = _336 * _360;
    float _374 = _338 * _360;
    float _376 = _334 * _360;
    float _378 = -(*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _380 = (*spvDescriptorSet0.vp_c9)._m0[146].x + _378;
    float _382 = -(*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _384 = (*spvDescriptorSet0.vp_c9)._m0[146].y + _382;
    float _386 = fma(_370, (*spvDescriptorSet0.vp_c9)._m0[143].x, _372);
    float _388 = fma(_370, (*spvDescriptorSet0.vp_c9)._m0[143].y, _374);
    float _390 = -(*spvDescriptorSet0.vp_c9)._m0[145].z;
    float _392 = (*spvDescriptorSet0.vp_c9)._m0[146].z + _390;
    float _394 = fma(_370, (*spvDescriptorSet0.vp_c9)._m0[143].z, _376);
    float _396 = fma(_384, _288, (*spvDescriptorSet0.vp_c9)._m0[145].y);
    float _398 = fma(_356, _352, _388);
    float _400 = fma(_380, _288, (*spvDescriptorSet0.vp_c9)._m0[145].x);
    float _402 = fma(_392, _288, (*spvDescriptorSet0.vp_c9)._m0[145].z);
    float _404 = fma(_354, _352, _386);
    float _406 = fma(_358, _352, _394);
    float _408 = fma(_396, _318, _398);
    float _410 = fma(_400, _318, _404);
    float _412 = fma(_402, _318, _406);
    float _414 = fma(_258, (*spvDescriptorSet0.vp_c9)._m0[146].y, _408);
    float _416 = fma(_258, (*spvDescriptorSet0.vp_c9)._m0[146].x, _410);
    float _418 = fma(_258, (*spvDescriptorSet0.vp_c9)._m0[146].z, _412);
    float _420 = _414 * _364;
    float _422 = _416 * _362;
    float _424 = _418 * _366;
    bool _426 = !_278;
    float _444;
    if (!_426)
    {
        float _428 = in.m_57.x;
        float _430 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].x;
        float _432 = _428 * (*spvDescriptorSet0.vp_c9)._m0[12].y;
        float _434 = fma(_432, (*spvDescriptorSet0.vp_c9)._m0[11].x, _138);
        float _436 = _434 * _430;
        float _438 = floor(_436);
        float _440 = -_438;
        float _442 = _436 + _440;
        _444 = _442;
        _446 = true;
    }
    else
    {
        _444 = _150;
    }
    _446 = false;
    float _448 = _444;
    float _450 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _452 = _448 + _450;
    bool _454 = _448 >= (*spvDescriptorSet0.vp_c9)._m0[108].w;
    bool _456 = isnan(_448);
    bool _458 = _454 || _456;
    bool _460 = isnan((*spvDescriptorSet0.vp_c9)._m0[108].w);
    bool _462 = _458 || _460;
    float _464 = float(_462);
    float _466 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _468 = (*spvDescriptorSet0.vp_c9)._m0[108].w + _466;
    bool _470 = _448 >= (*spvDescriptorSet0.vp_c9)._m0[107].w;
    bool _472 = isnan(_448);
    bool _474 = _470 || _472;
    bool _476 = isnan((*spvDescriptorSet0.vp_c9)._m0[107].w);
    bool _478 = _474 || _476;
    float _480 = float(_478);
    float _482 = -_464;
    float _484 = _482 + 1.0;
    float _486 = -(*spvDescriptorSet0.vp_c9)._m0[107].x;
    float _488 = (*spvDescriptorSet0.vp_c9)._m0[108].x + _486;
    float _490 = 1.0 / _468;
    bool _492 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _494 = _480 * _484;
    float _496 = -_480;
    float _498 = _496 + 1.0;
    float _500 = _452 * _490;
    float _502 = -(*spvDescriptorSet0.vp_c9)._m0[107].z;
    float _504 = (*spvDescriptorSet0.vp_c9)._m0[108].z + _502;
    float _506 = fma(_488, _500, (*spvDescriptorSet0.vp_c9)._m0[107].x);
    float _508 = -(*spvDescriptorSet0.vp_c9)._m0[107].y;
    float _510 = (*spvDescriptorSet0.vp_c9)._m0[108].y + _508;
    float _512 = fma(_504, _500, (*spvDescriptorSet0.vp_c9)._m0[107].z);
    float _514 = _506 * _494;
    float _516 = fma(_510, _500, (*spvDescriptorSet0.vp_c9)._m0[107].y);
    float _518 = _512 * _494;
    float _520 = _516 * _494;
    float _522 = fma(_498, (*spvDescriptorSet0.vp_c9)._m0[107].x, _514);
    float _524 = fma(_498, (*spvDescriptorSet0.vp_c9)._m0[107].y, _520);
    float _526 = fma(_498, (*spvDescriptorSet0.vp_c9)._m0[107].z, _518);
    float _528 = fma(_464, (*spvDescriptorSet0.vp_c9)._m0[108].x, _522);
    float _530 = fma(_464, (*spvDescriptorSet0.vp_c9)._m0[108].y, _524);
    float _532 = fma(_464, (*spvDescriptorSet0.vp_c9)._m0[108].z, _526);
    bool _534 = !_492;
    float _552;
    if (!_534)
    {
        float _536 = in.m_57.x;
        float _538 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _540 = _536 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _542 = fma(_540, (*spvDescriptorSet0.vp_c9)._m0[11].y, _138);
        float _544 = _542 * _538;
        float _546 = floor(_544);
        float _548 = -_546;
        float _550 = _544 + _548;
        _552 = _550;
        _554 = true;
    }
    else
    {
        _552 = _150;
    }
    _554 = false;
    float _556 = _552;
    float _558 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _560 = _556 + _558;
    float _562 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _564 = _562 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _566 = _556 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _568 = isnan(_556);
    bool _570 = _566 || _568;
    bool _572 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _574 = _570 || _572;
    float _576 = float(_574);
    float _578 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _580 = _578 + (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _582 = _556 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _584 = isnan(_556);
    bool _586 = _582 || _584;
    bool _588 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _590 = _586 || _588;
    float _592 = float(_590);
    float _594 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _596 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _594;
    bool _598 = _556 >= (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _600 = isnan(_556);
    bool _602 = _598 || _600;
    bool _604 = isnan((*spvDescriptorSet0.vp_c9)._m0[117].w);
    bool _606 = _602 || _604;
    float _608 = float(_606);
    float _610 = 1.0 / _564;
    float _612 = -_576;
    float _614 = _612 + 1.0;
    bool _616 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].w;
    float _618 = _592 * _614;
    float _620 = -_592;
    float _622 = _620 + 1.0;
    float _624 = 1.0 / _580;
    float _626 = _596 * _610;
    float _628 = -(*spvDescriptorSet0.vp_c9)._m0[116].x;
    float _630 = _628 + (*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _632 = _528 * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _634 = _530 * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _636 = fma(_626, _560, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _638 = _532 * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _640 = _632 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _642 = _634 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _644 = _630 * _624;
    float _646 = _636 * _618;
    float _648 = -_608;
    float _650 = _648 + 1.0;
    float _652 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _654 = _556 + _652;
    float _656 = _638 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _658 = fma(_622, (*spvDescriptorSet0.vp_c9)._m0[115].x, _646);
    float _660 = _576 * _650;
    float _662 = fma(_644, _654, (*spvDescriptorSet0.vp_c9)._m0[116].x);
    float _664 = fma(_662, _660, _658);
    float _666 = fma(_608, (*spvDescriptorSet0.vp_c9)._m0[117].x, _664);
    float _668 = _666 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    bool _670 = !_616;
    float _672 = _668;
    float _690;
    if (!_670)
    {
        float _674 = in.m_57.x;
        float _676 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].w;
        float _678 = _674 * (*spvDescriptorSet0.vp_c9)._m0[13].x;
        float _680 = fma(_678, (*spvDescriptorSet0.vp_c9)._m0[11].w, _138);
        float _682 = _680 * _676;
        float _684 = floor(_682);
        float _686 = -_684;
        float _688 = _682 + _686;
        _690 = _688;
        _692 = true;
    }
    else
    {
        _690 = _150;
    }
    _692 = false;
    float _694 = _690;
    float _696 = in.m_46.x;
    float _698 = in.m_46.y;
    float _700 = in.m_46.z;
    float _702 = _422 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _704 = _420 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _706 = _702 * (*spvDescriptorSet0.vp_c13)._m0[2].y;
    float _708 = (*spvDescriptorSet0.vp_c8)._m0[28].y * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _710 = _424 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _712 = -(*spvDescriptorSet0.vp_c9)._m0[193].w;
    float _714 = _712 + (*spvDescriptorSet0.vp_c9)._m0[194].x;
    float _716 = fma(_150, _714, (*spvDescriptorSet0.vp_c9)._m0[193].w);
    float _718 = _698 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _720 = _698 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _722 = _698 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _724 = fma(_696, (*spvDescriptorSet0.vp_c10)._m0[5].x, _718);
    float _726 = fma(_696, (*spvDescriptorSet0.vp_c10)._m0[4].x, _720);
    float _728 = fma(_696, (*spvDescriptorSet0.vp_c10)._m0[6].x, _722);
    float _730 = fma(_700, (*spvDescriptorSet0.vp_c10)._m0[5].z, _724);
    float _732 = fma(_700, (*spvDescriptorSet0.vp_c10)._m0[4].z, _726);
    float _734 = fma(_700, (*spvDescriptorSet0.vp_c10)._m0[6].z, _728);
    float _736 = _730 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _738 = _732 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _740 = _734 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _742 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _744 = _736 + _742;
    float _746 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _748 = _738 + _746;
    float _750 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _752 = _740 + _750;
    float _754 = -_736;
    float _756 = _754 + (*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _758 = _744 * _744;
    float _760 = -_738;
    float _762 = _760 + (*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _764 = -_740;
    float _766 = _764 + (*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _768 = fma(_748, _748, _758);
    float _770 = fma(_752, _752, _768);
    float _772 = sqrt(_770);
    float _774 = rsqrt(_770);
    float _776 = _772 * (*spvDescriptorSet0.vp_c13)._m0[2].x;
    float _778 = fma((*spvDescriptorSet0.vp_c8)._m0[28].x, (*spvDescriptorSet0.vp_c8)._m0[28].x, _708);
    float _780 = _736 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _782 = precise::min(_706, _776);
    float _784 = _756 * _756;
    float _786 = (*spvDescriptorSet0.vp_c8)._m0[0].y * (*spvDescriptorSet0.vp_c10)._m0[9].w;
    float _788 = fma(_738, (*spvDescriptorSet0.vp_c8)._m0[0].x, _780);
    float _790 = fma(_762, _762, _784);
    float _792 = _774 * _782;
    float _794 = fma((*spvDescriptorSet0.vp_c8)._m0[0].x, (*spvDescriptorSet0.vp_c10)._m0[8].w, _786);
    float _796 = fma(_766, _766, _790);
    float _798 = _744 * _792;
    float _800 = fma(_740, (*spvDescriptorSet0.vp_c8)._m0[0].z, _788);
    float _802 = _748 * _792;
    float _804 = rsqrt(_796);
    float _806 = fma((*spvDescriptorSet0.vp_c8)._m0[0].z, (*spvDescriptorSet0.vp_c10)._m0[10].w, _794);
    float _808 = -_798;
    float _810 = _744 + _808;
    float _812 = _800 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _814 = -_802;
    float _816 = _748 + _814;
    float _818 = _806 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _820 = _810 * _810;
    float _822 = -(*spvDescriptorSet0.vp_c9)._m0[194].y;
    float _824 = (*spvDescriptorSet0.vp_c9)._m0[194].z + _822;
    float _826 = _752 * _792;
    float _828 = -_812;
    float _830 = _818 + _828;
    float _832 = fma(_816, _816, _820);
    float _834 = 1.0 / _824;
    float _836 = -_826;
    float _838 = _752 + _836;
    bool _840 = _812 >= _818;
    bool _842 = isnan(_812);
    bool _844 = _840 || _842;
    bool _846 = isnan(_818);
    bool _848 = _844 || _846;
    float _850 = abs(_830);
    float _852 = precise::max(_850, (*spvDescriptorSet0.vp_c9)._m0[194].y);
    float _854 = _762 * _804;
    float _856 = _766 * _804;
    float _858 = _756 * _804;
    float _860 = precise::min(_852, (*spvDescriptorSet0.vp_c9)._m0[194].z);
    float _862 = -(*spvDescriptorSet0.vp_c8)._m0[1].z;
    float _864 = _854 * _862;
    float _866 = -(*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _868 = _856 * _866;
    float _870 = sqrt(_796);
    float _872 = -(*spvDescriptorSet0.vp_c8)._m0[1].x;
    float _874 = _858 * _872;
    float _876 = -(*spvDescriptorSet0.vp_c8)._m0[1].x;
    float _878 = -_864;
    float _880 = fma(_856, _876, _878);
    float _882 = -(*spvDescriptorSet0.vp_c8)._m0[1].z;
    float _884 = -_868;
    float _886 = fma(_858, _882, _884);
    float _888 = fma(_838, _838, _832);
    float _890 = -(*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _892 = -_874;
    float _894 = fma(_854, _890, _892);
    float _896 = _880 * _880;
    float _898 = in.m_61.x;
    float _900 = in.m_61.y;
    float _902 = in.m_61.z;
    float _904 = -(*spvDescriptorSet0.vp_c9)._m0[194].y;
    float _906 = _860 + _904;
    float _908 = fma(_886, _886, _896);
    float _910 = sqrt(_888);
    float _912 = _906 * _834;
    float _914 = fma(_894, _894, _908);
    bool _916 = !_848;
    float _918 = _916 ? 1.0 : (-1.0);
    float _920 = abs(_870);
    float _922 = precise::max(0.0, _920);
    float _924 = rsqrt(_914);
    float _926 = fma((*spvDescriptorSet0.vp_c8)._m0[28].z, (*spvDescriptorSet0.vp_c8)._m0[28].z, _778);
    float _928 = precise::min(_922, 40.0);
    float _930 = _918 * _912;
    float _932 = _150 * (*spvDescriptorSet0.vp_c9)._m0[194].w;
    float _934 = fma(_928, -0.02500000037252902984619140625, 1.0);
    float _936 = _774 * _910;
    float _938 = rsqrt(_926);
    float _940 = _932 * _930;
    float _942 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _900);
    float _944 = _704 * _936;
    float _946 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _902);
    float _948 = _710 * _936;
    float _950 = _894 * _924;
    float _952 = _886 * _924;
    float _954 = _880 * _924;
    float _956 = _944 * _942;
    float _958 = _854 * _950;
    float _960 = _702 * _936;
    float _962 = _856 * _954;
    float _964 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _898);
    float _966 = -_958;
    float _968 = fma(_856, _952, _966);
    float _970 = _948 * _946;
    float _972 = -_962;
    float _974 = fma(_858, _950, _972);
    float _976 = _858 * _952;
    float _978 = _960 * _964;
    float _980 = _956 * _968;
    float _982 = _938 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _984 = _956 * _974;
    float _986 = -_976;
    float _988 = fma(_854, _954, _986);
    float _990 = fma(_978, _954, _980);
    float _992 = _938 * (*spvDescriptorSet0.vp_c8)._m0[28].x;
    float _994 = _982 * _982;
    float _996 = fma(_978, _952, _984);
    float _998 = _956 * _988;
    float _1000 = fma(_970, _858, _990);
    float _1002 = _938 * (*spvDescriptorSet0.vp_c8)._m0[28].z;
    float _1004 = fma(_992, _992, _994);
    float _1006 = fma(_978, _950, _998);
    float _1008 = fma(_970, _854, _996);
    float _1010 = _736 + _1000;
    float _1012 = fma(_1002, _1002, _1004);
    float _1014 = _940 * 0.15915493667125701904296875;
    float _1016 = _736 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1018 = fma(_970, _856, _1006);
    float _1020 = _738 + _1008;
    float _1022 = _1010 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1024 = _1010 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1026 = _1010 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1028 = fma(_738, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1016);
    float _1030 = _740 + _1018;
    float _1032 = fma(_1020, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1022);
    float _1034 = fma(_1020, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1024);
    float _1036 = fma(_1020, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1026);
    float _1038 = rsqrt(_1012);
    float _1040 = fma(_740, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1028);
    float _1042 = fma(_1030, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1034);
    float _1044 = fma(_1030, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1036);
    float _1046 = fma(_1030, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1032);
    float _1048 = _1040 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1050 = _1042 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1052 = _1044 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1054 = _1014 * 6.283185482025146484375;
    float _1056 = cos(_1054);
    float _1058 = _1046 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1060 = -_1050;
    float _1062 = _1060 + _1048;
    float _1064 = _1052 * (*spvDescriptorSet0.vp_c8)._m0[13].y;
    float _1066 = _1052 * (*spvDescriptorSet0.vp_c8)._m0[12].y;
    float _1068 = _1052 * (*spvDescriptorSet0.vp_c8)._m0[14].y;
    float _1070 = fma(_934, _1062, _1050);
    float _1072 = fma(_1058, (*spvDescriptorSet0.vp_c8)._m0[13].x, _1064);
    float _1074 = _1014 * 6.283185482025146484375;
    float _1076 = sin(_1074);
    float _1078 = fma(_1058, (*spvDescriptorSet0.vp_c8)._m0[12].x, _1066);
    float _1080 = fma(_1058, (*spvDescriptorSet0.vp_c8)._m0[14].x, _1068);
    float _1082 = fma(_1070, (*spvDescriptorSet0.vp_c8)._m0[13].z, _1072);
    float _1084 = fma(_1070, (*spvDescriptorSet0.vp_c8)._m0[12].z, _1078);
    float _1086 = fma(_1070, (*spvDescriptorSet0.vp_c8)._m0[14].z, _1080);
    float _1088 = -_1056;
    float _1090 = _1088 + 1.0;
    float _1092 = _992 * _1038;
    float _1094 = _982 * _1038;
    float _1096 = _1002 * _1038;
    float _1098 = _1084 + (*spvDescriptorSet0.vp_c8)._m0[12].w;
    float _1100 = _1094 * _1090;
    float _1102 = _1096 * _1096;
    float _1104 = _1092 * _1076;
    float _1106 = _1094 * _1076;
    float _1108 = _1096 * _1076;
    float _1110 = _1082 + (*spvDescriptorSet0.vp_c8)._m0[13].w;
    float _1112 = fma(_1090, _1102, _1056);
    float _1114 = _1092 * _1090;
    float _1116 = fma(_1096, _1100, _1104);
    float _1118 = -_736;
    float _1120 = _1118 + _1110;
    float _1122 = -_738;
    float _1124 = _1122 + _1098;
    float _1126 = -_1106;
    float _1128 = fma(_1096, _1114, _1126);
    float _1130 = -_1108;
    float _1132 = fma(_1094, _1114, _1130);
    float _1134 = _1116 * _1120;
    float _1136 = _1086 + (*spvDescriptorSet0.vp_c8)._m0[14].w;
    float _1138 = fma(_1092, _1114, _1056);
    float _1140 = _1132 * _1120;
    float _1142 = fma(_1128, _1124, _1134);
    float _1144 = -_740;
    float _1146 = _1144 + _1136;
    float _1148 = fma(_1096, _1114, _1106);
    float _1150 = fma(_1138, _1124, _1140);
    float _1152 = fma(_1094, _1100, _1056);
    float _1154 = fma(_1112, _1146, _1142);
    float _1156 = fma(_1094, _1114, _1108);
    float _1158 = fma(_1148, _1146, _1150);
    float _1160 = _1152 * _1120;
    float _1162 = fma(_1154, _716, _740);
    float _1164 = -_798;
    float _1166 = _736 + _1164;
    float _1168 = fma(_1158, _716, _738);
    float _1170 = -_1104;
    float _1172 = fma(_1096, _1100, _1170);
    float _1174 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1176 = _1162 + _1174;
    float _1178 = fma(_1156, _1124, _1160);
    float _1180 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1182 = _1168 + _1180;
    float _1184 = _1166 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _1186 = _1176 * _1176;
    float _1188 = fma(_1172, _1146, _1178);
    float _1190 = -_826;
    float _1192 = _740 + _1190;
    float _1194 = fma(_1182, _1182, _1186);
    float _1196 = -_802;
    float _1198 = _738 + _1196;
    float _1200 = _736 + _1188;
    float _1202 = sqrt(_1194);
    float _1204 = fma(_1198, (*spvDescriptorSet0.vp_c8)._m0[11].x, _1184);
    float _1206 = fma(_1192, (*spvDescriptorSet0.vp_c8)._m0[11].z, _1204);
    bool _1208 = _1202 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1210 = _1188;
    float _1212 = _1204;
    float _1214 = _1156;
    float _1216 = _1200;
    if (!_1208)
    {
        _1210 = _1168;
    }
    float _1218 = _1210;
    float _1220 = _1218;
    if (!_1208)
    {
        _1212 = _1162;
    }
    float _1222 = _1212;
    float _1224 = _1222;
    if (!_1208)
    {
        _1214 = _1200;
    }
    float _1226 = _1214;
    bool _1228 = !_1208;
    float _1230 = _1226;
    if (!_1228)
    {
        float _1232 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1234 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1236 = _1202 + _1234;
        float _1238 = _1200 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1240 = rsqrt(_1194);
        float _1242 = _1236 * _1232;
        float _1244 = _1242 * 0.15915493667125701904296875;
        float _1246 = _1244 * 6.283185482025146484375;
        float _1248 = cos(_1246);
        float _1250 = _1244 * 6.283185482025146484375;
        float _1252 = sin(_1250);
        float _1254 = _1248 + (-1.0);
        float _1256 = _1254 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1258 = fma(_1252, _1238, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1260 = fma(_1200, _1248, _1256);
        float _1262 = _1240 * _1258;
        float _1264 = fma(_1182, _1262, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1266 = fma(_1176, _1262, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _1230 = _1260;
        _1220 = _1264;
        _1224 = _1266;
    }
    float _1268 = _1230;
    float _1270 = _1220;
    float _1272 = _1224;
    float _1274 = -_736;
    float _1276 = _1274 + _1268;
    float _1278 = -_738;
    float _1280 = _1278 + _1270;
    float _1282 = _1206 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _1284 = _1166 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _1286 = _1276 * _1276;
    float _1288 = -_740;
    float _1290 = _1288 + _1272;
    float _1292 = 1.0 / _1282;
    float _1294 = fma(_1198, (*spvDescriptorSet0.vp_c8)._m0[10].x, _1284);
    float _1296 = fma(_1280, _1280, _1286);
    float _1298 = -_802;
    float _1300 = _1298 + _1270;
    float _1302 = fma(_1192, (*spvDescriptorSet0.vp_c8)._m0[10].z, _1294);
    float _1304 = fma(_1290, _1290, _1296);
    float _1306 = -_798;
    float _1308 = _1306 + _1268;
    float _1310 = -_826;
    float _1312 = _1310 + _1272;
    float _1314 = _1302 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _1316 = sqrt(_1304);
    float _1318 = _1314 + _1282;
    float _1320 = _1318 * _1292;
    float _1322 = _1320 * 0.5;
    float _1324 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _1326 = fma(_1322, (*spvDescriptorSet0.vp_c8)._m0[30].w, _1324);
    bool _1328 = _1316 > 0.0;
    float _1330 = 1.0 / _1326;
    bool _1332 = (*spvDescriptorSet0.vp_c15)._m0[653].w >= 0.5;
    bool _1334 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _1336 = _1332 || _1334;
    bool _1338 = isnan(0.5);
    bool _1340 = _1336 || _1338;
    bool _1342 = (*spvDescriptorSet0.vp_c15)._m0[660].y >= 0.5;
    bool _1344 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _1346 = _1342 || _1344;
    bool _1348 = isnan(0.5);
    bool _1350 = _1346 || _1348;
    float _1352 = (*spvDescriptorSet0.vp_c15)._m0[653].w;
    float _1354 = (*spvDescriptorSet0.vp_c8)._m0[30].w;
    float _1356 = (*spvDescriptorSet0.vp_c15)._m0[660].y;
    if (!_1328)
    {
        _1352 = _1300;
    }
    float _1358 = _1352;
    float _1360 = _1358;
    if (!_1328)
    {
        _1354 = _1308;
    }
    float _1362 = _1354;
    float _1364 = _1362;
    float _1366 = _1362;
    if (!_1328)
    {
        _1356 = _1312;
    }
    float _1368 = _1356;
    bool _1370 = !_1328;
    float _1372 = _1368;
    if (!_1370)
    {
        float _1374 = _188 * _188;
        float _1376 = fma(_186, _186, _1374);
        float _1378 = fma(_190, _190, _1376);
        float _1380 = rsqrt(_1304);
        float _1382 = sqrt(_1378);
        float _1384 = _1280 * _1380;
        float _1386 = _1276 * _1380;
        float _1388 = _1290 * _1380;
        bool _1390 = _1382 > 0.0;
        float _1392 = _1382;
        float _1394 = _1380;
        if (!_1390)
        {
            _1392 = _1300;
        }
        float _1396 = _1392;
        _1360 = _1396;
        if (!_1390)
        {
            _1364 = _1308;
        }
        float _1398 = _1364;
        _1366 = _1398;
        if (!_1390)
        {
            _1394 = _1312;
        }
        float _1400 = _1394;
        bool _1402 = !_1390;
        _1372 = _1400;
        if (!_1402)
        {
            float _1404 = rsqrt(_1378);
            float _1406 = 1.0 / (*spvDescriptorSet0.vp_c10)._m0[2].z;
            float _1408 = _188 * _1404;
            float _1410 = _186 * _1404;
            float _1412 = _190 * _1404;
            float _1414 = _1386 * _1408;
            float _1416 = fma(_1384, _1410, _1414);
            float _1418 = _1406 * (*spvDescriptorSet0.vp_c9)._m0[142].x;
            float _1420 = fma(_1388, _1412, _1416);
            float _1422 = _1420 * _1418;
            float _1424 = fma(_186, _1422, _1300);
            float _1426 = fma(_188, _1422, _1308);
            float _1428 = fma(_190, _1422, _1312);
            _1360 = _1424;
            _1366 = _1426;
            _1372 = _1428;
        }
    }
    float _1430 = _1360;
    float _1432 = _1366;
    float _1434 = _1372;
    float _1436 = _1434;
    if (_1340)
    {
        _194 = 1.0;
    }
    float _1438 = _194;
    float _1440 = _1438;
    if (_1350)
    {
        _196 = _1430;
    }
    float _1442 = _196;
    float _1444 = _1442;
    if (_1350)
    {
        _198 = _1432;
    }
    float _1446 = _198;
    float _1448 = _1446;
    if (!_1350)
    {
        float _1450 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
        float _1452 = _1166 + _1450;
        float _1454 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
        float _1456 = _1198 + _1454;
        float _1458 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1460 = -_1198;
        float _1462 = _1460 + _1430;
        float _1464 = _1452 * _1452;
        float _1466 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
        float _1468 = _1192 + _1466;
        float _1470 = -_1166;
        float _1472 = _1470 + _1432;
        float _1474 = fma(_1456, _1456, _1464);
        float _1476 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _1478 = fma(_1468, _1468, _1474);
        float _1480 = sqrt(_1478);
        float _1482 = _1458 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1484 = -_1192;
        float _1486 = _1484 + _1434;
        float _1488 = precise::min(_1480, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _1490 = _1488 * _1476;
        float _1492 = _1482 * _1490;
        float _1494 = fma(_1462, _1492, _1198);
        float _1496 = fma(_1472, _1492, _1166);
        float _1498 = fma(_1486, _1492, _1192);
        _1448 = _1496;
        _1444 = _1494;
        _1436 = _1498;
    }
    float _1500 = _1448;
    float _1502 = _1444;
    float _1504 = _1436;
    if (_1340)
    {
        _1216 = 1.0;
    }
    float _1506 = _1216;
    float _1508 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _1510 = _1330 * _1508;
    float _1512 = _1506;
    if (!_1340)
    {
        float _1514 = (*spvDescriptorSet0.vp_c8)._m0[31].x * 0.5;
        float _1516 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1518 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _1516;
        float _1520 = _1514 * 0.15915493667125701904296875;
        float _1522 = _1520 * 6.283185482025146484375;
        float _1524 = cos(_1522);
        float _1526 = (*spvDescriptorSet0.vp_c8)._m0[31].y * 0.5;
        float _1528 = _1526 * 0.15915493667125701904296875;
        float _1530 = _1520 * 6.283185482025146484375;
        float _1532 = sin(_1530);
        float _1534 = 1.0 / _1524;
        float _1536 = _1528 * 6.283185482025146484375;
        float _1538 = cos(_1536);
        float _1540 = _1532 * _1534;
        float _1542 = _1528 * 6.283185482025146484375;
        float _1544 = sin(_1542);
        float _1546 = _1538 * _1540;
        float _1548 = 1.0 / _1518;
        float _1550 = 1.0 / _1546;
        float _1552 = _1544 * _1550;
        float _1554 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1556 = fma(_1510, _1552, _1554);
        float _1558 = _1556 * _1548;
        float _1560 = precise::clamp(_1558, 0.0, 1.0);
        _1440 = _1560;
    }
    float _1562 = _1440;
    if (!_1340)
    {
        float _1564 = (*spvDescriptorSet0.vp_c8)._m0[31].x * 0.5;
        float _1566 = _1564 * 0.15915493667125701904296875;
        float _1568 = _1566 * 6.283185482025146484375;
        float _1570 = cos(_1568);
        float _1572 = (*spvDescriptorSet0.vp_c8)._m0[31].y * 0.5;
        float _1574 = _1572 * 0.15915493667125701904296875;
        float _1576 = _1566 * 6.283185482025146484375;
        float _1578 = sin(_1576);
        float _1580 = 1.0 / _1570;
        float _1582 = _1574 * 6.283185482025146484375;
        float _1584 = cos(_1582);
        float _1586 = _1578 * _1580;
        float _1588 = _1574 * 6.283185482025146484375;
        float _1590 = sin(_1588);
        float _1592 = _1584 * _1586;
        float _1594 = 1.0 / _1592;
        float _1596 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _1598 = (*spvDescriptorSet0.vp_c9)._m0[140].w + _1596;
        float _1600 = 1.0 / _1598;
        float _1602 = _1590 * _1594;
        float _1604 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _1606 = fma(_1510, _1602, _1604);
        float _1608 = _1606 * _1600;
        float _1610 = precise::clamp(_1608, 0.0, 1.0);
        float _1612 = -_1610;
        float _1614 = _1612 + 1.0;
        _1512 = _1614;
    }
    float _1616 = _1512;
    float _1618 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1620 = _1500 + _1618;
    float _1622 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1624 = _1502 + _1622;
    float _1626 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1628 = _1504 + _1626;
    float _1630 = _1500 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1632 = _1620 * _1620;
    float _1634 = fma(_1502, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1630);
    float _1636 = fma(_1624, _1624, _1632);
    float _1638 = fma(_1504, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1634);
    float _1640 = fma(_1628, _1628, _1636);
    float _1642 = _1638 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1644 = rsqrt(_1640);
    float _1646 = _1644 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1648 = _1624 * _1646;
    float _1650 = _1628 * _1646;
    float _1652 = _1648 * _1648;
    float _1654 = _1650 * _1650;
    float _1656 = _1652 + _1654;
    float _1658 = sqrt(_1656);
    bool _1660 = _1658 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1662 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1664 = _1658 + _1662;
    float _1666 = _1312;
    float _1668 = _1656;
    float _1670 = _1664;
    float _1672 = _1620;
    float _1674 = _1646;
    float _1676 = _1648;
    if (_1660)
    {
        float _1678 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1666 = _1678;
    }
    float _1680 = _1666;
    if (_1660)
    {
        float _1682 = rsqrt(_1656);
        _1668 = _1682;
    }
    float _1684 = _1668;
    float _1686 = _1680;
    float _1688 = _1684;
    if (_1660)
    {
        float _1690 = _1664 * _1680;
        _1670 = _1690;
    }
    float _1692 = _1670;
    if (_1660)
    {
        float _1694 = _1692 * 0.15915493667125701904296875;
        _1686 = _1694;
    }
    float _1696 = _1686;
    float _1698 = _1644;
    float _1700 = _1696;
    if (_1660)
    {
        float _1702 = _1696 * 6.283185482025146484375;
        float _1704 = sin(_1702);
        _1698 = _1704;
    }
    float _1706 = _1698;
    float _1708 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _1710 = precise::max(0.0, _1708);
    float _1712 = _1628;
    float _1714 = _1710;
    if (_1660)
    {
        float _1716 = _1696 * 6.283185482025146484375;
        float _1718 = cos(_1716);
        _1712 = _1718;
    }
    float _1720 = _1712;
    float _1722 = -_1646;
    float _1724 = -_1710;
    float _1726 = fma(_1620, _1722, _1724);
    float _1728 = _1726;
    if (_1660)
    {
        float _1730 = _1726 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1672 = _1730;
    }
    float _1732 = _1672;
    float _1734 = _1732;
    if (!_1660)
    {
        _1700 = _1648;
    }
    float _1736 = _1700;
    float _1738 = _1706;
    float _1740 = _1736;
    if (_1660)
    {
        float _1742 = fma(_1706, _1732, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1738 = _1742;
    }
    float _1744 = _1738;
    float _1746 = _1744;
    if (_1660)
    {
        float _1748 = _1720 + (-1.0);
        _1714 = _1748;
    }
    float _1750 = _1714;
    if (_1660)
    {
        float _1752 = _1684 * _1744;
        _1674 = _1752;
    }
    float _1754 = _1674;
    if (!_1660)
    {
        _1746 = _1650;
    }
    float _1756 = _1746;
    float _1758 = _1756;
    if (_1660)
    {
        float _1760 = _1750 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1734 = _1760;
    }
    float _1762 = _1734;
    if (_1660)
    {
        float _1764 = _1648 * _1754;
        _1740 = _1764;
    }
    float _1766 = _1740;
    if (!_1660)
    {
        _1688 = _1652;
    }
    float _1768 = _1688;
    float _1770 = _1768;
    if (_1660)
    {
        float _1772 = _1650 * _1754;
        _1758 = _1772;
    }
    float _1774 = _1758;
    if (_1660)
    {
        float _1776 = fma(_1726, _1720, _1762);
        _1728 = _1776;
    }
    float _1778 = _1728;
    if (_1660)
    {
        float _1780 = _1766 * _1766;
        _1770 = _1780;
    }
    float _1782 = _1770;
    float _1784 = sqrt(_1640);
    if (!_1660)
    {
        _1676 = _1654;
    }
    float _1786 = _1676;
    float _1788 = _1786;
    if (_1660)
    {
        float _1790 = _1774 * _1774;
        _1788 = _1790;
    }
    float _1792 = _1788;
    float _1794 = fma(_1778, _1778, _1782);
    float _1796 = _1500 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1798 = _1794 + _1792;
    float _1800 = fma(_1502, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1796);
    float _1802 = fma(_1198, (*spvDescriptorSet0.vp_c15)._m0[652].x, (*spvDescriptorSet0.vp_c15)._m0[652].z);
    float _1804 = rsqrt(_1798);
    float _1806 = fma(_1504, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1800);
    float _1808 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _1810 = fma(_1784, (*spvDescriptorSet0.vp_c15)._m0[23].w, _1808);
    float _1812 = precise::clamp(_1810, 0.0, 1.0);
    float _1814 = _1806 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1816 = floor(_1802);
    float _1818 = -_1812;
    float _1820 = _1818 + 1.0;
    float _1822 = _1500 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1824 = fma(_1192, (*spvDescriptorSet0.vp_c15)._m0[652].y, (*spvDescriptorSet0.vp_c15)._m0[652].w);
    float _1826 = _1500 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1828 = fma(_1502, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1822);
    float _1830 = _1814 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _1832 = abs(_1820);
    float _1834 = log2(_1832);
    float _1836 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _1838 = _1804 * _1766;
    float _1840 = fma(_1502, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1826);
    float _1842 = fma(_1504, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1828);
    float _1844 = -_1830;
    float _1846 = fma(_1844, _1836, 1.0);
    float _1848 = _1804 * _1778;
    float _1850 = _1838 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _1852 = fma(_1504, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1840);
    float _1854 = _1842 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1856 = _1804 * _1774;
    float _1858 = -_1850;
    float _1860 = fma(_1848, (*spvDescriptorSet0.vp_c15)._m0[21].y, _1858);
    float _1862 = _1852 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1864 = _1854 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1866 = floor(_1824);
    float _1868 = -_1856;
    float _1870 = fma(_1868, (*spvDescriptorSet0.vp_c15)._m0[21].z, _1860);
    float _1872 = _1834 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _1874 = fma(_1862, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1864);
    float _1876 = -_1816;
    float _1878 = _1802 + _1876;
    float _1880 = fma(_1870, -0.5, 0.5);
    float _1882 = fma(_1814, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1874);
    float _1884 = exp2(_1872);
    float _1886 = fma(_1870, 0.5, 0.5);
    float _1888 = _1854 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1890 = fma(_1642, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1882);
    float _1892 = _1854 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1894 = log2(_1846);
    float _1896 = fma(_1886, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _1898 = -_1866;
    float _1900 = _1824 + _1898;
    float _1902 = fma(_1862, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1888);
    float _1904 = fma(_1862, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1892);
    float _1906 = _1848 + 1.0;
    float _1908 = fma(_1886, _1896, -0.212114393711090087890625);
    float _1910 = fma(_1814, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1902);
    float _1912 = 1.0 / _1890;
    float _1914 = fma(_1814, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1904);
    float _1916 = -_1848;
    float _1918 = fma(_1884, _1906, _1916);
    float _1920 = fma(_1642, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1910);
    float _1922 = fma(_1886, _1908, 1.570728778839111328125);
    float _1924 = fma(_1642, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1914);
    float _1926 = fma(_1918, 0.5, 0.5);
    float _1928 = sqrt(_1880);
    float _1930 = _1894 * 0.693147182464599609375;
    float _1932 = _1930 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _1934 = _1920 * _1912;
    float _1936 = _1924 * _1912;
    float _1938 = fma(_1934, 0.5, 0.5);
    float _1940 = fma(_1936, -0.5, 0.5);
    float _1942 = _1928 * 0.636619746685028076171875;
    float2 _5920 = float2(_1878, _1900);
    float _1944 = dm_bs(spvDescriptorSet0.vp_t_tcb_24.sample(spvDescriptorSet0.vp_t_tcb_24Smplr, select(_5920, float2(0.0), isnan(_5920)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_24, spvDescriptorSet0.vp_t_tcb_24Smplr_w, select(_5920, float2(0.0), isnan(_5920)), level(0.0)).x;
    float3 _5931 = float3(_1938, _1940, _1932);
    float _1946 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_5931, float3(0.0), isnan(_5931)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_5931, float3(0.0), isnan(_5931)), level(0.0)).x;
    float _1948 = -_1922;
    float _1950 = fma(_1942, _1948, 1.0);
    float3 _5947 = float3(_1938, _1940, _1932);
    float4 _1953 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_5947, float3(0.0), isnan(_5947)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_5947, float3(0.0), isnan(_5947)), level(0.0)).xyzw;
    float _1955 = _1953.x;
    float _1957 = _1953.y;
    float _1959 = _1953.z;
    float _1961 = _1953.w;
    float2 _5963 = float2(_1950, _1926);
    float3 _1965 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_5963, float2(0.0), isnan(_5963)), level(0.0)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_5963, float2(0.0), isnan(_5963)), level(0.0)).xyz;
    float _1967 = _1965.x;
    float _1969 = _1965.y;
    float _1971 = _1965.z;
    float _1973 = in.m_57.x;
    float _1975 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _1977 = in.m_57.y;
    float _1979 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    out.m_63.x = _640;
    out.m_63.y = _642;
    out.m_63.z = _656;
    out.m_63.w = _668;
    float _1981 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _1983 = _1981 + (*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _1985 = -(*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _1987 = _1985 + (*spvDescriptorSet0.vp_c9)._m0[133].w;
    float _1989 = in.m_57.z;
    float _1991 = 1.0 / _1983;
    int _1993 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _1995 = _1993 != 0;
    float _1997 = _1834 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _1999 = -(*spvDescriptorSet0.vp_c9)._m0[133].x;
    float _2001 = (*spvDescriptorSet0.vp_c9)._m0[134].x + _1999;
    float _2003 = _1975 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    int _2005 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 16;
    bool _2007 = _2005 != 0;
    float _2009 = -(*spvDescriptorSet0.vp_c9)._m0[133].w;
    float _2011 = _2009 + (*spvDescriptorSet0.vp_c9)._m0[134].w;
    float _2013 = _1973 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    float _2015 = 1.0 / _1987;
    float _2017 = -(*spvDescriptorSet0.vp_c9)._m0[131].x;
    float _2019 = (*spvDescriptorSet0.vp_c9)._m0[132].x + _2017;
    float _2021 = -_1979;
    float _2023 = fma(_2013, 2.0, _2021);
    float _2025 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _2027 = in.m_65.y;
    float _2029 = _1977 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    int _2031 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _2033 = _2031 != 0;
    float _2035 = 1.0 / _2011;
    float _2037 = fma(_2029, -2.0, _2025);
    float _2039 = -(*spvDescriptorSet0.vp_c9)._m0[132].x;
    float _2041 = _2039 + (*spvDescriptorSet0.vp_c9)._m0[133].x;
    int _2043 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 32;
    bool _2045 = _2043 != 0;
    float _2047 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    int _2049 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _2051 = _2049 != 0;
    float _2053 = (*spvDescriptorSet0.vp_c9)._m0[88].w + (*spvDescriptorSet0.vp_c9)._m0[88].y;
    bool _2055 = _1989 > 0.5;
    float _2057 = (*spvDescriptorSet0.vp_c9)._m0[88].z + (*spvDescriptorSet0.vp_c9)._m0[88].x;
    float _2059 = _2019 * _1991;
    float _2061 = fma(_1977, (*spvDescriptorSet0.vp_c9)._m0[88].w, _2053);
    float _2063 = -(*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _2065 = _694 + _2063;
    float _2067 = _2041 * _2015;
    float _2069 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].w;
    float _2071 = _2001 * _2035;
    float _2073 = fma(_1973, (*spvDescriptorSet0.vp_c9)._m0[78].z, _2047);
    bool _2075 = _1977 > 0.5;
    float _2077 = fma(_2067, _2065, (*spvDescriptorSet0.vp_c9)._m0[132].x);
    float _2079 = -_2027;
    float _2081 = _2079 + 1.0;
    float _2083 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    float _2085 = _2083;
    bool _2087 = _2055;
    float _2089 = _2027;
    float _2091 = _2057;
    float _2093 = _1924;
    if (_2033)
    {
        _672 = _1973;
    }
    float _2095 = _672;
    float _2097 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _2099 = fma(_1977, (*spvDescriptorSet0.vp_c9)._m0[78].w, _2083);
    float _2101 = _2095;
    if (_2033)
    {
        _2085 = _1977;
    }
    float _2103 = _2085;
    float _2105 = fma(_1973, (*spvDescriptorSet0.vp_c9)._m0[88].z, _2057);
    int _2107 = _2055 ? as_type<int>(_2081) : as_type<int>(_2027);
    float _2109 = (*spvDescriptorSet0.vp_c9)._m0[79].z + (*spvDescriptorSet0.vp_c9)._m0[79].y;
    float _2111 = _2103;
    if (_1995)
    {
        bool _2113 = _1973 > 0.5;
        _2087 = _2113;
    }
    bool _2115 = _2087;
    float _2117 = -(*spvDescriptorSet0.vp_c9)._m0[133].w;
    float _2119 = _694 + _2117;
    if (!_2033)
    {
        _2111 = _1973;
    }
    float _2121 = _2111;
    float _2123 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _2125 = _694 + _2123;
    float _2127 = fma(_1989, (*spvDescriptorSet0.vp_c9)._m0[79].z, _2109);
    int _2129 = as_type<int>(_2121);
    if (!_2033)
    {
        _2101 = _1989;
    }
    float _2131 = _2101;
    float _2133 = fma(_2071, _2119, (*spvDescriptorSet0.vp_c9)._m0[133].x);
    float _2135 = fma(_2059, _2125, (*spvDescriptorSet0.vp_c9)._m0[131].x);
    bool _2137 = _694 >= (*spvDescriptorSet0.vp_c9)._m0[134].w;
    bool _2139 = isnan(_694);
    bool _2141 = _2137 || _2139;
    bool _2143 = isnan((*spvDescriptorSet0.vp_c9)._m0[134].w);
    bool _2145 = _2141 || _2143;
    float _2147 = float(_2145);
    float _2149 = in.m_65.x;
    bool _2151 = _694 >= (*spvDescriptorSet0.vp_c9)._m0[133].w;
    bool _2153 = isnan(_694);
    bool _2155 = _2151 || _2153;
    bool _2157 = isnan((*spvDescriptorSet0.vp_c9)._m0[133].w);
    bool _2159 = _2155 || _2157;
    float _2161 = float(_2159);
    float _2163 = _2069 * (*spvDescriptorSet0.vp_c9)._m0[90].y;
    bool _2165 = _694 >= (*spvDescriptorSet0.vp_c9)._m0[132].w;
    bool _2167 = isnan(_694);
    bool _2169 = _2165 || _2167;
    bool _2171 = isnan((*spvDescriptorSet0.vp_c9)._m0[132].w);
    bool _2173 = _2169 || _2171;
    float _2175 = float(_2173);
    float _2177 = -_2147;
    float _2179 = _2177 + 1.0;
    float _2181 = _2045 ? as_type<float>(_2107) : _2027;
    float _2183 = -_2161;
    float _2185 = _2183 + 1.0;
    if (_2051)
    {
        float _2187 = _2075 ? _2081 : _2027;
        _2089 = _2187;
    }
    float _2189 = _2089;
    float _2191 = _2161 * _2179;
    bool _2193 = _694 >= (*spvDescriptorSet0.vp_c9)._m0[131].w;
    bool _2195 = isnan(_694);
    bool _2197 = _2193 || _2195;
    bool _2199 = isnan((*spvDescriptorSet0.vp_c9)._m0[131].w);
    bool _2201 = _2197 || _2199;
    float _2203 = float(_2201);
    float _2205 = -_2175;
    float _2207 = _2205 + 1.0;
    float _2209 = fma(_2181, _2163, -0.5);
    float _2211 = _2131 * (*spvDescriptorSet0.vp_c9)._m0[87].x;
    float _2213 = _2097 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _2215 = _2175 * _2185;
    float _2217 = _2203 * _2207;
    float _2219 = (*spvDescriptorSet0.vp_c9)._m0[87].x + (*spvDescriptorSet0.vp_c9)._m0[86].z;
    float _2221 = fma(_2213, _2189, -0.5);
    float _2223 = (*spvDescriptorSet0.vp_c9)._m0[87].y + (*spvDescriptorSet0.vp_c9)._m0[86].w;
    float _2225 = _2121 * (*spvDescriptorSet0.vp_c9)._m0[87].y;
    float _2227 = -_2219;
    float _2229 = fma(_2211, 2.0, _2227);
    float _2231 = _2135 * _2217;
    float _2233 = fma(_138, (*spvDescriptorSet0.vp_c9)._m0[79].x, _2127);
    float _2235 = fma(_2225, -2.0, _2223);
    float _2237 = fma(_138, (*spvDescriptorSet0.vp_c9)._m0[77].z, _2073);
    float _2239 = -_138;
    float _2241 = fma(_2239, (*spvDescriptorSet0.vp_c9)._m0[76].x, _2023);
    float _2243 = fma(_138, (*spvDescriptorSet0.vp_c9)._m0[77].w, _2099);
    float _2245 = fma(_138, (*spvDescriptorSet0.vp_c9)._m0[76].y, _2037);
    float _2247 = fma(_138, (*spvDescriptorSet0.vp_c9)._m0[87].z, _2105);
    float _2249 = fma(_138, (*spvDescriptorSet0.vp_c9)._m0[87].w, _2061);
    float _2251 = -_138;
    float _2253 = fma(_2251, (*spvDescriptorSet0.vp_c9)._m0[86].x, _2229);
    float _2255 = fma(_138, (*spvDescriptorSet0.vp_c9)._m0[86].y, _2235);
    int _2257 = as_type<int>(_2213);
    float _2259 = _2149;
    if (_1995)
    {
        float _2261 = -_2149;
        float _2263 = _2261 + 1.0;
        _2257 = as_type<int>(_2263);
    }
    int _2265 = _2257;
    float _2267 = abs(_1510);
    float _2269 = log2(_2267);
    float _2271 = -_2203;
    float _2273 = _2271 + 1.0;
    if (_2007)
    {
        float _2275 = -_2149;
        float _2277 = _2275 + 1.0;
        _2129 = as_type<int>(_2277);
    }
    int _2279 = _2129;
    if (!_1995)
    {
        _2091 = _2149;
    }
    float _2281 = _2091;
    float _2283 = _2233 * (-0.15915493667125701904296875);
    float _2285 = _2281;
    if (_1995)
    {
        float _2287 = _2115 ? as_type<float>(_2265) : _2149;
        _2285 = _2287;
    }
    float _2289 = _2285;
    float _2291 = fma(_2273, (*spvDescriptorSet0.vp_c9)._m0[131].x, _2231);
    if (_2007)
    {
        float _2293 = _2075 ? as_type<float>(_2279) : _2149;
        _2259 = _2293;
    }
    float _2295 = _2259;
    float _2297 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].z;
    float _2299 = in.m_67.x;
    float _2301 = in.m_67.y;
    float _2303 = in.m_67.z;
    bool _2305 = _900 != 0.0;
    bool _2307 = isnan(_900);
    bool _2309 = _2305 || _2307;
    bool _2311 = isnan(0.0);
    bool _2313 = _2309 || _2311;
    float _2315 = fma(_2077, _2215, _2291);
    float _2317 = fma(_2003, _2289, -0.5);
    float _2319 = -_2255;
    float _2321 = fma(_2249, _2209, _2319);
    bool _2323 = _898 == 0.0;
    bool _2325 = !_2313;
    bool _2327 = _2323 && _2325;
    float _2329 = fma(_2133, _2191, _2315);
    float _2331 = _2283 * 6.283185482025146484375;
    float _2333 = sin(_2331);
    float _2335 = _2269 * (*spvDescriptorSet0.vp_c15)._m0[654].z;
    bool _2337 = _902 == 0.0;
    bool _2339 = _2337 && _2327;
    out.m_69.x = _1198;
    out.m_69.y = _1166;
    out.m_69.z = _1192;
    bool _2341 = _1510 <= 8000.0;
    bool _2343 = isnan(_1510);
    bool _2345 = _2341 || _2343;
    bool _2347 = isnan(8000.0);
    bool _2349 = _2345 || _2347;
    float _2351 = float(_2349);
    out.m_71.w = _782;
    float _2353 = _2283 * 6.283185482025146484375;
    float _2355 = cos(_2353);
    float _2357 = _2297 * (*spvDescriptorSet0.vp_c9)._m0[90].x;
    float _2359 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    out.m_73.x = _960;
    float _2361 = fma(_2357, _2295, -0.5);
    float _2363 = _2359 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    out.m_75.x = _1502;
    out.m_75.y = _1500;
    out.m_75.z = _1504;
    float _2365 = exp2(_2335);
    float _2367 = _2333 * _2221;
    float _2369 = _2303;
    float _2371 = _2299;
    float _2373 = _2301;
    if (!_2339)
    {
        float _2375 = fma(_902, (*spvDescriptorSet0.vp_c9)._m0[17].y, _2303);
        _2369 = _2375;
    }
    float _2377 = _2369;
    float _2379 = fma(_2247, _2361, _2253);
    if (!_2339)
    {
        float _2381 = fma(_898, (*spvDescriptorSet0.vp_c9)._m0[17].y, _2299);
        _2371 = _2381;
    }
    float _2383 = _2371;
    if (!_2339)
    {
        float _2385 = fma(_900, (*spvDescriptorSet0.vp_c9)._m0[17].y, _2301);
        _2373 = _2385;
    }
    float _2387 = _2373;
    float _2389 = _2321 + 0.5;
    float _2391 = _2355 * _2221;
    float _2393 = exp2(_1997);
    float _2395 = -_2367;
    float _2397 = fma(_2355, _2317, _2395);
    float _2399 = _2379 + 0.5;
    float _2401 = fma(_2333, _2317, _2391);
    float _2403 = fma(_2237, _2397, _2241);
    float _2405 = fma(_2365, (*spvDescriptorSet0.vp_c15)._m0[654].x, (*spvDescriptorSet0.vp_c15)._m0[654].y);
    float _2407 = precise::clamp(_2405, 0.0, 1.0);
    out.m_77.x = _2399;
    out.m_77.y = _2389;
    float _2409 = -_2245;
    float _2411 = fma(_2243, _2401, _2409);
    float _2413 = fma(_2407, -2.0, 3.0);
    float _2415 = _2407 * _2407;
    float _2417 = fma(_2147, (*spvDescriptorSet0.vp_c9)._m0[134].x, _2329);
    float _2419 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _2421 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _2423 = _2415 * _2413;
    float _2425 = -_2393;
    float _2427 = _2425 + 1.0;
    float _2429 = _1854 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _2431 = _2419 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2433 = -_2423;
    float _2435 = _2433 + 1.0;
    float _2437 = _2427 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _2439 = fma(_1862, (*spvDescriptorSet0.vp_c8)._m0[6].x, _2429);
    float _2441 = _2421 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2443 = _2417 * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    float _2445 = _2411 + 0.5;
    float _2447 = fma(_1814, (*spvDescriptorSet0.vp_c8)._m0[6].z, _2439);
    float _2449 = fma(_2435, (*spvDescriptorSet0.vp_c15)._m0[654].w, _2423);
    float _2451 = _974 * _2387;
    float _2453 = _968 * _2387;
    float _2455 = in.m_79.x;
    float _2457 = _1890 * 0.5;
    float _2459 = _988 * _2387;
    float _2461 = fma(_1642, (*spvDescriptorSet0.vp_c8)._m0[6].w, _2447);
    float _2463 = _2403 + 0.5;
    out.m_81.x = _2363;
    out.m_81.y = _2431;
    out.m_81.z = _2441;
    out.m_81.w = _2443;
    float _2465 = fma(_952, _2383, _2451);
    float _2467 = fma(_954, _2383, _2453);
    float _2469 = fma(_950, _2383, _2459);
    out.m_83.x = _2463;
    out.m_83.y = _2445;
    float _2471 = _2351 * _2449;
    float _2473 = fma(_854, _2377, _2465);
    float _2475 = fma(_858, _2377, _2467);
    float _2477 = fma(_856, _2377, _2469);
    float _2479 = _2471 * (*spvDescriptorSet0.vp_c15)._m0[653].x;
    out.gl_Position.x = _1920;
    out.gl_Position.y = _1924;
    out.gl_Position.z = _2461;
    out.gl_Position.w = _1890;
    bool _2481 = _1784 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _2483 = isnan(_1784);
    bool _2485 = _2481 || _2483;
    bool _2487 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _2489 = _2485 || _2487;
    float _2491 = fma(_1924, -0.5, _2457);
    float _2493 = _2461 + _1890;
    float _2495 = _1920 + _1890;
    float _2497 = -_2437;
    float _2499 = _2497 + 1.0;
    float _2501 = _2493 * 0.5;
    float _2503 = _2495 * 0.5;
    out.m_85.x = _2473;
    out.m_85.y = _2475;
    out.m_85.z = _2477;
    out.m_87.x = _2503;
    out.m_87.y = _2491;
    out.m_87.z = _2501;
    out.m_87.w = _1890;
    float _2505 = (*spvDescriptorSet0.vp_c15)._m0[653].y;
    if (!_2489)
    {
        _2093 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _2507 = _2093;
    float _2509 = -_1944;
    float _2511 = _2509 + 1.0;
    float _2513 = _2437 * _1946;
    float _2515 = _2511 * _2479;
    float _2517 = precise::clamp(_2515, 0.0, 1.0);
    float _2519 = _1961 * _2513;
    float _2521 = _1961 * _2499;
    float _2523 = _1562 * _1616;
    float _2525 = -_2517;
    float _2527 = fma(_2525, (*spvDescriptorSet0.vp_c15)._m0[653].y, 1.0);
    float _2529 = _1971 * _2513;
    float _2531 = fma(_1967, _2519, _1955);
    float _2533 = fma(_1969, _2519, _1957);
    float _2535 = _2527 * _2455;
    float _2537 = fma(_1961, _2529, _1959);
    float _2539 = _2523 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _2541 = _2519;
    float _2543 = _2535;
    float _2545 = _2523;
    float _2547 = _2507;
    float _2549 = _2507;
    if (!_2489)
    {
        _2541 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _2551 = _2541;
    float _2553 = _2535 * (*spvDescriptorSet0.vp_c13)._m0[1].w;
    float _2555 = _2553;
    float _2557 = _2551;
    float _2559 = _2551;
    if (!_2489)
    {
        _2505 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _2561 = _2505;
    out.m_89.x = _2531;
    out.m_89.y = _2533;
    out.m_89.z = _2537;
    out.m_89.w = _2521;
    float _2563 = _2561;
    float _2565 = _2561;
    if (!_2489)
    {
        _2543 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _2567 = _2543;
    float _2569 = _2567;
    float _2571 = _2567;
    if (!_2489)
    {
        _2545 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _2573 = _2545;
    out.m_91.x = _2553;
    float _2575 = _2573;
    float _2577 = _2573;
    if (!_2489)
    {
        _2555 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _2579 = _2555;
    bool _2581 = !_2489;
    float _2583 = _2579;
    float _2585 = _2579;
    if (!_2581)
    {
        bool _2587 = _1784 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _2589 = isnan(_1784);
        bool _2591 = _2587 || _2589;
        bool _2593 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _2595 = _2591 || _2593;
        if (!_2595)
        {
            float _2597 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2599 = _1784 + _2597;
            float _2601 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2603 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _2601;
            float _2605 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _2607 = _2605 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _2609 = 1.0 / _2603;
            float _2611 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _2613 = _2611 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _2615 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _2617 = _2615 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _2619 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _2621 = _2619 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _2623 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _2625 = _2623 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _2627 = _2599 * _2609;
            float _2629 = precise::clamp(_2627, 0.0, 1.0);
            float _2631 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _2633 = _2631 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _2635 = fma(_2629, _2607, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _2637 = fma(_2629, _2633, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _2639 = fma(_2629, _2613, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _2641 = fma(_2629, _2617, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _2643 = fma(_2629, _2621, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _2645 = fma(_2629, _2625, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            _2559 = _2639;
            _2585 = _2643;
            _2549 = _2635;
            _2571 = _2641;
            _2565 = _2637;
            _2577 = _2645;
            _2647 = true;
        }
        else
        {
            bool _2649 = _1784 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _2651 = isnan(_1784);
            bool _2653 = _2649 || _2651;
            bool _2655 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _2657 = _2653 || _2655;
            if (!_2657)
            {
                _2547 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _2659 = _2547;
            _2549 = _2659;
            if (!_2657)
            {
                _2557 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _2661 = _2557;
            _2559 = _2661;
            if (!_2657)
            {
                _2563 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _2663 = _2563;
            _2565 = _2663;
            if (!_2657)
            {
                _2569 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _2665 = _2569;
            _2571 = _2665;
            if (!_2657)
            {
                _2583 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _2667 = _2583;
            _2585 = _2667;
            if (!_2657)
            {
                _2575 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _2669 = _2575;
            bool _2671 = !_2657;
            _2577 = _2669;
            if (!_2671)
            {
                bool _2673 = _1784 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _2675 = isnan(_1784);
                bool _2677 = _2673 || _2675;
                bool _2679 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _2681 = _2677 || _2679;
                if (!_2681)
                {
                    float _2683 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2685 = _1784 + _2683;
                    float _2687 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2689 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _2687;
                    float _2691 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _2693 = _2691 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _2695 = 1.0 / _2689;
                    float _2697 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _2699 = _2697 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _2701 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _2703 = _2701 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _2705 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _2707 = _2705 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _2709 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _2711 = _2709 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _2713 = _2685 * _2695;
                    float _2715 = precise::clamp(_2713, 0.0, 1.0);
                    float _2717 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _2719 = _2717 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _2721 = fma(_2715, _2693, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _2723 = fma(_2715, _2719, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _2725 = fma(_2715, _2699, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _2727 = fma(_2715, _2703, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _2729 = fma(_2715, _2707, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _2731 = fma(_2715, _2711, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    _2559 = _2725;
                    _2585 = _2729;
                    _2549 = _2721;
                    _2571 = _2727;
                    _2565 = _2723;
                    _2577 = _2731;
                    _2647 = true;
                }
                else
                {
                    _2559 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _2585 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _2549 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _2571 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _2565 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _2577 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _2647 = false;
    float _2733 = _2559;
    float _2735 = _2585;
    float _2737 = _2549;
    float _2739 = _2571;
    float _2741 = _2565;
    float _2743 = _2577;
    float _2745 = fma(_2475, -0.5, 0.5);
    float _2747 = precise::clamp(_2745, 0.0, 1.0);
    float _2749 = -_2733;
    float _2751 = _2749 + _2735;
    float _2753 = _2539 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _2755 = -_2737;
    float _2757 = _2755 + _2739;
    float _2759 = fma(_2747, _2751, _2733);
    out.m_93.x = 0.0;
    float _2761 = -_2741;
    float _2763 = _2761 + _2743;
    float _2765 = fma(_2747, _2757, _2737);
    float _2767 = _2759 * 0.586610972881317138671875;
    out.m_49.x = _2753;
    bool _2769 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _2771 = fma(_2747, _2763, _2741);
    float _2773 = fma(_2765, 0.298911988735198974609375, _2767);
    bool _2775 = _1562 > 0.0;
    bool _2777 = isnan(_1562);
    bool _2779 = _2775 || _2777;
    bool _2781 = isnan(0.0);
    bool _2783 = _2779 || _2781;
    float _2785 = fma(_2771, 0.114477999508380889892578125, _2773);
    bool _2787 = _1616 <= 0.0;
    bool _2789 = !_2783;
    bool _2791 = _2787 || _2789;
    float _2793 = -_2785;
    float _2795 = _2765 + _2793;
    float _2797 = -_2785;
    float _2799 = _2759 + _2797;
    float _2801 = -_2785;
    float _2803 = _2771 + _2801;
    float _2805 = fma(_2795, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2785);
    float _2807 = fma(_2799, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2785);
    float _2809 = fma(_2803, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2785);
    bool _2811 = !_2769;
    if (!_2811)
    {
        float _2813 = -_1500;
        float _2815 = _2813 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
        float _2817 = -_1502;
        float _2819 = _2817 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
        float _2821 = -_1504;
        float _2823 = _2821 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
        float _2825 = _2815 * _2815;
        float _2827 = fma(_2819, _2819, _2825);
        float _2829 = fma(_2823, _2823, _2827);
        float _2831 = sqrt(_2829);
        float _2833 = rsqrt(_2829);
        float _2835 = -_2831;
        float _2837 = _2835 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
        float _2839 = _2837 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
        float _2841 = precise::clamp(_2839, 0.0, 1.0);
        float _2843 = _2819 * _2833;
        float _2845 = _2815 * _2833;
        float _2847 = abs(_2841);
        float _2849 = log2(_2847);
        float _2851 = _2823 * _2833;
        float _2853 = _2843 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
        float _2855 = _2475 * _2845;
        float _2857 = -_2845;
        float _2859 = -_2853;
        float _2861 = fma(_2857, (*spvDescriptorSet0.vp_c15)._m0[656].y, _2859);
        float _2863 = fma(_2473, _2843, _2855);
        float _2865 = -_2851;
        float _2867 = fma(_2865, (*spvDescriptorSet0.vp_c15)._m0[656].z, _2861);
        float _2869 = fma(_2477, _2851, _2863);
        float _2871 = precise::clamp(_2869, 0.0, 1.0);
        float _2873 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
        float _2875 = _2867 + _2873;
        float _2877 = _2849 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
        float _2879 = _2875 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
        float _2881 = precise::clamp(_2879, 0.0, 1.0);
        float _2883 = exp2(_2877);
        float _2885 = _2883 * _2881;
        float _2887 = _2871 * _2885;
        float _2889 = _2887 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
        float _2891 = _2887 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
        float _2893 = _2887 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
        out.m_93.x = _2889;
        out.m_93.y = _2891;
        out.m_93.z = _2893;
    }
    out.m_71.x = _2805;
    out.m_71.y = _2807;
    out.m_71.z = _2809;
    if (!_2791)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_63.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_63.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_63.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_63.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_81.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_81.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_81.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_81.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_71.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_71.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_71.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_71.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_77.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_77.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_77.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_77.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_85.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_85.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_85.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_85.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_75.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_75.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_75.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_75.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_93.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_93.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_93.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_93.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_91.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_91.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_91.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_91.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_83.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_83.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_83.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_83.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_53.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_53.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_53.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_53.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_73.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_73.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_73.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_73.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_87.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_87.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_87.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_87.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_49.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_49.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_49.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_49.w)); dm_cw(dm_gs, dm_p, 68, as_type<uint>(out.m_89.x)); dm_cw(dm_gs, dm_p, 69, as_type<uint>(out.m_89.y)); dm_cw(dm_gs, dm_p, 70, as_type<uint>(out.m_89.z)); dm_cw(dm_gs, dm_p, 71, as_type<uint>(out.m_89.w)); dm_cw(dm_gs, dm_p, 72, as_type<uint>(out.m_69.x)); dm_cw(dm_gs, dm_p, 73, as_type<uint>(out.m_69.y)); dm_cw(dm_gs, dm_p, 74, as_type<uint>(out.m_69.z)); dm_cw(dm_gs, dm_p, 75, as_type<uint>(out.m_69.w)); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    out.m_49.x = 0.0;
    float _2895 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _2895;
    { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_63.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_63.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_63.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_63.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_81.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_81.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_81.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_81.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_71.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_71.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_71.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_71.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_77.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_77.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_77.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_77.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_85.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_85.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_85.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_85.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_75.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_75.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_75.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_75.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_93.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_93.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_93.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_93.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_91.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_91.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_91.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_91.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_83.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_83.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_83.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_83.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_53.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_53.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_53.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_53.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_73.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_73.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_73.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_73.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_87.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_87.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_87.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_87.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_49.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_49.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_49.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_49.w)); dm_cw(dm_gs, dm_p, 68, as_type<uint>(out.m_89.x)); dm_cw(dm_gs, dm_p, 69, as_type<uint>(out.m_89.y)); dm_cw(dm_gs, dm_p, 70, as_type<uint>(out.m_89.z)); dm_cw(dm_gs, dm_p, 71, as_type<uint>(out.m_89.w)); dm_cw(dm_gs, dm_p, 72, as_type<uint>(out.m_69.x)); dm_cw(dm_gs, dm_p, 73, as_type<uint>(out.m_69.y)); dm_cw(dm_gs, dm_p, 74, as_type<uint>(out.m_69.z)); dm_cw(dm_gs, dm_p, 75, as_type<uint>(out.m_69.w)); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
}

