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
    constant _16* vp_c15 [[id(3)]];
    constant _16* vp_c16 [[id(4)]];
    constant _16* vp_c13 [[id(5)]];
    constant _16* vp_c7 [[id(6)]];
    texture2d<float> vp_t_tcb_24 [[id(7)]];
    sampler vp_t_tcb_24Smplr [[id(8)]];
    texture3d<float> vp_t_tcb_32 [[id(9)]];
    sampler vp_t_tcb_32Smplr [[id(10)]];
    texture3d<float> vp_t_tcb_30 [[id(11)]];
    sampler vp_t_tcb_30Smplr [[id(12)]];
    texture2d<float> vp_t_tcb_1C [[id(13)]];
    sampler vp_t_tcb_1CSmplr [[id(14)]];
    sampler vp_t_tcb_24Smplr_w [[id(15)]];
    sampler vp_t_tcb_32Smplr_w [[id(16)]];
    sampler vp_t_tcb_30Smplr_w [[id(17)]];
    sampler vp_t_tcb_1CSmplr_w [[id(18)]];
    constant dm_border_t* dm_border [[id(19)]];
};

struct main0_out
{
    float4 m_77 [[user(locn0)]];
    float4 m_71 [[user(locn1)]];
    float4 m_51 [[user(locn2)]];
    float4 m_97 [[user(locn3)]];
    float4 m_67 [[user(locn4)]];
    float4 m_73 [[user(locn5)]];
    float4 m_89 [[user(locn6)]];
    float4 m_79 [[user(locn7)]];
    float4 m_85 [[user(locn8)]];
    float4 m_95 [[user(locn9)]];
    float4 m_91 [[user(locn10)]];
    float4 m_93 [[user(locn11)]];
    float4 gl_Position [[position, invariant]];
    float gl_PointSize [[point_size]];
};

struct main0_in
{
    float4 m_87 [[attribute(0)]];
    float4 m_57 [[attribute(1)]];
    float4 m_59 [[attribute(2)]];
    float4 m_61 [[attribute(3)]];
    float4 m_75 [[attribute(4)]];
    float4 m_55 [[attribute(5)]];
    float4 m_48 [[attribute(6)]];
    float4 m_53 [[attribute(7)]];
    float4 m_83 [[attribute(8)]];
    float4 m_81 [[attribute(9)]];
    float4 m_63 [[attribute(10)]];
    float4 m_65 [[attribute(11)]];
    float4 m_69 [[attribute(13)]];
};

vertex main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]])
{
    main0_out out = {};
    out.m_77 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_71 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_51 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_97 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_67 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_73 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_89 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_79 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_85 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_95 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_91 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_93 = float4(0.0, 0.0, 0.0, 1.0);
    bool _3130 = false;
    bool _2235 = false;
    bool _638 = false;
    bool _512 = false;
    bool _236 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _111 = in.m_48.w;
    float _113 = trunc(_111);
    int _116 = int(_113);
    bool _120 = _116 >= 1;
    float _122 = 0.0;
    if (!_120)
    {
        _122 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _124 = _122;
    float _126 = _124;
    if (!_120)
    {
        out.m_51.x = 0.0;
    }
    int _128 = 0;
    if (!_120)
    {
        float _130 = _124 * 5.0;
        _128 = as_type<int>(_130);
    }
    int _132 = _128;
    int _134 = _132;
    if (!_120)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _3429 = as_type<float>(_132);
        out.gl_Position.z = _3429;
    }
    if (!_120)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _136 = in.m_53.w;
    bool _138 = _136 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _140 = isnan(_136);
    bool _142 = _138 || _140;
    bool _144 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _146 = _142 || _144;
    float _148 = -_136;
    float _150 = _148 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    float _152 = 0.0;
    float _154 = _150;
    if (_146)
    {
        float _156 = float(_116);
        _152 = _156;
    }
    float _158 = _152;
    bool _160 = _150 >= _158;
    bool _162 = !_146;
    bool _164 = _160 || _162;
    if (_164)
    {
        _126 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _166 = _126;
    if (_164)
    {
        out.m_51.x = 0.0;
    }
    if (_164)
    {
        float _168 = _166 * 5.0;
        _134 = as_type<int>(_168);
    }
    int _170 = _134;
    if (_164)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _3498 = as_type<float>(_170);
        out.gl_Position.z = _3498;
    }
    if (_164)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _172 = in.m_55.x;
    float _174 = in.m_55.y;
    float _176 = in.m_55.z;
    bool _178 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _180 = in.m_57.x;
    float _182 = in.m_57.y;
    float _184 = in.m_57.z;
    float _186 = in.m_59.x;
    float _188 = in.m_59.y;
    float _190 = in.m_59.z;
    float _192 = in.m_61.x;
    float _194 = in.m_61.y;
    float _196 = in.m_61.z;
    float _198 = _174 * _182;
    float _200 = _174 * _188;
    float _202 = fma(_172, _180, _198);
    float _204 = _174 * _194;
    float _206 = fma(_172, _186, _200);
    float _208 = fma(_176, _184, _202);
    float _210 = fma(_172, _192, _204);
    float _212 = fma(_176, _190, _206);
    float _214 = fma(_176, _196, _210);
    bool _216 = !_178;
    float _234;
    if (!_216)
    {
        float _218 = in.m_63.x;
        float _220 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _222 = _218 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _224 = fma(_222, (*spvDescriptorSet0.vp_c9)._m0[12].x, _150);
        float _226 = _224 * _220;
        float _228 = floor(_226);
        float _230 = -_228;
        float _232 = _226 + _230;
        _234 = _232;
        _236 = true;
    }
    else
    {
        float _238 = float(_116);
        float _240 = 1.0 / _238;
        float _242 = _150 * _240;
        _234 = _242;
    }
    _236 = false;
    float _244 = _234;
    float _246 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _248 = _244 + _246;
    float _250 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _252 = _244 + _250;
    float _254 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _256 = _244 + _254;
    float _258 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _260 = (*spvDescriptorSet0.vp_c9)._m0[146].w + _258;
    float _262 = -(*spvDescriptorSet0.vp_c9)._m0[146].w;
    float _264 = _262 + (*spvDescriptorSet0.vp_c9)._m0[147].w;
    float _266 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _268 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _266;
    float _270 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _272 = _270 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _274 = 1.0 / _264;
    float _276 = 1.0 / _268;
    float _278 = -(*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _280 = (*spvDescriptorSet0.vp_c9)._m0[144].z + _278;
    bool _282 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].x;
    float _284 = 1.0 / _272;
    float _286 = -(*spvDescriptorSet0.vp_c9)._m0[146].w;
    float _288 = _244 + _286;
    float _290 = 1.0 / _260;
    float _292 = _288 * _274;
    bool _294 = _244 >= (*spvDescriptorSet0.vp_c9)._m0[147].w;
    bool _296 = isnan(_244);
    bool _298 = _294 || _296;
    bool _300 = isnan((*spvDescriptorSet0.vp_c9)._m0[147].w);
    bool _302 = _298 || _300;
    float _304 = float(_302);
    float _306 = _248 * _276;
    bool _308 = _244 >= (*spvDescriptorSet0.vp_c9)._m0[146].w;
    bool _310 = isnan(_244);
    bool _312 = _308 || _310;
    bool _314 = isnan((*spvDescriptorSet0.vp_c9)._m0[146].w);
    bool _316 = _312 || _314;
    float _318 = float(_316);
    bool _320 = _244 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _322 = isnan(_244);
    bool _324 = _320 || _322;
    bool _326 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _328 = _324 || _326;
    float _330 = float(_328);
    float _332 = -_304;
    float _334 = _332 + 1.0;
    float _336 = _252 * _284;
    float _338 = fma(_280, _306, (*spvDescriptorSet0.vp_c9)._m0[143].z);
    bool _340 = _244 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _342 = isnan(_244);
    bool _344 = _340 || _342;
    bool _346 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _348 = _344 || _346;
    float _350 = float(_348);
    float _352 = _318 * _334;
    float _354 = -_318;
    float _356 = _354 + 1.0;
    float _358 = -_330;
    float _360 = _358 + 1.0;
    float _362 = _256 * _290;
    float _364 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _366 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _364;
    float _368 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _370 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _368;
    float _372 = fma(_366, _306, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _374 = fma(_370, _306, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    bool _376 = _244 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _378 = isnan(_244);
    bool _380 = _376 || _378;
    bool _382 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _384 = _380 || _382;
    float _386 = float(_384);
    float _388 = _330 * _356;
    float _390 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _392 = _390 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _394 = -(*spvDescriptorSet0.vp_c9)._m0[144].z;
    float _396 = _394 + (*spvDescriptorSet0.vp_c9)._m0[145].z;
    float _398 = _350 * _360;
    float _400 = -_350;
    float _402 = _400 + 1.0;
    float _404 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _406 = _404 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _408 = fma(_392, _336, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _410 = fma(_396, _336, (*spvDescriptorSet0.vp_c9)._m0[144].z);
    float _412 = _386 * _402;
    float _414 = fma(_406, _336, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _416 = -_386;
    float _418 = _416 + 1.0;
    float _420 = -(*spvDescriptorSet0.vp_c9)._m0[145].z;
    float _422 = (*spvDescriptorSet0.vp_c9)._m0[146].z + _420;
    float _424 = _374 * _412;
    float _426 = _372 * _412;
    float _428 = _338 * _412;
    float _430 = -(*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _432 = (*spvDescriptorSet0.vp_c9)._m0[146].x + _430;
    float _434 = -(*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _436 = (*spvDescriptorSet0.vp_c9)._m0[146].y + _434;
    float _438 = fma(_418, (*spvDescriptorSet0.vp_c9)._m0[143].y, _424);
    float _440 = fma(_418, (*spvDescriptorSet0.vp_c9)._m0[143].x, _426);
    float _442 = fma(_418, (*spvDescriptorSet0.vp_c9)._m0[143].z, _428);
    float _444 = fma(_432, _362, (*spvDescriptorSet0.vp_c9)._m0[145].x);
    float _446 = fma(_436, _362, (*spvDescriptorSet0.vp_c9)._m0[145].y);
    float _448 = fma(_422, _362, (*spvDescriptorSet0.vp_c9)._m0[145].z);
    float _450 = fma(_414, _398, _438);
    float _452 = fma(_408, _398, _440);
    float _454 = fma(_410, _398, _442);
    float _456 = -(*spvDescriptorSet0.vp_c9)._m0[146].x;
    float _458 = _456 + (*spvDescriptorSet0.vp_c9)._m0[147].x;
    float _460 = -(*spvDescriptorSet0.vp_c9)._m0[146].y;
    float _462 = _460 + (*spvDescriptorSet0.vp_c9)._m0[147].y;
    float _464 = -(*spvDescriptorSet0.vp_c9)._m0[146].z;
    float _466 = _464 + (*spvDescriptorSet0.vp_c9)._m0[147].z;
    float _468 = fma(_444, _388, _452);
    float _470 = fma(_458, _292, (*spvDescriptorSet0.vp_c9)._m0[146].x);
    float _472 = fma(_462, _292, (*spvDescriptorSet0.vp_c9)._m0[146].y);
    float _474 = fma(_466, _292, (*spvDescriptorSet0.vp_c9)._m0[146].z);
    float _476 = fma(_446, _388, _450);
    float _478 = fma(_448, _388, _454);
    float _480 = fma(_470, _352, _468);
    float _482 = fma(_472, _352, _476);
    float _484 = fma(_474, _352, _478);
    float _486 = fma(_304, (*spvDescriptorSet0.vp_c9)._m0[147].x, _480);
    float _488 = fma(_304, (*spvDescriptorSet0.vp_c9)._m0[147].y, _482);
    float _490 = fma(_304, (*spvDescriptorSet0.vp_c9)._m0[147].z, _484);
    bool _492 = !_282;
    float _510;
    if (!_492)
    {
        float _494 = in.m_63.x;
        float _496 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].x;
        float _498 = _494 * (*spvDescriptorSet0.vp_c9)._m0[12].y;
        float _500 = fma(_498, (*spvDescriptorSet0.vp_c9)._m0[11].x, _150);
        float _502 = _500 * _496;
        float _504 = floor(_502);
        float _506 = -_504;
        float _508 = _502 + _506;
        _510 = _508;
        _512 = true;
    }
    else
    {
        float _514 = float(_116);
        float _516 = 1.0 / _514;
        float _518 = _150 * _516;
        _510 = _518;
    }
    _512 = false;
    float _520 = _510;
    float _522 = in.m_65.x;
    float _524 = in.m_65.y;
    float _526 = in.m_65.z;
    float _528 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _530 = _520 + _528;
    bool _532 = _520 >= (*spvDescriptorSet0.vp_c9)._m0[108].w;
    bool _534 = isnan(_520);
    bool _536 = _532 || _534;
    bool _538 = isnan((*spvDescriptorSet0.vp_c9)._m0[108].w);
    bool _540 = _536 || _538;
    float _542 = float(_540);
    float _544 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _546 = (*spvDescriptorSet0.vp_c9)._m0[108].w + _544;
    bool _548 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _550 = 1.0 / _546;
    float _552 = _488 * _524;
    float _554 = _490 * _526;
    float _556 = _530 * _550;
    float _558 = -_542;
    float _560 = _558 + 1.0;
    bool _562 = _520 >= (*spvDescriptorSet0.vp_c9)._m0[107].w;
    bool _564 = isnan(_520);
    bool _566 = _562 || _564;
    bool _568 = isnan((*spvDescriptorSet0.vp_c9)._m0[107].w);
    bool _570 = _566 || _568;
    float _572 = float(_570);
    float _574 = -(*spvDescriptorSet0.vp_c9)._m0[107].x;
    float _576 = (*spvDescriptorSet0.vp_c9)._m0[108].x + _574;
    float _578 = -(*spvDescriptorSet0.vp_c9)._m0[107].z;
    float _580 = (*spvDescriptorSet0.vp_c9)._m0[108].z + _578;
    float _582 = -(*spvDescriptorSet0.vp_c9)._m0[107].y;
    float _584 = (*spvDescriptorSet0.vp_c9)._m0[108].y + _582;
    float _586 = _572 * _560;
    float _588 = fma(_576, _556, (*spvDescriptorSet0.vp_c9)._m0[107].x);
    float _590 = fma(_584, _556, (*spvDescriptorSet0.vp_c9)._m0[107].y);
    float _592 = fma(_580, _556, (*spvDescriptorSet0.vp_c9)._m0[107].z);
    float _594 = -_572;
    float _596 = _594 + 1.0;
    float _598 = _588 * _586;
    float _600 = _590 * _586;
    float _602 = _592 * _586;
    float _604 = _486 * _522;
    float _606 = fma(_596, (*spvDescriptorSet0.vp_c9)._m0[107].x, _598);
    float _608 = fma(_596, (*spvDescriptorSet0.vp_c9)._m0[107].y, _600);
    float _610 = fma(_596, (*spvDescriptorSet0.vp_c9)._m0[107].z, _602);
    float _612 = fma(_542, (*spvDescriptorSet0.vp_c9)._m0[108].x, _606);
    float _614 = fma(_542, (*spvDescriptorSet0.vp_c9)._m0[108].y, _608);
    float _616 = fma(_542, (*spvDescriptorSet0.vp_c9)._m0[108].z, _610);
    bool _618 = !_548;
    float _636;
    if (!_618)
    {
        float _620 = in.m_63.x;
        float _622 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _624 = _620 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _626 = fma(_624, (*spvDescriptorSet0.vp_c9)._m0[11].y, _150);
        float _628 = _626 * _622;
        float _630 = floor(_628);
        float _632 = -_630;
        float _634 = _628 + _632;
        _636 = _634;
        _638 = true;
    }
    else
    {
        float _640 = float(_116);
        float _642 = 1.0 / _640;
        float _644 = _150 * _642;
        _636 = _644;
    }
    _638 = false;
    float _646 = _636;
    float _648 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].y);
    int _650 = int(_648);
    float _652 = in.m_59.w;
    float _654 = float(_116);
    float _656 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].x);
    int _658 = int(_656);
    float _660 = float(_650);
    float _662 = 1.0 / _654;
    float _664 = float(uint(_658));
    float _666 = 1.0 / _660;
    int _668 = ~_658;
    int _670 = _668 + 1;
    int _672 = ~_658;
    int _674 = _672 + 1;
    float _676 = 1.0 / _664;
    float _678 = _666 * _150;
    float _680 = trunc(_678);
    int _682 = int(_680);
    int _684 = as_type<int>(_676) + (-2);
    float _686 = float(uint(_682));
    float _688 = as_type<float>(_684) * _686;
    float _690 = in.m_63.x;
    float _692 = in.m_63.y;
    float _694 = trunc(_688);
    float _696 = precise::max(_694, 0.0);
    uint _699 = uint(_696);
    out.m_67.x = 1.0;
    out.m_67.y = 1.0;
    out.m_67.z = 1.0;
    int _701 = _670 * int(_699);
    int _703 = _701 + _682;
    float _705 = float(uint(_703));
    float _707 = in.m_48.x;
    float _709 = in.m_48.y;
    float _711 = in.m_48.z;
    float _713 = as_type<float>(_684) * _705;
    float _715 = float(_682);
    int _717 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _719 = _717 != 0;
    float _721 = trunc(_713);
    float _723 = precise::max(_721, 0.0);
    uint _725 = uint(_723);
    bool _727 = !_719;
    float _729 = _727 ? 7.345489978790283203125 : 1.0;
    int _731 = ~_658;
    int _733 = _731 + 1;
    int _735 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _737 = _735 != 0;
    float _739 = _729 * _690;
    int _741 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _743 = _741 != 0;
    int _745 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4096;
    bool _747 = _745 != 0;
    float _749 = _182 * _709;
    int _751 = int(_699) + int(_725);
    float _753 = _188 * _709;
    float _755 = _194 * _709;
    float _757 = float(_658);
    float _759 = fma(_180, _707, _749);
    int _761 = _733 * _751;
    int _763 = _761 + _682;
    float _765 = floor(_739);
    bool _767 = _715 >= _757;
    bool _769 = isnan(_715);
    bool _771 = _767 || _769;
    bool _773 = isnan(_757);
    bool _775 = _771 || _773;
    float _777 = float(_775);
    float _779 = fma(_192, _707, _755);
    float _781 = fma(_184, _711, _759);
    bool _783 = uint(_763) >= uint(_658);
    float _785 = fma(_186, _707, _753);
    float _787 = _757 * _150;
    float _789 = trunc(_777);
    int _791 = int(_789);
    bool _793 = !_783;
    int _795 = _793 ? 0 : (-1);
    float _797 = fma(_196, _711, _779);
    int _799 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 16;
    bool _801 = _799 != 0;
    int _803 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 32;
    bool _805 = _803 != 0;
    int _807 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 64;
    bool _809 = _807 != 0;
    float _811 = _787 * _662;
    int _813 = ~_751;
    int _815 = _813 + _795;
    int _817 = _815 + 1;
    float _819 = fma(_190, _711, _785);
    bool _821 = !_747;
    int _823 = _821 ? 0 : 1;
    float _825 = -_765;
    float _827 = _739 + _825;
    bool _829 = _658 == 0;
    int _831 = _658 * _817;
    int _833 = _831 + _682;
    bool _835 = !_805;
    int _837 = _835 ? 0 : 1;
    float _839 = _827 * _757;
    float _841 = trunc(_811);
    int _843 = int(_841);
    float _845 = in.m_69.y;
    bool _847 = !_829;
    int _849 = _847 ? _833 : (-1);
    int _851 = ~_791;
    int _853 = _851 + 1;
    int _855 = _853 + 1;
    float _857 = 0.0;
    if (_737)
    {
        float _859 = in.m_63.x;
        _857 = _859;
    }
    float _861 = _857;
    int _863 = _658 + (-1);
    float _865 = trunc(_839);
    int _867 = int(_865);
    bool _869 = !_801;
    int _871 = _869 ? 0 : 1;
    int _873 = _849 * _855;
    int _875 = abs(_837);
    int _877 = abs(_871);
    int _879 = _791 * _863;
    int _881 = _879 + _873;
    float _883 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _885 = log2(_883);
    int _887 = abs(_823);
    float _889 = _692 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    int _891 = _881 * _875;
    int _893 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 128;
    bool _895 = _893 != 0;
    int _897 = _843 * _877;
    int _899 = _897 + _891;
    bool _901 = !_895;
    int _903 = _901 ? 0 : 1;
    int _905 = _867 * _887;
    int _907 = _905 + _682;
    bool _909 = !_809;
    int _911 = _909 ? 0 : 1;
    float _913 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    int _915 = abs(_903);
    float _917 = _690 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    int _919 = abs(_911);
    float _921 = -_845;
    float _923 = _921 + 1.0;
    float _925 = -_913;
    float _927 = fma(_917, 2.0, _925);
    bool _929 = _692 > 0.5;
    int _931 = _907 * _919;
    int _933 = _931 + _899;
    float _935 = _885 * _150;
    int _937 = _867 * _915;
    int _939 = _937 + _933;
    float _941 = _845;
    float _943 = _927;
    if (_743)
    {
        float _945 = _929 ? _923 : _845;
        _941 = _945;
    }
    float _947 = _941;
    float _949 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _951 = _949 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _953 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _955 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _957 = 1.0 / _951;
    float _959 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _961 = _959 + (*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _963 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _965 = 1.0 / _961;
    float _967 = _953 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _969 = _955 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _971 = float(uint(_939));
    float _973 = (*spvDescriptorSet0.vp_c9)._m0[131].x * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    float _975 = -(*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _977 = _975 + (*spvDescriptorSet0.vp_c9)._m0[118].w;
    float _979 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _981 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _979;
    float _983 = as_type<float>(_684) * _971;
    float _985 = _963 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _987 = 1.0 / _977;
    float _989 = -(*spvDescriptorSet0.vp_c9)._m0[116].x;
    float _991 = _989 + (*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _993 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _995 = _981 * _957;
    out.m_71.x = _967;
    out.m_71.y = _985;
    out.m_71.z = _969;
    out.m_71.w = _973;
    float _997 = _991 * _965;
    float _999 = trunc(_983);
    float _1001 = precise::max(_999, 0.0);
    uint _1003 = uint(_1001);
    float _1005 = fma(_889, -2.0, _993);
    float _1007 = in.m_69.x;
    float _1009 = _690 * 2.0;
    bool _1011 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _1013 = isnan(1.0);
    bool _1015 = _1011 || _1013;
    bool _1017 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _1019 = _1015 || _1017;
    float _1021 = -(*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _1023 = (*spvDescriptorSet0.vp_c9)._m0[118].x + _1021;
    float _1025 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _1027 = 1.0 + _1025;
    float _1029 = in.m_63.z;
    float _1031 = exp2(_935);
    float _1033 = _1023 * _987;
    float _1035 = _692 + _690;
    int _1037 = ~_658;
    int _1039 = _1037 + 1;
    float _1041 = _1035 + (-1.0);
    bool _1043 = _861 > 0.5;
    bool _1045 = _1043 && _737;
    float _1047 = floor(_1009);
    float _1049 = _692 * 2.0;
    float _1051 = fma(_1041, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    int _1053 = _1039 * int(_1003);
    int _1055 = _1053 + _939;
    bool _1057 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _1059 = isnan(0.0);
    bool _1061 = _1057 || _1059;
    bool _1063 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _1065 = _1061 || _1063;
    float _1067 = float(uint(_1055));
    float _1069 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    float _1071 = 1.0 / _1027;
    float _1073 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    float _1075 = -_1031;
    float _1077 = _1075 + 1.0;
    float _1079 = as_type<float>(_684) * _1067;
    float _1081 = fma(_692, (*spvDescriptorSet0.vp_c9)._m0[78].w, _1069);
    float _1083 = fma(_690, (*spvDescriptorSet0.vp_c9)._m0[78].z, _1073);
    bool _1085 = _1047 > 0.0;
    float _1087 = _692 + _1029;
    float _1089 = floor(_1049);
    float _1091 = _1065 ? _1077 : 0.0;
    float _1093 = fma(_150, (*spvDescriptorSet0.vp_c9)._m0[77].z, _1083);
    bool _1095 = _1047 >= 0.0;
    bool _1097 = isnan(_1047);
    bool _1099 = _1095 || _1097;
    bool _1101 = isnan(0.0);
    bool _1103 = _1099 || _1101;
    float _1105 = -_150;
    float _1107 = fma(_1105, (*spvDescriptorSet0.vp_c9)._m0[76].x, _927);
    float _1109 = _1047;
    if (_737)
    {
        _1109 = _1007;
    }
    float _1111 = _1109;
    float _1113 = fma(_150, (*spvDescriptorSet0.vp_c9)._m0[77].w, _1081);
    float _1115 = fma(_150, (*spvDescriptorSet0.vp_c9)._m0[76].y, _1005);
    float _1117 = trunc(_1079);
    float _1119 = precise::max(_1117, 0.0);
    uint _1121 = uint(_1119);
    float _1123 = _1111;
    if (_1019)
    {
        float _1125 = _1091 * _1071;
        _154 = _1125;
    }
    float _1127 = _154;
    if (_1045)
    {
        float _1129 = -_1111;
        float _1131 = _1129 + 1.0;
        _1123 = _1131;
    }
    float _1133 = _1123;
    float _1135 = _1029 * 2.0;
    if (!_737)
    {
        _943 = _1007;
    }
    float _1137 = _943;
    float _1139 = _1087 + (-1.0);
    bool _1141 = _1089 > 0.0;
    float _1143 = floor(_1135);
    bool _1145 = _1089 >= 0.0;
    bool _1147 = isnan(_1089);
    bool _1149 = _1145 || _1147;
    bool _1151 = isnan(0.0);
    bool _1153 = _1149 || _1151;
    float _1155 = fma(_947, (*spvDescriptorSet0.vp_c9)._m0[80].y, -0.5);
    int _1157 = _1103 ? 0 : 1;
    float _1159 = _1137;
    if (_737)
    {
        _1159 = _1133;
    }
    float _1161 = _1159;
    float _1163 = -_1115;
    float _1165 = fma(_1113, _1155, _1163);
    int _1167 = int(_1003) + int(_1121);
    float _1169 = in.m_61.w;
    int _1171 = _1153 ? 0 : 1;
    float _1173 = fma(_1161, (*spvDescriptorSet0.vp_c9)._m0[80].x, -0.5);
    int _1175 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _1177 = _1175 != 0;
    int _1179 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _1181 = _1179 != 0;
    int _1183 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _1185 = _1183 != 0;
    int _1187 = _674 * _1167;
    int _1189 = _1187 + _939;
    int _1191 = ~_1171;
    int _1193 = _1191 + 1;
    int _1195 = _1193 + 1;
    float _1197 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _1199 = _646 + _1197;
    int _1201 = _1195;
    if (!_1141)
    {
        int _1203 = ~_1171;
        int _1205 = _1203 + 1;
        _1201 = _1205;
    }
    int _1207 = _1201;
    bool _1209 = uint(_1189) >= uint(_658);
    float _1211 = fma(_995, _1199, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _1213 = -(*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _1215 = _646 + _1213;
    float _1217 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _1219 = _646 + _1217;
    bool _1221 = !_1209;
    int _1223 = _1221 ? 0 : (-1);
    float _1225 = fma(_1033, _1215, (*spvDescriptorSet0.vp_c9)._m0[117].x);
    int _1227 = ~_1157;
    int _1229 = _1227 + 1;
    int _1231 = _1229 + 1;
    float _1233 = fma(_1139, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    int _1235 = ~_1167;
    int _1237 = _1235 + _1223;
    int _1239 = _1237 + 1;
    float _1241 = in.m_57.w;
    int _1243 = _1231;
    if (!_1085)
    {
        int _1245 = ~_1157;
        int _1247 = _1245 + 1;
        _1243 = _1247;
    }
    int _1249 = _1243;
    float _1251 = fma(_997, _1219, (*spvDescriptorSet0.vp_c9)._m0[116].x);
    bool _1253 = _646 >= (*spvDescriptorSet0.vp_c9)._m0[118].w;
    bool _1255 = isnan(_646);
    bool _1257 = _1253 || _1255;
    bool _1259 = isnan((*spvDescriptorSet0.vp_c9)._m0[118].w);
    bool _1261 = _1257 || _1259;
    float _1263 = float(_1261);
    int _1265 = _658 * _1239;
    int _1267 = _1265 + _939;
    bool _1269 = _1143 > 0.0;
    bool _1271 = _1143 >= 0.0;
    bool _1273 = isnan(_1143);
    bool _1275 = _1271 || _1273;
    bool _1277 = isnan(0.0);
    bool _1279 = _1275 || _1277;
    float _1281 = -_1263;
    float _1283 = _1281 + 1.0;
    bool _1285 = _646 >= (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _1287 = isnan(_646);
    bool _1289 = _1285 || _1287;
    bool _1291 = isnan((*spvDescriptorSet0.vp_c9)._m0[117].w);
    bool _1293 = _1289 || _1291;
    float _1295 = float(_1293);
    float _1297 = float(uint(_907));
    bool _1299 = !_829;
    int _1301 = _1299 ? _1267 : (-1);
    float _1303 = _1295 * _1283;
    float _1305 = -_1295;
    float _1307 = _1305 + 1.0;
    float _1309 = as_type<float>(_684) * _1297;
    int _1311 = _1301 >> 31;
    bool _1313 = _646 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _1315 = isnan(_646);
    bool _1317 = _1313 || _1315;
    bool _1319 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _1321 = _1317 || _1319;
    float _1323 = float(_1321);
    int _1325 = _1311 & 3;
    float _1327 = trunc(_1309);
    float _1329 = precise::max(_1327, 0.0);
    uint _1331 = uint(_1329);
    bool _1333 = _646 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _1335 = isnan(_646);
    bool _1337 = _1333 || _1335;
    bool _1339 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _1341 = _1337 || _1339;
    float _1343 = float(_1341);
    float _1345 = -_1323;
    float _1347 = _1345 + 1.0;
    float _1349 = _1323 * _1307;
    int _1351 = _1301 + _1325;
    float _1353 = _819 + _652;
    float _1355 = _1343 * _1347;
    float _1357 = -_1343;
    float _1359 = _1357 + 1.0;
    int _1361 = _1351 >> 2;
    float _1363 = _781 + _1241;
    float _1365 = _1211 * _1355;
    int _1367 = ~_658;
    int _1369 = _1367 + 1;
    float _1371 = _797 + _1169;
    int _1373 = _1361 << 4;
    int _1375 = _1373 + 368;
    float _1377 = fma(_1359, (*spvDescriptorSet0.vp_c9)._m0[115].x, _1365);
    int _1379 = _1279 ? 0 : 1;
    int _1381 = _1369 * int(_1331);
    int _1383 = _1381 + _907;
    uint _1385 = uint(int(uint(_1375) >> uint(2)));
    uint _1387 = uint(int(uint(int(_1385)) >> uint(2)));
    int _1389 = int(_1385) & 3;
    float _1391 = (*spvDescriptorSet0.vp_c9)._m0[int(_1387)][_1389];
    int _1393 = int(_1385) + 1;
    uint _1395 = uint(int(uint(_1393) >> uint(2)));
    int _1397 = _1393 & 3;
    float _1399 = (*spvDescriptorSet0.vp_c9)._m0[int(_1395)][_1397];
    int _1401 = _1301 & 3;
    bool _1403 = _1401 != 0;
    float _1405 = fma(_1251, _1349, _1377);
    int _1407 = ~_1379;
    int _1409 = _1407 + 1;
    int _1411 = _1409 + 1;
    float _1413 = fma(_1093, _1173, _1107);
    float _1415 = float(uint(_1383));
    float _1417 = fma(_1225, _1303, _1405);
    int _1419 = _1411;
    if (!_1269)
    {
        int _1421 = ~_1379;
        int _1423 = _1421 + 1;
        _1419 = _1423;
    }
    int _1425 = _1419;
    int _1427 = _1301 & 3;
    bool _1429 = _1427 != 0;
    float _1431 = as_type<float>(_684) * _1415;
    bool _1433 = !_1181;
    int _1435 = _1433 ? 0 : 1;
    float _1437 = fma(_1263, (*spvDescriptorSet0.vp_c9)._m0[118].x, _1417);
    bool _1439 = uint(_1427) > 1u;
    float _1441 = trunc(_1431);
    float _1443 = precise::max(_1441, 0.0);
    uint _1445 = uint(_1443);
    bool _1447 = !_1177;
    int _1449 = _1447 ? 0 : 1;
    int _1451 = abs(_1435);
    int _1453 = abs(_1449);
    float _1455 = float(_1249);
    int _1457 = _1375 + 8;
    uint _1459 = uint(int(uint(_1457) >> uint(2)));
    uint _1461 = uint(int(uint(int(_1459)) >> uint(2)));
    int _1463 = int(_1459) & 3;
    float _1465 = (*spvDescriptorSet0.vp_c9)._m0[int(_1461)][_1463];
    int _1467 = int(_1459) + 1;
    uint _1469 = uint(int(uint(_1467) >> uint(2)));
    int _1471 = _1467 & 3;
    float _1473 = (*spvDescriptorSet0.vp_c9)._m0[int(_1469)][_1471];
    float _1475 = float(_1451);
    int _1477 = _1403 ? 0 : 1;
    float _1479 = float(_1453);
    float _1481 = _1475 * _1455;
    float _1483 = float(_1425);
    int _1485 = ~_1477;
    int _1487 = _1485 + 1;
    int _1489 = _1487 + 1;
    int _1491 = _1489;
    if (!_1439)
    {
        int _1493 = ~_1477;
        int _1495 = _1493 + 1;
        _1491 = _1495;
    }
    int _1497 = _1491;
    float _1499 = _1413 + 0.5;
    int _1501 = ~_658;
    int _1503 = _1501 + 1;
    int _1505 = int(_1331) + int(_1445);
    float _1507 = _1479 * _1483;
    bool _1509 = !_1429;
    int _1511 = _1509 ? 0 : 1;
    float _1513 = _1165 + 0.5;
    int _1515 = abs(_1497);
    int _1517 = _1503 * _1505;
    int _1519 = _1517 + _907;
    int _1521 = abs(_1511);
    float _1523 = _1507 * (-2.0);
    out.m_73.x = _1499;
    out.m_73.y = _1513;
    int _1525 = ~_1521;
    int _1527 = _1525 + 1;
    int _1529 = _1527 + 1;
    int _1531 = ~_1515;
    int _1533 = _1531 + 1;
    int _1535 = _1533 + 1;
    bool _1537 = _1427 != 3;
    bool _1539 = uint(_1427) >= 2u;
    int _1541 = _1535 * as_type<int>(_1399);
    bool _1543 = uint(_1519) >= uint(_658);
    float _1545 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1547 = _1353 + _1545;
    int _1549 = _1539 ? 0 : 1;
    int _1551 = _1529 * as_type<int>(_1391);
    int _1553 = _1551 + _1541;
    int _1555 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2097152;
    bool _1557 = _1555 != 0;
    float _1559 = in.m_75.x;
    float _1561 = in.m_75.y;
    float _1563 = in.m_75.z;
    bool _1565 = _1427 != 3;
    int _1567 = ~_1549;
    int _1569 = _1567 + 1;
    int _1571 = _1569 + 1;
    bool _1573 = !_1543;
    int _1575 = _1573 ? 0 : (-1);
    int _1577 = _1571;
    if (_1537)
    {
        int _1579 = ~_1549;
        int _1581 = _1579 + 1;
        _1577 = _1581;
    }
    int _1583 = _1577;
    bool _1585 = !_1557;
    int _1587 = _1585 ? 0 : 1;
    bool _1589 = !_1565;
    int _1591 = _1589 ? 0 : (-1);
    int _1593 = ~_1505;
    int _1595 = _1593 + _1575;
    int _1597 = _1595 + 1;
    int _1599 = abs(_1587);
    float _1601 = _1547 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    int _1603 = abs(_1591);
    float _1605 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1607 = _1363 + _1605;
    int _1609 = abs(_1583);
    int _1611 = _658 * _1597;
    int _1613 = _1611 + _907;
    float _1615 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1617 = _1371 + _1615;
    float _1619 = fma(_1607, (*spvDescriptorSet0.vp_c8)._m0[28].x, _1601);
    float _1621 = _1481 * (-2.0);
    int _1623 = ~_1609;
    int _1625 = _1623 + 1;
    int _1627 = _1625 + 1;
    float _1629 = _690 + (-0.5);
    float _1631 = fma(_1617, (*spvDescriptorSet0.vp_c8)._m0[28].z, _1619);
    float _1633 = fma(_1233, _1621, _1233);
    float _1635 = fma(_1621, _1561, _1561);
    float _1637 = _1547 * _1547;
    int _1639 = ~_1603;
    int _1641 = _1639 + 1;
    int _1643 = _1641 + 1;
    int _1645 = _1627 * as_type<int>(_1465);
    int _1647 = _1645 + _1553;
    bool _1649 = _1631 >= 0.0;
    float _1651 = fma(_1607, _1607, _1637);
    int _1653 = ~_1599;
    int _1655 = _1653 + 1;
    int _1657 = _1655 + 1;
    int _1659 = _1643 * as_type<int>(_1473);
    int _1661 = _1659 + _1647;
    float _1663 = fma(_1051, _1523, _1051);
    float _1665 = fma(_1617, _1617, _1651);
    float _1667 = _614 * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    int _1669 = _1661 * _1657;
    bool _1671 = !_829;
    int _1673 = _1671 ? _1613 : (-1);
    float _1675 = fma(_1523, _1559, _1559);
    float _1677 = _616 * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _1679 = rsqrt(_1665);
    float _1681 = _1667 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    int _1683 = _1673 * _1599;
    int _1685 = _1683 + _1669;
    float _1687 = as_type<float>(_1643);
    if (_1649)
    {
        _1687 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _1689 = _1687;
    float _1691 = _612 * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _1693 = _1677 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1695 = _1437 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _1697 = _1691 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    int _1699 = as_type<int>(_1689);
    if (_1649)
    {
        float _1701 = _1689 * 5.0;
        _1699 = as_type<int>(_1701);
    }
    int _1703 = _1699;
    float _1705 = float(_1685);
    float _1707 = fma(_1629, (*spvDescriptorSet0.vp_c9)._m0[196].x, _1675);
    bool _1709 = !_1185;
    int _1711 = _1709 ? 0 : 1;
    out.m_77.x = _1697;
    out.m_77.y = _1681;
    out.m_77.z = _1693;
    out.m_77.w = _1695;
    float _1713 = _692 + (-0.5);
    float _1715 = float(_1207);
    float _1717 = fma(_1663, _1127, _1707);
    if (_1649)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _5819 = as_type<float>(_1703);
        out.gl_Position.z = _5819;
    }
    int _1719 = abs(_1711);
    float _1721 = _1547 * _1679;
    float _1723 = _1607 * _1679;
    out.m_79.x = _1705;
    float _1725 = _1721;
    if (_1649)
    {
        out.m_51.x = 0.0;
    }
    if (_1649)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _1727 = -_1721;
    float _1729 = fma(_1727, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1353);
    float _1731 = _1617 * _1679;
    float _1733 = -_1723;
    float _1735 = fma(_1733, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1363);
    float _1737 = float(_1719);
    float _1739 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1741 = _1729 + _1739;
    float _1743 = -_1731;
    float _1745 = fma(_1743, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1371);
    float _1747 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1749 = _1735 + _1747;
    float _1751 = _1029 + _690;
    float _1753 = _1741 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _1755 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1757 = _1745 + _1755;
    float _1759 = _1737 * _1715;
    float _1761 = fma(_1713, (*spvDescriptorSet0.vp_c9)._m0[196].y, _1635);
    float _1763 = fma(_1749, (*spvDescriptorSet0.vp_c8)._m0[28].x, _1753);
    float _1765 = _1751 + (-1.0);
    float _1767 = _1759 * (-2.0);
    float _1769 = fma(_1757, (*spvDescriptorSet0.vp_c8)._m0[28].z, _1763);
    float _1771 = -_1721;
    float _1773 = fma(_1771, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1547);
    float _1775 = fma(_1765, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _1777 = fma(_1767, _1563, _1563);
    float _1779 = _1029 + (-0.5);
    bool _1781 = _1769 >= 0.0;
    float _1783 = -_1723;
    float _1785 = fma(_1783, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1607);
    float _1787 = _1773 * _1773;
    float _1789 = fma(_1775, _1767, _1775);
    float _1791 = fma(_1779, (*spvDescriptorSet0.vp_c9)._m0[196].z, _1777);
    float _1793 = fma(_1633, _1127, _1761);
    float _1795 = fma(_1785, _1785, _1787);
    float _1797 = -_1731;
    float _1799 = fma(_1797, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1617);
    float _1801 = fma(_1789, _1127, _1791);
    float _1803 = _1717 * 0.15915493667125701904296875;
    float _1805 = _1793 * 0.15915493667125701904296875;
    float _1807 = fma(_1799, _1799, _1795);
    float _1809 = _1801 * 0.15915493667125701904296875;
    float _1811 = _1777;
    float _1813 = _1741;
    float _1815 = _1735;
    if (_1781)
    {
        _1811 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _1817 = _1811;
    float _1819 = _1803 * 6.283185482025146484375;
    float _1821 = sin(_1819);
    int _1823 = as_type<int>(_1817);
    if (_1781)
    {
        out.m_51.x = 0.0;
    }
    if (_1781)
    {
        float _1825 = _1817 * 5.0;
        _1823 = as_type<int>(_1825);
    }
    int _1827 = _1823;
    float _1829 = _1803 * 6.283185482025146484375;
    float _1831 = cos(_1829);
    if (_1781)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _6021 = as_type<float>(_1827);
        out.gl_Position.z = _6021;
    }
    float _1833 = _1805 * 6.283185482025146484375;
    float _1835 = sin(_1833);
    float _1837 = _1805 * 6.283185482025146484375;
    float _1839 = cos(_1837);
    float _1841 = sqrt(_1807);
    if (_1781)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _1843 = in.m_81.x;
    float _1845 = in.m_81.y;
    float _1847 = in.m_81.z;
    float _1849 = _1809 * 6.283185482025146484375;
    float _1851 = cos(_1849);
    float _1853 = _1679 * _1841;
    float _1855 = _552 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _1857 = _604 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _1859 = _1821 * _1835;
    float _1861 = _1821 * _1839;
    float _1863 = _1831 * _1839;
    float _1865 = _1831 * _1835;
    float _1867 = _1809 * 6.283185482025146484375;
    float _1869 = sin(_1867);
    float _1871 = _554 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _1873 = _1853 * _1857;
    float _1875 = _1821 * _1851;
    float _1877 = _1853 * _1855;
    float _1879 = _1831 * _1851;
    float _1881 = _1839 * _1851;
    float _1883 = _1835 * _1851;
    float _1885 = _1879 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _1887 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _1845);
    float _1889 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _1843);
    float _1891 = _1879 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _1893 = _1879 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _1895 = _1887 * _1877;
    float _1897 = _1853 * _1871;
    float _1899 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _1847);
    float _1901 = _1889 * _1873;
    float _1903 = fma(_1869, _1863, _1859);
    float _1905 = _1879 * _1895;
    float _1907 = _1899 * _1897;
    float _1909 = -_1861;
    float _1911 = fma(_1869, _1865, _1909);
    float _1913 = -_1895;
    float _1915 = _1869 * _1913;
    float _1917 = fma(_1903, _1901, _1905);
    float _1919 = -_1865;
    float _1921 = fma(_1869, _1861, _1919);
    float _1923 = _1875 * _1895;
    float _1925 = fma(_1881, _1901, _1915);
    float _1927 = fma(_1911, _1907, _1917);
    float _1929 = fma(_1869, _1859, _1863);
    float _1931 = fma(_1921, _1901, _1923);
    float _1933 = fma(_1883, _1907, _1925);
    float _1935 = _1927 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _1937 = _1927 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _1939 = fma(_1929, _1907, _1931);
    float _1941 = _1903 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _1943 = fma(_1933, (*spvDescriptorSet0.vp_c8)._m0[24].x, _1935);
    float _1945 = fma(_1933, (*spvDescriptorSet0.vp_c8)._m0[26].x, _1937);
    float _1947 = _1903 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _1949 = _1903 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _1951 = fma(_1939, (*spvDescriptorSet0.vp_c8)._m0[24].z, _1943);
    float _1953 = fma(_1939, (*spvDescriptorSet0.vp_c8)._m0[26].z, _1945);
    float _1955 = fma(_1881, (*spvDescriptorSet0.vp_c8)._m0[24].x, _1941);
    float _1957 = fma(_1881, (*spvDescriptorSet0.vp_c8)._m0[25].x, _1947);
    float _1959 = _1951 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _1961 = _1953 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _1963 = fma(_1881, (*spvDescriptorSet0.vp_c8)._m0[26].x, _1949);
    float _1965 = -_1869;
    float _1967 = fma(_1965, (*spvDescriptorSet0.vp_c8)._m0[24].x, _1885);
    float _1969 = _1363 + _1959;
    float _1971 = _1371 + _1961;
    float _1973 = in.m_83.x;
    float _1975 = in.m_83.y;
    float _1977 = in.m_83.z;
    float _1979 = -_1869;
    float _1981 = fma(_1979, (*spvDescriptorSet0.vp_c8)._m0[25].x, _1891);
    float _1983 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1985 = _1969 + _1983;
    float _1987 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1989 = _1971 + _1987;
    bool _1991 = _1845 != 0.0;
    bool _1993 = isnan(_1845);
    bool _1995 = _1991 || _1993;
    bool _1997 = isnan(0.0);
    bool _1999 = _1995 || _1997;
    float _2001 = -_1869;
    float _2003 = fma(_2001, (*spvDescriptorSet0.vp_c8)._m0[26].x, _1893);
    float _2005 = _1985 * _1985;
    float _2007 = _1989 * _1989;
    float _2009 = _1927 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    bool _2011 = _1843 == 0.0;
    bool _2013 = !_1999;
    bool _2015 = _2011 && _2013;
    float _2017 = _1911 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _2019 = _2005 + _2007;
    float _2021 = fma(_1933, (*spvDescriptorSet0.vp_c8)._m0[25].x, _2009);
    bool _2023 = _1847 == 0.0;
    bool _2025 = _2023 && _2015;
    float _2027 = fma(_1921, (*spvDescriptorSet0.vp_c8)._m0[24].z, _1955);
    float _2029 = sqrt(_2019);
    float _2031 = fma(_1939, (*spvDescriptorSet0.vp_c8)._m0[25].z, _2021);
    float _2033 = _1911 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _2035 = _1911 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _2037 = fma(_1883, (*spvDescriptorSet0.vp_c8)._m0[24].x, _2017);
    float _2039 = _2031 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _2041 = fma(_1883, (*spvDescriptorSet0.vp_c8)._m0[25].x, _2033);
    float _2043 = fma(_1883, (*spvDescriptorSet0.vp_c8)._m0[26].x, _2035);
    float _2045 = fma(_1921, (*spvDescriptorSet0.vp_c8)._m0[25].z, _1957);
    float _2047 = _1353 + _2039;
    float _2049 = fma(_1921, (*spvDescriptorSet0.vp_c8)._m0[26].z, _1963);
    float _2051 = _1973;
    float _2053 = _1975;
    float _2055 = _1977;
    float _2057 = _1843;
    float _2059 = _2005;
    float _2061 = _2007;
    float _2063 = _1969;
    float _2065 = _1971;
    float _2067 = _1847;
    if (!_2025)
    {
        float _2069 = fma(_1843, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1973);
        _2051 = _2069;
    }
    float _2071 = _2051;
    if (!_2025)
    {
        float _2073 = fma(_1845, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1975);
        _2053 = _2073;
    }
    float _2075 = _2053;
    if (!_2025)
    {
        float _2077 = fma(_1847, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1977);
        _2055 = _2077;
    }
    float _2079 = _2055;
    bool _2081 = _2029 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    if (!_2081)
    {
        _2057 = _2047;
    }
    float _2083 = _2057;
    bool _2085 = !_2081;
    float _2087 = _2083;
    if (!_2085)
    {
        float _2089 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _2091 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _2093 = _2029 + _2091;
        float _2095 = _2047 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _2097 = rsqrt(_2019);
        float _2099 = _2093 * _2089;
        float _2101 = _2099 * 0.15915493667125701904296875;
        float _2103 = _2101 * 6.283185482025146484375;
        float _2105 = sin(_2103);
        float _2107 = _2101 * 6.283185482025146484375;
        float _2109 = cos(_2107);
        float _2111 = fma(_2105, _2095, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _2113 = _2097 * _2111;
        float _2115 = _2109 + (-1.0);
        float _2117 = fma(_1985, _2113, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _2119 = fma(_1989, _2113, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        float _2121 = _2115 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _2123 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
        float _2125 = _2117 + _2123;
        float _2127 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
        float _2129 = _2119 + _2127;
        float _2131 = fma(_2047, _2109, _2121);
        float _2133 = _2125 * _2125;
        float _2135 = _2129 * _2129;
        _2087 = _2131;
        _2059 = _2133;
        _2061 = _2135;
        _2063 = _2117;
        _2065 = _2119;
        _2067 = _2113;
    }
    float _2137 = _2087;
    float _2139 = _2059;
    float _2141 = _2061;
    float _2143 = _2063;
    float _2145 = _2065;
    float _2147 = _2067;
    float _2149 = -(*spvDescriptorSet0.vp_c15)._m0[0].y;
    float _2151 = _2137 + _2149;
    float _2153 = fma(_1875, (*spvDescriptorSet0.vp_c8)._m0[24].z, _1967);
    float _2155 = fma(_1875, (*spvDescriptorSet0.vp_c8)._m0[25].z, _1981);
    float _2157 = fma(_1875, (*spvDescriptorSet0.vp_c8)._m0[26].z, _2003);
    float _2159 = fma(_2151, _2151, _2139);
    float _2161 = _2153 * _2075;
    float _2163 = _2155 * _2075;
    float _2165 = _2157 * _2075;
    float _2167 = _2159 + _2141;
    float _2169 = fma(_1929, (*spvDescriptorSet0.vp_c8)._m0[24].z, _2037);
    float _2171 = fma(_1929, (*spvDescriptorSet0.vp_c8)._m0[25].z, _2041);
    float _2173 = fma(_2027, _2071, _2161);
    float _2175 = fma(_2045, _2071, _2163);
    float _2177 = fma(_1929, (*spvDescriptorSet0.vp_c8)._m0[26].z, _2043);
    float _2179 = sqrt(_2167);
    float _2181 = fma(_2049, _2071, _2165);
    float _2183 = fma(_2169, _2079, _2173);
    float _2185 = fma(_2171, _2079, _2175);
    float _2187 = fma(_2177, _2079, _2181);
    out.m_85.x = _2183;
    out.m_85.y = _2185;
    out.m_85.z = _2187;
    bool _2189 = _2179 >= (*spvDescriptorSet0.vp_c16)._m0[1].x;
    bool _2191 = isnan(_2179);
    bool _2193 = _2189 || _2191;
    bool _2195 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].x);
    bool _2197 = _2193 || _2195;
    float _2199 = _2147;
    if (!_2197)
    {
        _2199 = 1.0;
    }
    float _2201 = _2199;
    bool _2203 = !_2197;
    float _2205 = _2201;
    if (!_2203)
    {
        bool _2207 = _2179 >= (*spvDescriptorSet0.vp_c16)._m0[1].y;
        bool _2209 = isnan(_2179);
        bool _2211 = _2207 || _2209;
        bool _2213 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].y);
        bool _2215 = _2211 || _2213;
        if (!_2215)
        {
            float _2217 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _2219 = _2179 + _2217;
            float _2221 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _2223 = (*spvDescriptorSet0.vp_c16)._m0[1].y + _2221;
            float _2225 = -(*spvDescriptorSet0.vp_c16)._m0[2].x;
            float _2227 = _2225 + (*spvDescriptorSet0.vp_c16)._m0[2].y;
            float _2229 = 1.0 / _2223;
            float _2231 = _2219 * _2229;
            float _2233 = fma(_2231, _2227, (*spvDescriptorSet0.vp_c16)._m0[2].x);
            _2205 = _2233;
            _2235 = true;
        }
        else
        {
            bool _2237 = _2179 >= (*spvDescriptorSet0.vp_c16)._m0[1].z;
            bool _2239 = isnan(_2179);
            bool _2241 = _2237 || _2239;
            bool _2243 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].z);
            bool _2245 = _2241 || _2243;
            if (!_2245)
            {
                float _2247 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _2249 = _2179 + _2247;
                float _2251 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _2253 = _2251 + (*spvDescriptorSet0.vp_c16)._m0[1].z;
                float _2255 = -(*spvDescriptorSet0.vp_c16)._m0[2].y;
                float _2257 = _2255 + (*spvDescriptorSet0.vp_c16)._m0[2].z;
                float _2259 = 1.0 / _2253;
                float _2261 = _2249 * _2259;
                float _2263 = fma(_2261, _2257, (*spvDescriptorSet0.vp_c16)._m0[2].y);
                _2205 = _2263;
                _2235 = true;
            }
            else
            {
                _2205 = (*spvDescriptorSet0.vp_c16)._m0[2].z;
            }
        }
    }
    _2235 = false;
    float _2265 = _2205;
    float _2267 = -(*spvDescriptorSet0.vp_c16)._m0[0].y;
    float _2269 = _2137 + _2267;
    float _2271 = _1729 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _2273 = -(*spvDescriptorSet0.vp_c16)._m0[0].x;
    float _2275 = _2143 + _2273;
    float _2277 = -(*spvDescriptorSet0.vp_c16)._m0[0].z;
    float _2279 = _2145 + _2277;
    float _2281 = fma(_2269, _2265, (*spvDescriptorSet0.vp_c16)._m0[0].y);
    float _2283 = fma(_1735, (*spvDescriptorSet0.vp_c8)._m0[11].x, _2271);
    float _2285 = fma(_2275, _2265, (*spvDescriptorSet0.vp_c16)._m0[0].x);
    float _2287 = fma(_2279, _2265, (*spvDescriptorSet0.vp_c16)._m0[0].z);
    float _2289 = -_1353;
    float _2291 = _2289 + _2281;
    float _2293 = fma(_1745, (*spvDescriptorSet0.vp_c8)._m0[11].z, _2283);
    float _2295 = -_1363;
    float _2297 = _2295 + _2285;
    float _2299 = _1729 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _2301 = _2291 * _2291;
    float _2303 = _2293 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _2305 = -_1371;
    float _2307 = _2305 + _2287;
    float _2309 = fma(_1735, (*spvDescriptorSet0.vp_c8)._m0[10].x, _2299);
    float _2311 = fma(_2297, _2297, _2301);
    float _2313 = 1.0 / _2303;
    float _2315 = fma(_1745, (*spvDescriptorSet0.vp_c8)._m0[10].z, _2309);
    float _2317 = fma(_2307, _2307, _2311);
    float _2319 = _2315 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _2321 = sqrt(_2317);
    float _2323 = _2319 + _2303;
    float _2325 = _2323 * _2313;
    float _2327 = _2325 * 0.5;
    float _2329 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _2331 = fma(_2327, (*spvDescriptorSet0.vp_c8)._m0[30].w, _2329);
    bool _2333 = _2321 > 0.0;
    float _2335 = 1.0 / _2331;
    bool _2337 = (*spvDescriptorSet0.vp_c15)._m0[653].w >= 0.5;
    bool _2339 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _2341 = _2337 || _2339;
    bool _2343 = isnan(0.5);
    bool _2345 = _2341 || _2343;
    bool _2347 = (*spvDescriptorSet0.vp_c15)._m0[660].y >= 0.5;
    bool _2349 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _2351 = _2347 || _2349;
    bool _2353 = isnan(0.5);
    bool _2355 = _2351 || _2353;
    bool _2357 = !_2333;
    float _2359 = _2281;
    float _2361 = _2285;
    float _2363 = _2287;
    if (!_2357)
    {
        float _2365 = _212 * _212;
        float _2367 = rsqrt(_2317);
        float _2369 = fma(_208, _208, _2365);
        float _2371 = fma(_214, _214, _2369);
        float _2373 = sqrt(_2371);
        float _2375 = _2297 * _2367;
        float _2377 = _2291 * _2367;
        float _2379 = _2307 * _2367;
        bool _2381 = _2373 > 0.0;
        bool _2383 = !_2381;
        if (!_2383)
        {
            float _2385 = rsqrt(_2371);
            float _2387 = 1.0 / (*spvDescriptorSet0.vp_c10)._m0[2].z;
            float _2389 = _212 * _2385;
            float _2391 = _208 * _2385;
            float _2393 = _2377 * _2389;
            float _2395 = _214 * _2385;
            float _2397 = fma(_2375, _2391, _2393);
            float _2399 = _2387 * (*spvDescriptorSet0.vp_c9)._m0[142].x;
            float _2401 = fma(_2379, _2395, _2397);
            float _2403 = _2401 * _2399;
            float _2405 = fma(_208, _2403, _2285);
            float _2407 = fma(_212, _2403, _2281);
            float _2409 = fma(_214, _2403, _2287);
            _2359 = _2407;
            _2361 = _2405;
            _2363 = _2409;
        }
    }
    float _2411 = _2359;
    float _2413 = _2361;
    float _2415 = _2363;
    float _2417 = -_1721;
    float _2419 = fma(_2417, (*spvDescriptorSet0.vp_c9)._m0[18].w, _2411);
    float _2421 = -_1723;
    float _2423 = fma(_2421, (*spvDescriptorSet0.vp_c9)._m0[18].w, _2413);
    float _2425 = -_1731;
    float _2427 = fma(_2425, (*spvDescriptorSet0.vp_c9)._m0[18].w, _2415);
    float _2429 = _2419;
    float _2431 = _2423;
    float _2433 = _2427;
    if (_2345)
    {
        _1725 = 1.0;
    }
    float _2435 = _1725;
    float _2437 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _2439 = _2335 * _2437;
    float _2441 = _2435;
    if (!_2355)
    {
        float _2443 = _1741 * _1741;
        float _2445 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _2447 = -_1371;
        float _2449 = _2447 + _2415;
        float _2451 = -_1363;
        float _2453 = _2451 + _2413;
        float _2455 = fma(_1749, _1749, _2443);
        float _2457 = fma(_1757, _1757, _2455);
        float _2459 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _2461 = sqrt(_2457);
        float _2463 = 1.0 / _1853;
        float _2465 = _2459 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _2467 = precise::min(_2461, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _2469 = _2467 * _2445;
        float _2471 = -_1353;
        float _2473 = _2471 + _2411;
        float _2475 = _2469 * _2463;
        float _2477 = _2465 * _2475;
        float _2479 = _2449 * _2475;
        float _2481 = fma(_2473, _2477, _1729);
        float _2483 = fma(_2453, _2477, _1735);
        float _2485 = fma(_2465, _2479, _1745);
        _2429 = _2481;
        _2431 = _2483;
        _2433 = _2485;
        _1813 = _2465;
    }
    float _2487 = _2429;
    float _2489 = _2431;
    float _2491 = _2433;
    float _2493 = _1813;
    float _2495 = _2493;
    if (!_2345)
    {
        float _2497 = (*spvDescriptorSet0.vp_c8)._m0[31].x * 0.5;
        float _2499 = _2497 * 0.15915493667125701904296875;
        float _2501 = _2499 * 6.283185482025146484375;
        float _2503 = cos(_2501);
        float _2505 = (*spvDescriptorSet0.vp_c8)._m0[31].y * 0.5;
        float _2507 = _2505 * 0.15915493667125701904296875;
        float _2509 = _2499 * 6.283185482025146484375;
        float _2511 = sin(_2509);
        float _2513 = 1.0 / _2503;
        float _2515 = _2507 * 6.283185482025146484375;
        float _2517 = cos(_2515);
        float _2519 = _2511 * _2513;
        float _2521 = _2507 * 6.283185482025146484375;
        float _2523 = sin(_2521);
        float _2525 = _2517 * _2519;
        float _2527 = 1.0 / _2525;
        float _2529 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _2531 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _2529;
        float _2533 = 1.0 / _2531;
        float _2535 = _2523 * _2527;
        float _2537 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _2539 = fma(_2439, _2535, _2537);
        float _2541 = _2539 * _2533;
        float _2543 = precise::clamp(_2541, 0.0, 1.0);
        _2441 = _2543;
    }
    float _2545 = _2441;
    float _2547 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _2549 = _2487 + _2547;
    float _2551 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _2553 = _2489 + _2551;
    float _2555 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _2557 = _2491 + _2555;
    float _2559 = _2549 * _2549;
    float _2561 = fma(_2553, _2553, _2559);
    float _2563 = fma(_2557, _2557, _2561);
    float _2565 = rsqrt(_2563);
    float _2567 = sqrt(_2563);
    float _2569 = _2565 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _2571 = _2553 * _2569;
    float _2573 = _2557 * _2569;
    float _2575 = _2571 * _2571;
    float _2577 = _2573 * _2573;
    float _2579 = _2575 + _2577;
    float _2581 = sqrt(_2579);
    bool _2583 = _2581 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2585 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2587 = _2581 + _2585;
    float _2589 = _2565;
    float _2591 = _2587;
    float _2593 = _2549;
    float _2595 = (*spvDescriptorSet0.vp_c15)._m0[652].x;
    if (_2583)
    {
        float _2597 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2589 = _2597;
    }
    float _2599 = _2589;
    float _2601 = _2599;
    if (_2583)
    {
        float _2603 = _2587 * _2599;
        _2591 = _2603;
    }
    float _2605 = _2591;
    if (_2583)
    {
        float _2607 = rsqrt(_2579);
        _2601 = _2607;
    }
    float _2609 = _2601;
    float _2611 = _2609;
    if (_2583)
    {
        float _2613 = _2605 * 0.15915493667125701904296875;
        _2495 = _2613;
    }
    float _2615 = _2495;
    float _2617 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _2619 = _2557;
    float _2621 = _2615;
    if (_2583)
    {
        float _2623 = _2615 * 6.283185482025146484375;
        float _2625 = sin(_2623);
        _2619 = _2625;
    }
    float _2627 = _2619;
    float _2629 = precise::max(0.0, _2617);
    float _2631 = _1729;
    if (_2583)
    {
        float _2633 = _2615 * 6.283185482025146484375;
        float _2635 = cos(_2633);
        _2631 = _2635;
    }
    float _2637 = _2631;
    float _2639 = -_2569;
    float _2641 = -_2629;
    float _2643 = fma(_2549, _2639, _2641);
    float _2645 = fma(_1735, (*spvDescriptorSet0.vp_c15)._m0[652].x, (*spvDescriptorSet0.vp_c15)._m0[652].z);
    if (!_2583)
    {
        _1815 = _2571;
    }
    float _2647 = _1815;
    float _2649 = _2647;
    if (_2583)
    {
        float _2651 = _2643 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2593 = _2651;
    }
    float _2653 = _2593;
    float _2655 = _2627;
    float _2657 = _2653;
    if (_2583)
    {
        float _2659 = fma(_2627, _2653, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _2655 = _2659;
    }
    float _2661 = _2655;
    float _2663 = _2661;
    if (_2583)
    {
        float _2665 = _2609 * _2661;
        _2595 = _2665;
    }
    float _2667 = _2595;
    if (!_2583)
    {
        _2611 = _2643;
    }
    float _2669 = _2611;
    float _2671 = _2669;
    float _2673 = _2637;
    if (_2583)
    {
        float _2675 = _2637 + (-1.0);
        _2657 = _2675;
    }
    float _2677 = _2657;
    float _2679 = _2677;
    if (_2583)
    {
        float _2681 = _2571 * _2667;
        _2649 = _2681;
    }
    float _2683 = _2649;
    if (!_2583)
    {
        _2663 = _2575;
    }
    float _2685 = _2663;
    float _2687 = _2685;
    if (_2583)
    {
        float _2689 = _2677 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2621 = _2689;
    }
    float _2691 = _2621;
    if (!_2583)
    {
        _2679 = _2573;
    }
    float _2693 = _2679;
    float _2695 = _2693;
    if (_2583)
    {
        float _2697 = _2683 * _2683;
        _2687 = _2697;
    }
    float _2699 = _2687;
    if (_2583)
    {
        float _2701 = _2573 * _2667;
        _2695 = _2701;
    }
    float _2703 = _2695;
    if (_2583)
    {
        float _2705 = fma(_2643, _2637, _2691);
        _2671 = _2705;
    }
    float _2707 = _2671;
    if (!_2583)
    {
        _2673 = _2577;
    }
    float _2709 = _2673;
    float _2711 = floor(_2645);
    float _2713 = _2709;
    if (_2583)
    {
        float _2715 = _2703 * _2703;
        _2713 = _2715;
    }
    float _2717 = _2713;
    float _2719 = fma(_2707, _2707, _2699);
    float _2721 = _2487 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _2723 = _2719 + _2717;
    float _2725 = fma(_2489, (*spvDescriptorSet0.vp_c8)._m0[2].x, _2721);
    float _2727 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _2729 = fma(_2567, (*spvDescriptorSet0.vp_c15)._m0[23].w, _2727);
    float _2731 = precise::clamp(_2729, 0.0, 1.0);
    float _2733 = rsqrt(_2723);
    float _2735 = fma(_2491, (*spvDescriptorSet0.vp_c8)._m0[2].z, _2725);
    float _2737 = -_2731;
    float _2739 = _2737 + 1.0;
    float _2741 = fma(_1745, (*spvDescriptorSet0.vp_c15)._m0[652].y, (*spvDescriptorSet0.vp_c15)._m0[652].w);
    float _2743 = _2735 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _2745 = _2487 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _2747 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _2749 = abs(_2739);
    float _2751 = log2(_2749);
    float _2753 = _2743 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _2755 = _2487 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _2757 = fma(_2489, (*spvDescriptorSet0.vp_c8)._m0[3].x, _2745);
    float _2759 = -_2753;
    float _2761 = fma(_2759, _2747, 1.0);
    float _2763 = _2487 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _2765 = fma(_2489, (*spvDescriptorSet0.vp_c8)._m0[1].x, _2755);
    float _2767 = _2733 * _2683;
    float _2769 = _2733 * _2707;
    float _2771 = fma(_2489, (*spvDescriptorSet0.vp_c8)._m0[0].x, _2763);
    float _2773 = fma(_2491, (*spvDescriptorSet0.vp_c8)._m0[1].z, _2765);
    float _2775 = _2767 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _2777 = _2733 * _2703;
    float _2779 = fma(_2491, (*spvDescriptorSet0.vp_c8)._m0[0].z, _2771);
    float _2781 = _2773 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _2783 = -_2775;
    float _2785 = fma(_2769, (*spvDescriptorSet0.vp_c15)._m0[21].y, _2783);
    float _2787 = floor(_2741);
    float _2789 = _2779 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _2791 = _2781 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _2793 = -_2777;
    float _2795 = fma(_2793, (*spvDescriptorSet0.vp_c15)._m0[21].z, _2785);
    float _2797 = fma(_2491, (*spvDescriptorSet0.vp_c8)._m0[3].z, _2757);
    float _2799 = _2751 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _2801 = fma(_2789, (*spvDescriptorSet0.vp_c8)._m0[7].x, _2791);
    float _2803 = fma(_2795, -0.5, 0.5);
    float _2805 = _2797 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _2807 = exp2(_2799);
    float _2809 = fma(_2743, (*spvDescriptorSet0.vp_c8)._m0[7].z, _2801);
    float _2811 = -_2711;
    float _2813 = _2645 + _2811;
    float _2815 = fma(_2795, 0.5, 0.5);
    float _2817 = fma(_2805, (*spvDescriptorSet0.vp_c8)._m0[7].w, _2809);
    float _2819 = _2781 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _2821 = _2781 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _2823 = log2(_2761);
    float _2825 = fma(_2789, (*spvDescriptorSet0.vp_c8)._m0[5].x, _2821);
    float _2827 = fma(_2743, (*spvDescriptorSet0.vp_c8)._m0[5].z, _2825);
    float _2829 = 1.0 / _2817;
    float _2831 = -_2787;
    float _2833 = _2741 + _2831;
    float _2835 = fma(_2815, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _2837 = fma(_2789, (*spvDescriptorSet0.vp_c8)._m0[4].x, _2819);
    float _2839 = _2769 + 1.0;
    float _2841 = fma(_2815, _2835, -0.212114393711090087890625);
    float _2843 = fma(_2743, (*spvDescriptorSet0.vp_c8)._m0[4].z, _2837);
    float _2845 = sqrt(_2803);
    float _2847 = -_2769;
    float _2849 = fma(_2807, _2839, _2847);
    float _2851 = fma(_2805, (*spvDescriptorSet0.vp_c8)._m0[5].w, _2827);
    float _2853 = fma(_2805, (*spvDescriptorSet0.vp_c8)._m0[4].w, _2843);
    float _2855 = _2823 * 0.693147182464599609375;
    float2 _7707 = float2(_2813, _2833);
    float _2857 = dm_bs(spvDescriptorSet0.vp_t_tcb_24.sample(spvDescriptorSet0.vp_t_tcb_24Smplr, select(_7707, float2(0.0), isnan(_7707)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_24, spvDescriptorSet0.vp_t_tcb_24Smplr_w, select(_7707, float2(0.0), isnan(_7707)), level(0.0)).x;
    float _2859 = fma(_2815, _2841, 1.570728778839111328125);
    float _2861 = fma(_2849, 0.5, 0.5);
    float _2863 = _2853 * _2829;
    float _2865 = _2851 * _2829;
    float _2867 = _2855 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _2869 = fma(_2863, 0.5, 0.5);
    float _2871 = fma(_2865, -0.5, 0.5);
    float _2873 = _2845 * 0.636619746685028076171875;
    float3 _7741 = float3(_2869, _2871, _2867);
    float _2875 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_7741, float3(0.0), isnan(_7741)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_7741, float3(0.0), isnan(_7741)), level(0.0)).x;
    float _2877 = -_2859;
    float _2879 = fma(_2873, _2877, 1.0);
    float3 _7757 = float3(_2869, _2871, _2867);
    float4 _2882 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_7757, float3(0.0), isnan(_7757)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_7757, float3(0.0), isnan(_7757)), level(0.0)).xyzw;
    float _2884 = _2882.x;
    float _2886 = _2882.y;
    float _2888 = _2882.z;
    float _2890 = _2882.w;
    float2 _7773 = float2(_2879, _2861);
    float3 _2894 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_7773, float2(0.0), isnan(_7773)), level(0.0)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_7773, float2(0.0), isnan(_7773)), level(0.0)).xyz;
    float _2896 = _2894.x;
    float _2898 = _2894.y;
    float _2900 = _2894.z;
    float _2902 = abs(_2439);
    float _2904 = log2(_2902);
    float _2906 = _2781 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _2908 = _2853 + _2817;
    float _2910 = fma(_2789, (*spvDescriptorSet0.vp_c8)._m0[6].x, _2906);
    bool _2912 = _2567 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _2914 = isnan(_2567);
    bool _2916 = _2912 || _2914;
    bool _2918 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _2920 = _2916 || _2918;
    float _2922 = _2908 * 0.5;
    float _2924 = fma(_2743, (*spvDescriptorSet0.vp_c8)._m0[6].z, _2910);
    float _2926 = _2751 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    bool _2928 = _2439 <= 8000.0;
    bool _2930 = isnan(_2439);
    bool _2932 = _2928 || _2930;
    bool _2934 = isnan(8000.0);
    bool _2936 = _2932 || _2934;
    float _2938 = float(_2936);
    float _2940 = fma(_2805, (*spvDescriptorSet0.vp_c8)._m0[6].w, _2924);
    float _2942 = in.m_87.x;
    float _2944 = _2904 * (*spvDescriptorSet0.vp_c15)._m0[654].z;
    float _2946 = exp2(_2926);
    out.gl_Position.x = _2853;
    out.gl_Position.y = _2851;
    out.gl_Position.z = _2940;
    out.gl_Position.w = _2817;
    float _2948 = exp2(_2944);
    float _2950 = -_2946;
    float _2952 = _2950 + 1.0;
    float _2954 = _2952 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _2956 = fma(_2948, (*spvDescriptorSet0.vp_c15)._m0[654].x, (*spvDescriptorSet0.vp_c15)._m0[654].y);
    float _2958 = precise::clamp(_2956, 0.0, 1.0);
    float _2960 = _2940 + _2817;
    float _2962 = -_2954;
    float _2964 = _2962 + 1.0;
    float _2966 = _2940;
    float _2968 = _2817;
    float _2970 = _2851;
    float _2972 = _2954;
    float _2974 = _2964;
    if (!_2920)
    {
        _2966 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _2976 = _2966;
    float _2978 = fma(_2958, -2.0, 3.0);
    float _2980 = _2958 * _2958;
    float _2982 = _2960 * 0.5;
    float _2984 = _2980 * _2978;
    float _2986 = -_2984;
    float _2988 = _2986 + 1.0;
    float _2990 = fma(_2988, (*spvDescriptorSet0.vp_c15)._m0[654].w, _2984);
    float _2992 = _2817 * 0.5;
    float _2994 = _2938 * _2990;
    float _2996 = fma(_2851, -0.5, _2992);
    float _2998 = _2976;
    float _3000 = _2976;
    if (!_2920)
    {
        _2968 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _3002 = _2968;
    float _3004 = _2994 * (*spvDescriptorSet0.vp_c15)._m0[653].x;
    out.m_89.x = _2922;
    out.m_89.y = _2996;
    out.m_89.z = _2982;
    out.m_89.w = _2817;
    float _3006 = _3002;
    float _3008 = _3002;
    if (!_2920)
    {
        _2970 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _3010 = _2970;
    float _3012 = -_2857;
    float _3014 = _3012 + 1.0;
    float _3016 = _3014 * _3004;
    float _3018 = precise::clamp(_3016, 0.0, 1.0);
    float _3020 = -_3018;
    float _3022 = fma(_3020, (*spvDescriptorSet0.vp_c15)._m0[653].y, 1.0);
    float _3024 = _2954 * _2875;
    float _3026 = _3022 * _2942;
    float _3028 = _3026;
    float _3030 = _3010;
    float _3032 = _3010;
    if (!_2920)
    {
        _2972 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _3034 = _2972;
    float _3036 = _2890 * _3024;
    float _3038 = _2890 * _2964;
    float _3040 = _3034;
    float _3042 = _3034;
    if (!_2920)
    {
        _2974 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _3044 = _2974;
    float _3046 = _2900 * _3024;
    float _3048 = fma(_2896, _3036, _2884);
    float _3050 = fma(_2898, _3036, _2886);
    float _3052 = _3026 * (*spvDescriptorSet0.vp_c13)._m0[1].w;
    float _3054 = fma(_2890, _3046, _2888);
    float _3056 = _2545 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _3058 = _3044;
    float _3060 = _3044;
    if (!_2920)
    {
        _3028 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _3062 = _3028;
    out.m_91.x = _3052;
    out.m_93.x = _3048;
    out.m_93.y = _3050;
    out.m_93.z = _3054;
    out.m_93.w = _3038;
    bool _3064 = !_2920;
    float _3066 = _3062;
    float _3068 = _3062;
    if (!_3064)
    {
        bool _3070 = _2567 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _3072 = isnan(_2567);
        bool _3074 = _3070 || _3072;
        bool _3076 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _3078 = _3074 || _3076;
        if (!_3078)
        {
            float _3080 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _3082 = _2567 + _3080;
            float _3084 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _3086 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _3084;
            float _3088 = 1.0 / _3086;
            float _3090 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _3092 = _3090 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _3094 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _3096 = _3094 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _3098 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _3100 = _3098 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _3102 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _3104 = _3102 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _3106 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _3108 = _3106 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _3110 = _3082 * _3088;
            float _3112 = precise::clamp(_3110, 0.0, 1.0);
            float _3114 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _3116 = _3114 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _3118 = fma(_3112, _3092, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _3120 = fma(_3112, _3116, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _3122 = fma(_3112, _3096, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _3124 = fma(_3112, _3100, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _3126 = fma(_3112, _3104, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _3128 = fma(_3112, _3108, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            _3068 = _3120;
            _3032 = _3126;
            _3042 = _3118;
            _3000 = _3124;
            _3008 = _3122;
            _3060 = _3128;
            _3130 = true;
        }
        else
        {
            bool _3132 = _2567 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _3134 = isnan(_2567);
            bool _3136 = _3132 || _3134;
            bool _3138 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _3140 = _3136 || _3138;
            if (!_3140)
            {
                _3040 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _3142 = _3040;
            _3042 = _3142;
            if (!_3140)
            {
                _3066 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _3144 = _3066;
            _3068 = _3144;
            if (!_3140)
            {
                _3006 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _3146 = _3006;
            _3008 = _3146;
            if (!_3140)
            {
                _2998 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _3148 = _2998;
            _3000 = _3148;
            if (!_3140)
            {
                _3030 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _3150 = _3030;
            _3032 = _3150;
            if (!_3140)
            {
                _3058 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _3152 = _3058;
            bool _3154 = !_3140;
            _3060 = _3152;
            if (!_3154)
            {
                bool _3156 = _2567 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _3158 = isnan(_2567);
                bool _3160 = _3156 || _3158;
                bool _3162 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _3164 = _3160 || _3162;
                if (!_3164)
                {
                    float _3166 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _3168 = _2567 + _3166;
                    float _3170 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _3172 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _3170;
                    float _3174 = 1.0 / _3172;
                    float _3176 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _3178 = _3176 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _3180 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _3182 = _3180 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _3184 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _3186 = _3184 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _3188 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _3190 = _3188 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _3192 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _3194 = _3192 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _3196 = _3168 * _3174;
                    float _3198 = precise::clamp(_3196, 0.0, 1.0);
                    float _3200 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _3202 = _3200 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _3204 = fma(_3198, _3178, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _3206 = fma(_3198, _3202, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _3208 = fma(_3198, _3182, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _3210 = fma(_3198, _3186, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _3212 = fma(_3198, _3190, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _3214 = fma(_3198, _3194, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    _3068 = _3206;
                    _3032 = _3212;
                    _3042 = _3204;
                    _3000 = _3210;
                    _3008 = _3208;
                    _3060 = _3214;
                    _3130 = true;
                }
                else
                {
                    _3068 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _3032 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _3042 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _3000 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _3008 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _3060 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _3130 = false;
    float _3216 = _3068;
    float _3218 = _3032;
    float _3220 = _3042;
    float _3222 = _3000;
    float _3224 = _3008;
    float _3226 = _3060;
    float _3228 = fma(_2185, -0.5, 0.5);
    float _3230 = precise::clamp(_3228, 0.0, 1.0);
    float _3232 = -_3216;
    float _3234 = _3232 + _3218;
    float _3236 = _3056 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _3238 = -_3220;
    float _3240 = _3238 + _3222;
    float _3242 = fma(_3230, _3234, _3216);
    out.m_95.x = 0.0;
    float _3244 = -_3224;
    float _3246 = _3244 + _3226;
    float _3248 = fma(_3230, _3240, _3220);
    float _3250 = _3242 * 0.586610972881317138671875;
    out.m_51.x = _3236;
    bool _3252 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _3254 = fma(_3230, _3246, _3224);
    float _3256 = fma(_3248, 0.298911988735198974609375, _3250);
    bool _3258 = _2545 > 0.0;
    bool _3260 = isnan(_2545);
    bool _3262 = _3258 || _3260;
    bool _3264 = isnan(0.0);
    bool _3266 = _3262 || _3264;
    float _3268 = fma(_3254, 0.114477999508380889892578125, _3256);
    float _3270 = -_3268;
    float _3272 = _3248 + _3270;
    float _3274 = -_3268;
    float _3276 = _3242 + _3274;
    float _3278 = -_3268;
    float _3280 = _3254 + _3278;
    float _3282 = fma(_3272, (*spvDescriptorSet0.vp_c13)._m0[1].z, _3268);
    float _3284 = fma(_3276, (*spvDescriptorSet0.vp_c13)._m0[1].z, _3268);
    float _3286 = fma(_3280, (*spvDescriptorSet0.vp_c13)._m0[1].z, _3268);
    bool _3288 = !_3252;
    if (!_3288)
    {
        float _3290 = -_2487;
        float _3292 = _3290 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
        float _3294 = -_2489;
        float _3296 = _3294 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
        float _3298 = -_2491;
        float _3300 = _3298 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
        float _3302 = _3292 * _3292;
        float _3304 = fma(_3296, _3296, _3302);
        float _3306 = fma(_3300, _3300, _3304);
        float _3308 = sqrt(_3306);
        float _3310 = rsqrt(_3306);
        float _3312 = -_3308;
        float _3314 = _3312 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
        float _3316 = _3314 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
        float _3318 = precise::clamp(_3316, 0.0, 1.0);
        float _3320 = _3296 * _3310;
        float _3322 = _3292 * _3310;
        float _3324 = abs(_3318);
        float _3326 = log2(_3324);
        float _3328 = _3300 * _3310;
        float _3330 = _3320 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
        float _3332 = _2185 * _3322;
        float _3334 = -_3322;
        float _3336 = -_3330;
        float _3338 = fma(_3334, (*spvDescriptorSet0.vp_c15)._m0[656].y, _3336);
        float _3340 = fma(_2183, _3320, _3332);
        float _3342 = -_3328;
        float _3344 = fma(_3342, (*spvDescriptorSet0.vp_c15)._m0[656].z, _3338);
        float _3346 = fma(_2187, _3328, _3340);
        float _3348 = precise::clamp(_3346, 0.0, 1.0);
        float _3350 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
        float _3352 = _3344 + _3350;
        float _3354 = _3326 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
        float _3356 = _3352 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
        float _3358 = precise::clamp(_3356, 0.0, 1.0);
        float _3360 = exp2(_3354);
        float _3362 = _3360 * _3358;
        float _3364 = _3348 * _3362;
        float _3366 = _3364 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
        float _3368 = _3364 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
        float _3370 = _3364 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
        out.m_95.x = _3366;
        out.m_95.y = _3368;
        out.m_95.z = _3370;
    }
    out.m_97.x = _3282;
    out.m_97.y = _3284;
    out.m_97.z = _3286;
    if (_3266)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    out.m_51.x = 0.0;
    float _3372 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _3372;
    out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
}


vertex main0_out main0_z(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]])
{
    main0_out out = {};
    out.m_77 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_71 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_51 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_97 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_67 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_73 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_89 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_79 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_85 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_95 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_91 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_93 = float4(0.0, 0.0, 0.0, 1.0);
    bool _3130 = false;
    bool _2235 = false;
    bool _638 = false;
    bool _512 = false;
    bool _236 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _111 = in.m_48.w;
    float _113 = trunc(_111);
    int _116 = int(_113);
    bool _120 = _116 >= 1;
    float _122 = 0.0;
    if (!_120)
    {
        _122 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _124 = _122;
    float _126 = _124;
    if (!_120)
    {
        out.m_51.x = 0.0;
    }
    int _128 = 0;
    if (!_120)
    {
        float _130 = _124 * 5.0;
        _128 = as_type<int>(_130);
    }
    int _132 = _128;
    int _134 = _132;
    if (!_120)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _3429 = as_type<float>(_132);
        out.gl_Position.z = _3429;
    }
    if (!_120)
    {
        return out;
    }
    float _136 = in.m_53.w;
    bool _138 = _136 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _140 = isnan(_136);
    bool _142 = _138 || _140;
    bool _144 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _146 = _142 || _144;
    float _148 = -_136;
    float _150 = _148 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    float _152 = 0.0;
    float _154 = _150;
    if (_146)
    {
        float _156 = float(_116);
        _152 = _156;
    }
    float _158 = _152;
    bool _160 = _150 >= _158;
    bool _162 = !_146;
    bool _164 = _160 || _162;
    if (_164)
    {
        _126 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _166 = _126;
    if (_164)
    {
        out.m_51.x = 0.0;
    }
    if (_164)
    {
        float _168 = _166 * 5.0;
        _134 = as_type<int>(_168);
    }
    int _170 = _134;
    if (_164)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _3498 = as_type<float>(_170);
        out.gl_Position.z = _3498;
    }
    if (_164)
    {
        return out;
    }
    float _172 = in.m_55.x;
    float _174 = in.m_55.y;
    float _176 = in.m_55.z;
    bool _178 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _180 = in.m_57.x;
    float _182 = in.m_57.y;
    float _184 = in.m_57.z;
    float _186 = in.m_59.x;
    float _188 = in.m_59.y;
    float _190 = in.m_59.z;
    float _192 = in.m_61.x;
    float _194 = in.m_61.y;
    float _196 = in.m_61.z;
    float _198 = _174 * _182;
    float _200 = _174 * _188;
    float _202 = fma(_172, _180, _198);
    float _204 = _174 * _194;
    float _206 = fma(_172, _186, _200);
    float _208 = fma(_176, _184, _202);
    float _210 = fma(_172, _192, _204);
    float _212 = fma(_176, _190, _206);
    float _214 = fma(_176, _196, _210);
    bool _216 = !_178;
    float _234;
    if (!_216)
    {
        float _218 = in.m_63.x;
        float _220 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _222 = _218 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _224 = fma(_222, (*spvDescriptorSet0.vp_c9)._m0[12].x, _150);
        float _226 = _224 * _220;
        float _228 = floor(_226);
        float _230 = -_228;
        float _232 = _226 + _230;
        _234 = _232;
        _236 = true;
    }
    else
    {
        float _238 = float(_116);
        float _240 = 1.0 / _238;
        float _242 = _150 * _240;
        _234 = _242;
    }
    _236 = false;
    float _244 = _234;
    float _246 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _248 = _244 + _246;
    float _250 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _252 = _244 + _250;
    float _254 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _256 = _244 + _254;
    float _258 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _260 = (*spvDescriptorSet0.vp_c9)._m0[146].w + _258;
    float _262 = -(*spvDescriptorSet0.vp_c9)._m0[146].w;
    float _264 = _262 + (*spvDescriptorSet0.vp_c9)._m0[147].w;
    float _266 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _268 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _266;
    float _270 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _272 = _270 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _274 = 1.0 / _264;
    float _276 = 1.0 / _268;
    float _278 = -(*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _280 = (*spvDescriptorSet0.vp_c9)._m0[144].z + _278;
    bool _282 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].x;
    float _284 = 1.0 / _272;
    float _286 = -(*spvDescriptorSet0.vp_c9)._m0[146].w;
    float _288 = _244 + _286;
    float _290 = 1.0 / _260;
    float _292 = _288 * _274;
    bool _294 = _244 >= (*spvDescriptorSet0.vp_c9)._m0[147].w;
    bool _296 = isnan(_244);
    bool _298 = _294 || _296;
    bool _300 = isnan((*spvDescriptorSet0.vp_c9)._m0[147].w);
    bool _302 = _298 || _300;
    float _304 = float(_302);
    float _306 = _248 * _276;
    bool _308 = _244 >= (*spvDescriptorSet0.vp_c9)._m0[146].w;
    bool _310 = isnan(_244);
    bool _312 = _308 || _310;
    bool _314 = isnan((*spvDescriptorSet0.vp_c9)._m0[146].w);
    bool _316 = _312 || _314;
    float _318 = float(_316);
    bool _320 = _244 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _322 = isnan(_244);
    bool _324 = _320 || _322;
    bool _326 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _328 = _324 || _326;
    float _330 = float(_328);
    float _332 = -_304;
    float _334 = _332 + 1.0;
    float _336 = _252 * _284;
    float _338 = fma(_280, _306, (*spvDescriptorSet0.vp_c9)._m0[143].z);
    bool _340 = _244 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _342 = isnan(_244);
    bool _344 = _340 || _342;
    bool _346 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _348 = _344 || _346;
    float _350 = float(_348);
    float _352 = _318 * _334;
    float _354 = -_318;
    float _356 = _354 + 1.0;
    float _358 = -_330;
    float _360 = _358 + 1.0;
    float _362 = _256 * _290;
    float _364 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _366 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _364;
    float _368 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _370 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _368;
    float _372 = fma(_366, _306, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _374 = fma(_370, _306, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    bool _376 = _244 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _378 = isnan(_244);
    bool _380 = _376 || _378;
    bool _382 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _384 = _380 || _382;
    float _386 = float(_384);
    float _388 = _330 * _356;
    float _390 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _392 = _390 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _394 = -(*spvDescriptorSet0.vp_c9)._m0[144].z;
    float _396 = _394 + (*spvDescriptorSet0.vp_c9)._m0[145].z;
    float _398 = _350 * _360;
    float _400 = -_350;
    float _402 = _400 + 1.0;
    float _404 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _406 = _404 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _408 = fma(_392, _336, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _410 = fma(_396, _336, (*spvDescriptorSet0.vp_c9)._m0[144].z);
    float _412 = _386 * _402;
    float _414 = fma(_406, _336, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _416 = -_386;
    float _418 = _416 + 1.0;
    float _420 = -(*spvDescriptorSet0.vp_c9)._m0[145].z;
    float _422 = (*spvDescriptorSet0.vp_c9)._m0[146].z + _420;
    float _424 = _374 * _412;
    float _426 = _372 * _412;
    float _428 = _338 * _412;
    float _430 = -(*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _432 = (*spvDescriptorSet0.vp_c9)._m0[146].x + _430;
    float _434 = -(*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _436 = (*spvDescriptorSet0.vp_c9)._m0[146].y + _434;
    float _438 = fma(_418, (*spvDescriptorSet0.vp_c9)._m0[143].y, _424);
    float _440 = fma(_418, (*spvDescriptorSet0.vp_c9)._m0[143].x, _426);
    float _442 = fma(_418, (*spvDescriptorSet0.vp_c9)._m0[143].z, _428);
    float _444 = fma(_432, _362, (*spvDescriptorSet0.vp_c9)._m0[145].x);
    float _446 = fma(_436, _362, (*spvDescriptorSet0.vp_c9)._m0[145].y);
    float _448 = fma(_422, _362, (*spvDescriptorSet0.vp_c9)._m0[145].z);
    float _450 = fma(_414, _398, _438);
    float _452 = fma(_408, _398, _440);
    float _454 = fma(_410, _398, _442);
    float _456 = -(*spvDescriptorSet0.vp_c9)._m0[146].x;
    float _458 = _456 + (*spvDescriptorSet0.vp_c9)._m0[147].x;
    float _460 = -(*spvDescriptorSet0.vp_c9)._m0[146].y;
    float _462 = _460 + (*spvDescriptorSet0.vp_c9)._m0[147].y;
    float _464 = -(*spvDescriptorSet0.vp_c9)._m0[146].z;
    float _466 = _464 + (*spvDescriptorSet0.vp_c9)._m0[147].z;
    float _468 = fma(_444, _388, _452);
    float _470 = fma(_458, _292, (*spvDescriptorSet0.vp_c9)._m0[146].x);
    float _472 = fma(_462, _292, (*spvDescriptorSet0.vp_c9)._m0[146].y);
    float _474 = fma(_466, _292, (*spvDescriptorSet0.vp_c9)._m0[146].z);
    float _476 = fma(_446, _388, _450);
    float _478 = fma(_448, _388, _454);
    float _480 = fma(_470, _352, _468);
    float _482 = fma(_472, _352, _476);
    float _484 = fma(_474, _352, _478);
    float _486 = fma(_304, (*spvDescriptorSet0.vp_c9)._m0[147].x, _480);
    float _488 = fma(_304, (*spvDescriptorSet0.vp_c9)._m0[147].y, _482);
    float _490 = fma(_304, (*spvDescriptorSet0.vp_c9)._m0[147].z, _484);
    bool _492 = !_282;
    float _510;
    if (!_492)
    {
        float _494 = in.m_63.x;
        float _496 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].x;
        float _498 = _494 * (*spvDescriptorSet0.vp_c9)._m0[12].y;
        float _500 = fma(_498, (*spvDescriptorSet0.vp_c9)._m0[11].x, _150);
        float _502 = _500 * _496;
        float _504 = floor(_502);
        float _506 = -_504;
        float _508 = _502 + _506;
        _510 = _508;
        _512 = true;
    }
    else
    {
        float _514 = float(_116);
        float _516 = 1.0 / _514;
        float _518 = _150 * _516;
        _510 = _518;
    }
    _512 = false;
    float _520 = _510;
    float _522 = in.m_65.x;
    float _524 = in.m_65.y;
    float _526 = in.m_65.z;
    float _528 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _530 = _520 + _528;
    bool _532 = _520 >= (*spvDescriptorSet0.vp_c9)._m0[108].w;
    bool _534 = isnan(_520);
    bool _536 = _532 || _534;
    bool _538 = isnan((*spvDescriptorSet0.vp_c9)._m0[108].w);
    bool _540 = _536 || _538;
    float _542 = float(_540);
    float _544 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _546 = (*spvDescriptorSet0.vp_c9)._m0[108].w + _544;
    bool _548 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _550 = 1.0 / _546;
    float _552 = _488 * _524;
    float _554 = _490 * _526;
    float _556 = _530 * _550;
    float _558 = -_542;
    float _560 = _558 + 1.0;
    bool _562 = _520 >= (*spvDescriptorSet0.vp_c9)._m0[107].w;
    bool _564 = isnan(_520);
    bool _566 = _562 || _564;
    bool _568 = isnan((*spvDescriptorSet0.vp_c9)._m0[107].w);
    bool _570 = _566 || _568;
    float _572 = float(_570);
    float _574 = -(*spvDescriptorSet0.vp_c9)._m0[107].x;
    float _576 = (*spvDescriptorSet0.vp_c9)._m0[108].x + _574;
    float _578 = -(*spvDescriptorSet0.vp_c9)._m0[107].z;
    float _580 = (*spvDescriptorSet0.vp_c9)._m0[108].z + _578;
    float _582 = -(*spvDescriptorSet0.vp_c9)._m0[107].y;
    float _584 = (*spvDescriptorSet0.vp_c9)._m0[108].y + _582;
    float _586 = _572 * _560;
    float _588 = fma(_576, _556, (*spvDescriptorSet0.vp_c9)._m0[107].x);
    float _590 = fma(_584, _556, (*spvDescriptorSet0.vp_c9)._m0[107].y);
    float _592 = fma(_580, _556, (*spvDescriptorSet0.vp_c9)._m0[107].z);
    float _594 = -_572;
    float _596 = _594 + 1.0;
    float _598 = _588 * _586;
    float _600 = _590 * _586;
    float _602 = _592 * _586;
    float _604 = _486 * _522;
    float _606 = fma(_596, (*spvDescriptorSet0.vp_c9)._m0[107].x, _598);
    float _608 = fma(_596, (*spvDescriptorSet0.vp_c9)._m0[107].y, _600);
    float _610 = fma(_596, (*spvDescriptorSet0.vp_c9)._m0[107].z, _602);
    float _612 = fma(_542, (*spvDescriptorSet0.vp_c9)._m0[108].x, _606);
    float _614 = fma(_542, (*spvDescriptorSet0.vp_c9)._m0[108].y, _608);
    float _616 = fma(_542, (*spvDescriptorSet0.vp_c9)._m0[108].z, _610);
    bool _618 = !_548;
    float _636;
    if (!_618)
    {
        float _620 = in.m_63.x;
        float _622 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _624 = _620 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _626 = fma(_624, (*spvDescriptorSet0.vp_c9)._m0[11].y, _150);
        float _628 = _626 * _622;
        float _630 = floor(_628);
        float _632 = -_630;
        float _634 = _628 + _632;
        _636 = _634;
        _638 = true;
    }
    else
    {
        float _640 = float(_116);
        float _642 = 1.0 / _640;
        float _644 = _150 * _642;
        _636 = _644;
    }
    _638 = false;
    float _646 = _636;
    float _648 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].y);
    int _650 = int(_648);
    float _652 = in.m_59.w;
    float _654 = float(_116);
    float _656 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].x);
    int _658 = int(_656);
    float _660 = float(_650);
    float _662 = 1.0 / _654;
    float _664 = float(uint(_658));
    float _666 = 1.0 / _660;
    int _668 = ~_658;
    int _670 = _668 + 1;
    int _672 = ~_658;
    int _674 = _672 + 1;
    float _676 = 1.0 / _664;
    float _678 = _666 * _150;
    float _680 = trunc(_678);
    int _682 = int(_680);
    int _684 = as_type<int>(_676) + (-2);
    float _686 = float(uint(_682));
    float _688 = as_type<float>(_684) * _686;
    float _690 = in.m_63.x;
    float _692 = in.m_63.y;
    float _694 = trunc(_688);
    float _696 = precise::max(_694, 0.0);
    uint _699 = uint(_696);
    out.m_67.x = 1.0;
    out.m_67.y = 1.0;
    out.m_67.z = 1.0;
    int _701 = _670 * int(_699);
    int _703 = _701 + _682;
    float _705 = float(uint(_703));
    float _707 = in.m_48.x;
    float _709 = in.m_48.y;
    float _711 = in.m_48.z;
    float _713 = as_type<float>(_684) * _705;
    float _715 = float(_682);
    int _717 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _719 = _717 != 0;
    float _721 = trunc(_713);
    float _723 = precise::max(_721, 0.0);
    uint _725 = uint(_723);
    bool _727 = !_719;
    float _729 = _727 ? 7.345489978790283203125 : 1.0;
    int _731 = ~_658;
    int _733 = _731 + 1;
    int _735 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _737 = _735 != 0;
    float _739 = _729 * _690;
    int _741 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _743 = _741 != 0;
    int _745 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4096;
    bool _747 = _745 != 0;
    float _749 = _182 * _709;
    int _751 = int(_699) + int(_725);
    float _753 = _188 * _709;
    float _755 = _194 * _709;
    float _757 = float(_658);
    float _759 = fma(_180, _707, _749);
    int _761 = _733 * _751;
    int _763 = _761 + _682;
    float _765 = floor(_739);
    bool _767 = _715 >= _757;
    bool _769 = isnan(_715);
    bool _771 = _767 || _769;
    bool _773 = isnan(_757);
    bool _775 = _771 || _773;
    float _777 = float(_775);
    float _779 = fma(_192, _707, _755);
    float _781 = fma(_184, _711, _759);
    bool _783 = uint(_763) >= uint(_658);
    float _785 = fma(_186, _707, _753);
    float _787 = _757 * _150;
    float _789 = trunc(_777);
    int _791 = int(_789);
    bool _793 = !_783;
    int _795 = _793 ? 0 : (-1);
    float _797 = fma(_196, _711, _779);
    int _799 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 16;
    bool _801 = _799 != 0;
    int _803 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 32;
    bool _805 = _803 != 0;
    int _807 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 64;
    bool _809 = _807 != 0;
    float _811 = _787 * _662;
    int _813 = ~_751;
    int _815 = _813 + _795;
    int _817 = _815 + 1;
    float _819 = fma(_190, _711, _785);
    bool _821 = !_747;
    int _823 = _821 ? 0 : 1;
    float _825 = -_765;
    float _827 = _739 + _825;
    bool _829 = _658 == 0;
    int _831 = _658 * _817;
    int _833 = _831 + _682;
    bool _835 = !_805;
    int _837 = _835 ? 0 : 1;
    float _839 = _827 * _757;
    float _841 = trunc(_811);
    int _843 = int(_841);
    float _845 = in.m_69.y;
    bool _847 = !_829;
    int _849 = _847 ? _833 : (-1);
    int _851 = ~_791;
    int _853 = _851 + 1;
    int _855 = _853 + 1;
    float _857 = 0.0;
    if (_737)
    {
        float _859 = in.m_63.x;
        _857 = _859;
    }
    float _861 = _857;
    int _863 = _658 + (-1);
    float _865 = trunc(_839);
    int _867 = int(_865);
    bool _869 = !_801;
    int _871 = _869 ? 0 : 1;
    int _873 = _849 * _855;
    int _875 = abs(_837);
    int _877 = abs(_871);
    int _879 = _791 * _863;
    int _881 = _879 + _873;
    float _883 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _885 = log2(_883);
    int _887 = abs(_823);
    float _889 = _692 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    int _891 = _881 * _875;
    int _893 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 128;
    bool _895 = _893 != 0;
    int _897 = _843 * _877;
    int _899 = _897 + _891;
    bool _901 = !_895;
    int _903 = _901 ? 0 : 1;
    int _905 = _867 * _887;
    int _907 = _905 + _682;
    bool _909 = !_809;
    int _911 = _909 ? 0 : 1;
    float _913 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    int _915 = abs(_903);
    float _917 = _690 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    int _919 = abs(_911);
    float _921 = -_845;
    float _923 = _921 + 1.0;
    float _925 = -_913;
    float _927 = fma(_917, 2.0, _925);
    bool _929 = _692 > 0.5;
    int _931 = _907 * _919;
    int _933 = _931 + _899;
    float _935 = _885 * _150;
    int _937 = _867 * _915;
    int _939 = _937 + _933;
    float _941 = _845;
    float _943 = _927;
    if (_743)
    {
        float _945 = _929 ? _923 : _845;
        _941 = _945;
    }
    float _947 = _941;
    float _949 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _951 = _949 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _953 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _955 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _957 = 1.0 / _951;
    float _959 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _961 = _959 + (*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _963 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _965 = 1.0 / _961;
    float _967 = _953 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _969 = _955 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _971 = float(uint(_939));
    float _973 = (*spvDescriptorSet0.vp_c9)._m0[131].x * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    float _975 = -(*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _977 = _975 + (*spvDescriptorSet0.vp_c9)._m0[118].w;
    float _979 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _981 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _979;
    float _983 = as_type<float>(_684) * _971;
    float _985 = _963 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _987 = 1.0 / _977;
    float _989 = -(*spvDescriptorSet0.vp_c9)._m0[116].x;
    float _991 = _989 + (*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _993 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _995 = _981 * _957;
    out.m_71.x = _967;
    out.m_71.y = _985;
    out.m_71.z = _969;
    out.m_71.w = _973;
    float _997 = _991 * _965;
    float _999 = trunc(_983);
    float _1001 = precise::max(_999, 0.0);
    uint _1003 = uint(_1001);
    float _1005 = fma(_889, -2.0, _993);
    float _1007 = in.m_69.x;
    float _1009 = _690 * 2.0;
    bool _1011 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _1013 = isnan(1.0);
    bool _1015 = _1011 || _1013;
    bool _1017 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _1019 = _1015 || _1017;
    float _1021 = -(*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _1023 = (*spvDescriptorSet0.vp_c9)._m0[118].x + _1021;
    float _1025 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _1027 = 1.0 + _1025;
    float _1029 = in.m_63.z;
    float _1031 = exp2(_935);
    float _1033 = _1023 * _987;
    float _1035 = _692 + _690;
    int _1037 = ~_658;
    int _1039 = _1037 + 1;
    float _1041 = _1035 + (-1.0);
    bool _1043 = _861 > 0.5;
    bool _1045 = _1043 && _737;
    float _1047 = floor(_1009);
    float _1049 = _692 * 2.0;
    float _1051 = fma(_1041, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    int _1053 = _1039 * int(_1003);
    int _1055 = _1053 + _939;
    bool _1057 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _1059 = isnan(0.0);
    bool _1061 = _1057 || _1059;
    bool _1063 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _1065 = _1061 || _1063;
    float _1067 = float(uint(_1055));
    float _1069 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    float _1071 = 1.0 / _1027;
    float _1073 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    float _1075 = -_1031;
    float _1077 = _1075 + 1.0;
    float _1079 = as_type<float>(_684) * _1067;
    float _1081 = fma(_692, (*spvDescriptorSet0.vp_c9)._m0[78].w, _1069);
    float _1083 = fma(_690, (*spvDescriptorSet0.vp_c9)._m0[78].z, _1073);
    bool _1085 = _1047 > 0.0;
    float _1087 = _692 + _1029;
    float _1089 = floor(_1049);
    float _1091 = _1065 ? _1077 : 0.0;
    float _1093 = fma(_150, (*spvDescriptorSet0.vp_c9)._m0[77].z, _1083);
    bool _1095 = _1047 >= 0.0;
    bool _1097 = isnan(_1047);
    bool _1099 = _1095 || _1097;
    bool _1101 = isnan(0.0);
    bool _1103 = _1099 || _1101;
    float _1105 = -_150;
    float _1107 = fma(_1105, (*spvDescriptorSet0.vp_c9)._m0[76].x, _927);
    float _1109 = _1047;
    if (_737)
    {
        _1109 = _1007;
    }
    float _1111 = _1109;
    float _1113 = fma(_150, (*spvDescriptorSet0.vp_c9)._m0[77].w, _1081);
    float _1115 = fma(_150, (*spvDescriptorSet0.vp_c9)._m0[76].y, _1005);
    float _1117 = trunc(_1079);
    float _1119 = precise::max(_1117, 0.0);
    uint _1121 = uint(_1119);
    float _1123 = _1111;
    if (_1019)
    {
        float _1125 = _1091 * _1071;
        _154 = _1125;
    }
    float _1127 = _154;
    if (_1045)
    {
        float _1129 = -_1111;
        float _1131 = _1129 + 1.0;
        _1123 = _1131;
    }
    float _1133 = _1123;
    float _1135 = _1029 * 2.0;
    if (!_737)
    {
        _943 = _1007;
    }
    float _1137 = _943;
    float _1139 = _1087 + (-1.0);
    bool _1141 = _1089 > 0.0;
    float _1143 = floor(_1135);
    bool _1145 = _1089 >= 0.0;
    bool _1147 = isnan(_1089);
    bool _1149 = _1145 || _1147;
    bool _1151 = isnan(0.0);
    bool _1153 = _1149 || _1151;
    float _1155 = fma(_947, (*spvDescriptorSet0.vp_c9)._m0[80].y, -0.5);
    int _1157 = _1103 ? 0 : 1;
    float _1159 = _1137;
    if (_737)
    {
        _1159 = _1133;
    }
    float _1161 = _1159;
    float _1163 = -_1115;
    float _1165 = fma(_1113, _1155, _1163);
    int _1167 = int(_1003) + int(_1121);
    float _1169 = in.m_61.w;
    int _1171 = _1153 ? 0 : 1;
    float _1173 = fma(_1161, (*spvDescriptorSet0.vp_c9)._m0[80].x, -0.5);
    int _1175 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _1177 = _1175 != 0;
    int _1179 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _1181 = _1179 != 0;
    int _1183 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _1185 = _1183 != 0;
    int _1187 = _674 * _1167;
    int _1189 = _1187 + _939;
    int _1191 = ~_1171;
    int _1193 = _1191 + 1;
    int _1195 = _1193 + 1;
    float _1197 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _1199 = _646 + _1197;
    int _1201 = _1195;
    if (!_1141)
    {
        int _1203 = ~_1171;
        int _1205 = _1203 + 1;
        _1201 = _1205;
    }
    int _1207 = _1201;
    bool _1209 = uint(_1189) >= uint(_658);
    float _1211 = fma(_995, _1199, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _1213 = -(*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _1215 = _646 + _1213;
    float _1217 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _1219 = _646 + _1217;
    bool _1221 = !_1209;
    int _1223 = _1221 ? 0 : (-1);
    float _1225 = fma(_1033, _1215, (*spvDescriptorSet0.vp_c9)._m0[117].x);
    int _1227 = ~_1157;
    int _1229 = _1227 + 1;
    int _1231 = _1229 + 1;
    float _1233 = fma(_1139, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    int _1235 = ~_1167;
    int _1237 = _1235 + _1223;
    int _1239 = _1237 + 1;
    float _1241 = in.m_57.w;
    int _1243 = _1231;
    if (!_1085)
    {
        int _1245 = ~_1157;
        int _1247 = _1245 + 1;
        _1243 = _1247;
    }
    int _1249 = _1243;
    float _1251 = fma(_997, _1219, (*spvDescriptorSet0.vp_c9)._m0[116].x);
    bool _1253 = _646 >= (*spvDescriptorSet0.vp_c9)._m0[118].w;
    bool _1255 = isnan(_646);
    bool _1257 = _1253 || _1255;
    bool _1259 = isnan((*spvDescriptorSet0.vp_c9)._m0[118].w);
    bool _1261 = _1257 || _1259;
    float _1263 = float(_1261);
    int _1265 = _658 * _1239;
    int _1267 = _1265 + _939;
    bool _1269 = _1143 > 0.0;
    bool _1271 = _1143 >= 0.0;
    bool _1273 = isnan(_1143);
    bool _1275 = _1271 || _1273;
    bool _1277 = isnan(0.0);
    bool _1279 = _1275 || _1277;
    float _1281 = -_1263;
    float _1283 = _1281 + 1.0;
    bool _1285 = _646 >= (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _1287 = isnan(_646);
    bool _1289 = _1285 || _1287;
    bool _1291 = isnan((*spvDescriptorSet0.vp_c9)._m0[117].w);
    bool _1293 = _1289 || _1291;
    float _1295 = float(_1293);
    float _1297 = float(uint(_907));
    bool _1299 = !_829;
    int _1301 = _1299 ? _1267 : (-1);
    float _1303 = _1295 * _1283;
    float _1305 = -_1295;
    float _1307 = _1305 + 1.0;
    float _1309 = as_type<float>(_684) * _1297;
    int _1311 = _1301 >> 31;
    bool _1313 = _646 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _1315 = isnan(_646);
    bool _1317 = _1313 || _1315;
    bool _1319 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _1321 = _1317 || _1319;
    float _1323 = float(_1321);
    int _1325 = _1311 & 3;
    float _1327 = trunc(_1309);
    float _1329 = precise::max(_1327, 0.0);
    uint _1331 = uint(_1329);
    bool _1333 = _646 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _1335 = isnan(_646);
    bool _1337 = _1333 || _1335;
    bool _1339 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _1341 = _1337 || _1339;
    float _1343 = float(_1341);
    float _1345 = -_1323;
    float _1347 = _1345 + 1.0;
    float _1349 = _1323 * _1307;
    int _1351 = _1301 + _1325;
    float _1353 = _819 + _652;
    float _1355 = _1343 * _1347;
    float _1357 = -_1343;
    float _1359 = _1357 + 1.0;
    int _1361 = _1351 >> 2;
    float _1363 = _781 + _1241;
    float _1365 = _1211 * _1355;
    int _1367 = ~_658;
    int _1369 = _1367 + 1;
    float _1371 = _797 + _1169;
    int _1373 = _1361 << 4;
    int _1375 = _1373 + 368;
    float _1377 = fma(_1359, (*spvDescriptorSet0.vp_c9)._m0[115].x, _1365);
    int _1379 = _1279 ? 0 : 1;
    int _1381 = _1369 * int(_1331);
    int _1383 = _1381 + _907;
    uint _1385 = uint(int(uint(_1375) >> uint(2)));
    uint _1387 = uint(int(uint(int(_1385)) >> uint(2)));
    int _1389 = int(_1385) & 3;
    float _1391 = (*spvDescriptorSet0.vp_c9)._m0[int(_1387)][_1389];
    int _1393 = int(_1385) + 1;
    uint _1395 = uint(int(uint(_1393) >> uint(2)));
    int _1397 = _1393 & 3;
    float _1399 = (*spvDescriptorSet0.vp_c9)._m0[int(_1395)][_1397];
    int _1401 = _1301 & 3;
    bool _1403 = _1401 != 0;
    float _1405 = fma(_1251, _1349, _1377);
    int _1407 = ~_1379;
    int _1409 = _1407 + 1;
    int _1411 = _1409 + 1;
    float _1413 = fma(_1093, _1173, _1107);
    float _1415 = float(uint(_1383));
    float _1417 = fma(_1225, _1303, _1405);
    int _1419 = _1411;
    if (!_1269)
    {
        int _1421 = ~_1379;
        int _1423 = _1421 + 1;
        _1419 = _1423;
    }
    int _1425 = _1419;
    int _1427 = _1301 & 3;
    bool _1429 = _1427 != 0;
    float _1431 = as_type<float>(_684) * _1415;
    bool _1433 = !_1181;
    int _1435 = _1433 ? 0 : 1;
    float _1437 = fma(_1263, (*spvDescriptorSet0.vp_c9)._m0[118].x, _1417);
    bool _1439 = uint(_1427) > 1u;
    float _1441 = trunc(_1431);
    float _1443 = precise::max(_1441, 0.0);
    uint _1445 = uint(_1443);
    bool _1447 = !_1177;
    int _1449 = _1447 ? 0 : 1;
    int _1451 = abs(_1435);
    int _1453 = abs(_1449);
    float _1455 = float(_1249);
    int _1457 = _1375 + 8;
    uint _1459 = uint(int(uint(_1457) >> uint(2)));
    uint _1461 = uint(int(uint(int(_1459)) >> uint(2)));
    int _1463 = int(_1459) & 3;
    float _1465 = (*spvDescriptorSet0.vp_c9)._m0[int(_1461)][_1463];
    int _1467 = int(_1459) + 1;
    uint _1469 = uint(int(uint(_1467) >> uint(2)));
    int _1471 = _1467 & 3;
    float _1473 = (*spvDescriptorSet0.vp_c9)._m0[int(_1469)][_1471];
    float _1475 = float(_1451);
    int _1477 = _1403 ? 0 : 1;
    float _1479 = float(_1453);
    float _1481 = _1475 * _1455;
    float _1483 = float(_1425);
    int _1485 = ~_1477;
    int _1487 = _1485 + 1;
    int _1489 = _1487 + 1;
    int _1491 = _1489;
    if (!_1439)
    {
        int _1493 = ~_1477;
        int _1495 = _1493 + 1;
        _1491 = _1495;
    }
    int _1497 = _1491;
    float _1499 = _1413 + 0.5;
    int _1501 = ~_658;
    int _1503 = _1501 + 1;
    int _1505 = int(_1331) + int(_1445);
    float _1507 = _1479 * _1483;
    bool _1509 = !_1429;
    int _1511 = _1509 ? 0 : 1;
    float _1513 = _1165 + 0.5;
    int _1515 = abs(_1497);
    int _1517 = _1503 * _1505;
    int _1519 = _1517 + _907;
    int _1521 = abs(_1511);
    float _1523 = _1507 * (-2.0);
    out.m_73.x = _1499;
    out.m_73.y = _1513;
    int _1525 = ~_1521;
    int _1527 = _1525 + 1;
    int _1529 = _1527 + 1;
    int _1531 = ~_1515;
    int _1533 = _1531 + 1;
    int _1535 = _1533 + 1;
    bool _1537 = _1427 != 3;
    bool _1539 = uint(_1427) >= 2u;
    int _1541 = _1535 * as_type<int>(_1399);
    bool _1543 = uint(_1519) >= uint(_658);
    float _1545 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1547 = _1353 + _1545;
    int _1549 = _1539 ? 0 : 1;
    int _1551 = _1529 * as_type<int>(_1391);
    int _1553 = _1551 + _1541;
    int _1555 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2097152;
    bool _1557 = _1555 != 0;
    float _1559 = in.m_75.x;
    float _1561 = in.m_75.y;
    float _1563 = in.m_75.z;
    bool _1565 = _1427 != 3;
    int _1567 = ~_1549;
    int _1569 = _1567 + 1;
    int _1571 = _1569 + 1;
    bool _1573 = !_1543;
    int _1575 = _1573 ? 0 : (-1);
    int _1577 = _1571;
    if (_1537)
    {
        int _1579 = ~_1549;
        int _1581 = _1579 + 1;
        _1577 = _1581;
    }
    int _1583 = _1577;
    bool _1585 = !_1557;
    int _1587 = _1585 ? 0 : 1;
    bool _1589 = !_1565;
    int _1591 = _1589 ? 0 : (-1);
    int _1593 = ~_1505;
    int _1595 = _1593 + _1575;
    int _1597 = _1595 + 1;
    int _1599 = abs(_1587);
    float _1601 = _1547 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    int _1603 = abs(_1591);
    float _1605 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1607 = _1363 + _1605;
    int _1609 = abs(_1583);
    int _1611 = _658 * _1597;
    int _1613 = _1611 + _907;
    float _1615 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1617 = _1371 + _1615;
    float _1619 = fma(_1607, (*spvDescriptorSet0.vp_c8)._m0[28].x, _1601);
    float _1621 = _1481 * (-2.0);
    int _1623 = ~_1609;
    int _1625 = _1623 + 1;
    int _1627 = _1625 + 1;
    float _1629 = _690 + (-0.5);
    float _1631 = fma(_1617, (*spvDescriptorSet0.vp_c8)._m0[28].z, _1619);
    float _1633 = fma(_1233, _1621, _1233);
    float _1635 = fma(_1621, _1561, _1561);
    float _1637 = _1547 * _1547;
    int _1639 = ~_1603;
    int _1641 = _1639 + 1;
    int _1643 = _1641 + 1;
    int _1645 = _1627 * as_type<int>(_1465);
    int _1647 = _1645 + _1553;
    bool _1649 = _1631 >= 0.0;
    float _1651 = fma(_1607, _1607, _1637);
    int _1653 = ~_1599;
    int _1655 = _1653 + 1;
    int _1657 = _1655 + 1;
    int _1659 = _1643 * as_type<int>(_1473);
    int _1661 = _1659 + _1647;
    float _1663 = fma(_1051, _1523, _1051);
    float _1665 = fma(_1617, _1617, _1651);
    float _1667 = _614 * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    int _1669 = _1661 * _1657;
    bool _1671 = !_829;
    int _1673 = _1671 ? _1613 : (-1);
    float _1675 = fma(_1523, _1559, _1559);
    float _1677 = _616 * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _1679 = rsqrt(_1665);
    float _1681 = _1667 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    int _1683 = _1673 * _1599;
    int _1685 = _1683 + _1669;
    float _1687 = as_type<float>(_1643);
    if (_1649)
    {
        _1687 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _1689 = _1687;
    float _1691 = _612 * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _1693 = _1677 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1695 = _1437 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _1697 = _1691 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    int _1699 = as_type<int>(_1689);
    if (_1649)
    {
        float _1701 = _1689 * 5.0;
        _1699 = as_type<int>(_1701);
    }
    int _1703 = _1699;
    float _1705 = float(_1685);
    float _1707 = fma(_1629, (*spvDescriptorSet0.vp_c9)._m0[196].x, _1675);
    bool _1709 = !_1185;
    int _1711 = _1709 ? 0 : 1;
    out.m_77.x = _1697;
    out.m_77.y = _1681;
    out.m_77.z = _1693;
    out.m_77.w = _1695;
    float _1713 = _692 + (-0.5);
    float _1715 = float(_1207);
    float _1717 = fma(_1663, _1127, _1707);
    if (_1649)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _5819 = as_type<float>(_1703);
        out.gl_Position.z = _5819;
    }
    int _1719 = abs(_1711);
    float _1721 = _1547 * _1679;
    float _1723 = _1607 * _1679;
    out.m_79.x = _1705;
    float _1725 = _1721;
    if (_1649)
    {
        out.m_51.x = 0.0;
    }
    if (_1649)
    {
        return out;
    }
    float _1727 = -_1721;
    float _1729 = fma(_1727, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1353);
    float _1731 = _1617 * _1679;
    float _1733 = -_1723;
    float _1735 = fma(_1733, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1363);
    float _1737 = float(_1719);
    float _1739 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1741 = _1729 + _1739;
    float _1743 = -_1731;
    float _1745 = fma(_1743, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1371);
    float _1747 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1749 = _1735 + _1747;
    float _1751 = _1029 + _690;
    float _1753 = _1741 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _1755 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1757 = _1745 + _1755;
    float _1759 = _1737 * _1715;
    float _1761 = fma(_1713, (*spvDescriptorSet0.vp_c9)._m0[196].y, _1635);
    float _1763 = fma(_1749, (*spvDescriptorSet0.vp_c8)._m0[28].x, _1753);
    float _1765 = _1751 + (-1.0);
    float _1767 = _1759 * (-2.0);
    float _1769 = fma(_1757, (*spvDescriptorSet0.vp_c8)._m0[28].z, _1763);
    float _1771 = -_1721;
    float _1773 = fma(_1771, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1547);
    float _1775 = fma(_1765, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _1777 = fma(_1767, _1563, _1563);
    float _1779 = _1029 + (-0.5);
    bool _1781 = _1769 >= 0.0;
    float _1783 = -_1723;
    float _1785 = fma(_1783, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1607);
    float _1787 = _1773 * _1773;
    float _1789 = fma(_1775, _1767, _1775);
    float _1791 = fma(_1779, (*spvDescriptorSet0.vp_c9)._m0[196].z, _1777);
    float _1793 = fma(_1633, _1127, _1761);
    float _1795 = fma(_1785, _1785, _1787);
    float _1797 = -_1731;
    float _1799 = fma(_1797, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1617);
    float _1801 = fma(_1789, _1127, _1791);
    float _1803 = _1717 * 0.15915493667125701904296875;
    float _1805 = _1793 * 0.15915493667125701904296875;
    float _1807 = fma(_1799, _1799, _1795);
    float _1809 = _1801 * 0.15915493667125701904296875;
    float _1811 = _1777;
    float _1813 = _1741;
    float _1815 = _1735;
    if (_1781)
    {
        _1811 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _1817 = _1811;
    float _1819 = _1803 * 6.283185482025146484375;
    float _1821 = sin(_1819);
    int _1823 = as_type<int>(_1817);
    if (_1781)
    {
        out.m_51.x = 0.0;
    }
    if (_1781)
    {
        float _1825 = _1817 * 5.0;
        _1823 = as_type<int>(_1825);
    }
    int _1827 = _1823;
    float _1829 = _1803 * 6.283185482025146484375;
    float _1831 = cos(_1829);
    if (_1781)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _6021 = as_type<float>(_1827);
        out.gl_Position.z = _6021;
    }
    float _1833 = _1805 * 6.283185482025146484375;
    float _1835 = sin(_1833);
    float _1837 = _1805 * 6.283185482025146484375;
    float _1839 = cos(_1837);
    float _1841 = sqrt(_1807);
    if (_1781)
    {
        return out;
    }
    float _1843 = in.m_81.x;
    float _1845 = in.m_81.y;
    float _1847 = in.m_81.z;
    float _1849 = _1809 * 6.283185482025146484375;
    float _1851 = cos(_1849);
    float _1853 = _1679 * _1841;
    float _1855 = _552 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _1857 = _604 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _1859 = _1821 * _1835;
    float _1861 = _1821 * _1839;
    float _1863 = _1831 * _1839;
    float _1865 = _1831 * _1835;
    float _1867 = _1809 * 6.283185482025146484375;
    float _1869 = sin(_1867);
    float _1871 = _554 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _1873 = _1853 * _1857;
    float _1875 = _1821 * _1851;
    float _1877 = _1853 * _1855;
    float _1879 = _1831 * _1851;
    float _1881 = _1839 * _1851;
    float _1883 = _1835 * _1851;
    float _1885 = _1879 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _1887 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _1845);
    float _1889 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _1843);
    float _1891 = _1879 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _1893 = _1879 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _1895 = _1887 * _1877;
    float _1897 = _1853 * _1871;
    float _1899 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _1847);
    float _1901 = _1889 * _1873;
    float _1903 = fma(_1869, _1863, _1859);
    float _1905 = _1879 * _1895;
    float _1907 = _1899 * _1897;
    float _1909 = -_1861;
    float _1911 = fma(_1869, _1865, _1909);
    float _1913 = -_1895;
    float _1915 = _1869 * _1913;
    float _1917 = fma(_1903, _1901, _1905);
    float _1919 = -_1865;
    float _1921 = fma(_1869, _1861, _1919);
    float _1923 = _1875 * _1895;
    float _1925 = fma(_1881, _1901, _1915);
    float _1927 = fma(_1911, _1907, _1917);
    float _1929 = fma(_1869, _1859, _1863);
    float _1931 = fma(_1921, _1901, _1923);
    float _1933 = fma(_1883, _1907, _1925);
    float _1935 = _1927 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _1937 = _1927 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _1939 = fma(_1929, _1907, _1931);
    float _1941 = _1903 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _1943 = fma(_1933, (*spvDescriptorSet0.vp_c8)._m0[24].x, _1935);
    float _1945 = fma(_1933, (*spvDescriptorSet0.vp_c8)._m0[26].x, _1937);
    float _1947 = _1903 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _1949 = _1903 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _1951 = fma(_1939, (*spvDescriptorSet0.vp_c8)._m0[24].z, _1943);
    float _1953 = fma(_1939, (*spvDescriptorSet0.vp_c8)._m0[26].z, _1945);
    float _1955 = fma(_1881, (*spvDescriptorSet0.vp_c8)._m0[24].x, _1941);
    float _1957 = fma(_1881, (*spvDescriptorSet0.vp_c8)._m0[25].x, _1947);
    float _1959 = _1951 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _1961 = _1953 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _1963 = fma(_1881, (*spvDescriptorSet0.vp_c8)._m0[26].x, _1949);
    float _1965 = -_1869;
    float _1967 = fma(_1965, (*spvDescriptorSet0.vp_c8)._m0[24].x, _1885);
    float _1969 = _1363 + _1959;
    float _1971 = _1371 + _1961;
    float _1973 = in.m_83.x;
    float _1975 = in.m_83.y;
    float _1977 = in.m_83.z;
    float _1979 = -_1869;
    float _1981 = fma(_1979, (*spvDescriptorSet0.vp_c8)._m0[25].x, _1891);
    float _1983 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1985 = _1969 + _1983;
    float _1987 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1989 = _1971 + _1987;
    bool _1991 = _1845 != 0.0;
    bool _1993 = isnan(_1845);
    bool _1995 = _1991 || _1993;
    bool _1997 = isnan(0.0);
    bool _1999 = _1995 || _1997;
    float _2001 = -_1869;
    float _2003 = fma(_2001, (*spvDescriptorSet0.vp_c8)._m0[26].x, _1893);
    float _2005 = _1985 * _1985;
    float _2007 = _1989 * _1989;
    float _2009 = _1927 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    bool _2011 = _1843 == 0.0;
    bool _2013 = !_1999;
    bool _2015 = _2011 && _2013;
    float _2017 = _1911 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _2019 = _2005 + _2007;
    float _2021 = fma(_1933, (*spvDescriptorSet0.vp_c8)._m0[25].x, _2009);
    bool _2023 = _1847 == 0.0;
    bool _2025 = _2023 && _2015;
    float _2027 = fma(_1921, (*spvDescriptorSet0.vp_c8)._m0[24].z, _1955);
    float _2029 = sqrt(_2019);
    float _2031 = fma(_1939, (*spvDescriptorSet0.vp_c8)._m0[25].z, _2021);
    float _2033 = _1911 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _2035 = _1911 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _2037 = fma(_1883, (*spvDescriptorSet0.vp_c8)._m0[24].x, _2017);
    float _2039 = _2031 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _2041 = fma(_1883, (*spvDescriptorSet0.vp_c8)._m0[25].x, _2033);
    float _2043 = fma(_1883, (*spvDescriptorSet0.vp_c8)._m0[26].x, _2035);
    float _2045 = fma(_1921, (*spvDescriptorSet0.vp_c8)._m0[25].z, _1957);
    float _2047 = _1353 + _2039;
    float _2049 = fma(_1921, (*spvDescriptorSet0.vp_c8)._m0[26].z, _1963);
    float _2051 = _1973;
    float _2053 = _1975;
    float _2055 = _1977;
    float _2057 = _1843;
    float _2059 = _2005;
    float _2061 = _2007;
    float _2063 = _1969;
    float _2065 = _1971;
    float _2067 = _1847;
    if (!_2025)
    {
        float _2069 = fma(_1843, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1973);
        _2051 = _2069;
    }
    float _2071 = _2051;
    if (!_2025)
    {
        float _2073 = fma(_1845, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1975);
        _2053 = _2073;
    }
    float _2075 = _2053;
    if (!_2025)
    {
        float _2077 = fma(_1847, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1977);
        _2055 = _2077;
    }
    float _2079 = _2055;
    bool _2081 = _2029 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    if (!_2081)
    {
        _2057 = _2047;
    }
    float _2083 = _2057;
    bool _2085 = !_2081;
    float _2087 = _2083;
    if (!_2085)
    {
        float _2089 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _2091 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _2093 = _2029 + _2091;
        float _2095 = _2047 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _2097 = rsqrt(_2019);
        float _2099 = _2093 * _2089;
        float _2101 = _2099 * 0.15915493667125701904296875;
        float _2103 = _2101 * 6.283185482025146484375;
        float _2105 = sin(_2103);
        float _2107 = _2101 * 6.283185482025146484375;
        float _2109 = cos(_2107);
        float _2111 = fma(_2105, _2095, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _2113 = _2097 * _2111;
        float _2115 = _2109 + (-1.0);
        float _2117 = fma(_1985, _2113, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _2119 = fma(_1989, _2113, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        float _2121 = _2115 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _2123 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
        float _2125 = _2117 + _2123;
        float _2127 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
        float _2129 = _2119 + _2127;
        float _2131 = fma(_2047, _2109, _2121);
        float _2133 = _2125 * _2125;
        float _2135 = _2129 * _2129;
        _2087 = _2131;
        _2059 = _2133;
        _2061 = _2135;
        _2063 = _2117;
        _2065 = _2119;
        _2067 = _2113;
    }
    float _2137 = _2087;
    float _2139 = _2059;
    float _2141 = _2061;
    float _2143 = _2063;
    float _2145 = _2065;
    float _2147 = _2067;
    float _2149 = -(*spvDescriptorSet0.vp_c15)._m0[0].y;
    float _2151 = _2137 + _2149;
    float _2153 = fma(_1875, (*spvDescriptorSet0.vp_c8)._m0[24].z, _1967);
    float _2155 = fma(_1875, (*spvDescriptorSet0.vp_c8)._m0[25].z, _1981);
    float _2157 = fma(_1875, (*spvDescriptorSet0.vp_c8)._m0[26].z, _2003);
    float _2159 = fma(_2151, _2151, _2139);
    float _2161 = _2153 * _2075;
    float _2163 = _2155 * _2075;
    float _2165 = _2157 * _2075;
    float _2167 = _2159 + _2141;
    float _2169 = fma(_1929, (*spvDescriptorSet0.vp_c8)._m0[24].z, _2037);
    float _2171 = fma(_1929, (*spvDescriptorSet0.vp_c8)._m0[25].z, _2041);
    float _2173 = fma(_2027, _2071, _2161);
    float _2175 = fma(_2045, _2071, _2163);
    float _2177 = fma(_1929, (*spvDescriptorSet0.vp_c8)._m0[26].z, _2043);
    float _2179 = sqrt(_2167);
    float _2181 = fma(_2049, _2071, _2165);
    float _2183 = fma(_2169, _2079, _2173);
    float _2185 = fma(_2171, _2079, _2175);
    float _2187 = fma(_2177, _2079, _2181);
    out.m_85.x = _2183;
    out.m_85.y = _2185;
    out.m_85.z = _2187;
    bool _2189 = _2179 >= (*spvDescriptorSet0.vp_c16)._m0[1].x;
    bool _2191 = isnan(_2179);
    bool _2193 = _2189 || _2191;
    bool _2195 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].x);
    bool _2197 = _2193 || _2195;
    float _2199 = _2147;
    if (!_2197)
    {
        _2199 = 1.0;
    }
    float _2201 = _2199;
    bool _2203 = !_2197;
    float _2205 = _2201;
    if (!_2203)
    {
        bool _2207 = _2179 >= (*spvDescriptorSet0.vp_c16)._m0[1].y;
        bool _2209 = isnan(_2179);
        bool _2211 = _2207 || _2209;
        bool _2213 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].y);
        bool _2215 = _2211 || _2213;
        if (!_2215)
        {
            float _2217 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _2219 = _2179 + _2217;
            float _2221 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _2223 = (*spvDescriptorSet0.vp_c16)._m0[1].y + _2221;
            float _2225 = -(*spvDescriptorSet0.vp_c16)._m0[2].x;
            float _2227 = _2225 + (*spvDescriptorSet0.vp_c16)._m0[2].y;
            float _2229 = 1.0 / _2223;
            float _2231 = _2219 * _2229;
            float _2233 = fma(_2231, _2227, (*spvDescriptorSet0.vp_c16)._m0[2].x);
            _2205 = _2233;
            _2235 = true;
        }
        else
        {
            bool _2237 = _2179 >= (*spvDescriptorSet0.vp_c16)._m0[1].z;
            bool _2239 = isnan(_2179);
            bool _2241 = _2237 || _2239;
            bool _2243 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].z);
            bool _2245 = _2241 || _2243;
            if (!_2245)
            {
                float _2247 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _2249 = _2179 + _2247;
                float _2251 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _2253 = _2251 + (*spvDescriptorSet0.vp_c16)._m0[1].z;
                float _2255 = -(*spvDescriptorSet0.vp_c16)._m0[2].y;
                float _2257 = _2255 + (*spvDescriptorSet0.vp_c16)._m0[2].z;
                float _2259 = 1.0 / _2253;
                float _2261 = _2249 * _2259;
                float _2263 = fma(_2261, _2257, (*spvDescriptorSet0.vp_c16)._m0[2].y);
                _2205 = _2263;
                _2235 = true;
            }
            else
            {
                _2205 = (*spvDescriptorSet0.vp_c16)._m0[2].z;
            }
        }
    }
    _2235 = false;
    float _2265 = _2205;
    float _2267 = -(*spvDescriptorSet0.vp_c16)._m0[0].y;
    float _2269 = _2137 + _2267;
    float _2271 = _1729 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _2273 = -(*spvDescriptorSet0.vp_c16)._m0[0].x;
    float _2275 = _2143 + _2273;
    float _2277 = -(*spvDescriptorSet0.vp_c16)._m0[0].z;
    float _2279 = _2145 + _2277;
    float _2281 = fma(_2269, _2265, (*spvDescriptorSet0.vp_c16)._m0[0].y);
    float _2283 = fma(_1735, (*spvDescriptorSet0.vp_c8)._m0[11].x, _2271);
    float _2285 = fma(_2275, _2265, (*spvDescriptorSet0.vp_c16)._m0[0].x);
    float _2287 = fma(_2279, _2265, (*spvDescriptorSet0.vp_c16)._m0[0].z);
    float _2289 = -_1353;
    float _2291 = _2289 + _2281;
    float _2293 = fma(_1745, (*spvDescriptorSet0.vp_c8)._m0[11].z, _2283);
    float _2295 = -_1363;
    float _2297 = _2295 + _2285;
    float _2299 = _1729 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _2301 = _2291 * _2291;
    float _2303 = _2293 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _2305 = -_1371;
    float _2307 = _2305 + _2287;
    float _2309 = fma(_1735, (*spvDescriptorSet0.vp_c8)._m0[10].x, _2299);
    float _2311 = fma(_2297, _2297, _2301);
    float _2313 = 1.0 / _2303;
    float _2315 = fma(_1745, (*spvDescriptorSet0.vp_c8)._m0[10].z, _2309);
    float _2317 = fma(_2307, _2307, _2311);
    float _2319 = _2315 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _2321 = sqrt(_2317);
    float _2323 = _2319 + _2303;
    float _2325 = _2323 * _2313;
    float _2327 = _2325 * 0.5;
    float _2329 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _2331 = fma(_2327, (*spvDescriptorSet0.vp_c8)._m0[30].w, _2329);
    bool _2333 = _2321 > 0.0;
    float _2335 = 1.0 / _2331;
    bool _2337 = (*spvDescriptorSet0.vp_c15)._m0[653].w >= 0.5;
    bool _2339 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _2341 = _2337 || _2339;
    bool _2343 = isnan(0.5);
    bool _2345 = _2341 || _2343;
    bool _2347 = (*spvDescriptorSet0.vp_c15)._m0[660].y >= 0.5;
    bool _2349 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _2351 = _2347 || _2349;
    bool _2353 = isnan(0.5);
    bool _2355 = _2351 || _2353;
    bool _2357 = !_2333;
    float _2359 = _2281;
    float _2361 = _2285;
    float _2363 = _2287;
    if (!_2357)
    {
        float _2365 = _212 * _212;
        float _2367 = rsqrt(_2317);
        float _2369 = fma(_208, _208, _2365);
        float _2371 = fma(_214, _214, _2369);
        float _2373 = sqrt(_2371);
        float _2375 = _2297 * _2367;
        float _2377 = _2291 * _2367;
        float _2379 = _2307 * _2367;
        bool _2381 = _2373 > 0.0;
        bool _2383 = !_2381;
        if (!_2383)
        {
            float _2385 = rsqrt(_2371);
            float _2387 = 1.0 / (*spvDescriptorSet0.vp_c10)._m0[2].z;
            float _2389 = _212 * _2385;
            float _2391 = _208 * _2385;
            float _2393 = _2377 * _2389;
            float _2395 = _214 * _2385;
            float _2397 = fma(_2375, _2391, _2393);
            float _2399 = _2387 * (*spvDescriptorSet0.vp_c9)._m0[142].x;
            float _2401 = fma(_2379, _2395, _2397);
            float _2403 = _2401 * _2399;
            float _2405 = fma(_208, _2403, _2285);
            float _2407 = fma(_212, _2403, _2281);
            float _2409 = fma(_214, _2403, _2287);
            _2359 = _2407;
            _2361 = _2405;
            _2363 = _2409;
        }
    }
    float _2411 = _2359;
    float _2413 = _2361;
    float _2415 = _2363;
    float _2417 = -_1721;
    float _2419 = fma(_2417, (*spvDescriptorSet0.vp_c9)._m0[18].w, _2411);
    float _2421 = -_1723;
    float _2423 = fma(_2421, (*spvDescriptorSet0.vp_c9)._m0[18].w, _2413);
    float _2425 = -_1731;
    float _2427 = fma(_2425, (*spvDescriptorSet0.vp_c9)._m0[18].w, _2415);
    float _2429 = _2419;
    float _2431 = _2423;
    float _2433 = _2427;
    if (_2345)
    {
        _1725 = 1.0;
    }
    float _2435 = _1725;
    float _2437 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _2439 = _2335 * _2437;
    float _2441 = _2435;
    if (!_2355)
    {
        float _2443 = _1741 * _1741;
        float _2445 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _2447 = -_1371;
        float _2449 = _2447 + _2415;
        float _2451 = -_1363;
        float _2453 = _2451 + _2413;
        float _2455 = fma(_1749, _1749, _2443);
        float _2457 = fma(_1757, _1757, _2455);
        float _2459 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _2461 = sqrt(_2457);
        float _2463 = 1.0 / _1853;
        float _2465 = _2459 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _2467 = precise::min(_2461, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _2469 = _2467 * _2445;
        float _2471 = -_1353;
        float _2473 = _2471 + _2411;
        float _2475 = _2469 * _2463;
        float _2477 = _2465 * _2475;
        float _2479 = _2449 * _2475;
        float _2481 = fma(_2473, _2477, _1729);
        float _2483 = fma(_2453, _2477, _1735);
        float _2485 = fma(_2465, _2479, _1745);
        _2429 = _2481;
        _2431 = _2483;
        _2433 = _2485;
        _1813 = _2465;
    }
    float _2487 = _2429;
    float _2489 = _2431;
    float _2491 = _2433;
    float _2493 = _1813;
    float _2495 = _2493;
    if (!_2345)
    {
        float _2497 = (*spvDescriptorSet0.vp_c8)._m0[31].x * 0.5;
        float _2499 = _2497 * 0.15915493667125701904296875;
        float _2501 = _2499 * 6.283185482025146484375;
        float _2503 = cos(_2501);
        float _2505 = (*spvDescriptorSet0.vp_c8)._m0[31].y * 0.5;
        float _2507 = _2505 * 0.15915493667125701904296875;
        float _2509 = _2499 * 6.283185482025146484375;
        float _2511 = sin(_2509);
        float _2513 = 1.0 / _2503;
        float _2515 = _2507 * 6.283185482025146484375;
        float _2517 = cos(_2515);
        float _2519 = _2511 * _2513;
        float _2521 = _2507 * 6.283185482025146484375;
        float _2523 = sin(_2521);
        float _2525 = _2517 * _2519;
        float _2527 = 1.0 / _2525;
        float _2529 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _2531 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _2529;
        float _2533 = 1.0 / _2531;
        float _2535 = _2523 * _2527;
        float _2537 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _2539 = fma(_2439, _2535, _2537);
        float _2541 = _2539 * _2533;
        float _2543 = precise::clamp(_2541, 0.0, 1.0);
        _2441 = _2543;
    }
    float _2545 = _2441;
    float _2547 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _2549 = _2487 + _2547;
    float _2551 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _2553 = _2489 + _2551;
    float _2555 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _2557 = _2491 + _2555;
    float _2559 = _2549 * _2549;
    float _2561 = fma(_2553, _2553, _2559);
    float _2563 = fma(_2557, _2557, _2561);
    float _2565 = rsqrt(_2563);
    float _2567 = sqrt(_2563);
    float _2569 = _2565 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _2571 = _2553 * _2569;
    float _2573 = _2557 * _2569;
    float _2575 = _2571 * _2571;
    float _2577 = _2573 * _2573;
    float _2579 = _2575 + _2577;
    float _2581 = sqrt(_2579);
    bool _2583 = _2581 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2585 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2587 = _2581 + _2585;
    float _2589 = _2565;
    float _2591 = _2587;
    float _2593 = _2549;
    float _2595 = (*spvDescriptorSet0.vp_c15)._m0[652].x;
    if (_2583)
    {
        float _2597 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2589 = _2597;
    }
    float _2599 = _2589;
    float _2601 = _2599;
    if (_2583)
    {
        float _2603 = _2587 * _2599;
        _2591 = _2603;
    }
    float _2605 = _2591;
    if (_2583)
    {
        float _2607 = rsqrt(_2579);
        _2601 = _2607;
    }
    float _2609 = _2601;
    float _2611 = _2609;
    if (_2583)
    {
        float _2613 = _2605 * 0.15915493667125701904296875;
        _2495 = _2613;
    }
    float _2615 = _2495;
    float _2617 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _2619 = _2557;
    float _2621 = _2615;
    if (_2583)
    {
        float _2623 = _2615 * 6.283185482025146484375;
        float _2625 = sin(_2623);
        _2619 = _2625;
    }
    float _2627 = _2619;
    float _2629 = precise::max(0.0, _2617);
    float _2631 = _1729;
    if (_2583)
    {
        float _2633 = _2615 * 6.283185482025146484375;
        float _2635 = cos(_2633);
        _2631 = _2635;
    }
    float _2637 = _2631;
    float _2639 = -_2569;
    float _2641 = -_2629;
    float _2643 = fma(_2549, _2639, _2641);
    float _2645 = fma(_1735, (*spvDescriptorSet0.vp_c15)._m0[652].x, (*spvDescriptorSet0.vp_c15)._m0[652].z);
    if (!_2583)
    {
        _1815 = _2571;
    }
    float _2647 = _1815;
    float _2649 = _2647;
    if (_2583)
    {
        float _2651 = _2643 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2593 = _2651;
    }
    float _2653 = _2593;
    float _2655 = _2627;
    float _2657 = _2653;
    if (_2583)
    {
        float _2659 = fma(_2627, _2653, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _2655 = _2659;
    }
    float _2661 = _2655;
    float _2663 = _2661;
    if (_2583)
    {
        float _2665 = _2609 * _2661;
        _2595 = _2665;
    }
    float _2667 = _2595;
    if (!_2583)
    {
        _2611 = _2643;
    }
    float _2669 = _2611;
    float _2671 = _2669;
    float _2673 = _2637;
    if (_2583)
    {
        float _2675 = _2637 + (-1.0);
        _2657 = _2675;
    }
    float _2677 = _2657;
    float _2679 = _2677;
    if (_2583)
    {
        float _2681 = _2571 * _2667;
        _2649 = _2681;
    }
    float _2683 = _2649;
    if (!_2583)
    {
        _2663 = _2575;
    }
    float _2685 = _2663;
    float _2687 = _2685;
    if (_2583)
    {
        float _2689 = _2677 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2621 = _2689;
    }
    float _2691 = _2621;
    if (!_2583)
    {
        _2679 = _2573;
    }
    float _2693 = _2679;
    float _2695 = _2693;
    if (_2583)
    {
        float _2697 = _2683 * _2683;
        _2687 = _2697;
    }
    float _2699 = _2687;
    if (_2583)
    {
        float _2701 = _2573 * _2667;
        _2695 = _2701;
    }
    float _2703 = _2695;
    if (_2583)
    {
        float _2705 = fma(_2643, _2637, _2691);
        _2671 = _2705;
    }
    float _2707 = _2671;
    if (!_2583)
    {
        _2673 = _2577;
    }
    float _2709 = _2673;
    float _2711 = floor(_2645);
    float _2713 = _2709;
    if (_2583)
    {
        float _2715 = _2703 * _2703;
        _2713 = _2715;
    }
    float _2717 = _2713;
    float _2719 = fma(_2707, _2707, _2699);
    float _2721 = _2487 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _2723 = _2719 + _2717;
    float _2725 = fma(_2489, (*spvDescriptorSet0.vp_c8)._m0[2].x, _2721);
    float _2727 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _2729 = fma(_2567, (*spvDescriptorSet0.vp_c15)._m0[23].w, _2727);
    float _2731 = precise::clamp(_2729, 0.0, 1.0);
    float _2733 = rsqrt(_2723);
    float _2735 = fma(_2491, (*spvDescriptorSet0.vp_c8)._m0[2].z, _2725);
    float _2737 = -_2731;
    float _2739 = _2737 + 1.0;
    float _2741 = fma(_1745, (*spvDescriptorSet0.vp_c15)._m0[652].y, (*spvDescriptorSet0.vp_c15)._m0[652].w);
    float _2743 = _2735 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _2745 = _2487 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _2747 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _2749 = abs(_2739);
    float _2751 = log2(_2749);
    float _2753 = _2743 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _2755 = _2487 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _2757 = fma(_2489, (*spvDescriptorSet0.vp_c8)._m0[3].x, _2745);
    float _2759 = -_2753;
    float _2761 = fma(_2759, _2747, 1.0);
    float _2763 = _2487 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _2765 = fma(_2489, (*spvDescriptorSet0.vp_c8)._m0[1].x, _2755);
    float _2767 = _2733 * _2683;
    float _2769 = _2733 * _2707;
    float _2771 = fma(_2489, (*spvDescriptorSet0.vp_c8)._m0[0].x, _2763);
    float _2773 = fma(_2491, (*spvDescriptorSet0.vp_c8)._m0[1].z, _2765);
    float _2775 = _2767 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _2777 = _2733 * _2703;
    float _2779 = fma(_2491, (*spvDescriptorSet0.vp_c8)._m0[0].z, _2771);
    float _2781 = _2773 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _2783 = -_2775;
    float _2785 = fma(_2769, (*spvDescriptorSet0.vp_c15)._m0[21].y, _2783);
    float _2787 = floor(_2741);
    float _2789 = _2779 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _2791 = _2781 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _2793 = -_2777;
    float _2795 = fma(_2793, (*spvDescriptorSet0.vp_c15)._m0[21].z, _2785);
    float _2797 = fma(_2491, (*spvDescriptorSet0.vp_c8)._m0[3].z, _2757);
    float _2799 = _2751 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _2801 = fma(_2789, (*spvDescriptorSet0.vp_c8)._m0[7].x, _2791);
    float _2803 = fma(_2795, -0.5, 0.5);
    float _2805 = _2797 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _2807 = exp2(_2799);
    float _2809 = fma(_2743, (*spvDescriptorSet0.vp_c8)._m0[7].z, _2801);
    float _2811 = -_2711;
    float _2813 = _2645 + _2811;
    float _2815 = fma(_2795, 0.5, 0.5);
    float _2817 = fma(_2805, (*spvDescriptorSet0.vp_c8)._m0[7].w, _2809);
    float _2819 = _2781 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _2821 = _2781 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _2823 = log2(_2761);
    float _2825 = fma(_2789, (*spvDescriptorSet0.vp_c8)._m0[5].x, _2821);
    float _2827 = fma(_2743, (*spvDescriptorSet0.vp_c8)._m0[5].z, _2825);
    float _2829 = 1.0 / _2817;
    float _2831 = -_2787;
    float _2833 = _2741 + _2831;
    float _2835 = fma(_2815, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _2837 = fma(_2789, (*spvDescriptorSet0.vp_c8)._m0[4].x, _2819);
    float _2839 = _2769 + 1.0;
    float _2841 = fma(_2815, _2835, -0.212114393711090087890625);
    float _2843 = fma(_2743, (*spvDescriptorSet0.vp_c8)._m0[4].z, _2837);
    float _2845 = sqrt(_2803);
    float _2847 = -_2769;
    float _2849 = fma(_2807, _2839, _2847);
    float _2851 = fma(_2805, (*spvDescriptorSet0.vp_c8)._m0[5].w, _2827);
    float _2853 = fma(_2805, (*spvDescriptorSet0.vp_c8)._m0[4].w, _2843);
    float _2855 = _2823 * 0.693147182464599609375;
    float2 _7707 = float2(_2813, _2833);
    float _2857 = dm_bs(spvDescriptorSet0.vp_t_tcb_24.sample(spvDescriptorSet0.vp_t_tcb_24Smplr, select(_7707, float2(0.0), isnan(_7707)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_24, spvDescriptorSet0.vp_t_tcb_24Smplr_w, select(_7707, float2(0.0), isnan(_7707)), level(0.0)).x;
    float _2859 = fma(_2815, _2841, 1.570728778839111328125);
    float _2861 = fma(_2849, 0.5, 0.5);
    float _2863 = _2853 * _2829;
    float _2865 = _2851 * _2829;
    float _2867 = _2855 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _2869 = fma(_2863, 0.5, 0.5);
    float _2871 = fma(_2865, -0.5, 0.5);
    float _2873 = _2845 * 0.636619746685028076171875;
    float3 _7741 = float3(_2869, _2871, _2867);
    float _2875 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_7741, float3(0.0), isnan(_7741)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_7741, float3(0.0), isnan(_7741)), level(0.0)).x;
    float _2877 = -_2859;
    float _2879 = fma(_2873, _2877, 1.0);
    float3 _7757 = float3(_2869, _2871, _2867);
    float4 _2882 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_7757, float3(0.0), isnan(_7757)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_7757, float3(0.0), isnan(_7757)), level(0.0)).xyzw;
    float _2884 = _2882.x;
    float _2886 = _2882.y;
    float _2888 = _2882.z;
    float _2890 = _2882.w;
    float2 _7773 = float2(_2879, _2861);
    float3 _2894 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_7773, float2(0.0), isnan(_7773)), level(0.0)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_7773, float2(0.0), isnan(_7773)), level(0.0)).xyz;
    float _2896 = _2894.x;
    float _2898 = _2894.y;
    float _2900 = _2894.z;
    float _2902 = abs(_2439);
    float _2904 = log2(_2902);
    float _2906 = _2781 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _2908 = _2853 + _2817;
    float _2910 = fma(_2789, (*spvDescriptorSet0.vp_c8)._m0[6].x, _2906);
    bool _2912 = _2567 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _2914 = isnan(_2567);
    bool _2916 = _2912 || _2914;
    bool _2918 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _2920 = _2916 || _2918;
    float _2922 = _2908 * 0.5;
    float _2924 = fma(_2743, (*spvDescriptorSet0.vp_c8)._m0[6].z, _2910);
    float _2926 = _2751 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    bool _2928 = _2439 <= 8000.0;
    bool _2930 = isnan(_2439);
    bool _2932 = _2928 || _2930;
    bool _2934 = isnan(8000.0);
    bool _2936 = _2932 || _2934;
    float _2938 = float(_2936);
    float _2940 = fma(_2805, (*spvDescriptorSet0.vp_c8)._m0[6].w, _2924);
    float _2942 = in.m_87.x;
    float _2944 = _2904 * (*spvDescriptorSet0.vp_c15)._m0[654].z;
    float _2946 = exp2(_2926);
    out.gl_Position.x = _2853;
    out.gl_Position.y = _2851;
    out.gl_Position.z = _2940;
    out.gl_Position.w = _2817;
    float _2948 = exp2(_2944);
    float _2950 = -_2946;
    float _2952 = _2950 + 1.0;
    float _2954 = _2952 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _2956 = fma(_2948, (*spvDescriptorSet0.vp_c15)._m0[654].x, (*spvDescriptorSet0.vp_c15)._m0[654].y);
    float _2958 = precise::clamp(_2956, 0.0, 1.0);
    float _2960 = _2940 + _2817;
    float _2962 = -_2954;
    float _2964 = _2962 + 1.0;
    float _2966 = _2940;
    float _2968 = _2817;
    float _2970 = _2851;
    float _2972 = _2954;
    float _2974 = _2964;
    if (!_2920)
    {
        _2966 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _2976 = _2966;
    float _2978 = fma(_2958, -2.0, 3.0);
    float _2980 = _2958 * _2958;
    float _2982 = _2960 * 0.5;
    float _2984 = _2980 * _2978;
    float _2986 = -_2984;
    float _2988 = _2986 + 1.0;
    float _2990 = fma(_2988, (*spvDescriptorSet0.vp_c15)._m0[654].w, _2984);
    float _2992 = _2817 * 0.5;
    float _2994 = _2938 * _2990;
    float _2996 = fma(_2851, -0.5, _2992);
    float _2998 = _2976;
    float _3000 = _2976;
    if (!_2920)
    {
        _2968 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _3002 = _2968;
    float _3004 = _2994 * (*spvDescriptorSet0.vp_c15)._m0[653].x;
    out.m_89.x = _2922;
    out.m_89.y = _2996;
    out.m_89.z = _2982;
    out.m_89.w = _2817;
    float _3006 = _3002;
    float _3008 = _3002;
    if (!_2920)
    {
        _2970 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _3010 = _2970;
    float _3012 = -_2857;
    float _3014 = _3012 + 1.0;
    float _3016 = _3014 * _3004;
    float _3018 = precise::clamp(_3016, 0.0, 1.0);
    float _3020 = -_3018;
    float _3022 = fma(_3020, (*spvDescriptorSet0.vp_c15)._m0[653].y, 1.0);
    float _3024 = _2954 * _2875;
    float _3026 = _3022 * _2942;
    float _3028 = _3026;
    float _3030 = _3010;
    float _3032 = _3010;
    if (!_2920)
    {
        _2972 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _3034 = _2972;
    float _3036 = _2890 * _3024;
    float _3038 = _2890 * _2964;
    float _3040 = _3034;
    float _3042 = _3034;
    if (!_2920)
    {
        _2974 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _3044 = _2974;
    float _3046 = _2900 * _3024;
    float _3048 = fma(_2896, _3036, _2884);
    float _3050 = fma(_2898, _3036, _2886);
    float _3052 = _3026 * (*spvDescriptorSet0.vp_c13)._m0[1].w;
    float _3054 = fma(_2890, _3046, _2888);
    float _3056 = _2545 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _3058 = _3044;
    float _3060 = _3044;
    if (!_2920)
    {
        _3028 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _3062 = _3028;
    out.m_91.x = _3052;
    out.m_93.x = _3048;
    out.m_93.y = _3050;
    out.m_93.z = _3054;
    out.m_93.w = _3038;
    bool _3064 = !_2920;
    float _3066 = _3062;
    float _3068 = _3062;
    if (!_3064)
    {
        bool _3070 = _2567 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _3072 = isnan(_2567);
        bool _3074 = _3070 || _3072;
        bool _3076 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _3078 = _3074 || _3076;
        if (!_3078)
        {
            float _3080 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _3082 = _2567 + _3080;
            float _3084 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _3086 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _3084;
            float _3088 = 1.0 / _3086;
            float _3090 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _3092 = _3090 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _3094 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _3096 = _3094 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _3098 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _3100 = _3098 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _3102 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _3104 = _3102 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _3106 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _3108 = _3106 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _3110 = _3082 * _3088;
            float _3112 = precise::clamp(_3110, 0.0, 1.0);
            float _3114 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _3116 = _3114 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _3118 = fma(_3112, _3092, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _3120 = fma(_3112, _3116, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _3122 = fma(_3112, _3096, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _3124 = fma(_3112, _3100, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _3126 = fma(_3112, _3104, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _3128 = fma(_3112, _3108, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            _3068 = _3120;
            _3032 = _3126;
            _3042 = _3118;
            _3000 = _3124;
            _3008 = _3122;
            _3060 = _3128;
            _3130 = true;
        }
        else
        {
            bool _3132 = _2567 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _3134 = isnan(_2567);
            bool _3136 = _3132 || _3134;
            bool _3138 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _3140 = _3136 || _3138;
            if (!_3140)
            {
                _3040 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _3142 = _3040;
            _3042 = _3142;
            if (!_3140)
            {
                _3066 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _3144 = _3066;
            _3068 = _3144;
            if (!_3140)
            {
                _3006 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _3146 = _3006;
            _3008 = _3146;
            if (!_3140)
            {
                _2998 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _3148 = _2998;
            _3000 = _3148;
            if (!_3140)
            {
                _3030 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _3150 = _3030;
            _3032 = _3150;
            if (!_3140)
            {
                _3058 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _3152 = _3058;
            bool _3154 = !_3140;
            _3060 = _3152;
            if (!_3154)
            {
                bool _3156 = _2567 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _3158 = isnan(_2567);
                bool _3160 = _3156 || _3158;
                bool _3162 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _3164 = _3160 || _3162;
                if (!_3164)
                {
                    float _3166 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _3168 = _2567 + _3166;
                    float _3170 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _3172 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _3170;
                    float _3174 = 1.0 / _3172;
                    float _3176 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _3178 = _3176 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _3180 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _3182 = _3180 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _3184 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _3186 = _3184 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _3188 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _3190 = _3188 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _3192 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _3194 = _3192 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _3196 = _3168 * _3174;
                    float _3198 = precise::clamp(_3196, 0.0, 1.0);
                    float _3200 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _3202 = _3200 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _3204 = fma(_3198, _3178, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _3206 = fma(_3198, _3202, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _3208 = fma(_3198, _3182, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _3210 = fma(_3198, _3186, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _3212 = fma(_3198, _3190, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _3214 = fma(_3198, _3194, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    _3068 = _3206;
                    _3032 = _3212;
                    _3042 = _3204;
                    _3000 = _3210;
                    _3008 = _3208;
                    _3060 = _3214;
                    _3130 = true;
                }
                else
                {
                    _3068 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _3032 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _3042 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _3000 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _3008 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _3060 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _3130 = false;
    float _3216 = _3068;
    float _3218 = _3032;
    float _3220 = _3042;
    float _3222 = _3000;
    float _3224 = _3008;
    float _3226 = _3060;
    float _3228 = fma(_2185, -0.5, 0.5);
    float _3230 = precise::clamp(_3228, 0.0, 1.0);
    float _3232 = -_3216;
    float _3234 = _3232 + _3218;
    float _3236 = _3056 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _3238 = -_3220;
    float _3240 = _3238 + _3222;
    float _3242 = fma(_3230, _3234, _3216);
    out.m_95.x = 0.0;
    float _3244 = -_3224;
    float _3246 = _3244 + _3226;
    float _3248 = fma(_3230, _3240, _3220);
    float _3250 = _3242 * 0.586610972881317138671875;
    out.m_51.x = _3236;
    bool _3252 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _3254 = fma(_3230, _3246, _3224);
    float _3256 = fma(_3248, 0.298911988735198974609375, _3250);
    bool _3258 = _2545 > 0.0;
    bool _3260 = isnan(_2545);
    bool _3262 = _3258 || _3260;
    bool _3264 = isnan(0.0);
    bool _3266 = _3262 || _3264;
    float _3268 = fma(_3254, 0.114477999508380889892578125, _3256);
    float _3270 = -_3268;
    float _3272 = _3248 + _3270;
    float _3274 = -_3268;
    float _3276 = _3242 + _3274;
    float _3278 = -_3268;
    float _3280 = _3254 + _3278;
    float _3282 = fma(_3272, (*spvDescriptorSet0.vp_c13)._m0[1].z, _3268);
    float _3284 = fma(_3276, (*spvDescriptorSet0.vp_c13)._m0[1].z, _3268);
    float _3286 = fma(_3280, (*spvDescriptorSet0.vp_c13)._m0[1].z, _3268);
    bool _3288 = !_3252;
    if (!_3288)
    {
        float _3290 = -_2487;
        float _3292 = _3290 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
        float _3294 = -_2489;
        float _3296 = _3294 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
        float _3298 = -_2491;
        float _3300 = _3298 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
        float _3302 = _3292 * _3292;
        float _3304 = fma(_3296, _3296, _3302);
        float _3306 = fma(_3300, _3300, _3304);
        float _3308 = sqrt(_3306);
        float _3310 = rsqrt(_3306);
        float _3312 = -_3308;
        float _3314 = _3312 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
        float _3316 = _3314 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
        float _3318 = precise::clamp(_3316, 0.0, 1.0);
        float _3320 = _3296 * _3310;
        float _3322 = _3292 * _3310;
        float _3324 = abs(_3318);
        float _3326 = log2(_3324);
        float _3328 = _3300 * _3310;
        float _3330 = _3320 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
        float _3332 = _2185 * _3322;
        float _3334 = -_3322;
        float _3336 = -_3330;
        float _3338 = fma(_3334, (*spvDescriptorSet0.vp_c15)._m0[656].y, _3336);
        float _3340 = fma(_2183, _3320, _3332);
        float _3342 = -_3328;
        float _3344 = fma(_3342, (*spvDescriptorSet0.vp_c15)._m0[656].z, _3338);
        float _3346 = fma(_2187, _3328, _3340);
        float _3348 = precise::clamp(_3346, 0.0, 1.0);
        float _3350 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
        float _3352 = _3344 + _3350;
        float _3354 = _3326 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
        float _3356 = _3352 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
        float _3358 = precise::clamp(_3356, 0.0, 1.0);
        float _3360 = exp2(_3354);
        float _3362 = _3360 * _3358;
        float _3364 = _3348 * _3362;
        float _3366 = _3364 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
        float _3368 = _3364 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
        float _3370 = _3364 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
        out.m_95.x = _3366;
        out.m_95.y = _3368;
        out.m_95.z = _3370;
    }
    out.m_97.x = _3282;
    out.m_97.y = _3284;
    out.m_97.z = _3286;
    if (_3266)
    {
        return out;
    }
    out.m_51.x = 0.0;
    float _3372 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _3372;
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
    out.m_77 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_71 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_51 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_97 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_67 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_73 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_89 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_79 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_85 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_95 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_91 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_93 = float4(0.0, 0.0, 0.0, 1.0);
    bool _3130 = false;
    bool _2235 = false;
    bool _638 = false;
    bool _512 = false;
    bool _236 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _111 = in.m_48.w;
    float _113 = trunc(_111);
    int _116 = int(_113);
    bool _120 = _116 >= 1;
    float _122 = 0.0;
    if (!_120)
    {
        _122 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _124 = _122;
    float _126 = _124;
    if (!_120)
    {
        out.m_51.x = 0.0;
    }
    int _128 = 0;
    if (!_120)
    {
        float _130 = _124 * 5.0;
        _128 = as_type<int>(_130);
    }
    int _132 = _128;
    int _134 = _132;
    if (!_120)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _3429 = as_type<float>(_132);
        out.gl_Position.z = _3429;
    }
    if (!_120)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_77.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_77.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_77.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_77.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_71.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_71.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_71.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_71.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_51.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_51.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_51.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_51.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_97.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_97.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_97.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_97.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_67.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_67.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_67.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_67.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_73.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_73.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_73.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_73.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_89.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_89.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_89.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_89.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_79.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_79.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_79.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_79.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_85.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_85.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_85.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_85.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_95.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_95.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_95.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_95.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_91.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_91.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_91.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_91.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_93.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_93.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_93.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_93.w)); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _136 = in.m_53.w;
    bool _138 = _136 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _140 = isnan(_136);
    bool _142 = _138 || _140;
    bool _144 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _146 = _142 || _144;
    float _148 = -_136;
    float _150 = _148 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    float _152 = 0.0;
    float _154 = _150;
    if (_146)
    {
        float _156 = float(_116);
        _152 = _156;
    }
    float _158 = _152;
    bool _160 = _150 >= _158;
    bool _162 = !_146;
    bool _164 = _160 || _162;
    if (_164)
    {
        _126 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _166 = _126;
    if (_164)
    {
        out.m_51.x = 0.0;
    }
    if (_164)
    {
        float _168 = _166 * 5.0;
        _134 = as_type<int>(_168);
    }
    int _170 = _134;
    if (_164)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _3498 = as_type<float>(_170);
        out.gl_Position.z = _3498;
    }
    if (_164)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_77.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_77.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_77.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_77.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_71.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_71.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_71.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_71.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_51.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_51.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_51.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_51.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_97.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_97.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_97.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_97.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_67.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_67.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_67.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_67.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_73.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_73.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_73.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_73.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_89.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_89.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_89.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_89.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_79.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_79.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_79.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_79.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_85.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_85.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_85.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_85.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_95.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_95.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_95.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_95.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_91.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_91.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_91.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_91.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_93.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_93.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_93.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_93.w)); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _172 = in.m_55.x;
    float _174 = in.m_55.y;
    float _176 = in.m_55.z;
    bool _178 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _180 = in.m_57.x;
    float _182 = in.m_57.y;
    float _184 = in.m_57.z;
    float _186 = in.m_59.x;
    float _188 = in.m_59.y;
    float _190 = in.m_59.z;
    float _192 = in.m_61.x;
    float _194 = in.m_61.y;
    float _196 = in.m_61.z;
    float _198 = _174 * _182;
    float _200 = _174 * _188;
    float _202 = fma(_172, _180, _198);
    float _204 = _174 * _194;
    float _206 = fma(_172, _186, _200);
    float _208 = fma(_176, _184, _202);
    float _210 = fma(_172, _192, _204);
    float _212 = fma(_176, _190, _206);
    float _214 = fma(_176, _196, _210);
    bool _216 = !_178;
    float _234;
    if (!_216)
    {
        float _218 = in.m_63.x;
        float _220 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _222 = _218 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _224 = fma(_222, (*spvDescriptorSet0.vp_c9)._m0[12].x, _150);
        float _226 = _224 * _220;
        float _228 = floor(_226);
        float _230 = -_228;
        float _232 = _226 + _230;
        _234 = _232;
        _236 = true;
    }
    else
    {
        float _238 = float(_116);
        float _240 = 1.0 / _238;
        float _242 = _150 * _240;
        _234 = _242;
    }
    _236 = false;
    float _244 = _234;
    float _246 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _248 = _244 + _246;
    float _250 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _252 = _244 + _250;
    float _254 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _256 = _244 + _254;
    float _258 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _260 = (*spvDescriptorSet0.vp_c9)._m0[146].w + _258;
    float _262 = -(*spvDescriptorSet0.vp_c9)._m0[146].w;
    float _264 = _262 + (*spvDescriptorSet0.vp_c9)._m0[147].w;
    float _266 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _268 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _266;
    float _270 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _272 = _270 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _274 = 1.0 / _264;
    float _276 = 1.0 / _268;
    float _278 = -(*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _280 = (*spvDescriptorSet0.vp_c9)._m0[144].z + _278;
    bool _282 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].x;
    float _284 = 1.0 / _272;
    float _286 = -(*spvDescriptorSet0.vp_c9)._m0[146].w;
    float _288 = _244 + _286;
    float _290 = 1.0 / _260;
    float _292 = _288 * _274;
    bool _294 = _244 >= (*spvDescriptorSet0.vp_c9)._m0[147].w;
    bool _296 = isnan(_244);
    bool _298 = _294 || _296;
    bool _300 = isnan((*spvDescriptorSet0.vp_c9)._m0[147].w);
    bool _302 = _298 || _300;
    float _304 = float(_302);
    float _306 = _248 * _276;
    bool _308 = _244 >= (*spvDescriptorSet0.vp_c9)._m0[146].w;
    bool _310 = isnan(_244);
    bool _312 = _308 || _310;
    bool _314 = isnan((*spvDescriptorSet0.vp_c9)._m0[146].w);
    bool _316 = _312 || _314;
    float _318 = float(_316);
    bool _320 = _244 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _322 = isnan(_244);
    bool _324 = _320 || _322;
    bool _326 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _328 = _324 || _326;
    float _330 = float(_328);
    float _332 = -_304;
    float _334 = _332 + 1.0;
    float _336 = _252 * _284;
    float _338 = fma(_280, _306, (*spvDescriptorSet0.vp_c9)._m0[143].z);
    bool _340 = _244 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _342 = isnan(_244);
    bool _344 = _340 || _342;
    bool _346 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _348 = _344 || _346;
    float _350 = float(_348);
    float _352 = _318 * _334;
    float _354 = -_318;
    float _356 = _354 + 1.0;
    float _358 = -_330;
    float _360 = _358 + 1.0;
    float _362 = _256 * _290;
    float _364 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _366 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _364;
    float _368 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _370 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _368;
    float _372 = fma(_366, _306, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _374 = fma(_370, _306, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    bool _376 = _244 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _378 = isnan(_244);
    bool _380 = _376 || _378;
    bool _382 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _384 = _380 || _382;
    float _386 = float(_384);
    float _388 = _330 * _356;
    float _390 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _392 = _390 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _394 = -(*spvDescriptorSet0.vp_c9)._m0[144].z;
    float _396 = _394 + (*spvDescriptorSet0.vp_c9)._m0[145].z;
    float _398 = _350 * _360;
    float _400 = -_350;
    float _402 = _400 + 1.0;
    float _404 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _406 = _404 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _408 = fma(_392, _336, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _410 = fma(_396, _336, (*spvDescriptorSet0.vp_c9)._m0[144].z);
    float _412 = _386 * _402;
    float _414 = fma(_406, _336, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _416 = -_386;
    float _418 = _416 + 1.0;
    float _420 = -(*spvDescriptorSet0.vp_c9)._m0[145].z;
    float _422 = (*spvDescriptorSet0.vp_c9)._m0[146].z + _420;
    float _424 = _374 * _412;
    float _426 = _372 * _412;
    float _428 = _338 * _412;
    float _430 = -(*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _432 = (*spvDescriptorSet0.vp_c9)._m0[146].x + _430;
    float _434 = -(*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _436 = (*spvDescriptorSet0.vp_c9)._m0[146].y + _434;
    float _438 = fma(_418, (*spvDescriptorSet0.vp_c9)._m0[143].y, _424);
    float _440 = fma(_418, (*spvDescriptorSet0.vp_c9)._m0[143].x, _426);
    float _442 = fma(_418, (*spvDescriptorSet0.vp_c9)._m0[143].z, _428);
    float _444 = fma(_432, _362, (*spvDescriptorSet0.vp_c9)._m0[145].x);
    float _446 = fma(_436, _362, (*spvDescriptorSet0.vp_c9)._m0[145].y);
    float _448 = fma(_422, _362, (*spvDescriptorSet0.vp_c9)._m0[145].z);
    float _450 = fma(_414, _398, _438);
    float _452 = fma(_408, _398, _440);
    float _454 = fma(_410, _398, _442);
    float _456 = -(*spvDescriptorSet0.vp_c9)._m0[146].x;
    float _458 = _456 + (*spvDescriptorSet0.vp_c9)._m0[147].x;
    float _460 = -(*spvDescriptorSet0.vp_c9)._m0[146].y;
    float _462 = _460 + (*spvDescriptorSet0.vp_c9)._m0[147].y;
    float _464 = -(*spvDescriptorSet0.vp_c9)._m0[146].z;
    float _466 = _464 + (*spvDescriptorSet0.vp_c9)._m0[147].z;
    float _468 = fma(_444, _388, _452);
    float _470 = fma(_458, _292, (*spvDescriptorSet0.vp_c9)._m0[146].x);
    float _472 = fma(_462, _292, (*spvDescriptorSet0.vp_c9)._m0[146].y);
    float _474 = fma(_466, _292, (*spvDescriptorSet0.vp_c9)._m0[146].z);
    float _476 = fma(_446, _388, _450);
    float _478 = fma(_448, _388, _454);
    float _480 = fma(_470, _352, _468);
    float _482 = fma(_472, _352, _476);
    float _484 = fma(_474, _352, _478);
    float _486 = fma(_304, (*spvDescriptorSet0.vp_c9)._m0[147].x, _480);
    float _488 = fma(_304, (*spvDescriptorSet0.vp_c9)._m0[147].y, _482);
    float _490 = fma(_304, (*spvDescriptorSet0.vp_c9)._m0[147].z, _484);
    bool _492 = !_282;
    float _510;
    if (!_492)
    {
        float _494 = in.m_63.x;
        float _496 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].x;
        float _498 = _494 * (*spvDescriptorSet0.vp_c9)._m0[12].y;
        float _500 = fma(_498, (*spvDescriptorSet0.vp_c9)._m0[11].x, _150);
        float _502 = _500 * _496;
        float _504 = floor(_502);
        float _506 = -_504;
        float _508 = _502 + _506;
        _510 = _508;
        _512 = true;
    }
    else
    {
        float _514 = float(_116);
        float _516 = 1.0 / _514;
        float _518 = _150 * _516;
        _510 = _518;
    }
    _512 = false;
    float _520 = _510;
    float _522 = in.m_65.x;
    float _524 = in.m_65.y;
    float _526 = in.m_65.z;
    float _528 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _530 = _520 + _528;
    bool _532 = _520 >= (*spvDescriptorSet0.vp_c9)._m0[108].w;
    bool _534 = isnan(_520);
    bool _536 = _532 || _534;
    bool _538 = isnan((*spvDescriptorSet0.vp_c9)._m0[108].w);
    bool _540 = _536 || _538;
    float _542 = float(_540);
    float _544 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _546 = (*spvDescriptorSet0.vp_c9)._m0[108].w + _544;
    bool _548 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _550 = 1.0 / _546;
    float _552 = _488 * _524;
    float _554 = _490 * _526;
    float _556 = _530 * _550;
    float _558 = -_542;
    float _560 = _558 + 1.0;
    bool _562 = _520 >= (*spvDescriptorSet0.vp_c9)._m0[107].w;
    bool _564 = isnan(_520);
    bool _566 = _562 || _564;
    bool _568 = isnan((*spvDescriptorSet0.vp_c9)._m0[107].w);
    bool _570 = _566 || _568;
    float _572 = float(_570);
    float _574 = -(*spvDescriptorSet0.vp_c9)._m0[107].x;
    float _576 = (*spvDescriptorSet0.vp_c9)._m0[108].x + _574;
    float _578 = -(*spvDescriptorSet0.vp_c9)._m0[107].z;
    float _580 = (*spvDescriptorSet0.vp_c9)._m0[108].z + _578;
    float _582 = -(*spvDescriptorSet0.vp_c9)._m0[107].y;
    float _584 = (*spvDescriptorSet0.vp_c9)._m0[108].y + _582;
    float _586 = _572 * _560;
    float _588 = fma(_576, _556, (*spvDescriptorSet0.vp_c9)._m0[107].x);
    float _590 = fma(_584, _556, (*spvDescriptorSet0.vp_c9)._m0[107].y);
    float _592 = fma(_580, _556, (*spvDescriptorSet0.vp_c9)._m0[107].z);
    float _594 = -_572;
    float _596 = _594 + 1.0;
    float _598 = _588 * _586;
    float _600 = _590 * _586;
    float _602 = _592 * _586;
    float _604 = _486 * _522;
    float _606 = fma(_596, (*spvDescriptorSet0.vp_c9)._m0[107].x, _598);
    float _608 = fma(_596, (*spvDescriptorSet0.vp_c9)._m0[107].y, _600);
    float _610 = fma(_596, (*spvDescriptorSet0.vp_c9)._m0[107].z, _602);
    float _612 = fma(_542, (*spvDescriptorSet0.vp_c9)._m0[108].x, _606);
    float _614 = fma(_542, (*spvDescriptorSet0.vp_c9)._m0[108].y, _608);
    float _616 = fma(_542, (*spvDescriptorSet0.vp_c9)._m0[108].z, _610);
    bool _618 = !_548;
    float _636;
    if (!_618)
    {
        float _620 = in.m_63.x;
        float _622 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _624 = _620 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _626 = fma(_624, (*spvDescriptorSet0.vp_c9)._m0[11].y, _150);
        float _628 = _626 * _622;
        float _630 = floor(_628);
        float _632 = -_630;
        float _634 = _628 + _632;
        _636 = _634;
        _638 = true;
    }
    else
    {
        float _640 = float(_116);
        float _642 = 1.0 / _640;
        float _644 = _150 * _642;
        _636 = _644;
    }
    _638 = false;
    float _646 = _636;
    float _648 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].y);
    int _650 = int(_648);
    float _652 = in.m_59.w;
    float _654 = float(_116);
    float _656 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].x);
    int _658 = int(_656);
    float _660 = float(_650);
    float _662 = 1.0 / _654;
    float _664 = float(uint(_658));
    float _666 = 1.0 / _660;
    int _668 = ~_658;
    int _670 = _668 + 1;
    int _672 = ~_658;
    int _674 = _672 + 1;
    float _676 = 1.0 / _664;
    float _678 = _666 * _150;
    float _680 = trunc(_678);
    int _682 = int(_680);
    int _684 = as_type<int>(_676) + (-2);
    float _686 = float(uint(_682));
    float _688 = as_type<float>(_684) * _686;
    float _690 = in.m_63.x;
    float _692 = in.m_63.y;
    float _694 = trunc(_688);
    float _696 = precise::max(_694, 0.0);
    uint _699 = uint(_696);
    out.m_67.x = 1.0;
    out.m_67.y = 1.0;
    out.m_67.z = 1.0;
    int _701 = _670 * int(_699);
    int _703 = _701 + _682;
    float _705 = float(uint(_703));
    float _707 = in.m_48.x;
    float _709 = in.m_48.y;
    float _711 = in.m_48.z;
    float _713 = as_type<float>(_684) * _705;
    float _715 = float(_682);
    int _717 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _719 = _717 != 0;
    float _721 = trunc(_713);
    float _723 = precise::max(_721, 0.0);
    uint _725 = uint(_723);
    bool _727 = !_719;
    float _729 = _727 ? 7.345489978790283203125 : 1.0;
    int _731 = ~_658;
    int _733 = _731 + 1;
    int _735 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _737 = _735 != 0;
    float _739 = _729 * _690;
    int _741 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _743 = _741 != 0;
    int _745 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4096;
    bool _747 = _745 != 0;
    float _749 = _182 * _709;
    int _751 = int(_699) + int(_725);
    float _753 = _188 * _709;
    float _755 = _194 * _709;
    float _757 = float(_658);
    float _759 = fma(_180, _707, _749);
    int _761 = _733 * _751;
    int _763 = _761 + _682;
    float _765 = floor(_739);
    bool _767 = _715 >= _757;
    bool _769 = isnan(_715);
    bool _771 = _767 || _769;
    bool _773 = isnan(_757);
    bool _775 = _771 || _773;
    float _777 = float(_775);
    float _779 = fma(_192, _707, _755);
    float _781 = fma(_184, _711, _759);
    bool _783 = uint(_763) >= uint(_658);
    float _785 = fma(_186, _707, _753);
    float _787 = _757 * _150;
    float _789 = trunc(_777);
    int _791 = int(_789);
    bool _793 = !_783;
    int _795 = _793 ? 0 : (-1);
    float _797 = fma(_196, _711, _779);
    int _799 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 16;
    bool _801 = _799 != 0;
    int _803 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 32;
    bool _805 = _803 != 0;
    int _807 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 64;
    bool _809 = _807 != 0;
    float _811 = _787 * _662;
    int _813 = ~_751;
    int _815 = _813 + _795;
    int _817 = _815 + 1;
    float _819 = fma(_190, _711, _785);
    bool _821 = !_747;
    int _823 = _821 ? 0 : 1;
    float _825 = -_765;
    float _827 = _739 + _825;
    bool _829 = _658 == 0;
    int _831 = _658 * _817;
    int _833 = _831 + _682;
    bool _835 = !_805;
    int _837 = _835 ? 0 : 1;
    float _839 = _827 * _757;
    float _841 = trunc(_811);
    int _843 = int(_841);
    float _845 = in.m_69.y;
    bool _847 = !_829;
    int _849 = _847 ? _833 : (-1);
    int _851 = ~_791;
    int _853 = _851 + 1;
    int _855 = _853 + 1;
    float _857 = 0.0;
    if (_737)
    {
        float _859 = in.m_63.x;
        _857 = _859;
    }
    float _861 = _857;
    int _863 = _658 + (-1);
    float _865 = trunc(_839);
    int _867 = int(_865);
    bool _869 = !_801;
    int _871 = _869 ? 0 : 1;
    int _873 = _849 * _855;
    int _875 = abs(_837);
    int _877 = abs(_871);
    int _879 = _791 * _863;
    int _881 = _879 + _873;
    float _883 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _885 = log2(_883);
    int _887 = abs(_823);
    float _889 = _692 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    int _891 = _881 * _875;
    int _893 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 128;
    bool _895 = _893 != 0;
    int _897 = _843 * _877;
    int _899 = _897 + _891;
    bool _901 = !_895;
    int _903 = _901 ? 0 : 1;
    int _905 = _867 * _887;
    int _907 = _905 + _682;
    bool _909 = !_809;
    int _911 = _909 ? 0 : 1;
    float _913 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    int _915 = abs(_903);
    float _917 = _690 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    int _919 = abs(_911);
    float _921 = -_845;
    float _923 = _921 + 1.0;
    float _925 = -_913;
    float _927 = fma(_917, 2.0, _925);
    bool _929 = _692 > 0.5;
    int _931 = _907 * _919;
    int _933 = _931 + _899;
    float _935 = _885 * _150;
    int _937 = _867 * _915;
    int _939 = _937 + _933;
    float _941 = _845;
    float _943 = _927;
    if (_743)
    {
        float _945 = _929 ? _923 : _845;
        _941 = _945;
    }
    float _947 = _941;
    float _949 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _951 = _949 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _953 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _955 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _957 = 1.0 / _951;
    float _959 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _961 = _959 + (*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _963 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _965 = 1.0 / _961;
    float _967 = _953 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _969 = _955 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _971 = float(uint(_939));
    float _973 = (*spvDescriptorSet0.vp_c9)._m0[131].x * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    float _975 = -(*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _977 = _975 + (*spvDescriptorSet0.vp_c9)._m0[118].w;
    float _979 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _981 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _979;
    float _983 = as_type<float>(_684) * _971;
    float _985 = _963 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _987 = 1.0 / _977;
    float _989 = -(*spvDescriptorSet0.vp_c9)._m0[116].x;
    float _991 = _989 + (*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _993 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _995 = _981 * _957;
    out.m_71.x = _967;
    out.m_71.y = _985;
    out.m_71.z = _969;
    out.m_71.w = _973;
    float _997 = _991 * _965;
    float _999 = trunc(_983);
    float _1001 = precise::max(_999, 0.0);
    uint _1003 = uint(_1001);
    float _1005 = fma(_889, -2.0, _993);
    float _1007 = in.m_69.x;
    float _1009 = _690 * 2.0;
    bool _1011 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _1013 = isnan(1.0);
    bool _1015 = _1011 || _1013;
    bool _1017 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _1019 = _1015 || _1017;
    float _1021 = -(*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _1023 = (*spvDescriptorSet0.vp_c9)._m0[118].x + _1021;
    float _1025 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _1027 = 1.0 + _1025;
    float _1029 = in.m_63.z;
    float _1031 = exp2(_935);
    float _1033 = _1023 * _987;
    float _1035 = _692 + _690;
    int _1037 = ~_658;
    int _1039 = _1037 + 1;
    float _1041 = _1035 + (-1.0);
    bool _1043 = _861 > 0.5;
    bool _1045 = _1043 && _737;
    float _1047 = floor(_1009);
    float _1049 = _692 * 2.0;
    float _1051 = fma(_1041, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    int _1053 = _1039 * int(_1003);
    int _1055 = _1053 + _939;
    bool _1057 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _1059 = isnan(0.0);
    bool _1061 = _1057 || _1059;
    bool _1063 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _1065 = _1061 || _1063;
    float _1067 = float(uint(_1055));
    float _1069 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    float _1071 = 1.0 / _1027;
    float _1073 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    float _1075 = -_1031;
    float _1077 = _1075 + 1.0;
    float _1079 = as_type<float>(_684) * _1067;
    float _1081 = fma(_692, (*spvDescriptorSet0.vp_c9)._m0[78].w, _1069);
    float _1083 = fma(_690, (*spvDescriptorSet0.vp_c9)._m0[78].z, _1073);
    bool _1085 = _1047 > 0.0;
    float _1087 = _692 + _1029;
    float _1089 = floor(_1049);
    float _1091 = _1065 ? _1077 : 0.0;
    float _1093 = fma(_150, (*spvDescriptorSet0.vp_c9)._m0[77].z, _1083);
    bool _1095 = _1047 >= 0.0;
    bool _1097 = isnan(_1047);
    bool _1099 = _1095 || _1097;
    bool _1101 = isnan(0.0);
    bool _1103 = _1099 || _1101;
    float _1105 = -_150;
    float _1107 = fma(_1105, (*spvDescriptorSet0.vp_c9)._m0[76].x, _927);
    float _1109 = _1047;
    if (_737)
    {
        _1109 = _1007;
    }
    float _1111 = _1109;
    float _1113 = fma(_150, (*spvDescriptorSet0.vp_c9)._m0[77].w, _1081);
    float _1115 = fma(_150, (*spvDescriptorSet0.vp_c9)._m0[76].y, _1005);
    float _1117 = trunc(_1079);
    float _1119 = precise::max(_1117, 0.0);
    uint _1121 = uint(_1119);
    float _1123 = _1111;
    if (_1019)
    {
        float _1125 = _1091 * _1071;
        _154 = _1125;
    }
    float _1127 = _154;
    if (_1045)
    {
        float _1129 = -_1111;
        float _1131 = _1129 + 1.0;
        _1123 = _1131;
    }
    float _1133 = _1123;
    float _1135 = _1029 * 2.0;
    if (!_737)
    {
        _943 = _1007;
    }
    float _1137 = _943;
    float _1139 = _1087 + (-1.0);
    bool _1141 = _1089 > 0.0;
    float _1143 = floor(_1135);
    bool _1145 = _1089 >= 0.0;
    bool _1147 = isnan(_1089);
    bool _1149 = _1145 || _1147;
    bool _1151 = isnan(0.0);
    bool _1153 = _1149 || _1151;
    float _1155 = fma(_947, (*spvDescriptorSet0.vp_c9)._m0[80].y, -0.5);
    int _1157 = _1103 ? 0 : 1;
    float _1159 = _1137;
    if (_737)
    {
        _1159 = _1133;
    }
    float _1161 = _1159;
    float _1163 = -_1115;
    float _1165 = fma(_1113, _1155, _1163);
    int _1167 = int(_1003) + int(_1121);
    float _1169 = in.m_61.w;
    int _1171 = _1153 ? 0 : 1;
    float _1173 = fma(_1161, (*spvDescriptorSet0.vp_c9)._m0[80].x, -0.5);
    int _1175 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _1177 = _1175 != 0;
    int _1179 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _1181 = _1179 != 0;
    int _1183 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _1185 = _1183 != 0;
    int _1187 = _674 * _1167;
    int _1189 = _1187 + _939;
    int _1191 = ~_1171;
    int _1193 = _1191 + 1;
    int _1195 = _1193 + 1;
    float _1197 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _1199 = _646 + _1197;
    int _1201 = _1195;
    if (!_1141)
    {
        int _1203 = ~_1171;
        int _1205 = _1203 + 1;
        _1201 = _1205;
    }
    int _1207 = _1201;
    bool _1209 = uint(_1189) >= uint(_658);
    float _1211 = fma(_995, _1199, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _1213 = -(*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _1215 = _646 + _1213;
    float _1217 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _1219 = _646 + _1217;
    bool _1221 = !_1209;
    int _1223 = _1221 ? 0 : (-1);
    float _1225 = fma(_1033, _1215, (*spvDescriptorSet0.vp_c9)._m0[117].x);
    int _1227 = ~_1157;
    int _1229 = _1227 + 1;
    int _1231 = _1229 + 1;
    float _1233 = fma(_1139, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    int _1235 = ~_1167;
    int _1237 = _1235 + _1223;
    int _1239 = _1237 + 1;
    float _1241 = in.m_57.w;
    int _1243 = _1231;
    if (!_1085)
    {
        int _1245 = ~_1157;
        int _1247 = _1245 + 1;
        _1243 = _1247;
    }
    int _1249 = _1243;
    float _1251 = fma(_997, _1219, (*spvDescriptorSet0.vp_c9)._m0[116].x);
    bool _1253 = _646 >= (*spvDescriptorSet0.vp_c9)._m0[118].w;
    bool _1255 = isnan(_646);
    bool _1257 = _1253 || _1255;
    bool _1259 = isnan((*spvDescriptorSet0.vp_c9)._m0[118].w);
    bool _1261 = _1257 || _1259;
    float _1263 = float(_1261);
    int _1265 = _658 * _1239;
    int _1267 = _1265 + _939;
    bool _1269 = _1143 > 0.0;
    bool _1271 = _1143 >= 0.0;
    bool _1273 = isnan(_1143);
    bool _1275 = _1271 || _1273;
    bool _1277 = isnan(0.0);
    bool _1279 = _1275 || _1277;
    float _1281 = -_1263;
    float _1283 = _1281 + 1.0;
    bool _1285 = _646 >= (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _1287 = isnan(_646);
    bool _1289 = _1285 || _1287;
    bool _1291 = isnan((*spvDescriptorSet0.vp_c9)._m0[117].w);
    bool _1293 = _1289 || _1291;
    float _1295 = float(_1293);
    float _1297 = float(uint(_907));
    bool _1299 = !_829;
    int _1301 = _1299 ? _1267 : (-1);
    float _1303 = _1295 * _1283;
    float _1305 = -_1295;
    float _1307 = _1305 + 1.0;
    float _1309 = as_type<float>(_684) * _1297;
    int _1311 = _1301 >> 31;
    bool _1313 = _646 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _1315 = isnan(_646);
    bool _1317 = _1313 || _1315;
    bool _1319 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _1321 = _1317 || _1319;
    float _1323 = float(_1321);
    int _1325 = _1311 & 3;
    float _1327 = trunc(_1309);
    float _1329 = precise::max(_1327, 0.0);
    uint _1331 = uint(_1329);
    bool _1333 = _646 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _1335 = isnan(_646);
    bool _1337 = _1333 || _1335;
    bool _1339 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _1341 = _1337 || _1339;
    float _1343 = float(_1341);
    float _1345 = -_1323;
    float _1347 = _1345 + 1.0;
    float _1349 = _1323 * _1307;
    int _1351 = _1301 + _1325;
    float _1353 = _819 + _652;
    float _1355 = _1343 * _1347;
    float _1357 = -_1343;
    float _1359 = _1357 + 1.0;
    int _1361 = _1351 >> 2;
    float _1363 = _781 + _1241;
    float _1365 = _1211 * _1355;
    int _1367 = ~_658;
    int _1369 = _1367 + 1;
    float _1371 = _797 + _1169;
    int _1373 = _1361 << 4;
    int _1375 = _1373 + 368;
    float _1377 = fma(_1359, (*spvDescriptorSet0.vp_c9)._m0[115].x, _1365);
    int _1379 = _1279 ? 0 : 1;
    int _1381 = _1369 * int(_1331);
    int _1383 = _1381 + _907;
    uint _1385 = uint(int(uint(_1375) >> uint(2)));
    uint _1387 = uint(int(uint(int(_1385)) >> uint(2)));
    int _1389 = int(_1385) & 3;
    float _1391 = (*spvDescriptorSet0.vp_c9)._m0[int(_1387)][_1389];
    int _1393 = int(_1385) + 1;
    uint _1395 = uint(int(uint(_1393) >> uint(2)));
    int _1397 = _1393 & 3;
    float _1399 = (*spvDescriptorSet0.vp_c9)._m0[int(_1395)][_1397];
    int _1401 = _1301 & 3;
    bool _1403 = _1401 != 0;
    float _1405 = fma(_1251, _1349, _1377);
    int _1407 = ~_1379;
    int _1409 = _1407 + 1;
    int _1411 = _1409 + 1;
    float _1413 = fma(_1093, _1173, _1107);
    float _1415 = float(uint(_1383));
    float _1417 = fma(_1225, _1303, _1405);
    int _1419 = _1411;
    if (!_1269)
    {
        int _1421 = ~_1379;
        int _1423 = _1421 + 1;
        _1419 = _1423;
    }
    int _1425 = _1419;
    int _1427 = _1301 & 3;
    bool _1429 = _1427 != 0;
    float _1431 = as_type<float>(_684) * _1415;
    bool _1433 = !_1181;
    int _1435 = _1433 ? 0 : 1;
    float _1437 = fma(_1263, (*spvDescriptorSet0.vp_c9)._m0[118].x, _1417);
    bool _1439 = uint(_1427) > 1u;
    float _1441 = trunc(_1431);
    float _1443 = precise::max(_1441, 0.0);
    uint _1445 = uint(_1443);
    bool _1447 = !_1177;
    int _1449 = _1447 ? 0 : 1;
    int _1451 = abs(_1435);
    int _1453 = abs(_1449);
    float _1455 = float(_1249);
    int _1457 = _1375 + 8;
    uint _1459 = uint(int(uint(_1457) >> uint(2)));
    uint _1461 = uint(int(uint(int(_1459)) >> uint(2)));
    int _1463 = int(_1459) & 3;
    float _1465 = (*spvDescriptorSet0.vp_c9)._m0[int(_1461)][_1463];
    int _1467 = int(_1459) + 1;
    uint _1469 = uint(int(uint(_1467) >> uint(2)));
    int _1471 = _1467 & 3;
    float _1473 = (*spvDescriptorSet0.vp_c9)._m0[int(_1469)][_1471];
    float _1475 = float(_1451);
    int _1477 = _1403 ? 0 : 1;
    float _1479 = float(_1453);
    float _1481 = _1475 * _1455;
    float _1483 = float(_1425);
    int _1485 = ~_1477;
    int _1487 = _1485 + 1;
    int _1489 = _1487 + 1;
    int _1491 = _1489;
    if (!_1439)
    {
        int _1493 = ~_1477;
        int _1495 = _1493 + 1;
        _1491 = _1495;
    }
    int _1497 = _1491;
    float _1499 = _1413 + 0.5;
    int _1501 = ~_658;
    int _1503 = _1501 + 1;
    int _1505 = int(_1331) + int(_1445);
    float _1507 = _1479 * _1483;
    bool _1509 = !_1429;
    int _1511 = _1509 ? 0 : 1;
    float _1513 = _1165 + 0.5;
    int _1515 = abs(_1497);
    int _1517 = _1503 * _1505;
    int _1519 = _1517 + _907;
    int _1521 = abs(_1511);
    float _1523 = _1507 * (-2.0);
    out.m_73.x = _1499;
    out.m_73.y = _1513;
    int _1525 = ~_1521;
    int _1527 = _1525 + 1;
    int _1529 = _1527 + 1;
    int _1531 = ~_1515;
    int _1533 = _1531 + 1;
    int _1535 = _1533 + 1;
    bool _1537 = _1427 != 3;
    bool _1539 = uint(_1427) >= 2u;
    int _1541 = _1535 * as_type<int>(_1399);
    bool _1543 = uint(_1519) >= uint(_658);
    float _1545 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1547 = _1353 + _1545;
    int _1549 = _1539 ? 0 : 1;
    int _1551 = _1529 * as_type<int>(_1391);
    int _1553 = _1551 + _1541;
    int _1555 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2097152;
    bool _1557 = _1555 != 0;
    float _1559 = in.m_75.x;
    float _1561 = in.m_75.y;
    float _1563 = in.m_75.z;
    bool _1565 = _1427 != 3;
    int _1567 = ~_1549;
    int _1569 = _1567 + 1;
    int _1571 = _1569 + 1;
    bool _1573 = !_1543;
    int _1575 = _1573 ? 0 : (-1);
    int _1577 = _1571;
    if (_1537)
    {
        int _1579 = ~_1549;
        int _1581 = _1579 + 1;
        _1577 = _1581;
    }
    int _1583 = _1577;
    bool _1585 = !_1557;
    int _1587 = _1585 ? 0 : 1;
    bool _1589 = !_1565;
    int _1591 = _1589 ? 0 : (-1);
    int _1593 = ~_1505;
    int _1595 = _1593 + _1575;
    int _1597 = _1595 + 1;
    int _1599 = abs(_1587);
    float _1601 = _1547 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    int _1603 = abs(_1591);
    float _1605 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1607 = _1363 + _1605;
    int _1609 = abs(_1583);
    int _1611 = _658 * _1597;
    int _1613 = _1611 + _907;
    float _1615 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1617 = _1371 + _1615;
    float _1619 = fma(_1607, (*spvDescriptorSet0.vp_c8)._m0[28].x, _1601);
    float _1621 = _1481 * (-2.0);
    int _1623 = ~_1609;
    int _1625 = _1623 + 1;
    int _1627 = _1625 + 1;
    float _1629 = _690 + (-0.5);
    float _1631 = fma(_1617, (*spvDescriptorSet0.vp_c8)._m0[28].z, _1619);
    float _1633 = fma(_1233, _1621, _1233);
    float _1635 = fma(_1621, _1561, _1561);
    float _1637 = _1547 * _1547;
    int _1639 = ~_1603;
    int _1641 = _1639 + 1;
    int _1643 = _1641 + 1;
    int _1645 = _1627 * as_type<int>(_1465);
    int _1647 = _1645 + _1553;
    bool _1649 = _1631 >= 0.0;
    float _1651 = fma(_1607, _1607, _1637);
    int _1653 = ~_1599;
    int _1655 = _1653 + 1;
    int _1657 = _1655 + 1;
    int _1659 = _1643 * as_type<int>(_1473);
    int _1661 = _1659 + _1647;
    float _1663 = fma(_1051, _1523, _1051);
    float _1665 = fma(_1617, _1617, _1651);
    float _1667 = _614 * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    int _1669 = _1661 * _1657;
    bool _1671 = !_829;
    int _1673 = _1671 ? _1613 : (-1);
    float _1675 = fma(_1523, _1559, _1559);
    float _1677 = _616 * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _1679 = rsqrt(_1665);
    float _1681 = _1667 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    int _1683 = _1673 * _1599;
    int _1685 = _1683 + _1669;
    float _1687 = as_type<float>(_1643);
    if (_1649)
    {
        _1687 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _1689 = _1687;
    float _1691 = _612 * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _1693 = _1677 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1695 = _1437 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _1697 = _1691 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    int _1699 = as_type<int>(_1689);
    if (_1649)
    {
        float _1701 = _1689 * 5.0;
        _1699 = as_type<int>(_1701);
    }
    int _1703 = _1699;
    float _1705 = float(_1685);
    float _1707 = fma(_1629, (*spvDescriptorSet0.vp_c9)._m0[196].x, _1675);
    bool _1709 = !_1185;
    int _1711 = _1709 ? 0 : 1;
    out.m_77.x = _1697;
    out.m_77.y = _1681;
    out.m_77.z = _1693;
    out.m_77.w = _1695;
    float _1713 = _692 + (-0.5);
    float _1715 = float(_1207);
    float _1717 = fma(_1663, _1127, _1707);
    if (_1649)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _5819 = as_type<float>(_1703);
        out.gl_Position.z = _5819;
    }
    int _1719 = abs(_1711);
    float _1721 = _1547 * _1679;
    float _1723 = _1607 * _1679;
    out.m_79.x = _1705;
    float _1725 = _1721;
    if (_1649)
    {
        out.m_51.x = 0.0;
    }
    if (_1649)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_77.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_77.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_77.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_77.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_71.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_71.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_71.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_71.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_51.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_51.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_51.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_51.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_97.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_97.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_97.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_97.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_67.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_67.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_67.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_67.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_73.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_73.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_73.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_73.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_89.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_89.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_89.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_89.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_79.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_79.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_79.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_79.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_85.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_85.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_85.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_85.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_95.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_95.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_95.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_95.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_91.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_91.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_91.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_91.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_93.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_93.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_93.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_93.w)); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _1727 = -_1721;
    float _1729 = fma(_1727, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1353);
    float _1731 = _1617 * _1679;
    float _1733 = -_1723;
    float _1735 = fma(_1733, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1363);
    float _1737 = float(_1719);
    float _1739 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1741 = _1729 + _1739;
    float _1743 = -_1731;
    float _1745 = fma(_1743, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1371);
    float _1747 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1749 = _1735 + _1747;
    float _1751 = _1029 + _690;
    float _1753 = _1741 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _1755 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1757 = _1745 + _1755;
    float _1759 = _1737 * _1715;
    float _1761 = fma(_1713, (*spvDescriptorSet0.vp_c9)._m0[196].y, _1635);
    float _1763 = fma(_1749, (*spvDescriptorSet0.vp_c8)._m0[28].x, _1753);
    float _1765 = _1751 + (-1.0);
    float _1767 = _1759 * (-2.0);
    float _1769 = fma(_1757, (*spvDescriptorSet0.vp_c8)._m0[28].z, _1763);
    float _1771 = -_1721;
    float _1773 = fma(_1771, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1547);
    float _1775 = fma(_1765, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _1777 = fma(_1767, _1563, _1563);
    float _1779 = _1029 + (-0.5);
    bool _1781 = _1769 >= 0.0;
    float _1783 = -_1723;
    float _1785 = fma(_1783, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1607);
    float _1787 = _1773 * _1773;
    float _1789 = fma(_1775, _1767, _1775);
    float _1791 = fma(_1779, (*spvDescriptorSet0.vp_c9)._m0[196].z, _1777);
    float _1793 = fma(_1633, _1127, _1761);
    float _1795 = fma(_1785, _1785, _1787);
    float _1797 = -_1731;
    float _1799 = fma(_1797, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1617);
    float _1801 = fma(_1789, _1127, _1791);
    float _1803 = _1717 * 0.15915493667125701904296875;
    float _1805 = _1793 * 0.15915493667125701904296875;
    float _1807 = fma(_1799, _1799, _1795);
    float _1809 = _1801 * 0.15915493667125701904296875;
    float _1811 = _1777;
    float _1813 = _1741;
    float _1815 = _1735;
    if (_1781)
    {
        _1811 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _1817 = _1811;
    float _1819 = _1803 * 6.283185482025146484375;
    float _1821 = sin(_1819);
    int _1823 = as_type<int>(_1817);
    if (_1781)
    {
        out.m_51.x = 0.0;
    }
    if (_1781)
    {
        float _1825 = _1817 * 5.0;
        _1823 = as_type<int>(_1825);
    }
    int _1827 = _1823;
    float _1829 = _1803 * 6.283185482025146484375;
    float _1831 = cos(_1829);
    if (_1781)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _6021 = as_type<float>(_1827);
        out.gl_Position.z = _6021;
    }
    float _1833 = _1805 * 6.283185482025146484375;
    float _1835 = sin(_1833);
    float _1837 = _1805 * 6.283185482025146484375;
    float _1839 = cos(_1837);
    float _1841 = sqrt(_1807);
    if (_1781)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_77.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_77.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_77.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_77.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_71.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_71.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_71.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_71.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_51.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_51.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_51.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_51.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_97.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_97.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_97.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_97.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_67.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_67.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_67.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_67.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_73.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_73.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_73.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_73.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_89.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_89.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_89.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_89.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_79.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_79.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_79.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_79.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_85.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_85.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_85.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_85.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_95.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_95.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_95.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_95.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_91.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_91.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_91.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_91.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_93.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_93.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_93.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_93.w)); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _1843 = in.m_81.x;
    float _1845 = in.m_81.y;
    float _1847 = in.m_81.z;
    float _1849 = _1809 * 6.283185482025146484375;
    float _1851 = cos(_1849);
    float _1853 = _1679 * _1841;
    float _1855 = _552 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _1857 = _604 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _1859 = _1821 * _1835;
    float _1861 = _1821 * _1839;
    float _1863 = _1831 * _1839;
    float _1865 = _1831 * _1835;
    float _1867 = _1809 * 6.283185482025146484375;
    float _1869 = sin(_1867);
    float _1871 = _554 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _1873 = _1853 * _1857;
    float _1875 = _1821 * _1851;
    float _1877 = _1853 * _1855;
    float _1879 = _1831 * _1851;
    float _1881 = _1839 * _1851;
    float _1883 = _1835 * _1851;
    float _1885 = _1879 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _1887 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _1845);
    float _1889 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _1843);
    float _1891 = _1879 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _1893 = _1879 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _1895 = _1887 * _1877;
    float _1897 = _1853 * _1871;
    float _1899 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _1847);
    float _1901 = _1889 * _1873;
    float _1903 = fma(_1869, _1863, _1859);
    float _1905 = _1879 * _1895;
    float _1907 = _1899 * _1897;
    float _1909 = -_1861;
    float _1911 = fma(_1869, _1865, _1909);
    float _1913 = -_1895;
    float _1915 = _1869 * _1913;
    float _1917 = fma(_1903, _1901, _1905);
    float _1919 = -_1865;
    float _1921 = fma(_1869, _1861, _1919);
    float _1923 = _1875 * _1895;
    float _1925 = fma(_1881, _1901, _1915);
    float _1927 = fma(_1911, _1907, _1917);
    float _1929 = fma(_1869, _1859, _1863);
    float _1931 = fma(_1921, _1901, _1923);
    float _1933 = fma(_1883, _1907, _1925);
    float _1935 = _1927 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _1937 = _1927 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _1939 = fma(_1929, _1907, _1931);
    float _1941 = _1903 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _1943 = fma(_1933, (*spvDescriptorSet0.vp_c8)._m0[24].x, _1935);
    float _1945 = fma(_1933, (*spvDescriptorSet0.vp_c8)._m0[26].x, _1937);
    float _1947 = _1903 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _1949 = _1903 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _1951 = fma(_1939, (*spvDescriptorSet0.vp_c8)._m0[24].z, _1943);
    float _1953 = fma(_1939, (*spvDescriptorSet0.vp_c8)._m0[26].z, _1945);
    float _1955 = fma(_1881, (*spvDescriptorSet0.vp_c8)._m0[24].x, _1941);
    float _1957 = fma(_1881, (*spvDescriptorSet0.vp_c8)._m0[25].x, _1947);
    float _1959 = _1951 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _1961 = _1953 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _1963 = fma(_1881, (*spvDescriptorSet0.vp_c8)._m0[26].x, _1949);
    float _1965 = -_1869;
    float _1967 = fma(_1965, (*spvDescriptorSet0.vp_c8)._m0[24].x, _1885);
    float _1969 = _1363 + _1959;
    float _1971 = _1371 + _1961;
    float _1973 = in.m_83.x;
    float _1975 = in.m_83.y;
    float _1977 = in.m_83.z;
    float _1979 = -_1869;
    float _1981 = fma(_1979, (*spvDescriptorSet0.vp_c8)._m0[25].x, _1891);
    float _1983 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1985 = _1969 + _1983;
    float _1987 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1989 = _1971 + _1987;
    bool _1991 = _1845 != 0.0;
    bool _1993 = isnan(_1845);
    bool _1995 = _1991 || _1993;
    bool _1997 = isnan(0.0);
    bool _1999 = _1995 || _1997;
    float _2001 = -_1869;
    float _2003 = fma(_2001, (*spvDescriptorSet0.vp_c8)._m0[26].x, _1893);
    float _2005 = _1985 * _1985;
    float _2007 = _1989 * _1989;
    float _2009 = _1927 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    bool _2011 = _1843 == 0.0;
    bool _2013 = !_1999;
    bool _2015 = _2011 && _2013;
    float _2017 = _1911 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _2019 = _2005 + _2007;
    float _2021 = fma(_1933, (*spvDescriptorSet0.vp_c8)._m0[25].x, _2009);
    bool _2023 = _1847 == 0.0;
    bool _2025 = _2023 && _2015;
    float _2027 = fma(_1921, (*spvDescriptorSet0.vp_c8)._m0[24].z, _1955);
    float _2029 = sqrt(_2019);
    float _2031 = fma(_1939, (*spvDescriptorSet0.vp_c8)._m0[25].z, _2021);
    float _2033 = _1911 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _2035 = _1911 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _2037 = fma(_1883, (*spvDescriptorSet0.vp_c8)._m0[24].x, _2017);
    float _2039 = _2031 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _2041 = fma(_1883, (*spvDescriptorSet0.vp_c8)._m0[25].x, _2033);
    float _2043 = fma(_1883, (*spvDescriptorSet0.vp_c8)._m0[26].x, _2035);
    float _2045 = fma(_1921, (*spvDescriptorSet0.vp_c8)._m0[25].z, _1957);
    float _2047 = _1353 + _2039;
    float _2049 = fma(_1921, (*spvDescriptorSet0.vp_c8)._m0[26].z, _1963);
    float _2051 = _1973;
    float _2053 = _1975;
    float _2055 = _1977;
    float _2057 = _1843;
    float _2059 = _2005;
    float _2061 = _2007;
    float _2063 = _1969;
    float _2065 = _1971;
    float _2067 = _1847;
    if (!_2025)
    {
        float _2069 = fma(_1843, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1973);
        _2051 = _2069;
    }
    float _2071 = _2051;
    if (!_2025)
    {
        float _2073 = fma(_1845, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1975);
        _2053 = _2073;
    }
    float _2075 = _2053;
    if (!_2025)
    {
        float _2077 = fma(_1847, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1977);
        _2055 = _2077;
    }
    float _2079 = _2055;
    bool _2081 = _2029 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    if (!_2081)
    {
        _2057 = _2047;
    }
    float _2083 = _2057;
    bool _2085 = !_2081;
    float _2087 = _2083;
    if (!_2085)
    {
        float _2089 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _2091 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _2093 = _2029 + _2091;
        float _2095 = _2047 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _2097 = rsqrt(_2019);
        float _2099 = _2093 * _2089;
        float _2101 = _2099 * 0.15915493667125701904296875;
        float _2103 = _2101 * 6.283185482025146484375;
        float _2105 = sin(_2103);
        float _2107 = _2101 * 6.283185482025146484375;
        float _2109 = cos(_2107);
        float _2111 = fma(_2105, _2095, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _2113 = _2097 * _2111;
        float _2115 = _2109 + (-1.0);
        float _2117 = fma(_1985, _2113, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _2119 = fma(_1989, _2113, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        float _2121 = _2115 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _2123 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
        float _2125 = _2117 + _2123;
        float _2127 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
        float _2129 = _2119 + _2127;
        float _2131 = fma(_2047, _2109, _2121);
        float _2133 = _2125 * _2125;
        float _2135 = _2129 * _2129;
        _2087 = _2131;
        _2059 = _2133;
        _2061 = _2135;
        _2063 = _2117;
        _2065 = _2119;
        _2067 = _2113;
    }
    float _2137 = _2087;
    float _2139 = _2059;
    float _2141 = _2061;
    float _2143 = _2063;
    float _2145 = _2065;
    float _2147 = _2067;
    float _2149 = -(*spvDescriptorSet0.vp_c15)._m0[0].y;
    float _2151 = _2137 + _2149;
    float _2153 = fma(_1875, (*spvDescriptorSet0.vp_c8)._m0[24].z, _1967);
    float _2155 = fma(_1875, (*spvDescriptorSet0.vp_c8)._m0[25].z, _1981);
    float _2157 = fma(_1875, (*spvDescriptorSet0.vp_c8)._m0[26].z, _2003);
    float _2159 = fma(_2151, _2151, _2139);
    float _2161 = _2153 * _2075;
    float _2163 = _2155 * _2075;
    float _2165 = _2157 * _2075;
    float _2167 = _2159 + _2141;
    float _2169 = fma(_1929, (*spvDescriptorSet0.vp_c8)._m0[24].z, _2037);
    float _2171 = fma(_1929, (*spvDescriptorSet0.vp_c8)._m0[25].z, _2041);
    float _2173 = fma(_2027, _2071, _2161);
    float _2175 = fma(_2045, _2071, _2163);
    float _2177 = fma(_1929, (*spvDescriptorSet0.vp_c8)._m0[26].z, _2043);
    float _2179 = sqrt(_2167);
    float _2181 = fma(_2049, _2071, _2165);
    float _2183 = fma(_2169, _2079, _2173);
    float _2185 = fma(_2171, _2079, _2175);
    float _2187 = fma(_2177, _2079, _2181);
    out.m_85.x = _2183;
    out.m_85.y = _2185;
    out.m_85.z = _2187;
    bool _2189 = _2179 >= (*spvDescriptorSet0.vp_c16)._m0[1].x;
    bool _2191 = isnan(_2179);
    bool _2193 = _2189 || _2191;
    bool _2195 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].x);
    bool _2197 = _2193 || _2195;
    float _2199 = _2147;
    if (!_2197)
    {
        _2199 = 1.0;
    }
    float _2201 = _2199;
    bool _2203 = !_2197;
    float _2205 = _2201;
    if (!_2203)
    {
        bool _2207 = _2179 >= (*spvDescriptorSet0.vp_c16)._m0[1].y;
        bool _2209 = isnan(_2179);
        bool _2211 = _2207 || _2209;
        bool _2213 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].y);
        bool _2215 = _2211 || _2213;
        if (!_2215)
        {
            float _2217 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _2219 = _2179 + _2217;
            float _2221 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _2223 = (*spvDescriptorSet0.vp_c16)._m0[1].y + _2221;
            float _2225 = -(*spvDescriptorSet0.vp_c16)._m0[2].x;
            float _2227 = _2225 + (*spvDescriptorSet0.vp_c16)._m0[2].y;
            float _2229 = 1.0 / _2223;
            float _2231 = _2219 * _2229;
            float _2233 = fma(_2231, _2227, (*spvDescriptorSet0.vp_c16)._m0[2].x);
            _2205 = _2233;
            _2235 = true;
        }
        else
        {
            bool _2237 = _2179 >= (*spvDescriptorSet0.vp_c16)._m0[1].z;
            bool _2239 = isnan(_2179);
            bool _2241 = _2237 || _2239;
            bool _2243 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].z);
            bool _2245 = _2241 || _2243;
            if (!_2245)
            {
                float _2247 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _2249 = _2179 + _2247;
                float _2251 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _2253 = _2251 + (*spvDescriptorSet0.vp_c16)._m0[1].z;
                float _2255 = -(*spvDescriptorSet0.vp_c16)._m0[2].y;
                float _2257 = _2255 + (*spvDescriptorSet0.vp_c16)._m0[2].z;
                float _2259 = 1.0 / _2253;
                float _2261 = _2249 * _2259;
                float _2263 = fma(_2261, _2257, (*spvDescriptorSet0.vp_c16)._m0[2].y);
                _2205 = _2263;
                _2235 = true;
            }
            else
            {
                _2205 = (*spvDescriptorSet0.vp_c16)._m0[2].z;
            }
        }
    }
    _2235 = false;
    float _2265 = _2205;
    float _2267 = -(*spvDescriptorSet0.vp_c16)._m0[0].y;
    float _2269 = _2137 + _2267;
    float _2271 = _1729 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _2273 = -(*spvDescriptorSet0.vp_c16)._m0[0].x;
    float _2275 = _2143 + _2273;
    float _2277 = -(*spvDescriptorSet0.vp_c16)._m0[0].z;
    float _2279 = _2145 + _2277;
    float _2281 = fma(_2269, _2265, (*spvDescriptorSet0.vp_c16)._m0[0].y);
    float _2283 = fma(_1735, (*spvDescriptorSet0.vp_c8)._m0[11].x, _2271);
    float _2285 = fma(_2275, _2265, (*spvDescriptorSet0.vp_c16)._m0[0].x);
    float _2287 = fma(_2279, _2265, (*spvDescriptorSet0.vp_c16)._m0[0].z);
    float _2289 = -_1353;
    float _2291 = _2289 + _2281;
    float _2293 = fma(_1745, (*spvDescriptorSet0.vp_c8)._m0[11].z, _2283);
    float _2295 = -_1363;
    float _2297 = _2295 + _2285;
    float _2299 = _1729 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _2301 = _2291 * _2291;
    float _2303 = _2293 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _2305 = -_1371;
    float _2307 = _2305 + _2287;
    float _2309 = fma(_1735, (*spvDescriptorSet0.vp_c8)._m0[10].x, _2299);
    float _2311 = fma(_2297, _2297, _2301);
    float _2313 = 1.0 / _2303;
    float _2315 = fma(_1745, (*spvDescriptorSet0.vp_c8)._m0[10].z, _2309);
    float _2317 = fma(_2307, _2307, _2311);
    float _2319 = _2315 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _2321 = sqrt(_2317);
    float _2323 = _2319 + _2303;
    float _2325 = _2323 * _2313;
    float _2327 = _2325 * 0.5;
    float _2329 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _2331 = fma(_2327, (*spvDescriptorSet0.vp_c8)._m0[30].w, _2329);
    bool _2333 = _2321 > 0.0;
    float _2335 = 1.0 / _2331;
    bool _2337 = (*spvDescriptorSet0.vp_c15)._m0[653].w >= 0.5;
    bool _2339 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _2341 = _2337 || _2339;
    bool _2343 = isnan(0.5);
    bool _2345 = _2341 || _2343;
    bool _2347 = (*spvDescriptorSet0.vp_c15)._m0[660].y >= 0.5;
    bool _2349 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _2351 = _2347 || _2349;
    bool _2353 = isnan(0.5);
    bool _2355 = _2351 || _2353;
    bool _2357 = !_2333;
    float _2359 = _2281;
    float _2361 = _2285;
    float _2363 = _2287;
    if (!_2357)
    {
        float _2365 = _212 * _212;
        float _2367 = rsqrt(_2317);
        float _2369 = fma(_208, _208, _2365);
        float _2371 = fma(_214, _214, _2369);
        float _2373 = sqrt(_2371);
        float _2375 = _2297 * _2367;
        float _2377 = _2291 * _2367;
        float _2379 = _2307 * _2367;
        bool _2381 = _2373 > 0.0;
        bool _2383 = !_2381;
        if (!_2383)
        {
            float _2385 = rsqrt(_2371);
            float _2387 = 1.0 / (*spvDescriptorSet0.vp_c10)._m0[2].z;
            float _2389 = _212 * _2385;
            float _2391 = _208 * _2385;
            float _2393 = _2377 * _2389;
            float _2395 = _214 * _2385;
            float _2397 = fma(_2375, _2391, _2393);
            float _2399 = _2387 * (*spvDescriptorSet0.vp_c9)._m0[142].x;
            float _2401 = fma(_2379, _2395, _2397);
            float _2403 = _2401 * _2399;
            float _2405 = fma(_208, _2403, _2285);
            float _2407 = fma(_212, _2403, _2281);
            float _2409 = fma(_214, _2403, _2287);
            _2359 = _2407;
            _2361 = _2405;
            _2363 = _2409;
        }
    }
    float _2411 = _2359;
    float _2413 = _2361;
    float _2415 = _2363;
    float _2417 = -_1721;
    float _2419 = fma(_2417, (*spvDescriptorSet0.vp_c9)._m0[18].w, _2411);
    float _2421 = -_1723;
    float _2423 = fma(_2421, (*spvDescriptorSet0.vp_c9)._m0[18].w, _2413);
    float _2425 = -_1731;
    float _2427 = fma(_2425, (*spvDescriptorSet0.vp_c9)._m0[18].w, _2415);
    float _2429 = _2419;
    float _2431 = _2423;
    float _2433 = _2427;
    if (_2345)
    {
        _1725 = 1.0;
    }
    float _2435 = _1725;
    float _2437 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _2439 = _2335 * _2437;
    float _2441 = _2435;
    if (!_2355)
    {
        float _2443 = _1741 * _1741;
        float _2445 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _2447 = -_1371;
        float _2449 = _2447 + _2415;
        float _2451 = -_1363;
        float _2453 = _2451 + _2413;
        float _2455 = fma(_1749, _1749, _2443);
        float _2457 = fma(_1757, _1757, _2455);
        float _2459 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _2461 = sqrt(_2457);
        float _2463 = 1.0 / _1853;
        float _2465 = _2459 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _2467 = precise::min(_2461, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _2469 = _2467 * _2445;
        float _2471 = -_1353;
        float _2473 = _2471 + _2411;
        float _2475 = _2469 * _2463;
        float _2477 = _2465 * _2475;
        float _2479 = _2449 * _2475;
        float _2481 = fma(_2473, _2477, _1729);
        float _2483 = fma(_2453, _2477, _1735);
        float _2485 = fma(_2465, _2479, _1745);
        _2429 = _2481;
        _2431 = _2483;
        _2433 = _2485;
        _1813 = _2465;
    }
    float _2487 = _2429;
    float _2489 = _2431;
    float _2491 = _2433;
    float _2493 = _1813;
    float _2495 = _2493;
    if (!_2345)
    {
        float _2497 = (*spvDescriptorSet0.vp_c8)._m0[31].x * 0.5;
        float _2499 = _2497 * 0.15915493667125701904296875;
        float _2501 = _2499 * 6.283185482025146484375;
        float _2503 = cos(_2501);
        float _2505 = (*spvDescriptorSet0.vp_c8)._m0[31].y * 0.5;
        float _2507 = _2505 * 0.15915493667125701904296875;
        float _2509 = _2499 * 6.283185482025146484375;
        float _2511 = sin(_2509);
        float _2513 = 1.0 / _2503;
        float _2515 = _2507 * 6.283185482025146484375;
        float _2517 = cos(_2515);
        float _2519 = _2511 * _2513;
        float _2521 = _2507 * 6.283185482025146484375;
        float _2523 = sin(_2521);
        float _2525 = _2517 * _2519;
        float _2527 = 1.0 / _2525;
        float _2529 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _2531 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _2529;
        float _2533 = 1.0 / _2531;
        float _2535 = _2523 * _2527;
        float _2537 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _2539 = fma(_2439, _2535, _2537);
        float _2541 = _2539 * _2533;
        float _2543 = precise::clamp(_2541, 0.0, 1.0);
        _2441 = _2543;
    }
    float _2545 = _2441;
    float _2547 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _2549 = _2487 + _2547;
    float _2551 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _2553 = _2489 + _2551;
    float _2555 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _2557 = _2491 + _2555;
    float _2559 = _2549 * _2549;
    float _2561 = fma(_2553, _2553, _2559);
    float _2563 = fma(_2557, _2557, _2561);
    float _2565 = rsqrt(_2563);
    float _2567 = sqrt(_2563);
    float _2569 = _2565 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _2571 = _2553 * _2569;
    float _2573 = _2557 * _2569;
    float _2575 = _2571 * _2571;
    float _2577 = _2573 * _2573;
    float _2579 = _2575 + _2577;
    float _2581 = sqrt(_2579);
    bool _2583 = _2581 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2585 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2587 = _2581 + _2585;
    float _2589 = _2565;
    float _2591 = _2587;
    float _2593 = _2549;
    float _2595 = (*spvDescriptorSet0.vp_c15)._m0[652].x;
    if (_2583)
    {
        float _2597 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2589 = _2597;
    }
    float _2599 = _2589;
    float _2601 = _2599;
    if (_2583)
    {
        float _2603 = _2587 * _2599;
        _2591 = _2603;
    }
    float _2605 = _2591;
    if (_2583)
    {
        float _2607 = rsqrt(_2579);
        _2601 = _2607;
    }
    float _2609 = _2601;
    float _2611 = _2609;
    if (_2583)
    {
        float _2613 = _2605 * 0.15915493667125701904296875;
        _2495 = _2613;
    }
    float _2615 = _2495;
    float _2617 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _2619 = _2557;
    float _2621 = _2615;
    if (_2583)
    {
        float _2623 = _2615 * 6.283185482025146484375;
        float _2625 = sin(_2623);
        _2619 = _2625;
    }
    float _2627 = _2619;
    float _2629 = precise::max(0.0, _2617);
    float _2631 = _1729;
    if (_2583)
    {
        float _2633 = _2615 * 6.283185482025146484375;
        float _2635 = cos(_2633);
        _2631 = _2635;
    }
    float _2637 = _2631;
    float _2639 = -_2569;
    float _2641 = -_2629;
    float _2643 = fma(_2549, _2639, _2641);
    float _2645 = fma(_1735, (*spvDescriptorSet0.vp_c15)._m0[652].x, (*spvDescriptorSet0.vp_c15)._m0[652].z);
    if (!_2583)
    {
        _1815 = _2571;
    }
    float _2647 = _1815;
    float _2649 = _2647;
    if (_2583)
    {
        float _2651 = _2643 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2593 = _2651;
    }
    float _2653 = _2593;
    float _2655 = _2627;
    float _2657 = _2653;
    if (_2583)
    {
        float _2659 = fma(_2627, _2653, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _2655 = _2659;
    }
    float _2661 = _2655;
    float _2663 = _2661;
    if (_2583)
    {
        float _2665 = _2609 * _2661;
        _2595 = _2665;
    }
    float _2667 = _2595;
    if (!_2583)
    {
        _2611 = _2643;
    }
    float _2669 = _2611;
    float _2671 = _2669;
    float _2673 = _2637;
    if (_2583)
    {
        float _2675 = _2637 + (-1.0);
        _2657 = _2675;
    }
    float _2677 = _2657;
    float _2679 = _2677;
    if (_2583)
    {
        float _2681 = _2571 * _2667;
        _2649 = _2681;
    }
    float _2683 = _2649;
    if (!_2583)
    {
        _2663 = _2575;
    }
    float _2685 = _2663;
    float _2687 = _2685;
    if (_2583)
    {
        float _2689 = _2677 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2621 = _2689;
    }
    float _2691 = _2621;
    if (!_2583)
    {
        _2679 = _2573;
    }
    float _2693 = _2679;
    float _2695 = _2693;
    if (_2583)
    {
        float _2697 = _2683 * _2683;
        _2687 = _2697;
    }
    float _2699 = _2687;
    if (_2583)
    {
        float _2701 = _2573 * _2667;
        _2695 = _2701;
    }
    float _2703 = _2695;
    if (_2583)
    {
        float _2705 = fma(_2643, _2637, _2691);
        _2671 = _2705;
    }
    float _2707 = _2671;
    if (!_2583)
    {
        _2673 = _2577;
    }
    float _2709 = _2673;
    float _2711 = floor(_2645);
    float _2713 = _2709;
    if (_2583)
    {
        float _2715 = _2703 * _2703;
        _2713 = _2715;
    }
    float _2717 = _2713;
    float _2719 = fma(_2707, _2707, _2699);
    float _2721 = _2487 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _2723 = _2719 + _2717;
    float _2725 = fma(_2489, (*spvDescriptorSet0.vp_c8)._m0[2].x, _2721);
    float _2727 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _2729 = fma(_2567, (*spvDescriptorSet0.vp_c15)._m0[23].w, _2727);
    float _2731 = precise::clamp(_2729, 0.0, 1.0);
    float _2733 = rsqrt(_2723);
    float _2735 = fma(_2491, (*spvDescriptorSet0.vp_c8)._m0[2].z, _2725);
    float _2737 = -_2731;
    float _2739 = _2737 + 1.0;
    float _2741 = fma(_1745, (*spvDescriptorSet0.vp_c15)._m0[652].y, (*spvDescriptorSet0.vp_c15)._m0[652].w);
    float _2743 = _2735 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _2745 = _2487 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _2747 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _2749 = abs(_2739);
    float _2751 = log2(_2749);
    float _2753 = _2743 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _2755 = _2487 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _2757 = fma(_2489, (*spvDescriptorSet0.vp_c8)._m0[3].x, _2745);
    float _2759 = -_2753;
    float _2761 = fma(_2759, _2747, 1.0);
    float _2763 = _2487 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _2765 = fma(_2489, (*spvDescriptorSet0.vp_c8)._m0[1].x, _2755);
    float _2767 = _2733 * _2683;
    float _2769 = _2733 * _2707;
    float _2771 = fma(_2489, (*spvDescriptorSet0.vp_c8)._m0[0].x, _2763);
    float _2773 = fma(_2491, (*spvDescriptorSet0.vp_c8)._m0[1].z, _2765);
    float _2775 = _2767 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _2777 = _2733 * _2703;
    float _2779 = fma(_2491, (*spvDescriptorSet0.vp_c8)._m0[0].z, _2771);
    float _2781 = _2773 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _2783 = -_2775;
    float _2785 = fma(_2769, (*spvDescriptorSet0.vp_c15)._m0[21].y, _2783);
    float _2787 = floor(_2741);
    float _2789 = _2779 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _2791 = _2781 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _2793 = -_2777;
    float _2795 = fma(_2793, (*spvDescriptorSet0.vp_c15)._m0[21].z, _2785);
    float _2797 = fma(_2491, (*spvDescriptorSet0.vp_c8)._m0[3].z, _2757);
    float _2799 = _2751 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _2801 = fma(_2789, (*spvDescriptorSet0.vp_c8)._m0[7].x, _2791);
    float _2803 = fma(_2795, -0.5, 0.5);
    float _2805 = _2797 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _2807 = exp2(_2799);
    float _2809 = fma(_2743, (*spvDescriptorSet0.vp_c8)._m0[7].z, _2801);
    float _2811 = -_2711;
    float _2813 = _2645 + _2811;
    float _2815 = fma(_2795, 0.5, 0.5);
    float _2817 = fma(_2805, (*spvDescriptorSet0.vp_c8)._m0[7].w, _2809);
    float _2819 = _2781 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _2821 = _2781 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _2823 = log2(_2761);
    float _2825 = fma(_2789, (*spvDescriptorSet0.vp_c8)._m0[5].x, _2821);
    float _2827 = fma(_2743, (*spvDescriptorSet0.vp_c8)._m0[5].z, _2825);
    float _2829 = 1.0 / _2817;
    float _2831 = -_2787;
    float _2833 = _2741 + _2831;
    float _2835 = fma(_2815, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _2837 = fma(_2789, (*spvDescriptorSet0.vp_c8)._m0[4].x, _2819);
    float _2839 = _2769 + 1.0;
    float _2841 = fma(_2815, _2835, -0.212114393711090087890625);
    float _2843 = fma(_2743, (*spvDescriptorSet0.vp_c8)._m0[4].z, _2837);
    float _2845 = sqrt(_2803);
    float _2847 = -_2769;
    float _2849 = fma(_2807, _2839, _2847);
    float _2851 = fma(_2805, (*spvDescriptorSet0.vp_c8)._m0[5].w, _2827);
    float _2853 = fma(_2805, (*spvDescriptorSet0.vp_c8)._m0[4].w, _2843);
    float _2855 = _2823 * 0.693147182464599609375;
    float2 _7707 = float2(_2813, _2833);
    float _2857 = dm_bs(spvDescriptorSet0.vp_t_tcb_24.sample(spvDescriptorSet0.vp_t_tcb_24Smplr, select(_7707, float2(0.0), isnan(_7707)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_24, spvDescriptorSet0.vp_t_tcb_24Smplr_w, select(_7707, float2(0.0), isnan(_7707)), level(0.0)).x;
    float _2859 = fma(_2815, _2841, 1.570728778839111328125);
    float _2861 = fma(_2849, 0.5, 0.5);
    float _2863 = _2853 * _2829;
    float _2865 = _2851 * _2829;
    float _2867 = _2855 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _2869 = fma(_2863, 0.5, 0.5);
    float _2871 = fma(_2865, -0.5, 0.5);
    float _2873 = _2845 * 0.636619746685028076171875;
    float3 _7741 = float3(_2869, _2871, _2867);
    float _2875 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_7741, float3(0.0), isnan(_7741)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_7741, float3(0.0), isnan(_7741)), level(0.0)).x;
    float _2877 = -_2859;
    float _2879 = fma(_2873, _2877, 1.0);
    float3 _7757 = float3(_2869, _2871, _2867);
    float4 _2882 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_7757, float3(0.0), isnan(_7757)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_7757, float3(0.0), isnan(_7757)), level(0.0)).xyzw;
    float _2884 = _2882.x;
    float _2886 = _2882.y;
    float _2888 = _2882.z;
    float _2890 = _2882.w;
    float2 _7773 = float2(_2879, _2861);
    float3 _2894 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_7773, float2(0.0), isnan(_7773)), level(0.0)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_7773, float2(0.0), isnan(_7773)), level(0.0)).xyz;
    float _2896 = _2894.x;
    float _2898 = _2894.y;
    float _2900 = _2894.z;
    float _2902 = abs(_2439);
    float _2904 = log2(_2902);
    float _2906 = _2781 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _2908 = _2853 + _2817;
    float _2910 = fma(_2789, (*spvDescriptorSet0.vp_c8)._m0[6].x, _2906);
    bool _2912 = _2567 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _2914 = isnan(_2567);
    bool _2916 = _2912 || _2914;
    bool _2918 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _2920 = _2916 || _2918;
    float _2922 = _2908 * 0.5;
    float _2924 = fma(_2743, (*spvDescriptorSet0.vp_c8)._m0[6].z, _2910);
    float _2926 = _2751 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    bool _2928 = _2439 <= 8000.0;
    bool _2930 = isnan(_2439);
    bool _2932 = _2928 || _2930;
    bool _2934 = isnan(8000.0);
    bool _2936 = _2932 || _2934;
    float _2938 = float(_2936);
    float _2940 = fma(_2805, (*spvDescriptorSet0.vp_c8)._m0[6].w, _2924);
    float _2942 = in.m_87.x;
    float _2944 = _2904 * (*spvDescriptorSet0.vp_c15)._m0[654].z;
    float _2946 = exp2(_2926);
    out.gl_Position.x = _2853;
    out.gl_Position.y = _2851;
    out.gl_Position.z = _2940;
    out.gl_Position.w = _2817;
    float _2948 = exp2(_2944);
    float _2950 = -_2946;
    float _2952 = _2950 + 1.0;
    float _2954 = _2952 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _2956 = fma(_2948, (*spvDescriptorSet0.vp_c15)._m0[654].x, (*spvDescriptorSet0.vp_c15)._m0[654].y);
    float _2958 = precise::clamp(_2956, 0.0, 1.0);
    float _2960 = _2940 + _2817;
    float _2962 = -_2954;
    float _2964 = _2962 + 1.0;
    float _2966 = _2940;
    float _2968 = _2817;
    float _2970 = _2851;
    float _2972 = _2954;
    float _2974 = _2964;
    if (!_2920)
    {
        _2966 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _2976 = _2966;
    float _2978 = fma(_2958, -2.0, 3.0);
    float _2980 = _2958 * _2958;
    float _2982 = _2960 * 0.5;
    float _2984 = _2980 * _2978;
    float _2986 = -_2984;
    float _2988 = _2986 + 1.0;
    float _2990 = fma(_2988, (*spvDescriptorSet0.vp_c15)._m0[654].w, _2984);
    float _2992 = _2817 * 0.5;
    float _2994 = _2938 * _2990;
    float _2996 = fma(_2851, -0.5, _2992);
    float _2998 = _2976;
    float _3000 = _2976;
    if (!_2920)
    {
        _2968 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _3002 = _2968;
    float _3004 = _2994 * (*spvDescriptorSet0.vp_c15)._m0[653].x;
    out.m_89.x = _2922;
    out.m_89.y = _2996;
    out.m_89.z = _2982;
    out.m_89.w = _2817;
    float _3006 = _3002;
    float _3008 = _3002;
    if (!_2920)
    {
        _2970 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _3010 = _2970;
    float _3012 = -_2857;
    float _3014 = _3012 + 1.0;
    float _3016 = _3014 * _3004;
    float _3018 = precise::clamp(_3016, 0.0, 1.0);
    float _3020 = -_3018;
    float _3022 = fma(_3020, (*spvDescriptorSet0.vp_c15)._m0[653].y, 1.0);
    float _3024 = _2954 * _2875;
    float _3026 = _3022 * _2942;
    float _3028 = _3026;
    float _3030 = _3010;
    float _3032 = _3010;
    if (!_2920)
    {
        _2972 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _3034 = _2972;
    float _3036 = _2890 * _3024;
    float _3038 = _2890 * _2964;
    float _3040 = _3034;
    float _3042 = _3034;
    if (!_2920)
    {
        _2974 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _3044 = _2974;
    float _3046 = _2900 * _3024;
    float _3048 = fma(_2896, _3036, _2884);
    float _3050 = fma(_2898, _3036, _2886);
    float _3052 = _3026 * (*spvDescriptorSet0.vp_c13)._m0[1].w;
    float _3054 = fma(_2890, _3046, _2888);
    float _3056 = _2545 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _3058 = _3044;
    float _3060 = _3044;
    if (!_2920)
    {
        _3028 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _3062 = _3028;
    out.m_91.x = _3052;
    out.m_93.x = _3048;
    out.m_93.y = _3050;
    out.m_93.z = _3054;
    out.m_93.w = _3038;
    bool _3064 = !_2920;
    float _3066 = _3062;
    float _3068 = _3062;
    if (!_3064)
    {
        bool _3070 = _2567 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _3072 = isnan(_2567);
        bool _3074 = _3070 || _3072;
        bool _3076 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _3078 = _3074 || _3076;
        if (!_3078)
        {
            float _3080 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _3082 = _2567 + _3080;
            float _3084 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _3086 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _3084;
            float _3088 = 1.0 / _3086;
            float _3090 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _3092 = _3090 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _3094 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _3096 = _3094 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _3098 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _3100 = _3098 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _3102 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _3104 = _3102 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _3106 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _3108 = _3106 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _3110 = _3082 * _3088;
            float _3112 = precise::clamp(_3110, 0.0, 1.0);
            float _3114 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _3116 = _3114 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _3118 = fma(_3112, _3092, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _3120 = fma(_3112, _3116, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _3122 = fma(_3112, _3096, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _3124 = fma(_3112, _3100, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _3126 = fma(_3112, _3104, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _3128 = fma(_3112, _3108, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            _3068 = _3120;
            _3032 = _3126;
            _3042 = _3118;
            _3000 = _3124;
            _3008 = _3122;
            _3060 = _3128;
            _3130 = true;
        }
        else
        {
            bool _3132 = _2567 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _3134 = isnan(_2567);
            bool _3136 = _3132 || _3134;
            bool _3138 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _3140 = _3136 || _3138;
            if (!_3140)
            {
                _3040 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _3142 = _3040;
            _3042 = _3142;
            if (!_3140)
            {
                _3066 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _3144 = _3066;
            _3068 = _3144;
            if (!_3140)
            {
                _3006 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _3146 = _3006;
            _3008 = _3146;
            if (!_3140)
            {
                _2998 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _3148 = _2998;
            _3000 = _3148;
            if (!_3140)
            {
                _3030 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _3150 = _3030;
            _3032 = _3150;
            if (!_3140)
            {
                _3058 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _3152 = _3058;
            bool _3154 = !_3140;
            _3060 = _3152;
            if (!_3154)
            {
                bool _3156 = _2567 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _3158 = isnan(_2567);
                bool _3160 = _3156 || _3158;
                bool _3162 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _3164 = _3160 || _3162;
                if (!_3164)
                {
                    float _3166 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _3168 = _2567 + _3166;
                    float _3170 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _3172 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _3170;
                    float _3174 = 1.0 / _3172;
                    float _3176 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _3178 = _3176 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _3180 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _3182 = _3180 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _3184 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _3186 = _3184 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _3188 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _3190 = _3188 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _3192 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _3194 = _3192 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _3196 = _3168 * _3174;
                    float _3198 = precise::clamp(_3196, 0.0, 1.0);
                    float _3200 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _3202 = _3200 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _3204 = fma(_3198, _3178, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _3206 = fma(_3198, _3202, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _3208 = fma(_3198, _3182, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _3210 = fma(_3198, _3186, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _3212 = fma(_3198, _3190, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _3214 = fma(_3198, _3194, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    _3068 = _3206;
                    _3032 = _3212;
                    _3042 = _3204;
                    _3000 = _3210;
                    _3008 = _3208;
                    _3060 = _3214;
                    _3130 = true;
                }
                else
                {
                    _3068 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _3032 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _3042 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _3000 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _3008 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _3060 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _3130 = false;
    float _3216 = _3068;
    float _3218 = _3032;
    float _3220 = _3042;
    float _3222 = _3000;
    float _3224 = _3008;
    float _3226 = _3060;
    float _3228 = fma(_2185, -0.5, 0.5);
    float _3230 = precise::clamp(_3228, 0.0, 1.0);
    float _3232 = -_3216;
    float _3234 = _3232 + _3218;
    float _3236 = _3056 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _3238 = -_3220;
    float _3240 = _3238 + _3222;
    float _3242 = fma(_3230, _3234, _3216);
    out.m_95.x = 0.0;
    float _3244 = -_3224;
    float _3246 = _3244 + _3226;
    float _3248 = fma(_3230, _3240, _3220);
    float _3250 = _3242 * 0.586610972881317138671875;
    out.m_51.x = _3236;
    bool _3252 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _3254 = fma(_3230, _3246, _3224);
    float _3256 = fma(_3248, 0.298911988735198974609375, _3250);
    bool _3258 = _2545 > 0.0;
    bool _3260 = isnan(_2545);
    bool _3262 = _3258 || _3260;
    bool _3264 = isnan(0.0);
    bool _3266 = _3262 || _3264;
    float _3268 = fma(_3254, 0.114477999508380889892578125, _3256);
    float _3270 = -_3268;
    float _3272 = _3248 + _3270;
    float _3274 = -_3268;
    float _3276 = _3242 + _3274;
    float _3278 = -_3268;
    float _3280 = _3254 + _3278;
    float _3282 = fma(_3272, (*spvDescriptorSet0.vp_c13)._m0[1].z, _3268);
    float _3284 = fma(_3276, (*spvDescriptorSet0.vp_c13)._m0[1].z, _3268);
    float _3286 = fma(_3280, (*spvDescriptorSet0.vp_c13)._m0[1].z, _3268);
    bool _3288 = !_3252;
    if (!_3288)
    {
        float _3290 = -_2487;
        float _3292 = _3290 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
        float _3294 = -_2489;
        float _3296 = _3294 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
        float _3298 = -_2491;
        float _3300 = _3298 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
        float _3302 = _3292 * _3292;
        float _3304 = fma(_3296, _3296, _3302);
        float _3306 = fma(_3300, _3300, _3304);
        float _3308 = sqrt(_3306);
        float _3310 = rsqrt(_3306);
        float _3312 = -_3308;
        float _3314 = _3312 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
        float _3316 = _3314 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
        float _3318 = precise::clamp(_3316, 0.0, 1.0);
        float _3320 = _3296 * _3310;
        float _3322 = _3292 * _3310;
        float _3324 = abs(_3318);
        float _3326 = log2(_3324);
        float _3328 = _3300 * _3310;
        float _3330 = _3320 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
        float _3332 = _2185 * _3322;
        float _3334 = -_3322;
        float _3336 = -_3330;
        float _3338 = fma(_3334, (*spvDescriptorSet0.vp_c15)._m0[656].y, _3336);
        float _3340 = fma(_2183, _3320, _3332);
        float _3342 = -_3328;
        float _3344 = fma(_3342, (*spvDescriptorSet0.vp_c15)._m0[656].z, _3338);
        float _3346 = fma(_2187, _3328, _3340);
        float _3348 = precise::clamp(_3346, 0.0, 1.0);
        float _3350 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
        float _3352 = _3344 + _3350;
        float _3354 = _3326 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
        float _3356 = _3352 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
        float _3358 = precise::clamp(_3356, 0.0, 1.0);
        float _3360 = exp2(_3354);
        float _3362 = _3360 * _3358;
        float _3364 = _3348 * _3362;
        float _3366 = _3364 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
        float _3368 = _3364 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
        float _3370 = _3364 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
        out.m_95.x = _3366;
        out.m_95.y = _3368;
        out.m_95.z = _3370;
    }
    out.m_97.x = _3282;
    out.m_97.y = _3284;
    out.m_97.z = _3286;
    if (_3266)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_77.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_77.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_77.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_77.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_71.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_71.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_71.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_71.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_51.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_51.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_51.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_51.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_97.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_97.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_97.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_97.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_67.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_67.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_67.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_67.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_73.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_73.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_73.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_73.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_89.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_89.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_89.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_89.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_79.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_79.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_79.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_79.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_85.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_85.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_85.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_85.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_95.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_95.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_95.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_95.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_91.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_91.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_91.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_91.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_93.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_93.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_93.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_93.w)); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    out.m_51.x = 0.0;
    float _3372 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _3372;
    { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_77.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_77.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_77.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_77.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_71.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_71.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_71.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_71.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_51.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_51.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_51.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_51.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_97.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_97.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_97.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_97.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_67.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_67.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_67.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_67.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_73.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_73.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_73.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_73.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_89.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_89.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_89.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_89.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_79.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_79.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_79.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_79.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_85.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_85.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_85.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_85.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_95.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_95.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_95.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_95.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_91.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_91.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_91.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_91.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_93.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_93.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_93.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_93.w)); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
}

