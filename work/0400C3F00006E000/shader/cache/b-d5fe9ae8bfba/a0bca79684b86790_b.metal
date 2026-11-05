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
    constant _16* vp_c13 [[id(4)]];
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
    float4 m_61 [[user(locn1)]];
    float4 m_67 [[user(locn2)]];
    float4 m_71 [[user(locn3)]];
    float4 m_79 [[user(locn4)]];
    float4 m_81 [[user(locn5)]];
    float4 m_89 [[user(locn6)]];
    float4 m_73 [[user(locn7)]];
    float4 m_77 [[user(locn8)]];
    float4 m_95 [[user(locn9)]];
    float4 m_99 [[user(locn10)]];
    float4 m_97 [[user(locn11)]];
    float4 m_49 [[user(locn12)]];
    float4 m_93 [[user(locn13)]];
    float4 m_105 [[user(locn14)]];
    float4 m_101 [[user(locn15)]];
    float4 m_103 [[user(locn16)]];
    float4 m_107 [[user(locn17)]];
    float4 m_63 [[user(locn18)]];
    float4 m_65 [[user(locn19)]];
    float4 gl_Position [[position, invariant]];
    float gl_PointSize [[point_size]];
};

struct main0_in
{
    float4 m_91 [[attribute(0)]];
    float4 m_75 [[attribute(1)]];
    float4 m_53 [[attribute(2)]];
    float4 m_46 [[attribute(3)]];
    float4 m_51 [[attribute(4)]];
    float4 m_85 [[attribute(5)]];
    float4 m_83 [[attribute(6)]];
    float4 m_55 [[attribute(7)]];
    float4 m_57 [[attribute(8)]];
    float4 m_87 [[attribute(9)]];
    float4 m_69 [[attribute(10)]];
};

vertex main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]])
{
    main0_out out = {};
    out.m_59 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_61 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_67 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_71 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_79 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_81 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_89 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_73 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_77 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_95 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_99 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_97 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_49 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_93 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_105 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_101 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_103 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_107 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_63 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_65 = float4(0.0, 0.0, 0.0, 1.0);
    bool _7096 = false;
    bool _1790 = false;
    bool _1460 = false;
    bool _1142 = false;
    bool _824 = false;
    bool _682 = false;
    bool _568 = false;
    bool _452 = false;
    bool _230 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _121 = in.m_46.w;
    float _123 = trunc(_121);
    int _126 = int(_123);
    bool _130 = _126 >= 1;
    float _132 = 0.0;
    if (!_130)
    {
        _132 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _134 = _132;
    float _136 = _134;
    if (!_130)
    {
        out.m_49.x = 0.0;
    }
    int _138 = 0;
    if (!_130)
    {
        float _140 = _134 * 5.0;
        _138 = as_type<int>(_140);
    }
    int _142 = _138;
    int _144 = _142;
    if (!_130)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _7395 = as_type<float>(_142);
        out.gl_Position.z = _7395;
    }
    if (!_130)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _146 = in.m_51.w;
    bool _148 = _146 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _150 = isnan(_146);
    bool _152 = _148 || _150;
    bool _154 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _156 = _152 || _154;
    float _158 = -_146;
    float _160 = _158 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    float _162 = _160;
    if (_156)
    {
        float _164 = float(_126);
        _136 = _164;
    }
    float _166 = _136;
    bool _168 = _160 >= _166;
    bool _170 = !_156;
    bool _172 = _168 || _170;
    float _174 = _166;
    if (_172)
    {
        _174 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _176 = _174;
    if (_172)
    {
        out.m_49.x = 0.0;
    }
    if (_172)
    {
        float _178 = _176 * 5.0;
        _144 = as_type<int>(_178);
    }
    int _180 = _144;
    if (_172)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _7465 = as_type<float>(_180);
        out.gl_Position.z = _7465;
    }
    if (_172)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _182 = in.m_53.x;
    float _184 = in.m_53.y;
    float _186 = in.m_53.z;
    bool _188 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _190 = _184 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _192 = _184 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _194 = _184 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _196 = fma(_182, (*spvDescriptorSet0.vp_c10)._m0[4].x, _190);
    float _198 = fma(_182, (*spvDescriptorSet0.vp_c10)._m0[5].x, _192);
    float _200 = fma(_182, (*spvDescriptorSet0.vp_c10)._m0[6].x, _194);
    float _202 = fma(_186, (*spvDescriptorSet0.vp_c10)._m0[4].z, _196);
    float _204 = fma(_186, (*spvDescriptorSet0.vp_c10)._m0[5].z, _198);
    float _206 = fma(_186, (*spvDescriptorSet0.vp_c10)._m0[6].z, _200);
    bool _208 = !_188;
    float _210 = _202;
    float _228;
    if (!_208)
    {
        float _212 = in.m_55.x;
        float _214 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _216 = _212 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _218 = fma(_216, (*spvDescriptorSet0.vp_c9)._m0[12].x, _160);
        float _220 = _218 * _214;
        float _222 = floor(_220);
        float _224 = -_222;
        float _226 = _220 + _224;
        _228 = _226;
        _230 = true;
    }
    else
    {
        float _232 = float(_126);
        float _234 = 1.0 / _232;
        float _236 = _160 * _234;
        _228 = _236;
    }
    _230 = false;
    float _238 = _228;
    float _240 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _242 = _238 + _240;
    float _244 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _246 = _238 + _244;
    bool _248 = _238 >= (*spvDescriptorSet0.vp_c9)._m0[146].w;
    bool _250 = isnan(_238);
    bool _252 = _248 || _250;
    bool _254 = isnan((*spvDescriptorSet0.vp_c9)._m0[146].w);
    bool _256 = _252 || _254;
    float _258 = float(_256);
    float _260 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _262 = (*spvDescriptorSet0.vp_c9)._m0[146].w + _260;
    float _264 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _266 = _238 + _264;
    float _268 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _270 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _268;
    float _272 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _274 = _272 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _276 = 1.0 / _262;
    bool _278 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _280 = 1.0 / _274;
    float _282 = 1.0 / _270;
    float _284 = _242 * _276;
    bool _286 = _238 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _288 = isnan(_238);
    bool _290 = _286 || _288;
    bool _292 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _294 = _290 || _292;
    float _296 = float(_294);
    float _298 = -_258;
    float _300 = _298 + 1.0;
    float _302 = _296 * _300;
    float _304 = _246 * _280;
    bool _306 = _238 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _308 = isnan(_238);
    bool _310 = _306 || _308;
    bool _312 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _314 = _310 || _312;
    float _316 = float(_314);
    float _318 = -(*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _320 = (*spvDescriptorSet0.vp_c9)._m0[144].z + _318;
    bool _322 = _238 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _324 = isnan(_238);
    bool _326 = _322 || _324;
    bool _328 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _330 = _326 || _328;
    float _332 = float(_330);
    float _334 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _336 = _334 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _338 = -_296;
    float _340 = _338 + 1.0;
    float _342 = -_316;
    float _344 = _342 + 1.0;
    float _346 = _266 * _282;
    float _348 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _350 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _348;
    float _352 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _354 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _352;
    float _356 = _332 * _344;
    float _358 = fma(_320, _346, (*spvDescriptorSet0.vp_c9)._m0[143].z);
    float _360 = fma(_350, _346, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _362 = fma(_354, _346, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _364 = _316 * _340;
    float _366 = -(*spvDescriptorSet0.vp_c9)._m0[144].z;
    float _368 = _366 + (*spvDescriptorSet0.vp_c9)._m0[145].z;
    float _370 = _360 * _356;
    float _372 = _362 * _356;
    float _374 = _358 * _356;
    float _376 = -_332;
    float _378 = _376 + 1.0;
    float _380 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _382 = _380 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _384 = fma(_378, (*spvDescriptorSet0.vp_c9)._m0[143].x, _372);
    float _386 = fma(_378, (*spvDescriptorSet0.vp_c9)._m0[143].y, _370);
    float _388 = fma(_378, (*spvDescriptorSet0.vp_c9)._m0[143].z, _374);
    float _390 = -(*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _392 = (*spvDescriptorSet0.vp_c9)._m0[146].x + _390;
    float _394 = fma(_336, _304, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _396 = fma(_382, _304, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _398 = fma(_368, _304, (*spvDescriptorSet0.vp_c9)._m0[144].z);
    float _400 = -(*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _402 = (*spvDescriptorSet0.vp_c9)._m0[146].y + _400;
    float _404 = -(*spvDescriptorSet0.vp_c9)._m0[145].z;
    float _406 = (*spvDescriptorSet0.vp_c9)._m0[146].z + _404;
    float _408 = fma(_394, _364, _384);
    float _410 = fma(_392, _284, (*spvDescriptorSet0.vp_c9)._m0[145].x);
    float _412 = fma(_402, _284, (*spvDescriptorSet0.vp_c9)._m0[145].y);
    float _414 = fma(_406, _284, (*spvDescriptorSet0.vp_c9)._m0[145].z);
    float _416 = fma(_396, _364, _386);
    float _418 = fma(_398, _364, _388);
    float _420 = fma(_410, _302, _408);
    float _422 = fma(_412, _302, _416);
    float _424 = fma(_414, _302, _418);
    float _426 = fma(_258, (*spvDescriptorSet0.vp_c9)._m0[146].x, _420);
    float _428 = fma(_258, (*spvDescriptorSet0.vp_c9)._m0[146].y, _422);
    float _430 = fma(_258, (*spvDescriptorSet0.vp_c9)._m0[146].z, _424);
    bool _432 = !_278;
    float _450;
    if (!_432)
    {
        float _434 = in.m_55.x;
        float _436 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _438 = _434 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _440 = fma(_438, (*spvDescriptorSet0.vp_c9)._m0[11].y, _160);
        float _442 = _440 * _436;
        float _444 = floor(_442);
        float _446 = -_444;
        float _448 = _442 + _446;
        _450 = _448;
        _452 = true;
    }
    else
    {
        float _454 = float(_126);
        float _456 = 1.0 / _454;
        float _458 = _160 * _456;
        _450 = _458;
    }
    _452 = false;
    float _460 = _450;
    float _462 = in.m_57.x;
    float _464 = in.m_57.y;
    float _466 = in.m_57.z;
    bool _468 = _460 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _470 = isnan(_460);
    bool _472 = _468 || _470;
    bool _474 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _476 = _472 || _474;
    float _478 = float(_476);
    float _480 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _482 = _480 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _484 = _460 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _486 = isnan(_460);
    bool _488 = _484 || _486;
    bool _490 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _492 = _488 || _490;
    float _494 = float(_492);
    float _496 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _498 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _496;
    float _500 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _502 = _460 + _500;
    float _504 = -_478;
    float _506 = _504 + 1.0;
    bool _508 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].z;
    float _510 = 1.0 / _482;
    float _512 = _494 * _506;
    float _514 = -_494;
    float _516 = _514 + 1.0;
    float _518 = _430 * _466;
    float _520 = _428 * _464;
    float _522 = _498 * _510;
    float _524 = _426 * _462;
    float _526 = fma(_522, _502, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _528 = _526 * _512;
    float _530 = fma(_516, (*spvDescriptorSet0.vp_c9)._m0[115].x, _528);
    float _532 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _534 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _536 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _538 = fma(_478, (*spvDescriptorSet0.vp_c9)._m0[116].x, _530);
    float _540 = _532 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _542 = _534 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _544 = _536 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _546 = _538 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    out.m_59.x = _540;
    out.m_59.y = _542;
    out.m_59.z = _544;
    out.m_59.w = _546;
    bool _548 = !_508;
    float _566;
    if (!_548)
    {
        float _550 = in.m_55.x;
        float _552 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].z;
        float _554 = _550 * (*spvDescriptorSet0.vp_c9)._m0[12].w;
        float _556 = fma(_554, (*spvDescriptorSet0.vp_c9)._m0[11].z, _160);
        float _558 = _556 * _552;
        float _560 = floor(_558);
        float _562 = -_560;
        float _564 = _558 + _562;
        _566 = _564;
        _568 = true;
    }
    else
    {
        float _570 = float(_126);
        float _572 = 1.0 / _570;
        float _574 = _160 * _572;
        _566 = _574;
    }
    _568 = false;
    float _576 = _566;
    float _578 = -(*spvDescriptorSet0.vp_c9)._m0[123].w;
    float _580 = _576 + _578;
    bool _582 = _576 >= (*spvDescriptorSet0.vp_c9)._m0[124].w;
    bool _584 = isnan(_576);
    bool _586 = _582 || _584;
    bool _588 = isnan((*spvDescriptorSet0.vp_c9)._m0[124].w);
    bool _590 = _586 || _588;
    float _592 = float(_590);
    float _594 = -(*spvDescriptorSet0.vp_c9)._m0[123].w;
    float _596 = (*spvDescriptorSet0.vp_c9)._m0[124].w + _594;
    bool _598 = _576 >= (*spvDescriptorSet0.vp_c9)._m0[123].w;
    bool _600 = isnan(_576);
    bool _602 = _598 || _600;
    bool _604 = isnan((*spvDescriptorSet0.vp_c9)._m0[123].w);
    bool _606 = _602 || _604;
    float _608 = float(_606);
    float _610 = -_592;
    float _612 = _610 + 1.0;
    float _614 = -(*spvDescriptorSet0.vp_c9)._m0[123].x;
    float _616 = (*spvDescriptorSet0.vp_c9)._m0[124].x + _614;
    float _618 = 1.0 / _596;
    bool _620 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].w;
    float _622 = _608 * _612;
    float _624 = -_608;
    float _626 = _624 + 1.0;
    float _628 = _580 * _618;
    float _630 = -(*spvDescriptorSet0.vp_c9)._m0[123].z;
    float _632 = (*spvDescriptorSet0.vp_c9)._m0[124].z + _630;
    float _634 = fma(_616, _628, (*spvDescriptorSet0.vp_c9)._m0[123].x);
    float _636 = -(*spvDescriptorSet0.vp_c9)._m0[123].y;
    float _638 = (*spvDescriptorSet0.vp_c9)._m0[124].y + _636;
    float _640 = fma(_632, _628, (*spvDescriptorSet0.vp_c9)._m0[123].z);
    float _642 = _634 * _622;
    float _644 = fma(_638, _628, (*spvDescriptorSet0.vp_c9)._m0[123].y);
    float _646 = _640 * _622;
    float _648 = _644 * _622;
    float _650 = fma(_626, (*spvDescriptorSet0.vp_c9)._m0[123].x, _642);
    float _652 = fma(_626, (*spvDescriptorSet0.vp_c9)._m0[123].y, _648);
    float _654 = fma(_626, (*spvDescriptorSet0.vp_c9)._m0[123].z, _646);
    float _656 = fma(_592, (*spvDescriptorSet0.vp_c9)._m0[124].x, _650);
    float _658 = fma(_592, (*spvDescriptorSet0.vp_c9)._m0[124].y, _652);
    float _660 = fma(_592, (*spvDescriptorSet0.vp_c9)._m0[124].z, _654);
    bool _662 = !_620;
    float _680;
    if (!_662)
    {
        float _664 = in.m_55.x;
        float _666 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].w;
        float _668 = _664 * (*spvDescriptorSet0.vp_c9)._m0[13].x;
        float _670 = fma(_668, (*spvDescriptorSet0.vp_c9)._m0[11].w, _160);
        float _672 = _670 * _666;
        float _674 = floor(_672);
        float _676 = -_674;
        float _678 = _672 + _676;
        _680 = _678;
        _682 = true;
    }
    else
    {
        float _684 = float(_126);
        float _686 = 1.0 / _684;
        float _688 = _160 * _686;
        _680 = _688;
    }
    _682 = false;
    float _690 = _680;
    float _692 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _694 = _690 + _692;
    float _696 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _698 = _696 + (*spvDescriptorSet0.vp_c9)._m0[132].w;
    bool _700 = _690 >= (*spvDescriptorSet0.vp_c9)._m0[132].w;
    bool _702 = isnan(_690);
    bool _704 = _700 || _702;
    bool _706 = isnan((*spvDescriptorSet0.vp_c9)._m0[132].w);
    bool _708 = _704 || _706;
    float _710 = float(_708);
    float _712 = -(*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _714 = _712 + (*spvDescriptorSet0.vp_c9)._m0[133].w;
    bool _716 = _690 >= (*spvDescriptorSet0.vp_c9)._m0[131].w;
    bool _718 = isnan(_690);
    bool _720 = _716 || _718;
    bool _722 = isnan((*spvDescriptorSet0.vp_c9)._m0[131].w);
    bool _724 = _720 || _722;
    float _726 = float(_724);
    float _728 = -(*spvDescriptorSet0.vp_c9)._m0[131].x;
    float _730 = (*spvDescriptorSet0.vp_c9)._m0[132].x + _728;
    bool _732 = _690 >= (*spvDescriptorSet0.vp_c9)._m0[133].w;
    bool _734 = isnan(_690);
    bool _736 = _732 || _734;
    bool _738 = isnan((*spvDescriptorSet0.vp_c9)._m0[133].w);
    bool _740 = _736 || _738;
    float _742 = float(_740);
    float _744 = 1.0 / _698;
    float _746 = -_710;
    float _748 = _746 + 1.0;
    bool _750 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[14].x;
    float _752 = _726 * _748;
    float _754 = -_726;
    float _756 = _754 + 1.0;
    float _758 = 1.0 / _714;
    float _760 = _730 * _744;
    float _762 = -(*spvDescriptorSet0.vp_c9)._m0[132].x;
    float _764 = _762 + (*spvDescriptorSet0.vp_c9)._m0[133].x;
    float _766 = fma(_760, _694, (*spvDescriptorSet0.vp_c9)._m0[131].x);
    float _768 = _764 * _758;
    float _770 = _766 * _752;
    float _772 = -_742;
    float _774 = _772 + 1.0;
    float _776 = -(*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _778 = _690 + _776;
    float _780 = _656 * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _782 = fma(_756, (*spvDescriptorSet0.vp_c9)._m0[131].x, _770);
    float _784 = _710 * _774;
    float _786 = fma(_768, _778, (*spvDescriptorSet0.vp_c9)._m0[132].x);
    float _788 = _660 * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _790 = fma(_786, _784, _782);
    float _792 = _658 * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _794 = _780 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _796 = _788 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _798 = fma(_742, (*spvDescriptorSet0.vp_c9)._m0[133].x, _790);
    float _800 = _792 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _802 = _798 * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    out.m_61.x = _794;
    out.m_61.y = _800;
    out.m_61.z = _796;
    out.m_61.w = _802;
    bool _804 = !_750;
    float _822;
    if (!_804)
    {
        float _806 = in.m_55.x;
        float _808 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[14].x;
        float _810 = _806 * (*spvDescriptorSet0.vp_c9)._m0[15].x;
        float _812 = fma(_810, (*spvDescriptorSet0.vp_c9)._m0[14].x, _160);
        float _814 = _812 * _808;
        float _816 = floor(_814);
        float _818 = -_816;
        float _820 = _814 + _818;
        _822 = _820;
        _824 = true;
    }
    else
    {
        float _826 = float(_126);
        float _828 = 1.0 / _826;
        float _830 = _160 * _828;
        _822 = _830;
    }
    _824 = false;
    float _832 = _822;
    float _834 = -(*spvDescriptorSet0.vp_c9)._m0[159].w;
    float _836 = _832 + _834;
    bool _838 = _832 >= (*spvDescriptorSet0.vp_c9)._m0[165].w;
    bool _840 = isnan(_832);
    bool _842 = _838 || _840;
    bool _844 = isnan((*spvDescriptorSet0.vp_c9)._m0[165].w);
    bool _846 = _842 || _844;
    float _848 = float(_846);
    float _850 = -(*spvDescriptorSet0.vp_c9)._m0[159].w;
    float _852 = _850 + (*spvDescriptorSet0.vp_c9)._m0[160].w;
    bool _854 = _832 >= (*spvDescriptorSet0.vp_c9)._m0[164].w;
    bool _856 = isnan(_832);
    bool _858 = _854 || _856;
    bool _860 = isnan((*spvDescriptorSet0.vp_c9)._m0[164].w);
    bool _862 = _858 || _860;
    float _864 = float(_862);
    float _866 = -(*spvDescriptorSet0.vp_c9)._m0[159].x;
    float _868 = (*spvDescriptorSet0.vp_c9)._m0[160].x + _866;
    bool _870 = _832 >= (*spvDescriptorSet0.vp_c9)._m0[163].w;
    bool _872 = isnan(_832);
    bool _874 = _870 || _872;
    bool _876 = isnan((*spvDescriptorSet0.vp_c9)._m0[163].w);
    bool _878 = _874 || _876;
    float _880 = float(_878);
    float _882 = -_848;
    float _884 = _882 + 1.0;
    float _886 = 1.0 / _852;
    float _888 = _864 * _884;
    float _890 = -_880;
    float _892 = _890 + 1.0;
    float _894 = -(*spvDescriptorSet0.vp_c9)._m0[160].w;
    float _896 = _894 + (*spvDescriptorSet0.vp_c9)._m0[161].w;
    bool _898 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[14].y;
    float _900 = 1.0 / _896;
    float _902 = _868 * _886;
    float _904 = -_864;
    float _906 = _904 + 1.0;
    bool _908 = _832 >= (*spvDescriptorSet0.vp_c9)._m0[162].w;
    bool _910 = isnan(_832);
    bool _912 = _908 || _910;
    bool _914 = isnan((*spvDescriptorSet0.vp_c9)._m0[162].w);
    bool _916 = _912 || _914;
    float _918 = float(_916);
    float _920 = fma(_902, _836, (*spvDescriptorSet0.vp_c9)._m0[159].x);
    float _922 = _880 * _906;
    bool _924 = _832 >= (*spvDescriptorSet0.vp_c9)._m0[161].w;
    bool _926 = isnan(_832);
    bool _928 = _924 || _926;
    bool _930 = isnan((*spvDescriptorSet0.vp_c9)._m0[161].w);
    bool _932 = _928 || _930;
    float _934 = float(_932);
    float _936 = _918 * _892;
    float _938 = -_918;
    float _940 = _938 + 1.0;
    float _942 = -(*spvDescriptorSet0.vp_c9)._m0[161].w;
    float _944 = _942 + (*spvDescriptorSet0.vp_c9)._m0[162].w;
    bool _946 = _832 >= (*spvDescriptorSet0.vp_c9)._m0[160].w;
    bool _948 = isnan(_832);
    bool _950 = _946 || _948;
    bool _952 = isnan((*spvDescriptorSet0.vp_c9)._m0[160].w);
    bool _954 = _950 || _952;
    float _956 = float(_954);
    float _958 = _934 * _940;
    float _960 = -_934;
    float _962 = _960 + 1.0;
    float _964 = -(*spvDescriptorSet0.vp_c9)._m0[162].w;
    float _966 = _964 + (*spvDescriptorSet0.vp_c9)._m0[163].w;
    float _968 = 1.0 / _944;
    bool _970 = _832 >= (*spvDescriptorSet0.vp_c9)._m0[159].w;
    bool _972 = isnan(_832);
    bool _974 = _970 || _972;
    bool _976 = isnan((*spvDescriptorSet0.vp_c9)._m0[159].w);
    bool _978 = _974 || _976;
    float _980 = float(_978);
    float _982 = _956 * _962;
    float _984 = -_956;
    float _986 = _984 + 1.0;
    float _988 = -(*spvDescriptorSet0.vp_c9)._m0[163].w;
    float _990 = _988 + (*spvDescriptorSet0.vp_c9)._m0[164].w;
    float _992 = -(*spvDescriptorSet0.vp_c9)._m0[160].x;
    float _994 = _992 + (*spvDescriptorSet0.vp_c9)._m0[161].x;
    float _996 = _980 * _986;
    float _998 = 1.0 / _966;
    float _1000 = _994 * _900;
    float _1002 = _920 * _996;
    float _1004 = -_980;
    float _1006 = _1004 + 1.0;
    float _1008 = -(*spvDescriptorSet0.vp_c9)._m0[164].w;
    float _1010 = _1008 + (*spvDescriptorSet0.vp_c9)._m0[165].w;
    float _1012 = -(*spvDescriptorSet0.vp_c9)._m0[160].w;
    float _1014 = _832 + _1012;
    float _1016 = 1.0 / _990;
    float _1018 = -(*spvDescriptorSet0.vp_c9)._m0[161].x;
    float _1020 = (*spvDescriptorSet0.vp_c9)._m0[162].x + _1018;
    float _1022 = fma(_1006, (*spvDescriptorSet0.vp_c9)._m0[159].x, _1002);
    float _1024 = -(*spvDescriptorSet0.vp_c9)._m0[165].w;
    float _1026 = _1024 + (*spvDescriptorSet0.vp_c9)._m0[166].w;
    float _1028 = fma(_1000, _1014, (*spvDescriptorSet0.vp_c9)._m0[160].x);
    float _1030 = _1020 * _968;
    float _1032 = -(*spvDescriptorSet0.vp_c9)._m0[161].w;
    float _1034 = _832 + _1032;
    float _1036 = 1.0 / _1010;
    float _1038 = -(*spvDescriptorSet0.vp_c9)._m0[162].x;
    float _1040 = _1038 + (*spvDescriptorSet0.vp_c9)._m0[163].x;
    float _1042 = fma(_1030, _1034, (*spvDescriptorSet0.vp_c9)._m0[161].x);
    float _1044 = fma(_1028, _982, _1022);
    float _1046 = -(*spvDescriptorSet0.vp_c9)._m0[163].x;
    float _1048 = (*spvDescriptorSet0.vp_c9)._m0[164].x + _1046;
    float _1050 = _1040 * _998;
    float _1052 = -(*spvDescriptorSet0.vp_c9)._m0[162].w;
    float _1054 = _832 + _1052;
    float _1056 = 1.0 / _1026;
    float _1058 = fma(_1042, _958, _1044);
    float _1060 = _1048 * _1016;
    float _1062 = -(*spvDescriptorSet0.vp_c9)._m0[163].w;
    float _1064 = _832 + _1062;
    float _1066 = -(*spvDescriptorSet0.vp_c9)._m0[164].x;
    float _1068 = _1066 + (*spvDescriptorSet0.vp_c9)._m0[165].x;
    float _1070 = fma(_1050, _1054, (*spvDescriptorSet0.vp_c9)._m0[162].x);
    float _1072 = -(*spvDescriptorSet0.vp_c9)._m0[164].w;
    float _1074 = _832 + _1072;
    float _1076 = fma(_1060, _1064, (*spvDescriptorSet0.vp_c9)._m0[163].x);
    float _1078 = _1068 * _1036;
    float _1080 = -(*spvDescriptorSet0.vp_c9)._m0[165].x;
    float _1082 = (*spvDescriptorSet0.vp_c9)._m0[166].x + _1080;
    bool _1084 = _832 >= (*spvDescriptorSet0.vp_c9)._m0[166].w;
    bool _1086 = isnan(_832);
    bool _1088 = _1084 || _1086;
    bool _1090 = isnan((*spvDescriptorSet0.vp_c9)._m0[166].w);
    bool _1092 = _1088 || _1090;
    float _1094 = float(_1092);
    float _1096 = fma(_1070, _936, _1058);
    float _1098 = fma(_1078, _1074, (*spvDescriptorSet0.vp_c9)._m0[164].x);
    float _1100 = -(*spvDescriptorSet0.vp_c9)._m0[165].w;
    float _1102 = _832 + _1100;
    float _1104 = -_1094;
    float _1106 = _1104 + 1.0;
    float _1108 = _1082 * _1056;
    float _1110 = fma(_1076, _922, _1096);
    float _1112 = _848 * _1106;
    float _1114 = fma(_1108, _1102, (*spvDescriptorSet0.vp_c9)._m0[165].x);
    float _1116 = fma(_1098, _888, _1110);
    float _1118 = fma(_1114, _1112, _1116);
    float _1120 = fma(_1094, (*spvDescriptorSet0.vp_c9)._m0[166].x, _1118);
    out.m_63.x = _1120;
    bool _1122 = !_898;
    float _1140;
    if (!_1122)
    {
        float _1124 = in.m_55.x;
        float _1126 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[14].y;
        float _1128 = _1124 * (*spvDescriptorSet0.vp_c9)._m0[15].y;
        float _1130 = fma(_1128, (*spvDescriptorSet0.vp_c9)._m0[14].y, _160);
        float _1132 = _1130 * _1126;
        float _1134 = floor(_1132);
        float _1136 = -_1134;
        float _1138 = _1132 + _1136;
        _1140 = _1138;
        _1142 = true;
    }
    else
    {
        float _1144 = float(_126);
        float _1146 = 1.0 / _1144;
        float _1148 = _160 * _1146;
        _1140 = _1148;
    }
    _1142 = false;
    float _1150 = _1140;
    float _1152 = -(*spvDescriptorSet0.vp_c9)._m0[167].w;
    float _1154 = _1150 + _1152;
    bool _1156 = _1150 >= (*spvDescriptorSet0.vp_c9)._m0[173].w;
    bool _1158 = isnan(_1150);
    bool _1160 = _1156 || _1158;
    bool _1162 = isnan((*spvDescriptorSet0.vp_c9)._m0[173].w);
    bool _1164 = _1160 || _1162;
    float _1166 = float(_1164);
    float _1168 = -(*spvDescriptorSet0.vp_c9)._m0[167].w;
    float _1170 = _1168 + (*spvDescriptorSet0.vp_c9)._m0[168].w;
    bool _1172 = _1150 >= (*spvDescriptorSet0.vp_c9)._m0[172].w;
    bool _1174 = isnan(_1150);
    bool _1176 = _1172 || _1174;
    bool _1178 = isnan((*spvDescriptorSet0.vp_c9)._m0[172].w);
    bool _1180 = _1176 || _1178;
    float _1182 = float(_1180);
    float _1184 = -(*spvDescriptorSet0.vp_c9)._m0[167].x;
    float _1186 = (*spvDescriptorSet0.vp_c9)._m0[168].x + _1184;
    bool _1188 = _1150 >= (*spvDescriptorSet0.vp_c9)._m0[171].w;
    bool _1190 = isnan(_1150);
    bool _1192 = _1188 || _1190;
    bool _1194 = isnan((*spvDescriptorSet0.vp_c9)._m0[171].w);
    bool _1196 = _1192 || _1194;
    float _1198 = float(_1196);
    float _1200 = -_1166;
    float _1202 = _1200 + 1.0;
    float _1204 = 1.0 / _1170;
    float _1206 = _1182 * _1202;
    float _1208 = -_1198;
    float _1210 = _1208 + 1.0;
    float _1212 = -(*spvDescriptorSet0.vp_c9)._m0[168].w;
    float _1214 = _1212 + (*spvDescriptorSet0.vp_c9)._m0[169].w;
    bool _1216 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[14].z;
    float _1218 = 1.0 / _1214;
    float _1220 = _1186 * _1204;
    float _1222 = -_1182;
    float _1224 = _1222 + 1.0;
    bool _1226 = _1150 >= (*spvDescriptorSet0.vp_c9)._m0[170].w;
    bool _1228 = isnan(_1150);
    bool _1230 = _1226 || _1228;
    bool _1232 = isnan((*spvDescriptorSet0.vp_c9)._m0[170].w);
    bool _1234 = _1230 || _1232;
    float _1236 = float(_1234);
    float _1238 = fma(_1220, _1154, (*spvDescriptorSet0.vp_c9)._m0[167].x);
    float _1240 = _1198 * _1224;
    bool _1242 = _1150 >= (*spvDescriptorSet0.vp_c9)._m0[169].w;
    bool _1244 = isnan(_1150);
    bool _1246 = _1242 || _1244;
    bool _1248 = isnan((*spvDescriptorSet0.vp_c9)._m0[169].w);
    bool _1250 = _1246 || _1248;
    float _1252 = float(_1250);
    float _1254 = _1236 * _1210;
    float _1256 = -_1236;
    float _1258 = _1256 + 1.0;
    float _1260 = -(*spvDescriptorSet0.vp_c9)._m0[169].w;
    float _1262 = _1260 + (*spvDescriptorSet0.vp_c9)._m0[170].w;
    bool _1264 = _1150 >= (*spvDescriptorSet0.vp_c9)._m0[168].w;
    bool _1266 = isnan(_1150);
    bool _1268 = _1264 || _1266;
    bool _1270 = isnan((*spvDescriptorSet0.vp_c9)._m0[168].w);
    bool _1272 = _1268 || _1270;
    float _1274 = float(_1272);
    float _1276 = _1252 * _1258;
    float _1278 = -_1252;
    float _1280 = _1278 + 1.0;
    float _1282 = -(*spvDescriptorSet0.vp_c9)._m0[170].w;
    float _1284 = _1282 + (*spvDescriptorSet0.vp_c9)._m0[171].w;
    float _1286 = 1.0 / _1262;
    bool _1288 = _1150 >= (*spvDescriptorSet0.vp_c9)._m0[167].w;
    bool _1290 = isnan(_1150);
    bool _1292 = _1288 || _1290;
    bool _1294 = isnan((*spvDescriptorSet0.vp_c9)._m0[167].w);
    bool _1296 = _1292 || _1294;
    float _1298 = float(_1296);
    float _1300 = _1274 * _1280;
    float _1302 = -_1274;
    float _1304 = _1302 + 1.0;
    float _1306 = -(*spvDescriptorSet0.vp_c9)._m0[171].w;
    float _1308 = _1306 + (*spvDescriptorSet0.vp_c9)._m0[172].w;
    float _1310 = -(*spvDescriptorSet0.vp_c9)._m0[168].x;
    float _1312 = _1310 + (*spvDescriptorSet0.vp_c9)._m0[169].x;
    float _1314 = _1298 * _1304;
    float _1316 = 1.0 / _1284;
    float _1318 = _1312 * _1218;
    float _1320 = _1238 * _1314;
    float _1322 = -_1298;
    float _1324 = _1322 + 1.0;
    float _1326 = -(*spvDescriptorSet0.vp_c9)._m0[172].w;
    float _1328 = _1326 + (*spvDescriptorSet0.vp_c9)._m0[173].w;
    float _1330 = -(*spvDescriptorSet0.vp_c9)._m0[168].w;
    float _1332 = _1150 + _1330;
    float _1334 = 1.0 / _1308;
    float _1336 = -(*spvDescriptorSet0.vp_c9)._m0[169].x;
    float _1338 = (*spvDescriptorSet0.vp_c9)._m0[170].x + _1336;
    float _1340 = fma(_1324, (*spvDescriptorSet0.vp_c9)._m0[167].x, _1320);
    float _1342 = -(*spvDescriptorSet0.vp_c9)._m0[173].w;
    float _1344 = _1342 + (*spvDescriptorSet0.vp_c9)._m0[174].w;
    float _1346 = fma(_1318, _1332, (*spvDescriptorSet0.vp_c9)._m0[168].x);
    float _1348 = _1338 * _1286;
    float _1350 = -(*spvDescriptorSet0.vp_c9)._m0[169].w;
    float _1352 = _1150 + _1350;
    float _1354 = 1.0 / _1328;
    float _1356 = -(*spvDescriptorSet0.vp_c9)._m0[170].x;
    float _1358 = _1356 + (*spvDescriptorSet0.vp_c9)._m0[171].x;
    float _1360 = fma(_1348, _1352, (*spvDescriptorSet0.vp_c9)._m0[169].x);
    float _1362 = fma(_1346, _1300, _1340);
    float _1364 = -(*spvDescriptorSet0.vp_c9)._m0[171].x;
    float _1366 = (*spvDescriptorSet0.vp_c9)._m0[172].x + _1364;
    float _1368 = _1358 * _1316;
    float _1370 = -(*spvDescriptorSet0.vp_c9)._m0[170].w;
    float _1372 = _1150 + _1370;
    float _1374 = 1.0 / _1344;
    float _1376 = fma(_1360, _1276, _1362);
    float _1378 = _1366 * _1334;
    float _1380 = -(*spvDescriptorSet0.vp_c9)._m0[171].w;
    float _1382 = _1150 + _1380;
    float _1384 = -(*spvDescriptorSet0.vp_c9)._m0[172].x;
    float _1386 = _1384 + (*spvDescriptorSet0.vp_c9)._m0[173].x;
    float _1388 = fma(_1368, _1372, (*spvDescriptorSet0.vp_c9)._m0[170].x);
    float _1390 = -(*spvDescriptorSet0.vp_c9)._m0[172].w;
    float _1392 = _1150 + _1390;
    float _1394 = fma(_1378, _1382, (*spvDescriptorSet0.vp_c9)._m0[171].x);
    float _1396 = _1386 * _1354;
    float _1398 = -(*spvDescriptorSet0.vp_c9)._m0[173].x;
    float _1400 = (*spvDescriptorSet0.vp_c9)._m0[174].x + _1398;
    bool _1402 = _1150 >= (*spvDescriptorSet0.vp_c9)._m0[174].w;
    bool _1404 = isnan(_1150);
    bool _1406 = _1402 || _1404;
    bool _1408 = isnan((*spvDescriptorSet0.vp_c9)._m0[174].w);
    bool _1410 = _1406 || _1408;
    float _1412 = float(_1410);
    float _1414 = fma(_1388, _1254, _1376);
    float _1416 = fma(_1396, _1392, (*spvDescriptorSet0.vp_c9)._m0[172].x);
    float _1418 = -(*spvDescriptorSet0.vp_c9)._m0[173].w;
    float _1420 = _1150 + _1418;
    float _1422 = -_1412;
    float _1424 = _1422 + 1.0;
    float _1426 = _1400 * _1374;
    float _1428 = fma(_1394, _1240, _1414);
    float _1430 = _1166 * _1424;
    float _1432 = fma(_1426, _1420, (*spvDescriptorSet0.vp_c9)._m0[173].x);
    float _1434 = fma(_1416, _1206, _1428);
    float _1436 = fma(_1432, _1430, _1434);
    float _1438 = fma(_1412, (*spvDescriptorSet0.vp_c9)._m0[174].x, _1436);
    out.m_65.x = _1438;
    bool _1440 = !_1216;
    float _1458;
    if (!_1440)
    {
        float _1442 = in.m_55.x;
        float _1444 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[14].z;
        float _1446 = _1442 * (*spvDescriptorSet0.vp_c9)._m0[15].z;
        float _1448 = fma(_1446, (*spvDescriptorSet0.vp_c9)._m0[14].z, _160);
        float _1450 = _1448 * _1444;
        float _1452 = floor(_1450);
        float _1454 = -_1452;
        float _1456 = _1450 + _1454;
        _1458 = _1456;
        _1460 = true;
    }
    else
    {
        float _1462 = float(_126);
        float _1464 = 1.0 / _1462;
        float _1466 = _160 * _1464;
        _1458 = _1466;
    }
    _1460 = false;
    float _1468 = _1458;
    float _1470 = -(*spvDescriptorSet0.vp_c9)._m0[175].w;
    float _1472 = _1468 + _1470;
    bool _1474 = _1468 >= (*spvDescriptorSet0.vp_c9)._m0[181].w;
    bool _1476 = isnan(_1468);
    bool _1478 = _1474 || _1476;
    bool _1480 = isnan((*spvDescriptorSet0.vp_c9)._m0[181].w);
    bool _1482 = _1478 || _1480;
    float _1484 = float(_1482);
    float _1486 = -(*spvDescriptorSet0.vp_c9)._m0[175].w;
    float _1488 = _1486 + (*spvDescriptorSet0.vp_c9)._m0[176].w;
    bool _1490 = _1468 >= (*spvDescriptorSet0.vp_c9)._m0[180].w;
    bool _1492 = isnan(_1468);
    bool _1494 = _1490 || _1492;
    bool _1496 = isnan((*spvDescriptorSet0.vp_c9)._m0[180].w);
    bool _1498 = _1494 || _1496;
    float _1500 = float(_1498);
    float _1502 = -(*spvDescriptorSet0.vp_c9)._m0[175].x;
    float _1504 = (*spvDescriptorSet0.vp_c9)._m0[176].x + _1502;
    bool _1506 = _1468 >= (*spvDescriptorSet0.vp_c9)._m0[179].w;
    bool _1508 = isnan(_1468);
    bool _1510 = _1506 || _1508;
    bool _1512 = isnan((*spvDescriptorSet0.vp_c9)._m0[179].w);
    bool _1514 = _1510 || _1512;
    float _1516 = float(_1514);
    float _1518 = -_1484;
    float _1520 = _1518 + 1.0;
    float _1522 = 1.0 / _1488;
    float _1524 = _1500 * _1520;
    float _1526 = -_1516;
    float _1528 = _1526 + 1.0;
    float _1530 = -(*spvDescriptorSet0.vp_c9)._m0[176].w;
    float _1532 = _1530 + (*spvDescriptorSet0.vp_c9)._m0[177].w;
    bool _1534 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[14].w;
    float _1536 = 1.0 / _1532;
    float _1538 = _1504 * _1522;
    float _1540 = -_1500;
    float _1542 = _1540 + 1.0;
    bool _1544 = _1468 >= (*spvDescriptorSet0.vp_c9)._m0[178].w;
    bool _1546 = isnan(_1468);
    bool _1548 = _1544 || _1546;
    bool _1550 = isnan((*spvDescriptorSet0.vp_c9)._m0[178].w);
    bool _1552 = _1548 || _1550;
    float _1554 = float(_1552);
    float _1556 = fma(_1538, _1472, (*spvDescriptorSet0.vp_c9)._m0[175].x);
    float _1558 = _1516 * _1542;
    bool _1560 = _1468 >= (*spvDescriptorSet0.vp_c9)._m0[177].w;
    bool _1562 = isnan(_1468);
    bool _1564 = _1560 || _1562;
    bool _1566 = isnan((*spvDescriptorSet0.vp_c9)._m0[177].w);
    bool _1568 = _1564 || _1566;
    float _1570 = float(_1568);
    float _1572 = _1554 * _1528;
    float _1574 = -_1554;
    float _1576 = _1574 + 1.0;
    float _1578 = -(*spvDescriptorSet0.vp_c9)._m0[177].w;
    float _1580 = _1578 + (*spvDescriptorSet0.vp_c9)._m0[178].w;
    bool _1582 = _1468 >= (*spvDescriptorSet0.vp_c9)._m0[176].w;
    bool _1584 = isnan(_1468);
    bool _1586 = _1582 || _1584;
    bool _1588 = isnan((*spvDescriptorSet0.vp_c9)._m0[176].w);
    bool _1590 = _1586 || _1588;
    float _1592 = float(_1590);
    float _1594 = _1570 * _1576;
    float _1596 = -_1570;
    float _1598 = _1596 + 1.0;
    float _1600 = -(*spvDescriptorSet0.vp_c9)._m0[178].w;
    float _1602 = _1600 + (*spvDescriptorSet0.vp_c9)._m0[179].w;
    float _1604 = 1.0 / _1580;
    bool _1606 = _1468 >= (*spvDescriptorSet0.vp_c9)._m0[175].w;
    bool _1608 = isnan(_1468);
    bool _1610 = _1606 || _1608;
    bool _1612 = isnan((*spvDescriptorSet0.vp_c9)._m0[175].w);
    bool _1614 = _1610 || _1612;
    float _1616 = float(_1614);
    float _1618 = _1592 * _1598;
    float _1620 = -_1592;
    float _1622 = _1620 + 1.0;
    float _1624 = -(*spvDescriptorSet0.vp_c9)._m0[179].w;
    float _1626 = _1624 + (*spvDescriptorSet0.vp_c9)._m0[180].w;
    float _1628 = -(*spvDescriptorSet0.vp_c9)._m0[176].x;
    float _1630 = _1628 + (*spvDescriptorSet0.vp_c9)._m0[177].x;
    float _1632 = _1616 * _1622;
    float _1634 = 1.0 / _1602;
    float _1636 = _1630 * _1536;
    float _1638 = _1556 * _1632;
    float _1640 = -_1616;
    float _1642 = _1640 + 1.0;
    float _1644 = -(*spvDescriptorSet0.vp_c9)._m0[180].w;
    float _1646 = _1644 + (*spvDescriptorSet0.vp_c9)._m0[181].w;
    float _1648 = -(*spvDescriptorSet0.vp_c9)._m0[176].w;
    float _1650 = _1468 + _1648;
    float _1652 = 1.0 / _1626;
    float _1654 = -(*spvDescriptorSet0.vp_c9)._m0[177].x;
    float _1656 = (*spvDescriptorSet0.vp_c9)._m0[178].x + _1654;
    float _1658 = fma(_1642, (*spvDescriptorSet0.vp_c9)._m0[175].x, _1638);
    float _1660 = -(*spvDescriptorSet0.vp_c9)._m0[181].w;
    float _1662 = _1660 + (*spvDescriptorSet0.vp_c9)._m0[182].w;
    float _1664 = fma(_1636, _1650, (*spvDescriptorSet0.vp_c9)._m0[176].x);
    float _1666 = _1656 * _1604;
    float _1668 = -(*spvDescriptorSet0.vp_c9)._m0[177].w;
    float _1670 = _1468 + _1668;
    float _1672 = 1.0 / _1646;
    float _1674 = -(*spvDescriptorSet0.vp_c9)._m0[178].x;
    float _1676 = _1674 + (*spvDescriptorSet0.vp_c9)._m0[179].x;
    float _1678 = fma(_1666, _1670, (*spvDescriptorSet0.vp_c9)._m0[177].x);
    float _1680 = fma(_1664, _1618, _1658);
    float _1682 = -(*spvDescriptorSet0.vp_c9)._m0[179].x;
    float _1684 = (*spvDescriptorSet0.vp_c9)._m0[180].x + _1682;
    float _1686 = _1676 * _1634;
    float _1688 = -(*spvDescriptorSet0.vp_c9)._m0[178].w;
    float _1690 = _1468 + _1688;
    float _1692 = 1.0 / _1662;
    float _1694 = fma(_1678, _1594, _1680);
    float _1696 = _1684 * _1652;
    float _1698 = -(*spvDescriptorSet0.vp_c9)._m0[179].w;
    float _1700 = _1468 + _1698;
    float _1702 = -(*spvDescriptorSet0.vp_c9)._m0[180].x;
    float _1704 = _1702 + (*spvDescriptorSet0.vp_c9)._m0[181].x;
    float _1706 = fma(_1686, _1690, (*spvDescriptorSet0.vp_c9)._m0[178].x);
    float _1708 = -(*spvDescriptorSet0.vp_c9)._m0[180].w;
    float _1710 = _1468 + _1708;
    float _1712 = fma(_1696, _1700, (*spvDescriptorSet0.vp_c9)._m0[179].x);
    float _1714 = _1704 * _1672;
    float _1716 = -(*spvDescriptorSet0.vp_c9)._m0[181].x;
    float _1718 = (*spvDescriptorSet0.vp_c9)._m0[182].x + _1716;
    bool _1720 = _1468 >= (*spvDescriptorSet0.vp_c9)._m0[182].w;
    bool _1722 = isnan(_1468);
    bool _1724 = _1720 || _1722;
    bool _1726 = isnan((*spvDescriptorSet0.vp_c9)._m0[182].w);
    bool _1728 = _1724 || _1726;
    float _1730 = float(_1728);
    float _1732 = fma(_1706, _1572, _1694);
    float _1734 = fma(_1714, _1710, (*spvDescriptorSet0.vp_c9)._m0[180].x);
    float _1736 = -(*spvDescriptorSet0.vp_c9)._m0[181].w;
    float _1738 = _1468 + _1736;
    float _1740 = -_1730;
    float _1742 = _1740 + 1.0;
    float _1744 = _1718 * _1692;
    float _1746 = fma(_1712, _1558, _1732);
    float _1748 = _1484 * _1742;
    float _1750 = fma(_1744, _1738, (*spvDescriptorSet0.vp_c9)._m0[181].x);
    float _1752 = fma(_1734, _1524, _1746);
    float _1754 = fma(_1750, _1748, _1752);
    float _1756 = fma(_1730, (*spvDescriptorSet0.vp_c9)._m0[182].x, _1754);
    out.m_67.x = _1756;
    bool _1758 = !_1534;
    float _1760 = _1672;
    float _1762 = (*spvDescriptorSet0.vp_c9)._m0[178].x;
    float _1764 = _1692;
    float _1766 = _1680;
    float _1768 = _1484;
    float _1770 = _1524;
    float _1788;
    if (!_1758)
    {
        float _1772 = in.m_55.x;
        float _1774 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[14].w;
        float _1776 = _1772 * (*spvDescriptorSet0.vp_c9)._m0[15].w;
        float _1778 = fma(_1776, (*spvDescriptorSet0.vp_c9)._m0[14].w, _160);
        float _1780 = _1778 * _1774;
        float _1782 = floor(_1780);
        float _1784 = -_1782;
        float _1786 = _1780 + _1784;
        _1788 = _1786;
        _1790 = true;
    }
    else
    {
        float _1792 = float(_126);
        float _1794 = 1.0 / _1792;
        float _1796 = _160 * _1794;
        _1788 = _1796;
    }
    _1790 = false;
    float _1798 = _1788;
    float _1800 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].y);
    int _1802 = int(_1800);
    float _1804 = float(_126);
    float _1806 = in.m_69.x;
    float _1808 = in.m_55.y;
    int _1810 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _1812 = _1810 != 0;
    float _1814 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].x);
    int _1816 = int(_1814);
    int _1818 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _1820 = _1818 != 0;
    float _1822 = float(_1802);
    float _1824 = trunc((*spvDescriptorSet0.vp_c9)._m0[31].y);
    int _1826 = int(_1824);
    if (_1812)
    {
        float _1828 = in.m_55.x;
        _1760 = _1828;
    }
    float _1830 = _1760;
    float _1832 = float(uint(_1816));
    float _1834 = 1.0 / _1822;
    float _1836 = float(_1816);
    if (_1820)
    {
        float _1838 = in.m_55.z;
        _1762 = _1838;
    }
    float _1840 = _1762;
    int _1842 = ~_1816;
    int _1844 = _1842 + 1;
    float _1846 = 0.0;
    int _1848 = as_type<int>(_1840);
    float _1850 = _1806;
    if (!_1812)
    {
        _1846 = _1806;
    }
    float _1852 = _1846;
    float _1854 = trunc((*spvDescriptorSet0.vp_c9)._m0[40].y);
    int _1856 = int(_1854);
    float _1858 = float(_1826);
    int _1860 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _1862 = _1860 != 0;
    float _1864 = _1834 * _160;
    float _1866 = 1.0 / _1832;
    float _1868 = float(_1856);
    float _1870 = trunc(_1864);
    int _1872 = int(_1870);
    float _1874 = _1852;
    bool _1876 = _1862;
    if (_1862)
    {
        float _1878 = in.m_55.x;
        _1764 = _1878;
    }
    float _1880 = _1764;
    int _1882 = 0;
    float _1884 = _1880;
    if (_1862)
    {
        _1882 = 0;
    }
    int _1886 = _1882;
    int _1888 = 0;
    int _1890 = _1886;
    if (_1862)
    {
        _1888 = 0;
    }
    int _1892 = _1888;
    float _1894 = _1652;
    int _1896 = _1892;
    if (_1862)
    {
        float _1898 = in.m_55.z;
        _1894 = _1898;
    }
    float _1900 = _1894;
    float _1902 = 1.0 / _1858;
    int _1904 = as_type<int>(_1866) + (-2);
    float _1906 = _1836 * _160;
    if (_1862)
    {
        _1766 = 1.0;
    }
    float _1908 = _1766;
    float _1910 = _1908;
    if (_1862)
    {
        _1768 = 1.0;
    }
    float _1912 = _1768;
    float _1914 = _1912;
    if (_1862)
    {
        _1770 = 1.0;
    }
    float _1916 = _1770;
    float _1918 = 1.0 / _1868;
    float _1920 = float(uint(_1872));
    int _1922 = 0;
    float _1924 = _1916;
    if (_1862)
    {
        _1922 = as_type<int>(_1808);
    }
    int _1926 = _1922;
    float _1928 = 1.0 / _1804;
    float _1930 = as_type<float>(_1904) * _1920;
    float _1932 = _1902 * _160;
    int _1934 = as_type<int>(_1902);
    float _1936 = _1900;
    int _1938 = _1926;
    if (_1862)
    {
        _1934 = as_type<int>(_1900);
    }
    int _1940 = _1934;
    float _1942 = trunc(_1930);
    float _1944 = precise::max(_1942, 0.0);
    uint _1947 = uint(_1944);
    float _1949 = trunc((*spvDescriptorSet0.vp_c9)._m0[31].x);
    int _1951 = int(_1949);
    float _1953 = float(_1872);
    float _1955 = _1906 * _1928;
    float _1957 = in.m_55.w;
    bool _1959 = _1953 >= _1836;
    bool _1961 = isnan(_1953);
    bool _1963 = _1959 || _1961;
    bool _1965 = isnan(_1836);
    bool _1967 = _1963 || _1965;
    float _1969 = float(_1967);
    float _1971 = trunc((*spvDescriptorSet0.vp_c9)._m0[40].x);
    int _1973 = int(_1971);
    int _1975 = _1844 * int(_1947);
    int _1977 = _1975 + _1872;
    float _1979 = float(uint(_1977));
    float _1981 = trunc((*spvDescriptorSet0.vp_c9)._m0[49].x);
    int _1983 = int(_1981);
    float _1985 = float(uint(_1951));
    float _1987 = as_type<float>(_1904) * _1979;
    float _1989 = _1979;
    float _1991 = as_type<float>(_1977);
    int _1993 = _1940;
    int _1995 = as_type<int>(_1987);
    if (_1862)
    {
        _1989 = _1880;
    }
    float _1997 = _1989;
    float _1999 = trunc((*spvDescriptorSet0.vp_c9)._m0[49].y);
    int _2001 = int(_1999);
    float _2003 = float(uint(_1973));
    float _2005 = _1997;
    if (_1862)
    {
        _1991 = _1997;
    }
    float _2007 = _1991;
    int _2009 = 0;
    float _2011 = _2007;
    if (_1862)
    {
        _2009 = as_type<int>(_1997);
    }
    int _2013 = _2009;
    float _2015 = float(uint(_1983));
    float _2017 = 1.0 / _1985;
    float _2019 = float(_2001);
    float _2021 = 1.0 / _2003;
    float _2023 = 1.0 / _2019;
    float _2025 = 1.0 / _2015;
    float _2027 = trunc(_1955);
    int _2029 = int(_2027);
    float _2031 = trunc(_1932);
    int _2033 = int(_2031);
    float _2035 = trunc(_1969);
    int _2037 = int(_2035);
    float _2039 = trunc(_1987);
    float _2041 = precise::max(_2039, 0.0);
    uint _2043 = uint(_2041);
    int _2045 = _2013;
    int _2047 = int(_2043);
    if (!_1862)
    {
        float _2049 = in.m_55.x;
        float _2051 = _1808 * 3.1415927410125732421875;
        float _2053 = in.m_55.z;
        float _2055 = _2051 * 0.15915493667125701904296875;
        float _2057 = _2055 * 6.283185482025146484375;
        float _2059 = sin(_2057);
        float _2061 = _2049 * 3.1415927410125732421875;
        float _2063 = _2061 * 0.15915493667125701904296875;
        float _2065 = _2053 * 3.1415927410125732421875;
        float _2067 = _2065 * 0.15915493667125701904296875;
        float _2069 = _2063 * 6.283185482025146484375;
        float _2071 = sin(_2069);
        float _2073 = _2067 * 6.283185482025146484375;
        float _2075 = sin(_2073);
        _1914 = 1.2345600128173828125;
        _2005 = _1808;
        _1910 = 7.345489978790283203125;
        _1884 = _2049;
        _1924 = 5.839270114898681640625;
        _2011 = _2053;
        _1936 = _2053;
        _1890 = 1;
        _1896 = 2;
        _1938 = as_type<int>(_2059);
        _2045 = as_type<int>(_2071);
        _1993 = as_type<int>(_2075);
    }
    float _2077 = _1914;
    float _2079 = _2005;
    float _2081 = _1910;
    float _2083 = _1884;
    float _2085 = _1924;
    float _2087 = _2011;
    float _2089 = _1936;
    int _2091 = _1890;
    int _2093 = _1896;
    int _2095 = _1938;
    int _2097 = _2045;
    int _2099 = _1993;
    int _2101 = as_type<int>(_2081);
    if (_1812)
    {
        float _2103 = -_1806;
        float _2105 = _2103 + 1.0;
        _1995 = as_type<int>(_2105);
    }
    int _2107 = _1995;
    bool _2109 = false;
    if (_1812)
    {
        bool _2111 = _1830 > 0.5;
        _2109 = _2111;
    }
    bool _2113 = _2109;
    float _2115 = _2077 * _2079;
    int _2117 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 16;
    bool _2119 = _2117 != 0;
    float _2121 = _2081 * _2083;
    if (_1812)
    {
        float _2123 = _2113 ? as_type<float>(_2107) : _1806;
        _1874 = _2123;
    }
    float _2125 = _1874;
    float _2127 = _2085 * _2087;
    int _2129 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 64;
    bool _2131 = _2129 != 0;
    float _2133 = _2081 * _2079;
    int _2135 = int(_1947) + int(_2043);
    float _2137 = floor(_2115);
    int _2139 = ~_1816;
    int _2141 = _2139 + 1;
    float _2143 = in.m_69.y;
    int _2145 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 256;
    bool _2147 = _2145 != 0;
    if (_1820)
    {
        bool _2149 = _1840 > 0.5;
        _1876 = _2149;
    }
    bool _2151 = _1876;
    if (_1820)
    {
        float _2153 = -_1806;
        float _2155 = _2153 + 1.0;
        _1848 = as_type<int>(_2155);
    }
    int _2157 = _1848;
    int _2159 = _2141 * _2135;
    int _2161 = _2159 + _1872;
    if (_2119)
    {
        float _2163 = -_1806;
        float _2165 = _2163 + 1.0;
        _2047 = as_type<int>(_2165);
    }
    int _2167 = _2047;
    bool _2169 = _1808 > 0.5;
    float _2171 = as_type<float>(_2167);
    if (_2131)
    {
        float _2173 = -_1806;
        float _2175 = _2173 + 1.0;
        _2101 = as_type<int>(_2175);
    }
    int _2177 = _2101;
    float _2179 = 0.0;
    if (!_1820)
    {
        _2179 = _1806;
    }
    float _2181 = _2179;
    float _2183 = floor(_2127);
    float _2185 = _2181;
    if (_1820)
    {
        float _2187 = _2151 ? as_type<float>(_2157) : _1806;
        _2185 = _2187;
    }
    float _2189 = _2185;
    float _2191 = 0.0;
    if (!_2119)
    {
        _2191 = _1806;
    }
    float _2193 = _2191;
    int _2195 = 0;
    float _2197 = _2193;
    if (_2147)
    {
        float _2199 = -_1806;
        float _2201 = _2199 + 1.0;
        _2195 = as_type<int>(_2201);
    }
    int _2203 = _2195;
    bool _2205 = uint(_2161) >= uint(_1816);
    float _2207 = _1918 * _160;
    if (_2119)
    {
        float _2209 = _2169 ? as_type<float>(_2167) : _1806;
        _2197 = _2209;
    }
    float _2211 = _2197;
    float _2213 = floor(_2121);
    if (!_2131)
    {
        _2171 = _1806;
    }
    float _2215 = _2171;
    float _2217 = _2215;
    if (_2131)
    {
        float _2219 = _2169 ? as_type<float>(_2177) : _1806;
        _2217 = _2219;
    }
    float _2221 = _2217;
    bool _2223 = !_2205;
    int _2225 = _2223 ? 0 : (-1);
    if (_2147)
    {
        float _2227 = _2169 ? as_type<float>(_2203) : _1806;
        _1850 = _2227;
    }
    float _2229 = _1850;
    float _2231 = floor(_2133);
    int _2233 = ~_2135;
    int _2235 = _2233 + _2225;
    int _2237 = _2235 + 1;
    float _2239 = _2023 * _160;
    int _2241 = as_type<int>(_2017) + (-2);
    float _2243 = -_2137;
    float _2245 = _2115 + _2243;
    float _2247 = float(uint(_2033));
    int _2249 = _1816 * _2237;
    int _2251 = _2249 + _1872;
    bool _2253 = _1816 == 0;
    float _2255 = trunc(_2207);
    int _2257 = int(_2255);
    float _2259 = -_2183;
    float _2261 = _2127 + _2259;
    float _2263 = as_type<float>(_2241) * _2247;
    float _2265 = -_2213;
    float _2267 = _2121 + _2265;
    int _2269 = ~_2037;
    int _2271 = _2269 + 1;
    int _2273 = _2271 + 1;
    bool _2275 = !_2253;
    int _2277 = _2275 ? _2251 : (-1);
    float _2279 = _2267 * _1836;
    float _2281 = trunc(_2263);
    float _2283 = precise::max(_2281, 0.0);
    uint _2285 = uint(_2283);
    int _2287 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4096;
    bool _2289 = _2287 != 0;
    float _2291 = -_2231;
    float _2293 = _2133 + _2291;
    int _2295 = _2277 * _2273;
    bool _2297 = !_2289;
    int _2299 = _2297 ? 0 : 1;
    int _2301 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 16;
    bool _2303 = _2301 != 0;
    int _2305 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 32;
    bool _2307 = _2305 != 0;
    int _2309 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 64;
    bool _2311 = _2309 != 0;
    float _2313 = trunc(_2239);
    int _2315 = int(_2313);
    int _2317 = abs(_2299);
    int _2319 = ~_1951;
    int _2321 = _2319 + 1;
    bool _2323 = !_2307;
    int _2325 = _2323 ? 0 : 1;
    int _2327 = as_type<int>(_2021) + (-2);
    float _2329 = trunc(_2279);
    int _2331 = int(_2329);
    float _2333 = float(uint(_2257));
    int _2335 = abs(_2325);
    int _2337 = _2321 * int(_2285);
    int _2339 = _2337 + _2033;
    int _2341 = _1816 + (-1);
    float _2343 = as_type<float>(_2327) * _2333;
    int _2345 = as_type<int>(_2025) + (-2);
    float _2347 = float(uint(_2339));
    int _2349 = _2037 * _2341;
    int _2351 = _2349 + _2295;
    float _2353 = float(uint(_2315));
    float _2355 = trunc(_2343);
    float _2357 = precise::max(_2355, 0.0);
    uint _2359 = uint(_2357);
    bool _2361 = !_2303;
    int _2363 = _2361 ? 0 : 1;
    int _2365 = _2351 * _2335;
    float _2367 = as_type<float>(_2241) * _2347;
    float _2369 = as_type<float>(_2345) * _2353;
    int _2371 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 128;
    bool _2373 = _2371 != 0;
    int _2375 = _2331 * _2317;
    int _2377 = _2375 + _1872;
    bool _2379 = !_2311;
    int _2381 = _2379 ? 0 : 1;
    float _2383 = trunc(_2367);
    float _2385 = precise::max(_2383, 0.0);
    uint _2387 = uint(_2385);
    int _2389 = abs(_2363);
    bool _2391 = !_2373;
    int _2393 = _2391 ? 0 : 1;
    int _2395 = abs(_2381);
    float _2397 = trunc(_2369);
    float _2399 = precise::max(_2397, 0.0);
    uint _2401 = uint(_2399);
    int _2403 = ~_1973;
    int _2405 = _2403 + 1;
    int _2407 = abs(_2393);
    int _2409 = _2029 * _2389;
    int _2411 = _2409 + _2365;
    int _2413 = _2405 * int(_2359);
    int _2415 = _2413 + _2257;
    int _2417 = ~_1983;
    int _2419 = _2417 + 1;
    float _2421 = _1928 * _160;
    int _2423 = int(_2285) + int(_2387);
    int _2425 = _2377 * _2395;
    int _2427 = _2425 + _2411;
    float _2429 = float(uint(_2415));
    float _2431 = float(_2033);
    int _2433 = _2331 * _2407;
    int _2435 = _2433 + _2427;
    float _2437 = float(_1983);
    float _2439 = as_type<float>(_2327) * _2429;
    int _2441 = _2419 * int(_2401);
    int _2443 = _2441 + _2315;
    float _2445 = float(_2257);
    float _2447 = float(uint(_2435));
    float _2449 = trunc(_2439);
    float _2451 = precise::max(_2449, 0.0);
    uint _2453 = uint(_2451);
    float _2455 = float(uint(_2443));
    float _2457 = float(_1951);
    int _2459 = ~_1951;
    int _2461 = _2459 + 1;
    float _2463 = as_type<float>(_2345) * _2455;
    float _2465 = float(_1973);
    float _2467 = _2457 * _2245;
    float _2469 = as_type<float>(_1904) * _2447;
    float _2471 = trunc(_2463);
    float _2473 = precise::max(_2471, 0.0);
    uint _2475 = uint(_2473);
    int _2477 = ~_1816;
    int _2479 = _2477 + 1;
    float _2481 = _2457 * _2421;
    bool _2483 = _2431 >= _2457;
    bool _2485 = isnan(_2431);
    bool _2487 = _2483 || _2485;
    bool _2489 = isnan(_2457);
    bool _2491 = _2487 || _2489;
    float _2493 = float(_2491);
    float _2495 = _2465 * _2261;
    bool _2497 = _2445 >= _2465;
    bool _2499 = isnan(_2445);
    bool _2501 = _2497 || _2499;
    bool _2503 = isnan(_2465);
    bool _2505 = _2501 || _2503;
    float _2507 = float(_2505);
    float _2509 = _2465 * _2421;
    float _2511 = _2437 * _2421;
    float _2513 = trunc(_2469);
    float _2515 = precise::max(_2513, 0.0);
    uint _2517 = uint(_2515);
    float _2519 = float(_2315);
    float _2521 = _2437 * _2293;
    bool _2523 = _2519 >= _2437;
    bool _2525 = isnan(_2519);
    bool _2527 = _2523 || _2525;
    bool _2529 = isnan(_2437);
    bool _2531 = _2527 || _2529;
    float _2533 = float(_2531);
    int _2535 = _2461 * _2423;
    int _2537 = _2535 + _2033;
    int _2539 = ~_1973;
    int _2541 = _2539 + 1;
    float _2543 = trunc(_2493);
    int _2545 = int(_2543);
    int _2547 = int(_2359) + int(_2453);
    bool _2549 = uint(_2537) >= uint(_1951);
    int _2551 = int(_2401) + int(_2475);
    int _2553 = _2479 * int(_2517);
    int _2555 = _2553 + _2435;
    int _2557 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8192;
    bool _2559 = _2557 != 0;
    int _2561 = _2541 * _2547;
    int _2563 = _2561 + _2257;
    int _2565 = ~_1983;
    int _2567 = _2565 + 1;
    float _2569 = trunc(_2467);
    int _2571 = int(_2569);
    float _2573 = float(uint(_2555));
    int _2575 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 256;
    bool _2577 = _2575 != 0;
    int _2579 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 512;
    bool _2581 = _2579 != 0;
    int _2583 = _2567 * _2551;
    int _2585 = _2583 + _2315;
    bool _2587 = uint(_2563) >= uint(_1973);
    float _2589 = as_type<float>(_1904) * _2573;
    bool _2591 = !_2559;
    int _2593 = _2591 ? 0 : 1;
    float _2595 = trunc(_2507);
    int _2597 = int(_2595);
    bool _2599 = !_2549;
    int _2601 = _2599 ? 0 : (-1);
    bool _2603 = !_2581;
    int _2605 = _2603 ? 0 : 1;
    int _2607 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1024;
    bool _2609 = _2607 != 0;
    int _2611 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 2048;
    bool _2613 = _2611 != 0;
    bool _2615 = !_2577;
    int _2617 = _2615 ? 0 : 1;
    float _2619 = trunc(_2589);
    float _2621 = precise::max(_2619, 0.0);
    uint _2623 = uint(_2621);
    bool _2625 = uint(_2585) >= uint(_1983);
    int _2627 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 16384;
    bool _2629 = _2627 != 0;
    bool _2631 = !_2587;
    int _2633 = _2631 ? 0 : (-1);
    int _2635 = ~_2423;
    int _2637 = _2635 + _2601;
    int _2639 = _2637 + 1;
    float _2641 = trunc(_2511);
    int _2643 = int(_2641);
    int _2645 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 4096;
    bool _2647 = _2645 != 0;
    int _2649 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 8192;
    bool _2651 = _2649 != 0;
    bool _2653 = !_2629;
    int _2655 = _2653 ? 0 : 1;
    int _2657 = _1951 * _2639;
    int _2659 = _2657 + _2033;
    bool _2661 = !_2609;
    int _2663 = _2661 ? 0 : 1;
    bool _2665 = !_2613;
    int _2667 = _2665 ? 0 : 1;
    float _2669 = trunc(_2521);
    int _2671 = int(_2669);
    int _2673 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 16384;
    bool _2675 = _2673 != 0;
    bool _2677 = _1951 == 0;
    int _2679 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 32768;
    bool _2681 = _2679 != 0;
    int _2683 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 32768;
    bool _2685 = _2683 != 0;
    int _2687 = abs(_2593);
    bool _2689 = !_2675;
    int _2691 = _2689 ? 0 : 1;
    bool _2693 = !_2625;
    int _2695 = _2693 ? 0 : (-1);
    int _2697 = _2571 * _2687;
    int _2699 = _2697 + _2033;
    int _2701 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 65536;
    bool _2703 = _2701 != 0;
    int _2705 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 131072;
    bool _2707 = _2705 != 0;
    int _2709 = ~_2547;
    int _2711 = _2709 + _2633;
    int _2713 = _2711 + 1;
    int _2715 = ~_2545;
    int _2717 = _2715 + 1;
    int _2719 = _2717 + 1;
    bool _2721 = !_2677;
    int _2723 = _2721 ? _2659 : (-1);
    int _2725 = _1973 * _2713;
    int _2727 = _2725 + _2257;
    int _2729 = int(_2517) + int(_2623);
    float _2731 = trunc(_2533);
    int _2733 = int(_2731);
    int _2735 = ~_1816;
    int _2737 = _2735 + 1;
    int _2739 = _2719 * _2723;
    bool _2741 = !_2707;
    int _2743 = _2741 ? 0 : 1;
    bool _2745 = _1973 == 0;
    int _2747 = _2737 * _2729;
    int _2749 = _2747 + _2435;
    int _2751 = _1951 + (-1);
    int _2753 = ~_2597;
    int _2755 = _2753 + 1;
    int _2757 = _2755 + 1;
    bool _2759 = !_2745;
    int _2761 = _2759 ? _2727 : (-1);
    int _2763 = _2545 * _2751;
    int _2765 = _2763 + _2739;
    int _2767 = ~_2551;
    int _2769 = _2767 + _2695;
    int _2771 = _2769 + 1;
    float _2773 = trunc(_2481);
    int _2775 = int(_2773);
    bool _2777 = !_2685;
    int _2779 = _2777 ? 0 : 1;
    int _2781 = _2757 * _2761;
    int _2783 = abs(_2605);
    int _2785 = _1983 * _2771;
    int _2787 = _2785 + _2315;
    bool _2789 = uint(_2749) >= uint(_1816);
    int _2791 = abs(_2617);
    float _2793 = trunc(_2495);
    int _2795 = int(_2793);
    bool _2797 = !_2681;
    int _2799 = _2797 ? 0 : 1;
    bool _2801 = !_2789;
    int _2803 = _2801 ? 0 : (-1);
    int _2805 = _2765 * _2783;
    bool _2807 = !_2647;
    int _2809 = _2807 ? 0 : 1;
    float _2811 = trunc(_2509);
    int _2813 = int(_2811);
    int _2815 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 262144;
    bool _2817 = _2815 != 0;
    int _2819 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 524288;
    bool _2821 = _2819 != 0;
    bool _2823 = _1983 == 0;
    int _2825 = abs(_2663);
    int _2827 = _1973 + (-1);
    int _2829 = ~_2733;
    int _2831 = _2829 + 1;
    int _2833 = _2831 + 1;
    int _2835 = _2597 * _2827;
    int _2837 = _2835 + _2781;
    bool _2839 = !_2823;
    int _2841 = _2839 ? _2787 : (-1);
    int _2843 = _2775 * _2791;
    int _2845 = _2843 + _2805;
    float _2847 = _2083 * 2.0;
    int _2849 = abs(_2667);
    int _2851 = _2833 * _2841;
    int _2853 = abs(_2655);
    int _2855 = _2699 * _2825;
    int _2857 = _2855 + _2845;
    float _2859 = _1808 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    bool _2861 = !_2651;
    int _2863 = _2861 ? 0 : 1;
    int _2865 = abs(_2809);
    int _2867 = _2571 * _2849;
    int _2869 = _2867 + _2857;
    int _2871 = abs(_2863);
    float _2873 = float(uint(_2869));
    int _2875 = _2837 * _2871;
    int _2877 = abs(_2691);
    float _2879 = as_type<float>(_2241) * _2873;
    int _2881 = abs(_2799);
    int _2883 = _2813 * _2865;
    int _2885 = _2883 + _2875;
    float _2887 = trunc(_2879);
    float _2889 = precise::max(_2887, 0.0);
    uint _2891 = uint(_2889);
    int _2893 = _2795 * _2853;
    int _2895 = _2893 + _2257;
    int _2897 = abs(_2779);
    int _2899 = _2895 * _2877;
    int _2901 = _2899 + _2885;
    bool _2903 = !_2703;
    int _2905 = _2903 ? 0 : 1;
    int _2907 = _1983 + (-1);
    int _2909 = _2795 * _2881;
    int _2911 = _2909 + _2901;
    int _2913 = abs(_2743);
    int _2915 = ~_1951;
    int _2917 = _2915 + 1;
    int _2919 = _2733 * _2907;
    int _2921 = _2919 + _2851;
    int _2923 = abs(_2905);
    int _2925 = _2917 * int(_2891);
    int _2927 = _2925 + _2869;
    bool _2929 = !_2817;
    int _2931 = _2929 ? 0 : 1;
    int _2933 = _2921 * _2913;
    int _2935 = _2671 * _2897;
    int _2937 = _2935 + _2315;
    int _2939 = ~_2729;
    int _2941 = _2939 + _2803;
    int _2943 = _2941 + 1;
    float _2945 = float(uint(_2911));
    int _2947 = _2643 * _2923;
    int _2949 = _2947 + _2933;
    float _2951 = float(uint(_2927));
    int _2953 = _1816 * _2943;
    int _2955 = _2953 + _2435;
    bool _2957 = !_2821;
    int _2959 = _2957 ? 0 : 1;
    float _2961 = as_type<float>(_2327) * _2945;
    int _2963 = abs(_2931);
    float _2965 = as_type<float>(_2241) * _2951;
    int _2967 = abs(_2959);
    float _2969 = trunc(_2961);
    float _2971 = precise::max(_2969, 0.0);
    uint _2973 = uint(_2971);
    bool _2975 = _1816 == 0;
    int _2977 = _2937 * _2963;
    int _2979 = _2977 + _2949;
    float _2981 = -_2143;
    float _2983 = _2981 + 1.0;
    bool _2985 = _1957 > 0.5;
    float _2987 = trunc(_2965);
    float _2989 = precise::max(_2987, 0.0);
    uint _2991 = uint(_2989);
    bool _2993 = !_2975;
    int _2995 = _2993 ? _2955 : (-1);
    int _2997 = _2671 * _2967;
    int _2999 = _2997 + _2979;
    int _3001 = _2985 ? as_type<int>(_2983) : as_type<int>(_2143);
    int _3003 = _2995 & 3;
    bool _3005 = _3003 != 0;
    int _3007 = _2995 & 3;
    bool _3009 = _3007 != 0;
    int _3011 = ~_1973;
    int _3013 = _3011 + 1;
    float _3015 = float(uint(_2999));
    int _3017 = _3005 ? 0 : 1;
    int _3019 = _3013 * int(_2973);
    int _3021 = _3019 + _2911;
    bool _3023 = uint(_3007) > 1u;
    float _3025 = as_type<float>(_2345) * _3015;
    int _3027 = int(_2891) + int(_2991);
    int _3029 = ~_1951;
    int _3031 = _3029 + 1;
    float _3033 = trunc(_3025);
    float _3035 = precise::max(_3033, 0.0);
    uint _3037 = uint(_3035);
    float _3039 = float(uint(_3021));
    int _3041 = ~_3017;
    int _3043 = _3041 + 1;
    int _3045 = _3043 + 1;
    float _3047 = as_type<float>(_2327) * _3039;
    int _3049 = ~_1983;
    int _3051 = _3049 + 1;
    int _3053 = _3031 * _3027;
    int _3055 = _3053 + _2869;
    int _3057 = _3045;
    if (!_3023)
    {
        int _3059 = ~_3017;
        int _3061 = _3059 + 1;
        _3057 = _3061;
    }
    int _3063 = _3057;
    float _3065 = trunc(_3047);
    float _3067 = precise::max(_3065, 0.0);
    uint _3069 = uint(_3067);
    bool _3071 = uint(_3007) >= 2u;
    bool _3073 = _1808 > 0.5;
    int _3075 = _3071 ? 0 : 1;
    int _3077 = _3051 * int(_3037);
    int _3079 = _3077 + _2999;
    bool _3081 = uint(_3055) >= uint(_1951);
    int _3083 = ~_3075;
    int _3085 = _3083 + 1;
    int _3087 = _3085 + 1;
    bool _3089 = !_3081;
    int _3091 = _3089 ? 0 : (-1);
    bool _3093 = _3007 != 3;
    float _3095 = float(uint(_3079));
    int _3097 = ~_1973;
    int _3099 = _3097 + 1;
    int _3101 = int(_2973) + int(_3069);
    float _3103 = as_type<float>(_2345) * _3095;
    int _3105 = ~_3027;
    int _3107 = _3105 + _3091;
    int _3109 = _3107 + 1;
    float _3111 = trunc(_3103);
    float _3113 = precise::max(_3111, 0.0);
    uint _3115 = uint(_3113);
    int _3117 = _3099 * _3101;
    int _3119 = _3117 + _2911;
    int _3121 = _3087;
    if (_3093)
    {
        int _3123 = ~_3075;
        int _3125 = _3123 + 1;
        _3121 = _3125;
    }
    int _3127 = _3121;
    int _3129 = _1951 * _3109;
    int _3131 = _3129 + _2869;
    int _3133 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2097152;
    bool _3135 = _3133 != 0;
    float _3137 = -(*spvDescriptorSet0.vp_c9)._m0[184].w;
    float _3139 = _3137 + (*spvDescriptorSet0.vp_c9)._m0[185].w;
    bool _3141 = !_3135;
    int _3143 = _3141 ? 0 : 1;
    bool _3145 = uint(_3119) >= uint(_1973);
    float _3147 = -(*spvDescriptorSet0.vp_c9)._m0[185].w;
    float _3149 = _3147 + (*spvDescriptorSet0.vp_c9)._m0[186].w;
    bool _3151 = !_2677;
    int _3153 = _3151 ? _3131 : (-1);
    float _3155 = 1.0 / _3139;
    bool _3157 = !_3145;
    int _3159 = _3157 ? 0 : (-1);
    int _3161 = _3153 & 3;
    bool _3163 = _3161 != 0;
    int _3165 = _3073 ? as_type<int>(_2983) : as_type<int>(_2143);
    int _3167 = ~_3101;
    int _3169 = _3167 + _3159;
    int _3171 = _3169 + 1;
    float _3173 = 1.0 / _3149;
    bool _3175 = uint(_3161) >= 2u;
    int _3177 = _3163 ? 0 : 1;
    int _3179 = _1973 * _3171;
    int _3181 = _3179 + _2911;
    bool _3183 = _3161 != 3;
    int _3185 = _3175 ? 0 : 1;
    int _3187 = int(_3037) + int(_3115);
    bool _3189 = uint(_3161) > 1u;
    int _3191 = ~_1983;
    int _3193 = _3191 + 1;
    int _3195 = ~_3185;
    int _3197 = _3195 + 1;
    int _3199 = _3197 + 1;
    bool _3201 = !_2745;
    int _3203 = _3201 ? _3181 : (-1);
    int _3205 = _3193 * _3187;
    int _3207 = _3205 + _2999;
    int _3209 = _3199;
    if (_3183)
    {
        int _3211 = ~_3185;
        int _3213 = _3211 + 1;
        _3209 = _3213;
    }
    int _3215 = _3209;
    int _3217 = ~_3177;
    int _3219 = _3217 + 1;
    int _3221 = _3219 + 1;
    bool _3223 = uint(_3207) >= uint(_1983);
    int _3225 = _3221;
    if (!_3189)
    {
        int _3227 = ~_3177;
        int _3229 = _3227 + 1;
        _3225 = _3229;
    }
    int _3231 = _3225;
    int _3233 = _3203 & 3;
    bool _3235 = _3233 != 0;
    bool _3237 = !_3223;
    int _3239 = _3237 ? 0 : (-1);
    int _3241 = _3235 ? 0 : 1;
    bool _3243 = uint(_3233) >= 2u;
    bool _3245 = _3233 != 3;
    int _3247 = ~_3187;
    int _3249 = _3247 + _3239;
    int _3251 = _3249 + 1;
    int _3253 = _3243 ? 0 : 1;
    bool _3255 = uint(_3233) > 1u;
    int _3257 = _1983 * _3251;
    int _3259 = _3257 + _2999;
    int _3261 = ~_3253;
    int _3263 = _3261 + 1;
    int _3265 = _3263 + 1;
    int _3267 = ~_3241;
    int _3269 = _3267 + 1;
    int _3271 = _3269 + 1;
    bool _3273 = !_2823;
    int _3275 = _3273 ? _3259 : (-1);
    int _3277 = _3265;
    int _3279 = _3271;
    if (_3245)
    {
        int _3281 = ~_3253;
        int _3283 = _3281 + 1;
        _3277 = _3283;
    }
    int _3285 = _3277;
    int _3287 = _3275 & 3;
    bool _3289 = _3287 != 0;
    if (!_3255)
    {
        int _3291 = ~_3241;
        int _3293 = _3291 + 1;
        _3279 = _3293;
    }
    int _3295 = _3279;
    bool _3297 = uint(_3287) >= 2u;
    float _3299 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    int _3301 = _3289 ? 0 : 1;
    int _3303 = _3297 ? 0 : 1;
    float _3305 = fma(_2859, -2.0, _3299);
    bool _3307 = uint(_3287) > 1u;
    bool _3309 = _3287 != 3;
    float _3311 = fma(_160, (*spvDescriptorSet0.vp_c9)._m0[76].y, _3305);
    int _3313 = ~_3301;
    int _3315 = _3313 + 1;
    int _3317 = _3315 + 1;
    int _3319 = ~_3303;
    int _3321 = _3319 + 1;
    int _3323 = _3321 + 1;
    float _3325 = -(*spvDescriptorSet0.vp_c9)._m0[183].w;
    float _3327 = _3325 + (*spvDescriptorSet0.vp_c9)._m0[184].w;
    int _3329 = _3317;
    int _3331 = _3323;
    if (!_3307)
    {
        int _3333 = ~_3301;
        int _3335 = _3333 + 1;
        _3329 = _3335;
    }
    int _3337 = _3329;
    float _3339 = -(*spvDescriptorSet0.vp_c9)._m0[187].w;
    float _3341 = _3339 + (*spvDescriptorSet0.vp_c9)._m0[188].w;
    int _3343 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8388608;
    bool _3345 = _3343 != 0;
    float _3347 = -(*spvDescriptorSet0.vp_c9)._m0[188].w;
    float _3349 = _3347 + (*spvDescriptorSet0.vp_c9)._m0[189].w;
    if (_3309)
    {
        int _3351 = ~_3303;
        int _3353 = _3351 + 1;
        _3331 = _3353;
    }
    int _3355 = _3331;
    float _3357 = 1.0 / _3327;
    bool _3359 = !_3345;
    int _3361 = _3359 ? 0 : 1;
    float _3363 = in.m_46.x;
    float _3365 = in.m_46.y;
    float _3367 = in.m_46.z;
    int _3369 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4194304;
    bool _3371 = _3369 != 0;
    int _3373 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _3375 = _3373 != 0;
    bool _3377 = !_3371;
    int _3379 = _3377 ? 0 : 1;
    float _3381 = 1.0 / _3341;
    float _3383 = _3375 ? as_type<float>(_3165) : _2143;
    int _3385 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _3387 = _3385 != 0;
    bool _3389 = _2089 > 0.5;
    float _3391 = _3387 ? as_type<float>(_3001) : _2143;
    float _3393 = 1.0 / _3349;
    int _3395 = _3389 ? as_type<int>(_2983) : as_type<int>(_2143);
    int _3397 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 32;
    bool _3399 = _3397 != 0;
    int _3401 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 128;
    bool _3403 = _3401 != 0;
    float _3405 = _3399 ? as_type<float>(_3395) : _2143;
    float _3407 = _3403 ? as_type<float>(_3395) : _2143;
    float _3409 = _3365 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    int _3411 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 16777216;
    bool _3413 = _3411 != 0;
    float _3415 = _3365 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    int _3417 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 512;
    bool _3419 = _3417 != 0;
    float _3421 = _3365 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _3423 = floor(_2847);
    float _3425 = fma(_3363, (*spvDescriptorSet0.vp_c10)._m0[4].x, _3409);
    float _3427 = fma(_3363, (*spvDescriptorSet0.vp_c10)._m0[5].x, _3415);
    float _3429 = -(*spvDescriptorSet0.vp_c9)._m0[186].w;
    float _3431 = _3429 + (*spvDescriptorSet0.vp_c9)._m0[187].w;
    float _3433 = fma(_3363, (*spvDescriptorSet0.vp_c10)._m0[6].x, _3421);
    float _3435 = -(*spvDescriptorSet0.vp_c9)._m0[183].x;
    float _3437 = (*spvDescriptorSet0.vp_c9)._m0[184].x + _3435;
    float _3439 = -(*spvDescriptorSet0.vp_c9)._m0[184].x;
    float _3441 = _3439 + (*spvDescriptorSet0.vp_c9)._m0[185].x;
    float _3443 = -(*spvDescriptorSet0.vp_c9)._m0[185].x;
    float _3445 = (*spvDescriptorSet0.vp_c9)._m0[186].x + _3443;
    float _3447 = _3419 ? as_type<float>(_3395) : _2143;
    float _3449 = 1.0 / _3431;
    float _3451 = _3441 * _3155;
    float _3453 = -(*spvDescriptorSet0.vp_c9)._m0[189].w;
    float _3455 = _3453 + (*spvDescriptorSet0.vp_c9)._m0[190].w;
    bool _3457 = _3423 >= 0.0;
    bool _3459 = isnan(_3423);
    bool _3461 = _3457 || _3459;
    bool _3463 = isnan(0.0);
    bool _3465 = _3461 || _3463;
    float _3467 = _3445 * _3173;
    float _3469 = _1808 * 2.0;
    int _3471 = _3465 ? 0 : 1;
    float _3473 = 1.0 / _3455;
    bool _3475 = _3423 > 0.0;
    float _3477 = -(*spvDescriptorSet0.vp_c9)._m0[187].x;
    float _3479 = (*spvDescriptorSet0.vp_c9)._m0[188].x + _3477;
    float _3481 = -(*spvDescriptorSet0.vp_c9)._m0[188].x;
    float _3483 = _3481 + (*spvDescriptorSet0.vp_c9)._m0[189].x;
    float _3485 = _3437 * _3357;
    float _3487 = -(*spvDescriptorSet0.vp_c9)._m0[186].x;
    float _3489 = _3487 + (*spvDescriptorSet0.vp_c9)._m0[187].x;
    float _3491 = _3479 * _3381;
    float _3493 = floor(_3469);
    float _3495 = _3483 * _3393;
    bool _3497 = _1798 >= (*spvDescriptorSet0.vp_c9)._m0[189].w;
    bool _3499 = isnan(_1798);
    bool _3501 = _3497 || _3499;
    bool _3503 = isnan((*spvDescriptorSet0.vp_c9)._m0[189].w);
    bool _3505 = _3501 || _3503;
    float _3507 = float(_3505);
    float _3509 = _3489 * _3449;
    bool _3511 = _1798 >= (*spvDescriptorSet0.vp_c9)._m0[190].w;
    bool _3513 = isnan(_1798);
    bool _3515 = _3511 || _3513;
    bool _3517 = isnan((*spvDescriptorSet0.vp_c9)._m0[190].w);
    bool _3519 = _3515 || _3517;
    float _3521 = float(_3519);
    float _3523 = -(*spvDescriptorSet0.vp_c9)._m0[189].x;
    float _3525 = (*spvDescriptorSet0.vp_c9)._m0[190].x + _3523;
    int _3527 = ~_3471;
    int _3529 = _3527 + 1;
    int _3531 = _3529 + 1;
    float _3533 = -_3507;
    float _3535 = _3533 + 1.0;
    int _3537 = _3531;
    if (!_3475)
    {
        int _3539 = ~_3471;
        int _3541 = _3539 + 1;
        _3537 = _3541;
    }
    int _3543 = _3537;
    float _3545 = -_3521;
    float _3547 = _3545 + 1.0;
    bool _3549 = _1798 >= (*spvDescriptorSet0.vp_c9)._m0[188].w;
    bool _3551 = isnan(_1798);
    bool _3553 = _3549 || _3551;
    bool _3555 = isnan((*spvDescriptorSet0.vp_c9)._m0[188].w);
    bool _3557 = _3553 || _3555;
    float _3559 = float(_3557);
    float _3561 = _3525 * _3473;
    bool _3563 = _1798 >= (*spvDescriptorSet0.vp_c9)._m0[187].w;
    bool _3565 = isnan(_1798);
    bool _3567 = _3563 || _3565;
    bool _3569 = isnan((*spvDescriptorSet0.vp_c9)._m0[187].w);
    bool _3571 = _3567 || _3569;
    float _3573 = float(_3571);
    float _3575 = _3507 * _3547;
    float _3577 = fma(_3367, (*spvDescriptorSet0.vp_c10)._m0[5].z, _3427);
    float _3579 = _3559 * _3535;
    float _3581 = -_3559;
    float _3583 = _3581 + 1.0;
    float _3585 = fma(_3367, (*spvDescriptorSet0.vp_c10)._m0[4].z, _3425);
    float _3587 = fma(_3367, (*spvDescriptorSet0.vp_c10)._m0[6].z, _3433);
    bool _3589 = !_3413;
    int _3591 = _3589 ? 0 : 1;
    float _3593 = -(*spvDescriptorSet0.vp_c9)._m0[183].w;
    float _3595 = _1798 + _3593;
    bool _3597 = _1798 >= (*spvDescriptorSet0.vp_c9)._m0[186].w;
    bool _3599 = isnan(_1798);
    bool _3601 = _3597 || _3599;
    bool _3603 = isnan((*spvDescriptorSet0.vp_c9)._m0[186].w);
    bool _3605 = _3601 || _3603;
    float _3607 = float(_3605);
    float _3609 = -_3573;
    float _3611 = _3609 + 1.0;
    bool _3613 = _3493 > 0.0;
    float _3615 = fma(_3485, _3595, (*spvDescriptorSet0.vp_c9)._m0[183].x);
    bool _3617 = _3493 >= 0.0;
    bool _3619 = isnan(_3493);
    bool _3621 = _3617 || _3619;
    bool _3623 = isnan(0.0);
    bool _3625 = _3621 || _3623;
    float _3627 = _3573 * _3583;
    float _3629 = -(*spvDescriptorSet0.vp_c9)._m0[184].w;
    float _3631 = _1798 + _3629;
    bool _3633 = _1798 >= (*spvDescriptorSet0.vp_c9)._m0[185].w;
    bool _3635 = isnan(_1798);
    bool _3637 = _3633 || _3635;
    bool _3639 = isnan((*spvDescriptorSet0.vp_c9)._m0[185].w);
    bool _3641 = _3637 || _3639;
    float _3643 = float(_3641);
    float _3645 = -_3607;
    float _3647 = _3645 + 1.0;
    bool _3649 = _1798 >= (*spvDescriptorSet0.vp_c9)._m0[184].w;
    bool _3651 = isnan(_1798);
    bool _3653 = _3649 || _3651;
    bool _3655 = isnan((*spvDescriptorSet0.vp_c9)._m0[184].w);
    bool _3657 = _3653 || _3655;
    float _3659 = float(_3657);
    float _3661 = fma(_3451, _3631, (*spvDescriptorSet0.vp_c9)._m0[184].x);
    float _3663 = _3607 * _3611;
    float _3665 = -_3643;
    float _3667 = _3665 + 1.0;
    float _3669 = -(*spvDescriptorSet0.vp_c9)._m0[185].w;
    float _3671 = _1798 + _3669;
    float _3673 = _3643 * _3647;
    bool _3675 = _1798 >= (*spvDescriptorSet0.vp_c9)._m0[183].w;
    bool _3677 = isnan(_1798);
    bool _3679 = _3675 || _3677;
    bool _3681 = isnan((*spvDescriptorSet0.vp_c9)._m0[183].w);
    bool _3683 = _3679 || _3681;
    float _3685 = float(_3683);
    float _3687 = -_3659;
    float _3689 = _3687 + 1.0;
    float _3691 = _3659 * _3667;
    float _3693 = fma(_3467, _3671, (*spvDescriptorSet0.vp_c9)._m0[185].x);
    float _3695 = -(*spvDescriptorSet0.vp_c9)._m0[187].w;
    float _3697 = _1798 + _3695;
    float _3699 = -(*spvDescriptorSet0.vp_c9)._m0[186].w;
    float _3701 = _1798 + _3699;
    float _3703 = -(*spvDescriptorSet0.vp_c9)._m0[188].w;
    float _3705 = _1798 + _3703;
    float _3707 = _3685 * _3689;
    float _3709 = fma(_3491, _3697, (*spvDescriptorSet0.vp_c9)._m0[187].x);
    float _3711 = fma(_3509, _3701, (*spvDescriptorSet0.vp_c9)._m0[186].x);
    float _3713 = fma(_3495, _3705, (*spvDescriptorSet0.vp_c9)._m0[188].x);
    int _3715 = _3625 ? 0 : 1;
    float _3717 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[100].z;
    float _3719 = _3615 * _3707;
    bool _3721 = _2091 != 1;
    float _3723 = -(*spvDescriptorSet0.vp_c9)._m0[189].w;
    float _3725 = _1798 + _3723;
    float _3727 = float(uint(_2377));
    float _3729 = -_3685;
    float _3731 = _3729 + 1.0;
    float _3733 = float(uint(_2699));
    float _3735 = fma(_3561, _3725, (*spvDescriptorSet0.vp_c9)._m0[189].x);
    float _3737 = float(uint(_2895));
    float _3739 = as_type<float>(_1904) * _3727;
    float _3741 = fma(_3731, (*spvDescriptorSet0.vp_c9)._m0[183].x, _3719);
    float _3743 = as_type<float>(_2241) * _3733;
    int _3745 = ~_3715;
    int _3747 = _3745 + 1;
    int _3749 = _3747 + 1;
    float _3751 = trunc(_3739);
    float _3753 = precise::max(_3751, 0.0);
    uint _3755 = uint(_3753);
    float _3757 = as_type<float>(_2327) * _3737;
    int _3759 = _3749;
    float _3761 = _3733;
    float _3763 = _3731;
    float _3765 = _3741;
    if (!_3613)
    {
        int _3767 = ~_3715;
        int _3769 = _3767 + 1;
        _3759 = _3769;
    }
    int _3771 = _3759;
    float _3773 = _3717 * (*spvDescriptorSet0.vp_c9)._m0[100].x;
    float _3775 = fma(_3661, _3691, _3741);
    float _3777 = float(uint(_2937));
    float _3779 = _3577 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _3781 = fma(_3773, _2229, -0.5);
    float _3783 = trunc(_3743);
    float _3785 = precise::max(_3783, 0.0);
    uint _3787 = uint(_3785);
    int _3789 = ~_1816;
    int _3791 = _3789 + 1;
    float _3793 = as_type<float>(_2345) * _3777;
    int _3795 = ~_1951;
    int _3797 = _3795 + 1;
    float _3799 = fma(_3693, _3673, _3775);
    int _3801 = ~_1973;
    int _3803 = _3801 + 1;
    float _3805 = _3585 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    bool _3807 = _2093 != 2;
    float _3809 = trunc(_3757);
    float _3811 = precise::max(_3809, 0.0);
    uint _3813 = uint(_3811);
    float _3815 = _3587 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _3817 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    bool _3819 = !_3721;
    float _3821 = _3819 ? as_type<float>(_2095) : as_type<float>(_2097);
    int _3823 = _3797 * int(_3787);
    int _3825 = _3823 + _2699;
    float _3827 = trunc(_3793);
    float _3829 = precise::max(_3827, 0.0);
    uint _3831 = uint(_3829);
    int _3833 = _3791 * int(_3755);
    int _3835 = _3833 + _2377;
    float _3837 = _2083 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    float _3839 = (*spvDescriptorSet0.vp_c9)._m0[93].z + (*spvDescriptorSet0.vp_c9)._m0[93].x;
    float _3841 = float(uint(_3825));
    float _3843 = (*spvDescriptorSet0.vp_c9)._m0[93].w + (*spvDescriptorSet0.vp_c9)._m0[93].y;
    float _3845 = float(uint(_3835));
    int _3847 = _3803 * int(_3813);
    int _3849 = _3847 + _2895;
    float _3851 = -_3817;
    float _3853 = fma(_3837, 2.0, _3851);
    float _3855 = as_type<float>(_2241) * _3841;
    int _3857 = ~_1983;
    int _3859 = _3857 + 1;
    float _3861 = as_type<float>(_1904) * _3845;
    float _3863 = float(uint(_3849));
    float _3865 = fma(as_type<float>(_2097), (*spvDescriptorSet0.vp_c9)._m0[93].z, _3839);
    float _3867 = as_type<float>(_2097) * (*spvDescriptorSet0.vp_c9)._m0[92].x;
    bool _3869 = !_3721;
    float _3871 = _3869 ? as_type<float>(_2099) : as_type<float>(_2095);
    int _3873 = _3859 * int(_3831);
    int _3875 = _3873 + _2937;
    float _3877 = as_type<float>(_2327) * _3863;
    float _3879 = trunc(_3861);
    float _3881 = precise::max(_3879, 0.0);
    uint _3883 = uint(_3881);
    float _3885 = fma(as_type<float>(_2095), (*spvDescriptorSet0.vp_c9)._m0[93].w, _3843);
    float _3887 = as_type<float>(_2095) * (*spvDescriptorSet0.vp_c9)._m0[92].y;
    float _3889 = float(uint(_3875));
    float _3891 = fma(_160, (*spvDescriptorSet0.vp_c9)._m0[92].z, _3865);
    float _3893 = fma(_160, (*spvDescriptorSet0.vp_c9)._m0[92].w, _3885);
    float _3895 = trunc(_3855);
    float _3897 = precise::max(_3895, 0.0);
    uint _3899 = uint(_3897);
    float _3901 = as_type<float>(_2345) * _3889;
    float _3903 = (*spvDescriptorSet0.vp_c9)._m0[92].x + (*spvDescriptorSet0.vp_c9)._m0[91].z;
    float _3905 = _3717;
    float _3907 = _3867;
    if (!_3721)
    {
        _3905 = _2089;
    }
    float _3909 = _3905;
    float _3911 = (*spvDescriptorSet0.vp_c9)._m0[92].y + (*spvDescriptorSet0.vp_c9)._m0[91].w;
    float _3913 = _3909;
    if (_3721)
    {
        _3913 = _1808;
    }
    float _3915 = _3913;
    float _3917 = -_3903;
    float _3919 = fma(_3867, 2.0, _3917);
    if (_3807)
    {
        _3907 = _2083;
    }
    float _3921 = _3907;
    float _3923 = trunc(_3877);
    float _3925 = precise::max(_3923, 0.0);
    uint _3927 = uint(_3925);
    float _3929 = fma(_3711, _3663, _3799);
    int _3931 = ~_1816;
    int _3933 = _3931 + 1;
    float _3935 = fma(_3887, -2.0, _3911);
    int _3937 = int(_3755) + int(_3883);
    float _3939 = fma(_3709, _3627, _3929);
    float _3941 = -_160;
    float _3943 = fma(_3941, (*spvDescriptorSet0.vp_c9)._m0[76].x, _3853);
    int _3945 = int(_3787) + int(_3899);
    float _3947 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[100].w;
    int _3949 = ~_1951;
    int _3951 = _3949 + 1;
    int _3953 = _3933 * _3937;
    int _3955 = _3953 + _2377;
    float _3957 = as_type<float>(_3933);
    float _3959 = _3921;
    if (_3807)
    {
        _3957 = _1808;
    }
    float _3961 = _3957;
    float _3963 = fma(_3713, _3579, _3939);
    float _3965 = _3961;
    if (!_3807)
    {
        _3959 = _2089;
    }
    float _3967 = _3959;
    int _3969 = _3951 * _3945;
    int _3971 = _3969 + _2699;
    if (!_3807)
    {
        _3965 = _2083;
    }
    float _3973 = _3965;
    float _3975 = trunc(_3901);
    float _3977 = precise::max(_3975, 0.0);
    uint _3979 = uint(_3977);
    bool _3981 = uint(_3955) >= uint(_1816);
    float _3983 = _1808 + _2083;
    int _3985 = int(_3813) + int(_3927);
    float _3987 = _3967 * (*spvDescriptorSet0.vp_c9)._m0[87].x;
    int _3989 = ~_1973;
    int _3991 = _3989 + 1;
    float _3993 = _3983 + (-1.0);
    bool _3995 = !_3981;
    int _3997 = _3995 ? 0 : (-1);
    float _3999 = _3973 * (*spvDescriptorSet0.vp_c9)._m0[87].y;
    bool _4001 = uint(_3971) >= uint(_1951);
    int _4003 = _3991 * _3985;
    int _4005 = _4003 + _2895;
    float _4007 = fma(_3735, _3575, _3963);
    if (!_3721)
    {
        _3761 = _1808;
    }
    float _4009 = _3761;
    float _4011 = -_160;
    float _4013 = fma(_4011, (*spvDescriptorSet0.vp_c9)._m0[91].x, _3919);
    float _4015 = _4009;
    if (!_3721)
    {
        _3763 = _1808;
    }
    float _4017 = _3763;
    float _4019 = (*spvDescriptorSet0.vp_c9)._m0[82].y + (*spvDescriptorSet0.vp_c9)._m0[81].w;
    int _4021 = int(_3831) + int(_3979);
    float _4023 = fma(_160, (*spvDescriptorSet0.vp_c9)._m0[91].y, _3935);
    int _4025 = ~_1983;
    int _4027 = _4025 + 1;
    float _4029 = fma(_3521, (*spvDescriptorSet0.vp_c9)._m0[190].x, _4007);
    bool _4031 = !_4001;
    int _4033 = _4031 ? 0 : (-1);
    bool _4035 = uint(_4005) >= uint(_1973);
    float _4037 = _2089 * 2.0;
    int _4039 = ~_3945;
    int _4041 = _4039 + _4033;
    int _4043 = _4041 + 1;
    float _4045 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _4047 = _3805 + _4045;
    bool _4049 = !_4035;
    int _4051 = _4049 ? 0 : (-1);
    int _4053 = _4027 * _4021;
    int _4055 = _4053 + _2937;
    float _4057 = _4017;
    if (!_3721)
    {
        _3765 = _2089;
    }
    float _4059 = _3765;
    float _4061 = floor(_4037);
    int _4063 = _1951 * _4043;
    int _4065 = _4063 + _2699;
    int _4067 = ~_3985;
    int _4069 = _4067 + _4051;
    int _4071 = _4069 + 1;
    out.m_71.x = _4029;
    bool _4073 = uint(_4055) >= uint(_1983);
    float _4075 = _4059;
    if (_3721)
    {
        _4015 = _2083;
    }
    float _4077 = _4015;
    bool _4079 = !_4073;
    int _4081 = _4079 ? 0 : (-1);
    if (_3721)
    {
        _4057 = _2083;
    }
    float _4083 = _4057;
    int _4085 = ~_4021;
    int _4087 = _4085 + _4081;
    int _4089 = _4087 + 1;
    int _4091 = _1973 * _4071;
    int _4093 = _4091 + _2895;
    float _4095 = _3915 * (*spvDescriptorSet0.vp_c9)._m0[82].y;
    int _4097 = _2995 >> 31;
    float _4099 = trunc((*spvDescriptorSet0.vp_c9)._m0[80].z);
    int _4101 = int(_4099);
    if (_3721)
    {
        _4075 = _1808;
    }
    float _4103 = _4075;
    float _4105 = fma(_4095, -2.0, _4019);
    int _4107 = _4097 & 3;
    int _4109 = _1983 * _4089;
    int _4111 = _4109 + _2937;
    bool _4113 = _4061 > 0.0;
    float _4115 = fma(_160, (*spvDescriptorSet0.vp_c9)._m0[81].y, _4105);
    bool _4117 = _4061 >= 0.0;
    bool _4119 = isnan(_4061);
    bool _4121 = _4117 || _4119;
    bool _4123 = isnan(0.0);
    bool _4125 = _4121 || _4123;
    float _4127 = _3947 * (*spvDescriptorSet0.vp_c9)._m0[100].y;
    int _4129 = _2995 + _4107;
    float _4131 = fma(_4127, _3447, -0.5);
    int _4133 = ~_3937;
    int _4135 = _4133 + _3997;
    int _4137 = _4135 + 1;
    float _4139 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _4141 = _3779 + _4139;
    int _4143 = _4129 >> 2;
    float _4145 = fma(_3993, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    int _4147 = _3153 >> 31;
    float _4149 = _4077 * (*spvDescriptorSet0.vp_c9)._m0[82].x;
    float _4151 = _4141 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    int _4153 = _1816 * _4137;
    int _4155 = _4153 + _2377;
    int _4157 = _4147 & 3;
    float _4159 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _4161 = _3815 + _4159;
    float _4163 = fma(_4047, (*spvDescriptorSet0.vp_c8)._m0[28].x, _4151);
    int _4165 = _3275 >> 31;
    float _4167 = (*spvDescriptorSet0.vp_c9)._m0[87].x + (*spvDescriptorSet0.vp_c9)._m0[86].z;
    int _4169 = _3153 + _4157;
    float _4171 = fma(_4161, (*spvDescriptorSet0.vp_c8)._m0[28].z, _4163);
    int _4173 = _4165 & 3;
    float _4175 = -_4167;
    float _4177 = fma(_3987, 2.0, _4175);
    bool _4179 = !_2823;
    int _4181 = _4179 ? _4111 : (-1);
    float _4183 = -_160;
    float _4185 = fma(_4183, (*spvDescriptorSet0.vp_c9)._m0[86].x, _4177);
    int _4187 = _3203 >> 31;
    float _4189 = (*spvDescriptorSet0.vp_c9)._m0[83].z + (*spvDescriptorSet0.vp_c9)._m0[83].x;
    int _4191 = _4169 >> 2;
    bool _4193 = !_2975;
    int _4195 = _4193 ? _4155 : (-1);
    float _4197 = fma(_4083, (*spvDescriptorSet0.vp_c9)._m0[83].z, _4189);
    int _4199 = _3275 + _4173;
    bool _4201 = _4171 >= 0.0;
    float _4203 = fma(_160, (*spvDescriptorSet0.vp_c9)._m0[82].z, _4197);
    bool _4205 = _3161 != 3;
    int _4207 = _4187 & 3;
    int _4209 = _4191 << 4;
    int _4211 = _4209 + 512;
    float _4213 = (*spvDescriptorSet0.vp_c9)._m0[98].w + (*spvDescriptorSet0.vp_c9)._m0[98].y;
    bool _4215 = !_2745;
    int _4217 = _4215 ? _4093 : (-1);
    int _4219 = _4143 << 4;
    int _4221 = _4219 + 368;
    float _4223 = fma(_3871, (*spvDescriptorSet0.vp_c9)._m0[98].w, _4213);
    bool _4225 = _3007 != 3;
    float _4227 = _3871 * (*spvDescriptorSet0.vp_c9)._m0[97].y;
    int _4229 = _4199 >> 2;
    uint _4231 = uint(int(uint(_4221) >> uint(2)));
    uint _4233 = uint(int(uint(int(_4231)) >> uint(2)));
    int _4235 = int(_4231) & 3;
    float _4237 = (*spvDescriptorSet0.vp_c9)._m0[int(_4233)][_4235];
    int _4239 = int(_4231) + 1;
    uint _4241 = uint(int(uint(_4239) >> uint(2)));
    int _4243 = _4239 & 3;
    float _4245 = (*spvDescriptorSet0.vp_c9)._m0[int(_4241)][_4243];
    float _4247 = fma(_160, (*spvDescriptorSet0.vp_c9)._m0[97].w, _4223);
    int _4249 = _3203 + _4207;
    float _4251 = as_type<float>(_4187);
    if (_4201)
    {
        out.m_49.x = 0.0;
    }
    bool _4253 = !_2677;
    int _4255 = _4253 ? _4065 : (-1);
    float _4257 = (*spvDescriptorSet0.vp_c9)._m0[82].x + (*spvDescriptorSet0.vp_c9)._m0[81].z;
    uint _4259 = uint(int(uint(_4211) >> uint(2)));
    uint _4261 = uint(int(uint(int(_4259)) >> uint(2)));
    int _4263 = int(_4259) & 3;
    float _4265 = (*spvDescriptorSet0.vp_c9)._m0[int(_4261)][_4263];
    int _4267 = int(_4259) + 1;
    uint _4269 = uint(int(uint(_4267) >> uint(2)));
    int _4271 = _4267 & 3;
    float _4273 = (*spvDescriptorSet0.vp_c9)._m0[int(_4269)][_4271];
    float _4275 = -_4257;
    float _4277 = fma(_4149, 2.0, _4275);
    float _4279 = (*spvDescriptorSet0.vp_c9)._m0[83].w + (*spvDescriptorSet0.vp_c9)._m0[83].y;
    int _4281 = _4249 >> 2;
    float _4283 = (*spvDescriptorSet0.vp_c9)._m0[97].y + (*spvDescriptorSet0.vp_c9)._m0[96].w;
    bool _4285 = !_3009;
    int _4287 = _4285 ? 0 : 1;
    float _4289 = (*spvDescriptorSet0.vp_c9)._m0[98].z + (*spvDescriptorSet0.vp_c9)._m0[98].x;
    float _4291 = fma(_4103, (*spvDescriptorSet0.vp_c9)._m0[83].w, _4279);
    int _4293 = _3203 & 3;
    bool _4295 = _4293 != 0;
    float _4297 = fma(_4227, -2.0, _4283);
    int _4299 = _4281 << 4;
    int _4301 = _4299 + 656;
    float _4303 = fma(_3821, (*spvDescriptorSet0.vp_c9)._m0[98].z, _4289);
    int _4305 = _4229 << 4;
    int _4307 = _4305 + 800;
    float _4309 = (*spvDescriptorSet0.vp_c9)._m0[97].x + (*spvDescriptorSet0.vp_c9)._m0[96].z;
    float _4311 = _3821 * (*spvDescriptorSet0.vp_c9)._m0[97].x;
    int _4313 = _3153 & 3;
    bool _4315 = _4313 != 0;
    float _4317 = fma(_160, (*spvDescriptorSet0.vp_c9)._m0[97].z, _4303);
    bool _4319 = !_4295;
    int _4321 = _4319 ? 0 : 1;
    uint _4323 = uint(int(uint(_4301) >> uint(2)));
    uint _4325 = uint(int(uint(int(_4323)) >> uint(2)));
    int _4327 = int(_4323) & 3;
    float _4329 = (*spvDescriptorSet0.vp_c9)._m0[int(_4325)][_4327];
    int _4331 = int(_4323) + 1;
    uint _4333 = uint(int(uint(_4331) >> uint(2)));
    int _4335 = _4331 & 3;
    float _4337 = (*spvDescriptorSet0.vp_c9)._m0[int(_4333)][_4335];
    int _4339 = _3275 & 3;
    bool _4341 = _4339 != 0;
    float _4343 = (*spvDescriptorSet0.vp_c9)._m0[87].y + (*spvDescriptorSet0.vp_c9)._m0[86].w;
    if (_4201)
    {
        _4251 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _4345 = _4251;
    float _4347 = fma(_160, (*spvDescriptorSet0.vp_c9)._m0[96].y, _4297);
    float _4349 = -_4309;
    float _4351 = fma(_4311, 2.0, _4349);
    int _4353 = abs(_3063);
    float _4355 = fma(_3999, -2.0, _4343);
    uint _4357 = uint(int(uint(_4307) >> uint(2)));
    uint _4359 = uint(int(uint(int(_4357)) >> uint(2)));
    int _4361 = int(_4357) & 3;
    float _4363 = (*spvDescriptorSet0.vp_c9)._m0[int(_4359)][_4361];
    int _4365 = int(_4357) + 1;
    uint _4367 = uint(int(uint(_4365) >> uint(2)));
    int _4369 = _4365 & 3;
    float _4371 = (*spvDescriptorSet0.vp_c9)._m0[int(_4367)][_4369];
    float _4373 = -_160;
    float _4375 = fma(_4373, (*spvDescriptorSet0.vp_c9)._m0[96].x, _4351);
    int _4377 = as_type<int>(_4345);
    if (_4201)
    {
        float _4379 = _4345 * 5.0;
        _4377 = as_type<int>(_4379);
    }
    int _4381 = _4377;
    int _4383 = abs(_3231);
    float _4385 = fma(_160, (*spvDescriptorSet0.vp_c9)._m0[82].w, _4291);
    float _4387 = fma(_4317, _3781, _4375);
    int _4389 = abs(_3337);
    int _4391 = _4221 + 8;
    uint _4393 = uint(int(uint(_4391) >> uint(2)));
    uint _4395 = uint(int(uint(int(_4393)) >> uint(2)));
    int _4397 = int(_4393) & 3;
    float _4399 = (*spvDescriptorSet0.vp_c9)._m0[int(_4395)][_4397];
    int _4401 = int(_4393) + 1;
    uint _4403 = uint(int(uint(_4401) >> uint(2)));
    int _4405 = _4401 & 3;
    float _4407 = (*spvDescriptorSet0.vp_c9)._m0[int(_4403)][_4405];
    if (_4201)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _13732 = as_type<float>(_4381);
        out.gl_Position.z = _13732;
    }
    float _4409 = -_160;
    float _4411 = fma(_4409, (*spvDescriptorSet0.vp_c9)._m0[81].x, _4277);
    bool _4413 = !_4315;
    int _4415 = _4413 ? 0 : 1;
    float _4417 = fma(_160, (*spvDescriptorSet0.vp_c9)._m0[86].y, _4355);
    int _4419 = abs(_4287);
    float _4421 = -_4347;
    float _4423 = fma(_4247, _4131, _4421);
    int _4425 = _4211 + 8;
    uint _4427 = uint(int(uint(_4425) >> uint(2)));
    uint _4429 = uint(int(uint(int(_4427)) >> uint(2)));
    int _4431 = int(_4427) & 3;
    float _4433 = (*spvDescriptorSet0.vp_c9)._m0[int(_4429)][_4431];
    int _4435 = int(_4427) + 1;
    uint _4437 = uint(int(uint(_4435) >> uint(2)));
    int _4439 = _4435 & 3;
    float _4441 = (*spvDescriptorSet0.vp_c9)._m0[int(_4437)][_4439];
    int _4443 = abs(_3295);
    int _4445 = abs(_4415);
    int _4447 = ~_4383;
    int _4449 = _4447 + 1;
    int _4451 = _4449 + 1;
    int _4453 = _4301 + 8;
    uint _4455 = uint(int(uint(_4453) >> uint(2)));
    uint _4457 = uint(int(uint(int(_4455)) >> uint(2)));
    int _4459 = int(_4455) & 3;
    float _4461 = (*spvDescriptorSet0.vp_c9)._m0[int(_4457)][_4459];
    int _4463 = int(_4455) + 1;
    uint _4465 = uint(int(uint(_4463) >> uint(2)));
    int _4467 = _4463 & 3;
    float _4469 = (*spvDescriptorSet0.vp_c9)._m0[int(_4465)][_4467];
    int _4471 = ~_4353;
    int _4473 = _4471 + 1;
    int _4475 = _4473 + 1;
    int _4477 = _4451 * as_type<int>(_4273);
    bool _4479 = !_4341;
    int _4481 = _4479 ? 0 : 1;
    int _4483 = _4307 + 8;
    uint _4485 = uint(int(uint(_4483) >> uint(2)));
    uint _4487 = uint(int(uint(int(_4485)) >> uint(2)));
    int _4489 = int(_4485) & 3;
    float _4491 = (*spvDescriptorSet0.vp_c9)._m0[int(_4487)][_4489];
    int _4493 = int(_4485) + 1;
    uint _4495 = uint(int(uint(_4493) >> uint(2)));
    int _4497 = _4493 & 3;
    float _4499 = (*spvDescriptorSet0.vp_c9)._m0[int(_4495)][_4497];
    int _4501 = ~_4419;
    int _4503 = _4501 + 1;
    int _4505 = _4503 + 1;
    int _4507 = _4475 * as_type<int>(_4245);
    int _4509 = ~_4445;
    int _4511 = _4509 + 1;
    int _4513 = _4511 + 1;
    float _4515 = trunc((*spvDescriptorSet0.vp_c9)._m0[90].z);
    int _4517 = int(_4515);
    bool _4519 = _3233 != 3;
    int _4521 = _4505 * as_type<int>(_4237);
    int _4523 = _4521 + _4507;
    bool _4525 = !_4225;
    int _4527 = _4525 ? 0 : (-1);
    int _4529 = _4513 * as_type<int>(_4265);
    int _4531 = _4529 + _4477;
    bool _4533 = _3287 != 3;
    int _4535 = abs(_4481);
    bool _4537 = !_4205;
    int _4539 = _4537 ? 0 : (-1);
    bool _4541 = !_4519;
    int _4543 = _4541 ? 0 : (-1);
    int _4545 = ~_4443;
    int _4547 = _4545 + 1;
    int _4549 = _4547 + 1;
    int _4551 = abs(_3127);
    int _4553 = abs(_3215);
    int _4555 = _4549 * as_type<int>(_4337);
    int _4557 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _4559 = _4557 != 0;
    int _4561 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _4563 = _4561 != 0;
    int _4565 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _4567 = _4565 != 0;
    int _4569 = ~_4389;
    int _4571 = _4569 + 1;
    int _4573 = _4571 + 1;
    float _4575 = trunc((*spvDescriptorSet0.vp_c9)._m0[85].z);
    int _4577 = int(_4575);
    int _4579 = ~_4551;
    int _4581 = _4579 + 1;
    int _4583 = _4581 + 1;
    int _4585 = _4573 * as_type<int>(_4371);
    int _4587 = ~_4535;
    int _4589 = _4587 + 1;
    int _4591 = _4589 + 1;
    int _4593 = ~_4553;
    int _4595 = _4593 + 1;
    int _4597 = _4595 + 1;
    int _4599 = _4583 * as_type<int>(_4399);
    int _4601 = _4599 + _4523;
    int _4603 = abs(_4321);
    int _4605 = _4591 * as_type<int>(_4363);
    int _4607 = _4605 + _4585;
    int _4609 = abs(_3285);
    int _4611 = _4597 * as_type<int>(_4433);
    int _4613 = _4611 + _4531;
    int _4615 = ~_4603;
    int _4617 = _4615 + 1;
    int _4619 = _4617 + 1;
    float _4621 = trunc((*spvDescriptorSet0.vp_c9)._m0[95].z);
    int _4623 = int(_4621);
    int _4625 = abs(_3355);
    int _4627 = abs(_4539);
    int _4629 = _4619 * as_type<int>(_4329);
    int _4631 = _4629 + _4555;
    float _4633 = float(uint(_4101));
    int _4635 = ~_4609;
    int _4637 = _4635 + 1;
    int _4639 = _4637 + 1;
    float _4641 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _4643 = log2(_4641);
    int _4645 = ~_4625;
    int _4647 = _4645 + 1;
    int _4649 = _4647 + 1;
    int _4651 = ~_4627;
    int _4653 = _4651 + 1;
    int _4655 = _4653 + 1;
    int _4657 = _4639 * as_type<int>(_4461);
    int _4659 = _4657 + _4631;
    int _4661 = abs(_4527);
    int _4663 = _4649 * as_type<int>(_4491);
    int _4665 = _4663 + _4607;
    float _4667 = float(uint(_4577));
    float _4669 = 1.0 / _4633;
    int _4671 = _4655 * as_type<int>(_4441);
    int _4673 = _4671 + _4613;
    int _4675 = ~_4661;
    int _4677 = _4675 + 1;
    int _4679 = _4677 + 1;
    float _4681 = float(uint(_4517));
    int _4683 = abs(_4543);
    int _4685 = _4679 * as_type<int>(_4407);
    int _4687 = _4685 + _4601;
    int _4689 = abs(_3143);
    float _4691 = 1.0 / _4667;
    int _4693 = abs(_3379);
    float _4695 = _4643 * _160;
    int _4697 = ~_4683;
    int _4699 = _4697 + 1;
    int _4701 = _4699 + 1;
    int _4703 = ~_4689;
    int _4705 = _4703 + 1;
    int _4707 = _4705 + 1;
    bool _4709 = !_4533;
    int _4711 = _4709 ? 0 : (-1);
    float _4713 = 1.0 / _4681;
    int _4715 = abs(_3361);
    int _4717 = _4701 * as_type<int>(_4469);
    int _4719 = _4717 + _4659;
    int _4721 = abs(_4711);
    int _4723 = _4687 * _4707;
    int _4725 = ~_4715;
    int _4727 = _4725 + 1;
    int _4729 = _4727 + 1;
    int _4731 = as_type<int>(_4669) + (-2);
    int _4733 = _4195 * _4689;
    int _4735 = _4733 + _4723;
    int _4737 = ~_4693;
    int _4739 = _4737 + 1;
    int _4741 = _4739 + 1;
    int _4743 = _4729 * _4719;
    float _4745 = exp2(_4695);
    float _4747 = float(uint(_4735));
    int _4749 = _4741 * _4673;
    int _4751 = ~_4721;
    int _4753 = _4751 + 1;
    int _4755 = _4753 + 1;
    int _4757 = _4217 * _4715;
    int _4759 = _4757 + _4743;
    int _4761 = as_type<int>(_4691) + (-2);
    int _4763 = _4255 * _4693;
    int _4765 = _4763 + _4749;
    int _4767 = abs(_3591);
    int _4769 = _4755 * as_type<int>(_4499);
    int _4771 = _4769 + _4665;
    float _4773 = as_type<float>(_4731) * _4747;
    int _4775 = as_type<int>(_4713) + (-2);
    float _4777 = float(uint(_4765));
    float _4779 = float(uint(_4759));
    float _4781 = trunc(_4773);
    float _4783 = precise::max(_4781, 0.0);
    uint _4785 = uint(_4783);
    int _4787 = ~_4767;
    int _4789 = _4787 + 1;
    int _4791 = _4789 + 1;
    float _4793 = as_type<float>(_4761) * _4777;
    float _4795 = float(uint(_4623));
    float _4797 = as_type<float>(_4775) * _4779;
    int _4799 = _4125 ? 0 : 1;
    int _4801 = _4791 * _4771;
    int _4803 = abs(_4101);
    float _4805 = trunc(_4793);
    float _4807 = precise::max(_4805, 0.0);
    uint _4809 = uint(_4807);
    int _4811 = ~_4799;
    int _4813 = _4811 + 1;
    int _4815 = _4813 + 1;
    int _4817 = _4181 * _4767;
    int _4819 = _4817 + _4801;
    int _4821 = _4815;
    float _4823 = _4411;
    if (!_4113)
    {
        int _4825 = ~_4799;
        int _4827 = _4825 + 1;
        _4821 = _4827;
    }
    int _4829 = _4821;
    float _4831 = -_4745;
    float _4833 = _4831 + 1.0;
    int _4835 = ~_4101;
    int _4837 = _4835 + 1;
    int _4839 = ~_4577;
    int _4841 = _4839 + 1;
    float _4843 = trunc(_4797);
    float _4845 = precise::max(_4843, 0.0);
    uint _4847 = uint(_4845);
    int _4849 = abs(_4577);
    int _4851 = _4837 * int(_4785);
    int _4853 = _4851 + _4735;
    float _4855 = float(uint(_4803));
    int _4857 = ~_4517;
    int _4859 = _4857 + 1;
    float _4861 = float(uint(_4849));
    float _4863 = 1.0 / _4795;
    int _4865 = _4841 * int(_4809);
    int _4867 = _4865 + _4765;
    int _4869 = abs(_4517);
    float _4871 = float(uint(_4853));
    float _4873 = float(uint(_4867));
    float _4875 = 1.0 / _4855;
    int _4877 = _4859 * int(_4847);
    int _4879 = _4877 + _4759;
    float _4881 = float(uint(_4869));
    float _4883 = as_type<float>(_4731) * _4871;
    int _4885 = abs(_4623);
    float _4887 = as_type<float>(_4761) * _4873;
    float _4889 = float(uint(_4879));
    float _4891 = 1.0 / _4861;
    int _4893 = as_type<int>(_4863) + (-2);
    float _4895 = as_type<float>(_4775) * _4889;
    float _4897 = float(uint(_4819));
    float _4899 = float(uint(_4885));
    float _4901 = 1.0 / _4881;
    int _4903 = abs(_4735);
    float _4905 = as_type<float>(_4893) * _4897;
    int _4907 = abs(_4765);
    int _4909 = as_type<int>(_4875) + (-2);
    float _4911 = float(uint(_4903));
    float _4913 = 1.0 / _4899;
    int _4915 = as_type<int>(_4891) + (-2);
    float _4917 = as_type<float>(_4909) * _4911;
    float _4919 = float(uint(_4907));
    bool _4921 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _4923 = isnan(1.0);
    bool _4925 = _4921 || _4923;
    bool _4927 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _4929 = _4925 || _4927;
    float _4931 = trunc(_4905);
    float _4933 = precise::max(_4931, 0.0);
    uint _4935 = uint(_4933);
    float _4937 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _4939 = 1.0 + _4937;
    int _4941 = abs(_4759);
    float _4943 = as_type<float>(_4915) * _4919;
    float _4945 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    int _4947 = as_type<int>(_4901) + (-2);
    float _4949 = trunc(_4917);
    float _4951 = precise::max(_4949, 0.0);
    uint _4953 = uint(_4951);
    float _4955 = float(uint(_4941));
    float _4957 = (*spvDescriptorSet0.vp_c9)._m0[88].w + (*spvDescriptorSet0.vp_c9)._m0[88].y;
    float _4959 = as_type<float>(_4947) * _4955;
    int _4961 = abs(_4819);
    float _4963 = 1.0 / _4939;
    int _4965 = ~_4623;
    int _4967 = _4965 + 1;
    float _4969 = fma(_1808, (*spvDescriptorSet0.vp_c9)._m0[78].w, _4945);
    float _4971 = fma(_1808, (*spvDescriptorSet0.vp_c9)._m0[88].w, _4957);
    float _4973 = (*spvDescriptorSet0.vp_c9)._m0[88].z + (*spvDescriptorSet0.vp_c9)._m0[88].x;
    int _4975 = as_type<int>(_4913) + (-2);
    float _4977 = fma(_160, (*spvDescriptorSet0.vp_c9)._m0[77].w, _4969);
    float _4979 = float(uint(_4961));
    float _4981 = trunc(_4943);
    float _4983 = precise::max(_4981, 0.0);
    uint _4985 = uint(_4983);
    bool _4987 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _4989 = isnan(0.0);
    bool _4991 = _4987 || _4989;
    bool _4993 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _4995 = _4991 || _4993;
    float _4997 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    float _4999 = fma(_160, (*spvDescriptorSet0.vp_c9)._m0[87].w, _4971);
    int _5001 = _4967 * int(_4935);
    int _5003 = _5001 + _4819;
    int _5005 = ~_4803;
    int _5007 = _5005 + 1;
    float _5009 = fma(_2083, (*spvDescriptorSet0.vp_c9)._m0[88].z, _4973);
    float _5011 = as_type<float>(_4975) * _4979;
    float _5013 = trunc(_4959);
    float _5015 = precise::max(_5013, 0.0);
    uint _5017 = uint(_5015);
    float _5019 = fma(_2083, (*spvDescriptorSet0.vp_c9)._m0[78].z, _4997);
    float _5021 = _4995 ? _4833 : 0.0;
    float _5023 = fma(_160, (*spvDescriptorSet0.vp_c9)._m0[87].z, _5009);
    float _5025 = float(uint(_5003));
    int _5027 = _5007 * int(_4953);
    int _5029 = _5027 + _4903;
    int _5031 = ~_4849;
    int _5033 = _5031 + 1;
    float _5035 = fma(_160, (*spvDescriptorSet0.vp_c9)._m0[77].z, _5019);
    float _5037 = trunc(_4887);
    float _5039 = precise::max(_5037, 0.0);
    uint _5041 = uint(_5039);
    if (_4929)
    {
        float _5043 = _5021 * _4963;
        _162 = _5043;
    }
    float _5045 = _162;
    float _5047 = as_type<float>(_4893) * _5025;
    float _5049 = float(uint(_5029));
    int _5051 = _5033 * int(_4985);
    int _5053 = _5051 + _4907;
    float _5055 = trunc(_4883);
    float _5057 = precise::max(_5055, 0.0);
    uint _5059 = uint(_5057);
    int _5061 = ~_4869;
    int _5063 = _5061 + 1;
    float _5065 = as_type<float>(_4909) * _5049;
    float _5067 = trunc(_5011);
    float _5069 = precise::max(_5067, 0.0);
    uint _5071 = uint(_5069);
    int _5073 = int(_4809) + int(_5041);
    int _5075 = _5063 * int(_5017);
    int _5077 = _5075 + _4941;
    int _5079 = ~_4623;
    int _5081 = _5079 + 1;
    float _5083 = float(uint(_5077));
    float _5085 = trunc(_5047);
    float _5087 = precise::max(_5085, 0.0);
    uint _5089 = uint(_5087);
    int _5091 = int(_4785) + int(_5059);
    int _5093 = ~_4885;
    int _5095 = _5093 + 1;
    float _5097 = as_type<float>(_4947) * _5083;
    float _5099 = trunc(_4895);
    float _5101 = precise::max(_5099, 0.0);
    uint _5103 = uint(_5101);
    float _5105 = trunc(_5097);
    float _5107 = precise::max(_5105, 0.0);
    uint _5109 = uint(_5107);
    float _5111 = float(uint(_5053));
    int _5113 = ~_4101;
    int _5115 = _5113 + 1;
    int _5117 = int(_4935) + int(_5089);
    float _5119 = as_type<float>(_4915) * _5111;
    int _5121 = _5095 * int(_5071);
    int _5123 = _5121 + _4961;
    float _5125 = trunc(_5065);
    float _5127 = precise::max(_5125, 0.0);
    uint _5129 = uint(_5127);
    int _5131 = ~_4577;
    int _5133 = _5131 + 1;
    float _5135 = float(uint(_5123));
    int _5137 = _5115 * _5091;
    int _5139 = _5137 + _4735;
    int _5141 = ~_4517;
    int _5143 = _5141 + 1;
    float _5145 = as_type<float>(_4975) * _5135;
    float _5147 = trunc(_5119);
    float _5149 = precise::max(_5147, 0.0);
    uint _5151 = uint(_5149);
    int _5153 = _5133 * _5073;
    int _5155 = _5153 + _4765;
    int _5157 = int(_4847) + int(_5103);
    int _5159 = _5081 * _5117;
    int _5161 = _5159 + _4819;
    bool _5163 = uint(_5155) >= uint(_4577);
    float _5165 = trunc(_5145);
    float _5167 = precise::max(_5165, 0.0);
    uint _5169 = uint(_5167);
    bool _5171 = uint(_5139) >= uint(_4101);
    int _5173 = _5143 * _5157;
    int _5175 = _5173 + _4759;
    int _5177 = int(_5017) + int(_5109);
    int _5179 = int(_4953) + int(_5129);
    int _5181 = ~_4803;
    int _5183 = _5181 + 1;
    bool _5185 = !_5163;
    int _5187 = _5185 ? 0 : (-1);
    bool _5189 = uint(_5161) >= uint(_4623);
    int _5191 = _5183 * _5179;
    int _5193 = _5191 + _4903;
    int _5195 = ~_4869;
    int _5197 = _5195 + 1;
    bool _5199 = !_5171;
    int _5201 = _5199 ? 0 : (-1);
    bool _5203 = uint(_5175) >= uint(_4517);
    int _5205 = _5197 * _5177;
    int _5207 = _5205 + _4941;
    int _5209 = int(_4985) + int(_5151);
    int _5211 = ~_4849;
    int _5213 = _5211 + 1;
    bool _5215 = !_5203;
    int _5217 = _5215 ? 0 : (-1);
    bool _5219 = uint(_5193) >= uint(_4803);
    int _5221 = _5213 * _5209;
    int _5223 = _5221 + _4907;
    int _5225 = ~_4885;
    int _5227 = _5225 + 1;
    bool _5229 = !_5219;
    int _5231 = _5229 ? 0 : (-1);
    bool _5233 = uint(_5207) >= uint(_4869);
    float _5235 = _4141 * _4141;
    int _5237 = int(_5071) + int(_5169);
    float _5239 = fma(_4047, _4047, _5235);
    bool _5241 = !_5189;
    int _5243 = _5241 ? 0 : (-1);
    bool _5245 = uint(_5223) >= uint(_4849);
    float _5247 = fma(_4161, _4161, _5239);
    int _5249 = _5227 * _5237;
    int _5251 = _5249 + _4961;
    int _5253 = ~_5091;
    int _5255 = _5253 + _5201;
    int _5257 = _5255 + 1;
    float _5259 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    bool _5261 = !_5245;
    int _5263 = _5261 ? 0 : (-1);
    bool _5265 = uint(_5251) >= uint(_4885);
    int _5267 = _4101 * _5257;
    int _5269 = _5267 + _4735;
    int _5271 = ~_5157;
    int _5273 = _5271 + _5217;
    int _5275 = _5273 + 1;
    bool _5277 = !_5233;
    int _5279 = _5277 ? 0 : (-1);
    float _5281 = rsqrt(_5247);
    bool _5283 = _4101 == 0;
    int _5285 = ~_5073;
    int _5287 = _5285 + _5187;
    int _5289 = _5287 + 1;
    int _5291 = ~_5117;
    int _5293 = _5291 + _5243;
    int _5295 = _5293 + 1;
    int _5297 = _4517 * _5275;
    int _5299 = _5297 + _4759;
    bool _5301 = !_5283;
    int _5303 = _5301 ? _5269 : (-1);
    int _5305 = _4577 * _5289;
    int _5307 = _5305 + _4765;
    bool _5309 = _4517 == 0;
    float _5311 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    int _5313 = _4765 ^ _4577;
    float _5315 = _5259 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    bool _5317 = !_5309;
    int _5319 = _5317 ? _5299 : (-1);
    bool _5321 = _4101 == 0;
    float _5323 = _4141 * _5281;
    int _5325 = _4735 ^ _4101;
    float _5327 = _4047 * _5281;
    uint _5329 = uint(int(uint(_5313) >> uint(31)));
    float _5331 = -_5323;
    float _5333 = fma(_5331, (*spvDescriptorSet0.vp_c9)._m0[18].w, _4141);
    int _5335 = ~_5231;
    int _5337 = _5179 + _5335;
    int _5339 = _5337 + 1;
    float _5341 = _4387 + 0.5;
    uint _5343 = uint(int(uint(_5325) >> uint(31)));
    float _5345 = _5333 * _5333;
    int _5347 = ~_5263;
    int _5349 = _5209 + _5347;
    int _5351 = _5349 + 1;
    float _5353 = _4423 + 0.5;
    int _5355 = ~int(_5329);
    int _5357 = _5355 + 1;
    float _5359 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    bool _5361 = !_5265;
    int _5363 = _5361 ? 0 : (-1);
    float _5365 = -_5327;
    float _5367 = fma(_5365, (*spvDescriptorSet0.vp_c9)._m0[18].w, _4047);
    bool _5369 = _4577 == 0;
    out.m_73.x = _5341;
    out.m_73.y = _5353;
    int _5371 = ~int(_5343);
    int _5373 = _5371 + 1;
    float _5375 = fma(_5367, _5367, _5345);
    int _5377 = _5351 ^ _5357;
    float _5379 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].z;
    bool _5381 = !_5369;
    int _5383 = _5381 ? _5307 : (-1);
    int _5385 = _4623 * _5295;
    int _5387 = _5385 + _4819;
    int _5389 = _5339 ^ _5373;
    float _5391 = fma(_5315, _2125, -0.5);
    bool _5393 = _4623 == 0;
    float _5395 = _5311 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    int _5397 = ~_5357;
    int _5399 = _5397 + _5377;
    int _5401 = _5399 + 1;
    float _5403 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    int _5405 = ~_5373;
    int _5407 = _5405 + _5389;
    int _5409 = _5407 + 1;
    float _5411 = _5359 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    bool _5413 = !_5393;
    int _5415 = _5413 ? _5387 : (-1);
    float _5417 = float(_5303);
    float _5419 = fma(_5411, _2189, -0.5);
    bool _5421 = _4577 == 0;
    float _5423 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[95].z;
    bool _5425 = !_5321;
    int _5427 = _5425 ? _5409 : (-1);
    float _5429 = fma(_5315, _5417, _3943);
    bool _5431 = _4517 == 0;
    float _5433 = _5379 * (*spvDescriptorSet0.vp_c9)._m0[90].x;
    int _5435 = _4759 ^ _4517;
    float _5437 = fma(_5035, _5391, _5429);
    bool _5439 = !_5421;
    int _5441 = _5439 ? _5401 : (-1);
    float _5443 = fma(_5433, _2211, -0.5);
    int _5445 = _4819 ^ _4623;
    float _5447 = _5403 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    float _5449 = float(_5319);
    bool _5451 = _4623 == 0;
    float _5453 = float(_5383);
    float _5455 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].w;
    uint _5457 = uint(int(uint(_5435) >> uint(31)));
    float _5459 = fma(_5433, _5449, _4185);
    uint _5461 = uint(int(uint(_5445) >> uint(31)));
    float _5463 = fma(_5411, _5453, _4411);
    int _5465 = ~_5279;
    int _5467 = _5177 + _5465;
    int _5469 = _5467 + 1;
    float _5471 = _5423 * (*spvDescriptorSet0.vp_c9)._m0[95].x;
    int _5473 = ~int(_5457);
    int _5475 = _5473 + 1;
    float _5477 = fma(_5023, _5443, _5459);
    float _5479 = float(_5415);
    float _5481 = fma(_5471, _2221, -0.5);
    int _5483 = ~_5363;
    int _5485 = _5237 + _5483;
    int _5487 = _5485 + 1;
    float _5489 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[95].w;
    int _5491 = ~int(_5461);
    int _5493 = _5491 + 1;
    float _5495 = fma(_5471, _5479, _4013);
    float _5497 = float(_5427);
    float _5499 = fma(_5395, _3383, -0.5);
    float _5501 = float(_5441);
    float _5503 = fma(_4203, _5419, _5463);
    int _5505 = _5469 ^ _5475;
    float _5507 = -_3311;
    float _5509 = fma(_5395, _5497, _5507);
    int _5511 = _5487 ^ _5493;
    float _5513 = fma(_5447, _3391, -0.5);
    int _5515 = ~_5475;
    int _5517 = _5515 + _5505;
    int _5519 = _5517 + 1;
    float _5521 = -_4115;
    float _5523 = fma(_5447, _5501, _5521);
    int _5525 = ~_5493;
    int _5527 = _5525 + _5511;
    int _5529 = _5527 + 1;
    float _5531 = _4161 * _5281;
    float _5533 = _5455 * (*spvDescriptorSet0.vp_c9)._m0[90].y;
    bool _5535 = !_5431;
    int _5537 = _5535 ? _5519 : (-1);
    float _5539 = fma(_4977, _5499, _5509);
    bool _5541 = !_5451;
    int _5543 = _5541 ? _5529 : (-1);
    float _5545 = -_5531;
    float _5547 = fma(_5545, (*spvDescriptorSet0.vp_c9)._m0[18].w, _4161);
    float _5549 = float(_5537);
    float _5551 = fma(_3891, _5481, _5495);
    float _5553 = float(_5543);
    float _5555 = _5539 + 0.5;
    float _5557 = fma(_5547, _5547, _5375);
    float _5559 = _5489 * (*spvDescriptorSet0.vp_c9)._m0[95].y;
    float _5561 = in.m_75.x;
    float _5563 = in.m_75.y;
    float _5565 = in.m_75.z;
    float _5567 = fma(_5533, _3405, -0.5);
    float _5569 = -_4417;
    float _5571 = fma(_5533, _5549, _5569);
    float _5573 = fma(_5559, _3407, -0.5);
    float _5575 = -_4023;
    float _5577 = fma(_5559, _5553, _5575);
    float _5579 = fma(_4385, _5513, _5523);
    float _5581 = fma(_4999, _5567, _5571);
    float _5583 = _5477 + 0.5;
    float _5585 = fma(_3893, _5573, _5577);
    float _5587 = _5437 + 0.5;
    float _5589 = _5503 + 0.5;
    float _5591 = _5579 + 0.5;
    float _5593 = _5551 + 0.5;
    float _5595 = _5581 + 0.5;
    float _5597 = _5585 + 0.5;
    bool _5599 = !_4559;
    int _5601 = _5599 ? 0 : 1;
    out.m_77.x = _5587;
    out.m_77.y = _5555;
    out.m_77.z = _5589;
    out.m_77.w = _5591;
    bool _5603 = !_4563;
    int _5605 = _5603 ? 0 : 1;
    int _5607 = abs(_5601);
    out.m_79.x = _5583;
    out.m_79.y = _5595;
    float _5609 = float(_4829);
    int _5611 = abs(_5605);
    out.m_81.x = _5593;
    out.m_81.y = _5597;
    bool _5613 = !_4567;
    int _5615 = _5613 ? 0 : 1;
    float _5617 = float(_5607);
    float _5619 = _5589;
    float _5621 = as_type<float>(_5129);
    if (_4201)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _5623 = -_5323;
    float _5625 = fma(_5623, (*spvDescriptorSet0.vp_c9)._m0[18].w, _3779);
    float _5627 = float(_5611);
    float _5629 = -_5327;
    float _5631 = fma(_5629, (*spvDescriptorSet0.vp_c9)._m0[18].w, _3805);
    float _5633 = _5617 * _5609;
    float _5635 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _5637 = _5625 + _5635;
    float _5639 = float(_3543);
    float _5641 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _5643 = _5631 + _5641;
    float _5645 = _5633 * (-2.0);
    float _5647 = _5637 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _5649 = -_5531;
    float _5651 = fma(_5649, (*spvDescriptorSet0.vp_c9)._m0[18].w, _3815);
    float _5653 = _5627 * _5639;
    float _5655 = _1808 + _2089;
    float _5657 = fma(_5643, (*spvDescriptorSet0.vp_c8)._m0[28].x, _5647);
    float _5659 = _2083 + (-0.5);
    float _5661 = fma(_5645, _5561, _5561);
    float _5663 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _5665 = _5651 + _5663;
    float _5667 = _5655 + (-1.0);
    float _5669 = fma(_4145, _5645, _4145);
    float _5671 = fma(_5659, (*spvDescriptorSet0.vp_c9)._m0[196].x, _5661);
    float _5673 = _5653 * (-2.0);
    float _5675 = fma(_5665, (*spvDescriptorSet0.vp_c8)._m0[28].z, _5657);
    float _5677 = fma(_5667, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    float _5679 = fma(_5669, _5045, _5671);
    float _5681 = _1808 + (-0.5);
    float _5683 = fma(_5673, _5563, _5563);
    bool _5685 = _5675 >= 0.0;
    float _5687 = fma(_5677, _5673, _5677);
    int _5689 = abs(_5615);
    float _5691 = _5679 * 0.15915493667125701904296875;
    float _5693 = fma(_5681, (*spvDescriptorSet0.vp_c9)._m0[196].y, _5683);
    float _5695 = sqrt(_5557);
    float _5697 = fma(_5687, _5045, _5693);
    float _5699 = float(_3771);
    float _5701 = _2083 + _2089;
    float _5703 = float(_5689);
    float _5705 = _5697 * 0.15915493667125701904296875;
    float _5707 = _5651;
    float _5709 = _5625;
    if (_5685)
    {
        _5619 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _5711 = _5619;
    float _5713 = _5691 * 6.283185482025146484375;
    float _5715 = sin(_5713);
    int _5717 = as_type<int>(_5711);
    if (_5685)
    {
        out.m_49.x = 0.0;
    }
    float _5719 = _5703 * _5699;
    if (_5685)
    {
        float _5721 = _5711 * 5.0;
        _5717 = as_type<int>(_5721);
    }
    int _5723 = _5717;
    float _5725 = _5701 + (-1.0);
    float _5727 = _5719 * (-2.0);
    float _5729 = _5691 * 6.283185482025146484375;
    float _5731 = cos(_5729);
    if (_5685)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _15599 = as_type<float>(_5723);
        out.gl_Position.z = _15599;
    }
    float _5733 = _5705 * 6.283185482025146484375;
    float _5735 = sin(_5733);
    if (_5685)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _5737 = -_3779;
    float _5739 = _5737 + (*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _5741 = fma(_5725, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _5743 = -_3805;
    float _5745 = _5743 + (*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _5747 = -_3815;
    float _5749 = _5747 + (*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _5751 = _5739 * _5739;
    float _5753 = fma(_5727, _5565, _5565);
    float _5755 = _2089 + (-0.5);
    float _5757 = fma(_5741, _5727, _5741);
    float _5759 = fma(_5745, _5745, _5751);
    float _5761 = _5705 * 6.283185482025146484375;
    float _5763 = cos(_5761);
    float _5765 = fma(_5755, (*spvDescriptorSet0.vp_c9)._m0[196].z, _5753);
    float _5767 = _5281 * _5695;
    float _5769 = fma(_5749, _5749, _5759);
    float _5771 = _518 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _5773 = fma(_5757, _5045, _5765);
    float _5775 = _524 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _5777 = in.m_83.x;
    float _5779 = in.m_83.y;
    float _5781 = in.m_83.z;
    float _5783 = _5731 * _5735;
    float _5785 = rsqrt(_5769);
    float _5787 = _5773 * 0.15915493667125701904296875;
    float _5789 = _5715 * _5735;
    float _5791 = _5767 * _5775;
    float _5793 = _5731 * _5763;
    float _5795 = _5787 * 6.283185482025146484375;
    float _5797 = sin(_5795);
    float _5799 = _5745 * _5785;
    float _5801 = _5749 * _5785;
    float _5803 = _5739 * _5785;
    float _5805 = _5787 * 6.283185482025146484375;
    float _5807 = cos(_5805);
    float _5809 = -(*spvDescriptorSet0.vp_c8)._m0[1].z;
    float _5811 = _5799 * _5809;
    float _5813 = -(*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _5815 = _5801 * _5813;
    float _5817 = -(*spvDescriptorSet0.vp_c8)._m0[1].x;
    float _5819 = _5803 * _5817;
    float _5821 = -(*spvDescriptorSet0.vp_c8)._m0[1].x;
    float _5823 = -_5811;
    float _5825 = fma(_5801, _5821, _5823);
    float _5827 = -(*spvDescriptorSet0.vp_c8)._m0[1].z;
    float _5829 = -_5815;
    float _5831 = fma(_5803, _5827, _5829);
    float _5833 = -(*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _5835 = -_5819;
    float _5837 = fma(_5799, _5833, _5835);
    float _5839 = fma(_5797, _5793, _5789);
    float _5841 = _5825 * _5825;
    float _5843 = fma(_5797, _5789, _5793);
    float _5845 = _520 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _5847 = fma(_5831, _5831, _5841);
    float _5849 = _5715 * _5763;
    float _5851 = _5767 * _5845;
    float _5853 = fma(_5837, _5837, _5847);
    float _5855 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _5779);
    float _5857 = _5731 * _5807;
    float _5859 = _5767 * _5771;
    float _5861 = -_5783;
    float _5863 = fma(_5797, _5849, _5861);
    float _5865 = _5855 * _5851;
    float _5867 = rsqrt(_5853);
    float _5869 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _5781);
    float _5871 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _5777);
    float _5873 = _5715 * _5807;
    float _5875 = -_5849;
    float _5877 = fma(_5797, _5783, _5875);
    float _5879 = _5869 * _5859;
    float _5881 = _5871 * _5791;
    float _5883 = _5857 * _5865;
    float _5885 = _5763 * _5807;
    float _5887 = -_5865;
    float _5889 = _5797 * _5887;
    float _5891 = _5873 * _5865;
    float _5893 = fma(_5839, _5881, _5883);
    float _5895 = _5735 * _5807;
    float _5897 = fma(_5885, _5881, _5889);
    float _5899 = fma(_5863, _5881, _5891);
    float _5901 = fma(_5877, _5879, _5893);
    float _5903 = _5831 * _5867;
    float _5905 = _5825 * _5867;
    float _5907 = _5837 * _5867;
    float _5909 = fma(_5895, _5879, _5897);
    float _5911 = _5803 * _5903;
    float _5913 = _5801 * _5905;
    float _5915 = fma(_5843, _5879, _5899);
    float _5917 = _5625 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _5919 = -_5911;
    float _5921 = fma(_5799, _5905, _5919);
    float _5923 = -_5913;
    float _5925 = fma(_5803, _5907, _5923);
    float _5927 = fma(_5631, (*spvDescriptorSet0.vp_c8)._m0[11].x, _5917);
    float _5929 = _5921 * _5901;
    float _5931 = _5925 * _5901;
    float _5933 = fma(_5907, _5909, _5929);
    float _5935 = fma(_5903, _5909, _5931);
    float _5937 = _5799 * _5907;
    float _5939 = fma(_5801, _5915, _5933);
    float _5941 = fma(_5799, _5915, _5935);
    float _5943 = -_5937;
    float _5945 = fma(_5801, _5903, _5943);
    float _5947 = _3815 + _5939;
    float _5949 = _3805 + _5941;
    float _5951 = _5945 * _5901;
    float _5953 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _5955 = _5947 + _5953;
    float _5957 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _5959 = _5949 + _5957;
    float _5961 = _5955 * _5955;
    float _5963 = fma(_5959, _5959, _5961);
    float _5965 = fma(_5905, _5909, _5951);
    float _5967 = fma(_5651, (*spvDescriptorSet0.vp_c8)._m0[11].z, _5927);
    float _5969 = sqrt(_5963);
    float _5971 = fma(_5803, _5915, _5965);
    float _5973 = _3779 + _5971;
    bool _5975 = _5969 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _5977 = _5971;
    float _5979 = _5927;
    float _5981 = _5915;
    float _5983 = _5767;
    if (!_5975)
    {
        _5977 = _5949;
    }
    float _5985 = _5977;
    float _5987 = _5985;
    if (!_5975)
    {
        _5979 = _5947;
    }
    float _5989 = _5979;
    float _5991 = _5989;
    if (!_5975)
    {
        _5981 = _5973;
    }
    float _5993 = _5981;
    bool _5995 = !_5975;
    float _5997 = _5993;
    if (!_5995)
    {
        float _5999 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _6001 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _6003 = _5969 + _6001;
        float _6005 = _5973 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _6007 = rsqrt(_5963);
        float _6009 = _6003 * _5999;
        float _6011 = _6009 * 0.15915493667125701904296875;
        float _6013 = _6011 * 6.283185482025146484375;
        float _6015 = sin(_6013);
        float _6017 = _6011 * 6.283185482025146484375;
        float _6019 = cos(_6017);
        float _6021 = fma(_6015, _6005, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _6023 = _6007 * _6021;
        float _6025 = _6019 + (-1.0);
        float _6027 = fma(_5959, _6023, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _6029 = fma(_5955, _6023, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        float _6031 = _6025 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _6033 = fma(_5973, _6019, _6031);
        _5997 = _6033;
        _5987 = _6027;
        _5991 = _6029;
    }
    float _6035 = _5997;
    float _6037 = _5987;
    float _6039 = _5991;
    float _6041 = -_3779;
    float _6043 = _6041 + _6035;
    float _6045 = -_3805;
    float _6047 = _6045 + _6037;
    float _6049 = _5967 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _6051 = _5625 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _6053 = _6043 * _6043;
    float _6055 = -_3815;
    float _6057 = _6055 + _6039;
    float _6059 = 1.0 / _6049;
    float _6061 = fma(_5631, (*spvDescriptorSet0.vp_c8)._m0[10].x, _6051);
    float _6063 = fma(_6047, _6047, _6053);
    bool _6065 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[660].y;
    bool _6067 = isnan(0.5);
    bool _6069 = _6065 || _6067;
    bool _6071 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _6073 = _6069 || _6071;
    float _6075 = fma(_5651, (*spvDescriptorSet0.vp_c8)._m0[10].z, _6061);
    float _6077 = fma(_6057, _6057, _6063);
    float _6079 = _6075 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _6081 = sqrt(_6077);
    bool _6083 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[653].w;
    bool _6085 = isnan(0.5);
    bool _6087 = _6083 || _6085;
    bool _6089 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _6091 = _6087 || _6089;
    float _6093 = _6079 + _6049;
    float _6095 = _6093 * _6059;
    float _6097 = _6095 * 0.5;
    float _6099 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _6101 = fma(_6097, (*spvDescriptorSet0.vp_c8)._m0[30].w, _6099);
    float _6103 = 1.0 / _6101;
    bool _6105 = _6081 > 0.0;
    bool _6107 = !_6105;
    float _6109 = _6035;
    float _6111 = _6039;
    float _6113 = _6037;
    float _6115 = _6057;
    float _6117 = _6103;
    if (!_6107)
    {
        float _6119 = _204 * _204;
        float _6121 = fma(_202, _202, _6119);
        float _6123 = fma(_206, _206, _6121);
        float _6125 = rsqrt(_6077);
        float _6127 = sqrt(_6123);
        float _6129 = _6047 * _6125;
        float _6131 = _6043 * _6125;
        float _6133 = _6057 * _6125;
        bool _6135 = _6127 > 0.0;
        bool _6137 = !_6135;
        _6115 = _6133;
        if (!_6137)
        {
            float _6139 = rsqrt(_6123);
            float _6141 = 1.0 / (*spvDescriptorSet0.vp_c10)._m0[2].z;
            float _6143 = _204 * _6139;
            float _6145 = _202 * _6139;
            float _6147 = _6131 * _6143;
            float _6149 = _206 * _6139;
            float _6151 = fma(_6129, _6145, _6147);
            float _6153 = _6141 * (*spvDescriptorSet0.vp_c9)._m0[142].x;
            float _6155 = fma(_6133, _6149, _6151);
            float _6157 = _6155 * _6153;
            float _6159 = fma(_202, _6157, _6037);
            float _6161 = fma(_204, _6157, _6035);
            float _6163 = fma(_206, _6157, _6039);
            _6109 = _6161;
            _6111 = _6163;
            _6113 = _6159;
        }
    }
    float _6165 = _6109;
    float _6167 = _6111;
    float _6169 = _6113;
    float _6171 = _6115;
    float _6173 = -_5323;
    float _6175 = fma(_6173, (*spvDescriptorSet0.vp_c9)._m0[18].w, _6165);
    float _6177 = -_5531;
    float _6179 = fma(_6177, (*spvDescriptorSet0.vp_c9)._m0[18].w, _6167);
    float _6181 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _6183 = _6103 * _6181;
    float _6185 = -_5327;
    float _6187 = fma(_6185, (*spvDescriptorSet0.vp_c9)._m0[18].w, _6169);
    float _6189 = _6171;
    float _6191 = _6187;
    float _6193 = _6179;
    float _6195 = _6169;
    float _6197 = _6165;
    if (_6091)
    {
        _6189 = 1.0;
    }
    float _6199 = _6189;
    float _6201 = _6199;
    if (_6073)
    {
        _6117 = _6175;
    }
    float _6203 = _6117;
    float _6205 = _6203;
    if (!_6073)
    {
        float _6207 = _5637 * _5637;
        float _6209 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _6211 = -_3815;
        float _6213 = _6211 + _6167;
        float _6215 = -_3779;
        float _6217 = _6215 + _6165;
        float _6219 = fma(_5643, _5643, _6207);
        float _6221 = fma(_5665, _5665, _6219);
        float _6223 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _6225 = sqrt(_6221);
        float _6227 = 1.0 / _5767;
        float _6229 = _6223 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _6231 = precise::min(_6225, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _6233 = _6231 * _6209;
        float _6235 = _6233 * _6227;
        float _6237 = -_3805;
        float _6239 = _6237 + _6169;
        float _6241 = _6229 * _6235;
        float _6243 = _6213 * _6235;
        float _6245 = fma(_6239, _6241, _5631);
        float _6247 = fma(_6217, _6241, _5625);
        float _6249 = fma(_6229, _6243, _5651);
        _6205 = _6247;
        _6191 = _6245;
        _6193 = _6249;
    }
    float _6251 = _6205;
    float _6253 = _6191;
    float _6255 = _6193;
    if (!_6091)
    {
        float _6257 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _6259 = _6257 * 0.15915493667125701904296875;
        float _6261 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _6263 = _6259 * 6.283185482025146484375;
        float _6265 = cos(_6263);
        float _6267 = _6261 * 0.15915493667125701904296875;
        float _6269 = _6259 * 6.283185482025146484375;
        float _6271 = sin(_6269);
        float _6273 = 1.0 / _6265;
        float _6275 = _6267 * 6.283185482025146484375;
        float _6277 = cos(_6275);
        float _6279 = _6271 * _6273;
        float _6281 = _6267 * 6.283185482025146484375;
        float _6283 = sin(_6281);
        float _6285 = _6277 * _6279;
        float _6287 = 1.0 / _6285;
        float _6289 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _6291 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _6289;
        float _6293 = 1.0 / _6291;
        float _6295 = _6283 * _6287;
        float _6297 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _6299 = fma(_6183, _6295, _6297);
        float _6301 = _6299 * _6293;
        float _6303 = precise::clamp(_6301, 0.0, 1.0);
        _6195 = _6259;
        _5983 = _6267;
        _6201 = _6303;
    }
    float _6305 = _6195;
    float _6307 = _5983;
    float _6309 = _6201;
    float _6311 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _6313 = _6251 + _6311;
    float _6315 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _6317 = _6253 + _6315;
    float _6319 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _6321 = _6255 + _6319;
    float _6323 = _6313 * _6313;
    float _6325 = fma(_6317, _6317, _6323);
    float _6327 = fma(_6321, _6321, _6325);
    float _6329 = rsqrt(_6327);
    float _6331 = sqrt(_6327);
    float _6333 = _6329 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _6335 = _6317 * _6333;
    float _6337 = _6321 * _6333;
    float _6339 = _6335 * _6335;
    float _6341 = _6337 * _6337;
    float _6343 = _6339 + _6341;
    float _6345 = sqrt(_6343);
    bool _6347 = _6345 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _6349 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _6351 = _6345 + _6349;
    float _6353 = _6329;
    float _6355 = _6351;
    float _6357 = _6305;
    float _6359 = _6313;
    if (_6347)
    {
        float _6361 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _6353 = _6361;
    }
    float _6363 = _6353;
    float _6365 = _6363;
    if (_6347)
    {
        float _6367 = _6351 * _6363;
        _6355 = _6367;
    }
    float _6369 = _6355;
    if (_6347)
    {
        float _6371 = rsqrt(_6343);
        _6365 = _6371;
    }
    float _6373 = _6365;
    float _6375 = _6373;
    if (_6347)
    {
        float _6377 = _6369 * 0.15915493667125701904296875;
        _6357 = _6377;
    }
    float _6379 = _6357;
    float _6381 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _6383 = _6321;
    if (_6347)
    {
        float _6385 = _6379 * 6.283185482025146484375;
        float _6387 = sin(_6385);
        _6383 = _6387;
    }
    float _6389 = _6383;
    float _6391 = precise::max(0.0, _6381);
    float _6393 = _6307;
    float _6395 = _6391;
    if (_6347)
    {
        float _6397 = _6379 * 6.283185482025146484375;
        float _6399 = cos(_6397);
        _6393 = _6399;
    }
    float _6401 = _6393;
    float _6403 = -_6333;
    float _6405 = -_6391;
    float _6407 = fma(_6313, _6403, _6405);
    if (_6347)
    {
        float _6409 = _6407 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _6359 = _6409;
    }
    float _6411 = _6359;
    float _6413 = _6389;
    float _6415 = _6411;
    if (_6347)
    {
        float _6417 = fma(_6389, _6411, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _210 = _6417;
    }
    float _6419 = _210;
    if (!_6347)
    {
        _6413 = _6407;
    }
    float _6421 = _6413;
    float _6423 = _6421;
    if (_6347)
    {
        float _6425 = _6373 * _6419;
        _6197 = _6425;
    }
    float _6427 = _6197;
    if (!_6347)
    {
        _6375 = _6335;
    }
    float _6429 = _6375;
    float _6431 = _6429;
    float _6433 = _6401;
    if (_6347)
    {
        float _6435 = _6401 + (-1.0);
        _6395 = _6435;
    }
    float _6437 = _6395;
    float _6439 = _6437;
    if (_6347)
    {
        float _6441 = _6335 * _6427;
        _6431 = _6441;
    }
    float _6443 = _6431;
    if (_6347)
    {
        float _6445 = _6437 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _6415 = _6445;
    }
    float _6447 = _6415;
    float _6449 = _6447;
    if (!_6347)
    {
        _6439 = _6337;
    }
    float _6451 = _6439;
    float _6453 = _6451;
    if (_6347)
    {
        float _6455 = _6337 * _6427;
        _6453 = _6455;
    }
    float _6457 = _6453;
    float _6459 = fma(_5631, (*spvDescriptorSet0.vp_c15)._m0[652].x, (*spvDescriptorSet0.vp_c15)._m0[652].z);
    if (_6347)
    {
        float _6461 = fma(_6407, _6401, _6447);
        _6423 = _6461;
    }
    float _6463 = _6423;
    if (!_6347)
    {
        _6449 = _6339;
    }
    float _6465 = _6449;
    float _6467 = _6465;
    if (_6347)
    {
        float _6469 = _6443 * _6443;
        _6467 = _6469;
    }
    float _6471 = _6467;
    if (!_6347)
    {
        _6433 = _6341;
    }
    float _6473 = _6433;
    float _6475 = _6473;
    if (_6347)
    {
        float _6477 = _6457 * _6457;
        _6475 = _6477;
    }
    float _6479 = _6475;
    float _6481 = fma(_6463, _6463, _6471);
    float _6483 = _6251 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _6485 = _6251 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _6487 = floor(_6459);
    float _6489 = _6481 + _6479;
    float _6491 = fma(_6253, (*spvDescriptorSet0.vp_c8)._m0[2].x, _6483);
    float _6493 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _6495 = fma(_6331, (*spvDescriptorSet0.vp_c15)._m0[23].w, _6493);
    float _6497 = precise::clamp(_6495, 0.0, 1.0);
    float _6499 = fma(_6253, (*spvDescriptorSet0.vp_c8)._m0[3].x, _6485);
    float _6501 = fma(_6255, (*spvDescriptorSet0.vp_c8)._m0[2].z, _6491);
    float _6503 = -_6497;
    float _6505 = _6503 + 1.0;
    float _6507 = rsqrt(_6489);
    float _6509 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _6511 = _6501 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _6513 = fma(_6255, (*spvDescriptorSet0.vp_c8)._m0[3].z, _6499);
    float _6515 = _6511 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _6517 = abs(_6505);
    float _6519 = log2(_6517);
    float _6521 = _6251 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _6523 = -_6515;
    float _6525 = fma(_6523, _6509, 1.0);
    float _6527 = _6251 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _6529 = _6513 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _6531 = fma(_6253, (*spvDescriptorSet0.vp_c8)._m0[1].x, _6521);
    float _6533 = fma(_5651, (*spvDescriptorSet0.vp_c15)._m0[652].y, (*spvDescriptorSet0.vp_c15)._m0[652].w);
    float _6535 = fma(_6253, (*spvDescriptorSet0.vp_c8)._m0[0].x, _6527);
    float _6537 = _6507 * _6443;
    float _6539 = fma(_6255, (*spvDescriptorSet0.vp_c8)._m0[1].z, _6531);
    float _6541 = _6507 * _6463;
    float _6543 = fma(_6255, (*spvDescriptorSet0.vp_c8)._m0[0].z, _6535);
    float _6545 = _6507 * _6457;
    float _6547 = _6539 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _6549 = _6537 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _6551 = _6543 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _6553 = floor(_6533);
    float _6555 = _6547 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _6557 = -_6549;
    float _6559 = fma(_6541, (*spvDescriptorSet0.vp_c15)._m0[21].y, _6557);
    float _6561 = _6519 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _6563 = -_6487;
    float _6565 = _6459 + _6563;
    float _6567 = fma(_6551, (*spvDescriptorSet0.vp_c8)._m0[7].x, _6555);
    float _6569 = -_6545;
    float _6571 = fma(_6569, (*spvDescriptorSet0.vp_c15)._m0[21].z, _6559);
    float _6573 = log2(_6525);
    float _6575 = fma(_6511, (*spvDescriptorSet0.vp_c8)._m0[7].z, _6567);
    float _6577 = fma(_6571, -0.5, 0.5);
    float _6579 = _6547 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _6581 = fma(_6571, 0.5, 0.5);
    float _6583 = fma(_6529, (*spvDescriptorSet0.vp_c8)._m0[7].w, _6575);
    float _6585 = fma(_6551, (*spvDescriptorSet0.vp_c8)._m0[4].x, _6579);
    float _6587 = exp2(_6561);
    float _6589 = _6547 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _6591 = fma(_6581, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _6593 = fma(_6511, (*spvDescriptorSet0.vp_c8)._m0[4].z, _6585);
    float _6595 = -_6553;
    float _6597 = _6533 + _6595;
    float _6599 = fma(_6551, (*spvDescriptorSet0.vp_c8)._m0[5].x, _6589);
    float _6601 = fma(_6581, _6591, -0.212114393711090087890625);
    float _6603 = fma(_6529, (*spvDescriptorSet0.vp_c8)._m0[4].w, _6593);
    float _6605 = 1.0 / _6583;
    float _6607 = fma(_6511, (*spvDescriptorSet0.vp_c8)._m0[5].z, _6599);
    float _6609 = _6573 * 0.693147182464599609375;
    float _6611 = sqrt(_6577);
    float _6613 = fma(_6529, (*spvDescriptorSet0.vp_c8)._m0[5].w, _6607);
    float2 _16992 = float2(_6565, _6597);
    float _6615 = dm_bs(spvDescriptorSet0.vp_t_tcb_24.sample(spvDescriptorSet0.vp_t_tcb_24Smplr, select(_16992, float2(0.0), isnan(_16992)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_24, spvDescriptorSet0.vp_t_tcb_24Smplr_w, select(_16992, float2(0.0), isnan(_16992)), level(0.0)).x;
    float _6617 = fma(_6581, _6601, 1.570728778839111328125);
    float _6619 = _6609 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _6621 = _6603 * _6605;
    float _6623 = _6541 + 1.0;
    float _6625 = _6613 * _6605;
    float _6627 = fma(_6621, 0.5, 0.5);
    float _6629 = -_6541;
    float _6631 = fma(_6587, _6623, _6629);
    float _6633 = fma(_6625, -0.5, 0.5);
    float _6635 = _6611 * 0.636619746685028076171875;
    float _6637 = fma(_6631, 0.5, 0.5);
    float3 _17034 = float3(_6627, _6633, _6619);
    float _6639 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_17034, float3(0.0), isnan(_17034)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_17034, float3(0.0), isnan(_17034)), level(0.0)).x;
    float3 _17045 = float3(_6627, _6633, _6619);
    float4 _6642 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_17045, float3(0.0), isnan(_17045)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_17045, float3(0.0), isnan(_17045)), level(0.0)).xyzw;
    float _6644 = _6642.x;
    float _6646 = _6642.y;
    float _6648 = _6642.z;
    float _6650 = _6642.w;
    float _6652 = -_6617;
    float _6654 = fma(_6635, _6652, 1.0);
    float2 _17066 = float2(_6654, _6637);
    float3 _6658 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_17066, float2(0.0), isnan(_17066)), level(0.0)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_17066, float2(0.0), isnan(_17066)), level(0.0)).xyz;
    float _6660 = _6658.x;
    float _6662 = _6658.y;
    float _6664 = _6658.z;
    float _6666 = abs(_6183);
    float _6668 = log2(_6666);
    float _6670 = in.m_85.x;
    float _6672 = in.m_85.y;
    float _6674 = in.m_85.z;
    bool _6676 = _5779 != 0.0;
    bool _6678 = isnan(_5779);
    bool _6680 = _6676 || _6678;
    bool _6682 = isnan(0.0);
    bool _6684 = _6680 || _6682;
    float _6686 = _5877 * _5945;
    float _6688 = in.m_87.x;
    float _6690 = in.m_87.y;
    float _6692 = in.m_87.z;
    float _6694 = in.m_87.w;
    bool _6696 = _5777 == 0.0;
    bool _6698 = !_6684;
    bool _6700 = _6696 && _6698;
    float _6702 = fma(_5895, _5905, _6686);
    out.m_89.x = _5631;
    out.m_89.y = _5625;
    out.m_89.z = _5651;
    bool _6704 = _5781 == 0.0;
    bool _6706 = _6704 && _6700;
    bool _6708 = _6183 <= 8000.0;
    bool _6710 = isnan(_6183);
    bool _6712 = _6708 || _6710;
    bool _6714 = isnan(8000.0);
    bool _6716 = _6712 || _6714;
    float _6718 = float(_6716);
    float _6720 = _6668 * (*spvDescriptorSet0.vp_c15)._m0[654].z;
    float _6722 = exp2(_6720);
    float _6724 = _6633;
    float _6726 = _6627;
    float _6728 = _6670;
    float _6730 = _6583;
    float _6732 = _6613;
    if (_6706)
    {
        _5621 = _6672;
    }
    float _6734 = _5621;
    float _6736 = _6734;
    if (_6706)
    {
        _4823 = _6670;
    }
    float _6738 = _4823;
    float _6740 = _6738;
    if (_6706)
    {
        _6724 = _6734;
    }
    float _6742 = _6724;
    float _6744 = _6742;
    if (!_6706)
    {
        _6736 = _6672;
    }
    float _6746 = _6736;
    if (_6706)
    {
        _6726 = _6738;
    }
    float _6748 = _6726;
    float _6750 = _6748;
    if (!_6706)
    {
        _6740 = _6670;
    }
    float _6752 = _6740;
    if (!_6706)
    {
        float _6754 = fma(_5779, (*spvDescriptorSet0.vp_c9)._m0[17].y, _6746);
        _6744 = _6754;
    }
    float _6756 = _6744;
    float _6758 = _6690 * _6674;
    float _6760 = fma(_6722, (*spvDescriptorSet0.vp_c15)._m0[654].x, (*spvDescriptorSet0.vp_c15)._m0[654].y);
    float _6762 = precise::clamp(_6760, 0.0, 1.0);
    if (_6706)
    {
        _6728 = _6674;
    }
    float _6764 = _6728;
    float _6766 = _6764;
    if (!_6706)
    {
        float _6768 = fma(_5777, (*spvDescriptorSet0.vp_c9)._m0[17].y, _6752);
        _6750 = _6768;
    }
    float _6770 = _6750;
    if (!_6706)
    {
        float _6772 = fma(_5781, (*spvDescriptorSet0.vp_c9)._m0[17].y, _6674);
        _6766 = _6772;
    }
    float _6774 = _6766;
    float _6776 = _6692 * _6752;
    float _6778 = _6688 * _6746;
    float _6780 = -_6758;
    float _6782 = fma(_6692, _6746, _6780);
    float _6784 = fma(_6762, -2.0, 3.0);
    float _6786 = _6762 * _6762;
    float _6788 = -_6776;
    float _6790 = fma(_6688, _6674, _6788);
    float _6792 = -_6778;
    float _6794 = fma(_6690, _6752, _6792);
    float _6796 = _5839 * _5925;
    float _6798 = _6786 * _6784;
    float _6800 = _5857 * _5925;
    float _6802 = _5857 * _5945;
    float _6804 = _6790 * _6694;
    float _6806 = _6782 * _6694;
    float _6808 = _5857 * _5921;
    float _6810 = _6794 * _6694;
    float _6812 = _5839 * _5945;
    float _6814 = _5839 * _5921;
    float _6816 = _5877 * _5925;
    float _6818 = _5877 * _5921;
    float _6820 = fma(_5885, _5903, _6796);
    float _6822 = -_5797;
    float _6824 = fma(_6822, _5903, _6800);
    float _6826 = -_5797;
    float _6828 = fma(_6826, _5905, _6802);
    float _6830 = -_5797;
    float _6832 = fma(_6830, _5907, _6808);
    float _6834 = fma(_5885, _5905, _6812);
    float _6836 = fma(_5885, _5907, _6814);
    float _6838 = -_6798;
    float _6840 = _6838 + 1.0;
    float _6842 = fma(_5863, _5799, _6820);
    float _6844 = fma(_5895, _5903, _6816);
    float _6846 = fma(_5895, _5907, _6818);
    float _6848 = fma(_5873, _5799, _6824);
    float _6850 = fma(_5873, _5803, _6828);
    float _6852 = fma(_5873, _5801, _6832);
    float _6854 = fma(_5863, _5803, _6834);
    float _6856 = fma(_6840, (*spvDescriptorSet0.vp_c15)._m0[654].w, _6798);
    float _6858 = fma(_5863, _5801, _6836);
    float _6860 = fma(_5843, _5803, _6702);
    float _6862 = fma(_5843, _5799, _6844);
    float _6864 = fma(_5843, _5801, _6846);
    float _6866 = _6848 * _6690;
    float _6868 = _6850 * _6690;
    float _6870 = _6852 * _6690;
    float _6872 = _6804 * _6848;
    float _6874 = _6804 * _6850;
    float _6876 = _6804 * _6852;
    float _6878 = _6547 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _6880 = _6718 * _6856;
    float _6882 = _6848 * _6756;
    float _6884 = _6850 * _6756;
    float _6886 = fma(_6551, (*spvDescriptorSet0.vp_c8)._m0[6].x, _6878);
    float _6888 = _6852 * _6756;
    float _6890 = fma(_6842, _6770, _6882);
    float _6892 = fma(_6842, _6688, _6866);
    float _6894 = fma(_6511, (*spvDescriptorSet0.vp_c8)._m0[6].z, _6886);
    float _6896 = _6519 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _6898 = fma(_6854, _6688, _6868);
    float _6900 = fma(_6806, _6842, _6872);
    float _6902 = fma(_6806, _6854, _6874);
    float _6904 = fma(_6806, _6858, _6876);
    float _6906 = exp2(_6896);
    float _6908 = fma(_6858, _6688, _6870);
    float _6910 = fma(_6854, _6770, _6884);
    float _6912 = fma(_6862, _6692, _6892);
    float _6914 = fma(_6860, _6692, _6898);
    float _6916 = fma(_6810, _6862, _6900);
    float _6918 = fma(_6810, _6860, _6902);
    float _6920 = fma(_6810, _6864, _6904);
    float _6922 = fma(_6864, _6692, _6908);
    float _6924 = in.m_91.x;
    float _6926 = _6880 * (*spvDescriptorSet0.vp_c15)._m0[653].x;
    float _6928 = fma(_6529, (*spvDescriptorSet0.vp_c8)._m0[6].w, _6894);
    float _6930 = fma(_6858, _6770, _6888);
    out.m_93.x = _6912;
    out.m_93.y = _6914;
    out.m_93.z = _6922;
    float _6932 = _6928 + _6583;
    float _6934 = -_6906;
    float _6936 = _6934 + 1.0;
    float _6938 = fma(_6860, _6774, _6910);
    out.m_95.x = _6916;
    out.m_95.y = _6918;
    out.m_95.z = _6920;
    float _6940 = _6932 * 0.5;
    float _6942 = _6936 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _6944 = fma(_6862, _6774, _6890);
    float _6946 = fma(_6864, _6774, _6930);
    bool _6948 = _6331 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _6950 = isnan(_6331);
    bool _6952 = _6948 || _6950;
    bool _6954 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _6956 = _6952 || _6954;
    float _6958 = -_6942;
    float _6960 = _6958 + 1.0;
    out.m_97.z = _6940;
    out.m_97.w = _6583;
    out.m_99.x = _6944;
    out.m_99.y = _6938;
    out.m_99.z = _6946;
    out.gl_Position.x = _6603;
    out.gl_Position.y = _6613;
    out.gl_Position.z = _6928;
    out.gl_Position.w = _6583;
    float _6962 = _6603;
    float _6964 = _6960;
    if (!_6956)
    {
        _5707 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _6966 = _5707;
    float _6968 = _6966;
    float _6970 = _6966;
    if (!_6956)
    {
        _5709 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _6972 = _5709;
    float _6974 = _6309 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _6976 = _6972;
    float _6978 = _6972;
    if (!_6956)
    {
        _6730 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _6980 = _6730;
    float _6982 = _6980;
    float _6984 = _6980;
    if (!_6956)
    {
        _6962 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _6986 = _6962;
    float _6988 = _6986;
    float _6990 = _6986;
    if (!_6956)
    {
        _6732 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _6992 = _6732;
    float _6994 = -_6615;
    float _6996 = _6994 + 1.0;
    float _6998 = _6996 * _6926;
    float _7000 = precise::clamp(_6998, 0.0, 1.0);
    float _7002 = -_7000;
    float _7004 = fma(_7002, (*spvDescriptorSet0.vp_c15)._m0[653].y, 1.0);
    float _7006 = _7004 * _6924;
    float _7008 = _6942 * _6639;
    float _7010 = _7006 * (*spvDescriptorSet0.vp_c13)._m0[1].w;
    float _7012 = _6650 * _6960;
    float _7014 = _6992;
    float _7016 = _6992;
    if (!_6956)
    {
        _6964 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _7018 = _6964;
    float _7020 = _6650 * _7008;
    out.m_101.x = _7010;
    float _7022 = _6664 * _7008;
    float _7024 = fma(_6660, _7020, _6644);
    float _7026 = fma(_6662, _7020, _6646);
    float _7028 = fma(_6650, _7022, _6648);
    out.m_103.x = _7024;
    out.m_103.y = _7026;
    out.m_103.z = _7028;
    out.m_103.w = _7012;
    bool _7030 = !_6956;
    float _7032 = _7018;
    float _7034 = _7018;
    if (!_7030)
    {
        bool _7036 = _6331 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _7038 = isnan(_6331);
        bool _7040 = _7036 || _7038;
        bool _7042 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _7044 = _7040 || _7042;
        if (!_7044)
        {
            float _7046 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _7048 = _6331 + _7046;
            float _7050 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _7052 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _7050;
            float _7054 = 1.0 / _7052;
            float _7056 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _7058 = _7056 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _7060 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _7062 = _7060 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _7064 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _7066 = _7064 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _7068 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _7070 = _7068 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _7072 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _7074 = _7072 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _7076 = _7048 * _7054;
            float _7078 = precise::clamp(_7076, 0.0, 1.0);
            float _7080 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _7082 = _7080 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _7084 = fma(_7078, _7062, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _7086 = fma(_7078, _7082, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _7088 = fma(_7078, _7058, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _7090 = fma(_7078, _7066, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _7092 = fma(_7078, _7070, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _7094 = fma(_7078, _7074, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            _6978 = _7088;
            _6990 = _7092;
            _6970 = _7086;
            _6984 = _7090;
            _7034 = _7084;
            _7016 = _7094;
            _7096 = true;
        }
        else
        {
            bool _7098 = _6331 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _7100 = isnan(_6331);
            bool _7102 = _7098 || _7100;
            bool _7104 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _7106 = _7102 || _7104;
            if (!_7106)
            {
                _6982 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _7108 = _6982;
            _6984 = _7108;
            if (!_7106)
            {
                _6988 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _7110 = _6988;
            _6990 = _7110;
            if (!_7106)
            {
                _7014 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _7112 = _7014;
            _7016 = _7112;
            if (!_7106)
            {
                _6968 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _7114 = _6968;
            _6970 = _7114;
            if (!_7106)
            {
                _6976 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _7116 = _6976;
            _6978 = _7116;
            if (!_7106)
            {
                _7032 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _7118 = _7032;
            bool _7120 = !_7106;
            _7034 = _7118;
            if (!_7120)
            {
                bool _7122 = _6331 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _7124 = isnan(_6331);
                bool _7126 = _7122 || _7124;
                bool _7128 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _7130 = _7126 || _7128;
                if (!_7130)
                {
                    float _7132 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _7134 = _6331 + _7132;
                    float _7136 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _7138 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _7136;
                    float _7140 = 1.0 / _7138;
                    float _7142 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _7144 = _7142 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _7146 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _7148 = _7146 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _7150 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _7152 = _7150 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _7154 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _7156 = _7154 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _7158 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _7160 = _7158 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _7162 = _7134 * _7140;
                    float _7164 = precise::clamp(_7162, 0.0, 1.0);
                    float _7166 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _7168 = _7166 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _7170 = fma(_7164, _7148, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _7172 = fma(_7164, _7168, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _7174 = fma(_7164, _7144, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _7176 = fma(_7164, _7152, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _7178 = fma(_7164, _7156, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _7180 = fma(_7164, _7160, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    _6978 = _7174;
                    _6990 = _7178;
                    _6970 = _7172;
                    _6984 = _7176;
                    _7034 = _7170;
                    _7016 = _7180;
                    _7096 = true;
                }
                else
                {
                    _6978 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _6990 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _6970 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _6984 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _7034 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _7016 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _7096 = false;
    float _7182 = _6978;
    float _7184 = _6990;
    float _7186 = _6970;
    float _7188 = _6984;
    float _7190 = _7034;
    float _7192 = _7016;
    float _7194 = fma(_6938, -0.5, 0.5);
    float _7196 = precise::clamp(_7194, 0.0, 1.0);
    float _7198 = -_7182;
    float _7200 = _7184 + _7198;
    float _7202 = _6974 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _7204 = -_7186;
    float _7206 = _7188 + _7204;
    float _7208 = fma(_7196, _7200, _7182);
    out.m_105.x = 0.0;
    float _7210 = -_7190;
    float _7212 = _7192 + _7210;
    float _7214 = fma(_7196, _7206, _7186);
    float _7216 = _7208 * 0.586610972881317138671875;
    out.m_49.x = _7202;
    bool _7218 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _7220 = fma(_7196, _7212, _7190);
    float _7222 = fma(_7214, 0.298911988735198974609375, _7216);
    bool _7224 = _6309 > 0.0;
    bool _7226 = isnan(_6309);
    bool _7228 = _7224 || _7226;
    bool _7230 = isnan(0.0);
    bool _7232 = _7228 || _7230;
    float _7234 = fma(_7220, 0.114477999508380889892578125, _7222);
    float _7236 = -_7234;
    float _7238 = _7214 + _7236;
    float _7240 = -_7234;
    float _7242 = _7208 + _7240;
    float _7244 = -_7234;
    float _7246 = _7220 + _7244;
    float _7248 = fma(_7238, (*spvDescriptorSet0.vp_c13)._m0[1].z, _7234);
    float _7250 = fma(_7242, (*spvDescriptorSet0.vp_c13)._m0[1].z, _7234);
    float _7252 = fma(_7246, (*spvDescriptorSet0.vp_c13)._m0[1].z, _7234);
    bool _7254 = !_7218;
    if (!_7254)
    {
        float _7256 = -_6251;
        float _7258 = _7256 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
        float _7260 = -_6253;
        float _7262 = _7260 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
        float _7264 = -_6255;
        float _7266 = _7264 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
        float _7268 = _7258 * _7258;
        float _7270 = fma(_7262, _7262, _7268);
        float _7272 = fma(_7266, _7266, _7270);
        float _7274 = sqrt(_7272);
        float _7276 = rsqrt(_7272);
        float _7278 = -_7274;
        float _7280 = _7278 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
        float _7282 = _7280 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
        float _7284 = precise::clamp(_7282, 0.0, 1.0);
        float _7286 = _7262 * _7276;
        float _7288 = _7258 * _7276;
        float _7290 = abs(_7284);
        float _7292 = log2(_7290);
        float _7294 = _7266 * _7276;
        float _7296 = _7286 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
        float _7298 = _6938 * _7288;
        float _7300 = -_7288;
        float _7302 = -_7296;
        float _7304 = fma(_7300, (*spvDescriptorSet0.vp_c15)._m0[656].y, _7302);
        float _7306 = fma(_6944, _7286, _7298);
        float _7308 = -_7294;
        float _7310 = fma(_7308, (*spvDescriptorSet0.vp_c15)._m0[656].z, _7304);
        float _7312 = fma(_6946, _7294, _7306);
        float _7314 = precise::clamp(_7312, 0.0, 1.0);
        float _7316 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
        float _7318 = _7310 + _7316;
        float _7320 = _7292 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
        float _7322 = _7318 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
        float _7324 = precise::clamp(_7322, 0.0, 1.0);
        float _7326 = exp2(_7320);
        float _7328 = _7326 * _7324;
        float _7330 = _7314 * _7328;
        float _7332 = _7330 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
        float _7334 = _7330 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
        float _7336 = _7330 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
        out.m_105.x = _7332;
        out.m_105.y = _7334;
        out.m_105.z = _7336;
    }
    out.m_107.x = _7248;
    out.m_107.y = _7250;
    out.m_107.z = _7252;
    if (_7232)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _7338 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.m_49.x = 0.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _7338;
    out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
}


vertex main0_out main0_z(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]])
{
    main0_out out = {};
    out.m_59 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_61 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_67 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_71 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_79 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_81 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_89 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_73 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_77 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_95 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_99 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_97 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_49 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_93 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_105 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_101 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_103 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_107 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_63 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_65 = float4(0.0, 0.0, 0.0, 1.0);
    bool _7096 = false;
    bool _1790 = false;
    bool _1460 = false;
    bool _1142 = false;
    bool _824 = false;
    bool _682 = false;
    bool _568 = false;
    bool _452 = false;
    bool _230 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _121 = in.m_46.w;
    float _123 = trunc(_121);
    int _126 = int(_123);
    bool _130 = _126 >= 1;
    float _132 = 0.0;
    if (!_130)
    {
        _132 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _134 = _132;
    float _136 = _134;
    if (!_130)
    {
        out.m_49.x = 0.0;
    }
    int _138 = 0;
    if (!_130)
    {
        float _140 = _134 * 5.0;
        _138 = as_type<int>(_140);
    }
    int _142 = _138;
    int _144 = _142;
    if (!_130)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _7395 = as_type<float>(_142);
        out.gl_Position.z = _7395;
    }
    if (!_130)
    {
        return out;
    }
    float _146 = in.m_51.w;
    bool _148 = _146 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _150 = isnan(_146);
    bool _152 = _148 || _150;
    bool _154 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _156 = _152 || _154;
    float _158 = -_146;
    float _160 = _158 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    float _162 = _160;
    if (_156)
    {
        float _164 = float(_126);
        _136 = _164;
    }
    float _166 = _136;
    bool _168 = _160 >= _166;
    bool _170 = !_156;
    bool _172 = _168 || _170;
    float _174 = _166;
    if (_172)
    {
        _174 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _176 = _174;
    if (_172)
    {
        out.m_49.x = 0.0;
    }
    if (_172)
    {
        float _178 = _176 * 5.0;
        _144 = as_type<int>(_178);
    }
    int _180 = _144;
    if (_172)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _7465 = as_type<float>(_180);
        out.gl_Position.z = _7465;
    }
    if (_172)
    {
        return out;
    }
    float _182 = in.m_53.x;
    float _184 = in.m_53.y;
    float _186 = in.m_53.z;
    bool _188 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _190 = _184 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _192 = _184 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _194 = _184 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _196 = fma(_182, (*spvDescriptorSet0.vp_c10)._m0[4].x, _190);
    float _198 = fma(_182, (*spvDescriptorSet0.vp_c10)._m0[5].x, _192);
    float _200 = fma(_182, (*spvDescriptorSet0.vp_c10)._m0[6].x, _194);
    float _202 = fma(_186, (*spvDescriptorSet0.vp_c10)._m0[4].z, _196);
    float _204 = fma(_186, (*spvDescriptorSet0.vp_c10)._m0[5].z, _198);
    float _206 = fma(_186, (*spvDescriptorSet0.vp_c10)._m0[6].z, _200);
    bool _208 = !_188;
    float _210 = _202;
    float _228;
    if (!_208)
    {
        float _212 = in.m_55.x;
        float _214 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _216 = _212 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _218 = fma(_216, (*spvDescriptorSet0.vp_c9)._m0[12].x, _160);
        float _220 = _218 * _214;
        float _222 = floor(_220);
        float _224 = -_222;
        float _226 = _220 + _224;
        _228 = _226;
        _230 = true;
    }
    else
    {
        float _232 = float(_126);
        float _234 = 1.0 / _232;
        float _236 = _160 * _234;
        _228 = _236;
    }
    _230 = false;
    float _238 = _228;
    float _240 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _242 = _238 + _240;
    float _244 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _246 = _238 + _244;
    bool _248 = _238 >= (*spvDescriptorSet0.vp_c9)._m0[146].w;
    bool _250 = isnan(_238);
    bool _252 = _248 || _250;
    bool _254 = isnan((*spvDescriptorSet0.vp_c9)._m0[146].w);
    bool _256 = _252 || _254;
    float _258 = float(_256);
    float _260 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _262 = (*spvDescriptorSet0.vp_c9)._m0[146].w + _260;
    float _264 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _266 = _238 + _264;
    float _268 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _270 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _268;
    float _272 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _274 = _272 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _276 = 1.0 / _262;
    bool _278 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _280 = 1.0 / _274;
    float _282 = 1.0 / _270;
    float _284 = _242 * _276;
    bool _286 = _238 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _288 = isnan(_238);
    bool _290 = _286 || _288;
    bool _292 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _294 = _290 || _292;
    float _296 = float(_294);
    float _298 = -_258;
    float _300 = _298 + 1.0;
    float _302 = _296 * _300;
    float _304 = _246 * _280;
    bool _306 = _238 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _308 = isnan(_238);
    bool _310 = _306 || _308;
    bool _312 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _314 = _310 || _312;
    float _316 = float(_314);
    float _318 = -(*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _320 = (*spvDescriptorSet0.vp_c9)._m0[144].z + _318;
    bool _322 = _238 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _324 = isnan(_238);
    bool _326 = _322 || _324;
    bool _328 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _330 = _326 || _328;
    float _332 = float(_330);
    float _334 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _336 = _334 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _338 = -_296;
    float _340 = _338 + 1.0;
    float _342 = -_316;
    float _344 = _342 + 1.0;
    float _346 = _266 * _282;
    float _348 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _350 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _348;
    float _352 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _354 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _352;
    float _356 = _332 * _344;
    float _358 = fma(_320, _346, (*spvDescriptorSet0.vp_c9)._m0[143].z);
    float _360 = fma(_350, _346, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _362 = fma(_354, _346, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _364 = _316 * _340;
    float _366 = -(*spvDescriptorSet0.vp_c9)._m0[144].z;
    float _368 = _366 + (*spvDescriptorSet0.vp_c9)._m0[145].z;
    float _370 = _360 * _356;
    float _372 = _362 * _356;
    float _374 = _358 * _356;
    float _376 = -_332;
    float _378 = _376 + 1.0;
    float _380 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _382 = _380 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _384 = fma(_378, (*spvDescriptorSet0.vp_c9)._m0[143].x, _372);
    float _386 = fma(_378, (*spvDescriptorSet0.vp_c9)._m0[143].y, _370);
    float _388 = fma(_378, (*spvDescriptorSet0.vp_c9)._m0[143].z, _374);
    float _390 = -(*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _392 = (*spvDescriptorSet0.vp_c9)._m0[146].x + _390;
    float _394 = fma(_336, _304, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _396 = fma(_382, _304, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _398 = fma(_368, _304, (*spvDescriptorSet0.vp_c9)._m0[144].z);
    float _400 = -(*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _402 = (*spvDescriptorSet0.vp_c9)._m0[146].y + _400;
    float _404 = -(*spvDescriptorSet0.vp_c9)._m0[145].z;
    float _406 = (*spvDescriptorSet0.vp_c9)._m0[146].z + _404;
    float _408 = fma(_394, _364, _384);
    float _410 = fma(_392, _284, (*spvDescriptorSet0.vp_c9)._m0[145].x);
    float _412 = fma(_402, _284, (*spvDescriptorSet0.vp_c9)._m0[145].y);
    float _414 = fma(_406, _284, (*spvDescriptorSet0.vp_c9)._m0[145].z);
    float _416 = fma(_396, _364, _386);
    float _418 = fma(_398, _364, _388);
    float _420 = fma(_410, _302, _408);
    float _422 = fma(_412, _302, _416);
    float _424 = fma(_414, _302, _418);
    float _426 = fma(_258, (*spvDescriptorSet0.vp_c9)._m0[146].x, _420);
    float _428 = fma(_258, (*spvDescriptorSet0.vp_c9)._m0[146].y, _422);
    float _430 = fma(_258, (*spvDescriptorSet0.vp_c9)._m0[146].z, _424);
    bool _432 = !_278;
    float _450;
    if (!_432)
    {
        float _434 = in.m_55.x;
        float _436 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _438 = _434 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _440 = fma(_438, (*spvDescriptorSet0.vp_c9)._m0[11].y, _160);
        float _442 = _440 * _436;
        float _444 = floor(_442);
        float _446 = -_444;
        float _448 = _442 + _446;
        _450 = _448;
        _452 = true;
    }
    else
    {
        float _454 = float(_126);
        float _456 = 1.0 / _454;
        float _458 = _160 * _456;
        _450 = _458;
    }
    _452 = false;
    float _460 = _450;
    float _462 = in.m_57.x;
    float _464 = in.m_57.y;
    float _466 = in.m_57.z;
    bool _468 = _460 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _470 = isnan(_460);
    bool _472 = _468 || _470;
    bool _474 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _476 = _472 || _474;
    float _478 = float(_476);
    float _480 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _482 = _480 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _484 = _460 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _486 = isnan(_460);
    bool _488 = _484 || _486;
    bool _490 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _492 = _488 || _490;
    float _494 = float(_492);
    float _496 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _498 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _496;
    float _500 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _502 = _460 + _500;
    float _504 = -_478;
    float _506 = _504 + 1.0;
    bool _508 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].z;
    float _510 = 1.0 / _482;
    float _512 = _494 * _506;
    float _514 = -_494;
    float _516 = _514 + 1.0;
    float _518 = _430 * _466;
    float _520 = _428 * _464;
    float _522 = _498 * _510;
    float _524 = _426 * _462;
    float _526 = fma(_522, _502, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _528 = _526 * _512;
    float _530 = fma(_516, (*spvDescriptorSet0.vp_c9)._m0[115].x, _528);
    float _532 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _534 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _536 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _538 = fma(_478, (*spvDescriptorSet0.vp_c9)._m0[116].x, _530);
    float _540 = _532 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _542 = _534 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _544 = _536 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _546 = _538 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    out.m_59.x = _540;
    out.m_59.y = _542;
    out.m_59.z = _544;
    out.m_59.w = _546;
    bool _548 = !_508;
    float _566;
    if (!_548)
    {
        float _550 = in.m_55.x;
        float _552 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].z;
        float _554 = _550 * (*spvDescriptorSet0.vp_c9)._m0[12].w;
        float _556 = fma(_554, (*spvDescriptorSet0.vp_c9)._m0[11].z, _160);
        float _558 = _556 * _552;
        float _560 = floor(_558);
        float _562 = -_560;
        float _564 = _558 + _562;
        _566 = _564;
        _568 = true;
    }
    else
    {
        float _570 = float(_126);
        float _572 = 1.0 / _570;
        float _574 = _160 * _572;
        _566 = _574;
    }
    _568 = false;
    float _576 = _566;
    float _578 = -(*spvDescriptorSet0.vp_c9)._m0[123].w;
    float _580 = _576 + _578;
    bool _582 = _576 >= (*spvDescriptorSet0.vp_c9)._m0[124].w;
    bool _584 = isnan(_576);
    bool _586 = _582 || _584;
    bool _588 = isnan((*spvDescriptorSet0.vp_c9)._m0[124].w);
    bool _590 = _586 || _588;
    float _592 = float(_590);
    float _594 = -(*spvDescriptorSet0.vp_c9)._m0[123].w;
    float _596 = (*spvDescriptorSet0.vp_c9)._m0[124].w + _594;
    bool _598 = _576 >= (*spvDescriptorSet0.vp_c9)._m0[123].w;
    bool _600 = isnan(_576);
    bool _602 = _598 || _600;
    bool _604 = isnan((*spvDescriptorSet0.vp_c9)._m0[123].w);
    bool _606 = _602 || _604;
    float _608 = float(_606);
    float _610 = -_592;
    float _612 = _610 + 1.0;
    float _614 = -(*spvDescriptorSet0.vp_c9)._m0[123].x;
    float _616 = (*spvDescriptorSet0.vp_c9)._m0[124].x + _614;
    float _618 = 1.0 / _596;
    bool _620 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].w;
    float _622 = _608 * _612;
    float _624 = -_608;
    float _626 = _624 + 1.0;
    float _628 = _580 * _618;
    float _630 = -(*spvDescriptorSet0.vp_c9)._m0[123].z;
    float _632 = (*spvDescriptorSet0.vp_c9)._m0[124].z + _630;
    float _634 = fma(_616, _628, (*spvDescriptorSet0.vp_c9)._m0[123].x);
    float _636 = -(*spvDescriptorSet0.vp_c9)._m0[123].y;
    float _638 = (*spvDescriptorSet0.vp_c9)._m0[124].y + _636;
    float _640 = fma(_632, _628, (*spvDescriptorSet0.vp_c9)._m0[123].z);
    float _642 = _634 * _622;
    float _644 = fma(_638, _628, (*spvDescriptorSet0.vp_c9)._m0[123].y);
    float _646 = _640 * _622;
    float _648 = _644 * _622;
    float _650 = fma(_626, (*spvDescriptorSet0.vp_c9)._m0[123].x, _642);
    float _652 = fma(_626, (*spvDescriptorSet0.vp_c9)._m0[123].y, _648);
    float _654 = fma(_626, (*spvDescriptorSet0.vp_c9)._m0[123].z, _646);
    float _656 = fma(_592, (*spvDescriptorSet0.vp_c9)._m0[124].x, _650);
    float _658 = fma(_592, (*spvDescriptorSet0.vp_c9)._m0[124].y, _652);
    float _660 = fma(_592, (*spvDescriptorSet0.vp_c9)._m0[124].z, _654);
    bool _662 = !_620;
    float _680;
    if (!_662)
    {
        float _664 = in.m_55.x;
        float _666 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].w;
        float _668 = _664 * (*spvDescriptorSet0.vp_c9)._m0[13].x;
        float _670 = fma(_668, (*spvDescriptorSet0.vp_c9)._m0[11].w, _160);
        float _672 = _670 * _666;
        float _674 = floor(_672);
        float _676 = -_674;
        float _678 = _672 + _676;
        _680 = _678;
        _682 = true;
    }
    else
    {
        float _684 = float(_126);
        float _686 = 1.0 / _684;
        float _688 = _160 * _686;
        _680 = _688;
    }
    _682 = false;
    float _690 = _680;
    float _692 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _694 = _690 + _692;
    float _696 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _698 = _696 + (*spvDescriptorSet0.vp_c9)._m0[132].w;
    bool _700 = _690 >= (*spvDescriptorSet0.vp_c9)._m0[132].w;
    bool _702 = isnan(_690);
    bool _704 = _700 || _702;
    bool _706 = isnan((*spvDescriptorSet0.vp_c9)._m0[132].w);
    bool _708 = _704 || _706;
    float _710 = float(_708);
    float _712 = -(*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _714 = _712 + (*spvDescriptorSet0.vp_c9)._m0[133].w;
    bool _716 = _690 >= (*spvDescriptorSet0.vp_c9)._m0[131].w;
    bool _718 = isnan(_690);
    bool _720 = _716 || _718;
    bool _722 = isnan((*spvDescriptorSet0.vp_c9)._m0[131].w);
    bool _724 = _720 || _722;
    float _726 = float(_724);
    float _728 = -(*spvDescriptorSet0.vp_c9)._m0[131].x;
    float _730 = (*spvDescriptorSet0.vp_c9)._m0[132].x + _728;
    bool _732 = _690 >= (*spvDescriptorSet0.vp_c9)._m0[133].w;
    bool _734 = isnan(_690);
    bool _736 = _732 || _734;
    bool _738 = isnan((*spvDescriptorSet0.vp_c9)._m0[133].w);
    bool _740 = _736 || _738;
    float _742 = float(_740);
    float _744 = 1.0 / _698;
    float _746 = -_710;
    float _748 = _746 + 1.0;
    bool _750 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[14].x;
    float _752 = _726 * _748;
    float _754 = -_726;
    float _756 = _754 + 1.0;
    float _758 = 1.0 / _714;
    float _760 = _730 * _744;
    float _762 = -(*spvDescriptorSet0.vp_c9)._m0[132].x;
    float _764 = _762 + (*spvDescriptorSet0.vp_c9)._m0[133].x;
    float _766 = fma(_760, _694, (*spvDescriptorSet0.vp_c9)._m0[131].x);
    float _768 = _764 * _758;
    float _770 = _766 * _752;
    float _772 = -_742;
    float _774 = _772 + 1.0;
    float _776 = -(*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _778 = _690 + _776;
    float _780 = _656 * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _782 = fma(_756, (*spvDescriptorSet0.vp_c9)._m0[131].x, _770);
    float _784 = _710 * _774;
    float _786 = fma(_768, _778, (*spvDescriptorSet0.vp_c9)._m0[132].x);
    float _788 = _660 * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _790 = fma(_786, _784, _782);
    float _792 = _658 * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _794 = _780 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _796 = _788 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _798 = fma(_742, (*spvDescriptorSet0.vp_c9)._m0[133].x, _790);
    float _800 = _792 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _802 = _798 * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    out.m_61.x = _794;
    out.m_61.y = _800;
    out.m_61.z = _796;
    out.m_61.w = _802;
    bool _804 = !_750;
    float _822;
    if (!_804)
    {
        float _806 = in.m_55.x;
        float _808 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[14].x;
        float _810 = _806 * (*spvDescriptorSet0.vp_c9)._m0[15].x;
        float _812 = fma(_810, (*spvDescriptorSet0.vp_c9)._m0[14].x, _160);
        float _814 = _812 * _808;
        float _816 = floor(_814);
        float _818 = -_816;
        float _820 = _814 + _818;
        _822 = _820;
        _824 = true;
    }
    else
    {
        float _826 = float(_126);
        float _828 = 1.0 / _826;
        float _830 = _160 * _828;
        _822 = _830;
    }
    _824 = false;
    float _832 = _822;
    float _834 = -(*spvDescriptorSet0.vp_c9)._m0[159].w;
    float _836 = _832 + _834;
    bool _838 = _832 >= (*spvDescriptorSet0.vp_c9)._m0[165].w;
    bool _840 = isnan(_832);
    bool _842 = _838 || _840;
    bool _844 = isnan((*spvDescriptorSet0.vp_c9)._m0[165].w);
    bool _846 = _842 || _844;
    float _848 = float(_846);
    float _850 = -(*spvDescriptorSet0.vp_c9)._m0[159].w;
    float _852 = _850 + (*spvDescriptorSet0.vp_c9)._m0[160].w;
    bool _854 = _832 >= (*spvDescriptorSet0.vp_c9)._m0[164].w;
    bool _856 = isnan(_832);
    bool _858 = _854 || _856;
    bool _860 = isnan((*spvDescriptorSet0.vp_c9)._m0[164].w);
    bool _862 = _858 || _860;
    float _864 = float(_862);
    float _866 = -(*spvDescriptorSet0.vp_c9)._m0[159].x;
    float _868 = (*spvDescriptorSet0.vp_c9)._m0[160].x + _866;
    bool _870 = _832 >= (*spvDescriptorSet0.vp_c9)._m0[163].w;
    bool _872 = isnan(_832);
    bool _874 = _870 || _872;
    bool _876 = isnan((*spvDescriptorSet0.vp_c9)._m0[163].w);
    bool _878 = _874 || _876;
    float _880 = float(_878);
    float _882 = -_848;
    float _884 = _882 + 1.0;
    float _886 = 1.0 / _852;
    float _888 = _864 * _884;
    float _890 = -_880;
    float _892 = _890 + 1.0;
    float _894 = -(*spvDescriptorSet0.vp_c9)._m0[160].w;
    float _896 = _894 + (*spvDescriptorSet0.vp_c9)._m0[161].w;
    bool _898 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[14].y;
    float _900 = 1.0 / _896;
    float _902 = _868 * _886;
    float _904 = -_864;
    float _906 = _904 + 1.0;
    bool _908 = _832 >= (*spvDescriptorSet0.vp_c9)._m0[162].w;
    bool _910 = isnan(_832);
    bool _912 = _908 || _910;
    bool _914 = isnan((*spvDescriptorSet0.vp_c9)._m0[162].w);
    bool _916 = _912 || _914;
    float _918 = float(_916);
    float _920 = fma(_902, _836, (*spvDescriptorSet0.vp_c9)._m0[159].x);
    float _922 = _880 * _906;
    bool _924 = _832 >= (*spvDescriptorSet0.vp_c9)._m0[161].w;
    bool _926 = isnan(_832);
    bool _928 = _924 || _926;
    bool _930 = isnan((*spvDescriptorSet0.vp_c9)._m0[161].w);
    bool _932 = _928 || _930;
    float _934 = float(_932);
    float _936 = _918 * _892;
    float _938 = -_918;
    float _940 = _938 + 1.0;
    float _942 = -(*spvDescriptorSet0.vp_c9)._m0[161].w;
    float _944 = _942 + (*spvDescriptorSet0.vp_c9)._m0[162].w;
    bool _946 = _832 >= (*spvDescriptorSet0.vp_c9)._m0[160].w;
    bool _948 = isnan(_832);
    bool _950 = _946 || _948;
    bool _952 = isnan((*spvDescriptorSet0.vp_c9)._m0[160].w);
    bool _954 = _950 || _952;
    float _956 = float(_954);
    float _958 = _934 * _940;
    float _960 = -_934;
    float _962 = _960 + 1.0;
    float _964 = -(*spvDescriptorSet0.vp_c9)._m0[162].w;
    float _966 = _964 + (*spvDescriptorSet0.vp_c9)._m0[163].w;
    float _968 = 1.0 / _944;
    bool _970 = _832 >= (*spvDescriptorSet0.vp_c9)._m0[159].w;
    bool _972 = isnan(_832);
    bool _974 = _970 || _972;
    bool _976 = isnan((*spvDescriptorSet0.vp_c9)._m0[159].w);
    bool _978 = _974 || _976;
    float _980 = float(_978);
    float _982 = _956 * _962;
    float _984 = -_956;
    float _986 = _984 + 1.0;
    float _988 = -(*spvDescriptorSet0.vp_c9)._m0[163].w;
    float _990 = _988 + (*spvDescriptorSet0.vp_c9)._m0[164].w;
    float _992 = -(*spvDescriptorSet0.vp_c9)._m0[160].x;
    float _994 = _992 + (*spvDescriptorSet0.vp_c9)._m0[161].x;
    float _996 = _980 * _986;
    float _998 = 1.0 / _966;
    float _1000 = _994 * _900;
    float _1002 = _920 * _996;
    float _1004 = -_980;
    float _1006 = _1004 + 1.0;
    float _1008 = -(*spvDescriptorSet0.vp_c9)._m0[164].w;
    float _1010 = _1008 + (*spvDescriptorSet0.vp_c9)._m0[165].w;
    float _1012 = -(*spvDescriptorSet0.vp_c9)._m0[160].w;
    float _1014 = _832 + _1012;
    float _1016 = 1.0 / _990;
    float _1018 = -(*spvDescriptorSet0.vp_c9)._m0[161].x;
    float _1020 = (*spvDescriptorSet0.vp_c9)._m0[162].x + _1018;
    float _1022 = fma(_1006, (*spvDescriptorSet0.vp_c9)._m0[159].x, _1002);
    float _1024 = -(*spvDescriptorSet0.vp_c9)._m0[165].w;
    float _1026 = _1024 + (*spvDescriptorSet0.vp_c9)._m0[166].w;
    float _1028 = fma(_1000, _1014, (*spvDescriptorSet0.vp_c9)._m0[160].x);
    float _1030 = _1020 * _968;
    float _1032 = -(*spvDescriptorSet0.vp_c9)._m0[161].w;
    float _1034 = _832 + _1032;
    float _1036 = 1.0 / _1010;
    float _1038 = -(*spvDescriptorSet0.vp_c9)._m0[162].x;
    float _1040 = _1038 + (*spvDescriptorSet0.vp_c9)._m0[163].x;
    float _1042 = fma(_1030, _1034, (*spvDescriptorSet0.vp_c9)._m0[161].x);
    float _1044 = fma(_1028, _982, _1022);
    float _1046 = -(*spvDescriptorSet0.vp_c9)._m0[163].x;
    float _1048 = (*spvDescriptorSet0.vp_c9)._m0[164].x + _1046;
    float _1050 = _1040 * _998;
    float _1052 = -(*spvDescriptorSet0.vp_c9)._m0[162].w;
    float _1054 = _832 + _1052;
    float _1056 = 1.0 / _1026;
    float _1058 = fma(_1042, _958, _1044);
    float _1060 = _1048 * _1016;
    float _1062 = -(*spvDescriptorSet0.vp_c9)._m0[163].w;
    float _1064 = _832 + _1062;
    float _1066 = -(*spvDescriptorSet0.vp_c9)._m0[164].x;
    float _1068 = _1066 + (*spvDescriptorSet0.vp_c9)._m0[165].x;
    float _1070 = fma(_1050, _1054, (*spvDescriptorSet0.vp_c9)._m0[162].x);
    float _1072 = -(*spvDescriptorSet0.vp_c9)._m0[164].w;
    float _1074 = _832 + _1072;
    float _1076 = fma(_1060, _1064, (*spvDescriptorSet0.vp_c9)._m0[163].x);
    float _1078 = _1068 * _1036;
    float _1080 = -(*spvDescriptorSet0.vp_c9)._m0[165].x;
    float _1082 = (*spvDescriptorSet0.vp_c9)._m0[166].x + _1080;
    bool _1084 = _832 >= (*spvDescriptorSet0.vp_c9)._m0[166].w;
    bool _1086 = isnan(_832);
    bool _1088 = _1084 || _1086;
    bool _1090 = isnan((*spvDescriptorSet0.vp_c9)._m0[166].w);
    bool _1092 = _1088 || _1090;
    float _1094 = float(_1092);
    float _1096 = fma(_1070, _936, _1058);
    float _1098 = fma(_1078, _1074, (*spvDescriptorSet0.vp_c9)._m0[164].x);
    float _1100 = -(*spvDescriptorSet0.vp_c9)._m0[165].w;
    float _1102 = _832 + _1100;
    float _1104 = -_1094;
    float _1106 = _1104 + 1.0;
    float _1108 = _1082 * _1056;
    float _1110 = fma(_1076, _922, _1096);
    float _1112 = _848 * _1106;
    float _1114 = fma(_1108, _1102, (*spvDescriptorSet0.vp_c9)._m0[165].x);
    float _1116 = fma(_1098, _888, _1110);
    float _1118 = fma(_1114, _1112, _1116);
    float _1120 = fma(_1094, (*spvDescriptorSet0.vp_c9)._m0[166].x, _1118);
    out.m_63.x = _1120;
    bool _1122 = !_898;
    float _1140;
    if (!_1122)
    {
        float _1124 = in.m_55.x;
        float _1126 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[14].y;
        float _1128 = _1124 * (*spvDescriptorSet0.vp_c9)._m0[15].y;
        float _1130 = fma(_1128, (*spvDescriptorSet0.vp_c9)._m0[14].y, _160);
        float _1132 = _1130 * _1126;
        float _1134 = floor(_1132);
        float _1136 = -_1134;
        float _1138 = _1132 + _1136;
        _1140 = _1138;
        _1142 = true;
    }
    else
    {
        float _1144 = float(_126);
        float _1146 = 1.0 / _1144;
        float _1148 = _160 * _1146;
        _1140 = _1148;
    }
    _1142 = false;
    float _1150 = _1140;
    float _1152 = -(*spvDescriptorSet0.vp_c9)._m0[167].w;
    float _1154 = _1150 + _1152;
    bool _1156 = _1150 >= (*spvDescriptorSet0.vp_c9)._m0[173].w;
    bool _1158 = isnan(_1150);
    bool _1160 = _1156 || _1158;
    bool _1162 = isnan((*spvDescriptorSet0.vp_c9)._m0[173].w);
    bool _1164 = _1160 || _1162;
    float _1166 = float(_1164);
    float _1168 = -(*spvDescriptorSet0.vp_c9)._m0[167].w;
    float _1170 = _1168 + (*spvDescriptorSet0.vp_c9)._m0[168].w;
    bool _1172 = _1150 >= (*spvDescriptorSet0.vp_c9)._m0[172].w;
    bool _1174 = isnan(_1150);
    bool _1176 = _1172 || _1174;
    bool _1178 = isnan((*spvDescriptorSet0.vp_c9)._m0[172].w);
    bool _1180 = _1176 || _1178;
    float _1182 = float(_1180);
    float _1184 = -(*spvDescriptorSet0.vp_c9)._m0[167].x;
    float _1186 = (*spvDescriptorSet0.vp_c9)._m0[168].x + _1184;
    bool _1188 = _1150 >= (*spvDescriptorSet0.vp_c9)._m0[171].w;
    bool _1190 = isnan(_1150);
    bool _1192 = _1188 || _1190;
    bool _1194 = isnan((*spvDescriptorSet0.vp_c9)._m0[171].w);
    bool _1196 = _1192 || _1194;
    float _1198 = float(_1196);
    float _1200 = -_1166;
    float _1202 = _1200 + 1.0;
    float _1204 = 1.0 / _1170;
    float _1206 = _1182 * _1202;
    float _1208 = -_1198;
    float _1210 = _1208 + 1.0;
    float _1212 = -(*spvDescriptorSet0.vp_c9)._m0[168].w;
    float _1214 = _1212 + (*spvDescriptorSet0.vp_c9)._m0[169].w;
    bool _1216 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[14].z;
    float _1218 = 1.0 / _1214;
    float _1220 = _1186 * _1204;
    float _1222 = -_1182;
    float _1224 = _1222 + 1.0;
    bool _1226 = _1150 >= (*spvDescriptorSet0.vp_c9)._m0[170].w;
    bool _1228 = isnan(_1150);
    bool _1230 = _1226 || _1228;
    bool _1232 = isnan((*spvDescriptorSet0.vp_c9)._m0[170].w);
    bool _1234 = _1230 || _1232;
    float _1236 = float(_1234);
    float _1238 = fma(_1220, _1154, (*spvDescriptorSet0.vp_c9)._m0[167].x);
    float _1240 = _1198 * _1224;
    bool _1242 = _1150 >= (*spvDescriptorSet0.vp_c9)._m0[169].w;
    bool _1244 = isnan(_1150);
    bool _1246 = _1242 || _1244;
    bool _1248 = isnan((*spvDescriptorSet0.vp_c9)._m0[169].w);
    bool _1250 = _1246 || _1248;
    float _1252 = float(_1250);
    float _1254 = _1236 * _1210;
    float _1256 = -_1236;
    float _1258 = _1256 + 1.0;
    float _1260 = -(*spvDescriptorSet0.vp_c9)._m0[169].w;
    float _1262 = _1260 + (*spvDescriptorSet0.vp_c9)._m0[170].w;
    bool _1264 = _1150 >= (*spvDescriptorSet0.vp_c9)._m0[168].w;
    bool _1266 = isnan(_1150);
    bool _1268 = _1264 || _1266;
    bool _1270 = isnan((*spvDescriptorSet0.vp_c9)._m0[168].w);
    bool _1272 = _1268 || _1270;
    float _1274 = float(_1272);
    float _1276 = _1252 * _1258;
    float _1278 = -_1252;
    float _1280 = _1278 + 1.0;
    float _1282 = -(*spvDescriptorSet0.vp_c9)._m0[170].w;
    float _1284 = _1282 + (*spvDescriptorSet0.vp_c9)._m0[171].w;
    float _1286 = 1.0 / _1262;
    bool _1288 = _1150 >= (*spvDescriptorSet0.vp_c9)._m0[167].w;
    bool _1290 = isnan(_1150);
    bool _1292 = _1288 || _1290;
    bool _1294 = isnan((*spvDescriptorSet0.vp_c9)._m0[167].w);
    bool _1296 = _1292 || _1294;
    float _1298 = float(_1296);
    float _1300 = _1274 * _1280;
    float _1302 = -_1274;
    float _1304 = _1302 + 1.0;
    float _1306 = -(*spvDescriptorSet0.vp_c9)._m0[171].w;
    float _1308 = _1306 + (*spvDescriptorSet0.vp_c9)._m0[172].w;
    float _1310 = -(*spvDescriptorSet0.vp_c9)._m0[168].x;
    float _1312 = _1310 + (*spvDescriptorSet0.vp_c9)._m0[169].x;
    float _1314 = _1298 * _1304;
    float _1316 = 1.0 / _1284;
    float _1318 = _1312 * _1218;
    float _1320 = _1238 * _1314;
    float _1322 = -_1298;
    float _1324 = _1322 + 1.0;
    float _1326 = -(*spvDescriptorSet0.vp_c9)._m0[172].w;
    float _1328 = _1326 + (*spvDescriptorSet0.vp_c9)._m0[173].w;
    float _1330 = -(*spvDescriptorSet0.vp_c9)._m0[168].w;
    float _1332 = _1150 + _1330;
    float _1334 = 1.0 / _1308;
    float _1336 = -(*spvDescriptorSet0.vp_c9)._m0[169].x;
    float _1338 = (*spvDescriptorSet0.vp_c9)._m0[170].x + _1336;
    float _1340 = fma(_1324, (*spvDescriptorSet0.vp_c9)._m0[167].x, _1320);
    float _1342 = -(*spvDescriptorSet0.vp_c9)._m0[173].w;
    float _1344 = _1342 + (*spvDescriptorSet0.vp_c9)._m0[174].w;
    float _1346 = fma(_1318, _1332, (*spvDescriptorSet0.vp_c9)._m0[168].x);
    float _1348 = _1338 * _1286;
    float _1350 = -(*spvDescriptorSet0.vp_c9)._m0[169].w;
    float _1352 = _1150 + _1350;
    float _1354 = 1.0 / _1328;
    float _1356 = -(*spvDescriptorSet0.vp_c9)._m0[170].x;
    float _1358 = _1356 + (*spvDescriptorSet0.vp_c9)._m0[171].x;
    float _1360 = fma(_1348, _1352, (*spvDescriptorSet0.vp_c9)._m0[169].x);
    float _1362 = fma(_1346, _1300, _1340);
    float _1364 = -(*spvDescriptorSet0.vp_c9)._m0[171].x;
    float _1366 = (*spvDescriptorSet0.vp_c9)._m0[172].x + _1364;
    float _1368 = _1358 * _1316;
    float _1370 = -(*spvDescriptorSet0.vp_c9)._m0[170].w;
    float _1372 = _1150 + _1370;
    float _1374 = 1.0 / _1344;
    float _1376 = fma(_1360, _1276, _1362);
    float _1378 = _1366 * _1334;
    float _1380 = -(*spvDescriptorSet0.vp_c9)._m0[171].w;
    float _1382 = _1150 + _1380;
    float _1384 = -(*spvDescriptorSet0.vp_c9)._m0[172].x;
    float _1386 = _1384 + (*spvDescriptorSet0.vp_c9)._m0[173].x;
    float _1388 = fma(_1368, _1372, (*spvDescriptorSet0.vp_c9)._m0[170].x);
    float _1390 = -(*spvDescriptorSet0.vp_c9)._m0[172].w;
    float _1392 = _1150 + _1390;
    float _1394 = fma(_1378, _1382, (*spvDescriptorSet0.vp_c9)._m0[171].x);
    float _1396 = _1386 * _1354;
    float _1398 = -(*spvDescriptorSet0.vp_c9)._m0[173].x;
    float _1400 = (*spvDescriptorSet0.vp_c9)._m0[174].x + _1398;
    bool _1402 = _1150 >= (*spvDescriptorSet0.vp_c9)._m0[174].w;
    bool _1404 = isnan(_1150);
    bool _1406 = _1402 || _1404;
    bool _1408 = isnan((*spvDescriptorSet0.vp_c9)._m0[174].w);
    bool _1410 = _1406 || _1408;
    float _1412 = float(_1410);
    float _1414 = fma(_1388, _1254, _1376);
    float _1416 = fma(_1396, _1392, (*spvDescriptorSet0.vp_c9)._m0[172].x);
    float _1418 = -(*spvDescriptorSet0.vp_c9)._m0[173].w;
    float _1420 = _1150 + _1418;
    float _1422 = -_1412;
    float _1424 = _1422 + 1.0;
    float _1426 = _1400 * _1374;
    float _1428 = fma(_1394, _1240, _1414);
    float _1430 = _1166 * _1424;
    float _1432 = fma(_1426, _1420, (*spvDescriptorSet0.vp_c9)._m0[173].x);
    float _1434 = fma(_1416, _1206, _1428);
    float _1436 = fma(_1432, _1430, _1434);
    float _1438 = fma(_1412, (*spvDescriptorSet0.vp_c9)._m0[174].x, _1436);
    out.m_65.x = _1438;
    bool _1440 = !_1216;
    float _1458;
    if (!_1440)
    {
        float _1442 = in.m_55.x;
        float _1444 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[14].z;
        float _1446 = _1442 * (*spvDescriptorSet0.vp_c9)._m0[15].z;
        float _1448 = fma(_1446, (*spvDescriptorSet0.vp_c9)._m0[14].z, _160);
        float _1450 = _1448 * _1444;
        float _1452 = floor(_1450);
        float _1454 = -_1452;
        float _1456 = _1450 + _1454;
        _1458 = _1456;
        _1460 = true;
    }
    else
    {
        float _1462 = float(_126);
        float _1464 = 1.0 / _1462;
        float _1466 = _160 * _1464;
        _1458 = _1466;
    }
    _1460 = false;
    float _1468 = _1458;
    float _1470 = -(*spvDescriptorSet0.vp_c9)._m0[175].w;
    float _1472 = _1468 + _1470;
    bool _1474 = _1468 >= (*spvDescriptorSet0.vp_c9)._m0[181].w;
    bool _1476 = isnan(_1468);
    bool _1478 = _1474 || _1476;
    bool _1480 = isnan((*spvDescriptorSet0.vp_c9)._m0[181].w);
    bool _1482 = _1478 || _1480;
    float _1484 = float(_1482);
    float _1486 = -(*spvDescriptorSet0.vp_c9)._m0[175].w;
    float _1488 = _1486 + (*spvDescriptorSet0.vp_c9)._m0[176].w;
    bool _1490 = _1468 >= (*spvDescriptorSet0.vp_c9)._m0[180].w;
    bool _1492 = isnan(_1468);
    bool _1494 = _1490 || _1492;
    bool _1496 = isnan((*spvDescriptorSet0.vp_c9)._m0[180].w);
    bool _1498 = _1494 || _1496;
    float _1500 = float(_1498);
    float _1502 = -(*spvDescriptorSet0.vp_c9)._m0[175].x;
    float _1504 = (*spvDescriptorSet0.vp_c9)._m0[176].x + _1502;
    bool _1506 = _1468 >= (*spvDescriptorSet0.vp_c9)._m0[179].w;
    bool _1508 = isnan(_1468);
    bool _1510 = _1506 || _1508;
    bool _1512 = isnan((*spvDescriptorSet0.vp_c9)._m0[179].w);
    bool _1514 = _1510 || _1512;
    float _1516 = float(_1514);
    float _1518 = -_1484;
    float _1520 = _1518 + 1.0;
    float _1522 = 1.0 / _1488;
    float _1524 = _1500 * _1520;
    float _1526 = -_1516;
    float _1528 = _1526 + 1.0;
    float _1530 = -(*spvDescriptorSet0.vp_c9)._m0[176].w;
    float _1532 = _1530 + (*spvDescriptorSet0.vp_c9)._m0[177].w;
    bool _1534 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[14].w;
    float _1536 = 1.0 / _1532;
    float _1538 = _1504 * _1522;
    float _1540 = -_1500;
    float _1542 = _1540 + 1.0;
    bool _1544 = _1468 >= (*spvDescriptorSet0.vp_c9)._m0[178].w;
    bool _1546 = isnan(_1468);
    bool _1548 = _1544 || _1546;
    bool _1550 = isnan((*spvDescriptorSet0.vp_c9)._m0[178].w);
    bool _1552 = _1548 || _1550;
    float _1554 = float(_1552);
    float _1556 = fma(_1538, _1472, (*spvDescriptorSet0.vp_c9)._m0[175].x);
    float _1558 = _1516 * _1542;
    bool _1560 = _1468 >= (*spvDescriptorSet0.vp_c9)._m0[177].w;
    bool _1562 = isnan(_1468);
    bool _1564 = _1560 || _1562;
    bool _1566 = isnan((*spvDescriptorSet0.vp_c9)._m0[177].w);
    bool _1568 = _1564 || _1566;
    float _1570 = float(_1568);
    float _1572 = _1554 * _1528;
    float _1574 = -_1554;
    float _1576 = _1574 + 1.0;
    float _1578 = -(*spvDescriptorSet0.vp_c9)._m0[177].w;
    float _1580 = _1578 + (*spvDescriptorSet0.vp_c9)._m0[178].w;
    bool _1582 = _1468 >= (*spvDescriptorSet0.vp_c9)._m0[176].w;
    bool _1584 = isnan(_1468);
    bool _1586 = _1582 || _1584;
    bool _1588 = isnan((*spvDescriptorSet0.vp_c9)._m0[176].w);
    bool _1590 = _1586 || _1588;
    float _1592 = float(_1590);
    float _1594 = _1570 * _1576;
    float _1596 = -_1570;
    float _1598 = _1596 + 1.0;
    float _1600 = -(*spvDescriptorSet0.vp_c9)._m0[178].w;
    float _1602 = _1600 + (*spvDescriptorSet0.vp_c9)._m0[179].w;
    float _1604 = 1.0 / _1580;
    bool _1606 = _1468 >= (*spvDescriptorSet0.vp_c9)._m0[175].w;
    bool _1608 = isnan(_1468);
    bool _1610 = _1606 || _1608;
    bool _1612 = isnan((*spvDescriptorSet0.vp_c9)._m0[175].w);
    bool _1614 = _1610 || _1612;
    float _1616 = float(_1614);
    float _1618 = _1592 * _1598;
    float _1620 = -_1592;
    float _1622 = _1620 + 1.0;
    float _1624 = -(*spvDescriptorSet0.vp_c9)._m0[179].w;
    float _1626 = _1624 + (*spvDescriptorSet0.vp_c9)._m0[180].w;
    float _1628 = -(*spvDescriptorSet0.vp_c9)._m0[176].x;
    float _1630 = _1628 + (*spvDescriptorSet0.vp_c9)._m0[177].x;
    float _1632 = _1616 * _1622;
    float _1634 = 1.0 / _1602;
    float _1636 = _1630 * _1536;
    float _1638 = _1556 * _1632;
    float _1640 = -_1616;
    float _1642 = _1640 + 1.0;
    float _1644 = -(*spvDescriptorSet0.vp_c9)._m0[180].w;
    float _1646 = _1644 + (*spvDescriptorSet0.vp_c9)._m0[181].w;
    float _1648 = -(*spvDescriptorSet0.vp_c9)._m0[176].w;
    float _1650 = _1468 + _1648;
    float _1652 = 1.0 / _1626;
    float _1654 = -(*spvDescriptorSet0.vp_c9)._m0[177].x;
    float _1656 = (*spvDescriptorSet0.vp_c9)._m0[178].x + _1654;
    float _1658 = fma(_1642, (*spvDescriptorSet0.vp_c9)._m0[175].x, _1638);
    float _1660 = -(*spvDescriptorSet0.vp_c9)._m0[181].w;
    float _1662 = _1660 + (*spvDescriptorSet0.vp_c9)._m0[182].w;
    float _1664 = fma(_1636, _1650, (*spvDescriptorSet0.vp_c9)._m0[176].x);
    float _1666 = _1656 * _1604;
    float _1668 = -(*spvDescriptorSet0.vp_c9)._m0[177].w;
    float _1670 = _1468 + _1668;
    float _1672 = 1.0 / _1646;
    float _1674 = -(*spvDescriptorSet0.vp_c9)._m0[178].x;
    float _1676 = _1674 + (*spvDescriptorSet0.vp_c9)._m0[179].x;
    float _1678 = fma(_1666, _1670, (*spvDescriptorSet0.vp_c9)._m0[177].x);
    float _1680 = fma(_1664, _1618, _1658);
    float _1682 = -(*spvDescriptorSet0.vp_c9)._m0[179].x;
    float _1684 = (*spvDescriptorSet0.vp_c9)._m0[180].x + _1682;
    float _1686 = _1676 * _1634;
    float _1688 = -(*spvDescriptorSet0.vp_c9)._m0[178].w;
    float _1690 = _1468 + _1688;
    float _1692 = 1.0 / _1662;
    float _1694 = fma(_1678, _1594, _1680);
    float _1696 = _1684 * _1652;
    float _1698 = -(*spvDescriptorSet0.vp_c9)._m0[179].w;
    float _1700 = _1468 + _1698;
    float _1702 = -(*spvDescriptorSet0.vp_c9)._m0[180].x;
    float _1704 = _1702 + (*spvDescriptorSet0.vp_c9)._m0[181].x;
    float _1706 = fma(_1686, _1690, (*spvDescriptorSet0.vp_c9)._m0[178].x);
    float _1708 = -(*spvDescriptorSet0.vp_c9)._m0[180].w;
    float _1710 = _1468 + _1708;
    float _1712 = fma(_1696, _1700, (*spvDescriptorSet0.vp_c9)._m0[179].x);
    float _1714 = _1704 * _1672;
    float _1716 = -(*spvDescriptorSet0.vp_c9)._m0[181].x;
    float _1718 = (*spvDescriptorSet0.vp_c9)._m0[182].x + _1716;
    bool _1720 = _1468 >= (*spvDescriptorSet0.vp_c9)._m0[182].w;
    bool _1722 = isnan(_1468);
    bool _1724 = _1720 || _1722;
    bool _1726 = isnan((*spvDescriptorSet0.vp_c9)._m0[182].w);
    bool _1728 = _1724 || _1726;
    float _1730 = float(_1728);
    float _1732 = fma(_1706, _1572, _1694);
    float _1734 = fma(_1714, _1710, (*spvDescriptorSet0.vp_c9)._m0[180].x);
    float _1736 = -(*spvDescriptorSet0.vp_c9)._m0[181].w;
    float _1738 = _1468 + _1736;
    float _1740 = -_1730;
    float _1742 = _1740 + 1.0;
    float _1744 = _1718 * _1692;
    float _1746 = fma(_1712, _1558, _1732);
    float _1748 = _1484 * _1742;
    float _1750 = fma(_1744, _1738, (*spvDescriptorSet0.vp_c9)._m0[181].x);
    float _1752 = fma(_1734, _1524, _1746);
    float _1754 = fma(_1750, _1748, _1752);
    float _1756 = fma(_1730, (*spvDescriptorSet0.vp_c9)._m0[182].x, _1754);
    out.m_67.x = _1756;
    bool _1758 = !_1534;
    float _1760 = _1672;
    float _1762 = (*spvDescriptorSet0.vp_c9)._m0[178].x;
    float _1764 = _1692;
    float _1766 = _1680;
    float _1768 = _1484;
    float _1770 = _1524;
    float _1788;
    if (!_1758)
    {
        float _1772 = in.m_55.x;
        float _1774 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[14].w;
        float _1776 = _1772 * (*spvDescriptorSet0.vp_c9)._m0[15].w;
        float _1778 = fma(_1776, (*spvDescriptorSet0.vp_c9)._m0[14].w, _160);
        float _1780 = _1778 * _1774;
        float _1782 = floor(_1780);
        float _1784 = -_1782;
        float _1786 = _1780 + _1784;
        _1788 = _1786;
        _1790 = true;
    }
    else
    {
        float _1792 = float(_126);
        float _1794 = 1.0 / _1792;
        float _1796 = _160 * _1794;
        _1788 = _1796;
    }
    _1790 = false;
    float _1798 = _1788;
    float _1800 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].y);
    int _1802 = int(_1800);
    float _1804 = float(_126);
    float _1806 = in.m_69.x;
    float _1808 = in.m_55.y;
    int _1810 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _1812 = _1810 != 0;
    float _1814 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].x);
    int _1816 = int(_1814);
    int _1818 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _1820 = _1818 != 0;
    float _1822 = float(_1802);
    float _1824 = trunc((*spvDescriptorSet0.vp_c9)._m0[31].y);
    int _1826 = int(_1824);
    if (_1812)
    {
        float _1828 = in.m_55.x;
        _1760 = _1828;
    }
    float _1830 = _1760;
    float _1832 = float(uint(_1816));
    float _1834 = 1.0 / _1822;
    float _1836 = float(_1816);
    if (_1820)
    {
        float _1838 = in.m_55.z;
        _1762 = _1838;
    }
    float _1840 = _1762;
    int _1842 = ~_1816;
    int _1844 = _1842 + 1;
    float _1846 = 0.0;
    int _1848 = as_type<int>(_1840);
    float _1850 = _1806;
    if (!_1812)
    {
        _1846 = _1806;
    }
    float _1852 = _1846;
    float _1854 = trunc((*spvDescriptorSet0.vp_c9)._m0[40].y);
    int _1856 = int(_1854);
    float _1858 = float(_1826);
    int _1860 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _1862 = _1860 != 0;
    float _1864 = _1834 * _160;
    float _1866 = 1.0 / _1832;
    float _1868 = float(_1856);
    float _1870 = trunc(_1864);
    int _1872 = int(_1870);
    float _1874 = _1852;
    bool _1876 = _1862;
    if (_1862)
    {
        float _1878 = in.m_55.x;
        _1764 = _1878;
    }
    float _1880 = _1764;
    int _1882 = 0;
    float _1884 = _1880;
    if (_1862)
    {
        _1882 = 0;
    }
    int _1886 = _1882;
    int _1888 = 0;
    int _1890 = _1886;
    if (_1862)
    {
        _1888 = 0;
    }
    int _1892 = _1888;
    float _1894 = _1652;
    int _1896 = _1892;
    if (_1862)
    {
        float _1898 = in.m_55.z;
        _1894 = _1898;
    }
    float _1900 = _1894;
    float _1902 = 1.0 / _1858;
    int _1904 = as_type<int>(_1866) + (-2);
    float _1906 = _1836 * _160;
    if (_1862)
    {
        _1766 = 1.0;
    }
    float _1908 = _1766;
    float _1910 = _1908;
    if (_1862)
    {
        _1768 = 1.0;
    }
    float _1912 = _1768;
    float _1914 = _1912;
    if (_1862)
    {
        _1770 = 1.0;
    }
    float _1916 = _1770;
    float _1918 = 1.0 / _1868;
    float _1920 = float(uint(_1872));
    int _1922 = 0;
    float _1924 = _1916;
    if (_1862)
    {
        _1922 = as_type<int>(_1808);
    }
    int _1926 = _1922;
    float _1928 = 1.0 / _1804;
    float _1930 = as_type<float>(_1904) * _1920;
    float _1932 = _1902 * _160;
    int _1934 = as_type<int>(_1902);
    float _1936 = _1900;
    int _1938 = _1926;
    if (_1862)
    {
        _1934 = as_type<int>(_1900);
    }
    int _1940 = _1934;
    float _1942 = trunc(_1930);
    float _1944 = precise::max(_1942, 0.0);
    uint _1947 = uint(_1944);
    float _1949 = trunc((*spvDescriptorSet0.vp_c9)._m0[31].x);
    int _1951 = int(_1949);
    float _1953 = float(_1872);
    float _1955 = _1906 * _1928;
    float _1957 = in.m_55.w;
    bool _1959 = _1953 >= _1836;
    bool _1961 = isnan(_1953);
    bool _1963 = _1959 || _1961;
    bool _1965 = isnan(_1836);
    bool _1967 = _1963 || _1965;
    float _1969 = float(_1967);
    float _1971 = trunc((*spvDescriptorSet0.vp_c9)._m0[40].x);
    int _1973 = int(_1971);
    int _1975 = _1844 * int(_1947);
    int _1977 = _1975 + _1872;
    float _1979 = float(uint(_1977));
    float _1981 = trunc((*spvDescriptorSet0.vp_c9)._m0[49].x);
    int _1983 = int(_1981);
    float _1985 = float(uint(_1951));
    float _1987 = as_type<float>(_1904) * _1979;
    float _1989 = _1979;
    float _1991 = as_type<float>(_1977);
    int _1993 = _1940;
    int _1995 = as_type<int>(_1987);
    if (_1862)
    {
        _1989 = _1880;
    }
    float _1997 = _1989;
    float _1999 = trunc((*spvDescriptorSet0.vp_c9)._m0[49].y);
    int _2001 = int(_1999);
    float _2003 = float(uint(_1973));
    float _2005 = _1997;
    if (_1862)
    {
        _1991 = _1997;
    }
    float _2007 = _1991;
    int _2009 = 0;
    float _2011 = _2007;
    if (_1862)
    {
        _2009 = as_type<int>(_1997);
    }
    int _2013 = _2009;
    float _2015 = float(uint(_1983));
    float _2017 = 1.0 / _1985;
    float _2019 = float(_2001);
    float _2021 = 1.0 / _2003;
    float _2023 = 1.0 / _2019;
    float _2025 = 1.0 / _2015;
    float _2027 = trunc(_1955);
    int _2029 = int(_2027);
    float _2031 = trunc(_1932);
    int _2033 = int(_2031);
    float _2035 = trunc(_1969);
    int _2037 = int(_2035);
    float _2039 = trunc(_1987);
    float _2041 = precise::max(_2039, 0.0);
    uint _2043 = uint(_2041);
    int _2045 = _2013;
    int _2047 = int(_2043);
    if (!_1862)
    {
        float _2049 = in.m_55.x;
        float _2051 = _1808 * 3.1415927410125732421875;
        float _2053 = in.m_55.z;
        float _2055 = _2051 * 0.15915493667125701904296875;
        float _2057 = _2055 * 6.283185482025146484375;
        float _2059 = sin(_2057);
        float _2061 = _2049 * 3.1415927410125732421875;
        float _2063 = _2061 * 0.15915493667125701904296875;
        float _2065 = _2053 * 3.1415927410125732421875;
        float _2067 = _2065 * 0.15915493667125701904296875;
        float _2069 = _2063 * 6.283185482025146484375;
        float _2071 = sin(_2069);
        float _2073 = _2067 * 6.283185482025146484375;
        float _2075 = sin(_2073);
        _1914 = 1.2345600128173828125;
        _2005 = _1808;
        _1910 = 7.345489978790283203125;
        _1884 = _2049;
        _1924 = 5.839270114898681640625;
        _2011 = _2053;
        _1936 = _2053;
        _1890 = 1;
        _1896 = 2;
        _1938 = as_type<int>(_2059);
        _2045 = as_type<int>(_2071);
        _1993 = as_type<int>(_2075);
    }
    float _2077 = _1914;
    float _2079 = _2005;
    float _2081 = _1910;
    float _2083 = _1884;
    float _2085 = _1924;
    float _2087 = _2011;
    float _2089 = _1936;
    int _2091 = _1890;
    int _2093 = _1896;
    int _2095 = _1938;
    int _2097 = _2045;
    int _2099 = _1993;
    int _2101 = as_type<int>(_2081);
    if (_1812)
    {
        float _2103 = -_1806;
        float _2105 = _2103 + 1.0;
        _1995 = as_type<int>(_2105);
    }
    int _2107 = _1995;
    bool _2109 = false;
    if (_1812)
    {
        bool _2111 = _1830 > 0.5;
        _2109 = _2111;
    }
    bool _2113 = _2109;
    float _2115 = _2077 * _2079;
    int _2117 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 16;
    bool _2119 = _2117 != 0;
    float _2121 = _2081 * _2083;
    if (_1812)
    {
        float _2123 = _2113 ? as_type<float>(_2107) : _1806;
        _1874 = _2123;
    }
    float _2125 = _1874;
    float _2127 = _2085 * _2087;
    int _2129 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 64;
    bool _2131 = _2129 != 0;
    float _2133 = _2081 * _2079;
    int _2135 = int(_1947) + int(_2043);
    float _2137 = floor(_2115);
    int _2139 = ~_1816;
    int _2141 = _2139 + 1;
    float _2143 = in.m_69.y;
    int _2145 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 256;
    bool _2147 = _2145 != 0;
    if (_1820)
    {
        bool _2149 = _1840 > 0.5;
        _1876 = _2149;
    }
    bool _2151 = _1876;
    if (_1820)
    {
        float _2153 = -_1806;
        float _2155 = _2153 + 1.0;
        _1848 = as_type<int>(_2155);
    }
    int _2157 = _1848;
    int _2159 = _2141 * _2135;
    int _2161 = _2159 + _1872;
    if (_2119)
    {
        float _2163 = -_1806;
        float _2165 = _2163 + 1.0;
        _2047 = as_type<int>(_2165);
    }
    int _2167 = _2047;
    bool _2169 = _1808 > 0.5;
    float _2171 = as_type<float>(_2167);
    if (_2131)
    {
        float _2173 = -_1806;
        float _2175 = _2173 + 1.0;
        _2101 = as_type<int>(_2175);
    }
    int _2177 = _2101;
    float _2179 = 0.0;
    if (!_1820)
    {
        _2179 = _1806;
    }
    float _2181 = _2179;
    float _2183 = floor(_2127);
    float _2185 = _2181;
    if (_1820)
    {
        float _2187 = _2151 ? as_type<float>(_2157) : _1806;
        _2185 = _2187;
    }
    float _2189 = _2185;
    float _2191 = 0.0;
    if (!_2119)
    {
        _2191 = _1806;
    }
    float _2193 = _2191;
    int _2195 = 0;
    float _2197 = _2193;
    if (_2147)
    {
        float _2199 = -_1806;
        float _2201 = _2199 + 1.0;
        _2195 = as_type<int>(_2201);
    }
    int _2203 = _2195;
    bool _2205 = uint(_2161) >= uint(_1816);
    float _2207 = _1918 * _160;
    if (_2119)
    {
        float _2209 = _2169 ? as_type<float>(_2167) : _1806;
        _2197 = _2209;
    }
    float _2211 = _2197;
    float _2213 = floor(_2121);
    if (!_2131)
    {
        _2171 = _1806;
    }
    float _2215 = _2171;
    float _2217 = _2215;
    if (_2131)
    {
        float _2219 = _2169 ? as_type<float>(_2177) : _1806;
        _2217 = _2219;
    }
    float _2221 = _2217;
    bool _2223 = !_2205;
    int _2225 = _2223 ? 0 : (-1);
    if (_2147)
    {
        float _2227 = _2169 ? as_type<float>(_2203) : _1806;
        _1850 = _2227;
    }
    float _2229 = _1850;
    float _2231 = floor(_2133);
    int _2233 = ~_2135;
    int _2235 = _2233 + _2225;
    int _2237 = _2235 + 1;
    float _2239 = _2023 * _160;
    int _2241 = as_type<int>(_2017) + (-2);
    float _2243 = -_2137;
    float _2245 = _2115 + _2243;
    float _2247 = float(uint(_2033));
    int _2249 = _1816 * _2237;
    int _2251 = _2249 + _1872;
    bool _2253 = _1816 == 0;
    float _2255 = trunc(_2207);
    int _2257 = int(_2255);
    float _2259 = -_2183;
    float _2261 = _2127 + _2259;
    float _2263 = as_type<float>(_2241) * _2247;
    float _2265 = -_2213;
    float _2267 = _2121 + _2265;
    int _2269 = ~_2037;
    int _2271 = _2269 + 1;
    int _2273 = _2271 + 1;
    bool _2275 = !_2253;
    int _2277 = _2275 ? _2251 : (-1);
    float _2279 = _2267 * _1836;
    float _2281 = trunc(_2263);
    float _2283 = precise::max(_2281, 0.0);
    uint _2285 = uint(_2283);
    int _2287 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4096;
    bool _2289 = _2287 != 0;
    float _2291 = -_2231;
    float _2293 = _2133 + _2291;
    int _2295 = _2277 * _2273;
    bool _2297 = !_2289;
    int _2299 = _2297 ? 0 : 1;
    int _2301 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 16;
    bool _2303 = _2301 != 0;
    int _2305 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 32;
    bool _2307 = _2305 != 0;
    int _2309 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 64;
    bool _2311 = _2309 != 0;
    float _2313 = trunc(_2239);
    int _2315 = int(_2313);
    int _2317 = abs(_2299);
    int _2319 = ~_1951;
    int _2321 = _2319 + 1;
    bool _2323 = !_2307;
    int _2325 = _2323 ? 0 : 1;
    int _2327 = as_type<int>(_2021) + (-2);
    float _2329 = trunc(_2279);
    int _2331 = int(_2329);
    float _2333 = float(uint(_2257));
    int _2335 = abs(_2325);
    int _2337 = _2321 * int(_2285);
    int _2339 = _2337 + _2033;
    int _2341 = _1816 + (-1);
    float _2343 = as_type<float>(_2327) * _2333;
    int _2345 = as_type<int>(_2025) + (-2);
    float _2347 = float(uint(_2339));
    int _2349 = _2037 * _2341;
    int _2351 = _2349 + _2295;
    float _2353 = float(uint(_2315));
    float _2355 = trunc(_2343);
    float _2357 = precise::max(_2355, 0.0);
    uint _2359 = uint(_2357);
    bool _2361 = !_2303;
    int _2363 = _2361 ? 0 : 1;
    int _2365 = _2351 * _2335;
    float _2367 = as_type<float>(_2241) * _2347;
    float _2369 = as_type<float>(_2345) * _2353;
    int _2371 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 128;
    bool _2373 = _2371 != 0;
    int _2375 = _2331 * _2317;
    int _2377 = _2375 + _1872;
    bool _2379 = !_2311;
    int _2381 = _2379 ? 0 : 1;
    float _2383 = trunc(_2367);
    float _2385 = precise::max(_2383, 0.0);
    uint _2387 = uint(_2385);
    int _2389 = abs(_2363);
    bool _2391 = !_2373;
    int _2393 = _2391 ? 0 : 1;
    int _2395 = abs(_2381);
    float _2397 = trunc(_2369);
    float _2399 = precise::max(_2397, 0.0);
    uint _2401 = uint(_2399);
    int _2403 = ~_1973;
    int _2405 = _2403 + 1;
    int _2407 = abs(_2393);
    int _2409 = _2029 * _2389;
    int _2411 = _2409 + _2365;
    int _2413 = _2405 * int(_2359);
    int _2415 = _2413 + _2257;
    int _2417 = ~_1983;
    int _2419 = _2417 + 1;
    float _2421 = _1928 * _160;
    int _2423 = int(_2285) + int(_2387);
    int _2425 = _2377 * _2395;
    int _2427 = _2425 + _2411;
    float _2429 = float(uint(_2415));
    float _2431 = float(_2033);
    int _2433 = _2331 * _2407;
    int _2435 = _2433 + _2427;
    float _2437 = float(_1983);
    float _2439 = as_type<float>(_2327) * _2429;
    int _2441 = _2419 * int(_2401);
    int _2443 = _2441 + _2315;
    float _2445 = float(_2257);
    float _2447 = float(uint(_2435));
    float _2449 = trunc(_2439);
    float _2451 = precise::max(_2449, 0.0);
    uint _2453 = uint(_2451);
    float _2455 = float(uint(_2443));
    float _2457 = float(_1951);
    int _2459 = ~_1951;
    int _2461 = _2459 + 1;
    float _2463 = as_type<float>(_2345) * _2455;
    float _2465 = float(_1973);
    float _2467 = _2457 * _2245;
    float _2469 = as_type<float>(_1904) * _2447;
    float _2471 = trunc(_2463);
    float _2473 = precise::max(_2471, 0.0);
    uint _2475 = uint(_2473);
    int _2477 = ~_1816;
    int _2479 = _2477 + 1;
    float _2481 = _2457 * _2421;
    bool _2483 = _2431 >= _2457;
    bool _2485 = isnan(_2431);
    bool _2487 = _2483 || _2485;
    bool _2489 = isnan(_2457);
    bool _2491 = _2487 || _2489;
    float _2493 = float(_2491);
    float _2495 = _2465 * _2261;
    bool _2497 = _2445 >= _2465;
    bool _2499 = isnan(_2445);
    bool _2501 = _2497 || _2499;
    bool _2503 = isnan(_2465);
    bool _2505 = _2501 || _2503;
    float _2507 = float(_2505);
    float _2509 = _2465 * _2421;
    float _2511 = _2437 * _2421;
    float _2513 = trunc(_2469);
    float _2515 = precise::max(_2513, 0.0);
    uint _2517 = uint(_2515);
    float _2519 = float(_2315);
    float _2521 = _2437 * _2293;
    bool _2523 = _2519 >= _2437;
    bool _2525 = isnan(_2519);
    bool _2527 = _2523 || _2525;
    bool _2529 = isnan(_2437);
    bool _2531 = _2527 || _2529;
    float _2533 = float(_2531);
    int _2535 = _2461 * _2423;
    int _2537 = _2535 + _2033;
    int _2539 = ~_1973;
    int _2541 = _2539 + 1;
    float _2543 = trunc(_2493);
    int _2545 = int(_2543);
    int _2547 = int(_2359) + int(_2453);
    bool _2549 = uint(_2537) >= uint(_1951);
    int _2551 = int(_2401) + int(_2475);
    int _2553 = _2479 * int(_2517);
    int _2555 = _2553 + _2435;
    int _2557 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8192;
    bool _2559 = _2557 != 0;
    int _2561 = _2541 * _2547;
    int _2563 = _2561 + _2257;
    int _2565 = ~_1983;
    int _2567 = _2565 + 1;
    float _2569 = trunc(_2467);
    int _2571 = int(_2569);
    float _2573 = float(uint(_2555));
    int _2575 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 256;
    bool _2577 = _2575 != 0;
    int _2579 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 512;
    bool _2581 = _2579 != 0;
    int _2583 = _2567 * _2551;
    int _2585 = _2583 + _2315;
    bool _2587 = uint(_2563) >= uint(_1973);
    float _2589 = as_type<float>(_1904) * _2573;
    bool _2591 = !_2559;
    int _2593 = _2591 ? 0 : 1;
    float _2595 = trunc(_2507);
    int _2597 = int(_2595);
    bool _2599 = !_2549;
    int _2601 = _2599 ? 0 : (-1);
    bool _2603 = !_2581;
    int _2605 = _2603 ? 0 : 1;
    int _2607 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1024;
    bool _2609 = _2607 != 0;
    int _2611 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 2048;
    bool _2613 = _2611 != 0;
    bool _2615 = !_2577;
    int _2617 = _2615 ? 0 : 1;
    float _2619 = trunc(_2589);
    float _2621 = precise::max(_2619, 0.0);
    uint _2623 = uint(_2621);
    bool _2625 = uint(_2585) >= uint(_1983);
    int _2627 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 16384;
    bool _2629 = _2627 != 0;
    bool _2631 = !_2587;
    int _2633 = _2631 ? 0 : (-1);
    int _2635 = ~_2423;
    int _2637 = _2635 + _2601;
    int _2639 = _2637 + 1;
    float _2641 = trunc(_2511);
    int _2643 = int(_2641);
    int _2645 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 4096;
    bool _2647 = _2645 != 0;
    int _2649 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 8192;
    bool _2651 = _2649 != 0;
    bool _2653 = !_2629;
    int _2655 = _2653 ? 0 : 1;
    int _2657 = _1951 * _2639;
    int _2659 = _2657 + _2033;
    bool _2661 = !_2609;
    int _2663 = _2661 ? 0 : 1;
    bool _2665 = !_2613;
    int _2667 = _2665 ? 0 : 1;
    float _2669 = trunc(_2521);
    int _2671 = int(_2669);
    int _2673 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 16384;
    bool _2675 = _2673 != 0;
    bool _2677 = _1951 == 0;
    int _2679 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 32768;
    bool _2681 = _2679 != 0;
    int _2683 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 32768;
    bool _2685 = _2683 != 0;
    int _2687 = abs(_2593);
    bool _2689 = !_2675;
    int _2691 = _2689 ? 0 : 1;
    bool _2693 = !_2625;
    int _2695 = _2693 ? 0 : (-1);
    int _2697 = _2571 * _2687;
    int _2699 = _2697 + _2033;
    int _2701 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 65536;
    bool _2703 = _2701 != 0;
    int _2705 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 131072;
    bool _2707 = _2705 != 0;
    int _2709 = ~_2547;
    int _2711 = _2709 + _2633;
    int _2713 = _2711 + 1;
    int _2715 = ~_2545;
    int _2717 = _2715 + 1;
    int _2719 = _2717 + 1;
    bool _2721 = !_2677;
    int _2723 = _2721 ? _2659 : (-1);
    int _2725 = _1973 * _2713;
    int _2727 = _2725 + _2257;
    int _2729 = int(_2517) + int(_2623);
    float _2731 = trunc(_2533);
    int _2733 = int(_2731);
    int _2735 = ~_1816;
    int _2737 = _2735 + 1;
    int _2739 = _2719 * _2723;
    bool _2741 = !_2707;
    int _2743 = _2741 ? 0 : 1;
    bool _2745 = _1973 == 0;
    int _2747 = _2737 * _2729;
    int _2749 = _2747 + _2435;
    int _2751 = _1951 + (-1);
    int _2753 = ~_2597;
    int _2755 = _2753 + 1;
    int _2757 = _2755 + 1;
    bool _2759 = !_2745;
    int _2761 = _2759 ? _2727 : (-1);
    int _2763 = _2545 * _2751;
    int _2765 = _2763 + _2739;
    int _2767 = ~_2551;
    int _2769 = _2767 + _2695;
    int _2771 = _2769 + 1;
    float _2773 = trunc(_2481);
    int _2775 = int(_2773);
    bool _2777 = !_2685;
    int _2779 = _2777 ? 0 : 1;
    int _2781 = _2757 * _2761;
    int _2783 = abs(_2605);
    int _2785 = _1983 * _2771;
    int _2787 = _2785 + _2315;
    bool _2789 = uint(_2749) >= uint(_1816);
    int _2791 = abs(_2617);
    float _2793 = trunc(_2495);
    int _2795 = int(_2793);
    bool _2797 = !_2681;
    int _2799 = _2797 ? 0 : 1;
    bool _2801 = !_2789;
    int _2803 = _2801 ? 0 : (-1);
    int _2805 = _2765 * _2783;
    bool _2807 = !_2647;
    int _2809 = _2807 ? 0 : 1;
    float _2811 = trunc(_2509);
    int _2813 = int(_2811);
    int _2815 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 262144;
    bool _2817 = _2815 != 0;
    int _2819 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 524288;
    bool _2821 = _2819 != 0;
    bool _2823 = _1983 == 0;
    int _2825 = abs(_2663);
    int _2827 = _1973 + (-1);
    int _2829 = ~_2733;
    int _2831 = _2829 + 1;
    int _2833 = _2831 + 1;
    int _2835 = _2597 * _2827;
    int _2837 = _2835 + _2781;
    bool _2839 = !_2823;
    int _2841 = _2839 ? _2787 : (-1);
    int _2843 = _2775 * _2791;
    int _2845 = _2843 + _2805;
    float _2847 = _2083 * 2.0;
    int _2849 = abs(_2667);
    int _2851 = _2833 * _2841;
    int _2853 = abs(_2655);
    int _2855 = _2699 * _2825;
    int _2857 = _2855 + _2845;
    float _2859 = _1808 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    bool _2861 = !_2651;
    int _2863 = _2861 ? 0 : 1;
    int _2865 = abs(_2809);
    int _2867 = _2571 * _2849;
    int _2869 = _2867 + _2857;
    int _2871 = abs(_2863);
    float _2873 = float(uint(_2869));
    int _2875 = _2837 * _2871;
    int _2877 = abs(_2691);
    float _2879 = as_type<float>(_2241) * _2873;
    int _2881 = abs(_2799);
    int _2883 = _2813 * _2865;
    int _2885 = _2883 + _2875;
    float _2887 = trunc(_2879);
    float _2889 = precise::max(_2887, 0.0);
    uint _2891 = uint(_2889);
    int _2893 = _2795 * _2853;
    int _2895 = _2893 + _2257;
    int _2897 = abs(_2779);
    int _2899 = _2895 * _2877;
    int _2901 = _2899 + _2885;
    bool _2903 = !_2703;
    int _2905 = _2903 ? 0 : 1;
    int _2907 = _1983 + (-1);
    int _2909 = _2795 * _2881;
    int _2911 = _2909 + _2901;
    int _2913 = abs(_2743);
    int _2915 = ~_1951;
    int _2917 = _2915 + 1;
    int _2919 = _2733 * _2907;
    int _2921 = _2919 + _2851;
    int _2923 = abs(_2905);
    int _2925 = _2917 * int(_2891);
    int _2927 = _2925 + _2869;
    bool _2929 = !_2817;
    int _2931 = _2929 ? 0 : 1;
    int _2933 = _2921 * _2913;
    int _2935 = _2671 * _2897;
    int _2937 = _2935 + _2315;
    int _2939 = ~_2729;
    int _2941 = _2939 + _2803;
    int _2943 = _2941 + 1;
    float _2945 = float(uint(_2911));
    int _2947 = _2643 * _2923;
    int _2949 = _2947 + _2933;
    float _2951 = float(uint(_2927));
    int _2953 = _1816 * _2943;
    int _2955 = _2953 + _2435;
    bool _2957 = !_2821;
    int _2959 = _2957 ? 0 : 1;
    float _2961 = as_type<float>(_2327) * _2945;
    int _2963 = abs(_2931);
    float _2965 = as_type<float>(_2241) * _2951;
    int _2967 = abs(_2959);
    float _2969 = trunc(_2961);
    float _2971 = precise::max(_2969, 0.0);
    uint _2973 = uint(_2971);
    bool _2975 = _1816 == 0;
    int _2977 = _2937 * _2963;
    int _2979 = _2977 + _2949;
    float _2981 = -_2143;
    float _2983 = _2981 + 1.0;
    bool _2985 = _1957 > 0.5;
    float _2987 = trunc(_2965);
    float _2989 = precise::max(_2987, 0.0);
    uint _2991 = uint(_2989);
    bool _2993 = !_2975;
    int _2995 = _2993 ? _2955 : (-1);
    int _2997 = _2671 * _2967;
    int _2999 = _2997 + _2979;
    int _3001 = _2985 ? as_type<int>(_2983) : as_type<int>(_2143);
    int _3003 = _2995 & 3;
    bool _3005 = _3003 != 0;
    int _3007 = _2995 & 3;
    bool _3009 = _3007 != 0;
    int _3011 = ~_1973;
    int _3013 = _3011 + 1;
    float _3015 = float(uint(_2999));
    int _3017 = _3005 ? 0 : 1;
    int _3019 = _3013 * int(_2973);
    int _3021 = _3019 + _2911;
    bool _3023 = uint(_3007) > 1u;
    float _3025 = as_type<float>(_2345) * _3015;
    int _3027 = int(_2891) + int(_2991);
    int _3029 = ~_1951;
    int _3031 = _3029 + 1;
    float _3033 = trunc(_3025);
    float _3035 = precise::max(_3033, 0.0);
    uint _3037 = uint(_3035);
    float _3039 = float(uint(_3021));
    int _3041 = ~_3017;
    int _3043 = _3041 + 1;
    int _3045 = _3043 + 1;
    float _3047 = as_type<float>(_2327) * _3039;
    int _3049 = ~_1983;
    int _3051 = _3049 + 1;
    int _3053 = _3031 * _3027;
    int _3055 = _3053 + _2869;
    int _3057 = _3045;
    if (!_3023)
    {
        int _3059 = ~_3017;
        int _3061 = _3059 + 1;
        _3057 = _3061;
    }
    int _3063 = _3057;
    float _3065 = trunc(_3047);
    float _3067 = precise::max(_3065, 0.0);
    uint _3069 = uint(_3067);
    bool _3071 = uint(_3007) >= 2u;
    bool _3073 = _1808 > 0.5;
    int _3075 = _3071 ? 0 : 1;
    int _3077 = _3051 * int(_3037);
    int _3079 = _3077 + _2999;
    bool _3081 = uint(_3055) >= uint(_1951);
    int _3083 = ~_3075;
    int _3085 = _3083 + 1;
    int _3087 = _3085 + 1;
    bool _3089 = !_3081;
    int _3091 = _3089 ? 0 : (-1);
    bool _3093 = _3007 != 3;
    float _3095 = float(uint(_3079));
    int _3097 = ~_1973;
    int _3099 = _3097 + 1;
    int _3101 = int(_2973) + int(_3069);
    float _3103 = as_type<float>(_2345) * _3095;
    int _3105 = ~_3027;
    int _3107 = _3105 + _3091;
    int _3109 = _3107 + 1;
    float _3111 = trunc(_3103);
    float _3113 = precise::max(_3111, 0.0);
    uint _3115 = uint(_3113);
    int _3117 = _3099 * _3101;
    int _3119 = _3117 + _2911;
    int _3121 = _3087;
    if (_3093)
    {
        int _3123 = ~_3075;
        int _3125 = _3123 + 1;
        _3121 = _3125;
    }
    int _3127 = _3121;
    int _3129 = _1951 * _3109;
    int _3131 = _3129 + _2869;
    int _3133 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2097152;
    bool _3135 = _3133 != 0;
    float _3137 = -(*spvDescriptorSet0.vp_c9)._m0[184].w;
    float _3139 = _3137 + (*spvDescriptorSet0.vp_c9)._m0[185].w;
    bool _3141 = !_3135;
    int _3143 = _3141 ? 0 : 1;
    bool _3145 = uint(_3119) >= uint(_1973);
    float _3147 = -(*spvDescriptorSet0.vp_c9)._m0[185].w;
    float _3149 = _3147 + (*spvDescriptorSet0.vp_c9)._m0[186].w;
    bool _3151 = !_2677;
    int _3153 = _3151 ? _3131 : (-1);
    float _3155 = 1.0 / _3139;
    bool _3157 = !_3145;
    int _3159 = _3157 ? 0 : (-1);
    int _3161 = _3153 & 3;
    bool _3163 = _3161 != 0;
    int _3165 = _3073 ? as_type<int>(_2983) : as_type<int>(_2143);
    int _3167 = ~_3101;
    int _3169 = _3167 + _3159;
    int _3171 = _3169 + 1;
    float _3173 = 1.0 / _3149;
    bool _3175 = uint(_3161) >= 2u;
    int _3177 = _3163 ? 0 : 1;
    int _3179 = _1973 * _3171;
    int _3181 = _3179 + _2911;
    bool _3183 = _3161 != 3;
    int _3185 = _3175 ? 0 : 1;
    int _3187 = int(_3037) + int(_3115);
    bool _3189 = uint(_3161) > 1u;
    int _3191 = ~_1983;
    int _3193 = _3191 + 1;
    int _3195 = ~_3185;
    int _3197 = _3195 + 1;
    int _3199 = _3197 + 1;
    bool _3201 = !_2745;
    int _3203 = _3201 ? _3181 : (-1);
    int _3205 = _3193 * _3187;
    int _3207 = _3205 + _2999;
    int _3209 = _3199;
    if (_3183)
    {
        int _3211 = ~_3185;
        int _3213 = _3211 + 1;
        _3209 = _3213;
    }
    int _3215 = _3209;
    int _3217 = ~_3177;
    int _3219 = _3217 + 1;
    int _3221 = _3219 + 1;
    bool _3223 = uint(_3207) >= uint(_1983);
    int _3225 = _3221;
    if (!_3189)
    {
        int _3227 = ~_3177;
        int _3229 = _3227 + 1;
        _3225 = _3229;
    }
    int _3231 = _3225;
    int _3233 = _3203 & 3;
    bool _3235 = _3233 != 0;
    bool _3237 = !_3223;
    int _3239 = _3237 ? 0 : (-1);
    int _3241 = _3235 ? 0 : 1;
    bool _3243 = uint(_3233) >= 2u;
    bool _3245 = _3233 != 3;
    int _3247 = ~_3187;
    int _3249 = _3247 + _3239;
    int _3251 = _3249 + 1;
    int _3253 = _3243 ? 0 : 1;
    bool _3255 = uint(_3233) > 1u;
    int _3257 = _1983 * _3251;
    int _3259 = _3257 + _2999;
    int _3261 = ~_3253;
    int _3263 = _3261 + 1;
    int _3265 = _3263 + 1;
    int _3267 = ~_3241;
    int _3269 = _3267 + 1;
    int _3271 = _3269 + 1;
    bool _3273 = !_2823;
    int _3275 = _3273 ? _3259 : (-1);
    int _3277 = _3265;
    int _3279 = _3271;
    if (_3245)
    {
        int _3281 = ~_3253;
        int _3283 = _3281 + 1;
        _3277 = _3283;
    }
    int _3285 = _3277;
    int _3287 = _3275 & 3;
    bool _3289 = _3287 != 0;
    if (!_3255)
    {
        int _3291 = ~_3241;
        int _3293 = _3291 + 1;
        _3279 = _3293;
    }
    int _3295 = _3279;
    bool _3297 = uint(_3287) >= 2u;
    float _3299 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    int _3301 = _3289 ? 0 : 1;
    int _3303 = _3297 ? 0 : 1;
    float _3305 = fma(_2859, -2.0, _3299);
    bool _3307 = uint(_3287) > 1u;
    bool _3309 = _3287 != 3;
    float _3311 = fma(_160, (*spvDescriptorSet0.vp_c9)._m0[76].y, _3305);
    int _3313 = ~_3301;
    int _3315 = _3313 + 1;
    int _3317 = _3315 + 1;
    int _3319 = ~_3303;
    int _3321 = _3319 + 1;
    int _3323 = _3321 + 1;
    float _3325 = -(*spvDescriptorSet0.vp_c9)._m0[183].w;
    float _3327 = _3325 + (*spvDescriptorSet0.vp_c9)._m0[184].w;
    int _3329 = _3317;
    int _3331 = _3323;
    if (!_3307)
    {
        int _3333 = ~_3301;
        int _3335 = _3333 + 1;
        _3329 = _3335;
    }
    int _3337 = _3329;
    float _3339 = -(*spvDescriptorSet0.vp_c9)._m0[187].w;
    float _3341 = _3339 + (*spvDescriptorSet0.vp_c9)._m0[188].w;
    int _3343 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8388608;
    bool _3345 = _3343 != 0;
    float _3347 = -(*spvDescriptorSet0.vp_c9)._m0[188].w;
    float _3349 = _3347 + (*spvDescriptorSet0.vp_c9)._m0[189].w;
    if (_3309)
    {
        int _3351 = ~_3303;
        int _3353 = _3351 + 1;
        _3331 = _3353;
    }
    int _3355 = _3331;
    float _3357 = 1.0 / _3327;
    bool _3359 = !_3345;
    int _3361 = _3359 ? 0 : 1;
    float _3363 = in.m_46.x;
    float _3365 = in.m_46.y;
    float _3367 = in.m_46.z;
    int _3369 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4194304;
    bool _3371 = _3369 != 0;
    int _3373 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _3375 = _3373 != 0;
    bool _3377 = !_3371;
    int _3379 = _3377 ? 0 : 1;
    float _3381 = 1.0 / _3341;
    float _3383 = _3375 ? as_type<float>(_3165) : _2143;
    int _3385 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _3387 = _3385 != 0;
    bool _3389 = _2089 > 0.5;
    float _3391 = _3387 ? as_type<float>(_3001) : _2143;
    float _3393 = 1.0 / _3349;
    int _3395 = _3389 ? as_type<int>(_2983) : as_type<int>(_2143);
    int _3397 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 32;
    bool _3399 = _3397 != 0;
    int _3401 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 128;
    bool _3403 = _3401 != 0;
    float _3405 = _3399 ? as_type<float>(_3395) : _2143;
    float _3407 = _3403 ? as_type<float>(_3395) : _2143;
    float _3409 = _3365 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    int _3411 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 16777216;
    bool _3413 = _3411 != 0;
    float _3415 = _3365 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    int _3417 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 512;
    bool _3419 = _3417 != 0;
    float _3421 = _3365 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _3423 = floor(_2847);
    float _3425 = fma(_3363, (*spvDescriptorSet0.vp_c10)._m0[4].x, _3409);
    float _3427 = fma(_3363, (*spvDescriptorSet0.vp_c10)._m0[5].x, _3415);
    float _3429 = -(*spvDescriptorSet0.vp_c9)._m0[186].w;
    float _3431 = _3429 + (*spvDescriptorSet0.vp_c9)._m0[187].w;
    float _3433 = fma(_3363, (*spvDescriptorSet0.vp_c10)._m0[6].x, _3421);
    float _3435 = -(*spvDescriptorSet0.vp_c9)._m0[183].x;
    float _3437 = (*spvDescriptorSet0.vp_c9)._m0[184].x + _3435;
    float _3439 = -(*spvDescriptorSet0.vp_c9)._m0[184].x;
    float _3441 = _3439 + (*spvDescriptorSet0.vp_c9)._m0[185].x;
    float _3443 = -(*spvDescriptorSet0.vp_c9)._m0[185].x;
    float _3445 = (*spvDescriptorSet0.vp_c9)._m0[186].x + _3443;
    float _3447 = _3419 ? as_type<float>(_3395) : _2143;
    float _3449 = 1.0 / _3431;
    float _3451 = _3441 * _3155;
    float _3453 = -(*spvDescriptorSet0.vp_c9)._m0[189].w;
    float _3455 = _3453 + (*spvDescriptorSet0.vp_c9)._m0[190].w;
    bool _3457 = _3423 >= 0.0;
    bool _3459 = isnan(_3423);
    bool _3461 = _3457 || _3459;
    bool _3463 = isnan(0.0);
    bool _3465 = _3461 || _3463;
    float _3467 = _3445 * _3173;
    float _3469 = _1808 * 2.0;
    int _3471 = _3465 ? 0 : 1;
    float _3473 = 1.0 / _3455;
    bool _3475 = _3423 > 0.0;
    float _3477 = -(*spvDescriptorSet0.vp_c9)._m0[187].x;
    float _3479 = (*spvDescriptorSet0.vp_c9)._m0[188].x + _3477;
    float _3481 = -(*spvDescriptorSet0.vp_c9)._m0[188].x;
    float _3483 = _3481 + (*spvDescriptorSet0.vp_c9)._m0[189].x;
    float _3485 = _3437 * _3357;
    float _3487 = -(*spvDescriptorSet0.vp_c9)._m0[186].x;
    float _3489 = _3487 + (*spvDescriptorSet0.vp_c9)._m0[187].x;
    float _3491 = _3479 * _3381;
    float _3493 = floor(_3469);
    float _3495 = _3483 * _3393;
    bool _3497 = _1798 >= (*spvDescriptorSet0.vp_c9)._m0[189].w;
    bool _3499 = isnan(_1798);
    bool _3501 = _3497 || _3499;
    bool _3503 = isnan((*spvDescriptorSet0.vp_c9)._m0[189].w);
    bool _3505 = _3501 || _3503;
    float _3507 = float(_3505);
    float _3509 = _3489 * _3449;
    bool _3511 = _1798 >= (*spvDescriptorSet0.vp_c9)._m0[190].w;
    bool _3513 = isnan(_1798);
    bool _3515 = _3511 || _3513;
    bool _3517 = isnan((*spvDescriptorSet0.vp_c9)._m0[190].w);
    bool _3519 = _3515 || _3517;
    float _3521 = float(_3519);
    float _3523 = -(*spvDescriptorSet0.vp_c9)._m0[189].x;
    float _3525 = (*spvDescriptorSet0.vp_c9)._m0[190].x + _3523;
    int _3527 = ~_3471;
    int _3529 = _3527 + 1;
    int _3531 = _3529 + 1;
    float _3533 = -_3507;
    float _3535 = _3533 + 1.0;
    int _3537 = _3531;
    if (!_3475)
    {
        int _3539 = ~_3471;
        int _3541 = _3539 + 1;
        _3537 = _3541;
    }
    int _3543 = _3537;
    float _3545 = -_3521;
    float _3547 = _3545 + 1.0;
    bool _3549 = _1798 >= (*spvDescriptorSet0.vp_c9)._m0[188].w;
    bool _3551 = isnan(_1798);
    bool _3553 = _3549 || _3551;
    bool _3555 = isnan((*spvDescriptorSet0.vp_c9)._m0[188].w);
    bool _3557 = _3553 || _3555;
    float _3559 = float(_3557);
    float _3561 = _3525 * _3473;
    bool _3563 = _1798 >= (*spvDescriptorSet0.vp_c9)._m0[187].w;
    bool _3565 = isnan(_1798);
    bool _3567 = _3563 || _3565;
    bool _3569 = isnan((*spvDescriptorSet0.vp_c9)._m0[187].w);
    bool _3571 = _3567 || _3569;
    float _3573 = float(_3571);
    float _3575 = _3507 * _3547;
    float _3577 = fma(_3367, (*spvDescriptorSet0.vp_c10)._m0[5].z, _3427);
    float _3579 = _3559 * _3535;
    float _3581 = -_3559;
    float _3583 = _3581 + 1.0;
    float _3585 = fma(_3367, (*spvDescriptorSet0.vp_c10)._m0[4].z, _3425);
    float _3587 = fma(_3367, (*spvDescriptorSet0.vp_c10)._m0[6].z, _3433);
    bool _3589 = !_3413;
    int _3591 = _3589 ? 0 : 1;
    float _3593 = -(*spvDescriptorSet0.vp_c9)._m0[183].w;
    float _3595 = _1798 + _3593;
    bool _3597 = _1798 >= (*spvDescriptorSet0.vp_c9)._m0[186].w;
    bool _3599 = isnan(_1798);
    bool _3601 = _3597 || _3599;
    bool _3603 = isnan((*spvDescriptorSet0.vp_c9)._m0[186].w);
    bool _3605 = _3601 || _3603;
    float _3607 = float(_3605);
    float _3609 = -_3573;
    float _3611 = _3609 + 1.0;
    bool _3613 = _3493 > 0.0;
    float _3615 = fma(_3485, _3595, (*spvDescriptorSet0.vp_c9)._m0[183].x);
    bool _3617 = _3493 >= 0.0;
    bool _3619 = isnan(_3493);
    bool _3621 = _3617 || _3619;
    bool _3623 = isnan(0.0);
    bool _3625 = _3621 || _3623;
    float _3627 = _3573 * _3583;
    float _3629 = -(*spvDescriptorSet0.vp_c9)._m0[184].w;
    float _3631 = _1798 + _3629;
    bool _3633 = _1798 >= (*spvDescriptorSet0.vp_c9)._m0[185].w;
    bool _3635 = isnan(_1798);
    bool _3637 = _3633 || _3635;
    bool _3639 = isnan((*spvDescriptorSet0.vp_c9)._m0[185].w);
    bool _3641 = _3637 || _3639;
    float _3643 = float(_3641);
    float _3645 = -_3607;
    float _3647 = _3645 + 1.0;
    bool _3649 = _1798 >= (*spvDescriptorSet0.vp_c9)._m0[184].w;
    bool _3651 = isnan(_1798);
    bool _3653 = _3649 || _3651;
    bool _3655 = isnan((*spvDescriptorSet0.vp_c9)._m0[184].w);
    bool _3657 = _3653 || _3655;
    float _3659 = float(_3657);
    float _3661 = fma(_3451, _3631, (*spvDescriptorSet0.vp_c9)._m0[184].x);
    float _3663 = _3607 * _3611;
    float _3665 = -_3643;
    float _3667 = _3665 + 1.0;
    float _3669 = -(*spvDescriptorSet0.vp_c9)._m0[185].w;
    float _3671 = _1798 + _3669;
    float _3673 = _3643 * _3647;
    bool _3675 = _1798 >= (*spvDescriptorSet0.vp_c9)._m0[183].w;
    bool _3677 = isnan(_1798);
    bool _3679 = _3675 || _3677;
    bool _3681 = isnan((*spvDescriptorSet0.vp_c9)._m0[183].w);
    bool _3683 = _3679 || _3681;
    float _3685 = float(_3683);
    float _3687 = -_3659;
    float _3689 = _3687 + 1.0;
    float _3691 = _3659 * _3667;
    float _3693 = fma(_3467, _3671, (*spvDescriptorSet0.vp_c9)._m0[185].x);
    float _3695 = -(*spvDescriptorSet0.vp_c9)._m0[187].w;
    float _3697 = _1798 + _3695;
    float _3699 = -(*spvDescriptorSet0.vp_c9)._m0[186].w;
    float _3701 = _1798 + _3699;
    float _3703 = -(*spvDescriptorSet0.vp_c9)._m0[188].w;
    float _3705 = _1798 + _3703;
    float _3707 = _3685 * _3689;
    float _3709 = fma(_3491, _3697, (*spvDescriptorSet0.vp_c9)._m0[187].x);
    float _3711 = fma(_3509, _3701, (*spvDescriptorSet0.vp_c9)._m0[186].x);
    float _3713 = fma(_3495, _3705, (*spvDescriptorSet0.vp_c9)._m0[188].x);
    int _3715 = _3625 ? 0 : 1;
    float _3717 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[100].z;
    float _3719 = _3615 * _3707;
    bool _3721 = _2091 != 1;
    float _3723 = -(*spvDescriptorSet0.vp_c9)._m0[189].w;
    float _3725 = _1798 + _3723;
    float _3727 = float(uint(_2377));
    float _3729 = -_3685;
    float _3731 = _3729 + 1.0;
    float _3733 = float(uint(_2699));
    float _3735 = fma(_3561, _3725, (*spvDescriptorSet0.vp_c9)._m0[189].x);
    float _3737 = float(uint(_2895));
    float _3739 = as_type<float>(_1904) * _3727;
    float _3741 = fma(_3731, (*spvDescriptorSet0.vp_c9)._m0[183].x, _3719);
    float _3743 = as_type<float>(_2241) * _3733;
    int _3745 = ~_3715;
    int _3747 = _3745 + 1;
    int _3749 = _3747 + 1;
    float _3751 = trunc(_3739);
    float _3753 = precise::max(_3751, 0.0);
    uint _3755 = uint(_3753);
    float _3757 = as_type<float>(_2327) * _3737;
    int _3759 = _3749;
    float _3761 = _3733;
    float _3763 = _3731;
    float _3765 = _3741;
    if (!_3613)
    {
        int _3767 = ~_3715;
        int _3769 = _3767 + 1;
        _3759 = _3769;
    }
    int _3771 = _3759;
    float _3773 = _3717 * (*spvDescriptorSet0.vp_c9)._m0[100].x;
    float _3775 = fma(_3661, _3691, _3741);
    float _3777 = float(uint(_2937));
    float _3779 = _3577 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _3781 = fma(_3773, _2229, -0.5);
    float _3783 = trunc(_3743);
    float _3785 = precise::max(_3783, 0.0);
    uint _3787 = uint(_3785);
    int _3789 = ~_1816;
    int _3791 = _3789 + 1;
    float _3793 = as_type<float>(_2345) * _3777;
    int _3795 = ~_1951;
    int _3797 = _3795 + 1;
    float _3799 = fma(_3693, _3673, _3775);
    int _3801 = ~_1973;
    int _3803 = _3801 + 1;
    float _3805 = _3585 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    bool _3807 = _2093 != 2;
    float _3809 = trunc(_3757);
    float _3811 = precise::max(_3809, 0.0);
    uint _3813 = uint(_3811);
    float _3815 = _3587 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _3817 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    bool _3819 = !_3721;
    float _3821 = _3819 ? as_type<float>(_2095) : as_type<float>(_2097);
    int _3823 = _3797 * int(_3787);
    int _3825 = _3823 + _2699;
    float _3827 = trunc(_3793);
    float _3829 = precise::max(_3827, 0.0);
    uint _3831 = uint(_3829);
    int _3833 = _3791 * int(_3755);
    int _3835 = _3833 + _2377;
    float _3837 = _2083 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    float _3839 = (*spvDescriptorSet0.vp_c9)._m0[93].z + (*spvDescriptorSet0.vp_c9)._m0[93].x;
    float _3841 = float(uint(_3825));
    float _3843 = (*spvDescriptorSet0.vp_c9)._m0[93].w + (*spvDescriptorSet0.vp_c9)._m0[93].y;
    float _3845 = float(uint(_3835));
    int _3847 = _3803 * int(_3813);
    int _3849 = _3847 + _2895;
    float _3851 = -_3817;
    float _3853 = fma(_3837, 2.0, _3851);
    float _3855 = as_type<float>(_2241) * _3841;
    int _3857 = ~_1983;
    int _3859 = _3857 + 1;
    float _3861 = as_type<float>(_1904) * _3845;
    float _3863 = float(uint(_3849));
    float _3865 = fma(as_type<float>(_2097), (*spvDescriptorSet0.vp_c9)._m0[93].z, _3839);
    float _3867 = as_type<float>(_2097) * (*spvDescriptorSet0.vp_c9)._m0[92].x;
    bool _3869 = !_3721;
    float _3871 = _3869 ? as_type<float>(_2099) : as_type<float>(_2095);
    int _3873 = _3859 * int(_3831);
    int _3875 = _3873 + _2937;
    float _3877 = as_type<float>(_2327) * _3863;
    float _3879 = trunc(_3861);
    float _3881 = precise::max(_3879, 0.0);
    uint _3883 = uint(_3881);
    float _3885 = fma(as_type<float>(_2095), (*spvDescriptorSet0.vp_c9)._m0[93].w, _3843);
    float _3887 = as_type<float>(_2095) * (*spvDescriptorSet0.vp_c9)._m0[92].y;
    float _3889 = float(uint(_3875));
    float _3891 = fma(_160, (*spvDescriptorSet0.vp_c9)._m0[92].z, _3865);
    float _3893 = fma(_160, (*spvDescriptorSet0.vp_c9)._m0[92].w, _3885);
    float _3895 = trunc(_3855);
    float _3897 = precise::max(_3895, 0.0);
    uint _3899 = uint(_3897);
    float _3901 = as_type<float>(_2345) * _3889;
    float _3903 = (*spvDescriptorSet0.vp_c9)._m0[92].x + (*spvDescriptorSet0.vp_c9)._m0[91].z;
    float _3905 = _3717;
    float _3907 = _3867;
    if (!_3721)
    {
        _3905 = _2089;
    }
    float _3909 = _3905;
    float _3911 = (*spvDescriptorSet0.vp_c9)._m0[92].y + (*spvDescriptorSet0.vp_c9)._m0[91].w;
    float _3913 = _3909;
    if (_3721)
    {
        _3913 = _1808;
    }
    float _3915 = _3913;
    float _3917 = -_3903;
    float _3919 = fma(_3867, 2.0, _3917);
    if (_3807)
    {
        _3907 = _2083;
    }
    float _3921 = _3907;
    float _3923 = trunc(_3877);
    float _3925 = precise::max(_3923, 0.0);
    uint _3927 = uint(_3925);
    float _3929 = fma(_3711, _3663, _3799);
    int _3931 = ~_1816;
    int _3933 = _3931 + 1;
    float _3935 = fma(_3887, -2.0, _3911);
    int _3937 = int(_3755) + int(_3883);
    float _3939 = fma(_3709, _3627, _3929);
    float _3941 = -_160;
    float _3943 = fma(_3941, (*spvDescriptorSet0.vp_c9)._m0[76].x, _3853);
    int _3945 = int(_3787) + int(_3899);
    float _3947 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[100].w;
    int _3949 = ~_1951;
    int _3951 = _3949 + 1;
    int _3953 = _3933 * _3937;
    int _3955 = _3953 + _2377;
    float _3957 = as_type<float>(_3933);
    float _3959 = _3921;
    if (_3807)
    {
        _3957 = _1808;
    }
    float _3961 = _3957;
    float _3963 = fma(_3713, _3579, _3939);
    float _3965 = _3961;
    if (!_3807)
    {
        _3959 = _2089;
    }
    float _3967 = _3959;
    int _3969 = _3951 * _3945;
    int _3971 = _3969 + _2699;
    if (!_3807)
    {
        _3965 = _2083;
    }
    float _3973 = _3965;
    float _3975 = trunc(_3901);
    float _3977 = precise::max(_3975, 0.0);
    uint _3979 = uint(_3977);
    bool _3981 = uint(_3955) >= uint(_1816);
    float _3983 = _1808 + _2083;
    int _3985 = int(_3813) + int(_3927);
    float _3987 = _3967 * (*spvDescriptorSet0.vp_c9)._m0[87].x;
    int _3989 = ~_1973;
    int _3991 = _3989 + 1;
    float _3993 = _3983 + (-1.0);
    bool _3995 = !_3981;
    int _3997 = _3995 ? 0 : (-1);
    float _3999 = _3973 * (*spvDescriptorSet0.vp_c9)._m0[87].y;
    bool _4001 = uint(_3971) >= uint(_1951);
    int _4003 = _3991 * _3985;
    int _4005 = _4003 + _2895;
    float _4007 = fma(_3735, _3575, _3963);
    if (!_3721)
    {
        _3761 = _1808;
    }
    float _4009 = _3761;
    float _4011 = -_160;
    float _4013 = fma(_4011, (*spvDescriptorSet0.vp_c9)._m0[91].x, _3919);
    float _4015 = _4009;
    if (!_3721)
    {
        _3763 = _1808;
    }
    float _4017 = _3763;
    float _4019 = (*spvDescriptorSet0.vp_c9)._m0[82].y + (*spvDescriptorSet0.vp_c9)._m0[81].w;
    int _4021 = int(_3831) + int(_3979);
    float _4023 = fma(_160, (*spvDescriptorSet0.vp_c9)._m0[91].y, _3935);
    int _4025 = ~_1983;
    int _4027 = _4025 + 1;
    float _4029 = fma(_3521, (*spvDescriptorSet0.vp_c9)._m0[190].x, _4007);
    bool _4031 = !_4001;
    int _4033 = _4031 ? 0 : (-1);
    bool _4035 = uint(_4005) >= uint(_1973);
    float _4037 = _2089 * 2.0;
    int _4039 = ~_3945;
    int _4041 = _4039 + _4033;
    int _4043 = _4041 + 1;
    float _4045 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _4047 = _3805 + _4045;
    bool _4049 = !_4035;
    int _4051 = _4049 ? 0 : (-1);
    int _4053 = _4027 * _4021;
    int _4055 = _4053 + _2937;
    float _4057 = _4017;
    if (!_3721)
    {
        _3765 = _2089;
    }
    float _4059 = _3765;
    float _4061 = floor(_4037);
    int _4063 = _1951 * _4043;
    int _4065 = _4063 + _2699;
    int _4067 = ~_3985;
    int _4069 = _4067 + _4051;
    int _4071 = _4069 + 1;
    out.m_71.x = _4029;
    bool _4073 = uint(_4055) >= uint(_1983);
    float _4075 = _4059;
    if (_3721)
    {
        _4015 = _2083;
    }
    float _4077 = _4015;
    bool _4079 = !_4073;
    int _4081 = _4079 ? 0 : (-1);
    if (_3721)
    {
        _4057 = _2083;
    }
    float _4083 = _4057;
    int _4085 = ~_4021;
    int _4087 = _4085 + _4081;
    int _4089 = _4087 + 1;
    int _4091 = _1973 * _4071;
    int _4093 = _4091 + _2895;
    float _4095 = _3915 * (*spvDescriptorSet0.vp_c9)._m0[82].y;
    int _4097 = _2995 >> 31;
    float _4099 = trunc((*spvDescriptorSet0.vp_c9)._m0[80].z);
    int _4101 = int(_4099);
    if (_3721)
    {
        _4075 = _1808;
    }
    float _4103 = _4075;
    float _4105 = fma(_4095, -2.0, _4019);
    int _4107 = _4097 & 3;
    int _4109 = _1983 * _4089;
    int _4111 = _4109 + _2937;
    bool _4113 = _4061 > 0.0;
    float _4115 = fma(_160, (*spvDescriptorSet0.vp_c9)._m0[81].y, _4105);
    bool _4117 = _4061 >= 0.0;
    bool _4119 = isnan(_4061);
    bool _4121 = _4117 || _4119;
    bool _4123 = isnan(0.0);
    bool _4125 = _4121 || _4123;
    float _4127 = _3947 * (*spvDescriptorSet0.vp_c9)._m0[100].y;
    int _4129 = _2995 + _4107;
    float _4131 = fma(_4127, _3447, -0.5);
    int _4133 = ~_3937;
    int _4135 = _4133 + _3997;
    int _4137 = _4135 + 1;
    float _4139 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _4141 = _3779 + _4139;
    int _4143 = _4129 >> 2;
    float _4145 = fma(_3993, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    int _4147 = _3153 >> 31;
    float _4149 = _4077 * (*spvDescriptorSet0.vp_c9)._m0[82].x;
    float _4151 = _4141 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    int _4153 = _1816 * _4137;
    int _4155 = _4153 + _2377;
    int _4157 = _4147 & 3;
    float _4159 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _4161 = _3815 + _4159;
    float _4163 = fma(_4047, (*spvDescriptorSet0.vp_c8)._m0[28].x, _4151);
    int _4165 = _3275 >> 31;
    float _4167 = (*spvDescriptorSet0.vp_c9)._m0[87].x + (*spvDescriptorSet0.vp_c9)._m0[86].z;
    int _4169 = _3153 + _4157;
    float _4171 = fma(_4161, (*spvDescriptorSet0.vp_c8)._m0[28].z, _4163);
    int _4173 = _4165 & 3;
    float _4175 = -_4167;
    float _4177 = fma(_3987, 2.0, _4175);
    bool _4179 = !_2823;
    int _4181 = _4179 ? _4111 : (-1);
    float _4183 = -_160;
    float _4185 = fma(_4183, (*spvDescriptorSet0.vp_c9)._m0[86].x, _4177);
    int _4187 = _3203 >> 31;
    float _4189 = (*spvDescriptorSet0.vp_c9)._m0[83].z + (*spvDescriptorSet0.vp_c9)._m0[83].x;
    int _4191 = _4169 >> 2;
    bool _4193 = !_2975;
    int _4195 = _4193 ? _4155 : (-1);
    float _4197 = fma(_4083, (*spvDescriptorSet0.vp_c9)._m0[83].z, _4189);
    int _4199 = _3275 + _4173;
    bool _4201 = _4171 >= 0.0;
    float _4203 = fma(_160, (*spvDescriptorSet0.vp_c9)._m0[82].z, _4197);
    bool _4205 = _3161 != 3;
    int _4207 = _4187 & 3;
    int _4209 = _4191 << 4;
    int _4211 = _4209 + 512;
    float _4213 = (*spvDescriptorSet0.vp_c9)._m0[98].w + (*spvDescriptorSet0.vp_c9)._m0[98].y;
    bool _4215 = !_2745;
    int _4217 = _4215 ? _4093 : (-1);
    int _4219 = _4143 << 4;
    int _4221 = _4219 + 368;
    float _4223 = fma(_3871, (*spvDescriptorSet0.vp_c9)._m0[98].w, _4213);
    bool _4225 = _3007 != 3;
    float _4227 = _3871 * (*spvDescriptorSet0.vp_c9)._m0[97].y;
    int _4229 = _4199 >> 2;
    uint _4231 = uint(int(uint(_4221) >> uint(2)));
    uint _4233 = uint(int(uint(int(_4231)) >> uint(2)));
    int _4235 = int(_4231) & 3;
    float _4237 = (*spvDescriptorSet0.vp_c9)._m0[int(_4233)][_4235];
    int _4239 = int(_4231) + 1;
    uint _4241 = uint(int(uint(_4239) >> uint(2)));
    int _4243 = _4239 & 3;
    float _4245 = (*spvDescriptorSet0.vp_c9)._m0[int(_4241)][_4243];
    float _4247 = fma(_160, (*spvDescriptorSet0.vp_c9)._m0[97].w, _4223);
    int _4249 = _3203 + _4207;
    float _4251 = as_type<float>(_4187);
    if (_4201)
    {
        out.m_49.x = 0.0;
    }
    bool _4253 = !_2677;
    int _4255 = _4253 ? _4065 : (-1);
    float _4257 = (*spvDescriptorSet0.vp_c9)._m0[82].x + (*spvDescriptorSet0.vp_c9)._m0[81].z;
    uint _4259 = uint(int(uint(_4211) >> uint(2)));
    uint _4261 = uint(int(uint(int(_4259)) >> uint(2)));
    int _4263 = int(_4259) & 3;
    float _4265 = (*spvDescriptorSet0.vp_c9)._m0[int(_4261)][_4263];
    int _4267 = int(_4259) + 1;
    uint _4269 = uint(int(uint(_4267) >> uint(2)));
    int _4271 = _4267 & 3;
    float _4273 = (*spvDescriptorSet0.vp_c9)._m0[int(_4269)][_4271];
    float _4275 = -_4257;
    float _4277 = fma(_4149, 2.0, _4275);
    float _4279 = (*spvDescriptorSet0.vp_c9)._m0[83].w + (*spvDescriptorSet0.vp_c9)._m0[83].y;
    int _4281 = _4249 >> 2;
    float _4283 = (*spvDescriptorSet0.vp_c9)._m0[97].y + (*spvDescriptorSet0.vp_c9)._m0[96].w;
    bool _4285 = !_3009;
    int _4287 = _4285 ? 0 : 1;
    float _4289 = (*spvDescriptorSet0.vp_c9)._m0[98].z + (*spvDescriptorSet0.vp_c9)._m0[98].x;
    float _4291 = fma(_4103, (*spvDescriptorSet0.vp_c9)._m0[83].w, _4279);
    int _4293 = _3203 & 3;
    bool _4295 = _4293 != 0;
    float _4297 = fma(_4227, -2.0, _4283);
    int _4299 = _4281 << 4;
    int _4301 = _4299 + 656;
    float _4303 = fma(_3821, (*spvDescriptorSet0.vp_c9)._m0[98].z, _4289);
    int _4305 = _4229 << 4;
    int _4307 = _4305 + 800;
    float _4309 = (*spvDescriptorSet0.vp_c9)._m0[97].x + (*spvDescriptorSet0.vp_c9)._m0[96].z;
    float _4311 = _3821 * (*spvDescriptorSet0.vp_c9)._m0[97].x;
    int _4313 = _3153 & 3;
    bool _4315 = _4313 != 0;
    float _4317 = fma(_160, (*spvDescriptorSet0.vp_c9)._m0[97].z, _4303);
    bool _4319 = !_4295;
    int _4321 = _4319 ? 0 : 1;
    uint _4323 = uint(int(uint(_4301) >> uint(2)));
    uint _4325 = uint(int(uint(int(_4323)) >> uint(2)));
    int _4327 = int(_4323) & 3;
    float _4329 = (*spvDescriptorSet0.vp_c9)._m0[int(_4325)][_4327];
    int _4331 = int(_4323) + 1;
    uint _4333 = uint(int(uint(_4331) >> uint(2)));
    int _4335 = _4331 & 3;
    float _4337 = (*spvDescriptorSet0.vp_c9)._m0[int(_4333)][_4335];
    int _4339 = _3275 & 3;
    bool _4341 = _4339 != 0;
    float _4343 = (*spvDescriptorSet0.vp_c9)._m0[87].y + (*spvDescriptorSet0.vp_c9)._m0[86].w;
    if (_4201)
    {
        _4251 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _4345 = _4251;
    float _4347 = fma(_160, (*spvDescriptorSet0.vp_c9)._m0[96].y, _4297);
    float _4349 = -_4309;
    float _4351 = fma(_4311, 2.0, _4349);
    int _4353 = abs(_3063);
    float _4355 = fma(_3999, -2.0, _4343);
    uint _4357 = uint(int(uint(_4307) >> uint(2)));
    uint _4359 = uint(int(uint(int(_4357)) >> uint(2)));
    int _4361 = int(_4357) & 3;
    float _4363 = (*spvDescriptorSet0.vp_c9)._m0[int(_4359)][_4361];
    int _4365 = int(_4357) + 1;
    uint _4367 = uint(int(uint(_4365) >> uint(2)));
    int _4369 = _4365 & 3;
    float _4371 = (*spvDescriptorSet0.vp_c9)._m0[int(_4367)][_4369];
    float _4373 = -_160;
    float _4375 = fma(_4373, (*spvDescriptorSet0.vp_c9)._m0[96].x, _4351);
    int _4377 = as_type<int>(_4345);
    if (_4201)
    {
        float _4379 = _4345 * 5.0;
        _4377 = as_type<int>(_4379);
    }
    int _4381 = _4377;
    int _4383 = abs(_3231);
    float _4385 = fma(_160, (*spvDescriptorSet0.vp_c9)._m0[82].w, _4291);
    float _4387 = fma(_4317, _3781, _4375);
    int _4389 = abs(_3337);
    int _4391 = _4221 + 8;
    uint _4393 = uint(int(uint(_4391) >> uint(2)));
    uint _4395 = uint(int(uint(int(_4393)) >> uint(2)));
    int _4397 = int(_4393) & 3;
    float _4399 = (*spvDescriptorSet0.vp_c9)._m0[int(_4395)][_4397];
    int _4401 = int(_4393) + 1;
    uint _4403 = uint(int(uint(_4401) >> uint(2)));
    int _4405 = _4401 & 3;
    float _4407 = (*spvDescriptorSet0.vp_c9)._m0[int(_4403)][_4405];
    if (_4201)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _13732 = as_type<float>(_4381);
        out.gl_Position.z = _13732;
    }
    float _4409 = -_160;
    float _4411 = fma(_4409, (*spvDescriptorSet0.vp_c9)._m0[81].x, _4277);
    bool _4413 = !_4315;
    int _4415 = _4413 ? 0 : 1;
    float _4417 = fma(_160, (*spvDescriptorSet0.vp_c9)._m0[86].y, _4355);
    int _4419 = abs(_4287);
    float _4421 = -_4347;
    float _4423 = fma(_4247, _4131, _4421);
    int _4425 = _4211 + 8;
    uint _4427 = uint(int(uint(_4425) >> uint(2)));
    uint _4429 = uint(int(uint(int(_4427)) >> uint(2)));
    int _4431 = int(_4427) & 3;
    float _4433 = (*spvDescriptorSet0.vp_c9)._m0[int(_4429)][_4431];
    int _4435 = int(_4427) + 1;
    uint _4437 = uint(int(uint(_4435) >> uint(2)));
    int _4439 = _4435 & 3;
    float _4441 = (*spvDescriptorSet0.vp_c9)._m0[int(_4437)][_4439];
    int _4443 = abs(_3295);
    int _4445 = abs(_4415);
    int _4447 = ~_4383;
    int _4449 = _4447 + 1;
    int _4451 = _4449 + 1;
    int _4453 = _4301 + 8;
    uint _4455 = uint(int(uint(_4453) >> uint(2)));
    uint _4457 = uint(int(uint(int(_4455)) >> uint(2)));
    int _4459 = int(_4455) & 3;
    float _4461 = (*spvDescriptorSet0.vp_c9)._m0[int(_4457)][_4459];
    int _4463 = int(_4455) + 1;
    uint _4465 = uint(int(uint(_4463) >> uint(2)));
    int _4467 = _4463 & 3;
    float _4469 = (*spvDescriptorSet0.vp_c9)._m0[int(_4465)][_4467];
    int _4471 = ~_4353;
    int _4473 = _4471 + 1;
    int _4475 = _4473 + 1;
    int _4477 = _4451 * as_type<int>(_4273);
    bool _4479 = !_4341;
    int _4481 = _4479 ? 0 : 1;
    int _4483 = _4307 + 8;
    uint _4485 = uint(int(uint(_4483) >> uint(2)));
    uint _4487 = uint(int(uint(int(_4485)) >> uint(2)));
    int _4489 = int(_4485) & 3;
    float _4491 = (*spvDescriptorSet0.vp_c9)._m0[int(_4487)][_4489];
    int _4493 = int(_4485) + 1;
    uint _4495 = uint(int(uint(_4493) >> uint(2)));
    int _4497 = _4493 & 3;
    float _4499 = (*spvDescriptorSet0.vp_c9)._m0[int(_4495)][_4497];
    int _4501 = ~_4419;
    int _4503 = _4501 + 1;
    int _4505 = _4503 + 1;
    int _4507 = _4475 * as_type<int>(_4245);
    int _4509 = ~_4445;
    int _4511 = _4509 + 1;
    int _4513 = _4511 + 1;
    float _4515 = trunc((*spvDescriptorSet0.vp_c9)._m0[90].z);
    int _4517 = int(_4515);
    bool _4519 = _3233 != 3;
    int _4521 = _4505 * as_type<int>(_4237);
    int _4523 = _4521 + _4507;
    bool _4525 = !_4225;
    int _4527 = _4525 ? 0 : (-1);
    int _4529 = _4513 * as_type<int>(_4265);
    int _4531 = _4529 + _4477;
    bool _4533 = _3287 != 3;
    int _4535 = abs(_4481);
    bool _4537 = !_4205;
    int _4539 = _4537 ? 0 : (-1);
    bool _4541 = !_4519;
    int _4543 = _4541 ? 0 : (-1);
    int _4545 = ~_4443;
    int _4547 = _4545 + 1;
    int _4549 = _4547 + 1;
    int _4551 = abs(_3127);
    int _4553 = abs(_3215);
    int _4555 = _4549 * as_type<int>(_4337);
    int _4557 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _4559 = _4557 != 0;
    int _4561 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _4563 = _4561 != 0;
    int _4565 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _4567 = _4565 != 0;
    int _4569 = ~_4389;
    int _4571 = _4569 + 1;
    int _4573 = _4571 + 1;
    float _4575 = trunc((*spvDescriptorSet0.vp_c9)._m0[85].z);
    int _4577 = int(_4575);
    int _4579 = ~_4551;
    int _4581 = _4579 + 1;
    int _4583 = _4581 + 1;
    int _4585 = _4573 * as_type<int>(_4371);
    int _4587 = ~_4535;
    int _4589 = _4587 + 1;
    int _4591 = _4589 + 1;
    int _4593 = ~_4553;
    int _4595 = _4593 + 1;
    int _4597 = _4595 + 1;
    int _4599 = _4583 * as_type<int>(_4399);
    int _4601 = _4599 + _4523;
    int _4603 = abs(_4321);
    int _4605 = _4591 * as_type<int>(_4363);
    int _4607 = _4605 + _4585;
    int _4609 = abs(_3285);
    int _4611 = _4597 * as_type<int>(_4433);
    int _4613 = _4611 + _4531;
    int _4615 = ~_4603;
    int _4617 = _4615 + 1;
    int _4619 = _4617 + 1;
    float _4621 = trunc((*spvDescriptorSet0.vp_c9)._m0[95].z);
    int _4623 = int(_4621);
    int _4625 = abs(_3355);
    int _4627 = abs(_4539);
    int _4629 = _4619 * as_type<int>(_4329);
    int _4631 = _4629 + _4555;
    float _4633 = float(uint(_4101));
    int _4635 = ~_4609;
    int _4637 = _4635 + 1;
    int _4639 = _4637 + 1;
    float _4641 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _4643 = log2(_4641);
    int _4645 = ~_4625;
    int _4647 = _4645 + 1;
    int _4649 = _4647 + 1;
    int _4651 = ~_4627;
    int _4653 = _4651 + 1;
    int _4655 = _4653 + 1;
    int _4657 = _4639 * as_type<int>(_4461);
    int _4659 = _4657 + _4631;
    int _4661 = abs(_4527);
    int _4663 = _4649 * as_type<int>(_4491);
    int _4665 = _4663 + _4607;
    float _4667 = float(uint(_4577));
    float _4669 = 1.0 / _4633;
    int _4671 = _4655 * as_type<int>(_4441);
    int _4673 = _4671 + _4613;
    int _4675 = ~_4661;
    int _4677 = _4675 + 1;
    int _4679 = _4677 + 1;
    float _4681 = float(uint(_4517));
    int _4683 = abs(_4543);
    int _4685 = _4679 * as_type<int>(_4407);
    int _4687 = _4685 + _4601;
    int _4689 = abs(_3143);
    float _4691 = 1.0 / _4667;
    int _4693 = abs(_3379);
    float _4695 = _4643 * _160;
    int _4697 = ~_4683;
    int _4699 = _4697 + 1;
    int _4701 = _4699 + 1;
    int _4703 = ~_4689;
    int _4705 = _4703 + 1;
    int _4707 = _4705 + 1;
    bool _4709 = !_4533;
    int _4711 = _4709 ? 0 : (-1);
    float _4713 = 1.0 / _4681;
    int _4715 = abs(_3361);
    int _4717 = _4701 * as_type<int>(_4469);
    int _4719 = _4717 + _4659;
    int _4721 = abs(_4711);
    int _4723 = _4687 * _4707;
    int _4725 = ~_4715;
    int _4727 = _4725 + 1;
    int _4729 = _4727 + 1;
    int _4731 = as_type<int>(_4669) + (-2);
    int _4733 = _4195 * _4689;
    int _4735 = _4733 + _4723;
    int _4737 = ~_4693;
    int _4739 = _4737 + 1;
    int _4741 = _4739 + 1;
    int _4743 = _4729 * _4719;
    float _4745 = exp2(_4695);
    float _4747 = float(uint(_4735));
    int _4749 = _4741 * _4673;
    int _4751 = ~_4721;
    int _4753 = _4751 + 1;
    int _4755 = _4753 + 1;
    int _4757 = _4217 * _4715;
    int _4759 = _4757 + _4743;
    int _4761 = as_type<int>(_4691) + (-2);
    int _4763 = _4255 * _4693;
    int _4765 = _4763 + _4749;
    int _4767 = abs(_3591);
    int _4769 = _4755 * as_type<int>(_4499);
    int _4771 = _4769 + _4665;
    float _4773 = as_type<float>(_4731) * _4747;
    int _4775 = as_type<int>(_4713) + (-2);
    float _4777 = float(uint(_4765));
    float _4779 = float(uint(_4759));
    float _4781 = trunc(_4773);
    float _4783 = precise::max(_4781, 0.0);
    uint _4785 = uint(_4783);
    int _4787 = ~_4767;
    int _4789 = _4787 + 1;
    int _4791 = _4789 + 1;
    float _4793 = as_type<float>(_4761) * _4777;
    float _4795 = float(uint(_4623));
    float _4797 = as_type<float>(_4775) * _4779;
    int _4799 = _4125 ? 0 : 1;
    int _4801 = _4791 * _4771;
    int _4803 = abs(_4101);
    float _4805 = trunc(_4793);
    float _4807 = precise::max(_4805, 0.0);
    uint _4809 = uint(_4807);
    int _4811 = ~_4799;
    int _4813 = _4811 + 1;
    int _4815 = _4813 + 1;
    int _4817 = _4181 * _4767;
    int _4819 = _4817 + _4801;
    int _4821 = _4815;
    float _4823 = _4411;
    if (!_4113)
    {
        int _4825 = ~_4799;
        int _4827 = _4825 + 1;
        _4821 = _4827;
    }
    int _4829 = _4821;
    float _4831 = -_4745;
    float _4833 = _4831 + 1.0;
    int _4835 = ~_4101;
    int _4837 = _4835 + 1;
    int _4839 = ~_4577;
    int _4841 = _4839 + 1;
    float _4843 = trunc(_4797);
    float _4845 = precise::max(_4843, 0.0);
    uint _4847 = uint(_4845);
    int _4849 = abs(_4577);
    int _4851 = _4837 * int(_4785);
    int _4853 = _4851 + _4735;
    float _4855 = float(uint(_4803));
    int _4857 = ~_4517;
    int _4859 = _4857 + 1;
    float _4861 = float(uint(_4849));
    float _4863 = 1.0 / _4795;
    int _4865 = _4841 * int(_4809);
    int _4867 = _4865 + _4765;
    int _4869 = abs(_4517);
    float _4871 = float(uint(_4853));
    float _4873 = float(uint(_4867));
    float _4875 = 1.0 / _4855;
    int _4877 = _4859 * int(_4847);
    int _4879 = _4877 + _4759;
    float _4881 = float(uint(_4869));
    float _4883 = as_type<float>(_4731) * _4871;
    int _4885 = abs(_4623);
    float _4887 = as_type<float>(_4761) * _4873;
    float _4889 = float(uint(_4879));
    float _4891 = 1.0 / _4861;
    int _4893 = as_type<int>(_4863) + (-2);
    float _4895 = as_type<float>(_4775) * _4889;
    float _4897 = float(uint(_4819));
    float _4899 = float(uint(_4885));
    float _4901 = 1.0 / _4881;
    int _4903 = abs(_4735);
    float _4905 = as_type<float>(_4893) * _4897;
    int _4907 = abs(_4765);
    int _4909 = as_type<int>(_4875) + (-2);
    float _4911 = float(uint(_4903));
    float _4913 = 1.0 / _4899;
    int _4915 = as_type<int>(_4891) + (-2);
    float _4917 = as_type<float>(_4909) * _4911;
    float _4919 = float(uint(_4907));
    bool _4921 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _4923 = isnan(1.0);
    bool _4925 = _4921 || _4923;
    bool _4927 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _4929 = _4925 || _4927;
    float _4931 = trunc(_4905);
    float _4933 = precise::max(_4931, 0.0);
    uint _4935 = uint(_4933);
    float _4937 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _4939 = 1.0 + _4937;
    int _4941 = abs(_4759);
    float _4943 = as_type<float>(_4915) * _4919;
    float _4945 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    int _4947 = as_type<int>(_4901) + (-2);
    float _4949 = trunc(_4917);
    float _4951 = precise::max(_4949, 0.0);
    uint _4953 = uint(_4951);
    float _4955 = float(uint(_4941));
    float _4957 = (*spvDescriptorSet0.vp_c9)._m0[88].w + (*spvDescriptorSet0.vp_c9)._m0[88].y;
    float _4959 = as_type<float>(_4947) * _4955;
    int _4961 = abs(_4819);
    float _4963 = 1.0 / _4939;
    int _4965 = ~_4623;
    int _4967 = _4965 + 1;
    float _4969 = fma(_1808, (*spvDescriptorSet0.vp_c9)._m0[78].w, _4945);
    float _4971 = fma(_1808, (*spvDescriptorSet0.vp_c9)._m0[88].w, _4957);
    float _4973 = (*spvDescriptorSet0.vp_c9)._m0[88].z + (*spvDescriptorSet0.vp_c9)._m0[88].x;
    int _4975 = as_type<int>(_4913) + (-2);
    float _4977 = fma(_160, (*spvDescriptorSet0.vp_c9)._m0[77].w, _4969);
    float _4979 = float(uint(_4961));
    float _4981 = trunc(_4943);
    float _4983 = precise::max(_4981, 0.0);
    uint _4985 = uint(_4983);
    bool _4987 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _4989 = isnan(0.0);
    bool _4991 = _4987 || _4989;
    bool _4993 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _4995 = _4991 || _4993;
    float _4997 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    float _4999 = fma(_160, (*spvDescriptorSet0.vp_c9)._m0[87].w, _4971);
    int _5001 = _4967 * int(_4935);
    int _5003 = _5001 + _4819;
    int _5005 = ~_4803;
    int _5007 = _5005 + 1;
    float _5009 = fma(_2083, (*spvDescriptorSet0.vp_c9)._m0[88].z, _4973);
    float _5011 = as_type<float>(_4975) * _4979;
    float _5013 = trunc(_4959);
    float _5015 = precise::max(_5013, 0.0);
    uint _5017 = uint(_5015);
    float _5019 = fma(_2083, (*spvDescriptorSet0.vp_c9)._m0[78].z, _4997);
    float _5021 = _4995 ? _4833 : 0.0;
    float _5023 = fma(_160, (*spvDescriptorSet0.vp_c9)._m0[87].z, _5009);
    float _5025 = float(uint(_5003));
    int _5027 = _5007 * int(_4953);
    int _5029 = _5027 + _4903;
    int _5031 = ~_4849;
    int _5033 = _5031 + 1;
    float _5035 = fma(_160, (*spvDescriptorSet0.vp_c9)._m0[77].z, _5019);
    float _5037 = trunc(_4887);
    float _5039 = precise::max(_5037, 0.0);
    uint _5041 = uint(_5039);
    if (_4929)
    {
        float _5043 = _5021 * _4963;
        _162 = _5043;
    }
    float _5045 = _162;
    float _5047 = as_type<float>(_4893) * _5025;
    float _5049 = float(uint(_5029));
    int _5051 = _5033 * int(_4985);
    int _5053 = _5051 + _4907;
    float _5055 = trunc(_4883);
    float _5057 = precise::max(_5055, 0.0);
    uint _5059 = uint(_5057);
    int _5061 = ~_4869;
    int _5063 = _5061 + 1;
    float _5065 = as_type<float>(_4909) * _5049;
    float _5067 = trunc(_5011);
    float _5069 = precise::max(_5067, 0.0);
    uint _5071 = uint(_5069);
    int _5073 = int(_4809) + int(_5041);
    int _5075 = _5063 * int(_5017);
    int _5077 = _5075 + _4941;
    int _5079 = ~_4623;
    int _5081 = _5079 + 1;
    float _5083 = float(uint(_5077));
    float _5085 = trunc(_5047);
    float _5087 = precise::max(_5085, 0.0);
    uint _5089 = uint(_5087);
    int _5091 = int(_4785) + int(_5059);
    int _5093 = ~_4885;
    int _5095 = _5093 + 1;
    float _5097 = as_type<float>(_4947) * _5083;
    float _5099 = trunc(_4895);
    float _5101 = precise::max(_5099, 0.0);
    uint _5103 = uint(_5101);
    float _5105 = trunc(_5097);
    float _5107 = precise::max(_5105, 0.0);
    uint _5109 = uint(_5107);
    float _5111 = float(uint(_5053));
    int _5113 = ~_4101;
    int _5115 = _5113 + 1;
    int _5117 = int(_4935) + int(_5089);
    float _5119 = as_type<float>(_4915) * _5111;
    int _5121 = _5095 * int(_5071);
    int _5123 = _5121 + _4961;
    float _5125 = trunc(_5065);
    float _5127 = precise::max(_5125, 0.0);
    uint _5129 = uint(_5127);
    int _5131 = ~_4577;
    int _5133 = _5131 + 1;
    float _5135 = float(uint(_5123));
    int _5137 = _5115 * _5091;
    int _5139 = _5137 + _4735;
    int _5141 = ~_4517;
    int _5143 = _5141 + 1;
    float _5145 = as_type<float>(_4975) * _5135;
    float _5147 = trunc(_5119);
    float _5149 = precise::max(_5147, 0.0);
    uint _5151 = uint(_5149);
    int _5153 = _5133 * _5073;
    int _5155 = _5153 + _4765;
    int _5157 = int(_4847) + int(_5103);
    int _5159 = _5081 * _5117;
    int _5161 = _5159 + _4819;
    bool _5163 = uint(_5155) >= uint(_4577);
    float _5165 = trunc(_5145);
    float _5167 = precise::max(_5165, 0.0);
    uint _5169 = uint(_5167);
    bool _5171 = uint(_5139) >= uint(_4101);
    int _5173 = _5143 * _5157;
    int _5175 = _5173 + _4759;
    int _5177 = int(_5017) + int(_5109);
    int _5179 = int(_4953) + int(_5129);
    int _5181 = ~_4803;
    int _5183 = _5181 + 1;
    bool _5185 = !_5163;
    int _5187 = _5185 ? 0 : (-1);
    bool _5189 = uint(_5161) >= uint(_4623);
    int _5191 = _5183 * _5179;
    int _5193 = _5191 + _4903;
    int _5195 = ~_4869;
    int _5197 = _5195 + 1;
    bool _5199 = !_5171;
    int _5201 = _5199 ? 0 : (-1);
    bool _5203 = uint(_5175) >= uint(_4517);
    int _5205 = _5197 * _5177;
    int _5207 = _5205 + _4941;
    int _5209 = int(_4985) + int(_5151);
    int _5211 = ~_4849;
    int _5213 = _5211 + 1;
    bool _5215 = !_5203;
    int _5217 = _5215 ? 0 : (-1);
    bool _5219 = uint(_5193) >= uint(_4803);
    int _5221 = _5213 * _5209;
    int _5223 = _5221 + _4907;
    int _5225 = ~_4885;
    int _5227 = _5225 + 1;
    bool _5229 = !_5219;
    int _5231 = _5229 ? 0 : (-1);
    bool _5233 = uint(_5207) >= uint(_4869);
    float _5235 = _4141 * _4141;
    int _5237 = int(_5071) + int(_5169);
    float _5239 = fma(_4047, _4047, _5235);
    bool _5241 = !_5189;
    int _5243 = _5241 ? 0 : (-1);
    bool _5245 = uint(_5223) >= uint(_4849);
    float _5247 = fma(_4161, _4161, _5239);
    int _5249 = _5227 * _5237;
    int _5251 = _5249 + _4961;
    int _5253 = ~_5091;
    int _5255 = _5253 + _5201;
    int _5257 = _5255 + 1;
    float _5259 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    bool _5261 = !_5245;
    int _5263 = _5261 ? 0 : (-1);
    bool _5265 = uint(_5251) >= uint(_4885);
    int _5267 = _4101 * _5257;
    int _5269 = _5267 + _4735;
    int _5271 = ~_5157;
    int _5273 = _5271 + _5217;
    int _5275 = _5273 + 1;
    bool _5277 = !_5233;
    int _5279 = _5277 ? 0 : (-1);
    float _5281 = rsqrt(_5247);
    bool _5283 = _4101 == 0;
    int _5285 = ~_5073;
    int _5287 = _5285 + _5187;
    int _5289 = _5287 + 1;
    int _5291 = ~_5117;
    int _5293 = _5291 + _5243;
    int _5295 = _5293 + 1;
    int _5297 = _4517 * _5275;
    int _5299 = _5297 + _4759;
    bool _5301 = !_5283;
    int _5303 = _5301 ? _5269 : (-1);
    int _5305 = _4577 * _5289;
    int _5307 = _5305 + _4765;
    bool _5309 = _4517 == 0;
    float _5311 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    int _5313 = _4765 ^ _4577;
    float _5315 = _5259 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    bool _5317 = !_5309;
    int _5319 = _5317 ? _5299 : (-1);
    bool _5321 = _4101 == 0;
    float _5323 = _4141 * _5281;
    int _5325 = _4735 ^ _4101;
    float _5327 = _4047 * _5281;
    uint _5329 = uint(int(uint(_5313) >> uint(31)));
    float _5331 = -_5323;
    float _5333 = fma(_5331, (*spvDescriptorSet0.vp_c9)._m0[18].w, _4141);
    int _5335 = ~_5231;
    int _5337 = _5179 + _5335;
    int _5339 = _5337 + 1;
    float _5341 = _4387 + 0.5;
    uint _5343 = uint(int(uint(_5325) >> uint(31)));
    float _5345 = _5333 * _5333;
    int _5347 = ~_5263;
    int _5349 = _5209 + _5347;
    int _5351 = _5349 + 1;
    float _5353 = _4423 + 0.5;
    int _5355 = ~int(_5329);
    int _5357 = _5355 + 1;
    float _5359 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    bool _5361 = !_5265;
    int _5363 = _5361 ? 0 : (-1);
    float _5365 = -_5327;
    float _5367 = fma(_5365, (*spvDescriptorSet0.vp_c9)._m0[18].w, _4047);
    bool _5369 = _4577 == 0;
    out.m_73.x = _5341;
    out.m_73.y = _5353;
    int _5371 = ~int(_5343);
    int _5373 = _5371 + 1;
    float _5375 = fma(_5367, _5367, _5345);
    int _5377 = _5351 ^ _5357;
    float _5379 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].z;
    bool _5381 = !_5369;
    int _5383 = _5381 ? _5307 : (-1);
    int _5385 = _4623 * _5295;
    int _5387 = _5385 + _4819;
    int _5389 = _5339 ^ _5373;
    float _5391 = fma(_5315, _2125, -0.5);
    bool _5393 = _4623 == 0;
    float _5395 = _5311 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    int _5397 = ~_5357;
    int _5399 = _5397 + _5377;
    int _5401 = _5399 + 1;
    float _5403 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    int _5405 = ~_5373;
    int _5407 = _5405 + _5389;
    int _5409 = _5407 + 1;
    float _5411 = _5359 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    bool _5413 = !_5393;
    int _5415 = _5413 ? _5387 : (-1);
    float _5417 = float(_5303);
    float _5419 = fma(_5411, _2189, -0.5);
    bool _5421 = _4577 == 0;
    float _5423 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[95].z;
    bool _5425 = !_5321;
    int _5427 = _5425 ? _5409 : (-1);
    float _5429 = fma(_5315, _5417, _3943);
    bool _5431 = _4517 == 0;
    float _5433 = _5379 * (*spvDescriptorSet0.vp_c9)._m0[90].x;
    int _5435 = _4759 ^ _4517;
    float _5437 = fma(_5035, _5391, _5429);
    bool _5439 = !_5421;
    int _5441 = _5439 ? _5401 : (-1);
    float _5443 = fma(_5433, _2211, -0.5);
    int _5445 = _4819 ^ _4623;
    float _5447 = _5403 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    float _5449 = float(_5319);
    bool _5451 = _4623 == 0;
    float _5453 = float(_5383);
    float _5455 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].w;
    uint _5457 = uint(int(uint(_5435) >> uint(31)));
    float _5459 = fma(_5433, _5449, _4185);
    uint _5461 = uint(int(uint(_5445) >> uint(31)));
    float _5463 = fma(_5411, _5453, _4411);
    int _5465 = ~_5279;
    int _5467 = _5177 + _5465;
    int _5469 = _5467 + 1;
    float _5471 = _5423 * (*spvDescriptorSet0.vp_c9)._m0[95].x;
    int _5473 = ~int(_5457);
    int _5475 = _5473 + 1;
    float _5477 = fma(_5023, _5443, _5459);
    float _5479 = float(_5415);
    float _5481 = fma(_5471, _2221, -0.5);
    int _5483 = ~_5363;
    int _5485 = _5237 + _5483;
    int _5487 = _5485 + 1;
    float _5489 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[95].w;
    int _5491 = ~int(_5461);
    int _5493 = _5491 + 1;
    float _5495 = fma(_5471, _5479, _4013);
    float _5497 = float(_5427);
    float _5499 = fma(_5395, _3383, -0.5);
    float _5501 = float(_5441);
    float _5503 = fma(_4203, _5419, _5463);
    int _5505 = _5469 ^ _5475;
    float _5507 = -_3311;
    float _5509 = fma(_5395, _5497, _5507);
    int _5511 = _5487 ^ _5493;
    float _5513 = fma(_5447, _3391, -0.5);
    int _5515 = ~_5475;
    int _5517 = _5515 + _5505;
    int _5519 = _5517 + 1;
    float _5521 = -_4115;
    float _5523 = fma(_5447, _5501, _5521);
    int _5525 = ~_5493;
    int _5527 = _5525 + _5511;
    int _5529 = _5527 + 1;
    float _5531 = _4161 * _5281;
    float _5533 = _5455 * (*spvDescriptorSet0.vp_c9)._m0[90].y;
    bool _5535 = !_5431;
    int _5537 = _5535 ? _5519 : (-1);
    float _5539 = fma(_4977, _5499, _5509);
    bool _5541 = !_5451;
    int _5543 = _5541 ? _5529 : (-1);
    float _5545 = -_5531;
    float _5547 = fma(_5545, (*spvDescriptorSet0.vp_c9)._m0[18].w, _4161);
    float _5549 = float(_5537);
    float _5551 = fma(_3891, _5481, _5495);
    float _5553 = float(_5543);
    float _5555 = _5539 + 0.5;
    float _5557 = fma(_5547, _5547, _5375);
    float _5559 = _5489 * (*spvDescriptorSet0.vp_c9)._m0[95].y;
    float _5561 = in.m_75.x;
    float _5563 = in.m_75.y;
    float _5565 = in.m_75.z;
    float _5567 = fma(_5533, _3405, -0.5);
    float _5569 = -_4417;
    float _5571 = fma(_5533, _5549, _5569);
    float _5573 = fma(_5559, _3407, -0.5);
    float _5575 = -_4023;
    float _5577 = fma(_5559, _5553, _5575);
    float _5579 = fma(_4385, _5513, _5523);
    float _5581 = fma(_4999, _5567, _5571);
    float _5583 = _5477 + 0.5;
    float _5585 = fma(_3893, _5573, _5577);
    float _5587 = _5437 + 0.5;
    float _5589 = _5503 + 0.5;
    float _5591 = _5579 + 0.5;
    float _5593 = _5551 + 0.5;
    float _5595 = _5581 + 0.5;
    float _5597 = _5585 + 0.5;
    bool _5599 = !_4559;
    int _5601 = _5599 ? 0 : 1;
    out.m_77.x = _5587;
    out.m_77.y = _5555;
    out.m_77.z = _5589;
    out.m_77.w = _5591;
    bool _5603 = !_4563;
    int _5605 = _5603 ? 0 : 1;
    int _5607 = abs(_5601);
    out.m_79.x = _5583;
    out.m_79.y = _5595;
    float _5609 = float(_4829);
    int _5611 = abs(_5605);
    out.m_81.x = _5593;
    out.m_81.y = _5597;
    bool _5613 = !_4567;
    int _5615 = _5613 ? 0 : 1;
    float _5617 = float(_5607);
    float _5619 = _5589;
    float _5621 = as_type<float>(_5129);
    if (_4201)
    {
        return out;
    }
    float _5623 = -_5323;
    float _5625 = fma(_5623, (*spvDescriptorSet0.vp_c9)._m0[18].w, _3779);
    float _5627 = float(_5611);
    float _5629 = -_5327;
    float _5631 = fma(_5629, (*spvDescriptorSet0.vp_c9)._m0[18].w, _3805);
    float _5633 = _5617 * _5609;
    float _5635 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _5637 = _5625 + _5635;
    float _5639 = float(_3543);
    float _5641 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _5643 = _5631 + _5641;
    float _5645 = _5633 * (-2.0);
    float _5647 = _5637 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _5649 = -_5531;
    float _5651 = fma(_5649, (*spvDescriptorSet0.vp_c9)._m0[18].w, _3815);
    float _5653 = _5627 * _5639;
    float _5655 = _1808 + _2089;
    float _5657 = fma(_5643, (*spvDescriptorSet0.vp_c8)._m0[28].x, _5647);
    float _5659 = _2083 + (-0.5);
    float _5661 = fma(_5645, _5561, _5561);
    float _5663 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _5665 = _5651 + _5663;
    float _5667 = _5655 + (-1.0);
    float _5669 = fma(_4145, _5645, _4145);
    float _5671 = fma(_5659, (*spvDescriptorSet0.vp_c9)._m0[196].x, _5661);
    float _5673 = _5653 * (-2.0);
    float _5675 = fma(_5665, (*spvDescriptorSet0.vp_c8)._m0[28].z, _5657);
    float _5677 = fma(_5667, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    float _5679 = fma(_5669, _5045, _5671);
    float _5681 = _1808 + (-0.5);
    float _5683 = fma(_5673, _5563, _5563);
    bool _5685 = _5675 >= 0.0;
    float _5687 = fma(_5677, _5673, _5677);
    int _5689 = abs(_5615);
    float _5691 = _5679 * 0.15915493667125701904296875;
    float _5693 = fma(_5681, (*spvDescriptorSet0.vp_c9)._m0[196].y, _5683);
    float _5695 = sqrt(_5557);
    float _5697 = fma(_5687, _5045, _5693);
    float _5699 = float(_3771);
    float _5701 = _2083 + _2089;
    float _5703 = float(_5689);
    float _5705 = _5697 * 0.15915493667125701904296875;
    float _5707 = _5651;
    float _5709 = _5625;
    if (_5685)
    {
        _5619 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _5711 = _5619;
    float _5713 = _5691 * 6.283185482025146484375;
    float _5715 = sin(_5713);
    int _5717 = as_type<int>(_5711);
    if (_5685)
    {
        out.m_49.x = 0.0;
    }
    float _5719 = _5703 * _5699;
    if (_5685)
    {
        float _5721 = _5711 * 5.0;
        _5717 = as_type<int>(_5721);
    }
    int _5723 = _5717;
    float _5725 = _5701 + (-1.0);
    float _5727 = _5719 * (-2.0);
    float _5729 = _5691 * 6.283185482025146484375;
    float _5731 = cos(_5729);
    if (_5685)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _15599 = as_type<float>(_5723);
        out.gl_Position.z = _15599;
    }
    float _5733 = _5705 * 6.283185482025146484375;
    float _5735 = sin(_5733);
    if (_5685)
    {
        return out;
    }
    float _5737 = -_3779;
    float _5739 = _5737 + (*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _5741 = fma(_5725, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _5743 = -_3805;
    float _5745 = _5743 + (*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _5747 = -_3815;
    float _5749 = _5747 + (*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _5751 = _5739 * _5739;
    float _5753 = fma(_5727, _5565, _5565);
    float _5755 = _2089 + (-0.5);
    float _5757 = fma(_5741, _5727, _5741);
    float _5759 = fma(_5745, _5745, _5751);
    float _5761 = _5705 * 6.283185482025146484375;
    float _5763 = cos(_5761);
    float _5765 = fma(_5755, (*spvDescriptorSet0.vp_c9)._m0[196].z, _5753);
    float _5767 = _5281 * _5695;
    float _5769 = fma(_5749, _5749, _5759);
    float _5771 = _518 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _5773 = fma(_5757, _5045, _5765);
    float _5775 = _524 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _5777 = in.m_83.x;
    float _5779 = in.m_83.y;
    float _5781 = in.m_83.z;
    float _5783 = _5731 * _5735;
    float _5785 = rsqrt(_5769);
    float _5787 = _5773 * 0.15915493667125701904296875;
    float _5789 = _5715 * _5735;
    float _5791 = _5767 * _5775;
    float _5793 = _5731 * _5763;
    float _5795 = _5787 * 6.283185482025146484375;
    float _5797 = sin(_5795);
    float _5799 = _5745 * _5785;
    float _5801 = _5749 * _5785;
    float _5803 = _5739 * _5785;
    float _5805 = _5787 * 6.283185482025146484375;
    float _5807 = cos(_5805);
    float _5809 = -(*spvDescriptorSet0.vp_c8)._m0[1].z;
    float _5811 = _5799 * _5809;
    float _5813 = -(*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _5815 = _5801 * _5813;
    float _5817 = -(*spvDescriptorSet0.vp_c8)._m0[1].x;
    float _5819 = _5803 * _5817;
    float _5821 = -(*spvDescriptorSet0.vp_c8)._m0[1].x;
    float _5823 = -_5811;
    float _5825 = fma(_5801, _5821, _5823);
    float _5827 = -(*spvDescriptorSet0.vp_c8)._m0[1].z;
    float _5829 = -_5815;
    float _5831 = fma(_5803, _5827, _5829);
    float _5833 = -(*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _5835 = -_5819;
    float _5837 = fma(_5799, _5833, _5835);
    float _5839 = fma(_5797, _5793, _5789);
    float _5841 = _5825 * _5825;
    float _5843 = fma(_5797, _5789, _5793);
    float _5845 = _520 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _5847 = fma(_5831, _5831, _5841);
    float _5849 = _5715 * _5763;
    float _5851 = _5767 * _5845;
    float _5853 = fma(_5837, _5837, _5847);
    float _5855 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _5779);
    float _5857 = _5731 * _5807;
    float _5859 = _5767 * _5771;
    float _5861 = -_5783;
    float _5863 = fma(_5797, _5849, _5861);
    float _5865 = _5855 * _5851;
    float _5867 = rsqrt(_5853);
    float _5869 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _5781);
    float _5871 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _5777);
    float _5873 = _5715 * _5807;
    float _5875 = -_5849;
    float _5877 = fma(_5797, _5783, _5875);
    float _5879 = _5869 * _5859;
    float _5881 = _5871 * _5791;
    float _5883 = _5857 * _5865;
    float _5885 = _5763 * _5807;
    float _5887 = -_5865;
    float _5889 = _5797 * _5887;
    float _5891 = _5873 * _5865;
    float _5893 = fma(_5839, _5881, _5883);
    float _5895 = _5735 * _5807;
    float _5897 = fma(_5885, _5881, _5889);
    float _5899 = fma(_5863, _5881, _5891);
    float _5901 = fma(_5877, _5879, _5893);
    float _5903 = _5831 * _5867;
    float _5905 = _5825 * _5867;
    float _5907 = _5837 * _5867;
    float _5909 = fma(_5895, _5879, _5897);
    float _5911 = _5803 * _5903;
    float _5913 = _5801 * _5905;
    float _5915 = fma(_5843, _5879, _5899);
    float _5917 = _5625 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _5919 = -_5911;
    float _5921 = fma(_5799, _5905, _5919);
    float _5923 = -_5913;
    float _5925 = fma(_5803, _5907, _5923);
    float _5927 = fma(_5631, (*spvDescriptorSet0.vp_c8)._m0[11].x, _5917);
    float _5929 = _5921 * _5901;
    float _5931 = _5925 * _5901;
    float _5933 = fma(_5907, _5909, _5929);
    float _5935 = fma(_5903, _5909, _5931);
    float _5937 = _5799 * _5907;
    float _5939 = fma(_5801, _5915, _5933);
    float _5941 = fma(_5799, _5915, _5935);
    float _5943 = -_5937;
    float _5945 = fma(_5801, _5903, _5943);
    float _5947 = _3815 + _5939;
    float _5949 = _3805 + _5941;
    float _5951 = _5945 * _5901;
    float _5953 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _5955 = _5947 + _5953;
    float _5957 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _5959 = _5949 + _5957;
    float _5961 = _5955 * _5955;
    float _5963 = fma(_5959, _5959, _5961);
    float _5965 = fma(_5905, _5909, _5951);
    float _5967 = fma(_5651, (*spvDescriptorSet0.vp_c8)._m0[11].z, _5927);
    float _5969 = sqrt(_5963);
    float _5971 = fma(_5803, _5915, _5965);
    float _5973 = _3779 + _5971;
    bool _5975 = _5969 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _5977 = _5971;
    float _5979 = _5927;
    float _5981 = _5915;
    float _5983 = _5767;
    if (!_5975)
    {
        _5977 = _5949;
    }
    float _5985 = _5977;
    float _5987 = _5985;
    if (!_5975)
    {
        _5979 = _5947;
    }
    float _5989 = _5979;
    float _5991 = _5989;
    if (!_5975)
    {
        _5981 = _5973;
    }
    float _5993 = _5981;
    bool _5995 = !_5975;
    float _5997 = _5993;
    if (!_5995)
    {
        float _5999 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _6001 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _6003 = _5969 + _6001;
        float _6005 = _5973 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _6007 = rsqrt(_5963);
        float _6009 = _6003 * _5999;
        float _6011 = _6009 * 0.15915493667125701904296875;
        float _6013 = _6011 * 6.283185482025146484375;
        float _6015 = sin(_6013);
        float _6017 = _6011 * 6.283185482025146484375;
        float _6019 = cos(_6017);
        float _6021 = fma(_6015, _6005, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _6023 = _6007 * _6021;
        float _6025 = _6019 + (-1.0);
        float _6027 = fma(_5959, _6023, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _6029 = fma(_5955, _6023, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        float _6031 = _6025 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _6033 = fma(_5973, _6019, _6031);
        _5997 = _6033;
        _5987 = _6027;
        _5991 = _6029;
    }
    float _6035 = _5997;
    float _6037 = _5987;
    float _6039 = _5991;
    float _6041 = -_3779;
    float _6043 = _6041 + _6035;
    float _6045 = -_3805;
    float _6047 = _6045 + _6037;
    float _6049 = _5967 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _6051 = _5625 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _6053 = _6043 * _6043;
    float _6055 = -_3815;
    float _6057 = _6055 + _6039;
    float _6059 = 1.0 / _6049;
    float _6061 = fma(_5631, (*spvDescriptorSet0.vp_c8)._m0[10].x, _6051);
    float _6063 = fma(_6047, _6047, _6053);
    bool _6065 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[660].y;
    bool _6067 = isnan(0.5);
    bool _6069 = _6065 || _6067;
    bool _6071 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _6073 = _6069 || _6071;
    float _6075 = fma(_5651, (*spvDescriptorSet0.vp_c8)._m0[10].z, _6061);
    float _6077 = fma(_6057, _6057, _6063);
    float _6079 = _6075 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _6081 = sqrt(_6077);
    bool _6083 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[653].w;
    bool _6085 = isnan(0.5);
    bool _6087 = _6083 || _6085;
    bool _6089 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _6091 = _6087 || _6089;
    float _6093 = _6079 + _6049;
    float _6095 = _6093 * _6059;
    float _6097 = _6095 * 0.5;
    float _6099 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _6101 = fma(_6097, (*spvDescriptorSet0.vp_c8)._m0[30].w, _6099);
    float _6103 = 1.0 / _6101;
    bool _6105 = _6081 > 0.0;
    bool _6107 = !_6105;
    float _6109 = _6035;
    float _6111 = _6039;
    float _6113 = _6037;
    float _6115 = _6057;
    float _6117 = _6103;
    if (!_6107)
    {
        float _6119 = _204 * _204;
        float _6121 = fma(_202, _202, _6119);
        float _6123 = fma(_206, _206, _6121);
        float _6125 = rsqrt(_6077);
        float _6127 = sqrt(_6123);
        float _6129 = _6047 * _6125;
        float _6131 = _6043 * _6125;
        float _6133 = _6057 * _6125;
        bool _6135 = _6127 > 0.0;
        bool _6137 = !_6135;
        _6115 = _6133;
        if (!_6137)
        {
            float _6139 = rsqrt(_6123);
            float _6141 = 1.0 / (*spvDescriptorSet0.vp_c10)._m0[2].z;
            float _6143 = _204 * _6139;
            float _6145 = _202 * _6139;
            float _6147 = _6131 * _6143;
            float _6149 = _206 * _6139;
            float _6151 = fma(_6129, _6145, _6147);
            float _6153 = _6141 * (*spvDescriptorSet0.vp_c9)._m0[142].x;
            float _6155 = fma(_6133, _6149, _6151);
            float _6157 = _6155 * _6153;
            float _6159 = fma(_202, _6157, _6037);
            float _6161 = fma(_204, _6157, _6035);
            float _6163 = fma(_206, _6157, _6039);
            _6109 = _6161;
            _6111 = _6163;
            _6113 = _6159;
        }
    }
    float _6165 = _6109;
    float _6167 = _6111;
    float _6169 = _6113;
    float _6171 = _6115;
    float _6173 = -_5323;
    float _6175 = fma(_6173, (*spvDescriptorSet0.vp_c9)._m0[18].w, _6165);
    float _6177 = -_5531;
    float _6179 = fma(_6177, (*spvDescriptorSet0.vp_c9)._m0[18].w, _6167);
    float _6181 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _6183 = _6103 * _6181;
    float _6185 = -_5327;
    float _6187 = fma(_6185, (*spvDescriptorSet0.vp_c9)._m0[18].w, _6169);
    float _6189 = _6171;
    float _6191 = _6187;
    float _6193 = _6179;
    float _6195 = _6169;
    float _6197 = _6165;
    if (_6091)
    {
        _6189 = 1.0;
    }
    float _6199 = _6189;
    float _6201 = _6199;
    if (_6073)
    {
        _6117 = _6175;
    }
    float _6203 = _6117;
    float _6205 = _6203;
    if (!_6073)
    {
        float _6207 = _5637 * _5637;
        float _6209 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _6211 = -_3815;
        float _6213 = _6211 + _6167;
        float _6215 = -_3779;
        float _6217 = _6215 + _6165;
        float _6219 = fma(_5643, _5643, _6207);
        float _6221 = fma(_5665, _5665, _6219);
        float _6223 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _6225 = sqrt(_6221);
        float _6227 = 1.0 / _5767;
        float _6229 = _6223 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _6231 = precise::min(_6225, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _6233 = _6231 * _6209;
        float _6235 = _6233 * _6227;
        float _6237 = -_3805;
        float _6239 = _6237 + _6169;
        float _6241 = _6229 * _6235;
        float _6243 = _6213 * _6235;
        float _6245 = fma(_6239, _6241, _5631);
        float _6247 = fma(_6217, _6241, _5625);
        float _6249 = fma(_6229, _6243, _5651);
        _6205 = _6247;
        _6191 = _6245;
        _6193 = _6249;
    }
    float _6251 = _6205;
    float _6253 = _6191;
    float _6255 = _6193;
    if (!_6091)
    {
        float _6257 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _6259 = _6257 * 0.15915493667125701904296875;
        float _6261 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _6263 = _6259 * 6.283185482025146484375;
        float _6265 = cos(_6263);
        float _6267 = _6261 * 0.15915493667125701904296875;
        float _6269 = _6259 * 6.283185482025146484375;
        float _6271 = sin(_6269);
        float _6273 = 1.0 / _6265;
        float _6275 = _6267 * 6.283185482025146484375;
        float _6277 = cos(_6275);
        float _6279 = _6271 * _6273;
        float _6281 = _6267 * 6.283185482025146484375;
        float _6283 = sin(_6281);
        float _6285 = _6277 * _6279;
        float _6287 = 1.0 / _6285;
        float _6289 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _6291 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _6289;
        float _6293 = 1.0 / _6291;
        float _6295 = _6283 * _6287;
        float _6297 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _6299 = fma(_6183, _6295, _6297);
        float _6301 = _6299 * _6293;
        float _6303 = precise::clamp(_6301, 0.0, 1.0);
        _6195 = _6259;
        _5983 = _6267;
        _6201 = _6303;
    }
    float _6305 = _6195;
    float _6307 = _5983;
    float _6309 = _6201;
    float _6311 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _6313 = _6251 + _6311;
    float _6315 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _6317 = _6253 + _6315;
    float _6319 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _6321 = _6255 + _6319;
    float _6323 = _6313 * _6313;
    float _6325 = fma(_6317, _6317, _6323);
    float _6327 = fma(_6321, _6321, _6325);
    float _6329 = rsqrt(_6327);
    float _6331 = sqrt(_6327);
    float _6333 = _6329 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _6335 = _6317 * _6333;
    float _6337 = _6321 * _6333;
    float _6339 = _6335 * _6335;
    float _6341 = _6337 * _6337;
    float _6343 = _6339 + _6341;
    float _6345 = sqrt(_6343);
    bool _6347 = _6345 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _6349 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _6351 = _6345 + _6349;
    float _6353 = _6329;
    float _6355 = _6351;
    float _6357 = _6305;
    float _6359 = _6313;
    if (_6347)
    {
        float _6361 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _6353 = _6361;
    }
    float _6363 = _6353;
    float _6365 = _6363;
    if (_6347)
    {
        float _6367 = _6351 * _6363;
        _6355 = _6367;
    }
    float _6369 = _6355;
    if (_6347)
    {
        float _6371 = rsqrt(_6343);
        _6365 = _6371;
    }
    float _6373 = _6365;
    float _6375 = _6373;
    if (_6347)
    {
        float _6377 = _6369 * 0.15915493667125701904296875;
        _6357 = _6377;
    }
    float _6379 = _6357;
    float _6381 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _6383 = _6321;
    if (_6347)
    {
        float _6385 = _6379 * 6.283185482025146484375;
        float _6387 = sin(_6385);
        _6383 = _6387;
    }
    float _6389 = _6383;
    float _6391 = precise::max(0.0, _6381);
    float _6393 = _6307;
    float _6395 = _6391;
    if (_6347)
    {
        float _6397 = _6379 * 6.283185482025146484375;
        float _6399 = cos(_6397);
        _6393 = _6399;
    }
    float _6401 = _6393;
    float _6403 = -_6333;
    float _6405 = -_6391;
    float _6407 = fma(_6313, _6403, _6405);
    if (_6347)
    {
        float _6409 = _6407 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _6359 = _6409;
    }
    float _6411 = _6359;
    float _6413 = _6389;
    float _6415 = _6411;
    if (_6347)
    {
        float _6417 = fma(_6389, _6411, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _210 = _6417;
    }
    float _6419 = _210;
    if (!_6347)
    {
        _6413 = _6407;
    }
    float _6421 = _6413;
    float _6423 = _6421;
    if (_6347)
    {
        float _6425 = _6373 * _6419;
        _6197 = _6425;
    }
    float _6427 = _6197;
    if (!_6347)
    {
        _6375 = _6335;
    }
    float _6429 = _6375;
    float _6431 = _6429;
    float _6433 = _6401;
    if (_6347)
    {
        float _6435 = _6401 + (-1.0);
        _6395 = _6435;
    }
    float _6437 = _6395;
    float _6439 = _6437;
    if (_6347)
    {
        float _6441 = _6335 * _6427;
        _6431 = _6441;
    }
    float _6443 = _6431;
    if (_6347)
    {
        float _6445 = _6437 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _6415 = _6445;
    }
    float _6447 = _6415;
    float _6449 = _6447;
    if (!_6347)
    {
        _6439 = _6337;
    }
    float _6451 = _6439;
    float _6453 = _6451;
    if (_6347)
    {
        float _6455 = _6337 * _6427;
        _6453 = _6455;
    }
    float _6457 = _6453;
    float _6459 = fma(_5631, (*spvDescriptorSet0.vp_c15)._m0[652].x, (*spvDescriptorSet0.vp_c15)._m0[652].z);
    if (_6347)
    {
        float _6461 = fma(_6407, _6401, _6447);
        _6423 = _6461;
    }
    float _6463 = _6423;
    if (!_6347)
    {
        _6449 = _6339;
    }
    float _6465 = _6449;
    float _6467 = _6465;
    if (_6347)
    {
        float _6469 = _6443 * _6443;
        _6467 = _6469;
    }
    float _6471 = _6467;
    if (!_6347)
    {
        _6433 = _6341;
    }
    float _6473 = _6433;
    float _6475 = _6473;
    if (_6347)
    {
        float _6477 = _6457 * _6457;
        _6475 = _6477;
    }
    float _6479 = _6475;
    float _6481 = fma(_6463, _6463, _6471);
    float _6483 = _6251 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _6485 = _6251 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _6487 = floor(_6459);
    float _6489 = _6481 + _6479;
    float _6491 = fma(_6253, (*spvDescriptorSet0.vp_c8)._m0[2].x, _6483);
    float _6493 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _6495 = fma(_6331, (*spvDescriptorSet0.vp_c15)._m0[23].w, _6493);
    float _6497 = precise::clamp(_6495, 0.0, 1.0);
    float _6499 = fma(_6253, (*spvDescriptorSet0.vp_c8)._m0[3].x, _6485);
    float _6501 = fma(_6255, (*spvDescriptorSet0.vp_c8)._m0[2].z, _6491);
    float _6503 = -_6497;
    float _6505 = _6503 + 1.0;
    float _6507 = rsqrt(_6489);
    float _6509 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _6511 = _6501 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _6513 = fma(_6255, (*spvDescriptorSet0.vp_c8)._m0[3].z, _6499);
    float _6515 = _6511 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _6517 = abs(_6505);
    float _6519 = log2(_6517);
    float _6521 = _6251 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _6523 = -_6515;
    float _6525 = fma(_6523, _6509, 1.0);
    float _6527 = _6251 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _6529 = _6513 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _6531 = fma(_6253, (*spvDescriptorSet0.vp_c8)._m0[1].x, _6521);
    float _6533 = fma(_5651, (*spvDescriptorSet0.vp_c15)._m0[652].y, (*spvDescriptorSet0.vp_c15)._m0[652].w);
    float _6535 = fma(_6253, (*spvDescriptorSet0.vp_c8)._m0[0].x, _6527);
    float _6537 = _6507 * _6443;
    float _6539 = fma(_6255, (*spvDescriptorSet0.vp_c8)._m0[1].z, _6531);
    float _6541 = _6507 * _6463;
    float _6543 = fma(_6255, (*spvDescriptorSet0.vp_c8)._m0[0].z, _6535);
    float _6545 = _6507 * _6457;
    float _6547 = _6539 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _6549 = _6537 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _6551 = _6543 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _6553 = floor(_6533);
    float _6555 = _6547 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _6557 = -_6549;
    float _6559 = fma(_6541, (*spvDescriptorSet0.vp_c15)._m0[21].y, _6557);
    float _6561 = _6519 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _6563 = -_6487;
    float _6565 = _6459 + _6563;
    float _6567 = fma(_6551, (*spvDescriptorSet0.vp_c8)._m0[7].x, _6555);
    float _6569 = -_6545;
    float _6571 = fma(_6569, (*spvDescriptorSet0.vp_c15)._m0[21].z, _6559);
    float _6573 = log2(_6525);
    float _6575 = fma(_6511, (*spvDescriptorSet0.vp_c8)._m0[7].z, _6567);
    float _6577 = fma(_6571, -0.5, 0.5);
    float _6579 = _6547 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _6581 = fma(_6571, 0.5, 0.5);
    float _6583 = fma(_6529, (*spvDescriptorSet0.vp_c8)._m0[7].w, _6575);
    float _6585 = fma(_6551, (*spvDescriptorSet0.vp_c8)._m0[4].x, _6579);
    float _6587 = exp2(_6561);
    float _6589 = _6547 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _6591 = fma(_6581, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _6593 = fma(_6511, (*spvDescriptorSet0.vp_c8)._m0[4].z, _6585);
    float _6595 = -_6553;
    float _6597 = _6533 + _6595;
    float _6599 = fma(_6551, (*spvDescriptorSet0.vp_c8)._m0[5].x, _6589);
    float _6601 = fma(_6581, _6591, -0.212114393711090087890625);
    float _6603 = fma(_6529, (*spvDescriptorSet0.vp_c8)._m0[4].w, _6593);
    float _6605 = 1.0 / _6583;
    float _6607 = fma(_6511, (*spvDescriptorSet0.vp_c8)._m0[5].z, _6599);
    float _6609 = _6573 * 0.693147182464599609375;
    float _6611 = sqrt(_6577);
    float _6613 = fma(_6529, (*spvDescriptorSet0.vp_c8)._m0[5].w, _6607);
    float2 _16992 = float2(_6565, _6597);
    float _6615 = dm_bs(spvDescriptorSet0.vp_t_tcb_24.sample(spvDescriptorSet0.vp_t_tcb_24Smplr, select(_16992, float2(0.0), isnan(_16992)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_24, spvDescriptorSet0.vp_t_tcb_24Smplr_w, select(_16992, float2(0.0), isnan(_16992)), level(0.0)).x;
    float _6617 = fma(_6581, _6601, 1.570728778839111328125);
    float _6619 = _6609 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _6621 = _6603 * _6605;
    float _6623 = _6541 + 1.0;
    float _6625 = _6613 * _6605;
    float _6627 = fma(_6621, 0.5, 0.5);
    float _6629 = -_6541;
    float _6631 = fma(_6587, _6623, _6629);
    float _6633 = fma(_6625, -0.5, 0.5);
    float _6635 = _6611 * 0.636619746685028076171875;
    float _6637 = fma(_6631, 0.5, 0.5);
    float3 _17034 = float3(_6627, _6633, _6619);
    float _6639 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_17034, float3(0.0), isnan(_17034)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_17034, float3(0.0), isnan(_17034)), level(0.0)).x;
    float3 _17045 = float3(_6627, _6633, _6619);
    float4 _6642 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_17045, float3(0.0), isnan(_17045)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_17045, float3(0.0), isnan(_17045)), level(0.0)).xyzw;
    float _6644 = _6642.x;
    float _6646 = _6642.y;
    float _6648 = _6642.z;
    float _6650 = _6642.w;
    float _6652 = -_6617;
    float _6654 = fma(_6635, _6652, 1.0);
    float2 _17066 = float2(_6654, _6637);
    float3 _6658 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_17066, float2(0.0), isnan(_17066)), level(0.0)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_17066, float2(0.0), isnan(_17066)), level(0.0)).xyz;
    float _6660 = _6658.x;
    float _6662 = _6658.y;
    float _6664 = _6658.z;
    float _6666 = abs(_6183);
    float _6668 = log2(_6666);
    float _6670 = in.m_85.x;
    float _6672 = in.m_85.y;
    float _6674 = in.m_85.z;
    bool _6676 = _5779 != 0.0;
    bool _6678 = isnan(_5779);
    bool _6680 = _6676 || _6678;
    bool _6682 = isnan(0.0);
    bool _6684 = _6680 || _6682;
    float _6686 = _5877 * _5945;
    float _6688 = in.m_87.x;
    float _6690 = in.m_87.y;
    float _6692 = in.m_87.z;
    float _6694 = in.m_87.w;
    bool _6696 = _5777 == 0.0;
    bool _6698 = !_6684;
    bool _6700 = _6696 && _6698;
    float _6702 = fma(_5895, _5905, _6686);
    out.m_89.x = _5631;
    out.m_89.y = _5625;
    out.m_89.z = _5651;
    bool _6704 = _5781 == 0.0;
    bool _6706 = _6704 && _6700;
    bool _6708 = _6183 <= 8000.0;
    bool _6710 = isnan(_6183);
    bool _6712 = _6708 || _6710;
    bool _6714 = isnan(8000.0);
    bool _6716 = _6712 || _6714;
    float _6718 = float(_6716);
    float _6720 = _6668 * (*spvDescriptorSet0.vp_c15)._m0[654].z;
    float _6722 = exp2(_6720);
    float _6724 = _6633;
    float _6726 = _6627;
    float _6728 = _6670;
    float _6730 = _6583;
    float _6732 = _6613;
    if (_6706)
    {
        _5621 = _6672;
    }
    float _6734 = _5621;
    float _6736 = _6734;
    if (_6706)
    {
        _4823 = _6670;
    }
    float _6738 = _4823;
    float _6740 = _6738;
    if (_6706)
    {
        _6724 = _6734;
    }
    float _6742 = _6724;
    float _6744 = _6742;
    if (!_6706)
    {
        _6736 = _6672;
    }
    float _6746 = _6736;
    if (_6706)
    {
        _6726 = _6738;
    }
    float _6748 = _6726;
    float _6750 = _6748;
    if (!_6706)
    {
        _6740 = _6670;
    }
    float _6752 = _6740;
    if (!_6706)
    {
        float _6754 = fma(_5779, (*spvDescriptorSet0.vp_c9)._m0[17].y, _6746);
        _6744 = _6754;
    }
    float _6756 = _6744;
    float _6758 = _6690 * _6674;
    float _6760 = fma(_6722, (*spvDescriptorSet0.vp_c15)._m0[654].x, (*spvDescriptorSet0.vp_c15)._m0[654].y);
    float _6762 = precise::clamp(_6760, 0.0, 1.0);
    if (_6706)
    {
        _6728 = _6674;
    }
    float _6764 = _6728;
    float _6766 = _6764;
    if (!_6706)
    {
        float _6768 = fma(_5777, (*spvDescriptorSet0.vp_c9)._m0[17].y, _6752);
        _6750 = _6768;
    }
    float _6770 = _6750;
    if (!_6706)
    {
        float _6772 = fma(_5781, (*spvDescriptorSet0.vp_c9)._m0[17].y, _6674);
        _6766 = _6772;
    }
    float _6774 = _6766;
    float _6776 = _6692 * _6752;
    float _6778 = _6688 * _6746;
    float _6780 = -_6758;
    float _6782 = fma(_6692, _6746, _6780);
    float _6784 = fma(_6762, -2.0, 3.0);
    float _6786 = _6762 * _6762;
    float _6788 = -_6776;
    float _6790 = fma(_6688, _6674, _6788);
    float _6792 = -_6778;
    float _6794 = fma(_6690, _6752, _6792);
    float _6796 = _5839 * _5925;
    float _6798 = _6786 * _6784;
    float _6800 = _5857 * _5925;
    float _6802 = _5857 * _5945;
    float _6804 = _6790 * _6694;
    float _6806 = _6782 * _6694;
    float _6808 = _5857 * _5921;
    float _6810 = _6794 * _6694;
    float _6812 = _5839 * _5945;
    float _6814 = _5839 * _5921;
    float _6816 = _5877 * _5925;
    float _6818 = _5877 * _5921;
    float _6820 = fma(_5885, _5903, _6796);
    float _6822 = -_5797;
    float _6824 = fma(_6822, _5903, _6800);
    float _6826 = -_5797;
    float _6828 = fma(_6826, _5905, _6802);
    float _6830 = -_5797;
    float _6832 = fma(_6830, _5907, _6808);
    float _6834 = fma(_5885, _5905, _6812);
    float _6836 = fma(_5885, _5907, _6814);
    float _6838 = -_6798;
    float _6840 = _6838 + 1.0;
    float _6842 = fma(_5863, _5799, _6820);
    float _6844 = fma(_5895, _5903, _6816);
    float _6846 = fma(_5895, _5907, _6818);
    float _6848 = fma(_5873, _5799, _6824);
    float _6850 = fma(_5873, _5803, _6828);
    float _6852 = fma(_5873, _5801, _6832);
    float _6854 = fma(_5863, _5803, _6834);
    float _6856 = fma(_6840, (*spvDescriptorSet0.vp_c15)._m0[654].w, _6798);
    float _6858 = fma(_5863, _5801, _6836);
    float _6860 = fma(_5843, _5803, _6702);
    float _6862 = fma(_5843, _5799, _6844);
    float _6864 = fma(_5843, _5801, _6846);
    float _6866 = _6848 * _6690;
    float _6868 = _6850 * _6690;
    float _6870 = _6852 * _6690;
    float _6872 = _6804 * _6848;
    float _6874 = _6804 * _6850;
    float _6876 = _6804 * _6852;
    float _6878 = _6547 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _6880 = _6718 * _6856;
    float _6882 = _6848 * _6756;
    float _6884 = _6850 * _6756;
    float _6886 = fma(_6551, (*spvDescriptorSet0.vp_c8)._m0[6].x, _6878);
    float _6888 = _6852 * _6756;
    float _6890 = fma(_6842, _6770, _6882);
    float _6892 = fma(_6842, _6688, _6866);
    float _6894 = fma(_6511, (*spvDescriptorSet0.vp_c8)._m0[6].z, _6886);
    float _6896 = _6519 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _6898 = fma(_6854, _6688, _6868);
    float _6900 = fma(_6806, _6842, _6872);
    float _6902 = fma(_6806, _6854, _6874);
    float _6904 = fma(_6806, _6858, _6876);
    float _6906 = exp2(_6896);
    float _6908 = fma(_6858, _6688, _6870);
    float _6910 = fma(_6854, _6770, _6884);
    float _6912 = fma(_6862, _6692, _6892);
    float _6914 = fma(_6860, _6692, _6898);
    float _6916 = fma(_6810, _6862, _6900);
    float _6918 = fma(_6810, _6860, _6902);
    float _6920 = fma(_6810, _6864, _6904);
    float _6922 = fma(_6864, _6692, _6908);
    float _6924 = in.m_91.x;
    float _6926 = _6880 * (*spvDescriptorSet0.vp_c15)._m0[653].x;
    float _6928 = fma(_6529, (*spvDescriptorSet0.vp_c8)._m0[6].w, _6894);
    float _6930 = fma(_6858, _6770, _6888);
    out.m_93.x = _6912;
    out.m_93.y = _6914;
    out.m_93.z = _6922;
    float _6932 = _6928 + _6583;
    float _6934 = -_6906;
    float _6936 = _6934 + 1.0;
    float _6938 = fma(_6860, _6774, _6910);
    out.m_95.x = _6916;
    out.m_95.y = _6918;
    out.m_95.z = _6920;
    float _6940 = _6932 * 0.5;
    float _6942 = _6936 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _6944 = fma(_6862, _6774, _6890);
    float _6946 = fma(_6864, _6774, _6930);
    bool _6948 = _6331 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _6950 = isnan(_6331);
    bool _6952 = _6948 || _6950;
    bool _6954 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _6956 = _6952 || _6954;
    float _6958 = -_6942;
    float _6960 = _6958 + 1.0;
    out.m_97.z = _6940;
    out.m_97.w = _6583;
    out.m_99.x = _6944;
    out.m_99.y = _6938;
    out.m_99.z = _6946;
    out.gl_Position.x = _6603;
    out.gl_Position.y = _6613;
    out.gl_Position.z = _6928;
    out.gl_Position.w = _6583;
    float _6962 = _6603;
    float _6964 = _6960;
    if (!_6956)
    {
        _5707 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _6966 = _5707;
    float _6968 = _6966;
    float _6970 = _6966;
    if (!_6956)
    {
        _5709 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _6972 = _5709;
    float _6974 = _6309 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _6976 = _6972;
    float _6978 = _6972;
    if (!_6956)
    {
        _6730 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _6980 = _6730;
    float _6982 = _6980;
    float _6984 = _6980;
    if (!_6956)
    {
        _6962 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _6986 = _6962;
    float _6988 = _6986;
    float _6990 = _6986;
    if (!_6956)
    {
        _6732 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _6992 = _6732;
    float _6994 = -_6615;
    float _6996 = _6994 + 1.0;
    float _6998 = _6996 * _6926;
    float _7000 = precise::clamp(_6998, 0.0, 1.0);
    float _7002 = -_7000;
    float _7004 = fma(_7002, (*spvDescriptorSet0.vp_c15)._m0[653].y, 1.0);
    float _7006 = _7004 * _6924;
    float _7008 = _6942 * _6639;
    float _7010 = _7006 * (*spvDescriptorSet0.vp_c13)._m0[1].w;
    float _7012 = _6650 * _6960;
    float _7014 = _6992;
    float _7016 = _6992;
    if (!_6956)
    {
        _6964 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _7018 = _6964;
    float _7020 = _6650 * _7008;
    out.m_101.x = _7010;
    float _7022 = _6664 * _7008;
    float _7024 = fma(_6660, _7020, _6644);
    float _7026 = fma(_6662, _7020, _6646);
    float _7028 = fma(_6650, _7022, _6648);
    out.m_103.x = _7024;
    out.m_103.y = _7026;
    out.m_103.z = _7028;
    out.m_103.w = _7012;
    bool _7030 = !_6956;
    float _7032 = _7018;
    float _7034 = _7018;
    if (!_7030)
    {
        bool _7036 = _6331 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _7038 = isnan(_6331);
        bool _7040 = _7036 || _7038;
        bool _7042 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _7044 = _7040 || _7042;
        if (!_7044)
        {
            float _7046 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _7048 = _6331 + _7046;
            float _7050 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _7052 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _7050;
            float _7054 = 1.0 / _7052;
            float _7056 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _7058 = _7056 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _7060 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _7062 = _7060 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _7064 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _7066 = _7064 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _7068 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _7070 = _7068 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _7072 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _7074 = _7072 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _7076 = _7048 * _7054;
            float _7078 = precise::clamp(_7076, 0.0, 1.0);
            float _7080 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _7082 = _7080 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _7084 = fma(_7078, _7062, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _7086 = fma(_7078, _7082, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _7088 = fma(_7078, _7058, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _7090 = fma(_7078, _7066, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _7092 = fma(_7078, _7070, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _7094 = fma(_7078, _7074, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            _6978 = _7088;
            _6990 = _7092;
            _6970 = _7086;
            _6984 = _7090;
            _7034 = _7084;
            _7016 = _7094;
            _7096 = true;
        }
        else
        {
            bool _7098 = _6331 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _7100 = isnan(_6331);
            bool _7102 = _7098 || _7100;
            bool _7104 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _7106 = _7102 || _7104;
            if (!_7106)
            {
                _6982 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _7108 = _6982;
            _6984 = _7108;
            if (!_7106)
            {
                _6988 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _7110 = _6988;
            _6990 = _7110;
            if (!_7106)
            {
                _7014 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _7112 = _7014;
            _7016 = _7112;
            if (!_7106)
            {
                _6968 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _7114 = _6968;
            _6970 = _7114;
            if (!_7106)
            {
                _6976 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _7116 = _6976;
            _6978 = _7116;
            if (!_7106)
            {
                _7032 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _7118 = _7032;
            bool _7120 = !_7106;
            _7034 = _7118;
            if (!_7120)
            {
                bool _7122 = _6331 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _7124 = isnan(_6331);
                bool _7126 = _7122 || _7124;
                bool _7128 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _7130 = _7126 || _7128;
                if (!_7130)
                {
                    float _7132 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _7134 = _6331 + _7132;
                    float _7136 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _7138 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _7136;
                    float _7140 = 1.0 / _7138;
                    float _7142 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _7144 = _7142 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _7146 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _7148 = _7146 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _7150 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _7152 = _7150 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _7154 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _7156 = _7154 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _7158 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _7160 = _7158 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _7162 = _7134 * _7140;
                    float _7164 = precise::clamp(_7162, 0.0, 1.0);
                    float _7166 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _7168 = _7166 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _7170 = fma(_7164, _7148, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _7172 = fma(_7164, _7168, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _7174 = fma(_7164, _7144, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _7176 = fma(_7164, _7152, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _7178 = fma(_7164, _7156, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _7180 = fma(_7164, _7160, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    _6978 = _7174;
                    _6990 = _7178;
                    _6970 = _7172;
                    _6984 = _7176;
                    _7034 = _7170;
                    _7016 = _7180;
                    _7096 = true;
                }
                else
                {
                    _6978 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _6990 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _6970 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _6984 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _7034 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _7016 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _7096 = false;
    float _7182 = _6978;
    float _7184 = _6990;
    float _7186 = _6970;
    float _7188 = _6984;
    float _7190 = _7034;
    float _7192 = _7016;
    float _7194 = fma(_6938, -0.5, 0.5);
    float _7196 = precise::clamp(_7194, 0.0, 1.0);
    float _7198 = -_7182;
    float _7200 = _7184 + _7198;
    float _7202 = _6974 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _7204 = -_7186;
    float _7206 = _7188 + _7204;
    float _7208 = fma(_7196, _7200, _7182);
    out.m_105.x = 0.0;
    float _7210 = -_7190;
    float _7212 = _7192 + _7210;
    float _7214 = fma(_7196, _7206, _7186);
    float _7216 = _7208 * 0.586610972881317138671875;
    out.m_49.x = _7202;
    bool _7218 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _7220 = fma(_7196, _7212, _7190);
    float _7222 = fma(_7214, 0.298911988735198974609375, _7216);
    bool _7224 = _6309 > 0.0;
    bool _7226 = isnan(_6309);
    bool _7228 = _7224 || _7226;
    bool _7230 = isnan(0.0);
    bool _7232 = _7228 || _7230;
    float _7234 = fma(_7220, 0.114477999508380889892578125, _7222);
    float _7236 = -_7234;
    float _7238 = _7214 + _7236;
    float _7240 = -_7234;
    float _7242 = _7208 + _7240;
    float _7244 = -_7234;
    float _7246 = _7220 + _7244;
    float _7248 = fma(_7238, (*spvDescriptorSet0.vp_c13)._m0[1].z, _7234);
    float _7250 = fma(_7242, (*spvDescriptorSet0.vp_c13)._m0[1].z, _7234);
    float _7252 = fma(_7246, (*spvDescriptorSet0.vp_c13)._m0[1].z, _7234);
    bool _7254 = !_7218;
    if (!_7254)
    {
        float _7256 = -_6251;
        float _7258 = _7256 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
        float _7260 = -_6253;
        float _7262 = _7260 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
        float _7264 = -_6255;
        float _7266 = _7264 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
        float _7268 = _7258 * _7258;
        float _7270 = fma(_7262, _7262, _7268);
        float _7272 = fma(_7266, _7266, _7270);
        float _7274 = sqrt(_7272);
        float _7276 = rsqrt(_7272);
        float _7278 = -_7274;
        float _7280 = _7278 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
        float _7282 = _7280 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
        float _7284 = precise::clamp(_7282, 0.0, 1.0);
        float _7286 = _7262 * _7276;
        float _7288 = _7258 * _7276;
        float _7290 = abs(_7284);
        float _7292 = log2(_7290);
        float _7294 = _7266 * _7276;
        float _7296 = _7286 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
        float _7298 = _6938 * _7288;
        float _7300 = -_7288;
        float _7302 = -_7296;
        float _7304 = fma(_7300, (*spvDescriptorSet0.vp_c15)._m0[656].y, _7302);
        float _7306 = fma(_6944, _7286, _7298);
        float _7308 = -_7294;
        float _7310 = fma(_7308, (*spvDescriptorSet0.vp_c15)._m0[656].z, _7304);
        float _7312 = fma(_6946, _7294, _7306);
        float _7314 = precise::clamp(_7312, 0.0, 1.0);
        float _7316 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
        float _7318 = _7310 + _7316;
        float _7320 = _7292 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
        float _7322 = _7318 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
        float _7324 = precise::clamp(_7322, 0.0, 1.0);
        float _7326 = exp2(_7320);
        float _7328 = _7326 * _7324;
        float _7330 = _7314 * _7328;
        float _7332 = _7330 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
        float _7334 = _7330 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
        float _7336 = _7330 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
        out.m_105.x = _7332;
        out.m_105.y = _7334;
        out.m_105.z = _7336;
    }
    out.m_107.x = _7248;
    out.m_107.y = _7250;
    out.m_107.z = _7252;
    if (_7232)
    {
        return out;
    }
    float _7338 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.m_49.x = 0.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _7338;
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
    out.m_61 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_67 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_71 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_79 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_81 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_89 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_73 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_77 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_95 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_99 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_97 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_49 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_93 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_105 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_101 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_103 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_107 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_63 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_65 = float4(0.0, 0.0, 0.0, 1.0);
    bool _7096 = false;
    bool _1790 = false;
    bool _1460 = false;
    bool _1142 = false;
    bool _824 = false;
    bool _682 = false;
    bool _568 = false;
    bool _452 = false;
    bool _230 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _121 = in.m_46.w;
    float _123 = trunc(_121);
    int _126 = int(_123);
    bool _130 = _126 >= 1;
    float _132 = 0.0;
    if (!_130)
    {
        _132 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _134 = _132;
    float _136 = _134;
    if (!_130)
    {
        out.m_49.x = 0.0;
    }
    int _138 = 0;
    if (!_130)
    {
        float _140 = _134 * 5.0;
        _138 = as_type<int>(_140);
    }
    int _142 = _138;
    int _144 = _142;
    if (!_130)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _7395 = as_type<float>(_142);
        out.gl_Position.z = _7395;
    }
    if (!_130)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_59.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_59.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_59.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_59.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_61.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_61.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_61.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_61.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_67.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_67.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_67.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_67.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_71.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_71.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_71.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_71.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_79.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_79.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_79.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_79.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_81.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_81.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_81.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_81.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_89.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_89.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_89.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_89.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_73.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_73.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_73.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_73.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_77.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_77.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_77.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_77.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_95.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_95.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_95.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_95.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_99.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_99.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_99.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_99.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_97.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_97.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_97.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_97.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_49.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_49.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_49.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_49.w)); dm_cw(dm_gs, dm_p, 68, as_type<uint>(out.m_93.x)); dm_cw(dm_gs, dm_p, 69, as_type<uint>(out.m_93.y)); dm_cw(dm_gs, dm_p, 70, as_type<uint>(out.m_93.z)); dm_cw(dm_gs, dm_p, 71, as_type<uint>(out.m_93.w)); dm_cw(dm_gs, dm_p, 72, as_type<uint>(out.m_105.x)); dm_cw(dm_gs, dm_p, 73, as_type<uint>(out.m_105.y)); dm_cw(dm_gs, dm_p, 74, as_type<uint>(out.m_105.z)); dm_cw(dm_gs, dm_p, 75, as_type<uint>(out.m_105.w)); dm_cw(dm_gs, dm_p, 76, as_type<uint>(out.m_101.x)); dm_cw(dm_gs, dm_p, 77, as_type<uint>(out.m_101.y)); dm_cw(dm_gs, dm_p, 78, as_type<uint>(out.m_101.z)); dm_cw(dm_gs, dm_p, 79, as_type<uint>(out.m_101.w)); dm_cw(dm_gs, dm_p, 80, as_type<uint>(out.m_103.x)); dm_cw(dm_gs, dm_p, 81, as_type<uint>(out.m_103.y)); dm_cw(dm_gs, dm_p, 82, as_type<uint>(out.m_103.z)); dm_cw(dm_gs, dm_p, 83, as_type<uint>(out.m_103.w)); dm_cw(dm_gs, dm_p, 84, as_type<uint>(out.m_107.x)); dm_cw(dm_gs, dm_p, 85, as_type<uint>(out.m_107.y)); dm_cw(dm_gs, dm_p, 86, as_type<uint>(out.m_107.z)); dm_cw(dm_gs, dm_p, 87, as_type<uint>(out.m_107.w)); dm_cw(dm_gs, dm_p, 88, as_type<uint>(out.m_63.x)); dm_cw(dm_gs, dm_p, 89, as_type<uint>(out.m_63.y)); dm_cw(dm_gs, dm_p, 90, as_type<uint>(out.m_63.z)); dm_cw(dm_gs, dm_p, 91, as_type<uint>(out.m_63.w)); dm_cw(dm_gs, dm_p, 92, as_type<uint>(out.m_65.x)); dm_cw(dm_gs, dm_p, 93, as_type<uint>(out.m_65.y)); dm_cw(dm_gs, dm_p, 94, as_type<uint>(out.m_65.z)); dm_cw(dm_gs, dm_p, 95, as_type<uint>(out.m_65.w)); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _146 = in.m_51.w;
    bool _148 = _146 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _150 = isnan(_146);
    bool _152 = _148 || _150;
    bool _154 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _156 = _152 || _154;
    float _158 = -_146;
    float _160 = _158 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    float _162 = _160;
    if (_156)
    {
        float _164 = float(_126);
        _136 = _164;
    }
    float _166 = _136;
    bool _168 = _160 >= _166;
    bool _170 = !_156;
    bool _172 = _168 || _170;
    float _174 = _166;
    if (_172)
    {
        _174 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _176 = _174;
    if (_172)
    {
        out.m_49.x = 0.0;
    }
    if (_172)
    {
        float _178 = _176 * 5.0;
        _144 = as_type<int>(_178);
    }
    int _180 = _144;
    if (_172)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _7465 = as_type<float>(_180);
        out.gl_Position.z = _7465;
    }
    if (_172)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_59.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_59.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_59.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_59.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_61.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_61.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_61.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_61.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_67.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_67.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_67.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_67.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_71.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_71.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_71.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_71.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_79.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_79.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_79.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_79.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_81.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_81.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_81.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_81.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_89.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_89.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_89.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_89.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_73.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_73.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_73.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_73.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_77.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_77.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_77.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_77.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_95.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_95.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_95.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_95.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_99.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_99.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_99.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_99.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_97.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_97.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_97.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_97.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_49.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_49.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_49.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_49.w)); dm_cw(dm_gs, dm_p, 68, as_type<uint>(out.m_93.x)); dm_cw(dm_gs, dm_p, 69, as_type<uint>(out.m_93.y)); dm_cw(dm_gs, dm_p, 70, as_type<uint>(out.m_93.z)); dm_cw(dm_gs, dm_p, 71, as_type<uint>(out.m_93.w)); dm_cw(dm_gs, dm_p, 72, as_type<uint>(out.m_105.x)); dm_cw(dm_gs, dm_p, 73, as_type<uint>(out.m_105.y)); dm_cw(dm_gs, dm_p, 74, as_type<uint>(out.m_105.z)); dm_cw(dm_gs, dm_p, 75, as_type<uint>(out.m_105.w)); dm_cw(dm_gs, dm_p, 76, as_type<uint>(out.m_101.x)); dm_cw(dm_gs, dm_p, 77, as_type<uint>(out.m_101.y)); dm_cw(dm_gs, dm_p, 78, as_type<uint>(out.m_101.z)); dm_cw(dm_gs, dm_p, 79, as_type<uint>(out.m_101.w)); dm_cw(dm_gs, dm_p, 80, as_type<uint>(out.m_103.x)); dm_cw(dm_gs, dm_p, 81, as_type<uint>(out.m_103.y)); dm_cw(dm_gs, dm_p, 82, as_type<uint>(out.m_103.z)); dm_cw(dm_gs, dm_p, 83, as_type<uint>(out.m_103.w)); dm_cw(dm_gs, dm_p, 84, as_type<uint>(out.m_107.x)); dm_cw(dm_gs, dm_p, 85, as_type<uint>(out.m_107.y)); dm_cw(dm_gs, dm_p, 86, as_type<uint>(out.m_107.z)); dm_cw(dm_gs, dm_p, 87, as_type<uint>(out.m_107.w)); dm_cw(dm_gs, dm_p, 88, as_type<uint>(out.m_63.x)); dm_cw(dm_gs, dm_p, 89, as_type<uint>(out.m_63.y)); dm_cw(dm_gs, dm_p, 90, as_type<uint>(out.m_63.z)); dm_cw(dm_gs, dm_p, 91, as_type<uint>(out.m_63.w)); dm_cw(dm_gs, dm_p, 92, as_type<uint>(out.m_65.x)); dm_cw(dm_gs, dm_p, 93, as_type<uint>(out.m_65.y)); dm_cw(dm_gs, dm_p, 94, as_type<uint>(out.m_65.z)); dm_cw(dm_gs, dm_p, 95, as_type<uint>(out.m_65.w)); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _182 = in.m_53.x;
    float _184 = in.m_53.y;
    float _186 = in.m_53.z;
    bool _188 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _190 = _184 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _192 = _184 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _194 = _184 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _196 = fma(_182, (*spvDescriptorSet0.vp_c10)._m0[4].x, _190);
    float _198 = fma(_182, (*spvDescriptorSet0.vp_c10)._m0[5].x, _192);
    float _200 = fma(_182, (*spvDescriptorSet0.vp_c10)._m0[6].x, _194);
    float _202 = fma(_186, (*spvDescriptorSet0.vp_c10)._m0[4].z, _196);
    float _204 = fma(_186, (*spvDescriptorSet0.vp_c10)._m0[5].z, _198);
    float _206 = fma(_186, (*spvDescriptorSet0.vp_c10)._m0[6].z, _200);
    bool _208 = !_188;
    float _210 = _202;
    float _228;
    if (!_208)
    {
        float _212 = in.m_55.x;
        float _214 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _216 = _212 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _218 = fma(_216, (*spvDescriptorSet0.vp_c9)._m0[12].x, _160);
        float _220 = _218 * _214;
        float _222 = floor(_220);
        float _224 = -_222;
        float _226 = _220 + _224;
        _228 = _226;
        _230 = true;
    }
    else
    {
        float _232 = float(_126);
        float _234 = 1.0 / _232;
        float _236 = _160 * _234;
        _228 = _236;
    }
    _230 = false;
    float _238 = _228;
    float _240 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _242 = _238 + _240;
    float _244 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _246 = _238 + _244;
    bool _248 = _238 >= (*spvDescriptorSet0.vp_c9)._m0[146].w;
    bool _250 = isnan(_238);
    bool _252 = _248 || _250;
    bool _254 = isnan((*spvDescriptorSet0.vp_c9)._m0[146].w);
    bool _256 = _252 || _254;
    float _258 = float(_256);
    float _260 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _262 = (*spvDescriptorSet0.vp_c9)._m0[146].w + _260;
    float _264 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _266 = _238 + _264;
    float _268 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _270 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _268;
    float _272 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _274 = _272 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _276 = 1.0 / _262;
    bool _278 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _280 = 1.0 / _274;
    float _282 = 1.0 / _270;
    float _284 = _242 * _276;
    bool _286 = _238 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _288 = isnan(_238);
    bool _290 = _286 || _288;
    bool _292 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _294 = _290 || _292;
    float _296 = float(_294);
    float _298 = -_258;
    float _300 = _298 + 1.0;
    float _302 = _296 * _300;
    float _304 = _246 * _280;
    bool _306 = _238 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _308 = isnan(_238);
    bool _310 = _306 || _308;
    bool _312 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _314 = _310 || _312;
    float _316 = float(_314);
    float _318 = -(*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _320 = (*spvDescriptorSet0.vp_c9)._m0[144].z + _318;
    bool _322 = _238 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _324 = isnan(_238);
    bool _326 = _322 || _324;
    bool _328 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _330 = _326 || _328;
    float _332 = float(_330);
    float _334 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _336 = _334 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _338 = -_296;
    float _340 = _338 + 1.0;
    float _342 = -_316;
    float _344 = _342 + 1.0;
    float _346 = _266 * _282;
    float _348 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _350 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _348;
    float _352 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _354 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _352;
    float _356 = _332 * _344;
    float _358 = fma(_320, _346, (*spvDescriptorSet0.vp_c9)._m0[143].z);
    float _360 = fma(_350, _346, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _362 = fma(_354, _346, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _364 = _316 * _340;
    float _366 = -(*spvDescriptorSet0.vp_c9)._m0[144].z;
    float _368 = _366 + (*spvDescriptorSet0.vp_c9)._m0[145].z;
    float _370 = _360 * _356;
    float _372 = _362 * _356;
    float _374 = _358 * _356;
    float _376 = -_332;
    float _378 = _376 + 1.0;
    float _380 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _382 = _380 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _384 = fma(_378, (*spvDescriptorSet0.vp_c9)._m0[143].x, _372);
    float _386 = fma(_378, (*spvDescriptorSet0.vp_c9)._m0[143].y, _370);
    float _388 = fma(_378, (*spvDescriptorSet0.vp_c9)._m0[143].z, _374);
    float _390 = -(*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _392 = (*spvDescriptorSet0.vp_c9)._m0[146].x + _390;
    float _394 = fma(_336, _304, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _396 = fma(_382, _304, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _398 = fma(_368, _304, (*spvDescriptorSet0.vp_c9)._m0[144].z);
    float _400 = -(*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _402 = (*spvDescriptorSet0.vp_c9)._m0[146].y + _400;
    float _404 = -(*spvDescriptorSet0.vp_c9)._m0[145].z;
    float _406 = (*spvDescriptorSet0.vp_c9)._m0[146].z + _404;
    float _408 = fma(_394, _364, _384);
    float _410 = fma(_392, _284, (*spvDescriptorSet0.vp_c9)._m0[145].x);
    float _412 = fma(_402, _284, (*spvDescriptorSet0.vp_c9)._m0[145].y);
    float _414 = fma(_406, _284, (*spvDescriptorSet0.vp_c9)._m0[145].z);
    float _416 = fma(_396, _364, _386);
    float _418 = fma(_398, _364, _388);
    float _420 = fma(_410, _302, _408);
    float _422 = fma(_412, _302, _416);
    float _424 = fma(_414, _302, _418);
    float _426 = fma(_258, (*spvDescriptorSet0.vp_c9)._m0[146].x, _420);
    float _428 = fma(_258, (*spvDescriptorSet0.vp_c9)._m0[146].y, _422);
    float _430 = fma(_258, (*spvDescriptorSet0.vp_c9)._m0[146].z, _424);
    bool _432 = !_278;
    float _450;
    if (!_432)
    {
        float _434 = in.m_55.x;
        float _436 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _438 = _434 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _440 = fma(_438, (*spvDescriptorSet0.vp_c9)._m0[11].y, _160);
        float _442 = _440 * _436;
        float _444 = floor(_442);
        float _446 = -_444;
        float _448 = _442 + _446;
        _450 = _448;
        _452 = true;
    }
    else
    {
        float _454 = float(_126);
        float _456 = 1.0 / _454;
        float _458 = _160 * _456;
        _450 = _458;
    }
    _452 = false;
    float _460 = _450;
    float _462 = in.m_57.x;
    float _464 = in.m_57.y;
    float _466 = in.m_57.z;
    bool _468 = _460 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _470 = isnan(_460);
    bool _472 = _468 || _470;
    bool _474 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _476 = _472 || _474;
    float _478 = float(_476);
    float _480 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _482 = _480 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _484 = _460 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _486 = isnan(_460);
    bool _488 = _484 || _486;
    bool _490 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _492 = _488 || _490;
    float _494 = float(_492);
    float _496 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _498 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _496;
    float _500 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _502 = _460 + _500;
    float _504 = -_478;
    float _506 = _504 + 1.0;
    bool _508 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].z;
    float _510 = 1.0 / _482;
    float _512 = _494 * _506;
    float _514 = -_494;
    float _516 = _514 + 1.0;
    float _518 = _430 * _466;
    float _520 = _428 * _464;
    float _522 = _498 * _510;
    float _524 = _426 * _462;
    float _526 = fma(_522, _502, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _528 = _526 * _512;
    float _530 = fma(_516, (*spvDescriptorSet0.vp_c9)._m0[115].x, _528);
    float _532 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _534 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _536 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _538 = fma(_478, (*spvDescriptorSet0.vp_c9)._m0[116].x, _530);
    float _540 = _532 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _542 = _534 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _544 = _536 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _546 = _538 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    out.m_59.x = _540;
    out.m_59.y = _542;
    out.m_59.z = _544;
    out.m_59.w = _546;
    bool _548 = !_508;
    float _566;
    if (!_548)
    {
        float _550 = in.m_55.x;
        float _552 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].z;
        float _554 = _550 * (*spvDescriptorSet0.vp_c9)._m0[12].w;
        float _556 = fma(_554, (*spvDescriptorSet0.vp_c9)._m0[11].z, _160);
        float _558 = _556 * _552;
        float _560 = floor(_558);
        float _562 = -_560;
        float _564 = _558 + _562;
        _566 = _564;
        _568 = true;
    }
    else
    {
        float _570 = float(_126);
        float _572 = 1.0 / _570;
        float _574 = _160 * _572;
        _566 = _574;
    }
    _568 = false;
    float _576 = _566;
    float _578 = -(*spvDescriptorSet0.vp_c9)._m0[123].w;
    float _580 = _576 + _578;
    bool _582 = _576 >= (*spvDescriptorSet0.vp_c9)._m0[124].w;
    bool _584 = isnan(_576);
    bool _586 = _582 || _584;
    bool _588 = isnan((*spvDescriptorSet0.vp_c9)._m0[124].w);
    bool _590 = _586 || _588;
    float _592 = float(_590);
    float _594 = -(*spvDescriptorSet0.vp_c9)._m0[123].w;
    float _596 = (*spvDescriptorSet0.vp_c9)._m0[124].w + _594;
    bool _598 = _576 >= (*spvDescriptorSet0.vp_c9)._m0[123].w;
    bool _600 = isnan(_576);
    bool _602 = _598 || _600;
    bool _604 = isnan((*spvDescriptorSet0.vp_c9)._m0[123].w);
    bool _606 = _602 || _604;
    float _608 = float(_606);
    float _610 = -_592;
    float _612 = _610 + 1.0;
    float _614 = -(*spvDescriptorSet0.vp_c9)._m0[123].x;
    float _616 = (*spvDescriptorSet0.vp_c9)._m0[124].x + _614;
    float _618 = 1.0 / _596;
    bool _620 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].w;
    float _622 = _608 * _612;
    float _624 = -_608;
    float _626 = _624 + 1.0;
    float _628 = _580 * _618;
    float _630 = -(*spvDescriptorSet0.vp_c9)._m0[123].z;
    float _632 = (*spvDescriptorSet0.vp_c9)._m0[124].z + _630;
    float _634 = fma(_616, _628, (*spvDescriptorSet0.vp_c9)._m0[123].x);
    float _636 = -(*spvDescriptorSet0.vp_c9)._m0[123].y;
    float _638 = (*spvDescriptorSet0.vp_c9)._m0[124].y + _636;
    float _640 = fma(_632, _628, (*spvDescriptorSet0.vp_c9)._m0[123].z);
    float _642 = _634 * _622;
    float _644 = fma(_638, _628, (*spvDescriptorSet0.vp_c9)._m0[123].y);
    float _646 = _640 * _622;
    float _648 = _644 * _622;
    float _650 = fma(_626, (*spvDescriptorSet0.vp_c9)._m0[123].x, _642);
    float _652 = fma(_626, (*spvDescriptorSet0.vp_c9)._m0[123].y, _648);
    float _654 = fma(_626, (*spvDescriptorSet0.vp_c9)._m0[123].z, _646);
    float _656 = fma(_592, (*spvDescriptorSet0.vp_c9)._m0[124].x, _650);
    float _658 = fma(_592, (*spvDescriptorSet0.vp_c9)._m0[124].y, _652);
    float _660 = fma(_592, (*spvDescriptorSet0.vp_c9)._m0[124].z, _654);
    bool _662 = !_620;
    float _680;
    if (!_662)
    {
        float _664 = in.m_55.x;
        float _666 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].w;
        float _668 = _664 * (*spvDescriptorSet0.vp_c9)._m0[13].x;
        float _670 = fma(_668, (*spvDescriptorSet0.vp_c9)._m0[11].w, _160);
        float _672 = _670 * _666;
        float _674 = floor(_672);
        float _676 = -_674;
        float _678 = _672 + _676;
        _680 = _678;
        _682 = true;
    }
    else
    {
        float _684 = float(_126);
        float _686 = 1.0 / _684;
        float _688 = _160 * _686;
        _680 = _688;
    }
    _682 = false;
    float _690 = _680;
    float _692 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _694 = _690 + _692;
    float _696 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _698 = _696 + (*spvDescriptorSet0.vp_c9)._m0[132].w;
    bool _700 = _690 >= (*spvDescriptorSet0.vp_c9)._m0[132].w;
    bool _702 = isnan(_690);
    bool _704 = _700 || _702;
    bool _706 = isnan((*spvDescriptorSet0.vp_c9)._m0[132].w);
    bool _708 = _704 || _706;
    float _710 = float(_708);
    float _712 = -(*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _714 = _712 + (*spvDescriptorSet0.vp_c9)._m0[133].w;
    bool _716 = _690 >= (*spvDescriptorSet0.vp_c9)._m0[131].w;
    bool _718 = isnan(_690);
    bool _720 = _716 || _718;
    bool _722 = isnan((*spvDescriptorSet0.vp_c9)._m0[131].w);
    bool _724 = _720 || _722;
    float _726 = float(_724);
    float _728 = -(*spvDescriptorSet0.vp_c9)._m0[131].x;
    float _730 = (*spvDescriptorSet0.vp_c9)._m0[132].x + _728;
    bool _732 = _690 >= (*spvDescriptorSet0.vp_c9)._m0[133].w;
    bool _734 = isnan(_690);
    bool _736 = _732 || _734;
    bool _738 = isnan((*spvDescriptorSet0.vp_c9)._m0[133].w);
    bool _740 = _736 || _738;
    float _742 = float(_740);
    float _744 = 1.0 / _698;
    float _746 = -_710;
    float _748 = _746 + 1.0;
    bool _750 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[14].x;
    float _752 = _726 * _748;
    float _754 = -_726;
    float _756 = _754 + 1.0;
    float _758 = 1.0 / _714;
    float _760 = _730 * _744;
    float _762 = -(*spvDescriptorSet0.vp_c9)._m0[132].x;
    float _764 = _762 + (*spvDescriptorSet0.vp_c9)._m0[133].x;
    float _766 = fma(_760, _694, (*spvDescriptorSet0.vp_c9)._m0[131].x);
    float _768 = _764 * _758;
    float _770 = _766 * _752;
    float _772 = -_742;
    float _774 = _772 + 1.0;
    float _776 = -(*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _778 = _690 + _776;
    float _780 = _656 * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _782 = fma(_756, (*spvDescriptorSet0.vp_c9)._m0[131].x, _770);
    float _784 = _710 * _774;
    float _786 = fma(_768, _778, (*spvDescriptorSet0.vp_c9)._m0[132].x);
    float _788 = _660 * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _790 = fma(_786, _784, _782);
    float _792 = _658 * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _794 = _780 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _796 = _788 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _798 = fma(_742, (*spvDescriptorSet0.vp_c9)._m0[133].x, _790);
    float _800 = _792 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _802 = _798 * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    out.m_61.x = _794;
    out.m_61.y = _800;
    out.m_61.z = _796;
    out.m_61.w = _802;
    bool _804 = !_750;
    float _822;
    if (!_804)
    {
        float _806 = in.m_55.x;
        float _808 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[14].x;
        float _810 = _806 * (*spvDescriptorSet0.vp_c9)._m0[15].x;
        float _812 = fma(_810, (*spvDescriptorSet0.vp_c9)._m0[14].x, _160);
        float _814 = _812 * _808;
        float _816 = floor(_814);
        float _818 = -_816;
        float _820 = _814 + _818;
        _822 = _820;
        _824 = true;
    }
    else
    {
        float _826 = float(_126);
        float _828 = 1.0 / _826;
        float _830 = _160 * _828;
        _822 = _830;
    }
    _824 = false;
    float _832 = _822;
    float _834 = -(*spvDescriptorSet0.vp_c9)._m0[159].w;
    float _836 = _832 + _834;
    bool _838 = _832 >= (*spvDescriptorSet0.vp_c9)._m0[165].w;
    bool _840 = isnan(_832);
    bool _842 = _838 || _840;
    bool _844 = isnan((*spvDescriptorSet0.vp_c9)._m0[165].w);
    bool _846 = _842 || _844;
    float _848 = float(_846);
    float _850 = -(*spvDescriptorSet0.vp_c9)._m0[159].w;
    float _852 = _850 + (*spvDescriptorSet0.vp_c9)._m0[160].w;
    bool _854 = _832 >= (*spvDescriptorSet0.vp_c9)._m0[164].w;
    bool _856 = isnan(_832);
    bool _858 = _854 || _856;
    bool _860 = isnan((*spvDescriptorSet0.vp_c9)._m0[164].w);
    bool _862 = _858 || _860;
    float _864 = float(_862);
    float _866 = -(*spvDescriptorSet0.vp_c9)._m0[159].x;
    float _868 = (*spvDescriptorSet0.vp_c9)._m0[160].x + _866;
    bool _870 = _832 >= (*spvDescriptorSet0.vp_c9)._m0[163].w;
    bool _872 = isnan(_832);
    bool _874 = _870 || _872;
    bool _876 = isnan((*spvDescriptorSet0.vp_c9)._m0[163].w);
    bool _878 = _874 || _876;
    float _880 = float(_878);
    float _882 = -_848;
    float _884 = _882 + 1.0;
    float _886 = 1.0 / _852;
    float _888 = _864 * _884;
    float _890 = -_880;
    float _892 = _890 + 1.0;
    float _894 = -(*spvDescriptorSet0.vp_c9)._m0[160].w;
    float _896 = _894 + (*spvDescriptorSet0.vp_c9)._m0[161].w;
    bool _898 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[14].y;
    float _900 = 1.0 / _896;
    float _902 = _868 * _886;
    float _904 = -_864;
    float _906 = _904 + 1.0;
    bool _908 = _832 >= (*spvDescriptorSet0.vp_c9)._m0[162].w;
    bool _910 = isnan(_832);
    bool _912 = _908 || _910;
    bool _914 = isnan((*spvDescriptorSet0.vp_c9)._m0[162].w);
    bool _916 = _912 || _914;
    float _918 = float(_916);
    float _920 = fma(_902, _836, (*spvDescriptorSet0.vp_c9)._m0[159].x);
    float _922 = _880 * _906;
    bool _924 = _832 >= (*spvDescriptorSet0.vp_c9)._m0[161].w;
    bool _926 = isnan(_832);
    bool _928 = _924 || _926;
    bool _930 = isnan((*spvDescriptorSet0.vp_c9)._m0[161].w);
    bool _932 = _928 || _930;
    float _934 = float(_932);
    float _936 = _918 * _892;
    float _938 = -_918;
    float _940 = _938 + 1.0;
    float _942 = -(*spvDescriptorSet0.vp_c9)._m0[161].w;
    float _944 = _942 + (*spvDescriptorSet0.vp_c9)._m0[162].w;
    bool _946 = _832 >= (*spvDescriptorSet0.vp_c9)._m0[160].w;
    bool _948 = isnan(_832);
    bool _950 = _946 || _948;
    bool _952 = isnan((*spvDescriptorSet0.vp_c9)._m0[160].w);
    bool _954 = _950 || _952;
    float _956 = float(_954);
    float _958 = _934 * _940;
    float _960 = -_934;
    float _962 = _960 + 1.0;
    float _964 = -(*spvDescriptorSet0.vp_c9)._m0[162].w;
    float _966 = _964 + (*spvDescriptorSet0.vp_c9)._m0[163].w;
    float _968 = 1.0 / _944;
    bool _970 = _832 >= (*spvDescriptorSet0.vp_c9)._m0[159].w;
    bool _972 = isnan(_832);
    bool _974 = _970 || _972;
    bool _976 = isnan((*spvDescriptorSet0.vp_c9)._m0[159].w);
    bool _978 = _974 || _976;
    float _980 = float(_978);
    float _982 = _956 * _962;
    float _984 = -_956;
    float _986 = _984 + 1.0;
    float _988 = -(*spvDescriptorSet0.vp_c9)._m0[163].w;
    float _990 = _988 + (*spvDescriptorSet0.vp_c9)._m0[164].w;
    float _992 = -(*spvDescriptorSet0.vp_c9)._m0[160].x;
    float _994 = _992 + (*spvDescriptorSet0.vp_c9)._m0[161].x;
    float _996 = _980 * _986;
    float _998 = 1.0 / _966;
    float _1000 = _994 * _900;
    float _1002 = _920 * _996;
    float _1004 = -_980;
    float _1006 = _1004 + 1.0;
    float _1008 = -(*spvDescriptorSet0.vp_c9)._m0[164].w;
    float _1010 = _1008 + (*spvDescriptorSet0.vp_c9)._m0[165].w;
    float _1012 = -(*spvDescriptorSet0.vp_c9)._m0[160].w;
    float _1014 = _832 + _1012;
    float _1016 = 1.0 / _990;
    float _1018 = -(*spvDescriptorSet0.vp_c9)._m0[161].x;
    float _1020 = (*spvDescriptorSet0.vp_c9)._m0[162].x + _1018;
    float _1022 = fma(_1006, (*spvDescriptorSet0.vp_c9)._m0[159].x, _1002);
    float _1024 = -(*spvDescriptorSet0.vp_c9)._m0[165].w;
    float _1026 = _1024 + (*spvDescriptorSet0.vp_c9)._m0[166].w;
    float _1028 = fma(_1000, _1014, (*spvDescriptorSet0.vp_c9)._m0[160].x);
    float _1030 = _1020 * _968;
    float _1032 = -(*spvDescriptorSet0.vp_c9)._m0[161].w;
    float _1034 = _832 + _1032;
    float _1036 = 1.0 / _1010;
    float _1038 = -(*spvDescriptorSet0.vp_c9)._m0[162].x;
    float _1040 = _1038 + (*spvDescriptorSet0.vp_c9)._m0[163].x;
    float _1042 = fma(_1030, _1034, (*spvDescriptorSet0.vp_c9)._m0[161].x);
    float _1044 = fma(_1028, _982, _1022);
    float _1046 = -(*spvDescriptorSet0.vp_c9)._m0[163].x;
    float _1048 = (*spvDescriptorSet0.vp_c9)._m0[164].x + _1046;
    float _1050 = _1040 * _998;
    float _1052 = -(*spvDescriptorSet0.vp_c9)._m0[162].w;
    float _1054 = _832 + _1052;
    float _1056 = 1.0 / _1026;
    float _1058 = fma(_1042, _958, _1044);
    float _1060 = _1048 * _1016;
    float _1062 = -(*spvDescriptorSet0.vp_c9)._m0[163].w;
    float _1064 = _832 + _1062;
    float _1066 = -(*spvDescriptorSet0.vp_c9)._m0[164].x;
    float _1068 = _1066 + (*spvDescriptorSet0.vp_c9)._m0[165].x;
    float _1070 = fma(_1050, _1054, (*spvDescriptorSet0.vp_c9)._m0[162].x);
    float _1072 = -(*spvDescriptorSet0.vp_c9)._m0[164].w;
    float _1074 = _832 + _1072;
    float _1076 = fma(_1060, _1064, (*spvDescriptorSet0.vp_c9)._m0[163].x);
    float _1078 = _1068 * _1036;
    float _1080 = -(*spvDescriptorSet0.vp_c9)._m0[165].x;
    float _1082 = (*spvDescriptorSet0.vp_c9)._m0[166].x + _1080;
    bool _1084 = _832 >= (*spvDescriptorSet0.vp_c9)._m0[166].w;
    bool _1086 = isnan(_832);
    bool _1088 = _1084 || _1086;
    bool _1090 = isnan((*spvDescriptorSet0.vp_c9)._m0[166].w);
    bool _1092 = _1088 || _1090;
    float _1094 = float(_1092);
    float _1096 = fma(_1070, _936, _1058);
    float _1098 = fma(_1078, _1074, (*spvDescriptorSet0.vp_c9)._m0[164].x);
    float _1100 = -(*spvDescriptorSet0.vp_c9)._m0[165].w;
    float _1102 = _832 + _1100;
    float _1104 = -_1094;
    float _1106 = _1104 + 1.0;
    float _1108 = _1082 * _1056;
    float _1110 = fma(_1076, _922, _1096);
    float _1112 = _848 * _1106;
    float _1114 = fma(_1108, _1102, (*spvDescriptorSet0.vp_c9)._m0[165].x);
    float _1116 = fma(_1098, _888, _1110);
    float _1118 = fma(_1114, _1112, _1116);
    float _1120 = fma(_1094, (*spvDescriptorSet0.vp_c9)._m0[166].x, _1118);
    out.m_63.x = _1120;
    bool _1122 = !_898;
    float _1140;
    if (!_1122)
    {
        float _1124 = in.m_55.x;
        float _1126 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[14].y;
        float _1128 = _1124 * (*spvDescriptorSet0.vp_c9)._m0[15].y;
        float _1130 = fma(_1128, (*spvDescriptorSet0.vp_c9)._m0[14].y, _160);
        float _1132 = _1130 * _1126;
        float _1134 = floor(_1132);
        float _1136 = -_1134;
        float _1138 = _1132 + _1136;
        _1140 = _1138;
        _1142 = true;
    }
    else
    {
        float _1144 = float(_126);
        float _1146 = 1.0 / _1144;
        float _1148 = _160 * _1146;
        _1140 = _1148;
    }
    _1142 = false;
    float _1150 = _1140;
    float _1152 = -(*spvDescriptorSet0.vp_c9)._m0[167].w;
    float _1154 = _1150 + _1152;
    bool _1156 = _1150 >= (*spvDescriptorSet0.vp_c9)._m0[173].w;
    bool _1158 = isnan(_1150);
    bool _1160 = _1156 || _1158;
    bool _1162 = isnan((*spvDescriptorSet0.vp_c9)._m0[173].w);
    bool _1164 = _1160 || _1162;
    float _1166 = float(_1164);
    float _1168 = -(*spvDescriptorSet0.vp_c9)._m0[167].w;
    float _1170 = _1168 + (*spvDescriptorSet0.vp_c9)._m0[168].w;
    bool _1172 = _1150 >= (*spvDescriptorSet0.vp_c9)._m0[172].w;
    bool _1174 = isnan(_1150);
    bool _1176 = _1172 || _1174;
    bool _1178 = isnan((*spvDescriptorSet0.vp_c9)._m0[172].w);
    bool _1180 = _1176 || _1178;
    float _1182 = float(_1180);
    float _1184 = -(*spvDescriptorSet0.vp_c9)._m0[167].x;
    float _1186 = (*spvDescriptorSet0.vp_c9)._m0[168].x + _1184;
    bool _1188 = _1150 >= (*spvDescriptorSet0.vp_c9)._m0[171].w;
    bool _1190 = isnan(_1150);
    bool _1192 = _1188 || _1190;
    bool _1194 = isnan((*spvDescriptorSet0.vp_c9)._m0[171].w);
    bool _1196 = _1192 || _1194;
    float _1198 = float(_1196);
    float _1200 = -_1166;
    float _1202 = _1200 + 1.0;
    float _1204 = 1.0 / _1170;
    float _1206 = _1182 * _1202;
    float _1208 = -_1198;
    float _1210 = _1208 + 1.0;
    float _1212 = -(*spvDescriptorSet0.vp_c9)._m0[168].w;
    float _1214 = _1212 + (*spvDescriptorSet0.vp_c9)._m0[169].w;
    bool _1216 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[14].z;
    float _1218 = 1.0 / _1214;
    float _1220 = _1186 * _1204;
    float _1222 = -_1182;
    float _1224 = _1222 + 1.0;
    bool _1226 = _1150 >= (*spvDescriptorSet0.vp_c9)._m0[170].w;
    bool _1228 = isnan(_1150);
    bool _1230 = _1226 || _1228;
    bool _1232 = isnan((*spvDescriptorSet0.vp_c9)._m0[170].w);
    bool _1234 = _1230 || _1232;
    float _1236 = float(_1234);
    float _1238 = fma(_1220, _1154, (*spvDescriptorSet0.vp_c9)._m0[167].x);
    float _1240 = _1198 * _1224;
    bool _1242 = _1150 >= (*spvDescriptorSet0.vp_c9)._m0[169].w;
    bool _1244 = isnan(_1150);
    bool _1246 = _1242 || _1244;
    bool _1248 = isnan((*spvDescriptorSet0.vp_c9)._m0[169].w);
    bool _1250 = _1246 || _1248;
    float _1252 = float(_1250);
    float _1254 = _1236 * _1210;
    float _1256 = -_1236;
    float _1258 = _1256 + 1.0;
    float _1260 = -(*spvDescriptorSet0.vp_c9)._m0[169].w;
    float _1262 = _1260 + (*spvDescriptorSet0.vp_c9)._m0[170].w;
    bool _1264 = _1150 >= (*spvDescriptorSet0.vp_c9)._m0[168].w;
    bool _1266 = isnan(_1150);
    bool _1268 = _1264 || _1266;
    bool _1270 = isnan((*spvDescriptorSet0.vp_c9)._m0[168].w);
    bool _1272 = _1268 || _1270;
    float _1274 = float(_1272);
    float _1276 = _1252 * _1258;
    float _1278 = -_1252;
    float _1280 = _1278 + 1.0;
    float _1282 = -(*spvDescriptorSet0.vp_c9)._m0[170].w;
    float _1284 = _1282 + (*spvDescriptorSet0.vp_c9)._m0[171].w;
    float _1286 = 1.0 / _1262;
    bool _1288 = _1150 >= (*spvDescriptorSet0.vp_c9)._m0[167].w;
    bool _1290 = isnan(_1150);
    bool _1292 = _1288 || _1290;
    bool _1294 = isnan((*spvDescriptorSet0.vp_c9)._m0[167].w);
    bool _1296 = _1292 || _1294;
    float _1298 = float(_1296);
    float _1300 = _1274 * _1280;
    float _1302 = -_1274;
    float _1304 = _1302 + 1.0;
    float _1306 = -(*spvDescriptorSet0.vp_c9)._m0[171].w;
    float _1308 = _1306 + (*spvDescriptorSet0.vp_c9)._m0[172].w;
    float _1310 = -(*spvDescriptorSet0.vp_c9)._m0[168].x;
    float _1312 = _1310 + (*spvDescriptorSet0.vp_c9)._m0[169].x;
    float _1314 = _1298 * _1304;
    float _1316 = 1.0 / _1284;
    float _1318 = _1312 * _1218;
    float _1320 = _1238 * _1314;
    float _1322 = -_1298;
    float _1324 = _1322 + 1.0;
    float _1326 = -(*spvDescriptorSet0.vp_c9)._m0[172].w;
    float _1328 = _1326 + (*spvDescriptorSet0.vp_c9)._m0[173].w;
    float _1330 = -(*spvDescriptorSet0.vp_c9)._m0[168].w;
    float _1332 = _1150 + _1330;
    float _1334 = 1.0 / _1308;
    float _1336 = -(*spvDescriptorSet0.vp_c9)._m0[169].x;
    float _1338 = (*spvDescriptorSet0.vp_c9)._m0[170].x + _1336;
    float _1340 = fma(_1324, (*spvDescriptorSet0.vp_c9)._m0[167].x, _1320);
    float _1342 = -(*spvDescriptorSet0.vp_c9)._m0[173].w;
    float _1344 = _1342 + (*spvDescriptorSet0.vp_c9)._m0[174].w;
    float _1346 = fma(_1318, _1332, (*spvDescriptorSet0.vp_c9)._m0[168].x);
    float _1348 = _1338 * _1286;
    float _1350 = -(*spvDescriptorSet0.vp_c9)._m0[169].w;
    float _1352 = _1150 + _1350;
    float _1354 = 1.0 / _1328;
    float _1356 = -(*spvDescriptorSet0.vp_c9)._m0[170].x;
    float _1358 = _1356 + (*spvDescriptorSet0.vp_c9)._m0[171].x;
    float _1360 = fma(_1348, _1352, (*spvDescriptorSet0.vp_c9)._m0[169].x);
    float _1362 = fma(_1346, _1300, _1340);
    float _1364 = -(*spvDescriptorSet0.vp_c9)._m0[171].x;
    float _1366 = (*spvDescriptorSet0.vp_c9)._m0[172].x + _1364;
    float _1368 = _1358 * _1316;
    float _1370 = -(*spvDescriptorSet0.vp_c9)._m0[170].w;
    float _1372 = _1150 + _1370;
    float _1374 = 1.0 / _1344;
    float _1376 = fma(_1360, _1276, _1362);
    float _1378 = _1366 * _1334;
    float _1380 = -(*spvDescriptorSet0.vp_c9)._m0[171].w;
    float _1382 = _1150 + _1380;
    float _1384 = -(*spvDescriptorSet0.vp_c9)._m0[172].x;
    float _1386 = _1384 + (*spvDescriptorSet0.vp_c9)._m0[173].x;
    float _1388 = fma(_1368, _1372, (*spvDescriptorSet0.vp_c9)._m0[170].x);
    float _1390 = -(*spvDescriptorSet0.vp_c9)._m0[172].w;
    float _1392 = _1150 + _1390;
    float _1394 = fma(_1378, _1382, (*spvDescriptorSet0.vp_c9)._m0[171].x);
    float _1396 = _1386 * _1354;
    float _1398 = -(*spvDescriptorSet0.vp_c9)._m0[173].x;
    float _1400 = (*spvDescriptorSet0.vp_c9)._m0[174].x + _1398;
    bool _1402 = _1150 >= (*spvDescriptorSet0.vp_c9)._m0[174].w;
    bool _1404 = isnan(_1150);
    bool _1406 = _1402 || _1404;
    bool _1408 = isnan((*spvDescriptorSet0.vp_c9)._m0[174].w);
    bool _1410 = _1406 || _1408;
    float _1412 = float(_1410);
    float _1414 = fma(_1388, _1254, _1376);
    float _1416 = fma(_1396, _1392, (*spvDescriptorSet0.vp_c9)._m0[172].x);
    float _1418 = -(*spvDescriptorSet0.vp_c9)._m0[173].w;
    float _1420 = _1150 + _1418;
    float _1422 = -_1412;
    float _1424 = _1422 + 1.0;
    float _1426 = _1400 * _1374;
    float _1428 = fma(_1394, _1240, _1414);
    float _1430 = _1166 * _1424;
    float _1432 = fma(_1426, _1420, (*spvDescriptorSet0.vp_c9)._m0[173].x);
    float _1434 = fma(_1416, _1206, _1428);
    float _1436 = fma(_1432, _1430, _1434);
    float _1438 = fma(_1412, (*spvDescriptorSet0.vp_c9)._m0[174].x, _1436);
    out.m_65.x = _1438;
    bool _1440 = !_1216;
    float _1458;
    if (!_1440)
    {
        float _1442 = in.m_55.x;
        float _1444 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[14].z;
        float _1446 = _1442 * (*spvDescriptorSet0.vp_c9)._m0[15].z;
        float _1448 = fma(_1446, (*spvDescriptorSet0.vp_c9)._m0[14].z, _160);
        float _1450 = _1448 * _1444;
        float _1452 = floor(_1450);
        float _1454 = -_1452;
        float _1456 = _1450 + _1454;
        _1458 = _1456;
        _1460 = true;
    }
    else
    {
        float _1462 = float(_126);
        float _1464 = 1.0 / _1462;
        float _1466 = _160 * _1464;
        _1458 = _1466;
    }
    _1460 = false;
    float _1468 = _1458;
    float _1470 = -(*spvDescriptorSet0.vp_c9)._m0[175].w;
    float _1472 = _1468 + _1470;
    bool _1474 = _1468 >= (*spvDescriptorSet0.vp_c9)._m0[181].w;
    bool _1476 = isnan(_1468);
    bool _1478 = _1474 || _1476;
    bool _1480 = isnan((*spvDescriptorSet0.vp_c9)._m0[181].w);
    bool _1482 = _1478 || _1480;
    float _1484 = float(_1482);
    float _1486 = -(*spvDescriptorSet0.vp_c9)._m0[175].w;
    float _1488 = _1486 + (*spvDescriptorSet0.vp_c9)._m0[176].w;
    bool _1490 = _1468 >= (*spvDescriptorSet0.vp_c9)._m0[180].w;
    bool _1492 = isnan(_1468);
    bool _1494 = _1490 || _1492;
    bool _1496 = isnan((*spvDescriptorSet0.vp_c9)._m0[180].w);
    bool _1498 = _1494 || _1496;
    float _1500 = float(_1498);
    float _1502 = -(*spvDescriptorSet0.vp_c9)._m0[175].x;
    float _1504 = (*spvDescriptorSet0.vp_c9)._m0[176].x + _1502;
    bool _1506 = _1468 >= (*spvDescriptorSet0.vp_c9)._m0[179].w;
    bool _1508 = isnan(_1468);
    bool _1510 = _1506 || _1508;
    bool _1512 = isnan((*spvDescriptorSet0.vp_c9)._m0[179].w);
    bool _1514 = _1510 || _1512;
    float _1516 = float(_1514);
    float _1518 = -_1484;
    float _1520 = _1518 + 1.0;
    float _1522 = 1.0 / _1488;
    float _1524 = _1500 * _1520;
    float _1526 = -_1516;
    float _1528 = _1526 + 1.0;
    float _1530 = -(*spvDescriptorSet0.vp_c9)._m0[176].w;
    float _1532 = _1530 + (*spvDescriptorSet0.vp_c9)._m0[177].w;
    bool _1534 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[14].w;
    float _1536 = 1.0 / _1532;
    float _1538 = _1504 * _1522;
    float _1540 = -_1500;
    float _1542 = _1540 + 1.0;
    bool _1544 = _1468 >= (*spvDescriptorSet0.vp_c9)._m0[178].w;
    bool _1546 = isnan(_1468);
    bool _1548 = _1544 || _1546;
    bool _1550 = isnan((*spvDescriptorSet0.vp_c9)._m0[178].w);
    bool _1552 = _1548 || _1550;
    float _1554 = float(_1552);
    float _1556 = fma(_1538, _1472, (*spvDescriptorSet0.vp_c9)._m0[175].x);
    float _1558 = _1516 * _1542;
    bool _1560 = _1468 >= (*spvDescriptorSet0.vp_c9)._m0[177].w;
    bool _1562 = isnan(_1468);
    bool _1564 = _1560 || _1562;
    bool _1566 = isnan((*spvDescriptorSet0.vp_c9)._m0[177].w);
    bool _1568 = _1564 || _1566;
    float _1570 = float(_1568);
    float _1572 = _1554 * _1528;
    float _1574 = -_1554;
    float _1576 = _1574 + 1.0;
    float _1578 = -(*spvDescriptorSet0.vp_c9)._m0[177].w;
    float _1580 = _1578 + (*spvDescriptorSet0.vp_c9)._m0[178].w;
    bool _1582 = _1468 >= (*spvDescriptorSet0.vp_c9)._m0[176].w;
    bool _1584 = isnan(_1468);
    bool _1586 = _1582 || _1584;
    bool _1588 = isnan((*spvDescriptorSet0.vp_c9)._m0[176].w);
    bool _1590 = _1586 || _1588;
    float _1592 = float(_1590);
    float _1594 = _1570 * _1576;
    float _1596 = -_1570;
    float _1598 = _1596 + 1.0;
    float _1600 = -(*spvDescriptorSet0.vp_c9)._m0[178].w;
    float _1602 = _1600 + (*spvDescriptorSet0.vp_c9)._m0[179].w;
    float _1604 = 1.0 / _1580;
    bool _1606 = _1468 >= (*spvDescriptorSet0.vp_c9)._m0[175].w;
    bool _1608 = isnan(_1468);
    bool _1610 = _1606 || _1608;
    bool _1612 = isnan((*spvDescriptorSet0.vp_c9)._m0[175].w);
    bool _1614 = _1610 || _1612;
    float _1616 = float(_1614);
    float _1618 = _1592 * _1598;
    float _1620 = -_1592;
    float _1622 = _1620 + 1.0;
    float _1624 = -(*spvDescriptorSet0.vp_c9)._m0[179].w;
    float _1626 = _1624 + (*spvDescriptorSet0.vp_c9)._m0[180].w;
    float _1628 = -(*spvDescriptorSet0.vp_c9)._m0[176].x;
    float _1630 = _1628 + (*spvDescriptorSet0.vp_c9)._m0[177].x;
    float _1632 = _1616 * _1622;
    float _1634 = 1.0 / _1602;
    float _1636 = _1630 * _1536;
    float _1638 = _1556 * _1632;
    float _1640 = -_1616;
    float _1642 = _1640 + 1.0;
    float _1644 = -(*spvDescriptorSet0.vp_c9)._m0[180].w;
    float _1646 = _1644 + (*spvDescriptorSet0.vp_c9)._m0[181].w;
    float _1648 = -(*spvDescriptorSet0.vp_c9)._m0[176].w;
    float _1650 = _1468 + _1648;
    float _1652 = 1.0 / _1626;
    float _1654 = -(*spvDescriptorSet0.vp_c9)._m0[177].x;
    float _1656 = (*spvDescriptorSet0.vp_c9)._m0[178].x + _1654;
    float _1658 = fma(_1642, (*spvDescriptorSet0.vp_c9)._m0[175].x, _1638);
    float _1660 = -(*spvDescriptorSet0.vp_c9)._m0[181].w;
    float _1662 = _1660 + (*spvDescriptorSet0.vp_c9)._m0[182].w;
    float _1664 = fma(_1636, _1650, (*spvDescriptorSet0.vp_c9)._m0[176].x);
    float _1666 = _1656 * _1604;
    float _1668 = -(*spvDescriptorSet0.vp_c9)._m0[177].w;
    float _1670 = _1468 + _1668;
    float _1672 = 1.0 / _1646;
    float _1674 = -(*spvDescriptorSet0.vp_c9)._m0[178].x;
    float _1676 = _1674 + (*spvDescriptorSet0.vp_c9)._m0[179].x;
    float _1678 = fma(_1666, _1670, (*spvDescriptorSet0.vp_c9)._m0[177].x);
    float _1680 = fma(_1664, _1618, _1658);
    float _1682 = -(*spvDescriptorSet0.vp_c9)._m0[179].x;
    float _1684 = (*spvDescriptorSet0.vp_c9)._m0[180].x + _1682;
    float _1686 = _1676 * _1634;
    float _1688 = -(*spvDescriptorSet0.vp_c9)._m0[178].w;
    float _1690 = _1468 + _1688;
    float _1692 = 1.0 / _1662;
    float _1694 = fma(_1678, _1594, _1680);
    float _1696 = _1684 * _1652;
    float _1698 = -(*spvDescriptorSet0.vp_c9)._m0[179].w;
    float _1700 = _1468 + _1698;
    float _1702 = -(*spvDescriptorSet0.vp_c9)._m0[180].x;
    float _1704 = _1702 + (*spvDescriptorSet0.vp_c9)._m0[181].x;
    float _1706 = fma(_1686, _1690, (*spvDescriptorSet0.vp_c9)._m0[178].x);
    float _1708 = -(*spvDescriptorSet0.vp_c9)._m0[180].w;
    float _1710 = _1468 + _1708;
    float _1712 = fma(_1696, _1700, (*spvDescriptorSet0.vp_c9)._m0[179].x);
    float _1714 = _1704 * _1672;
    float _1716 = -(*spvDescriptorSet0.vp_c9)._m0[181].x;
    float _1718 = (*spvDescriptorSet0.vp_c9)._m0[182].x + _1716;
    bool _1720 = _1468 >= (*spvDescriptorSet0.vp_c9)._m0[182].w;
    bool _1722 = isnan(_1468);
    bool _1724 = _1720 || _1722;
    bool _1726 = isnan((*spvDescriptorSet0.vp_c9)._m0[182].w);
    bool _1728 = _1724 || _1726;
    float _1730 = float(_1728);
    float _1732 = fma(_1706, _1572, _1694);
    float _1734 = fma(_1714, _1710, (*spvDescriptorSet0.vp_c9)._m0[180].x);
    float _1736 = -(*spvDescriptorSet0.vp_c9)._m0[181].w;
    float _1738 = _1468 + _1736;
    float _1740 = -_1730;
    float _1742 = _1740 + 1.0;
    float _1744 = _1718 * _1692;
    float _1746 = fma(_1712, _1558, _1732);
    float _1748 = _1484 * _1742;
    float _1750 = fma(_1744, _1738, (*spvDescriptorSet0.vp_c9)._m0[181].x);
    float _1752 = fma(_1734, _1524, _1746);
    float _1754 = fma(_1750, _1748, _1752);
    float _1756 = fma(_1730, (*spvDescriptorSet0.vp_c9)._m0[182].x, _1754);
    out.m_67.x = _1756;
    bool _1758 = !_1534;
    float _1760 = _1672;
    float _1762 = (*spvDescriptorSet0.vp_c9)._m0[178].x;
    float _1764 = _1692;
    float _1766 = _1680;
    float _1768 = _1484;
    float _1770 = _1524;
    float _1788;
    if (!_1758)
    {
        float _1772 = in.m_55.x;
        float _1774 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[14].w;
        float _1776 = _1772 * (*spvDescriptorSet0.vp_c9)._m0[15].w;
        float _1778 = fma(_1776, (*spvDescriptorSet0.vp_c9)._m0[14].w, _160);
        float _1780 = _1778 * _1774;
        float _1782 = floor(_1780);
        float _1784 = -_1782;
        float _1786 = _1780 + _1784;
        _1788 = _1786;
        _1790 = true;
    }
    else
    {
        float _1792 = float(_126);
        float _1794 = 1.0 / _1792;
        float _1796 = _160 * _1794;
        _1788 = _1796;
    }
    _1790 = false;
    float _1798 = _1788;
    float _1800 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].y);
    int _1802 = int(_1800);
    float _1804 = float(_126);
    float _1806 = in.m_69.x;
    float _1808 = in.m_55.y;
    int _1810 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _1812 = _1810 != 0;
    float _1814 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].x);
    int _1816 = int(_1814);
    int _1818 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _1820 = _1818 != 0;
    float _1822 = float(_1802);
    float _1824 = trunc((*spvDescriptorSet0.vp_c9)._m0[31].y);
    int _1826 = int(_1824);
    if (_1812)
    {
        float _1828 = in.m_55.x;
        _1760 = _1828;
    }
    float _1830 = _1760;
    float _1832 = float(uint(_1816));
    float _1834 = 1.0 / _1822;
    float _1836 = float(_1816);
    if (_1820)
    {
        float _1838 = in.m_55.z;
        _1762 = _1838;
    }
    float _1840 = _1762;
    int _1842 = ~_1816;
    int _1844 = _1842 + 1;
    float _1846 = 0.0;
    int _1848 = as_type<int>(_1840);
    float _1850 = _1806;
    if (!_1812)
    {
        _1846 = _1806;
    }
    float _1852 = _1846;
    float _1854 = trunc((*spvDescriptorSet0.vp_c9)._m0[40].y);
    int _1856 = int(_1854);
    float _1858 = float(_1826);
    int _1860 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _1862 = _1860 != 0;
    float _1864 = _1834 * _160;
    float _1866 = 1.0 / _1832;
    float _1868 = float(_1856);
    float _1870 = trunc(_1864);
    int _1872 = int(_1870);
    float _1874 = _1852;
    bool _1876 = _1862;
    if (_1862)
    {
        float _1878 = in.m_55.x;
        _1764 = _1878;
    }
    float _1880 = _1764;
    int _1882 = 0;
    float _1884 = _1880;
    if (_1862)
    {
        _1882 = 0;
    }
    int _1886 = _1882;
    int _1888 = 0;
    int _1890 = _1886;
    if (_1862)
    {
        _1888 = 0;
    }
    int _1892 = _1888;
    float _1894 = _1652;
    int _1896 = _1892;
    if (_1862)
    {
        float _1898 = in.m_55.z;
        _1894 = _1898;
    }
    float _1900 = _1894;
    float _1902 = 1.0 / _1858;
    int _1904 = as_type<int>(_1866) + (-2);
    float _1906 = _1836 * _160;
    if (_1862)
    {
        _1766 = 1.0;
    }
    float _1908 = _1766;
    float _1910 = _1908;
    if (_1862)
    {
        _1768 = 1.0;
    }
    float _1912 = _1768;
    float _1914 = _1912;
    if (_1862)
    {
        _1770 = 1.0;
    }
    float _1916 = _1770;
    float _1918 = 1.0 / _1868;
    float _1920 = float(uint(_1872));
    int _1922 = 0;
    float _1924 = _1916;
    if (_1862)
    {
        _1922 = as_type<int>(_1808);
    }
    int _1926 = _1922;
    float _1928 = 1.0 / _1804;
    float _1930 = as_type<float>(_1904) * _1920;
    float _1932 = _1902 * _160;
    int _1934 = as_type<int>(_1902);
    float _1936 = _1900;
    int _1938 = _1926;
    if (_1862)
    {
        _1934 = as_type<int>(_1900);
    }
    int _1940 = _1934;
    float _1942 = trunc(_1930);
    float _1944 = precise::max(_1942, 0.0);
    uint _1947 = uint(_1944);
    float _1949 = trunc((*spvDescriptorSet0.vp_c9)._m0[31].x);
    int _1951 = int(_1949);
    float _1953 = float(_1872);
    float _1955 = _1906 * _1928;
    float _1957 = in.m_55.w;
    bool _1959 = _1953 >= _1836;
    bool _1961 = isnan(_1953);
    bool _1963 = _1959 || _1961;
    bool _1965 = isnan(_1836);
    bool _1967 = _1963 || _1965;
    float _1969 = float(_1967);
    float _1971 = trunc((*spvDescriptorSet0.vp_c9)._m0[40].x);
    int _1973 = int(_1971);
    int _1975 = _1844 * int(_1947);
    int _1977 = _1975 + _1872;
    float _1979 = float(uint(_1977));
    float _1981 = trunc((*spvDescriptorSet0.vp_c9)._m0[49].x);
    int _1983 = int(_1981);
    float _1985 = float(uint(_1951));
    float _1987 = as_type<float>(_1904) * _1979;
    float _1989 = _1979;
    float _1991 = as_type<float>(_1977);
    int _1993 = _1940;
    int _1995 = as_type<int>(_1987);
    if (_1862)
    {
        _1989 = _1880;
    }
    float _1997 = _1989;
    float _1999 = trunc((*spvDescriptorSet0.vp_c9)._m0[49].y);
    int _2001 = int(_1999);
    float _2003 = float(uint(_1973));
    float _2005 = _1997;
    if (_1862)
    {
        _1991 = _1997;
    }
    float _2007 = _1991;
    int _2009 = 0;
    float _2011 = _2007;
    if (_1862)
    {
        _2009 = as_type<int>(_1997);
    }
    int _2013 = _2009;
    float _2015 = float(uint(_1983));
    float _2017 = 1.0 / _1985;
    float _2019 = float(_2001);
    float _2021 = 1.0 / _2003;
    float _2023 = 1.0 / _2019;
    float _2025 = 1.0 / _2015;
    float _2027 = trunc(_1955);
    int _2029 = int(_2027);
    float _2031 = trunc(_1932);
    int _2033 = int(_2031);
    float _2035 = trunc(_1969);
    int _2037 = int(_2035);
    float _2039 = trunc(_1987);
    float _2041 = precise::max(_2039, 0.0);
    uint _2043 = uint(_2041);
    int _2045 = _2013;
    int _2047 = int(_2043);
    if (!_1862)
    {
        float _2049 = in.m_55.x;
        float _2051 = _1808 * 3.1415927410125732421875;
        float _2053 = in.m_55.z;
        float _2055 = _2051 * 0.15915493667125701904296875;
        float _2057 = _2055 * 6.283185482025146484375;
        float _2059 = sin(_2057);
        float _2061 = _2049 * 3.1415927410125732421875;
        float _2063 = _2061 * 0.15915493667125701904296875;
        float _2065 = _2053 * 3.1415927410125732421875;
        float _2067 = _2065 * 0.15915493667125701904296875;
        float _2069 = _2063 * 6.283185482025146484375;
        float _2071 = sin(_2069);
        float _2073 = _2067 * 6.283185482025146484375;
        float _2075 = sin(_2073);
        _1914 = 1.2345600128173828125;
        _2005 = _1808;
        _1910 = 7.345489978790283203125;
        _1884 = _2049;
        _1924 = 5.839270114898681640625;
        _2011 = _2053;
        _1936 = _2053;
        _1890 = 1;
        _1896 = 2;
        _1938 = as_type<int>(_2059);
        _2045 = as_type<int>(_2071);
        _1993 = as_type<int>(_2075);
    }
    float _2077 = _1914;
    float _2079 = _2005;
    float _2081 = _1910;
    float _2083 = _1884;
    float _2085 = _1924;
    float _2087 = _2011;
    float _2089 = _1936;
    int _2091 = _1890;
    int _2093 = _1896;
    int _2095 = _1938;
    int _2097 = _2045;
    int _2099 = _1993;
    int _2101 = as_type<int>(_2081);
    if (_1812)
    {
        float _2103 = -_1806;
        float _2105 = _2103 + 1.0;
        _1995 = as_type<int>(_2105);
    }
    int _2107 = _1995;
    bool _2109 = false;
    if (_1812)
    {
        bool _2111 = _1830 > 0.5;
        _2109 = _2111;
    }
    bool _2113 = _2109;
    float _2115 = _2077 * _2079;
    int _2117 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 16;
    bool _2119 = _2117 != 0;
    float _2121 = _2081 * _2083;
    if (_1812)
    {
        float _2123 = _2113 ? as_type<float>(_2107) : _1806;
        _1874 = _2123;
    }
    float _2125 = _1874;
    float _2127 = _2085 * _2087;
    int _2129 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 64;
    bool _2131 = _2129 != 0;
    float _2133 = _2081 * _2079;
    int _2135 = int(_1947) + int(_2043);
    float _2137 = floor(_2115);
    int _2139 = ~_1816;
    int _2141 = _2139 + 1;
    float _2143 = in.m_69.y;
    int _2145 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 256;
    bool _2147 = _2145 != 0;
    if (_1820)
    {
        bool _2149 = _1840 > 0.5;
        _1876 = _2149;
    }
    bool _2151 = _1876;
    if (_1820)
    {
        float _2153 = -_1806;
        float _2155 = _2153 + 1.0;
        _1848 = as_type<int>(_2155);
    }
    int _2157 = _1848;
    int _2159 = _2141 * _2135;
    int _2161 = _2159 + _1872;
    if (_2119)
    {
        float _2163 = -_1806;
        float _2165 = _2163 + 1.0;
        _2047 = as_type<int>(_2165);
    }
    int _2167 = _2047;
    bool _2169 = _1808 > 0.5;
    float _2171 = as_type<float>(_2167);
    if (_2131)
    {
        float _2173 = -_1806;
        float _2175 = _2173 + 1.0;
        _2101 = as_type<int>(_2175);
    }
    int _2177 = _2101;
    float _2179 = 0.0;
    if (!_1820)
    {
        _2179 = _1806;
    }
    float _2181 = _2179;
    float _2183 = floor(_2127);
    float _2185 = _2181;
    if (_1820)
    {
        float _2187 = _2151 ? as_type<float>(_2157) : _1806;
        _2185 = _2187;
    }
    float _2189 = _2185;
    float _2191 = 0.0;
    if (!_2119)
    {
        _2191 = _1806;
    }
    float _2193 = _2191;
    int _2195 = 0;
    float _2197 = _2193;
    if (_2147)
    {
        float _2199 = -_1806;
        float _2201 = _2199 + 1.0;
        _2195 = as_type<int>(_2201);
    }
    int _2203 = _2195;
    bool _2205 = uint(_2161) >= uint(_1816);
    float _2207 = _1918 * _160;
    if (_2119)
    {
        float _2209 = _2169 ? as_type<float>(_2167) : _1806;
        _2197 = _2209;
    }
    float _2211 = _2197;
    float _2213 = floor(_2121);
    if (!_2131)
    {
        _2171 = _1806;
    }
    float _2215 = _2171;
    float _2217 = _2215;
    if (_2131)
    {
        float _2219 = _2169 ? as_type<float>(_2177) : _1806;
        _2217 = _2219;
    }
    float _2221 = _2217;
    bool _2223 = !_2205;
    int _2225 = _2223 ? 0 : (-1);
    if (_2147)
    {
        float _2227 = _2169 ? as_type<float>(_2203) : _1806;
        _1850 = _2227;
    }
    float _2229 = _1850;
    float _2231 = floor(_2133);
    int _2233 = ~_2135;
    int _2235 = _2233 + _2225;
    int _2237 = _2235 + 1;
    float _2239 = _2023 * _160;
    int _2241 = as_type<int>(_2017) + (-2);
    float _2243 = -_2137;
    float _2245 = _2115 + _2243;
    float _2247 = float(uint(_2033));
    int _2249 = _1816 * _2237;
    int _2251 = _2249 + _1872;
    bool _2253 = _1816 == 0;
    float _2255 = trunc(_2207);
    int _2257 = int(_2255);
    float _2259 = -_2183;
    float _2261 = _2127 + _2259;
    float _2263 = as_type<float>(_2241) * _2247;
    float _2265 = -_2213;
    float _2267 = _2121 + _2265;
    int _2269 = ~_2037;
    int _2271 = _2269 + 1;
    int _2273 = _2271 + 1;
    bool _2275 = !_2253;
    int _2277 = _2275 ? _2251 : (-1);
    float _2279 = _2267 * _1836;
    float _2281 = trunc(_2263);
    float _2283 = precise::max(_2281, 0.0);
    uint _2285 = uint(_2283);
    int _2287 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4096;
    bool _2289 = _2287 != 0;
    float _2291 = -_2231;
    float _2293 = _2133 + _2291;
    int _2295 = _2277 * _2273;
    bool _2297 = !_2289;
    int _2299 = _2297 ? 0 : 1;
    int _2301 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 16;
    bool _2303 = _2301 != 0;
    int _2305 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 32;
    bool _2307 = _2305 != 0;
    int _2309 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 64;
    bool _2311 = _2309 != 0;
    float _2313 = trunc(_2239);
    int _2315 = int(_2313);
    int _2317 = abs(_2299);
    int _2319 = ~_1951;
    int _2321 = _2319 + 1;
    bool _2323 = !_2307;
    int _2325 = _2323 ? 0 : 1;
    int _2327 = as_type<int>(_2021) + (-2);
    float _2329 = trunc(_2279);
    int _2331 = int(_2329);
    float _2333 = float(uint(_2257));
    int _2335 = abs(_2325);
    int _2337 = _2321 * int(_2285);
    int _2339 = _2337 + _2033;
    int _2341 = _1816 + (-1);
    float _2343 = as_type<float>(_2327) * _2333;
    int _2345 = as_type<int>(_2025) + (-2);
    float _2347 = float(uint(_2339));
    int _2349 = _2037 * _2341;
    int _2351 = _2349 + _2295;
    float _2353 = float(uint(_2315));
    float _2355 = trunc(_2343);
    float _2357 = precise::max(_2355, 0.0);
    uint _2359 = uint(_2357);
    bool _2361 = !_2303;
    int _2363 = _2361 ? 0 : 1;
    int _2365 = _2351 * _2335;
    float _2367 = as_type<float>(_2241) * _2347;
    float _2369 = as_type<float>(_2345) * _2353;
    int _2371 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 128;
    bool _2373 = _2371 != 0;
    int _2375 = _2331 * _2317;
    int _2377 = _2375 + _1872;
    bool _2379 = !_2311;
    int _2381 = _2379 ? 0 : 1;
    float _2383 = trunc(_2367);
    float _2385 = precise::max(_2383, 0.0);
    uint _2387 = uint(_2385);
    int _2389 = abs(_2363);
    bool _2391 = !_2373;
    int _2393 = _2391 ? 0 : 1;
    int _2395 = abs(_2381);
    float _2397 = trunc(_2369);
    float _2399 = precise::max(_2397, 0.0);
    uint _2401 = uint(_2399);
    int _2403 = ~_1973;
    int _2405 = _2403 + 1;
    int _2407 = abs(_2393);
    int _2409 = _2029 * _2389;
    int _2411 = _2409 + _2365;
    int _2413 = _2405 * int(_2359);
    int _2415 = _2413 + _2257;
    int _2417 = ~_1983;
    int _2419 = _2417 + 1;
    float _2421 = _1928 * _160;
    int _2423 = int(_2285) + int(_2387);
    int _2425 = _2377 * _2395;
    int _2427 = _2425 + _2411;
    float _2429 = float(uint(_2415));
    float _2431 = float(_2033);
    int _2433 = _2331 * _2407;
    int _2435 = _2433 + _2427;
    float _2437 = float(_1983);
    float _2439 = as_type<float>(_2327) * _2429;
    int _2441 = _2419 * int(_2401);
    int _2443 = _2441 + _2315;
    float _2445 = float(_2257);
    float _2447 = float(uint(_2435));
    float _2449 = trunc(_2439);
    float _2451 = precise::max(_2449, 0.0);
    uint _2453 = uint(_2451);
    float _2455 = float(uint(_2443));
    float _2457 = float(_1951);
    int _2459 = ~_1951;
    int _2461 = _2459 + 1;
    float _2463 = as_type<float>(_2345) * _2455;
    float _2465 = float(_1973);
    float _2467 = _2457 * _2245;
    float _2469 = as_type<float>(_1904) * _2447;
    float _2471 = trunc(_2463);
    float _2473 = precise::max(_2471, 0.0);
    uint _2475 = uint(_2473);
    int _2477 = ~_1816;
    int _2479 = _2477 + 1;
    float _2481 = _2457 * _2421;
    bool _2483 = _2431 >= _2457;
    bool _2485 = isnan(_2431);
    bool _2487 = _2483 || _2485;
    bool _2489 = isnan(_2457);
    bool _2491 = _2487 || _2489;
    float _2493 = float(_2491);
    float _2495 = _2465 * _2261;
    bool _2497 = _2445 >= _2465;
    bool _2499 = isnan(_2445);
    bool _2501 = _2497 || _2499;
    bool _2503 = isnan(_2465);
    bool _2505 = _2501 || _2503;
    float _2507 = float(_2505);
    float _2509 = _2465 * _2421;
    float _2511 = _2437 * _2421;
    float _2513 = trunc(_2469);
    float _2515 = precise::max(_2513, 0.0);
    uint _2517 = uint(_2515);
    float _2519 = float(_2315);
    float _2521 = _2437 * _2293;
    bool _2523 = _2519 >= _2437;
    bool _2525 = isnan(_2519);
    bool _2527 = _2523 || _2525;
    bool _2529 = isnan(_2437);
    bool _2531 = _2527 || _2529;
    float _2533 = float(_2531);
    int _2535 = _2461 * _2423;
    int _2537 = _2535 + _2033;
    int _2539 = ~_1973;
    int _2541 = _2539 + 1;
    float _2543 = trunc(_2493);
    int _2545 = int(_2543);
    int _2547 = int(_2359) + int(_2453);
    bool _2549 = uint(_2537) >= uint(_1951);
    int _2551 = int(_2401) + int(_2475);
    int _2553 = _2479 * int(_2517);
    int _2555 = _2553 + _2435;
    int _2557 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8192;
    bool _2559 = _2557 != 0;
    int _2561 = _2541 * _2547;
    int _2563 = _2561 + _2257;
    int _2565 = ~_1983;
    int _2567 = _2565 + 1;
    float _2569 = trunc(_2467);
    int _2571 = int(_2569);
    float _2573 = float(uint(_2555));
    int _2575 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 256;
    bool _2577 = _2575 != 0;
    int _2579 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 512;
    bool _2581 = _2579 != 0;
    int _2583 = _2567 * _2551;
    int _2585 = _2583 + _2315;
    bool _2587 = uint(_2563) >= uint(_1973);
    float _2589 = as_type<float>(_1904) * _2573;
    bool _2591 = !_2559;
    int _2593 = _2591 ? 0 : 1;
    float _2595 = trunc(_2507);
    int _2597 = int(_2595);
    bool _2599 = !_2549;
    int _2601 = _2599 ? 0 : (-1);
    bool _2603 = !_2581;
    int _2605 = _2603 ? 0 : 1;
    int _2607 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1024;
    bool _2609 = _2607 != 0;
    int _2611 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 2048;
    bool _2613 = _2611 != 0;
    bool _2615 = !_2577;
    int _2617 = _2615 ? 0 : 1;
    float _2619 = trunc(_2589);
    float _2621 = precise::max(_2619, 0.0);
    uint _2623 = uint(_2621);
    bool _2625 = uint(_2585) >= uint(_1983);
    int _2627 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 16384;
    bool _2629 = _2627 != 0;
    bool _2631 = !_2587;
    int _2633 = _2631 ? 0 : (-1);
    int _2635 = ~_2423;
    int _2637 = _2635 + _2601;
    int _2639 = _2637 + 1;
    float _2641 = trunc(_2511);
    int _2643 = int(_2641);
    int _2645 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 4096;
    bool _2647 = _2645 != 0;
    int _2649 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 8192;
    bool _2651 = _2649 != 0;
    bool _2653 = !_2629;
    int _2655 = _2653 ? 0 : 1;
    int _2657 = _1951 * _2639;
    int _2659 = _2657 + _2033;
    bool _2661 = !_2609;
    int _2663 = _2661 ? 0 : 1;
    bool _2665 = !_2613;
    int _2667 = _2665 ? 0 : 1;
    float _2669 = trunc(_2521);
    int _2671 = int(_2669);
    int _2673 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 16384;
    bool _2675 = _2673 != 0;
    bool _2677 = _1951 == 0;
    int _2679 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 32768;
    bool _2681 = _2679 != 0;
    int _2683 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 32768;
    bool _2685 = _2683 != 0;
    int _2687 = abs(_2593);
    bool _2689 = !_2675;
    int _2691 = _2689 ? 0 : 1;
    bool _2693 = !_2625;
    int _2695 = _2693 ? 0 : (-1);
    int _2697 = _2571 * _2687;
    int _2699 = _2697 + _2033;
    int _2701 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 65536;
    bool _2703 = _2701 != 0;
    int _2705 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 131072;
    bool _2707 = _2705 != 0;
    int _2709 = ~_2547;
    int _2711 = _2709 + _2633;
    int _2713 = _2711 + 1;
    int _2715 = ~_2545;
    int _2717 = _2715 + 1;
    int _2719 = _2717 + 1;
    bool _2721 = !_2677;
    int _2723 = _2721 ? _2659 : (-1);
    int _2725 = _1973 * _2713;
    int _2727 = _2725 + _2257;
    int _2729 = int(_2517) + int(_2623);
    float _2731 = trunc(_2533);
    int _2733 = int(_2731);
    int _2735 = ~_1816;
    int _2737 = _2735 + 1;
    int _2739 = _2719 * _2723;
    bool _2741 = !_2707;
    int _2743 = _2741 ? 0 : 1;
    bool _2745 = _1973 == 0;
    int _2747 = _2737 * _2729;
    int _2749 = _2747 + _2435;
    int _2751 = _1951 + (-1);
    int _2753 = ~_2597;
    int _2755 = _2753 + 1;
    int _2757 = _2755 + 1;
    bool _2759 = !_2745;
    int _2761 = _2759 ? _2727 : (-1);
    int _2763 = _2545 * _2751;
    int _2765 = _2763 + _2739;
    int _2767 = ~_2551;
    int _2769 = _2767 + _2695;
    int _2771 = _2769 + 1;
    float _2773 = trunc(_2481);
    int _2775 = int(_2773);
    bool _2777 = !_2685;
    int _2779 = _2777 ? 0 : 1;
    int _2781 = _2757 * _2761;
    int _2783 = abs(_2605);
    int _2785 = _1983 * _2771;
    int _2787 = _2785 + _2315;
    bool _2789 = uint(_2749) >= uint(_1816);
    int _2791 = abs(_2617);
    float _2793 = trunc(_2495);
    int _2795 = int(_2793);
    bool _2797 = !_2681;
    int _2799 = _2797 ? 0 : 1;
    bool _2801 = !_2789;
    int _2803 = _2801 ? 0 : (-1);
    int _2805 = _2765 * _2783;
    bool _2807 = !_2647;
    int _2809 = _2807 ? 0 : 1;
    float _2811 = trunc(_2509);
    int _2813 = int(_2811);
    int _2815 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 262144;
    bool _2817 = _2815 != 0;
    int _2819 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 524288;
    bool _2821 = _2819 != 0;
    bool _2823 = _1983 == 0;
    int _2825 = abs(_2663);
    int _2827 = _1973 + (-1);
    int _2829 = ~_2733;
    int _2831 = _2829 + 1;
    int _2833 = _2831 + 1;
    int _2835 = _2597 * _2827;
    int _2837 = _2835 + _2781;
    bool _2839 = !_2823;
    int _2841 = _2839 ? _2787 : (-1);
    int _2843 = _2775 * _2791;
    int _2845 = _2843 + _2805;
    float _2847 = _2083 * 2.0;
    int _2849 = abs(_2667);
    int _2851 = _2833 * _2841;
    int _2853 = abs(_2655);
    int _2855 = _2699 * _2825;
    int _2857 = _2855 + _2845;
    float _2859 = _1808 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    bool _2861 = !_2651;
    int _2863 = _2861 ? 0 : 1;
    int _2865 = abs(_2809);
    int _2867 = _2571 * _2849;
    int _2869 = _2867 + _2857;
    int _2871 = abs(_2863);
    float _2873 = float(uint(_2869));
    int _2875 = _2837 * _2871;
    int _2877 = abs(_2691);
    float _2879 = as_type<float>(_2241) * _2873;
    int _2881 = abs(_2799);
    int _2883 = _2813 * _2865;
    int _2885 = _2883 + _2875;
    float _2887 = trunc(_2879);
    float _2889 = precise::max(_2887, 0.0);
    uint _2891 = uint(_2889);
    int _2893 = _2795 * _2853;
    int _2895 = _2893 + _2257;
    int _2897 = abs(_2779);
    int _2899 = _2895 * _2877;
    int _2901 = _2899 + _2885;
    bool _2903 = !_2703;
    int _2905 = _2903 ? 0 : 1;
    int _2907 = _1983 + (-1);
    int _2909 = _2795 * _2881;
    int _2911 = _2909 + _2901;
    int _2913 = abs(_2743);
    int _2915 = ~_1951;
    int _2917 = _2915 + 1;
    int _2919 = _2733 * _2907;
    int _2921 = _2919 + _2851;
    int _2923 = abs(_2905);
    int _2925 = _2917 * int(_2891);
    int _2927 = _2925 + _2869;
    bool _2929 = !_2817;
    int _2931 = _2929 ? 0 : 1;
    int _2933 = _2921 * _2913;
    int _2935 = _2671 * _2897;
    int _2937 = _2935 + _2315;
    int _2939 = ~_2729;
    int _2941 = _2939 + _2803;
    int _2943 = _2941 + 1;
    float _2945 = float(uint(_2911));
    int _2947 = _2643 * _2923;
    int _2949 = _2947 + _2933;
    float _2951 = float(uint(_2927));
    int _2953 = _1816 * _2943;
    int _2955 = _2953 + _2435;
    bool _2957 = !_2821;
    int _2959 = _2957 ? 0 : 1;
    float _2961 = as_type<float>(_2327) * _2945;
    int _2963 = abs(_2931);
    float _2965 = as_type<float>(_2241) * _2951;
    int _2967 = abs(_2959);
    float _2969 = trunc(_2961);
    float _2971 = precise::max(_2969, 0.0);
    uint _2973 = uint(_2971);
    bool _2975 = _1816 == 0;
    int _2977 = _2937 * _2963;
    int _2979 = _2977 + _2949;
    float _2981 = -_2143;
    float _2983 = _2981 + 1.0;
    bool _2985 = _1957 > 0.5;
    float _2987 = trunc(_2965);
    float _2989 = precise::max(_2987, 0.0);
    uint _2991 = uint(_2989);
    bool _2993 = !_2975;
    int _2995 = _2993 ? _2955 : (-1);
    int _2997 = _2671 * _2967;
    int _2999 = _2997 + _2979;
    int _3001 = _2985 ? as_type<int>(_2983) : as_type<int>(_2143);
    int _3003 = _2995 & 3;
    bool _3005 = _3003 != 0;
    int _3007 = _2995 & 3;
    bool _3009 = _3007 != 0;
    int _3011 = ~_1973;
    int _3013 = _3011 + 1;
    float _3015 = float(uint(_2999));
    int _3017 = _3005 ? 0 : 1;
    int _3019 = _3013 * int(_2973);
    int _3021 = _3019 + _2911;
    bool _3023 = uint(_3007) > 1u;
    float _3025 = as_type<float>(_2345) * _3015;
    int _3027 = int(_2891) + int(_2991);
    int _3029 = ~_1951;
    int _3031 = _3029 + 1;
    float _3033 = trunc(_3025);
    float _3035 = precise::max(_3033, 0.0);
    uint _3037 = uint(_3035);
    float _3039 = float(uint(_3021));
    int _3041 = ~_3017;
    int _3043 = _3041 + 1;
    int _3045 = _3043 + 1;
    float _3047 = as_type<float>(_2327) * _3039;
    int _3049 = ~_1983;
    int _3051 = _3049 + 1;
    int _3053 = _3031 * _3027;
    int _3055 = _3053 + _2869;
    int _3057 = _3045;
    if (!_3023)
    {
        int _3059 = ~_3017;
        int _3061 = _3059 + 1;
        _3057 = _3061;
    }
    int _3063 = _3057;
    float _3065 = trunc(_3047);
    float _3067 = precise::max(_3065, 0.0);
    uint _3069 = uint(_3067);
    bool _3071 = uint(_3007) >= 2u;
    bool _3073 = _1808 > 0.5;
    int _3075 = _3071 ? 0 : 1;
    int _3077 = _3051 * int(_3037);
    int _3079 = _3077 + _2999;
    bool _3081 = uint(_3055) >= uint(_1951);
    int _3083 = ~_3075;
    int _3085 = _3083 + 1;
    int _3087 = _3085 + 1;
    bool _3089 = !_3081;
    int _3091 = _3089 ? 0 : (-1);
    bool _3093 = _3007 != 3;
    float _3095 = float(uint(_3079));
    int _3097 = ~_1973;
    int _3099 = _3097 + 1;
    int _3101 = int(_2973) + int(_3069);
    float _3103 = as_type<float>(_2345) * _3095;
    int _3105 = ~_3027;
    int _3107 = _3105 + _3091;
    int _3109 = _3107 + 1;
    float _3111 = trunc(_3103);
    float _3113 = precise::max(_3111, 0.0);
    uint _3115 = uint(_3113);
    int _3117 = _3099 * _3101;
    int _3119 = _3117 + _2911;
    int _3121 = _3087;
    if (_3093)
    {
        int _3123 = ~_3075;
        int _3125 = _3123 + 1;
        _3121 = _3125;
    }
    int _3127 = _3121;
    int _3129 = _1951 * _3109;
    int _3131 = _3129 + _2869;
    int _3133 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2097152;
    bool _3135 = _3133 != 0;
    float _3137 = -(*spvDescriptorSet0.vp_c9)._m0[184].w;
    float _3139 = _3137 + (*spvDescriptorSet0.vp_c9)._m0[185].w;
    bool _3141 = !_3135;
    int _3143 = _3141 ? 0 : 1;
    bool _3145 = uint(_3119) >= uint(_1973);
    float _3147 = -(*spvDescriptorSet0.vp_c9)._m0[185].w;
    float _3149 = _3147 + (*spvDescriptorSet0.vp_c9)._m0[186].w;
    bool _3151 = !_2677;
    int _3153 = _3151 ? _3131 : (-1);
    float _3155 = 1.0 / _3139;
    bool _3157 = !_3145;
    int _3159 = _3157 ? 0 : (-1);
    int _3161 = _3153 & 3;
    bool _3163 = _3161 != 0;
    int _3165 = _3073 ? as_type<int>(_2983) : as_type<int>(_2143);
    int _3167 = ~_3101;
    int _3169 = _3167 + _3159;
    int _3171 = _3169 + 1;
    float _3173 = 1.0 / _3149;
    bool _3175 = uint(_3161) >= 2u;
    int _3177 = _3163 ? 0 : 1;
    int _3179 = _1973 * _3171;
    int _3181 = _3179 + _2911;
    bool _3183 = _3161 != 3;
    int _3185 = _3175 ? 0 : 1;
    int _3187 = int(_3037) + int(_3115);
    bool _3189 = uint(_3161) > 1u;
    int _3191 = ~_1983;
    int _3193 = _3191 + 1;
    int _3195 = ~_3185;
    int _3197 = _3195 + 1;
    int _3199 = _3197 + 1;
    bool _3201 = !_2745;
    int _3203 = _3201 ? _3181 : (-1);
    int _3205 = _3193 * _3187;
    int _3207 = _3205 + _2999;
    int _3209 = _3199;
    if (_3183)
    {
        int _3211 = ~_3185;
        int _3213 = _3211 + 1;
        _3209 = _3213;
    }
    int _3215 = _3209;
    int _3217 = ~_3177;
    int _3219 = _3217 + 1;
    int _3221 = _3219 + 1;
    bool _3223 = uint(_3207) >= uint(_1983);
    int _3225 = _3221;
    if (!_3189)
    {
        int _3227 = ~_3177;
        int _3229 = _3227 + 1;
        _3225 = _3229;
    }
    int _3231 = _3225;
    int _3233 = _3203 & 3;
    bool _3235 = _3233 != 0;
    bool _3237 = !_3223;
    int _3239 = _3237 ? 0 : (-1);
    int _3241 = _3235 ? 0 : 1;
    bool _3243 = uint(_3233) >= 2u;
    bool _3245 = _3233 != 3;
    int _3247 = ~_3187;
    int _3249 = _3247 + _3239;
    int _3251 = _3249 + 1;
    int _3253 = _3243 ? 0 : 1;
    bool _3255 = uint(_3233) > 1u;
    int _3257 = _1983 * _3251;
    int _3259 = _3257 + _2999;
    int _3261 = ~_3253;
    int _3263 = _3261 + 1;
    int _3265 = _3263 + 1;
    int _3267 = ~_3241;
    int _3269 = _3267 + 1;
    int _3271 = _3269 + 1;
    bool _3273 = !_2823;
    int _3275 = _3273 ? _3259 : (-1);
    int _3277 = _3265;
    int _3279 = _3271;
    if (_3245)
    {
        int _3281 = ~_3253;
        int _3283 = _3281 + 1;
        _3277 = _3283;
    }
    int _3285 = _3277;
    int _3287 = _3275 & 3;
    bool _3289 = _3287 != 0;
    if (!_3255)
    {
        int _3291 = ~_3241;
        int _3293 = _3291 + 1;
        _3279 = _3293;
    }
    int _3295 = _3279;
    bool _3297 = uint(_3287) >= 2u;
    float _3299 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    int _3301 = _3289 ? 0 : 1;
    int _3303 = _3297 ? 0 : 1;
    float _3305 = fma(_2859, -2.0, _3299);
    bool _3307 = uint(_3287) > 1u;
    bool _3309 = _3287 != 3;
    float _3311 = fma(_160, (*spvDescriptorSet0.vp_c9)._m0[76].y, _3305);
    int _3313 = ~_3301;
    int _3315 = _3313 + 1;
    int _3317 = _3315 + 1;
    int _3319 = ~_3303;
    int _3321 = _3319 + 1;
    int _3323 = _3321 + 1;
    float _3325 = -(*spvDescriptorSet0.vp_c9)._m0[183].w;
    float _3327 = _3325 + (*spvDescriptorSet0.vp_c9)._m0[184].w;
    int _3329 = _3317;
    int _3331 = _3323;
    if (!_3307)
    {
        int _3333 = ~_3301;
        int _3335 = _3333 + 1;
        _3329 = _3335;
    }
    int _3337 = _3329;
    float _3339 = -(*spvDescriptorSet0.vp_c9)._m0[187].w;
    float _3341 = _3339 + (*spvDescriptorSet0.vp_c9)._m0[188].w;
    int _3343 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8388608;
    bool _3345 = _3343 != 0;
    float _3347 = -(*spvDescriptorSet0.vp_c9)._m0[188].w;
    float _3349 = _3347 + (*spvDescriptorSet0.vp_c9)._m0[189].w;
    if (_3309)
    {
        int _3351 = ~_3303;
        int _3353 = _3351 + 1;
        _3331 = _3353;
    }
    int _3355 = _3331;
    float _3357 = 1.0 / _3327;
    bool _3359 = !_3345;
    int _3361 = _3359 ? 0 : 1;
    float _3363 = in.m_46.x;
    float _3365 = in.m_46.y;
    float _3367 = in.m_46.z;
    int _3369 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4194304;
    bool _3371 = _3369 != 0;
    int _3373 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _3375 = _3373 != 0;
    bool _3377 = !_3371;
    int _3379 = _3377 ? 0 : 1;
    float _3381 = 1.0 / _3341;
    float _3383 = _3375 ? as_type<float>(_3165) : _2143;
    int _3385 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _3387 = _3385 != 0;
    bool _3389 = _2089 > 0.5;
    float _3391 = _3387 ? as_type<float>(_3001) : _2143;
    float _3393 = 1.0 / _3349;
    int _3395 = _3389 ? as_type<int>(_2983) : as_type<int>(_2143);
    int _3397 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 32;
    bool _3399 = _3397 != 0;
    int _3401 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 128;
    bool _3403 = _3401 != 0;
    float _3405 = _3399 ? as_type<float>(_3395) : _2143;
    float _3407 = _3403 ? as_type<float>(_3395) : _2143;
    float _3409 = _3365 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    int _3411 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 16777216;
    bool _3413 = _3411 != 0;
    float _3415 = _3365 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    int _3417 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 512;
    bool _3419 = _3417 != 0;
    float _3421 = _3365 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _3423 = floor(_2847);
    float _3425 = fma(_3363, (*spvDescriptorSet0.vp_c10)._m0[4].x, _3409);
    float _3427 = fma(_3363, (*spvDescriptorSet0.vp_c10)._m0[5].x, _3415);
    float _3429 = -(*spvDescriptorSet0.vp_c9)._m0[186].w;
    float _3431 = _3429 + (*spvDescriptorSet0.vp_c9)._m0[187].w;
    float _3433 = fma(_3363, (*spvDescriptorSet0.vp_c10)._m0[6].x, _3421);
    float _3435 = -(*spvDescriptorSet0.vp_c9)._m0[183].x;
    float _3437 = (*spvDescriptorSet0.vp_c9)._m0[184].x + _3435;
    float _3439 = -(*spvDescriptorSet0.vp_c9)._m0[184].x;
    float _3441 = _3439 + (*spvDescriptorSet0.vp_c9)._m0[185].x;
    float _3443 = -(*spvDescriptorSet0.vp_c9)._m0[185].x;
    float _3445 = (*spvDescriptorSet0.vp_c9)._m0[186].x + _3443;
    float _3447 = _3419 ? as_type<float>(_3395) : _2143;
    float _3449 = 1.0 / _3431;
    float _3451 = _3441 * _3155;
    float _3453 = -(*spvDescriptorSet0.vp_c9)._m0[189].w;
    float _3455 = _3453 + (*spvDescriptorSet0.vp_c9)._m0[190].w;
    bool _3457 = _3423 >= 0.0;
    bool _3459 = isnan(_3423);
    bool _3461 = _3457 || _3459;
    bool _3463 = isnan(0.0);
    bool _3465 = _3461 || _3463;
    float _3467 = _3445 * _3173;
    float _3469 = _1808 * 2.0;
    int _3471 = _3465 ? 0 : 1;
    float _3473 = 1.0 / _3455;
    bool _3475 = _3423 > 0.0;
    float _3477 = -(*spvDescriptorSet0.vp_c9)._m0[187].x;
    float _3479 = (*spvDescriptorSet0.vp_c9)._m0[188].x + _3477;
    float _3481 = -(*spvDescriptorSet0.vp_c9)._m0[188].x;
    float _3483 = _3481 + (*spvDescriptorSet0.vp_c9)._m0[189].x;
    float _3485 = _3437 * _3357;
    float _3487 = -(*spvDescriptorSet0.vp_c9)._m0[186].x;
    float _3489 = _3487 + (*spvDescriptorSet0.vp_c9)._m0[187].x;
    float _3491 = _3479 * _3381;
    float _3493 = floor(_3469);
    float _3495 = _3483 * _3393;
    bool _3497 = _1798 >= (*spvDescriptorSet0.vp_c9)._m0[189].w;
    bool _3499 = isnan(_1798);
    bool _3501 = _3497 || _3499;
    bool _3503 = isnan((*spvDescriptorSet0.vp_c9)._m0[189].w);
    bool _3505 = _3501 || _3503;
    float _3507 = float(_3505);
    float _3509 = _3489 * _3449;
    bool _3511 = _1798 >= (*spvDescriptorSet0.vp_c9)._m0[190].w;
    bool _3513 = isnan(_1798);
    bool _3515 = _3511 || _3513;
    bool _3517 = isnan((*spvDescriptorSet0.vp_c9)._m0[190].w);
    bool _3519 = _3515 || _3517;
    float _3521 = float(_3519);
    float _3523 = -(*spvDescriptorSet0.vp_c9)._m0[189].x;
    float _3525 = (*spvDescriptorSet0.vp_c9)._m0[190].x + _3523;
    int _3527 = ~_3471;
    int _3529 = _3527 + 1;
    int _3531 = _3529 + 1;
    float _3533 = -_3507;
    float _3535 = _3533 + 1.0;
    int _3537 = _3531;
    if (!_3475)
    {
        int _3539 = ~_3471;
        int _3541 = _3539 + 1;
        _3537 = _3541;
    }
    int _3543 = _3537;
    float _3545 = -_3521;
    float _3547 = _3545 + 1.0;
    bool _3549 = _1798 >= (*spvDescriptorSet0.vp_c9)._m0[188].w;
    bool _3551 = isnan(_1798);
    bool _3553 = _3549 || _3551;
    bool _3555 = isnan((*spvDescriptorSet0.vp_c9)._m0[188].w);
    bool _3557 = _3553 || _3555;
    float _3559 = float(_3557);
    float _3561 = _3525 * _3473;
    bool _3563 = _1798 >= (*spvDescriptorSet0.vp_c9)._m0[187].w;
    bool _3565 = isnan(_1798);
    bool _3567 = _3563 || _3565;
    bool _3569 = isnan((*spvDescriptorSet0.vp_c9)._m0[187].w);
    bool _3571 = _3567 || _3569;
    float _3573 = float(_3571);
    float _3575 = _3507 * _3547;
    float _3577 = fma(_3367, (*spvDescriptorSet0.vp_c10)._m0[5].z, _3427);
    float _3579 = _3559 * _3535;
    float _3581 = -_3559;
    float _3583 = _3581 + 1.0;
    float _3585 = fma(_3367, (*spvDescriptorSet0.vp_c10)._m0[4].z, _3425);
    float _3587 = fma(_3367, (*spvDescriptorSet0.vp_c10)._m0[6].z, _3433);
    bool _3589 = !_3413;
    int _3591 = _3589 ? 0 : 1;
    float _3593 = -(*spvDescriptorSet0.vp_c9)._m0[183].w;
    float _3595 = _1798 + _3593;
    bool _3597 = _1798 >= (*spvDescriptorSet0.vp_c9)._m0[186].w;
    bool _3599 = isnan(_1798);
    bool _3601 = _3597 || _3599;
    bool _3603 = isnan((*spvDescriptorSet0.vp_c9)._m0[186].w);
    bool _3605 = _3601 || _3603;
    float _3607 = float(_3605);
    float _3609 = -_3573;
    float _3611 = _3609 + 1.0;
    bool _3613 = _3493 > 0.0;
    float _3615 = fma(_3485, _3595, (*spvDescriptorSet0.vp_c9)._m0[183].x);
    bool _3617 = _3493 >= 0.0;
    bool _3619 = isnan(_3493);
    bool _3621 = _3617 || _3619;
    bool _3623 = isnan(0.0);
    bool _3625 = _3621 || _3623;
    float _3627 = _3573 * _3583;
    float _3629 = -(*spvDescriptorSet0.vp_c9)._m0[184].w;
    float _3631 = _1798 + _3629;
    bool _3633 = _1798 >= (*spvDescriptorSet0.vp_c9)._m0[185].w;
    bool _3635 = isnan(_1798);
    bool _3637 = _3633 || _3635;
    bool _3639 = isnan((*spvDescriptorSet0.vp_c9)._m0[185].w);
    bool _3641 = _3637 || _3639;
    float _3643 = float(_3641);
    float _3645 = -_3607;
    float _3647 = _3645 + 1.0;
    bool _3649 = _1798 >= (*spvDescriptorSet0.vp_c9)._m0[184].w;
    bool _3651 = isnan(_1798);
    bool _3653 = _3649 || _3651;
    bool _3655 = isnan((*spvDescriptorSet0.vp_c9)._m0[184].w);
    bool _3657 = _3653 || _3655;
    float _3659 = float(_3657);
    float _3661 = fma(_3451, _3631, (*spvDescriptorSet0.vp_c9)._m0[184].x);
    float _3663 = _3607 * _3611;
    float _3665 = -_3643;
    float _3667 = _3665 + 1.0;
    float _3669 = -(*spvDescriptorSet0.vp_c9)._m0[185].w;
    float _3671 = _1798 + _3669;
    float _3673 = _3643 * _3647;
    bool _3675 = _1798 >= (*spvDescriptorSet0.vp_c9)._m0[183].w;
    bool _3677 = isnan(_1798);
    bool _3679 = _3675 || _3677;
    bool _3681 = isnan((*spvDescriptorSet0.vp_c9)._m0[183].w);
    bool _3683 = _3679 || _3681;
    float _3685 = float(_3683);
    float _3687 = -_3659;
    float _3689 = _3687 + 1.0;
    float _3691 = _3659 * _3667;
    float _3693 = fma(_3467, _3671, (*spvDescriptorSet0.vp_c9)._m0[185].x);
    float _3695 = -(*spvDescriptorSet0.vp_c9)._m0[187].w;
    float _3697 = _1798 + _3695;
    float _3699 = -(*spvDescriptorSet0.vp_c9)._m0[186].w;
    float _3701 = _1798 + _3699;
    float _3703 = -(*spvDescriptorSet0.vp_c9)._m0[188].w;
    float _3705 = _1798 + _3703;
    float _3707 = _3685 * _3689;
    float _3709 = fma(_3491, _3697, (*spvDescriptorSet0.vp_c9)._m0[187].x);
    float _3711 = fma(_3509, _3701, (*spvDescriptorSet0.vp_c9)._m0[186].x);
    float _3713 = fma(_3495, _3705, (*spvDescriptorSet0.vp_c9)._m0[188].x);
    int _3715 = _3625 ? 0 : 1;
    float _3717 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[100].z;
    float _3719 = _3615 * _3707;
    bool _3721 = _2091 != 1;
    float _3723 = -(*spvDescriptorSet0.vp_c9)._m0[189].w;
    float _3725 = _1798 + _3723;
    float _3727 = float(uint(_2377));
    float _3729 = -_3685;
    float _3731 = _3729 + 1.0;
    float _3733 = float(uint(_2699));
    float _3735 = fma(_3561, _3725, (*spvDescriptorSet0.vp_c9)._m0[189].x);
    float _3737 = float(uint(_2895));
    float _3739 = as_type<float>(_1904) * _3727;
    float _3741 = fma(_3731, (*spvDescriptorSet0.vp_c9)._m0[183].x, _3719);
    float _3743 = as_type<float>(_2241) * _3733;
    int _3745 = ~_3715;
    int _3747 = _3745 + 1;
    int _3749 = _3747 + 1;
    float _3751 = trunc(_3739);
    float _3753 = precise::max(_3751, 0.0);
    uint _3755 = uint(_3753);
    float _3757 = as_type<float>(_2327) * _3737;
    int _3759 = _3749;
    float _3761 = _3733;
    float _3763 = _3731;
    float _3765 = _3741;
    if (!_3613)
    {
        int _3767 = ~_3715;
        int _3769 = _3767 + 1;
        _3759 = _3769;
    }
    int _3771 = _3759;
    float _3773 = _3717 * (*spvDescriptorSet0.vp_c9)._m0[100].x;
    float _3775 = fma(_3661, _3691, _3741);
    float _3777 = float(uint(_2937));
    float _3779 = _3577 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _3781 = fma(_3773, _2229, -0.5);
    float _3783 = trunc(_3743);
    float _3785 = precise::max(_3783, 0.0);
    uint _3787 = uint(_3785);
    int _3789 = ~_1816;
    int _3791 = _3789 + 1;
    float _3793 = as_type<float>(_2345) * _3777;
    int _3795 = ~_1951;
    int _3797 = _3795 + 1;
    float _3799 = fma(_3693, _3673, _3775);
    int _3801 = ~_1973;
    int _3803 = _3801 + 1;
    float _3805 = _3585 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    bool _3807 = _2093 != 2;
    float _3809 = trunc(_3757);
    float _3811 = precise::max(_3809, 0.0);
    uint _3813 = uint(_3811);
    float _3815 = _3587 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _3817 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    bool _3819 = !_3721;
    float _3821 = _3819 ? as_type<float>(_2095) : as_type<float>(_2097);
    int _3823 = _3797 * int(_3787);
    int _3825 = _3823 + _2699;
    float _3827 = trunc(_3793);
    float _3829 = precise::max(_3827, 0.0);
    uint _3831 = uint(_3829);
    int _3833 = _3791 * int(_3755);
    int _3835 = _3833 + _2377;
    float _3837 = _2083 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    float _3839 = (*spvDescriptorSet0.vp_c9)._m0[93].z + (*spvDescriptorSet0.vp_c9)._m0[93].x;
    float _3841 = float(uint(_3825));
    float _3843 = (*spvDescriptorSet0.vp_c9)._m0[93].w + (*spvDescriptorSet0.vp_c9)._m0[93].y;
    float _3845 = float(uint(_3835));
    int _3847 = _3803 * int(_3813);
    int _3849 = _3847 + _2895;
    float _3851 = -_3817;
    float _3853 = fma(_3837, 2.0, _3851);
    float _3855 = as_type<float>(_2241) * _3841;
    int _3857 = ~_1983;
    int _3859 = _3857 + 1;
    float _3861 = as_type<float>(_1904) * _3845;
    float _3863 = float(uint(_3849));
    float _3865 = fma(as_type<float>(_2097), (*spvDescriptorSet0.vp_c9)._m0[93].z, _3839);
    float _3867 = as_type<float>(_2097) * (*spvDescriptorSet0.vp_c9)._m0[92].x;
    bool _3869 = !_3721;
    float _3871 = _3869 ? as_type<float>(_2099) : as_type<float>(_2095);
    int _3873 = _3859 * int(_3831);
    int _3875 = _3873 + _2937;
    float _3877 = as_type<float>(_2327) * _3863;
    float _3879 = trunc(_3861);
    float _3881 = precise::max(_3879, 0.0);
    uint _3883 = uint(_3881);
    float _3885 = fma(as_type<float>(_2095), (*spvDescriptorSet0.vp_c9)._m0[93].w, _3843);
    float _3887 = as_type<float>(_2095) * (*spvDescriptorSet0.vp_c9)._m0[92].y;
    float _3889 = float(uint(_3875));
    float _3891 = fma(_160, (*spvDescriptorSet0.vp_c9)._m0[92].z, _3865);
    float _3893 = fma(_160, (*spvDescriptorSet0.vp_c9)._m0[92].w, _3885);
    float _3895 = trunc(_3855);
    float _3897 = precise::max(_3895, 0.0);
    uint _3899 = uint(_3897);
    float _3901 = as_type<float>(_2345) * _3889;
    float _3903 = (*spvDescriptorSet0.vp_c9)._m0[92].x + (*spvDescriptorSet0.vp_c9)._m0[91].z;
    float _3905 = _3717;
    float _3907 = _3867;
    if (!_3721)
    {
        _3905 = _2089;
    }
    float _3909 = _3905;
    float _3911 = (*spvDescriptorSet0.vp_c9)._m0[92].y + (*spvDescriptorSet0.vp_c9)._m0[91].w;
    float _3913 = _3909;
    if (_3721)
    {
        _3913 = _1808;
    }
    float _3915 = _3913;
    float _3917 = -_3903;
    float _3919 = fma(_3867, 2.0, _3917);
    if (_3807)
    {
        _3907 = _2083;
    }
    float _3921 = _3907;
    float _3923 = trunc(_3877);
    float _3925 = precise::max(_3923, 0.0);
    uint _3927 = uint(_3925);
    float _3929 = fma(_3711, _3663, _3799);
    int _3931 = ~_1816;
    int _3933 = _3931 + 1;
    float _3935 = fma(_3887, -2.0, _3911);
    int _3937 = int(_3755) + int(_3883);
    float _3939 = fma(_3709, _3627, _3929);
    float _3941 = -_160;
    float _3943 = fma(_3941, (*spvDescriptorSet0.vp_c9)._m0[76].x, _3853);
    int _3945 = int(_3787) + int(_3899);
    float _3947 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[100].w;
    int _3949 = ~_1951;
    int _3951 = _3949 + 1;
    int _3953 = _3933 * _3937;
    int _3955 = _3953 + _2377;
    float _3957 = as_type<float>(_3933);
    float _3959 = _3921;
    if (_3807)
    {
        _3957 = _1808;
    }
    float _3961 = _3957;
    float _3963 = fma(_3713, _3579, _3939);
    float _3965 = _3961;
    if (!_3807)
    {
        _3959 = _2089;
    }
    float _3967 = _3959;
    int _3969 = _3951 * _3945;
    int _3971 = _3969 + _2699;
    if (!_3807)
    {
        _3965 = _2083;
    }
    float _3973 = _3965;
    float _3975 = trunc(_3901);
    float _3977 = precise::max(_3975, 0.0);
    uint _3979 = uint(_3977);
    bool _3981 = uint(_3955) >= uint(_1816);
    float _3983 = _1808 + _2083;
    int _3985 = int(_3813) + int(_3927);
    float _3987 = _3967 * (*spvDescriptorSet0.vp_c9)._m0[87].x;
    int _3989 = ~_1973;
    int _3991 = _3989 + 1;
    float _3993 = _3983 + (-1.0);
    bool _3995 = !_3981;
    int _3997 = _3995 ? 0 : (-1);
    float _3999 = _3973 * (*spvDescriptorSet0.vp_c9)._m0[87].y;
    bool _4001 = uint(_3971) >= uint(_1951);
    int _4003 = _3991 * _3985;
    int _4005 = _4003 + _2895;
    float _4007 = fma(_3735, _3575, _3963);
    if (!_3721)
    {
        _3761 = _1808;
    }
    float _4009 = _3761;
    float _4011 = -_160;
    float _4013 = fma(_4011, (*spvDescriptorSet0.vp_c9)._m0[91].x, _3919);
    float _4015 = _4009;
    if (!_3721)
    {
        _3763 = _1808;
    }
    float _4017 = _3763;
    float _4019 = (*spvDescriptorSet0.vp_c9)._m0[82].y + (*spvDescriptorSet0.vp_c9)._m0[81].w;
    int _4021 = int(_3831) + int(_3979);
    float _4023 = fma(_160, (*spvDescriptorSet0.vp_c9)._m0[91].y, _3935);
    int _4025 = ~_1983;
    int _4027 = _4025 + 1;
    float _4029 = fma(_3521, (*spvDescriptorSet0.vp_c9)._m0[190].x, _4007);
    bool _4031 = !_4001;
    int _4033 = _4031 ? 0 : (-1);
    bool _4035 = uint(_4005) >= uint(_1973);
    float _4037 = _2089 * 2.0;
    int _4039 = ~_3945;
    int _4041 = _4039 + _4033;
    int _4043 = _4041 + 1;
    float _4045 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _4047 = _3805 + _4045;
    bool _4049 = !_4035;
    int _4051 = _4049 ? 0 : (-1);
    int _4053 = _4027 * _4021;
    int _4055 = _4053 + _2937;
    float _4057 = _4017;
    if (!_3721)
    {
        _3765 = _2089;
    }
    float _4059 = _3765;
    float _4061 = floor(_4037);
    int _4063 = _1951 * _4043;
    int _4065 = _4063 + _2699;
    int _4067 = ~_3985;
    int _4069 = _4067 + _4051;
    int _4071 = _4069 + 1;
    out.m_71.x = _4029;
    bool _4073 = uint(_4055) >= uint(_1983);
    float _4075 = _4059;
    if (_3721)
    {
        _4015 = _2083;
    }
    float _4077 = _4015;
    bool _4079 = !_4073;
    int _4081 = _4079 ? 0 : (-1);
    if (_3721)
    {
        _4057 = _2083;
    }
    float _4083 = _4057;
    int _4085 = ~_4021;
    int _4087 = _4085 + _4081;
    int _4089 = _4087 + 1;
    int _4091 = _1973 * _4071;
    int _4093 = _4091 + _2895;
    float _4095 = _3915 * (*spvDescriptorSet0.vp_c9)._m0[82].y;
    int _4097 = _2995 >> 31;
    float _4099 = trunc((*spvDescriptorSet0.vp_c9)._m0[80].z);
    int _4101 = int(_4099);
    if (_3721)
    {
        _4075 = _1808;
    }
    float _4103 = _4075;
    float _4105 = fma(_4095, -2.0, _4019);
    int _4107 = _4097 & 3;
    int _4109 = _1983 * _4089;
    int _4111 = _4109 + _2937;
    bool _4113 = _4061 > 0.0;
    float _4115 = fma(_160, (*spvDescriptorSet0.vp_c9)._m0[81].y, _4105);
    bool _4117 = _4061 >= 0.0;
    bool _4119 = isnan(_4061);
    bool _4121 = _4117 || _4119;
    bool _4123 = isnan(0.0);
    bool _4125 = _4121 || _4123;
    float _4127 = _3947 * (*spvDescriptorSet0.vp_c9)._m0[100].y;
    int _4129 = _2995 + _4107;
    float _4131 = fma(_4127, _3447, -0.5);
    int _4133 = ~_3937;
    int _4135 = _4133 + _3997;
    int _4137 = _4135 + 1;
    float _4139 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _4141 = _3779 + _4139;
    int _4143 = _4129 >> 2;
    float _4145 = fma(_3993, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    int _4147 = _3153 >> 31;
    float _4149 = _4077 * (*spvDescriptorSet0.vp_c9)._m0[82].x;
    float _4151 = _4141 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    int _4153 = _1816 * _4137;
    int _4155 = _4153 + _2377;
    int _4157 = _4147 & 3;
    float _4159 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _4161 = _3815 + _4159;
    float _4163 = fma(_4047, (*spvDescriptorSet0.vp_c8)._m0[28].x, _4151);
    int _4165 = _3275 >> 31;
    float _4167 = (*spvDescriptorSet0.vp_c9)._m0[87].x + (*spvDescriptorSet0.vp_c9)._m0[86].z;
    int _4169 = _3153 + _4157;
    float _4171 = fma(_4161, (*spvDescriptorSet0.vp_c8)._m0[28].z, _4163);
    int _4173 = _4165 & 3;
    float _4175 = -_4167;
    float _4177 = fma(_3987, 2.0, _4175);
    bool _4179 = !_2823;
    int _4181 = _4179 ? _4111 : (-1);
    float _4183 = -_160;
    float _4185 = fma(_4183, (*spvDescriptorSet0.vp_c9)._m0[86].x, _4177);
    int _4187 = _3203 >> 31;
    float _4189 = (*spvDescriptorSet0.vp_c9)._m0[83].z + (*spvDescriptorSet0.vp_c9)._m0[83].x;
    int _4191 = _4169 >> 2;
    bool _4193 = !_2975;
    int _4195 = _4193 ? _4155 : (-1);
    float _4197 = fma(_4083, (*spvDescriptorSet0.vp_c9)._m0[83].z, _4189);
    int _4199 = _3275 + _4173;
    bool _4201 = _4171 >= 0.0;
    float _4203 = fma(_160, (*spvDescriptorSet0.vp_c9)._m0[82].z, _4197);
    bool _4205 = _3161 != 3;
    int _4207 = _4187 & 3;
    int _4209 = _4191 << 4;
    int _4211 = _4209 + 512;
    float _4213 = (*spvDescriptorSet0.vp_c9)._m0[98].w + (*spvDescriptorSet0.vp_c9)._m0[98].y;
    bool _4215 = !_2745;
    int _4217 = _4215 ? _4093 : (-1);
    int _4219 = _4143 << 4;
    int _4221 = _4219 + 368;
    float _4223 = fma(_3871, (*spvDescriptorSet0.vp_c9)._m0[98].w, _4213);
    bool _4225 = _3007 != 3;
    float _4227 = _3871 * (*spvDescriptorSet0.vp_c9)._m0[97].y;
    int _4229 = _4199 >> 2;
    uint _4231 = uint(int(uint(_4221) >> uint(2)));
    uint _4233 = uint(int(uint(int(_4231)) >> uint(2)));
    int _4235 = int(_4231) & 3;
    float _4237 = (*spvDescriptorSet0.vp_c9)._m0[int(_4233)][_4235];
    int _4239 = int(_4231) + 1;
    uint _4241 = uint(int(uint(_4239) >> uint(2)));
    int _4243 = _4239 & 3;
    float _4245 = (*spvDescriptorSet0.vp_c9)._m0[int(_4241)][_4243];
    float _4247 = fma(_160, (*spvDescriptorSet0.vp_c9)._m0[97].w, _4223);
    int _4249 = _3203 + _4207;
    float _4251 = as_type<float>(_4187);
    if (_4201)
    {
        out.m_49.x = 0.0;
    }
    bool _4253 = !_2677;
    int _4255 = _4253 ? _4065 : (-1);
    float _4257 = (*spvDescriptorSet0.vp_c9)._m0[82].x + (*spvDescriptorSet0.vp_c9)._m0[81].z;
    uint _4259 = uint(int(uint(_4211) >> uint(2)));
    uint _4261 = uint(int(uint(int(_4259)) >> uint(2)));
    int _4263 = int(_4259) & 3;
    float _4265 = (*spvDescriptorSet0.vp_c9)._m0[int(_4261)][_4263];
    int _4267 = int(_4259) + 1;
    uint _4269 = uint(int(uint(_4267) >> uint(2)));
    int _4271 = _4267 & 3;
    float _4273 = (*spvDescriptorSet0.vp_c9)._m0[int(_4269)][_4271];
    float _4275 = -_4257;
    float _4277 = fma(_4149, 2.0, _4275);
    float _4279 = (*spvDescriptorSet0.vp_c9)._m0[83].w + (*spvDescriptorSet0.vp_c9)._m0[83].y;
    int _4281 = _4249 >> 2;
    float _4283 = (*spvDescriptorSet0.vp_c9)._m0[97].y + (*spvDescriptorSet0.vp_c9)._m0[96].w;
    bool _4285 = !_3009;
    int _4287 = _4285 ? 0 : 1;
    float _4289 = (*spvDescriptorSet0.vp_c9)._m0[98].z + (*spvDescriptorSet0.vp_c9)._m0[98].x;
    float _4291 = fma(_4103, (*spvDescriptorSet0.vp_c9)._m0[83].w, _4279);
    int _4293 = _3203 & 3;
    bool _4295 = _4293 != 0;
    float _4297 = fma(_4227, -2.0, _4283);
    int _4299 = _4281 << 4;
    int _4301 = _4299 + 656;
    float _4303 = fma(_3821, (*spvDescriptorSet0.vp_c9)._m0[98].z, _4289);
    int _4305 = _4229 << 4;
    int _4307 = _4305 + 800;
    float _4309 = (*spvDescriptorSet0.vp_c9)._m0[97].x + (*spvDescriptorSet0.vp_c9)._m0[96].z;
    float _4311 = _3821 * (*spvDescriptorSet0.vp_c9)._m0[97].x;
    int _4313 = _3153 & 3;
    bool _4315 = _4313 != 0;
    float _4317 = fma(_160, (*spvDescriptorSet0.vp_c9)._m0[97].z, _4303);
    bool _4319 = !_4295;
    int _4321 = _4319 ? 0 : 1;
    uint _4323 = uint(int(uint(_4301) >> uint(2)));
    uint _4325 = uint(int(uint(int(_4323)) >> uint(2)));
    int _4327 = int(_4323) & 3;
    float _4329 = (*spvDescriptorSet0.vp_c9)._m0[int(_4325)][_4327];
    int _4331 = int(_4323) + 1;
    uint _4333 = uint(int(uint(_4331) >> uint(2)));
    int _4335 = _4331 & 3;
    float _4337 = (*spvDescriptorSet0.vp_c9)._m0[int(_4333)][_4335];
    int _4339 = _3275 & 3;
    bool _4341 = _4339 != 0;
    float _4343 = (*spvDescriptorSet0.vp_c9)._m0[87].y + (*spvDescriptorSet0.vp_c9)._m0[86].w;
    if (_4201)
    {
        _4251 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _4345 = _4251;
    float _4347 = fma(_160, (*spvDescriptorSet0.vp_c9)._m0[96].y, _4297);
    float _4349 = -_4309;
    float _4351 = fma(_4311, 2.0, _4349);
    int _4353 = abs(_3063);
    float _4355 = fma(_3999, -2.0, _4343);
    uint _4357 = uint(int(uint(_4307) >> uint(2)));
    uint _4359 = uint(int(uint(int(_4357)) >> uint(2)));
    int _4361 = int(_4357) & 3;
    float _4363 = (*spvDescriptorSet0.vp_c9)._m0[int(_4359)][_4361];
    int _4365 = int(_4357) + 1;
    uint _4367 = uint(int(uint(_4365) >> uint(2)));
    int _4369 = _4365 & 3;
    float _4371 = (*spvDescriptorSet0.vp_c9)._m0[int(_4367)][_4369];
    float _4373 = -_160;
    float _4375 = fma(_4373, (*spvDescriptorSet0.vp_c9)._m0[96].x, _4351);
    int _4377 = as_type<int>(_4345);
    if (_4201)
    {
        float _4379 = _4345 * 5.0;
        _4377 = as_type<int>(_4379);
    }
    int _4381 = _4377;
    int _4383 = abs(_3231);
    float _4385 = fma(_160, (*spvDescriptorSet0.vp_c9)._m0[82].w, _4291);
    float _4387 = fma(_4317, _3781, _4375);
    int _4389 = abs(_3337);
    int _4391 = _4221 + 8;
    uint _4393 = uint(int(uint(_4391) >> uint(2)));
    uint _4395 = uint(int(uint(int(_4393)) >> uint(2)));
    int _4397 = int(_4393) & 3;
    float _4399 = (*spvDescriptorSet0.vp_c9)._m0[int(_4395)][_4397];
    int _4401 = int(_4393) + 1;
    uint _4403 = uint(int(uint(_4401) >> uint(2)));
    int _4405 = _4401 & 3;
    float _4407 = (*spvDescriptorSet0.vp_c9)._m0[int(_4403)][_4405];
    if (_4201)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _13732 = as_type<float>(_4381);
        out.gl_Position.z = _13732;
    }
    float _4409 = -_160;
    float _4411 = fma(_4409, (*spvDescriptorSet0.vp_c9)._m0[81].x, _4277);
    bool _4413 = !_4315;
    int _4415 = _4413 ? 0 : 1;
    float _4417 = fma(_160, (*spvDescriptorSet0.vp_c9)._m0[86].y, _4355);
    int _4419 = abs(_4287);
    float _4421 = -_4347;
    float _4423 = fma(_4247, _4131, _4421);
    int _4425 = _4211 + 8;
    uint _4427 = uint(int(uint(_4425) >> uint(2)));
    uint _4429 = uint(int(uint(int(_4427)) >> uint(2)));
    int _4431 = int(_4427) & 3;
    float _4433 = (*spvDescriptorSet0.vp_c9)._m0[int(_4429)][_4431];
    int _4435 = int(_4427) + 1;
    uint _4437 = uint(int(uint(_4435) >> uint(2)));
    int _4439 = _4435 & 3;
    float _4441 = (*spvDescriptorSet0.vp_c9)._m0[int(_4437)][_4439];
    int _4443 = abs(_3295);
    int _4445 = abs(_4415);
    int _4447 = ~_4383;
    int _4449 = _4447 + 1;
    int _4451 = _4449 + 1;
    int _4453 = _4301 + 8;
    uint _4455 = uint(int(uint(_4453) >> uint(2)));
    uint _4457 = uint(int(uint(int(_4455)) >> uint(2)));
    int _4459 = int(_4455) & 3;
    float _4461 = (*spvDescriptorSet0.vp_c9)._m0[int(_4457)][_4459];
    int _4463 = int(_4455) + 1;
    uint _4465 = uint(int(uint(_4463) >> uint(2)));
    int _4467 = _4463 & 3;
    float _4469 = (*spvDescriptorSet0.vp_c9)._m0[int(_4465)][_4467];
    int _4471 = ~_4353;
    int _4473 = _4471 + 1;
    int _4475 = _4473 + 1;
    int _4477 = _4451 * as_type<int>(_4273);
    bool _4479 = !_4341;
    int _4481 = _4479 ? 0 : 1;
    int _4483 = _4307 + 8;
    uint _4485 = uint(int(uint(_4483) >> uint(2)));
    uint _4487 = uint(int(uint(int(_4485)) >> uint(2)));
    int _4489 = int(_4485) & 3;
    float _4491 = (*spvDescriptorSet0.vp_c9)._m0[int(_4487)][_4489];
    int _4493 = int(_4485) + 1;
    uint _4495 = uint(int(uint(_4493) >> uint(2)));
    int _4497 = _4493 & 3;
    float _4499 = (*spvDescriptorSet0.vp_c9)._m0[int(_4495)][_4497];
    int _4501 = ~_4419;
    int _4503 = _4501 + 1;
    int _4505 = _4503 + 1;
    int _4507 = _4475 * as_type<int>(_4245);
    int _4509 = ~_4445;
    int _4511 = _4509 + 1;
    int _4513 = _4511 + 1;
    float _4515 = trunc((*spvDescriptorSet0.vp_c9)._m0[90].z);
    int _4517 = int(_4515);
    bool _4519 = _3233 != 3;
    int _4521 = _4505 * as_type<int>(_4237);
    int _4523 = _4521 + _4507;
    bool _4525 = !_4225;
    int _4527 = _4525 ? 0 : (-1);
    int _4529 = _4513 * as_type<int>(_4265);
    int _4531 = _4529 + _4477;
    bool _4533 = _3287 != 3;
    int _4535 = abs(_4481);
    bool _4537 = !_4205;
    int _4539 = _4537 ? 0 : (-1);
    bool _4541 = !_4519;
    int _4543 = _4541 ? 0 : (-1);
    int _4545 = ~_4443;
    int _4547 = _4545 + 1;
    int _4549 = _4547 + 1;
    int _4551 = abs(_3127);
    int _4553 = abs(_3215);
    int _4555 = _4549 * as_type<int>(_4337);
    int _4557 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _4559 = _4557 != 0;
    int _4561 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _4563 = _4561 != 0;
    int _4565 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _4567 = _4565 != 0;
    int _4569 = ~_4389;
    int _4571 = _4569 + 1;
    int _4573 = _4571 + 1;
    float _4575 = trunc((*spvDescriptorSet0.vp_c9)._m0[85].z);
    int _4577 = int(_4575);
    int _4579 = ~_4551;
    int _4581 = _4579 + 1;
    int _4583 = _4581 + 1;
    int _4585 = _4573 * as_type<int>(_4371);
    int _4587 = ~_4535;
    int _4589 = _4587 + 1;
    int _4591 = _4589 + 1;
    int _4593 = ~_4553;
    int _4595 = _4593 + 1;
    int _4597 = _4595 + 1;
    int _4599 = _4583 * as_type<int>(_4399);
    int _4601 = _4599 + _4523;
    int _4603 = abs(_4321);
    int _4605 = _4591 * as_type<int>(_4363);
    int _4607 = _4605 + _4585;
    int _4609 = abs(_3285);
    int _4611 = _4597 * as_type<int>(_4433);
    int _4613 = _4611 + _4531;
    int _4615 = ~_4603;
    int _4617 = _4615 + 1;
    int _4619 = _4617 + 1;
    float _4621 = trunc((*spvDescriptorSet0.vp_c9)._m0[95].z);
    int _4623 = int(_4621);
    int _4625 = abs(_3355);
    int _4627 = abs(_4539);
    int _4629 = _4619 * as_type<int>(_4329);
    int _4631 = _4629 + _4555;
    float _4633 = float(uint(_4101));
    int _4635 = ~_4609;
    int _4637 = _4635 + 1;
    int _4639 = _4637 + 1;
    float _4641 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _4643 = log2(_4641);
    int _4645 = ~_4625;
    int _4647 = _4645 + 1;
    int _4649 = _4647 + 1;
    int _4651 = ~_4627;
    int _4653 = _4651 + 1;
    int _4655 = _4653 + 1;
    int _4657 = _4639 * as_type<int>(_4461);
    int _4659 = _4657 + _4631;
    int _4661 = abs(_4527);
    int _4663 = _4649 * as_type<int>(_4491);
    int _4665 = _4663 + _4607;
    float _4667 = float(uint(_4577));
    float _4669 = 1.0 / _4633;
    int _4671 = _4655 * as_type<int>(_4441);
    int _4673 = _4671 + _4613;
    int _4675 = ~_4661;
    int _4677 = _4675 + 1;
    int _4679 = _4677 + 1;
    float _4681 = float(uint(_4517));
    int _4683 = abs(_4543);
    int _4685 = _4679 * as_type<int>(_4407);
    int _4687 = _4685 + _4601;
    int _4689 = abs(_3143);
    float _4691 = 1.0 / _4667;
    int _4693 = abs(_3379);
    float _4695 = _4643 * _160;
    int _4697 = ~_4683;
    int _4699 = _4697 + 1;
    int _4701 = _4699 + 1;
    int _4703 = ~_4689;
    int _4705 = _4703 + 1;
    int _4707 = _4705 + 1;
    bool _4709 = !_4533;
    int _4711 = _4709 ? 0 : (-1);
    float _4713 = 1.0 / _4681;
    int _4715 = abs(_3361);
    int _4717 = _4701 * as_type<int>(_4469);
    int _4719 = _4717 + _4659;
    int _4721 = abs(_4711);
    int _4723 = _4687 * _4707;
    int _4725 = ~_4715;
    int _4727 = _4725 + 1;
    int _4729 = _4727 + 1;
    int _4731 = as_type<int>(_4669) + (-2);
    int _4733 = _4195 * _4689;
    int _4735 = _4733 + _4723;
    int _4737 = ~_4693;
    int _4739 = _4737 + 1;
    int _4741 = _4739 + 1;
    int _4743 = _4729 * _4719;
    float _4745 = exp2(_4695);
    float _4747 = float(uint(_4735));
    int _4749 = _4741 * _4673;
    int _4751 = ~_4721;
    int _4753 = _4751 + 1;
    int _4755 = _4753 + 1;
    int _4757 = _4217 * _4715;
    int _4759 = _4757 + _4743;
    int _4761 = as_type<int>(_4691) + (-2);
    int _4763 = _4255 * _4693;
    int _4765 = _4763 + _4749;
    int _4767 = abs(_3591);
    int _4769 = _4755 * as_type<int>(_4499);
    int _4771 = _4769 + _4665;
    float _4773 = as_type<float>(_4731) * _4747;
    int _4775 = as_type<int>(_4713) + (-2);
    float _4777 = float(uint(_4765));
    float _4779 = float(uint(_4759));
    float _4781 = trunc(_4773);
    float _4783 = precise::max(_4781, 0.0);
    uint _4785 = uint(_4783);
    int _4787 = ~_4767;
    int _4789 = _4787 + 1;
    int _4791 = _4789 + 1;
    float _4793 = as_type<float>(_4761) * _4777;
    float _4795 = float(uint(_4623));
    float _4797 = as_type<float>(_4775) * _4779;
    int _4799 = _4125 ? 0 : 1;
    int _4801 = _4791 * _4771;
    int _4803 = abs(_4101);
    float _4805 = trunc(_4793);
    float _4807 = precise::max(_4805, 0.0);
    uint _4809 = uint(_4807);
    int _4811 = ~_4799;
    int _4813 = _4811 + 1;
    int _4815 = _4813 + 1;
    int _4817 = _4181 * _4767;
    int _4819 = _4817 + _4801;
    int _4821 = _4815;
    float _4823 = _4411;
    if (!_4113)
    {
        int _4825 = ~_4799;
        int _4827 = _4825 + 1;
        _4821 = _4827;
    }
    int _4829 = _4821;
    float _4831 = -_4745;
    float _4833 = _4831 + 1.0;
    int _4835 = ~_4101;
    int _4837 = _4835 + 1;
    int _4839 = ~_4577;
    int _4841 = _4839 + 1;
    float _4843 = trunc(_4797);
    float _4845 = precise::max(_4843, 0.0);
    uint _4847 = uint(_4845);
    int _4849 = abs(_4577);
    int _4851 = _4837 * int(_4785);
    int _4853 = _4851 + _4735;
    float _4855 = float(uint(_4803));
    int _4857 = ~_4517;
    int _4859 = _4857 + 1;
    float _4861 = float(uint(_4849));
    float _4863 = 1.0 / _4795;
    int _4865 = _4841 * int(_4809);
    int _4867 = _4865 + _4765;
    int _4869 = abs(_4517);
    float _4871 = float(uint(_4853));
    float _4873 = float(uint(_4867));
    float _4875 = 1.0 / _4855;
    int _4877 = _4859 * int(_4847);
    int _4879 = _4877 + _4759;
    float _4881 = float(uint(_4869));
    float _4883 = as_type<float>(_4731) * _4871;
    int _4885 = abs(_4623);
    float _4887 = as_type<float>(_4761) * _4873;
    float _4889 = float(uint(_4879));
    float _4891 = 1.0 / _4861;
    int _4893 = as_type<int>(_4863) + (-2);
    float _4895 = as_type<float>(_4775) * _4889;
    float _4897 = float(uint(_4819));
    float _4899 = float(uint(_4885));
    float _4901 = 1.0 / _4881;
    int _4903 = abs(_4735);
    float _4905 = as_type<float>(_4893) * _4897;
    int _4907 = abs(_4765);
    int _4909 = as_type<int>(_4875) + (-2);
    float _4911 = float(uint(_4903));
    float _4913 = 1.0 / _4899;
    int _4915 = as_type<int>(_4891) + (-2);
    float _4917 = as_type<float>(_4909) * _4911;
    float _4919 = float(uint(_4907));
    bool _4921 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _4923 = isnan(1.0);
    bool _4925 = _4921 || _4923;
    bool _4927 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _4929 = _4925 || _4927;
    float _4931 = trunc(_4905);
    float _4933 = precise::max(_4931, 0.0);
    uint _4935 = uint(_4933);
    float _4937 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _4939 = 1.0 + _4937;
    int _4941 = abs(_4759);
    float _4943 = as_type<float>(_4915) * _4919;
    float _4945 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    int _4947 = as_type<int>(_4901) + (-2);
    float _4949 = trunc(_4917);
    float _4951 = precise::max(_4949, 0.0);
    uint _4953 = uint(_4951);
    float _4955 = float(uint(_4941));
    float _4957 = (*spvDescriptorSet0.vp_c9)._m0[88].w + (*spvDescriptorSet0.vp_c9)._m0[88].y;
    float _4959 = as_type<float>(_4947) * _4955;
    int _4961 = abs(_4819);
    float _4963 = 1.0 / _4939;
    int _4965 = ~_4623;
    int _4967 = _4965 + 1;
    float _4969 = fma(_1808, (*spvDescriptorSet0.vp_c9)._m0[78].w, _4945);
    float _4971 = fma(_1808, (*spvDescriptorSet0.vp_c9)._m0[88].w, _4957);
    float _4973 = (*spvDescriptorSet0.vp_c9)._m0[88].z + (*spvDescriptorSet0.vp_c9)._m0[88].x;
    int _4975 = as_type<int>(_4913) + (-2);
    float _4977 = fma(_160, (*spvDescriptorSet0.vp_c9)._m0[77].w, _4969);
    float _4979 = float(uint(_4961));
    float _4981 = trunc(_4943);
    float _4983 = precise::max(_4981, 0.0);
    uint _4985 = uint(_4983);
    bool _4987 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _4989 = isnan(0.0);
    bool _4991 = _4987 || _4989;
    bool _4993 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _4995 = _4991 || _4993;
    float _4997 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    float _4999 = fma(_160, (*spvDescriptorSet0.vp_c9)._m0[87].w, _4971);
    int _5001 = _4967 * int(_4935);
    int _5003 = _5001 + _4819;
    int _5005 = ~_4803;
    int _5007 = _5005 + 1;
    float _5009 = fma(_2083, (*spvDescriptorSet0.vp_c9)._m0[88].z, _4973);
    float _5011 = as_type<float>(_4975) * _4979;
    float _5013 = trunc(_4959);
    float _5015 = precise::max(_5013, 0.0);
    uint _5017 = uint(_5015);
    float _5019 = fma(_2083, (*spvDescriptorSet0.vp_c9)._m0[78].z, _4997);
    float _5021 = _4995 ? _4833 : 0.0;
    float _5023 = fma(_160, (*spvDescriptorSet0.vp_c9)._m0[87].z, _5009);
    float _5025 = float(uint(_5003));
    int _5027 = _5007 * int(_4953);
    int _5029 = _5027 + _4903;
    int _5031 = ~_4849;
    int _5033 = _5031 + 1;
    float _5035 = fma(_160, (*spvDescriptorSet0.vp_c9)._m0[77].z, _5019);
    float _5037 = trunc(_4887);
    float _5039 = precise::max(_5037, 0.0);
    uint _5041 = uint(_5039);
    if (_4929)
    {
        float _5043 = _5021 * _4963;
        _162 = _5043;
    }
    float _5045 = _162;
    float _5047 = as_type<float>(_4893) * _5025;
    float _5049 = float(uint(_5029));
    int _5051 = _5033 * int(_4985);
    int _5053 = _5051 + _4907;
    float _5055 = trunc(_4883);
    float _5057 = precise::max(_5055, 0.0);
    uint _5059 = uint(_5057);
    int _5061 = ~_4869;
    int _5063 = _5061 + 1;
    float _5065 = as_type<float>(_4909) * _5049;
    float _5067 = trunc(_5011);
    float _5069 = precise::max(_5067, 0.0);
    uint _5071 = uint(_5069);
    int _5073 = int(_4809) + int(_5041);
    int _5075 = _5063 * int(_5017);
    int _5077 = _5075 + _4941;
    int _5079 = ~_4623;
    int _5081 = _5079 + 1;
    float _5083 = float(uint(_5077));
    float _5085 = trunc(_5047);
    float _5087 = precise::max(_5085, 0.0);
    uint _5089 = uint(_5087);
    int _5091 = int(_4785) + int(_5059);
    int _5093 = ~_4885;
    int _5095 = _5093 + 1;
    float _5097 = as_type<float>(_4947) * _5083;
    float _5099 = trunc(_4895);
    float _5101 = precise::max(_5099, 0.0);
    uint _5103 = uint(_5101);
    float _5105 = trunc(_5097);
    float _5107 = precise::max(_5105, 0.0);
    uint _5109 = uint(_5107);
    float _5111 = float(uint(_5053));
    int _5113 = ~_4101;
    int _5115 = _5113 + 1;
    int _5117 = int(_4935) + int(_5089);
    float _5119 = as_type<float>(_4915) * _5111;
    int _5121 = _5095 * int(_5071);
    int _5123 = _5121 + _4961;
    float _5125 = trunc(_5065);
    float _5127 = precise::max(_5125, 0.0);
    uint _5129 = uint(_5127);
    int _5131 = ~_4577;
    int _5133 = _5131 + 1;
    float _5135 = float(uint(_5123));
    int _5137 = _5115 * _5091;
    int _5139 = _5137 + _4735;
    int _5141 = ~_4517;
    int _5143 = _5141 + 1;
    float _5145 = as_type<float>(_4975) * _5135;
    float _5147 = trunc(_5119);
    float _5149 = precise::max(_5147, 0.0);
    uint _5151 = uint(_5149);
    int _5153 = _5133 * _5073;
    int _5155 = _5153 + _4765;
    int _5157 = int(_4847) + int(_5103);
    int _5159 = _5081 * _5117;
    int _5161 = _5159 + _4819;
    bool _5163 = uint(_5155) >= uint(_4577);
    float _5165 = trunc(_5145);
    float _5167 = precise::max(_5165, 0.0);
    uint _5169 = uint(_5167);
    bool _5171 = uint(_5139) >= uint(_4101);
    int _5173 = _5143 * _5157;
    int _5175 = _5173 + _4759;
    int _5177 = int(_5017) + int(_5109);
    int _5179 = int(_4953) + int(_5129);
    int _5181 = ~_4803;
    int _5183 = _5181 + 1;
    bool _5185 = !_5163;
    int _5187 = _5185 ? 0 : (-1);
    bool _5189 = uint(_5161) >= uint(_4623);
    int _5191 = _5183 * _5179;
    int _5193 = _5191 + _4903;
    int _5195 = ~_4869;
    int _5197 = _5195 + 1;
    bool _5199 = !_5171;
    int _5201 = _5199 ? 0 : (-1);
    bool _5203 = uint(_5175) >= uint(_4517);
    int _5205 = _5197 * _5177;
    int _5207 = _5205 + _4941;
    int _5209 = int(_4985) + int(_5151);
    int _5211 = ~_4849;
    int _5213 = _5211 + 1;
    bool _5215 = !_5203;
    int _5217 = _5215 ? 0 : (-1);
    bool _5219 = uint(_5193) >= uint(_4803);
    int _5221 = _5213 * _5209;
    int _5223 = _5221 + _4907;
    int _5225 = ~_4885;
    int _5227 = _5225 + 1;
    bool _5229 = !_5219;
    int _5231 = _5229 ? 0 : (-1);
    bool _5233 = uint(_5207) >= uint(_4869);
    float _5235 = _4141 * _4141;
    int _5237 = int(_5071) + int(_5169);
    float _5239 = fma(_4047, _4047, _5235);
    bool _5241 = !_5189;
    int _5243 = _5241 ? 0 : (-1);
    bool _5245 = uint(_5223) >= uint(_4849);
    float _5247 = fma(_4161, _4161, _5239);
    int _5249 = _5227 * _5237;
    int _5251 = _5249 + _4961;
    int _5253 = ~_5091;
    int _5255 = _5253 + _5201;
    int _5257 = _5255 + 1;
    float _5259 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    bool _5261 = !_5245;
    int _5263 = _5261 ? 0 : (-1);
    bool _5265 = uint(_5251) >= uint(_4885);
    int _5267 = _4101 * _5257;
    int _5269 = _5267 + _4735;
    int _5271 = ~_5157;
    int _5273 = _5271 + _5217;
    int _5275 = _5273 + 1;
    bool _5277 = !_5233;
    int _5279 = _5277 ? 0 : (-1);
    float _5281 = rsqrt(_5247);
    bool _5283 = _4101 == 0;
    int _5285 = ~_5073;
    int _5287 = _5285 + _5187;
    int _5289 = _5287 + 1;
    int _5291 = ~_5117;
    int _5293 = _5291 + _5243;
    int _5295 = _5293 + 1;
    int _5297 = _4517 * _5275;
    int _5299 = _5297 + _4759;
    bool _5301 = !_5283;
    int _5303 = _5301 ? _5269 : (-1);
    int _5305 = _4577 * _5289;
    int _5307 = _5305 + _4765;
    bool _5309 = _4517 == 0;
    float _5311 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    int _5313 = _4765 ^ _4577;
    float _5315 = _5259 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    bool _5317 = !_5309;
    int _5319 = _5317 ? _5299 : (-1);
    bool _5321 = _4101 == 0;
    float _5323 = _4141 * _5281;
    int _5325 = _4735 ^ _4101;
    float _5327 = _4047 * _5281;
    uint _5329 = uint(int(uint(_5313) >> uint(31)));
    float _5331 = -_5323;
    float _5333 = fma(_5331, (*spvDescriptorSet0.vp_c9)._m0[18].w, _4141);
    int _5335 = ~_5231;
    int _5337 = _5179 + _5335;
    int _5339 = _5337 + 1;
    float _5341 = _4387 + 0.5;
    uint _5343 = uint(int(uint(_5325) >> uint(31)));
    float _5345 = _5333 * _5333;
    int _5347 = ~_5263;
    int _5349 = _5209 + _5347;
    int _5351 = _5349 + 1;
    float _5353 = _4423 + 0.5;
    int _5355 = ~int(_5329);
    int _5357 = _5355 + 1;
    float _5359 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    bool _5361 = !_5265;
    int _5363 = _5361 ? 0 : (-1);
    float _5365 = -_5327;
    float _5367 = fma(_5365, (*spvDescriptorSet0.vp_c9)._m0[18].w, _4047);
    bool _5369 = _4577 == 0;
    out.m_73.x = _5341;
    out.m_73.y = _5353;
    int _5371 = ~int(_5343);
    int _5373 = _5371 + 1;
    float _5375 = fma(_5367, _5367, _5345);
    int _5377 = _5351 ^ _5357;
    float _5379 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].z;
    bool _5381 = !_5369;
    int _5383 = _5381 ? _5307 : (-1);
    int _5385 = _4623 * _5295;
    int _5387 = _5385 + _4819;
    int _5389 = _5339 ^ _5373;
    float _5391 = fma(_5315, _2125, -0.5);
    bool _5393 = _4623 == 0;
    float _5395 = _5311 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    int _5397 = ~_5357;
    int _5399 = _5397 + _5377;
    int _5401 = _5399 + 1;
    float _5403 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    int _5405 = ~_5373;
    int _5407 = _5405 + _5389;
    int _5409 = _5407 + 1;
    float _5411 = _5359 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    bool _5413 = !_5393;
    int _5415 = _5413 ? _5387 : (-1);
    float _5417 = float(_5303);
    float _5419 = fma(_5411, _2189, -0.5);
    bool _5421 = _4577 == 0;
    float _5423 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[95].z;
    bool _5425 = !_5321;
    int _5427 = _5425 ? _5409 : (-1);
    float _5429 = fma(_5315, _5417, _3943);
    bool _5431 = _4517 == 0;
    float _5433 = _5379 * (*spvDescriptorSet0.vp_c9)._m0[90].x;
    int _5435 = _4759 ^ _4517;
    float _5437 = fma(_5035, _5391, _5429);
    bool _5439 = !_5421;
    int _5441 = _5439 ? _5401 : (-1);
    float _5443 = fma(_5433, _2211, -0.5);
    int _5445 = _4819 ^ _4623;
    float _5447 = _5403 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    float _5449 = float(_5319);
    bool _5451 = _4623 == 0;
    float _5453 = float(_5383);
    float _5455 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].w;
    uint _5457 = uint(int(uint(_5435) >> uint(31)));
    float _5459 = fma(_5433, _5449, _4185);
    uint _5461 = uint(int(uint(_5445) >> uint(31)));
    float _5463 = fma(_5411, _5453, _4411);
    int _5465 = ~_5279;
    int _5467 = _5177 + _5465;
    int _5469 = _5467 + 1;
    float _5471 = _5423 * (*spvDescriptorSet0.vp_c9)._m0[95].x;
    int _5473 = ~int(_5457);
    int _5475 = _5473 + 1;
    float _5477 = fma(_5023, _5443, _5459);
    float _5479 = float(_5415);
    float _5481 = fma(_5471, _2221, -0.5);
    int _5483 = ~_5363;
    int _5485 = _5237 + _5483;
    int _5487 = _5485 + 1;
    float _5489 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[95].w;
    int _5491 = ~int(_5461);
    int _5493 = _5491 + 1;
    float _5495 = fma(_5471, _5479, _4013);
    float _5497 = float(_5427);
    float _5499 = fma(_5395, _3383, -0.5);
    float _5501 = float(_5441);
    float _5503 = fma(_4203, _5419, _5463);
    int _5505 = _5469 ^ _5475;
    float _5507 = -_3311;
    float _5509 = fma(_5395, _5497, _5507);
    int _5511 = _5487 ^ _5493;
    float _5513 = fma(_5447, _3391, -0.5);
    int _5515 = ~_5475;
    int _5517 = _5515 + _5505;
    int _5519 = _5517 + 1;
    float _5521 = -_4115;
    float _5523 = fma(_5447, _5501, _5521);
    int _5525 = ~_5493;
    int _5527 = _5525 + _5511;
    int _5529 = _5527 + 1;
    float _5531 = _4161 * _5281;
    float _5533 = _5455 * (*spvDescriptorSet0.vp_c9)._m0[90].y;
    bool _5535 = !_5431;
    int _5537 = _5535 ? _5519 : (-1);
    float _5539 = fma(_4977, _5499, _5509);
    bool _5541 = !_5451;
    int _5543 = _5541 ? _5529 : (-1);
    float _5545 = -_5531;
    float _5547 = fma(_5545, (*spvDescriptorSet0.vp_c9)._m0[18].w, _4161);
    float _5549 = float(_5537);
    float _5551 = fma(_3891, _5481, _5495);
    float _5553 = float(_5543);
    float _5555 = _5539 + 0.5;
    float _5557 = fma(_5547, _5547, _5375);
    float _5559 = _5489 * (*spvDescriptorSet0.vp_c9)._m0[95].y;
    float _5561 = in.m_75.x;
    float _5563 = in.m_75.y;
    float _5565 = in.m_75.z;
    float _5567 = fma(_5533, _3405, -0.5);
    float _5569 = -_4417;
    float _5571 = fma(_5533, _5549, _5569);
    float _5573 = fma(_5559, _3407, -0.5);
    float _5575 = -_4023;
    float _5577 = fma(_5559, _5553, _5575);
    float _5579 = fma(_4385, _5513, _5523);
    float _5581 = fma(_4999, _5567, _5571);
    float _5583 = _5477 + 0.5;
    float _5585 = fma(_3893, _5573, _5577);
    float _5587 = _5437 + 0.5;
    float _5589 = _5503 + 0.5;
    float _5591 = _5579 + 0.5;
    float _5593 = _5551 + 0.5;
    float _5595 = _5581 + 0.5;
    float _5597 = _5585 + 0.5;
    bool _5599 = !_4559;
    int _5601 = _5599 ? 0 : 1;
    out.m_77.x = _5587;
    out.m_77.y = _5555;
    out.m_77.z = _5589;
    out.m_77.w = _5591;
    bool _5603 = !_4563;
    int _5605 = _5603 ? 0 : 1;
    int _5607 = abs(_5601);
    out.m_79.x = _5583;
    out.m_79.y = _5595;
    float _5609 = float(_4829);
    int _5611 = abs(_5605);
    out.m_81.x = _5593;
    out.m_81.y = _5597;
    bool _5613 = !_4567;
    int _5615 = _5613 ? 0 : 1;
    float _5617 = float(_5607);
    float _5619 = _5589;
    float _5621 = as_type<float>(_5129);
    if (_4201)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_59.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_59.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_59.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_59.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_61.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_61.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_61.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_61.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_67.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_67.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_67.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_67.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_71.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_71.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_71.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_71.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_79.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_79.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_79.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_79.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_81.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_81.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_81.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_81.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_89.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_89.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_89.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_89.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_73.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_73.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_73.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_73.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_77.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_77.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_77.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_77.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_95.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_95.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_95.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_95.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_99.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_99.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_99.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_99.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_97.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_97.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_97.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_97.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_49.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_49.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_49.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_49.w)); dm_cw(dm_gs, dm_p, 68, as_type<uint>(out.m_93.x)); dm_cw(dm_gs, dm_p, 69, as_type<uint>(out.m_93.y)); dm_cw(dm_gs, dm_p, 70, as_type<uint>(out.m_93.z)); dm_cw(dm_gs, dm_p, 71, as_type<uint>(out.m_93.w)); dm_cw(dm_gs, dm_p, 72, as_type<uint>(out.m_105.x)); dm_cw(dm_gs, dm_p, 73, as_type<uint>(out.m_105.y)); dm_cw(dm_gs, dm_p, 74, as_type<uint>(out.m_105.z)); dm_cw(dm_gs, dm_p, 75, as_type<uint>(out.m_105.w)); dm_cw(dm_gs, dm_p, 76, as_type<uint>(out.m_101.x)); dm_cw(dm_gs, dm_p, 77, as_type<uint>(out.m_101.y)); dm_cw(dm_gs, dm_p, 78, as_type<uint>(out.m_101.z)); dm_cw(dm_gs, dm_p, 79, as_type<uint>(out.m_101.w)); dm_cw(dm_gs, dm_p, 80, as_type<uint>(out.m_103.x)); dm_cw(dm_gs, dm_p, 81, as_type<uint>(out.m_103.y)); dm_cw(dm_gs, dm_p, 82, as_type<uint>(out.m_103.z)); dm_cw(dm_gs, dm_p, 83, as_type<uint>(out.m_103.w)); dm_cw(dm_gs, dm_p, 84, as_type<uint>(out.m_107.x)); dm_cw(dm_gs, dm_p, 85, as_type<uint>(out.m_107.y)); dm_cw(dm_gs, dm_p, 86, as_type<uint>(out.m_107.z)); dm_cw(dm_gs, dm_p, 87, as_type<uint>(out.m_107.w)); dm_cw(dm_gs, dm_p, 88, as_type<uint>(out.m_63.x)); dm_cw(dm_gs, dm_p, 89, as_type<uint>(out.m_63.y)); dm_cw(dm_gs, dm_p, 90, as_type<uint>(out.m_63.z)); dm_cw(dm_gs, dm_p, 91, as_type<uint>(out.m_63.w)); dm_cw(dm_gs, dm_p, 92, as_type<uint>(out.m_65.x)); dm_cw(dm_gs, dm_p, 93, as_type<uint>(out.m_65.y)); dm_cw(dm_gs, dm_p, 94, as_type<uint>(out.m_65.z)); dm_cw(dm_gs, dm_p, 95, as_type<uint>(out.m_65.w)); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _5623 = -_5323;
    float _5625 = fma(_5623, (*spvDescriptorSet0.vp_c9)._m0[18].w, _3779);
    float _5627 = float(_5611);
    float _5629 = -_5327;
    float _5631 = fma(_5629, (*spvDescriptorSet0.vp_c9)._m0[18].w, _3805);
    float _5633 = _5617 * _5609;
    float _5635 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _5637 = _5625 + _5635;
    float _5639 = float(_3543);
    float _5641 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _5643 = _5631 + _5641;
    float _5645 = _5633 * (-2.0);
    float _5647 = _5637 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _5649 = -_5531;
    float _5651 = fma(_5649, (*spvDescriptorSet0.vp_c9)._m0[18].w, _3815);
    float _5653 = _5627 * _5639;
    float _5655 = _1808 + _2089;
    float _5657 = fma(_5643, (*spvDescriptorSet0.vp_c8)._m0[28].x, _5647);
    float _5659 = _2083 + (-0.5);
    float _5661 = fma(_5645, _5561, _5561);
    float _5663 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _5665 = _5651 + _5663;
    float _5667 = _5655 + (-1.0);
    float _5669 = fma(_4145, _5645, _4145);
    float _5671 = fma(_5659, (*spvDescriptorSet0.vp_c9)._m0[196].x, _5661);
    float _5673 = _5653 * (-2.0);
    float _5675 = fma(_5665, (*spvDescriptorSet0.vp_c8)._m0[28].z, _5657);
    float _5677 = fma(_5667, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    float _5679 = fma(_5669, _5045, _5671);
    float _5681 = _1808 + (-0.5);
    float _5683 = fma(_5673, _5563, _5563);
    bool _5685 = _5675 >= 0.0;
    float _5687 = fma(_5677, _5673, _5677);
    int _5689 = abs(_5615);
    float _5691 = _5679 * 0.15915493667125701904296875;
    float _5693 = fma(_5681, (*spvDescriptorSet0.vp_c9)._m0[196].y, _5683);
    float _5695 = sqrt(_5557);
    float _5697 = fma(_5687, _5045, _5693);
    float _5699 = float(_3771);
    float _5701 = _2083 + _2089;
    float _5703 = float(_5689);
    float _5705 = _5697 * 0.15915493667125701904296875;
    float _5707 = _5651;
    float _5709 = _5625;
    if (_5685)
    {
        _5619 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _5711 = _5619;
    float _5713 = _5691 * 6.283185482025146484375;
    float _5715 = sin(_5713);
    int _5717 = as_type<int>(_5711);
    if (_5685)
    {
        out.m_49.x = 0.0;
    }
    float _5719 = _5703 * _5699;
    if (_5685)
    {
        float _5721 = _5711 * 5.0;
        _5717 = as_type<int>(_5721);
    }
    int _5723 = _5717;
    float _5725 = _5701 + (-1.0);
    float _5727 = _5719 * (-2.0);
    float _5729 = _5691 * 6.283185482025146484375;
    float _5731 = cos(_5729);
    if (_5685)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _15599 = as_type<float>(_5723);
        out.gl_Position.z = _15599;
    }
    float _5733 = _5705 * 6.283185482025146484375;
    float _5735 = sin(_5733);
    if (_5685)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_59.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_59.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_59.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_59.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_61.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_61.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_61.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_61.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_67.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_67.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_67.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_67.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_71.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_71.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_71.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_71.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_79.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_79.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_79.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_79.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_81.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_81.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_81.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_81.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_89.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_89.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_89.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_89.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_73.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_73.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_73.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_73.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_77.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_77.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_77.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_77.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_95.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_95.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_95.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_95.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_99.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_99.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_99.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_99.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_97.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_97.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_97.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_97.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_49.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_49.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_49.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_49.w)); dm_cw(dm_gs, dm_p, 68, as_type<uint>(out.m_93.x)); dm_cw(dm_gs, dm_p, 69, as_type<uint>(out.m_93.y)); dm_cw(dm_gs, dm_p, 70, as_type<uint>(out.m_93.z)); dm_cw(dm_gs, dm_p, 71, as_type<uint>(out.m_93.w)); dm_cw(dm_gs, dm_p, 72, as_type<uint>(out.m_105.x)); dm_cw(dm_gs, dm_p, 73, as_type<uint>(out.m_105.y)); dm_cw(dm_gs, dm_p, 74, as_type<uint>(out.m_105.z)); dm_cw(dm_gs, dm_p, 75, as_type<uint>(out.m_105.w)); dm_cw(dm_gs, dm_p, 76, as_type<uint>(out.m_101.x)); dm_cw(dm_gs, dm_p, 77, as_type<uint>(out.m_101.y)); dm_cw(dm_gs, dm_p, 78, as_type<uint>(out.m_101.z)); dm_cw(dm_gs, dm_p, 79, as_type<uint>(out.m_101.w)); dm_cw(dm_gs, dm_p, 80, as_type<uint>(out.m_103.x)); dm_cw(dm_gs, dm_p, 81, as_type<uint>(out.m_103.y)); dm_cw(dm_gs, dm_p, 82, as_type<uint>(out.m_103.z)); dm_cw(dm_gs, dm_p, 83, as_type<uint>(out.m_103.w)); dm_cw(dm_gs, dm_p, 84, as_type<uint>(out.m_107.x)); dm_cw(dm_gs, dm_p, 85, as_type<uint>(out.m_107.y)); dm_cw(dm_gs, dm_p, 86, as_type<uint>(out.m_107.z)); dm_cw(dm_gs, dm_p, 87, as_type<uint>(out.m_107.w)); dm_cw(dm_gs, dm_p, 88, as_type<uint>(out.m_63.x)); dm_cw(dm_gs, dm_p, 89, as_type<uint>(out.m_63.y)); dm_cw(dm_gs, dm_p, 90, as_type<uint>(out.m_63.z)); dm_cw(dm_gs, dm_p, 91, as_type<uint>(out.m_63.w)); dm_cw(dm_gs, dm_p, 92, as_type<uint>(out.m_65.x)); dm_cw(dm_gs, dm_p, 93, as_type<uint>(out.m_65.y)); dm_cw(dm_gs, dm_p, 94, as_type<uint>(out.m_65.z)); dm_cw(dm_gs, dm_p, 95, as_type<uint>(out.m_65.w)); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _5737 = -_3779;
    float _5739 = _5737 + (*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _5741 = fma(_5725, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _5743 = -_3805;
    float _5745 = _5743 + (*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _5747 = -_3815;
    float _5749 = _5747 + (*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _5751 = _5739 * _5739;
    float _5753 = fma(_5727, _5565, _5565);
    float _5755 = _2089 + (-0.5);
    float _5757 = fma(_5741, _5727, _5741);
    float _5759 = fma(_5745, _5745, _5751);
    float _5761 = _5705 * 6.283185482025146484375;
    float _5763 = cos(_5761);
    float _5765 = fma(_5755, (*spvDescriptorSet0.vp_c9)._m0[196].z, _5753);
    float _5767 = _5281 * _5695;
    float _5769 = fma(_5749, _5749, _5759);
    float _5771 = _518 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _5773 = fma(_5757, _5045, _5765);
    float _5775 = _524 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _5777 = in.m_83.x;
    float _5779 = in.m_83.y;
    float _5781 = in.m_83.z;
    float _5783 = _5731 * _5735;
    float _5785 = rsqrt(_5769);
    float _5787 = _5773 * 0.15915493667125701904296875;
    float _5789 = _5715 * _5735;
    float _5791 = _5767 * _5775;
    float _5793 = _5731 * _5763;
    float _5795 = _5787 * 6.283185482025146484375;
    float _5797 = sin(_5795);
    float _5799 = _5745 * _5785;
    float _5801 = _5749 * _5785;
    float _5803 = _5739 * _5785;
    float _5805 = _5787 * 6.283185482025146484375;
    float _5807 = cos(_5805);
    float _5809 = -(*spvDescriptorSet0.vp_c8)._m0[1].z;
    float _5811 = _5799 * _5809;
    float _5813 = -(*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _5815 = _5801 * _5813;
    float _5817 = -(*spvDescriptorSet0.vp_c8)._m0[1].x;
    float _5819 = _5803 * _5817;
    float _5821 = -(*spvDescriptorSet0.vp_c8)._m0[1].x;
    float _5823 = -_5811;
    float _5825 = fma(_5801, _5821, _5823);
    float _5827 = -(*spvDescriptorSet0.vp_c8)._m0[1].z;
    float _5829 = -_5815;
    float _5831 = fma(_5803, _5827, _5829);
    float _5833 = -(*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _5835 = -_5819;
    float _5837 = fma(_5799, _5833, _5835);
    float _5839 = fma(_5797, _5793, _5789);
    float _5841 = _5825 * _5825;
    float _5843 = fma(_5797, _5789, _5793);
    float _5845 = _520 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _5847 = fma(_5831, _5831, _5841);
    float _5849 = _5715 * _5763;
    float _5851 = _5767 * _5845;
    float _5853 = fma(_5837, _5837, _5847);
    float _5855 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _5779);
    float _5857 = _5731 * _5807;
    float _5859 = _5767 * _5771;
    float _5861 = -_5783;
    float _5863 = fma(_5797, _5849, _5861);
    float _5865 = _5855 * _5851;
    float _5867 = rsqrt(_5853);
    float _5869 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _5781);
    float _5871 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _5777);
    float _5873 = _5715 * _5807;
    float _5875 = -_5849;
    float _5877 = fma(_5797, _5783, _5875);
    float _5879 = _5869 * _5859;
    float _5881 = _5871 * _5791;
    float _5883 = _5857 * _5865;
    float _5885 = _5763 * _5807;
    float _5887 = -_5865;
    float _5889 = _5797 * _5887;
    float _5891 = _5873 * _5865;
    float _5893 = fma(_5839, _5881, _5883);
    float _5895 = _5735 * _5807;
    float _5897 = fma(_5885, _5881, _5889);
    float _5899 = fma(_5863, _5881, _5891);
    float _5901 = fma(_5877, _5879, _5893);
    float _5903 = _5831 * _5867;
    float _5905 = _5825 * _5867;
    float _5907 = _5837 * _5867;
    float _5909 = fma(_5895, _5879, _5897);
    float _5911 = _5803 * _5903;
    float _5913 = _5801 * _5905;
    float _5915 = fma(_5843, _5879, _5899);
    float _5917 = _5625 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _5919 = -_5911;
    float _5921 = fma(_5799, _5905, _5919);
    float _5923 = -_5913;
    float _5925 = fma(_5803, _5907, _5923);
    float _5927 = fma(_5631, (*spvDescriptorSet0.vp_c8)._m0[11].x, _5917);
    float _5929 = _5921 * _5901;
    float _5931 = _5925 * _5901;
    float _5933 = fma(_5907, _5909, _5929);
    float _5935 = fma(_5903, _5909, _5931);
    float _5937 = _5799 * _5907;
    float _5939 = fma(_5801, _5915, _5933);
    float _5941 = fma(_5799, _5915, _5935);
    float _5943 = -_5937;
    float _5945 = fma(_5801, _5903, _5943);
    float _5947 = _3815 + _5939;
    float _5949 = _3805 + _5941;
    float _5951 = _5945 * _5901;
    float _5953 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _5955 = _5947 + _5953;
    float _5957 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _5959 = _5949 + _5957;
    float _5961 = _5955 * _5955;
    float _5963 = fma(_5959, _5959, _5961);
    float _5965 = fma(_5905, _5909, _5951);
    float _5967 = fma(_5651, (*spvDescriptorSet0.vp_c8)._m0[11].z, _5927);
    float _5969 = sqrt(_5963);
    float _5971 = fma(_5803, _5915, _5965);
    float _5973 = _3779 + _5971;
    bool _5975 = _5969 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _5977 = _5971;
    float _5979 = _5927;
    float _5981 = _5915;
    float _5983 = _5767;
    if (!_5975)
    {
        _5977 = _5949;
    }
    float _5985 = _5977;
    float _5987 = _5985;
    if (!_5975)
    {
        _5979 = _5947;
    }
    float _5989 = _5979;
    float _5991 = _5989;
    if (!_5975)
    {
        _5981 = _5973;
    }
    float _5993 = _5981;
    bool _5995 = !_5975;
    float _5997 = _5993;
    if (!_5995)
    {
        float _5999 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _6001 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _6003 = _5969 + _6001;
        float _6005 = _5973 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _6007 = rsqrt(_5963);
        float _6009 = _6003 * _5999;
        float _6011 = _6009 * 0.15915493667125701904296875;
        float _6013 = _6011 * 6.283185482025146484375;
        float _6015 = sin(_6013);
        float _6017 = _6011 * 6.283185482025146484375;
        float _6019 = cos(_6017);
        float _6021 = fma(_6015, _6005, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _6023 = _6007 * _6021;
        float _6025 = _6019 + (-1.0);
        float _6027 = fma(_5959, _6023, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _6029 = fma(_5955, _6023, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        float _6031 = _6025 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _6033 = fma(_5973, _6019, _6031);
        _5997 = _6033;
        _5987 = _6027;
        _5991 = _6029;
    }
    float _6035 = _5997;
    float _6037 = _5987;
    float _6039 = _5991;
    float _6041 = -_3779;
    float _6043 = _6041 + _6035;
    float _6045 = -_3805;
    float _6047 = _6045 + _6037;
    float _6049 = _5967 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _6051 = _5625 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _6053 = _6043 * _6043;
    float _6055 = -_3815;
    float _6057 = _6055 + _6039;
    float _6059 = 1.0 / _6049;
    float _6061 = fma(_5631, (*spvDescriptorSet0.vp_c8)._m0[10].x, _6051);
    float _6063 = fma(_6047, _6047, _6053);
    bool _6065 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[660].y;
    bool _6067 = isnan(0.5);
    bool _6069 = _6065 || _6067;
    bool _6071 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _6073 = _6069 || _6071;
    float _6075 = fma(_5651, (*spvDescriptorSet0.vp_c8)._m0[10].z, _6061);
    float _6077 = fma(_6057, _6057, _6063);
    float _6079 = _6075 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _6081 = sqrt(_6077);
    bool _6083 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[653].w;
    bool _6085 = isnan(0.5);
    bool _6087 = _6083 || _6085;
    bool _6089 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _6091 = _6087 || _6089;
    float _6093 = _6079 + _6049;
    float _6095 = _6093 * _6059;
    float _6097 = _6095 * 0.5;
    float _6099 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _6101 = fma(_6097, (*spvDescriptorSet0.vp_c8)._m0[30].w, _6099);
    float _6103 = 1.0 / _6101;
    bool _6105 = _6081 > 0.0;
    bool _6107 = !_6105;
    float _6109 = _6035;
    float _6111 = _6039;
    float _6113 = _6037;
    float _6115 = _6057;
    float _6117 = _6103;
    if (!_6107)
    {
        float _6119 = _204 * _204;
        float _6121 = fma(_202, _202, _6119);
        float _6123 = fma(_206, _206, _6121);
        float _6125 = rsqrt(_6077);
        float _6127 = sqrt(_6123);
        float _6129 = _6047 * _6125;
        float _6131 = _6043 * _6125;
        float _6133 = _6057 * _6125;
        bool _6135 = _6127 > 0.0;
        bool _6137 = !_6135;
        _6115 = _6133;
        if (!_6137)
        {
            float _6139 = rsqrt(_6123);
            float _6141 = 1.0 / (*spvDescriptorSet0.vp_c10)._m0[2].z;
            float _6143 = _204 * _6139;
            float _6145 = _202 * _6139;
            float _6147 = _6131 * _6143;
            float _6149 = _206 * _6139;
            float _6151 = fma(_6129, _6145, _6147);
            float _6153 = _6141 * (*spvDescriptorSet0.vp_c9)._m0[142].x;
            float _6155 = fma(_6133, _6149, _6151);
            float _6157 = _6155 * _6153;
            float _6159 = fma(_202, _6157, _6037);
            float _6161 = fma(_204, _6157, _6035);
            float _6163 = fma(_206, _6157, _6039);
            _6109 = _6161;
            _6111 = _6163;
            _6113 = _6159;
        }
    }
    float _6165 = _6109;
    float _6167 = _6111;
    float _6169 = _6113;
    float _6171 = _6115;
    float _6173 = -_5323;
    float _6175 = fma(_6173, (*spvDescriptorSet0.vp_c9)._m0[18].w, _6165);
    float _6177 = -_5531;
    float _6179 = fma(_6177, (*spvDescriptorSet0.vp_c9)._m0[18].w, _6167);
    float _6181 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _6183 = _6103 * _6181;
    float _6185 = -_5327;
    float _6187 = fma(_6185, (*spvDescriptorSet0.vp_c9)._m0[18].w, _6169);
    float _6189 = _6171;
    float _6191 = _6187;
    float _6193 = _6179;
    float _6195 = _6169;
    float _6197 = _6165;
    if (_6091)
    {
        _6189 = 1.0;
    }
    float _6199 = _6189;
    float _6201 = _6199;
    if (_6073)
    {
        _6117 = _6175;
    }
    float _6203 = _6117;
    float _6205 = _6203;
    if (!_6073)
    {
        float _6207 = _5637 * _5637;
        float _6209 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _6211 = -_3815;
        float _6213 = _6211 + _6167;
        float _6215 = -_3779;
        float _6217 = _6215 + _6165;
        float _6219 = fma(_5643, _5643, _6207);
        float _6221 = fma(_5665, _5665, _6219);
        float _6223 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _6225 = sqrt(_6221);
        float _6227 = 1.0 / _5767;
        float _6229 = _6223 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _6231 = precise::min(_6225, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _6233 = _6231 * _6209;
        float _6235 = _6233 * _6227;
        float _6237 = -_3805;
        float _6239 = _6237 + _6169;
        float _6241 = _6229 * _6235;
        float _6243 = _6213 * _6235;
        float _6245 = fma(_6239, _6241, _5631);
        float _6247 = fma(_6217, _6241, _5625);
        float _6249 = fma(_6229, _6243, _5651);
        _6205 = _6247;
        _6191 = _6245;
        _6193 = _6249;
    }
    float _6251 = _6205;
    float _6253 = _6191;
    float _6255 = _6193;
    if (!_6091)
    {
        float _6257 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _6259 = _6257 * 0.15915493667125701904296875;
        float _6261 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _6263 = _6259 * 6.283185482025146484375;
        float _6265 = cos(_6263);
        float _6267 = _6261 * 0.15915493667125701904296875;
        float _6269 = _6259 * 6.283185482025146484375;
        float _6271 = sin(_6269);
        float _6273 = 1.0 / _6265;
        float _6275 = _6267 * 6.283185482025146484375;
        float _6277 = cos(_6275);
        float _6279 = _6271 * _6273;
        float _6281 = _6267 * 6.283185482025146484375;
        float _6283 = sin(_6281);
        float _6285 = _6277 * _6279;
        float _6287 = 1.0 / _6285;
        float _6289 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _6291 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _6289;
        float _6293 = 1.0 / _6291;
        float _6295 = _6283 * _6287;
        float _6297 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _6299 = fma(_6183, _6295, _6297);
        float _6301 = _6299 * _6293;
        float _6303 = precise::clamp(_6301, 0.0, 1.0);
        _6195 = _6259;
        _5983 = _6267;
        _6201 = _6303;
    }
    float _6305 = _6195;
    float _6307 = _5983;
    float _6309 = _6201;
    float _6311 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _6313 = _6251 + _6311;
    float _6315 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _6317 = _6253 + _6315;
    float _6319 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _6321 = _6255 + _6319;
    float _6323 = _6313 * _6313;
    float _6325 = fma(_6317, _6317, _6323);
    float _6327 = fma(_6321, _6321, _6325);
    float _6329 = rsqrt(_6327);
    float _6331 = sqrt(_6327);
    float _6333 = _6329 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _6335 = _6317 * _6333;
    float _6337 = _6321 * _6333;
    float _6339 = _6335 * _6335;
    float _6341 = _6337 * _6337;
    float _6343 = _6339 + _6341;
    float _6345 = sqrt(_6343);
    bool _6347 = _6345 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _6349 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _6351 = _6345 + _6349;
    float _6353 = _6329;
    float _6355 = _6351;
    float _6357 = _6305;
    float _6359 = _6313;
    if (_6347)
    {
        float _6361 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _6353 = _6361;
    }
    float _6363 = _6353;
    float _6365 = _6363;
    if (_6347)
    {
        float _6367 = _6351 * _6363;
        _6355 = _6367;
    }
    float _6369 = _6355;
    if (_6347)
    {
        float _6371 = rsqrt(_6343);
        _6365 = _6371;
    }
    float _6373 = _6365;
    float _6375 = _6373;
    if (_6347)
    {
        float _6377 = _6369 * 0.15915493667125701904296875;
        _6357 = _6377;
    }
    float _6379 = _6357;
    float _6381 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _6383 = _6321;
    if (_6347)
    {
        float _6385 = _6379 * 6.283185482025146484375;
        float _6387 = sin(_6385);
        _6383 = _6387;
    }
    float _6389 = _6383;
    float _6391 = precise::max(0.0, _6381);
    float _6393 = _6307;
    float _6395 = _6391;
    if (_6347)
    {
        float _6397 = _6379 * 6.283185482025146484375;
        float _6399 = cos(_6397);
        _6393 = _6399;
    }
    float _6401 = _6393;
    float _6403 = -_6333;
    float _6405 = -_6391;
    float _6407 = fma(_6313, _6403, _6405);
    if (_6347)
    {
        float _6409 = _6407 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _6359 = _6409;
    }
    float _6411 = _6359;
    float _6413 = _6389;
    float _6415 = _6411;
    if (_6347)
    {
        float _6417 = fma(_6389, _6411, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _210 = _6417;
    }
    float _6419 = _210;
    if (!_6347)
    {
        _6413 = _6407;
    }
    float _6421 = _6413;
    float _6423 = _6421;
    if (_6347)
    {
        float _6425 = _6373 * _6419;
        _6197 = _6425;
    }
    float _6427 = _6197;
    if (!_6347)
    {
        _6375 = _6335;
    }
    float _6429 = _6375;
    float _6431 = _6429;
    float _6433 = _6401;
    if (_6347)
    {
        float _6435 = _6401 + (-1.0);
        _6395 = _6435;
    }
    float _6437 = _6395;
    float _6439 = _6437;
    if (_6347)
    {
        float _6441 = _6335 * _6427;
        _6431 = _6441;
    }
    float _6443 = _6431;
    if (_6347)
    {
        float _6445 = _6437 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _6415 = _6445;
    }
    float _6447 = _6415;
    float _6449 = _6447;
    if (!_6347)
    {
        _6439 = _6337;
    }
    float _6451 = _6439;
    float _6453 = _6451;
    if (_6347)
    {
        float _6455 = _6337 * _6427;
        _6453 = _6455;
    }
    float _6457 = _6453;
    float _6459 = fma(_5631, (*spvDescriptorSet0.vp_c15)._m0[652].x, (*spvDescriptorSet0.vp_c15)._m0[652].z);
    if (_6347)
    {
        float _6461 = fma(_6407, _6401, _6447);
        _6423 = _6461;
    }
    float _6463 = _6423;
    if (!_6347)
    {
        _6449 = _6339;
    }
    float _6465 = _6449;
    float _6467 = _6465;
    if (_6347)
    {
        float _6469 = _6443 * _6443;
        _6467 = _6469;
    }
    float _6471 = _6467;
    if (!_6347)
    {
        _6433 = _6341;
    }
    float _6473 = _6433;
    float _6475 = _6473;
    if (_6347)
    {
        float _6477 = _6457 * _6457;
        _6475 = _6477;
    }
    float _6479 = _6475;
    float _6481 = fma(_6463, _6463, _6471);
    float _6483 = _6251 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _6485 = _6251 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _6487 = floor(_6459);
    float _6489 = _6481 + _6479;
    float _6491 = fma(_6253, (*spvDescriptorSet0.vp_c8)._m0[2].x, _6483);
    float _6493 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _6495 = fma(_6331, (*spvDescriptorSet0.vp_c15)._m0[23].w, _6493);
    float _6497 = precise::clamp(_6495, 0.0, 1.0);
    float _6499 = fma(_6253, (*spvDescriptorSet0.vp_c8)._m0[3].x, _6485);
    float _6501 = fma(_6255, (*spvDescriptorSet0.vp_c8)._m0[2].z, _6491);
    float _6503 = -_6497;
    float _6505 = _6503 + 1.0;
    float _6507 = rsqrt(_6489);
    float _6509 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _6511 = _6501 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _6513 = fma(_6255, (*spvDescriptorSet0.vp_c8)._m0[3].z, _6499);
    float _6515 = _6511 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _6517 = abs(_6505);
    float _6519 = log2(_6517);
    float _6521 = _6251 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _6523 = -_6515;
    float _6525 = fma(_6523, _6509, 1.0);
    float _6527 = _6251 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _6529 = _6513 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _6531 = fma(_6253, (*spvDescriptorSet0.vp_c8)._m0[1].x, _6521);
    float _6533 = fma(_5651, (*spvDescriptorSet0.vp_c15)._m0[652].y, (*spvDescriptorSet0.vp_c15)._m0[652].w);
    float _6535 = fma(_6253, (*spvDescriptorSet0.vp_c8)._m0[0].x, _6527);
    float _6537 = _6507 * _6443;
    float _6539 = fma(_6255, (*spvDescriptorSet0.vp_c8)._m0[1].z, _6531);
    float _6541 = _6507 * _6463;
    float _6543 = fma(_6255, (*spvDescriptorSet0.vp_c8)._m0[0].z, _6535);
    float _6545 = _6507 * _6457;
    float _6547 = _6539 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _6549 = _6537 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _6551 = _6543 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _6553 = floor(_6533);
    float _6555 = _6547 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _6557 = -_6549;
    float _6559 = fma(_6541, (*spvDescriptorSet0.vp_c15)._m0[21].y, _6557);
    float _6561 = _6519 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _6563 = -_6487;
    float _6565 = _6459 + _6563;
    float _6567 = fma(_6551, (*spvDescriptorSet0.vp_c8)._m0[7].x, _6555);
    float _6569 = -_6545;
    float _6571 = fma(_6569, (*spvDescriptorSet0.vp_c15)._m0[21].z, _6559);
    float _6573 = log2(_6525);
    float _6575 = fma(_6511, (*spvDescriptorSet0.vp_c8)._m0[7].z, _6567);
    float _6577 = fma(_6571, -0.5, 0.5);
    float _6579 = _6547 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _6581 = fma(_6571, 0.5, 0.5);
    float _6583 = fma(_6529, (*spvDescriptorSet0.vp_c8)._m0[7].w, _6575);
    float _6585 = fma(_6551, (*spvDescriptorSet0.vp_c8)._m0[4].x, _6579);
    float _6587 = exp2(_6561);
    float _6589 = _6547 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _6591 = fma(_6581, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _6593 = fma(_6511, (*spvDescriptorSet0.vp_c8)._m0[4].z, _6585);
    float _6595 = -_6553;
    float _6597 = _6533 + _6595;
    float _6599 = fma(_6551, (*spvDescriptorSet0.vp_c8)._m0[5].x, _6589);
    float _6601 = fma(_6581, _6591, -0.212114393711090087890625);
    float _6603 = fma(_6529, (*spvDescriptorSet0.vp_c8)._m0[4].w, _6593);
    float _6605 = 1.0 / _6583;
    float _6607 = fma(_6511, (*spvDescriptorSet0.vp_c8)._m0[5].z, _6599);
    float _6609 = _6573 * 0.693147182464599609375;
    float _6611 = sqrt(_6577);
    float _6613 = fma(_6529, (*spvDescriptorSet0.vp_c8)._m0[5].w, _6607);
    float2 _16992 = float2(_6565, _6597);
    float _6615 = dm_bs(spvDescriptorSet0.vp_t_tcb_24.sample(spvDescriptorSet0.vp_t_tcb_24Smplr, select(_16992, float2(0.0), isnan(_16992)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_24, spvDescriptorSet0.vp_t_tcb_24Smplr_w, select(_16992, float2(0.0), isnan(_16992)), level(0.0)).x;
    float _6617 = fma(_6581, _6601, 1.570728778839111328125);
    float _6619 = _6609 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _6621 = _6603 * _6605;
    float _6623 = _6541 + 1.0;
    float _6625 = _6613 * _6605;
    float _6627 = fma(_6621, 0.5, 0.5);
    float _6629 = -_6541;
    float _6631 = fma(_6587, _6623, _6629);
    float _6633 = fma(_6625, -0.5, 0.5);
    float _6635 = _6611 * 0.636619746685028076171875;
    float _6637 = fma(_6631, 0.5, 0.5);
    float3 _17034 = float3(_6627, _6633, _6619);
    float _6639 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_17034, float3(0.0), isnan(_17034)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_17034, float3(0.0), isnan(_17034)), level(0.0)).x;
    float3 _17045 = float3(_6627, _6633, _6619);
    float4 _6642 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_17045, float3(0.0), isnan(_17045)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_17045, float3(0.0), isnan(_17045)), level(0.0)).xyzw;
    float _6644 = _6642.x;
    float _6646 = _6642.y;
    float _6648 = _6642.z;
    float _6650 = _6642.w;
    float _6652 = -_6617;
    float _6654 = fma(_6635, _6652, 1.0);
    float2 _17066 = float2(_6654, _6637);
    float3 _6658 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_17066, float2(0.0), isnan(_17066)), level(0.0)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_17066, float2(0.0), isnan(_17066)), level(0.0)).xyz;
    float _6660 = _6658.x;
    float _6662 = _6658.y;
    float _6664 = _6658.z;
    float _6666 = abs(_6183);
    float _6668 = log2(_6666);
    float _6670 = in.m_85.x;
    float _6672 = in.m_85.y;
    float _6674 = in.m_85.z;
    bool _6676 = _5779 != 0.0;
    bool _6678 = isnan(_5779);
    bool _6680 = _6676 || _6678;
    bool _6682 = isnan(0.0);
    bool _6684 = _6680 || _6682;
    float _6686 = _5877 * _5945;
    float _6688 = in.m_87.x;
    float _6690 = in.m_87.y;
    float _6692 = in.m_87.z;
    float _6694 = in.m_87.w;
    bool _6696 = _5777 == 0.0;
    bool _6698 = !_6684;
    bool _6700 = _6696 && _6698;
    float _6702 = fma(_5895, _5905, _6686);
    out.m_89.x = _5631;
    out.m_89.y = _5625;
    out.m_89.z = _5651;
    bool _6704 = _5781 == 0.0;
    bool _6706 = _6704 && _6700;
    bool _6708 = _6183 <= 8000.0;
    bool _6710 = isnan(_6183);
    bool _6712 = _6708 || _6710;
    bool _6714 = isnan(8000.0);
    bool _6716 = _6712 || _6714;
    float _6718 = float(_6716);
    float _6720 = _6668 * (*spvDescriptorSet0.vp_c15)._m0[654].z;
    float _6722 = exp2(_6720);
    float _6724 = _6633;
    float _6726 = _6627;
    float _6728 = _6670;
    float _6730 = _6583;
    float _6732 = _6613;
    if (_6706)
    {
        _5621 = _6672;
    }
    float _6734 = _5621;
    float _6736 = _6734;
    if (_6706)
    {
        _4823 = _6670;
    }
    float _6738 = _4823;
    float _6740 = _6738;
    if (_6706)
    {
        _6724 = _6734;
    }
    float _6742 = _6724;
    float _6744 = _6742;
    if (!_6706)
    {
        _6736 = _6672;
    }
    float _6746 = _6736;
    if (_6706)
    {
        _6726 = _6738;
    }
    float _6748 = _6726;
    float _6750 = _6748;
    if (!_6706)
    {
        _6740 = _6670;
    }
    float _6752 = _6740;
    if (!_6706)
    {
        float _6754 = fma(_5779, (*spvDescriptorSet0.vp_c9)._m0[17].y, _6746);
        _6744 = _6754;
    }
    float _6756 = _6744;
    float _6758 = _6690 * _6674;
    float _6760 = fma(_6722, (*spvDescriptorSet0.vp_c15)._m0[654].x, (*spvDescriptorSet0.vp_c15)._m0[654].y);
    float _6762 = precise::clamp(_6760, 0.0, 1.0);
    if (_6706)
    {
        _6728 = _6674;
    }
    float _6764 = _6728;
    float _6766 = _6764;
    if (!_6706)
    {
        float _6768 = fma(_5777, (*spvDescriptorSet0.vp_c9)._m0[17].y, _6752);
        _6750 = _6768;
    }
    float _6770 = _6750;
    if (!_6706)
    {
        float _6772 = fma(_5781, (*spvDescriptorSet0.vp_c9)._m0[17].y, _6674);
        _6766 = _6772;
    }
    float _6774 = _6766;
    float _6776 = _6692 * _6752;
    float _6778 = _6688 * _6746;
    float _6780 = -_6758;
    float _6782 = fma(_6692, _6746, _6780);
    float _6784 = fma(_6762, -2.0, 3.0);
    float _6786 = _6762 * _6762;
    float _6788 = -_6776;
    float _6790 = fma(_6688, _6674, _6788);
    float _6792 = -_6778;
    float _6794 = fma(_6690, _6752, _6792);
    float _6796 = _5839 * _5925;
    float _6798 = _6786 * _6784;
    float _6800 = _5857 * _5925;
    float _6802 = _5857 * _5945;
    float _6804 = _6790 * _6694;
    float _6806 = _6782 * _6694;
    float _6808 = _5857 * _5921;
    float _6810 = _6794 * _6694;
    float _6812 = _5839 * _5945;
    float _6814 = _5839 * _5921;
    float _6816 = _5877 * _5925;
    float _6818 = _5877 * _5921;
    float _6820 = fma(_5885, _5903, _6796);
    float _6822 = -_5797;
    float _6824 = fma(_6822, _5903, _6800);
    float _6826 = -_5797;
    float _6828 = fma(_6826, _5905, _6802);
    float _6830 = -_5797;
    float _6832 = fma(_6830, _5907, _6808);
    float _6834 = fma(_5885, _5905, _6812);
    float _6836 = fma(_5885, _5907, _6814);
    float _6838 = -_6798;
    float _6840 = _6838 + 1.0;
    float _6842 = fma(_5863, _5799, _6820);
    float _6844 = fma(_5895, _5903, _6816);
    float _6846 = fma(_5895, _5907, _6818);
    float _6848 = fma(_5873, _5799, _6824);
    float _6850 = fma(_5873, _5803, _6828);
    float _6852 = fma(_5873, _5801, _6832);
    float _6854 = fma(_5863, _5803, _6834);
    float _6856 = fma(_6840, (*spvDescriptorSet0.vp_c15)._m0[654].w, _6798);
    float _6858 = fma(_5863, _5801, _6836);
    float _6860 = fma(_5843, _5803, _6702);
    float _6862 = fma(_5843, _5799, _6844);
    float _6864 = fma(_5843, _5801, _6846);
    float _6866 = _6848 * _6690;
    float _6868 = _6850 * _6690;
    float _6870 = _6852 * _6690;
    float _6872 = _6804 * _6848;
    float _6874 = _6804 * _6850;
    float _6876 = _6804 * _6852;
    float _6878 = _6547 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _6880 = _6718 * _6856;
    float _6882 = _6848 * _6756;
    float _6884 = _6850 * _6756;
    float _6886 = fma(_6551, (*spvDescriptorSet0.vp_c8)._m0[6].x, _6878);
    float _6888 = _6852 * _6756;
    float _6890 = fma(_6842, _6770, _6882);
    float _6892 = fma(_6842, _6688, _6866);
    float _6894 = fma(_6511, (*spvDescriptorSet0.vp_c8)._m0[6].z, _6886);
    float _6896 = _6519 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _6898 = fma(_6854, _6688, _6868);
    float _6900 = fma(_6806, _6842, _6872);
    float _6902 = fma(_6806, _6854, _6874);
    float _6904 = fma(_6806, _6858, _6876);
    float _6906 = exp2(_6896);
    float _6908 = fma(_6858, _6688, _6870);
    float _6910 = fma(_6854, _6770, _6884);
    float _6912 = fma(_6862, _6692, _6892);
    float _6914 = fma(_6860, _6692, _6898);
    float _6916 = fma(_6810, _6862, _6900);
    float _6918 = fma(_6810, _6860, _6902);
    float _6920 = fma(_6810, _6864, _6904);
    float _6922 = fma(_6864, _6692, _6908);
    float _6924 = in.m_91.x;
    float _6926 = _6880 * (*spvDescriptorSet0.vp_c15)._m0[653].x;
    float _6928 = fma(_6529, (*spvDescriptorSet0.vp_c8)._m0[6].w, _6894);
    float _6930 = fma(_6858, _6770, _6888);
    out.m_93.x = _6912;
    out.m_93.y = _6914;
    out.m_93.z = _6922;
    float _6932 = _6928 + _6583;
    float _6934 = -_6906;
    float _6936 = _6934 + 1.0;
    float _6938 = fma(_6860, _6774, _6910);
    out.m_95.x = _6916;
    out.m_95.y = _6918;
    out.m_95.z = _6920;
    float _6940 = _6932 * 0.5;
    float _6942 = _6936 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _6944 = fma(_6862, _6774, _6890);
    float _6946 = fma(_6864, _6774, _6930);
    bool _6948 = _6331 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _6950 = isnan(_6331);
    bool _6952 = _6948 || _6950;
    bool _6954 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _6956 = _6952 || _6954;
    float _6958 = -_6942;
    float _6960 = _6958 + 1.0;
    out.m_97.z = _6940;
    out.m_97.w = _6583;
    out.m_99.x = _6944;
    out.m_99.y = _6938;
    out.m_99.z = _6946;
    out.gl_Position.x = _6603;
    out.gl_Position.y = _6613;
    out.gl_Position.z = _6928;
    out.gl_Position.w = _6583;
    float _6962 = _6603;
    float _6964 = _6960;
    if (!_6956)
    {
        _5707 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _6966 = _5707;
    float _6968 = _6966;
    float _6970 = _6966;
    if (!_6956)
    {
        _5709 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _6972 = _5709;
    float _6974 = _6309 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _6976 = _6972;
    float _6978 = _6972;
    if (!_6956)
    {
        _6730 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _6980 = _6730;
    float _6982 = _6980;
    float _6984 = _6980;
    if (!_6956)
    {
        _6962 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _6986 = _6962;
    float _6988 = _6986;
    float _6990 = _6986;
    if (!_6956)
    {
        _6732 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _6992 = _6732;
    float _6994 = -_6615;
    float _6996 = _6994 + 1.0;
    float _6998 = _6996 * _6926;
    float _7000 = precise::clamp(_6998, 0.0, 1.0);
    float _7002 = -_7000;
    float _7004 = fma(_7002, (*spvDescriptorSet0.vp_c15)._m0[653].y, 1.0);
    float _7006 = _7004 * _6924;
    float _7008 = _6942 * _6639;
    float _7010 = _7006 * (*spvDescriptorSet0.vp_c13)._m0[1].w;
    float _7012 = _6650 * _6960;
    float _7014 = _6992;
    float _7016 = _6992;
    if (!_6956)
    {
        _6964 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _7018 = _6964;
    float _7020 = _6650 * _7008;
    out.m_101.x = _7010;
    float _7022 = _6664 * _7008;
    float _7024 = fma(_6660, _7020, _6644);
    float _7026 = fma(_6662, _7020, _6646);
    float _7028 = fma(_6650, _7022, _6648);
    out.m_103.x = _7024;
    out.m_103.y = _7026;
    out.m_103.z = _7028;
    out.m_103.w = _7012;
    bool _7030 = !_6956;
    float _7032 = _7018;
    float _7034 = _7018;
    if (!_7030)
    {
        bool _7036 = _6331 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _7038 = isnan(_6331);
        bool _7040 = _7036 || _7038;
        bool _7042 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _7044 = _7040 || _7042;
        if (!_7044)
        {
            float _7046 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _7048 = _6331 + _7046;
            float _7050 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _7052 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _7050;
            float _7054 = 1.0 / _7052;
            float _7056 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _7058 = _7056 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _7060 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _7062 = _7060 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _7064 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _7066 = _7064 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _7068 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _7070 = _7068 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _7072 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _7074 = _7072 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _7076 = _7048 * _7054;
            float _7078 = precise::clamp(_7076, 0.0, 1.0);
            float _7080 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _7082 = _7080 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _7084 = fma(_7078, _7062, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _7086 = fma(_7078, _7082, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _7088 = fma(_7078, _7058, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _7090 = fma(_7078, _7066, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _7092 = fma(_7078, _7070, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _7094 = fma(_7078, _7074, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            _6978 = _7088;
            _6990 = _7092;
            _6970 = _7086;
            _6984 = _7090;
            _7034 = _7084;
            _7016 = _7094;
            _7096 = true;
        }
        else
        {
            bool _7098 = _6331 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _7100 = isnan(_6331);
            bool _7102 = _7098 || _7100;
            bool _7104 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _7106 = _7102 || _7104;
            if (!_7106)
            {
                _6982 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _7108 = _6982;
            _6984 = _7108;
            if (!_7106)
            {
                _6988 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _7110 = _6988;
            _6990 = _7110;
            if (!_7106)
            {
                _7014 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _7112 = _7014;
            _7016 = _7112;
            if (!_7106)
            {
                _6968 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _7114 = _6968;
            _6970 = _7114;
            if (!_7106)
            {
                _6976 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _7116 = _6976;
            _6978 = _7116;
            if (!_7106)
            {
                _7032 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _7118 = _7032;
            bool _7120 = !_7106;
            _7034 = _7118;
            if (!_7120)
            {
                bool _7122 = _6331 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _7124 = isnan(_6331);
                bool _7126 = _7122 || _7124;
                bool _7128 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _7130 = _7126 || _7128;
                if (!_7130)
                {
                    float _7132 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _7134 = _6331 + _7132;
                    float _7136 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _7138 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _7136;
                    float _7140 = 1.0 / _7138;
                    float _7142 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _7144 = _7142 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _7146 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _7148 = _7146 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _7150 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _7152 = _7150 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _7154 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _7156 = _7154 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _7158 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _7160 = _7158 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _7162 = _7134 * _7140;
                    float _7164 = precise::clamp(_7162, 0.0, 1.0);
                    float _7166 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _7168 = _7166 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _7170 = fma(_7164, _7148, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _7172 = fma(_7164, _7168, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _7174 = fma(_7164, _7144, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _7176 = fma(_7164, _7152, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _7178 = fma(_7164, _7156, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _7180 = fma(_7164, _7160, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    _6978 = _7174;
                    _6990 = _7178;
                    _6970 = _7172;
                    _6984 = _7176;
                    _7034 = _7170;
                    _7016 = _7180;
                    _7096 = true;
                }
                else
                {
                    _6978 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _6990 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _6970 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _6984 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _7034 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _7016 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _7096 = false;
    float _7182 = _6978;
    float _7184 = _6990;
    float _7186 = _6970;
    float _7188 = _6984;
    float _7190 = _7034;
    float _7192 = _7016;
    float _7194 = fma(_6938, -0.5, 0.5);
    float _7196 = precise::clamp(_7194, 0.0, 1.0);
    float _7198 = -_7182;
    float _7200 = _7184 + _7198;
    float _7202 = _6974 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _7204 = -_7186;
    float _7206 = _7188 + _7204;
    float _7208 = fma(_7196, _7200, _7182);
    out.m_105.x = 0.0;
    float _7210 = -_7190;
    float _7212 = _7192 + _7210;
    float _7214 = fma(_7196, _7206, _7186);
    float _7216 = _7208 * 0.586610972881317138671875;
    out.m_49.x = _7202;
    bool _7218 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _7220 = fma(_7196, _7212, _7190);
    float _7222 = fma(_7214, 0.298911988735198974609375, _7216);
    bool _7224 = _6309 > 0.0;
    bool _7226 = isnan(_6309);
    bool _7228 = _7224 || _7226;
    bool _7230 = isnan(0.0);
    bool _7232 = _7228 || _7230;
    float _7234 = fma(_7220, 0.114477999508380889892578125, _7222);
    float _7236 = -_7234;
    float _7238 = _7214 + _7236;
    float _7240 = -_7234;
    float _7242 = _7208 + _7240;
    float _7244 = -_7234;
    float _7246 = _7220 + _7244;
    float _7248 = fma(_7238, (*spvDescriptorSet0.vp_c13)._m0[1].z, _7234);
    float _7250 = fma(_7242, (*spvDescriptorSet0.vp_c13)._m0[1].z, _7234);
    float _7252 = fma(_7246, (*spvDescriptorSet0.vp_c13)._m0[1].z, _7234);
    bool _7254 = !_7218;
    if (!_7254)
    {
        float _7256 = -_6251;
        float _7258 = _7256 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
        float _7260 = -_6253;
        float _7262 = _7260 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
        float _7264 = -_6255;
        float _7266 = _7264 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
        float _7268 = _7258 * _7258;
        float _7270 = fma(_7262, _7262, _7268);
        float _7272 = fma(_7266, _7266, _7270);
        float _7274 = sqrt(_7272);
        float _7276 = rsqrt(_7272);
        float _7278 = -_7274;
        float _7280 = _7278 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
        float _7282 = _7280 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
        float _7284 = precise::clamp(_7282, 0.0, 1.0);
        float _7286 = _7262 * _7276;
        float _7288 = _7258 * _7276;
        float _7290 = abs(_7284);
        float _7292 = log2(_7290);
        float _7294 = _7266 * _7276;
        float _7296 = _7286 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
        float _7298 = _6938 * _7288;
        float _7300 = -_7288;
        float _7302 = -_7296;
        float _7304 = fma(_7300, (*spvDescriptorSet0.vp_c15)._m0[656].y, _7302);
        float _7306 = fma(_6944, _7286, _7298);
        float _7308 = -_7294;
        float _7310 = fma(_7308, (*spvDescriptorSet0.vp_c15)._m0[656].z, _7304);
        float _7312 = fma(_6946, _7294, _7306);
        float _7314 = precise::clamp(_7312, 0.0, 1.0);
        float _7316 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
        float _7318 = _7310 + _7316;
        float _7320 = _7292 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
        float _7322 = _7318 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
        float _7324 = precise::clamp(_7322, 0.0, 1.0);
        float _7326 = exp2(_7320);
        float _7328 = _7326 * _7324;
        float _7330 = _7314 * _7328;
        float _7332 = _7330 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
        float _7334 = _7330 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
        float _7336 = _7330 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
        out.m_105.x = _7332;
        out.m_105.y = _7334;
        out.m_105.z = _7336;
    }
    out.m_107.x = _7248;
    out.m_107.y = _7250;
    out.m_107.z = _7252;
    if (_7232)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_59.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_59.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_59.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_59.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_61.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_61.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_61.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_61.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_67.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_67.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_67.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_67.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_71.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_71.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_71.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_71.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_79.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_79.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_79.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_79.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_81.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_81.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_81.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_81.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_89.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_89.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_89.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_89.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_73.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_73.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_73.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_73.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_77.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_77.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_77.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_77.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_95.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_95.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_95.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_95.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_99.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_99.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_99.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_99.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_97.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_97.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_97.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_97.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_49.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_49.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_49.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_49.w)); dm_cw(dm_gs, dm_p, 68, as_type<uint>(out.m_93.x)); dm_cw(dm_gs, dm_p, 69, as_type<uint>(out.m_93.y)); dm_cw(dm_gs, dm_p, 70, as_type<uint>(out.m_93.z)); dm_cw(dm_gs, dm_p, 71, as_type<uint>(out.m_93.w)); dm_cw(dm_gs, dm_p, 72, as_type<uint>(out.m_105.x)); dm_cw(dm_gs, dm_p, 73, as_type<uint>(out.m_105.y)); dm_cw(dm_gs, dm_p, 74, as_type<uint>(out.m_105.z)); dm_cw(dm_gs, dm_p, 75, as_type<uint>(out.m_105.w)); dm_cw(dm_gs, dm_p, 76, as_type<uint>(out.m_101.x)); dm_cw(dm_gs, dm_p, 77, as_type<uint>(out.m_101.y)); dm_cw(dm_gs, dm_p, 78, as_type<uint>(out.m_101.z)); dm_cw(dm_gs, dm_p, 79, as_type<uint>(out.m_101.w)); dm_cw(dm_gs, dm_p, 80, as_type<uint>(out.m_103.x)); dm_cw(dm_gs, dm_p, 81, as_type<uint>(out.m_103.y)); dm_cw(dm_gs, dm_p, 82, as_type<uint>(out.m_103.z)); dm_cw(dm_gs, dm_p, 83, as_type<uint>(out.m_103.w)); dm_cw(dm_gs, dm_p, 84, as_type<uint>(out.m_107.x)); dm_cw(dm_gs, dm_p, 85, as_type<uint>(out.m_107.y)); dm_cw(dm_gs, dm_p, 86, as_type<uint>(out.m_107.z)); dm_cw(dm_gs, dm_p, 87, as_type<uint>(out.m_107.w)); dm_cw(dm_gs, dm_p, 88, as_type<uint>(out.m_63.x)); dm_cw(dm_gs, dm_p, 89, as_type<uint>(out.m_63.y)); dm_cw(dm_gs, dm_p, 90, as_type<uint>(out.m_63.z)); dm_cw(dm_gs, dm_p, 91, as_type<uint>(out.m_63.w)); dm_cw(dm_gs, dm_p, 92, as_type<uint>(out.m_65.x)); dm_cw(dm_gs, dm_p, 93, as_type<uint>(out.m_65.y)); dm_cw(dm_gs, dm_p, 94, as_type<uint>(out.m_65.z)); dm_cw(dm_gs, dm_p, 95, as_type<uint>(out.m_65.w)); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _7338 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.m_49.x = 0.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _7338;
    { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_59.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_59.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_59.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_59.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_61.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_61.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_61.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_61.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_67.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_67.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_67.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_67.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_71.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_71.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_71.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_71.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_79.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_79.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_79.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_79.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_81.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_81.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_81.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_81.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_89.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_89.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_89.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_89.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_73.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_73.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_73.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_73.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_77.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_77.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_77.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_77.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_95.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_95.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_95.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_95.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_99.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_99.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_99.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_99.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_97.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_97.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_97.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_97.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_49.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_49.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_49.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_49.w)); dm_cw(dm_gs, dm_p, 68, as_type<uint>(out.m_93.x)); dm_cw(dm_gs, dm_p, 69, as_type<uint>(out.m_93.y)); dm_cw(dm_gs, dm_p, 70, as_type<uint>(out.m_93.z)); dm_cw(dm_gs, dm_p, 71, as_type<uint>(out.m_93.w)); dm_cw(dm_gs, dm_p, 72, as_type<uint>(out.m_105.x)); dm_cw(dm_gs, dm_p, 73, as_type<uint>(out.m_105.y)); dm_cw(dm_gs, dm_p, 74, as_type<uint>(out.m_105.z)); dm_cw(dm_gs, dm_p, 75, as_type<uint>(out.m_105.w)); dm_cw(dm_gs, dm_p, 76, as_type<uint>(out.m_101.x)); dm_cw(dm_gs, dm_p, 77, as_type<uint>(out.m_101.y)); dm_cw(dm_gs, dm_p, 78, as_type<uint>(out.m_101.z)); dm_cw(dm_gs, dm_p, 79, as_type<uint>(out.m_101.w)); dm_cw(dm_gs, dm_p, 80, as_type<uint>(out.m_103.x)); dm_cw(dm_gs, dm_p, 81, as_type<uint>(out.m_103.y)); dm_cw(dm_gs, dm_p, 82, as_type<uint>(out.m_103.z)); dm_cw(dm_gs, dm_p, 83, as_type<uint>(out.m_103.w)); dm_cw(dm_gs, dm_p, 84, as_type<uint>(out.m_107.x)); dm_cw(dm_gs, dm_p, 85, as_type<uint>(out.m_107.y)); dm_cw(dm_gs, dm_p, 86, as_type<uint>(out.m_107.z)); dm_cw(dm_gs, dm_p, 87, as_type<uint>(out.m_107.w)); dm_cw(dm_gs, dm_p, 88, as_type<uint>(out.m_63.x)); dm_cw(dm_gs, dm_p, 89, as_type<uint>(out.m_63.y)); dm_cw(dm_gs, dm_p, 90, as_type<uint>(out.m_63.z)); dm_cw(dm_gs, dm_p, 91, as_type<uint>(out.m_63.w)); dm_cw(dm_gs, dm_p, 92, as_type<uint>(out.m_65.x)); dm_cw(dm_gs, dm_p, 93, as_type<uint>(out.m_65.y)); dm_cw(dm_gs, dm_p, 94, as_type<uint>(out.m_65.z)); dm_cw(dm_gs, dm_p, 95, as_type<uint>(out.m_65.w)); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
}

