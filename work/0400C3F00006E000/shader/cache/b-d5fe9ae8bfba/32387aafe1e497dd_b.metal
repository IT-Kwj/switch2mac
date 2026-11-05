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
    bool _7134 = false;
    bool _1828 = false;
    bool _1498 = false;
    bool _1180 = false;
    bool _862 = false;
    bool _720 = false;
    bool _606 = false;
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
        float _7433 = as_type<float>(_142);
        out.gl_Position.z = _7433;
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
        float _7503 = as_type<float>(_180);
        out.gl_Position.z = _7503;
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
    float _462 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _464 = _460 + _462;
    float _466 = in.m_57.x;
    float _468 = in.m_57.y;
    float _470 = in.m_57.z;
    float _472 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _474 = _472 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _476 = _460 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _478 = isnan(_460);
    bool _480 = _476 || _478;
    bool _482 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _484 = _480 || _482;
    float _486 = float(_484);
    float _488 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _490 = _488 + (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _492 = _460 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _494 = isnan(_460);
    bool _496 = _492 || _494;
    bool _498 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _500 = _496 || _498;
    float _502 = float(_500);
    float _504 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _506 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _504;
    bool _508 = _460 >= (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _510 = isnan(_460);
    bool _512 = _508 || _510;
    bool _514 = isnan((*spvDescriptorSet0.vp_c9)._m0[117].w);
    bool _516 = _512 || _514;
    float _518 = float(_516);
    float _520 = 1.0 / _474;
    float _522 = -_486;
    float _524 = _522 + 1.0;
    bool _526 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].z;
    float _528 = _502 * _524;
    float _530 = -_502;
    float _532 = _530 + 1.0;
    float _534 = 1.0 / _490;
    float _536 = _506 * _520;
    float _538 = -(*spvDescriptorSet0.vp_c9)._m0[116].x;
    float _540 = _538 + (*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _542 = _428 * _468;
    float _544 = _430 * _470;
    float _546 = fma(_536, _464, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _548 = _426 * _466;
    float _550 = _540 * _534;
    float _552 = _546 * _528;
    float _554 = -_518;
    float _556 = _554 + 1.0;
    float _558 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _560 = _460 + _558;
    float _562 = fma(_532, (*spvDescriptorSet0.vp_c9)._m0[115].x, _552);
    float _564 = _486 * _556;
    float _566 = fma(_550, _560, (*spvDescriptorSet0.vp_c9)._m0[116].x);
    float _568 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _570 = fma(_566, _564, _562);
    float _572 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _574 = _568 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _576 = fma(_518, (*spvDescriptorSet0.vp_c9)._m0[117].x, _570);
    float _578 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _580 = _572 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _582 = _576 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _584 = _578 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    out.m_59.x = _574;
    out.m_59.y = _584;
    out.m_59.z = _580;
    out.m_59.w = _582;
    bool _586 = !_526;
    float _604;
    if (!_586)
    {
        float _588 = in.m_55.x;
        float _590 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].z;
        float _592 = _588 * (*spvDescriptorSet0.vp_c9)._m0[12].w;
        float _594 = fma(_592, (*spvDescriptorSet0.vp_c9)._m0[11].z, _160);
        float _596 = _594 * _590;
        float _598 = floor(_596);
        float _600 = -_598;
        float _602 = _596 + _600;
        _604 = _602;
        _606 = true;
    }
    else
    {
        float _608 = float(_126);
        float _610 = 1.0 / _608;
        float _612 = _160 * _610;
        _604 = _612;
    }
    _606 = false;
    float _614 = _604;
    float _616 = -(*spvDescriptorSet0.vp_c9)._m0[123].w;
    float _618 = _614 + _616;
    bool _620 = _614 >= (*spvDescriptorSet0.vp_c9)._m0[124].w;
    bool _622 = isnan(_614);
    bool _624 = _620 || _622;
    bool _626 = isnan((*spvDescriptorSet0.vp_c9)._m0[124].w);
    bool _628 = _624 || _626;
    float _630 = float(_628);
    float _632 = -(*spvDescriptorSet0.vp_c9)._m0[123].w;
    float _634 = (*spvDescriptorSet0.vp_c9)._m0[124].w + _632;
    bool _636 = _614 >= (*spvDescriptorSet0.vp_c9)._m0[123].w;
    bool _638 = isnan(_614);
    bool _640 = _636 || _638;
    bool _642 = isnan((*spvDescriptorSet0.vp_c9)._m0[123].w);
    bool _644 = _640 || _642;
    float _646 = float(_644);
    float _648 = -_630;
    float _650 = _648 + 1.0;
    float _652 = -(*spvDescriptorSet0.vp_c9)._m0[123].x;
    float _654 = (*spvDescriptorSet0.vp_c9)._m0[124].x + _652;
    float _656 = 1.0 / _634;
    bool _658 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].w;
    float _660 = _646 * _650;
    float _662 = -_646;
    float _664 = _662 + 1.0;
    float _666 = _618 * _656;
    float _668 = -(*spvDescriptorSet0.vp_c9)._m0[123].z;
    float _670 = (*spvDescriptorSet0.vp_c9)._m0[124].z + _668;
    float _672 = fma(_654, _666, (*spvDescriptorSet0.vp_c9)._m0[123].x);
    float _674 = -(*spvDescriptorSet0.vp_c9)._m0[123].y;
    float _676 = (*spvDescriptorSet0.vp_c9)._m0[124].y + _674;
    float _678 = fma(_670, _666, (*spvDescriptorSet0.vp_c9)._m0[123].z);
    float _680 = _672 * _660;
    float _682 = fma(_676, _666, (*spvDescriptorSet0.vp_c9)._m0[123].y);
    float _684 = _678 * _660;
    float _686 = _682 * _660;
    float _688 = fma(_664, (*spvDescriptorSet0.vp_c9)._m0[123].x, _680);
    float _690 = fma(_664, (*spvDescriptorSet0.vp_c9)._m0[123].y, _686);
    float _692 = fma(_664, (*spvDescriptorSet0.vp_c9)._m0[123].z, _684);
    float _694 = fma(_630, (*spvDescriptorSet0.vp_c9)._m0[124].x, _688);
    float _696 = fma(_630, (*spvDescriptorSet0.vp_c9)._m0[124].y, _690);
    float _698 = fma(_630, (*spvDescriptorSet0.vp_c9)._m0[124].z, _692);
    bool _700 = !_658;
    float _718;
    if (!_700)
    {
        float _702 = in.m_55.x;
        float _704 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].w;
        float _706 = _702 * (*spvDescriptorSet0.vp_c9)._m0[13].x;
        float _708 = fma(_706, (*spvDescriptorSet0.vp_c9)._m0[11].w, _160);
        float _710 = _708 * _704;
        float _712 = floor(_710);
        float _714 = -_712;
        float _716 = _710 + _714;
        _718 = _716;
        _720 = true;
    }
    else
    {
        float _722 = float(_126);
        float _724 = 1.0 / _722;
        float _726 = _160 * _724;
        _718 = _726;
    }
    _720 = false;
    float _728 = _718;
    float _730 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _732 = _728 + _730;
    float _734 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _736 = _734 + (*spvDescriptorSet0.vp_c9)._m0[132].w;
    bool _738 = _728 >= (*spvDescriptorSet0.vp_c9)._m0[132].w;
    bool _740 = isnan(_728);
    bool _742 = _738 || _740;
    bool _744 = isnan((*spvDescriptorSet0.vp_c9)._m0[132].w);
    bool _746 = _742 || _744;
    float _748 = float(_746);
    float _750 = -(*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _752 = _750 + (*spvDescriptorSet0.vp_c9)._m0[133].w;
    bool _754 = _728 >= (*spvDescriptorSet0.vp_c9)._m0[131].w;
    bool _756 = isnan(_728);
    bool _758 = _754 || _756;
    bool _760 = isnan((*spvDescriptorSet0.vp_c9)._m0[131].w);
    bool _762 = _758 || _760;
    float _764 = float(_762);
    float _766 = -(*spvDescriptorSet0.vp_c9)._m0[131].x;
    float _768 = (*spvDescriptorSet0.vp_c9)._m0[132].x + _766;
    bool _770 = _728 >= (*spvDescriptorSet0.vp_c9)._m0[133].w;
    bool _772 = isnan(_728);
    bool _774 = _770 || _772;
    bool _776 = isnan((*spvDescriptorSet0.vp_c9)._m0[133].w);
    bool _778 = _774 || _776;
    float _780 = float(_778);
    float _782 = 1.0 / _736;
    float _784 = -_748;
    float _786 = _784 + 1.0;
    bool _788 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[14].x;
    float _790 = _764 * _786;
    float _792 = -_764;
    float _794 = _792 + 1.0;
    float _796 = 1.0 / _752;
    float _798 = _768 * _782;
    float _800 = -(*spvDescriptorSet0.vp_c9)._m0[132].x;
    float _802 = _800 + (*spvDescriptorSet0.vp_c9)._m0[133].x;
    float _804 = fma(_798, _732, (*spvDescriptorSet0.vp_c9)._m0[131].x);
    float _806 = _802 * _796;
    float _808 = _804 * _790;
    float _810 = -_780;
    float _812 = _810 + 1.0;
    float _814 = -(*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _816 = _728 + _814;
    float _818 = _694 * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _820 = fma(_794, (*spvDescriptorSet0.vp_c9)._m0[131].x, _808);
    float _822 = _748 * _812;
    float _824 = fma(_806, _816, (*spvDescriptorSet0.vp_c9)._m0[132].x);
    float _826 = _698 * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _828 = fma(_824, _822, _820);
    float _830 = _696 * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _832 = _818 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _834 = _826 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _836 = fma(_780, (*spvDescriptorSet0.vp_c9)._m0[133].x, _828);
    float _838 = _830 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _840 = _836 * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    out.m_61.x = _832;
    out.m_61.y = _838;
    out.m_61.z = _834;
    out.m_61.w = _840;
    bool _842 = !_788;
    float _860;
    if (!_842)
    {
        float _844 = in.m_55.x;
        float _846 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[14].x;
        float _848 = _844 * (*spvDescriptorSet0.vp_c9)._m0[15].x;
        float _850 = fma(_848, (*spvDescriptorSet0.vp_c9)._m0[14].x, _160);
        float _852 = _850 * _846;
        float _854 = floor(_852);
        float _856 = -_854;
        float _858 = _852 + _856;
        _860 = _858;
        _862 = true;
    }
    else
    {
        float _864 = float(_126);
        float _866 = 1.0 / _864;
        float _868 = _160 * _866;
        _860 = _868;
    }
    _862 = false;
    float _870 = _860;
    float _872 = -(*spvDescriptorSet0.vp_c9)._m0[159].w;
    float _874 = _870 + _872;
    bool _876 = _870 >= (*spvDescriptorSet0.vp_c9)._m0[165].w;
    bool _878 = isnan(_870);
    bool _880 = _876 || _878;
    bool _882 = isnan((*spvDescriptorSet0.vp_c9)._m0[165].w);
    bool _884 = _880 || _882;
    float _886 = float(_884);
    float _888 = -(*spvDescriptorSet0.vp_c9)._m0[159].w;
    float _890 = _888 + (*spvDescriptorSet0.vp_c9)._m0[160].w;
    bool _892 = _870 >= (*spvDescriptorSet0.vp_c9)._m0[164].w;
    bool _894 = isnan(_870);
    bool _896 = _892 || _894;
    bool _898 = isnan((*spvDescriptorSet0.vp_c9)._m0[164].w);
    bool _900 = _896 || _898;
    float _902 = float(_900);
    float _904 = -(*spvDescriptorSet0.vp_c9)._m0[159].x;
    float _906 = (*spvDescriptorSet0.vp_c9)._m0[160].x + _904;
    bool _908 = _870 >= (*spvDescriptorSet0.vp_c9)._m0[163].w;
    bool _910 = isnan(_870);
    bool _912 = _908 || _910;
    bool _914 = isnan((*spvDescriptorSet0.vp_c9)._m0[163].w);
    bool _916 = _912 || _914;
    float _918 = float(_916);
    float _920 = -_886;
    float _922 = _920 + 1.0;
    float _924 = 1.0 / _890;
    float _926 = _902 * _922;
    float _928 = -_918;
    float _930 = _928 + 1.0;
    float _932 = -(*spvDescriptorSet0.vp_c9)._m0[160].w;
    float _934 = _932 + (*spvDescriptorSet0.vp_c9)._m0[161].w;
    bool _936 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[14].y;
    float _938 = 1.0 / _934;
    float _940 = _906 * _924;
    float _942 = -_902;
    float _944 = _942 + 1.0;
    bool _946 = _870 >= (*spvDescriptorSet0.vp_c9)._m0[162].w;
    bool _948 = isnan(_870);
    bool _950 = _946 || _948;
    bool _952 = isnan((*spvDescriptorSet0.vp_c9)._m0[162].w);
    bool _954 = _950 || _952;
    float _956 = float(_954);
    float _958 = fma(_940, _874, (*spvDescriptorSet0.vp_c9)._m0[159].x);
    float _960 = _918 * _944;
    bool _962 = _870 >= (*spvDescriptorSet0.vp_c9)._m0[161].w;
    bool _964 = isnan(_870);
    bool _966 = _962 || _964;
    bool _968 = isnan((*spvDescriptorSet0.vp_c9)._m0[161].w);
    bool _970 = _966 || _968;
    float _972 = float(_970);
    float _974 = _956 * _930;
    float _976 = -_956;
    float _978 = _976 + 1.0;
    float _980 = -(*spvDescriptorSet0.vp_c9)._m0[161].w;
    float _982 = _980 + (*spvDescriptorSet0.vp_c9)._m0[162].w;
    bool _984 = _870 >= (*spvDescriptorSet0.vp_c9)._m0[160].w;
    bool _986 = isnan(_870);
    bool _988 = _984 || _986;
    bool _990 = isnan((*spvDescriptorSet0.vp_c9)._m0[160].w);
    bool _992 = _988 || _990;
    float _994 = float(_992);
    float _996 = _972 * _978;
    float _998 = -_972;
    float _1000 = _998 + 1.0;
    float _1002 = -(*spvDescriptorSet0.vp_c9)._m0[162].w;
    float _1004 = _1002 + (*spvDescriptorSet0.vp_c9)._m0[163].w;
    float _1006 = 1.0 / _982;
    bool _1008 = _870 >= (*spvDescriptorSet0.vp_c9)._m0[159].w;
    bool _1010 = isnan(_870);
    bool _1012 = _1008 || _1010;
    bool _1014 = isnan((*spvDescriptorSet0.vp_c9)._m0[159].w);
    bool _1016 = _1012 || _1014;
    float _1018 = float(_1016);
    float _1020 = _994 * _1000;
    float _1022 = -_994;
    float _1024 = _1022 + 1.0;
    float _1026 = -(*spvDescriptorSet0.vp_c9)._m0[163].w;
    float _1028 = _1026 + (*spvDescriptorSet0.vp_c9)._m0[164].w;
    float _1030 = -(*spvDescriptorSet0.vp_c9)._m0[160].x;
    float _1032 = _1030 + (*spvDescriptorSet0.vp_c9)._m0[161].x;
    float _1034 = _1018 * _1024;
    float _1036 = 1.0 / _1004;
    float _1038 = _1032 * _938;
    float _1040 = _958 * _1034;
    float _1042 = -_1018;
    float _1044 = _1042 + 1.0;
    float _1046 = -(*spvDescriptorSet0.vp_c9)._m0[164].w;
    float _1048 = _1046 + (*spvDescriptorSet0.vp_c9)._m0[165].w;
    float _1050 = -(*spvDescriptorSet0.vp_c9)._m0[160].w;
    float _1052 = _870 + _1050;
    float _1054 = 1.0 / _1028;
    float _1056 = -(*spvDescriptorSet0.vp_c9)._m0[161].x;
    float _1058 = (*spvDescriptorSet0.vp_c9)._m0[162].x + _1056;
    float _1060 = fma(_1044, (*spvDescriptorSet0.vp_c9)._m0[159].x, _1040);
    float _1062 = -(*spvDescriptorSet0.vp_c9)._m0[165].w;
    float _1064 = _1062 + (*spvDescriptorSet0.vp_c9)._m0[166].w;
    float _1066 = fma(_1038, _1052, (*spvDescriptorSet0.vp_c9)._m0[160].x);
    float _1068 = _1058 * _1006;
    float _1070 = -(*spvDescriptorSet0.vp_c9)._m0[161].w;
    float _1072 = _870 + _1070;
    float _1074 = 1.0 / _1048;
    float _1076 = -(*spvDescriptorSet0.vp_c9)._m0[162].x;
    float _1078 = _1076 + (*spvDescriptorSet0.vp_c9)._m0[163].x;
    float _1080 = fma(_1068, _1072, (*spvDescriptorSet0.vp_c9)._m0[161].x);
    float _1082 = fma(_1066, _1020, _1060);
    float _1084 = -(*spvDescriptorSet0.vp_c9)._m0[163].x;
    float _1086 = (*spvDescriptorSet0.vp_c9)._m0[164].x + _1084;
    float _1088 = _1078 * _1036;
    float _1090 = -(*spvDescriptorSet0.vp_c9)._m0[162].w;
    float _1092 = _870 + _1090;
    float _1094 = 1.0 / _1064;
    float _1096 = fma(_1080, _996, _1082);
    float _1098 = _1086 * _1054;
    float _1100 = -(*spvDescriptorSet0.vp_c9)._m0[163].w;
    float _1102 = _870 + _1100;
    float _1104 = -(*spvDescriptorSet0.vp_c9)._m0[164].x;
    float _1106 = _1104 + (*spvDescriptorSet0.vp_c9)._m0[165].x;
    float _1108 = fma(_1088, _1092, (*spvDescriptorSet0.vp_c9)._m0[162].x);
    float _1110 = -(*spvDescriptorSet0.vp_c9)._m0[164].w;
    float _1112 = _870 + _1110;
    float _1114 = fma(_1098, _1102, (*spvDescriptorSet0.vp_c9)._m0[163].x);
    float _1116 = _1106 * _1074;
    float _1118 = -(*spvDescriptorSet0.vp_c9)._m0[165].x;
    float _1120 = (*spvDescriptorSet0.vp_c9)._m0[166].x + _1118;
    bool _1122 = _870 >= (*spvDescriptorSet0.vp_c9)._m0[166].w;
    bool _1124 = isnan(_870);
    bool _1126 = _1122 || _1124;
    bool _1128 = isnan((*spvDescriptorSet0.vp_c9)._m0[166].w);
    bool _1130 = _1126 || _1128;
    float _1132 = float(_1130);
    float _1134 = fma(_1108, _974, _1096);
    float _1136 = fma(_1116, _1112, (*spvDescriptorSet0.vp_c9)._m0[164].x);
    float _1138 = -(*spvDescriptorSet0.vp_c9)._m0[165].w;
    float _1140 = _870 + _1138;
    float _1142 = -_1132;
    float _1144 = _1142 + 1.0;
    float _1146 = _1120 * _1094;
    float _1148 = fma(_1114, _960, _1134);
    float _1150 = _886 * _1144;
    float _1152 = fma(_1146, _1140, (*spvDescriptorSet0.vp_c9)._m0[165].x);
    float _1154 = fma(_1136, _926, _1148);
    float _1156 = fma(_1152, _1150, _1154);
    float _1158 = fma(_1132, (*spvDescriptorSet0.vp_c9)._m0[166].x, _1156);
    out.m_63.x = _1158;
    bool _1160 = !_936;
    float _1178;
    if (!_1160)
    {
        float _1162 = in.m_55.x;
        float _1164 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[14].y;
        float _1166 = _1162 * (*spvDescriptorSet0.vp_c9)._m0[15].y;
        float _1168 = fma(_1166, (*spvDescriptorSet0.vp_c9)._m0[14].y, _160);
        float _1170 = _1168 * _1164;
        float _1172 = floor(_1170);
        float _1174 = -_1172;
        float _1176 = _1170 + _1174;
        _1178 = _1176;
        _1180 = true;
    }
    else
    {
        float _1182 = float(_126);
        float _1184 = 1.0 / _1182;
        float _1186 = _160 * _1184;
        _1178 = _1186;
    }
    _1180 = false;
    float _1188 = _1178;
    float _1190 = -(*spvDescriptorSet0.vp_c9)._m0[167].w;
    float _1192 = _1188 + _1190;
    bool _1194 = _1188 >= (*spvDescriptorSet0.vp_c9)._m0[173].w;
    bool _1196 = isnan(_1188);
    bool _1198 = _1194 || _1196;
    bool _1200 = isnan((*spvDescriptorSet0.vp_c9)._m0[173].w);
    bool _1202 = _1198 || _1200;
    float _1204 = float(_1202);
    float _1206 = -(*spvDescriptorSet0.vp_c9)._m0[167].w;
    float _1208 = _1206 + (*spvDescriptorSet0.vp_c9)._m0[168].w;
    bool _1210 = _1188 >= (*spvDescriptorSet0.vp_c9)._m0[172].w;
    bool _1212 = isnan(_1188);
    bool _1214 = _1210 || _1212;
    bool _1216 = isnan((*spvDescriptorSet0.vp_c9)._m0[172].w);
    bool _1218 = _1214 || _1216;
    float _1220 = float(_1218);
    float _1222 = -(*spvDescriptorSet0.vp_c9)._m0[167].x;
    float _1224 = (*spvDescriptorSet0.vp_c9)._m0[168].x + _1222;
    bool _1226 = _1188 >= (*spvDescriptorSet0.vp_c9)._m0[171].w;
    bool _1228 = isnan(_1188);
    bool _1230 = _1226 || _1228;
    bool _1232 = isnan((*spvDescriptorSet0.vp_c9)._m0[171].w);
    bool _1234 = _1230 || _1232;
    float _1236 = float(_1234);
    float _1238 = -_1204;
    float _1240 = _1238 + 1.0;
    float _1242 = 1.0 / _1208;
    float _1244 = _1220 * _1240;
    float _1246 = -_1236;
    float _1248 = _1246 + 1.0;
    float _1250 = -(*spvDescriptorSet0.vp_c9)._m0[168].w;
    float _1252 = _1250 + (*spvDescriptorSet0.vp_c9)._m0[169].w;
    bool _1254 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[14].z;
    float _1256 = 1.0 / _1252;
    float _1258 = _1224 * _1242;
    float _1260 = -_1220;
    float _1262 = _1260 + 1.0;
    bool _1264 = _1188 >= (*spvDescriptorSet0.vp_c9)._m0[170].w;
    bool _1266 = isnan(_1188);
    bool _1268 = _1264 || _1266;
    bool _1270 = isnan((*spvDescriptorSet0.vp_c9)._m0[170].w);
    bool _1272 = _1268 || _1270;
    float _1274 = float(_1272);
    float _1276 = fma(_1258, _1192, (*spvDescriptorSet0.vp_c9)._m0[167].x);
    float _1278 = _1236 * _1262;
    bool _1280 = _1188 >= (*spvDescriptorSet0.vp_c9)._m0[169].w;
    bool _1282 = isnan(_1188);
    bool _1284 = _1280 || _1282;
    bool _1286 = isnan((*spvDescriptorSet0.vp_c9)._m0[169].w);
    bool _1288 = _1284 || _1286;
    float _1290 = float(_1288);
    float _1292 = _1274 * _1248;
    float _1294 = -_1274;
    float _1296 = _1294 + 1.0;
    float _1298 = -(*spvDescriptorSet0.vp_c9)._m0[169].w;
    float _1300 = _1298 + (*spvDescriptorSet0.vp_c9)._m0[170].w;
    bool _1302 = _1188 >= (*spvDescriptorSet0.vp_c9)._m0[168].w;
    bool _1304 = isnan(_1188);
    bool _1306 = _1302 || _1304;
    bool _1308 = isnan((*spvDescriptorSet0.vp_c9)._m0[168].w);
    bool _1310 = _1306 || _1308;
    float _1312 = float(_1310);
    float _1314 = _1290 * _1296;
    float _1316 = -_1290;
    float _1318 = _1316 + 1.0;
    float _1320 = -(*spvDescriptorSet0.vp_c9)._m0[170].w;
    float _1322 = _1320 + (*spvDescriptorSet0.vp_c9)._m0[171].w;
    float _1324 = 1.0 / _1300;
    bool _1326 = _1188 >= (*spvDescriptorSet0.vp_c9)._m0[167].w;
    bool _1328 = isnan(_1188);
    bool _1330 = _1326 || _1328;
    bool _1332 = isnan((*spvDescriptorSet0.vp_c9)._m0[167].w);
    bool _1334 = _1330 || _1332;
    float _1336 = float(_1334);
    float _1338 = _1312 * _1318;
    float _1340 = -_1312;
    float _1342 = _1340 + 1.0;
    float _1344 = -(*spvDescriptorSet0.vp_c9)._m0[171].w;
    float _1346 = _1344 + (*spvDescriptorSet0.vp_c9)._m0[172].w;
    float _1348 = -(*spvDescriptorSet0.vp_c9)._m0[168].x;
    float _1350 = _1348 + (*spvDescriptorSet0.vp_c9)._m0[169].x;
    float _1352 = _1336 * _1342;
    float _1354 = 1.0 / _1322;
    float _1356 = _1350 * _1256;
    float _1358 = _1276 * _1352;
    float _1360 = -_1336;
    float _1362 = _1360 + 1.0;
    float _1364 = -(*spvDescriptorSet0.vp_c9)._m0[172].w;
    float _1366 = _1364 + (*spvDescriptorSet0.vp_c9)._m0[173].w;
    float _1368 = -(*spvDescriptorSet0.vp_c9)._m0[168].w;
    float _1370 = _1188 + _1368;
    float _1372 = 1.0 / _1346;
    float _1374 = -(*spvDescriptorSet0.vp_c9)._m0[169].x;
    float _1376 = (*spvDescriptorSet0.vp_c9)._m0[170].x + _1374;
    float _1378 = fma(_1362, (*spvDescriptorSet0.vp_c9)._m0[167].x, _1358);
    float _1380 = -(*spvDescriptorSet0.vp_c9)._m0[173].w;
    float _1382 = _1380 + (*spvDescriptorSet0.vp_c9)._m0[174].w;
    float _1384 = fma(_1356, _1370, (*spvDescriptorSet0.vp_c9)._m0[168].x);
    float _1386 = _1376 * _1324;
    float _1388 = -(*spvDescriptorSet0.vp_c9)._m0[169].w;
    float _1390 = _1188 + _1388;
    float _1392 = 1.0 / _1366;
    float _1394 = -(*spvDescriptorSet0.vp_c9)._m0[170].x;
    float _1396 = _1394 + (*spvDescriptorSet0.vp_c9)._m0[171].x;
    float _1398 = fma(_1386, _1390, (*spvDescriptorSet0.vp_c9)._m0[169].x);
    float _1400 = fma(_1384, _1338, _1378);
    float _1402 = -(*spvDescriptorSet0.vp_c9)._m0[171].x;
    float _1404 = (*spvDescriptorSet0.vp_c9)._m0[172].x + _1402;
    float _1406 = _1396 * _1354;
    float _1408 = -(*spvDescriptorSet0.vp_c9)._m0[170].w;
    float _1410 = _1188 + _1408;
    float _1412 = 1.0 / _1382;
    float _1414 = fma(_1398, _1314, _1400);
    float _1416 = _1404 * _1372;
    float _1418 = -(*spvDescriptorSet0.vp_c9)._m0[171].w;
    float _1420 = _1188 + _1418;
    float _1422 = -(*spvDescriptorSet0.vp_c9)._m0[172].x;
    float _1424 = _1422 + (*spvDescriptorSet0.vp_c9)._m0[173].x;
    float _1426 = fma(_1406, _1410, (*spvDescriptorSet0.vp_c9)._m0[170].x);
    float _1428 = -(*spvDescriptorSet0.vp_c9)._m0[172].w;
    float _1430 = _1188 + _1428;
    float _1432 = fma(_1416, _1420, (*spvDescriptorSet0.vp_c9)._m0[171].x);
    float _1434 = _1424 * _1392;
    float _1436 = -(*spvDescriptorSet0.vp_c9)._m0[173].x;
    float _1438 = (*spvDescriptorSet0.vp_c9)._m0[174].x + _1436;
    bool _1440 = _1188 >= (*spvDescriptorSet0.vp_c9)._m0[174].w;
    bool _1442 = isnan(_1188);
    bool _1444 = _1440 || _1442;
    bool _1446 = isnan((*spvDescriptorSet0.vp_c9)._m0[174].w);
    bool _1448 = _1444 || _1446;
    float _1450 = float(_1448);
    float _1452 = fma(_1426, _1292, _1414);
    float _1454 = fma(_1434, _1430, (*spvDescriptorSet0.vp_c9)._m0[172].x);
    float _1456 = -(*spvDescriptorSet0.vp_c9)._m0[173].w;
    float _1458 = _1188 + _1456;
    float _1460 = -_1450;
    float _1462 = _1460 + 1.0;
    float _1464 = _1438 * _1412;
    float _1466 = fma(_1432, _1278, _1452);
    float _1468 = _1204 * _1462;
    float _1470 = fma(_1464, _1458, (*spvDescriptorSet0.vp_c9)._m0[173].x);
    float _1472 = fma(_1454, _1244, _1466);
    float _1474 = fma(_1470, _1468, _1472);
    float _1476 = fma(_1450, (*spvDescriptorSet0.vp_c9)._m0[174].x, _1474);
    out.m_65.x = _1476;
    bool _1478 = !_1254;
    float _1496;
    if (!_1478)
    {
        float _1480 = in.m_55.x;
        float _1482 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[14].z;
        float _1484 = _1480 * (*spvDescriptorSet0.vp_c9)._m0[15].z;
        float _1486 = fma(_1484, (*spvDescriptorSet0.vp_c9)._m0[14].z, _160);
        float _1488 = _1486 * _1482;
        float _1490 = floor(_1488);
        float _1492 = -_1490;
        float _1494 = _1488 + _1492;
        _1496 = _1494;
        _1498 = true;
    }
    else
    {
        float _1500 = float(_126);
        float _1502 = 1.0 / _1500;
        float _1504 = _160 * _1502;
        _1496 = _1504;
    }
    _1498 = false;
    float _1506 = _1496;
    float _1508 = -(*spvDescriptorSet0.vp_c9)._m0[175].w;
    float _1510 = _1506 + _1508;
    bool _1512 = _1506 >= (*spvDescriptorSet0.vp_c9)._m0[181].w;
    bool _1514 = isnan(_1506);
    bool _1516 = _1512 || _1514;
    bool _1518 = isnan((*spvDescriptorSet0.vp_c9)._m0[181].w);
    bool _1520 = _1516 || _1518;
    float _1522 = float(_1520);
    float _1524 = -(*spvDescriptorSet0.vp_c9)._m0[175].w;
    float _1526 = _1524 + (*spvDescriptorSet0.vp_c9)._m0[176].w;
    bool _1528 = _1506 >= (*spvDescriptorSet0.vp_c9)._m0[180].w;
    bool _1530 = isnan(_1506);
    bool _1532 = _1528 || _1530;
    bool _1534 = isnan((*spvDescriptorSet0.vp_c9)._m0[180].w);
    bool _1536 = _1532 || _1534;
    float _1538 = float(_1536);
    float _1540 = -(*spvDescriptorSet0.vp_c9)._m0[175].x;
    float _1542 = (*spvDescriptorSet0.vp_c9)._m0[176].x + _1540;
    bool _1544 = _1506 >= (*spvDescriptorSet0.vp_c9)._m0[179].w;
    bool _1546 = isnan(_1506);
    bool _1548 = _1544 || _1546;
    bool _1550 = isnan((*spvDescriptorSet0.vp_c9)._m0[179].w);
    bool _1552 = _1548 || _1550;
    float _1554 = float(_1552);
    float _1556 = -_1522;
    float _1558 = _1556 + 1.0;
    float _1560 = 1.0 / _1526;
    float _1562 = _1538 * _1558;
    float _1564 = -_1554;
    float _1566 = _1564 + 1.0;
    float _1568 = -(*spvDescriptorSet0.vp_c9)._m0[176].w;
    float _1570 = _1568 + (*spvDescriptorSet0.vp_c9)._m0[177].w;
    bool _1572 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[14].w;
    float _1574 = 1.0 / _1570;
    float _1576 = _1542 * _1560;
    float _1578 = -_1538;
    float _1580 = _1578 + 1.0;
    bool _1582 = _1506 >= (*spvDescriptorSet0.vp_c9)._m0[178].w;
    bool _1584 = isnan(_1506);
    bool _1586 = _1582 || _1584;
    bool _1588 = isnan((*spvDescriptorSet0.vp_c9)._m0[178].w);
    bool _1590 = _1586 || _1588;
    float _1592 = float(_1590);
    float _1594 = fma(_1576, _1510, (*spvDescriptorSet0.vp_c9)._m0[175].x);
    float _1596 = _1554 * _1580;
    bool _1598 = _1506 >= (*spvDescriptorSet0.vp_c9)._m0[177].w;
    bool _1600 = isnan(_1506);
    bool _1602 = _1598 || _1600;
    bool _1604 = isnan((*spvDescriptorSet0.vp_c9)._m0[177].w);
    bool _1606 = _1602 || _1604;
    float _1608 = float(_1606);
    float _1610 = _1592 * _1566;
    float _1612 = -_1592;
    float _1614 = _1612 + 1.0;
    float _1616 = -(*spvDescriptorSet0.vp_c9)._m0[177].w;
    float _1618 = _1616 + (*spvDescriptorSet0.vp_c9)._m0[178].w;
    bool _1620 = _1506 >= (*spvDescriptorSet0.vp_c9)._m0[176].w;
    bool _1622 = isnan(_1506);
    bool _1624 = _1620 || _1622;
    bool _1626 = isnan((*spvDescriptorSet0.vp_c9)._m0[176].w);
    bool _1628 = _1624 || _1626;
    float _1630 = float(_1628);
    float _1632 = _1608 * _1614;
    float _1634 = -_1608;
    float _1636 = _1634 + 1.0;
    float _1638 = -(*spvDescriptorSet0.vp_c9)._m0[178].w;
    float _1640 = _1638 + (*spvDescriptorSet0.vp_c9)._m0[179].w;
    float _1642 = 1.0 / _1618;
    bool _1644 = _1506 >= (*spvDescriptorSet0.vp_c9)._m0[175].w;
    bool _1646 = isnan(_1506);
    bool _1648 = _1644 || _1646;
    bool _1650 = isnan((*spvDescriptorSet0.vp_c9)._m0[175].w);
    bool _1652 = _1648 || _1650;
    float _1654 = float(_1652);
    float _1656 = _1630 * _1636;
    float _1658 = -_1630;
    float _1660 = _1658 + 1.0;
    float _1662 = -(*spvDescriptorSet0.vp_c9)._m0[179].w;
    float _1664 = _1662 + (*spvDescriptorSet0.vp_c9)._m0[180].w;
    float _1666 = -(*spvDescriptorSet0.vp_c9)._m0[176].x;
    float _1668 = _1666 + (*spvDescriptorSet0.vp_c9)._m0[177].x;
    float _1670 = _1654 * _1660;
    float _1672 = 1.0 / _1640;
    float _1674 = _1668 * _1574;
    float _1676 = _1594 * _1670;
    float _1678 = -_1654;
    float _1680 = _1678 + 1.0;
    float _1682 = -(*spvDescriptorSet0.vp_c9)._m0[180].w;
    float _1684 = _1682 + (*spvDescriptorSet0.vp_c9)._m0[181].w;
    float _1686 = -(*spvDescriptorSet0.vp_c9)._m0[176].w;
    float _1688 = _1506 + _1686;
    float _1690 = 1.0 / _1664;
    float _1692 = -(*spvDescriptorSet0.vp_c9)._m0[177].x;
    float _1694 = (*spvDescriptorSet0.vp_c9)._m0[178].x + _1692;
    float _1696 = fma(_1680, (*spvDescriptorSet0.vp_c9)._m0[175].x, _1676);
    float _1698 = -(*spvDescriptorSet0.vp_c9)._m0[181].w;
    float _1700 = _1698 + (*spvDescriptorSet0.vp_c9)._m0[182].w;
    float _1702 = fma(_1674, _1688, (*spvDescriptorSet0.vp_c9)._m0[176].x);
    float _1704 = _1694 * _1642;
    float _1706 = -(*spvDescriptorSet0.vp_c9)._m0[177].w;
    float _1708 = _1506 + _1706;
    float _1710 = 1.0 / _1684;
    float _1712 = -(*spvDescriptorSet0.vp_c9)._m0[178].x;
    float _1714 = _1712 + (*spvDescriptorSet0.vp_c9)._m0[179].x;
    float _1716 = fma(_1704, _1708, (*spvDescriptorSet0.vp_c9)._m0[177].x);
    float _1718 = fma(_1702, _1656, _1696);
    float _1720 = -(*spvDescriptorSet0.vp_c9)._m0[179].x;
    float _1722 = (*spvDescriptorSet0.vp_c9)._m0[180].x + _1720;
    float _1724 = _1714 * _1672;
    float _1726 = -(*spvDescriptorSet0.vp_c9)._m0[178].w;
    float _1728 = _1506 + _1726;
    float _1730 = 1.0 / _1700;
    float _1732 = fma(_1716, _1632, _1718);
    float _1734 = _1722 * _1690;
    float _1736 = -(*spvDescriptorSet0.vp_c9)._m0[179].w;
    float _1738 = _1506 + _1736;
    float _1740 = -(*spvDescriptorSet0.vp_c9)._m0[180].x;
    float _1742 = _1740 + (*spvDescriptorSet0.vp_c9)._m0[181].x;
    float _1744 = fma(_1724, _1728, (*spvDescriptorSet0.vp_c9)._m0[178].x);
    float _1746 = -(*spvDescriptorSet0.vp_c9)._m0[180].w;
    float _1748 = _1506 + _1746;
    float _1750 = fma(_1734, _1738, (*spvDescriptorSet0.vp_c9)._m0[179].x);
    float _1752 = _1742 * _1710;
    float _1754 = -(*spvDescriptorSet0.vp_c9)._m0[181].x;
    float _1756 = (*spvDescriptorSet0.vp_c9)._m0[182].x + _1754;
    bool _1758 = _1506 >= (*spvDescriptorSet0.vp_c9)._m0[182].w;
    bool _1760 = isnan(_1506);
    bool _1762 = _1758 || _1760;
    bool _1764 = isnan((*spvDescriptorSet0.vp_c9)._m0[182].w);
    bool _1766 = _1762 || _1764;
    float _1768 = float(_1766);
    float _1770 = fma(_1744, _1610, _1732);
    float _1772 = fma(_1752, _1748, (*spvDescriptorSet0.vp_c9)._m0[180].x);
    float _1774 = -(*spvDescriptorSet0.vp_c9)._m0[181].w;
    float _1776 = _1506 + _1774;
    float _1778 = -_1768;
    float _1780 = _1778 + 1.0;
    float _1782 = _1756 * _1730;
    float _1784 = fma(_1750, _1596, _1770);
    float _1786 = _1522 * _1780;
    float _1788 = fma(_1782, _1776, (*spvDescriptorSet0.vp_c9)._m0[181].x);
    float _1790 = fma(_1772, _1562, _1784);
    float _1792 = fma(_1788, _1786, _1790);
    float _1794 = fma(_1768, (*spvDescriptorSet0.vp_c9)._m0[182].x, _1792);
    out.m_67.x = _1794;
    bool _1796 = !_1572;
    float _1798 = _1710;
    float _1800 = (*spvDescriptorSet0.vp_c9)._m0[178].x;
    float _1802 = _1730;
    float _1804 = _1718;
    float _1806 = _1522;
    float _1808 = _1562;
    float _1826;
    if (!_1796)
    {
        float _1810 = in.m_55.x;
        float _1812 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[14].w;
        float _1814 = _1810 * (*spvDescriptorSet0.vp_c9)._m0[15].w;
        float _1816 = fma(_1814, (*spvDescriptorSet0.vp_c9)._m0[14].w, _160);
        float _1818 = _1816 * _1812;
        float _1820 = floor(_1818);
        float _1822 = -_1820;
        float _1824 = _1818 + _1822;
        _1826 = _1824;
        _1828 = true;
    }
    else
    {
        float _1830 = float(_126);
        float _1832 = 1.0 / _1830;
        float _1834 = _160 * _1832;
        _1826 = _1834;
    }
    _1828 = false;
    float _1836 = _1826;
    float _1838 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].y);
    int _1840 = int(_1838);
    float _1842 = float(_126);
    float _1844 = in.m_69.x;
    float _1846 = in.m_55.y;
    int _1848 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _1850 = _1848 != 0;
    float _1852 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].x);
    int _1854 = int(_1852);
    int _1856 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _1858 = _1856 != 0;
    float _1860 = float(_1840);
    float _1862 = trunc((*spvDescriptorSet0.vp_c9)._m0[31].y);
    int _1864 = int(_1862);
    if (_1850)
    {
        float _1866 = in.m_55.x;
        _1798 = _1866;
    }
    float _1868 = _1798;
    float _1870 = float(uint(_1854));
    float _1872 = 1.0 / _1860;
    float _1874 = float(_1854);
    if (_1858)
    {
        float _1876 = in.m_55.z;
        _1800 = _1876;
    }
    float _1878 = _1800;
    int _1880 = ~_1854;
    int _1882 = _1880 + 1;
    float _1884 = 0.0;
    int _1886 = as_type<int>(_1878);
    float _1888 = _1844;
    if (!_1850)
    {
        _1884 = _1844;
    }
    float _1890 = _1884;
    float _1892 = trunc((*spvDescriptorSet0.vp_c9)._m0[40].y);
    int _1894 = int(_1892);
    float _1896 = float(_1864);
    int _1898 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _1900 = _1898 != 0;
    float _1902 = _1872 * _160;
    float _1904 = 1.0 / _1870;
    float _1906 = float(_1894);
    float _1908 = trunc(_1902);
    int _1910 = int(_1908);
    float _1912 = _1890;
    bool _1914 = _1900;
    if (_1900)
    {
        float _1916 = in.m_55.x;
        _1802 = _1916;
    }
    float _1918 = _1802;
    int _1920 = 0;
    float _1922 = _1918;
    if (_1900)
    {
        _1920 = 0;
    }
    int _1924 = _1920;
    int _1926 = 0;
    int _1928 = _1924;
    if (_1900)
    {
        _1926 = 0;
    }
    int _1930 = _1926;
    float _1932 = _1690;
    int _1934 = _1930;
    if (_1900)
    {
        float _1936 = in.m_55.z;
        _1932 = _1936;
    }
    float _1938 = _1932;
    float _1940 = 1.0 / _1896;
    int _1942 = as_type<int>(_1904) + (-2);
    float _1944 = _1874 * _160;
    if (_1900)
    {
        _1804 = 1.0;
    }
    float _1946 = _1804;
    float _1948 = _1946;
    if (_1900)
    {
        _1806 = 1.0;
    }
    float _1950 = _1806;
    float _1952 = _1950;
    if (_1900)
    {
        _1808 = 1.0;
    }
    float _1954 = _1808;
    float _1956 = 1.0 / _1906;
    float _1958 = float(uint(_1910));
    int _1960 = 0;
    float _1962 = _1954;
    if (_1900)
    {
        _1960 = as_type<int>(_1846);
    }
    int _1964 = _1960;
    float _1966 = 1.0 / _1842;
    float _1968 = as_type<float>(_1942) * _1958;
    float _1970 = _1940 * _160;
    int _1972 = as_type<int>(_1940);
    float _1974 = _1938;
    int _1976 = _1964;
    if (_1900)
    {
        _1972 = as_type<int>(_1938);
    }
    int _1978 = _1972;
    float _1980 = trunc(_1968);
    float _1982 = precise::max(_1980, 0.0);
    uint _1985 = uint(_1982);
    float _1987 = trunc((*spvDescriptorSet0.vp_c9)._m0[31].x);
    int _1989 = int(_1987);
    float _1991 = float(_1910);
    float _1993 = _1944 * _1966;
    float _1995 = in.m_55.w;
    bool _1997 = _1991 >= _1874;
    bool _1999 = isnan(_1991);
    bool _2001 = _1997 || _1999;
    bool _2003 = isnan(_1874);
    bool _2005 = _2001 || _2003;
    float _2007 = float(_2005);
    float _2009 = trunc((*spvDescriptorSet0.vp_c9)._m0[40].x);
    int _2011 = int(_2009);
    int _2013 = _1882 * int(_1985);
    int _2015 = _2013 + _1910;
    float _2017 = float(uint(_2015));
    float _2019 = trunc((*spvDescriptorSet0.vp_c9)._m0[49].x);
    int _2021 = int(_2019);
    float _2023 = float(uint(_1989));
    float _2025 = as_type<float>(_1942) * _2017;
    float _2027 = _2017;
    float _2029 = as_type<float>(_2015);
    int _2031 = _1978;
    int _2033 = as_type<int>(_2025);
    if (_1900)
    {
        _2027 = _1918;
    }
    float _2035 = _2027;
    float _2037 = trunc((*spvDescriptorSet0.vp_c9)._m0[49].y);
    int _2039 = int(_2037);
    float _2041 = float(uint(_2011));
    float _2043 = _2035;
    if (_1900)
    {
        _2029 = _2035;
    }
    float _2045 = _2029;
    int _2047 = 0;
    float _2049 = _2045;
    if (_1900)
    {
        _2047 = as_type<int>(_2035);
    }
    int _2051 = _2047;
    float _2053 = float(uint(_2021));
    float _2055 = 1.0 / _2023;
    float _2057 = float(_2039);
    float _2059 = 1.0 / _2041;
    float _2061 = 1.0 / _2057;
    float _2063 = 1.0 / _2053;
    float _2065 = trunc(_1993);
    int _2067 = int(_2065);
    float _2069 = trunc(_1970);
    int _2071 = int(_2069);
    float _2073 = trunc(_2007);
    int _2075 = int(_2073);
    float _2077 = trunc(_2025);
    float _2079 = precise::max(_2077, 0.0);
    uint _2081 = uint(_2079);
    int _2083 = _2051;
    int _2085 = int(_2081);
    if (!_1900)
    {
        float _2087 = in.m_55.x;
        float _2089 = _1846 * 3.1415927410125732421875;
        float _2091 = in.m_55.z;
        float _2093 = _2089 * 0.15915493667125701904296875;
        float _2095 = _2093 * 6.283185482025146484375;
        float _2097 = sin(_2095);
        float _2099 = _2087 * 3.1415927410125732421875;
        float _2101 = _2099 * 0.15915493667125701904296875;
        float _2103 = _2091 * 3.1415927410125732421875;
        float _2105 = _2103 * 0.15915493667125701904296875;
        float _2107 = _2101 * 6.283185482025146484375;
        float _2109 = sin(_2107);
        float _2111 = _2105 * 6.283185482025146484375;
        float _2113 = sin(_2111);
        _1952 = 1.2345600128173828125;
        _2043 = _1846;
        _1948 = 7.345489978790283203125;
        _1922 = _2087;
        _1962 = 5.839270114898681640625;
        _2049 = _2091;
        _1974 = _2091;
        _1928 = 1;
        _1934 = 2;
        _1976 = as_type<int>(_2097);
        _2083 = as_type<int>(_2109);
        _2031 = as_type<int>(_2113);
    }
    float _2115 = _1952;
    float _2117 = _2043;
    float _2119 = _1948;
    float _2121 = _1922;
    float _2123 = _1962;
    float _2125 = _2049;
    float _2127 = _1974;
    int _2129 = _1928;
    int _2131 = _1934;
    int _2133 = _1976;
    int _2135 = _2083;
    int _2137 = _2031;
    int _2139 = as_type<int>(_2119);
    if (_1850)
    {
        float _2141 = -_1844;
        float _2143 = _2141 + 1.0;
        _2033 = as_type<int>(_2143);
    }
    int _2145 = _2033;
    bool _2147 = false;
    if (_1850)
    {
        bool _2149 = _1868 > 0.5;
        _2147 = _2149;
    }
    bool _2151 = _2147;
    float _2153 = _2115 * _2117;
    int _2155 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 16;
    bool _2157 = _2155 != 0;
    float _2159 = _2119 * _2121;
    if (_1850)
    {
        float _2161 = _2151 ? as_type<float>(_2145) : _1844;
        _1912 = _2161;
    }
    float _2163 = _1912;
    float _2165 = _2123 * _2125;
    int _2167 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 64;
    bool _2169 = _2167 != 0;
    float _2171 = _2119 * _2117;
    int _2173 = int(_1985) + int(_2081);
    float _2175 = floor(_2153);
    int _2177 = ~_1854;
    int _2179 = _2177 + 1;
    float _2181 = in.m_69.y;
    int _2183 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 256;
    bool _2185 = _2183 != 0;
    if (_1858)
    {
        bool _2187 = _1878 > 0.5;
        _1914 = _2187;
    }
    bool _2189 = _1914;
    if (_1858)
    {
        float _2191 = -_1844;
        float _2193 = _2191 + 1.0;
        _1886 = as_type<int>(_2193);
    }
    int _2195 = _1886;
    int _2197 = _2179 * _2173;
    int _2199 = _2197 + _1910;
    if (_2157)
    {
        float _2201 = -_1844;
        float _2203 = _2201 + 1.0;
        _2085 = as_type<int>(_2203);
    }
    int _2205 = _2085;
    bool _2207 = _1846 > 0.5;
    float _2209 = as_type<float>(_2205);
    if (_2169)
    {
        float _2211 = -_1844;
        float _2213 = _2211 + 1.0;
        _2139 = as_type<int>(_2213);
    }
    int _2215 = _2139;
    float _2217 = 0.0;
    if (!_1858)
    {
        _2217 = _1844;
    }
    float _2219 = _2217;
    float _2221 = floor(_2165);
    float _2223 = _2219;
    if (_1858)
    {
        float _2225 = _2189 ? as_type<float>(_2195) : _1844;
        _2223 = _2225;
    }
    float _2227 = _2223;
    float _2229 = 0.0;
    if (!_2157)
    {
        _2229 = _1844;
    }
    float _2231 = _2229;
    int _2233 = 0;
    float _2235 = _2231;
    if (_2185)
    {
        float _2237 = -_1844;
        float _2239 = _2237 + 1.0;
        _2233 = as_type<int>(_2239);
    }
    int _2241 = _2233;
    bool _2243 = uint(_2199) >= uint(_1854);
    float _2245 = _1956 * _160;
    if (_2157)
    {
        float _2247 = _2207 ? as_type<float>(_2205) : _1844;
        _2235 = _2247;
    }
    float _2249 = _2235;
    float _2251 = floor(_2159);
    if (!_2169)
    {
        _2209 = _1844;
    }
    float _2253 = _2209;
    float _2255 = _2253;
    if (_2169)
    {
        float _2257 = _2207 ? as_type<float>(_2215) : _1844;
        _2255 = _2257;
    }
    float _2259 = _2255;
    bool _2261 = !_2243;
    int _2263 = _2261 ? 0 : (-1);
    if (_2185)
    {
        float _2265 = _2207 ? as_type<float>(_2241) : _1844;
        _1888 = _2265;
    }
    float _2267 = _1888;
    float _2269 = floor(_2171);
    int _2271 = ~_2173;
    int _2273 = _2271 + _2263;
    int _2275 = _2273 + 1;
    float _2277 = _2061 * _160;
    int _2279 = as_type<int>(_2055) + (-2);
    float _2281 = -_2175;
    float _2283 = _2153 + _2281;
    float _2285 = float(uint(_2071));
    int _2287 = _1854 * _2275;
    int _2289 = _2287 + _1910;
    bool _2291 = _1854 == 0;
    float _2293 = trunc(_2245);
    int _2295 = int(_2293);
    float _2297 = -_2221;
    float _2299 = _2165 + _2297;
    float _2301 = as_type<float>(_2279) * _2285;
    float _2303 = -_2251;
    float _2305 = _2159 + _2303;
    int _2307 = ~_2075;
    int _2309 = _2307 + 1;
    int _2311 = _2309 + 1;
    bool _2313 = !_2291;
    int _2315 = _2313 ? _2289 : (-1);
    float _2317 = _2305 * _1874;
    float _2319 = trunc(_2301);
    float _2321 = precise::max(_2319, 0.0);
    uint _2323 = uint(_2321);
    int _2325 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4096;
    bool _2327 = _2325 != 0;
    float _2329 = -_2269;
    float _2331 = _2171 + _2329;
    int _2333 = _2315 * _2311;
    bool _2335 = !_2327;
    int _2337 = _2335 ? 0 : 1;
    int _2339 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 16;
    bool _2341 = _2339 != 0;
    int _2343 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 32;
    bool _2345 = _2343 != 0;
    int _2347 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 64;
    bool _2349 = _2347 != 0;
    float _2351 = trunc(_2277);
    int _2353 = int(_2351);
    int _2355 = abs(_2337);
    int _2357 = ~_1989;
    int _2359 = _2357 + 1;
    bool _2361 = !_2345;
    int _2363 = _2361 ? 0 : 1;
    int _2365 = as_type<int>(_2059) + (-2);
    float _2367 = trunc(_2317);
    int _2369 = int(_2367);
    float _2371 = float(uint(_2295));
    int _2373 = abs(_2363);
    int _2375 = _2359 * int(_2323);
    int _2377 = _2375 + _2071;
    int _2379 = _1854 + (-1);
    float _2381 = as_type<float>(_2365) * _2371;
    int _2383 = as_type<int>(_2063) + (-2);
    float _2385 = float(uint(_2377));
    int _2387 = _2075 * _2379;
    int _2389 = _2387 + _2333;
    float _2391 = float(uint(_2353));
    float _2393 = trunc(_2381);
    float _2395 = precise::max(_2393, 0.0);
    uint _2397 = uint(_2395);
    bool _2399 = !_2341;
    int _2401 = _2399 ? 0 : 1;
    int _2403 = _2389 * _2373;
    float _2405 = as_type<float>(_2279) * _2385;
    float _2407 = as_type<float>(_2383) * _2391;
    int _2409 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 128;
    bool _2411 = _2409 != 0;
    int _2413 = _2369 * _2355;
    int _2415 = _2413 + _1910;
    bool _2417 = !_2349;
    int _2419 = _2417 ? 0 : 1;
    float _2421 = trunc(_2405);
    float _2423 = precise::max(_2421, 0.0);
    uint _2425 = uint(_2423);
    int _2427 = abs(_2401);
    bool _2429 = !_2411;
    int _2431 = _2429 ? 0 : 1;
    int _2433 = abs(_2419);
    float _2435 = trunc(_2407);
    float _2437 = precise::max(_2435, 0.0);
    uint _2439 = uint(_2437);
    int _2441 = ~_2011;
    int _2443 = _2441 + 1;
    int _2445 = abs(_2431);
    int _2447 = _2067 * _2427;
    int _2449 = _2447 + _2403;
    int _2451 = _2443 * int(_2397);
    int _2453 = _2451 + _2295;
    int _2455 = ~_2021;
    int _2457 = _2455 + 1;
    float _2459 = _1966 * _160;
    int _2461 = int(_2323) + int(_2425);
    int _2463 = _2415 * _2433;
    int _2465 = _2463 + _2449;
    float _2467 = float(uint(_2453));
    float _2469 = float(_2071);
    int _2471 = _2369 * _2445;
    int _2473 = _2471 + _2465;
    float _2475 = float(_2021);
    float _2477 = as_type<float>(_2365) * _2467;
    int _2479 = _2457 * int(_2439);
    int _2481 = _2479 + _2353;
    float _2483 = float(_2295);
    float _2485 = float(uint(_2473));
    float _2487 = trunc(_2477);
    float _2489 = precise::max(_2487, 0.0);
    uint _2491 = uint(_2489);
    float _2493 = float(uint(_2481));
    float _2495 = float(_1989);
    int _2497 = ~_1989;
    int _2499 = _2497 + 1;
    float _2501 = as_type<float>(_2383) * _2493;
    float _2503 = float(_2011);
    float _2505 = _2495 * _2283;
    float _2507 = as_type<float>(_1942) * _2485;
    float _2509 = trunc(_2501);
    float _2511 = precise::max(_2509, 0.0);
    uint _2513 = uint(_2511);
    int _2515 = ~_1854;
    int _2517 = _2515 + 1;
    float _2519 = _2495 * _2459;
    bool _2521 = _2469 >= _2495;
    bool _2523 = isnan(_2469);
    bool _2525 = _2521 || _2523;
    bool _2527 = isnan(_2495);
    bool _2529 = _2525 || _2527;
    float _2531 = float(_2529);
    float _2533 = _2503 * _2299;
    bool _2535 = _2483 >= _2503;
    bool _2537 = isnan(_2483);
    bool _2539 = _2535 || _2537;
    bool _2541 = isnan(_2503);
    bool _2543 = _2539 || _2541;
    float _2545 = float(_2543);
    float _2547 = _2503 * _2459;
    float _2549 = _2475 * _2459;
    float _2551 = trunc(_2507);
    float _2553 = precise::max(_2551, 0.0);
    uint _2555 = uint(_2553);
    float _2557 = float(_2353);
    float _2559 = _2475 * _2331;
    bool _2561 = _2557 >= _2475;
    bool _2563 = isnan(_2557);
    bool _2565 = _2561 || _2563;
    bool _2567 = isnan(_2475);
    bool _2569 = _2565 || _2567;
    float _2571 = float(_2569);
    int _2573 = _2499 * _2461;
    int _2575 = _2573 + _2071;
    int _2577 = ~_2011;
    int _2579 = _2577 + 1;
    float _2581 = trunc(_2531);
    int _2583 = int(_2581);
    int _2585 = int(_2397) + int(_2491);
    bool _2587 = uint(_2575) >= uint(_1989);
    int _2589 = int(_2439) + int(_2513);
    int _2591 = _2517 * int(_2555);
    int _2593 = _2591 + _2473;
    int _2595 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8192;
    bool _2597 = _2595 != 0;
    int _2599 = _2579 * _2585;
    int _2601 = _2599 + _2295;
    int _2603 = ~_2021;
    int _2605 = _2603 + 1;
    float _2607 = trunc(_2505);
    int _2609 = int(_2607);
    float _2611 = float(uint(_2593));
    int _2613 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 256;
    bool _2615 = _2613 != 0;
    int _2617 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 512;
    bool _2619 = _2617 != 0;
    int _2621 = _2605 * _2589;
    int _2623 = _2621 + _2353;
    bool _2625 = uint(_2601) >= uint(_2011);
    float _2627 = as_type<float>(_1942) * _2611;
    bool _2629 = !_2597;
    int _2631 = _2629 ? 0 : 1;
    float _2633 = trunc(_2545);
    int _2635 = int(_2633);
    bool _2637 = !_2587;
    int _2639 = _2637 ? 0 : (-1);
    bool _2641 = !_2619;
    int _2643 = _2641 ? 0 : 1;
    int _2645 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1024;
    bool _2647 = _2645 != 0;
    int _2649 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 2048;
    bool _2651 = _2649 != 0;
    bool _2653 = !_2615;
    int _2655 = _2653 ? 0 : 1;
    float _2657 = trunc(_2627);
    float _2659 = precise::max(_2657, 0.0);
    uint _2661 = uint(_2659);
    bool _2663 = uint(_2623) >= uint(_2021);
    int _2665 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 16384;
    bool _2667 = _2665 != 0;
    bool _2669 = !_2625;
    int _2671 = _2669 ? 0 : (-1);
    int _2673 = ~_2461;
    int _2675 = _2673 + _2639;
    int _2677 = _2675 + 1;
    float _2679 = trunc(_2549);
    int _2681 = int(_2679);
    int _2683 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 4096;
    bool _2685 = _2683 != 0;
    int _2687 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 8192;
    bool _2689 = _2687 != 0;
    bool _2691 = !_2667;
    int _2693 = _2691 ? 0 : 1;
    int _2695 = _1989 * _2677;
    int _2697 = _2695 + _2071;
    bool _2699 = !_2647;
    int _2701 = _2699 ? 0 : 1;
    bool _2703 = !_2651;
    int _2705 = _2703 ? 0 : 1;
    float _2707 = trunc(_2559);
    int _2709 = int(_2707);
    int _2711 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 16384;
    bool _2713 = _2711 != 0;
    bool _2715 = _1989 == 0;
    int _2717 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 32768;
    bool _2719 = _2717 != 0;
    int _2721 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 32768;
    bool _2723 = _2721 != 0;
    int _2725 = abs(_2631);
    bool _2727 = !_2713;
    int _2729 = _2727 ? 0 : 1;
    bool _2731 = !_2663;
    int _2733 = _2731 ? 0 : (-1);
    int _2735 = _2609 * _2725;
    int _2737 = _2735 + _2071;
    int _2739 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 65536;
    bool _2741 = _2739 != 0;
    int _2743 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 131072;
    bool _2745 = _2743 != 0;
    int _2747 = ~_2585;
    int _2749 = _2747 + _2671;
    int _2751 = _2749 + 1;
    int _2753 = ~_2583;
    int _2755 = _2753 + 1;
    int _2757 = _2755 + 1;
    bool _2759 = !_2715;
    int _2761 = _2759 ? _2697 : (-1);
    int _2763 = _2011 * _2751;
    int _2765 = _2763 + _2295;
    int _2767 = int(_2555) + int(_2661);
    float _2769 = trunc(_2571);
    int _2771 = int(_2769);
    int _2773 = ~_1854;
    int _2775 = _2773 + 1;
    int _2777 = _2757 * _2761;
    bool _2779 = !_2745;
    int _2781 = _2779 ? 0 : 1;
    bool _2783 = _2011 == 0;
    int _2785 = _2775 * _2767;
    int _2787 = _2785 + _2473;
    int _2789 = _1989 + (-1);
    int _2791 = ~_2635;
    int _2793 = _2791 + 1;
    int _2795 = _2793 + 1;
    bool _2797 = !_2783;
    int _2799 = _2797 ? _2765 : (-1);
    int _2801 = _2583 * _2789;
    int _2803 = _2801 + _2777;
    int _2805 = ~_2589;
    int _2807 = _2805 + _2733;
    int _2809 = _2807 + 1;
    float _2811 = trunc(_2519);
    int _2813 = int(_2811);
    bool _2815 = !_2723;
    int _2817 = _2815 ? 0 : 1;
    int _2819 = _2795 * _2799;
    int _2821 = abs(_2643);
    int _2823 = _2021 * _2809;
    int _2825 = _2823 + _2353;
    bool _2827 = uint(_2787) >= uint(_1854);
    int _2829 = abs(_2655);
    float _2831 = trunc(_2533);
    int _2833 = int(_2831);
    bool _2835 = !_2719;
    int _2837 = _2835 ? 0 : 1;
    bool _2839 = !_2827;
    int _2841 = _2839 ? 0 : (-1);
    int _2843 = _2803 * _2821;
    bool _2845 = !_2685;
    int _2847 = _2845 ? 0 : 1;
    float _2849 = trunc(_2547);
    int _2851 = int(_2849);
    int _2853 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 262144;
    bool _2855 = _2853 != 0;
    int _2857 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 524288;
    bool _2859 = _2857 != 0;
    bool _2861 = _2021 == 0;
    int _2863 = abs(_2701);
    int _2865 = _2011 + (-1);
    int _2867 = ~_2771;
    int _2869 = _2867 + 1;
    int _2871 = _2869 + 1;
    int _2873 = _2635 * _2865;
    int _2875 = _2873 + _2819;
    bool _2877 = !_2861;
    int _2879 = _2877 ? _2825 : (-1);
    int _2881 = _2813 * _2829;
    int _2883 = _2881 + _2843;
    float _2885 = _2121 * 2.0;
    int _2887 = abs(_2705);
    int _2889 = _2871 * _2879;
    int _2891 = abs(_2693);
    int _2893 = _2737 * _2863;
    int _2895 = _2893 + _2883;
    float _2897 = _1846 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    bool _2899 = !_2689;
    int _2901 = _2899 ? 0 : 1;
    int _2903 = abs(_2847);
    int _2905 = _2609 * _2887;
    int _2907 = _2905 + _2895;
    int _2909 = abs(_2901);
    float _2911 = float(uint(_2907));
    int _2913 = _2875 * _2909;
    int _2915 = abs(_2729);
    float _2917 = as_type<float>(_2279) * _2911;
    int _2919 = abs(_2837);
    int _2921 = _2851 * _2903;
    int _2923 = _2921 + _2913;
    float _2925 = trunc(_2917);
    float _2927 = precise::max(_2925, 0.0);
    uint _2929 = uint(_2927);
    int _2931 = _2833 * _2891;
    int _2933 = _2931 + _2295;
    int _2935 = abs(_2817);
    int _2937 = _2933 * _2915;
    int _2939 = _2937 + _2923;
    bool _2941 = !_2741;
    int _2943 = _2941 ? 0 : 1;
    int _2945 = _2021 + (-1);
    int _2947 = _2833 * _2919;
    int _2949 = _2947 + _2939;
    int _2951 = abs(_2781);
    int _2953 = ~_1989;
    int _2955 = _2953 + 1;
    int _2957 = _2771 * _2945;
    int _2959 = _2957 + _2889;
    int _2961 = abs(_2943);
    int _2963 = _2955 * int(_2929);
    int _2965 = _2963 + _2907;
    bool _2967 = !_2855;
    int _2969 = _2967 ? 0 : 1;
    int _2971 = _2959 * _2951;
    int _2973 = _2709 * _2935;
    int _2975 = _2973 + _2353;
    int _2977 = ~_2767;
    int _2979 = _2977 + _2841;
    int _2981 = _2979 + 1;
    float _2983 = float(uint(_2949));
    int _2985 = _2681 * _2961;
    int _2987 = _2985 + _2971;
    float _2989 = float(uint(_2965));
    int _2991 = _1854 * _2981;
    int _2993 = _2991 + _2473;
    bool _2995 = !_2859;
    int _2997 = _2995 ? 0 : 1;
    float _2999 = as_type<float>(_2365) * _2983;
    int _3001 = abs(_2969);
    float _3003 = as_type<float>(_2279) * _2989;
    int _3005 = abs(_2997);
    float _3007 = trunc(_2999);
    float _3009 = precise::max(_3007, 0.0);
    uint _3011 = uint(_3009);
    bool _3013 = _1854 == 0;
    int _3015 = _2975 * _3001;
    int _3017 = _3015 + _2987;
    float _3019 = -_2181;
    float _3021 = _3019 + 1.0;
    bool _3023 = _1995 > 0.5;
    float _3025 = trunc(_3003);
    float _3027 = precise::max(_3025, 0.0);
    uint _3029 = uint(_3027);
    bool _3031 = !_3013;
    int _3033 = _3031 ? _2993 : (-1);
    int _3035 = _2709 * _3005;
    int _3037 = _3035 + _3017;
    int _3039 = _3023 ? as_type<int>(_3021) : as_type<int>(_2181);
    int _3041 = _3033 & 3;
    bool _3043 = _3041 != 0;
    int _3045 = _3033 & 3;
    bool _3047 = _3045 != 0;
    int _3049 = ~_2011;
    int _3051 = _3049 + 1;
    float _3053 = float(uint(_3037));
    int _3055 = _3043 ? 0 : 1;
    int _3057 = _3051 * int(_3011);
    int _3059 = _3057 + _2949;
    bool _3061 = uint(_3045) > 1u;
    float _3063 = as_type<float>(_2383) * _3053;
    int _3065 = int(_2929) + int(_3029);
    int _3067 = ~_1989;
    int _3069 = _3067 + 1;
    float _3071 = trunc(_3063);
    float _3073 = precise::max(_3071, 0.0);
    uint _3075 = uint(_3073);
    float _3077 = float(uint(_3059));
    int _3079 = ~_3055;
    int _3081 = _3079 + 1;
    int _3083 = _3081 + 1;
    float _3085 = as_type<float>(_2365) * _3077;
    int _3087 = ~_2021;
    int _3089 = _3087 + 1;
    int _3091 = _3069 * _3065;
    int _3093 = _3091 + _2907;
    int _3095 = _3083;
    if (!_3061)
    {
        int _3097 = ~_3055;
        int _3099 = _3097 + 1;
        _3095 = _3099;
    }
    int _3101 = _3095;
    float _3103 = trunc(_3085);
    float _3105 = precise::max(_3103, 0.0);
    uint _3107 = uint(_3105);
    bool _3109 = uint(_3045) >= 2u;
    bool _3111 = _1846 > 0.5;
    int _3113 = _3109 ? 0 : 1;
    int _3115 = _3089 * int(_3075);
    int _3117 = _3115 + _3037;
    bool _3119 = uint(_3093) >= uint(_1989);
    int _3121 = ~_3113;
    int _3123 = _3121 + 1;
    int _3125 = _3123 + 1;
    bool _3127 = !_3119;
    int _3129 = _3127 ? 0 : (-1);
    bool _3131 = _3045 != 3;
    float _3133 = float(uint(_3117));
    int _3135 = ~_2011;
    int _3137 = _3135 + 1;
    int _3139 = int(_3011) + int(_3107);
    float _3141 = as_type<float>(_2383) * _3133;
    int _3143 = ~_3065;
    int _3145 = _3143 + _3129;
    int _3147 = _3145 + 1;
    float _3149 = trunc(_3141);
    float _3151 = precise::max(_3149, 0.0);
    uint _3153 = uint(_3151);
    int _3155 = _3137 * _3139;
    int _3157 = _3155 + _2949;
    int _3159 = _3125;
    if (_3131)
    {
        int _3161 = ~_3113;
        int _3163 = _3161 + 1;
        _3159 = _3163;
    }
    int _3165 = _3159;
    int _3167 = _1989 * _3147;
    int _3169 = _3167 + _2907;
    int _3171 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2097152;
    bool _3173 = _3171 != 0;
    float _3175 = -(*spvDescriptorSet0.vp_c9)._m0[184].w;
    float _3177 = _3175 + (*spvDescriptorSet0.vp_c9)._m0[185].w;
    bool _3179 = !_3173;
    int _3181 = _3179 ? 0 : 1;
    bool _3183 = uint(_3157) >= uint(_2011);
    float _3185 = -(*spvDescriptorSet0.vp_c9)._m0[185].w;
    float _3187 = _3185 + (*spvDescriptorSet0.vp_c9)._m0[186].w;
    bool _3189 = !_2715;
    int _3191 = _3189 ? _3169 : (-1);
    float _3193 = 1.0 / _3177;
    bool _3195 = !_3183;
    int _3197 = _3195 ? 0 : (-1);
    int _3199 = _3191 & 3;
    bool _3201 = _3199 != 0;
    int _3203 = _3111 ? as_type<int>(_3021) : as_type<int>(_2181);
    int _3205 = ~_3139;
    int _3207 = _3205 + _3197;
    int _3209 = _3207 + 1;
    float _3211 = 1.0 / _3187;
    bool _3213 = uint(_3199) >= 2u;
    int _3215 = _3201 ? 0 : 1;
    int _3217 = _2011 * _3209;
    int _3219 = _3217 + _2949;
    bool _3221 = _3199 != 3;
    int _3223 = _3213 ? 0 : 1;
    int _3225 = int(_3075) + int(_3153);
    bool _3227 = uint(_3199) > 1u;
    int _3229 = ~_2021;
    int _3231 = _3229 + 1;
    int _3233 = ~_3223;
    int _3235 = _3233 + 1;
    int _3237 = _3235 + 1;
    bool _3239 = !_2783;
    int _3241 = _3239 ? _3219 : (-1);
    int _3243 = _3231 * _3225;
    int _3245 = _3243 + _3037;
    int _3247 = _3237;
    if (_3221)
    {
        int _3249 = ~_3223;
        int _3251 = _3249 + 1;
        _3247 = _3251;
    }
    int _3253 = _3247;
    int _3255 = ~_3215;
    int _3257 = _3255 + 1;
    int _3259 = _3257 + 1;
    bool _3261 = uint(_3245) >= uint(_2021);
    int _3263 = _3259;
    if (!_3227)
    {
        int _3265 = ~_3215;
        int _3267 = _3265 + 1;
        _3263 = _3267;
    }
    int _3269 = _3263;
    int _3271 = _3241 & 3;
    bool _3273 = _3271 != 0;
    bool _3275 = !_3261;
    int _3277 = _3275 ? 0 : (-1);
    int _3279 = _3273 ? 0 : 1;
    bool _3281 = uint(_3271) >= 2u;
    bool _3283 = _3271 != 3;
    int _3285 = ~_3225;
    int _3287 = _3285 + _3277;
    int _3289 = _3287 + 1;
    int _3291 = _3281 ? 0 : 1;
    bool _3293 = uint(_3271) > 1u;
    int _3295 = _2021 * _3289;
    int _3297 = _3295 + _3037;
    int _3299 = ~_3291;
    int _3301 = _3299 + 1;
    int _3303 = _3301 + 1;
    int _3305 = ~_3279;
    int _3307 = _3305 + 1;
    int _3309 = _3307 + 1;
    bool _3311 = !_2861;
    int _3313 = _3311 ? _3297 : (-1);
    int _3315 = _3303;
    int _3317 = _3309;
    if (_3283)
    {
        int _3319 = ~_3291;
        int _3321 = _3319 + 1;
        _3315 = _3321;
    }
    int _3323 = _3315;
    int _3325 = _3313 & 3;
    bool _3327 = _3325 != 0;
    if (!_3293)
    {
        int _3329 = ~_3279;
        int _3331 = _3329 + 1;
        _3317 = _3331;
    }
    int _3333 = _3317;
    bool _3335 = uint(_3325) >= 2u;
    float _3337 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    int _3339 = _3327 ? 0 : 1;
    int _3341 = _3335 ? 0 : 1;
    float _3343 = fma(_2897, -2.0, _3337);
    bool _3345 = uint(_3325) > 1u;
    bool _3347 = _3325 != 3;
    float _3349 = fma(_160, (*spvDescriptorSet0.vp_c9)._m0[76].y, _3343);
    int _3351 = ~_3339;
    int _3353 = _3351 + 1;
    int _3355 = _3353 + 1;
    int _3357 = ~_3341;
    int _3359 = _3357 + 1;
    int _3361 = _3359 + 1;
    float _3363 = -(*spvDescriptorSet0.vp_c9)._m0[183].w;
    float _3365 = _3363 + (*spvDescriptorSet0.vp_c9)._m0[184].w;
    int _3367 = _3355;
    int _3369 = _3361;
    if (!_3345)
    {
        int _3371 = ~_3339;
        int _3373 = _3371 + 1;
        _3367 = _3373;
    }
    int _3375 = _3367;
    float _3377 = -(*spvDescriptorSet0.vp_c9)._m0[187].w;
    float _3379 = _3377 + (*spvDescriptorSet0.vp_c9)._m0[188].w;
    int _3381 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8388608;
    bool _3383 = _3381 != 0;
    float _3385 = -(*spvDescriptorSet0.vp_c9)._m0[188].w;
    float _3387 = _3385 + (*spvDescriptorSet0.vp_c9)._m0[189].w;
    if (_3347)
    {
        int _3389 = ~_3341;
        int _3391 = _3389 + 1;
        _3369 = _3391;
    }
    int _3393 = _3369;
    float _3395 = 1.0 / _3365;
    bool _3397 = !_3383;
    int _3399 = _3397 ? 0 : 1;
    float _3401 = in.m_46.x;
    float _3403 = in.m_46.y;
    float _3405 = in.m_46.z;
    int _3407 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4194304;
    bool _3409 = _3407 != 0;
    int _3411 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _3413 = _3411 != 0;
    bool _3415 = !_3409;
    int _3417 = _3415 ? 0 : 1;
    float _3419 = 1.0 / _3379;
    float _3421 = _3413 ? as_type<float>(_3203) : _2181;
    int _3423 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _3425 = _3423 != 0;
    bool _3427 = _2127 > 0.5;
    float _3429 = _3425 ? as_type<float>(_3039) : _2181;
    float _3431 = 1.0 / _3387;
    int _3433 = _3427 ? as_type<int>(_3021) : as_type<int>(_2181);
    int _3435 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 32;
    bool _3437 = _3435 != 0;
    int _3439 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 128;
    bool _3441 = _3439 != 0;
    float _3443 = _3437 ? as_type<float>(_3433) : _2181;
    float _3445 = _3441 ? as_type<float>(_3433) : _2181;
    float _3447 = _3403 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    int _3449 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 16777216;
    bool _3451 = _3449 != 0;
    float _3453 = _3403 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    int _3455 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 512;
    bool _3457 = _3455 != 0;
    float _3459 = _3403 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _3461 = floor(_2885);
    float _3463 = fma(_3401, (*spvDescriptorSet0.vp_c10)._m0[4].x, _3447);
    float _3465 = fma(_3401, (*spvDescriptorSet0.vp_c10)._m0[5].x, _3453);
    float _3467 = -(*spvDescriptorSet0.vp_c9)._m0[186].w;
    float _3469 = _3467 + (*spvDescriptorSet0.vp_c9)._m0[187].w;
    float _3471 = fma(_3401, (*spvDescriptorSet0.vp_c10)._m0[6].x, _3459);
    float _3473 = -(*spvDescriptorSet0.vp_c9)._m0[183].x;
    float _3475 = (*spvDescriptorSet0.vp_c9)._m0[184].x + _3473;
    float _3477 = -(*spvDescriptorSet0.vp_c9)._m0[184].x;
    float _3479 = _3477 + (*spvDescriptorSet0.vp_c9)._m0[185].x;
    float _3481 = -(*spvDescriptorSet0.vp_c9)._m0[185].x;
    float _3483 = (*spvDescriptorSet0.vp_c9)._m0[186].x + _3481;
    float _3485 = _3457 ? as_type<float>(_3433) : _2181;
    float _3487 = 1.0 / _3469;
    float _3489 = _3479 * _3193;
    float _3491 = -(*spvDescriptorSet0.vp_c9)._m0[189].w;
    float _3493 = _3491 + (*spvDescriptorSet0.vp_c9)._m0[190].w;
    bool _3495 = _3461 >= 0.0;
    bool _3497 = isnan(_3461);
    bool _3499 = _3495 || _3497;
    bool _3501 = isnan(0.0);
    bool _3503 = _3499 || _3501;
    float _3505 = _3483 * _3211;
    float _3507 = _1846 * 2.0;
    int _3509 = _3503 ? 0 : 1;
    float _3511 = 1.0 / _3493;
    bool _3513 = _3461 > 0.0;
    float _3515 = -(*spvDescriptorSet0.vp_c9)._m0[187].x;
    float _3517 = (*spvDescriptorSet0.vp_c9)._m0[188].x + _3515;
    float _3519 = -(*spvDescriptorSet0.vp_c9)._m0[188].x;
    float _3521 = _3519 + (*spvDescriptorSet0.vp_c9)._m0[189].x;
    float _3523 = _3475 * _3395;
    float _3525 = -(*spvDescriptorSet0.vp_c9)._m0[186].x;
    float _3527 = _3525 + (*spvDescriptorSet0.vp_c9)._m0[187].x;
    float _3529 = _3517 * _3419;
    float _3531 = floor(_3507);
    float _3533 = _3521 * _3431;
    bool _3535 = _1836 >= (*spvDescriptorSet0.vp_c9)._m0[189].w;
    bool _3537 = isnan(_1836);
    bool _3539 = _3535 || _3537;
    bool _3541 = isnan((*spvDescriptorSet0.vp_c9)._m0[189].w);
    bool _3543 = _3539 || _3541;
    float _3545 = float(_3543);
    float _3547 = _3527 * _3487;
    bool _3549 = _1836 >= (*spvDescriptorSet0.vp_c9)._m0[190].w;
    bool _3551 = isnan(_1836);
    bool _3553 = _3549 || _3551;
    bool _3555 = isnan((*spvDescriptorSet0.vp_c9)._m0[190].w);
    bool _3557 = _3553 || _3555;
    float _3559 = float(_3557);
    float _3561 = -(*spvDescriptorSet0.vp_c9)._m0[189].x;
    float _3563 = (*spvDescriptorSet0.vp_c9)._m0[190].x + _3561;
    int _3565 = ~_3509;
    int _3567 = _3565 + 1;
    int _3569 = _3567 + 1;
    float _3571 = -_3545;
    float _3573 = _3571 + 1.0;
    int _3575 = _3569;
    if (!_3513)
    {
        int _3577 = ~_3509;
        int _3579 = _3577 + 1;
        _3575 = _3579;
    }
    int _3581 = _3575;
    float _3583 = -_3559;
    float _3585 = _3583 + 1.0;
    bool _3587 = _1836 >= (*spvDescriptorSet0.vp_c9)._m0[188].w;
    bool _3589 = isnan(_1836);
    bool _3591 = _3587 || _3589;
    bool _3593 = isnan((*spvDescriptorSet0.vp_c9)._m0[188].w);
    bool _3595 = _3591 || _3593;
    float _3597 = float(_3595);
    float _3599 = _3563 * _3511;
    bool _3601 = _1836 >= (*spvDescriptorSet0.vp_c9)._m0[187].w;
    bool _3603 = isnan(_1836);
    bool _3605 = _3601 || _3603;
    bool _3607 = isnan((*spvDescriptorSet0.vp_c9)._m0[187].w);
    bool _3609 = _3605 || _3607;
    float _3611 = float(_3609);
    float _3613 = _3545 * _3585;
    float _3615 = fma(_3405, (*spvDescriptorSet0.vp_c10)._m0[5].z, _3465);
    float _3617 = _3597 * _3573;
    float _3619 = -_3597;
    float _3621 = _3619 + 1.0;
    float _3623 = fma(_3405, (*spvDescriptorSet0.vp_c10)._m0[4].z, _3463);
    float _3625 = fma(_3405, (*spvDescriptorSet0.vp_c10)._m0[6].z, _3471);
    bool _3627 = !_3451;
    int _3629 = _3627 ? 0 : 1;
    float _3631 = -(*spvDescriptorSet0.vp_c9)._m0[183].w;
    float _3633 = _1836 + _3631;
    bool _3635 = _1836 >= (*spvDescriptorSet0.vp_c9)._m0[186].w;
    bool _3637 = isnan(_1836);
    bool _3639 = _3635 || _3637;
    bool _3641 = isnan((*spvDescriptorSet0.vp_c9)._m0[186].w);
    bool _3643 = _3639 || _3641;
    float _3645 = float(_3643);
    float _3647 = -_3611;
    float _3649 = _3647 + 1.0;
    bool _3651 = _3531 > 0.0;
    float _3653 = fma(_3523, _3633, (*spvDescriptorSet0.vp_c9)._m0[183].x);
    bool _3655 = _3531 >= 0.0;
    bool _3657 = isnan(_3531);
    bool _3659 = _3655 || _3657;
    bool _3661 = isnan(0.0);
    bool _3663 = _3659 || _3661;
    float _3665 = _3611 * _3621;
    float _3667 = -(*spvDescriptorSet0.vp_c9)._m0[184].w;
    float _3669 = _1836 + _3667;
    bool _3671 = _1836 >= (*spvDescriptorSet0.vp_c9)._m0[185].w;
    bool _3673 = isnan(_1836);
    bool _3675 = _3671 || _3673;
    bool _3677 = isnan((*spvDescriptorSet0.vp_c9)._m0[185].w);
    bool _3679 = _3675 || _3677;
    float _3681 = float(_3679);
    float _3683 = -_3645;
    float _3685 = _3683 + 1.0;
    bool _3687 = _1836 >= (*spvDescriptorSet0.vp_c9)._m0[184].w;
    bool _3689 = isnan(_1836);
    bool _3691 = _3687 || _3689;
    bool _3693 = isnan((*spvDescriptorSet0.vp_c9)._m0[184].w);
    bool _3695 = _3691 || _3693;
    float _3697 = float(_3695);
    float _3699 = fma(_3489, _3669, (*spvDescriptorSet0.vp_c9)._m0[184].x);
    float _3701 = _3645 * _3649;
    float _3703 = -_3681;
    float _3705 = _3703 + 1.0;
    float _3707 = -(*spvDescriptorSet0.vp_c9)._m0[185].w;
    float _3709 = _1836 + _3707;
    float _3711 = _3681 * _3685;
    bool _3713 = _1836 >= (*spvDescriptorSet0.vp_c9)._m0[183].w;
    bool _3715 = isnan(_1836);
    bool _3717 = _3713 || _3715;
    bool _3719 = isnan((*spvDescriptorSet0.vp_c9)._m0[183].w);
    bool _3721 = _3717 || _3719;
    float _3723 = float(_3721);
    float _3725 = -_3697;
    float _3727 = _3725 + 1.0;
    float _3729 = _3697 * _3705;
    float _3731 = fma(_3505, _3709, (*spvDescriptorSet0.vp_c9)._m0[185].x);
    float _3733 = -(*spvDescriptorSet0.vp_c9)._m0[187].w;
    float _3735 = _1836 + _3733;
    float _3737 = -(*spvDescriptorSet0.vp_c9)._m0[186].w;
    float _3739 = _1836 + _3737;
    float _3741 = -(*spvDescriptorSet0.vp_c9)._m0[188].w;
    float _3743 = _1836 + _3741;
    float _3745 = _3723 * _3727;
    float _3747 = fma(_3529, _3735, (*spvDescriptorSet0.vp_c9)._m0[187].x);
    float _3749 = fma(_3547, _3739, (*spvDescriptorSet0.vp_c9)._m0[186].x);
    float _3751 = fma(_3533, _3743, (*spvDescriptorSet0.vp_c9)._m0[188].x);
    int _3753 = _3663 ? 0 : 1;
    float _3755 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[100].z;
    float _3757 = _3653 * _3745;
    bool _3759 = _2129 != 1;
    float _3761 = -(*spvDescriptorSet0.vp_c9)._m0[189].w;
    float _3763 = _1836 + _3761;
    float _3765 = float(uint(_2415));
    float _3767 = -_3723;
    float _3769 = _3767 + 1.0;
    float _3771 = float(uint(_2737));
    float _3773 = fma(_3599, _3763, (*spvDescriptorSet0.vp_c9)._m0[189].x);
    float _3775 = float(uint(_2933));
    float _3777 = as_type<float>(_1942) * _3765;
    float _3779 = fma(_3769, (*spvDescriptorSet0.vp_c9)._m0[183].x, _3757);
    float _3781 = as_type<float>(_2279) * _3771;
    int _3783 = ~_3753;
    int _3785 = _3783 + 1;
    int _3787 = _3785 + 1;
    float _3789 = trunc(_3777);
    float _3791 = precise::max(_3789, 0.0);
    uint _3793 = uint(_3791);
    float _3795 = as_type<float>(_2365) * _3775;
    int _3797 = _3787;
    float _3799 = _3771;
    float _3801 = _3769;
    float _3803 = _3779;
    if (!_3651)
    {
        int _3805 = ~_3753;
        int _3807 = _3805 + 1;
        _3797 = _3807;
    }
    int _3809 = _3797;
    float _3811 = _3755 * (*spvDescriptorSet0.vp_c9)._m0[100].x;
    float _3813 = fma(_3699, _3729, _3779);
    float _3815 = float(uint(_2975));
    float _3817 = _3615 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _3819 = fma(_3811, _2267, -0.5);
    float _3821 = trunc(_3781);
    float _3823 = precise::max(_3821, 0.0);
    uint _3825 = uint(_3823);
    int _3827 = ~_1854;
    int _3829 = _3827 + 1;
    float _3831 = as_type<float>(_2383) * _3815;
    int _3833 = ~_1989;
    int _3835 = _3833 + 1;
    float _3837 = fma(_3731, _3711, _3813);
    int _3839 = ~_2011;
    int _3841 = _3839 + 1;
    float _3843 = _3623 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    bool _3845 = _2131 != 2;
    float _3847 = trunc(_3795);
    float _3849 = precise::max(_3847, 0.0);
    uint _3851 = uint(_3849);
    float _3853 = _3625 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _3855 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    bool _3857 = !_3759;
    float _3859 = _3857 ? as_type<float>(_2133) : as_type<float>(_2135);
    int _3861 = _3835 * int(_3825);
    int _3863 = _3861 + _2737;
    float _3865 = trunc(_3831);
    float _3867 = precise::max(_3865, 0.0);
    uint _3869 = uint(_3867);
    int _3871 = _3829 * int(_3793);
    int _3873 = _3871 + _2415;
    float _3875 = _2121 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    float _3877 = (*spvDescriptorSet0.vp_c9)._m0[93].z + (*spvDescriptorSet0.vp_c9)._m0[93].x;
    float _3879 = float(uint(_3863));
    float _3881 = (*spvDescriptorSet0.vp_c9)._m0[93].w + (*spvDescriptorSet0.vp_c9)._m0[93].y;
    float _3883 = float(uint(_3873));
    int _3885 = _3841 * int(_3851);
    int _3887 = _3885 + _2933;
    float _3889 = -_3855;
    float _3891 = fma(_3875, 2.0, _3889);
    float _3893 = as_type<float>(_2279) * _3879;
    int _3895 = ~_2021;
    int _3897 = _3895 + 1;
    float _3899 = as_type<float>(_1942) * _3883;
    float _3901 = float(uint(_3887));
    float _3903 = fma(as_type<float>(_2135), (*spvDescriptorSet0.vp_c9)._m0[93].z, _3877);
    float _3905 = as_type<float>(_2135) * (*spvDescriptorSet0.vp_c9)._m0[92].x;
    bool _3907 = !_3759;
    float _3909 = _3907 ? as_type<float>(_2137) : as_type<float>(_2133);
    int _3911 = _3897 * int(_3869);
    int _3913 = _3911 + _2975;
    float _3915 = as_type<float>(_2365) * _3901;
    float _3917 = trunc(_3899);
    float _3919 = precise::max(_3917, 0.0);
    uint _3921 = uint(_3919);
    float _3923 = fma(as_type<float>(_2133), (*spvDescriptorSet0.vp_c9)._m0[93].w, _3881);
    float _3925 = as_type<float>(_2133) * (*spvDescriptorSet0.vp_c9)._m0[92].y;
    float _3927 = float(uint(_3913));
    float _3929 = fma(_160, (*spvDescriptorSet0.vp_c9)._m0[92].z, _3903);
    float _3931 = fma(_160, (*spvDescriptorSet0.vp_c9)._m0[92].w, _3923);
    float _3933 = trunc(_3893);
    float _3935 = precise::max(_3933, 0.0);
    uint _3937 = uint(_3935);
    float _3939 = as_type<float>(_2383) * _3927;
    float _3941 = (*spvDescriptorSet0.vp_c9)._m0[92].x + (*spvDescriptorSet0.vp_c9)._m0[91].z;
    float _3943 = _3755;
    float _3945 = _3905;
    if (!_3759)
    {
        _3943 = _2127;
    }
    float _3947 = _3943;
    float _3949 = (*spvDescriptorSet0.vp_c9)._m0[92].y + (*spvDescriptorSet0.vp_c9)._m0[91].w;
    float _3951 = _3947;
    if (_3759)
    {
        _3951 = _1846;
    }
    float _3953 = _3951;
    float _3955 = -_3941;
    float _3957 = fma(_3905, 2.0, _3955);
    if (_3845)
    {
        _3945 = _2121;
    }
    float _3959 = _3945;
    float _3961 = trunc(_3915);
    float _3963 = precise::max(_3961, 0.0);
    uint _3965 = uint(_3963);
    float _3967 = fma(_3749, _3701, _3837);
    int _3969 = ~_1854;
    int _3971 = _3969 + 1;
    float _3973 = fma(_3925, -2.0, _3949);
    int _3975 = int(_3793) + int(_3921);
    float _3977 = fma(_3747, _3665, _3967);
    float _3979 = -_160;
    float _3981 = fma(_3979, (*spvDescriptorSet0.vp_c9)._m0[76].x, _3891);
    int _3983 = int(_3825) + int(_3937);
    float _3985 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[100].w;
    int _3987 = ~_1989;
    int _3989 = _3987 + 1;
    int _3991 = _3971 * _3975;
    int _3993 = _3991 + _2415;
    float _3995 = as_type<float>(_3971);
    float _3997 = _3959;
    if (_3845)
    {
        _3995 = _1846;
    }
    float _3999 = _3995;
    float _4001 = fma(_3751, _3617, _3977);
    float _4003 = _3999;
    if (!_3845)
    {
        _3997 = _2127;
    }
    float _4005 = _3997;
    int _4007 = _3989 * _3983;
    int _4009 = _4007 + _2737;
    if (!_3845)
    {
        _4003 = _2121;
    }
    float _4011 = _4003;
    float _4013 = trunc(_3939);
    float _4015 = precise::max(_4013, 0.0);
    uint _4017 = uint(_4015);
    bool _4019 = uint(_3993) >= uint(_1854);
    float _4021 = _1846 + _2121;
    int _4023 = int(_3851) + int(_3965);
    float _4025 = _4005 * (*spvDescriptorSet0.vp_c9)._m0[87].x;
    int _4027 = ~_2011;
    int _4029 = _4027 + 1;
    float _4031 = _4021 + (-1.0);
    bool _4033 = !_4019;
    int _4035 = _4033 ? 0 : (-1);
    float _4037 = _4011 * (*spvDescriptorSet0.vp_c9)._m0[87].y;
    bool _4039 = uint(_4009) >= uint(_1989);
    int _4041 = _4029 * _4023;
    int _4043 = _4041 + _2933;
    float _4045 = fma(_3773, _3613, _4001);
    if (!_3759)
    {
        _3799 = _1846;
    }
    float _4047 = _3799;
    float _4049 = -_160;
    float _4051 = fma(_4049, (*spvDescriptorSet0.vp_c9)._m0[91].x, _3957);
    float _4053 = _4047;
    if (!_3759)
    {
        _3801 = _1846;
    }
    float _4055 = _3801;
    float _4057 = (*spvDescriptorSet0.vp_c9)._m0[82].y + (*spvDescriptorSet0.vp_c9)._m0[81].w;
    int _4059 = int(_3869) + int(_4017);
    float _4061 = fma(_160, (*spvDescriptorSet0.vp_c9)._m0[91].y, _3973);
    int _4063 = ~_2021;
    int _4065 = _4063 + 1;
    float _4067 = fma(_3559, (*spvDescriptorSet0.vp_c9)._m0[190].x, _4045);
    bool _4069 = !_4039;
    int _4071 = _4069 ? 0 : (-1);
    bool _4073 = uint(_4043) >= uint(_2011);
    float _4075 = _2127 * 2.0;
    int _4077 = ~_3983;
    int _4079 = _4077 + _4071;
    int _4081 = _4079 + 1;
    float _4083 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _4085 = _3843 + _4083;
    bool _4087 = !_4073;
    int _4089 = _4087 ? 0 : (-1);
    int _4091 = _4065 * _4059;
    int _4093 = _4091 + _2975;
    float _4095 = _4055;
    if (!_3759)
    {
        _3803 = _2127;
    }
    float _4097 = _3803;
    float _4099 = floor(_4075);
    int _4101 = _1989 * _4081;
    int _4103 = _4101 + _2737;
    int _4105 = ~_4023;
    int _4107 = _4105 + _4089;
    int _4109 = _4107 + 1;
    out.m_71.x = _4067;
    bool _4111 = uint(_4093) >= uint(_2021);
    float _4113 = _4097;
    if (_3759)
    {
        _4053 = _2121;
    }
    float _4115 = _4053;
    bool _4117 = !_4111;
    int _4119 = _4117 ? 0 : (-1);
    if (_3759)
    {
        _4095 = _2121;
    }
    float _4121 = _4095;
    int _4123 = ~_4059;
    int _4125 = _4123 + _4119;
    int _4127 = _4125 + 1;
    int _4129 = _2011 * _4109;
    int _4131 = _4129 + _2933;
    float _4133 = _3953 * (*spvDescriptorSet0.vp_c9)._m0[82].y;
    int _4135 = _3033 >> 31;
    float _4137 = trunc((*spvDescriptorSet0.vp_c9)._m0[80].z);
    int _4139 = int(_4137);
    if (_3759)
    {
        _4113 = _1846;
    }
    float _4141 = _4113;
    float _4143 = fma(_4133, -2.0, _4057);
    int _4145 = _4135 & 3;
    int _4147 = _2021 * _4127;
    int _4149 = _4147 + _2975;
    bool _4151 = _4099 > 0.0;
    float _4153 = fma(_160, (*spvDescriptorSet0.vp_c9)._m0[81].y, _4143);
    bool _4155 = _4099 >= 0.0;
    bool _4157 = isnan(_4099);
    bool _4159 = _4155 || _4157;
    bool _4161 = isnan(0.0);
    bool _4163 = _4159 || _4161;
    float _4165 = _3985 * (*spvDescriptorSet0.vp_c9)._m0[100].y;
    int _4167 = _3033 + _4145;
    float _4169 = fma(_4165, _3485, -0.5);
    int _4171 = ~_3975;
    int _4173 = _4171 + _4035;
    int _4175 = _4173 + 1;
    float _4177 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _4179 = _3817 + _4177;
    int _4181 = _4167 >> 2;
    float _4183 = fma(_4031, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    int _4185 = _3191 >> 31;
    float _4187 = _4115 * (*spvDescriptorSet0.vp_c9)._m0[82].x;
    float _4189 = _4179 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    int _4191 = _1854 * _4175;
    int _4193 = _4191 + _2415;
    int _4195 = _4185 & 3;
    float _4197 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _4199 = _3853 + _4197;
    float _4201 = fma(_4085, (*spvDescriptorSet0.vp_c8)._m0[28].x, _4189);
    int _4203 = _3313 >> 31;
    float _4205 = (*spvDescriptorSet0.vp_c9)._m0[87].x + (*spvDescriptorSet0.vp_c9)._m0[86].z;
    int _4207 = _3191 + _4195;
    float _4209 = fma(_4199, (*spvDescriptorSet0.vp_c8)._m0[28].z, _4201);
    int _4211 = _4203 & 3;
    float _4213 = -_4205;
    float _4215 = fma(_4025, 2.0, _4213);
    bool _4217 = !_2861;
    int _4219 = _4217 ? _4149 : (-1);
    float _4221 = -_160;
    float _4223 = fma(_4221, (*spvDescriptorSet0.vp_c9)._m0[86].x, _4215);
    int _4225 = _3241 >> 31;
    float _4227 = (*spvDescriptorSet0.vp_c9)._m0[83].z + (*spvDescriptorSet0.vp_c9)._m0[83].x;
    int _4229 = _4207 >> 2;
    bool _4231 = !_3013;
    int _4233 = _4231 ? _4193 : (-1);
    float _4235 = fma(_4121, (*spvDescriptorSet0.vp_c9)._m0[83].z, _4227);
    int _4237 = _3313 + _4211;
    bool _4239 = _4209 >= 0.0;
    float _4241 = fma(_160, (*spvDescriptorSet0.vp_c9)._m0[82].z, _4235);
    bool _4243 = _3199 != 3;
    int _4245 = _4225 & 3;
    int _4247 = _4229 << 4;
    int _4249 = _4247 + 512;
    float _4251 = (*spvDescriptorSet0.vp_c9)._m0[98].w + (*spvDescriptorSet0.vp_c9)._m0[98].y;
    bool _4253 = !_2783;
    int _4255 = _4253 ? _4131 : (-1);
    int _4257 = _4181 << 4;
    int _4259 = _4257 + 368;
    float _4261 = fma(_3909, (*spvDescriptorSet0.vp_c9)._m0[98].w, _4251);
    bool _4263 = _3045 != 3;
    float _4265 = _3909 * (*spvDescriptorSet0.vp_c9)._m0[97].y;
    int _4267 = _4237 >> 2;
    uint _4269 = uint(int(uint(_4259) >> uint(2)));
    uint _4271 = uint(int(uint(int(_4269)) >> uint(2)));
    int _4273 = int(_4269) & 3;
    float _4275 = (*spvDescriptorSet0.vp_c9)._m0[int(_4271)][_4273];
    int _4277 = int(_4269) + 1;
    uint _4279 = uint(int(uint(_4277) >> uint(2)));
    int _4281 = _4277 & 3;
    float _4283 = (*spvDescriptorSet0.vp_c9)._m0[int(_4279)][_4281];
    float _4285 = fma(_160, (*spvDescriptorSet0.vp_c9)._m0[97].w, _4261);
    int _4287 = _3241 + _4245;
    float _4289 = as_type<float>(_4225);
    if (_4239)
    {
        out.m_49.x = 0.0;
    }
    bool _4291 = !_2715;
    int _4293 = _4291 ? _4103 : (-1);
    float _4295 = (*spvDescriptorSet0.vp_c9)._m0[82].x + (*spvDescriptorSet0.vp_c9)._m0[81].z;
    uint _4297 = uint(int(uint(_4249) >> uint(2)));
    uint _4299 = uint(int(uint(int(_4297)) >> uint(2)));
    int _4301 = int(_4297) & 3;
    float _4303 = (*spvDescriptorSet0.vp_c9)._m0[int(_4299)][_4301];
    int _4305 = int(_4297) + 1;
    uint _4307 = uint(int(uint(_4305) >> uint(2)));
    int _4309 = _4305 & 3;
    float _4311 = (*spvDescriptorSet0.vp_c9)._m0[int(_4307)][_4309];
    float _4313 = -_4295;
    float _4315 = fma(_4187, 2.0, _4313);
    float _4317 = (*spvDescriptorSet0.vp_c9)._m0[83].w + (*spvDescriptorSet0.vp_c9)._m0[83].y;
    int _4319 = _4287 >> 2;
    float _4321 = (*spvDescriptorSet0.vp_c9)._m0[97].y + (*spvDescriptorSet0.vp_c9)._m0[96].w;
    bool _4323 = !_3047;
    int _4325 = _4323 ? 0 : 1;
    float _4327 = (*spvDescriptorSet0.vp_c9)._m0[98].z + (*spvDescriptorSet0.vp_c9)._m0[98].x;
    float _4329 = fma(_4141, (*spvDescriptorSet0.vp_c9)._m0[83].w, _4317);
    int _4331 = _3241 & 3;
    bool _4333 = _4331 != 0;
    float _4335 = fma(_4265, -2.0, _4321);
    int _4337 = _4319 << 4;
    int _4339 = _4337 + 656;
    float _4341 = fma(_3859, (*spvDescriptorSet0.vp_c9)._m0[98].z, _4327);
    int _4343 = _4267 << 4;
    int _4345 = _4343 + 800;
    float _4347 = (*spvDescriptorSet0.vp_c9)._m0[97].x + (*spvDescriptorSet0.vp_c9)._m0[96].z;
    float _4349 = _3859 * (*spvDescriptorSet0.vp_c9)._m0[97].x;
    int _4351 = _3191 & 3;
    bool _4353 = _4351 != 0;
    float _4355 = fma(_160, (*spvDescriptorSet0.vp_c9)._m0[97].z, _4341);
    bool _4357 = !_4333;
    int _4359 = _4357 ? 0 : 1;
    uint _4361 = uint(int(uint(_4339) >> uint(2)));
    uint _4363 = uint(int(uint(int(_4361)) >> uint(2)));
    int _4365 = int(_4361) & 3;
    float _4367 = (*spvDescriptorSet0.vp_c9)._m0[int(_4363)][_4365];
    int _4369 = int(_4361) + 1;
    uint _4371 = uint(int(uint(_4369) >> uint(2)));
    int _4373 = _4369 & 3;
    float _4375 = (*spvDescriptorSet0.vp_c9)._m0[int(_4371)][_4373];
    int _4377 = _3313 & 3;
    bool _4379 = _4377 != 0;
    float _4381 = (*spvDescriptorSet0.vp_c9)._m0[87].y + (*spvDescriptorSet0.vp_c9)._m0[86].w;
    if (_4239)
    {
        _4289 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _4383 = _4289;
    float _4385 = fma(_160, (*spvDescriptorSet0.vp_c9)._m0[96].y, _4335);
    float _4387 = -_4347;
    float _4389 = fma(_4349, 2.0, _4387);
    int _4391 = abs(_3101);
    float _4393 = fma(_4037, -2.0, _4381);
    uint _4395 = uint(int(uint(_4345) >> uint(2)));
    uint _4397 = uint(int(uint(int(_4395)) >> uint(2)));
    int _4399 = int(_4395) & 3;
    float _4401 = (*spvDescriptorSet0.vp_c9)._m0[int(_4397)][_4399];
    int _4403 = int(_4395) + 1;
    uint _4405 = uint(int(uint(_4403) >> uint(2)));
    int _4407 = _4403 & 3;
    float _4409 = (*spvDescriptorSet0.vp_c9)._m0[int(_4405)][_4407];
    float _4411 = -_160;
    float _4413 = fma(_4411, (*spvDescriptorSet0.vp_c9)._m0[96].x, _4389);
    int _4415 = as_type<int>(_4383);
    if (_4239)
    {
        float _4417 = _4383 * 5.0;
        _4415 = as_type<int>(_4417);
    }
    int _4419 = _4415;
    int _4421 = abs(_3269);
    float _4423 = fma(_160, (*spvDescriptorSet0.vp_c9)._m0[82].w, _4329);
    float _4425 = fma(_4355, _3819, _4413);
    int _4427 = abs(_3375);
    int _4429 = _4259 + 8;
    uint _4431 = uint(int(uint(_4429) >> uint(2)));
    uint _4433 = uint(int(uint(int(_4431)) >> uint(2)));
    int _4435 = int(_4431) & 3;
    float _4437 = (*spvDescriptorSet0.vp_c9)._m0[int(_4433)][_4435];
    int _4439 = int(_4431) + 1;
    uint _4441 = uint(int(uint(_4439) >> uint(2)));
    int _4443 = _4439 & 3;
    float _4445 = (*spvDescriptorSet0.vp_c9)._m0[int(_4441)][_4443];
    if (_4239)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _13829 = as_type<float>(_4419);
        out.gl_Position.z = _13829;
    }
    float _4447 = -_160;
    float _4449 = fma(_4447, (*spvDescriptorSet0.vp_c9)._m0[81].x, _4315);
    bool _4451 = !_4353;
    int _4453 = _4451 ? 0 : 1;
    float _4455 = fma(_160, (*spvDescriptorSet0.vp_c9)._m0[86].y, _4393);
    int _4457 = abs(_4325);
    float _4459 = -_4385;
    float _4461 = fma(_4285, _4169, _4459);
    int _4463 = _4249 + 8;
    uint _4465 = uint(int(uint(_4463) >> uint(2)));
    uint _4467 = uint(int(uint(int(_4465)) >> uint(2)));
    int _4469 = int(_4465) & 3;
    float _4471 = (*spvDescriptorSet0.vp_c9)._m0[int(_4467)][_4469];
    int _4473 = int(_4465) + 1;
    uint _4475 = uint(int(uint(_4473) >> uint(2)));
    int _4477 = _4473 & 3;
    float _4479 = (*spvDescriptorSet0.vp_c9)._m0[int(_4475)][_4477];
    int _4481 = abs(_3333);
    int _4483 = abs(_4453);
    int _4485 = ~_4421;
    int _4487 = _4485 + 1;
    int _4489 = _4487 + 1;
    int _4491 = _4339 + 8;
    uint _4493 = uint(int(uint(_4491) >> uint(2)));
    uint _4495 = uint(int(uint(int(_4493)) >> uint(2)));
    int _4497 = int(_4493) & 3;
    float _4499 = (*spvDescriptorSet0.vp_c9)._m0[int(_4495)][_4497];
    int _4501 = int(_4493) + 1;
    uint _4503 = uint(int(uint(_4501) >> uint(2)));
    int _4505 = _4501 & 3;
    float _4507 = (*spvDescriptorSet0.vp_c9)._m0[int(_4503)][_4505];
    int _4509 = ~_4391;
    int _4511 = _4509 + 1;
    int _4513 = _4511 + 1;
    int _4515 = _4489 * as_type<int>(_4311);
    bool _4517 = !_4379;
    int _4519 = _4517 ? 0 : 1;
    int _4521 = _4345 + 8;
    uint _4523 = uint(int(uint(_4521) >> uint(2)));
    uint _4525 = uint(int(uint(int(_4523)) >> uint(2)));
    int _4527 = int(_4523) & 3;
    float _4529 = (*spvDescriptorSet0.vp_c9)._m0[int(_4525)][_4527];
    int _4531 = int(_4523) + 1;
    uint _4533 = uint(int(uint(_4531) >> uint(2)));
    int _4535 = _4531 & 3;
    float _4537 = (*spvDescriptorSet0.vp_c9)._m0[int(_4533)][_4535];
    int _4539 = ~_4457;
    int _4541 = _4539 + 1;
    int _4543 = _4541 + 1;
    int _4545 = _4513 * as_type<int>(_4283);
    int _4547 = ~_4483;
    int _4549 = _4547 + 1;
    int _4551 = _4549 + 1;
    float _4553 = trunc((*spvDescriptorSet0.vp_c9)._m0[90].z);
    int _4555 = int(_4553);
    bool _4557 = _3271 != 3;
    int _4559 = _4543 * as_type<int>(_4275);
    int _4561 = _4559 + _4545;
    bool _4563 = !_4263;
    int _4565 = _4563 ? 0 : (-1);
    int _4567 = _4551 * as_type<int>(_4303);
    int _4569 = _4567 + _4515;
    bool _4571 = _3325 != 3;
    int _4573 = abs(_4519);
    bool _4575 = !_4243;
    int _4577 = _4575 ? 0 : (-1);
    bool _4579 = !_4557;
    int _4581 = _4579 ? 0 : (-1);
    int _4583 = ~_4481;
    int _4585 = _4583 + 1;
    int _4587 = _4585 + 1;
    int _4589 = abs(_3165);
    int _4591 = abs(_3253);
    int _4593 = _4587 * as_type<int>(_4375);
    int _4595 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _4597 = _4595 != 0;
    int _4599 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _4601 = _4599 != 0;
    int _4603 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _4605 = _4603 != 0;
    int _4607 = ~_4427;
    int _4609 = _4607 + 1;
    int _4611 = _4609 + 1;
    float _4613 = trunc((*spvDescriptorSet0.vp_c9)._m0[85].z);
    int _4615 = int(_4613);
    int _4617 = ~_4589;
    int _4619 = _4617 + 1;
    int _4621 = _4619 + 1;
    int _4623 = _4611 * as_type<int>(_4409);
    int _4625 = ~_4573;
    int _4627 = _4625 + 1;
    int _4629 = _4627 + 1;
    int _4631 = ~_4591;
    int _4633 = _4631 + 1;
    int _4635 = _4633 + 1;
    int _4637 = _4621 * as_type<int>(_4437);
    int _4639 = _4637 + _4561;
    int _4641 = abs(_4359);
    int _4643 = _4629 * as_type<int>(_4401);
    int _4645 = _4643 + _4623;
    int _4647 = abs(_3323);
    int _4649 = _4635 * as_type<int>(_4471);
    int _4651 = _4649 + _4569;
    int _4653 = ~_4641;
    int _4655 = _4653 + 1;
    int _4657 = _4655 + 1;
    float _4659 = trunc((*spvDescriptorSet0.vp_c9)._m0[95].z);
    int _4661 = int(_4659);
    int _4663 = abs(_3393);
    int _4665 = abs(_4577);
    int _4667 = _4657 * as_type<int>(_4367);
    int _4669 = _4667 + _4593;
    float _4671 = float(uint(_4139));
    int _4673 = ~_4647;
    int _4675 = _4673 + 1;
    int _4677 = _4675 + 1;
    float _4679 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _4681 = log2(_4679);
    int _4683 = ~_4663;
    int _4685 = _4683 + 1;
    int _4687 = _4685 + 1;
    int _4689 = ~_4665;
    int _4691 = _4689 + 1;
    int _4693 = _4691 + 1;
    int _4695 = _4677 * as_type<int>(_4499);
    int _4697 = _4695 + _4669;
    int _4699 = abs(_4565);
    int _4701 = _4687 * as_type<int>(_4529);
    int _4703 = _4701 + _4645;
    float _4705 = float(uint(_4615));
    float _4707 = 1.0 / _4671;
    int _4709 = _4693 * as_type<int>(_4479);
    int _4711 = _4709 + _4651;
    int _4713 = ~_4699;
    int _4715 = _4713 + 1;
    int _4717 = _4715 + 1;
    float _4719 = float(uint(_4555));
    int _4721 = abs(_4581);
    int _4723 = _4717 * as_type<int>(_4445);
    int _4725 = _4723 + _4639;
    int _4727 = abs(_3181);
    float _4729 = 1.0 / _4705;
    int _4731 = abs(_3417);
    float _4733 = _4681 * _160;
    int _4735 = ~_4721;
    int _4737 = _4735 + 1;
    int _4739 = _4737 + 1;
    int _4741 = ~_4727;
    int _4743 = _4741 + 1;
    int _4745 = _4743 + 1;
    bool _4747 = !_4571;
    int _4749 = _4747 ? 0 : (-1);
    float _4751 = 1.0 / _4719;
    int _4753 = abs(_3399);
    int _4755 = _4739 * as_type<int>(_4507);
    int _4757 = _4755 + _4697;
    int _4759 = abs(_4749);
    int _4761 = _4725 * _4745;
    int _4763 = ~_4753;
    int _4765 = _4763 + 1;
    int _4767 = _4765 + 1;
    int _4769 = as_type<int>(_4707) + (-2);
    int _4771 = _4233 * _4727;
    int _4773 = _4771 + _4761;
    int _4775 = ~_4731;
    int _4777 = _4775 + 1;
    int _4779 = _4777 + 1;
    int _4781 = _4767 * _4757;
    float _4783 = exp2(_4733);
    float _4785 = float(uint(_4773));
    int _4787 = _4779 * _4711;
    int _4789 = ~_4759;
    int _4791 = _4789 + 1;
    int _4793 = _4791 + 1;
    int _4795 = _4255 * _4753;
    int _4797 = _4795 + _4781;
    int _4799 = as_type<int>(_4729) + (-2);
    int _4801 = _4293 * _4731;
    int _4803 = _4801 + _4787;
    int _4805 = abs(_3629);
    int _4807 = _4793 * as_type<int>(_4537);
    int _4809 = _4807 + _4703;
    float _4811 = as_type<float>(_4769) * _4785;
    int _4813 = as_type<int>(_4751) + (-2);
    float _4815 = float(uint(_4803));
    float _4817 = float(uint(_4797));
    float _4819 = trunc(_4811);
    float _4821 = precise::max(_4819, 0.0);
    uint _4823 = uint(_4821);
    int _4825 = ~_4805;
    int _4827 = _4825 + 1;
    int _4829 = _4827 + 1;
    float _4831 = as_type<float>(_4799) * _4815;
    float _4833 = float(uint(_4661));
    float _4835 = as_type<float>(_4813) * _4817;
    int _4837 = _4163 ? 0 : 1;
    int _4839 = _4829 * _4809;
    int _4841 = abs(_4139);
    float _4843 = trunc(_4831);
    float _4845 = precise::max(_4843, 0.0);
    uint _4847 = uint(_4845);
    int _4849 = ~_4837;
    int _4851 = _4849 + 1;
    int _4853 = _4851 + 1;
    int _4855 = _4219 * _4805;
    int _4857 = _4855 + _4839;
    int _4859 = _4853;
    float _4861 = _4449;
    if (!_4151)
    {
        int _4863 = ~_4837;
        int _4865 = _4863 + 1;
        _4859 = _4865;
    }
    int _4867 = _4859;
    float _4869 = -_4783;
    float _4871 = _4869 + 1.0;
    int _4873 = ~_4139;
    int _4875 = _4873 + 1;
    int _4877 = ~_4615;
    int _4879 = _4877 + 1;
    float _4881 = trunc(_4835);
    float _4883 = precise::max(_4881, 0.0);
    uint _4885 = uint(_4883);
    int _4887 = abs(_4615);
    int _4889 = _4875 * int(_4823);
    int _4891 = _4889 + _4773;
    float _4893 = float(uint(_4841));
    int _4895 = ~_4555;
    int _4897 = _4895 + 1;
    float _4899 = float(uint(_4887));
    float _4901 = 1.0 / _4833;
    int _4903 = _4879 * int(_4847);
    int _4905 = _4903 + _4803;
    int _4907 = abs(_4555);
    float _4909 = float(uint(_4891));
    float _4911 = float(uint(_4905));
    float _4913 = 1.0 / _4893;
    int _4915 = _4897 * int(_4885);
    int _4917 = _4915 + _4797;
    float _4919 = float(uint(_4907));
    float _4921 = as_type<float>(_4769) * _4909;
    int _4923 = abs(_4661);
    float _4925 = as_type<float>(_4799) * _4911;
    float _4927 = float(uint(_4917));
    float _4929 = 1.0 / _4899;
    int _4931 = as_type<int>(_4901) + (-2);
    float _4933 = as_type<float>(_4813) * _4927;
    float _4935 = float(uint(_4857));
    float _4937 = float(uint(_4923));
    float _4939 = 1.0 / _4919;
    int _4941 = abs(_4773);
    float _4943 = as_type<float>(_4931) * _4935;
    int _4945 = abs(_4803);
    int _4947 = as_type<int>(_4913) + (-2);
    float _4949 = float(uint(_4941));
    float _4951 = 1.0 / _4937;
    int _4953 = as_type<int>(_4929) + (-2);
    float _4955 = as_type<float>(_4947) * _4949;
    float _4957 = float(uint(_4945));
    bool _4959 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _4961 = isnan(1.0);
    bool _4963 = _4959 || _4961;
    bool _4965 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _4967 = _4963 || _4965;
    float _4969 = trunc(_4943);
    float _4971 = precise::max(_4969, 0.0);
    uint _4973 = uint(_4971);
    float _4975 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _4977 = 1.0 + _4975;
    int _4979 = abs(_4797);
    float _4981 = as_type<float>(_4953) * _4957;
    float _4983 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    int _4985 = as_type<int>(_4939) + (-2);
    float _4987 = trunc(_4955);
    float _4989 = precise::max(_4987, 0.0);
    uint _4991 = uint(_4989);
    float _4993 = float(uint(_4979));
    float _4995 = (*spvDescriptorSet0.vp_c9)._m0[88].w + (*spvDescriptorSet0.vp_c9)._m0[88].y;
    float _4997 = as_type<float>(_4985) * _4993;
    int _4999 = abs(_4857);
    float _5001 = 1.0 / _4977;
    int _5003 = ~_4661;
    int _5005 = _5003 + 1;
    float _5007 = fma(_1846, (*spvDescriptorSet0.vp_c9)._m0[78].w, _4983);
    float _5009 = fma(_1846, (*spvDescriptorSet0.vp_c9)._m0[88].w, _4995);
    float _5011 = (*spvDescriptorSet0.vp_c9)._m0[88].z + (*spvDescriptorSet0.vp_c9)._m0[88].x;
    int _5013 = as_type<int>(_4951) + (-2);
    float _5015 = fma(_160, (*spvDescriptorSet0.vp_c9)._m0[77].w, _5007);
    float _5017 = float(uint(_4999));
    float _5019 = trunc(_4981);
    float _5021 = precise::max(_5019, 0.0);
    uint _5023 = uint(_5021);
    bool _5025 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _5027 = isnan(0.0);
    bool _5029 = _5025 || _5027;
    bool _5031 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _5033 = _5029 || _5031;
    float _5035 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    float _5037 = fma(_160, (*spvDescriptorSet0.vp_c9)._m0[87].w, _5009);
    int _5039 = _5005 * int(_4973);
    int _5041 = _5039 + _4857;
    int _5043 = ~_4841;
    int _5045 = _5043 + 1;
    float _5047 = fma(_2121, (*spvDescriptorSet0.vp_c9)._m0[88].z, _5011);
    float _5049 = as_type<float>(_5013) * _5017;
    float _5051 = trunc(_4997);
    float _5053 = precise::max(_5051, 0.0);
    uint _5055 = uint(_5053);
    float _5057 = fma(_2121, (*spvDescriptorSet0.vp_c9)._m0[78].z, _5035);
    float _5059 = _5033 ? _4871 : 0.0;
    float _5061 = fma(_160, (*spvDescriptorSet0.vp_c9)._m0[87].z, _5047);
    float _5063 = float(uint(_5041));
    int _5065 = _5045 * int(_4991);
    int _5067 = _5065 + _4941;
    int _5069 = ~_4887;
    int _5071 = _5069 + 1;
    float _5073 = fma(_160, (*spvDescriptorSet0.vp_c9)._m0[77].z, _5057);
    float _5075 = trunc(_4925);
    float _5077 = precise::max(_5075, 0.0);
    uint _5079 = uint(_5077);
    if (_4967)
    {
        float _5081 = _5059 * _5001;
        _162 = _5081;
    }
    float _5083 = _162;
    float _5085 = as_type<float>(_4931) * _5063;
    float _5087 = float(uint(_5067));
    int _5089 = _5071 * int(_5023);
    int _5091 = _5089 + _4945;
    float _5093 = trunc(_4921);
    float _5095 = precise::max(_5093, 0.0);
    uint _5097 = uint(_5095);
    int _5099 = ~_4907;
    int _5101 = _5099 + 1;
    float _5103 = as_type<float>(_4947) * _5087;
    float _5105 = trunc(_5049);
    float _5107 = precise::max(_5105, 0.0);
    uint _5109 = uint(_5107);
    int _5111 = int(_4847) + int(_5079);
    int _5113 = _5101 * int(_5055);
    int _5115 = _5113 + _4979;
    int _5117 = ~_4661;
    int _5119 = _5117 + 1;
    float _5121 = float(uint(_5115));
    float _5123 = trunc(_5085);
    float _5125 = precise::max(_5123, 0.0);
    uint _5127 = uint(_5125);
    int _5129 = int(_4823) + int(_5097);
    int _5131 = ~_4923;
    int _5133 = _5131 + 1;
    float _5135 = as_type<float>(_4985) * _5121;
    float _5137 = trunc(_4933);
    float _5139 = precise::max(_5137, 0.0);
    uint _5141 = uint(_5139);
    float _5143 = trunc(_5135);
    float _5145 = precise::max(_5143, 0.0);
    uint _5147 = uint(_5145);
    float _5149 = float(uint(_5091));
    int _5151 = ~_4139;
    int _5153 = _5151 + 1;
    int _5155 = int(_4973) + int(_5127);
    float _5157 = as_type<float>(_4953) * _5149;
    int _5159 = _5133 * int(_5109);
    int _5161 = _5159 + _4999;
    float _5163 = trunc(_5103);
    float _5165 = precise::max(_5163, 0.0);
    uint _5167 = uint(_5165);
    int _5169 = ~_4615;
    int _5171 = _5169 + 1;
    float _5173 = float(uint(_5161));
    int _5175 = _5153 * _5129;
    int _5177 = _5175 + _4773;
    int _5179 = ~_4555;
    int _5181 = _5179 + 1;
    float _5183 = as_type<float>(_5013) * _5173;
    float _5185 = trunc(_5157);
    float _5187 = precise::max(_5185, 0.0);
    uint _5189 = uint(_5187);
    int _5191 = _5171 * _5111;
    int _5193 = _5191 + _4803;
    int _5195 = int(_4885) + int(_5141);
    int _5197 = _5119 * _5155;
    int _5199 = _5197 + _4857;
    bool _5201 = uint(_5193) >= uint(_4615);
    float _5203 = trunc(_5183);
    float _5205 = precise::max(_5203, 0.0);
    uint _5207 = uint(_5205);
    bool _5209 = uint(_5177) >= uint(_4139);
    int _5211 = _5181 * _5195;
    int _5213 = _5211 + _4797;
    int _5215 = int(_5055) + int(_5147);
    int _5217 = int(_4991) + int(_5167);
    int _5219 = ~_4841;
    int _5221 = _5219 + 1;
    bool _5223 = !_5201;
    int _5225 = _5223 ? 0 : (-1);
    bool _5227 = uint(_5199) >= uint(_4661);
    int _5229 = _5221 * _5217;
    int _5231 = _5229 + _4941;
    int _5233 = ~_4907;
    int _5235 = _5233 + 1;
    bool _5237 = !_5209;
    int _5239 = _5237 ? 0 : (-1);
    bool _5241 = uint(_5213) >= uint(_4555);
    int _5243 = _5235 * _5215;
    int _5245 = _5243 + _4979;
    int _5247 = int(_5023) + int(_5189);
    int _5249 = ~_4887;
    int _5251 = _5249 + 1;
    bool _5253 = !_5241;
    int _5255 = _5253 ? 0 : (-1);
    bool _5257 = uint(_5231) >= uint(_4841);
    int _5259 = _5251 * _5247;
    int _5261 = _5259 + _4945;
    int _5263 = ~_4923;
    int _5265 = _5263 + 1;
    bool _5267 = !_5257;
    int _5269 = _5267 ? 0 : (-1);
    bool _5271 = uint(_5245) >= uint(_4907);
    float _5273 = _4179 * _4179;
    int _5275 = int(_5109) + int(_5207);
    float _5277 = fma(_4085, _4085, _5273);
    bool _5279 = !_5227;
    int _5281 = _5279 ? 0 : (-1);
    bool _5283 = uint(_5261) >= uint(_4887);
    float _5285 = fma(_4199, _4199, _5277);
    int _5287 = _5265 * _5275;
    int _5289 = _5287 + _4999;
    int _5291 = ~_5129;
    int _5293 = _5291 + _5239;
    int _5295 = _5293 + 1;
    float _5297 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    bool _5299 = !_5283;
    int _5301 = _5299 ? 0 : (-1);
    bool _5303 = uint(_5289) >= uint(_4923);
    int _5305 = _4139 * _5295;
    int _5307 = _5305 + _4773;
    int _5309 = ~_5195;
    int _5311 = _5309 + _5255;
    int _5313 = _5311 + 1;
    bool _5315 = !_5271;
    int _5317 = _5315 ? 0 : (-1);
    float _5319 = rsqrt(_5285);
    bool _5321 = _4139 == 0;
    int _5323 = ~_5111;
    int _5325 = _5323 + _5225;
    int _5327 = _5325 + 1;
    int _5329 = ~_5155;
    int _5331 = _5329 + _5281;
    int _5333 = _5331 + 1;
    int _5335 = _4555 * _5313;
    int _5337 = _5335 + _4797;
    bool _5339 = !_5321;
    int _5341 = _5339 ? _5307 : (-1);
    int _5343 = _4615 * _5327;
    int _5345 = _5343 + _4803;
    bool _5347 = _4555 == 0;
    float _5349 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    int _5351 = _4803 ^ _4615;
    float _5353 = _5297 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    bool _5355 = !_5347;
    int _5357 = _5355 ? _5337 : (-1);
    bool _5359 = _4139 == 0;
    float _5361 = _4179 * _5319;
    int _5363 = _4773 ^ _4139;
    float _5365 = _4085 * _5319;
    uint _5367 = uint(int(uint(_5351) >> uint(31)));
    float _5369 = -_5361;
    float _5371 = fma(_5369, (*spvDescriptorSet0.vp_c9)._m0[18].w, _4179);
    int _5373 = ~_5269;
    int _5375 = _5217 + _5373;
    int _5377 = _5375 + 1;
    float _5379 = _4425 + 0.5;
    uint _5381 = uint(int(uint(_5363) >> uint(31)));
    float _5383 = _5371 * _5371;
    int _5385 = ~_5301;
    int _5387 = _5247 + _5385;
    int _5389 = _5387 + 1;
    float _5391 = _4461 + 0.5;
    int _5393 = ~int(_5367);
    int _5395 = _5393 + 1;
    float _5397 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    bool _5399 = !_5303;
    int _5401 = _5399 ? 0 : (-1);
    float _5403 = -_5365;
    float _5405 = fma(_5403, (*spvDescriptorSet0.vp_c9)._m0[18].w, _4085);
    bool _5407 = _4615 == 0;
    out.m_73.x = _5379;
    out.m_73.y = _5391;
    int _5409 = ~int(_5381);
    int _5411 = _5409 + 1;
    float _5413 = fma(_5405, _5405, _5383);
    int _5415 = _5389 ^ _5395;
    float _5417 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].z;
    bool _5419 = !_5407;
    int _5421 = _5419 ? _5345 : (-1);
    int _5423 = _4661 * _5333;
    int _5425 = _5423 + _4857;
    int _5427 = _5377 ^ _5411;
    float _5429 = fma(_5353, _2163, -0.5);
    bool _5431 = _4661 == 0;
    float _5433 = _5349 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    int _5435 = ~_5395;
    int _5437 = _5435 + _5415;
    int _5439 = _5437 + 1;
    float _5441 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    int _5443 = ~_5411;
    int _5445 = _5443 + _5427;
    int _5447 = _5445 + 1;
    float _5449 = _5397 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    bool _5451 = !_5431;
    int _5453 = _5451 ? _5425 : (-1);
    float _5455 = float(_5341);
    float _5457 = fma(_5449, _2227, -0.5);
    bool _5459 = _4615 == 0;
    float _5461 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[95].z;
    bool _5463 = !_5359;
    int _5465 = _5463 ? _5447 : (-1);
    float _5467 = fma(_5353, _5455, _3981);
    bool _5469 = _4555 == 0;
    float _5471 = _5417 * (*spvDescriptorSet0.vp_c9)._m0[90].x;
    int _5473 = _4797 ^ _4555;
    float _5475 = fma(_5073, _5429, _5467);
    bool _5477 = !_5459;
    int _5479 = _5477 ? _5439 : (-1);
    float _5481 = fma(_5471, _2249, -0.5);
    int _5483 = _4857 ^ _4661;
    float _5485 = _5441 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    float _5487 = float(_5357);
    bool _5489 = _4661 == 0;
    float _5491 = float(_5421);
    float _5493 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].w;
    uint _5495 = uint(int(uint(_5473) >> uint(31)));
    float _5497 = fma(_5471, _5487, _4223);
    uint _5499 = uint(int(uint(_5483) >> uint(31)));
    float _5501 = fma(_5449, _5491, _4449);
    int _5503 = ~_5317;
    int _5505 = _5215 + _5503;
    int _5507 = _5505 + 1;
    float _5509 = _5461 * (*spvDescriptorSet0.vp_c9)._m0[95].x;
    int _5511 = ~int(_5495);
    int _5513 = _5511 + 1;
    float _5515 = fma(_5061, _5481, _5497);
    float _5517 = float(_5453);
    float _5519 = fma(_5509, _2259, -0.5);
    int _5521 = ~_5401;
    int _5523 = _5275 + _5521;
    int _5525 = _5523 + 1;
    float _5527 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[95].w;
    int _5529 = ~int(_5499);
    int _5531 = _5529 + 1;
    float _5533 = fma(_5509, _5517, _4051);
    float _5535 = float(_5465);
    float _5537 = fma(_5433, _3421, -0.5);
    float _5539 = float(_5479);
    float _5541 = fma(_4241, _5457, _5501);
    int _5543 = _5507 ^ _5513;
    float _5545 = -_3349;
    float _5547 = fma(_5433, _5535, _5545);
    int _5549 = _5525 ^ _5531;
    float _5551 = fma(_5485, _3429, -0.5);
    int _5553 = ~_5513;
    int _5555 = _5553 + _5543;
    int _5557 = _5555 + 1;
    float _5559 = -_4153;
    float _5561 = fma(_5485, _5539, _5559);
    int _5563 = ~_5531;
    int _5565 = _5563 + _5549;
    int _5567 = _5565 + 1;
    float _5569 = _4199 * _5319;
    float _5571 = _5493 * (*spvDescriptorSet0.vp_c9)._m0[90].y;
    bool _5573 = !_5469;
    int _5575 = _5573 ? _5557 : (-1);
    float _5577 = fma(_5015, _5537, _5547);
    bool _5579 = !_5489;
    int _5581 = _5579 ? _5567 : (-1);
    float _5583 = -_5569;
    float _5585 = fma(_5583, (*spvDescriptorSet0.vp_c9)._m0[18].w, _4199);
    float _5587 = float(_5575);
    float _5589 = fma(_3929, _5519, _5533);
    float _5591 = float(_5581);
    float _5593 = _5577 + 0.5;
    float _5595 = fma(_5585, _5585, _5413);
    float _5597 = _5527 * (*spvDescriptorSet0.vp_c9)._m0[95].y;
    float _5599 = in.m_75.x;
    float _5601 = in.m_75.y;
    float _5603 = in.m_75.z;
    float _5605 = fma(_5571, _3443, -0.5);
    float _5607 = -_4455;
    float _5609 = fma(_5571, _5587, _5607);
    float _5611 = fma(_5597, _3445, -0.5);
    float _5613 = -_4061;
    float _5615 = fma(_5597, _5591, _5613);
    float _5617 = fma(_4423, _5551, _5561);
    float _5619 = fma(_5037, _5605, _5609);
    float _5621 = _5515 + 0.5;
    float _5623 = fma(_3931, _5611, _5615);
    float _5625 = _5475 + 0.5;
    float _5627 = _5541 + 0.5;
    float _5629 = _5617 + 0.5;
    float _5631 = _5589 + 0.5;
    float _5633 = _5619 + 0.5;
    float _5635 = _5623 + 0.5;
    bool _5637 = !_4597;
    int _5639 = _5637 ? 0 : 1;
    out.m_77.x = _5625;
    out.m_77.y = _5593;
    out.m_77.z = _5627;
    out.m_77.w = _5629;
    bool _5641 = !_4601;
    int _5643 = _5641 ? 0 : 1;
    int _5645 = abs(_5639);
    out.m_79.x = _5621;
    out.m_79.y = _5633;
    float _5647 = float(_4867);
    int _5649 = abs(_5643);
    out.m_81.x = _5631;
    out.m_81.y = _5635;
    bool _5651 = !_4605;
    int _5653 = _5651 ? 0 : 1;
    float _5655 = float(_5645);
    float _5657 = _5627;
    float _5659 = as_type<float>(_5167);
    if (_4239)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _5661 = -_5361;
    float _5663 = fma(_5661, (*spvDescriptorSet0.vp_c9)._m0[18].w, _3817);
    float _5665 = float(_5649);
    float _5667 = -_5365;
    float _5669 = fma(_5667, (*spvDescriptorSet0.vp_c9)._m0[18].w, _3843);
    float _5671 = _5655 * _5647;
    float _5673 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _5675 = _5663 + _5673;
    float _5677 = float(_3581);
    float _5679 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _5681 = _5669 + _5679;
    float _5683 = _5671 * (-2.0);
    float _5685 = _5675 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _5687 = -_5569;
    float _5689 = fma(_5687, (*spvDescriptorSet0.vp_c9)._m0[18].w, _3853);
    float _5691 = _5665 * _5677;
    float _5693 = _1846 + _2127;
    float _5695 = fma(_5681, (*spvDescriptorSet0.vp_c8)._m0[28].x, _5685);
    float _5697 = _2121 + (-0.5);
    float _5699 = fma(_5683, _5599, _5599);
    float _5701 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _5703 = _5689 + _5701;
    float _5705 = _5693 + (-1.0);
    float _5707 = fma(_4183, _5683, _4183);
    float _5709 = fma(_5697, (*spvDescriptorSet0.vp_c9)._m0[196].x, _5699);
    float _5711 = _5691 * (-2.0);
    float _5713 = fma(_5703, (*spvDescriptorSet0.vp_c8)._m0[28].z, _5695);
    float _5715 = fma(_5705, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    float _5717 = fma(_5707, _5083, _5709);
    float _5719 = _1846 + (-0.5);
    float _5721 = fma(_5711, _5601, _5601);
    bool _5723 = _5713 >= 0.0;
    float _5725 = fma(_5715, _5711, _5715);
    int _5727 = abs(_5653);
    float _5729 = _5717 * 0.15915493667125701904296875;
    float _5731 = fma(_5719, (*spvDescriptorSet0.vp_c9)._m0[196].y, _5721);
    float _5733 = sqrt(_5595);
    float _5735 = fma(_5725, _5083, _5731);
    float _5737 = float(_3809);
    float _5739 = _2121 + _2127;
    float _5741 = float(_5727);
    float _5743 = _5735 * 0.15915493667125701904296875;
    float _5745 = _5689;
    float _5747 = _5663;
    if (_5723)
    {
        _5657 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _5749 = _5657;
    float _5751 = _5729 * 6.283185482025146484375;
    float _5753 = sin(_5751);
    int _5755 = as_type<int>(_5749);
    if (_5723)
    {
        out.m_49.x = 0.0;
    }
    float _5757 = _5741 * _5737;
    if (_5723)
    {
        float _5759 = _5749 * 5.0;
        _5755 = as_type<int>(_5759);
    }
    int _5761 = _5755;
    float _5763 = _5739 + (-1.0);
    float _5765 = _5757 * (-2.0);
    float _5767 = _5729 * 6.283185482025146484375;
    float _5769 = cos(_5767);
    if (_5723)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _15696 = as_type<float>(_5761);
        out.gl_Position.z = _15696;
    }
    float _5771 = _5743 * 6.283185482025146484375;
    float _5773 = sin(_5771);
    if (_5723)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _5775 = -_3817;
    float _5777 = _5775 + (*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _5779 = fma(_5763, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _5781 = -_3843;
    float _5783 = _5781 + (*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _5785 = -_3853;
    float _5787 = _5785 + (*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _5789 = _5777 * _5777;
    float _5791 = fma(_5765, _5603, _5603);
    float _5793 = _2127 + (-0.5);
    float _5795 = fma(_5779, _5765, _5779);
    float _5797 = fma(_5783, _5783, _5789);
    float _5799 = _5743 * 6.283185482025146484375;
    float _5801 = cos(_5799);
    float _5803 = fma(_5793, (*spvDescriptorSet0.vp_c9)._m0[196].z, _5791);
    float _5805 = _5319 * _5733;
    float _5807 = fma(_5787, _5787, _5797);
    float _5809 = _544 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _5811 = fma(_5795, _5083, _5803);
    float _5813 = _548 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _5815 = in.m_83.x;
    float _5817 = in.m_83.y;
    float _5819 = in.m_83.z;
    float _5821 = _5769 * _5773;
    float _5823 = rsqrt(_5807);
    float _5825 = _5811 * 0.15915493667125701904296875;
    float _5827 = _5753 * _5773;
    float _5829 = _5805 * _5813;
    float _5831 = _5769 * _5801;
    float _5833 = _5825 * 6.283185482025146484375;
    float _5835 = sin(_5833);
    float _5837 = _5783 * _5823;
    float _5839 = _5787 * _5823;
    float _5841 = _5777 * _5823;
    float _5843 = _5825 * 6.283185482025146484375;
    float _5845 = cos(_5843);
    float _5847 = -(*spvDescriptorSet0.vp_c8)._m0[1].z;
    float _5849 = _5837 * _5847;
    float _5851 = -(*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _5853 = _5839 * _5851;
    float _5855 = -(*spvDescriptorSet0.vp_c8)._m0[1].x;
    float _5857 = _5841 * _5855;
    float _5859 = -(*spvDescriptorSet0.vp_c8)._m0[1].x;
    float _5861 = -_5849;
    float _5863 = fma(_5839, _5859, _5861);
    float _5865 = -(*spvDescriptorSet0.vp_c8)._m0[1].z;
    float _5867 = -_5853;
    float _5869 = fma(_5841, _5865, _5867);
    float _5871 = -(*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _5873 = -_5857;
    float _5875 = fma(_5837, _5871, _5873);
    float _5877 = fma(_5835, _5831, _5827);
    float _5879 = _5863 * _5863;
    float _5881 = fma(_5835, _5827, _5831);
    float _5883 = _542 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _5885 = fma(_5869, _5869, _5879);
    float _5887 = _5753 * _5801;
    float _5889 = _5805 * _5883;
    float _5891 = fma(_5875, _5875, _5885);
    float _5893 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _5817);
    float _5895 = _5769 * _5845;
    float _5897 = _5805 * _5809;
    float _5899 = -_5821;
    float _5901 = fma(_5835, _5887, _5899);
    float _5903 = _5893 * _5889;
    float _5905 = rsqrt(_5891);
    float _5907 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _5819);
    float _5909 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _5815);
    float _5911 = _5753 * _5845;
    float _5913 = -_5887;
    float _5915 = fma(_5835, _5821, _5913);
    float _5917 = _5907 * _5897;
    float _5919 = _5909 * _5829;
    float _5921 = _5895 * _5903;
    float _5923 = _5801 * _5845;
    float _5925 = -_5903;
    float _5927 = _5835 * _5925;
    float _5929 = _5911 * _5903;
    float _5931 = fma(_5877, _5919, _5921);
    float _5933 = _5773 * _5845;
    float _5935 = fma(_5923, _5919, _5927);
    float _5937 = fma(_5901, _5919, _5929);
    float _5939 = fma(_5915, _5917, _5931);
    float _5941 = _5869 * _5905;
    float _5943 = _5863 * _5905;
    float _5945 = _5875 * _5905;
    float _5947 = fma(_5933, _5917, _5935);
    float _5949 = _5841 * _5941;
    float _5951 = _5839 * _5943;
    float _5953 = fma(_5881, _5917, _5937);
    float _5955 = _5663 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _5957 = -_5949;
    float _5959 = fma(_5837, _5943, _5957);
    float _5961 = -_5951;
    float _5963 = fma(_5841, _5945, _5961);
    float _5965 = fma(_5669, (*spvDescriptorSet0.vp_c8)._m0[11].x, _5955);
    float _5967 = _5959 * _5939;
    float _5969 = _5963 * _5939;
    float _5971 = fma(_5945, _5947, _5967);
    float _5973 = fma(_5941, _5947, _5969);
    float _5975 = _5837 * _5945;
    float _5977 = fma(_5839, _5953, _5971);
    float _5979 = fma(_5837, _5953, _5973);
    float _5981 = -_5975;
    float _5983 = fma(_5839, _5941, _5981);
    float _5985 = _3853 + _5977;
    float _5987 = _3843 + _5979;
    float _5989 = _5983 * _5939;
    float _5991 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _5993 = _5985 + _5991;
    float _5995 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _5997 = _5987 + _5995;
    float _5999 = _5993 * _5993;
    float _6001 = fma(_5997, _5997, _5999);
    float _6003 = fma(_5943, _5947, _5989);
    float _6005 = fma(_5689, (*spvDescriptorSet0.vp_c8)._m0[11].z, _5965);
    float _6007 = sqrt(_6001);
    float _6009 = fma(_5841, _5953, _6003);
    float _6011 = _3817 + _6009;
    bool _6013 = _6007 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _6015 = _6009;
    float _6017 = _5965;
    float _6019 = _5953;
    float _6021 = _5805;
    if (!_6013)
    {
        _6015 = _5987;
    }
    float _6023 = _6015;
    float _6025 = _6023;
    if (!_6013)
    {
        _6017 = _5985;
    }
    float _6027 = _6017;
    float _6029 = _6027;
    if (!_6013)
    {
        _6019 = _6011;
    }
    float _6031 = _6019;
    bool _6033 = !_6013;
    float _6035 = _6031;
    if (!_6033)
    {
        float _6037 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _6039 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _6041 = _6007 + _6039;
        float _6043 = _6011 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _6045 = rsqrt(_6001);
        float _6047 = _6041 * _6037;
        float _6049 = _6047 * 0.15915493667125701904296875;
        float _6051 = _6049 * 6.283185482025146484375;
        float _6053 = sin(_6051);
        float _6055 = _6049 * 6.283185482025146484375;
        float _6057 = cos(_6055);
        float _6059 = fma(_6053, _6043, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _6061 = _6045 * _6059;
        float _6063 = _6057 + (-1.0);
        float _6065 = fma(_5997, _6061, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _6067 = fma(_5993, _6061, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        float _6069 = _6063 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _6071 = fma(_6011, _6057, _6069);
        _6035 = _6071;
        _6025 = _6065;
        _6029 = _6067;
    }
    float _6073 = _6035;
    float _6075 = _6025;
    float _6077 = _6029;
    float _6079 = -_3817;
    float _6081 = _6079 + _6073;
    float _6083 = -_3843;
    float _6085 = _6083 + _6075;
    float _6087 = _6005 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _6089 = _5663 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _6091 = _6081 * _6081;
    float _6093 = -_3853;
    float _6095 = _6093 + _6077;
    float _6097 = 1.0 / _6087;
    float _6099 = fma(_5669, (*spvDescriptorSet0.vp_c8)._m0[10].x, _6089);
    float _6101 = fma(_6085, _6085, _6091);
    bool _6103 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[660].y;
    bool _6105 = isnan(0.5);
    bool _6107 = _6103 || _6105;
    bool _6109 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _6111 = _6107 || _6109;
    float _6113 = fma(_5689, (*spvDescriptorSet0.vp_c8)._m0[10].z, _6099);
    float _6115 = fma(_6095, _6095, _6101);
    float _6117 = _6113 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _6119 = sqrt(_6115);
    bool _6121 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[653].w;
    bool _6123 = isnan(0.5);
    bool _6125 = _6121 || _6123;
    bool _6127 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _6129 = _6125 || _6127;
    float _6131 = _6117 + _6087;
    float _6133 = _6131 * _6097;
    float _6135 = _6133 * 0.5;
    float _6137 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _6139 = fma(_6135, (*spvDescriptorSet0.vp_c8)._m0[30].w, _6137);
    float _6141 = 1.0 / _6139;
    bool _6143 = _6119 > 0.0;
    bool _6145 = !_6143;
    float _6147 = _6073;
    float _6149 = _6077;
    float _6151 = _6075;
    float _6153 = _6095;
    float _6155 = _6141;
    if (!_6145)
    {
        float _6157 = _204 * _204;
        float _6159 = fma(_202, _202, _6157);
        float _6161 = fma(_206, _206, _6159);
        float _6163 = rsqrt(_6115);
        float _6165 = sqrt(_6161);
        float _6167 = _6085 * _6163;
        float _6169 = _6081 * _6163;
        float _6171 = _6095 * _6163;
        bool _6173 = _6165 > 0.0;
        bool _6175 = !_6173;
        _6153 = _6171;
        if (!_6175)
        {
            float _6177 = rsqrt(_6161);
            float _6179 = 1.0 / (*spvDescriptorSet0.vp_c10)._m0[2].z;
            float _6181 = _204 * _6177;
            float _6183 = _202 * _6177;
            float _6185 = _6169 * _6181;
            float _6187 = _206 * _6177;
            float _6189 = fma(_6167, _6183, _6185);
            float _6191 = _6179 * (*spvDescriptorSet0.vp_c9)._m0[142].x;
            float _6193 = fma(_6171, _6187, _6189);
            float _6195 = _6193 * _6191;
            float _6197 = fma(_202, _6195, _6075);
            float _6199 = fma(_204, _6195, _6073);
            float _6201 = fma(_206, _6195, _6077);
            _6147 = _6199;
            _6149 = _6201;
            _6151 = _6197;
        }
    }
    float _6203 = _6147;
    float _6205 = _6149;
    float _6207 = _6151;
    float _6209 = _6153;
    float _6211 = -_5361;
    float _6213 = fma(_6211, (*spvDescriptorSet0.vp_c9)._m0[18].w, _6203);
    float _6215 = -_5569;
    float _6217 = fma(_6215, (*spvDescriptorSet0.vp_c9)._m0[18].w, _6205);
    float _6219 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _6221 = _6141 * _6219;
    float _6223 = -_5365;
    float _6225 = fma(_6223, (*spvDescriptorSet0.vp_c9)._m0[18].w, _6207);
    float _6227 = _6209;
    float _6229 = _6225;
    float _6231 = _6217;
    float _6233 = _6207;
    float _6235 = _6203;
    if (_6129)
    {
        _6227 = 1.0;
    }
    float _6237 = _6227;
    float _6239 = _6237;
    if (_6111)
    {
        _6155 = _6213;
    }
    float _6241 = _6155;
    float _6243 = _6241;
    if (!_6111)
    {
        float _6245 = _5675 * _5675;
        float _6247 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _6249 = -_3853;
        float _6251 = _6249 + _6205;
        float _6253 = -_3817;
        float _6255 = _6253 + _6203;
        float _6257 = fma(_5681, _5681, _6245);
        float _6259 = fma(_5703, _5703, _6257);
        float _6261 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _6263 = sqrt(_6259);
        float _6265 = 1.0 / _5805;
        float _6267 = _6261 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _6269 = precise::min(_6263, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _6271 = _6269 * _6247;
        float _6273 = _6271 * _6265;
        float _6275 = -_3843;
        float _6277 = _6275 + _6207;
        float _6279 = _6267 * _6273;
        float _6281 = _6251 * _6273;
        float _6283 = fma(_6277, _6279, _5669);
        float _6285 = fma(_6255, _6279, _5663);
        float _6287 = fma(_6267, _6281, _5689);
        _6243 = _6285;
        _6229 = _6283;
        _6231 = _6287;
    }
    float _6289 = _6243;
    float _6291 = _6229;
    float _6293 = _6231;
    if (!_6129)
    {
        float _6295 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _6297 = _6295 * 0.15915493667125701904296875;
        float _6299 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _6301 = _6297 * 6.283185482025146484375;
        float _6303 = cos(_6301);
        float _6305 = _6299 * 0.15915493667125701904296875;
        float _6307 = _6297 * 6.283185482025146484375;
        float _6309 = sin(_6307);
        float _6311 = 1.0 / _6303;
        float _6313 = _6305 * 6.283185482025146484375;
        float _6315 = cos(_6313);
        float _6317 = _6309 * _6311;
        float _6319 = _6305 * 6.283185482025146484375;
        float _6321 = sin(_6319);
        float _6323 = _6315 * _6317;
        float _6325 = 1.0 / _6323;
        float _6327 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _6329 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _6327;
        float _6331 = 1.0 / _6329;
        float _6333 = _6321 * _6325;
        float _6335 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _6337 = fma(_6221, _6333, _6335);
        float _6339 = _6337 * _6331;
        float _6341 = precise::clamp(_6339, 0.0, 1.0);
        _6233 = _6297;
        _6021 = _6305;
        _6239 = _6341;
    }
    float _6343 = _6233;
    float _6345 = _6021;
    float _6347 = _6239;
    float _6349 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _6351 = _6289 + _6349;
    float _6353 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _6355 = _6291 + _6353;
    float _6357 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _6359 = _6293 + _6357;
    float _6361 = _6351 * _6351;
    float _6363 = fma(_6355, _6355, _6361);
    float _6365 = fma(_6359, _6359, _6363);
    float _6367 = rsqrt(_6365);
    float _6369 = sqrt(_6365);
    float _6371 = _6367 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _6373 = _6355 * _6371;
    float _6375 = _6359 * _6371;
    float _6377 = _6373 * _6373;
    float _6379 = _6375 * _6375;
    float _6381 = _6377 + _6379;
    float _6383 = sqrt(_6381);
    bool _6385 = _6383 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _6387 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _6389 = _6383 + _6387;
    float _6391 = _6367;
    float _6393 = _6389;
    float _6395 = _6343;
    float _6397 = _6351;
    if (_6385)
    {
        float _6399 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _6391 = _6399;
    }
    float _6401 = _6391;
    float _6403 = _6401;
    if (_6385)
    {
        float _6405 = _6389 * _6401;
        _6393 = _6405;
    }
    float _6407 = _6393;
    if (_6385)
    {
        float _6409 = rsqrt(_6381);
        _6403 = _6409;
    }
    float _6411 = _6403;
    float _6413 = _6411;
    if (_6385)
    {
        float _6415 = _6407 * 0.15915493667125701904296875;
        _6395 = _6415;
    }
    float _6417 = _6395;
    float _6419 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _6421 = _6359;
    if (_6385)
    {
        float _6423 = _6417 * 6.283185482025146484375;
        float _6425 = sin(_6423);
        _6421 = _6425;
    }
    float _6427 = _6421;
    float _6429 = precise::max(0.0, _6419);
    float _6431 = _6345;
    float _6433 = _6429;
    if (_6385)
    {
        float _6435 = _6417 * 6.283185482025146484375;
        float _6437 = cos(_6435);
        _6431 = _6437;
    }
    float _6439 = _6431;
    float _6441 = -_6371;
    float _6443 = -_6429;
    float _6445 = fma(_6351, _6441, _6443);
    if (_6385)
    {
        float _6447 = _6445 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _6397 = _6447;
    }
    float _6449 = _6397;
    float _6451 = _6427;
    float _6453 = _6449;
    if (_6385)
    {
        float _6455 = fma(_6427, _6449, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _210 = _6455;
    }
    float _6457 = _210;
    if (!_6385)
    {
        _6451 = _6445;
    }
    float _6459 = _6451;
    float _6461 = _6459;
    if (_6385)
    {
        float _6463 = _6411 * _6457;
        _6235 = _6463;
    }
    float _6465 = _6235;
    if (!_6385)
    {
        _6413 = _6373;
    }
    float _6467 = _6413;
    float _6469 = _6467;
    float _6471 = _6439;
    if (_6385)
    {
        float _6473 = _6439 + (-1.0);
        _6433 = _6473;
    }
    float _6475 = _6433;
    float _6477 = _6475;
    if (_6385)
    {
        float _6479 = _6373 * _6465;
        _6469 = _6479;
    }
    float _6481 = _6469;
    if (_6385)
    {
        float _6483 = _6475 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _6453 = _6483;
    }
    float _6485 = _6453;
    float _6487 = _6485;
    if (!_6385)
    {
        _6477 = _6375;
    }
    float _6489 = _6477;
    float _6491 = _6489;
    if (_6385)
    {
        float _6493 = _6375 * _6465;
        _6491 = _6493;
    }
    float _6495 = _6491;
    float _6497 = fma(_5669, (*spvDescriptorSet0.vp_c15)._m0[652].x, (*spvDescriptorSet0.vp_c15)._m0[652].z);
    if (_6385)
    {
        float _6499 = fma(_6445, _6439, _6485);
        _6461 = _6499;
    }
    float _6501 = _6461;
    if (!_6385)
    {
        _6487 = _6377;
    }
    float _6503 = _6487;
    float _6505 = _6503;
    if (_6385)
    {
        float _6507 = _6481 * _6481;
        _6505 = _6507;
    }
    float _6509 = _6505;
    if (!_6385)
    {
        _6471 = _6379;
    }
    float _6511 = _6471;
    float _6513 = _6511;
    if (_6385)
    {
        float _6515 = _6495 * _6495;
        _6513 = _6515;
    }
    float _6517 = _6513;
    float _6519 = fma(_6501, _6501, _6509);
    float _6521 = _6289 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _6523 = _6289 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _6525 = floor(_6497);
    float _6527 = _6519 + _6517;
    float _6529 = fma(_6291, (*spvDescriptorSet0.vp_c8)._m0[2].x, _6521);
    float _6531 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _6533 = fma(_6369, (*spvDescriptorSet0.vp_c15)._m0[23].w, _6531);
    float _6535 = precise::clamp(_6533, 0.0, 1.0);
    float _6537 = fma(_6291, (*spvDescriptorSet0.vp_c8)._m0[3].x, _6523);
    float _6539 = fma(_6293, (*spvDescriptorSet0.vp_c8)._m0[2].z, _6529);
    float _6541 = -_6535;
    float _6543 = _6541 + 1.0;
    float _6545 = rsqrt(_6527);
    float _6547 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _6549 = _6539 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _6551 = fma(_6293, (*spvDescriptorSet0.vp_c8)._m0[3].z, _6537);
    float _6553 = _6549 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _6555 = abs(_6543);
    float _6557 = log2(_6555);
    float _6559 = _6289 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _6561 = -_6553;
    float _6563 = fma(_6561, _6547, 1.0);
    float _6565 = _6289 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _6567 = _6551 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _6569 = fma(_6291, (*spvDescriptorSet0.vp_c8)._m0[1].x, _6559);
    float _6571 = fma(_5689, (*spvDescriptorSet0.vp_c15)._m0[652].y, (*spvDescriptorSet0.vp_c15)._m0[652].w);
    float _6573 = fma(_6291, (*spvDescriptorSet0.vp_c8)._m0[0].x, _6565);
    float _6575 = _6545 * _6481;
    float _6577 = fma(_6293, (*spvDescriptorSet0.vp_c8)._m0[1].z, _6569);
    float _6579 = _6545 * _6501;
    float _6581 = fma(_6293, (*spvDescriptorSet0.vp_c8)._m0[0].z, _6573);
    float _6583 = _6545 * _6495;
    float _6585 = _6577 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _6587 = _6575 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _6589 = _6581 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _6591 = floor(_6571);
    float _6593 = _6585 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _6595 = -_6587;
    float _6597 = fma(_6579, (*spvDescriptorSet0.vp_c15)._m0[21].y, _6595);
    float _6599 = _6557 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _6601 = -_6525;
    float _6603 = _6497 + _6601;
    float _6605 = fma(_6589, (*spvDescriptorSet0.vp_c8)._m0[7].x, _6593);
    float _6607 = -_6583;
    float _6609 = fma(_6607, (*spvDescriptorSet0.vp_c15)._m0[21].z, _6597);
    float _6611 = log2(_6563);
    float _6613 = fma(_6549, (*spvDescriptorSet0.vp_c8)._m0[7].z, _6605);
    float _6615 = fma(_6609, -0.5, 0.5);
    float _6617 = _6585 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _6619 = fma(_6609, 0.5, 0.5);
    float _6621 = fma(_6567, (*spvDescriptorSet0.vp_c8)._m0[7].w, _6613);
    float _6623 = fma(_6589, (*spvDescriptorSet0.vp_c8)._m0[4].x, _6617);
    float _6625 = exp2(_6599);
    float _6627 = _6585 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _6629 = fma(_6619, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _6631 = fma(_6549, (*spvDescriptorSet0.vp_c8)._m0[4].z, _6623);
    float _6633 = -_6591;
    float _6635 = _6571 + _6633;
    float _6637 = fma(_6589, (*spvDescriptorSet0.vp_c8)._m0[5].x, _6627);
    float _6639 = fma(_6619, _6629, -0.212114393711090087890625);
    float _6641 = fma(_6567, (*spvDescriptorSet0.vp_c8)._m0[4].w, _6631);
    float _6643 = 1.0 / _6621;
    float _6645 = fma(_6549, (*spvDescriptorSet0.vp_c8)._m0[5].z, _6637);
    float _6647 = _6611 * 0.693147182464599609375;
    float _6649 = sqrt(_6615);
    float _6651 = fma(_6567, (*spvDescriptorSet0.vp_c8)._m0[5].w, _6645);
    float2 _17089 = float2(_6603, _6635);
    float _6653 = dm_bs(spvDescriptorSet0.vp_t_tcb_24.sample(spvDescriptorSet0.vp_t_tcb_24Smplr, select(_17089, float2(0.0), isnan(_17089)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_24, spvDescriptorSet0.vp_t_tcb_24Smplr_w, select(_17089, float2(0.0), isnan(_17089)), level(0.0)).x;
    float _6655 = fma(_6619, _6639, 1.570728778839111328125);
    float _6657 = _6647 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _6659 = _6641 * _6643;
    float _6661 = _6579 + 1.0;
    float _6663 = _6651 * _6643;
    float _6665 = fma(_6659, 0.5, 0.5);
    float _6667 = -_6579;
    float _6669 = fma(_6625, _6661, _6667);
    float _6671 = fma(_6663, -0.5, 0.5);
    float _6673 = _6649 * 0.636619746685028076171875;
    float _6675 = fma(_6669, 0.5, 0.5);
    float3 _17131 = float3(_6665, _6671, _6657);
    float _6677 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_17131, float3(0.0), isnan(_17131)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_17131, float3(0.0), isnan(_17131)), level(0.0)).x;
    float3 _17142 = float3(_6665, _6671, _6657);
    float4 _6680 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_17142, float3(0.0), isnan(_17142)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_17142, float3(0.0), isnan(_17142)), level(0.0)).xyzw;
    float _6682 = _6680.x;
    float _6684 = _6680.y;
    float _6686 = _6680.z;
    float _6688 = _6680.w;
    float _6690 = -_6655;
    float _6692 = fma(_6673, _6690, 1.0);
    float2 _17163 = float2(_6692, _6675);
    float3 _6696 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_17163, float2(0.0), isnan(_17163)), level(0.0)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_17163, float2(0.0), isnan(_17163)), level(0.0)).xyz;
    float _6698 = _6696.x;
    float _6700 = _6696.y;
    float _6702 = _6696.z;
    float _6704 = abs(_6221);
    float _6706 = log2(_6704);
    float _6708 = in.m_85.x;
    float _6710 = in.m_85.y;
    float _6712 = in.m_85.z;
    bool _6714 = _5817 != 0.0;
    bool _6716 = isnan(_5817);
    bool _6718 = _6714 || _6716;
    bool _6720 = isnan(0.0);
    bool _6722 = _6718 || _6720;
    float _6724 = _5915 * _5983;
    float _6726 = in.m_87.x;
    float _6728 = in.m_87.y;
    float _6730 = in.m_87.z;
    float _6732 = in.m_87.w;
    bool _6734 = _5815 == 0.0;
    bool _6736 = !_6722;
    bool _6738 = _6734 && _6736;
    float _6740 = fma(_5933, _5943, _6724);
    out.m_89.x = _5669;
    out.m_89.y = _5663;
    out.m_89.z = _5689;
    bool _6742 = _5819 == 0.0;
    bool _6744 = _6742 && _6738;
    bool _6746 = _6221 <= 8000.0;
    bool _6748 = isnan(_6221);
    bool _6750 = _6746 || _6748;
    bool _6752 = isnan(8000.0);
    bool _6754 = _6750 || _6752;
    float _6756 = float(_6754);
    float _6758 = _6706 * (*spvDescriptorSet0.vp_c15)._m0[654].z;
    float _6760 = exp2(_6758);
    float _6762 = _6671;
    float _6764 = _6665;
    float _6766 = _6708;
    float _6768 = _6621;
    float _6770 = _6651;
    if (_6744)
    {
        _5659 = _6710;
    }
    float _6772 = _5659;
    float _6774 = _6772;
    if (_6744)
    {
        _4861 = _6708;
    }
    float _6776 = _4861;
    float _6778 = _6776;
    if (_6744)
    {
        _6762 = _6772;
    }
    float _6780 = _6762;
    float _6782 = _6780;
    if (!_6744)
    {
        _6774 = _6710;
    }
    float _6784 = _6774;
    if (_6744)
    {
        _6764 = _6776;
    }
    float _6786 = _6764;
    float _6788 = _6786;
    if (!_6744)
    {
        _6778 = _6708;
    }
    float _6790 = _6778;
    if (!_6744)
    {
        float _6792 = fma(_5817, (*spvDescriptorSet0.vp_c9)._m0[17].y, _6784);
        _6782 = _6792;
    }
    float _6794 = _6782;
    float _6796 = _6728 * _6712;
    float _6798 = fma(_6760, (*spvDescriptorSet0.vp_c15)._m0[654].x, (*spvDescriptorSet0.vp_c15)._m0[654].y);
    float _6800 = precise::clamp(_6798, 0.0, 1.0);
    if (_6744)
    {
        _6766 = _6712;
    }
    float _6802 = _6766;
    float _6804 = _6802;
    if (!_6744)
    {
        float _6806 = fma(_5815, (*spvDescriptorSet0.vp_c9)._m0[17].y, _6790);
        _6788 = _6806;
    }
    float _6808 = _6788;
    if (!_6744)
    {
        float _6810 = fma(_5819, (*spvDescriptorSet0.vp_c9)._m0[17].y, _6712);
        _6804 = _6810;
    }
    float _6812 = _6804;
    float _6814 = _6730 * _6790;
    float _6816 = _6726 * _6784;
    float _6818 = -_6796;
    float _6820 = fma(_6730, _6784, _6818);
    float _6822 = fma(_6800, -2.0, 3.0);
    float _6824 = _6800 * _6800;
    float _6826 = -_6814;
    float _6828 = fma(_6726, _6712, _6826);
    float _6830 = -_6816;
    float _6832 = fma(_6728, _6790, _6830);
    float _6834 = _5877 * _5963;
    float _6836 = _6824 * _6822;
    float _6838 = _5895 * _5963;
    float _6840 = _5895 * _5983;
    float _6842 = _6828 * _6732;
    float _6844 = _6820 * _6732;
    float _6846 = _5895 * _5959;
    float _6848 = _6832 * _6732;
    float _6850 = _5877 * _5983;
    float _6852 = _5877 * _5959;
    float _6854 = _5915 * _5963;
    float _6856 = _5915 * _5959;
    float _6858 = fma(_5923, _5941, _6834);
    float _6860 = -_5835;
    float _6862 = fma(_6860, _5941, _6838);
    float _6864 = -_5835;
    float _6866 = fma(_6864, _5943, _6840);
    float _6868 = -_5835;
    float _6870 = fma(_6868, _5945, _6846);
    float _6872 = fma(_5923, _5943, _6850);
    float _6874 = fma(_5923, _5945, _6852);
    float _6876 = -_6836;
    float _6878 = _6876 + 1.0;
    float _6880 = fma(_5901, _5837, _6858);
    float _6882 = fma(_5933, _5941, _6854);
    float _6884 = fma(_5933, _5945, _6856);
    float _6886 = fma(_5911, _5837, _6862);
    float _6888 = fma(_5911, _5841, _6866);
    float _6890 = fma(_5911, _5839, _6870);
    float _6892 = fma(_5901, _5841, _6872);
    float _6894 = fma(_6878, (*spvDescriptorSet0.vp_c15)._m0[654].w, _6836);
    float _6896 = fma(_5901, _5839, _6874);
    float _6898 = fma(_5881, _5841, _6740);
    float _6900 = fma(_5881, _5837, _6882);
    float _6902 = fma(_5881, _5839, _6884);
    float _6904 = _6886 * _6728;
    float _6906 = _6888 * _6728;
    float _6908 = _6890 * _6728;
    float _6910 = _6842 * _6886;
    float _6912 = _6842 * _6888;
    float _6914 = _6842 * _6890;
    float _6916 = _6585 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _6918 = _6756 * _6894;
    float _6920 = _6886 * _6794;
    float _6922 = _6888 * _6794;
    float _6924 = fma(_6589, (*spvDescriptorSet0.vp_c8)._m0[6].x, _6916);
    float _6926 = _6890 * _6794;
    float _6928 = fma(_6880, _6808, _6920);
    float _6930 = fma(_6880, _6726, _6904);
    float _6932 = fma(_6549, (*spvDescriptorSet0.vp_c8)._m0[6].z, _6924);
    float _6934 = _6557 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _6936 = fma(_6892, _6726, _6906);
    float _6938 = fma(_6844, _6880, _6910);
    float _6940 = fma(_6844, _6892, _6912);
    float _6942 = fma(_6844, _6896, _6914);
    float _6944 = exp2(_6934);
    float _6946 = fma(_6896, _6726, _6908);
    float _6948 = fma(_6892, _6808, _6922);
    float _6950 = fma(_6900, _6730, _6930);
    float _6952 = fma(_6898, _6730, _6936);
    float _6954 = fma(_6848, _6900, _6938);
    float _6956 = fma(_6848, _6898, _6940);
    float _6958 = fma(_6848, _6902, _6942);
    float _6960 = fma(_6902, _6730, _6946);
    float _6962 = in.m_91.x;
    float _6964 = _6918 * (*spvDescriptorSet0.vp_c15)._m0[653].x;
    float _6966 = fma(_6567, (*spvDescriptorSet0.vp_c8)._m0[6].w, _6932);
    float _6968 = fma(_6896, _6808, _6926);
    out.m_93.x = _6950;
    out.m_93.y = _6952;
    out.m_93.z = _6960;
    float _6970 = _6966 + _6621;
    float _6972 = -_6944;
    float _6974 = _6972 + 1.0;
    float _6976 = fma(_6898, _6812, _6948);
    out.m_95.x = _6954;
    out.m_95.y = _6956;
    out.m_95.z = _6958;
    float _6978 = _6970 * 0.5;
    float _6980 = _6974 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _6982 = fma(_6900, _6812, _6928);
    float _6984 = fma(_6902, _6812, _6968);
    bool _6986 = _6369 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _6988 = isnan(_6369);
    bool _6990 = _6986 || _6988;
    bool _6992 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _6994 = _6990 || _6992;
    float _6996 = -_6980;
    float _6998 = _6996 + 1.0;
    out.m_97.z = _6978;
    out.m_97.w = _6621;
    out.m_99.x = _6982;
    out.m_99.y = _6976;
    out.m_99.z = _6984;
    out.gl_Position.x = _6641;
    out.gl_Position.y = _6651;
    out.gl_Position.z = _6966;
    out.gl_Position.w = _6621;
    float _7000 = _6641;
    float _7002 = _6998;
    if (!_6994)
    {
        _5745 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _7004 = _5745;
    float _7006 = _7004;
    float _7008 = _7004;
    if (!_6994)
    {
        _5747 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _7010 = _5747;
    float _7012 = _6347 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _7014 = _7010;
    float _7016 = _7010;
    if (!_6994)
    {
        _6768 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _7018 = _6768;
    float _7020 = _7018;
    float _7022 = _7018;
    if (!_6994)
    {
        _7000 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _7024 = _7000;
    float _7026 = _7024;
    float _7028 = _7024;
    if (!_6994)
    {
        _6770 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _7030 = _6770;
    float _7032 = -_6653;
    float _7034 = _7032 + 1.0;
    float _7036 = _7034 * _6964;
    float _7038 = precise::clamp(_7036, 0.0, 1.0);
    float _7040 = -_7038;
    float _7042 = fma(_7040, (*spvDescriptorSet0.vp_c15)._m0[653].y, 1.0);
    float _7044 = _7042 * _6962;
    float _7046 = _6980 * _6677;
    float _7048 = _7044 * (*spvDescriptorSet0.vp_c13)._m0[1].w;
    float _7050 = _6688 * _6998;
    float _7052 = _7030;
    float _7054 = _7030;
    if (!_6994)
    {
        _7002 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _7056 = _7002;
    float _7058 = _6688 * _7046;
    out.m_101.x = _7048;
    float _7060 = _6702 * _7046;
    float _7062 = fma(_6698, _7058, _6682);
    float _7064 = fma(_6700, _7058, _6684);
    float _7066 = fma(_6688, _7060, _6686);
    out.m_103.x = _7062;
    out.m_103.y = _7064;
    out.m_103.z = _7066;
    out.m_103.w = _7050;
    bool _7068 = !_6994;
    float _7070 = _7056;
    float _7072 = _7056;
    if (!_7068)
    {
        bool _7074 = _6369 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _7076 = isnan(_6369);
        bool _7078 = _7074 || _7076;
        bool _7080 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _7082 = _7078 || _7080;
        if (!_7082)
        {
            float _7084 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _7086 = _6369 + _7084;
            float _7088 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _7090 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _7088;
            float _7092 = 1.0 / _7090;
            float _7094 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _7096 = _7094 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _7098 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _7100 = _7098 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _7102 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _7104 = _7102 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _7106 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _7108 = _7106 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _7110 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _7112 = _7110 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _7114 = _7086 * _7092;
            float _7116 = precise::clamp(_7114, 0.0, 1.0);
            float _7118 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _7120 = _7118 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _7122 = fma(_7116, _7100, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _7124 = fma(_7116, _7120, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _7126 = fma(_7116, _7096, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _7128 = fma(_7116, _7104, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _7130 = fma(_7116, _7108, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _7132 = fma(_7116, _7112, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            _7016 = _7126;
            _7028 = _7130;
            _7008 = _7124;
            _7022 = _7128;
            _7072 = _7122;
            _7054 = _7132;
            _7134 = true;
        }
        else
        {
            bool _7136 = _6369 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _7138 = isnan(_6369);
            bool _7140 = _7136 || _7138;
            bool _7142 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _7144 = _7140 || _7142;
            if (!_7144)
            {
                _7020 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _7146 = _7020;
            _7022 = _7146;
            if (!_7144)
            {
                _7026 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _7148 = _7026;
            _7028 = _7148;
            if (!_7144)
            {
                _7052 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _7150 = _7052;
            _7054 = _7150;
            if (!_7144)
            {
                _7006 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _7152 = _7006;
            _7008 = _7152;
            if (!_7144)
            {
                _7014 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _7154 = _7014;
            _7016 = _7154;
            if (!_7144)
            {
                _7070 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _7156 = _7070;
            bool _7158 = !_7144;
            _7072 = _7156;
            if (!_7158)
            {
                bool _7160 = _6369 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _7162 = isnan(_6369);
                bool _7164 = _7160 || _7162;
                bool _7166 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _7168 = _7164 || _7166;
                if (!_7168)
                {
                    float _7170 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _7172 = _6369 + _7170;
                    float _7174 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _7176 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _7174;
                    float _7178 = 1.0 / _7176;
                    float _7180 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _7182 = _7180 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _7184 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _7186 = _7184 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _7188 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _7190 = _7188 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _7192 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _7194 = _7192 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _7196 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _7198 = _7196 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _7200 = _7172 * _7178;
                    float _7202 = precise::clamp(_7200, 0.0, 1.0);
                    float _7204 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _7206 = _7204 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _7208 = fma(_7202, _7186, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _7210 = fma(_7202, _7206, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _7212 = fma(_7202, _7182, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _7214 = fma(_7202, _7190, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _7216 = fma(_7202, _7194, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _7218 = fma(_7202, _7198, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    _7016 = _7212;
                    _7028 = _7216;
                    _7008 = _7210;
                    _7022 = _7214;
                    _7072 = _7208;
                    _7054 = _7218;
                    _7134 = true;
                }
                else
                {
                    _7016 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _7028 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _7008 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _7022 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _7072 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _7054 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _7134 = false;
    float _7220 = _7016;
    float _7222 = _7028;
    float _7224 = _7008;
    float _7226 = _7022;
    float _7228 = _7072;
    float _7230 = _7054;
    float _7232 = fma(_6976, -0.5, 0.5);
    float _7234 = precise::clamp(_7232, 0.0, 1.0);
    float _7236 = -_7220;
    float _7238 = _7222 + _7236;
    float _7240 = _7012 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _7242 = -_7224;
    float _7244 = _7226 + _7242;
    float _7246 = fma(_7234, _7238, _7220);
    out.m_105.x = 0.0;
    float _7248 = -_7228;
    float _7250 = _7230 + _7248;
    float _7252 = fma(_7234, _7244, _7224);
    float _7254 = _7246 * 0.586610972881317138671875;
    out.m_49.x = _7240;
    bool _7256 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _7258 = fma(_7234, _7250, _7228);
    float _7260 = fma(_7252, 0.298911988735198974609375, _7254);
    bool _7262 = _6347 > 0.0;
    bool _7264 = isnan(_6347);
    bool _7266 = _7262 || _7264;
    bool _7268 = isnan(0.0);
    bool _7270 = _7266 || _7268;
    float _7272 = fma(_7258, 0.114477999508380889892578125, _7260);
    float _7274 = -_7272;
    float _7276 = _7252 + _7274;
    float _7278 = -_7272;
    float _7280 = _7246 + _7278;
    float _7282 = -_7272;
    float _7284 = _7258 + _7282;
    float _7286 = fma(_7276, (*spvDescriptorSet0.vp_c13)._m0[1].z, _7272);
    float _7288 = fma(_7280, (*spvDescriptorSet0.vp_c13)._m0[1].z, _7272);
    float _7290 = fma(_7284, (*spvDescriptorSet0.vp_c13)._m0[1].z, _7272);
    bool _7292 = !_7256;
    if (!_7292)
    {
        float _7294 = -_6289;
        float _7296 = _7294 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
        float _7298 = -_6291;
        float _7300 = _7298 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
        float _7302 = -_6293;
        float _7304 = _7302 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
        float _7306 = _7296 * _7296;
        float _7308 = fma(_7300, _7300, _7306);
        float _7310 = fma(_7304, _7304, _7308);
        float _7312 = sqrt(_7310);
        float _7314 = rsqrt(_7310);
        float _7316 = -_7312;
        float _7318 = _7316 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
        float _7320 = _7318 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
        float _7322 = precise::clamp(_7320, 0.0, 1.0);
        float _7324 = _7300 * _7314;
        float _7326 = _7296 * _7314;
        float _7328 = abs(_7322);
        float _7330 = log2(_7328);
        float _7332 = _7304 * _7314;
        float _7334 = _7324 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
        float _7336 = _6976 * _7326;
        float _7338 = -_7326;
        float _7340 = -_7334;
        float _7342 = fma(_7338, (*spvDescriptorSet0.vp_c15)._m0[656].y, _7340);
        float _7344 = fma(_6982, _7324, _7336);
        float _7346 = -_7332;
        float _7348 = fma(_7346, (*spvDescriptorSet0.vp_c15)._m0[656].z, _7342);
        float _7350 = fma(_6984, _7332, _7344);
        float _7352 = precise::clamp(_7350, 0.0, 1.0);
        float _7354 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
        float _7356 = _7348 + _7354;
        float _7358 = _7330 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
        float _7360 = _7356 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
        float _7362 = precise::clamp(_7360, 0.0, 1.0);
        float _7364 = exp2(_7358);
        float _7366 = _7364 * _7362;
        float _7368 = _7352 * _7366;
        float _7370 = _7368 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
        float _7372 = _7368 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
        float _7374 = _7368 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
        out.m_105.x = _7370;
        out.m_105.y = _7372;
        out.m_105.z = _7374;
    }
    out.m_107.x = _7286;
    out.m_107.y = _7288;
    out.m_107.z = _7290;
    if (_7270)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _7376 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.m_49.x = 0.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _7376;
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
    bool _7134 = false;
    bool _1828 = false;
    bool _1498 = false;
    bool _1180 = false;
    bool _862 = false;
    bool _720 = false;
    bool _606 = false;
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
        float _7433 = as_type<float>(_142);
        out.gl_Position.z = _7433;
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
        float _7503 = as_type<float>(_180);
        out.gl_Position.z = _7503;
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
    float _462 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _464 = _460 + _462;
    float _466 = in.m_57.x;
    float _468 = in.m_57.y;
    float _470 = in.m_57.z;
    float _472 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _474 = _472 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _476 = _460 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _478 = isnan(_460);
    bool _480 = _476 || _478;
    bool _482 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _484 = _480 || _482;
    float _486 = float(_484);
    float _488 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _490 = _488 + (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _492 = _460 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _494 = isnan(_460);
    bool _496 = _492 || _494;
    bool _498 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _500 = _496 || _498;
    float _502 = float(_500);
    float _504 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _506 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _504;
    bool _508 = _460 >= (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _510 = isnan(_460);
    bool _512 = _508 || _510;
    bool _514 = isnan((*spvDescriptorSet0.vp_c9)._m0[117].w);
    bool _516 = _512 || _514;
    float _518 = float(_516);
    float _520 = 1.0 / _474;
    float _522 = -_486;
    float _524 = _522 + 1.0;
    bool _526 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].z;
    float _528 = _502 * _524;
    float _530 = -_502;
    float _532 = _530 + 1.0;
    float _534 = 1.0 / _490;
    float _536 = _506 * _520;
    float _538 = -(*spvDescriptorSet0.vp_c9)._m0[116].x;
    float _540 = _538 + (*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _542 = _428 * _468;
    float _544 = _430 * _470;
    float _546 = fma(_536, _464, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _548 = _426 * _466;
    float _550 = _540 * _534;
    float _552 = _546 * _528;
    float _554 = -_518;
    float _556 = _554 + 1.0;
    float _558 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _560 = _460 + _558;
    float _562 = fma(_532, (*spvDescriptorSet0.vp_c9)._m0[115].x, _552);
    float _564 = _486 * _556;
    float _566 = fma(_550, _560, (*spvDescriptorSet0.vp_c9)._m0[116].x);
    float _568 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _570 = fma(_566, _564, _562);
    float _572 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _574 = _568 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _576 = fma(_518, (*spvDescriptorSet0.vp_c9)._m0[117].x, _570);
    float _578 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _580 = _572 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _582 = _576 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _584 = _578 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    out.m_59.x = _574;
    out.m_59.y = _584;
    out.m_59.z = _580;
    out.m_59.w = _582;
    bool _586 = !_526;
    float _604;
    if (!_586)
    {
        float _588 = in.m_55.x;
        float _590 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].z;
        float _592 = _588 * (*spvDescriptorSet0.vp_c9)._m0[12].w;
        float _594 = fma(_592, (*spvDescriptorSet0.vp_c9)._m0[11].z, _160);
        float _596 = _594 * _590;
        float _598 = floor(_596);
        float _600 = -_598;
        float _602 = _596 + _600;
        _604 = _602;
        _606 = true;
    }
    else
    {
        float _608 = float(_126);
        float _610 = 1.0 / _608;
        float _612 = _160 * _610;
        _604 = _612;
    }
    _606 = false;
    float _614 = _604;
    float _616 = -(*spvDescriptorSet0.vp_c9)._m0[123].w;
    float _618 = _614 + _616;
    bool _620 = _614 >= (*spvDescriptorSet0.vp_c9)._m0[124].w;
    bool _622 = isnan(_614);
    bool _624 = _620 || _622;
    bool _626 = isnan((*spvDescriptorSet0.vp_c9)._m0[124].w);
    bool _628 = _624 || _626;
    float _630 = float(_628);
    float _632 = -(*spvDescriptorSet0.vp_c9)._m0[123].w;
    float _634 = (*spvDescriptorSet0.vp_c9)._m0[124].w + _632;
    bool _636 = _614 >= (*spvDescriptorSet0.vp_c9)._m0[123].w;
    bool _638 = isnan(_614);
    bool _640 = _636 || _638;
    bool _642 = isnan((*spvDescriptorSet0.vp_c9)._m0[123].w);
    bool _644 = _640 || _642;
    float _646 = float(_644);
    float _648 = -_630;
    float _650 = _648 + 1.0;
    float _652 = -(*spvDescriptorSet0.vp_c9)._m0[123].x;
    float _654 = (*spvDescriptorSet0.vp_c9)._m0[124].x + _652;
    float _656 = 1.0 / _634;
    bool _658 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].w;
    float _660 = _646 * _650;
    float _662 = -_646;
    float _664 = _662 + 1.0;
    float _666 = _618 * _656;
    float _668 = -(*spvDescriptorSet0.vp_c9)._m0[123].z;
    float _670 = (*spvDescriptorSet0.vp_c9)._m0[124].z + _668;
    float _672 = fma(_654, _666, (*spvDescriptorSet0.vp_c9)._m0[123].x);
    float _674 = -(*spvDescriptorSet0.vp_c9)._m0[123].y;
    float _676 = (*spvDescriptorSet0.vp_c9)._m0[124].y + _674;
    float _678 = fma(_670, _666, (*spvDescriptorSet0.vp_c9)._m0[123].z);
    float _680 = _672 * _660;
    float _682 = fma(_676, _666, (*spvDescriptorSet0.vp_c9)._m0[123].y);
    float _684 = _678 * _660;
    float _686 = _682 * _660;
    float _688 = fma(_664, (*spvDescriptorSet0.vp_c9)._m0[123].x, _680);
    float _690 = fma(_664, (*spvDescriptorSet0.vp_c9)._m0[123].y, _686);
    float _692 = fma(_664, (*spvDescriptorSet0.vp_c9)._m0[123].z, _684);
    float _694 = fma(_630, (*spvDescriptorSet0.vp_c9)._m0[124].x, _688);
    float _696 = fma(_630, (*spvDescriptorSet0.vp_c9)._m0[124].y, _690);
    float _698 = fma(_630, (*spvDescriptorSet0.vp_c9)._m0[124].z, _692);
    bool _700 = !_658;
    float _718;
    if (!_700)
    {
        float _702 = in.m_55.x;
        float _704 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].w;
        float _706 = _702 * (*spvDescriptorSet0.vp_c9)._m0[13].x;
        float _708 = fma(_706, (*spvDescriptorSet0.vp_c9)._m0[11].w, _160);
        float _710 = _708 * _704;
        float _712 = floor(_710);
        float _714 = -_712;
        float _716 = _710 + _714;
        _718 = _716;
        _720 = true;
    }
    else
    {
        float _722 = float(_126);
        float _724 = 1.0 / _722;
        float _726 = _160 * _724;
        _718 = _726;
    }
    _720 = false;
    float _728 = _718;
    float _730 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _732 = _728 + _730;
    float _734 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _736 = _734 + (*spvDescriptorSet0.vp_c9)._m0[132].w;
    bool _738 = _728 >= (*spvDescriptorSet0.vp_c9)._m0[132].w;
    bool _740 = isnan(_728);
    bool _742 = _738 || _740;
    bool _744 = isnan((*spvDescriptorSet0.vp_c9)._m0[132].w);
    bool _746 = _742 || _744;
    float _748 = float(_746);
    float _750 = -(*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _752 = _750 + (*spvDescriptorSet0.vp_c9)._m0[133].w;
    bool _754 = _728 >= (*spvDescriptorSet0.vp_c9)._m0[131].w;
    bool _756 = isnan(_728);
    bool _758 = _754 || _756;
    bool _760 = isnan((*spvDescriptorSet0.vp_c9)._m0[131].w);
    bool _762 = _758 || _760;
    float _764 = float(_762);
    float _766 = -(*spvDescriptorSet0.vp_c9)._m0[131].x;
    float _768 = (*spvDescriptorSet0.vp_c9)._m0[132].x + _766;
    bool _770 = _728 >= (*spvDescriptorSet0.vp_c9)._m0[133].w;
    bool _772 = isnan(_728);
    bool _774 = _770 || _772;
    bool _776 = isnan((*spvDescriptorSet0.vp_c9)._m0[133].w);
    bool _778 = _774 || _776;
    float _780 = float(_778);
    float _782 = 1.0 / _736;
    float _784 = -_748;
    float _786 = _784 + 1.0;
    bool _788 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[14].x;
    float _790 = _764 * _786;
    float _792 = -_764;
    float _794 = _792 + 1.0;
    float _796 = 1.0 / _752;
    float _798 = _768 * _782;
    float _800 = -(*spvDescriptorSet0.vp_c9)._m0[132].x;
    float _802 = _800 + (*spvDescriptorSet0.vp_c9)._m0[133].x;
    float _804 = fma(_798, _732, (*spvDescriptorSet0.vp_c9)._m0[131].x);
    float _806 = _802 * _796;
    float _808 = _804 * _790;
    float _810 = -_780;
    float _812 = _810 + 1.0;
    float _814 = -(*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _816 = _728 + _814;
    float _818 = _694 * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _820 = fma(_794, (*spvDescriptorSet0.vp_c9)._m0[131].x, _808);
    float _822 = _748 * _812;
    float _824 = fma(_806, _816, (*spvDescriptorSet0.vp_c9)._m0[132].x);
    float _826 = _698 * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _828 = fma(_824, _822, _820);
    float _830 = _696 * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _832 = _818 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _834 = _826 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _836 = fma(_780, (*spvDescriptorSet0.vp_c9)._m0[133].x, _828);
    float _838 = _830 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _840 = _836 * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    out.m_61.x = _832;
    out.m_61.y = _838;
    out.m_61.z = _834;
    out.m_61.w = _840;
    bool _842 = !_788;
    float _860;
    if (!_842)
    {
        float _844 = in.m_55.x;
        float _846 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[14].x;
        float _848 = _844 * (*spvDescriptorSet0.vp_c9)._m0[15].x;
        float _850 = fma(_848, (*spvDescriptorSet0.vp_c9)._m0[14].x, _160);
        float _852 = _850 * _846;
        float _854 = floor(_852);
        float _856 = -_854;
        float _858 = _852 + _856;
        _860 = _858;
        _862 = true;
    }
    else
    {
        float _864 = float(_126);
        float _866 = 1.0 / _864;
        float _868 = _160 * _866;
        _860 = _868;
    }
    _862 = false;
    float _870 = _860;
    float _872 = -(*spvDescriptorSet0.vp_c9)._m0[159].w;
    float _874 = _870 + _872;
    bool _876 = _870 >= (*spvDescriptorSet0.vp_c9)._m0[165].w;
    bool _878 = isnan(_870);
    bool _880 = _876 || _878;
    bool _882 = isnan((*spvDescriptorSet0.vp_c9)._m0[165].w);
    bool _884 = _880 || _882;
    float _886 = float(_884);
    float _888 = -(*spvDescriptorSet0.vp_c9)._m0[159].w;
    float _890 = _888 + (*spvDescriptorSet0.vp_c9)._m0[160].w;
    bool _892 = _870 >= (*spvDescriptorSet0.vp_c9)._m0[164].w;
    bool _894 = isnan(_870);
    bool _896 = _892 || _894;
    bool _898 = isnan((*spvDescriptorSet0.vp_c9)._m0[164].w);
    bool _900 = _896 || _898;
    float _902 = float(_900);
    float _904 = -(*spvDescriptorSet0.vp_c9)._m0[159].x;
    float _906 = (*spvDescriptorSet0.vp_c9)._m0[160].x + _904;
    bool _908 = _870 >= (*spvDescriptorSet0.vp_c9)._m0[163].w;
    bool _910 = isnan(_870);
    bool _912 = _908 || _910;
    bool _914 = isnan((*spvDescriptorSet0.vp_c9)._m0[163].w);
    bool _916 = _912 || _914;
    float _918 = float(_916);
    float _920 = -_886;
    float _922 = _920 + 1.0;
    float _924 = 1.0 / _890;
    float _926 = _902 * _922;
    float _928 = -_918;
    float _930 = _928 + 1.0;
    float _932 = -(*spvDescriptorSet0.vp_c9)._m0[160].w;
    float _934 = _932 + (*spvDescriptorSet0.vp_c9)._m0[161].w;
    bool _936 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[14].y;
    float _938 = 1.0 / _934;
    float _940 = _906 * _924;
    float _942 = -_902;
    float _944 = _942 + 1.0;
    bool _946 = _870 >= (*spvDescriptorSet0.vp_c9)._m0[162].w;
    bool _948 = isnan(_870);
    bool _950 = _946 || _948;
    bool _952 = isnan((*spvDescriptorSet0.vp_c9)._m0[162].w);
    bool _954 = _950 || _952;
    float _956 = float(_954);
    float _958 = fma(_940, _874, (*spvDescriptorSet0.vp_c9)._m0[159].x);
    float _960 = _918 * _944;
    bool _962 = _870 >= (*spvDescriptorSet0.vp_c9)._m0[161].w;
    bool _964 = isnan(_870);
    bool _966 = _962 || _964;
    bool _968 = isnan((*spvDescriptorSet0.vp_c9)._m0[161].w);
    bool _970 = _966 || _968;
    float _972 = float(_970);
    float _974 = _956 * _930;
    float _976 = -_956;
    float _978 = _976 + 1.0;
    float _980 = -(*spvDescriptorSet0.vp_c9)._m0[161].w;
    float _982 = _980 + (*spvDescriptorSet0.vp_c9)._m0[162].w;
    bool _984 = _870 >= (*spvDescriptorSet0.vp_c9)._m0[160].w;
    bool _986 = isnan(_870);
    bool _988 = _984 || _986;
    bool _990 = isnan((*spvDescriptorSet0.vp_c9)._m0[160].w);
    bool _992 = _988 || _990;
    float _994 = float(_992);
    float _996 = _972 * _978;
    float _998 = -_972;
    float _1000 = _998 + 1.0;
    float _1002 = -(*spvDescriptorSet0.vp_c9)._m0[162].w;
    float _1004 = _1002 + (*spvDescriptorSet0.vp_c9)._m0[163].w;
    float _1006 = 1.0 / _982;
    bool _1008 = _870 >= (*spvDescriptorSet0.vp_c9)._m0[159].w;
    bool _1010 = isnan(_870);
    bool _1012 = _1008 || _1010;
    bool _1014 = isnan((*spvDescriptorSet0.vp_c9)._m0[159].w);
    bool _1016 = _1012 || _1014;
    float _1018 = float(_1016);
    float _1020 = _994 * _1000;
    float _1022 = -_994;
    float _1024 = _1022 + 1.0;
    float _1026 = -(*spvDescriptorSet0.vp_c9)._m0[163].w;
    float _1028 = _1026 + (*spvDescriptorSet0.vp_c9)._m0[164].w;
    float _1030 = -(*spvDescriptorSet0.vp_c9)._m0[160].x;
    float _1032 = _1030 + (*spvDescriptorSet0.vp_c9)._m0[161].x;
    float _1034 = _1018 * _1024;
    float _1036 = 1.0 / _1004;
    float _1038 = _1032 * _938;
    float _1040 = _958 * _1034;
    float _1042 = -_1018;
    float _1044 = _1042 + 1.0;
    float _1046 = -(*spvDescriptorSet0.vp_c9)._m0[164].w;
    float _1048 = _1046 + (*spvDescriptorSet0.vp_c9)._m0[165].w;
    float _1050 = -(*spvDescriptorSet0.vp_c9)._m0[160].w;
    float _1052 = _870 + _1050;
    float _1054 = 1.0 / _1028;
    float _1056 = -(*spvDescriptorSet0.vp_c9)._m0[161].x;
    float _1058 = (*spvDescriptorSet0.vp_c9)._m0[162].x + _1056;
    float _1060 = fma(_1044, (*spvDescriptorSet0.vp_c9)._m0[159].x, _1040);
    float _1062 = -(*spvDescriptorSet0.vp_c9)._m0[165].w;
    float _1064 = _1062 + (*spvDescriptorSet0.vp_c9)._m0[166].w;
    float _1066 = fma(_1038, _1052, (*spvDescriptorSet0.vp_c9)._m0[160].x);
    float _1068 = _1058 * _1006;
    float _1070 = -(*spvDescriptorSet0.vp_c9)._m0[161].w;
    float _1072 = _870 + _1070;
    float _1074 = 1.0 / _1048;
    float _1076 = -(*spvDescriptorSet0.vp_c9)._m0[162].x;
    float _1078 = _1076 + (*spvDescriptorSet0.vp_c9)._m0[163].x;
    float _1080 = fma(_1068, _1072, (*spvDescriptorSet0.vp_c9)._m0[161].x);
    float _1082 = fma(_1066, _1020, _1060);
    float _1084 = -(*spvDescriptorSet0.vp_c9)._m0[163].x;
    float _1086 = (*spvDescriptorSet0.vp_c9)._m0[164].x + _1084;
    float _1088 = _1078 * _1036;
    float _1090 = -(*spvDescriptorSet0.vp_c9)._m0[162].w;
    float _1092 = _870 + _1090;
    float _1094 = 1.0 / _1064;
    float _1096 = fma(_1080, _996, _1082);
    float _1098 = _1086 * _1054;
    float _1100 = -(*spvDescriptorSet0.vp_c9)._m0[163].w;
    float _1102 = _870 + _1100;
    float _1104 = -(*spvDescriptorSet0.vp_c9)._m0[164].x;
    float _1106 = _1104 + (*spvDescriptorSet0.vp_c9)._m0[165].x;
    float _1108 = fma(_1088, _1092, (*spvDescriptorSet0.vp_c9)._m0[162].x);
    float _1110 = -(*spvDescriptorSet0.vp_c9)._m0[164].w;
    float _1112 = _870 + _1110;
    float _1114 = fma(_1098, _1102, (*spvDescriptorSet0.vp_c9)._m0[163].x);
    float _1116 = _1106 * _1074;
    float _1118 = -(*spvDescriptorSet0.vp_c9)._m0[165].x;
    float _1120 = (*spvDescriptorSet0.vp_c9)._m0[166].x + _1118;
    bool _1122 = _870 >= (*spvDescriptorSet0.vp_c9)._m0[166].w;
    bool _1124 = isnan(_870);
    bool _1126 = _1122 || _1124;
    bool _1128 = isnan((*spvDescriptorSet0.vp_c9)._m0[166].w);
    bool _1130 = _1126 || _1128;
    float _1132 = float(_1130);
    float _1134 = fma(_1108, _974, _1096);
    float _1136 = fma(_1116, _1112, (*spvDescriptorSet0.vp_c9)._m0[164].x);
    float _1138 = -(*spvDescriptorSet0.vp_c9)._m0[165].w;
    float _1140 = _870 + _1138;
    float _1142 = -_1132;
    float _1144 = _1142 + 1.0;
    float _1146 = _1120 * _1094;
    float _1148 = fma(_1114, _960, _1134);
    float _1150 = _886 * _1144;
    float _1152 = fma(_1146, _1140, (*spvDescriptorSet0.vp_c9)._m0[165].x);
    float _1154 = fma(_1136, _926, _1148);
    float _1156 = fma(_1152, _1150, _1154);
    float _1158 = fma(_1132, (*spvDescriptorSet0.vp_c9)._m0[166].x, _1156);
    out.m_63.x = _1158;
    bool _1160 = !_936;
    float _1178;
    if (!_1160)
    {
        float _1162 = in.m_55.x;
        float _1164 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[14].y;
        float _1166 = _1162 * (*spvDescriptorSet0.vp_c9)._m0[15].y;
        float _1168 = fma(_1166, (*spvDescriptorSet0.vp_c9)._m0[14].y, _160);
        float _1170 = _1168 * _1164;
        float _1172 = floor(_1170);
        float _1174 = -_1172;
        float _1176 = _1170 + _1174;
        _1178 = _1176;
        _1180 = true;
    }
    else
    {
        float _1182 = float(_126);
        float _1184 = 1.0 / _1182;
        float _1186 = _160 * _1184;
        _1178 = _1186;
    }
    _1180 = false;
    float _1188 = _1178;
    float _1190 = -(*spvDescriptorSet0.vp_c9)._m0[167].w;
    float _1192 = _1188 + _1190;
    bool _1194 = _1188 >= (*spvDescriptorSet0.vp_c9)._m0[173].w;
    bool _1196 = isnan(_1188);
    bool _1198 = _1194 || _1196;
    bool _1200 = isnan((*spvDescriptorSet0.vp_c9)._m0[173].w);
    bool _1202 = _1198 || _1200;
    float _1204 = float(_1202);
    float _1206 = -(*spvDescriptorSet0.vp_c9)._m0[167].w;
    float _1208 = _1206 + (*spvDescriptorSet0.vp_c9)._m0[168].w;
    bool _1210 = _1188 >= (*spvDescriptorSet0.vp_c9)._m0[172].w;
    bool _1212 = isnan(_1188);
    bool _1214 = _1210 || _1212;
    bool _1216 = isnan((*spvDescriptorSet0.vp_c9)._m0[172].w);
    bool _1218 = _1214 || _1216;
    float _1220 = float(_1218);
    float _1222 = -(*spvDescriptorSet0.vp_c9)._m0[167].x;
    float _1224 = (*spvDescriptorSet0.vp_c9)._m0[168].x + _1222;
    bool _1226 = _1188 >= (*spvDescriptorSet0.vp_c9)._m0[171].w;
    bool _1228 = isnan(_1188);
    bool _1230 = _1226 || _1228;
    bool _1232 = isnan((*spvDescriptorSet0.vp_c9)._m0[171].w);
    bool _1234 = _1230 || _1232;
    float _1236 = float(_1234);
    float _1238 = -_1204;
    float _1240 = _1238 + 1.0;
    float _1242 = 1.0 / _1208;
    float _1244 = _1220 * _1240;
    float _1246 = -_1236;
    float _1248 = _1246 + 1.0;
    float _1250 = -(*spvDescriptorSet0.vp_c9)._m0[168].w;
    float _1252 = _1250 + (*spvDescriptorSet0.vp_c9)._m0[169].w;
    bool _1254 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[14].z;
    float _1256 = 1.0 / _1252;
    float _1258 = _1224 * _1242;
    float _1260 = -_1220;
    float _1262 = _1260 + 1.0;
    bool _1264 = _1188 >= (*spvDescriptorSet0.vp_c9)._m0[170].w;
    bool _1266 = isnan(_1188);
    bool _1268 = _1264 || _1266;
    bool _1270 = isnan((*spvDescriptorSet0.vp_c9)._m0[170].w);
    bool _1272 = _1268 || _1270;
    float _1274 = float(_1272);
    float _1276 = fma(_1258, _1192, (*spvDescriptorSet0.vp_c9)._m0[167].x);
    float _1278 = _1236 * _1262;
    bool _1280 = _1188 >= (*spvDescriptorSet0.vp_c9)._m0[169].w;
    bool _1282 = isnan(_1188);
    bool _1284 = _1280 || _1282;
    bool _1286 = isnan((*spvDescriptorSet0.vp_c9)._m0[169].w);
    bool _1288 = _1284 || _1286;
    float _1290 = float(_1288);
    float _1292 = _1274 * _1248;
    float _1294 = -_1274;
    float _1296 = _1294 + 1.0;
    float _1298 = -(*spvDescriptorSet0.vp_c9)._m0[169].w;
    float _1300 = _1298 + (*spvDescriptorSet0.vp_c9)._m0[170].w;
    bool _1302 = _1188 >= (*spvDescriptorSet0.vp_c9)._m0[168].w;
    bool _1304 = isnan(_1188);
    bool _1306 = _1302 || _1304;
    bool _1308 = isnan((*spvDescriptorSet0.vp_c9)._m0[168].w);
    bool _1310 = _1306 || _1308;
    float _1312 = float(_1310);
    float _1314 = _1290 * _1296;
    float _1316 = -_1290;
    float _1318 = _1316 + 1.0;
    float _1320 = -(*spvDescriptorSet0.vp_c9)._m0[170].w;
    float _1322 = _1320 + (*spvDescriptorSet0.vp_c9)._m0[171].w;
    float _1324 = 1.0 / _1300;
    bool _1326 = _1188 >= (*spvDescriptorSet0.vp_c9)._m0[167].w;
    bool _1328 = isnan(_1188);
    bool _1330 = _1326 || _1328;
    bool _1332 = isnan((*spvDescriptorSet0.vp_c9)._m0[167].w);
    bool _1334 = _1330 || _1332;
    float _1336 = float(_1334);
    float _1338 = _1312 * _1318;
    float _1340 = -_1312;
    float _1342 = _1340 + 1.0;
    float _1344 = -(*spvDescriptorSet0.vp_c9)._m0[171].w;
    float _1346 = _1344 + (*spvDescriptorSet0.vp_c9)._m0[172].w;
    float _1348 = -(*spvDescriptorSet0.vp_c9)._m0[168].x;
    float _1350 = _1348 + (*spvDescriptorSet0.vp_c9)._m0[169].x;
    float _1352 = _1336 * _1342;
    float _1354 = 1.0 / _1322;
    float _1356 = _1350 * _1256;
    float _1358 = _1276 * _1352;
    float _1360 = -_1336;
    float _1362 = _1360 + 1.0;
    float _1364 = -(*spvDescriptorSet0.vp_c9)._m0[172].w;
    float _1366 = _1364 + (*spvDescriptorSet0.vp_c9)._m0[173].w;
    float _1368 = -(*spvDescriptorSet0.vp_c9)._m0[168].w;
    float _1370 = _1188 + _1368;
    float _1372 = 1.0 / _1346;
    float _1374 = -(*spvDescriptorSet0.vp_c9)._m0[169].x;
    float _1376 = (*spvDescriptorSet0.vp_c9)._m0[170].x + _1374;
    float _1378 = fma(_1362, (*spvDescriptorSet0.vp_c9)._m0[167].x, _1358);
    float _1380 = -(*spvDescriptorSet0.vp_c9)._m0[173].w;
    float _1382 = _1380 + (*spvDescriptorSet0.vp_c9)._m0[174].w;
    float _1384 = fma(_1356, _1370, (*spvDescriptorSet0.vp_c9)._m0[168].x);
    float _1386 = _1376 * _1324;
    float _1388 = -(*spvDescriptorSet0.vp_c9)._m0[169].w;
    float _1390 = _1188 + _1388;
    float _1392 = 1.0 / _1366;
    float _1394 = -(*spvDescriptorSet0.vp_c9)._m0[170].x;
    float _1396 = _1394 + (*spvDescriptorSet0.vp_c9)._m0[171].x;
    float _1398 = fma(_1386, _1390, (*spvDescriptorSet0.vp_c9)._m0[169].x);
    float _1400 = fma(_1384, _1338, _1378);
    float _1402 = -(*spvDescriptorSet0.vp_c9)._m0[171].x;
    float _1404 = (*spvDescriptorSet0.vp_c9)._m0[172].x + _1402;
    float _1406 = _1396 * _1354;
    float _1408 = -(*spvDescriptorSet0.vp_c9)._m0[170].w;
    float _1410 = _1188 + _1408;
    float _1412 = 1.0 / _1382;
    float _1414 = fma(_1398, _1314, _1400);
    float _1416 = _1404 * _1372;
    float _1418 = -(*spvDescriptorSet0.vp_c9)._m0[171].w;
    float _1420 = _1188 + _1418;
    float _1422 = -(*spvDescriptorSet0.vp_c9)._m0[172].x;
    float _1424 = _1422 + (*spvDescriptorSet0.vp_c9)._m0[173].x;
    float _1426 = fma(_1406, _1410, (*spvDescriptorSet0.vp_c9)._m0[170].x);
    float _1428 = -(*spvDescriptorSet0.vp_c9)._m0[172].w;
    float _1430 = _1188 + _1428;
    float _1432 = fma(_1416, _1420, (*spvDescriptorSet0.vp_c9)._m0[171].x);
    float _1434 = _1424 * _1392;
    float _1436 = -(*spvDescriptorSet0.vp_c9)._m0[173].x;
    float _1438 = (*spvDescriptorSet0.vp_c9)._m0[174].x + _1436;
    bool _1440 = _1188 >= (*spvDescriptorSet0.vp_c9)._m0[174].w;
    bool _1442 = isnan(_1188);
    bool _1444 = _1440 || _1442;
    bool _1446 = isnan((*spvDescriptorSet0.vp_c9)._m0[174].w);
    bool _1448 = _1444 || _1446;
    float _1450 = float(_1448);
    float _1452 = fma(_1426, _1292, _1414);
    float _1454 = fma(_1434, _1430, (*spvDescriptorSet0.vp_c9)._m0[172].x);
    float _1456 = -(*spvDescriptorSet0.vp_c9)._m0[173].w;
    float _1458 = _1188 + _1456;
    float _1460 = -_1450;
    float _1462 = _1460 + 1.0;
    float _1464 = _1438 * _1412;
    float _1466 = fma(_1432, _1278, _1452);
    float _1468 = _1204 * _1462;
    float _1470 = fma(_1464, _1458, (*spvDescriptorSet0.vp_c9)._m0[173].x);
    float _1472 = fma(_1454, _1244, _1466);
    float _1474 = fma(_1470, _1468, _1472);
    float _1476 = fma(_1450, (*spvDescriptorSet0.vp_c9)._m0[174].x, _1474);
    out.m_65.x = _1476;
    bool _1478 = !_1254;
    float _1496;
    if (!_1478)
    {
        float _1480 = in.m_55.x;
        float _1482 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[14].z;
        float _1484 = _1480 * (*spvDescriptorSet0.vp_c9)._m0[15].z;
        float _1486 = fma(_1484, (*spvDescriptorSet0.vp_c9)._m0[14].z, _160);
        float _1488 = _1486 * _1482;
        float _1490 = floor(_1488);
        float _1492 = -_1490;
        float _1494 = _1488 + _1492;
        _1496 = _1494;
        _1498 = true;
    }
    else
    {
        float _1500 = float(_126);
        float _1502 = 1.0 / _1500;
        float _1504 = _160 * _1502;
        _1496 = _1504;
    }
    _1498 = false;
    float _1506 = _1496;
    float _1508 = -(*spvDescriptorSet0.vp_c9)._m0[175].w;
    float _1510 = _1506 + _1508;
    bool _1512 = _1506 >= (*spvDescriptorSet0.vp_c9)._m0[181].w;
    bool _1514 = isnan(_1506);
    bool _1516 = _1512 || _1514;
    bool _1518 = isnan((*spvDescriptorSet0.vp_c9)._m0[181].w);
    bool _1520 = _1516 || _1518;
    float _1522 = float(_1520);
    float _1524 = -(*spvDescriptorSet0.vp_c9)._m0[175].w;
    float _1526 = _1524 + (*spvDescriptorSet0.vp_c9)._m0[176].w;
    bool _1528 = _1506 >= (*spvDescriptorSet0.vp_c9)._m0[180].w;
    bool _1530 = isnan(_1506);
    bool _1532 = _1528 || _1530;
    bool _1534 = isnan((*spvDescriptorSet0.vp_c9)._m0[180].w);
    bool _1536 = _1532 || _1534;
    float _1538 = float(_1536);
    float _1540 = -(*spvDescriptorSet0.vp_c9)._m0[175].x;
    float _1542 = (*spvDescriptorSet0.vp_c9)._m0[176].x + _1540;
    bool _1544 = _1506 >= (*spvDescriptorSet0.vp_c9)._m0[179].w;
    bool _1546 = isnan(_1506);
    bool _1548 = _1544 || _1546;
    bool _1550 = isnan((*spvDescriptorSet0.vp_c9)._m0[179].w);
    bool _1552 = _1548 || _1550;
    float _1554 = float(_1552);
    float _1556 = -_1522;
    float _1558 = _1556 + 1.0;
    float _1560 = 1.0 / _1526;
    float _1562 = _1538 * _1558;
    float _1564 = -_1554;
    float _1566 = _1564 + 1.0;
    float _1568 = -(*spvDescriptorSet0.vp_c9)._m0[176].w;
    float _1570 = _1568 + (*spvDescriptorSet0.vp_c9)._m0[177].w;
    bool _1572 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[14].w;
    float _1574 = 1.0 / _1570;
    float _1576 = _1542 * _1560;
    float _1578 = -_1538;
    float _1580 = _1578 + 1.0;
    bool _1582 = _1506 >= (*spvDescriptorSet0.vp_c9)._m0[178].w;
    bool _1584 = isnan(_1506);
    bool _1586 = _1582 || _1584;
    bool _1588 = isnan((*spvDescriptorSet0.vp_c9)._m0[178].w);
    bool _1590 = _1586 || _1588;
    float _1592 = float(_1590);
    float _1594 = fma(_1576, _1510, (*spvDescriptorSet0.vp_c9)._m0[175].x);
    float _1596 = _1554 * _1580;
    bool _1598 = _1506 >= (*spvDescriptorSet0.vp_c9)._m0[177].w;
    bool _1600 = isnan(_1506);
    bool _1602 = _1598 || _1600;
    bool _1604 = isnan((*spvDescriptorSet0.vp_c9)._m0[177].w);
    bool _1606 = _1602 || _1604;
    float _1608 = float(_1606);
    float _1610 = _1592 * _1566;
    float _1612 = -_1592;
    float _1614 = _1612 + 1.0;
    float _1616 = -(*spvDescriptorSet0.vp_c9)._m0[177].w;
    float _1618 = _1616 + (*spvDescriptorSet0.vp_c9)._m0[178].w;
    bool _1620 = _1506 >= (*spvDescriptorSet0.vp_c9)._m0[176].w;
    bool _1622 = isnan(_1506);
    bool _1624 = _1620 || _1622;
    bool _1626 = isnan((*spvDescriptorSet0.vp_c9)._m0[176].w);
    bool _1628 = _1624 || _1626;
    float _1630 = float(_1628);
    float _1632 = _1608 * _1614;
    float _1634 = -_1608;
    float _1636 = _1634 + 1.0;
    float _1638 = -(*spvDescriptorSet0.vp_c9)._m0[178].w;
    float _1640 = _1638 + (*spvDescriptorSet0.vp_c9)._m0[179].w;
    float _1642 = 1.0 / _1618;
    bool _1644 = _1506 >= (*spvDescriptorSet0.vp_c9)._m0[175].w;
    bool _1646 = isnan(_1506);
    bool _1648 = _1644 || _1646;
    bool _1650 = isnan((*spvDescriptorSet0.vp_c9)._m0[175].w);
    bool _1652 = _1648 || _1650;
    float _1654 = float(_1652);
    float _1656 = _1630 * _1636;
    float _1658 = -_1630;
    float _1660 = _1658 + 1.0;
    float _1662 = -(*spvDescriptorSet0.vp_c9)._m0[179].w;
    float _1664 = _1662 + (*spvDescriptorSet0.vp_c9)._m0[180].w;
    float _1666 = -(*spvDescriptorSet0.vp_c9)._m0[176].x;
    float _1668 = _1666 + (*spvDescriptorSet0.vp_c9)._m0[177].x;
    float _1670 = _1654 * _1660;
    float _1672 = 1.0 / _1640;
    float _1674 = _1668 * _1574;
    float _1676 = _1594 * _1670;
    float _1678 = -_1654;
    float _1680 = _1678 + 1.0;
    float _1682 = -(*spvDescriptorSet0.vp_c9)._m0[180].w;
    float _1684 = _1682 + (*spvDescriptorSet0.vp_c9)._m0[181].w;
    float _1686 = -(*spvDescriptorSet0.vp_c9)._m0[176].w;
    float _1688 = _1506 + _1686;
    float _1690 = 1.0 / _1664;
    float _1692 = -(*spvDescriptorSet0.vp_c9)._m0[177].x;
    float _1694 = (*spvDescriptorSet0.vp_c9)._m0[178].x + _1692;
    float _1696 = fma(_1680, (*spvDescriptorSet0.vp_c9)._m0[175].x, _1676);
    float _1698 = -(*spvDescriptorSet0.vp_c9)._m0[181].w;
    float _1700 = _1698 + (*spvDescriptorSet0.vp_c9)._m0[182].w;
    float _1702 = fma(_1674, _1688, (*spvDescriptorSet0.vp_c9)._m0[176].x);
    float _1704 = _1694 * _1642;
    float _1706 = -(*spvDescriptorSet0.vp_c9)._m0[177].w;
    float _1708 = _1506 + _1706;
    float _1710 = 1.0 / _1684;
    float _1712 = -(*spvDescriptorSet0.vp_c9)._m0[178].x;
    float _1714 = _1712 + (*spvDescriptorSet0.vp_c9)._m0[179].x;
    float _1716 = fma(_1704, _1708, (*spvDescriptorSet0.vp_c9)._m0[177].x);
    float _1718 = fma(_1702, _1656, _1696);
    float _1720 = -(*spvDescriptorSet0.vp_c9)._m0[179].x;
    float _1722 = (*spvDescriptorSet0.vp_c9)._m0[180].x + _1720;
    float _1724 = _1714 * _1672;
    float _1726 = -(*spvDescriptorSet0.vp_c9)._m0[178].w;
    float _1728 = _1506 + _1726;
    float _1730 = 1.0 / _1700;
    float _1732 = fma(_1716, _1632, _1718);
    float _1734 = _1722 * _1690;
    float _1736 = -(*spvDescriptorSet0.vp_c9)._m0[179].w;
    float _1738 = _1506 + _1736;
    float _1740 = -(*spvDescriptorSet0.vp_c9)._m0[180].x;
    float _1742 = _1740 + (*spvDescriptorSet0.vp_c9)._m0[181].x;
    float _1744 = fma(_1724, _1728, (*spvDescriptorSet0.vp_c9)._m0[178].x);
    float _1746 = -(*spvDescriptorSet0.vp_c9)._m0[180].w;
    float _1748 = _1506 + _1746;
    float _1750 = fma(_1734, _1738, (*spvDescriptorSet0.vp_c9)._m0[179].x);
    float _1752 = _1742 * _1710;
    float _1754 = -(*spvDescriptorSet0.vp_c9)._m0[181].x;
    float _1756 = (*spvDescriptorSet0.vp_c9)._m0[182].x + _1754;
    bool _1758 = _1506 >= (*spvDescriptorSet0.vp_c9)._m0[182].w;
    bool _1760 = isnan(_1506);
    bool _1762 = _1758 || _1760;
    bool _1764 = isnan((*spvDescriptorSet0.vp_c9)._m0[182].w);
    bool _1766 = _1762 || _1764;
    float _1768 = float(_1766);
    float _1770 = fma(_1744, _1610, _1732);
    float _1772 = fma(_1752, _1748, (*spvDescriptorSet0.vp_c9)._m0[180].x);
    float _1774 = -(*spvDescriptorSet0.vp_c9)._m0[181].w;
    float _1776 = _1506 + _1774;
    float _1778 = -_1768;
    float _1780 = _1778 + 1.0;
    float _1782 = _1756 * _1730;
    float _1784 = fma(_1750, _1596, _1770);
    float _1786 = _1522 * _1780;
    float _1788 = fma(_1782, _1776, (*spvDescriptorSet0.vp_c9)._m0[181].x);
    float _1790 = fma(_1772, _1562, _1784);
    float _1792 = fma(_1788, _1786, _1790);
    float _1794 = fma(_1768, (*spvDescriptorSet0.vp_c9)._m0[182].x, _1792);
    out.m_67.x = _1794;
    bool _1796 = !_1572;
    float _1798 = _1710;
    float _1800 = (*spvDescriptorSet0.vp_c9)._m0[178].x;
    float _1802 = _1730;
    float _1804 = _1718;
    float _1806 = _1522;
    float _1808 = _1562;
    float _1826;
    if (!_1796)
    {
        float _1810 = in.m_55.x;
        float _1812 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[14].w;
        float _1814 = _1810 * (*spvDescriptorSet0.vp_c9)._m0[15].w;
        float _1816 = fma(_1814, (*spvDescriptorSet0.vp_c9)._m0[14].w, _160);
        float _1818 = _1816 * _1812;
        float _1820 = floor(_1818);
        float _1822 = -_1820;
        float _1824 = _1818 + _1822;
        _1826 = _1824;
        _1828 = true;
    }
    else
    {
        float _1830 = float(_126);
        float _1832 = 1.0 / _1830;
        float _1834 = _160 * _1832;
        _1826 = _1834;
    }
    _1828 = false;
    float _1836 = _1826;
    float _1838 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].y);
    int _1840 = int(_1838);
    float _1842 = float(_126);
    float _1844 = in.m_69.x;
    float _1846 = in.m_55.y;
    int _1848 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _1850 = _1848 != 0;
    float _1852 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].x);
    int _1854 = int(_1852);
    int _1856 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _1858 = _1856 != 0;
    float _1860 = float(_1840);
    float _1862 = trunc((*spvDescriptorSet0.vp_c9)._m0[31].y);
    int _1864 = int(_1862);
    if (_1850)
    {
        float _1866 = in.m_55.x;
        _1798 = _1866;
    }
    float _1868 = _1798;
    float _1870 = float(uint(_1854));
    float _1872 = 1.0 / _1860;
    float _1874 = float(_1854);
    if (_1858)
    {
        float _1876 = in.m_55.z;
        _1800 = _1876;
    }
    float _1878 = _1800;
    int _1880 = ~_1854;
    int _1882 = _1880 + 1;
    float _1884 = 0.0;
    int _1886 = as_type<int>(_1878);
    float _1888 = _1844;
    if (!_1850)
    {
        _1884 = _1844;
    }
    float _1890 = _1884;
    float _1892 = trunc((*spvDescriptorSet0.vp_c9)._m0[40].y);
    int _1894 = int(_1892);
    float _1896 = float(_1864);
    int _1898 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _1900 = _1898 != 0;
    float _1902 = _1872 * _160;
    float _1904 = 1.0 / _1870;
    float _1906 = float(_1894);
    float _1908 = trunc(_1902);
    int _1910 = int(_1908);
    float _1912 = _1890;
    bool _1914 = _1900;
    if (_1900)
    {
        float _1916 = in.m_55.x;
        _1802 = _1916;
    }
    float _1918 = _1802;
    int _1920 = 0;
    float _1922 = _1918;
    if (_1900)
    {
        _1920 = 0;
    }
    int _1924 = _1920;
    int _1926 = 0;
    int _1928 = _1924;
    if (_1900)
    {
        _1926 = 0;
    }
    int _1930 = _1926;
    float _1932 = _1690;
    int _1934 = _1930;
    if (_1900)
    {
        float _1936 = in.m_55.z;
        _1932 = _1936;
    }
    float _1938 = _1932;
    float _1940 = 1.0 / _1896;
    int _1942 = as_type<int>(_1904) + (-2);
    float _1944 = _1874 * _160;
    if (_1900)
    {
        _1804 = 1.0;
    }
    float _1946 = _1804;
    float _1948 = _1946;
    if (_1900)
    {
        _1806 = 1.0;
    }
    float _1950 = _1806;
    float _1952 = _1950;
    if (_1900)
    {
        _1808 = 1.0;
    }
    float _1954 = _1808;
    float _1956 = 1.0 / _1906;
    float _1958 = float(uint(_1910));
    int _1960 = 0;
    float _1962 = _1954;
    if (_1900)
    {
        _1960 = as_type<int>(_1846);
    }
    int _1964 = _1960;
    float _1966 = 1.0 / _1842;
    float _1968 = as_type<float>(_1942) * _1958;
    float _1970 = _1940 * _160;
    int _1972 = as_type<int>(_1940);
    float _1974 = _1938;
    int _1976 = _1964;
    if (_1900)
    {
        _1972 = as_type<int>(_1938);
    }
    int _1978 = _1972;
    float _1980 = trunc(_1968);
    float _1982 = precise::max(_1980, 0.0);
    uint _1985 = uint(_1982);
    float _1987 = trunc((*spvDescriptorSet0.vp_c9)._m0[31].x);
    int _1989 = int(_1987);
    float _1991 = float(_1910);
    float _1993 = _1944 * _1966;
    float _1995 = in.m_55.w;
    bool _1997 = _1991 >= _1874;
    bool _1999 = isnan(_1991);
    bool _2001 = _1997 || _1999;
    bool _2003 = isnan(_1874);
    bool _2005 = _2001 || _2003;
    float _2007 = float(_2005);
    float _2009 = trunc((*spvDescriptorSet0.vp_c9)._m0[40].x);
    int _2011 = int(_2009);
    int _2013 = _1882 * int(_1985);
    int _2015 = _2013 + _1910;
    float _2017 = float(uint(_2015));
    float _2019 = trunc((*spvDescriptorSet0.vp_c9)._m0[49].x);
    int _2021 = int(_2019);
    float _2023 = float(uint(_1989));
    float _2025 = as_type<float>(_1942) * _2017;
    float _2027 = _2017;
    float _2029 = as_type<float>(_2015);
    int _2031 = _1978;
    int _2033 = as_type<int>(_2025);
    if (_1900)
    {
        _2027 = _1918;
    }
    float _2035 = _2027;
    float _2037 = trunc((*spvDescriptorSet0.vp_c9)._m0[49].y);
    int _2039 = int(_2037);
    float _2041 = float(uint(_2011));
    float _2043 = _2035;
    if (_1900)
    {
        _2029 = _2035;
    }
    float _2045 = _2029;
    int _2047 = 0;
    float _2049 = _2045;
    if (_1900)
    {
        _2047 = as_type<int>(_2035);
    }
    int _2051 = _2047;
    float _2053 = float(uint(_2021));
    float _2055 = 1.0 / _2023;
    float _2057 = float(_2039);
    float _2059 = 1.0 / _2041;
    float _2061 = 1.0 / _2057;
    float _2063 = 1.0 / _2053;
    float _2065 = trunc(_1993);
    int _2067 = int(_2065);
    float _2069 = trunc(_1970);
    int _2071 = int(_2069);
    float _2073 = trunc(_2007);
    int _2075 = int(_2073);
    float _2077 = trunc(_2025);
    float _2079 = precise::max(_2077, 0.0);
    uint _2081 = uint(_2079);
    int _2083 = _2051;
    int _2085 = int(_2081);
    if (!_1900)
    {
        float _2087 = in.m_55.x;
        float _2089 = _1846 * 3.1415927410125732421875;
        float _2091 = in.m_55.z;
        float _2093 = _2089 * 0.15915493667125701904296875;
        float _2095 = _2093 * 6.283185482025146484375;
        float _2097 = sin(_2095);
        float _2099 = _2087 * 3.1415927410125732421875;
        float _2101 = _2099 * 0.15915493667125701904296875;
        float _2103 = _2091 * 3.1415927410125732421875;
        float _2105 = _2103 * 0.15915493667125701904296875;
        float _2107 = _2101 * 6.283185482025146484375;
        float _2109 = sin(_2107);
        float _2111 = _2105 * 6.283185482025146484375;
        float _2113 = sin(_2111);
        _1952 = 1.2345600128173828125;
        _2043 = _1846;
        _1948 = 7.345489978790283203125;
        _1922 = _2087;
        _1962 = 5.839270114898681640625;
        _2049 = _2091;
        _1974 = _2091;
        _1928 = 1;
        _1934 = 2;
        _1976 = as_type<int>(_2097);
        _2083 = as_type<int>(_2109);
        _2031 = as_type<int>(_2113);
    }
    float _2115 = _1952;
    float _2117 = _2043;
    float _2119 = _1948;
    float _2121 = _1922;
    float _2123 = _1962;
    float _2125 = _2049;
    float _2127 = _1974;
    int _2129 = _1928;
    int _2131 = _1934;
    int _2133 = _1976;
    int _2135 = _2083;
    int _2137 = _2031;
    int _2139 = as_type<int>(_2119);
    if (_1850)
    {
        float _2141 = -_1844;
        float _2143 = _2141 + 1.0;
        _2033 = as_type<int>(_2143);
    }
    int _2145 = _2033;
    bool _2147 = false;
    if (_1850)
    {
        bool _2149 = _1868 > 0.5;
        _2147 = _2149;
    }
    bool _2151 = _2147;
    float _2153 = _2115 * _2117;
    int _2155 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 16;
    bool _2157 = _2155 != 0;
    float _2159 = _2119 * _2121;
    if (_1850)
    {
        float _2161 = _2151 ? as_type<float>(_2145) : _1844;
        _1912 = _2161;
    }
    float _2163 = _1912;
    float _2165 = _2123 * _2125;
    int _2167 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 64;
    bool _2169 = _2167 != 0;
    float _2171 = _2119 * _2117;
    int _2173 = int(_1985) + int(_2081);
    float _2175 = floor(_2153);
    int _2177 = ~_1854;
    int _2179 = _2177 + 1;
    float _2181 = in.m_69.y;
    int _2183 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 256;
    bool _2185 = _2183 != 0;
    if (_1858)
    {
        bool _2187 = _1878 > 0.5;
        _1914 = _2187;
    }
    bool _2189 = _1914;
    if (_1858)
    {
        float _2191 = -_1844;
        float _2193 = _2191 + 1.0;
        _1886 = as_type<int>(_2193);
    }
    int _2195 = _1886;
    int _2197 = _2179 * _2173;
    int _2199 = _2197 + _1910;
    if (_2157)
    {
        float _2201 = -_1844;
        float _2203 = _2201 + 1.0;
        _2085 = as_type<int>(_2203);
    }
    int _2205 = _2085;
    bool _2207 = _1846 > 0.5;
    float _2209 = as_type<float>(_2205);
    if (_2169)
    {
        float _2211 = -_1844;
        float _2213 = _2211 + 1.0;
        _2139 = as_type<int>(_2213);
    }
    int _2215 = _2139;
    float _2217 = 0.0;
    if (!_1858)
    {
        _2217 = _1844;
    }
    float _2219 = _2217;
    float _2221 = floor(_2165);
    float _2223 = _2219;
    if (_1858)
    {
        float _2225 = _2189 ? as_type<float>(_2195) : _1844;
        _2223 = _2225;
    }
    float _2227 = _2223;
    float _2229 = 0.0;
    if (!_2157)
    {
        _2229 = _1844;
    }
    float _2231 = _2229;
    int _2233 = 0;
    float _2235 = _2231;
    if (_2185)
    {
        float _2237 = -_1844;
        float _2239 = _2237 + 1.0;
        _2233 = as_type<int>(_2239);
    }
    int _2241 = _2233;
    bool _2243 = uint(_2199) >= uint(_1854);
    float _2245 = _1956 * _160;
    if (_2157)
    {
        float _2247 = _2207 ? as_type<float>(_2205) : _1844;
        _2235 = _2247;
    }
    float _2249 = _2235;
    float _2251 = floor(_2159);
    if (!_2169)
    {
        _2209 = _1844;
    }
    float _2253 = _2209;
    float _2255 = _2253;
    if (_2169)
    {
        float _2257 = _2207 ? as_type<float>(_2215) : _1844;
        _2255 = _2257;
    }
    float _2259 = _2255;
    bool _2261 = !_2243;
    int _2263 = _2261 ? 0 : (-1);
    if (_2185)
    {
        float _2265 = _2207 ? as_type<float>(_2241) : _1844;
        _1888 = _2265;
    }
    float _2267 = _1888;
    float _2269 = floor(_2171);
    int _2271 = ~_2173;
    int _2273 = _2271 + _2263;
    int _2275 = _2273 + 1;
    float _2277 = _2061 * _160;
    int _2279 = as_type<int>(_2055) + (-2);
    float _2281 = -_2175;
    float _2283 = _2153 + _2281;
    float _2285 = float(uint(_2071));
    int _2287 = _1854 * _2275;
    int _2289 = _2287 + _1910;
    bool _2291 = _1854 == 0;
    float _2293 = trunc(_2245);
    int _2295 = int(_2293);
    float _2297 = -_2221;
    float _2299 = _2165 + _2297;
    float _2301 = as_type<float>(_2279) * _2285;
    float _2303 = -_2251;
    float _2305 = _2159 + _2303;
    int _2307 = ~_2075;
    int _2309 = _2307 + 1;
    int _2311 = _2309 + 1;
    bool _2313 = !_2291;
    int _2315 = _2313 ? _2289 : (-1);
    float _2317 = _2305 * _1874;
    float _2319 = trunc(_2301);
    float _2321 = precise::max(_2319, 0.0);
    uint _2323 = uint(_2321);
    int _2325 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4096;
    bool _2327 = _2325 != 0;
    float _2329 = -_2269;
    float _2331 = _2171 + _2329;
    int _2333 = _2315 * _2311;
    bool _2335 = !_2327;
    int _2337 = _2335 ? 0 : 1;
    int _2339 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 16;
    bool _2341 = _2339 != 0;
    int _2343 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 32;
    bool _2345 = _2343 != 0;
    int _2347 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 64;
    bool _2349 = _2347 != 0;
    float _2351 = trunc(_2277);
    int _2353 = int(_2351);
    int _2355 = abs(_2337);
    int _2357 = ~_1989;
    int _2359 = _2357 + 1;
    bool _2361 = !_2345;
    int _2363 = _2361 ? 0 : 1;
    int _2365 = as_type<int>(_2059) + (-2);
    float _2367 = trunc(_2317);
    int _2369 = int(_2367);
    float _2371 = float(uint(_2295));
    int _2373 = abs(_2363);
    int _2375 = _2359 * int(_2323);
    int _2377 = _2375 + _2071;
    int _2379 = _1854 + (-1);
    float _2381 = as_type<float>(_2365) * _2371;
    int _2383 = as_type<int>(_2063) + (-2);
    float _2385 = float(uint(_2377));
    int _2387 = _2075 * _2379;
    int _2389 = _2387 + _2333;
    float _2391 = float(uint(_2353));
    float _2393 = trunc(_2381);
    float _2395 = precise::max(_2393, 0.0);
    uint _2397 = uint(_2395);
    bool _2399 = !_2341;
    int _2401 = _2399 ? 0 : 1;
    int _2403 = _2389 * _2373;
    float _2405 = as_type<float>(_2279) * _2385;
    float _2407 = as_type<float>(_2383) * _2391;
    int _2409 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 128;
    bool _2411 = _2409 != 0;
    int _2413 = _2369 * _2355;
    int _2415 = _2413 + _1910;
    bool _2417 = !_2349;
    int _2419 = _2417 ? 0 : 1;
    float _2421 = trunc(_2405);
    float _2423 = precise::max(_2421, 0.0);
    uint _2425 = uint(_2423);
    int _2427 = abs(_2401);
    bool _2429 = !_2411;
    int _2431 = _2429 ? 0 : 1;
    int _2433 = abs(_2419);
    float _2435 = trunc(_2407);
    float _2437 = precise::max(_2435, 0.0);
    uint _2439 = uint(_2437);
    int _2441 = ~_2011;
    int _2443 = _2441 + 1;
    int _2445 = abs(_2431);
    int _2447 = _2067 * _2427;
    int _2449 = _2447 + _2403;
    int _2451 = _2443 * int(_2397);
    int _2453 = _2451 + _2295;
    int _2455 = ~_2021;
    int _2457 = _2455 + 1;
    float _2459 = _1966 * _160;
    int _2461 = int(_2323) + int(_2425);
    int _2463 = _2415 * _2433;
    int _2465 = _2463 + _2449;
    float _2467 = float(uint(_2453));
    float _2469 = float(_2071);
    int _2471 = _2369 * _2445;
    int _2473 = _2471 + _2465;
    float _2475 = float(_2021);
    float _2477 = as_type<float>(_2365) * _2467;
    int _2479 = _2457 * int(_2439);
    int _2481 = _2479 + _2353;
    float _2483 = float(_2295);
    float _2485 = float(uint(_2473));
    float _2487 = trunc(_2477);
    float _2489 = precise::max(_2487, 0.0);
    uint _2491 = uint(_2489);
    float _2493 = float(uint(_2481));
    float _2495 = float(_1989);
    int _2497 = ~_1989;
    int _2499 = _2497 + 1;
    float _2501 = as_type<float>(_2383) * _2493;
    float _2503 = float(_2011);
    float _2505 = _2495 * _2283;
    float _2507 = as_type<float>(_1942) * _2485;
    float _2509 = trunc(_2501);
    float _2511 = precise::max(_2509, 0.0);
    uint _2513 = uint(_2511);
    int _2515 = ~_1854;
    int _2517 = _2515 + 1;
    float _2519 = _2495 * _2459;
    bool _2521 = _2469 >= _2495;
    bool _2523 = isnan(_2469);
    bool _2525 = _2521 || _2523;
    bool _2527 = isnan(_2495);
    bool _2529 = _2525 || _2527;
    float _2531 = float(_2529);
    float _2533 = _2503 * _2299;
    bool _2535 = _2483 >= _2503;
    bool _2537 = isnan(_2483);
    bool _2539 = _2535 || _2537;
    bool _2541 = isnan(_2503);
    bool _2543 = _2539 || _2541;
    float _2545 = float(_2543);
    float _2547 = _2503 * _2459;
    float _2549 = _2475 * _2459;
    float _2551 = trunc(_2507);
    float _2553 = precise::max(_2551, 0.0);
    uint _2555 = uint(_2553);
    float _2557 = float(_2353);
    float _2559 = _2475 * _2331;
    bool _2561 = _2557 >= _2475;
    bool _2563 = isnan(_2557);
    bool _2565 = _2561 || _2563;
    bool _2567 = isnan(_2475);
    bool _2569 = _2565 || _2567;
    float _2571 = float(_2569);
    int _2573 = _2499 * _2461;
    int _2575 = _2573 + _2071;
    int _2577 = ~_2011;
    int _2579 = _2577 + 1;
    float _2581 = trunc(_2531);
    int _2583 = int(_2581);
    int _2585 = int(_2397) + int(_2491);
    bool _2587 = uint(_2575) >= uint(_1989);
    int _2589 = int(_2439) + int(_2513);
    int _2591 = _2517 * int(_2555);
    int _2593 = _2591 + _2473;
    int _2595 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8192;
    bool _2597 = _2595 != 0;
    int _2599 = _2579 * _2585;
    int _2601 = _2599 + _2295;
    int _2603 = ~_2021;
    int _2605 = _2603 + 1;
    float _2607 = trunc(_2505);
    int _2609 = int(_2607);
    float _2611 = float(uint(_2593));
    int _2613 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 256;
    bool _2615 = _2613 != 0;
    int _2617 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 512;
    bool _2619 = _2617 != 0;
    int _2621 = _2605 * _2589;
    int _2623 = _2621 + _2353;
    bool _2625 = uint(_2601) >= uint(_2011);
    float _2627 = as_type<float>(_1942) * _2611;
    bool _2629 = !_2597;
    int _2631 = _2629 ? 0 : 1;
    float _2633 = trunc(_2545);
    int _2635 = int(_2633);
    bool _2637 = !_2587;
    int _2639 = _2637 ? 0 : (-1);
    bool _2641 = !_2619;
    int _2643 = _2641 ? 0 : 1;
    int _2645 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1024;
    bool _2647 = _2645 != 0;
    int _2649 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 2048;
    bool _2651 = _2649 != 0;
    bool _2653 = !_2615;
    int _2655 = _2653 ? 0 : 1;
    float _2657 = trunc(_2627);
    float _2659 = precise::max(_2657, 0.0);
    uint _2661 = uint(_2659);
    bool _2663 = uint(_2623) >= uint(_2021);
    int _2665 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 16384;
    bool _2667 = _2665 != 0;
    bool _2669 = !_2625;
    int _2671 = _2669 ? 0 : (-1);
    int _2673 = ~_2461;
    int _2675 = _2673 + _2639;
    int _2677 = _2675 + 1;
    float _2679 = trunc(_2549);
    int _2681 = int(_2679);
    int _2683 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 4096;
    bool _2685 = _2683 != 0;
    int _2687 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 8192;
    bool _2689 = _2687 != 0;
    bool _2691 = !_2667;
    int _2693 = _2691 ? 0 : 1;
    int _2695 = _1989 * _2677;
    int _2697 = _2695 + _2071;
    bool _2699 = !_2647;
    int _2701 = _2699 ? 0 : 1;
    bool _2703 = !_2651;
    int _2705 = _2703 ? 0 : 1;
    float _2707 = trunc(_2559);
    int _2709 = int(_2707);
    int _2711 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 16384;
    bool _2713 = _2711 != 0;
    bool _2715 = _1989 == 0;
    int _2717 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 32768;
    bool _2719 = _2717 != 0;
    int _2721 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 32768;
    bool _2723 = _2721 != 0;
    int _2725 = abs(_2631);
    bool _2727 = !_2713;
    int _2729 = _2727 ? 0 : 1;
    bool _2731 = !_2663;
    int _2733 = _2731 ? 0 : (-1);
    int _2735 = _2609 * _2725;
    int _2737 = _2735 + _2071;
    int _2739 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 65536;
    bool _2741 = _2739 != 0;
    int _2743 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 131072;
    bool _2745 = _2743 != 0;
    int _2747 = ~_2585;
    int _2749 = _2747 + _2671;
    int _2751 = _2749 + 1;
    int _2753 = ~_2583;
    int _2755 = _2753 + 1;
    int _2757 = _2755 + 1;
    bool _2759 = !_2715;
    int _2761 = _2759 ? _2697 : (-1);
    int _2763 = _2011 * _2751;
    int _2765 = _2763 + _2295;
    int _2767 = int(_2555) + int(_2661);
    float _2769 = trunc(_2571);
    int _2771 = int(_2769);
    int _2773 = ~_1854;
    int _2775 = _2773 + 1;
    int _2777 = _2757 * _2761;
    bool _2779 = !_2745;
    int _2781 = _2779 ? 0 : 1;
    bool _2783 = _2011 == 0;
    int _2785 = _2775 * _2767;
    int _2787 = _2785 + _2473;
    int _2789 = _1989 + (-1);
    int _2791 = ~_2635;
    int _2793 = _2791 + 1;
    int _2795 = _2793 + 1;
    bool _2797 = !_2783;
    int _2799 = _2797 ? _2765 : (-1);
    int _2801 = _2583 * _2789;
    int _2803 = _2801 + _2777;
    int _2805 = ~_2589;
    int _2807 = _2805 + _2733;
    int _2809 = _2807 + 1;
    float _2811 = trunc(_2519);
    int _2813 = int(_2811);
    bool _2815 = !_2723;
    int _2817 = _2815 ? 0 : 1;
    int _2819 = _2795 * _2799;
    int _2821 = abs(_2643);
    int _2823 = _2021 * _2809;
    int _2825 = _2823 + _2353;
    bool _2827 = uint(_2787) >= uint(_1854);
    int _2829 = abs(_2655);
    float _2831 = trunc(_2533);
    int _2833 = int(_2831);
    bool _2835 = !_2719;
    int _2837 = _2835 ? 0 : 1;
    bool _2839 = !_2827;
    int _2841 = _2839 ? 0 : (-1);
    int _2843 = _2803 * _2821;
    bool _2845 = !_2685;
    int _2847 = _2845 ? 0 : 1;
    float _2849 = trunc(_2547);
    int _2851 = int(_2849);
    int _2853 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 262144;
    bool _2855 = _2853 != 0;
    int _2857 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 524288;
    bool _2859 = _2857 != 0;
    bool _2861 = _2021 == 0;
    int _2863 = abs(_2701);
    int _2865 = _2011 + (-1);
    int _2867 = ~_2771;
    int _2869 = _2867 + 1;
    int _2871 = _2869 + 1;
    int _2873 = _2635 * _2865;
    int _2875 = _2873 + _2819;
    bool _2877 = !_2861;
    int _2879 = _2877 ? _2825 : (-1);
    int _2881 = _2813 * _2829;
    int _2883 = _2881 + _2843;
    float _2885 = _2121 * 2.0;
    int _2887 = abs(_2705);
    int _2889 = _2871 * _2879;
    int _2891 = abs(_2693);
    int _2893 = _2737 * _2863;
    int _2895 = _2893 + _2883;
    float _2897 = _1846 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    bool _2899 = !_2689;
    int _2901 = _2899 ? 0 : 1;
    int _2903 = abs(_2847);
    int _2905 = _2609 * _2887;
    int _2907 = _2905 + _2895;
    int _2909 = abs(_2901);
    float _2911 = float(uint(_2907));
    int _2913 = _2875 * _2909;
    int _2915 = abs(_2729);
    float _2917 = as_type<float>(_2279) * _2911;
    int _2919 = abs(_2837);
    int _2921 = _2851 * _2903;
    int _2923 = _2921 + _2913;
    float _2925 = trunc(_2917);
    float _2927 = precise::max(_2925, 0.0);
    uint _2929 = uint(_2927);
    int _2931 = _2833 * _2891;
    int _2933 = _2931 + _2295;
    int _2935 = abs(_2817);
    int _2937 = _2933 * _2915;
    int _2939 = _2937 + _2923;
    bool _2941 = !_2741;
    int _2943 = _2941 ? 0 : 1;
    int _2945 = _2021 + (-1);
    int _2947 = _2833 * _2919;
    int _2949 = _2947 + _2939;
    int _2951 = abs(_2781);
    int _2953 = ~_1989;
    int _2955 = _2953 + 1;
    int _2957 = _2771 * _2945;
    int _2959 = _2957 + _2889;
    int _2961 = abs(_2943);
    int _2963 = _2955 * int(_2929);
    int _2965 = _2963 + _2907;
    bool _2967 = !_2855;
    int _2969 = _2967 ? 0 : 1;
    int _2971 = _2959 * _2951;
    int _2973 = _2709 * _2935;
    int _2975 = _2973 + _2353;
    int _2977 = ~_2767;
    int _2979 = _2977 + _2841;
    int _2981 = _2979 + 1;
    float _2983 = float(uint(_2949));
    int _2985 = _2681 * _2961;
    int _2987 = _2985 + _2971;
    float _2989 = float(uint(_2965));
    int _2991 = _1854 * _2981;
    int _2993 = _2991 + _2473;
    bool _2995 = !_2859;
    int _2997 = _2995 ? 0 : 1;
    float _2999 = as_type<float>(_2365) * _2983;
    int _3001 = abs(_2969);
    float _3003 = as_type<float>(_2279) * _2989;
    int _3005 = abs(_2997);
    float _3007 = trunc(_2999);
    float _3009 = precise::max(_3007, 0.0);
    uint _3011 = uint(_3009);
    bool _3013 = _1854 == 0;
    int _3015 = _2975 * _3001;
    int _3017 = _3015 + _2987;
    float _3019 = -_2181;
    float _3021 = _3019 + 1.0;
    bool _3023 = _1995 > 0.5;
    float _3025 = trunc(_3003);
    float _3027 = precise::max(_3025, 0.0);
    uint _3029 = uint(_3027);
    bool _3031 = !_3013;
    int _3033 = _3031 ? _2993 : (-1);
    int _3035 = _2709 * _3005;
    int _3037 = _3035 + _3017;
    int _3039 = _3023 ? as_type<int>(_3021) : as_type<int>(_2181);
    int _3041 = _3033 & 3;
    bool _3043 = _3041 != 0;
    int _3045 = _3033 & 3;
    bool _3047 = _3045 != 0;
    int _3049 = ~_2011;
    int _3051 = _3049 + 1;
    float _3053 = float(uint(_3037));
    int _3055 = _3043 ? 0 : 1;
    int _3057 = _3051 * int(_3011);
    int _3059 = _3057 + _2949;
    bool _3061 = uint(_3045) > 1u;
    float _3063 = as_type<float>(_2383) * _3053;
    int _3065 = int(_2929) + int(_3029);
    int _3067 = ~_1989;
    int _3069 = _3067 + 1;
    float _3071 = trunc(_3063);
    float _3073 = precise::max(_3071, 0.0);
    uint _3075 = uint(_3073);
    float _3077 = float(uint(_3059));
    int _3079 = ~_3055;
    int _3081 = _3079 + 1;
    int _3083 = _3081 + 1;
    float _3085 = as_type<float>(_2365) * _3077;
    int _3087 = ~_2021;
    int _3089 = _3087 + 1;
    int _3091 = _3069 * _3065;
    int _3093 = _3091 + _2907;
    int _3095 = _3083;
    if (!_3061)
    {
        int _3097 = ~_3055;
        int _3099 = _3097 + 1;
        _3095 = _3099;
    }
    int _3101 = _3095;
    float _3103 = trunc(_3085);
    float _3105 = precise::max(_3103, 0.0);
    uint _3107 = uint(_3105);
    bool _3109 = uint(_3045) >= 2u;
    bool _3111 = _1846 > 0.5;
    int _3113 = _3109 ? 0 : 1;
    int _3115 = _3089 * int(_3075);
    int _3117 = _3115 + _3037;
    bool _3119 = uint(_3093) >= uint(_1989);
    int _3121 = ~_3113;
    int _3123 = _3121 + 1;
    int _3125 = _3123 + 1;
    bool _3127 = !_3119;
    int _3129 = _3127 ? 0 : (-1);
    bool _3131 = _3045 != 3;
    float _3133 = float(uint(_3117));
    int _3135 = ~_2011;
    int _3137 = _3135 + 1;
    int _3139 = int(_3011) + int(_3107);
    float _3141 = as_type<float>(_2383) * _3133;
    int _3143 = ~_3065;
    int _3145 = _3143 + _3129;
    int _3147 = _3145 + 1;
    float _3149 = trunc(_3141);
    float _3151 = precise::max(_3149, 0.0);
    uint _3153 = uint(_3151);
    int _3155 = _3137 * _3139;
    int _3157 = _3155 + _2949;
    int _3159 = _3125;
    if (_3131)
    {
        int _3161 = ~_3113;
        int _3163 = _3161 + 1;
        _3159 = _3163;
    }
    int _3165 = _3159;
    int _3167 = _1989 * _3147;
    int _3169 = _3167 + _2907;
    int _3171 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2097152;
    bool _3173 = _3171 != 0;
    float _3175 = -(*spvDescriptorSet0.vp_c9)._m0[184].w;
    float _3177 = _3175 + (*spvDescriptorSet0.vp_c9)._m0[185].w;
    bool _3179 = !_3173;
    int _3181 = _3179 ? 0 : 1;
    bool _3183 = uint(_3157) >= uint(_2011);
    float _3185 = -(*spvDescriptorSet0.vp_c9)._m0[185].w;
    float _3187 = _3185 + (*spvDescriptorSet0.vp_c9)._m0[186].w;
    bool _3189 = !_2715;
    int _3191 = _3189 ? _3169 : (-1);
    float _3193 = 1.0 / _3177;
    bool _3195 = !_3183;
    int _3197 = _3195 ? 0 : (-1);
    int _3199 = _3191 & 3;
    bool _3201 = _3199 != 0;
    int _3203 = _3111 ? as_type<int>(_3021) : as_type<int>(_2181);
    int _3205 = ~_3139;
    int _3207 = _3205 + _3197;
    int _3209 = _3207 + 1;
    float _3211 = 1.0 / _3187;
    bool _3213 = uint(_3199) >= 2u;
    int _3215 = _3201 ? 0 : 1;
    int _3217 = _2011 * _3209;
    int _3219 = _3217 + _2949;
    bool _3221 = _3199 != 3;
    int _3223 = _3213 ? 0 : 1;
    int _3225 = int(_3075) + int(_3153);
    bool _3227 = uint(_3199) > 1u;
    int _3229 = ~_2021;
    int _3231 = _3229 + 1;
    int _3233 = ~_3223;
    int _3235 = _3233 + 1;
    int _3237 = _3235 + 1;
    bool _3239 = !_2783;
    int _3241 = _3239 ? _3219 : (-1);
    int _3243 = _3231 * _3225;
    int _3245 = _3243 + _3037;
    int _3247 = _3237;
    if (_3221)
    {
        int _3249 = ~_3223;
        int _3251 = _3249 + 1;
        _3247 = _3251;
    }
    int _3253 = _3247;
    int _3255 = ~_3215;
    int _3257 = _3255 + 1;
    int _3259 = _3257 + 1;
    bool _3261 = uint(_3245) >= uint(_2021);
    int _3263 = _3259;
    if (!_3227)
    {
        int _3265 = ~_3215;
        int _3267 = _3265 + 1;
        _3263 = _3267;
    }
    int _3269 = _3263;
    int _3271 = _3241 & 3;
    bool _3273 = _3271 != 0;
    bool _3275 = !_3261;
    int _3277 = _3275 ? 0 : (-1);
    int _3279 = _3273 ? 0 : 1;
    bool _3281 = uint(_3271) >= 2u;
    bool _3283 = _3271 != 3;
    int _3285 = ~_3225;
    int _3287 = _3285 + _3277;
    int _3289 = _3287 + 1;
    int _3291 = _3281 ? 0 : 1;
    bool _3293 = uint(_3271) > 1u;
    int _3295 = _2021 * _3289;
    int _3297 = _3295 + _3037;
    int _3299 = ~_3291;
    int _3301 = _3299 + 1;
    int _3303 = _3301 + 1;
    int _3305 = ~_3279;
    int _3307 = _3305 + 1;
    int _3309 = _3307 + 1;
    bool _3311 = !_2861;
    int _3313 = _3311 ? _3297 : (-1);
    int _3315 = _3303;
    int _3317 = _3309;
    if (_3283)
    {
        int _3319 = ~_3291;
        int _3321 = _3319 + 1;
        _3315 = _3321;
    }
    int _3323 = _3315;
    int _3325 = _3313 & 3;
    bool _3327 = _3325 != 0;
    if (!_3293)
    {
        int _3329 = ~_3279;
        int _3331 = _3329 + 1;
        _3317 = _3331;
    }
    int _3333 = _3317;
    bool _3335 = uint(_3325) >= 2u;
    float _3337 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    int _3339 = _3327 ? 0 : 1;
    int _3341 = _3335 ? 0 : 1;
    float _3343 = fma(_2897, -2.0, _3337);
    bool _3345 = uint(_3325) > 1u;
    bool _3347 = _3325 != 3;
    float _3349 = fma(_160, (*spvDescriptorSet0.vp_c9)._m0[76].y, _3343);
    int _3351 = ~_3339;
    int _3353 = _3351 + 1;
    int _3355 = _3353 + 1;
    int _3357 = ~_3341;
    int _3359 = _3357 + 1;
    int _3361 = _3359 + 1;
    float _3363 = -(*spvDescriptorSet0.vp_c9)._m0[183].w;
    float _3365 = _3363 + (*spvDescriptorSet0.vp_c9)._m0[184].w;
    int _3367 = _3355;
    int _3369 = _3361;
    if (!_3345)
    {
        int _3371 = ~_3339;
        int _3373 = _3371 + 1;
        _3367 = _3373;
    }
    int _3375 = _3367;
    float _3377 = -(*spvDescriptorSet0.vp_c9)._m0[187].w;
    float _3379 = _3377 + (*spvDescriptorSet0.vp_c9)._m0[188].w;
    int _3381 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8388608;
    bool _3383 = _3381 != 0;
    float _3385 = -(*spvDescriptorSet0.vp_c9)._m0[188].w;
    float _3387 = _3385 + (*spvDescriptorSet0.vp_c9)._m0[189].w;
    if (_3347)
    {
        int _3389 = ~_3341;
        int _3391 = _3389 + 1;
        _3369 = _3391;
    }
    int _3393 = _3369;
    float _3395 = 1.0 / _3365;
    bool _3397 = !_3383;
    int _3399 = _3397 ? 0 : 1;
    float _3401 = in.m_46.x;
    float _3403 = in.m_46.y;
    float _3405 = in.m_46.z;
    int _3407 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4194304;
    bool _3409 = _3407 != 0;
    int _3411 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _3413 = _3411 != 0;
    bool _3415 = !_3409;
    int _3417 = _3415 ? 0 : 1;
    float _3419 = 1.0 / _3379;
    float _3421 = _3413 ? as_type<float>(_3203) : _2181;
    int _3423 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _3425 = _3423 != 0;
    bool _3427 = _2127 > 0.5;
    float _3429 = _3425 ? as_type<float>(_3039) : _2181;
    float _3431 = 1.0 / _3387;
    int _3433 = _3427 ? as_type<int>(_3021) : as_type<int>(_2181);
    int _3435 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 32;
    bool _3437 = _3435 != 0;
    int _3439 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 128;
    bool _3441 = _3439 != 0;
    float _3443 = _3437 ? as_type<float>(_3433) : _2181;
    float _3445 = _3441 ? as_type<float>(_3433) : _2181;
    float _3447 = _3403 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    int _3449 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 16777216;
    bool _3451 = _3449 != 0;
    float _3453 = _3403 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    int _3455 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 512;
    bool _3457 = _3455 != 0;
    float _3459 = _3403 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _3461 = floor(_2885);
    float _3463 = fma(_3401, (*spvDescriptorSet0.vp_c10)._m0[4].x, _3447);
    float _3465 = fma(_3401, (*spvDescriptorSet0.vp_c10)._m0[5].x, _3453);
    float _3467 = -(*spvDescriptorSet0.vp_c9)._m0[186].w;
    float _3469 = _3467 + (*spvDescriptorSet0.vp_c9)._m0[187].w;
    float _3471 = fma(_3401, (*spvDescriptorSet0.vp_c10)._m0[6].x, _3459);
    float _3473 = -(*spvDescriptorSet0.vp_c9)._m0[183].x;
    float _3475 = (*spvDescriptorSet0.vp_c9)._m0[184].x + _3473;
    float _3477 = -(*spvDescriptorSet0.vp_c9)._m0[184].x;
    float _3479 = _3477 + (*spvDescriptorSet0.vp_c9)._m0[185].x;
    float _3481 = -(*spvDescriptorSet0.vp_c9)._m0[185].x;
    float _3483 = (*spvDescriptorSet0.vp_c9)._m0[186].x + _3481;
    float _3485 = _3457 ? as_type<float>(_3433) : _2181;
    float _3487 = 1.0 / _3469;
    float _3489 = _3479 * _3193;
    float _3491 = -(*spvDescriptorSet0.vp_c9)._m0[189].w;
    float _3493 = _3491 + (*spvDescriptorSet0.vp_c9)._m0[190].w;
    bool _3495 = _3461 >= 0.0;
    bool _3497 = isnan(_3461);
    bool _3499 = _3495 || _3497;
    bool _3501 = isnan(0.0);
    bool _3503 = _3499 || _3501;
    float _3505 = _3483 * _3211;
    float _3507 = _1846 * 2.0;
    int _3509 = _3503 ? 0 : 1;
    float _3511 = 1.0 / _3493;
    bool _3513 = _3461 > 0.0;
    float _3515 = -(*spvDescriptorSet0.vp_c9)._m0[187].x;
    float _3517 = (*spvDescriptorSet0.vp_c9)._m0[188].x + _3515;
    float _3519 = -(*spvDescriptorSet0.vp_c9)._m0[188].x;
    float _3521 = _3519 + (*spvDescriptorSet0.vp_c9)._m0[189].x;
    float _3523 = _3475 * _3395;
    float _3525 = -(*spvDescriptorSet0.vp_c9)._m0[186].x;
    float _3527 = _3525 + (*spvDescriptorSet0.vp_c9)._m0[187].x;
    float _3529 = _3517 * _3419;
    float _3531 = floor(_3507);
    float _3533 = _3521 * _3431;
    bool _3535 = _1836 >= (*spvDescriptorSet0.vp_c9)._m0[189].w;
    bool _3537 = isnan(_1836);
    bool _3539 = _3535 || _3537;
    bool _3541 = isnan((*spvDescriptorSet0.vp_c9)._m0[189].w);
    bool _3543 = _3539 || _3541;
    float _3545 = float(_3543);
    float _3547 = _3527 * _3487;
    bool _3549 = _1836 >= (*spvDescriptorSet0.vp_c9)._m0[190].w;
    bool _3551 = isnan(_1836);
    bool _3553 = _3549 || _3551;
    bool _3555 = isnan((*spvDescriptorSet0.vp_c9)._m0[190].w);
    bool _3557 = _3553 || _3555;
    float _3559 = float(_3557);
    float _3561 = -(*spvDescriptorSet0.vp_c9)._m0[189].x;
    float _3563 = (*spvDescriptorSet0.vp_c9)._m0[190].x + _3561;
    int _3565 = ~_3509;
    int _3567 = _3565 + 1;
    int _3569 = _3567 + 1;
    float _3571 = -_3545;
    float _3573 = _3571 + 1.0;
    int _3575 = _3569;
    if (!_3513)
    {
        int _3577 = ~_3509;
        int _3579 = _3577 + 1;
        _3575 = _3579;
    }
    int _3581 = _3575;
    float _3583 = -_3559;
    float _3585 = _3583 + 1.0;
    bool _3587 = _1836 >= (*spvDescriptorSet0.vp_c9)._m0[188].w;
    bool _3589 = isnan(_1836);
    bool _3591 = _3587 || _3589;
    bool _3593 = isnan((*spvDescriptorSet0.vp_c9)._m0[188].w);
    bool _3595 = _3591 || _3593;
    float _3597 = float(_3595);
    float _3599 = _3563 * _3511;
    bool _3601 = _1836 >= (*spvDescriptorSet0.vp_c9)._m0[187].w;
    bool _3603 = isnan(_1836);
    bool _3605 = _3601 || _3603;
    bool _3607 = isnan((*spvDescriptorSet0.vp_c9)._m0[187].w);
    bool _3609 = _3605 || _3607;
    float _3611 = float(_3609);
    float _3613 = _3545 * _3585;
    float _3615 = fma(_3405, (*spvDescriptorSet0.vp_c10)._m0[5].z, _3465);
    float _3617 = _3597 * _3573;
    float _3619 = -_3597;
    float _3621 = _3619 + 1.0;
    float _3623 = fma(_3405, (*spvDescriptorSet0.vp_c10)._m0[4].z, _3463);
    float _3625 = fma(_3405, (*spvDescriptorSet0.vp_c10)._m0[6].z, _3471);
    bool _3627 = !_3451;
    int _3629 = _3627 ? 0 : 1;
    float _3631 = -(*spvDescriptorSet0.vp_c9)._m0[183].w;
    float _3633 = _1836 + _3631;
    bool _3635 = _1836 >= (*spvDescriptorSet0.vp_c9)._m0[186].w;
    bool _3637 = isnan(_1836);
    bool _3639 = _3635 || _3637;
    bool _3641 = isnan((*spvDescriptorSet0.vp_c9)._m0[186].w);
    bool _3643 = _3639 || _3641;
    float _3645 = float(_3643);
    float _3647 = -_3611;
    float _3649 = _3647 + 1.0;
    bool _3651 = _3531 > 0.0;
    float _3653 = fma(_3523, _3633, (*spvDescriptorSet0.vp_c9)._m0[183].x);
    bool _3655 = _3531 >= 0.0;
    bool _3657 = isnan(_3531);
    bool _3659 = _3655 || _3657;
    bool _3661 = isnan(0.0);
    bool _3663 = _3659 || _3661;
    float _3665 = _3611 * _3621;
    float _3667 = -(*spvDescriptorSet0.vp_c9)._m0[184].w;
    float _3669 = _1836 + _3667;
    bool _3671 = _1836 >= (*spvDescriptorSet0.vp_c9)._m0[185].w;
    bool _3673 = isnan(_1836);
    bool _3675 = _3671 || _3673;
    bool _3677 = isnan((*spvDescriptorSet0.vp_c9)._m0[185].w);
    bool _3679 = _3675 || _3677;
    float _3681 = float(_3679);
    float _3683 = -_3645;
    float _3685 = _3683 + 1.0;
    bool _3687 = _1836 >= (*spvDescriptorSet0.vp_c9)._m0[184].w;
    bool _3689 = isnan(_1836);
    bool _3691 = _3687 || _3689;
    bool _3693 = isnan((*spvDescriptorSet0.vp_c9)._m0[184].w);
    bool _3695 = _3691 || _3693;
    float _3697 = float(_3695);
    float _3699 = fma(_3489, _3669, (*spvDescriptorSet0.vp_c9)._m0[184].x);
    float _3701 = _3645 * _3649;
    float _3703 = -_3681;
    float _3705 = _3703 + 1.0;
    float _3707 = -(*spvDescriptorSet0.vp_c9)._m0[185].w;
    float _3709 = _1836 + _3707;
    float _3711 = _3681 * _3685;
    bool _3713 = _1836 >= (*spvDescriptorSet0.vp_c9)._m0[183].w;
    bool _3715 = isnan(_1836);
    bool _3717 = _3713 || _3715;
    bool _3719 = isnan((*spvDescriptorSet0.vp_c9)._m0[183].w);
    bool _3721 = _3717 || _3719;
    float _3723 = float(_3721);
    float _3725 = -_3697;
    float _3727 = _3725 + 1.0;
    float _3729 = _3697 * _3705;
    float _3731 = fma(_3505, _3709, (*spvDescriptorSet0.vp_c9)._m0[185].x);
    float _3733 = -(*spvDescriptorSet0.vp_c9)._m0[187].w;
    float _3735 = _1836 + _3733;
    float _3737 = -(*spvDescriptorSet0.vp_c9)._m0[186].w;
    float _3739 = _1836 + _3737;
    float _3741 = -(*spvDescriptorSet0.vp_c9)._m0[188].w;
    float _3743 = _1836 + _3741;
    float _3745 = _3723 * _3727;
    float _3747 = fma(_3529, _3735, (*spvDescriptorSet0.vp_c9)._m0[187].x);
    float _3749 = fma(_3547, _3739, (*spvDescriptorSet0.vp_c9)._m0[186].x);
    float _3751 = fma(_3533, _3743, (*spvDescriptorSet0.vp_c9)._m0[188].x);
    int _3753 = _3663 ? 0 : 1;
    float _3755 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[100].z;
    float _3757 = _3653 * _3745;
    bool _3759 = _2129 != 1;
    float _3761 = -(*spvDescriptorSet0.vp_c9)._m0[189].w;
    float _3763 = _1836 + _3761;
    float _3765 = float(uint(_2415));
    float _3767 = -_3723;
    float _3769 = _3767 + 1.0;
    float _3771 = float(uint(_2737));
    float _3773 = fma(_3599, _3763, (*spvDescriptorSet0.vp_c9)._m0[189].x);
    float _3775 = float(uint(_2933));
    float _3777 = as_type<float>(_1942) * _3765;
    float _3779 = fma(_3769, (*spvDescriptorSet0.vp_c9)._m0[183].x, _3757);
    float _3781 = as_type<float>(_2279) * _3771;
    int _3783 = ~_3753;
    int _3785 = _3783 + 1;
    int _3787 = _3785 + 1;
    float _3789 = trunc(_3777);
    float _3791 = precise::max(_3789, 0.0);
    uint _3793 = uint(_3791);
    float _3795 = as_type<float>(_2365) * _3775;
    int _3797 = _3787;
    float _3799 = _3771;
    float _3801 = _3769;
    float _3803 = _3779;
    if (!_3651)
    {
        int _3805 = ~_3753;
        int _3807 = _3805 + 1;
        _3797 = _3807;
    }
    int _3809 = _3797;
    float _3811 = _3755 * (*spvDescriptorSet0.vp_c9)._m0[100].x;
    float _3813 = fma(_3699, _3729, _3779);
    float _3815 = float(uint(_2975));
    float _3817 = _3615 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _3819 = fma(_3811, _2267, -0.5);
    float _3821 = trunc(_3781);
    float _3823 = precise::max(_3821, 0.0);
    uint _3825 = uint(_3823);
    int _3827 = ~_1854;
    int _3829 = _3827 + 1;
    float _3831 = as_type<float>(_2383) * _3815;
    int _3833 = ~_1989;
    int _3835 = _3833 + 1;
    float _3837 = fma(_3731, _3711, _3813);
    int _3839 = ~_2011;
    int _3841 = _3839 + 1;
    float _3843 = _3623 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    bool _3845 = _2131 != 2;
    float _3847 = trunc(_3795);
    float _3849 = precise::max(_3847, 0.0);
    uint _3851 = uint(_3849);
    float _3853 = _3625 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _3855 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    bool _3857 = !_3759;
    float _3859 = _3857 ? as_type<float>(_2133) : as_type<float>(_2135);
    int _3861 = _3835 * int(_3825);
    int _3863 = _3861 + _2737;
    float _3865 = trunc(_3831);
    float _3867 = precise::max(_3865, 0.0);
    uint _3869 = uint(_3867);
    int _3871 = _3829 * int(_3793);
    int _3873 = _3871 + _2415;
    float _3875 = _2121 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    float _3877 = (*spvDescriptorSet0.vp_c9)._m0[93].z + (*spvDescriptorSet0.vp_c9)._m0[93].x;
    float _3879 = float(uint(_3863));
    float _3881 = (*spvDescriptorSet0.vp_c9)._m0[93].w + (*spvDescriptorSet0.vp_c9)._m0[93].y;
    float _3883 = float(uint(_3873));
    int _3885 = _3841 * int(_3851);
    int _3887 = _3885 + _2933;
    float _3889 = -_3855;
    float _3891 = fma(_3875, 2.0, _3889);
    float _3893 = as_type<float>(_2279) * _3879;
    int _3895 = ~_2021;
    int _3897 = _3895 + 1;
    float _3899 = as_type<float>(_1942) * _3883;
    float _3901 = float(uint(_3887));
    float _3903 = fma(as_type<float>(_2135), (*spvDescriptorSet0.vp_c9)._m0[93].z, _3877);
    float _3905 = as_type<float>(_2135) * (*spvDescriptorSet0.vp_c9)._m0[92].x;
    bool _3907 = !_3759;
    float _3909 = _3907 ? as_type<float>(_2137) : as_type<float>(_2133);
    int _3911 = _3897 * int(_3869);
    int _3913 = _3911 + _2975;
    float _3915 = as_type<float>(_2365) * _3901;
    float _3917 = trunc(_3899);
    float _3919 = precise::max(_3917, 0.0);
    uint _3921 = uint(_3919);
    float _3923 = fma(as_type<float>(_2133), (*spvDescriptorSet0.vp_c9)._m0[93].w, _3881);
    float _3925 = as_type<float>(_2133) * (*spvDescriptorSet0.vp_c9)._m0[92].y;
    float _3927 = float(uint(_3913));
    float _3929 = fma(_160, (*spvDescriptorSet0.vp_c9)._m0[92].z, _3903);
    float _3931 = fma(_160, (*spvDescriptorSet0.vp_c9)._m0[92].w, _3923);
    float _3933 = trunc(_3893);
    float _3935 = precise::max(_3933, 0.0);
    uint _3937 = uint(_3935);
    float _3939 = as_type<float>(_2383) * _3927;
    float _3941 = (*spvDescriptorSet0.vp_c9)._m0[92].x + (*spvDescriptorSet0.vp_c9)._m0[91].z;
    float _3943 = _3755;
    float _3945 = _3905;
    if (!_3759)
    {
        _3943 = _2127;
    }
    float _3947 = _3943;
    float _3949 = (*spvDescriptorSet0.vp_c9)._m0[92].y + (*spvDescriptorSet0.vp_c9)._m0[91].w;
    float _3951 = _3947;
    if (_3759)
    {
        _3951 = _1846;
    }
    float _3953 = _3951;
    float _3955 = -_3941;
    float _3957 = fma(_3905, 2.0, _3955);
    if (_3845)
    {
        _3945 = _2121;
    }
    float _3959 = _3945;
    float _3961 = trunc(_3915);
    float _3963 = precise::max(_3961, 0.0);
    uint _3965 = uint(_3963);
    float _3967 = fma(_3749, _3701, _3837);
    int _3969 = ~_1854;
    int _3971 = _3969 + 1;
    float _3973 = fma(_3925, -2.0, _3949);
    int _3975 = int(_3793) + int(_3921);
    float _3977 = fma(_3747, _3665, _3967);
    float _3979 = -_160;
    float _3981 = fma(_3979, (*spvDescriptorSet0.vp_c9)._m0[76].x, _3891);
    int _3983 = int(_3825) + int(_3937);
    float _3985 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[100].w;
    int _3987 = ~_1989;
    int _3989 = _3987 + 1;
    int _3991 = _3971 * _3975;
    int _3993 = _3991 + _2415;
    float _3995 = as_type<float>(_3971);
    float _3997 = _3959;
    if (_3845)
    {
        _3995 = _1846;
    }
    float _3999 = _3995;
    float _4001 = fma(_3751, _3617, _3977);
    float _4003 = _3999;
    if (!_3845)
    {
        _3997 = _2127;
    }
    float _4005 = _3997;
    int _4007 = _3989 * _3983;
    int _4009 = _4007 + _2737;
    if (!_3845)
    {
        _4003 = _2121;
    }
    float _4011 = _4003;
    float _4013 = trunc(_3939);
    float _4015 = precise::max(_4013, 0.0);
    uint _4017 = uint(_4015);
    bool _4019 = uint(_3993) >= uint(_1854);
    float _4021 = _1846 + _2121;
    int _4023 = int(_3851) + int(_3965);
    float _4025 = _4005 * (*spvDescriptorSet0.vp_c9)._m0[87].x;
    int _4027 = ~_2011;
    int _4029 = _4027 + 1;
    float _4031 = _4021 + (-1.0);
    bool _4033 = !_4019;
    int _4035 = _4033 ? 0 : (-1);
    float _4037 = _4011 * (*spvDescriptorSet0.vp_c9)._m0[87].y;
    bool _4039 = uint(_4009) >= uint(_1989);
    int _4041 = _4029 * _4023;
    int _4043 = _4041 + _2933;
    float _4045 = fma(_3773, _3613, _4001);
    if (!_3759)
    {
        _3799 = _1846;
    }
    float _4047 = _3799;
    float _4049 = -_160;
    float _4051 = fma(_4049, (*spvDescriptorSet0.vp_c9)._m0[91].x, _3957);
    float _4053 = _4047;
    if (!_3759)
    {
        _3801 = _1846;
    }
    float _4055 = _3801;
    float _4057 = (*spvDescriptorSet0.vp_c9)._m0[82].y + (*spvDescriptorSet0.vp_c9)._m0[81].w;
    int _4059 = int(_3869) + int(_4017);
    float _4061 = fma(_160, (*spvDescriptorSet0.vp_c9)._m0[91].y, _3973);
    int _4063 = ~_2021;
    int _4065 = _4063 + 1;
    float _4067 = fma(_3559, (*spvDescriptorSet0.vp_c9)._m0[190].x, _4045);
    bool _4069 = !_4039;
    int _4071 = _4069 ? 0 : (-1);
    bool _4073 = uint(_4043) >= uint(_2011);
    float _4075 = _2127 * 2.0;
    int _4077 = ~_3983;
    int _4079 = _4077 + _4071;
    int _4081 = _4079 + 1;
    float _4083 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _4085 = _3843 + _4083;
    bool _4087 = !_4073;
    int _4089 = _4087 ? 0 : (-1);
    int _4091 = _4065 * _4059;
    int _4093 = _4091 + _2975;
    float _4095 = _4055;
    if (!_3759)
    {
        _3803 = _2127;
    }
    float _4097 = _3803;
    float _4099 = floor(_4075);
    int _4101 = _1989 * _4081;
    int _4103 = _4101 + _2737;
    int _4105 = ~_4023;
    int _4107 = _4105 + _4089;
    int _4109 = _4107 + 1;
    out.m_71.x = _4067;
    bool _4111 = uint(_4093) >= uint(_2021);
    float _4113 = _4097;
    if (_3759)
    {
        _4053 = _2121;
    }
    float _4115 = _4053;
    bool _4117 = !_4111;
    int _4119 = _4117 ? 0 : (-1);
    if (_3759)
    {
        _4095 = _2121;
    }
    float _4121 = _4095;
    int _4123 = ~_4059;
    int _4125 = _4123 + _4119;
    int _4127 = _4125 + 1;
    int _4129 = _2011 * _4109;
    int _4131 = _4129 + _2933;
    float _4133 = _3953 * (*spvDescriptorSet0.vp_c9)._m0[82].y;
    int _4135 = _3033 >> 31;
    float _4137 = trunc((*spvDescriptorSet0.vp_c9)._m0[80].z);
    int _4139 = int(_4137);
    if (_3759)
    {
        _4113 = _1846;
    }
    float _4141 = _4113;
    float _4143 = fma(_4133, -2.0, _4057);
    int _4145 = _4135 & 3;
    int _4147 = _2021 * _4127;
    int _4149 = _4147 + _2975;
    bool _4151 = _4099 > 0.0;
    float _4153 = fma(_160, (*spvDescriptorSet0.vp_c9)._m0[81].y, _4143);
    bool _4155 = _4099 >= 0.0;
    bool _4157 = isnan(_4099);
    bool _4159 = _4155 || _4157;
    bool _4161 = isnan(0.0);
    bool _4163 = _4159 || _4161;
    float _4165 = _3985 * (*spvDescriptorSet0.vp_c9)._m0[100].y;
    int _4167 = _3033 + _4145;
    float _4169 = fma(_4165, _3485, -0.5);
    int _4171 = ~_3975;
    int _4173 = _4171 + _4035;
    int _4175 = _4173 + 1;
    float _4177 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _4179 = _3817 + _4177;
    int _4181 = _4167 >> 2;
    float _4183 = fma(_4031, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    int _4185 = _3191 >> 31;
    float _4187 = _4115 * (*spvDescriptorSet0.vp_c9)._m0[82].x;
    float _4189 = _4179 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    int _4191 = _1854 * _4175;
    int _4193 = _4191 + _2415;
    int _4195 = _4185 & 3;
    float _4197 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _4199 = _3853 + _4197;
    float _4201 = fma(_4085, (*spvDescriptorSet0.vp_c8)._m0[28].x, _4189);
    int _4203 = _3313 >> 31;
    float _4205 = (*spvDescriptorSet0.vp_c9)._m0[87].x + (*spvDescriptorSet0.vp_c9)._m0[86].z;
    int _4207 = _3191 + _4195;
    float _4209 = fma(_4199, (*spvDescriptorSet0.vp_c8)._m0[28].z, _4201);
    int _4211 = _4203 & 3;
    float _4213 = -_4205;
    float _4215 = fma(_4025, 2.0, _4213);
    bool _4217 = !_2861;
    int _4219 = _4217 ? _4149 : (-1);
    float _4221 = -_160;
    float _4223 = fma(_4221, (*spvDescriptorSet0.vp_c9)._m0[86].x, _4215);
    int _4225 = _3241 >> 31;
    float _4227 = (*spvDescriptorSet0.vp_c9)._m0[83].z + (*spvDescriptorSet0.vp_c9)._m0[83].x;
    int _4229 = _4207 >> 2;
    bool _4231 = !_3013;
    int _4233 = _4231 ? _4193 : (-1);
    float _4235 = fma(_4121, (*spvDescriptorSet0.vp_c9)._m0[83].z, _4227);
    int _4237 = _3313 + _4211;
    bool _4239 = _4209 >= 0.0;
    float _4241 = fma(_160, (*spvDescriptorSet0.vp_c9)._m0[82].z, _4235);
    bool _4243 = _3199 != 3;
    int _4245 = _4225 & 3;
    int _4247 = _4229 << 4;
    int _4249 = _4247 + 512;
    float _4251 = (*spvDescriptorSet0.vp_c9)._m0[98].w + (*spvDescriptorSet0.vp_c9)._m0[98].y;
    bool _4253 = !_2783;
    int _4255 = _4253 ? _4131 : (-1);
    int _4257 = _4181 << 4;
    int _4259 = _4257 + 368;
    float _4261 = fma(_3909, (*spvDescriptorSet0.vp_c9)._m0[98].w, _4251);
    bool _4263 = _3045 != 3;
    float _4265 = _3909 * (*spvDescriptorSet0.vp_c9)._m0[97].y;
    int _4267 = _4237 >> 2;
    uint _4269 = uint(int(uint(_4259) >> uint(2)));
    uint _4271 = uint(int(uint(int(_4269)) >> uint(2)));
    int _4273 = int(_4269) & 3;
    float _4275 = (*spvDescriptorSet0.vp_c9)._m0[int(_4271)][_4273];
    int _4277 = int(_4269) + 1;
    uint _4279 = uint(int(uint(_4277) >> uint(2)));
    int _4281 = _4277 & 3;
    float _4283 = (*spvDescriptorSet0.vp_c9)._m0[int(_4279)][_4281];
    float _4285 = fma(_160, (*spvDescriptorSet0.vp_c9)._m0[97].w, _4261);
    int _4287 = _3241 + _4245;
    float _4289 = as_type<float>(_4225);
    if (_4239)
    {
        out.m_49.x = 0.0;
    }
    bool _4291 = !_2715;
    int _4293 = _4291 ? _4103 : (-1);
    float _4295 = (*spvDescriptorSet0.vp_c9)._m0[82].x + (*spvDescriptorSet0.vp_c9)._m0[81].z;
    uint _4297 = uint(int(uint(_4249) >> uint(2)));
    uint _4299 = uint(int(uint(int(_4297)) >> uint(2)));
    int _4301 = int(_4297) & 3;
    float _4303 = (*spvDescriptorSet0.vp_c9)._m0[int(_4299)][_4301];
    int _4305 = int(_4297) + 1;
    uint _4307 = uint(int(uint(_4305) >> uint(2)));
    int _4309 = _4305 & 3;
    float _4311 = (*spvDescriptorSet0.vp_c9)._m0[int(_4307)][_4309];
    float _4313 = -_4295;
    float _4315 = fma(_4187, 2.0, _4313);
    float _4317 = (*spvDescriptorSet0.vp_c9)._m0[83].w + (*spvDescriptorSet0.vp_c9)._m0[83].y;
    int _4319 = _4287 >> 2;
    float _4321 = (*spvDescriptorSet0.vp_c9)._m0[97].y + (*spvDescriptorSet0.vp_c9)._m0[96].w;
    bool _4323 = !_3047;
    int _4325 = _4323 ? 0 : 1;
    float _4327 = (*spvDescriptorSet0.vp_c9)._m0[98].z + (*spvDescriptorSet0.vp_c9)._m0[98].x;
    float _4329 = fma(_4141, (*spvDescriptorSet0.vp_c9)._m0[83].w, _4317);
    int _4331 = _3241 & 3;
    bool _4333 = _4331 != 0;
    float _4335 = fma(_4265, -2.0, _4321);
    int _4337 = _4319 << 4;
    int _4339 = _4337 + 656;
    float _4341 = fma(_3859, (*spvDescriptorSet0.vp_c9)._m0[98].z, _4327);
    int _4343 = _4267 << 4;
    int _4345 = _4343 + 800;
    float _4347 = (*spvDescriptorSet0.vp_c9)._m0[97].x + (*spvDescriptorSet0.vp_c9)._m0[96].z;
    float _4349 = _3859 * (*spvDescriptorSet0.vp_c9)._m0[97].x;
    int _4351 = _3191 & 3;
    bool _4353 = _4351 != 0;
    float _4355 = fma(_160, (*spvDescriptorSet0.vp_c9)._m0[97].z, _4341);
    bool _4357 = !_4333;
    int _4359 = _4357 ? 0 : 1;
    uint _4361 = uint(int(uint(_4339) >> uint(2)));
    uint _4363 = uint(int(uint(int(_4361)) >> uint(2)));
    int _4365 = int(_4361) & 3;
    float _4367 = (*spvDescriptorSet0.vp_c9)._m0[int(_4363)][_4365];
    int _4369 = int(_4361) + 1;
    uint _4371 = uint(int(uint(_4369) >> uint(2)));
    int _4373 = _4369 & 3;
    float _4375 = (*spvDescriptorSet0.vp_c9)._m0[int(_4371)][_4373];
    int _4377 = _3313 & 3;
    bool _4379 = _4377 != 0;
    float _4381 = (*spvDescriptorSet0.vp_c9)._m0[87].y + (*spvDescriptorSet0.vp_c9)._m0[86].w;
    if (_4239)
    {
        _4289 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _4383 = _4289;
    float _4385 = fma(_160, (*spvDescriptorSet0.vp_c9)._m0[96].y, _4335);
    float _4387 = -_4347;
    float _4389 = fma(_4349, 2.0, _4387);
    int _4391 = abs(_3101);
    float _4393 = fma(_4037, -2.0, _4381);
    uint _4395 = uint(int(uint(_4345) >> uint(2)));
    uint _4397 = uint(int(uint(int(_4395)) >> uint(2)));
    int _4399 = int(_4395) & 3;
    float _4401 = (*spvDescriptorSet0.vp_c9)._m0[int(_4397)][_4399];
    int _4403 = int(_4395) + 1;
    uint _4405 = uint(int(uint(_4403) >> uint(2)));
    int _4407 = _4403 & 3;
    float _4409 = (*spvDescriptorSet0.vp_c9)._m0[int(_4405)][_4407];
    float _4411 = -_160;
    float _4413 = fma(_4411, (*spvDescriptorSet0.vp_c9)._m0[96].x, _4389);
    int _4415 = as_type<int>(_4383);
    if (_4239)
    {
        float _4417 = _4383 * 5.0;
        _4415 = as_type<int>(_4417);
    }
    int _4419 = _4415;
    int _4421 = abs(_3269);
    float _4423 = fma(_160, (*spvDescriptorSet0.vp_c9)._m0[82].w, _4329);
    float _4425 = fma(_4355, _3819, _4413);
    int _4427 = abs(_3375);
    int _4429 = _4259 + 8;
    uint _4431 = uint(int(uint(_4429) >> uint(2)));
    uint _4433 = uint(int(uint(int(_4431)) >> uint(2)));
    int _4435 = int(_4431) & 3;
    float _4437 = (*spvDescriptorSet0.vp_c9)._m0[int(_4433)][_4435];
    int _4439 = int(_4431) + 1;
    uint _4441 = uint(int(uint(_4439) >> uint(2)));
    int _4443 = _4439 & 3;
    float _4445 = (*spvDescriptorSet0.vp_c9)._m0[int(_4441)][_4443];
    if (_4239)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _13829 = as_type<float>(_4419);
        out.gl_Position.z = _13829;
    }
    float _4447 = -_160;
    float _4449 = fma(_4447, (*spvDescriptorSet0.vp_c9)._m0[81].x, _4315);
    bool _4451 = !_4353;
    int _4453 = _4451 ? 0 : 1;
    float _4455 = fma(_160, (*spvDescriptorSet0.vp_c9)._m0[86].y, _4393);
    int _4457 = abs(_4325);
    float _4459 = -_4385;
    float _4461 = fma(_4285, _4169, _4459);
    int _4463 = _4249 + 8;
    uint _4465 = uint(int(uint(_4463) >> uint(2)));
    uint _4467 = uint(int(uint(int(_4465)) >> uint(2)));
    int _4469 = int(_4465) & 3;
    float _4471 = (*spvDescriptorSet0.vp_c9)._m0[int(_4467)][_4469];
    int _4473 = int(_4465) + 1;
    uint _4475 = uint(int(uint(_4473) >> uint(2)));
    int _4477 = _4473 & 3;
    float _4479 = (*spvDescriptorSet0.vp_c9)._m0[int(_4475)][_4477];
    int _4481 = abs(_3333);
    int _4483 = abs(_4453);
    int _4485 = ~_4421;
    int _4487 = _4485 + 1;
    int _4489 = _4487 + 1;
    int _4491 = _4339 + 8;
    uint _4493 = uint(int(uint(_4491) >> uint(2)));
    uint _4495 = uint(int(uint(int(_4493)) >> uint(2)));
    int _4497 = int(_4493) & 3;
    float _4499 = (*spvDescriptorSet0.vp_c9)._m0[int(_4495)][_4497];
    int _4501 = int(_4493) + 1;
    uint _4503 = uint(int(uint(_4501) >> uint(2)));
    int _4505 = _4501 & 3;
    float _4507 = (*spvDescriptorSet0.vp_c9)._m0[int(_4503)][_4505];
    int _4509 = ~_4391;
    int _4511 = _4509 + 1;
    int _4513 = _4511 + 1;
    int _4515 = _4489 * as_type<int>(_4311);
    bool _4517 = !_4379;
    int _4519 = _4517 ? 0 : 1;
    int _4521 = _4345 + 8;
    uint _4523 = uint(int(uint(_4521) >> uint(2)));
    uint _4525 = uint(int(uint(int(_4523)) >> uint(2)));
    int _4527 = int(_4523) & 3;
    float _4529 = (*spvDescriptorSet0.vp_c9)._m0[int(_4525)][_4527];
    int _4531 = int(_4523) + 1;
    uint _4533 = uint(int(uint(_4531) >> uint(2)));
    int _4535 = _4531 & 3;
    float _4537 = (*spvDescriptorSet0.vp_c9)._m0[int(_4533)][_4535];
    int _4539 = ~_4457;
    int _4541 = _4539 + 1;
    int _4543 = _4541 + 1;
    int _4545 = _4513 * as_type<int>(_4283);
    int _4547 = ~_4483;
    int _4549 = _4547 + 1;
    int _4551 = _4549 + 1;
    float _4553 = trunc((*spvDescriptorSet0.vp_c9)._m0[90].z);
    int _4555 = int(_4553);
    bool _4557 = _3271 != 3;
    int _4559 = _4543 * as_type<int>(_4275);
    int _4561 = _4559 + _4545;
    bool _4563 = !_4263;
    int _4565 = _4563 ? 0 : (-1);
    int _4567 = _4551 * as_type<int>(_4303);
    int _4569 = _4567 + _4515;
    bool _4571 = _3325 != 3;
    int _4573 = abs(_4519);
    bool _4575 = !_4243;
    int _4577 = _4575 ? 0 : (-1);
    bool _4579 = !_4557;
    int _4581 = _4579 ? 0 : (-1);
    int _4583 = ~_4481;
    int _4585 = _4583 + 1;
    int _4587 = _4585 + 1;
    int _4589 = abs(_3165);
    int _4591 = abs(_3253);
    int _4593 = _4587 * as_type<int>(_4375);
    int _4595 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _4597 = _4595 != 0;
    int _4599 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _4601 = _4599 != 0;
    int _4603 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _4605 = _4603 != 0;
    int _4607 = ~_4427;
    int _4609 = _4607 + 1;
    int _4611 = _4609 + 1;
    float _4613 = trunc((*spvDescriptorSet0.vp_c9)._m0[85].z);
    int _4615 = int(_4613);
    int _4617 = ~_4589;
    int _4619 = _4617 + 1;
    int _4621 = _4619 + 1;
    int _4623 = _4611 * as_type<int>(_4409);
    int _4625 = ~_4573;
    int _4627 = _4625 + 1;
    int _4629 = _4627 + 1;
    int _4631 = ~_4591;
    int _4633 = _4631 + 1;
    int _4635 = _4633 + 1;
    int _4637 = _4621 * as_type<int>(_4437);
    int _4639 = _4637 + _4561;
    int _4641 = abs(_4359);
    int _4643 = _4629 * as_type<int>(_4401);
    int _4645 = _4643 + _4623;
    int _4647 = abs(_3323);
    int _4649 = _4635 * as_type<int>(_4471);
    int _4651 = _4649 + _4569;
    int _4653 = ~_4641;
    int _4655 = _4653 + 1;
    int _4657 = _4655 + 1;
    float _4659 = trunc((*spvDescriptorSet0.vp_c9)._m0[95].z);
    int _4661 = int(_4659);
    int _4663 = abs(_3393);
    int _4665 = abs(_4577);
    int _4667 = _4657 * as_type<int>(_4367);
    int _4669 = _4667 + _4593;
    float _4671 = float(uint(_4139));
    int _4673 = ~_4647;
    int _4675 = _4673 + 1;
    int _4677 = _4675 + 1;
    float _4679 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _4681 = log2(_4679);
    int _4683 = ~_4663;
    int _4685 = _4683 + 1;
    int _4687 = _4685 + 1;
    int _4689 = ~_4665;
    int _4691 = _4689 + 1;
    int _4693 = _4691 + 1;
    int _4695 = _4677 * as_type<int>(_4499);
    int _4697 = _4695 + _4669;
    int _4699 = abs(_4565);
    int _4701 = _4687 * as_type<int>(_4529);
    int _4703 = _4701 + _4645;
    float _4705 = float(uint(_4615));
    float _4707 = 1.0 / _4671;
    int _4709 = _4693 * as_type<int>(_4479);
    int _4711 = _4709 + _4651;
    int _4713 = ~_4699;
    int _4715 = _4713 + 1;
    int _4717 = _4715 + 1;
    float _4719 = float(uint(_4555));
    int _4721 = abs(_4581);
    int _4723 = _4717 * as_type<int>(_4445);
    int _4725 = _4723 + _4639;
    int _4727 = abs(_3181);
    float _4729 = 1.0 / _4705;
    int _4731 = abs(_3417);
    float _4733 = _4681 * _160;
    int _4735 = ~_4721;
    int _4737 = _4735 + 1;
    int _4739 = _4737 + 1;
    int _4741 = ~_4727;
    int _4743 = _4741 + 1;
    int _4745 = _4743 + 1;
    bool _4747 = !_4571;
    int _4749 = _4747 ? 0 : (-1);
    float _4751 = 1.0 / _4719;
    int _4753 = abs(_3399);
    int _4755 = _4739 * as_type<int>(_4507);
    int _4757 = _4755 + _4697;
    int _4759 = abs(_4749);
    int _4761 = _4725 * _4745;
    int _4763 = ~_4753;
    int _4765 = _4763 + 1;
    int _4767 = _4765 + 1;
    int _4769 = as_type<int>(_4707) + (-2);
    int _4771 = _4233 * _4727;
    int _4773 = _4771 + _4761;
    int _4775 = ~_4731;
    int _4777 = _4775 + 1;
    int _4779 = _4777 + 1;
    int _4781 = _4767 * _4757;
    float _4783 = exp2(_4733);
    float _4785 = float(uint(_4773));
    int _4787 = _4779 * _4711;
    int _4789 = ~_4759;
    int _4791 = _4789 + 1;
    int _4793 = _4791 + 1;
    int _4795 = _4255 * _4753;
    int _4797 = _4795 + _4781;
    int _4799 = as_type<int>(_4729) + (-2);
    int _4801 = _4293 * _4731;
    int _4803 = _4801 + _4787;
    int _4805 = abs(_3629);
    int _4807 = _4793 * as_type<int>(_4537);
    int _4809 = _4807 + _4703;
    float _4811 = as_type<float>(_4769) * _4785;
    int _4813 = as_type<int>(_4751) + (-2);
    float _4815 = float(uint(_4803));
    float _4817 = float(uint(_4797));
    float _4819 = trunc(_4811);
    float _4821 = precise::max(_4819, 0.0);
    uint _4823 = uint(_4821);
    int _4825 = ~_4805;
    int _4827 = _4825 + 1;
    int _4829 = _4827 + 1;
    float _4831 = as_type<float>(_4799) * _4815;
    float _4833 = float(uint(_4661));
    float _4835 = as_type<float>(_4813) * _4817;
    int _4837 = _4163 ? 0 : 1;
    int _4839 = _4829 * _4809;
    int _4841 = abs(_4139);
    float _4843 = trunc(_4831);
    float _4845 = precise::max(_4843, 0.0);
    uint _4847 = uint(_4845);
    int _4849 = ~_4837;
    int _4851 = _4849 + 1;
    int _4853 = _4851 + 1;
    int _4855 = _4219 * _4805;
    int _4857 = _4855 + _4839;
    int _4859 = _4853;
    float _4861 = _4449;
    if (!_4151)
    {
        int _4863 = ~_4837;
        int _4865 = _4863 + 1;
        _4859 = _4865;
    }
    int _4867 = _4859;
    float _4869 = -_4783;
    float _4871 = _4869 + 1.0;
    int _4873 = ~_4139;
    int _4875 = _4873 + 1;
    int _4877 = ~_4615;
    int _4879 = _4877 + 1;
    float _4881 = trunc(_4835);
    float _4883 = precise::max(_4881, 0.0);
    uint _4885 = uint(_4883);
    int _4887 = abs(_4615);
    int _4889 = _4875 * int(_4823);
    int _4891 = _4889 + _4773;
    float _4893 = float(uint(_4841));
    int _4895 = ~_4555;
    int _4897 = _4895 + 1;
    float _4899 = float(uint(_4887));
    float _4901 = 1.0 / _4833;
    int _4903 = _4879 * int(_4847);
    int _4905 = _4903 + _4803;
    int _4907 = abs(_4555);
    float _4909 = float(uint(_4891));
    float _4911 = float(uint(_4905));
    float _4913 = 1.0 / _4893;
    int _4915 = _4897 * int(_4885);
    int _4917 = _4915 + _4797;
    float _4919 = float(uint(_4907));
    float _4921 = as_type<float>(_4769) * _4909;
    int _4923 = abs(_4661);
    float _4925 = as_type<float>(_4799) * _4911;
    float _4927 = float(uint(_4917));
    float _4929 = 1.0 / _4899;
    int _4931 = as_type<int>(_4901) + (-2);
    float _4933 = as_type<float>(_4813) * _4927;
    float _4935 = float(uint(_4857));
    float _4937 = float(uint(_4923));
    float _4939 = 1.0 / _4919;
    int _4941 = abs(_4773);
    float _4943 = as_type<float>(_4931) * _4935;
    int _4945 = abs(_4803);
    int _4947 = as_type<int>(_4913) + (-2);
    float _4949 = float(uint(_4941));
    float _4951 = 1.0 / _4937;
    int _4953 = as_type<int>(_4929) + (-2);
    float _4955 = as_type<float>(_4947) * _4949;
    float _4957 = float(uint(_4945));
    bool _4959 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _4961 = isnan(1.0);
    bool _4963 = _4959 || _4961;
    bool _4965 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _4967 = _4963 || _4965;
    float _4969 = trunc(_4943);
    float _4971 = precise::max(_4969, 0.0);
    uint _4973 = uint(_4971);
    float _4975 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _4977 = 1.0 + _4975;
    int _4979 = abs(_4797);
    float _4981 = as_type<float>(_4953) * _4957;
    float _4983 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    int _4985 = as_type<int>(_4939) + (-2);
    float _4987 = trunc(_4955);
    float _4989 = precise::max(_4987, 0.0);
    uint _4991 = uint(_4989);
    float _4993 = float(uint(_4979));
    float _4995 = (*spvDescriptorSet0.vp_c9)._m0[88].w + (*spvDescriptorSet0.vp_c9)._m0[88].y;
    float _4997 = as_type<float>(_4985) * _4993;
    int _4999 = abs(_4857);
    float _5001 = 1.0 / _4977;
    int _5003 = ~_4661;
    int _5005 = _5003 + 1;
    float _5007 = fma(_1846, (*spvDescriptorSet0.vp_c9)._m0[78].w, _4983);
    float _5009 = fma(_1846, (*spvDescriptorSet0.vp_c9)._m0[88].w, _4995);
    float _5011 = (*spvDescriptorSet0.vp_c9)._m0[88].z + (*spvDescriptorSet0.vp_c9)._m0[88].x;
    int _5013 = as_type<int>(_4951) + (-2);
    float _5015 = fma(_160, (*spvDescriptorSet0.vp_c9)._m0[77].w, _5007);
    float _5017 = float(uint(_4999));
    float _5019 = trunc(_4981);
    float _5021 = precise::max(_5019, 0.0);
    uint _5023 = uint(_5021);
    bool _5025 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _5027 = isnan(0.0);
    bool _5029 = _5025 || _5027;
    bool _5031 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _5033 = _5029 || _5031;
    float _5035 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    float _5037 = fma(_160, (*spvDescriptorSet0.vp_c9)._m0[87].w, _5009);
    int _5039 = _5005 * int(_4973);
    int _5041 = _5039 + _4857;
    int _5043 = ~_4841;
    int _5045 = _5043 + 1;
    float _5047 = fma(_2121, (*spvDescriptorSet0.vp_c9)._m0[88].z, _5011);
    float _5049 = as_type<float>(_5013) * _5017;
    float _5051 = trunc(_4997);
    float _5053 = precise::max(_5051, 0.0);
    uint _5055 = uint(_5053);
    float _5057 = fma(_2121, (*spvDescriptorSet0.vp_c9)._m0[78].z, _5035);
    float _5059 = _5033 ? _4871 : 0.0;
    float _5061 = fma(_160, (*spvDescriptorSet0.vp_c9)._m0[87].z, _5047);
    float _5063 = float(uint(_5041));
    int _5065 = _5045 * int(_4991);
    int _5067 = _5065 + _4941;
    int _5069 = ~_4887;
    int _5071 = _5069 + 1;
    float _5073 = fma(_160, (*spvDescriptorSet0.vp_c9)._m0[77].z, _5057);
    float _5075 = trunc(_4925);
    float _5077 = precise::max(_5075, 0.0);
    uint _5079 = uint(_5077);
    if (_4967)
    {
        float _5081 = _5059 * _5001;
        _162 = _5081;
    }
    float _5083 = _162;
    float _5085 = as_type<float>(_4931) * _5063;
    float _5087 = float(uint(_5067));
    int _5089 = _5071 * int(_5023);
    int _5091 = _5089 + _4945;
    float _5093 = trunc(_4921);
    float _5095 = precise::max(_5093, 0.0);
    uint _5097 = uint(_5095);
    int _5099 = ~_4907;
    int _5101 = _5099 + 1;
    float _5103 = as_type<float>(_4947) * _5087;
    float _5105 = trunc(_5049);
    float _5107 = precise::max(_5105, 0.0);
    uint _5109 = uint(_5107);
    int _5111 = int(_4847) + int(_5079);
    int _5113 = _5101 * int(_5055);
    int _5115 = _5113 + _4979;
    int _5117 = ~_4661;
    int _5119 = _5117 + 1;
    float _5121 = float(uint(_5115));
    float _5123 = trunc(_5085);
    float _5125 = precise::max(_5123, 0.0);
    uint _5127 = uint(_5125);
    int _5129 = int(_4823) + int(_5097);
    int _5131 = ~_4923;
    int _5133 = _5131 + 1;
    float _5135 = as_type<float>(_4985) * _5121;
    float _5137 = trunc(_4933);
    float _5139 = precise::max(_5137, 0.0);
    uint _5141 = uint(_5139);
    float _5143 = trunc(_5135);
    float _5145 = precise::max(_5143, 0.0);
    uint _5147 = uint(_5145);
    float _5149 = float(uint(_5091));
    int _5151 = ~_4139;
    int _5153 = _5151 + 1;
    int _5155 = int(_4973) + int(_5127);
    float _5157 = as_type<float>(_4953) * _5149;
    int _5159 = _5133 * int(_5109);
    int _5161 = _5159 + _4999;
    float _5163 = trunc(_5103);
    float _5165 = precise::max(_5163, 0.0);
    uint _5167 = uint(_5165);
    int _5169 = ~_4615;
    int _5171 = _5169 + 1;
    float _5173 = float(uint(_5161));
    int _5175 = _5153 * _5129;
    int _5177 = _5175 + _4773;
    int _5179 = ~_4555;
    int _5181 = _5179 + 1;
    float _5183 = as_type<float>(_5013) * _5173;
    float _5185 = trunc(_5157);
    float _5187 = precise::max(_5185, 0.0);
    uint _5189 = uint(_5187);
    int _5191 = _5171 * _5111;
    int _5193 = _5191 + _4803;
    int _5195 = int(_4885) + int(_5141);
    int _5197 = _5119 * _5155;
    int _5199 = _5197 + _4857;
    bool _5201 = uint(_5193) >= uint(_4615);
    float _5203 = trunc(_5183);
    float _5205 = precise::max(_5203, 0.0);
    uint _5207 = uint(_5205);
    bool _5209 = uint(_5177) >= uint(_4139);
    int _5211 = _5181 * _5195;
    int _5213 = _5211 + _4797;
    int _5215 = int(_5055) + int(_5147);
    int _5217 = int(_4991) + int(_5167);
    int _5219 = ~_4841;
    int _5221 = _5219 + 1;
    bool _5223 = !_5201;
    int _5225 = _5223 ? 0 : (-1);
    bool _5227 = uint(_5199) >= uint(_4661);
    int _5229 = _5221 * _5217;
    int _5231 = _5229 + _4941;
    int _5233 = ~_4907;
    int _5235 = _5233 + 1;
    bool _5237 = !_5209;
    int _5239 = _5237 ? 0 : (-1);
    bool _5241 = uint(_5213) >= uint(_4555);
    int _5243 = _5235 * _5215;
    int _5245 = _5243 + _4979;
    int _5247 = int(_5023) + int(_5189);
    int _5249 = ~_4887;
    int _5251 = _5249 + 1;
    bool _5253 = !_5241;
    int _5255 = _5253 ? 0 : (-1);
    bool _5257 = uint(_5231) >= uint(_4841);
    int _5259 = _5251 * _5247;
    int _5261 = _5259 + _4945;
    int _5263 = ~_4923;
    int _5265 = _5263 + 1;
    bool _5267 = !_5257;
    int _5269 = _5267 ? 0 : (-1);
    bool _5271 = uint(_5245) >= uint(_4907);
    float _5273 = _4179 * _4179;
    int _5275 = int(_5109) + int(_5207);
    float _5277 = fma(_4085, _4085, _5273);
    bool _5279 = !_5227;
    int _5281 = _5279 ? 0 : (-1);
    bool _5283 = uint(_5261) >= uint(_4887);
    float _5285 = fma(_4199, _4199, _5277);
    int _5287 = _5265 * _5275;
    int _5289 = _5287 + _4999;
    int _5291 = ~_5129;
    int _5293 = _5291 + _5239;
    int _5295 = _5293 + 1;
    float _5297 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    bool _5299 = !_5283;
    int _5301 = _5299 ? 0 : (-1);
    bool _5303 = uint(_5289) >= uint(_4923);
    int _5305 = _4139 * _5295;
    int _5307 = _5305 + _4773;
    int _5309 = ~_5195;
    int _5311 = _5309 + _5255;
    int _5313 = _5311 + 1;
    bool _5315 = !_5271;
    int _5317 = _5315 ? 0 : (-1);
    float _5319 = rsqrt(_5285);
    bool _5321 = _4139 == 0;
    int _5323 = ~_5111;
    int _5325 = _5323 + _5225;
    int _5327 = _5325 + 1;
    int _5329 = ~_5155;
    int _5331 = _5329 + _5281;
    int _5333 = _5331 + 1;
    int _5335 = _4555 * _5313;
    int _5337 = _5335 + _4797;
    bool _5339 = !_5321;
    int _5341 = _5339 ? _5307 : (-1);
    int _5343 = _4615 * _5327;
    int _5345 = _5343 + _4803;
    bool _5347 = _4555 == 0;
    float _5349 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    int _5351 = _4803 ^ _4615;
    float _5353 = _5297 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    bool _5355 = !_5347;
    int _5357 = _5355 ? _5337 : (-1);
    bool _5359 = _4139 == 0;
    float _5361 = _4179 * _5319;
    int _5363 = _4773 ^ _4139;
    float _5365 = _4085 * _5319;
    uint _5367 = uint(int(uint(_5351) >> uint(31)));
    float _5369 = -_5361;
    float _5371 = fma(_5369, (*spvDescriptorSet0.vp_c9)._m0[18].w, _4179);
    int _5373 = ~_5269;
    int _5375 = _5217 + _5373;
    int _5377 = _5375 + 1;
    float _5379 = _4425 + 0.5;
    uint _5381 = uint(int(uint(_5363) >> uint(31)));
    float _5383 = _5371 * _5371;
    int _5385 = ~_5301;
    int _5387 = _5247 + _5385;
    int _5389 = _5387 + 1;
    float _5391 = _4461 + 0.5;
    int _5393 = ~int(_5367);
    int _5395 = _5393 + 1;
    float _5397 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    bool _5399 = !_5303;
    int _5401 = _5399 ? 0 : (-1);
    float _5403 = -_5365;
    float _5405 = fma(_5403, (*spvDescriptorSet0.vp_c9)._m0[18].w, _4085);
    bool _5407 = _4615 == 0;
    out.m_73.x = _5379;
    out.m_73.y = _5391;
    int _5409 = ~int(_5381);
    int _5411 = _5409 + 1;
    float _5413 = fma(_5405, _5405, _5383);
    int _5415 = _5389 ^ _5395;
    float _5417 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].z;
    bool _5419 = !_5407;
    int _5421 = _5419 ? _5345 : (-1);
    int _5423 = _4661 * _5333;
    int _5425 = _5423 + _4857;
    int _5427 = _5377 ^ _5411;
    float _5429 = fma(_5353, _2163, -0.5);
    bool _5431 = _4661 == 0;
    float _5433 = _5349 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    int _5435 = ~_5395;
    int _5437 = _5435 + _5415;
    int _5439 = _5437 + 1;
    float _5441 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    int _5443 = ~_5411;
    int _5445 = _5443 + _5427;
    int _5447 = _5445 + 1;
    float _5449 = _5397 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    bool _5451 = !_5431;
    int _5453 = _5451 ? _5425 : (-1);
    float _5455 = float(_5341);
    float _5457 = fma(_5449, _2227, -0.5);
    bool _5459 = _4615 == 0;
    float _5461 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[95].z;
    bool _5463 = !_5359;
    int _5465 = _5463 ? _5447 : (-1);
    float _5467 = fma(_5353, _5455, _3981);
    bool _5469 = _4555 == 0;
    float _5471 = _5417 * (*spvDescriptorSet0.vp_c9)._m0[90].x;
    int _5473 = _4797 ^ _4555;
    float _5475 = fma(_5073, _5429, _5467);
    bool _5477 = !_5459;
    int _5479 = _5477 ? _5439 : (-1);
    float _5481 = fma(_5471, _2249, -0.5);
    int _5483 = _4857 ^ _4661;
    float _5485 = _5441 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    float _5487 = float(_5357);
    bool _5489 = _4661 == 0;
    float _5491 = float(_5421);
    float _5493 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].w;
    uint _5495 = uint(int(uint(_5473) >> uint(31)));
    float _5497 = fma(_5471, _5487, _4223);
    uint _5499 = uint(int(uint(_5483) >> uint(31)));
    float _5501 = fma(_5449, _5491, _4449);
    int _5503 = ~_5317;
    int _5505 = _5215 + _5503;
    int _5507 = _5505 + 1;
    float _5509 = _5461 * (*spvDescriptorSet0.vp_c9)._m0[95].x;
    int _5511 = ~int(_5495);
    int _5513 = _5511 + 1;
    float _5515 = fma(_5061, _5481, _5497);
    float _5517 = float(_5453);
    float _5519 = fma(_5509, _2259, -0.5);
    int _5521 = ~_5401;
    int _5523 = _5275 + _5521;
    int _5525 = _5523 + 1;
    float _5527 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[95].w;
    int _5529 = ~int(_5499);
    int _5531 = _5529 + 1;
    float _5533 = fma(_5509, _5517, _4051);
    float _5535 = float(_5465);
    float _5537 = fma(_5433, _3421, -0.5);
    float _5539 = float(_5479);
    float _5541 = fma(_4241, _5457, _5501);
    int _5543 = _5507 ^ _5513;
    float _5545 = -_3349;
    float _5547 = fma(_5433, _5535, _5545);
    int _5549 = _5525 ^ _5531;
    float _5551 = fma(_5485, _3429, -0.5);
    int _5553 = ~_5513;
    int _5555 = _5553 + _5543;
    int _5557 = _5555 + 1;
    float _5559 = -_4153;
    float _5561 = fma(_5485, _5539, _5559);
    int _5563 = ~_5531;
    int _5565 = _5563 + _5549;
    int _5567 = _5565 + 1;
    float _5569 = _4199 * _5319;
    float _5571 = _5493 * (*spvDescriptorSet0.vp_c9)._m0[90].y;
    bool _5573 = !_5469;
    int _5575 = _5573 ? _5557 : (-1);
    float _5577 = fma(_5015, _5537, _5547);
    bool _5579 = !_5489;
    int _5581 = _5579 ? _5567 : (-1);
    float _5583 = -_5569;
    float _5585 = fma(_5583, (*spvDescriptorSet0.vp_c9)._m0[18].w, _4199);
    float _5587 = float(_5575);
    float _5589 = fma(_3929, _5519, _5533);
    float _5591 = float(_5581);
    float _5593 = _5577 + 0.5;
    float _5595 = fma(_5585, _5585, _5413);
    float _5597 = _5527 * (*spvDescriptorSet0.vp_c9)._m0[95].y;
    float _5599 = in.m_75.x;
    float _5601 = in.m_75.y;
    float _5603 = in.m_75.z;
    float _5605 = fma(_5571, _3443, -0.5);
    float _5607 = -_4455;
    float _5609 = fma(_5571, _5587, _5607);
    float _5611 = fma(_5597, _3445, -0.5);
    float _5613 = -_4061;
    float _5615 = fma(_5597, _5591, _5613);
    float _5617 = fma(_4423, _5551, _5561);
    float _5619 = fma(_5037, _5605, _5609);
    float _5621 = _5515 + 0.5;
    float _5623 = fma(_3931, _5611, _5615);
    float _5625 = _5475 + 0.5;
    float _5627 = _5541 + 0.5;
    float _5629 = _5617 + 0.5;
    float _5631 = _5589 + 0.5;
    float _5633 = _5619 + 0.5;
    float _5635 = _5623 + 0.5;
    bool _5637 = !_4597;
    int _5639 = _5637 ? 0 : 1;
    out.m_77.x = _5625;
    out.m_77.y = _5593;
    out.m_77.z = _5627;
    out.m_77.w = _5629;
    bool _5641 = !_4601;
    int _5643 = _5641 ? 0 : 1;
    int _5645 = abs(_5639);
    out.m_79.x = _5621;
    out.m_79.y = _5633;
    float _5647 = float(_4867);
    int _5649 = abs(_5643);
    out.m_81.x = _5631;
    out.m_81.y = _5635;
    bool _5651 = !_4605;
    int _5653 = _5651 ? 0 : 1;
    float _5655 = float(_5645);
    float _5657 = _5627;
    float _5659 = as_type<float>(_5167);
    if (_4239)
    {
        return out;
    }
    float _5661 = -_5361;
    float _5663 = fma(_5661, (*spvDescriptorSet0.vp_c9)._m0[18].w, _3817);
    float _5665 = float(_5649);
    float _5667 = -_5365;
    float _5669 = fma(_5667, (*spvDescriptorSet0.vp_c9)._m0[18].w, _3843);
    float _5671 = _5655 * _5647;
    float _5673 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _5675 = _5663 + _5673;
    float _5677 = float(_3581);
    float _5679 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _5681 = _5669 + _5679;
    float _5683 = _5671 * (-2.0);
    float _5685 = _5675 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _5687 = -_5569;
    float _5689 = fma(_5687, (*spvDescriptorSet0.vp_c9)._m0[18].w, _3853);
    float _5691 = _5665 * _5677;
    float _5693 = _1846 + _2127;
    float _5695 = fma(_5681, (*spvDescriptorSet0.vp_c8)._m0[28].x, _5685);
    float _5697 = _2121 + (-0.5);
    float _5699 = fma(_5683, _5599, _5599);
    float _5701 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _5703 = _5689 + _5701;
    float _5705 = _5693 + (-1.0);
    float _5707 = fma(_4183, _5683, _4183);
    float _5709 = fma(_5697, (*spvDescriptorSet0.vp_c9)._m0[196].x, _5699);
    float _5711 = _5691 * (-2.0);
    float _5713 = fma(_5703, (*spvDescriptorSet0.vp_c8)._m0[28].z, _5695);
    float _5715 = fma(_5705, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    float _5717 = fma(_5707, _5083, _5709);
    float _5719 = _1846 + (-0.5);
    float _5721 = fma(_5711, _5601, _5601);
    bool _5723 = _5713 >= 0.0;
    float _5725 = fma(_5715, _5711, _5715);
    int _5727 = abs(_5653);
    float _5729 = _5717 * 0.15915493667125701904296875;
    float _5731 = fma(_5719, (*spvDescriptorSet0.vp_c9)._m0[196].y, _5721);
    float _5733 = sqrt(_5595);
    float _5735 = fma(_5725, _5083, _5731);
    float _5737 = float(_3809);
    float _5739 = _2121 + _2127;
    float _5741 = float(_5727);
    float _5743 = _5735 * 0.15915493667125701904296875;
    float _5745 = _5689;
    float _5747 = _5663;
    if (_5723)
    {
        _5657 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _5749 = _5657;
    float _5751 = _5729 * 6.283185482025146484375;
    float _5753 = sin(_5751);
    int _5755 = as_type<int>(_5749);
    if (_5723)
    {
        out.m_49.x = 0.0;
    }
    float _5757 = _5741 * _5737;
    if (_5723)
    {
        float _5759 = _5749 * 5.0;
        _5755 = as_type<int>(_5759);
    }
    int _5761 = _5755;
    float _5763 = _5739 + (-1.0);
    float _5765 = _5757 * (-2.0);
    float _5767 = _5729 * 6.283185482025146484375;
    float _5769 = cos(_5767);
    if (_5723)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _15696 = as_type<float>(_5761);
        out.gl_Position.z = _15696;
    }
    float _5771 = _5743 * 6.283185482025146484375;
    float _5773 = sin(_5771);
    if (_5723)
    {
        return out;
    }
    float _5775 = -_3817;
    float _5777 = _5775 + (*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _5779 = fma(_5763, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _5781 = -_3843;
    float _5783 = _5781 + (*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _5785 = -_3853;
    float _5787 = _5785 + (*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _5789 = _5777 * _5777;
    float _5791 = fma(_5765, _5603, _5603);
    float _5793 = _2127 + (-0.5);
    float _5795 = fma(_5779, _5765, _5779);
    float _5797 = fma(_5783, _5783, _5789);
    float _5799 = _5743 * 6.283185482025146484375;
    float _5801 = cos(_5799);
    float _5803 = fma(_5793, (*spvDescriptorSet0.vp_c9)._m0[196].z, _5791);
    float _5805 = _5319 * _5733;
    float _5807 = fma(_5787, _5787, _5797);
    float _5809 = _544 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _5811 = fma(_5795, _5083, _5803);
    float _5813 = _548 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _5815 = in.m_83.x;
    float _5817 = in.m_83.y;
    float _5819 = in.m_83.z;
    float _5821 = _5769 * _5773;
    float _5823 = rsqrt(_5807);
    float _5825 = _5811 * 0.15915493667125701904296875;
    float _5827 = _5753 * _5773;
    float _5829 = _5805 * _5813;
    float _5831 = _5769 * _5801;
    float _5833 = _5825 * 6.283185482025146484375;
    float _5835 = sin(_5833);
    float _5837 = _5783 * _5823;
    float _5839 = _5787 * _5823;
    float _5841 = _5777 * _5823;
    float _5843 = _5825 * 6.283185482025146484375;
    float _5845 = cos(_5843);
    float _5847 = -(*spvDescriptorSet0.vp_c8)._m0[1].z;
    float _5849 = _5837 * _5847;
    float _5851 = -(*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _5853 = _5839 * _5851;
    float _5855 = -(*spvDescriptorSet0.vp_c8)._m0[1].x;
    float _5857 = _5841 * _5855;
    float _5859 = -(*spvDescriptorSet0.vp_c8)._m0[1].x;
    float _5861 = -_5849;
    float _5863 = fma(_5839, _5859, _5861);
    float _5865 = -(*spvDescriptorSet0.vp_c8)._m0[1].z;
    float _5867 = -_5853;
    float _5869 = fma(_5841, _5865, _5867);
    float _5871 = -(*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _5873 = -_5857;
    float _5875 = fma(_5837, _5871, _5873);
    float _5877 = fma(_5835, _5831, _5827);
    float _5879 = _5863 * _5863;
    float _5881 = fma(_5835, _5827, _5831);
    float _5883 = _542 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _5885 = fma(_5869, _5869, _5879);
    float _5887 = _5753 * _5801;
    float _5889 = _5805 * _5883;
    float _5891 = fma(_5875, _5875, _5885);
    float _5893 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _5817);
    float _5895 = _5769 * _5845;
    float _5897 = _5805 * _5809;
    float _5899 = -_5821;
    float _5901 = fma(_5835, _5887, _5899);
    float _5903 = _5893 * _5889;
    float _5905 = rsqrt(_5891);
    float _5907 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _5819);
    float _5909 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _5815);
    float _5911 = _5753 * _5845;
    float _5913 = -_5887;
    float _5915 = fma(_5835, _5821, _5913);
    float _5917 = _5907 * _5897;
    float _5919 = _5909 * _5829;
    float _5921 = _5895 * _5903;
    float _5923 = _5801 * _5845;
    float _5925 = -_5903;
    float _5927 = _5835 * _5925;
    float _5929 = _5911 * _5903;
    float _5931 = fma(_5877, _5919, _5921);
    float _5933 = _5773 * _5845;
    float _5935 = fma(_5923, _5919, _5927);
    float _5937 = fma(_5901, _5919, _5929);
    float _5939 = fma(_5915, _5917, _5931);
    float _5941 = _5869 * _5905;
    float _5943 = _5863 * _5905;
    float _5945 = _5875 * _5905;
    float _5947 = fma(_5933, _5917, _5935);
    float _5949 = _5841 * _5941;
    float _5951 = _5839 * _5943;
    float _5953 = fma(_5881, _5917, _5937);
    float _5955 = _5663 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _5957 = -_5949;
    float _5959 = fma(_5837, _5943, _5957);
    float _5961 = -_5951;
    float _5963 = fma(_5841, _5945, _5961);
    float _5965 = fma(_5669, (*spvDescriptorSet0.vp_c8)._m0[11].x, _5955);
    float _5967 = _5959 * _5939;
    float _5969 = _5963 * _5939;
    float _5971 = fma(_5945, _5947, _5967);
    float _5973 = fma(_5941, _5947, _5969);
    float _5975 = _5837 * _5945;
    float _5977 = fma(_5839, _5953, _5971);
    float _5979 = fma(_5837, _5953, _5973);
    float _5981 = -_5975;
    float _5983 = fma(_5839, _5941, _5981);
    float _5985 = _3853 + _5977;
    float _5987 = _3843 + _5979;
    float _5989 = _5983 * _5939;
    float _5991 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _5993 = _5985 + _5991;
    float _5995 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _5997 = _5987 + _5995;
    float _5999 = _5993 * _5993;
    float _6001 = fma(_5997, _5997, _5999);
    float _6003 = fma(_5943, _5947, _5989);
    float _6005 = fma(_5689, (*spvDescriptorSet0.vp_c8)._m0[11].z, _5965);
    float _6007 = sqrt(_6001);
    float _6009 = fma(_5841, _5953, _6003);
    float _6011 = _3817 + _6009;
    bool _6013 = _6007 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _6015 = _6009;
    float _6017 = _5965;
    float _6019 = _5953;
    float _6021 = _5805;
    if (!_6013)
    {
        _6015 = _5987;
    }
    float _6023 = _6015;
    float _6025 = _6023;
    if (!_6013)
    {
        _6017 = _5985;
    }
    float _6027 = _6017;
    float _6029 = _6027;
    if (!_6013)
    {
        _6019 = _6011;
    }
    float _6031 = _6019;
    bool _6033 = !_6013;
    float _6035 = _6031;
    if (!_6033)
    {
        float _6037 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _6039 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _6041 = _6007 + _6039;
        float _6043 = _6011 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _6045 = rsqrt(_6001);
        float _6047 = _6041 * _6037;
        float _6049 = _6047 * 0.15915493667125701904296875;
        float _6051 = _6049 * 6.283185482025146484375;
        float _6053 = sin(_6051);
        float _6055 = _6049 * 6.283185482025146484375;
        float _6057 = cos(_6055);
        float _6059 = fma(_6053, _6043, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _6061 = _6045 * _6059;
        float _6063 = _6057 + (-1.0);
        float _6065 = fma(_5997, _6061, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _6067 = fma(_5993, _6061, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        float _6069 = _6063 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _6071 = fma(_6011, _6057, _6069);
        _6035 = _6071;
        _6025 = _6065;
        _6029 = _6067;
    }
    float _6073 = _6035;
    float _6075 = _6025;
    float _6077 = _6029;
    float _6079 = -_3817;
    float _6081 = _6079 + _6073;
    float _6083 = -_3843;
    float _6085 = _6083 + _6075;
    float _6087 = _6005 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _6089 = _5663 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _6091 = _6081 * _6081;
    float _6093 = -_3853;
    float _6095 = _6093 + _6077;
    float _6097 = 1.0 / _6087;
    float _6099 = fma(_5669, (*spvDescriptorSet0.vp_c8)._m0[10].x, _6089);
    float _6101 = fma(_6085, _6085, _6091);
    bool _6103 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[660].y;
    bool _6105 = isnan(0.5);
    bool _6107 = _6103 || _6105;
    bool _6109 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _6111 = _6107 || _6109;
    float _6113 = fma(_5689, (*spvDescriptorSet0.vp_c8)._m0[10].z, _6099);
    float _6115 = fma(_6095, _6095, _6101);
    float _6117 = _6113 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _6119 = sqrt(_6115);
    bool _6121 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[653].w;
    bool _6123 = isnan(0.5);
    bool _6125 = _6121 || _6123;
    bool _6127 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _6129 = _6125 || _6127;
    float _6131 = _6117 + _6087;
    float _6133 = _6131 * _6097;
    float _6135 = _6133 * 0.5;
    float _6137 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _6139 = fma(_6135, (*spvDescriptorSet0.vp_c8)._m0[30].w, _6137);
    float _6141 = 1.0 / _6139;
    bool _6143 = _6119 > 0.0;
    bool _6145 = !_6143;
    float _6147 = _6073;
    float _6149 = _6077;
    float _6151 = _6075;
    float _6153 = _6095;
    float _6155 = _6141;
    if (!_6145)
    {
        float _6157 = _204 * _204;
        float _6159 = fma(_202, _202, _6157);
        float _6161 = fma(_206, _206, _6159);
        float _6163 = rsqrt(_6115);
        float _6165 = sqrt(_6161);
        float _6167 = _6085 * _6163;
        float _6169 = _6081 * _6163;
        float _6171 = _6095 * _6163;
        bool _6173 = _6165 > 0.0;
        bool _6175 = !_6173;
        _6153 = _6171;
        if (!_6175)
        {
            float _6177 = rsqrt(_6161);
            float _6179 = 1.0 / (*spvDescriptorSet0.vp_c10)._m0[2].z;
            float _6181 = _204 * _6177;
            float _6183 = _202 * _6177;
            float _6185 = _6169 * _6181;
            float _6187 = _206 * _6177;
            float _6189 = fma(_6167, _6183, _6185);
            float _6191 = _6179 * (*spvDescriptorSet0.vp_c9)._m0[142].x;
            float _6193 = fma(_6171, _6187, _6189);
            float _6195 = _6193 * _6191;
            float _6197 = fma(_202, _6195, _6075);
            float _6199 = fma(_204, _6195, _6073);
            float _6201 = fma(_206, _6195, _6077);
            _6147 = _6199;
            _6149 = _6201;
            _6151 = _6197;
        }
    }
    float _6203 = _6147;
    float _6205 = _6149;
    float _6207 = _6151;
    float _6209 = _6153;
    float _6211 = -_5361;
    float _6213 = fma(_6211, (*spvDescriptorSet0.vp_c9)._m0[18].w, _6203);
    float _6215 = -_5569;
    float _6217 = fma(_6215, (*spvDescriptorSet0.vp_c9)._m0[18].w, _6205);
    float _6219 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _6221 = _6141 * _6219;
    float _6223 = -_5365;
    float _6225 = fma(_6223, (*spvDescriptorSet0.vp_c9)._m0[18].w, _6207);
    float _6227 = _6209;
    float _6229 = _6225;
    float _6231 = _6217;
    float _6233 = _6207;
    float _6235 = _6203;
    if (_6129)
    {
        _6227 = 1.0;
    }
    float _6237 = _6227;
    float _6239 = _6237;
    if (_6111)
    {
        _6155 = _6213;
    }
    float _6241 = _6155;
    float _6243 = _6241;
    if (!_6111)
    {
        float _6245 = _5675 * _5675;
        float _6247 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _6249 = -_3853;
        float _6251 = _6249 + _6205;
        float _6253 = -_3817;
        float _6255 = _6253 + _6203;
        float _6257 = fma(_5681, _5681, _6245);
        float _6259 = fma(_5703, _5703, _6257);
        float _6261 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _6263 = sqrt(_6259);
        float _6265 = 1.0 / _5805;
        float _6267 = _6261 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _6269 = precise::min(_6263, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _6271 = _6269 * _6247;
        float _6273 = _6271 * _6265;
        float _6275 = -_3843;
        float _6277 = _6275 + _6207;
        float _6279 = _6267 * _6273;
        float _6281 = _6251 * _6273;
        float _6283 = fma(_6277, _6279, _5669);
        float _6285 = fma(_6255, _6279, _5663);
        float _6287 = fma(_6267, _6281, _5689);
        _6243 = _6285;
        _6229 = _6283;
        _6231 = _6287;
    }
    float _6289 = _6243;
    float _6291 = _6229;
    float _6293 = _6231;
    if (!_6129)
    {
        float _6295 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _6297 = _6295 * 0.15915493667125701904296875;
        float _6299 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _6301 = _6297 * 6.283185482025146484375;
        float _6303 = cos(_6301);
        float _6305 = _6299 * 0.15915493667125701904296875;
        float _6307 = _6297 * 6.283185482025146484375;
        float _6309 = sin(_6307);
        float _6311 = 1.0 / _6303;
        float _6313 = _6305 * 6.283185482025146484375;
        float _6315 = cos(_6313);
        float _6317 = _6309 * _6311;
        float _6319 = _6305 * 6.283185482025146484375;
        float _6321 = sin(_6319);
        float _6323 = _6315 * _6317;
        float _6325 = 1.0 / _6323;
        float _6327 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _6329 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _6327;
        float _6331 = 1.0 / _6329;
        float _6333 = _6321 * _6325;
        float _6335 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _6337 = fma(_6221, _6333, _6335);
        float _6339 = _6337 * _6331;
        float _6341 = precise::clamp(_6339, 0.0, 1.0);
        _6233 = _6297;
        _6021 = _6305;
        _6239 = _6341;
    }
    float _6343 = _6233;
    float _6345 = _6021;
    float _6347 = _6239;
    float _6349 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _6351 = _6289 + _6349;
    float _6353 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _6355 = _6291 + _6353;
    float _6357 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _6359 = _6293 + _6357;
    float _6361 = _6351 * _6351;
    float _6363 = fma(_6355, _6355, _6361);
    float _6365 = fma(_6359, _6359, _6363);
    float _6367 = rsqrt(_6365);
    float _6369 = sqrt(_6365);
    float _6371 = _6367 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _6373 = _6355 * _6371;
    float _6375 = _6359 * _6371;
    float _6377 = _6373 * _6373;
    float _6379 = _6375 * _6375;
    float _6381 = _6377 + _6379;
    float _6383 = sqrt(_6381);
    bool _6385 = _6383 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _6387 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _6389 = _6383 + _6387;
    float _6391 = _6367;
    float _6393 = _6389;
    float _6395 = _6343;
    float _6397 = _6351;
    if (_6385)
    {
        float _6399 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _6391 = _6399;
    }
    float _6401 = _6391;
    float _6403 = _6401;
    if (_6385)
    {
        float _6405 = _6389 * _6401;
        _6393 = _6405;
    }
    float _6407 = _6393;
    if (_6385)
    {
        float _6409 = rsqrt(_6381);
        _6403 = _6409;
    }
    float _6411 = _6403;
    float _6413 = _6411;
    if (_6385)
    {
        float _6415 = _6407 * 0.15915493667125701904296875;
        _6395 = _6415;
    }
    float _6417 = _6395;
    float _6419 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _6421 = _6359;
    if (_6385)
    {
        float _6423 = _6417 * 6.283185482025146484375;
        float _6425 = sin(_6423);
        _6421 = _6425;
    }
    float _6427 = _6421;
    float _6429 = precise::max(0.0, _6419);
    float _6431 = _6345;
    float _6433 = _6429;
    if (_6385)
    {
        float _6435 = _6417 * 6.283185482025146484375;
        float _6437 = cos(_6435);
        _6431 = _6437;
    }
    float _6439 = _6431;
    float _6441 = -_6371;
    float _6443 = -_6429;
    float _6445 = fma(_6351, _6441, _6443);
    if (_6385)
    {
        float _6447 = _6445 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _6397 = _6447;
    }
    float _6449 = _6397;
    float _6451 = _6427;
    float _6453 = _6449;
    if (_6385)
    {
        float _6455 = fma(_6427, _6449, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _210 = _6455;
    }
    float _6457 = _210;
    if (!_6385)
    {
        _6451 = _6445;
    }
    float _6459 = _6451;
    float _6461 = _6459;
    if (_6385)
    {
        float _6463 = _6411 * _6457;
        _6235 = _6463;
    }
    float _6465 = _6235;
    if (!_6385)
    {
        _6413 = _6373;
    }
    float _6467 = _6413;
    float _6469 = _6467;
    float _6471 = _6439;
    if (_6385)
    {
        float _6473 = _6439 + (-1.0);
        _6433 = _6473;
    }
    float _6475 = _6433;
    float _6477 = _6475;
    if (_6385)
    {
        float _6479 = _6373 * _6465;
        _6469 = _6479;
    }
    float _6481 = _6469;
    if (_6385)
    {
        float _6483 = _6475 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _6453 = _6483;
    }
    float _6485 = _6453;
    float _6487 = _6485;
    if (!_6385)
    {
        _6477 = _6375;
    }
    float _6489 = _6477;
    float _6491 = _6489;
    if (_6385)
    {
        float _6493 = _6375 * _6465;
        _6491 = _6493;
    }
    float _6495 = _6491;
    float _6497 = fma(_5669, (*spvDescriptorSet0.vp_c15)._m0[652].x, (*spvDescriptorSet0.vp_c15)._m0[652].z);
    if (_6385)
    {
        float _6499 = fma(_6445, _6439, _6485);
        _6461 = _6499;
    }
    float _6501 = _6461;
    if (!_6385)
    {
        _6487 = _6377;
    }
    float _6503 = _6487;
    float _6505 = _6503;
    if (_6385)
    {
        float _6507 = _6481 * _6481;
        _6505 = _6507;
    }
    float _6509 = _6505;
    if (!_6385)
    {
        _6471 = _6379;
    }
    float _6511 = _6471;
    float _6513 = _6511;
    if (_6385)
    {
        float _6515 = _6495 * _6495;
        _6513 = _6515;
    }
    float _6517 = _6513;
    float _6519 = fma(_6501, _6501, _6509);
    float _6521 = _6289 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _6523 = _6289 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _6525 = floor(_6497);
    float _6527 = _6519 + _6517;
    float _6529 = fma(_6291, (*spvDescriptorSet0.vp_c8)._m0[2].x, _6521);
    float _6531 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _6533 = fma(_6369, (*spvDescriptorSet0.vp_c15)._m0[23].w, _6531);
    float _6535 = precise::clamp(_6533, 0.0, 1.0);
    float _6537 = fma(_6291, (*spvDescriptorSet0.vp_c8)._m0[3].x, _6523);
    float _6539 = fma(_6293, (*spvDescriptorSet0.vp_c8)._m0[2].z, _6529);
    float _6541 = -_6535;
    float _6543 = _6541 + 1.0;
    float _6545 = rsqrt(_6527);
    float _6547 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _6549 = _6539 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _6551 = fma(_6293, (*spvDescriptorSet0.vp_c8)._m0[3].z, _6537);
    float _6553 = _6549 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _6555 = abs(_6543);
    float _6557 = log2(_6555);
    float _6559 = _6289 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _6561 = -_6553;
    float _6563 = fma(_6561, _6547, 1.0);
    float _6565 = _6289 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _6567 = _6551 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _6569 = fma(_6291, (*spvDescriptorSet0.vp_c8)._m0[1].x, _6559);
    float _6571 = fma(_5689, (*spvDescriptorSet0.vp_c15)._m0[652].y, (*spvDescriptorSet0.vp_c15)._m0[652].w);
    float _6573 = fma(_6291, (*spvDescriptorSet0.vp_c8)._m0[0].x, _6565);
    float _6575 = _6545 * _6481;
    float _6577 = fma(_6293, (*spvDescriptorSet0.vp_c8)._m0[1].z, _6569);
    float _6579 = _6545 * _6501;
    float _6581 = fma(_6293, (*spvDescriptorSet0.vp_c8)._m0[0].z, _6573);
    float _6583 = _6545 * _6495;
    float _6585 = _6577 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _6587 = _6575 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _6589 = _6581 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _6591 = floor(_6571);
    float _6593 = _6585 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _6595 = -_6587;
    float _6597 = fma(_6579, (*spvDescriptorSet0.vp_c15)._m0[21].y, _6595);
    float _6599 = _6557 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _6601 = -_6525;
    float _6603 = _6497 + _6601;
    float _6605 = fma(_6589, (*spvDescriptorSet0.vp_c8)._m0[7].x, _6593);
    float _6607 = -_6583;
    float _6609 = fma(_6607, (*spvDescriptorSet0.vp_c15)._m0[21].z, _6597);
    float _6611 = log2(_6563);
    float _6613 = fma(_6549, (*spvDescriptorSet0.vp_c8)._m0[7].z, _6605);
    float _6615 = fma(_6609, -0.5, 0.5);
    float _6617 = _6585 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _6619 = fma(_6609, 0.5, 0.5);
    float _6621 = fma(_6567, (*spvDescriptorSet0.vp_c8)._m0[7].w, _6613);
    float _6623 = fma(_6589, (*spvDescriptorSet0.vp_c8)._m0[4].x, _6617);
    float _6625 = exp2(_6599);
    float _6627 = _6585 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _6629 = fma(_6619, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _6631 = fma(_6549, (*spvDescriptorSet0.vp_c8)._m0[4].z, _6623);
    float _6633 = -_6591;
    float _6635 = _6571 + _6633;
    float _6637 = fma(_6589, (*spvDescriptorSet0.vp_c8)._m0[5].x, _6627);
    float _6639 = fma(_6619, _6629, -0.212114393711090087890625);
    float _6641 = fma(_6567, (*spvDescriptorSet0.vp_c8)._m0[4].w, _6631);
    float _6643 = 1.0 / _6621;
    float _6645 = fma(_6549, (*spvDescriptorSet0.vp_c8)._m0[5].z, _6637);
    float _6647 = _6611 * 0.693147182464599609375;
    float _6649 = sqrt(_6615);
    float _6651 = fma(_6567, (*spvDescriptorSet0.vp_c8)._m0[5].w, _6645);
    float2 _17089 = float2(_6603, _6635);
    float _6653 = dm_bs(spvDescriptorSet0.vp_t_tcb_24.sample(spvDescriptorSet0.vp_t_tcb_24Smplr, select(_17089, float2(0.0), isnan(_17089)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_24, spvDescriptorSet0.vp_t_tcb_24Smplr_w, select(_17089, float2(0.0), isnan(_17089)), level(0.0)).x;
    float _6655 = fma(_6619, _6639, 1.570728778839111328125);
    float _6657 = _6647 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _6659 = _6641 * _6643;
    float _6661 = _6579 + 1.0;
    float _6663 = _6651 * _6643;
    float _6665 = fma(_6659, 0.5, 0.5);
    float _6667 = -_6579;
    float _6669 = fma(_6625, _6661, _6667);
    float _6671 = fma(_6663, -0.5, 0.5);
    float _6673 = _6649 * 0.636619746685028076171875;
    float _6675 = fma(_6669, 0.5, 0.5);
    float3 _17131 = float3(_6665, _6671, _6657);
    float _6677 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_17131, float3(0.0), isnan(_17131)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_17131, float3(0.0), isnan(_17131)), level(0.0)).x;
    float3 _17142 = float3(_6665, _6671, _6657);
    float4 _6680 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_17142, float3(0.0), isnan(_17142)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_17142, float3(0.0), isnan(_17142)), level(0.0)).xyzw;
    float _6682 = _6680.x;
    float _6684 = _6680.y;
    float _6686 = _6680.z;
    float _6688 = _6680.w;
    float _6690 = -_6655;
    float _6692 = fma(_6673, _6690, 1.0);
    float2 _17163 = float2(_6692, _6675);
    float3 _6696 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_17163, float2(0.0), isnan(_17163)), level(0.0)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_17163, float2(0.0), isnan(_17163)), level(0.0)).xyz;
    float _6698 = _6696.x;
    float _6700 = _6696.y;
    float _6702 = _6696.z;
    float _6704 = abs(_6221);
    float _6706 = log2(_6704);
    float _6708 = in.m_85.x;
    float _6710 = in.m_85.y;
    float _6712 = in.m_85.z;
    bool _6714 = _5817 != 0.0;
    bool _6716 = isnan(_5817);
    bool _6718 = _6714 || _6716;
    bool _6720 = isnan(0.0);
    bool _6722 = _6718 || _6720;
    float _6724 = _5915 * _5983;
    float _6726 = in.m_87.x;
    float _6728 = in.m_87.y;
    float _6730 = in.m_87.z;
    float _6732 = in.m_87.w;
    bool _6734 = _5815 == 0.0;
    bool _6736 = !_6722;
    bool _6738 = _6734 && _6736;
    float _6740 = fma(_5933, _5943, _6724);
    out.m_89.x = _5669;
    out.m_89.y = _5663;
    out.m_89.z = _5689;
    bool _6742 = _5819 == 0.0;
    bool _6744 = _6742 && _6738;
    bool _6746 = _6221 <= 8000.0;
    bool _6748 = isnan(_6221);
    bool _6750 = _6746 || _6748;
    bool _6752 = isnan(8000.0);
    bool _6754 = _6750 || _6752;
    float _6756 = float(_6754);
    float _6758 = _6706 * (*spvDescriptorSet0.vp_c15)._m0[654].z;
    float _6760 = exp2(_6758);
    float _6762 = _6671;
    float _6764 = _6665;
    float _6766 = _6708;
    float _6768 = _6621;
    float _6770 = _6651;
    if (_6744)
    {
        _5659 = _6710;
    }
    float _6772 = _5659;
    float _6774 = _6772;
    if (_6744)
    {
        _4861 = _6708;
    }
    float _6776 = _4861;
    float _6778 = _6776;
    if (_6744)
    {
        _6762 = _6772;
    }
    float _6780 = _6762;
    float _6782 = _6780;
    if (!_6744)
    {
        _6774 = _6710;
    }
    float _6784 = _6774;
    if (_6744)
    {
        _6764 = _6776;
    }
    float _6786 = _6764;
    float _6788 = _6786;
    if (!_6744)
    {
        _6778 = _6708;
    }
    float _6790 = _6778;
    if (!_6744)
    {
        float _6792 = fma(_5817, (*spvDescriptorSet0.vp_c9)._m0[17].y, _6784);
        _6782 = _6792;
    }
    float _6794 = _6782;
    float _6796 = _6728 * _6712;
    float _6798 = fma(_6760, (*spvDescriptorSet0.vp_c15)._m0[654].x, (*spvDescriptorSet0.vp_c15)._m0[654].y);
    float _6800 = precise::clamp(_6798, 0.0, 1.0);
    if (_6744)
    {
        _6766 = _6712;
    }
    float _6802 = _6766;
    float _6804 = _6802;
    if (!_6744)
    {
        float _6806 = fma(_5815, (*spvDescriptorSet0.vp_c9)._m0[17].y, _6790);
        _6788 = _6806;
    }
    float _6808 = _6788;
    if (!_6744)
    {
        float _6810 = fma(_5819, (*spvDescriptorSet0.vp_c9)._m0[17].y, _6712);
        _6804 = _6810;
    }
    float _6812 = _6804;
    float _6814 = _6730 * _6790;
    float _6816 = _6726 * _6784;
    float _6818 = -_6796;
    float _6820 = fma(_6730, _6784, _6818);
    float _6822 = fma(_6800, -2.0, 3.0);
    float _6824 = _6800 * _6800;
    float _6826 = -_6814;
    float _6828 = fma(_6726, _6712, _6826);
    float _6830 = -_6816;
    float _6832 = fma(_6728, _6790, _6830);
    float _6834 = _5877 * _5963;
    float _6836 = _6824 * _6822;
    float _6838 = _5895 * _5963;
    float _6840 = _5895 * _5983;
    float _6842 = _6828 * _6732;
    float _6844 = _6820 * _6732;
    float _6846 = _5895 * _5959;
    float _6848 = _6832 * _6732;
    float _6850 = _5877 * _5983;
    float _6852 = _5877 * _5959;
    float _6854 = _5915 * _5963;
    float _6856 = _5915 * _5959;
    float _6858 = fma(_5923, _5941, _6834);
    float _6860 = -_5835;
    float _6862 = fma(_6860, _5941, _6838);
    float _6864 = -_5835;
    float _6866 = fma(_6864, _5943, _6840);
    float _6868 = -_5835;
    float _6870 = fma(_6868, _5945, _6846);
    float _6872 = fma(_5923, _5943, _6850);
    float _6874 = fma(_5923, _5945, _6852);
    float _6876 = -_6836;
    float _6878 = _6876 + 1.0;
    float _6880 = fma(_5901, _5837, _6858);
    float _6882 = fma(_5933, _5941, _6854);
    float _6884 = fma(_5933, _5945, _6856);
    float _6886 = fma(_5911, _5837, _6862);
    float _6888 = fma(_5911, _5841, _6866);
    float _6890 = fma(_5911, _5839, _6870);
    float _6892 = fma(_5901, _5841, _6872);
    float _6894 = fma(_6878, (*spvDescriptorSet0.vp_c15)._m0[654].w, _6836);
    float _6896 = fma(_5901, _5839, _6874);
    float _6898 = fma(_5881, _5841, _6740);
    float _6900 = fma(_5881, _5837, _6882);
    float _6902 = fma(_5881, _5839, _6884);
    float _6904 = _6886 * _6728;
    float _6906 = _6888 * _6728;
    float _6908 = _6890 * _6728;
    float _6910 = _6842 * _6886;
    float _6912 = _6842 * _6888;
    float _6914 = _6842 * _6890;
    float _6916 = _6585 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _6918 = _6756 * _6894;
    float _6920 = _6886 * _6794;
    float _6922 = _6888 * _6794;
    float _6924 = fma(_6589, (*spvDescriptorSet0.vp_c8)._m0[6].x, _6916);
    float _6926 = _6890 * _6794;
    float _6928 = fma(_6880, _6808, _6920);
    float _6930 = fma(_6880, _6726, _6904);
    float _6932 = fma(_6549, (*spvDescriptorSet0.vp_c8)._m0[6].z, _6924);
    float _6934 = _6557 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _6936 = fma(_6892, _6726, _6906);
    float _6938 = fma(_6844, _6880, _6910);
    float _6940 = fma(_6844, _6892, _6912);
    float _6942 = fma(_6844, _6896, _6914);
    float _6944 = exp2(_6934);
    float _6946 = fma(_6896, _6726, _6908);
    float _6948 = fma(_6892, _6808, _6922);
    float _6950 = fma(_6900, _6730, _6930);
    float _6952 = fma(_6898, _6730, _6936);
    float _6954 = fma(_6848, _6900, _6938);
    float _6956 = fma(_6848, _6898, _6940);
    float _6958 = fma(_6848, _6902, _6942);
    float _6960 = fma(_6902, _6730, _6946);
    float _6962 = in.m_91.x;
    float _6964 = _6918 * (*spvDescriptorSet0.vp_c15)._m0[653].x;
    float _6966 = fma(_6567, (*spvDescriptorSet0.vp_c8)._m0[6].w, _6932);
    float _6968 = fma(_6896, _6808, _6926);
    out.m_93.x = _6950;
    out.m_93.y = _6952;
    out.m_93.z = _6960;
    float _6970 = _6966 + _6621;
    float _6972 = -_6944;
    float _6974 = _6972 + 1.0;
    float _6976 = fma(_6898, _6812, _6948);
    out.m_95.x = _6954;
    out.m_95.y = _6956;
    out.m_95.z = _6958;
    float _6978 = _6970 * 0.5;
    float _6980 = _6974 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _6982 = fma(_6900, _6812, _6928);
    float _6984 = fma(_6902, _6812, _6968);
    bool _6986 = _6369 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _6988 = isnan(_6369);
    bool _6990 = _6986 || _6988;
    bool _6992 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _6994 = _6990 || _6992;
    float _6996 = -_6980;
    float _6998 = _6996 + 1.0;
    out.m_97.z = _6978;
    out.m_97.w = _6621;
    out.m_99.x = _6982;
    out.m_99.y = _6976;
    out.m_99.z = _6984;
    out.gl_Position.x = _6641;
    out.gl_Position.y = _6651;
    out.gl_Position.z = _6966;
    out.gl_Position.w = _6621;
    float _7000 = _6641;
    float _7002 = _6998;
    if (!_6994)
    {
        _5745 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _7004 = _5745;
    float _7006 = _7004;
    float _7008 = _7004;
    if (!_6994)
    {
        _5747 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _7010 = _5747;
    float _7012 = _6347 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _7014 = _7010;
    float _7016 = _7010;
    if (!_6994)
    {
        _6768 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _7018 = _6768;
    float _7020 = _7018;
    float _7022 = _7018;
    if (!_6994)
    {
        _7000 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _7024 = _7000;
    float _7026 = _7024;
    float _7028 = _7024;
    if (!_6994)
    {
        _6770 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _7030 = _6770;
    float _7032 = -_6653;
    float _7034 = _7032 + 1.0;
    float _7036 = _7034 * _6964;
    float _7038 = precise::clamp(_7036, 0.0, 1.0);
    float _7040 = -_7038;
    float _7042 = fma(_7040, (*spvDescriptorSet0.vp_c15)._m0[653].y, 1.0);
    float _7044 = _7042 * _6962;
    float _7046 = _6980 * _6677;
    float _7048 = _7044 * (*spvDescriptorSet0.vp_c13)._m0[1].w;
    float _7050 = _6688 * _6998;
    float _7052 = _7030;
    float _7054 = _7030;
    if (!_6994)
    {
        _7002 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _7056 = _7002;
    float _7058 = _6688 * _7046;
    out.m_101.x = _7048;
    float _7060 = _6702 * _7046;
    float _7062 = fma(_6698, _7058, _6682);
    float _7064 = fma(_6700, _7058, _6684);
    float _7066 = fma(_6688, _7060, _6686);
    out.m_103.x = _7062;
    out.m_103.y = _7064;
    out.m_103.z = _7066;
    out.m_103.w = _7050;
    bool _7068 = !_6994;
    float _7070 = _7056;
    float _7072 = _7056;
    if (!_7068)
    {
        bool _7074 = _6369 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _7076 = isnan(_6369);
        bool _7078 = _7074 || _7076;
        bool _7080 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _7082 = _7078 || _7080;
        if (!_7082)
        {
            float _7084 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _7086 = _6369 + _7084;
            float _7088 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _7090 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _7088;
            float _7092 = 1.0 / _7090;
            float _7094 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _7096 = _7094 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _7098 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _7100 = _7098 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _7102 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _7104 = _7102 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _7106 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _7108 = _7106 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _7110 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _7112 = _7110 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _7114 = _7086 * _7092;
            float _7116 = precise::clamp(_7114, 0.0, 1.0);
            float _7118 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _7120 = _7118 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _7122 = fma(_7116, _7100, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _7124 = fma(_7116, _7120, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _7126 = fma(_7116, _7096, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _7128 = fma(_7116, _7104, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _7130 = fma(_7116, _7108, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _7132 = fma(_7116, _7112, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            _7016 = _7126;
            _7028 = _7130;
            _7008 = _7124;
            _7022 = _7128;
            _7072 = _7122;
            _7054 = _7132;
            _7134 = true;
        }
        else
        {
            bool _7136 = _6369 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _7138 = isnan(_6369);
            bool _7140 = _7136 || _7138;
            bool _7142 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _7144 = _7140 || _7142;
            if (!_7144)
            {
                _7020 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _7146 = _7020;
            _7022 = _7146;
            if (!_7144)
            {
                _7026 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _7148 = _7026;
            _7028 = _7148;
            if (!_7144)
            {
                _7052 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _7150 = _7052;
            _7054 = _7150;
            if (!_7144)
            {
                _7006 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _7152 = _7006;
            _7008 = _7152;
            if (!_7144)
            {
                _7014 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _7154 = _7014;
            _7016 = _7154;
            if (!_7144)
            {
                _7070 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _7156 = _7070;
            bool _7158 = !_7144;
            _7072 = _7156;
            if (!_7158)
            {
                bool _7160 = _6369 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _7162 = isnan(_6369);
                bool _7164 = _7160 || _7162;
                bool _7166 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _7168 = _7164 || _7166;
                if (!_7168)
                {
                    float _7170 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _7172 = _6369 + _7170;
                    float _7174 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _7176 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _7174;
                    float _7178 = 1.0 / _7176;
                    float _7180 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _7182 = _7180 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _7184 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _7186 = _7184 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _7188 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _7190 = _7188 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _7192 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _7194 = _7192 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _7196 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _7198 = _7196 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _7200 = _7172 * _7178;
                    float _7202 = precise::clamp(_7200, 0.0, 1.0);
                    float _7204 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _7206 = _7204 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _7208 = fma(_7202, _7186, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _7210 = fma(_7202, _7206, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _7212 = fma(_7202, _7182, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _7214 = fma(_7202, _7190, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _7216 = fma(_7202, _7194, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _7218 = fma(_7202, _7198, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    _7016 = _7212;
                    _7028 = _7216;
                    _7008 = _7210;
                    _7022 = _7214;
                    _7072 = _7208;
                    _7054 = _7218;
                    _7134 = true;
                }
                else
                {
                    _7016 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _7028 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _7008 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _7022 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _7072 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _7054 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _7134 = false;
    float _7220 = _7016;
    float _7222 = _7028;
    float _7224 = _7008;
    float _7226 = _7022;
    float _7228 = _7072;
    float _7230 = _7054;
    float _7232 = fma(_6976, -0.5, 0.5);
    float _7234 = precise::clamp(_7232, 0.0, 1.0);
    float _7236 = -_7220;
    float _7238 = _7222 + _7236;
    float _7240 = _7012 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _7242 = -_7224;
    float _7244 = _7226 + _7242;
    float _7246 = fma(_7234, _7238, _7220);
    out.m_105.x = 0.0;
    float _7248 = -_7228;
    float _7250 = _7230 + _7248;
    float _7252 = fma(_7234, _7244, _7224);
    float _7254 = _7246 * 0.586610972881317138671875;
    out.m_49.x = _7240;
    bool _7256 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _7258 = fma(_7234, _7250, _7228);
    float _7260 = fma(_7252, 0.298911988735198974609375, _7254);
    bool _7262 = _6347 > 0.0;
    bool _7264 = isnan(_6347);
    bool _7266 = _7262 || _7264;
    bool _7268 = isnan(0.0);
    bool _7270 = _7266 || _7268;
    float _7272 = fma(_7258, 0.114477999508380889892578125, _7260);
    float _7274 = -_7272;
    float _7276 = _7252 + _7274;
    float _7278 = -_7272;
    float _7280 = _7246 + _7278;
    float _7282 = -_7272;
    float _7284 = _7258 + _7282;
    float _7286 = fma(_7276, (*spvDescriptorSet0.vp_c13)._m0[1].z, _7272);
    float _7288 = fma(_7280, (*spvDescriptorSet0.vp_c13)._m0[1].z, _7272);
    float _7290 = fma(_7284, (*spvDescriptorSet0.vp_c13)._m0[1].z, _7272);
    bool _7292 = !_7256;
    if (!_7292)
    {
        float _7294 = -_6289;
        float _7296 = _7294 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
        float _7298 = -_6291;
        float _7300 = _7298 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
        float _7302 = -_6293;
        float _7304 = _7302 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
        float _7306 = _7296 * _7296;
        float _7308 = fma(_7300, _7300, _7306);
        float _7310 = fma(_7304, _7304, _7308);
        float _7312 = sqrt(_7310);
        float _7314 = rsqrt(_7310);
        float _7316 = -_7312;
        float _7318 = _7316 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
        float _7320 = _7318 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
        float _7322 = precise::clamp(_7320, 0.0, 1.0);
        float _7324 = _7300 * _7314;
        float _7326 = _7296 * _7314;
        float _7328 = abs(_7322);
        float _7330 = log2(_7328);
        float _7332 = _7304 * _7314;
        float _7334 = _7324 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
        float _7336 = _6976 * _7326;
        float _7338 = -_7326;
        float _7340 = -_7334;
        float _7342 = fma(_7338, (*spvDescriptorSet0.vp_c15)._m0[656].y, _7340);
        float _7344 = fma(_6982, _7324, _7336);
        float _7346 = -_7332;
        float _7348 = fma(_7346, (*spvDescriptorSet0.vp_c15)._m0[656].z, _7342);
        float _7350 = fma(_6984, _7332, _7344);
        float _7352 = precise::clamp(_7350, 0.0, 1.0);
        float _7354 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
        float _7356 = _7348 + _7354;
        float _7358 = _7330 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
        float _7360 = _7356 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
        float _7362 = precise::clamp(_7360, 0.0, 1.0);
        float _7364 = exp2(_7358);
        float _7366 = _7364 * _7362;
        float _7368 = _7352 * _7366;
        float _7370 = _7368 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
        float _7372 = _7368 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
        float _7374 = _7368 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
        out.m_105.x = _7370;
        out.m_105.y = _7372;
        out.m_105.z = _7374;
    }
    out.m_107.x = _7286;
    out.m_107.y = _7288;
    out.m_107.z = _7290;
    if (_7270)
    {
        return out;
    }
    float _7376 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.m_49.x = 0.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _7376;
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
    bool _7134 = false;
    bool _1828 = false;
    bool _1498 = false;
    bool _1180 = false;
    bool _862 = false;
    bool _720 = false;
    bool _606 = false;
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
        float _7433 = as_type<float>(_142);
        out.gl_Position.z = _7433;
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
        float _7503 = as_type<float>(_180);
        out.gl_Position.z = _7503;
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
    float _462 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _464 = _460 + _462;
    float _466 = in.m_57.x;
    float _468 = in.m_57.y;
    float _470 = in.m_57.z;
    float _472 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _474 = _472 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _476 = _460 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _478 = isnan(_460);
    bool _480 = _476 || _478;
    bool _482 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _484 = _480 || _482;
    float _486 = float(_484);
    float _488 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _490 = _488 + (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _492 = _460 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _494 = isnan(_460);
    bool _496 = _492 || _494;
    bool _498 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _500 = _496 || _498;
    float _502 = float(_500);
    float _504 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _506 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _504;
    bool _508 = _460 >= (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _510 = isnan(_460);
    bool _512 = _508 || _510;
    bool _514 = isnan((*spvDescriptorSet0.vp_c9)._m0[117].w);
    bool _516 = _512 || _514;
    float _518 = float(_516);
    float _520 = 1.0 / _474;
    float _522 = -_486;
    float _524 = _522 + 1.0;
    bool _526 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].z;
    float _528 = _502 * _524;
    float _530 = -_502;
    float _532 = _530 + 1.0;
    float _534 = 1.0 / _490;
    float _536 = _506 * _520;
    float _538 = -(*spvDescriptorSet0.vp_c9)._m0[116].x;
    float _540 = _538 + (*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _542 = _428 * _468;
    float _544 = _430 * _470;
    float _546 = fma(_536, _464, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _548 = _426 * _466;
    float _550 = _540 * _534;
    float _552 = _546 * _528;
    float _554 = -_518;
    float _556 = _554 + 1.0;
    float _558 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _560 = _460 + _558;
    float _562 = fma(_532, (*spvDescriptorSet0.vp_c9)._m0[115].x, _552);
    float _564 = _486 * _556;
    float _566 = fma(_550, _560, (*spvDescriptorSet0.vp_c9)._m0[116].x);
    float _568 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _570 = fma(_566, _564, _562);
    float _572 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _574 = _568 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _576 = fma(_518, (*spvDescriptorSet0.vp_c9)._m0[117].x, _570);
    float _578 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _580 = _572 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _582 = _576 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _584 = _578 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    out.m_59.x = _574;
    out.m_59.y = _584;
    out.m_59.z = _580;
    out.m_59.w = _582;
    bool _586 = !_526;
    float _604;
    if (!_586)
    {
        float _588 = in.m_55.x;
        float _590 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].z;
        float _592 = _588 * (*spvDescriptorSet0.vp_c9)._m0[12].w;
        float _594 = fma(_592, (*spvDescriptorSet0.vp_c9)._m0[11].z, _160);
        float _596 = _594 * _590;
        float _598 = floor(_596);
        float _600 = -_598;
        float _602 = _596 + _600;
        _604 = _602;
        _606 = true;
    }
    else
    {
        float _608 = float(_126);
        float _610 = 1.0 / _608;
        float _612 = _160 * _610;
        _604 = _612;
    }
    _606 = false;
    float _614 = _604;
    float _616 = -(*spvDescriptorSet0.vp_c9)._m0[123].w;
    float _618 = _614 + _616;
    bool _620 = _614 >= (*spvDescriptorSet0.vp_c9)._m0[124].w;
    bool _622 = isnan(_614);
    bool _624 = _620 || _622;
    bool _626 = isnan((*spvDescriptorSet0.vp_c9)._m0[124].w);
    bool _628 = _624 || _626;
    float _630 = float(_628);
    float _632 = -(*spvDescriptorSet0.vp_c9)._m0[123].w;
    float _634 = (*spvDescriptorSet0.vp_c9)._m0[124].w + _632;
    bool _636 = _614 >= (*spvDescriptorSet0.vp_c9)._m0[123].w;
    bool _638 = isnan(_614);
    bool _640 = _636 || _638;
    bool _642 = isnan((*spvDescriptorSet0.vp_c9)._m0[123].w);
    bool _644 = _640 || _642;
    float _646 = float(_644);
    float _648 = -_630;
    float _650 = _648 + 1.0;
    float _652 = -(*spvDescriptorSet0.vp_c9)._m0[123].x;
    float _654 = (*spvDescriptorSet0.vp_c9)._m0[124].x + _652;
    float _656 = 1.0 / _634;
    bool _658 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].w;
    float _660 = _646 * _650;
    float _662 = -_646;
    float _664 = _662 + 1.0;
    float _666 = _618 * _656;
    float _668 = -(*spvDescriptorSet0.vp_c9)._m0[123].z;
    float _670 = (*spvDescriptorSet0.vp_c9)._m0[124].z + _668;
    float _672 = fma(_654, _666, (*spvDescriptorSet0.vp_c9)._m0[123].x);
    float _674 = -(*spvDescriptorSet0.vp_c9)._m0[123].y;
    float _676 = (*spvDescriptorSet0.vp_c9)._m0[124].y + _674;
    float _678 = fma(_670, _666, (*spvDescriptorSet0.vp_c9)._m0[123].z);
    float _680 = _672 * _660;
    float _682 = fma(_676, _666, (*spvDescriptorSet0.vp_c9)._m0[123].y);
    float _684 = _678 * _660;
    float _686 = _682 * _660;
    float _688 = fma(_664, (*spvDescriptorSet0.vp_c9)._m0[123].x, _680);
    float _690 = fma(_664, (*spvDescriptorSet0.vp_c9)._m0[123].y, _686);
    float _692 = fma(_664, (*spvDescriptorSet0.vp_c9)._m0[123].z, _684);
    float _694 = fma(_630, (*spvDescriptorSet0.vp_c9)._m0[124].x, _688);
    float _696 = fma(_630, (*spvDescriptorSet0.vp_c9)._m0[124].y, _690);
    float _698 = fma(_630, (*spvDescriptorSet0.vp_c9)._m0[124].z, _692);
    bool _700 = !_658;
    float _718;
    if (!_700)
    {
        float _702 = in.m_55.x;
        float _704 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].w;
        float _706 = _702 * (*spvDescriptorSet0.vp_c9)._m0[13].x;
        float _708 = fma(_706, (*spvDescriptorSet0.vp_c9)._m0[11].w, _160);
        float _710 = _708 * _704;
        float _712 = floor(_710);
        float _714 = -_712;
        float _716 = _710 + _714;
        _718 = _716;
        _720 = true;
    }
    else
    {
        float _722 = float(_126);
        float _724 = 1.0 / _722;
        float _726 = _160 * _724;
        _718 = _726;
    }
    _720 = false;
    float _728 = _718;
    float _730 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _732 = _728 + _730;
    float _734 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _736 = _734 + (*spvDescriptorSet0.vp_c9)._m0[132].w;
    bool _738 = _728 >= (*spvDescriptorSet0.vp_c9)._m0[132].w;
    bool _740 = isnan(_728);
    bool _742 = _738 || _740;
    bool _744 = isnan((*spvDescriptorSet0.vp_c9)._m0[132].w);
    bool _746 = _742 || _744;
    float _748 = float(_746);
    float _750 = -(*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _752 = _750 + (*spvDescriptorSet0.vp_c9)._m0[133].w;
    bool _754 = _728 >= (*spvDescriptorSet0.vp_c9)._m0[131].w;
    bool _756 = isnan(_728);
    bool _758 = _754 || _756;
    bool _760 = isnan((*spvDescriptorSet0.vp_c9)._m0[131].w);
    bool _762 = _758 || _760;
    float _764 = float(_762);
    float _766 = -(*spvDescriptorSet0.vp_c9)._m0[131].x;
    float _768 = (*spvDescriptorSet0.vp_c9)._m0[132].x + _766;
    bool _770 = _728 >= (*spvDescriptorSet0.vp_c9)._m0[133].w;
    bool _772 = isnan(_728);
    bool _774 = _770 || _772;
    bool _776 = isnan((*spvDescriptorSet0.vp_c9)._m0[133].w);
    bool _778 = _774 || _776;
    float _780 = float(_778);
    float _782 = 1.0 / _736;
    float _784 = -_748;
    float _786 = _784 + 1.0;
    bool _788 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[14].x;
    float _790 = _764 * _786;
    float _792 = -_764;
    float _794 = _792 + 1.0;
    float _796 = 1.0 / _752;
    float _798 = _768 * _782;
    float _800 = -(*spvDescriptorSet0.vp_c9)._m0[132].x;
    float _802 = _800 + (*spvDescriptorSet0.vp_c9)._m0[133].x;
    float _804 = fma(_798, _732, (*spvDescriptorSet0.vp_c9)._m0[131].x);
    float _806 = _802 * _796;
    float _808 = _804 * _790;
    float _810 = -_780;
    float _812 = _810 + 1.0;
    float _814 = -(*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _816 = _728 + _814;
    float _818 = _694 * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _820 = fma(_794, (*spvDescriptorSet0.vp_c9)._m0[131].x, _808);
    float _822 = _748 * _812;
    float _824 = fma(_806, _816, (*spvDescriptorSet0.vp_c9)._m0[132].x);
    float _826 = _698 * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _828 = fma(_824, _822, _820);
    float _830 = _696 * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _832 = _818 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _834 = _826 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _836 = fma(_780, (*spvDescriptorSet0.vp_c9)._m0[133].x, _828);
    float _838 = _830 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _840 = _836 * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    out.m_61.x = _832;
    out.m_61.y = _838;
    out.m_61.z = _834;
    out.m_61.w = _840;
    bool _842 = !_788;
    float _860;
    if (!_842)
    {
        float _844 = in.m_55.x;
        float _846 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[14].x;
        float _848 = _844 * (*spvDescriptorSet0.vp_c9)._m0[15].x;
        float _850 = fma(_848, (*spvDescriptorSet0.vp_c9)._m0[14].x, _160);
        float _852 = _850 * _846;
        float _854 = floor(_852);
        float _856 = -_854;
        float _858 = _852 + _856;
        _860 = _858;
        _862 = true;
    }
    else
    {
        float _864 = float(_126);
        float _866 = 1.0 / _864;
        float _868 = _160 * _866;
        _860 = _868;
    }
    _862 = false;
    float _870 = _860;
    float _872 = -(*spvDescriptorSet0.vp_c9)._m0[159].w;
    float _874 = _870 + _872;
    bool _876 = _870 >= (*spvDescriptorSet0.vp_c9)._m0[165].w;
    bool _878 = isnan(_870);
    bool _880 = _876 || _878;
    bool _882 = isnan((*spvDescriptorSet0.vp_c9)._m0[165].w);
    bool _884 = _880 || _882;
    float _886 = float(_884);
    float _888 = -(*spvDescriptorSet0.vp_c9)._m0[159].w;
    float _890 = _888 + (*spvDescriptorSet0.vp_c9)._m0[160].w;
    bool _892 = _870 >= (*spvDescriptorSet0.vp_c9)._m0[164].w;
    bool _894 = isnan(_870);
    bool _896 = _892 || _894;
    bool _898 = isnan((*spvDescriptorSet0.vp_c9)._m0[164].w);
    bool _900 = _896 || _898;
    float _902 = float(_900);
    float _904 = -(*spvDescriptorSet0.vp_c9)._m0[159].x;
    float _906 = (*spvDescriptorSet0.vp_c9)._m0[160].x + _904;
    bool _908 = _870 >= (*spvDescriptorSet0.vp_c9)._m0[163].w;
    bool _910 = isnan(_870);
    bool _912 = _908 || _910;
    bool _914 = isnan((*spvDescriptorSet0.vp_c9)._m0[163].w);
    bool _916 = _912 || _914;
    float _918 = float(_916);
    float _920 = -_886;
    float _922 = _920 + 1.0;
    float _924 = 1.0 / _890;
    float _926 = _902 * _922;
    float _928 = -_918;
    float _930 = _928 + 1.0;
    float _932 = -(*spvDescriptorSet0.vp_c9)._m0[160].w;
    float _934 = _932 + (*spvDescriptorSet0.vp_c9)._m0[161].w;
    bool _936 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[14].y;
    float _938 = 1.0 / _934;
    float _940 = _906 * _924;
    float _942 = -_902;
    float _944 = _942 + 1.0;
    bool _946 = _870 >= (*spvDescriptorSet0.vp_c9)._m0[162].w;
    bool _948 = isnan(_870);
    bool _950 = _946 || _948;
    bool _952 = isnan((*spvDescriptorSet0.vp_c9)._m0[162].w);
    bool _954 = _950 || _952;
    float _956 = float(_954);
    float _958 = fma(_940, _874, (*spvDescriptorSet0.vp_c9)._m0[159].x);
    float _960 = _918 * _944;
    bool _962 = _870 >= (*spvDescriptorSet0.vp_c9)._m0[161].w;
    bool _964 = isnan(_870);
    bool _966 = _962 || _964;
    bool _968 = isnan((*spvDescriptorSet0.vp_c9)._m0[161].w);
    bool _970 = _966 || _968;
    float _972 = float(_970);
    float _974 = _956 * _930;
    float _976 = -_956;
    float _978 = _976 + 1.0;
    float _980 = -(*spvDescriptorSet0.vp_c9)._m0[161].w;
    float _982 = _980 + (*spvDescriptorSet0.vp_c9)._m0[162].w;
    bool _984 = _870 >= (*spvDescriptorSet0.vp_c9)._m0[160].w;
    bool _986 = isnan(_870);
    bool _988 = _984 || _986;
    bool _990 = isnan((*spvDescriptorSet0.vp_c9)._m0[160].w);
    bool _992 = _988 || _990;
    float _994 = float(_992);
    float _996 = _972 * _978;
    float _998 = -_972;
    float _1000 = _998 + 1.0;
    float _1002 = -(*spvDescriptorSet0.vp_c9)._m0[162].w;
    float _1004 = _1002 + (*spvDescriptorSet0.vp_c9)._m0[163].w;
    float _1006 = 1.0 / _982;
    bool _1008 = _870 >= (*spvDescriptorSet0.vp_c9)._m0[159].w;
    bool _1010 = isnan(_870);
    bool _1012 = _1008 || _1010;
    bool _1014 = isnan((*spvDescriptorSet0.vp_c9)._m0[159].w);
    bool _1016 = _1012 || _1014;
    float _1018 = float(_1016);
    float _1020 = _994 * _1000;
    float _1022 = -_994;
    float _1024 = _1022 + 1.0;
    float _1026 = -(*spvDescriptorSet0.vp_c9)._m0[163].w;
    float _1028 = _1026 + (*spvDescriptorSet0.vp_c9)._m0[164].w;
    float _1030 = -(*spvDescriptorSet0.vp_c9)._m0[160].x;
    float _1032 = _1030 + (*spvDescriptorSet0.vp_c9)._m0[161].x;
    float _1034 = _1018 * _1024;
    float _1036 = 1.0 / _1004;
    float _1038 = _1032 * _938;
    float _1040 = _958 * _1034;
    float _1042 = -_1018;
    float _1044 = _1042 + 1.0;
    float _1046 = -(*spvDescriptorSet0.vp_c9)._m0[164].w;
    float _1048 = _1046 + (*spvDescriptorSet0.vp_c9)._m0[165].w;
    float _1050 = -(*spvDescriptorSet0.vp_c9)._m0[160].w;
    float _1052 = _870 + _1050;
    float _1054 = 1.0 / _1028;
    float _1056 = -(*spvDescriptorSet0.vp_c9)._m0[161].x;
    float _1058 = (*spvDescriptorSet0.vp_c9)._m0[162].x + _1056;
    float _1060 = fma(_1044, (*spvDescriptorSet0.vp_c9)._m0[159].x, _1040);
    float _1062 = -(*spvDescriptorSet0.vp_c9)._m0[165].w;
    float _1064 = _1062 + (*spvDescriptorSet0.vp_c9)._m0[166].w;
    float _1066 = fma(_1038, _1052, (*spvDescriptorSet0.vp_c9)._m0[160].x);
    float _1068 = _1058 * _1006;
    float _1070 = -(*spvDescriptorSet0.vp_c9)._m0[161].w;
    float _1072 = _870 + _1070;
    float _1074 = 1.0 / _1048;
    float _1076 = -(*spvDescriptorSet0.vp_c9)._m0[162].x;
    float _1078 = _1076 + (*spvDescriptorSet0.vp_c9)._m0[163].x;
    float _1080 = fma(_1068, _1072, (*spvDescriptorSet0.vp_c9)._m0[161].x);
    float _1082 = fma(_1066, _1020, _1060);
    float _1084 = -(*spvDescriptorSet0.vp_c9)._m0[163].x;
    float _1086 = (*spvDescriptorSet0.vp_c9)._m0[164].x + _1084;
    float _1088 = _1078 * _1036;
    float _1090 = -(*spvDescriptorSet0.vp_c9)._m0[162].w;
    float _1092 = _870 + _1090;
    float _1094 = 1.0 / _1064;
    float _1096 = fma(_1080, _996, _1082);
    float _1098 = _1086 * _1054;
    float _1100 = -(*spvDescriptorSet0.vp_c9)._m0[163].w;
    float _1102 = _870 + _1100;
    float _1104 = -(*spvDescriptorSet0.vp_c9)._m0[164].x;
    float _1106 = _1104 + (*spvDescriptorSet0.vp_c9)._m0[165].x;
    float _1108 = fma(_1088, _1092, (*spvDescriptorSet0.vp_c9)._m0[162].x);
    float _1110 = -(*spvDescriptorSet0.vp_c9)._m0[164].w;
    float _1112 = _870 + _1110;
    float _1114 = fma(_1098, _1102, (*spvDescriptorSet0.vp_c9)._m0[163].x);
    float _1116 = _1106 * _1074;
    float _1118 = -(*spvDescriptorSet0.vp_c9)._m0[165].x;
    float _1120 = (*spvDescriptorSet0.vp_c9)._m0[166].x + _1118;
    bool _1122 = _870 >= (*spvDescriptorSet0.vp_c9)._m0[166].w;
    bool _1124 = isnan(_870);
    bool _1126 = _1122 || _1124;
    bool _1128 = isnan((*spvDescriptorSet0.vp_c9)._m0[166].w);
    bool _1130 = _1126 || _1128;
    float _1132 = float(_1130);
    float _1134 = fma(_1108, _974, _1096);
    float _1136 = fma(_1116, _1112, (*spvDescriptorSet0.vp_c9)._m0[164].x);
    float _1138 = -(*spvDescriptorSet0.vp_c9)._m0[165].w;
    float _1140 = _870 + _1138;
    float _1142 = -_1132;
    float _1144 = _1142 + 1.0;
    float _1146 = _1120 * _1094;
    float _1148 = fma(_1114, _960, _1134);
    float _1150 = _886 * _1144;
    float _1152 = fma(_1146, _1140, (*spvDescriptorSet0.vp_c9)._m0[165].x);
    float _1154 = fma(_1136, _926, _1148);
    float _1156 = fma(_1152, _1150, _1154);
    float _1158 = fma(_1132, (*spvDescriptorSet0.vp_c9)._m0[166].x, _1156);
    out.m_63.x = _1158;
    bool _1160 = !_936;
    float _1178;
    if (!_1160)
    {
        float _1162 = in.m_55.x;
        float _1164 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[14].y;
        float _1166 = _1162 * (*spvDescriptorSet0.vp_c9)._m0[15].y;
        float _1168 = fma(_1166, (*spvDescriptorSet0.vp_c9)._m0[14].y, _160);
        float _1170 = _1168 * _1164;
        float _1172 = floor(_1170);
        float _1174 = -_1172;
        float _1176 = _1170 + _1174;
        _1178 = _1176;
        _1180 = true;
    }
    else
    {
        float _1182 = float(_126);
        float _1184 = 1.0 / _1182;
        float _1186 = _160 * _1184;
        _1178 = _1186;
    }
    _1180 = false;
    float _1188 = _1178;
    float _1190 = -(*spvDescriptorSet0.vp_c9)._m0[167].w;
    float _1192 = _1188 + _1190;
    bool _1194 = _1188 >= (*spvDescriptorSet0.vp_c9)._m0[173].w;
    bool _1196 = isnan(_1188);
    bool _1198 = _1194 || _1196;
    bool _1200 = isnan((*spvDescriptorSet0.vp_c9)._m0[173].w);
    bool _1202 = _1198 || _1200;
    float _1204 = float(_1202);
    float _1206 = -(*spvDescriptorSet0.vp_c9)._m0[167].w;
    float _1208 = _1206 + (*spvDescriptorSet0.vp_c9)._m0[168].w;
    bool _1210 = _1188 >= (*spvDescriptorSet0.vp_c9)._m0[172].w;
    bool _1212 = isnan(_1188);
    bool _1214 = _1210 || _1212;
    bool _1216 = isnan((*spvDescriptorSet0.vp_c9)._m0[172].w);
    bool _1218 = _1214 || _1216;
    float _1220 = float(_1218);
    float _1222 = -(*spvDescriptorSet0.vp_c9)._m0[167].x;
    float _1224 = (*spvDescriptorSet0.vp_c9)._m0[168].x + _1222;
    bool _1226 = _1188 >= (*spvDescriptorSet0.vp_c9)._m0[171].w;
    bool _1228 = isnan(_1188);
    bool _1230 = _1226 || _1228;
    bool _1232 = isnan((*spvDescriptorSet0.vp_c9)._m0[171].w);
    bool _1234 = _1230 || _1232;
    float _1236 = float(_1234);
    float _1238 = -_1204;
    float _1240 = _1238 + 1.0;
    float _1242 = 1.0 / _1208;
    float _1244 = _1220 * _1240;
    float _1246 = -_1236;
    float _1248 = _1246 + 1.0;
    float _1250 = -(*spvDescriptorSet0.vp_c9)._m0[168].w;
    float _1252 = _1250 + (*spvDescriptorSet0.vp_c9)._m0[169].w;
    bool _1254 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[14].z;
    float _1256 = 1.0 / _1252;
    float _1258 = _1224 * _1242;
    float _1260 = -_1220;
    float _1262 = _1260 + 1.0;
    bool _1264 = _1188 >= (*spvDescriptorSet0.vp_c9)._m0[170].w;
    bool _1266 = isnan(_1188);
    bool _1268 = _1264 || _1266;
    bool _1270 = isnan((*spvDescriptorSet0.vp_c9)._m0[170].w);
    bool _1272 = _1268 || _1270;
    float _1274 = float(_1272);
    float _1276 = fma(_1258, _1192, (*spvDescriptorSet0.vp_c9)._m0[167].x);
    float _1278 = _1236 * _1262;
    bool _1280 = _1188 >= (*spvDescriptorSet0.vp_c9)._m0[169].w;
    bool _1282 = isnan(_1188);
    bool _1284 = _1280 || _1282;
    bool _1286 = isnan((*spvDescriptorSet0.vp_c9)._m0[169].w);
    bool _1288 = _1284 || _1286;
    float _1290 = float(_1288);
    float _1292 = _1274 * _1248;
    float _1294 = -_1274;
    float _1296 = _1294 + 1.0;
    float _1298 = -(*spvDescriptorSet0.vp_c9)._m0[169].w;
    float _1300 = _1298 + (*spvDescriptorSet0.vp_c9)._m0[170].w;
    bool _1302 = _1188 >= (*spvDescriptorSet0.vp_c9)._m0[168].w;
    bool _1304 = isnan(_1188);
    bool _1306 = _1302 || _1304;
    bool _1308 = isnan((*spvDescriptorSet0.vp_c9)._m0[168].w);
    bool _1310 = _1306 || _1308;
    float _1312 = float(_1310);
    float _1314 = _1290 * _1296;
    float _1316 = -_1290;
    float _1318 = _1316 + 1.0;
    float _1320 = -(*spvDescriptorSet0.vp_c9)._m0[170].w;
    float _1322 = _1320 + (*spvDescriptorSet0.vp_c9)._m0[171].w;
    float _1324 = 1.0 / _1300;
    bool _1326 = _1188 >= (*spvDescriptorSet0.vp_c9)._m0[167].w;
    bool _1328 = isnan(_1188);
    bool _1330 = _1326 || _1328;
    bool _1332 = isnan((*spvDescriptorSet0.vp_c9)._m0[167].w);
    bool _1334 = _1330 || _1332;
    float _1336 = float(_1334);
    float _1338 = _1312 * _1318;
    float _1340 = -_1312;
    float _1342 = _1340 + 1.0;
    float _1344 = -(*spvDescriptorSet0.vp_c9)._m0[171].w;
    float _1346 = _1344 + (*spvDescriptorSet0.vp_c9)._m0[172].w;
    float _1348 = -(*spvDescriptorSet0.vp_c9)._m0[168].x;
    float _1350 = _1348 + (*spvDescriptorSet0.vp_c9)._m0[169].x;
    float _1352 = _1336 * _1342;
    float _1354 = 1.0 / _1322;
    float _1356 = _1350 * _1256;
    float _1358 = _1276 * _1352;
    float _1360 = -_1336;
    float _1362 = _1360 + 1.0;
    float _1364 = -(*spvDescriptorSet0.vp_c9)._m0[172].w;
    float _1366 = _1364 + (*spvDescriptorSet0.vp_c9)._m0[173].w;
    float _1368 = -(*spvDescriptorSet0.vp_c9)._m0[168].w;
    float _1370 = _1188 + _1368;
    float _1372 = 1.0 / _1346;
    float _1374 = -(*spvDescriptorSet0.vp_c9)._m0[169].x;
    float _1376 = (*spvDescriptorSet0.vp_c9)._m0[170].x + _1374;
    float _1378 = fma(_1362, (*spvDescriptorSet0.vp_c9)._m0[167].x, _1358);
    float _1380 = -(*spvDescriptorSet0.vp_c9)._m0[173].w;
    float _1382 = _1380 + (*spvDescriptorSet0.vp_c9)._m0[174].w;
    float _1384 = fma(_1356, _1370, (*spvDescriptorSet0.vp_c9)._m0[168].x);
    float _1386 = _1376 * _1324;
    float _1388 = -(*spvDescriptorSet0.vp_c9)._m0[169].w;
    float _1390 = _1188 + _1388;
    float _1392 = 1.0 / _1366;
    float _1394 = -(*spvDescriptorSet0.vp_c9)._m0[170].x;
    float _1396 = _1394 + (*spvDescriptorSet0.vp_c9)._m0[171].x;
    float _1398 = fma(_1386, _1390, (*spvDescriptorSet0.vp_c9)._m0[169].x);
    float _1400 = fma(_1384, _1338, _1378);
    float _1402 = -(*spvDescriptorSet0.vp_c9)._m0[171].x;
    float _1404 = (*spvDescriptorSet0.vp_c9)._m0[172].x + _1402;
    float _1406 = _1396 * _1354;
    float _1408 = -(*spvDescriptorSet0.vp_c9)._m0[170].w;
    float _1410 = _1188 + _1408;
    float _1412 = 1.0 / _1382;
    float _1414 = fma(_1398, _1314, _1400);
    float _1416 = _1404 * _1372;
    float _1418 = -(*spvDescriptorSet0.vp_c9)._m0[171].w;
    float _1420 = _1188 + _1418;
    float _1422 = -(*spvDescriptorSet0.vp_c9)._m0[172].x;
    float _1424 = _1422 + (*spvDescriptorSet0.vp_c9)._m0[173].x;
    float _1426 = fma(_1406, _1410, (*spvDescriptorSet0.vp_c9)._m0[170].x);
    float _1428 = -(*spvDescriptorSet0.vp_c9)._m0[172].w;
    float _1430 = _1188 + _1428;
    float _1432 = fma(_1416, _1420, (*spvDescriptorSet0.vp_c9)._m0[171].x);
    float _1434 = _1424 * _1392;
    float _1436 = -(*spvDescriptorSet0.vp_c9)._m0[173].x;
    float _1438 = (*spvDescriptorSet0.vp_c9)._m0[174].x + _1436;
    bool _1440 = _1188 >= (*spvDescriptorSet0.vp_c9)._m0[174].w;
    bool _1442 = isnan(_1188);
    bool _1444 = _1440 || _1442;
    bool _1446 = isnan((*spvDescriptorSet0.vp_c9)._m0[174].w);
    bool _1448 = _1444 || _1446;
    float _1450 = float(_1448);
    float _1452 = fma(_1426, _1292, _1414);
    float _1454 = fma(_1434, _1430, (*spvDescriptorSet0.vp_c9)._m0[172].x);
    float _1456 = -(*spvDescriptorSet0.vp_c9)._m0[173].w;
    float _1458 = _1188 + _1456;
    float _1460 = -_1450;
    float _1462 = _1460 + 1.0;
    float _1464 = _1438 * _1412;
    float _1466 = fma(_1432, _1278, _1452);
    float _1468 = _1204 * _1462;
    float _1470 = fma(_1464, _1458, (*spvDescriptorSet0.vp_c9)._m0[173].x);
    float _1472 = fma(_1454, _1244, _1466);
    float _1474 = fma(_1470, _1468, _1472);
    float _1476 = fma(_1450, (*spvDescriptorSet0.vp_c9)._m0[174].x, _1474);
    out.m_65.x = _1476;
    bool _1478 = !_1254;
    float _1496;
    if (!_1478)
    {
        float _1480 = in.m_55.x;
        float _1482 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[14].z;
        float _1484 = _1480 * (*spvDescriptorSet0.vp_c9)._m0[15].z;
        float _1486 = fma(_1484, (*spvDescriptorSet0.vp_c9)._m0[14].z, _160);
        float _1488 = _1486 * _1482;
        float _1490 = floor(_1488);
        float _1492 = -_1490;
        float _1494 = _1488 + _1492;
        _1496 = _1494;
        _1498 = true;
    }
    else
    {
        float _1500 = float(_126);
        float _1502 = 1.0 / _1500;
        float _1504 = _160 * _1502;
        _1496 = _1504;
    }
    _1498 = false;
    float _1506 = _1496;
    float _1508 = -(*spvDescriptorSet0.vp_c9)._m0[175].w;
    float _1510 = _1506 + _1508;
    bool _1512 = _1506 >= (*spvDescriptorSet0.vp_c9)._m0[181].w;
    bool _1514 = isnan(_1506);
    bool _1516 = _1512 || _1514;
    bool _1518 = isnan((*spvDescriptorSet0.vp_c9)._m0[181].w);
    bool _1520 = _1516 || _1518;
    float _1522 = float(_1520);
    float _1524 = -(*spvDescriptorSet0.vp_c9)._m0[175].w;
    float _1526 = _1524 + (*spvDescriptorSet0.vp_c9)._m0[176].w;
    bool _1528 = _1506 >= (*spvDescriptorSet0.vp_c9)._m0[180].w;
    bool _1530 = isnan(_1506);
    bool _1532 = _1528 || _1530;
    bool _1534 = isnan((*spvDescriptorSet0.vp_c9)._m0[180].w);
    bool _1536 = _1532 || _1534;
    float _1538 = float(_1536);
    float _1540 = -(*spvDescriptorSet0.vp_c9)._m0[175].x;
    float _1542 = (*spvDescriptorSet0.vp_c9)._m0[176].x + _1540;
    bool _1544 = _1506 >= (*spvDescriptorSet0.vp_c9)._m0[179].w;
    bool _1546 = isnan(_1506);
    bool _1548 = _1544 || _1546;
    bool _1550 = isnan((*spvDescriptorSet0.vp_c9)._m0[179].w);
    bool _1552 = _1548 || _1550;
    float _1554 = float(_1552);
    float _1556 = -_1522;
    float _1558 = _1556 + 1.0;
    float _1560 = 1.0 / _1526;
    float _1562 = _1538 * _1558;
    float _1564 = -_1554;
    float _1566 = _1564 + 1.0;
    float _1568 = -(*spvDescriptorSet0.vp_c9)._m0[176].w;
    float _1570 = _1568 + (*spvDescriptorSet0.vp_c9)._m0[177].w;
    bool _1572 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[14].w;
    float _1574 = 1.0 / _1570;
    float _1576 = _1542 * _1560;
    float _1578 = -_1538;
    float _1580 = _1578 + 1.0;
    bool _1582 = _1506 >= (*spvDescriptorSet0.vp_c9)._m0[178].w;
    bool _1584 = isnan(_1506);
    bool _1586 = _1582 || _1584;
    bool _1588 = isnan((*spvDescriptorSet0.vp_c9)._m0[178].w);
    bool _1590 = _1586 || _1588;
    float _1592 = float(_1590);
    float _1594 = fma(_1576, _1510, (*spvDescriptorSet0.vp_c9)._m0[175].x);
    float _1596 = _1554 * _1580;
    bool _1598 = _1506 >= (*spvDescriptorSet0.vp_c9)._m0[177].w;
    bool _1600 = isnan(_1506);
    bool _1602 = _1598 || _1600;
    bool _1604 = isnan((*spvDescriptorSet0.vp_c9)._m0[177].w);
    bool _1606 = _1602 || _1604;
    float _1608 = float(_1606);
    float _1610 = _1592 * _1566;
    float _1612 = -_1592;
    float _1614 = _1612 + 1.0;
    float _1616 = -(*spvDescriptorSet0.vp_c9)._m0[177].w;
    float _1618 = _1616 + (*spvDescriptorSet0.vp_c9)._m0[178].w;
    bool _1620 = _1506 >= (*spvDescriptorSet0.vp_c9)._m0[176].w;
    bool _1622 = isnan(_1506);
    bool _1624 = _1620 || _1622;
    bool _1626 = isnan((*spvDescriptorSet0.vp_c9)._m0[176].w);
    bool _1628 = _1624 || _1626;
    float _1630 = float(_1628);
    float _1632 = _1608 * _1614;
    float _1634 = -_1608;
    float _1636 = _1634 + 1.0;
    float _1638 = -(*spvDescriptorSet0.vp_c9)._m0[178].w;
    float _1640 = _1638 + (*spvDescriptorSet0.vp_c9)._m0[179].w;
    float _1642 = 1.0 / _1618;
    bool _1644 = _1506 >= (*spvDescriptorSet0.vp_c9)._m0[175].w;
    bool _1646 = isnan(_1506);
    bool _1648 = _1644 || _1646;
    bool _1650 = isnan((*spvDescriptorSet0.vp_c9)._m0[175].w);
    bool _1652 = _1648 || _1650;
    float _1654 = float(_1652);
    float _1656 = _1630 * _1636;
    float _1658 = -_1630;
    float _1660 = _1658 + 1.0;
    float _1662 = -(*spvDescriptorSet0.vp_c9)._m0[179].w;
    float _1664 = _1662 + (*spvDescriptorSet0.vp_c9)._m0[180].w;
    float _1666 = -(*spvDescriptorSet0.vp_c9)._m0[176].x;
    float _1668 = _1666 + (*spvDescriptorSet0.vp_c9)._m0[177].x;
    float _1670 = _1654 * _1660;
    float _1672 = 1.0 / _1640;
    float _1674 = _1668 * _1574;
    float _1676 = _1594 * _1670;
    float _1678 = -_1654;
    float _1680 = _1678 + 1.0;
    float _1682 = -(*spvDescriptorSet0.vp_c9)._m0[180].w;
    float _1684 = _1682 + (*spvDescriptorSet0.vp_c9)._m0[181].w;
    float _1686 = -(*spvDescriptorSet0.vp_c9)._m0[176].w;
    float _1688 = _1506 + _1686;
    float _1690 = 1.0 / _1664;
    float _1692 = -(*spvDescriptorSet0.vp_c9)._m0[177].x;
    float _1694 = (*spvDescriptorSet0.vp_c9)._m0[178].x + _1692;
    float _1696 = fma(_1680, (*spvDescriptorSet0.vp_c9)._m0[175].x, _1676);
    float _1698 = -(*spvDescriptorSet0.vp_c9)._m0[181].w;
    float _1700 = _1698 + (*spvDescriptorSet0.vp_c9)._m0[182].w;
    float _1702 = fma(_1674, _1688, (*spvDescriptorSet0.vp_c9)._m0[176].x);
    float _1704 = _1694 * _1642;
    float _1706 = -(*spvDescriptorSet0.vp_c9)._m0[177].w;
    float _1708 = _1506 + _1706;
    float _1710 = 1.0 / _1684;
    float _1712 = -(*spvDescriptorSet0.vp_c9)._m0[178].x;
    float _1714 = _1712 + (*spvDescriptorSet0.vp_c9)._m0[179].x;
    float _1716 = fma(_1704, _1708, (*spvDescriptorSet0.vp_c9)._m0[177].x);
    float _1718 = fma(_1702, _1656, _1696);
    float _1720 = -(*spvDescriptorSet0.vp_c9)._m0[179].x;
    float _1722 = (*spvDescriptorSet0.vp_c9)._m0[180].x + _1720;
    float _1724 = _1714 * _1672;
    float _1726 = -(*spvDescriptorSet0.vp_c9)._m0[178].w;
    float _1728 = _1506 + _1726;
    float _1730 = 1.0 / _1700;
    float _1732 = fma(_1716, _1632, _1718);
    float _1734 = _1722 * _1690;
    float _1736 = -(*spvDescriptorSet0.vp_c9)._m0[179].w;
    float _1738 = _1506 + _1736;
    float _1740 = -(*spvDescriptorSet0.vp_c9)._m0[180].x;
    float _1742 = _1740 + (*spvDescriptorSet0.vp_c9)._m0[181].x;
    float _1744 = fma(_1724, _1728, (*spvDescriptorSet0.vp_c9)._m0[178].x);
    float _1746 = -(*spvDescriptorSet0.vp_c9)._m0[180].w;
    float _1748 = _1506 + _1746;
    float _1750 = fma(_1734, _1738, (*spvDescriptorSet0.vp_c9)._m0[179].x);
    float _1752 = _1742 * _1710;
    float _1754 = -(*spvDescriptorSet0.vp_c9)._m0[181].x;
    float _1756 = (*spvDescriptorSet0.vp_c9)._m0[182].x + _1754;
    bool _1758 = _1506 >= (*spvDescriptorSet0.vp_c9)._m0[182].w;
    bool _1760 = isnan(_1506);
    bool _1762 = _1758 || _1760;
    bool _1764 = isnan((*spvDescriptorSet0.vp_c9)._m0[182].w);
    bool _1766 = _1762 || _1764;
    float _1768 = float(_1766);
    float _1770 = fma(_1744, _1610, _1732);
    float _1772 = fma(_1752, _1748, (*spvDescriptorSet0.vp_c9)._m0[180].x);
    float _1774 = -(*spvDescriptorSet0.vp_c9)._m0[181].w;
    float _1776 = _1506 + _1774;
    float _1778 = -_1768;
    float _1780 = _1778 + 1.0;
    float _1782 = _1756 * _1730;
    float _1784 = fma(_1750, _1596, _1770);
    float _1786 = _1522 * _1780;
    float _1788 = fma(_1782, _1776, (*spvDescriptorSet0.vp_c9)._m0[181].x);
    float _1790 = fma(_1772, _1562, _1784);
    float _1792 = fma(_1788, _1786, _1790);
    float _1794 = fma(_1768, (*spvDescriptorSet0.vp_c9)._m0[182].x, _1792);
    out.m_67.x = _1794;
    bool _1796 = !_1572;
    float _1798 = _1710;
    float _1800 = (*spvDescriptorSet0.vp_c9)._m0[178].x;
    float _1802 = _1730;
    float _1804 = _1718;
    float _1806 = _1522;
    float _1808 = _1562;
    float _1826;
    if (!_1796)
    {
        float _1810 = in.m_55.x;
        float _1812 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[14].w;
        float _1814 = _1810 * (*spvDescriptorSet0.vp_c9)._m0[15].w;
        float _1816 = fma(_1814, (*spvDescriptorSet0.vp_c9)._m0[14].w, _160);
        float _1818 = _1816 * _1812;
        float _1820 = floor(_1818);
        float _1822 = -_1820;
        float _1824 = _1818 + _1822;
        _1826 = _1824;
        _1828 = true;
    }
    else
    {
        float _1830 = float(_126);
        float _1832 = 1.0 / _1830;
        float _1834 = _160 * _1832;
        _1826 = _1834;
    }
    _1828 = false;
    float _1836 = _1826;
    float _1838 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].y);
    int _1840 = int(_1838);
    float _1842 = float(_126);
    float _1844 = in.m_69.x;
    float _1846 = in.m_55.y;
    int _1848 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _1850 = _1848 != 0;
    float _1852 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].x);
    int _1854 = int(_1852);
    int _1856 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _1858 = _1856 != 0;
    float _1860 = float(_1840);
    float _1862 = trunc((*spvDescriptorSet0.vp_c9)._m0[31].y);
    int _1864 = int(_1862);
    if (_1850)
    {
        float _1866 = in.m_55.x;
        _1798 = _1866;
    }
    float _1868 = _1798;
    float _1870 = float(uint(_1854));
    float _1872 = 1.0 / _1860;
    float _1874 = float(_1854);
    if (_1858)
    {
        float _1876 = in.m_55.z;
        _1800 = _1876;
    }
    float _1878 = _1800;
    int _1880 = ~_1854;
    int _1882 = _1880 + 1;
    float _1884 = 0.0;
    int _1886 = as_type<int>(_1878);
    float _1888 = _1844;
    if (!_1850)
    {
        _1884 = _1844;
    }
    float _1890 = _1884;
    float _1892 = trunc((*spvDescriptorSet0.vp_c9)._m0[40].y);
    int _1894 = int(_1892);
    float _1896 = float(_1864);
    int _1898 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _1900 = _1898 != 0;
    float _1902 = _1872 * _160;
    float _1904 = 1.0 / _1870;
    float _1906 = float(_1894);
    float _1908 = trunc(_1902);
    int _1910 = int(_1908);
    float _1912 = _1890;
    bool _1914 = _1900;
    if (_1900)
    {
        float _1916 = in.m_55.x;
        _1802 = _1916;
    }
    float _1918 = _1802;
    int _1920 = 0;
    float _1922 = _1918;
    if (_1900)
    {
        _1920 = 0;
    }
    int _1924 = _1920;
    int _1926 = 0;
    int _1928 = _1924;
    if (_1900)
    {
        _1926 = 0;
    }
    int _1930 = _1926;
    float _1932 = _1690;
    int _1934 = _1930;
    if (_1900)
    {
        float _1936 = in.m_55.z;
        _1932 = _1936;
    }
    float _1938 = _1932;
    float _1940 = 1.0 / _1896;
    int _1942 = as_type<int>(_1904) + (-2);
    float _1944 = _1874 * _160;
    if (_1900)
    {
        _1804 = 1.0;
    }
    float _1946 = _1804;
    float _1948 = _1946;
    if (_1900)
    {
        _1806 = 1.0;
    }
    float _1950 = _1806;
    float _1952 = _1950;
    if (_1900)
    {
        _1808 = 1.0;
    }
    float _1954 = _1808;
    float _1956 = 1.0 / _1906;
    float _1958 = float(uint(_1910));
    int _1960 = 0;
    float _1962 = _1954;
    if (_1900)
    {
        _1960 = as_type<int>(_1846);
    }
    int _1964 = _1960;
    float _1966 = 1.0 / _1842;
    float _1968 = as_type<float>(_1942) * _1958;
    float _1970 = _1940 * _160;
    int _1972 = as_type<int>(_1940);
    float _1974 = _1938;
    int _1976 = _1964;
    if (_1900)
    {
        _1972 = as_type<int>(_1938);
    }
    int _1978 = _1972;
    float _1980 = trunc(_1968);
    float _1982 = precise::max(_1980, 0.0);
    uint _1985 = uint(_1982);
    float _1987 = trunc((*spvDescriptorSet0.vp_c9)._m0[31].x);
    int _1989 = int(_1987);
    float _1991 = float(_1910);
    float _1993 = _1944 * _1966;
    float _1995 = in.m_55.w;
    bool _1997 = _1991 >= _1874;
    bool _1999 = isnan(_1991);
    bool _2001 = _1997 || _1999;
    bool _2003 = isnan(_1874);
    bool _2005 = _2001 || _2003;
    float _2007 = float(_2005);
    float _2009 = trunc((*spvDescriptorSet0.vp_c9)._m0[40].x);
    int _2011 = int(_2009);
    int _2013 = _1882 * int(_1985);
    int _2015 = _2013 + _1910;
    float _2017 = float(uint(_2015));
    float _2019 = trunc((*spvDescriptorSet0.vp_c9)._m0[49].x);
    int _2021 = int(_2019);
    float _2023 = float(uint(_1989));
    float _2025 = as_type<float>(_1942) * _2017;
    float _2027 = _2017;
    float _2029 = as_type<float>(_2015);
    int _2031 = _1978;
    int _2033 = as_type<int>(_2025);
    if (_1900)
    {
        _2027 = _1918;
    }
    float _2035 = _2027;
    float _2037 = trunc((*spvDescriptorSet0.vp_c9)._m0[49].y);
    int _2039 = int(_2037);
    float _2041 = float(uint(_2011));
    float _2043 = _2035;
    if (_1900)
    {
        _2029 = _2035;
    }
    float _2045 = _2029;
    int _2047 = 0;
    float _2049 = _2045;
    if (_1900)
    {
        _2047 = as_type<int>(_2035);
    }
    int _2051 = _2047;
    float _2053 = float(uint(_2021));
    float _2055 = 1.0 / _2023;
    float _2057 = float(_2039);
    float _2059 = 1.0 / _2041;
    float _2061 = 1.0 / _2057;
    float _2063 = 1.0 / _2053;
    float _2065 = trunc(_1993);
    int _2067 = int(_2065);
    float _2069 = trunc(_1970);
    int _2071 = int(_2069);
    float _2073 = trunc(_2007);
    int _2075 = int(_2073);
    float _2077 = trunc(_2025);
    float _2079 = precise::max(_2077, 0.0);
    uint _2081 = uint(_2079);
    int _2083 = _2051;
    int _2085 = int(_2081);
    if (!_1900)
    {
        float _2087 = in.m_55.x;
        float _2089 = _1846 * 3.1415927410125732421875;
        float _2091 = in.m_55.z;
        float _2093 = _2089 * 0.15915493667125701904296875;
        float _2095 = _2093 * 6.283185482025146484375;
        float _2097 = sin(_2095);
        float _2099 = _2087 * 3.1415927410125732421875;
        float _2101 = _2099 * 0.15915493667125701904296875;
        float _2103 = _2091 * 3.1415927410125732421875;
        float _2105 = _2103 * 0.15915493667125701904296875;
        float _2107 = _2101 * 6.283185482025146484375;
        float _2109 = sin(_2107);
        float _2111 = _2105 * 6.283185482025146484375;
        float _2113 = sin(_2111);
        _1952 = 1.2345600128173828125;
        _2043 = _1846;
        _1948 = 7.345489978790283203125;
        _1922 = _2087;
        _1962 = 5.839270114898681640625;
        _2049 = _2091;
        _1974 = _2091;
        _1928 = 1;
        _1934 = 2;
        _1976 = as_type<int>(_2097);
        _2083 = as_type<int>(_2109);
        _2031 = as_type<int>(_2113);
    }
    float _2115 = _1952;
    float _2117 = _2043;
    float _2119 = _1948;
    float _2121 = _1922;
    float _2123 = _1962;
    float _2125 = _2049;
    float _2127 = _1974;
    int _2129 = _1928;
    int _2131 = _1934;
    int _2133 = _1976;
    int _2135 = _2083;
    int _2137 = _2031;
    int _2139 = as_type<int>(_2119);
    if (_1850)
    {
        float _2141 = -_1844;
        float _2143 = _2141 + 1.0;
        _2033 = as_type<int>(_2143);
    }
    int _2145 = _2033;
    bool _2147 = false;
    if (_1850)
    {
        bool _2149 = _1868 > 0.5;
        _2147 = _2149;
    }
    bool _2151 = _2147;
    float _2153 = _2115 * _2117;
    int _2155 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 16;
    bool _2157 = _2155 != 0;
    float _2159 = _2119 * _2121;
    if (_1850)
    {
        float _2161 = _2151 ? as_type<float>(_2145) : _1844;
        _1912 = _2161;
    }
    float _2163 = _1912;
    float _2165 = _2123 * _2125;
    int _2167 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 64;
    bool _2169 = _2167 != 0;
    float _2171 = _2119 * _2117;
    int _2173 = int(_1985) + int(_2081);
    float _2175 = floor(_2153);
    int _2177 = ~_1854;
    int _2179 = _2177 + 1;
    float _2181 = in.m_69.y;
    int _2183 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 256;
    bool _2185 = _2183 != 0;
    if (_1858)
    {
        bool _2187 = _1878 > 0.5;
        _1914 = _2187;
    }
    bool _2189 = _1914;
    if (_1858)
    {
        float _2191 = -_1844;
        float _2193 = _2191 + 1.0;
        _1886 = as_type<int>(_2193);
    }
    int _2195 = _1886;
    int _2197 = _2179 * _2173;
    int _2199 = _2197 + _1910;
    if (_2157)
    {
        float _2201 = -_1844;
        float _2203 = _2201 + 1.0;
        _2085 = as_type<int>(_2203);
    }
    int _2205 = _2085;
    bool _2207 = _1846 > 0.5;
    float _2209 = as_type<float>(_2205);
    if (_2169)
    {
        float _2211 = -_1844;
        float _2213 = _2211 + 1.0;
        _2139 = as_type<int>(_2213);
    }
    int _2215 = _2139;
    float _2217 = 0.0;
    if (!_1858)
    {
        _2217 = _1844;
    }
    float _2219 = _2217;
    float _2221 = floor(_2165);
    float _2223 = _2219;
    if (_1858)
    {
        float _2225 = _2189 ? as_type<float>(_2195) : _1844;
        _2223 = _2225;
    }
    float _2227 = _2223;
    float _2229 = 0.0;
    if (!_2157)
    {
        _2229 = _1844;
    }
    float _2231 = _2229;
    int _2233 = 0;
    float _2235 = _2231;
    if (_2185)
    {
        float _2237 = -_1844;
        float _2239 = _2237 + 1.0;
        _2233 = as_type<int>(_2239);
    }
    int _2241 = _2233;
    bool _2243 = uint(_2199) >= uint(_1854);
    float _2245 = _1956 * _160;
    if (_2157)
    {
        float _2247 = _2207 ? as_type<float>(_2205) : _1844;
        _2235 = _2247;
    }
    float _2249 = _2235;
    float _2251 = floor(_2159);
    if (!_2169)
    {
        _2209 = _1844;
    }
    float _2253 = _2209;
    float _2255 = _2253;
    if (_2169)
    {
        float _2257 = _2207 ? as_type<float>(_2215) : _1844;
        _2255 = _2257;
    }
    float _2259 = _2255;
    bool _2261 = !_2243;
    int _2263 = _2261 ? 0 : (-1);
    if (_2185)
    {
        float _2265 = _2207 ? as_type<float>(_2241) : _1844;
        _1888 = _2265;
    }
    float _2267 = _1888;
    float _2269 = floor(_2171);
    int _2271 = ~_2173;
    int _2273 = _2271 + _2263;
    int _2275 = _2273 + 1;
    float _2277 = _2061 * _160;
    int _2279 = as_type<int>(_2055) + (-2);
    float _2281 = -_2175;
    float _2283 = _2153 + _2281;
    float _2285 = float(uint(_2071));
    int _2287 = _1854 * _2275;
    int _2289 = _2287 + _1910;
    bool _2291 = _1854 == 0;
    float _2293 = trunc(_2245);
    int _2295 = int(_2293);
    float _2297 = -_2221;
    float _2299 = _2165 + _2297;
    float _2301 = as_type<float>(_2279) * _2285;
    float _2303 = -_2251;
    float _2305 = _2159 + _2303;
    int _2307 = ~_2075;
    int _2309 = _2307 + 1;
    int _2311 = _2309 + 1;
    bool _2313 = !_2291;
    int _2315 = _2313 ? _2289 : (-1);
    float _2317 = _2305 * _1874;
    float _2319 = trunc(_2301);
    float _2321 = precise::max(_2319, 0.0);
    uint _2323 = uint(_2321);
    int _2325 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4096;
    bool _2327 = _2325 != 0;
    float _2329 = -_2269;
    float _2331 = _2171 + _2329;
    int _2333 = _2315 * _2311;
    bool _2335 = !_2327;
    int _2337 = _2335 ? 0 : 1;
    int _2339 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 16;
    bool _2341 = _2339 != 0;
    int _2343 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 32;
    bool _2345 = _2343 != 0;
    int _2347 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 64;
    bool _2349 = _2347 != 0;
    float _2351 = trunc(_2277);
    int _2353 = int(_2351);
    int _2355 = abs(_2337);
    int _2357 = ~_1989;
    int _2359 = _2357 + 1;
    bool _2361 = !_2345;
    int _2363 = _2361 ? 0 : 1;
    int _2365 = as_type<int>(_2059) + (-2);
    float _2367 = trunc(_2317);
    int _2369 = int(_2367);
    float _2371 = float(uint(_2295));
    int _2373 = abs(_2363);
    int _2375 = _2359 * int(_2323);
    int _2377 = _2375 + _2071;
    int _2379 = _1854 + (-1);
    float _2381 = as_type<float>(_2365) * _2371;
    int _2383 = as_type<int>(_2063) + (-2);
    float _2385 = float(uint(_2377));
    int _2387 = _2075 * _2379;
    int _2389 = _2387 + _2333;
    float _2391 = float(uint(_2353));
    float _2393 = trunc(_2381);
    float _2395 = precise::max(_2393, 0.0);
    uint _2397 = uint(_2395);
    bool _2399 = !_2341;
    int _2401 = _2399 ? 0 : 1;
    int _2403 = _2389 * _2373;
    float _2405 = as_type<float>(_2279) * _2385;
    float _2407 = as_type<float>(_2383) * _2391;
    int _2409 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 128;
    bool _2411 = _2409 != 0;
    int _2413 = _2369 * _2355;
    int _2415 = _2413 + _1910;
    bool _2417 = !_2349;
    int _2419 = _2417 ? 0 : 1;
    float _2421 = trunc(_2405);
    float _2423 = precise::max(_2421, 0.0);
    uint _2425 = uint(_2423);
    int _2427 = abs(_2401);
    bool _2429 = !_2411;
    int _2431 = _2429 ? 0 : 1;
    int _2433 = abs(_2419);
    float _2435 = trunc(_2407);
    float _2437 = precise::max(_2435, 0.0);
    uint _2439 = uint(_2437);
    int _2441 = ~_2011;
    int _2443 = _2441 + 1;
    int _2445 = abs(_2431);
    int _2447 = _2067 * _2427;
    int _2449 = _2447 + _2403;
    int _2451 = _2443 * int(_2397);
    int _2453 = _2451 + _2295;
    int _2455 = ~_2021;
    int _2457 = _2455 + 1;
    float _2459 = _1966 * _160;
    int _2461 = int(_2323) + int(_2425);
    int _2463 = _2415 * _2433;
    int _2465 = _2463 + _2449;
    float _2467 = float(uint(_2453));
    float _2469 = float(_2071);
    int _2471 = _2369 * _2445;
    int _2473 = _2471 + _2465;
    float _2475 = float(_2021);
    float _2477 = as_type<float>(_2365) * _2467;
    int _2479 = _2457 * int(_2439);
    int _2481 = _2479 + _2353;
    float _2483 = float(_2295);
    float _2485 = float(uint(_2473));
    float _2487 = trunc(_2477);
    float _2489 = precise::max(_2487, 0.0);
    uint _2491 = uint(_2489);
    float _2493 = float(uint(_2481));
    float _2495 = float(_1989);
    int _2497 = ~_1989;
    int _2499 = _2497 + 1;
    float _2501 = as_type<float>(_2383) * _2493;
    float _2503 = float(_2011);
    float _2505 = _2495 * _2283;
    float _2507 = as_type<float>(_1942) * _2485;
    float _2509 = trunc(_2501);
    float _2511 = precise::max(_2509, 0.0);
    uint _2513 = uint(_2511);
    int _2515 = ~_1854;
    int _2517 = _2515 + 1;
    float _2519 = _2495 * _2459;
    bool _2521 = _2469 >= _2495;
    bool _2523 = isnan(_2469);
    bool _2525 = _2521 || _2523;
    bool _2527 = isnan(_2495);
    bool _2529 = _2525 || _2527;
    float _2531 = float(_2529);
    float _2533 = _2503 * _2299;
    bool _2535 = _2483 >= _2503;
    bool _2537 = isnan(_2483);
    bool _2539 = _2535 || _2537;
    bool _2541 = isnan(_2503);
    bool _2543 = _2539 || _2541;
    float _2545 = float(_2543);
    float _2547 = _2503 * _2459;
    float _2549 = _2475 * _2459;
    float _2551 = trunc(_2507);
    float _2553 = precise::max(_2551, 0.0);
    uint _2555 = uint(_2553);
    float _2557 = float(_2353);
    float _2559 = _2475 * _2331;
    bool _2561 = _2557 >= _2475;
    bool _2563 = isnan(_2557);
    bool _2565 = _2561 || _2563;
    bool _2567 = isnan(_2475);
    bool _2569 = _2565 || _2567;
    float _2571 = float(_2569);
    int _2573 = _2499 * _2461;
    int _2575 = _2573 + _2071;
    int _2577 = ~_2011;
    int _2579 = _2577 + 1;
    float _2581 = trunc(_2531);
    int _2583 = int(_2581);
    int _2585 = int(_2397) + int(_2491);
    bool _2587 = uint(_2575) >= uint(_1989);
    int _2589 = int(_2439) + int(_2513);
    int _2591 = _2517 * int(_2555);
    int _2593 = _2591 + _2473;
    int _2595 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8192;
    bool _2597 = _2595 != 0;
    int _2599 = _2579 * _2585;
    int _2601 = _2599 + _2295;
    int _2603 = ~_2021;
    int _2605 = _2603 + 1;
    float _2607 = trunc(_2505);
    int _2609 = int(_2607);
    float _2611 = float(uint(_2593));
    int _2613 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 256;
    bool _2615 = _2613 != 0;
    int _2617 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 512;
    bool _2619 = _2617 != 0;
    int _2621 = _2605 * _2589;
    int _2623 = _2621 + _2353;
    bool _2625 = uint(_2601) >= uint(_2011);
    float _2627 = as_type<float>(_1942) * _2611;
    bool _2629 = !_2597;
    int _2631 = _2629 ? 0 : 1;
    float _2633 = trunc(_2545);
    int _2635 = int(_2633);
    bool _2637 = !_2587;
    int _2639 = _2637 ? 0 : (-1);
    bool _2641 = !_2619;
    int _2643 = _2641 ? 0 : 1;
    int _2645 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1024;
    bool _2647 = _2645 != 0;
    int _2649 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 2048;
    bool _2651 = _2649 != 0;
    bool _2653 = !_2615;
    int _2655 = _2653 ? 0 : 1;
    float _2657 = trunc(_2627);
    float _2659 = precise::max(_2657, 0.0);
    uint _2661 = uint(_2659);
    bool _2663 = uint(_2623) >= uint(_2021);
    int _2665 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 16384;
    bool _2667 = _2665 != 0;
    bool _2669 = !_2625;
    int _2671 = _2669 ? 0 : (-1);
    int _2673 = ~_2461;
    int _2675 = _2673 + _2639;
    int _2677 = _2675 + 1;
    float _2679 = trunc(_2549);
    int _2681 = int(_2679);
    int _2683 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 4096;
    bool _2685 = _2683 != 0;
    int _2687 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 8192;
    bool _2689 = _2687 != 0;
    bool _2691 = !_2667;
    int _2693 = _2691 ? 0 : 1;
    int _2695 = _1989 * _2677;
    int _2697 = _2695 + _2071;
    bool _2699 = !_2647;
    int _2701 = _2699 ? 0 : 1;
    bool _2703 = !_2651;
    int _2705 = _2703 ? 0 : 1;
    float _2707 = trunc(_2559);
    int _2709 = int(_2707);
    int _2711 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 16384;
    bool _2713 = _2711 != 0;
    bool _2715 = _1989 == 0;
    int _2717 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 32768;
    bool _2719 = _2717 != 0;
    int _2721 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 32768;
    bool _2723 = _2721 != 0;
    int _2725 = abs(_2631);
    bool _2727 = !_2713;
    int _2729 = _2727 ? 0 : 1;
    bool _2731 = !_2663;
    int _2733 = _2731 ? 0 : (-1);
    int _2735 = _2609 * _2725;
    int _2737 = _2735 + _2071;
    int _2739 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 65536;
    bool _2741 = _2739 != 0;
    int _2743 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 131072;
    bool _2745 = _2743 != 0;
    int _2747 = ~_2585;
    int _2749 = _2747 + _2671;
    int _2751 = _2749 + 1;
    int _2753 = ~_2583;
    int _2755 = _2753 + 1;
    int _2757 = _2755 + 1;
    bool _2759 = !_2715;
    int _2761 = _2759 ? _2697 : (-1);
    int _2763 = _2011 * _2751;
    int _2765 = _2763 + _2295;
    int _2767 = int(_2555) + int(_2661);
    float _2769 = trunc(_2571);
    int _2771 = int(_2769);
    int _2773 = ~_1854;
    int _2775 = _2773 + 1;
    int _2777 = _2757 * _2761;
    bool _2779 = !_2745;
    int _2781 = _2779 ? 0 : 1;
    bool _2783 = _2011 == 0;
    int _2785 = _2775 * _2767;
    int _2787 = _2785 + _2473;
    int _2789 = _1989 + (-1);
    int _2791 = ~_2635;
    int _2793 = _2791 + 1;
    int _2795 = _2793 + 1;
    bool _2797 = !_2783;
    int _2799 = _2797 ? _2765 : (-1);
    int _2801 = _2583 * _2789;
    int _2803 = _2801 + _2777;
    int _2805 = ~_2589;
    int _2807 = _2805 + _2733;
    int _2809 = _2807 + 1;
    float _2811 = trunc(_2519);
    int _2813 = int(_2811);
    bool _2815 = !_2723;
    int _2817 = _2815 ? 0 : 1;
    int _2819 = _2795 * _2799;
    int _2821 = abs(_2643);
    int _2823 = _2021 * _2809;
    int _2825 = _2823 + _2353;
    bool _2827 = uint(_2787) >= uint(_1854);
    int _2829 = abs(_2655);
    float _2831 = trunc(_2533);
    int _2833 = int(_2831);
    bool _2835 = !_2719;
    int _2837 = _2835 ? 0 : 1;
    bool _2839 = !_2827;
    int _2841 = _2839 ? 0 : (-1);
    int _2843 = _2803 * _2821;
    bool _2845 = !_2685;
    int _2847 = _2845 ? 0 : 1;
    float _2849 = trunc(_2547);
    int _2851 = int(_2849);
    int _2853 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 262144;
    bool _2855 = _2853 != 0;
    int _2857 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 524288;
    bool _2859 = _2857 != 0;
    bool _2861 = _2021 == 0;
    int _2863 = abs(_2701);
    int _2865 = _2011 + (-1);
    int _2867 = ~_2771;
    int _2869 = _2867 + 1;
    int _2871 = _2869 + 1;
    int _2873 = _2635 * _2865;
    int _2875 = _2873 + _2819;
    bool _2877 = !_2861;
    int _2879 = _2877 ? _2825 : (-1);
    int _2881 = _2813 * _2829;
    int _2883 = _2881 + _2843;
    float _2885 = _2121 * 2.0;
    int _2887 = abs(_2705);
    int _2889 = _2871 * _2879;
    int _2891 = abs(_2693);
    int _2893 = _2737 * _2863;
    int _2895 = _2893 + _2883;
    float _2897 = _1846 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    bool _2899 = !_2689;
    int _2901 = _2899 ? 0 : 1;
    int _2903 = abs(_2847);
    int _2905 = _2609 * _2887;
    int _2907 = _2905 + _2895;
    int _2909 = abs(_2901);
    float _2911 = float(uint(_2907));
    int _2913 = _2875 * _2909;
    int _2915 = abs(_2729);
    float _2917 = as_type<float>(_2279) * _2911;
    int _2919 = abs(_2837);
    int _2921 = _2851 * _2903;
    int _2923 = _2921 + _2913;
    float _2925 = trunc(_2917);
    float _2927 = precise::max(_2925, 0.0);
    uint _2929 = uint(_2927);
    int _2931 = _2833 * _2891;
    int _2933 = _2931 + _2295;
    int _2935 = abs(_2817);
    int _2937 = _2933 * _2915;
    int _2939 = _2937 + _2923;
    bool _2941 = !_2741;
    int _2943 = _2941 ? 0 : 1;
    int _2945 = _2021 + (-1);
    int _2947 = _2833 * _2919;
    int _2949 = _2947 + _2939;
    int _2951 = abs(_2781);
    int _2953 = ~_1989;
    int _2955 = _2953 + 1;
    int _2957 = _2771 * _2945;
    int _2959 = _2957 + _2889;
    int _2961 = abs(_2943);
    int _2963 = _2955 * int(_2929);
    int _2965 = _2963 + _2907;
    bool _2967 = !_2855;
    int _2969 = _2967 ? 0 : 1;
    int _2971 = _2959 * _2951;
    int _2973 = _2709 * _2935;
    int _2975 = _2973 + _2353;
    int _2977 = ~_2767;
    int _2979 = _2977 + _2841;
    int _2981 = _2979 + 1;
    float _2983 = float(uint(_2949));
    int _2985 = _2681 * _2961;
    int _2987 = _2985 + _2971;
    float _2989 = float(uint(_2965));
    int _2991 = _1854 * _2981;
    int _2993 = _2991 + _2473;
    bool _2995 = !_2859;
    int _2997 = _2995 ? 0 : 1;
    float _2999 = as_type<float>(_2365) * _2983;
    int _3001 = abs(_2969);
    float _3003 = as_type<float>(_2279) * _2989;
    int _3005 = abs(_2997);
    float _3007 = trunc(_2999);
    float _3009 = precise::max(_3007, 0.0);
    uint _3011 = uint(_3009);
    bool _3013 = _1854 == 0;
    int _3015 = _2975 * _3001;
    int _3017 = _3015 + _2987;
    float _3019 = -_2181;
    float _3021 = _3019 + 1.0;
    bool _3023 = _1995 > 0.5;
    float _3025 = trunc(_3003);
    float _3027 = precise::max(_3025, 0.0);
    uint _3029 = uint(_3027);
    bool _3031 = !_3013;
    int _3033 = _3031 ? _2993 : (-1);
    int _3035 = _2709 * _3005;
    int _3037 = _3035 + _3017;
    int _3039 = _3023 ? as_type<int>(_3021) : as_type<int>(_2181);
    int _3041 = _3033 & 3;
    bool _3043 = _3041 != 0;
    int _3045 = _3033 & 3;
    bool _3047 = _3045 != 0;
    int _3049 = ~_2011;
    int _3051 = _3049 + 1;
    float _3053 = float(uint(_3037));
    int _3055 = _3043 ? 0 : 1;
    int _3057 = _3051 * int(_3011);
    int _3059 = _3057 + _2949;
    bool _3061 = uint(_3045) > 1u;
    float _3063 = as_type<float>(_2383) * _3053;
    int _3065 = int(_2929) + int(_3029);
    int _3067 = ~_1989;
    int _3069 = _3067 + 1;
    float _3071 = trunc(_3063);
    float _3073 = precise::max(_3071, 0.0);
    uint _3075 = uint(_3073);
    float _3077 = float(uint(_3059));
    int _3079 = ~_3055;
    int _3081 = _3079 + 1;
    int _3083 = _3081 + 1;
    float _3085 = as_type<float>(_2365) * _3077;
    int _3087 = ~_2021;
    int _3089 = _3087 + 1;
    int _3091 = _3069 * _3065;
    int _3093 = _3091 + _2907;
    int _3095 = _3083;
    if (!_3061)
    {
        int _3097 = ~_3055;
        int _3099 = _3097 + 1;
        _3095 = _3099;
    }
    int _3101 = _3095;
    float _3103 = trunc(_3085);
    float _3105 = precise::max(_3103, 0.0);
    uint _3107 = uint(_3105);
    bool _3109 = uint(_3045) >= 2u;
    bool _3111 = _1846 > 0.5;
    int _3113 = _3109 ? 0 : 1;
    int _3115 = _3089 * int(_3075);
    int _3117 = _3115 + _3037;
    bool _3119 = uint(_3093) >= uint(_1989);
    int _3121 = ~_3113;
    int _3123 = _3121 + 1;
    int _3125 = _3123 + 1;
    bool _3127 = !_3119;
    int _3129 = _3127 ? 0 : (-1);
    bool _3131 = _3045 != 3;
    float _3133 = float(uint(_3117));
    int _3135 = ~_2011;
    int _3137 = _3135 + 1;
    int _3139 = int(_3011) + int(_3107);
    float _3141 = as_type<float>(_2383) * _3133;
    int _3143 = ~_3065;
    int _3145 = _3143 + _3129;
    int _3147 = _3145 + 1;
    float _3149 = trunc(_3141);
    float _3151 = precise::max(_3149, 0.0);
    uint _3153 = uint(_3151);
    int _3155 = _3137 * _3139;
    int _3157 = _3155 + _2949;
    int _3159 = _3125;
    if (_3131)
    {
        int _3161 = ~_3113;
        int _3163 = _3161 + 1;
        _3159 = _3163;
    }
    int _3165 = _3159;
    int _3167 = _1989 * _3147;
    int _3169 = _3167 + _2907;
    int _3171 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2097152;
    bool _3173 = _3171 != 0;
    float _3175 = -(*spvDescriptorSet0.vp_c9)._m0[184].w;
    float _3177 = _3175 + (*spvDescriptorSet0.vp_c9)._m0[185].w;
    bool _3179 = !_3173;
    int _3181 = _3179 ? 0 : 1;
    bool _3183 = uint(_3157) >= uint(_2011);
    float _3185 = -(*spvDescriptorSet0.vp_c9)._m0[185].w;
    float _3187 = _3185 + (*spvDescriptorSet0.vp_c9)._m0[186].w;
    bool _3189 = !_2715;
    int _3191 = _3189 ? _3169 : (-1);
    float _3193 = 1.0 / _3177;
    bool _3195 = !_3183;
    int _3197 = _3195 ? 0 : (-1);
    int _3199 = _3191 & 3;
    bool _3201 = _3199 != 0;
    int _3203 = _3111 ? as_type<int>(_3021) : as_type<int>(_2181);
    int _3205 = ~_3139;
    int _3207 = _3205 + _3197;
    int _3209 = _3207 + 1;
    float _3211 = 1.0 / _3187;
    bool _3213 = uint(_3199) >= 2u;
    int _3215 = _3201 ? 0 : 1;
    int _3217 = _2011 * _3209;
    int _3219 = _3217 + _2949;
    bool _3221 = _3199 != 3;
    int _3223 = _3213 ? 0 : 1;
    int _3225 = int(_3075) + int(_3153);
    bool _3227 = uint(_3199) > 1u;
    int _3229 = ~_2021;
    int _3231 = _3229 + 1;
    int _3233 = ~_3223;
    int _3235 = _3233 + 1;
    int _3237 = _3235 + 1;
    bool _3239 = !_2783;
    int _3241 = _3239 ? _3219 : (-1);
    int _3243 = _3231 * _3225;
    int _3245 = _3243 + _3037;
    int _3247 = _3237;
    if (_3221)
    {
        int _3249 = ~_3223;
        int _3251 = _3249 + 1;
        _3247 = _3251;
    }
    int _3253 = _3247;
    int _3255 = ~_3215;
    int _3257 = _3255 + 1;
    int _3259 = _3257 + 1;
    bool _3261 = uint(_3245) >= uint(_2021);
    int _3263 = _3259;
    if (!_3227)
    {
        int _3265 = ~_3215;
        int _3267 = _3265 + 1;
        _3263 = _3267;
    }
    int _3269 = _3263;
    int _3271 = _3241 & 3;
    bool _3273 = _3271 != 0;
    bool _3275 = !_3261;
    int _3277 = _3275 ? 0 : (-1);
    int _3279 = _3273 ? 0 : 1;
    bool _3281 = uint(_3271) >= 2u;
    bool _3283 = _3271 != 3;
    int _3285 = ~_3225;
    int _3287 = _3285 + _3277;
    int _3289 = _3287 + 1;
    int _3291 = _3281 ? 0 : 1;
    bool _3293 = uint(_3271) > 1u;
    int _3295 = _2021 * _3289;
    int _3297 = _3295 + _3037;
    int _3299 = ~_3291;
    int _3301 = _3299 + 1;
    int _3303 = _3301 + 1;
    int _3305 = ~_3279;
    int _3307 = _3305 + 1;
    int _3309 = _3307 + 1;
    bool _3311 = !_2861;
    int _3313 = _3311 ? _3297 : (-1);
    int _3315 = _3303;
    int _3317 = _3309;
    if (_3283)
    {
        int _3319 = ~_3291;
        int _3321 = _3319 + 1;
        _3315 = _3321;
    }
    int _3323 = _3315;
    int _3325 = _3313 & 3;
    bool _3327 = _3325 != 0;
    if (!_3293)
    {
        int _3329 = ~_3279;
        int _3331 = _3329 + 1;
        _3317 = _3331;
    }
    int _3333 = _3317;
    bool _3335 = uint(_3325) >= 2u;
    float _3337 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    int _3339 = _3327 ? 0 : 1;
    int _3341 = _3335 ? 0 : 1;
    float _3343 = fma(_2897, -2.0, _3337);
    bool _3345 = uint(_3325) > 1u;
    bool _3347 = _3325 != 3;
    float _3349 = fma(_160, (*spvDescriptorSet0.vp_c9)._m0[76].y, _3343);
    int _3351 = ~_3339;
    int _3353 = _3351 + 1;
    int _3355 = _3353 + 1;
    int _3357 = ~_3341;
    int _3359 = _3357 + 1;
    int _3361 = _3359 + 1;
    float _3363 = -(*spvDescriptorSet0.vp_c9)._m0[183].w;
    float _3365 = _3363 + (*spvDescriptorSet0.vp_c9)._m0[184].w;
    int _3367 = _3355;
    int _3369 = _3361;
    if (!_3345)
    {
        int _3371 = ~_3339;
        int _3373 = _3371 + 1;
        _3367 = _3373;
    }
    int _3375 = _3367;
    float _3377 = -(*spvDescriptorSet0.vp_c9)._m0[187].w;
    float _3379 = _3377 + (*spvDescriptorSet0.vp_c9)._m0[188].w;
    int _3381 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8388608;
    bool _3383 = _3381 != 0;
    float _3385 = -(*spvDescriptorSet0.vp_c9)._m0[188].w;
    float _3387 = _3385 + (*spvDescriptorSet0.vp_c9)._m0[189].w;
    if (_3347)
    {
        int _3389 = ~_3341;
        int _3391 = _3389 + 1;
        _3369 = _3391;
    }
    int _3393 = _3369;
    float _3395 = 1.0 / _3365;
    bool _3397 = !_3383;
    int _3399 = _3397 ? 0 : 1;
    float _3401 = in.m_46.x;
    float _3403 = in.m_46.y;
    float _3405 = in.m_46.z;
    int _3407 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4194304;
    bool _3409 = _3407 != 0;
    int _3411 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _3413 = _3411 != 0;
    bool _3415 = !_3409;
    int _3417 = _3415 ? 0 : 1;
    float _3419 = 1.0 / _3379;
    float _3421 = _3413 ? as_type<float>(_3203) : _2181;
    int _3423 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _3425 = _3423 != 0;
    bool _3427 = _2127 > 0.5;
    float _3429 = _3425 ? as_type<float>(_3039) : _2181;
    float _3431 = 1.0 / _3387;
    int _3433 = _3427 ? as_type<int>(_3021) : as_type<int>(_2181);
    int _3435 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 32;
    bool _3437 = _3435 != 0;
    int _3439 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 128;
    bool _3441 = _3439 != 0;
    float _3443 = _3437 ? as_type<float>(_3433) : _2181;
    float _3445 = _3441 ? as_type<float>(_3433) : _2181;
    float _3447 = _3403 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    int _3449 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 16777216;
    bool _3451 = _3449 != 0;
    float _3453 = _3403 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    int _3455 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 512;
    bool _3457 = _3455 != 0;
    float _3459 = _3403 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _3461 = floor(_2885);
    float _3463 = fma(_3401, (*spvDescriptorSet0.vp_c10)._m0[4].x, _3447);
    float _3465 = fma(_3401, (*spvDescriptorSet0.vp_c10)._m0[5].x, _3453);
    float _3467 = -(*spvDescriptorSet0.vp_c9)._m0[186].w;
    float _3469 = _3467 + (*spvDescriptorSet0.vp_c9)._m0[187].w;
    float _3471 = fma(_3401, (*spvDescriptorSet0.vp_c10)._m0[6].x, _3459);
    float _3473 = -(*spvDescriptorSet0.vp_c9)._m0[183].x;
    float _3475 = (*spvDescriptorSet0.vp_c9)._m0[184].x + _3473;
    float _3477 = -(*spvDescriptorSet0.vp_c9)._m0[184].x;
    float _3479 = _3477 + (*spvDescriptorSet0.vp_c9)._m0[185].x;
    float _3481 = -(*spvDescriptorSet0.vp_c9)._m0[185].x;
    float _3483 = (*spvDescriptorSet0.vp_c9)._m0[186].x + _3481;
    float _3485 = _3457 ? as_type<float>(_3433) : _2181;
    float _3487 = 1.0 / _3469;
    float _3489 = _3479 * _3193;
    float _3491 = -(*spvDescriptorSet0.vp_c9)._m0[189].w;
    float _3493 = _3491 + (*spvDescriptorSet0.vp_c9)._m0[190].w;
    bool _3495 = _3461 >= 0.0;
    bool _3497 = isnan(_3461);
    bool _3499 = _3495 || _3497;
    bool _3501 = isnan(0.0);
    bool _3503 = _3499 || _3501;
    float _3505 = _3483 * _3211;
    float _3507 = _1846 * 2.0;
    int _3509 = _3503 ? 0 : 1;
    float _3511 = 1.0 / _3493;
    bool _3513 = _3461 > 0.0;
    float _3515 = -(*spvDescriptorSet0.vp_c9)._m0[187].x;
    float _3517 = (*spvDescriptorSet0.vp_c9)._m0[188].x + _3515;
    float _3519 = -(*spvDescriptorSet0.vp_c9)._m0[188].x;
    float _3521 = _3519 + (*spvDescriptorSet0.vp_c9)._m0[189].x;
    float _3523 = _3475 * _3395;
    float _3525 = -(*spvDescriptorSet0.vp_c9)._m0[186].x;
    float _3527 = _3525 + (*spvDescriptorSet0.vp_c9)._m0[187].x;
    float _3529 = _3517 * _3419;
    float _3531 = floor(_3507);
    float _3533 = _3521 * _3431;
    bool _3535 = _1836 >= (*spvDescriptorSet0.vp_c9)._m0[189].w;
    bool _3537 = isnan(_1836);
    bool _3539 = _3535 || _3537;
    bool _3541 = isnan((*spvDescriptorSet0.vp_c9)._m0[189].w);
    bool _3543 = _3539 || _3541;
    float _3545 = float(_3543);
    float _3547 = _3527 * _3487;
    bool _3549 = _1836 >= (*spvDescriptorSet0.vp_c9)._m0[190].w;
    bool _3551 = isnan(_1836);
    bool _3553 = _3549 || _3551;
    bool _3555 = isnan((*spvDescriptorSet0.vp_c9)._m0[190].w);
    bool _3557 = _3553 || _3555;
    float _3559 = float(_3557);
    float _3561 = -(*spvDescriptorSet0.vp_c9)._m0[189].x;
    float _3563 = (*spvDescriptorSet0.vp_c9)._m0[190].x + _3561;
    int _3565 = ~_3509;
    int _3567 = _3565 + 1;
    int _3569 = _3567 + 1;
    float _3571 = -_3545;
    float _3573 = _3571 + 1.0;
    int _3575 = _3569;
    if (!_3513)
    {
        int _3577 = ~_3509;
        int _3579 = _3577 + 1;
        _3575 = _3579;
    }
    int _3581 = _3575;
    float _3583 = -_3559;
    float _3585 = _3583 + 1.0;
    bool _3587 = _1836 >= (*spvDescriptorSet0.vp_c9)._m0[188].w;
    bool _3589 = isnan(_1836);
    bool _3591 = _3587 || _3589;
    bool _3593 = isnan((*spvDescriptorSet0.vp_c9)._m0[188].w);
    bool _3595 = _3591 || _3593;
    float _3597 = float(_3595);
    float _3599 = _3563 * _3511;
    bool _3601 = _1836 >= (*spvDescriptorSet0.vp_c9)._m0[187].w;
    bool _3603 = isnan(_1836);
    bool _3605 = _3601 || _3603;
    bool _3607 = isnan((*spvDescriptorSet0.vp_c9)._m0[187].w);
    bool _3609 = _3605 || _3607;
    float _3611 = float(_3609);
    float _3613 = _3545 * _3585;
    float _3615 = fma(_3405, (*spvDescriptorSet0.vp_c10)._m0[5].z, _3465);
    float _3617 = _3597 * _3573;
    float _3619 = -_3597;
    float _3621 = _3619 + 1.0;
    float _3623 = fma(_3405, (*spvDescriptorSet0.vp_c10)._m0[4].z, _3463);
    float _3625 = fma(_3405, (*spvDescriptorSet0.vp_c10)._m0[6].z, _3471);
    bool _3627 = !_3451;
    int _3629 = _3627 ? 0 : 1;
    float _3631 = -(*spvDescriptorSet0.vp_c9)._m0[183].w;
    float _3633 = _1836 + _3631;
    bool _3635 = _1836 >= (*spvDescriptorSet0.vp_c9)._m0[186].w;
    bool _3637 = isnan(_1836);
    bool _3639 = _3635 || _3637;
    bool _3641 = isnan((*spvDescriptorSet0.vp_c9)._m0[186].w);
    bool _3643 = _3639 || _3641;
    float _3645 = float(_3643);
    float _3647 = -_3611;
    float _3649 = _3647 + 1.0;
    bool _3651 = _3531 > 0.0;
    float _3653 = fma(_3523, _3633, (*spvDescriptorSet0.vp_c9)._m0[183].x);
    bool _3655 = _3531 >= 0.0;
    bool _3657 = isnan(_3531);
    bool _3659 = _3655 || _3657;
    bool _3661 = isnan(0.0);
    bool _3663 = _3659 || _3661;
    float _3665 = _3611 * _3621;
    float _3667 = -(*spvDescriptorSet0.vp_c9)._m0[184].w;
    float _3669 = _1836 + _3667;
    bool _3671 = _1836 >= (*spvDescriptorSet0.vp_c9)._m0[185].w;
    bool _3673 = isnan(_1836);
    bool _3675 = _3671 || _3673;
    bool _3677 = isnan((*spvDescriptorSet0.vp_c9)._m0[185].w);
    bool _3679 = _3675 || _3677;
    float _3681 = float(_3679);
    float _3683 = -_3645;
    float _3685 = _3683 + 1.0;
    bool _3687 = _1836 >= (*spvDescriptorSet0.vp_c9)._m0[184].w;
    bool _3689 = isnan(_1836);
    bool _3691 = _3687 || _3689;
    bool _3693 = isnan((*spvDescriptorSet0.vp_c9)._m0[184].w);
    bool _3695 = _3691 || _3693;
    float _3697 = float(_3695);
    float _3699 = fma(_3489, _3669, (*spvDescriptorSet0.vp_c9)._m0[184].x);
    float _3701 = _3645 * _3649;
    float _3703 = -_3681;
    float _3705 = _3703 + 1.0;
    float _3707 = -(*spvDescriptorSet0.vp_c9)._m0[185].w;
    float _3709 = _1836 + _3707;
    float _3711 = _3681 * _3685;
    bool _3713 = _1836 >= (*spvDescriptorSet0.vp_c9)._m0[183].w;
    bool _3715 = isnan(_1836);
    bool _3717 = _3713 || _3715;
    bool _3719 = isnan((*spvDescriptorSet0.vp_c9)._m0[183].w);
    bool _3721 = _3717 || _3719;
    float _3723 = float(_3721);
    float _3725 = -_3697;
    float _3727 = _3725 + 1.0;
    float _3729 = _3697 * _3705;
    float _3731 = fma(_3505, _3709, (*spvDescriptorSet0.vp_c9)._m0[185].x);
    float _3733 = -(*spvDescriptorSet0.vp_c9)._m0[187].w;
    float _3735 = _1836 + _3733;
    float _3737 = -(*spvDescriptorSet0.vp_c9)._m0[186].w;
    float _3739 = _1836 + _3737;
    float _3741 = -(*spvDescriptorSet0.vp_c9)._m0[188].w;
    float _3743 = _1836 + _3741;
    float _3745 = _3723 * _3727;
    float _3747 = fma(_3529, _3735, (*spvDescriptorSet0.vp_c9)._m0[187].x);
    float _3749 = fma(_3547, _3739, (*spvDescriptorSet0.vp_c9)._m0[186].x);
    float _3751 = fma(_3533, _3743, (*spvDescriptorSet0.vp_c9)._m0[188].x);
    int _3753 = _3663 ? 0 : 1;
    float _3755 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[100].z;
    float _3757 = _3653 * _3745;
    bool _3759 = _2129 != 1;
    float _3761 = -(*spvDescriptorSet0.vp_c9)._m0[189].w;
    float _3763 = _1836 + _3761;
    float _3765 = float(uint(_2415));
    float _3767 = -_3723;
    float _3769 = _3767 + 1.0;
    float _3771 = float(uint(_2737));
    float _3773 = fma(_3599, _3763, (*spvDescriptorSet0.vp_c9)._m0[189].x);
    float _3775 = float(uint(_2933));
    float _3777 = as_type<float>(_1942) * _3765;
    float _3779 = fma(_3769, (*spvDescriptorSet0.vp_c9)._m0[183].x, _3757);
    float _3781 = as_type<float>(_2279) * _3771;
    int _3783 = ~_3753;
    int _3785 = _3783 + 1;
    int _3787 = _3785 + 1;
    float _3789 = trunc(_3777);
    float _3791 = precise::max(_3789, 0.0);
    uint _3793 = uint(_3791);
    float _3795 = as_type<float>(_2365) * _3775;
    int _3797 = _3787;
    float _3799 = _3771;
    float _3801 = _3769;
    float _3803 = _3779;
    if (!_3651)
    {
        int _3805 = ~_3753;
        int _3807 = _3805 + 1;
        _3797 = _3807;
    }
    int _3809 = _3797;
    float _3811 = _3755 * (*spvDescriptorSet0.vp_c9)._m0[100].x;
    float _3813 = fma(_3699, _3729, _3779);
    float _3815 = float(uint(_2975));
    float _3817 = _3615 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _3819 = fma(_3811, _2267, -0.5);
    float _3821 = trunc(_3781);
    float _3823 = precise::max(_3821, 0.0);
    uint _3825 = uint(_3823);
    int _3827 = ~_1854;
    int _3829 = _3827 + 1;
    float _3831 = as_type<float>(_2383) * _3815;
    int _3833 = ~_1989;
    int _3835 = _3833 + 1;
    float _3837 = fma(_3731, _3711, _3813);
    int _3839 = ~_2011;
    int _3841 = _3839 + 1;
    float _3843 = _3623 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    bool _3845 = _2131 != 2;
    float _3847 = trunc(_3795);
    float _3849 = precise::max(_3847, 0.0);
    uint _3851 = uint(_3849);
    float _3853 = _3625 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _3855 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    bool _3857 = !_3759;
    float _3859 = _3857 ? as_type<float>(_2133) : as_type<float>(_2135);
    int _3861 = _3835 * int(_3825);
    int _3863 = _3861 + _2737;
    float _3865 = trunc(_3831);
    float _3867 = precise::max(_3865, 0.0);
    uint _3869 = uint(_3867);
    int _3871 = _3829 * int(_3793);
    int _3873 = _3871 + _2415;
    float _3875 = _2121 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    float _3877 = (*spvDescriptorSet0.vp_c9)._m0[93].z + (*spvDescriptorSet0.vp_c9)._m0[93].x;
    float _3879 = float(uint(_3863));
    float _3881 = (*spvDescriptorSet0.vp_c9)._m0[93].w + (*spvDescriptorSet0.vp_c9)._m0[93].y;
    float _3883 = float(uint(_3873));
    int _3885 = _3841 * int(_3851);
    int _3887 = _3885 + _2933;
    float _3889 = -_3855;
    float _3891 = fma(_3875, 2.0, _3889);
    float _3893 = as_type<float>(_2279) * _3879;
    int _3895 = ~_2021;
    int _3897 = _3895 + 1;
    float _3899 = as_type<float>(_1942) * _3883;
    float _3901 = float(uint(_3887));
    float _3903 = fma(as_type<float>(_2135), (*spvDescriptorSet0.vp_c9)._m0[93].z, _3877);
    float _3905 = as_type<float>(_2135) * (*spvDescriptorSet0.vp_c9)._m0[92].x;
    bool _3907 = !_3759;
    float _3909 = _3907 ? as_type<float>(_2137) : as_type<float>(_2133);
    int _3911 = _3897 * int(_3869);
    int _3913 = _3911 + _2975;
    float _3915 = as_type<float>(_2365) * _3901;
    float _3917 = trunc(_3899);
    float _3919 = precise::max(_3917, 0.0);
    uint _3921 = uint(_3919);
    float _3923 = fma(as_type<float>(_2133), (*spvDescriptorSet0.vp_c9)._m0[93].w, _3881);
    float _3925 = as_type<float>(_2133) * (*spvDescriptorSet0.vp_c9)._m0[92].y;
    float _3927 = float(uint(_3913));
    float _3929 = fma(_160, (*spvDescriptorSet0.vp_c9)._m0[92].z, _3903);
    float _3931 = fma(_160, (*spvDescriptorSet0.vp_c9)._m0[92].w, _3923);
    float _3933 = trunc(_3893);
    float _3935 = precise::max(_3933, 0.0);
    uint _3937 = uint(_3935);
    float _3939 = as_type<float>(_2383) * _3927;
    float _3941 = (*spvDescriptorSet0.vp_c9)._m0[92].x + (*spvDescriptorSet0.vp_c9)._m0[91].z;
    float _3943 = _3755;
    float _3945 = _3905;
    if (!_3759)
    {
        _3943 = _2127;
    }
    float _3947 = _3943;
    float _3949 = (*spvDescriptorSet0.vp_c9)._m0[92].y + (*spvDescriptorSet0.vp_c9)._m0[91].w;
    float _3951 = _3947;
    if (_3759)
    {
        _3951 = _1846;
    }
    float _3953 = _3951;
    float _3955 = -_3941;
    float _3957 = fma(_3905, 2.0, _3955);
    if (_3845)
    {
        _3945 = _2121;
    }
    float _3959 = _3945;
    float _3961 = trunc(_3915);
    float _3963 = precise::max(_3961, 0.0);
    uint _3965 = uint(_3963);
    float _3967 = fma(_3749, _3701, _3837);
    int _3969 = ~_1854;
    int _3971 = _3969 + 1;
    float _3973 = fma(_3925, -2.0, _3949);
    int _3975 = int(_3793) + int(_3921);
    float _3977 = fma(_3747, _3665, _3967);
    float _3979 = -_160;
    float _3981 = fma(_3979, (*spvDescriptorSet0.vp_c9)._m0[76].x, _3891);
    int _3983 = int(_3825) + int(_3937);
    float _3985 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[100].w;
    int _3987 = ~_1989;
    int _3989 = _3987 + 1;
    int _3991 = _3971 * _3975;
    int _3993 = _3991 + _2415;
    float _3995 = as_type<float>(_3971);
    float _3997 = _3959;
    if (_3845)
    {
        _3995 = _1846;
    }
    float _3999 = _3995;
    float _4001 = fma(_3751, _3617, _3977);
    float _4003 = _3999;
    if (!_3845)
    {
        _3997 = _2127;
    }
    float _4005 = _3997;
    int _4007 = _3989 * _3983;
    int _4009 = _4007 + _2737;
    if (!_3845)
    {
        _4003 = _2121;
    }
    float _4011 = _4003;
    float _4013 = trunc(_3939);
    float _4015 = precise::max(_4013, 0.0);
    uint _4017 = uint(_4015);
    bool _4019 = uint(_3993) >= uint(_1854);
    float _4021 = _1846 + _2121;
    int _4023 = int(_3851) + int(_3965);
    float _4025 = _4005 * (*spvDescriptorSet0.vp_c9)._m0[87].x;
    int _4027 = ~_2011;
    int _4029 = _4027 + 1;
    float _4031 = _4021 + (-1.0);
    bool _4033 = !_4019;
    int _4035 = _4033 ? 0 : (-1);
    float _4037 = _4011 * (*spvDescriptorSet0.vp_c9)._m0[87].y;
    bool _4039 = uint(_4009) >= uint(_1989);
    int _4041 = _4029 * _4023;
    int _4043 = _4041 + _2933;
    float _4045 = fma(_3773, _3613, _4001);
    if (!_3759)
    {
        _3799 = _1846;
    }
    float _4047 = _3799;
    float _4049 = -_160;
    float _4051 = fma(_4049, (*spvDescriptorSet0.vp_c9)._m0[91].x, _3957);
    float _4053 = _4047;
    if (!_3759)
    {
        _3801 = _1846;
    }
    float _4055 = _3801;
    float _4057 = (*spvDescriptorSet0.vp_c9)._m0[82].y + (*spvDescriptorSet0.vp_c9)._m0[81].w;
    int _4059 = int(_3869) + int(_4017);
    float _4061 = fma(_160, (*spvDescriptorSet0.vp_c9)._m0[91].y, _3973);
    int _4063 = ~_2021;
    int _4065 = _4063 + 1;
    float _4067 = fma(_3559, (*spvDescriptorSet0.vp_c9)._m0[190].x, _4045);
    bool _4069 = !_4039;
    int _4071 = _4069 ? 0 : (-1);
    bool _4073 = uint(_4043) >= uint(_2011);
    float _4075 = _2127 * 2.0;
    int _4077 = ~_3983;
    int _4079 = _4077 + _4071;
    int _4081 = _4079 + 1;
    float _4083 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _4085 = _3843 + _4083;
    bool _4087 = !_4073;
    int _4089 = _4087 ? 0 : (-1);
    int _4091 = _4065 * _4059;
    int _4093 = _4091 + _2975;
    float _4095 = _4055;
    if (!_3759)
    {
        _3803 = _2127;
    }
    float _4097 = _3803;
    float _4099 = floor(_4075);
    int _4101 = _1989 * _4081;
    int _4103 = _4101 + _2737;
    int _4105 = ~_4023;
    int _4107 = _4105 + _4089;
    int _4109 = _4107 + 1;
    out.m_71.x = _4067;
    bool _4111 = uint(_4093) >= uint(_2021);
    float _4113 = _4097;
    if (_3759)
    {
        _4053 = _2121;
    }
    float _4115 = _4053;
    bool _4117 = !_4111;
    int _4119 = _4117 ? 0 : (-1);
    if (_3759)
    {
        _4095 = _2121;
    }
    float _4121 = _4095;
    int _4123 = ~_4059;
    int _4125 = _4123 + _4119;
    int _4127 = _4125 + 1;
    int _4129 = _2011 * _4109;
    int _4131 = _4129 + _2933;
    float _4133 = _3953 * (*spvDescriptorSet0.vp_c9)._m0[82].y;
    int _4135 = _3033 >> 31;
    float _4137 = trunc((*spvDescriptorSet0.vp_c9)._m0[80].z);
    int _4139 = int(_4137);
    if (_3759)
    {
        _4113 = _1846;
    }
    float _4141 = _4113;
    float _4143 = fma(_4133, -2.0, _4057);
    int _4145 = _4135 & 3;
    int _4147 = _2021 * _4127;
    int _4149 = _4147 + _2975;
    bool _4151 = _4099 > 0.0;
    float _4153 = fma(_160, (*spvDescriptorSet0.vp_c9)._m0[81].y, _4143);
    bool _4155 = _4099 >= 0.0;
    bool _4157 = isnan(_4099);
    bool _4159 = _4155 || _4157;
    bool _4161 = isnan(0.0);
    bool _4163 = _4159 || _4161;
    float _4165 = _3985 * (*spvDescriptorSet0.vp_c9)._m0[100].y;
    int _4167 = _3033 + _4145;
    float _4169 = fma(_4165, _3485, -0.5);
    int _4171 = ~_3975;
    int _4173 = _4171 + _4035;
    int _4175 = _4173 + 1;
    float _4177 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _4179 = _3817 + _4177;
    int _4181 = _4167 >> 2;
    float _4183 = fma(_4031, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    int _4185 = _3191 >> 31;
    float _4187 = _4115 * (*spvDescriptorSet0.vp_c9)._m0[82].x;
    float _4189 = _4179 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    int _4191 = _1854 * _4175;
    int _4193 = _4191 + _2415;
    int _4195 = _4185 & 3;
    float _4197 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _4199 = _3853 + _4197;
    float _4201 = fma(_4085, (*spvDescriptorSet0.vp_c8)._m0[28].x, _4189);
    int _4203 = _3313 >> 31;
    float _4205 = (*spvDescriptorSet0.vp_c9)._m0[87].x + (*spvDescriptorSet0.vp_c9)._m0[86].z;
    int _4207 = _3191 + _4195;
    float _4209 = fma(_4199, (*spvDescriptorSet0.vp_c8)._m0[28].z, _4201);
    int _4211 = _4203 & 3;
    float _4213 = -_4205;
    float _4215 = fma(_4025, 2.0, _4213);
    bool _4217 = !_2861;
    int _4219 = _4217 ? _4149 : (-1);
    float _4221 = -_160;
    float _4223 = fma(_4221, (*spvDescriptorSet0.vp_c9)._m0[86].x, _4215);
    int _4225 = _3241 >> 31;
    float _4227 = (*spvDescriptorSet0.vp_c9)._m0[83].z + (*spvDescriptorSet0.vp_c9)._m0[83].x;
    int _4229 = _4207 >> 2;
    bool _4231 = !_3013;
    int _4233 = _4231 ? _4193 : (-1);
    float _4235 = fma(_4121, (*spvDescriptorSet0.vp_c9)._m0[83].z, _4227);
    int _4237 = _3313 + _4211;
    bool _4239 = _4209 >= 0.0;
    float _4241 = fma(_160, (*spvDescriptorSet0.vp_c9)._m0[82].z, _4235);
    bool _4243 = _3199 != 3;
    int _4245 = _4225 & 3;
    int _4247 = _4229 << 4;
    int _4249 = _4247 + 512;
    float _4251 = (*spvDescriptorSet0.vp_c9)._m0[98].w + (*spvDescriptorSet0.vp_c9)._m0[98].y;
    bool _4253 = !_2783;
    int _4255 = _4253 ? _4131 : (-1);
    int _4257 = _4181 << 4;
    int _4259 = _4257 + 368;
    float _4261 = fma(_3909, (*spvDescriptorSet0.vp_c9)._m0[98].w, _4251);
    bool _4263 = _3045 != 3;
    float _4265 = _3909 * (*spvDescriptorSet0.vp_c9)._m0[97].y;
    int _4267 = _4237 >> 2;
    uint _4269 = uint(int(uint(_4259) >> uint(2)));
    uint _4271 = uint(int(uint(int(_4269)) >> uint(2)));
    int _4273 = int(_4269) & 3;
    float _4275 = (*spvDescriptorSet0.vp_c9)._m0[int(_4271)][_4273];
    int _4277 = int(_4269) + 1;
    uint _4279 = uint(int(uint(_4277) >> uint(2)));
    int _4281 = _4277 & 3;
    float _4283 = (*spvDescriptorSet0.vp_c9)._m0[int(_4279)][_4281];
    float _4285 = fma(_160, (*spvDescriptorSet0.vp_c9)._m0[97].w, _4261);
    int _4287 = _3241 + _4245;
    float _4289 = as_type<float>(_4225);
    if (_4239)
    {
        out.m_49.x = 0.0;
    }
    bool _4291 = !_2715;
    int _4293 = _4291 ? _4103 : (-1);
    float _4295 = (*spvDescriptorSet0.vp_c9)._m0[82].x + (*spvDescriptorSet0.vp_c9)._m0[81].z;
    uint _4297 = uint(int(uint(_4249) >> uint(2)));
    uint _4299 = uint(int(uint(int(_4297)) >> uint(2)));
    int _4301 = int(_4297) & 3;
    float _4303 = (*spvDescriptorSet0.vp_c9)._m0[int(_4299)][_4301];
    int _4305 = int(_4297) + 1;
    uint _4307 = uint(int(uint(_4305) >> uint(2)));
    int _4309 = _4305 & 3;
    float _4311 = (*spvDescriptorSet0.vp_c9)._m0[int(_4307)][_4309];
    float _4313 = -_4295;
    float _4315 = fma(_4187, 2.0, _4313);
    float _4317 = (*spvDescriptorSet0.vp_c9)._m0[83].w + (*spvDescriptorSet0.vp_c9)._m0[83].y;
    int _4319 = _4287 >> 2;
    float _4321 = (*spvDescriptorSet0.vp_c9)._m0[97].y + (*spvDescriptorSet0.vp_c9)._m0[96].w;
    bool _4323 = !_3047;
    int _4325 = _4323 ? 0 : 1;
    float _4327 = (*spvDescriptorSet0.vp_c9)._m0[98].z + (*spvDescriptorSet0.vp_c9)._m0[98].x;
    float _4329 = fma(_4141, (*spvDescriptorSet0.vp_c9)._m0[83].w, _4317);
    int _4331 = _3241 & 3;
    bool _4333 = _4331 != 0;
    float _4335 = fma(_4265, -2.0, _4321);
    int _4337 = _4319 << 4;
    int _4339 = _4337 + 656;
    float _4341 = fma(_3859, (*spvDescriptorSet0.vp_c9)._m0[98].z, _4327);
    int _4343 = _4267 << 4;
    int _4345 = _4343 + 800;
    float _4347 = (*spvDescriptorSet0.vp_c9)._m0[97].x + (*spvDescriptorSet0.vp_c9)._m0[96].z;
    float _4349 = _3859 * (*spvDescriptorSet0.vp_c9)._m0[97].x;
    int _4351 = _3191 & 3;
    bool _4353 = _4351 != 0;
    float _4355 = fma(_160, (*spvDescriptorSet0.vp_c9)._m0[97].z, _4341);
    bool _4357 = !_4333;
    int _4359 = _4357 ? 0 : 1;
    uint _4361 = uint(int(uint(_4339) >> uint(2)));
    uint _4363 = uint(int(uint(int(_4361)) >> uint(2)));
    int _4365 = int(_4361) & 3;
    float _4367 = (*spvDescriptorSet0.vp_c9)._m0[int(_4363)][_4365];
    int _4369 = int(_4361) + 1;
    uint _4371 = uint(int(uint(_4369) >> uint(2)));
    int _4373 = _4369 & 3;
    float _4375 = (*spvDescriptorSet0.vp_c9)._m0[int(_4371)][_4373];
    int _4377 = _3313 & 3;
    bool _4379 = _4377 != 0;
    float _4381 = (*spvDescriptorSet0.vp_c9)._m0[87].y + (*spvDescriptorSet0.vp_c9)._m0[86].w;
    if (_4239)
    {
        _4289 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _4383 = _4289;
    float _4385 = fma(_160, (*spvDescriptorSet0.vp_c9)._m0[96].y, _4335);
    float _4387 = -_4347;
    float _4389 = fma(_4349, 2.0, _4387);
    int _4391 = abs(_3101);
    float _4393 = fma(_4037, -2.0, _4381);
    uint _4395 = uint(int(uint(_4345) >> uint(2)));
    uint _4397 = uint(int(uint(int(_4395)) >> uint(2)));
    int _4399 = int(_4395) & 3;
    float _4401 = (*spvDescriptorSet0.vp_c9)._m0[int(_4397)][_4399];
    int _4403 = int(_4395) + 1;
    uint _4405 = uint(int(uint(_4403) >> uint(2)));
    int _4407 = _4403 & 3;
    float _4409 = (*spvDescriptorSet0.vp_c9)._m0[int(_4405)][_4407];
    float _4411 = -_160;
    float _4413 = fma(_4411, (*spvDescriptorSet0.vp_c9)._m0[96].x, _4389);
    int _4415 = as_type<int>(_4383);
    if (_4239)
    {
        float _4417 = _4383 * 5.0;
        _4415 = as_type<int>(_4417);
    }
    int _4419 = _4415;
    int _4421 = abs(_3269);
    float _4423 = fma(_160, (*spvDescriptorSet0.vp_c9)._m0[82].w, _4329);
    float _4425 = fma(_4355, _3819, _4413);
    int _4427 = abs(_3375);
    int _4429 = _4259 + 8;
    uint _4431 = uint(int(uint(_4429) >> uint(2)));
    uint _4433 = uint(int(uint(int(_4431)) >> uint(2)));
    int _4435 = int(_4431) & 3;
    float _4437 = (*spvDescriptorSet0.vp_c9)._m0[int(_4433)][_4435];
    int _4439 = int(_4431) + 1;
    uint _4441 = uint(int(uint(_4439) >> uint(2)));
    int _4443 = _4439 & 3;
    float _4445 = (*spvDescriptorSet0.vp_c9)._m0[int(_4441)][_4443];
    if (_4239)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _13829 = as_type<float>(_4419);
        out.gl_Position.z = _13829;
    }
    float _4447 = -_160;
    float _4449 = fma(_4447, (*spvDescriptorSet0.vp_c9)._m0[81].x, _4315);
    bool _4451 = !_4353;
    int _4453 = _4451 ? 0 : 1;
    float _4455 = fma(_160, (*spvDescriptorSet0.vp_c9)._m0[86].y, _4393);
    int _4457 = abs(_4325);
    float _4459 = -_4385;
    float _4461 = fma(_4285, _4169, _4459);
    int _4463 = _4249 + 8;
    uint _4465 = uint(int(uint(_4463) >> uint(2)));
    uint _4467 = uint(int(uint(int(_4465)) >> uint(2)));
    int _4469 = int(_4465) & 3;
    float _4471 = (*spvDescriptorSet0.vp_c9)._m0[int(_4467)][_4469];
    int _4473 = int(_4465) + 1;
    uint _4475 = uint(int(uint(_4473) >> uint(2)));
    int _4477 = _4473 & 3;
    float _4479 = (*spvDescriptorSet0.vp_c9)._m0[int(_4475)][_4477];
    int _4481 = abs(_3333);
    int _4483 = abs(_4453);
    int _4485 = ~_4421;
    int _4487 = _4485 + 1;
    int _4489 = _4487 + 1;
    int _4491 = _4339 + 8;
    uint _4493 = uint(int(uint(_4491) >> uint(2)));
    uint _4495 = uint(int(uint(int(_4493)) >> uint(2)));
    int _4497 = int(_4493) & 3;
    float _4499 = (*spvDescriptorSet0.vp_c9)._m0[int(_4495)][_4497];
    int _4501 = int(_4493) + 1;
    uint _4503 = uint(int(uint(_4501) >> uint(2)));
    int _4505 = _4501 & 3;
    float _4507 = (*spvDescriptorSet0.vp_c9)._m0[int(_4503)][_4505];
    int _4509 = ~_4391;
    int _4511 = _4509 + 1;
    int _4513 = _4511 + 1;
    int _4515 = _4489 * as_type<int>(_4311);
    bool _4517 = !_4379;
    int _4519 = _4517 ? 0 : 1;
    int _4521 = _4345 + 8;
    uint _4523 = uint(int(uint(_4521) >> uint(2)));
    uint _4525 = uint(int(uint(int(_4523)) >> uint(2)));
    int _4527 = int(_4523) & 3;
    float _4529 = (*spvDescriptorSet0.vp_c9)._m0[int(_4525)][_4527];
    int _4531 = int(_4523) + 1;
    uint _4533 = uint(int(uint(_4531) >> uint(2)));
    int _4535 = _4531 & 3;
    float _4537 = (*spvDescriptorSet0.vp_c9)._m0[int(_4533)][_4535];
    int _4539 = ~_4457;
    int _4541 = _4539 + 1;
    int _4543 = _4541 + 1;
    int _4545 = _4513 * as_type<int>(_4283);
    int _4547 = ~_4483;
    int _4549 = _4547 + 1;
    int _4551 = _4549 + 1;
    float _4553 = trunc((*spvDescriptorSet0.vp_c9)._m0[90].z);
    int _4555 = int(_4553);
    bool _4557 = _3271 != 3;
    int _4559 = _4543 * as_type<int>(_4275);
    int _4561 = _4559 + _4545;
    bool _4563 = !_4263;
    int _4565 = _4563 ? 0 : (-1);
    int _4567 = _4551 * as_type<int>(_4303);
    int _4569 = _4567 + _4515;
    bool _4571 = _3325 != 3;
    int _4573 = abs(_4519);
    bool _4575 = !_4243;
    int _4577 = _4575 ? 0 : (-1);
    bool _4579 = !_4557;
    int _4581 = _4579 ? 0 : (-1);
    int _4583 = ~_4481;
    int _4585 = _4583 + 1;
    int _4587 = _4585 + 1;
    int _4589 = abs(_3165);
    int _4591 = abs(_3253);
    int _4593 = _4587 * as_type<int>(_4375);
    int _4595 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _4597 = _4595 != 0;
    int _4599 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _4601 = _4599 != 0;
    int _4603 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _4605 = _4603 != 0;
    int _4607 = ~_4427;
    int _4609 = _4607 + 1;
    int _4611 = _4609 + 1;
    float _4613 = trunc((*spvDescriptorSet0.vp_c9)._m0[85].z);
    int _4615 = int(_4613);
    int _4617 = ~_4589;
    int _4619 = _4617 + 1;
    int _4621 = _4619 + 1;
    int _4623 = _4611 * as_type<int>(_4409);
    int _4625 = ~_4573;
    int _4627 = _4625 + 1;
    int _4629 = _4627 + 1;
    int _4631 = ~_4591;
    int _4633 = _4631 + 1;
    int _4635 = _4633 + 1;
    int _4637 = _4621 * as_type<int>(_4437);
    int _4639 = _4637 + _4561;
    int _4641 = abs(_4359);
    int _4643 = _4629 * as_type<int>(_4401);
    int _4645 = _4643 + _4623;
    int _4647 = abs(_3323);
    int _4649 = _4635 * as_type<int>(_4471);
    int _4651 = _4649 + _4569;
    int _4653 = ~_4641;
    int _4655 = _4653 + 1;
    int _4657 = _4655 + 1;
    float _4659 = trunc((*spvDescriptorSet0.vp_c9)._m0[95].z);
    int _4661 = int(_4659);
    int _4663 = abs(_3393);
    int _4665 = abs(_4577);
    int _4667 = _4657 * as_type<int>(_4367);
    int _4669 = _4667 + _4593;
    float _4671 = float(uint(_4139));
    int _4673 = ~_4647;
    int _4675 = _4673 + 1;
    int _4677 = _4675 + 1;
    float _4679 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _4681 = log2(_4679);
    int _4683 = ~_4663;
    int _4685 = _4683 + 1;
    int _4687 = _4685 + 1;
    int _4689 = ~_4665;
    int _4691 = _4689 + 1;
    int _4693 = _4691 + 1;
    int _4695 = _4677 * as_type<int>(_4499);
    int _4697 = _4695 + _4669;
    int _4699 = abs(_4565);
    int _4701 = _4687 * as_type<int>(_4529);
    int _4703 = _4701 + _4645;
    float _4705 = float(uint(_4615));
    float _4707 = 1.0 / _4671;
    int _4709 = _4693 * as_type<int>(_4479);
    int _4711 = _4709 + _4651;
    int _4713 = ~_4699;
    int _4715 = _4713 + 1;
    int _4717 = _4715 + 1;
    float _4719 = float(uint(_4555));
    int _4721 = abs(_4581);
    int _4723 = _4717 * as_type<int>(_4445);
    int _4725 = _4723 + _4639;
    int _4727 = abs(_3181);
    float _4729 = 1.0 / _4705;
    int _4731 = abs(_3417);
    float _4733 = _4681 * _160;
    int _4735 = ~_4721;
    int _4737 = _4735 + 1;
    int _4739 = _4737 + 1;
    int _4741 = ~_4727;
    int _4743 = _4741 + 1;
    int _4745 = _4743 + 1;
    bool _4747 = !_4571;
    int _4749 = _4747 ? 0 : (-1);
    float _4751 = 1.0 / _4719;
    int _4753 = abs(_3399);
    int _4755 = _4739 * as_type<int>(_4507);
    int _4757 = _4755 + _4697;
    int _4759 = abs(_4749);
    int _4761 = _4725 * _4745;
    int _4763 = ~_4753;
    int _4765 = _4763 + 1;
    int _4767 = _4765 + 1;
    int _4769 = as_type<int>(_4707) + (-2);
    int _4771 = _4233 * _4727;
    int _4773 = _4771 + _4761;
    int _4775 = ~_4731;
    int _4777 = _4775 + 1;
    int _4779 = _4777 + 1;
    int _4781 = _4767 * _4757;
    float _4783 = exp2(_4733);
    float _4785 = float(uint(_4773));
    int _4787 = _4779 * _4711;
    int _4789 = ~_4759;
    int _4791 = _4789 + 1;
    int _4793 = _4791 + 1;
    int _4795 = _4255 * _4753;
    int _4797 = _4795 + _4781;
    int _4799 = as_type<int>(_4729) + (-2);
    int _4801 = _4293 * _4731;
    int _4803 = _4801 + _4787;
    int _4805 = abs(_3629);
    int _4807 = _4793 * as_type<int>(_4537);
    int _4809 = _4807 + _4703;
    float _4811 = as_type<float>(_4769) * _4785;
    int _4813 = as_type<int>(_4751) + (-2);
    float _4815 = float(uint(_4803));
    float _4817 = float(uint(_4797));
    float _4819 = trunc(_4811);
    float _4821 = precise::max(_4819, 0.0);
    uint _4823 = uint(_4821);
    int _4825 = ~_4805;
    int _4827 = _4825 + 1;
    int _4829 = _4827 + 1;
    float _4831 = as_type<float>(_4799) * _4815;
    float _4833 = float(uint(_4661));
    float _4835 = as_type<float>(_4813) * _4817;
    int _4837 = _4163 ? 0 : 1;
    int _4839 = _4829 * _4809;
    int _4841 = abs(_4139);
    float _4843 = trunc(_4831);
    float _4845 = precise::max(_4843, 0.0);
    uint _4847 = uint(_4845);
    int _4849 = ~_4837;
    int _4851 = _4849 + 1;
    int _4853 = _4851 + 1;
    int _4855 = _4219 * _4805;
    int _4857 = _4855 + _4839;
    int _4859 = _4853;
    float _4861 = _4449;
    if (!_4151)
    {
        int _4863 = ~_4837;
        int _4865 = _4863 + 1;
        _4859 = _4865;
    }
    int _4867 = _4859;
    float _4869 = -_4783;
    float _4871 = _4869 + 1.0;
    int _4873 = ~_4139;
    int _4875 = _4873 + 1;
    int _4877 = ~_4615;
    int _4879 = _4877 + 1;
    float _4881 = trunc(_4835);
    float _4883 = precise::max(_4881, 0.0);
    uint _4885 = uint(_4883);
    int _4887 = abs(_4615);
    int _4889 = _4875 * int(_4823);
    int _4891 = _4889 + _4773;
    float _4893 = float(uint(_4841));
    int _4895 = ~_4555;
    int _4897 = _4895 + 1;
    float _4899 = float(uint(_4887));
    float _4901 = 1.0 / _4833;
    int _4903 = _4879 * int(_4847);
    int _4905 = _4903 + _4803;
    int _4907 = abs(_4555);
    float _4909 = float(uint(_4891));
    float _4911 = float(uint(_4905));
    float _4913 = 1.0 / _4893;
    int _4915 = _4897 * int(_4885);
    int _4917 = _4915 + _4797;
    float _4919 = float(uint(_4907));
    float _4921 = as_type<float>(_4769) * _4909;
    int _4923 = abs(_4661);
    float _4925 = as_type<float>(_4799) * _4911;
    float _4927 = float(uint(_4917));
    float _4929 = 1.0 / _4899;
    int _4931 = as_type<int>(_4901) + (-2);
    float _4933 = as_type<float>(_4813) * _4927;
    float _4935 = float(uint(_4857));
    float _4937 = float(uint(_4923));
    float _4939 = 1.0 / _4919;
    int _4941 = abs(_4773);
    float _4943 = as_type<float>(_4931) * _4935;
    int _4945 = abs(_4803);
    int _4947 = as_type<int>(_4913) + (-2);
    float _4949 = float(uint(_4941));
    float _4951 = 1.0 / _4937;
    int _4953 = as_type<int>(_4929) + (-2);
    float _4955 = as_type<float>(_4947) * _4949;
    float _4957 = float(uint(_4945));
    bool _4959 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _4961 = isnan(1.0);
    bool _4963 = _4959 || _4961;
    bool _4965 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _4967 = _4963 || _4965;
    float _4969 = trunc(_4943);
    float _4971 = precise::max(_4969, 0.0);
    uint _4973 = uint(_4971);
    float _4975 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _4977 = 1.0 + _4975;
    int _4979 = abs(_4797);
    float _4981 = as_type<float>(_4953) * _4957;
    float _4983 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    int _4985 = as_type<int>(_4939) + (-2);
    float _4987 = trunc(_4955);
    float _4989 = precise::max(_4987, 0.0);
    uint _4991 = uint(_4989);
    float _4993 = float(uint(_4979));
    float _4995 = (*spvDescriptorSet0.vp_c9)._m0[88].w + (*spvDescriptorSet0.vp_c9)._m0[88].y;
    float _4997 = as_type<float>(_4985) * _4993;
    int _4999 = abs(_4857);
    float _5001 = 1.0 / _4977;
    int _5003 = ~_4661;
    int _5005 = _5003 + 1;
    float _5007 = fma(_1846, (*spvDescriptorSet0.vp_c9)._m0[78].w, _4983);
    float _5009 = fma(_1846, (*spvDescriptorSet0.vp_c9)._m0[88].w, _4995);
    float _5011 = (*spvDescriptorSet0.vp_c9)._m0[88].z + (*spvDescriptorSet0.vp_c9)._m0[88].x;
    int _5013 = as_type<int>(_4951) + (-2);
    float _5015 = fma(_160, (*spvDescriptorSet0.vp_c9)._m0[77].w, _5007);
    float _5017 = float(uint(_4999));
    float _5019 = trunc(_4981);
    float _5021 = precise::max(_5019, 0.0);
    uint _5023 = uint(_5021);
    bool _5025 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _5027 = isnan(0.0);
    bool _5029 = _5025 || _5027;
    bool _5031 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _5033 = _5029 || _5031;
    float _5035 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    float _5037 = fma(_160, (*spvDescriptorSet0.vp_c9)._m0[87].w, _5009);
    int _5039 = _5005 * int(_4973);
    int _5041 = _5039 + _4857;
    int _5043 = ~_4841;
    int _5045 = _5043 + 1;
    float _5047 = fma(_2121, (*spvDescriptorSet0.vp_c9)._m0[88].z, _5011);
    float _5049 = as_type<float>(_5013) * _5017;
    float _5051 = trunc(_4997);
    float _5053 = precise::max(_5051, 0.0);
    uint _5055 = uint(_5053);
    float _5057 = fma(_2121, (*spvDescriptorSet0.vp_c9)._m0[78].z, _5035);
    float _5059 = _5033 ? _4871 : 0.0;
    float _5061 = fma(_160, (*spvDescriptorSet0.vp_c9)._m0[87].z, _5047);
    float _5063 = float(uint(_5041));
    int _5065 = _5045 * int(_4991);
    int _5067 = _5065 + _4941;
    int _5069 = ~_4887;
    int _5071 = _5069 + 1;
    float _5073 = fma(_160, (*spvDescriptorSet0.vp_c9)._m0[77].z, _5057);
    float _5075 = trunc(_4925);
    float _5077 = precise::max(_5075, 0.0);
    uint _5079 = uint(_5077);
    if (_4967)
    {
        float _5081 = _5059 * _5001;
        _162 = _5081;
    }
    float _5083 = _162;
    float _5085 = as_type<float>(_4931) * _5063;
    float _5087 = float(uint(_5067));
    int _5089 = _5071 * int(_5023);
    int _5091 = _5089 + _4945;
    float _5093 = trunc(_4921);
    float _5095 = precise::max(_5093, 0.0);
    uint _5097 = uint(_5095);
    int _5099 = ~_4907;
    int _5101 = _5099 + 1;
    float _5103 = as_type<float>(_4947) * _5087;
    float _5105 = trunc(_5049);
    float _5107 = precise::max(_5105, 0.0);
    uint _5109 = uint(_5107);
    int _5111 = int(_4847) + int(_5079);
    int _5113 = _5101 * int(_5055);
    int _5115 = _5113 + _4979;
    int _5117 = ~_4661;
    int _5119 = _5117 + 1;
    float _5121 = float(uint(_5115));
    float _5123 = trunc(_5085);
    float _5125 = precise::max(_5123, 0.0);
    uint _5127 = uint(_5125);
    int _5129 = int(_4823) + int(_5097);
    int _5131 = ~_4923;
    int _5133 = _5131 + 1;
    float _5135 = as_type<float>(_4985) * _5121;
    float _5137 = trunc(_4933);
    float _5139 = precise::max(_5137, 0.0);
    uint _5141 = uint(_5139);
    float _5143 = trunc(_5135);
    float _5145 = precise::max(_5143, 0.0);
    uint _5147 = uint(_5145);
    float _5149 = float(uint(_5091));
    int _5151 = ~_4139;
    int _5153 = _5151 + 1;
    int _5155 = int(_4973) + int(_5127);
    float _5157 = as_type<float>(_4953) * _5149;
    int _5159 = _5133 * int(_5109);
    int _5161 = _5159 + _4999;
    float _5163 = trunc(_5103);
    float _5165 = precise::max(_5163, 0.0);
    uint _5167 = uint(_5165);
    int _5169 = ~_4615;
    int _5171 = _5169 + 1;
    float _5173 = float(uint(_5161));
    int _5175 = _5153 * _5129;
    int _5177 = _5175 + _4773;
    int _5179 = ~_4555;
    int _5181 = _5179 + 1;
    float _5183 = as_type<float>(_5013) * _5173;
    float _5185 = trunc(_5157);
    float _5187 = precise::max(_5185, 0.0);
    uint _5189 = uint(_5187);
    int _5191 = _5171 * _5111;
    int _5193 = _5191 + _4803;
    int _5195 = int(_4885) + int(_5141);
    int _5197 = _5119 * _5155;
    int _5199 = _5197 + _4857;
    bool _5201 = uint(_5193) >= uint(_4615);
    float _5203 = trunc(_5183);
    float _5205 = precise::max(_5203, 0.0);
    uint _5207 = uint(_5205);
    bool _5209 = uint(_5177) >= uint(_4139);
    int _5211 = _5181 * _5195;
    int _5213 = _5211 + _4797;
    int _5215 = int(_5055) + int(_5147);
    int _5217 = int(_4991) + int(_5167);
    int _5219 = ~_4841;
    int _5221 = _5219 + 1;
    bool _5223 = !_5201;
    int _5225 = _5223 ? 0 : (-1);
    bool _5227 = uint(_5199) >= uint(_4661);
    int _5229 = _5221 * _5217;
    int _5231 = _5229 + _4941;
    int _5233 = ~_4907;
    int _5235 = _5233 + 1;
    bool _5237 = !_5209;
    int _5239 = _5237 ? 0 : (-1);
    bool _5241 = uint(_5213) >= uint(_4555);
    int _5243 = _5235 * _5215;
    int _5245 = _5243 + _4979;
    int _5247 = int(_5023) + int(_5189);
    int _5249 = ~_4887;
    int _5251 = _5249 + 1;
    bool _5253 = !_5241;
    int _5255 = _5253 ? 0 : (-1);
    bool _5257 = uint(_5231) >= uint(_4841);
    int _5259 = _5251 * _5247;
    int _5261 = _5259 + _4945;
    int _5263 = ~_4923;
    int _5265 = _5263 + 1;
    bool _5267 = !_5257;
    int _5269 = _5267 ? 0 : (-1);
    bool _5271 = uint(_5245) >= uint(_4907);
    float _5273 = _4179 * _4179;
    int _5275 = int(_5109) + int(_5207);
    float _5277 = fma(_4085, _4085, _5273);
    bool _5279 = !_5227;
    int _5281 = _5279 ? 0 : (-1);
    bool _5283 = uint(_5261) >= uint(_4887);
    float _5285 = fma(_4199, _4199, _5277);
    int _5287 = _5265 * _5275;
    int _5289 = _5287 + _4999;
    int _5291 = ~_5129;
    int _5293 = _5291 + _5239;
    int _5295 = _5293 + 1;
    float _5297 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    bool _5299 = !_5283;
    int _5301 = _5299 ? 0 : (-1);
    bool _5303 = uint(_5289) >= uint(_4923);
    int _5305 = _4139 * _5295;
    int _5307 = _5305 + _4773;
    int _5309 = ~_5195;
    int _5311 = _5309 + _5255;
    int _5313 = _5311 + 1;
    bool _5315 = !_5271;
    int _5317 = _5315 ? 0 : (-1);
    float _5319 = rsqrt(_5285);
    bool _5321 = _4139 == 0;
    int _5323 = ~_5111;
    int _5325 = _5323 + _5225;
    int _5327 = _5325 + 1;
    int _5329 = ~_5155;
    int _5331 = _5329 + _5281;
    int _5333 = _5331 + 1;
    int _5335 = _4555 * _5313;
    int _5337 = _5335 + _4797;
    bool _5339 = !_5321;
    int _5341 = _5339 ? _5307 : (-1);
    int _5343 = _4615 * _5327;
    int _5345 = _5343 + _4803;
    bool _5347 = _4555 == 0;
    float _5349 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    int _5351 = _4803 ^ _4615;
    float _5353 = _5297 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    bool _5355 = !_5347;
    int _5357 = _5355 ? _5337 : (-1);
    bool _5359 = _4139 == 0;
    float _5361 = _4179 * _5319;
    int _5363 = _4773 ^ _4139;
    float _5365 = _4085 * _5319;
    uint _5367 = uint(int(uint(_5351) >> uint(31)));
    float _5369 = -_5361;
    float _5371 = fma(_5369, (*spvDescriptorSet0.vp_c9)._m0[18].w, _4179);
    int _5373 = ~_5269;
    int _5375 = _5217 + _5373;
    int _5377 = _5375 + 1;
    float _5379 = _4425 + 0.5;
    uint _5381 = uint(int(uint(_5363) >> uint(31)));
    float _5383 = _5371 * _5371;
    int _5385 = ~_5301;
    int _5387 = _5247 + _5385;
    int _5389 = _5387 + 1;
    float _5391 = _4461 + 0.5;
    int _5393 = ~int(_5367);
    int _5395 = _5393 + 1;
    float _5397 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    bool _5399 = !_5303;
    int _5401 = _5399 ? 0 : (-1);
    float _5403 = -_5365;
    float _5405 = fma(_5403, (*spvDescriptorSet0.vp_c9)._m0[18].w, _4085);
    bool _5407 = _4615 == 0;
    out.m_73.x = _5379;
    out.m_73.y = _5391;
    int _5409 = ~int(_5381);
    int _5411 = _5409 + 1;
    float _5413 = fma(_5405, _5405, _5383);
    int _5415 = _5389 ^ _5395;
    float _5417 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].z;
    bool _5419 = !_5407;
    int _5421 = _5419 ? _5345 : (-1);
    int _5423 = _4661 * _5333;
    int _5425 = _5423 + _4857;
    int _5427 = _5377 ^ _5411;
    float _5429 = fma(_5353, _2163, -0.5);
    bool _5431 = _4661 == 0;
    float _5433 = _5349 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    int _5435 = ~_5395;
    int _5437 = _5435 + _5415;
    int _5439 = _5437 + 1;
    float _5441 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    int _5443 = ~_5411;
    int _5445 = _5443 + _5427;
    int _5447 = _5445 + 1;
    float _5449 = _5397 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    bool _5451 = !_5431;
    int _5453 = _5451 ? _5425 : (-1);
    float _5455 = float(_5341);
    float _5457 = fma(_5449, _2227, -0.5);
    bool _5459 = _4615 == 0;
    float _5461 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[95].z;
    bool _5463 = !_5359;
    int _5465 = _5463 ? _5447 : (-1);
    float _5467 = fma(_5353, _5455, _3981);
    bool _5469 = _4555 == 0;
    float _5471 = _5417 * (*spvDescriptorSet0.vp_c9)._m0[90].x;
    int _5473 = _4797 ^ _4555;
    float _5475 = fma(_5073, _5429, _5467);
    bool _5477 = !_5459;
    int _5479 = _5477 ? _5439 : (-1);
    float _5481 = fma(_5471, _2249, -0.5);
    int _5483 = _4857 ^ _4661;
    float _5485 = _5441 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    float _5487 = float(_5357);
    bool _5489 = _4661 == 0;
    float _5491 = float(_5421);
    float _5493 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].w;
    uint _5495 = uint(int(uint(_5473) >> uint(31)));
    float _5497 = fma(_5471, _5487, _4223);
    uint _5499 = uint(int(uint(_5483) >> uint(31)));
    float _5501 = fma(_5449, _5491, _4449);
    int _5503 = ~_5317;
    int _5505 = _5215 + _5503;
    int _5507 = _5505 + 1;
    float _5509 = _5461 * (*spvDescriptorSet0.vp_c9)._m0[95].x;
    int _5511 = ~int(_5495);
    int _5513 = _5511 + 1;
    float _5515 = fma(_5061, _5481, _5497);
    float _5517 = float(_5453);
    float _5519 = fma(_5509, _2259, -0.5);
    int _5521 = ~_5401;
    int _5523 = _5275 + _5521;
    int _5525 = _5523 + 1;
    float _5527 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[95].w;
    int _5529 = ~int(_5499);
    int _5531 = _5529 + 1;
    float _5533 = fma(_5509, _5517, _4051);
    float _5535 = float(_5465);
    float _5537 = fma(_5433, _3421, -0.5);
    float _5539 = float(_5479);
    float _5541 = fma(_4241, _5457, _5501);
    int _5543 = _5507 ^ _5513;
    float _5545 = -_3349;
    float _5547 = fma(_5433, _5535, _5545);
    int _5549 = _5525 ^ _5531;
    float _5551 = fma(_5485, _3429, -0.5);
    int _5553 = ~_5513;
    int _5555 = _5553 + _5543;
    int _5557 = _5555 + 1;
    float _5559 = -_4153;
    float _5561 = fma(_5485, _5539, _5559);
    int _5563 = ~_5531;
    int _5565 = _5563 + _5549;
    int _5567 = _5565 + 1;
    float _5569 = _4199 * _5319;
    float _5571 = _5493 * (*spvDescriptorSet0.vp_c9)._m0[90].y;
    bool _5573 = !_5469;
    int _5575 = _5573 ? _5557 : (-1);
    float _5577 = fma(_5015, _5537, _5547);
    bool _5579 = !_5489;
    int _5581 = _5579 ? _5567 : (-1);
    float _5583 = -_5569;
    float _5585 = fma(_5583, (*spvDescriptorSet0.vp_c9)._m0[18].w, _4199);
    float _5587 = float(_5575);
    float _5589 = fma(_3929, _5519, _5533);
    float _5591 = float(_5581);
    float _5593 = _5577 + 0.5;
    float _5595 = fma(_5585, _5585, _5413);
    float _5597 = _5527 * (*spvDescriptorSet0.vp_c9)._m0[95].y;
    float _5599 = in.m_75.x;
    float _5601 = in.m_75.y;
    float _5603 = in.m_75.z;
    float _5605 = fma(_5571, _3443, -0.5);
    float _5607 = -_4455;
    float _5609 = fma(_5571, _5587, _5607);
    float _5611 = fma(_5597, _3445, -0.5);
    float _5613 = -_4061;
    float _5615 = fma(_5597, _5591, _5613);
    float _5617 = fma(_4423, _5551, _5561);
    float _5619 = fma(_5037, _5605, _5609);
    float _5621 = _5515 + 0.5;
    float _5623 = fma(_3931, _5611, _5615);
    float _5625 = _5475 + 0.5;
    float _5627 = _5541 + 0.5;
    float _5629 = _5617 + 0.5;
    float _5631 = _5589 + 0.5;
    float _5633 = _5619 + 0.5;
    float _5635 = _5623 + 0.5;
    bool _5637 = !_4597;
    int _5639 = _5637 ? 0 : 1;
    out.m_77.x = _5625;
    out.m_77.y = _5593;
    out.m_77.z = _5627;
    out.m_77.w = _5629;
    bool _5641 = !_4601;
    int _5643 = _5641 ? 0 : 1;
    int _5645 = abs(_5639);
    out.m_79.x = _5621;
    out.m_79.y = _5633;
    float _5647 = float(_4867);
    int _5649 = abs(_5643);
    out.m_81.x = _5631;
    out.m_81.y = _5635;
    bool _5651 = !_4605;
    int _5653 = _5651 ? 0 : 1;
    float _5655 = float(_5645);
    float _5657 = _5627;
    float _5659 = as_type<float>(_5167);
    if (_4239)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_59.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_59.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_59.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_59.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_61.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_61.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_61.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_61.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_67.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_67.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_67.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_67.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_71.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_71.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_71.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_71.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_79.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_79.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_79.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_79.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_81.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_81.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_81.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_81.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_89.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_89.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_89.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_89.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_73.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_73.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_73.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_73.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_77.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_77.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_77.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_77.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_95.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_95.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_95.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_95.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_99.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_99.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_99.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_99.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_97.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_97.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_97.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_97.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_49.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_49.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_49.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_49.w)); dm_cw(dm_gs, dm_p, 68, as_type<uint>(out.m_93.x)); dm_cw(dm_gs, dm_p, 69, as_type<uint>(out.m_93.y)); dm_cw(dm_gs, dm_p, 70, as_type<uint>(out.m_93.z)); dm_cw(dm_gs, dm_p, 71, as_type<uint>(out.m_93.w)); dm_cw(dm_gs, dm_p, 72, as_type<uint>(out.m_105.x)); dm_cw(dm_gs, dm_p, 73, as_type<uint>(out.m_105.y)); dm_cw(dm_gs, dm_p, 74, as_type<uint>(out.m_105.z)); dm_cw(dm_gs, dm_p, 75, as_type<uint>(out.m_105.w)); dm_cw(dm_gs, dm_p, 76, as_type<uint>(out.m_101.x)); dm_cw(dm_gs, dm_p, 77, as_type<uint>(out.m_101.y)); dm_cw(dm_gs, dm_p, 78, as_type<uint>(out.m_101.z)); dm_cw(dm_gs, dm_p, 79, as_type<uint>(out.m_101.w)); dm_cw(dm_gs, dm_p, 80, as_type<uint>(out.m_103.x)); dm_cw(dm_gs, dm_p, 81, as_type<uint>(out.m_103.y)); dm_cw(dm_gs, dm_p, 82, as_type<uint>(out.m_103.z)); dm_cw(dm_gs, dm_p, 83, as_type<uint>(out.m_103.w)); dm_cw(dm_gs, dm_p, 84, as_type<uint>(out.m_107.x)); dm_cw(dm_gs, dm_p, 85, as_type<uint>(out.m_107.y)); dm_cw(dm_gs, dm_p, 86, as_type<uint>(out.m_107.z)); dm_cw(dm_gs, dm_p, 87, as_type<uint>(out.m_107.w)); dm_cw(dm_gs, dm_p, 88, as_type<uint>(out.m_63.x)); dm_cw(dm_gs, dm_p, 89, as_type<uint>(out.m_63.y)); dm_cw(dm_gs, dm_p, 90, as_type<uint>(out.m_63.z)); dm_cw(dm_gs, dm_p, 91, as_type<uint>(out.m_63.w)); dm_cw(dm_gs, dm_p, 92, as_type<uint>(out.m_65.x)); dm_cw(dm_gs, dm_p, 93, as_type<uint>(out.m_65.y)); dm_cw(dm_gs, dm_p, 94, as_type<uint>(out.m_65.z)); dm_cw(dm_gs, dm_p, 95, as_type<uint>(out.m_65.w)); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _5661 = -_5361;
    float _5663 = fma(_5661, (*spvDescriptorSet0.vp_c9)._m0[18].w, _3817);
    float _5665 = float(_5649);
    float _5667 = -_5365;
    float _5669 = fma(_5667, (*spvDescriptorSet0.vp_c9)._m0[18].w, _3843);
    float _5671 = _5655 * _5647;
    float _5673 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _5675 = _5663 + _5673;
    float _5677 = float(_3581);
    float _5679 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _5681 = _5669 + _5679;
    float _5683 = _5671 * (-2.0);
    float _5685 = _5675 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _5687 = -_5569;
    float _5689 = fma(_5687, (*spvDescriptorSet0.vp_c9)._m0[18].w, _3853);
    float _5691 = _5665 * _5677;
    float _5693 = _1846 + _2127;
    float _5695 = fma(_5681, (*spvDescriptorSet0.vp_c8)._m0[28].x, _5685);
    float _5697 = _2121 + (-0.5);
    float _5699 = fma(_5683, _5599, _5599);
    float _5701 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _5703 = _5689 + _5701;
    float _5705 = _5693 + (-1.0);
    float _5707 = fma(_4183, _5683, _4183);
    float _5709 = fma(_5697, (*spvDescriptorSet0.vp_c9)._m0[196].x, _5699);
    float _5711 = _5691 * (-2.0);
    float _5713 = fma(_5703, (*spvDescriptorSet0.vp_c8)._m0[28].z, _5695);
    float _5715 = fma(_5705, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    float _5717 = fma(_5707, _5083, _5709);
    float _5719 = _1846 + (-0.5);
    float _5721 = fma(_5711, _5601, _5601);
    bool _5723 = _5713 >= 0.0;
    float _5725 = fma(_5715, _5711, _5715);
    int _5727 = abs(_5653);
    float _5729 = _5717 * 0.15915493667125701904296875;
    float _5731 = fma(_5719, (*spvDescriptorSet0.vp_c9)._m0[196].y, _5721);
    float _5733 = sqrt(_5595);
    float _5735 = fma(_5725, _5083, _5731);
    float _5737 = float(_3809);
    float _5739 = _2121 + _2127;
    float _5741 = float(_5727);
    float _5743 = _5735 * 0.15915493667125701904296875;
    float _5745 = _5689;
    float _5747 = _5663;
    if (_5723)
    {
        _5657 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _5749 = _5657;
    float _5751 = _5729 * 6.283185482025146484375;
    float _5753 = sin(_5751);
    int _5755 = as_type<int>(_5749);
    if (_5723)
    {
        out.m_49.x = 0.0;
    }
    float _5757 = _5741 * _5737;
    if (_5723)
    {
        float _5759 = _5749 * 5.0;
        _5755 = as_type<int>(_5759);
    }
    int _5761 = _5755;
    float _5763 = _5739 + (-1.0);
    float _5765 = _5757 * (-2.0);
    float _5767 = _5729 * 6.283185482025146484375;
    float _5769 = cos(_5767);
    if (_5723)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _15696 = as_type<float>(_5761);
        out.gl_Position.z = _15696;
    }
    float _5771 = _5743 * 6.283185482025146484375;
    float _5773 = sin(_5771);
    if (_5723)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_59.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_59.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_59.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_59.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_61.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_61.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_61.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_61.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_67.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_67.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_67.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_67.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_71.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_71.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_71.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_71.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_79.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_79.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_79.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_79.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_81.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_81.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_81.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_81.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_89.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_89.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_89.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_89.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_73.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_73.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_73.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_73.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_77.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_77.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_77.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_77.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_95.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_95.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_95.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_95.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_99.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_99.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_99.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_99.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_97.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_97.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_97.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_97.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_49.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_49.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_49.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_49.w)); dm_cw(dm_gs, dm_p, 68, as_type<uint>(out.m_93.x)); dm_cw(dm_gs, dm_p, 69, as_type<uint>(out.m_93.y)); dm_cw(dm_gs, dm_p, 70, as_type<uint>(out.m_93.z)); dm_cw(dm_gs, dm_p, 71, as_type<uint>(out.m_93.w)); dm_cw(dm_gs, dm_p, 72, as_type<uint>(out.m_105.x)); dm_cw(dm_gs, dm_p, 73, as_type<uint>(out.m_105.y)); dm_cw(dm_gs, dm_p, 74, as_type<uint>(out.m_105.z)); dm_cw(dm_gs, dm_p, 75, as_type<uint>(out.m_105.w)); dm_cw(dm_gs, dm_p, 76, as_type<uint>(out.m_101.x)); dm_cw(dm_gs, dm_p, 77, as_type<uint>(out.m_101.y)); dm_cw(dm_gs, dm_p, 78, as_type<uint>(out.m_101.z)); dm_cw(dm_gs, dm_p, 79, as_type<uint>(out.m_101.w)); dm_cw(dm_gs, dm_p, 80, as_type<uint>(out.m_103.x)); dm_cw(dm_gs, dm_p, 81, as_type<uint>(out.m_103.y)); dm_cw(dm_gs, dm_p, 82, as_type<uint>(out.m_103.z)); dm_cw(dm_gs, dm_p, 83, as_type<uint>(out.m_103.w)); dm_cw(dm_gs, dm_p, 84, as_type<uint>(out.m_107.x)); dm_cw(dm_gs, dm_p, 85, as_type<uint>(out.m_107.y)); dm_cw(dm_gs, dm_p, 86, as_type<uint>(out.m_107.z)); dm_cw(dm_gs, dm_p, 87, as_type<uint>(out.m_107.w)); dm_cw(dm_gs, dm_p, 88, as_type<uint>(out.m_63.x)); dm_cw(dm_gs, dm_p, 89, as_type<uint>(out.m_63.y)); dm_cw(dm_gs, dm_p, 90, as_type<uint>(out.m_63.z)); dm_cw(dm_gs, dm_p, 91, as_type<uint>(out.m_63.w)); dm_cw(dm_gs, dm_p, 92, as_type<uint>(out.m_65.x)); dm_cw(dm_gs, dm_p, 93, as_type<uint>(out.m_65.y)); dm_cw(dm_gs, dm_p, 94, as_type<uint>(out.m_65.z)); dm_cw(dm_gs, dm_p, 95, as_type<uint>(out.m_65.w)); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _5775 = -_3817;
    float _5777 = _5775 + (*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _5779 = fma(_5763, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _5781 = -_3843;
    float _5783 = _5781 + (*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _5785 = -_3853;
    float _5787 = _5785 + (*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _5789 = _5777 * _5777;
    float _5791 = fma(_5765, _5603, _5603);
    float _5793 = _2127 + (-0.5);
    float _5795 = fma(_5779, _5765, _5779);
    float _5797 = fma(_5783, _5783, _5789);
    float _5799 = _5743 * 6.283185482025146484375;
    float _5801 = cos(_5799);
    float _5803 = fma(_5793, (*spvDescriptorSet0.vp_c9)._m0[196].z, _5791);
    float _5805 = _5319 * _5733;
    float _5807 = fma(_5787, _5787, _5797);
    float _5809 = _544 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _5811 = fma(_5795, _5083, _5803);
    float _5813 = _548 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _5815 = in.m_83.x;
    float _5817 = in.m_83.y;
    float _5819 = in.m_83.z;
    float _5821 = _5769 * _5773;
    float _5823 = rsqrt(_5807);
    float _5825 = _5811 * 0.15915493667125701904296875;
    float _5827 = _5753 * _5773;
    float _5829 = _5805 * _5813;
    float _5831 = _5769 * _5801;
    float _5833 = _5825 * 6.283185482025146484375;
    float _5835 = sin(_5833);
    float _5837 = _5783 * _5823;
    float _5839 = _5787 * _5823;
    float _5841 = _5777 * _5823;
    float _5843 = _5825 * 6.283185482025146484375;
    float _5845 = cos(_5843);
    float _5847 = -(*spvDescriptorSet0.vp_c8)._m0[1].z;
    float _5849 = _5837 * _5847;
    float _5851 = -(*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _5853 = _5839 * _5851;
    float _5855 = -(*spvDescriptorSet0.vp_c8)._m0[1].x;
    float _5857 = _5841 * _5855;
    float _5859 = -(*spvDescriptorSet0.vp_c8)._m0[1].x;
    float _5861 = -_5849;
    float _5863 = fma(_5839, _5859, _5861);
    float _5865 = -(*spvDescriptorSet0.vp_c8)._m0[1].z;
    float _5867 = -_5853;
    float _5869 = fma(_5841, _5865, _5867);
    float _5871 = -(*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _5873 = -_5857;
    float _5875 = fma(_5837, _5871, _5873);
    float _5877 = fma(_5835, _5831, _5827);
    float _5879 = _5863 * _5863;
    float _5881 = fma(_5835, _5827, _5831);
    float _5883 = _542 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _5885 = fma(_5869, _5869, _5879);
    float _5887 = _5753 * _5801;
    float _5889 = _5805 * _5883;
    float _5891 = fma(_5875, _5875, _5885);
    float _5893 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _5817);
    float _5895 = _5769 * _5845;
    float _5897 = _5805 * _5809;
    float _5899 = -_5821;
    float _5901 = fma(_5835, _5887, _5899);
    float _5903 = _5893 * _5889;
    float _5905 = rsqrt(_5891);
    float _5907 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _5819);
    float _5909 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _5815);
    float _5911 = _5753 * _5845;
    float _5913 = -_5887;
    float _5915 = fma(_5835, _5821, _5913);
    float _5917 = _5907 * _5897;
    float _5919 = _5909 * _5829;
    float _5921 = _5895 * _5903;
    float _5923 = _5801 * _5845;
    float _5925 = -_5903;
    float _5927 = _5835 * _5925;
    float _5929 = _5911 * _5903;
    float _5931 = fma(_5877, _5919, _5921);
    float _5933 = _5773 * _5845;
    float _5935 = fma(_5923, _5919, _5927);
    float _5937 = fma(_5901, _5919, _5929);
    float _5939 = fma(_5915, _5917, _5931);
    float _5941 = _5869 * _5905;
    float _5943 = _5863 * _5905;
    float _5945 = _5875 * _5905;
    float _5947 = fma(_5933, _5917, _5935);
    float _5949 = _5841 * _5941;
    float _5951 = _5839 * _5943;
    float _5953 = fma(_5881, _5917, _5937);
    float _5955 = _5663 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _5957 = -_5949;
    float _5959 = fma(_5837, _5943, _5957);
    float _5961 = -_5951;
    float _5963 = fma(_5841, _5945, _5961);
    float _5965 = fma(_5669, (*spvDescriptorSet0.vp_c8)._m0[11].x, _5955);
    float _5967 = _5959 * _5939;
    float _5969 = _5963 * _5939;
    float _5971 = fma(_5945, _5947, _5967);
    float _5973 = fma(_5941, _5947, _5969);
    float _5975 = _5837 * _5945;
    float _5977 = fma(_5839, _5953, _5971);
    float _5979 = fma(_5837, _5953, _5973);
    float _5981 = -_5975;
    float _5983 = fma(_5839, _5941, _5981);
    float _5985 = _3853 + _5977;
    float _5987 = _3843 + _5979;
    float _5989 = _5983 * _5939;
    float _5991 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _5993 = _5985 + _5991;
    float _5995 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _5997 = _5987 + _5995;
    float _5999 = _5993 * _5993;
    float _6001 = fma(_5997, _5997, _5999);
    float _6003 = fma(_5943, _5947, _5989);
    float _6005 = fma(_5689, (*spvDescriptorSet0.vp_c8)._m0[11].z, _5965);
    float _6007 = sqrt(_6001);
    float _6009 = fma(_5841, _5953, _6003);
    float _6011 = _3817 + _6009;
    bool _6013 = _6007 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _6015 = _6009;
    float _6017 = _5965;
    float _6019 = _5953;
    float _6021 = _5805;
    if (!_6013)
    {
        _6015 = _5987;
    }
    float _6023 = _6015;
    float _6025 = _6023;
    if (!_6013)
    {
        _6017 = _5985;
    }
    float _6027 = _6017;
    float _6029 = _6027;
    if (!_6013)
    {
        _6019 = _6011;
    }
    float _6031 = _6019;
    bool _6033 = !_6013;
    float _6035 = _6031;
    if (!_6033)
    {
        float _6037 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _6039 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _6041 = _6007 + _6039;
        float _6043 = _6011 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _6045 = rsqrt(_6001);
        float _6047 = _6041 * _6037;
        float _6049 = _6047 * 0.15915493667125701904296875;
        float _6051 = _6049 * 6.283185482025146484375;
        float _6053 = sin(_6051);
        float _6055 = _6049 * 6.283185482025146484375;
        float _6057 = cos(_6055);
        float _6059 = fma(_6053, _6043, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _6061 = _6045 * _6059;
        float _6063 = _6057 + (-1.0);
        float _6065 = fma(_5997, _6061, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _6067 = fma(_5993, _6061, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        float _6069 = _6063 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _6071 = fma(_6011, _6057, _6069);
        _6035 = _6071;
        _6025 = _6065;
        _6029 = _6067;
    }
    float _6073 = _6035;
    float _6075 = _6025;
    float _6077 = _6029;
    float _6079 = -_3817;
    float _6081 = _6079 + _6073;
    float _6083 = -_3843;
    float _6085 = _6083 + _6075;
    float _6087 = _6005 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _6089 = _5663 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _6091 = _6081 * _6081;
    float _6093 = -_3853;
    float _6095 = _6093 + _6077;
    float _6097 = 1.0 / _6087;
    float _6099 = fma(_5669, (*spvDescriptorSet0.vp_c8)._m0[10].x, _6089);
    float _6101 = fma(_6085, _6085, _6091);
    bool _6103 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[660].y;
    bool _6105 = isnan(0.5);
    bool _6107 = _6103 || _6105;
    bool _6109 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _6111 = _6107 || _6109;
    float _6113 = fma(_5689, (*spvDescriptorSet0.vp_c8)._m0[10].z, _6099);
    float _6115 = fma(_6095, _6095, _6101);
    float _6117 = _6113 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _6119 = sqrt(_6115);
    bool _6121 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[653].w;
    bool _6123 = isnan(0.5);
    bool _6125 = _6121 || _6123;
    bool _6127 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _6129 = _6125 || _6127;
    float _6131 = _6117 + _6087;
    float _6133 = _6131 * _6097;
    float _6135 = _6133 * 0.5;
    float _6137 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _6139 = fma(_6135, (*spvDescriptorSet0.vp_c8)._m0[30].w, _6137);
    float _6141 = 1.0 / _6139;
    bool _6143 = _6119 > 0.0;
    bool _6145 = !_6143;
    float _6147 = _6073;
    float _6149 = _6077;
    float _6151 = _6075;
    float _6153 = _6095;
    float _6155 = _6141;
    if (!_6145)
    {
        float _6157 = _204 * _204;
        float _6159 = fma(_202, _202, _6157);
        float _6161 = fma(_206, _206, _6159);
        float _6163 = rsqrt(_6115);
        float _6165 = sqrt(_6161);
        float _6167 = _6085 * _6163;
        float _6169 = _6081 * _6163;
        float _6171 = _6095 * _6163;
        bool _6173 = _6165 > 0.0;
        bool _6175 = !_6173;
        _6153 = _6171;
        if (!_6175)
        {
            float _6177 = rsqrt(_6161);
            float _6179 = 1.0 / (*spvDescriptorSet0.vp_c10)._m0[2].z;
            float _6181 = _204 * _6177;
            float _6183 = _202 * _6177;
            float _6185 = _6169 * _6181;
            float _6187 = _206 * _6177;
            float _6189 = fma(_6167, _6183, _6185);
            float _6191 = _6179 * (*spvDescriptorSet0.vp_c9)._m0[142].x;
            float _6193 = fma(_6171, _6187, _6189);
            float _6195 = _6193 * _6191;
            float _6197 = fma(_202, _6195, _6075);
            float _6199 = fma(_204, _6195, _6073);
            float _6201 = fma(_206, _6195, _6077);
            _6147 = _6199;
            _6149 = _6201;
            _6151 = _6197;
        }
    }
    float _6203 = _6147;
    float _6205 = _6149;
    float _6207 = _6151;
    float _6209 = _6153;
    float _6211 = -_5361;
    float _6213 = fma(_6211, (*spvDescriptorSet0.vp_c9)._m0[18].w, _6203);
    float _6215 = -_5569;
    float _6217 = fma(_6215, (*spvDescriptorSet0.vp_c9)._m0[18].w, _6205);
    float _6219 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _6221 = _6141 * _6219;
    float _6223 = -_5365;
    float _6225 = fma(_6223, (*spvDescriptorSet0.vp_c9)._m0[18].w, _6207);
    float _6227 = _6209;
    float _6229 = _6225;
    float _6231 = _6217;
    float _6233 = _6207;
    float _6235 = _6203;
    if (_6129)
    {
        _6227 = 1.0;
    }
    float _6237 = _6227;
    float _6239 = _6237;
    if (_6111)
    {
        _6155 = _6213;
    }
    float _6241 = _6155;
    float _6243 = _6241;
    if (!_6111)
    {
        float _6245 = _5675 * _5675;
        float _6247 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _6249 = -_3853;
        float _6251 = _6249 + _6205;
        float _6253 = -_3817;
        float _6255 = _6253 + _6203;
        float _6257 = fma(_5681, _5681, _6245);
        float _6259 = fma(_5703, _5703, _6257);
        float _6261 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _6263 = sqrt(_6259);
        float _6265 = 1.0 / _5805;
        float _6267 = _6261 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _6269 = precise::min(_6263, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _6271 = _6269 * _6247;
        float _6273 = _6271 * _6265;
        float _6275 = -_3843;
        float _6277 = _6275 + _6207;
        float _6279 = _6267 * _6273;
        float _6281 = _6251 * _6273;
        float _6283 = fma(_6277, _6279, _5669);
        float _6285 = fma(_6255, _6279, _5663);
        float _6287 = fma(_6267, _6281, _5689);
        _6243 = _6285;
        _6229 = _6283;
        _6231 = _6287;
    }
    float _6289 = _6243;
    float _6291 = _6229;
    float _6293 = _6231;
    if (!_6129)
    {
        float _6295 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _6297 = _6295 * 0.15915493667125701904296875;
        float _6299 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _6301 = _6297 * 6.283185482025146484375;
        float _6303 = cos(_6301);
        float _6305 = _6299 * 0.15915493667125701904296875;
        float _6307 = _6297 * 6.283185482025146484375;
        float _6309 = sin(_6307);
        float _6311 = 1.0 / _6303;
        float _6313 = _6305 * 6.283185482025146484375;
        float _6315 = cos(_6313);
        float _6317 = _6309 * _6311;
        float _6319 = _6305 * 6.283185482025146484375;
        float _6321 = sin(_6319);
        float _6323 = _6315 * _6317;
        float _6325 = 1.0 / _6323;
        float _6327 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _6329 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _6327;
        float _6331 = 1.0 / _6329;
        float _6333 = _6321 * _6325;
        float _6335 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _6337 = fma(_6221, _6333, _6335);
        float _6339 = _6337 * _6331;
        float _6341 = precise::clamp(_6339, 0.0, 1.0);
        _6233 = _6297;
        _6021 = _6305;
        _6239 = _6341;
    }
    float _6343 = _6233;
    float _6345 = _6021;
    float _6347 = _6239;
    float _6349 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _6351 = _6289 + _6349;
    float _6353 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _6355 = _6291 + _6353;
    float _6357 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _6359 = _6293 + _6357;
    float _6361 = _6351 * _6351;
    float _6363 = fma(_6355, _6355, _6361);
    float _6365 = fma(_6359, _6359, _6363);
    float _6367 = rsqrt(_6365);
    float _6369 = sqrt(_6365);
    float _6371 = _6367 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _6373 = _6355 * _6371;
    float _6375 = _6359 * _6371;
    float _6377 = _6373 * _6373;
    float _6379 = _6375 * _6375;
    float _6381 = _6377 + _6379;
    float _6383 = sqrt(_6381);
    bool _6385 = _6383 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _6387 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _6389 = _6383 + _6387;
    float _6391 = _6367;
    float _6393 = _6389;
    float _6395 = _6343;
    float _6397 = _6351;
    if (_6385)
    {
        float _6399 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _6391 = _6399;
    }
    float _6401 = _6391;
    float _6403 = _6401;
    if (_6385)
    {
        float _6405 = _6389 * _6401;
        _6393 = _6405;
    }
    float _6407 = _6393;
    if (_6385)
    {
        float _6409 = rsqrt(_6381);
        _6403 = _6409;
    }
    float _6411 = _6403;
    float _6413 = _6411;
    if (_6385)
    {
        float _6415 = _6407 * 0.15915493667125701904296875;
        _6395 = _6415;
    }
    float _6417 = _6395;
    float _6419 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _6421 = _6359;
    if (_6385)
    {
        float _6423 = _6417 * 6.283185482025146484375;
        float _6425 = sin(_6423);
        _6421 = _6425;
    }
    float _6427 = _6421;
    float _6429 = precise::max(0.0, _6419);
    float _6431 = _6345;
    float _6433 = _6429;
    if (_6385)
    {
        float _6435 = _6417 * 6.283185482025146484375;
        float _6437 = cos(_6435);
        _6431 = _6437;
    }
    float _6439 = _6431;
    float _6441 = -_6371;
    float _6443 = -_6429;
    float _6445 = fma(_6351, _6441, _6443);
    if (_6385)
    {
        float _6447 = _6445 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _6397 = _6447;
    }
    float _6449 = _6397;
    float _6451 = _6427;
    float _6453 = _6449;
    if (_6385)
    {
        float _6455 = fma(_6427, _6449, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _210 = _6455;
    }
    float _6457 = _210;
    if (!_6385)
    {
        _6451 = _6445;
    }
    float _6459 = _6451;
    float _6461 = _6459;
    if (_6385)
    {
        float _6463 = _6411 * _6457;
        _6235 = _6463;
    }
    float _6465 = _6235;
    if (!_6385)
    {
        _6413 = _6373;
    }
    float _6467 = _6413;
    float _6469 = _6467;
    float _6471 = _6439;
    if (_6385)
    {
        float _6473 = _6439 + (-1.0);
        _6433 = _6473;
    }
    float _6475 = _6433;
    float _6477 = _6475;
    if (_6385)
    {
        float _6479 = _6373 * _6465;
        _6469 = _6479;
    }
    float _6481 = _6469;
    if (_6385)
    {
        float _6483 = _6475 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _6453 = _6483;
    }
    float _6485 = _6453;
    float _6487 = _6485;
    if (!_6385)
    {
        _6477 = _6375;
    }
    float _6489 = _6477;
    float _6491 = _6489;
    if (_6385)
    {
        float _6493 = _6375 * _6465;
        _6491 = _6493;
    }
    float _6495 = _6491;
    float _6497 = fma(_5669, (*spvDescriptorSet0.vp_c15)._m0[652].x, (*spvDescriptorSet0.vp_c15)._m0[652].z);
    if (_6385)
    {
        float _6499 = fma(_6445, _6439, _6485);
        _6461 = _6499;
    }
    float _6501 = _6461;
    if (!_6385)
    {
        _6487 = _6377;
    }
    float _6503 = _6487;
    float _6505 = _6503;
    if (_6385)
    {
        float _6507 = _6481 * _6481;
        _6505 = _6507;
    }
    float _6509 = _6505;
    if (!_6385)
    {
        _6471 = _6379;
    }
    float _6511 = _6471;
    float _6513 = _6511;
    if (_6385)
    {
        float _6515 = _6495 * _6495;
        _6513 = _6515;
    }
    float _6517 = _6513;
    float _6519 = fma(_6501, _6501, _6509);
    float _6521 = _6289 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _6523 = _6289 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _6525 = floor(_6497);
    float _6527 = _6519 + _6517;
    float _6529 = fma(_6291, (*spvDescriptorSet0.vp_c8)._m0[2].x, _6521);
    float _6531 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _6533 = fma(_6369, (*spvDescriptorSet0.vp_c15)._m0[23].w, _6531);
    float _6535 = precise::clamp(_6533, 0.0, 1.0);
    float _6537 = fma(_6291, (*spvDescriptorSet0.vp_c8)._m0[3].x, _6523);
    float _6539 = fma(_6293, (*spvDescriptorSet0.vp_c8)._m0[2].z, _6529);
    float _6541 = -_6535;
    float _6543 = _6541 + 1.0;
    float _6545 = rsqrt(_6527);
    float _6547 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _6549 = _6539 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _6551 = fma(_6293, (*spvDescriptorSet0.vp_c8)._m0[3].z, _6537);
    float _6553 = _6549 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _6555 = abs(_6543);
    float _6557 = log2(_6555);
    float _6559 = _6289 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _6561 = -_6553;
    float _6563 = fma(_6561, _6547, 1.0);
    float _6565 = _6289 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _6567 = _6551 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _6569 = fma(_6291, (*spvDescriptorSet0.vp_c8)._m0[1].x, _6559);
    float _6571 = fma(_5689, (*spvDescriptorSet0.vp_c15)._m0[652].y, (*spvDescriptorSet0.vp_c15)._m0[652].w);
    float _6573 = fma(_6291, (*spvDescriptorSet0.vp_c8)._m0[0].x, _6565);
    float _6575 = _6545 * _6481;
    float _6577 = fma(_6293, (*spvDescriptorSet0.vp_c8)._m0[1].z, _6569);
    float _6579 = _6545 * _6501;
    float _6581 = fma(_6293, (*spvDescriptorSet0.vp_c8)._m0[0].z, _6573);
    float _6583 = _6545 * _6495;
    float _6585 = _6577 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _6587 = _6575 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _6589 = _6581 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _6591 = floor(_6571);
    float _6593 = _6585 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _6595 = -_6587;
    float _6597 = fma(_6579, (*spvDescriptorSet0.vp_c15)._m0[21].y, _6595);
    float _6599 = _6557 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _6601 = -_6525;
    float _6603 = _6497 + _6601;
    float _6605 = fma(_6589, (*spvDescriptorSet0.vp_c8)._m0[7].x, _6593);
    float _6607 = -_6583;
    float _6609 = fma(_6607, (*spvDescriptorSet0.vp_c15)._m0[21].z, _6597);
    float _6611 = log2(_6563);
    float _6613 = fma(_6549, (*spvDescriptorSet0.vp_c8)._m0[7].z, _6605);
    float _6615 = fma(_6609, -0.5, 0.5);
    float _6617 = _6585 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _6619 = fma(_6609, 0.5, 0.5);
    float _6621 = fma(_6567, (*spvDescriptorSet0.vp_c8)._m0[7].w, _6613);
    float _6623 = fma(_6589, (*spvDescriptorSet0.vp_c8)._m0[4].x, _6617);
    float _6625 = exp2(_6599);
    float _6627 = _6585 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _6629 = fma(_6619, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _6631 = fma(_6549, (*spvDescriptorSet0.vp_c8)._m0[4].z, _6623);
    float _6633 = -_6591;
    float _6635 = _6571 + _6633;
    float _6637 = fma(_6589, (*spvDescriptorSet0.vp_c8)._m0[5].x, _6627);
    float _6639 = fma(_6619, _6629, -0.212114393711090087890625);
    float _6641 = fma(_6567, (*spvDescriptorSet0.vp_c8)._m0[4].w, _6631);
    float _6643 = 1.0 / _6621;
    float _6645 = fma(_6549, (*spvDescriptorSet0.vp_c8)._m0[5].z, _6637);
    float _6647 = _6611 * 0.693147182464599609375;
    float _6649 = sqrt(_6615);
    float _6651 = fma(_6567, (*spvDescriptorSet0.vp_c8)._m0[5].w, _6645);
    float2 _17089 = float2(_6603, _6635);
    float _6653 = dm_bs(spvDescriptorSet0.vp_t_tcb_24.sample(spvDescriptorSet0.vp_t_tcb_24Smplr, select(_17089, float2(0.0), isnan(_17089)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_24, spvDescriptorSet0.vp_t_tcb_24Smplr_w, select(_17089, float2(0.0), isnan(_17089)), level(0.0)).x;
    float _6655 = fma(_6619, _6639, 1.570728778839111328125);
    float _6657 = _6647 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _6659 = _6641 * _6643;
    float _6661 = _6579 + 1.0;
    float _6663 = _6651 * _6643;
    float _6665 = fma(_6659, 0.5, 0.5);
    float _6667 = -_6579;
    float _6669 = fma(_6625, _6661, _6667);
    float _6671 = fma(_6663, -0.5, 0.5);
    float _6673 = _6649 * 0.636619746685028076171875;
    float _6675 = fma(_6669, 0.5, 0.5);
    float3 _17131 = float3(_6665, _6671, _6657);
    float _6677 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_17131, float3(0.0), isnan(_17131)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_17131, float3(0.0), isnan(_17131)), level(0.0)).x;
    float3 _17142 = float3(_6665, _6671, _6657);
    float4 _6680 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_17142, float3(0.0), isnan(_17142)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_17142, float3(0.0), isnan(_17142)), level(0.0)).xyzw;
    float _6682 = _6680.x;
    float _6684 = _6680.y;
    float _6686 = _6680.z;
    float _6688 = _6680.w;
    float _6690 = -_6655;
    float _6692 = fma(_6673, _6690, 1.0);
    float2 _17163 = float2(_6692, _6675);
    float3 _6696 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_17163, float2(0.0), isnan(_17163)), level(0.0)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_17163, float2(0.0), isnan(_17163)), level(0.0)).xyz;
    float _6698 = _6696.x;
    float _6700 = _6696.y;
    float _6702 = _6696.z;
    float _6704 = abs(_6221);
    float _6706 = log2(_6704);
    float _6708 = in.m_85.x;
    float _6710 = in.m_85.y;
    float _6712 = in.m_85.z;
    bool _6714 = _5817 != 0.0;
    bool _6716 = isnan(_5817);
    bool _6718 = _6714 || _6716;
    bool _6720 = isnan(0.0);
    bool _6722 = _6718 || _6720;
    float _6724 = _5915 * _5983;
    float _6726 = in.m_87.x;
    float _6728 = in.m_87.y;
    float _6730 = in.m_87.z;
    float _6732 = in.m_87.w;
    bool _6734 = _5815 == 0.0;
    bool _6736 = !_6722;
    bool _6738 = _6734 && _6736;
    float _6740 = fma(_5933, _5943, _6724);
    out.m_89.x = _5669;
    out.m_89.y = _5663;
    out.m_89.z = _5689;
    bool _6742 = _5819 == 0.0;
    bool _6744 = _6742 && _6738;
    bool _6746 = _6221 <= 8000.0;
    bool _6748 = isnan(_6221);
    bool _6750 = _6746 || _6748;
    bool _6752 = isnan(8000.0);
    bool _6754 = _6750 || _6752;
    float _6756 = float(_6754);
    float _6758 = _6706 * (*spvDescriptorSet0.vp_c15)._m0[654].z;
    float _6760 = exp2(_6758);
    float _6762 = _6671;
    float _6764 = _6665;
    float _6766 = _6708;
    float _6768 = _6621;
    float _6770 = _6651;
    if (_6744)
    {
        _5659 = _6710;
    }
    float _6772 = _5659;
    float _6774 = _6772;
    if (_6744)
    {
        _4861 = _6708;
    }
    float _6776 = _4861;
    float _6778 = _6776;
    if (_6744)
    {
        _6762 = _6772;
    }
    float _6780 = _6762;
    float _6782 = _6780;
    if (!_6744)
    {
        _6774 = _6710;
    }
    float _6784 = _6774;
    if (_6744)
    {
        _6764 = _6776;
    }
    float _6786 = _6764;
    float _6788 = _6786;
    if (!_6744)
    {
        _6778 = _6708;
    }
    float _6790 = _6778;
    if (!_6744)
    {
        float _6792 = fma(_5817, (*spvDescriptorSet0.vp_c9)._m0[17].y, _6784);
        _6782 = _6792;
    }
    float _6794 = _6782;
    float _6796 = _6728 * _6712;
    float _6798 = fma(_6760, (*spvDescriptorSet0.vp_c15)._m0[654].x, (*spvDescriptorSet0.vp_c15)._m0[654].y);
    float _6800 = precise::clamp(_6798, 0.0, 1.0);
    if (_6744)
    {
        _6766 = _6712;
    }
    float _6802 = _6766;
    float _6804 = _6802;
    if (!_6744)
    {
        float _6806 = fma(_5815, (*spvDescriptorSet0.vp_c9)._m0[17].y, _6790);
        _6788 = _6806;
    }
    float _6808 = _6788;
    if (!_6744)
    {
        float _6810 = fma(_5819, (*spvDescriptorSet0.vp_c9)._m0[17].y, _6712);
        _6804 = _6810;
    }
    float _6812 = _6804;
    float _6814 = _6730 * _6790;
    float _6816 = _6726 * _6784;
    float _6818 = -_6796;
    float _6820 = fma(_6730, _6784, _6818);
    float _6822 = fma(_6800, -2.0, 3.0);
    float _6824 = _6800 * _6800;
    float _6826 = -_6814;
    float _6828 = fma(_6726, _6712, _6826);
    float _6830 = -_6816;
    float _6832 = fma(_6728, _6790, _6830);
    float _6834 = _5877 * _5963;
    float _6836 = _6824 * _6822;
    float _6838 = _5895 * _5963;
    float _6840 = _5895 * _5983;
    float _6842 = _6828 * _6732;
    float _6844 = _6820 * _6732;
    float _6846 = _5895 * _5959;
    float _6848 = _6832 * _6732;
    float _6850 = _5877 * _5983;
    float _6852 = _5877 * _5959;
    float _6854 = _5915 * _5963;
    float _6856 = _5915 * _5959;
    float _6858 = fma(_5923, _5941, _6834);
    float _6860 = -_5835;
    float _6862 = fma(_6860, _5941, _6838);
    float _6864 = -_5835;
    float _6866 = fma(_6864, _5943, _6840);
    float _6868 = -_5835;
    float _6870 = fma(_6868, _5945, _6846);
    float _6872 = fma(_5923, _5943, _6850);
    float _6874 = fma(_5923, _5945, _6852);
    float _6876 = -_6836;
    float _6878 = _6876 + 1.0;
    float _6880 = fma(_5901, _5837, _6858);
    float _6882 = fma(_5933, _5941, _6854);
    float _6884 = fma(_5933, _5945, _6856);
    float _6886 = fma(_5911, _5837, _6862);
    float _6888 = fma(_5911, _5841, _6866);
    float _6890 = fma(_5911, _5839, _6870);
    float _6892 = fma(_5901, _5841, _6872);
    float _6894 = fma(_6878, (*spvDescriptorSet0.vp_c15)._m0[654].w, _6836);
    float _6896 = fma(_5901, _5839, _6874);
    float _6898 = fma(_5881, _5841, _6740);
    float _6900 = fma(_5881, _5837, _6882);
    float _6902 = fma(_5881, _5839, _6884);
    float _6904 = _6886 * _6728;
    float _6906 = _6888 * _6728;
    float _6908 = _6890 * _6728;
    float _6910 = _6842 * _6886;
    float _6912 = _6842 * _6888;
    float _6914 = _6842 * _6890;
    float _6916 = _6585 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _6918 = _6756 * _6894;
    float _6920 = _6886 * _6794;
    float _6922 = _6888 * _6794;
    float _6924 = fma(_6589, (*spvDescriptorSet0.vp_c8)._m0[6].x, _6916);
    float _6926 = _6890 * _6794;
    float _6928 = fma(_6880, _6808, _6920);
    float _6930 = fma(_6880, _6726, _6904);
    float _6932 = fma(_6549, (*spvDescriptorSet0.vp_c8)._m0[6].z, _6924);
    float _6934 = _6557 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _6936 = fma(_6892, _6726, _6906);
    float _6938 = fma(_6844, _6880, _6910);
    float _6940 = fma(_6844, _6892, _6912);
    float _6942 = fma(_6844, _6896, _6914);
    float _6944 = exp2(_6934);
    float _6946 = fma(_6896, _6726, _6908);
    float _6948 = fma(_6892, _6808, _6922);
    float _6950 = fma(_6900, _6730, _6930);
    float _6952 = fma(_6898, _6730, _6936);
    float _6954 = fma(_6848, _6900, _6938);
    float _6956 = fma(_6848, _6898, _6940);
    float _6958 = fma(_6848, _6902, _6942);
    float _6960 = fma(_6902, _6730, _6946);
    float _6962 = in.m_91.x;
    float _6964 = _6918 * (*spvDescriptorSet0.vp_c15)._m0[653].x;
    float _6966 = fma(_6567, (*spvDescriptorSet0.vp_c8)._m0[6].w, _6932);
    float _6968 = fma(_6896, _6808, _6926);
    out.m_93.x = _6950;
    out.m_93.y = _6952;
    out.m_93.z = _6960;
    float _6970 = _6966 + _6621;
    float _6972 = -_6944;
    float _6974 = _6972 + 1.0;
    float _6976 = fma(_6898, _6812, _6948);
    out.m_95.x = _6954;
    out.m_95.y = _6956;
    out.m_95.z = _6958;
    float _6978 = _6970 * 0.5;
    float _6980 = _6974 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _6982 = fma(_6900, _6812, _6928);
    float _6984 = fma(_6902, _6812, _6968);
    bool _6986 = _6369 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _6988 = isnan(_6369);
    bool _6990 = _6986 || _6988;
    bool _6992 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _6994 = _6990 || _6992;
    float _6996 = -_6980;
    float _6998 = _6996 + 1.0;
    out.m_97.z = _6978;
    out.m_97.w = _6621;
    out.m_99.x = _6982;
    out.m_99.y = _6976;
    out.m_99.z = _6984;
    out.gl_Position.x = _6641;
    out.gl_Position.y = _6651;
    out.gl_Position.z = _6966;
    out.gl_Position.w = _6621;
    float _7000 = _6641;
    float _7002 = _6998;
    if (!_6994)
    {
        _5745 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _7004 = _5745;
    float _7006 = _7004;
    float _7008 = _7004;
    if (!_6994)
    {
        _5747 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _7010 = _5747;
    float _7012 = _6347 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _7014 = _7010;
    float _7016 = _7010;
    if (!_6994)
    {
        _6768 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _7018 = _6768;
    float _7020 = _7018;
    float _7022 = _7018;
    if (!_6994)
    {
        _7000 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _7024 = _7000;
    float _7026 = _7024;
    float _7028 = _7024;
    if (!_6994)
    {
        _6770 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _7030 = _6770;
    float _7032 = -_6653;
    float _7034 = _7032 + 1.0;
    float _7036 = _7034 * _6964;
    float _7038 = precise::clamp(_7036, 0.0, 1.0);
    float _7040 = -_7038;
    float _7042 = fma(_7040, (*spvDescriptorSet0.vp_c15)._m0[653].y, 1.0);
    float _7044 = _7042 * _6962;
    float _7046 = _6980 * _6677;
    float _7048 = _7044 * (*spvDescriptorSet0.vp_c13)._m0[1].w;
    float _7050 = _6688 * _6998;
    float _7052 = _7030;
    float _7054 = _7030;
    if (!_6994)
    {
        _7002 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _7056 = _7002;
    float _7058 = _6688 * _7046;
    out.m_101.x = _7048;
    float _7060 = _6702 * _7046;
    float _7062 = fma(_6698, _7058, _6682);
    float _7064 = fma(_6700, _7058, _6684);
    float _7066 = fma(_6688, _7060, _6686);
    out.m_103.x = _7062;
    out.m_103.y = _7064;
    out.m_103.z = _7066;
    out.m_103.w = _7050;
    bool _7068 = !_6994;
    float _7070 = _7056;
    float _7072 = _7056;
    if (!_7068)
    {
        bool _7074 = _6369 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _7076 = isnan(_6369);
        bool _7078 = _7074 || _7076;
        bool _7080 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _7082 = _7078 || _7080;
        if (!_7082)
        {
            float _7084 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _7086 = _6369 + _7084;
            float _7088 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _7090 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _7088;
            float _7092 = 1.0 / _7090;
            float _7094 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _7096 = _7094 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _7098 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _7100 = _7098 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _7102 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _7104 = _7102 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _7106 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _7108 = _7106 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _7110 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _7112 = _7110 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _7114 = _7086 * _7092;
            float _7116 = precise::clamp(_7114, 0.0, 1.0);
            float _7118 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _7120 = _7118 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _7122 = fma(_7116, _7100, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _7124 = fma(_7116, _7120, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _7126 = fma(_7116, _7096, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _7128 = fma(_7116, _7104, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _7130 = fma(_7116, _7108, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _7132 = fma(_7116, _7112, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            _7016 = _7126;
            _7028 = _7130;
            _7008 = _7124;
            _7022 = _7128;
            _7072 = _7122;
            _7054 = _7132;
            _7134 = true;
        }
        else
        {
            bool _7136 = _6369 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _7138 = isnan(_6369);
            bool _7140 = _7136 || _7138;
            bool _7142 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _7144 = _7140 || _7142;
            if (!_7144)
            {
                _7020 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _7146 = _7020;
            _7022 = _7146;
            if (!_7144)
            {
                _7026 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _7148 = _7026;
            _7028 = _7148;
            if (!_7144)
            {
                _7052 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _7150 = _7052;
            _7054 = _7150;
            if (!_7144)
            {
                _7006 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _7152 = _7006;
            _7008 = _7152;
            if (!_7144)
            {
                _7014 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _7154 = _7014;
            _7016 = _7154;
            if (!_7144)
            {
                _7070 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _7156 = _7070;
            bool _7158 = !_7144;
            _7072 = _7156;
            if (!_7158)
            {
                bool _7160 = _6369 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _7162 = isnan(_6369);
                bool _7164 = _7160 || _7162;
                bool _7166 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _7168 = _7164 || _7166;
                if (!_7168)
                {
                    float _7170 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _7172 = _6369 + _7170;
                    float _7174 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _7176 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _7174;
                    float _7178 = 1.0 / _7176;
                    float _7180 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _7182 = _7180 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _7184 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _7186 = _7184 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _7188 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _7190 = _7188 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _7192 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _7194 = _7192 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _7196 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _7198 = _7196 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _7200 = _7172 * _7178;
                    float _7202 = precise::clamp(_7200, 0.0, 1.0);
                    float _7204 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _7206 = _7204 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _7208 = fma(_7202, _7186, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _7210 = fma(_7202, _7206, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _7212 = fma(_7202, _7182, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _7214 = fma(_7202, _7190, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _7216 = fma(_7202, _7194, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _7218 = fma(_7202, _7198, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    _7016 = _7212;
                    _7028 = _7216;
                    _7008 = _7210;
                    _7022 = _7214;
                    _7072 = _7208;
                    _7054 = _7218;
                    _7134 = true;
                }
                else
                {
                    _7016 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _7028 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _7008 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _7022 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _7072 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _7054 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _7134 = false;
    float _7220 = _7016;
    float _7222 = _7028;
    float _7224 = _7008;
    float _7226 = _7022;
    float _7228 = _7072;
    float _7230 = _7054;
    float _7232 = fma(_6976, -0.5, 0.5);
    float _7234 = precise::clamp(_7232, 0.0, 1.0);
    float _7236 = -_7220;
    float _7238 = _7222 + _7236;
    float _7240 = _7012 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _7242 = -_7224;
    float _7244 = _7226 + _7242;
    float _7246 = fma(_7234, _7238, _7220);
    out.m_105.x = 0.0;
    float _7248 = -_7228;
    float _7250 = _7230 + _7248;
    float _7252 = fma(_7234, _7244, _7224);
    float _7254 = _7246 * 0.586610972881317138671875;
    out.m_49.x = _7240;
    bool _7256 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _7258 = fma(_7234, _7250, _7228);
    float _7260 = fma(_7252, 0.298911988735198974609375, _7254);
    bool _7262 = _6347 > 0.0;
    bool _7264 = isnan(_6347);
    bool _7266 = _7262 || _7264;
    bool _7268 = isnan(0.0);
    bool _7270 = _7266 || _7268;
    float _7272 = fma(_7258, 0.114477999508380889892578125, _7260);
    float _7274 = -_7272;
    float _7276 = _7252 + _7274;
    float _7278 = -_7272;
    float _7280 = _7246 + _7278;
    float _7282 = -_7272;
    float _7284 = _7258 + _7282;
    float _7286 = fma(_7276, (*spvDescriptorSet0.vp_c13)._m0[1].z, _7272);
    float _7288 = fma(_7280, (*spvDescriptorSet0.vp_c13)._m0[1].z, _7272);
    float _7290 = fma(_7284, (*spvDescriptorSet0.vp_c13)._m0[1].z, _7272);
    bool _7292 = !_7256;
    if (!_7292)
    {
        float _7294 = -_6289;
        float _7296 = _7294 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
        float _7298 = -_6291;
        float _7300 = _7298 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
        float _7302 = -_6293;
        float _7304 = _7302 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
        float _7306 = _7296 * _7296;
        float _7308 = fma(_7300, _7300, _7306);
        float _7310 = fma(_7304, _7304, _7308);
        float _7312 = sqrt(_7310);
        float _7314 = rsqrt(_7310);
        float _7316 = -_7312;
        float _7318 = _7316 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
        float _7320 = _7318 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
        float _7322 = precise::clamp(_7320, 0.0, 1.0);
        float _7324 = _7300 * _7314;
        float _7326 = _7296 * _7314;
        float _7328 = abs(_7322);
        float _7330 = log2(_7328);
        float _7332 = _7304 * _7314;
        float _7334 = _7324 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
        float _7336 = _6976 * _7326;
        float _7338 = -_7326;
        float _7340 = -_7334;
        float _7342 = fma(_7338, (*spvDescriptorSet0.vp_c15)._m0[656].y, _7340);
        float _7344 = fma(_6982, _7324, _7336);
        float _7346 = -_7332;
        float _7348 = fma(_7346, (*spvDescriptorSet0.vp_c15)._m0[656].z, _7342);
        float _7350 = fma(_6984, _7332, _7344);
        float _7352 = precise::clamp(_7350, 0.0, 1.0);
        float _7354 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
        float _7356 = _7348 + _7354;
        float _7358 = _7330 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
        float _7360 = _7356 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
        float _7362 = precise::clamp(_7360, 0.0, 1.0);
        float _7364 = exp2(_7358);
        float _7366 = _7364 * _7362;
        float _7368 = _7352 * _7366;
        float _7370 = _7368 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
        float _7372 = _7368 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
        float _7374 = _7368 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
        out.m_105.x = _7370;
        out.m_105.y = _7372;
        out.m_105.z = _7374;
    }
    out.m_107.x = _7286;
    out.m_107.y = _7288;
    out.m_107.z = _7290;
    if (_7270)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_59.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_59.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_59.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_59.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_61.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_61.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_61.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_61.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_67.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_67.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_67.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_67.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_71.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_71.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_71.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_71.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_79.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_79.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_79.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_79.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_81.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_81.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_81.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_81.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_89.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_89.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_89.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_89.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_73.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_73.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_73.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_73.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_77.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_77.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_77.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_77.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_95.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_95.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_95.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_95.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_99.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_99.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_99.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_99.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_97.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_97.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_97.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_97.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_49.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_49.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_49.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_49.w)); dm_cw(dm_gs, dm_p, 68, as_type<uint>(out.m_93.x)); dm_cw(dm_gs, dm_p, 69, as_type<uint>(out.m_93.y)); dm_cw(dm_gs, dm_p, 70, as_type<uint>(out.m_93.z)); dm_cw(dm_gs, dm_p, 71, as_type<uint>(out.m_93.w)); dm_cw(dm_gs, dm_p, 72, as_type<uint>(out.m_105.x)); dm_cw(dm_gs, dm_p, 73, as_type<uint>(out.m_105.y)); dm_cw(dm_gs, dm_p, 74, as_type<uint>(out.m_105.z)); dm_cw(dm_gs, dm_p, 75, as_type<uint>(out.m_105.w)); dm_cw(dm_gs, dm_p, 76, as_type<uint>(out.m_101.x)); dm_cw(dm_gs, dm_p, 77, as_type<uint>(out.m_101.y)); dm_cw(dm_gs, dm_p, 78, as_type<uint>(out.m_101.z)); dm_cw(dm_gs, dm_p, 79, as_type<uint>(out.m_101.w)); dm_cw(dm_gs, dm_p, 80, as_type<uint>(out.m_103.x)); dm_cw(dm_gs, dm_p, 81, as_type<uint>(out.m_103.y)); dm_cw(dm_gs, dm_p, 82, as_type<uint>(out.m_103.z)); dm_cw(dm_gs, dm_p, 83, as_type<uint>(out.m_103.w)); dm_cw(dm_gs, dm_p, 84, as_type<uint>(out.m_107.x)); dm_cw(dm_gs, dm_p, 85, as_type<uint>(out.m_107.y)); dm_cw(dm_gs, dm_p, 86, as_type<uint>(out.m_107.z)); dm_cw(dm_gs, dm_p, 87, as_type<uint>(out.m_107.w)); dm_cw(dm_gs, dm_p, 88, as_type<uint>(out.m_63.x)); dm_cw(dm_gs, dm_p, 89, as_type<uint>(out.m_63.y)); dm_cw(dm_gs, dm_p, 90, as_type<uint>(out.m_63.z)); dm_cw(dm_gs, dm_p, 91, as_type<uint>(out.m_63.w)); dm_cw(dm_gs, dm_p, 92, as_type<uint>(out.m_65.x)); dm_cw(dm_gs, dm_p, 93, as_type<uint>(out.m_65.y)); dm_cw(dm_gs, dm_p, 94, as_type<uint>(out.m_65.z)); dm_cw(dm_gs, dm_p, 95, as_type<uint>(out.m_65.w)); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _7376 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.m_49.x = 0.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _7376;
    { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_59.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_59.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_59.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_59.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_61.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_61.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_61.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_61.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_67.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_67.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_67.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_67.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_71.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_71.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_71.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_71.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_79.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_79.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_79.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_79.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_81.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_81.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_81.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_81.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_89.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_89.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_89.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_89.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_73.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_73.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_73.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_73.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_77.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_77.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_77.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_77.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_95.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_95.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_95.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_95.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_99.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_99.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_99.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_99.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_97.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_97.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_97.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_97.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_49.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_49.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_49.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_49.w)); dm_cw(dm_gs, dm_p, 68, as_type<uint>(out.m_93.x)); dm_cw(dm_gs, dm_p, 69, as_type<uint>(out.m_93.y)); dm_cw(dm_gs, dm_p, 70, as_type<uint>(out.m_93.z)); dm_cw(dm_gs, dm_p, 71, as_type<uint>(out.m_93.w)); dm_cw(dm_gs, dm_p, 72, as_type<uint>(out.m_105.x)); dm_cw(dm_gs, dm_p, 73, as_type<uint>(out.m_105.y)); dm_cw(dm_gs, dm_p, 74, as_type<uint>(out.m_105.z)); dm_cw(dm_gs, dm_p, 75, as_type<uint>(out.m_105.w)); dm_cw(dm_gs, dm_p, 76, as_type<uint>(out.m_101.x)); dm_cw(dm_gs, dm_p, 77, as_type<uint>(out.m_101.y)); dm_cw(dm_gs, dm_p, 78, as_type<uint>(out.m_101.z)); dm_cw(dm_gs, dm_p, 79, as_type<uint>(out.m_101.w)); dm_cw(dm_gs, dm_p, 80, as_type<uint>(out.m_103.x)); dm_cw(dm_gs, dm_p, 81, as_type<uint>(out.m_103.y)); dm_cw(dm_gs, dm_p, 82, as_type<uint>(out.m_103.z)); dm_cw(dm_gs, dm_p, 83, as_type<uint>(out.m_103.w)); dm_cw(dm_gs, dm_p, 84, as_type<uint>(out.m_107.x)); dm_cw(dm_gs, dm_p, 85, as_type<uint>(out.m_107.y)); dm_cw(dm_gs, dm_p, 86, as_type<uint>(out.m_107.z)); dm_cw(dm_gs, dm_p, 87, as_type<uint>(out.m_107.w)); dm_cw(dm_gs, dm_p, 88, as_type<uint>(out.m_63.x)); dm_cw(dm_gs, dm_p, 89, as_type<uint>(out.m_63.y)); dm_cw(dm_gs, dm_p, 90, as_type<uint>(out.m_63.z)); dm_cw(dm_gs, dm_p, 91, as_type<uint>(out.m_63.w)); dm_cw(dm_gs, dm_p, 92, as_type<uint>(out.m_65.x)); dm_cw(dm_gs, dm_p, 93, as_type<uint>(out.m_65.y)); dm_cw(dm_gs, dm_p, 94, as_type<uint>(out.m_65.z)); dm_cw(dm_gs, dm_p, 95, as_type<uint>(out.m_65.w)); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
}

