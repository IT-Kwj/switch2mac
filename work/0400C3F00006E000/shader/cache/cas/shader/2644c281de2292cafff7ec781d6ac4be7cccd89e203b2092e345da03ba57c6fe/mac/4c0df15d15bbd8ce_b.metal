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
    float4 m_67 [[user(locn1)]];
    float4 m_49 [[user(locn2)]];
    float4 m_89 [[user(locn3)]];
    float4 m_63 [[user(locn4)]];
    float4 m_69 [[user(locn5)]];
    float4 m_81 [[user(locn6)]];
    float4 m_71 [[user(locn7)]];
    float4 m_79 [[user(locn8)]];
    float4 m_87 [[user(locn9)]];
    float4 m_83 [[user(locn10)]];
    float4 m_85 [[user(locn11)]];
    float4 gl_Position [[position, invariant]];
    float gl_PointSize [[point_size]];
};

struct main0_in
{
    float4 m_77 [[attribute(0)]];
    float4 m_53 [[attribute(2)]];
    float4 m_46 [[attribute(3)]];
    float4 m_51 [[attribute(4)]];
    float4 m_75 [[attribute(5)]];
    float4 m_73 [[attribute(6)]];
    float4 m_55 [[attribute(7)]];
    float4 m_57 [[attribute(8)]];
    float4 m_65 [[attribute(10)]];
    float4 m_61 [[attribute(11)]];
};

vertex main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]])
{
    main0_out out = {};
    out.m_59 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_67 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_49 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_89 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_63 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_69 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_81 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_71 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_79 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_87 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_83 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_85 = float4(0.0, 0.0, 0.0, 1.0);
    bool _2435 = false;
    bool _530 = false;
    bool _376 = false;
    bool _208 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _103 = in.m_46.w;
    float _105 = trunc(_103);
    int _108 = int(_105);
    bool _112 = _108 >= 1;
    float _114 = 0.0;
    if (!_112)
    {
        _114 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _116 = _114;
    float _118 = _116;
    if (!_112)
    {
        out.m_49.x = 0.0;
    }
    int _120 = 0;
    if (!_112)
    {
        float _122 = _116 * 5.0;
        _120 = as_type<int>(_122);
    }
    int _124 = _120;
    int _126 = _124;
    if (!_112)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2740 = as_type<float>(_124);
        out.gl_Position.z = _2740;
    }
    if (!_112)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _128 = in.m_51.w;
    bool _130 = _128 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _132 = isnan(_128);
    bool _134 = _130 || _132;
    bool _136 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _138 = _134 || _136;
    float _140 = -_128;
    float _142 = _140 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    float _144 = 0.0;
    if (_138)
    {
        float _146 = float(_108);
        _144 = _146;
    }
    float _148 = _144;
    bool _150 = _142 >= _148;
    bool _152 = !_138;
    bool _154 = _150 || _152;
    if (_154)
    {
        _118 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _156 = _118;
    if (_154)
    {
        out.m_49.x = 0.0;
    }
    if (_154)
    {
        float _158 = _156 * 5.0;
        _126 = as_type<int>(_158);
    }
    int _160 = _126;
    if (_154)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2808 = as_type<float>(_160);
        out.gl_Position.z = _2808;
    }
    if (_154)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _162 = in.m_53.x;
    float _164 = in.m_53.y;
    float _166 = in.m_53.z;
    bool _168 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _170 = _164 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _172 = _164 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _174 = _164 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _176 = fma(_162, (*spvDescriptorSet0.vp_c10)._m0[4].x, _170);
    float _178 = fma(_162, (*spvDescriptorSet0.vp_c10)._m0[5].x, _172);
    float _180 = fma(_162, (*spvDescriptorSet0.vp_c10)._m0[6].x, _174);
    float _182 = fma(_166, (*spvDescriptorSet0.vp_c10)._m0[4].z, _176);
    float _184 = fma(_166, (*spvDescriptorSet0.vp_c10)._m0[5].z, _178);
    float _186 = fma(_166, (*spvDescriptorSet0.vp_c10)._m0[6].z, _180);
    bool _188 = !_168;
    float _206;
    if (!_188)
    {
        float _190 = in.m_55.x;
        float _192 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _194 = _190 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _196 = fma(_194, (*spvDescriptorSet0.vp_c9)._m0[12].x, _142);
        float _198 = _196 * _192;
        float _200 = floor(_198);
        float _202 = -_200;
        float _204 = _198 + _202;
        _206 = _204;
        _208 = true;
    }
    else
    {
        float _210 = float(_108);
        float _212 = 1.0 / _210;
        float _214 = _142 * _212;
        _206 = _214;
    }
    _208 = false;
    float _216 = _206;
    float _218 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _220 = _216 + _218;
    bool _222 = _216 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _224 = isnan(_216);
    bool _226 = _222 || _224;
    bool _228 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _230 = _226 || _228;
    float _232 = float(_230);
    bool _234 = _216 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _236 = isnan(_216);
    bool _238 = _234 || _236;
    bool _240 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _242 = _238 || _240;
    float _244 = float(_242);
    float _246 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _248 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _246;
    float _250 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _252 = _250 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _254 = 1.0 / _248;
    bool _256 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _258 = 1.0 / _252;
    float _260 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _262 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _260;
    float _264 = _220 * _254;
    float _266 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _268 = _216 + _266;
    bool _270 = _216 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _272 = isnan(_216);
    bool _274 = _270 || _272;
    bool _276 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _278 = _274 || _276;
    float _280 = float(_278);
    float _282 = -_232;
    float _284 = _282 + 1.0;
    float _286 = fma(_262, _264, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _288 = _280 * _284;
    float _290 = -_280;
    float _292 = _290 + 1.0;
    float _294 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _296 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _294;
    float _298 = -(*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _300 = (*spvDescriptorSet0.vp_c9)._m0[144].z + _298;
    float _302 = _268 * _258;
    float _304 = _244 * _292;
    float _306 = fma(_296, _264, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _308 = fma(_300, _264, (*spvDescriptorSet0.vp_c9)._m0[143].z);
    float _310 = -_244;
    float _312 = _310 + 1.0;
    float _314 = _286 * _304;
    float _316 = _306 * _304;
    float _318 = _308 * _304;
    float _320 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _322 = _320 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _324 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _326 = _324 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _328 = -(*spvDescriptorSet0.vp_c9)._m0[144].z;
    float _330 = _328 + (*spvDescriptorSet0.vp_c9)._m0[145].z;
    float _332 = fma(_312, (*spvDescriptorSet0.vp_c9)._m0[143].x, _316);
    float _334 = fma(_322, _302, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _336 = fma(_326, _302, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _338 = fma(_330, _302, (*spvDescriptorSet0.vp_c9)._m0[144].z);
    float _340 = fma(_312, (*spvDescriptorSet0.vp_c9)._m0[143].y, _314);
    float _342 = fma(_312, (*spvDescriptorSet0.vp_c9)._m0[143].z, _318);
    float _344 = fma(_334, _288, _332);
    float _346 = fma(_336, _288, _340);
    float _348 = fma(_338, _288, _342);
    float _350 = fma(_232, (*spvDescriptorSet0.vp_c9)._m0[145].x, _344);
    float _352 = fma(_232, (*spvDescriptorSet0.vp_c9)._m0[145].y, _346);
    float _354 = fma(_232, (*spvDescriptorSet0.vp_c9)._m0[145].z, _348);
    bool _356 = !_256;
    float _374;
    if (!_356)
    {
        float _358 = in.m_55.x;
        float _360 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _362 = _358 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _364 = fma(_362, (*spvDescriptorSet0.vp_c9)._m0[11].y, _142);
        float _366 = _364 * _360;
        float _368 = floor(_366);
        float _370 = -_368;
        float _372 = _366 + _370;
        _374 = _372;
        _376 = true;
    }
    else
    {
        float _378 = float(_108);
        float _380 = 1.0 / _378;
        float _382 = _142 * _380;
        _374 = _382;
    }
    _376 = false;
    float _384 = _374;
    float _386 = in.m_57.x;
    float _388 = in.m_57.y;
    float _390 = in.m_57.z;
    float _392 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _394 = _392 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _396 = _384 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _398 = isnan(_384);
    bool _400 = _396 || _398;
    bool _402 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _404 = _400 || _402;
    float _406 = float(_404);
    float _408 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _410 = _408 + (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _412 = _384 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _414 = isnan(_384);
    bool _416 = _412 || _414;
    bool _418 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _420 = _416 || _418;
    float _422 = float(_420);
    float _424 = 1.0 / _394;
    float _426 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _428 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _426;
    float _430 = -_406;
    float _432 = _430 + 1.0;
    bool _434 = _384 >= (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _436 = isnan(_384);
    bool _438 = _434 || _436;
    bool _440 = isnan((*spvDescriptorSet0.vp_c9)._m0[117].w);
    bool _442 = _438 || _440;
    float _444 = float(_442);
    bool _446 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].w;
    float _448 = _422 * _432;
    float _450 = -_422;
    float _452 = _450 + 1.0;
    float _454 = 1.0 / _410;
    float _456 = -(*spvDescriptorSet0.vp_c9)._m0[116].x;
    float _458 = _456 + (*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _460 = _428 * _424;
    float _462 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _464 = _384 + _462;
    float _466 = -_444;
    float _468 = _466 + 1.0;
    float _470 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _472 = _384 + _470;
    float _474 = _354 * _390;
    float _476 = fma(_460, _464, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _478 = _406 * _468;
    float _480 = _350 * _386;
    float _482 = _458 * _454;
    float _484 = _476 * _448;
    float _486 = fma(_482, _472, (*spvDescriptorSet0.vp_c9)._m0[116].x);
    float _488 = fma(_452, (*spvDescriptorSet0.vp_c9)._m0[115].x, _484);
    float _490 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _492 = fma(_486, _478, _488);
    float _494 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _496 = _490 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _498 = fma(_444, (*spvDescriptorSet0.vp_c9)._m0[117].x, _492);
    float _500 = _352 * _388;
    float _502 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _504 = _494 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _506 = _498 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _508 = _502 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    out.m_59.x = _496;
    out.m_59.y = _504;
    out.m_59.z = _508;
    out.m_59.w = _506;
    bool _510 = !_446;
    float _528;
    if (!_510)
    {
        float _512 = in.m_55.x;
        float _514 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].w;
        float _516 = _512 * (*spvDescriptorSet0.vp_c9)._m0[13].x;
        float _518 = fma(_516, (*spvDescriptorSet0.vp_c9)._m0[11].w, _142);
        float _520 = _518 * _514;
        float _522 = floor(_520);
        float _524 = -_522;
        float _526 = _520 + _524;
        _528 = _526;
        _530 = true;
    }
    else
    {
        float _532 = float(_108);
        float _534 = 1.0 / _532;
        float _536 = _142 * _534;
        _528 = _536;
    }
    _530 = false;
    float _538 = _528;
    float _540 = in.m_55.x;
    float _542 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].w;
    float _544 = in.m_61.x;
    int _546 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _548 = _546 != 0;
    float _550 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _552 = _538 + _550;
    int _554 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 16;
    bool _556 = _554 != 0;
    float _558 = in.m_55.y;
    int _560 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 32;
    bool _562 = _560 != 0;
    float _564 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _566 = _564 + (*spvDescriptorSet0.vp_c9)._m0[132].w;
    int _568 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _570 = _568 != 0;
    float _572 = in.m_61.y;
    float _574 = in.m_46.x;
    float _576 = in.m_46.y;
    float _578 = in.m_46.z;
    float _580 = 1.0 / _566;
    float _582 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    int _584 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _586 = _584 != 0;
    float _588 = in.m_55.z;
    float _590 = _540 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    float _592 = in.m_61.z;
    float _594 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _596 = -_582;
    float _598 = fma(_590, 2.0, _596);
    out.m_63.x = _544;
    bool _600 = _558 > 0.5;
    float _602 = in.m_65.y;
    float _604 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    float _606 = _558 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    out.m_63.y = _572;
    float _608 = fma(_540, (*spvDescriptorSet0.vp_c9)._m0[78].z, _604);
    float _610 = _576 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _612 = fma(_606, -2.0, _594);
    float _614 = _576 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _616 = in.m_65.x;
    float _618 = fma(_574, (*spvDescriptorSet0.vp_c10)._m0[6].x, _610);
    bool _620 = _588 > 0.5;
    float _622 = _576 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _624 = -(*spvDescriptorSet0.vp_c9)._m0[131].x;
    float _626 = (*spvDescriptorSet0.vp_c9)._m0[132].x + _624;
    float _628 = fma(_574, (*spvDescriptorSet0.vp_c10)._m0[4].x, _614);
    float _630 = _614;
    float _632 = _622;
    bool _634 = _620;
    if (_586)
    {
        _630 = _558;
    }
    float _636 = _630;
    float _638 = fma(_574, (*spvDescriptorSet0.vp_c10)._m0[5].x, _622);
    float _640 = _626 * _580;
    out.m_63.z = _592;
    float _642 = fma(_640, _552, (*spvDescriptorSet0.vp_c9)._m0[131].x);
    float _644 = _636;
    float _646 = _640;
    if (_586)
    {
        _632 = _540;
    }
    float _648 = _632;
    float _650 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    float _652 = _648;
    if (!_586)
    {
        _652 = _588;
    }
    float _654 = _652;
    float _656 = (*spvDescriptorSet0.vp_c9)._m0[88].w + (*spvDescriptorSet0.vp_c9)._m0[88].y;
    float _658 = -_602;
    float _660 = _658 + 1.0;
    float _662 = fma(_558, (*spvDescriptorSet0.vp_c9)._m0[78].w, _650);
    float _664 = fma(_558, (*spvDescriptorSet0.vp_c9)._m0[88].w, _656);
    bool _666 = _538 >= (*spvDescriptorSet0.vp_c9)._m0[132].w;
    bool _668 = isnan(_538);
    bool _670 = _666 || _668;
    bool _672 = isnan((*spvDescriptorSet0.vp_c9)._m0[132].w);
    bool _674 = _670 || _672;
    float _676 = float(_674);
    float _678 = (*spvDescriptorSet0.vp_c9)._m0[88].z + (*spvDescriptorSet0.vp_c9)._m0[88].x;
    float _680 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    int _682 = _620 ? as_type<int>(_660) : as_type<int>(_602);
    float _684 = fma(_578, (*spvDescriptorSet0.vp_c10)._m0[4].z, _628);
    float _686 = _602;
    int _688 = as_type<int>(_654);
    if (_548)
    {
        bool _690 = _540 > 0.5;
        _634 = _690;
    }
    bool _692 = _634;
    float _694 = fma(_540, (*spvDescriptorSet0.vp_c9)._m0[88].z, _678);
    if (!_586)
    {
        _644 = _540;
    }
    float _696 = _644;
    float _698 = fma(_578, (*spvDescriptorSet0.vp_c10)._m0[5].z, _638);
    float _700 = fma(_578, (*spvDescriptorSet0.vp_c10)._m0[6].z, _618);
    bool _702 = _538 >= (*spvDescriptorSet0.vp_c9)._m0[131].w;
    bool _704 = isnan(_538);
    bool _706 = _702 || _704;
    bool _708 = isnan((*spvDescriptorSet0.vp_c9)._m0[131].w);
    bool _710 = _706 || _708;
    float _712 = float(_710);
    float _714 = -_676;
    float _716 = _714 + 1.0;
    float _718 = _562 ? as_type<float>(_682) : _602;
    float _720 = _542 * (*spvDescriptorSet0.vp_c9)._m0[90].y;
    int _722 = as_type<int>(_696);
    if (_570)
    {
        float _724 = _600 ? _660 : _602;
        _686 = _724;
    }
    float _726 = _686;
    float _728 = _712 * _716;
    float _730 = fma(_718, _720, -0.5);
    float _732 = _696 * (*spvDescriptorSet0.vp_c9)._m0[87].y;
    float _734 = _642 * _728;
    float _736 = _680 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _738 = (*spvDescriptorSet0.vp_c9)._m0[87].x + (*spvDescriptorSet0.vp_c9)._m0[86].z;
    float _740 = _654 * (*spvDescriptorSet0.vp_c9)._m0[87].x;
    float _742 = _726;
    if (_556)
    {
        float _744 = -_616;
        float _746 = _744 + 1.0;
        _688 = as_type<int>(_746);
    }
    int _748 = _688;
    if (_548)
    {
        float _750 = -_616;
        float _752 = _750 + 1.0;
        _722 = as_type<int>(_752);
    }
    int _754 = _722;
    float _756 = fma(_736, _726, -0.5);
    if (!_556)
    {
        _742 = _616;
    }
    float _758 = _742;
    float _760 = -_738;
    float _762 = fma(_740, 2.0, _760);
    float _764 = fma(_142, (*spvDescriptorSet0.vp_c9)._m0[77].w, _662);
    float _766 = _758;
    if (_556)
    {
        float _768 = _600 ? as_type<float>(_748) : _616;
        _766 = _768;
    }
    float _770 = _766;
    float _772 = -_142;
    float _774 = fma(_772, (*spvDescriptorSet0.vp_c9)._m0[76].x, _598);
    if (!_548)
    {
        _646 = _616;
    }
    float _776 = _646;
    float _778 = _698 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _780 = _776;
    float _782 = _778;
    if (_548)
    {
        float _784 = _692 ? as_type<float>(_754) : _616;
        _780 = _784;
    }
    float _786 = _780;
    float _788 = fma(_142, (*spvDescriptorSet0.vp_c9)._m0[76].y, _612);
    float _790 = (*spvDescriptorSet0.vp_c9)._m0[87].y + (*spvDescriptorSet0.vp_c9)._m0[86].w;
    float _792 = -_712;
    float _794 = _792 + 1.0;
    float _796 = fma(_142, (*spvDescriptorSet0.vp_c9)._m0[87].z, _694);
    float _798 = _684 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _800 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _802 = _778 + _800;
    float _804 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].z;
    float _806 = -_788;
    float _808 = fma(_764, _756, _806);
    float _810 = fma(_732, -2.0, _790);
    float _812 = fma(_794, (*spvDescriptorSet0.vp_c9)._m0[131].x, _734);
    float _814 = _700 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _816 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _818 = _798 + _816;
    float _820 = _802 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _822 = fma(_142, (*spvDescriptorSet0.vp_c9)._m0[77].z, _608);
    float _824 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _826 = fma(_142, (*spvDescriptorSet0.vp_c9)._m0[87].w, _664);
    float _828 = -_142;
    float _830 = fma(_828, (*spvDescriptorSet0.vp_c9)._m0[86].x, _762);
    float _832 = fma(_142, (*spvDescriptorSet0.vp_c9)._m0[86].y, _810);
    float _834 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _836 = _814 + _834;
    float _838 = fma(_818, (*spvDescriptorSet0.vp_c8)._m0[28].x, _820);
    float _840 = -_832;
    float _842 = fma(_826, _730, _840);
    float _844 = fma(_676, (*spvDescriptorSet0.vp_c9)._m0[132].x, _812);
    float _846 = fma(_836, (*spvDescriptorSet0.vp_c8)._m0[28].z, _838);
    float _848 = _802 * _802;
    float _850 = in.m_61.w;
    float _852 = _804 * (*spvDescriptorSet0.vp_c9)._m0[90].x;
    float _854 = _842 + 0.5;
    bool _856 = _846 >= 0.0;
    float _858 = fma(_818, _818, _848);
    float _860 = _824 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _862 = fma(_852, _770, -0.5);
    float _864 = fma(_836, _836, _858);
    float _866 = fma(_860, _786, -0.5);
    float _868 = fma(_796, _862, _830);
    float _870 = rsqrt(_864);
    float _872 = _808 + 0.5;
    float _874 = fma(_822, _866, _774);
    float _876 = _808;
    if (_856)
    {
        _876 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _878 = _876;
    float _880 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _882 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _884 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _886 = _880 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _888 = _882 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _890 = _884 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _892 = _844 * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    float _894 = _874 + 0.5;
    float _896 = _868 + 0.5;
    int _898 = as_type<int>(_878);
    if (_856)
    {
        float _900 = _878 * 5.0;
        _898 = as_type<int>(_900);
    }
    int _902 = _898;
    out.m_63.w = _850;
    float _904 = _802 * _870;
    float _906 = _818 * _870;
    out.m_67.x = _886;
    out.m_67.y = _888;
    out.m_67.z = _890;
    out.m_67.w = _892;
    out.m_69.x = _894;
    out.m_69.y = _872;
    out.m_71.x = _896;
    out.m_71.y = _854;
    float _908 = as_type<float>(_902);
    if (_856)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _4113 = as_type<float>(_902);
        out.gl_Position.z = _4113;
    }
    if (_856)
    {
        out.m_49.x = 0.0;
    }
    if (_856)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _910 = -_904;
    float _912 = fma(_910, (*spvDescriptorSet0.vp_c9)._m0[18].w, _778);
    float _914 = _836 * _870;
    float _916 = -_906;
    float _918 = fma(_916, (*spvDescriptorSet0.vp_c9)._m0[18].w, _798);
    float _920 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _922 = _912 + _920;
    float _924 = -_914;
    float _926 = fma(_924, (*spvDescriptorSet0.vp_c9)._m0[18].w, _814);
    float _928 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _930 = _918 + _928;
    float _932 = _922 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _934 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _936 = _926 + _934;
    float _938 = fma(_930, (*spvDescriptorSet0.vp_c8)._m0[28].x, _932);
    float _940 = fma(_936, (*spvDescriptorSet0.vp_c8)._m0[28].z, _938);
    bool _942 = _940 >= 0.0;
    float _944 = _912;
    float _946 = _936;
    if (_942)
    {
        _908 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _948 = _908;
    int _950 = as_type<int>(_948);
    if (_942)
    {
        out.m_49.x = 0.0;
    }
    if (_942)
    {
        float _952 = _948 * 5.0;
        _950 = as_type<int>(_952);
    }
    int _954 = _950;
    if (_942)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _4209 = as_type<float>(_954);
        out.gl_Position.z = _4209;
    }
    if (_942)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _956 = -_778;
    float _958 = _956 + (*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _960 = -_798;
    float _962 = _960 + (*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _964 = -_814;
    float _966 = _964 + (*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _968 = _958 * _958;
    float _970 = -_904;
    float _972 = fma(_970, (*spvDescriptorSet0.vp_c9)._m0[18].w, _802);
    float _974 = fma(_962, _962, _968);
    float _976 = (*spvDescriptorSet0.vp_c8)._m0[2].w * (*spvDescriptorSet0.vp_c8)._m0[3].z;
    float _978 = -_906;
    float _980 = fma(_978, (*spvDescriptorSet0.vp_c9)._m0[18].w, _818);
    float _982 = fma(_966, _966, _974);
    float _984 = -_976;
    float _986 = fma((*spvDescriptorSet0.vp_c8)._m0[3].w, (*spvDescriptorSet0.vp_c8)._m0[2].z, _984);
    float _988 = _972 * _972;
    float _990 = rsqrt(_982);
    float _992 = fma(_980, _980, _988);
    float _994 = (*spvDescriptorSet0.vp_c8)._m0[2].w * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _996 = (*spvDescriptorSet0.vp_c8)._m0[2].w * (*spvDescriptorSet0.vp_c8)._m0[3].x;
    float _998 = -_994;
    float _1000 = fma((*spvDescriptorSet0.vp_c8)._m0[3].w, (*spvDescriptorSet0.vp_c8)._m0[2].y, _998);
    float _1002 = -_996;
    float _1004 = fma((*spvDescriptorSet0.vp_c8)._m0[3].w, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1002);
    float _1006 = _962 * _990;
    float _1008 = _966 * _990;
    float _1010 = _1004 * (*spvDescriptorSet0.vp_c8)._m0[1].z;
    float _1012 = _1000 * (*spvDescriptorSet0.vp_c8)._m0[1].z;
    float _1014 = _1006 * _1006;
    float _1016 = _958 * _990;
    float _1018 = fma(_1008, _1008, _1014);
    float _1020 = (*spvDescriptorSet0.vp_c8)._m0[2].z * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1022 = (*spvDescriptorSet0.vp_c8)._m0[2].z * (*spvDescriptorSet0.vp_c8)._m0[3].x;
    float _1024 = rsqrt(_1018);
    float _1026 = -_1020;
    float _1028 = fma((*spvDescriptorSet0.vp_c8)._m0[2].y, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1026);
    float _1030 = -_1022;
    float _1032 = fma((*spvDescriptorSet0.vp_c8)._m0[2].x, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1030);
    float _1034 = _1032 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1036 = (*spvDescriptorSet0.vp_c8)._m0[2].y * (*spvDescriptorSet0.vp_c8)._m0[3].x;
    float _1038 = -_1012;
    float _1040 = fma(_986, (*spvDescriptorSet0.vp_c8)._m0[1].y, _1038);
    float _1042 = -_1034;
    float _1044 = fma(_1028, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1042);
    float _1046 = -_1036;
    float _1048 = fma((*spvDescriptorSet0.vp_c8)._m0[2].x, (*spvDescriptorSet0.vp_c8)._m0[3].y, _1046);
    float _1050 = -_1010;
    float _1052 = fma(_986, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1050);
    float _1054 = fma(_1028, (*spvDescriptorSet0.vp_c8)._m0[1].w, _1040);
    float _1056 = _1008 * _1024;
    float _1058 = _1006 * _1024;
    float _1060 = fma(_1032, (*spvDescriptorSet0.vp_c8)._m0[1].w, _1052);
    float _1062 = -_1056;
    float _1064 = _1008 * _1062;
    float _1066 = -_1056;
    float _1068 = _1016 * _1066;
    float _1070 = _1060 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1072 = _1004 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1074 = -_1064;
    float _1076 = fma(_1006, _1058, _1074);
    float _1078 = _1016 * _1058;
    float _1080 = -_1070;
    float _1082 = fma(_1054, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1080);
    float _1084 = -_1072;
    float _1086 = fma(_1000, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1084);
    float _1088 = _1076 * _1076;
    float _1090 = fma(_1048, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1044);
    float _1092 = fma(_1048, (*spvDescriptorSet0.vp_c8)._m0[1].w, _1086);
    float _1094 = fma(_1078, _1078, _1088);
    float _1096 = fma(_1092, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1082);
    float _1098 = fma(_1068, _1068, _1094);
    float _1100 = _1004 * (*spvDescriptorSet0.vp_c8)._m0[0].z;
    float _1102 = _1004 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1104 = -_1090;
    float _1106 = fma(_1104, (*spvDescriptorSet0.vp_c8)._m0[0].w, _1096);
    float _1108 = rsqrt(_1098);
    float _1110 = -_1100;
    float _1112 = fma(_986, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1110);
    float _1114 = _1000 * (*spvDescriptorSet0.vp_c8)._m0[0].z;
    float _1116 = -_1102;
    float _1118 = fma(_1000, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1116);
    float _1120 = fma(_1032, (*spvDescriptorSet0.vp_c8)._m0[0].w, _1112);
    float _1122 = -_1114;
    float _1124 = fma(_986, (*spvDescriptorSet0.vp_c8)._m0[0].y, _1122);
    float _1126 = fma(_1048, (*spvDescriptorSet0.vp_c8)._m0[0].w, _1118);
    float _1128 = 1.0 / _1106;
    float _1130 = fma(_1028, (*spvDescriptorSet0.vp_c8)._m0[0].w, _1124);
    float _1132 = _1076 * _1108;
    float _1134 = precise::clamp(_1132, 0.0, 1.0);
    float _1136 = -_1134;
    float _1138 = _1136 + 1.0;
    float _1140 = fma(_1120, _1128, -1.0);
    float _1142 = _1138 * _1128;
    float _1144 = _480 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _1146 = fma(_1138, _1140, 1.0);
    float _1148 = _1130 * _1142;
    float _1150 = _1126 * _1142;
    float _1152 = _1146 * _1146;
    float _1154 = fma(_1148, _1148, _1152);
    float _1156 = fma(_1150, _1150, _1154);
    float _1158 = rsqrt(_1156);
    float _1160 = _1150 * _1158;
    float _1162 = _1148 * _1158;
    float _1164 = _1146 * _1158;
    float _1166 = -_1160;
    float _1168 = _1006 * _1166;
    float _1170 = _1008 * _1164;
    float _1172 = -_1162;
    float _1174 = -_1168;
    float _1176 = fma(_1008, _1172, _1174);
    float _1178 = -_1162;
    float _1180 = _1016 * _1178;
    float _1182 = -_1160;
    float _1184 = -_1170;
    float _1186 = fma(_1016, _1182, _1184);
    float _1188 = _1176 * _1176;
    float _1190 = -_1180;
    float _1192 = fma(_1006, _1164, _1190);
    float _1194 = fma(_1186, _1186, _1188);
    float _1196 = fma(_1192, _1192, _1194);
    float _1198 = rsqrt(_1196);
    float _1200 = _1186 * _1198;
    float _1202 = _1192 * _1198;
    float _1204 = _1176 * _1198;
    float _1206 = _1008 * _1200;
    float _1208 = _1016 * _1202;
    float _1210 = -_1206;
    float _1212 = fma(_1006, _1202, _1210);
    float _1214 = _1006 * _1204;
    float _1216 = -_1208;
    float _1218 = fma(_1008, _1204, _1216);
    float _1220 = -_914;
    float _1222 = fma(_1220, (*spvDescriptorSet0.vp_c9)._m0[18].w, _836);
    float _1224 = _1212 * _1212;
    float _1226 = -_1214;
    float _1228 = fma(_1016, _1200, _1226);
    float _1230 = fma(_1222, _1222, _992);
    float _1232 = fma(_1218, _1218, _1224);
    float _1234 = sqrt(_1230);
    float _1236 = fma(_1228, _1228, _1232);
    float _1238 = rsqrt(_1236);
    float _1240 = _870 * _1234;
    float _1242 = _1228 * _1238;
    float _1244 = _1218 * _1238;
    float _1246 = _1212 * _1238;
    float _1248 = _1006 * _1242;
    float _1250 = in.m_73.x;
    float _1252 = in.m_73.y;
    float _1254 = in.m_73.z;
    float _1256 = _1008 * _1246;
    float _1258 = -_1248;
    float _1260 = fma(_1008, _1244, _1258);
    float _1262 = _1016 * _1244;
    float _1264 = -_1256;
    float _1266 = fma(_1016, _1242, _1264);
    float _1268 = _1260 * _1260;
    float _1270 = -_1262;
    float _1272 = fma(_1006, _1246, _1270);
    float _1274 = fma(_1266, _1266, _1268);
    float _1276 = fma(_1272, _1272, _1274);
    float _1278 = _500 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _1280 = rsqrt(_1276);
    float _1282 = _1240 * _1278;
    float _1284 = _474 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _1286 = _1240 * _1144;
    float _1288 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _1252);
    float _1290 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _1250);
    float _1292 = _1284 * _1240;
    float _1294 = _1288 * _1282;
    float _1296 = _1290 * _1286;
    float _1298 = _1292 * _1254;
    float _1300 = _912 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _1302 = _1294 * _1242;
    float _1304 = _1294 * _1244;
    float _1306 = _1272 * _1280;
    float _1308 = _1266 * _1280;
    float _1310 = _1260 * _1280;
    float _1312 = fma(_918, (*spvDescriptorSet0.vp_c8)._m0[11].x, _1300);
    float _1314 = fma(_1296, _1306, _1302);
    float _1316 = fma(_1296, _1308, _1304);
    float _1318 = fma(_926, (*spvDescriptorSet0.vp_c8)._m0[11].z, _1312);
    float _1320 = fma(_1298, _1008, _1314);
    float _1322 = fma(_1298, _1006, _1316);
    float _1324 = _814 + _1320;
    float _1326 = _798 + _1322;
    float _1328 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1330 = _1324 + _1328;
    float _1332 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1334 = _1326 + _1332;
    float _1336 = _1330 * _1330;
    float _1338 = fma(_1334, _1334, _1336);
    float _1340 = _1294 * _1246;
    float _1342 = sqrt(_1338);
    float _1344 = fma(_1296, _1310, _1340);
    float _1346 = fma(_1298, _1016, _1344);
    float _1348 = _778 + _1346;
    bool _1350 = _1342 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1352 = _1298;
    float _1354 = _1340;
    float _1356 = _1346;
    if (!_1350)
    {
        _1352 = _1326;
    }
    float _1358 = _1352;
    float _1360 = _1358;
    if (!_1350)
    {
        _1354 = _1324;
    }
    float _1362 = _1354;
    float _1364 = _1362;
    if (!_1350)
    {
        _1356 = _1348;
    }
    float _1366 = _1356;
    bool _1368 = !_1350;
    float _1370 = _1366;
    if (!_1368)
    {
        float _1372 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1374 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1376 = _1342 + _1374;
        float _1378 = rsqrt(_1338);
        float _1380 = _1376 * _1372;
        float _1382 = _1348 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1384 = _1380 * 0.15915493667125701904296875;
        float _1386 = _1384 * 6.283185482025146484375;
        float _1388 = cos(_1386);
        float _1390 = _1384 * 6.283185482025146484375;
        float _1392 = sin(_1390);
        float _1394 = _1388 + (-1.0);
        float _1396 = _1394 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1398 = fma(_1392, _1382, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1400 = fma(_1348, _1388, _1396);
        float _1402 = _1378 * _1398;
        float _1404 = fma(_1334, _1402, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1406 = fma(_1330, _1402, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _1370 = _1400;
        _1360 = _1404;
        _1364 = _1406;
    }
    float _1408 = _1370;
    float _1410 = _1360;
    float _1412 = _1364;
    float _1414 = -_778;
    float _1416 = _1414 + _1408;
    float _1418 = -_798;
    float _1420 = _1418 + _1410;
    float _1422 = -_814;
    float _1424 = _1422 + _1412;
    float _1426 = _1318 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _1428 = _1416 * _1416;
    float _1430 = _912 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _1432 = 1.0 / _1426;
    float _1434 = fma(_1420, _1420, _1428);
    float _1436 = fma(_918, (*spvDescriptorSet0.vp_c8)._m0[10].x, _1430);
    float _1438 = fma(_1424, _1424, _1434);
    float _1440 = fma(_926, (*spvDescriptorSet0.vp_c8)._m0[10].z, _1436);
    bool _1442 = (*spvDescriptorSet0.vp_c15)._m0[653].w >= 0.5;
    bool _1444 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _1446 = _1442 || _1444;
    bool _1448 = isnan(0.5);
    bool _1450 = _1446 || _1448;
    float _1452 = sqrt(_1438);
    float _1454 = _1440 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _1456 = _1454 + _1426;
    float _1458 = _1456 * _1432;
    float _1460 = _1458 * 0.5;
    bool _1462 = _1452 > 0.0;
    float _1464 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _1466 = fma(_1460, (*spvDescriptorSet0.vp_c8)._m0[30].w, _1464);
    bool _1468 = (*spvDescriptorSet0.vp_c15)._m0[660].y >= 0.5;
    bool _1470 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _1472 = _1468 || _1470;
    bool _1474 = isnan(0.5);
    bool _1476 = _1472 || _1474;
    float _1478 = 1.0 / _1466;
    bool _1480 = !_1462;
    float _1482 = _1410;
    float _1484 = _1408;
    float _1486 = _1412;
    float _1488 = (*spvDescriptorSet0.vp_c15)._m0[653].w;
    if (!_1480)
    {
        float _1490 = _184 * _184;
        float _1492 = rsqrt(_1438);
        float _1494 = fma(_182, _182, _1490);
        float _1496 = fma(_186, _186, _1494);
        float _1498 = sqrt(_1496);
        float _1500 = _1420 * _1492;
        float _1502 = _1416 * _1492;
        float _1504 = _1424 * _1492;
        bool _1506 = _1498 > 0.0;
        bool _1508 = !_1506;
        _1488 = _1498;
        if (!_1508)
        {
            float _1510 = rsqrt(_1496);
            float _1512 = 1.0 / (*spvDescriptorSet0.vp_c10)._m0[2].z;
            float _1514 = _184 * _1510;
            float _1516 = _182 * _1510;
            float _1518 = _1502 * _1514;
            float _1520 = _186 * _1510;
            float _1522 = fma(_1500, _1516, _1518);
            float _1524 = _1512 * (*spvDescriptorSet0.vp_c9)._m0[142].x;
            float _1526 = fma(_1504, _1520, _1522);
            float _1528 = _1526 * _1524;
            float _1530 = fma(_182, _1528, _1410);
            float _1532 = fma(_184, _1528, _1408);
            float _1534 = fma(_186, _1528, _1412);
            _1482 = _1530;
            _1484 = _1532;
            _1486 = _1534;
            _1488 = _1528;
        }
    }
    float _1536 = _1482;
    float _1538 = _1484;
    float _1540 = _1486;
    float _1542 = _1488;
    float _1544 = -_906;
    float _1546 = fma(_1544, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1536);
    float _1548 = -_904;
    float _1550 = fma(_1548, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1538);
    float _1552 = -_914;
    float _1554 = fma(_1552, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1540);
    float _1556 = _1542;
    float _1558 = _1550;
    float _1560 = _1546;
    float _1562 = _1554;
    if (_1450)
    {
        _1556 = 1.0;
    }
    float _1564 = _1556;
    float _1566 = _1564;
    if (!_1476)
    {
        float _1568 = _922 * _922;
        float _1570 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _1572 = -_798;
        float _1574 = _1572 + _1536;
        float _1576 = -_778;
        float _1578 = _1576 + _1538;
        float _1580 = fma(_930, _930, _1568);
        float _1582 = -_814;
        float _1584 = _1582 + _1540;
        float _1586 = fma(_936, _936, _1580);
        float _1588 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1590 = sqrt(_1586);
        float _1592 = 1.0 / _1240;
        bool _1594 = _1590 > (*spvDescriptorSet0.vp_c9)._m0[199].x;
        bool _1596 = isnan(_1590);
        bool _1598 = _1594 || _1596;
        bool _1600 = isnan((*spvDescriptorSet0.vp_c9)._m0[199].x);
        bool _1602 = _1598 || _1600;
        float _1604 = precise::min(_1590, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _1606 = _1604 * _1570;
        float _1608 = _1588 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1610 = _1578 * _1592;
        float _1612 = _1574 * _1592;
        float _1614 = _1584 * _1592;
        float _1616 = _1608 * _1606;
        float _1618 = _1550;
        float _1620 = _1590;
        _782 = _1578;
        if (_1602)
        {
            float _1622 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].y;
            _1618 = _1622;
        }
        float _1624 = _1618;
        if (_1602)
        {
            float _1626 = precise::max(_1590, (*spvDescriptorSet0.vp_c9)._m0[199].y);
            _1620 = _1626;
        }
        float _1628 = _1620;
        float _1630 = fma(_1612, _1616, _918);
        float _1632 = fma(_1614, _1616, _926);
        float _1634 = _1628;
        float _1636 = _1630;
        _1562 = _1632;
        if (_1602)
        {
            float _1638 = _1628 * _1624;
            _1634 = _1638;
        }
        float _1640 = _1634;
        float _1642 = fma(_1610, _1616, _912);
        float _1644 = _1640;
        float _1646 = _1642;
        if (_1602)
        {
            float _1648 = _1608 * _1640;
            _1644 = _1648;
        }
        float _1650 = _1644;
        if (_1602)
        {
            float _1652 = fma(_1610, _1650, _912);
            _1646 = _1652;
        }
        float _1654 = _1646;
        _1558 = _1654;
        if (_1602)
        {
            float _1656 = fma(_1612, _1650, _918);
            _1636 = _1656;
        }
        float _1658 = _1636;
        _1560 = _1658;
        if (_1602)
        {
            float _1660 = fma(_1614, _1650, _926);
            _1562 = _1660;
        }
    }
    float _1662 = _782;
    float _1664 = _1558;
    float _1666 = _1560;
    float _1668 = _1562;
    float _1670 = _1662;
    if (_1450)
    {
        _944 = 1.0;
    }
    float _1672 = _944;
    float _1674 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _1676 = _1478 * _1674;
    float _1678 = _1672;
    if (!_1450)
    {
        float _1680 = (*spvDescriptorSet0.vp_c8)._m0[31].x * 0.5;
        float _1682 = _1680 * 0.15915493667125701904296875;
        float _1684 = _1682 * 6.283185482025146484375;
        float _1686 = cos(_1684);
        float _1688 = (*spvDescriptorSet0.vp_c8)._m0[31].y * 0.5;
        float _1690 = _1688 * 0.15915493667125701904296875;
        float _1692 = _1682 * 6.283185482025146484375;
        float _1694 = sin(_1692);
        float _1696 = 1.0 / _1686;
        float _1698 = _1690 * 6.283185482025146484375;
        float _1700 = cos(_1698);
        float _1702 = _1694 * _1696;
        float _1704 = _1690 * 6.283185482025146484375;
        float _1706 = sin(_1704);
        float _1708 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1710 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _1708;
        float _1712 = _1700 * _1702;
        float _1714 = 1.0 / _1710;
        float _1716 = 1.0 / _1712;
        float _1718 = _1706 * _1716;
        float _1720 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1722 = fma(_1676, _1718, _1720);
        float _1724 = _1722 * _1714;
        float _1726 = precise::clamp(_1724, 0.0, 1.0);
        _1670 = _1702;
        _1566 = _1726;
    }
    float _1728 = _1670;
    float _1730 = _1566;
    float _1732 = _1728;
    if (!_1450)
    {
        float _1734 = (*spvDescriptorSet0.vp_c8)._m0[31].x * 0.5;
        float _1736 = _1734 * 0.15915493667125701904296875;
        float _1738 = _1736 * 6.283185482025146484375;
        float _1740 = cos(_1738);
        float _1742 = (*spvDescriptorSet0.vp_c8)._m0[31].y * 0.5;
        float _1744 = _1742 * 0.15915493667125701904296875;
        float _1746 = _1736 * 6.283185482025146484375;
        float _1748 = sin(_1746);
        float _1750 = 1.0 / _1740;
        float _1752 = _1744 * 6.283185482025146484375;
        float _1754 = cos(_1752);
        float _1756 = _1748 * _1750;
        float _1758 = _1744 * 6.283185482025146484375;
        float _1760 = sin(_1758);
        float _1762 = _1754 * _1756;
        float _1764 = 1.0 / _1762;
        float _1766 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _1768 = (*spvDescriptorSet0.vp_c9)._m0[140].w + _1766;
        float _1770 = 1.0 / _1768;
        float _1772 = _1760 * _1764;
        float _1774 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _1776 = fma(_1676, _1772, _1774);
        float _1778 = _1776 * _1770;
        float _1780 = precise::clamp(_1778, 0.0, 1.0);
        float _1782 = -_1780;
        float _1784 = _1782 + 1.0;
        _1732 = _1750;
        _1678 = _1784;
    }
    float _1786 = _1732;
    float _1788 = _1678;
    float _1790 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1792 = _1664 + _1790;
    float _1794 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1796 = _1666 + _1794;
    float _1798 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1800 = _1668 + _1798;
    float _1802 = _1664 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1804 = _1792 * _1792;
    float _1806 = fma(_1666, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1802);
    float _1808 = fma(_1796, _1796, _1804);
    float _1810 = fma(_1800, _1800, _1808);
    float _1812 = rsqrt(_1810);
    float _1814 = _1812 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1816 = _1796 * _1814;
    float _1818 = _1800 * _1814;
    float _1820 = _1816 * _1816;
    float _1822 = _1818 * _1818;
    float _1824 = _1820 + _1822;
    float _1826 = sqrt(_1824);
    bool _1828 = _1826 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1830 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1832 = _1826 + _1830;
    float _1834 = _1800;
    float _1836 = _1812;
    float _1838 = _1832;
    float _1840 = _1804;
    float _1842 = _1820;
    if (_1828)
    {
        float _1844 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1834 = _1844;
    }
    float _1846 = _1834;
    if (_1828)
    {
        float _1848 = rsqrt(_1824);
        _1836 = _1848;
    }
    float _1850 = _1836;
    float _1852 = _1850;
    if (_1828)
    {
        float _1854 = _1832 * _1846;
        _1838 = _1854;
    }
    float _1856 = _1838;
    if (_1828)
    {
        float _1858 = _1856 * 0.15915493667125701904296875;
        _1840 = _1858;
    }
    float _1860 = _1840;
    float _1862 = _1846;
    float _1864 = _1860;
    if (_1828)
    {
        float _1866 = _1860 * 6.283185482025146484375;
        float _1868 = sin(_1866);
        _1862 = _1868;
    }
    float _1870 = _1862;
    float _1872 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _1874 = precise::max(0.0, _1872);
    float _1876 = _1786;
    float _1878 = _1874;
    if (_1828)
    {
        float _1880 = _1860 * 6.283185482025146484375;
        float _1882 = cos(_1880);
        _1876 = _1882;
    }
    float _1884 = _1876;
    float _1886 = -_1814;
    float _1888 = -_1874;
    float _1890 = fma(_1792, _1886, _1888);
    float _1892 = (*spvDescriptorSet0.vp_c15)._m0[652].x;
    if (_1828)
    {
        float _1894 = _1890 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1878 = _1894;
    }
    float _1896 = _1878;
    if (!_1828)
    {
        _1864 = _1816;
    }
    float _1898 = _1864;
    float _1900 = _1870;
    float _1902 = _1898;
    if (_1828)
    {
        float _1904 = fma(_1870, _1896, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1900 = _1904;
    }
    float _1906 = _1900;
    float _1908 = fma(_918, (*spvDescriptorSet0.vp_c15)._m0[652].x, (*spvDescriptorSet0.vp_c15)._m0[652].z);
    float _1910 = sqrt(_1810);
    float _1912 = _1906;
    float _1914 = _1884;
    if (_1828)
    {
        float _1916 = _1884 + (-1.0);
        _1892 = _1916;
    }
    float _1918 = _1892;
    float _1920 = _1918;
    if (_1828)
    {
        float _1922 = _1850 * _1906;
        _946 = _1922;
    }
    float _1924 = _946;
    if (!_1828)
    {
        _1852 = _1890;
    }
    float _1926 = _1852;
    float _1928 = _1926;
    if (_1828)
    {
        float _1930 = _1918 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1920 = _1930;
    }
    float _1932 = _1920;
    if (_1828)
    {
        float _1934 = _1816 * _1924;
        _1902 = _1934;
    }
    float _1936 = _1902;
    if (!_1828)
    {
        _1912 = _1818;
    }
    float _1938 = _1912;
    float _1940 = _1938;
    if (_1828)
    {
        float _1942 = _1818 * _1924;
        _1940 = _1942;
    }
    float _1944 = _1940;
    if (_1828)
    {
        float _1946 = fma(_1890, _1884, _1932);
        _1928 = _1946;
    }
    float _1948 = _1928;
    if (_1828)
    {
        float _1950 = _1936 * _1936;
        _1842 = _1950;
    }
    float _1952 = _1842;
    if (!_1828)
    {
        _1914 = _1822;
    }
    float _1954 = _1914;
    float _1956 = _1954;
    if (_1828)
    {
        float _1958 = _1944 * _1944;
        _1956 = _1958;
    }
    float _1960 = _1956;
    float _1962 = fma(_1948, _1948, _1952);
    float _1964 = _1664 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1966 = floor(_1908);
    float _1968 = fma(_1668, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1806);
    float _1970 = _1962 + _1960;
    float _1972 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _1974 = fma(_1910, (*spvDescriptorSet0.vp_c15)._m0[23].w, _1972);
    float _1976 = precise::clamp(_1974, 0.0, 1.0);
    float _1978 = fma(_1666, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1964);
    float _1980 = _1968 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1982 = -_1976;
    float _1984 = _1982 + 1.0;
    float _1986 = rsqrt(_1970);
    float _1988 = fma(_926, (*spvDescriptorSet0.vp_c15)._m0[652].y, (*spvDescriptorSet0.vp_c15)._m0[652].w);
    float _1990 = _1664 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1992 = fma(_1668, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1978);
    float _1994 = fma(_1666, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1990);
    float _1996 = _1992 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1998 = abs(_1984);
    float _2000 = log2(_1998);
    float _2002 = _1664 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _2004 = fma(_1668, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1994);
    float _2006 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _2008 = _1996 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _2010 = fma(_1666, (*spvDescriptorSet0.vp_c8)._m0[0].x, _2002);
    float _2012 = _2004 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _2014 = -_1966;
    float _2016 = _1908 + _2014;
    float _2018 = _1986 * _1936;
    float _2020 = _1986 * _1948;
    float _2022 = fma(_1668, (*spvDescriptorSet0.vp_c8)._m0[0].z, _2010);
    float _2024 = _1986 * _1944;
    float _2026 = _2018 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _2028 = -_2008;
    float _2030 = fma(_2028, _2006, 1.0);
    float _2032 = _2012 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _2034 = floor(_1988);
    float _2036 = -_2026;
    float _2038 = fma(_2020, (*spvDescriptorSet0.vp_c15)._m0[21].y, _2036);
    float _2040 = _2022 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _2042 = _2000 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _2044 = _2012 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _2046 = -_2024;
    float _2048 = fma(_2046, (*spvDescriptorSet0.vp_c15)._m0[21].z, _2038);
    float _2050 = fma(_2040, (*spvDescriptorSet0.vp_c8)._m0[7].x, _2032);
    float _2052 = log2(_2030);
    float _2054 = fma(_2040, (*spvDescriptorSet0.vp_c8)._m0[4].x, _2044);
    float _2056 = fma(_1996, (*spvDescriptorSet0.vp_c8)._m0[7].z, _2050);
    float _2058 = _2012 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _2060 = fma(_1996, (*spvDescriptorSet0.vp_c8)._m0[4].z, _2054);
    float _2062 = fma(_1980, (*spvDescriptorSet0.vp_c8)._m0[7].w, _2056);
    float _2064 = fma(_2040, (*spvDescriptorSet0.vp_c8)._m0[5].x, _2058);
    float _2066 = exp2(_2042);
    float _2068 = fma(_2048, -0.5, 0.5);
    float _2070 = fma(_2048, 0.5, 0.5);
    float _2072 = -_2034;
    float _2074 = _1988 + _2072;
    float _2076 = fma(_1996, (*spvDescriptorSet0.vp_c8)._m0[5].z, _2064);
    float _2078 = fma(_1980, (*spvDescriptorSet0.vp_c8)._m0[4].w, _2060);
    float _2080 = fma(_2070, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _2082 = 1.0 / _2062;
    float _2084 = fma(_1980, (*spvDescriptorSet0.vp_c8)._m0[5].w, _2076);
    float _2086 = fma(_2070, _2080, -0.212114393711090087890625);
    float _2088 = sqrt(_2068);
    float2 _6030 = float2(_2016, _2074);
    float _2090 = dm_bs(spvDescriptorSet0.vp_t_tcb_24.sample(spvDescriptorSet0.vp_t_tcb_24Smplr, select(_6030, float2(0.0), isnan(_6030)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_24, spvDescriptorSet0.vp_t_tcb_24Smplr_w, select(_6030, float2(0.0), isnan(_6030)), level(0.0)).x;
    float _2092 = fma(_2070, _2086, 1.570728778839111328125);
    float _2094 = _2020 + 1.0;
    float _2096 = -_2020;
    float _2098 = fma(_2066, _2094, _2096);
    float _2100 = _2052 * 0.693147182464599609375;
    float _2102 = _2078 * _2082;
    float _2104 = _2084 * _2082;
    float _2106 = _2088 * 0.636619746685028076171875;
    float _2108 = _2100 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _2110 = fma(_2102, 0.5, 0.5);
    float _2112 = fma(_2104, -0.5, 0.5);
    float _2114 = -_2092;
    float _2116 = fma(_2106, _2114, 1.0);
    float _2118 = fma(_2098, 0.5, 0.5);
    float3 _6080 = float3(_2110, _2112, _2108);
    float _2120 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_6080, float3(0.0), isnan(_6080)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_6080, float3(0.0), isnan(_6080)), level(0.0)).x;
    float3 _6091 = float3(_2110, _2112, _2108);
    float4 _2123 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_6091, float3(0.0), isnan(_6091)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_6091, float3(0.0), isnan(_6091)), level(0.0)).xyzw;
    float _2125 = _2123.x;
    float _2127 = _2123.y;
    float _2129 = _2123.z;
    float _2131 = _2123.w;
    float2 _6107 = float2(_2116, _2118);
    float3 _2135 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_6107, float2(0.0), isnan(_6107)), level(0.0)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_6107, float2(0.0), isnan(_6107)), level(0.0)).xyz;
    float _2137 = _2135.x;
    float _2139 = _2135.y;
    float _2141 = _2135.z;
    float _2143 = abs(_1676);
    float _2145 = log2(_2143);
    bool _2147 = _1252 != 0.0;
    bool _2149 = isnan(_1252);
    bool _2151 = _2147 || _2149;
    bool _2153 = isnan(0.0);
    bool _2155 = _2151 || _2153;
    float _2157 = _2012 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    bool _2159 = _1250 == 0.0;
    bool _2161 = !_2155;
    bool _2163 = _2159 && _2161;
    float _2165 = fma(_2040, (*spvDescriptorSet0.vp_c8)._m0[6].x, _2157);
    bool _2167 = _1254 == 0.0;
    bool _2169 = _2167 && _2163;
    float _2171 = fma(_1996, (*spvDescriptorSet0.vp_c8)._m0[6].z, _2165);
    bool _2173 = _1676 <= 8000.0;
    bool _2175 = isnan(_1676);
    bool _2177 = _2173 || _2175;
    bool _2179 = isnan(8000.0);
    bool _2181 = _2177 || _2179;
    float _2183 = float(_2181);
    float _2185 = _2145 * (*spvDescriptorSet0.vp_c15)._m0[654].z;
    float _2187 = in.m_75.x;
    float _2189 = in.m_75.y;
    float _2191 = in.m_75.z;
    float _2193 = exp2(_2185);
    float _2195 = fma(_2193, (*spvDescriptorSet0.vp_c15)._m0[654].x, (*spvDescriptorSet0.vp_c15)._m0[654].y);
    float _2197 = precise::clamp(_2195, 0.0, 1.0);
    float _2199 = _2189;
    float _2201 = _2187;
    float _2203 = _2191;
    float _2205 = _2062;
    float _2207 = _2084;
    if (!_2169)
    {
        float _2209 = fma(_1252, (*spvDescriptorSet0.vp_c9)._m0[17].y, _2189);
        _2199 = _2209;
    }
    float _2211 = _2199;
    if (!_2169)
    {
        float _2213 = fma(_1250, (*spvDescriptorSet0.vp_c9)._m0[17].y, _2187);
        _2201 = _2213;
    }
    float _2215 = _2201;
    float _2217 = fma(_2197, -2.0, 3.0);
    float _2219 = _2197 * _2197;
    float _2221 = _1244 * _2211;
    float _2223 = _1246 * _2211;
    float _2225 = _1242 * _2211;
    float _2227 = _2000 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _2229 = _2219 * _2217;
    float _2231 = fma(_1310, _2215, _2223);
    float _2233 = fma(_1308, _2215, _2221);
    float _2235 = exp2(_2227);
    float _2237 = -_2229;
    float _2239 = _2237 + 1.0;
    float _2241 = in.m_77.x;
    float _2243 = fma(_1306, _2215, _2225);
    float _2245 = _2062 * 0.5;
    float _2247 = fma(_2239, (*spvDescriptorSet0.vp_c15)._m0[654].w, _2229);
    if (!_2169)
    {
        float _2249 = fma(_1254, (*spvDescriptorSet0.vp_c9)._m0[17].y, _2191);
        _2203 = _2249;
    }
    float _2251 = _2203;
    float _2253 = fma(_1980, (*spvDescriptorSet0.vp_c8)._m0[6].w, _2171);
    float _2255 = fma(_2084, -0.5, _2245);
    float _2257 = _2183 * _2247;
    float _2259 = fma(_1006, _2251, _2233);
    float _2261 = fma(_1016, _2251, _2231);
    float _2263 = fma(_1008, _2251, _2243);
    float _2265 = _2257 * (*spvDescriptorSet0.vp_c15)._m0[653].x;
    float _2267 = _2078 + _2062;
    float _2269 = -_2235;
    float _2271 = _2269 + 1.0;
    out.gl_Position.x = _2078;
    out.gl_Position.y = _2084;
    out.gl_Position.z = _2253;
    out.gl_Position.w = _2062;
    bool _2273 = _1910 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _2275 = isnan(_1910);
    bool _2277 = _2273 || _2275;
    bool _2279 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _2281 = _2277 || _2279;
    float _2283 = _2253 + _2062;
    float _2285 = _2271 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    out.m_79.x = _2259;
    out.m_79.y = _2261;
    out.m_79.z = _2263;
    float _2287 = _2283 * 0.5;
    float _2289 = _2267 * 0.5;
    out.m_81.x = _2289;
    out.m_81.y = _2255;
    out.m_81.z = _2287;
    out.m_81.w = _2062;
    float _2291 = -_2285;
    float _2293 = _2291 + 1.0;
    float _2295 = _2253;
    float _2297 = _2289;
    float _2299 = (*spvDescriptorSet0.vp_c15)._m0[653].y;
    if (!_2281)
    {
        _2205 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _2301 = _2205;
    float _2303 = _2301;
    float _2305 = _2301;
    if (!_2281)
    {
        _2295 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _2307 = _2295;
    float _2309 = _2307;
    float _2311 = _2307;
    if (!_2281)
    {
        _2207 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _2313 = _2207;
    float _2315 = _2313;
    float _2317 = _2313;
    if (!_2281)
    {
        _2297 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _2319 = _2297;
    float _2321 = -_2090;
    float _2323 = _2321 + 1.0;
    float _2325 = _2323 * _2265;
    float _2327 = precise::clamp(_2325, 0.0, 1.0);
    float _2329 = -_2327;
    float _2331 = fma(_2329, (*spvDescriptorSet0.vp_c15)._m0[653].y, 1.0);
    float _2333 = _2319;
    float _2335 = _2319;
    if (!_2281)
    {
        _2299 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _2337 = _2299;
    float _2339 = _2331 * _2241;
    float _2341 = _2339 * (*spvDescriptorSet0.vp_c13)._m0[1].w;
    out.m_83.x = _2341;
    float _2343 = _2285 * _2120;
    float _2345 = _2131 * _2293;
    float _2347 = _1730 * _1788;
    float _2349 = _2131 * _2343;
    float _2351 = _2141 * _2343;
    float _2353 = _2347 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _2355 = _2347;
    float _2357 = _2337;
    float _2359 = _2337;
    if (!_2281)
    {
        _2355 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _2361 = _2355;
    float _2363 = fma(_2137, _2349, _2125);
    float _2365 = fma(_2139, _2349, _2127);
    float _2367 = fma(_2131, _2351, _2129);
    out.m_85.x = _2363;
    out.m_85.y = _2365;
    out.m_85.z = _2367;
    out.m_85.w = _2345;
    bool _2369 = !_2281;
    float _2371 = _2361;
    float _2373 = _2361;
    if (!_2369)
    {
        bool _2375 = _1910 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _2377 = isnan(_1910);
        bool _2379 = _2375 || _2377;
        bool _2381 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _2383 = _2379 || _2381;
        if (!_2383)
        {
            float _2385 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2387 = _1910 + _2385;
            float _2389 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2391 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _2389;
            float _2393 = 1.0 / _2391;
            float _2395 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _2397 = _2395 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _2399 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _2401 = _2399 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _2403 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _2405 = _2403 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _2407 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _2409 = _2407 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _2411 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _2413 = _2411 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _2415 = _2387 * _2393;
            float _2417 = precise::clamp(_2415, 0.0, 1.0);
            float _2419 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _2421 = _2419 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _2423 = fma(_2417, _2397, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _2425 = fma(_2417, _2421, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _2427 = fma(_2417, _2401, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _2429 = fma(_2417, _2405, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _2431 = fma(_2417, _2409, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _2433 = fma(_2417, _2413, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            _2335 = _2425;
            _2317 = _2431;
            _2359 = _2423;
            _2311 = _2429;
            _2305 = _2427;
            _2373 = _2433;
            _2435 = true;
        }
        else
        {
            bool _2437 = _1910 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _2439 = isnan(_1910);
            bool _2441 = _2437 || _2439;
            bool _2443 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _2445 = _2441 || _2443;
            if (!_2445)
            {
                _2357 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _2447 = _2357;
            _2359 = _2447;
            if (!_2445)
            {
                _2333 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _2449 = _2333;
            _2335 = _2449;
            if (!_2445)
            {
                _2303 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _2451 = _2303;
            _2305 = _2451;
            if (!_2445)
            {
                _2309 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _2453 = _2309;
            _2311 = _2453;
            if (!_2445)
            {
                _2315 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _2455 = _2315;
            _2317 = _2455;
            if (!_2445)
            {
                _2371 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _2457 = _2371;
            bool _2459 = !_2445;
            _2373 = _2457;
            if (!_2459)
            {
                bool _2461 = _1910 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _2463 = isnan(_1910);
                bool _2465 = _2461 || _2463;
                bool _2467 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _2469 = _2465 || _2467;
                if (!_2469)
                {
                    float _2471 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2473 = _1910 + _2471;
                    float _2475 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2477 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _2475;
                    float _2479 = 1.0 / _2477;
                    float _2481 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _2483 = _2481 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _2485 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _2487 = _2485 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _2489 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _2491 = _2489 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _2493 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _2495 = _2493 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _2497 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _2499 = _2497 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _2501 = _2473 * _2479;
                    float _2503 = precise::clamp(_2501, 0.0, 1.0);
                    float _2505 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _2507 = _2505 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _2509 = fma(_2503, _2483, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _2511 = fma(_2503, _2507, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _2513 = fma(_2503, _2487, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _2515 = fma(_2503, _2491, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _2517 = fma(_2503, _2495, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _2519 = fma(_2503, _2499, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    _2335 = _2511;
                    _2317 = _2517;
                    _2359 = _2509;
                    _2311 = _2515;
                    _2305 = _2513;
                    _2373 = _2519;
                    _2435 = true;
                }
                else
                {
                    _2335 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _2317 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _2359 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _2311 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _2305 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _2373 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _2435 = false;
    float _2521 = _2335;
    float _2523 = _2317;
    float _2525 = _2359;
    float _2527 = _2311;
    float _2529 = _2305;
    float _2531 = _2373;
    float _2533 = fma(_2261, -0.5, 0.5);
    float _2535 = precise::clamp(_2533, 0.0, 1.0);
    float _2537 = -_2521;
    float _2539 = _2537 + _2523;
    float _2541 = _2353 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _2543 = -_2525;
    float _2545 = _2543 + _2527;
    float _2547 = fma(_2535, _2539, _2521);
    out.m_87.x = 0.0;
    float _2549 = -_2529;
    float _2551 = _2549 + _2531;
    float _2553 = fma(_2535, _2545, _2525);
    float _2555 = _2547 * 0.586610972881317138671875;
    out.m_49.x = _2541;
    bool _2557 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _2559 = fma(_2535, _2551, _2529);
    float _2561 = fma(_2553, 0.298911988735198974609375, _2555);
    bool _2563 = _1730 > 0.0;
    bool _2565 = isnan(_1730);
    bool _2567 = _2563 || _2565;
    bool _2569 = isnan(0.0);
    bool _2571 = _2567 || _2569;
    float _2573 = fma(_2559, 0.114477999508380889892578125, _2561);
    bool _2575 = _1788 <= 0.0;
    bool _2577 = !_2571;
    bool _2579 = _2575 || _2577;
    float _2581 = -_2573;
    float _2583 = _2553 + _2581;
    float _2585 = -_2573;
    float _2587 = _2547 + _2585;
    float _2589 = -_2573;
    float _2591 = _2559 + _2589;
    float _2593 = fma(_2583, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2573);
    float _2595 = fma(_2587, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2573);
    float _2597 = fma(_2591, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2573);
    bool _2599 = !_2557;
    if (!_2599)
    {
        float _2601 = -_1664;
        float _2603 = _2601 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
        float _2605 = -_1666;
        float _2607 = _2605 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
        float _2609 = -_1668;
        float _2611 = _2609 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
        float _2613 = _2603 * _2603;
        float _2615 = fma(_2607, _2607, _2613);
        float _2617 = fma(_2611, _2611, _2615);
        float _2619 = sqrt(_2617);
        float _2621 = rsqrt(_2617);
        float _2623 = -_2619;
        float _2625 = _2623 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
        float _2627 = _2625 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
        float _2629 = precise::clamp(_2627, 0.0, 1.0);
        float _2631 = _2607 * _2621;
        float _2633 = _2603 * _2621;
        float _2635 = abs(_2629);
        float _2637 = log2(_2635);
        float _2639 = _2611 * _2621;
        float _2641 = _2631 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
        float _2643 = _2261 * _2633;
        float _2645 = -_2633;
        float _2647 = -_2641;
        float _2649 = fma(_2645, (*spvDescriptorSet0.vp_c15)._m0[656].y, _2647);
        float _2651 = fma(_2259, _2631, _2643);
        float _2653 = -_2639;
        float _2655 = fma(_2653, (*spvDescriptorSet0.vp_c15)._m0[656].z, _2649);
        float _2657 = fma(_2263, _2639, _2651);
        float _2659 = precise::clamp(_2657, 0.0, 1.0);
        float _2661 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
        float _2663 = _2655 + _2661;
        float _2665 = _2637 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
        float _2667 = _2663 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
        float _2669 = precise::clamp(_2667, 0.0, 1.0);
        float _2671 = exp2(_2665);
        float _2673 = _2671 * _2669;
        float _2675 = _2659 * _2673;
        float _2677 = _2675 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
        float _2679 = _2675 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
        float _2681 = _2675 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
        out.m_87.x = _2677;
        out.m_87.y = _2679;
        out.m_87.z = _2681;
    }
    out.m_89.x = _2593;
    out.m_89.y = _2595;
    out.m_89.z = _2597;
    if (!_2579)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    out.m_49.x = 0.0;
    float _2683 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _2683;
    out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
}


vertex main0_out main0_z(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]])
{
    main0_out out = {};
    out.m_59 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_67 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_49 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_89 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_63 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_69 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_81 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_71 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_79 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_87 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_83 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_85 = float4(0.0, 0.0, 0.0, 1.0);
    bool _2435 = false;
    bool _530 = false;
    bool _376 = false;
    bool _208 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _103 = in.m_46.w;
    float _105 = trunc(_103);
    int _108 = int(_105);
    bool _112 = _108 >= 1;
    float _114 = 0.0;
    if (!_112)
    {
        _114 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _116 = _114;
    float _118 = _116;
    if (!_112)
    {
        out.m_49.x = 0.0;
    }
    int _120 = 0;
    if (!_112)
    {
        float _122 = _116 * 5.0;
        _120 = as_type<int>(_122);
    }
    int _124 = _120;
    int _126 = _124;
    if (!_112)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2740 = as_type<float>(_124);
        out.gl_Position.z = _2740;
    }
    if (!_112)
    {
        return out;
    }
    float _128 = in.m_51.w;
    bool _130 = _128 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _132 = isnan(_128);
    bool _134 = _130 || _132;
    bool _136 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _138 = _134 || _136;
    float _140 = -_128;
    float _142 = _140 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    float _144 = 0.0;
    if (_138)
    {
        float _146 = float(_108);
        _144 = _146;
    }
    float _148 = _144;
    bool _150 = _142 >= _148;
    bool _152 = !_138;
    bool _154 = _150 || _152;
    if (_154)
    {
        _118 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _156 = _118;
    if (_154)
    {
        out.m_49.x = 0.0;
    }
    if (_154)
    {
        float _158 = _156 * 5.0;
        _126 = as_type<int>(_158);
    }
    int _160 = _126;
    if (_154)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2808 = as_type<float>(_160);
        out.gl_Position.z = _2808;
    }
    if (_154)
    {
        return out;
    }
    float _162 = in.m_53.x;
    float _164 = in.m_53.y;
    float _166 = in.m_53.z;
    bool _168 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _170 = _164 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _172 = _164 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _174 = _164 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _176 = fma(_162, (*spvDescriptorSet0.vp_c10)._m0[4].x, _170);
    float _178 = fma(_162, (*spvDescriptorSet0.vp_c10)._m0[5].x, _172);
    float _180 = fma(_162, (*spvDescriptorSet0.vp_c10)._m0[6].x, _174);
    float _182 = fma(_166, (*spvDescriptorSet0.vp_c10)._m0[4].z, _176);
    float _184 = fma(_166, (*spvDescriptorSet0.vp_c10)._m0[5].z, _178);
    float _186 = fma(_166, (*spvDescriptorSet0.vp_c10)._m0[6].z, _180);
    bool _188 = !_168;
    float _206;
    if (!_188)
    {
        float _190 = in.m_55.x;
        float _192 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _194 = _190 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _196 = fma(_194, (*spvDescriptorSet0.vp_c9)._m0[12].x, _142);
        float _198 = _196 * _192;
        float _200 = floor(_198);
        float _202 = -_200;
        float _204 = _198 + _202;
        _206 = _204;
        _208 = true;
    }
    else
    {
        float _210 = float(_108);
        float _212 = 1.0 / _210;
        float _214 = _142 * _212;
        _206 = _214;
    }
    _208 = false;
    float _216 = _206;
    float _218 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _220 = _216 + _218;
    bool _222 = _216 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _224 = isnan(_216);
    bool _226 = _222 || _224;
    bool _228 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _230 = _226 || _228;
    float _232 = float(_230);
    bool _234 = _216 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _236 = isnan(_216);
    bool _238 = _234 || _236;
    bool _240 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _242 = _238 || _240;
    float _244 = float(_242);
    float _246 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _248 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _246;
    float _250 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _252 = _250 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _254 = 1.0 / _248;
    bool _256 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _258 = 1.0 / _252;
    float _260 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _262 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _260;
    float _264 = _220 * _254;
    float _266 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _268 = _216 + _266;
    bool _270 = _216 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _272 = isnan(_216);
    bool _274 = _270 || _272;
    bool _276 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _278 = _274 || _276;
    float _280 = float(_278);
    float _282 = -_232;
    float _284 = _282 + 1.0;
    float _286 = fma(_262, _264, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _288 = _280 * _284;
    float _290 = -_280;
    float _292 = _290 + 1.0;
    float _294 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _296 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _294;
    float _298 = -(*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _300 = (*spvDescriptorSet0.vp_c9)._m0[144].z + _298;
    float _302 = _268 * _258;
    float _304 = _244 * _292;
    float _306 = fma(_296, _264, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _308 = fma(_300, _264, (*spvDescriptorSet0.vp_c9)._m0[143].z);
    float _310 = -_244;
    float _312 = _310 + 1.0;
    float _314 = _286 * _304;
    float _316 = _306 * _304;
    float _318 = _308 * _304;
    float _320 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _322 = _320 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _324 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _326 = _324 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _328 = -(*spvDescriptorSet0.vp_c9)._m0[144].z;
    float _330 = _328 + (*spvDescriptorSet0.vp_c9)._m0[145].z;
    float _332 = fma(_312, (*spvDescriptorSet0.vp_c9)._m0[143].x, _316);
    float _334 = fma(_322, _302, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _336 = fma(_326, _302, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _338 = fma(_330, _302, (*spvDescriptorSet0.vp_c9)._m0[144].z);
    float _340 = fma(_312, (*spvDescriptorSet0.vp_c9)._m0[143].y, _314);
    float _342 = fma(_312, (*spvDescriptorSet0.vp_c9)._m0[143].z, _318);
    float _344 = fma(_334, _288, _332);
    float _346 = fma(_336, _288, _340);
    float _348 = fma(_338, _288, _342);
    float _350 = fma(_232, (*spvDescriptorSet0.vp_c9)._m0[145].x, _344);
    float _352 = fma(_232, (*spvDescriptorSet0.vp_c9)._m0[145].y, _346);
    float _354 = fma(_232, (*spvDescriptorSet0.vp_c9)._m0[145].z, _348);
    bool _356 = !_256;
    float _374;
    if (!_356)
    {
        float _358 = in.m_55.x;
        float _360 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _362 = _358 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _364 = fma(_362, (*spvDescriptorSet0.vp_c9)._m0[11].y, _142);
        float _366 = _364 * _360;
        float _368 = floor(_366);
        float _370 = -_368;
        float _372 = _366 + _370;
        _374 = _372;
        _376 = true;
    }
    else
    {
        float _378 = float(_108);
        float _380 = 1.0 / _378;
        float _382 = _142 * _380;
        _374 = _382;
    }
    _376 = false;
    float _384 = _374;
    float _386 = in.m_57.x;
    float _388 = in.m_57.y;
    float _390 = in.m_57.z;
    float _392 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _394 = _392 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _396 = _384 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _398 = isnan(_384);
    bool _400 = _396 || _398;
    bool _402 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _404 = _400 || _402;
    float _406 = float(_404);
    float _408 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _410 = _408 + (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _412 = _384 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _414 = isnan(_384);
    bool _416 = _412 || _414;
    bool _418 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _420 = _416 || _418;
    float _422 = float(_420);
    float _424 = 1.0 / _394;
    float _426 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _428 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _426;
    float _430 = -_406;
    float _432 = _430 + 1.0;
    bool _434 = _384 >= (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _436 = isnan(_384);
    bool _438 = _434 || _436;
    bool _440 = isnan((*spvDescriptorSet0.vp_c9)._m0[117].w);
    bool _442 = _438 || _440;
    float _444 = float(_442);
    bool _446 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].w;
    float _448 = _422 * _432;
    float _450 = -_422;
    float _452 = _450 + 1.0;
    float _454 = 1.0 / _410;
    float _456 = -(*spvDescriptorSet0.vp_c9)._m0[116].x;
    float _458 = _456 + (*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _460 = _428 * _424;
    float _462 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _464 = _384 + _462;
    float _466 = -_444;
    float _468 = _466 + 1.0;
    float _470 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _472 = _384 + _470;
    float _474 = _354 * _390;
    float _476 = fma(_460, _464, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _478 = _406 * _468;
    float _480 = _350 * _386;
    float _482 = _458 * _454;
    float _484 = _476 * _448;
    float _486 = fma(_482, _472, (*spvDescriptorSet0.vp_c9)._m0[116].x);
    float _488 = fma(_452, (*spvDescriptorSet0.vp_c9)._m0[115].x, _484);
    float _490 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _492 = fma(_486, _478, _488);
    float _494 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _496 = _490 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _498 = fma(_444, (*spvDescriptorSet0.vp_c9)._m0[117].x, _492);
    float _500 = _352 * _388;
    float _502 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _504 = _494 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _506 = _498 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _508 = _502 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    out.m_59.x = _496;
    out.m_59.y = _504;
    out.m_59.z = _508;
    out.m_59.w = _506;
    bool _510 = !_446;
    float _528;
    if (!_510)
    {
        float _512 = in.m_55.x;
        float _514 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].w;
        float _516 = _512 * (*spvDescriptorSet0.vp_c9)._m0[13].x;
        float _518 = fma(_516, (*spvDescriptorSet0.vp_c9)._m0[11].w, _142);
        float _520 = _518 * _514;
        float _522 = floor(_520);
        float _524 = -_522;
        float _526 = _520 + _524;
        _528 = _526;
        _530 = true;
    }
    else
    {
        float _532 = float(_108);
        float _534 = 1.0 / _532;
        float _536 = _142 * _534;
        _528 = _536;
    }
    _530 = false;
    float _538 = _528;
    float _540 = in.m_55.x;
    float _542 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].w;
    float _544 = in.m_61.x;
    int _546 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _548 = _546 != 0;
    float _550 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _552 = _538 + _550;
    int _554 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 16;
    bool _556 = _554 != 0;
    float _558 = in.m_55.y;
    int _560 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 32;
    bool _562 = _560 != 0;
    float _564 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _566 = _564 + (*spvDescriptorSet0.vp_c9)._m0[132].w;
    int _568 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _570 = _568 != 0;
    float _572 = in.m_61.y;
    float _574 = in.m_46.x;
    float _576 = in.m_46.y;
    float _578 = in.m_46.z;
    float _580 = 1.0 / _566;
    float _582 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    int _584 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _586 = _584 != 0;
    float _588 = in.m_55.z;
    float _590 = _540 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    float _592 = in.m_61.z;
    float _594 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _596 = -_582;
    float _598 = fma(_590, 2.0, _596);
    out.m_63.x = _544;
    bool _600 = _558 > 0.5;
    float _602 = in.m_65.y;
    float _604 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    float _606 = _558 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    out.m_63.y = _572;
    float _608 = fma(_540, (*spvDescriptorSet0.vp_c9)._m0[78].z, _604);
    float _610 = _576 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _612 = fma(_606, -2.0, _594);
    float _614 = _576 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _616 = in.m_65.x;
    float _618 = fma(_574, (*spvDescriptorSet0.vp_c10)._m0[6].x, _610);
    bool _620 = _588 > 0.5;
    float _622 = _576 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _624 = -(*spvDescriptorSet0.vp_c9)._m0[131].x;
    float _626 = (*spvDescriptorSet0.vp_c9)._m0[132].x + _624;
    float _628 = fma(_574, (*spvDescriptorSet0.vp_c10)._m0[4].x, _614);
    float _630 = _614;
    float _632 = _622;
    bool _634 = _620;
    if (_586)
    {
        _630 = _558;
    }
    float _636 = _630;
    float _638 = fma(_574, (*spvDescriptorSet0.vp_c10)._m0[5].x, _622);
    float _640 = _626 * _580;
    out.m_63.z = _592;
    float _642 = fma(_640, _552, (*spvDescriptorSet0.vp_c9)._m0[131].x);
    float _644 = _636;
    float _646 = _640;
    if (_586)
    {
        _632 = _540;
    }
    float _648 = _632;
    float _650 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    float _652 = _648;
    if (!_586)
    {
        _652 = _588;
    }
    float _654 = _652;
    float _656 = (*spvDescriptorSet0.vp_c9)._m0[88].w + (*spvDescriptorSet0.vp_c9)._m0[88].y;
    float _658 = -_602;
    float _660 = _658 + 1.0;
    float _662 = fma(_558, (*spvDescriptorSet0.vp_c9)._m0[78].w, _650);
    float _664 = fma(_558, (*spvDescriptorSet0.vp_c9)._m0[88].w, _656);
    bool _666 = _538 >= (*spvDescriptorSet0.vp_c9)._m0[132].w;
    bool _668 = isnan(_538);
    bool _670 = _666 || _668;
    bool _672 = isnan((*spvDescriptorSet0.vp_c9)._m0[132].w);
    bool _674 = _670 || _672;
    float _676 = float(_674);
    float _678 = (*spvDescriptorSet0.vp_c9)._m0[88].z + (*spvDescriptorSet0.vp_c9)._m0[88].x;
    float _680 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    int _682 = _620 ? as_type<int>(_660) : as_type<int>(_602);
    float _684 = fma(_578, (*spvDescriptorSet0.vp_c10)._m0[4].z, _628);
    float _686 = _602;
    int _688 = as_type<int>(_654);
    if (_548)
    {
        bool _690 = _540 > 0.5;
        _634 = _690;
    }
    bool _692 = _634;
    float _694 = fma(_540, (*spvDescriptorSet0.vp_c9)._m0[88].z, _678);
    if (!_586)
    {
        _644 = _540;
    }
    float _696 = _644;
    float _698 = fma(_578, (*spvDescriptorSet0.vp_c10)._m0[5].z, _638);
    float _700 = fma(_578, (*spvDescriptorSet0.vp_c10)._m0[6].z, _618);
    bool _702 = _538 >= (*spvDescriptorSet0.vp_c9)._m0[131].w;
    bool _704 = isnan(_538);
    bool _706 = _702 || _704;
    bool _708 = isnan((*spvDescriptorSet0.vp_c9)._m0[131].w);
    bool _710 = _706 || _708;
    float _712 = float(_710);
    float _714 = -_676;
    float _716 = _714 + 1.0;
    float _718 = _562 ? as_type<float>(_682) : _602;
    float _720 = _542 * (*spvDescriptorSet0.vp_c9)._m0[90].y;
    int _722 = as_type<int>(_696);
    if (_570)
    {
        float _724 = _600 ? _660 : _602;
        _686 = _724;
    }
    float _726 = _686;
    float _728 = _712 * _716;
    float _730 = fma(_718, _720, -0.5);
    float _732 = _696 * (*spvDescriptorSet0.vp_c9)._m0[87].y;
    float _734 = _642 * _728;
    float _736 = _680 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _738 = (*spvDescriptorSet0.vp_c9)._m0[87].x + (*spvDescriptorSet0.vp_c9)._m0[86].z;
    float _740 = _654 * (*spvDescriptorSet0.vp_c9)._m0[87].x;
    float _742 = _726;
    if (_556)
    {
        float _744 = -_616;
        float _746 = _744 + 1.0;
        _688 = as_type<int>(_746);
    }
    int _748 = _688;
    if (_548)
    {
        float _750 = -_616;
        float _752 = _750 + 1.0;
        _722 = as_type<int>(_752);
    }
    int _754 = _722;
    float _756 = fma(_736, _726, -0.5);
    if (!_556)
    {
        _742 = _616;
    }
    float _758 = _742;
    float _760 = -_738;
    float _762 = fma(_740, 2.0, _760);
    float _764 = fma(_142, (*spvDescriptorSet0.vp_c9)._m0[77].w, _662);
    float _766 = _758;
    if (_556)
    {
        float _768 = _600 ? as_type<float>(_748) : _616;
        _766 = _768;
    }
    float _770 = _766;
    float _772 = -_142;
    float _774 = fma(_772, (*spvDescriptorSet0.vp_c9)._m0[76].x, _598);
    if (!_548)
    {
        _646 = _616;
    }
    float _776 = _646;
    float _778 = _698 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _780 = _776;
    float _782 = _778;
    if (_548)
    {
        float _784 = _692 ? as_type<float>(_754) : _616;
        _780 = _784;
    }
    float _786 = _780;
    float _788 = fma(_142, (*spvDescriptorSet0.vp_c9)._m0[76].y, _612);
    float _790 = (*spvDescriptorSet0.vp_c9)._m0[87].y + (*spvDescriptorSet0.vp_c9)._m0[86].w;
    float _792 = -_712;
    float _794 = _792 + 1.0;
    float _796 = fma(_142, (*spvDescriptorSet0.vp_c9)._m0[87].z, _694);
    float _798 = _684 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _800 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _802 = _778 + _800;
    float _804 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].z;
    float _806 = -_788;
    float _808 = fma(_764, _756, _806);
    float _810 = fma(_732, -2.0, _790);
    float _812 = fma(_794, (*spvDescriptorSet0.vp_c9)._m0[131].x, _734);
    float _814 = _700 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _816 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _818 = _798 + _816;
    float _820 = _802 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _822 = fma(_142, (*spvDescriptorSet0.vp_c9)._m0[77].z, _608);
    float _824 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _826 = fma(_142, (*spvDescriptorSet0.vp_c9)._m0[87].w, _664);
    float _828 = -_142;
    float _830 = fma(_828, (*spvDescriptorSet0.vp_c9)._m0[86].x, _762);
    float _832 = fma(_142, (*spvDescriptorSet0.vp_c9)._m0[86].y, _810);
    float _834 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _836 = _814 + _834;
    float _838 = fma(_818, (*spvDescriptorSet0.vp_c8)._m0[28].x, _820);
    float _840 = -_832;
    float _842 = fma(_826, _730, _840);
    float _844 = fma(_676, (*spvDescriptorSet0.vp_c9)._m0[132].x, _812);
    float _846 = fma(_836, (*spvDescriptorSet0.vp_c8)._m0[28].z, _838);
    float _848 = _802 * _802;
    float _850 = in.m_61.w;
    float _852 = _804 * (*spvDescriptorSet0.vp_c9)._m0[90].x;
    float _854 = _842 + 0.5;
    bool _856 = _846 >= 0.0;
    float _858 = fma(_818, _818, _848);
    float _860 = _824 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _862 = fma(_852, _770, -0.5);
    float _864 = fma(_836, _836, _858);
    float _866 = fma(_860, _786, -0.5);
    float _868 = fma(_796, _862, _830);
    float _870 = rsqrt(_864);
    float _872 = _808 + 0.5;
    float _874 = fma(_822, _866, _774);
    float _876 = _808;
    if (_856)
    {
        _876 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _878 = _876;
    float _880 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _882 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _884 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _886 = _880 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _888 = _882 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _890 = _884 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _892 = _844 * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    float _894 = _874 + 0.5;
    float _896 = _868 + 0.5;
    int _898 = as_type<int>(_878);
    if (_856)
    {
        float _900 = _878 * 5.0;
        _898 = as_type<int>(_900);
    }
    int _902 = _898;
    out.m_63.w = _850;
    float _904 = _802 * _870;
    float _906 = _818 * _870;
    out.m_67.x = _886;
    out.m_67.y = _888;
    out.m_67.z = _890;
    out.m_67.w = _892;
    out.m_69.x = _894;
    out.m_69.y = _872;
    out.m_71.x = _896;
    out.m_71.y = _854;
    float _908 = as_type<float>(_902);
    if (_856)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _4113 = as_type<float>(_902);
        out.gl_Position.z = _4113;
    }
    if (_856)
    {
        out.m_49.x = 0.0;
    }
    if (_856)
    {
        return out;
    }
    float _910 = -_904;
    float _912 = fma(_910, (*spvDescriptorSet0.vp_c9)._m0[18].w, _778);
    float _914 = _836 * _870;
    float _916 = -_906;
    float _918 = fma(_916, (*spvDescriptorSet0.vp_c9)._m0[18].w, _798);
    float _920 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _922 = _912 + _920;
    float _924 = -_914;
    float _926 = fma(_924, (*spvDescriptorSet0.vp_c9)._m0[18].w, _814);
    float _928 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _930 = _918 + _928;
    float _932 = _922 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _934 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _936 = _926 + _934;
    float _938 = fma(_930, (*spvDescriptorSet0.vp_c8)._m0[28].x, _932);
    float _940 = fma(_936, (*spvDescriptorSet0.vp_c8)._m0[28].z, _938);
    bool _942 = _940 >= 0.0;
    float _944 = _912;
    float _946 = _936;
    if (_942)
    {
        _908 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _948 = _908;
    int _950 = as_type<int>(_948);
    if (_942)
    {
        out.m_49.x = 0.0;
    }
    if (_942)
    {
        float _952 = _948 * 5.0;
        _950 = as_type<int>(_952);
    }
    int _954 = _950;
    if (_942)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _4209 = as_type<float>(_954);
        out.gl_Position.z = _4209;
    }
    if (_942)
    {
        return out;
    }
    float _956 = -_778;
    float _958 = _956 + (*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _960 = -_798;
    float _962 = _960 + (*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _964 = -_814;
    float _966 = _964 + (*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _968 = _958 * _958;
    float _970 = -_904;
    float _972 = fma(_970, (*spvDescriptorSet0.vp_c9)._m0[18].w, _802);
    float _974 = fma(_962, _962, _968);
    float _976 = (*spvDescriptorSet0.vp_c8)._m0[2].w * (*spvDescriptorSet0.vp_c8)._m0[3].z;
    float _978 = -_906;
    float _980 = fma(_978, (*spvDescriptorSet0.vp_c9)._m0[18].w, _818);
    float _982 = fma(_966, _966, _974);
    float _984 = -_976;
    float _986 = fma((*spvDescriptorSet0.vp_c8)._m0[3].w, (*spvDescriptorSet0.vp_c8)._m0[2].z, _984);
    float _988 = _972 * _972;
    float _990 = rsqrt(_982);
    float _992 = fma(_980, _980, _988);
    float _994 = (*spvDescriptorSet0.vp_c8)._m0[2].w * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _996 = (*spvDescriptorSet0.vp_c8)._m0[2].w * (*spvDescriptorSet0.vp_c8)._m0[3].x;
    float _998 = -_994;
    float _1000 = fma((*spvDescriptorSet0.vp_c8)._m0[3].w, (*spvDescriptorSet0.vp_c8)._m0[2].y, _998);
    float _1002 = -_996;
    float _1004 = fma((*spvDescriptorSet0.vp_c8)._m0[3].w, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1002);
    float _1006 = _962 * _990;
    float _1008 = _966 * _990;
    float _1010 = _1004 * (*spvDescriptorSet0.vp_c8)._m0[1].z;
    float _1012 = _1000 * (*spvDescriptorSet0.vp_c8)._m0[1].z;
    float _1014 = _1006 * _1006;
    float _1016 = _958 * _990;
    float _1018 = fma(_1008, _1008, _1014);
    float _1020 = (*spvDescriptorSet0.vp_c8)._m0[2].z * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1022 = (*spvDescriptorSet0.vp_c8)._m0[2].z * (*spvDescriptorSet0.vp_c8)._m0[3].x;
    float _1024 = rsqrt(_1018);
    float _1026 = -_1020;
    float _1028 = fma((*spvDescriptorSet0.vp_c8)._m0[2].y, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1026);
    float _1030 = -_1022;
    float _1032 = fma((*spvDescriptorSet0.vp_c8)._m0[2].x, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1030);
    float _1034 = _1032 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1036 = (*spvDescriptorSet0.vp_c8)._m0[2].y * (*spvDescriptorSet0.vp_c8)._m0[3].x;
    float _1038 = -_1012;
    float _1040 = fma(_986, (*spvDescriptorSet0.vp_c8)._m0[1].y, _1038);
    float _1042 = -_1034;
    float _1044 = fma(_1028, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1042);
    float _1046 = -_1036;
    float _1048 = fma((*spvDescriptorSet0.vp_c8)._m0[2].x, (*spvDescriptorSet0.vp_c8)._m0[3].y, _1046);
    float _1050 = -_1010;
    float _1052 = fma(_986, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1050);
    float _1054 = fma(_1028, (*spvDescriptorSet0.vp_c8)._m0[1].w, _1040);
    float _1056 = _1008 * _1024;
    float _1058 = _1006 * _1024;
    float _1060 = fma(_1032, (*spvDescriptorSet0.vp_c8)._m0[1].w, _1052);
    float _1062 = -_1056;
    float _1064 = _1008 * _1062;
    float _1066 = -_1056;
    float _1068 = _1016 * _1066;
    float _1070 = _1060 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1072 = _1004 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1074 = -_1064;
    float _1076 = fma(_1006, _1058, _1074);
    float _1078 = _1016 * _1058;
    float _1080 = -_1070;
    float _1082 = fma(_1054, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1080);
    float _1084 = -_1072;
    float _1086 = fma(_1000, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1084);
    float _1088 = _1076 * _1076;
    float _1090 = fma(_1048, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1044);
    float _1092 = fma(_1048, (*spvDescriptorSet0.vp_c8)._m0[1].w, _1086);
    float _1094 = fma(_1078, _1078, _1088);
    float _1096 = fma(_1092, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1082);
    float _1098 = fma(_1068, _1068, _1094);
    float _1100 = _1004 * (*spvDescriptorSet0.vp_c8)._m0[0].z;
    float _1102 = _1004 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1104 = -_1090;
    float _1106 = fma(_1104, (*spvDescriptorSet0.vp_c8)._m0[0].w, _1096);
    float _1108 = rsqrt(_1098);
    float _1110 = -_1100;
    float _1112 = fma(_986, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1110);
    float _1114 = _1000 * (*spvDescriptorSet0.vp_c8)._m0[0].z;
    float _1116 = -_1102;
    float _1118 = fma(_1000, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1116);
    float _1120 = fma(_1032, (*spvDescriptorSet0.vp_c8)._m0[0].w, _1112);
    float _1122 = -_1114;
    float _1124 = fma(_986, (*spvDescriptorSet0.vp_c8)._m0[0].y, _1122);
    float _1126 = fma(_1048, (*spvDescriptorSet0.vp_c8)._m0[0].w, _1118);
    float _1128 = 1.0 / _1106;
    float _1130 = fma(_1028, (*spvDescriptorSet0.vp_c8)._m0[0].w, _1124);
    float _1132 = _1076 * _1108;
    float _1134 = precise::clamp(_1132, 0.0, 1.0);
    float _1136 = -_1134;
    float _1138 = _1136 + 1.0;
    float _1140 = fma(_1120, _1128, -1.0);
    float _1142 = _1138 * _1128;
    float _1144 = _480 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _1146 = fma(_1138, _1140, 1.0);
    float _1148 = _1130 * _1142;
    float _1150 = _1126 * _1142;
    float _1152 = _1146 * _1146;
    float _1154 = fma(_1148, _1148, _1152);
    float _1156 = fma(_1150, _1150, _1154);
    float _1158 = rsqrt(_1156);
    float _1160 = _1150 * _1158;
    float _1162 = _1148 * _1158;
    float _1164 = _1146 * _1158;
    float _1166 = -_1160;
    float _1168 = _1006 * _1166;
    float _1170 = _1008 * _1164;
    float _1172 = -_1162;
    float _1174 = -_1168;
    float _1176 = fma(_1008, _1172, _1174);
    float _1178 = -_1162;
    float _1180 = _1016 * _1178;
    float _1182 = -_1160;
    float _1184 = -_1170;
    float _1186 = fma(_1016, _1182, _1184);
    float _1188 = _1176 * _1176;
    float _1190 = -_1180;
    float _1192 = fma(_1006, _1164, _1190);
    float _1194 = fma(_1186, _1186, _1188);
    float _1196 = fma(_1192, _1192, _1194);
    float _1198 = rsqrt(_1196);
    float _1200 = _1186 * _1198;
    float _1202 = _1192 * _1198;
    float _1204 = _1176 * _1198;
    float _1206 = _1008 * _1200;
    float _1208 = _1016 * _1202;
    float _1210 = -_1206;
    float _1212 = fma(_1006, _1202, _1210);
    float _1214 = _1006 * _1204;
    float _1216 = -_1208;
    float _1218 = fma(_1008, _1204, _1216);
    float _1220 = -_914;
    float _1222 = fma(_1220, (*spvDescriptorSet0.vp_c9)._m0[18].w, _836);
    float _1224 = _1212 * _1212;
    float _1226 = -_1214;
    float _1228 = fma(_1016, _1200, _1226);
    float _1230 = fma(_1222, _1222, _992);
    float _1232 = fma(_1218, _1218, _1224);
    float _1234 = sqrt(_1230);
    float _1236 = fma(_1228, _1228, _1232);
    float _1238 = rsqrt(_1236);
    float _1240 = _870 * _1234;
    float _1242 = _1228 * _1238;
    float _1244 = _1218 * _1238;
    float _1246 = _1212 * _1238;
    float _1248 = _1006 * _1242;
    float _1250 = in.m_73.x;
    float _1252 = in.m_73.y;
    float _1254 = in.m_73.z;
    float _1256 = _1008 * _1246;
    float _1258 = -_1248;
    float _1260 = fma(_1008, _1244, _1258);
    float _1262 = _1016 * _1244;
    float _1264 = -_1256;
    float _1266 = fma(_1016, _1242, _1264);
    float _1268 = _1260 * _1260;
    float _1270 = -_1262;
    float _1272 = fma(_1006, _1246, _1270);
    float _1274 = fma(_1266, _1266, _1268);
    float _1276 = fma(_1272, _1272, _1274);
    float _1278 = _500 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _1280 = rsqrt(_1276);
    float _1282 = _1240 * _1278;
    float _1284 = _474 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _1286 = _1240 * _1144;
    float _1288 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _1252);
    float _1290 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _1250);
    float _1292 = _1284 * _1240;
    float _1294 = _1288 * _1282;
    float _1296 = _1290 * _1286;
    float _1298 = _1292 * _1254;
    float _1300 = _912 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _1302 = _1294 * _1242;
    float _1304 = _1294 * _1244;
    float _1306 = _1272 * _1280;
    float _1308 = _1266 * _1280;
    float _1310 = _1260 * _1280;
    float _1312 = fma(_918, (*spvDescriptorSet0.vp_c8)._m0[11].x, _1300);
    float _1314 = fma(_1296, _1306, _1302);
    float _1316 = fma(_1296, _1308, _1304);
    float _1318 = fma(_926, (*spvDescriptorSet0.vp_c8)._m0[11].z, _1312);
    float _1320 = fma(_1298, _1008, _1314);
    float _1322 = fma(_1298, _1006, _1316);
    float _1324 = _814 + _1320;
    float _1326 = _798 + _1322;
    float _1328 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1330 = _1324 + _1328;
    float _1332 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1334 = _1326 + _1332;
    float _1336 = _1330 * _1330;
    float _1338 = fma(_1334, _1334, _1336);
    float _1340 = _1294 * _1246;
    float _1342 = sqrt(_1338);
    float _1344 = fma(_1296, _1310, _1340);
    float _1346 = fma(_1298, _1016, _1344);
    float _1348 = _778 + _1346;
    bool _1350 = _1342 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1352 = _1298;
    float _1354 = _1340;
    float _1356 = _1346;
    if (!_1350)
    {
        _1352 = _1326;
    }
    float _1358 = _1352;
    float _1360 = _1358;
    if (!_1350)
    {
        _1354 = _1324;
    }
    float _1362 = _1354;
    float _1364 = _1362;
    if (!_1350)
    {
        _1356 = _1348;
    }
    float _1366 = _1356;
    bool _1368 = !_1350;
    float _1370 = _1366;
    if (!_1368)
    {
        float _1372 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1374 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1376 = _1342 + _1374;
        float _1378 = rsqrt(_1338);
        float _1380 = _1376 * _1372;
        float _1382 = _1348 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1384 = _1380 * 0.15915493667125701904296875;
        float _1386 = _1384 * 6.283185482025146484375;
        float _1388 = cos(_1386);
        float _1390 = _1384 * 6.283185482025146484375;
        float _1392 = sin(_1390);
        float _1394 = _1388 + (-1.0);
        float _1396 = _1394 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1398 = fma(_1392, _1382, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1400 = fma(_1348, _1388, _1396);
        float _1402 = _1378 * _1398;
        float _1404 = fma(_1334, _1402, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1406 = fma(_1330, _1402, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _1370 = _1400;
        _1360 = _1404;
        _1364 = _1406;
    }
    float _1408 = _1370;
    float _1410 = _1360;
    float _1412 = _1364;
    float _1414 = -_778;
    float _1416 = _1414 + _1408;
    float _1418 = -_798;
    float _1420 = _1418 + _1410;
    float _1422 = -_814;
    float _1424 = _1422 + _1412;
    float _1426 = _1318 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _1428 = _1416 * _1416;
    float _1430 = _912 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _1432 = 1.0 / _1426;
    float _1434 = fma(_1420, _1420, _1428);
    float _1436 = fma(_918, (*spvDescriptorSet0.vp_c8)._m0[10].x, _1430);
    float _1438 = fma(_1424, _1424, _1434);
    float _1440 = fma(_926, (*spvDescriptorSet0.vp_c8)._m0[10].z, _1436);
    bool _1442 = (*spvDescriptorSet0.vp_c15)._m0[653].w >= 0.5;
    bool _1444 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _1446 = _1442 || _1444;
    bool _1448 = isnan(0.5);
    bool _1450 = _1446 || _1448;
    float _1452 = sqrt(_1438);
    float _1454 = _1440 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _1456 = _1454 + _1426;
    float _1458 = _1456 * _1432;
    float _1460 = _1458 * 0.5;
    bool _1462 = _1452 > 0.0;
    float _1464 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _1466 = fma(_1460, (*spvDescriptorSet0.vp_c8)._m0[30].w, _1464);
    bool _1468 = (*spvDescriptorSet0.vp_c15)._m0[660].y >= 0.5;
    bool _1470 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _1472 = _1468 || _1470;
    bool _1474 = isnan(0.5);
    bool _1476 = _1472 || _1474;
    float _1478 = 1.0 / _1466;
    bool _1480 = !_1462;
    float _1482 = _1410;
    float _1484 = _1408;
    float _1486 = _1412;
    float _1488 = (*spvDescriptorSet0.vp_c15)._m0[653].w;
    if (!_1480)
    {
        float _1490 = _184 * _184;
        float _1492 = rsqrt(_1438);
        float _1494 = fma(_182, _182, _1490);
        float _1496 = fma(_186, _186, _1494);
        float _1498 = sqrt(_1496);
        float _1500 = _1420 * _1492;
        float _1502 = _1416 * _1492;
        float _1504 = _1424 * _1492;
        bool _1506 = _1498 > 0.0;
        bool _1508 = !_1506;
        _1488 = _1498;
        if (!_1508)
        {
            float _1510 = rsqrt(_1496);
            float _1512 = 1.0 / (*spvDescriptorSet0.vp_c10)._m0[2].z;
            float _1514 = _184 * _1510;
            float _1516 = _182 * _1510;
            float _1518 = _1502 * _1514;
            float _1520 = _186 * _1510;
            float _1522 = fma(_1500, _1516, _1518);
            float _1524 = _1512 * (*spvDescriptorSet0.vp_c9)._m0[142].x;
            float _1526 = fma(_1504, _1520, _1522);
            float _1528 = _1526 * _1524;
            float _1530 = fma(_182, _1528, _1410);
            float _1532 = fma(_184, _1528, _1408);
            float _1534 = fma(_186, _1528, _1412);
            _1482 = _1530;
            _1484 = _1532;
            _1486 = _1534;
            _1488 = _1528;
        }
    }
    float _1536 = _1482;
    float _1538 = _1484;
    float _1540 = _1486;
    float _1542 = _1488;
    float _1544 = -_906;
    float _1546 = fma(_1544, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1536);
    float _1548 = -_904;
    float _1550 = fma(_1548, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1538);
    float _1552 = -_914;
    float _1554 = fma(_1552, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1540);
    float _1556 = _1542;
    float _1558 = _1550;
    float _1560 = _1546;
    float _1562 = _1554;
    if (_1450)
    {
        _1556 = 1.0;
    }
    float _1564 = _1556;
    float _1566 = _1564;
    if (!_1476)
    {
        float _1568 = _922 * _922;
        float _1570 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _1572 = -_798;
        float _1574 = _1572 + _1536;
        float _1576 = -_778;
        float _1578 = _1576 + _1538;
        float _1580 = fma(_930, _930, _1568);
        float _1582 = -_814;
        float _1584 = _1582 + _1540;
        float _1586 = fma(_936, _936, _1580);
        float _1588 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1590 = sqrt(_1586);
        float _1592 = 1.0 / _1240;
        bool _1594 = _1590 > (*spvDescriptorSet0.vp_c9)._m0[199].x;
        bool _1596 = isnan(_1590);
        bool _1598 = _1594 || _1596;
        bool _1600 = isnan((*spvDescriptorSet0.vp_c9)._m0[199].x);
        bool _1602 = _1598 || _1600;
        float _1604 = precise::min(_1590, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _1606 = _1604 * _1570;
        float _1608 = _1588 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1610 = _1578 * _1592;
        float _1612 = _1574 * _1592;
        float _1614 = _1584 * _1592;
        float _1616 = _1608 * _1606;
        float _1618 = _1550;
        float _1620 = _1590;
        _782 = _1578;
        if (_1602)
        {
            float _1622 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].y;
            _1618 = _1622;
        }
        float _1624 = _1618;
        if (_1602)
        {
            float _1626 = precise::max(_1590, (*spvDescriptorSet0.vp_c9)._m0[199].y);
            _1620 = _1626;
        }
        float _1628 = _1620;
        float _1630 = fma(_1612, _1616, _918);
        float _1632 = fma(_1614, _1616, _926);
        float _1634 = _1628;
        float _1636 = _1630;
        _1562 = _1632;
        if (_1602)
        {
            float _1638 = _1628 * _1624;
            _1634 = _1638;
        }
        float _1640 = _1634;
        float _1642 = fma(_1610, _1616, _912);
        float _1644 = _1640;
        float _1646 = _1642;
        if (_1602)
        {
            float _1648 = _1608 * _1640;
            _1644 = _1648;
        }
        float _1650 = _1644;
        if (_1602)
        {
            float _1652 = fma(_1610, _1650, _912);
            _1646 = _1652;
        }
        float _1654 = _1646;
        _1558 = _1654;
        if (_1602)
        {
            float _1656 = fma(_1612, _1650, _918);
            _1636 = _1656;
        }
        float _1658 = _1636;
        _1560 = _1658;
        if (_1602)
        {
            float _1660 = fma(_1614, _1650, _926);
            _1562 = _1660;
        }
    }
    float _1662 = _782;
    float _1664 = _1558;
    float _1666 = _1560;
    float _1668 = _1562;
    float _1670 = _1662;
    if (_1450)
    {
        _944 = 1.0;
    }
    float _1672 = _944;
    float _1674 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _1676 = _1478 * _1674;
    float _1678 = _1672;
    if (!_1450)
    {
        float _1680 = (*spvDescriptorSet0.vp_c8)._m0[31].x * 0.5;
        float _1682 = _1680 * 0.15915493667125701904296875;
        float _1684 = _1682 * 6.283185482025146484375;
        float _1686 = cos(_1684);
        float _1688 = (*spvDescriptorSet0.vp_c8)._m0[31].y * 0.5;
        float _1690 = _1688 * 0.15915493667125701904296875;
        float _1692 = _1682 * 6.283185482025146484375;
        float _1694 = sin(_1692);
        float _1696 = 1.0 / _1686;
        float _1698 = _1690 * 6.283185482025146484375;
        float _1700 = cos(_1698);
        float _1702 = _1694 * _1696;
        float _1704 = _1690 * 6.283185482025146484375;
        float _1706 = sin(_1704);
        float _1708 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1710 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _1708;
        float _1712 = _1700 * _1702;
        float _1714 = 1.0 / _1710;
        float _1716 = 1.0 / _1712;
        float _1718 = _1706 * _1716;
        float _1720 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1722 = fma(_1676, _1718, _1720);
        float _1724 = _1722 * _1714;
        float _1726 = precise::clamp(_1724, 0.0, 1.0);
        _1670 = _1702;
        _1566 = _1726;
    }
    float _1728 = _1670;
    float _1730 = _1566;
    float _1732 = _1728;
    if (!_1450)
    {
        float _1734 = (*spvDescriptorSet0.vp_c8)._m0[31].x * 0.5;
        float _1736 = _1734 * 0.15915493667125701904296875;
        float _1738 = _1736 * 6.283185482025146484375;
        float _1740 = cos(_1738);
        float _1742 = (*spvDescriptorSet0.vp_c8)._m0[31].y * 0.5;
        float _1744 = _1742 * 0.15915493667125701904296875;
        float _1746 = _1736 * 6.283185482025146484375;
        float _1748 = sin(_1746);
        float _1750 = 1.0 / _1740;
        float _1752 = _1744 * 6.283185482025146484375;
        float _1754 = cos(_1752);
        float _1756 = _1748 * _1750;
        float _1758 = _1744 * 6.283185482025146484375;
        float _1760 = sin(_1758);
        float _1762 = _1754 * _1756;
        float _1764 = 1.0 / _1762;
        float _1766 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _1768 = (*spvDescriptorSet0.vp_c9)._m0[140].w + _1766;
        float _1770 = 1.0 / _1768;
        float _1772 = _1760 * _1764;
        float _1774 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _1776 = fma(_1676, _1772, _1774);
        float _1778 = _1776 * _1770;
        float _1780 = precise::clamp(_1778, 0.0, 1.0);
        float _1782 = -_1780;
        float _1784 = _1782 + 1.0;
        _1732 = _1750;
        _1678 = _1784;
    }
    float _1786 = _1732;
    float _1788 = _1678;
    float _1790 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1792 = _1664 + _1790;
    float _1794 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1796 = _1666 + _1794;
    float _1798 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1800 = _1668 + _1798;
    float _1802 = _1664 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1804 = _1792 * _1792;
    float _1806 = fma(_1666, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1802);
    float _1808 = fma(_1796, _1796, _1804);
    float _1810 = fma(_1800, _1800, _1808);
    float _1812 = rsqrt(_1810);
    float _1814 = _1812 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1816 = _1796 * _1814;
    float _1818 = _1800 * _1814;
    float _1820 = _1816 * _1816;
    float _1822 = _1818 * _1818;
    float _1824 = _1820 + _1822;
    float _1826 = sqrt(_1824);
    bool _1828 = _1826 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1830 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1832 = _1826 + _1830;
    float _1834 = _1800;
    float _1836 = _1812;
    float _1838 = _1832;
    float _1840 = _1804;
    float _1842 = _1820;
    if (_1828)
    {
        float _1844 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1834 = _1844;
    }
    float _1846 = _1834;
    if (_1828)
    {
        float _1848 = rsqrt(_1824);
        _1836 = _1848;
    }
    float _1850 = _1836;
    float _1852 = _1850;
    if (_1828)
    {
        float _1854 = _1832 * _1846;
        _1838 = _1854;
    }
    float _1856 = _1838;
    if (_1828)
    {
        float _1858 = _1856 * 0.15915493667125701904296875;
        _1840 = _1858;
    }
    float _1860 = _1840;
    float _1862 = _1846;
    float _1864 = _1860;
    if (_1828)
    {
        float _1866 = _1860 * 6.283185482025146484375;
        float _1868 = sin(_1866);
        _1862 = _1868;
    }
    float _1870 = _1862;
    float _1872 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _1874 = precise::max(0.0, _1872);
    float _1876 = _1786;
    float _1878 = _1874;
    if (_1828)
    {
        float _1880 = _1860 * 6.283185482025146484375;
        float _1882 = cos(_1880);
        _1876 = _1882;
    }
    float _1884 = _1876;
    float _1886 = -_1814;
    float _1888 = -_1874;
    float _1890 = fma(_1792, _1886, _1888);
    float _1892 = (*spvDescriptorSet0.vp_c15)._m0[652].x;
    if (_1828)
    {
        float _1894 = _1890 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1878 = _1894;
    }
    float _1896 = _1878;
    if (!_1828)
    {
        _1864 = _1816;
    }
    float _1898 = _1864;
    float _1900 = _1870;
    float _1902 = _1898;
    if (_1828)
    {
        float _1904 = fma(_1870, _1896, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1900 = _1904;
    }
    float _1906 = _1900;
    float _1908 = fma(_918, (*spvDescriptorSet0.vp_c15)._m0[652].x, (*spvDescriptorSet0.vp_c15)._m0[652].z);
    float _1910 = sqrt(_1810);
    float _1912 = _1906;
    float _1914 = _1884;
    if (_1828)
    {
        float _1916 = _1884 + (-1.0);
        _1892 = _1916;
    }
    float _1918 = _1892;
    float _1920 = _1918;
    if (_1828)
    {
        float _1922 = _1850 * _1906;
        _946 = _1922;
    }
    float _1924 = _946;
    if (!_1828)
    {
        _1852 = _1890;
    }
    float _1926 = _1852;
    float _1928 = _1926;
    if (_1828)
    {
        float _1930 = _1918 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1920 = _1930;
    }
    float _1932 = _1920;
    if (_1828)
    {
        float _1934 = _1816 * _1924;
        _1902 = _1934;
    }
    float _1936 = _1902;
    if (!_1828)
    {
        _1912 = _1818;
    }
    float _1938 = _1912;
    float _1940 = _1938;
    if (_1828)
    {
        float _1942 = _1818 * _1924;
        _1940 = _1942;
    }
    float _1944 = _1940;
    if (_1828)
    {
        float _1946 = fma(_1890, _1884, _1932);
        _1928 = _1946;
    }
    float _1948 = _1928;
    if (_1828)
    {
        float _1950 = _1936 * _1936;
        _1842 = _1950;
    }
    float _1952 = _1842;
    if (!_1828)
    {
        _1914 = _1822;
    }
    float _1954 = _1914;
    float _1956 = _1954;
    if (_1828)
    {
        float _1958 = _1944 * _1944;
        _1956 = _1958;
    }
    float _1960 = _1956;
    float _1962 = fma(_1948, _1948, _1952);
    float _1964 = _1664 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1966 = floor(_1908);
    float _1968 = fma(_1668, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1806);
    float _1970 = _1962 + _1960;
    float _1972 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _1974 = fma(_1910, (*spvDescriptorSet0.vp_c15)._m0[23].w, _1972);
    float _1976 = precise::clamp(_1974, 0.0, 1.0);
    float _1978 = fma(_1666, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1964);
    float _1980 = _1968 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1982 = -_1976;
    float _1984 = _1982 + 1.0;
    float _1986 = rsqrt(_1970);
    float _1988 = fma(_926, (*spvDescriptorSet0.vp_c15)._m0[652].y, (*spvDescriptorSet0.vp_c15)._m0[652].w);
    float _1990 = _1664 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1992 = fma(_1668, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1978);
    float _1994 = fma(_1666, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1990);
    float _1996 = _1992 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1998 = abs(_1984);
    float _2000 = log2(_1998);
    float _2002 = _1664 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _2004 = fma(_1668, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1994);
    float _2006 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _2008 = _1996 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _2010 = fma(_1666, (*spvDescriptorSet0.vp_c8)._m0[0].x, _2002);
    float _2012 = _2004 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _2014 = -_1966;
    float _2016 = _1908 + _2014;
    float _2018 = _1986 * _1936;
    float _2020 = _1986 * _1948;
    float _2022 = fma(_1668, (*spvDescriptorSet0.vp_c8)._m0[0].z, _2010);
    float _2024 = _1986 * _1944;
    float _2026 = _2018 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _2028 = -_2008;
    float _2030 = fma(_2028, _2006, 1.0);
    float _2032 = _2012 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _2034 = floor(_1988);
    float _2036 = -_2026;
    float _2038 = fma(_2020, (*spvDescriptorSet0.vp_c15)._m0[21].y, _2036);
    float _2040 = _2022 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _2042 = _2000 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _2044 = _2012 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _2046 = -_2024;
    float _2048 = fma(_2046, (*spvDescriptorSet0.vp_c15)._m0[21].z, _2038);
    float _2050 = fma(_2040, (*spvDescriptorSet0.vp_c8)._m0[7].x, _2032);
    float _2052 = log2(_2030);
    float _2054 = fma(_2040, (*spvDescriptorSet0.vp_c8)._m0[4].x, _2044);
    float _2056 = fma(_1996, (*spvDescriptorSet0.vp_c8)._m0[7].z, _2050);
    float _2058 = _2012 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _2060 = fma(_1996, (*spvDescriptorSet0.vp_c8)._m0[4].z, _2054);
    float _2062 = fma(_1980, (*spvDescriptorSet0.vp_c8)._m0[7].w, _2056);
    float _2064 = fma(_2040, (*spvDescriptorSet0.vp_c8)._m0[5].x, _2058);
    float _2066 = exp2(_2042);
    float _2068 = fma(_2048, -0.5, 0.5);
    float _2070 = fma(_2048, 0.5, 0.5);
    float _2072 = -_2034;
    float _2074 = _1988 + _2072;
    float _2076 = fma(_1996, (*spvDescriptorSet0.vp_c8)._m0[5].z, _2064);
    float _2078 = fma(_1980, (*spvDescriptorSet0.vp_c8)._m0[4].w, _2060);
    float _2080 = fma(_2070, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _2082 = 1.0 / _2062;
    float _2084 = fma(_1980, (*spvDescriptorSet0.vp_c8)._m0[5].w, _2076);
    float _2086 = fma(_2070, _2080, -0.212114393711090087890625);
    float _2088 = sqrt(_2068);
    float2 _6030 = float2(_2016, _2074);
    float _2090 = dm_bs(spvDescriptorSet0.vp_t_tcb_24.sample(spvDescriptorSet0.vp_t_tcb_24Smplr, select(_6030, float2(0.0), isnan(_6030)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_24, spvDescriptorSet0.vp_t_tcb_24Smplr_w, select(_6030, float2(0.0), isnan(_6030)), level(0.0)).x;
    float _2092 = fma(_2070, _2086, 1.570728778839111328125);
    float _2094 = _2020 + 1.0;
    float _2096 = -_2020;
    float _2098 = fma(_2066, _2094, _2096);
    float _2100 = _2052 * 0.693147182464599609375;
    float _2102 = _2078 * _2082;
    float _2104 = _2084 * _2082;
    float _2106 = _2088 * 0.636619746685028076171875;
    float _2108 = _2100 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _2110 = fma(_2102, 0.5, 0.5);
    float _2112 = fma(_2104, -0.5, 0.5);
    float _2114 = -_2092;
    float _2116 = fma(_2106, _2114, 1.0);
    float _2118 = fma(_2098, 0.5, 0.5);
    float3 _6080 = float3(_2110, _2112, _2108);
    float _2120 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_6080, float3(0.0), isnan(_6080)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_6080, float3(0.0), isnan(_6080)), level(0.0)).x;
    float3 _6091 = float3(_2110, _2112, _2108);
    float4 _2123 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_6091, float3(0.0), isnan(_6091)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_6091, float3(0.0), isnan(_6091)), level(0.0)).xyzw;
    float _2125 = _2123.x;
    float _2127 = _2123.y;
    float _2129 = _2123.z;
    float _2131 = _2123.w;
    float2 _6107 = float2(_2116, _2118);
    float3 _2135 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_6107, float2(0.0), isnan(_6107)), level(0.0)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_6107, float2(0.0), isnan(_6107)), level(0.0)).xyz;
    float _2137 = _2135.x;
    float _2139 = _2135.y;
    float _2141 = _2135.z;
    float _2143 = abs(_1676);
    float _2145 = log2(_2143);
    bool _2147 = _1252 != 0.0;
    bool _2149 = isnan(_1252);
    bool _2151 = _2147 || _2149;
    bool _2153 = isnan(0.0);
    bool _2155 = _2151 || _2153;
    float _2157 = _2012 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    bool _2159 = _1250 == 0.0;
    bool _2161 = !_2155;
    bool _2163 = _2159 && _2161;
    float _2165 = fma(_2040, (*spvDescriptorSet0.vp_c8)._m0[6].x, _2157);
    bool _2167 = _1254 == 0.0;
    bool _2169 = _2167 && _2163;
    float _2171 = fma(_1996, (*spvDescriptorSet0.vp_c8)._m0[6].z, _2165);
    bool _2173 = _1676 <= 8000.0;
    bool _2175 = isnan(_1676);
    bool _2177 = _2173 || _2175;
    bool _2179 = isnan(8000.0);
    bool _2181 = _2177 || _2179;
    float _2183 = float(_2181);
    float _2185 = _2145 * (*spvDescriptorSet0.vp_c15)._m0[654].z;
    float _2187 = in.m_75.x;
    float _2189 = in.m_75.y;
    float _2191 = in.m_75.z;
    float _2193 = exp2(_2185);
    float _2195 = fma(_2193, (*spvDescriptorSet0.vp_c15)._m0[654].x, (*spvDescriptorSet0.vp_c15)._m0[654].y);
    float _2197 = precise::clamp(_2195, 0.0, 1.0);
    float _2199 = _2189;
    float _2201 = _2187;
    float _2203 = _2191;
    float _2205 = _2062;
    float _2207 = _2084;
    if (!_2169)
    {
        float _2209 = fma(_1252, (*spvDescriptorSet0.vp_c9)._m0[17].y, _2189);
        _2199 = _2209;
    }
    float _2211 = _2199;
    if (!_2169)
    {
        float _2213 = fma(_1250, (*spvDescriptorSet0.vp_c9)._m0[17].y, _2187);
        _2201 = _2213;
    }
    float _2215 = _2201;
    float _2217 = fma(_2197, -2.0, 3.0);
    float _2219 = _2197 * _2197;
    float _2221 = _1244 * _2211;
    float _2223 = _1246 * _2211;
    float _2225 = _1242 * _2211;
    float _2227 = _2000 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _2229 = _2219 * _2217;
    float _2231 = fma(_1310, _2215, _2223);
    float _2233 = fma(_1308, _2215, _2221);
    float _2235 = exp2(_2227);
    float _2237 = -_2229;
    float _2239 = _2237 + 1.0;
    float _2241 = in.m_77.x;
    float _2243 = fma(_1306, _2215, _2225);
    float _2245 = _2062 * 0.5;
    float _2247 = fma(_2239, (*spvDescriptorSet0.vp_c15)._m0[654].w, _2229);
    if (!_2169)
    {
        float _2249 = fma(_1254, (*spvDescriptorSet0.vp_c9)._m0[17].y, _2191);
        _2203 = _2249;
    }
    float _2251 = _2203;
    float _2253 = fma(_1980, (*spvDescriptorSet0.vp_c8)._m0[6].w, _2171);
    float _2255 = fma(_2084, -0.5, _2245);
    float _2257 = _2183 * _2247;
    float _2259 = fma(_1006, _2251, _2233);
    float _2261 = fma(_1016, _2251, _2231);
    float _2263 = fma(_1008, _2251, _2243);
    float _2265 = _2257 * (*spvDescriptorSet0.vp_c15)._m0[653].x;
    float _2267 = _2078 + _2062;
    float _2269 = -_2235;
    float _2271 = _2269 + 1.0;
    out.gl_Position.x = _2078;
    out.gl_Position.y = _2084;
    out.gl_Position.z = _2253;
    out.gl_Position.w = _2062;
    bool _2273 = _1910 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _2275 = isnan(_1910);
    bool _2277 = _2273 || _2275;
    bool _2279 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _2281 = _2277 || _2279;
    float _2283 = _2253 + _2062;
    float _2285 = _2271 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    out.m_79.x = _2259;
    out.m_79.y = _2261;
    out.m_79.z = _2263;
    float _2287 = _2283 * 0.5;
    float _2289 = _2267 * 0.5;
    out.m_81.x = _2289;
    out.m_81.y = _2255;
    out.m_81.z = _2287;
    out.m_81.w = _2062;
    float _2291 = -_2285;
    float _2293 = _2291 + 1.0;
    float _2295 = _2253;
    float _2297 = _2289;
    float _2299 = (*spvDescriptorSet0.vp_c15)._m0[653].y;
    if (!_2281)
    {
        _2205 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _2301 = _2205;
    float _2303 = _2301;
    float _2305 = _2301;
    if (!_2281)
    {
        _2295 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _2307 = _2295;
    float _2309 = _2307;
    float _2311 = _2307;
    if (!_2281)
    {
        _2207 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _2313 = _2207;
    float _2315 = _2313;
    float _2317 = _2313;
    if (!_2281)
    {
        _2297 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _2319 = _2297;
    float _2321 = -_2090;
    float _2323 = _2321 + 1.0;
    float _2325 = _2323 * _2265;
    float _2327 = precise::clamp(_2325, 0.0, 1.0);
    float _2329 = -_2327;
    float _2331 = fma(_2329, (*spvDescriptorSet0.vp_c15)._m0[653].y, 1.0);
    float _2333 = _2319;
    float _2335 = _2319;
    if (!_2281)
    {
        _2299 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _2337 = _2299;
    float _2339 = _2331 * _2241;
    float _2341 = _2339 * (*spvDescriptorSet0.vp_c13)._m0[1].w;
    out.m_83.x = _2341;
    float _2343 = _2285 * _2120;
    float _2345 = _2131 * _2293;
    float _2347 = _1730 * _1788;
    float _2349 = _2131 * _2343;
    float _2351 = _2141 * _2343;
    float _2353 = _2347 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _2355 = _2347;
    float _2357 = _2337;
    float _2359 = _2337;
    if (!_2281)
    {
        _2355 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _2361 = _2355;
    float _2363 = fma(_2137, _2349, _2125);
    float _2365 = fma(_2139, _2349, _2127);
    float _2367 = fma(_2131, _2351, _2129);
    out.m_85.x = _2363;
    out.m_85.y = _2365;
    out.m_85.z = _2367;
    out.m_85.w = _2345;
    bool _2369 = !_2281;
    float _2371 = _2361;
    float _2373 = _2361;
    if (!_2369)
    {
        bool _2375 = _1910 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _2377 = isnan(_1910);
        bool _2379 = _2375 || _2377;
        bool _2381 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _2383 = _2379 || _2381;
        if (!_2383)
        {
            float _2385 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2387 = _1910 + _2385;
            float _2389 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2391 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _2389;
            float _2393 = 1.0 / _2391;
            float _2395 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _2397 = _2395 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _2399 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _2401 = _2399 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _2403 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _2405 = _2403 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _2407 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _2409 = _2407 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _2411 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _2413 = _2411 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _2415 = _2387 * _2393;
            float _2417 = precise::clamp(_2415, 0.0, 1.0);
            float _2419 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _2421 = _2419 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _2423 = fma(_2417, _2397, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _2425 = fma(_2417, _2421, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _2427 = fma(_2417, _2401, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _2429 = fma(_2417, _2405, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _2431 = fma(_2417, _2409, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _2433 = fma(_2417, _2413, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            _2335 = _2425;
            _2317 = _2431;
            _2359 = _2423;
            _2311 = _2429;
            _2305 = _2427;
            _2373 = _2433;
            _2435 = true;
        }
        else
        {
            bool _2437 = _1910 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _2439 = isnan(_1910);
            bool _2441 = _2437 || _2439;
            bool _2443 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _2445 = _2441 || _2443;
            if (!_2445)
            {
                _2357 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _2447 = _2357;
            _2359 = _2447;
            if (!_2445)
            {
                _2333 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _2449 = _2333;
            _2335 = _2449;
            if (!_2445)
            {
                _2303 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _2451 = _2303;
            _2305 = _2451;
            if (!_2445)
            {
                _2309 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _2453 = _2309;
            _2311 = _2453;
            if (!_2445)
            {
                _2315 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _2455 = _2315;
            _2317 = _2455;
            if (!_2445)
            {
                _2371 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _2457 = _2371;
            bool _2459 = !_2445;
            _2373 = _2457;
            if (!_2459)
            {
                bool _2461 = _1910 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _2463 = isnan(_1910);
                bool _2465 = _2461 || _2463;
                bool _2467 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _2469 = _2465 || _2467;
                if (!_2469)
                {
                    float _2471 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2473 = _1910 + _2471;
                    float _2475 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2477 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _2475;
                    float _2479 = 1.0 / _2477;
                    float _2481 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _2483 = _2481 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _2485 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _2487 = _2485 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _2489 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _2491 = _2489 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _2493 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _2495 = _2493 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _2497 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _2499 = _2497 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _2501 = _2473 * _2479;
                    float _2503 = precise::clamp(_2501, 0.0, 1.0);
                    float _2505 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _2507 = _2505 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _2509 = fma(_2503, _2483, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _2511 = fma(_2503, _2507, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _2513 = fma(_2503, _2487, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _2515 = fma(_2503, _2491, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _2517 = fma(_2503, _2495, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _2519 = fma(_2503, _2499, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    _2335 = _2511;
                    _2317 = _2517;
                    _2359 = _2509;
                    _2311 = _2515;
                    _2305 = _2513;
                    _2373 = _2519;
                    _2435 = true;
                }
                else
                {
                    _2335 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _2317 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _2359 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _2311 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _2305 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _2373 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _2435 = false;
    float _2521 = _2335;
    float _2523 = _2317;
    float _2525 = _2359;
    float _2527 = _2311;
    float _2529 = _2305;
    float _2531 = _2373;
    float _2533 = fma(_2261, -0.5, 0.5);
    float _2535 = precise::clamp(_2533, 0.0, 1.0);
    float _2537 = -_2521;
    float _2539 = _2537 + _2523;
    float _2541 = _2353 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _2543 = -_2525;
    float _2545 = _2543 + _2527;
    float _2547 = fma(_2535, _2539, _2521);
    out.m_87.x = 0.0;
    float _2549 = -_2529;
    float _2551 = _2549 + _2531;
    float _2553 = fma(_2535, _2545, _2525);
    float _2555 = _2547 * 0.586610972881317138671875;
    out.m_49.x = _2541;
    bool _2557 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _2559 = fma(_2535, _2551, _2529);
    float _2561 = fma(_2553, 0.298911988735198974609375, _2555);
    bool _2563 = _1730 > 0.0;
    bool _2565 = isnan(_1730);
    bool _2567 = _2563 || _2565;
    bool _2569 = isnan(0.0);
    bool _2571 = _2567 || _2569;
    float _2573 = fma(_2559, 0.114477999508380889892578125, _2561);
    bool _2575 = _1788 <= 0.0;
    bool _2577 = !_2571;
    bool _2579 = _2575 || _2577;
    float _2581 = -_2573;
    float _2583 = _2553 + _2581;
    float _2585 = -_2573;
    float _2587 = _2547 + _2585;
    float _2589 = -_2573;
    float _2591 = _2559 + _2589;
    float _2593 = fma(_2583, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2573);
    float _2595 = fma(_2587, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2573);
    float _2597 = fma(_2591, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2573);
    bool _2599 = !_2557;
    if (!_2599)
    {
        float _2601 = -_1664;
        float _2603 = _2601 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
        float _2605 = -_1666;
        float _2607 = _2605 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
        float _2609 = -_1668;
        float _2611 = _2609 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
        float _2613 = _2603 * _2603;
        float _2615 = fma(_2607, _2607, _2613);
        float _2617 = fma(_2611, _2611, _2615);
        float _2619 = sqrt(_2617);
        float _2621 = rsqrt(_2617);
        float _2623 = -_2619;
        float _2625 = _2623 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
        float _2627 = _2625 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
        float _2629 = precise::clamp(_2627, 0.0, 1.0);
        float _2631 = _2607 * _2621;
        float _2633 = _2603 * _2621;
        float _2635 = abs(_2629);
        float _2637 = log2(_2635);
        float _2639 = _2611 * _2621;
        float _2641 = _2631 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
        float _2643 = _2261 * _2633;
        float _2645 = -_2633;
        float _2647 = -_2641;
        float _2649 = fma(_2645, (*spvDescriptorSet0.vp_c15)._m0[656].y, _2647);
        float _2651 = fma(_2259, _2631, _2643);
        float _2653 = -_2639;
        float _2655 = fma(_2653, (*spvDescriptorSet0.vp_c15)._m0[656].z, _2649);
        float _2657 = fma(_2263, _2639, _2651);
        float _2659 = precise::clamp(_2657, 0.0, 1.0);
        float _2661 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
        float _2663 = _2655 + _2661;
        float _2665 = _2637 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
        float _2667 = _2663 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
        float _2669 = precise::clamp(_2667, 0.0, 1.0);
        float _2671 = exp2(_2665);
        float _2673 = _2671 * _2669;
        float _2675 = _2659 * _2673;
        float _2677 = _2675 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
        float _2679 = _2675 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
        float _2681 = _2675 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
        out.m_87.x = _2677;
        out.m_87.y = _2679;
        out.m_87.z = _2681;
    }
    out.m_89.x = _2593;
    out.m_89.y = _2595;
    out.m_89.z = _2597;
    if (!_2579)
    {
        return out;
    }
    out.m_49.x = 0.0;
    float _2683 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _2683;
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
    out.m_67 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_49 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_89 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_63 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_69 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_81 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_71 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_79 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_87 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_83 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_85 = float4(0.0, 0.0, 0.0, 1.0);
    bool _2435 = false;
    bool _530 = false;
    bool _376 = false;
    bool _208 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _103 = in.m_46.w;
    float _105 = trunc(_103);
    int _108 = int(_105);
    bool _112 = _108 >= 1;
    float _114 = 0.0;
    if (!_112)
    {
        _114 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _116 = _114;
    float _118 = _116;
    if (!_112)
    {
        out.m_49.x = 0.0;
    }
    int _120 = 0;
    if (!_112)
    {
        float _122 = _116 * 5.0;
        _120 = as_type<int>(_122);
    }
    int _124 = _120;
    int _126 = _124;
    if (!_112)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2740 = as_type<float>(_124);
        out.gl_Position.z = _2740;
    }
    if (!_112)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_59.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_59.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_59.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_59.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_67.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_67.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_67.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_67.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_49.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_49.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_49.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_49.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_89.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_89.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_89.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_89.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_63.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_63.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_63.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_63.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_69.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_69.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_69.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_69.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_81.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_81.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_81.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_81.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_71.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_71.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_71.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_71.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_79.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_79.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_79.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_79.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_87.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_87.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_87.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_87.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_83.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_83.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_83.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_83.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_85.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_85.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_85.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_85.w)); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _128 = in.m_51.w;
    bool _130 = _128 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _132 = isnan(_128);
    bool _134 = _130 || _132;
    bool _136 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _138 = _134 || _136;
    float _140 = -_128;
    float _142 = _140 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    float _144 = 0.0;
    if (_138)
    {
        float _146 = float(_108);
        _144 = _146;
    }
    float _148 = _144;
    bool _150 = _142 >= _148;
    bool _152 = !_138;
    bool _154 = _150 || _152;
    if (_154)
    {
        _118 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _156 = _118;
    if (_154)
    {
        out.m_49.x = 0.0;
    }
    if (_154)
    {
        float _158 = _156 * 5.0;
        _126 = as_type<int>(_158);
    }
    int _160 = _126;
    if (_154)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2808 = as_type<float>(_160);
        out.gl_Position.z = _2808;
    }
    if (_154)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_59.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_59.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_59.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_59.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_67.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_67.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_67.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_67.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_49.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_49.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_49.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_49.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_89.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_89.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_89.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_89.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_63.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_63.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_63.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_63.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_69.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_69.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_69.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_69.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_81.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_81.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_81.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_81.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_71.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_71.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_71.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_71.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_79.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_79.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_79.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_79.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_87.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_87.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_87.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_87.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_83.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_83.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_83.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_83.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_85.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_85.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_85.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_85.w)); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _162 = in.m_53.x;
    float _164 = in.m_53.y;
    float _166 = in.m_53.z;
    bool _168 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _170 = _164 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _172 = _164 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _174 = _164 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _176 = fma(_162, (*spvDescriptorSet0.vp_c10)._m0[4].x, _170);
    float _178 = fma(_162, (*spvDescriptorSet0.vp_c10)._m0[5].x, _172);
    float _180 = fma(_162, (*spvDescriptorSet0.vp_c10)._m0[6].x, _174);
    float _182 = fma(_166, (*spvDescriptorSet0.vp_c10)._m0[4].z, _176);
    float _184 = fma(_166, (*spvDescriptorSet0.vp_c10)._m0[5].z, _178);
    float _186 = fma(_166, (*spvDescriptorSet0.vp_c10)._m0[6].z, _180);
    bool _188 = !_168;
    float _206;
    if (!_188)
    {
        float _190 = in.m_55.x;
        float _192 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _194 = _190 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _196 = fma(_194, (*spvDescriptorSet0.vp_c9)._m0[12].x, _142);
        float _198 = _196 * _192;
        float _200 = floor(_198);
        float _202 = -_200;
        float _204 = _198 + _202;
        _206 = _204;
        _208 = true;
    }
    else
    {
        float _210 = float(_108);
        float _212 = 1.0 / _210;
        float _214 = _142 * _212;
        _206 = _214;
    }
    _208 = false;
    float _216 = _206;
    float _218 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _220 = _216 + _218;
    bool _222 = _216 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _224 = isnan(_216);
    bool _226 = _222 || _224;
    bool _228 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _230 = _226 || _228;
    float _232 = float(_230);
    bool _234 = _216 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _236 = isnan(_216);
    bool _238 = _234 || _236;
    bool _240 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _242 = _238 || _240;
    float _244 = float(_242);
    float _246 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _248 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _246;
    float _250 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _252 = _250 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _254 = 1.0 / _248;
    bool _256 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _258 = 1.0 / _252;
    float _260 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _262 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _260;
    float _264 = _220 * _254;
    float _266 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _268 = _216 + _266;
    bool _270 = _216 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _272 = isnan(_216);
    bool _274 = _270 || _272;
    bool _276 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _278 = _274 || _276;
    float _280 = float(_278);
    float _282 = -_232;
    float _284 = _282 + 1.0;
    float _286 = fma(_262, _264, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _288 = _280 * _284;
    float _290 = -_280;
    float _292 = _290 + 1.0;
    float _294 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _296 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _294;
    float _298 = -(*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _300 = (*spvDescriptorSet0.vp_c9)._m0[144].z + _298;
    float _302 = _268 * _258;
    float _304 = _244 * _292;
    float _306 = fma(_296, _264, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _308 = fma(_300, _264, (*spvDescriptorSet0.vp_c9)._m0[143].z);
    float _310 = -_244;
    float _312 = _310 + 1.0;
    float _314 = _286 * _304;
    float _316 = _306 * _304;
    float _318 = _308 * _304;
    float _320 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _322 = _320 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _324 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _326 = _324 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _328 = -(*spvDescriptorSet0.vp_c9)._m0[144].z;
    float _330 = _328 + (*spvDescriptorSet0.vp_c9)._m0[145].z;
    float _332 = fma(_312, (*spvDescriptorSet0.vp_c9)._m0[143].x, _316);
    float _334 = fma(_322, _302, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _336 = fma(_326, _302, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _338 = fma(_330, _302, (*spvDescriptorSet0.vp_c9)._m0[144].z);
    float _340 = fma(_312, (*spvDescriptorSet0.vp_c9)._m0[143].y, _314);
    float _342 = fma(_312, (*spvDescriptorSet0.vp_c9)._m0[143].z, _318);
    float _344 = fma(_334, _288, _332);
    float _346 = fma(_336, _288, _340);
    float _348 = fma(_338, _288, _342);
    float _350 = fma(_232, (*spvDescriptorSet0.vp_c9)._m0[145].x, _344);
    float _352 = fma(_232, (*spvDescriptorSet0.vp_c9)._m0[145].y, _346);
    float _354 = fma(_232, (*spvDescriptorSet0.vp_c9)._m0[145].z, _348);
    bool _356 = !_256;
    float _374;
    if (!_356)
    {
        float _358 = in.m_55.x;
        float _360 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _362 = _358 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _364 = fma(_362, (*spvDescriptorSet0.vp_c9)._m0[11].y, _142);
        float _366 = _364 * _360;
        float _368 = floor(_366);
        float _370 = -_368;
        float _372 = _366 + _370;
        _374 = _372;
        _376 = true;
    }
    else
    {
        float _378 = float(_108);
        float _380 = 1.0 / _378;
        float _382 = _142 * _380;
        _374 = _382;
    }
    _376 = false;
    float _384 = _374;
    float _386 = in.m_57.x;
    float _388 = in.m_57.y;
    float _390 = in.m_57.z;
    float _392 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _394 = _392 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _396 = _384 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _398 = isnan(_384);
    bool _400 = _396 || _398;
    bool _402 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _404 = _400 || _402;
    float _406 = float(_404);
    float _408 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _410 = _408 + (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _412 = _384 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _414 = isnan(_384);
    bool _416 = _412 || _414;
    bool _418 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _420 = _416 || _418;
    float _422 = float(_420);
    float _424 = 1.0 / _394;
    float _426 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _428 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _426;
    float _430 = -_406;
    float _432 = _430 + 1.0;
    bool _434 = _384 >= (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _436 = isnan(_384);
    bool _438 = _434 || _436;
    bool _440 = isnan((*spvDescriptorSet0.vp_c9)._m0[117].w);
    bool _442 = _438 || _440;
    float _444 = float(_442);
    bool _446 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].w;
    float _448 = _422 * _432;
    float _450 = -_422;
    float _452 = _450 + 1.0;
    float _454 = 1.0 / _410;
    float _456 = -(*spvDescriptorSet0.vp_c9)._m0[116].x;
    float _458 = _456 + (*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _460 = _428 * _424;
    float _462 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _464 = _384 + _462;
    float _466 = -_444;
    float _468 = _466 + 1.0;
    float _470 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _472 = _384 + _470;
    float _474 = _354 * _390;
    float _476 = fma(_460, _464, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _478 = _406 * _468;
    float _480 = _350 * _386;
    float _482 = _458 * _454;
    float _484 = _476 * _448;
    float _486 = fma(_482, _472, (*spvDescriptorSet0.vp_c9)._m0[116].x);
    float _488 = fma(_452, (*spvDescriptorSet0.vp_c9)._m0[115].x, _484);
    float _490 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _492 = fma(_486, _478, _488);
    float _494 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _496 = _490 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _498 = fma(_444, (*spvDescriptorSet0.vp_c9)._m0[117].x, _492);
    float _500 = _352 * _388;
    float _502 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _504 = _494 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _506 = _498 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _508 = _502 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    out.m_59.x = _496;
    out.m_59.y = _504;
    out.m_59.z = _508;
    out.m_59.w = _506;
    bool _510 = !_446;
    float _528;
    if (!_510)
    {
        float _512 = in.m_55.x;
        float _514 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].w;
        float _516 = _512 * (*spvDescriptorSet0.vp_c9)._m0[13].x;
        float _518 = fma(_516, (*spvDescriptorSet0.vp_c9)._m0[11].w, _142);
        float _520 = _518 * _514;
        float _522 = floor(_520);
        float _524 = -_522;
        float _526 = _520 + _524;
        _528 = _526;
        _530 = true;
    }
    else
    {
        float _532 = float(_108);
        float _534 = 1.0 / _532;
        float _536 = _142 * _534;
        _528 = _536;
    }
    _530 = false;
    float _538 = _528;
    float _540 = in.m_55.x;
    float _542 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].w;
    float _544 = in.m_61.x;
    int _546 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _548 = _546 != 0;
    float _550 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _552 = _538 + _550;
    int _554 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 16;
    bool _556 = _554 != 0;
    float _558 = in.m_55.y;
    int _560 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 32;
    bool _562 = _560 != 0;
    float _564 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _566 = _564 + (*spvDescriptorSet0.vp_c9)._m0[132].w;
    int _568 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _570 = _568 != 0;
    float _572 = in.m_61.y;
    float _574 = in.m_46.x;
    float _576 = in.m_46.y;
    float _578 = in.m_46.z;
    float _580 = 1.0 / _566;
    float _582 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    int _584 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _586 = _584 != 0;
    float _588 = in.m_55.z;
    float _590 = _540 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    float _592 = in.m_61.z;
    float _594 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _596 = -_582;
    float _598 = fma(_590, 2.0, _596);
    out.m_63.x = _544;
    bool _600 = _558 > 0.5;
    float _602 = in.m_65.y;
    float _604 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    float _606 = _558 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    out.m_63.y = _572;
    float _608 = fma(_540, (*spvDescriptorSet0.vp_c9)._m0[78].z, _604);
    float _610 = _576 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _612 = fma(_606, -2.0, _594);
    float _614 = _576 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _616 = in.m_65.x;
    float _618 = fma(_574, (*spvDescriptorSet0.vp_c10)._m0[6].x, _610);
    bool _620 = _588 > 0.5;
    float _622 = _576 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _624 = -(*spvDescriptorSet0.vp_c9)._m0[131].x;
    float _626 = (*spvDescriptorSet0.vp_c9)._m0[132].x + _624;
    float _628 = fma(_574, (*spvDescriptorSet0.vp_c10)._m0[4].x, _614);
    float _630 = _614;
    float _632 = _622;
    bool _634 = _620;
    if (_586)
    {
        _630 = _558;
    }
    float _636 = _630;
    float _638 = fma(_574, (*spvDescriptorSet0.vp_c10)._m0[5].x, _622);
    float _640 = _626 * _580;
    out.m_63.z = _592;
    float _642 = fma(_640, _552, (*spvDescriptorSet0.vp_c9)._m0[131].x);
    float _644 = _636;
    float _646 = _640;
    if (_586)
    {
        _632 = _540;
    }
    float _648 = _632;
    float _650 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    float _652 = _648;
    if (!_586)
    {
        _652 = _588;
    }
    float _654 = _652;
    float _656 = (*spvDescriptorSet0.vp_c9)._m0[88].w + (*spvDescriptorSet0.vp_c9)._m0[88].y;
    float _658 = -_602;
    float _660 = _658 + 1.0;
    float _662 = fma(_558, (*spvDescriptorSet0.vp_c9)._m0[78].w, _650);
    float _664 = fma(_558, (*spvDescriptorSet0.vp_c9)._m0[88].w, _656);
    bool _666 = _538 >= (*spvDescriptorSet0.vp_c9)._m0[132].w;
    bool _668 = isnan(_538);
    bool _670 = _666 || _668;
    bool _672 = isnan((*spvDescriptorSet0.vp_c9)._m0[132].w);
    bool _674 = _670 || _672;
    float _676 = float(_674);
    float _678 = (*spvDescriptorSet0.vp_c9)._m0[88].z + (*spvDescriptorSet0.vp_c9)._m0[88].x;
    float _680 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    int _682 = _620 ? as_type<int>(_660) : as_type<int>(_602);
    float _684 = fma(_578, (*spvDescriptorSet0.vp_c10)._m0[4].z, _628);
    float _686 = _602;
    int _688 = as_type<int>(_654);
    if (_548)
    {
        bool _690 = _540 > 0.5;
        _634 = _690;
    }
    bool _692 = _634;
    float _694 = fma(_540, (*spvDescriptorSet0.vp_c9)._m0[88].z, _678);
    if (!_586)
    {
        _644 = _540;
    }
    float _696 = _644;
    float _698 = fma(_578, (*spvDescriptorSet0.vp_c10)._m0[5].z, _638);
    float _700 = fma(_578, (*spvDescriptorSet0.vp_c10)._m0[6].z, _618);
    bool _702 = _538 >= (*spvDescriptorSet0.vp_c9)._m0[131].w;
    bool _704 = isnan(_538);
    bool _706 = _702 || _704;
    bool _708 = isnan((*spvDescriptorSet0.vp_c9)._m0[131].w);
    bool _710 = _706 || _708;
    float _712 = float(_710);
    float _714 = -_676;
    float _716 = _714 + 1.0;
    float _718 = _562 ? as_type<float>(_682) : _602;
    float _720 = _542 * (*spvDescriptorSet0.vp_c9)._m0[90].y;
    int _722 = as_type<int>(_696);
    if (_570)
    {
        float _724 = _600 ? _660 : _602;
        _686 = _724;
    }
    float _726 = _686;
    float _728 = _712 * _716;
    float _730 = fma(_718, _720, -0.5);
    float _732 = _696 * (*spvDescriptorSet0.vp_c9)._m0[87].y;
    float _734 = _642 * _728;
    float _736 = _680 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _738 = (*spvDescriptorSet0.vp_c9)._m0[87].x + (*spvDescriptorSet0.vp_c9)._m0[86].z;
    float _740 = _654 * (*spvDescriptorSet0.vp_c9)._m0[87].x;
    float _742 = _726;
    if (_556)
    {
        float _744 = -_616;
        float _746 = _744 + 1.0;
        _688 = as_type<int>(_746);
    }
    int _748 = _688;
    if (_548)
    {
        float _750 = -_616;
        float _752 = _750 + 1.0;
        _722 = as_type<int>(_752);
    }
    int _754 = _722;
    float _756 = fma(_736, _726, -0.5);
    if (!_556)
    {
        _742 = _616;
    }
    float _758 = _742;
    float _760 = -_738;
    float _762 = fma(_740, 2.0, _760);
    float _764 = fma(_142, (*spvDescriptorSet0.vp_c9)._m0[77].w, _662);
    float _766 = _758;
    if (_556)
    {
        float _768 = _600 ? as_type<float>(_748) : _616;
        _766 = _768;
    }
    float _770 = _766;
    float _772 = -_142;
    float _774 = fma(_772, (*spvDescriptorSet0.vp_c9)._m0[76].x, _598);
    if (!_548)
    {
        _646 = _616;
    }
    float _776 = _646;
    float _778 = _698 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _780 = _776;
    float _782 = _778;
    if (_548)
    {
        float _784 = _692 ? as_type<float>(_754) : _616;
        _780 = _784;
    }
    float _786 = _780;
    float _788 = fma(_142, (*spvDescriptorSet0.vp_c9)._m0[76].y, _612);
    float _790 = (*spvDescriptorSet0.vp_c9)._m0[87].y + (*spvDescriptorSet0.vp_c9)._m0[86].w;
    float _792 = -_712;
    float _794 = _792 + 1.0;
    float _796 = fma(_142, (*spvDescriptorSet0.vp_c9)._m0[87].z, _694);
    float _798 = _684 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _800 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _802 = _778 + _800;
    float _804 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].z;
    float _806 = -_788;
    float _808 = fma(_764, _756, _806);
    float _810 = fma(_732, -2.0, _790);
    float _812 = fma(_794, (*spvDescriptorSet0.vp_c9)._m0[131].x, _734);
    float _814 = _700 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _816 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _818 = _798 + _816;
    float _820 = _802 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _822 = fma(_142, (*spvDescriptorSet0.vp_c9)._m0[77].z, _608);
    float _824 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _826 = fma(_142, (*spvDescriptorSet0.vp_c9)._m0[87].w, _664);
    float _828 = -_142;
    float _830 = fma(_828, (*spvDescriptorSet0.vp_c9)._m0[86].x, _762);
    float _832 = fma(_142, (*spvDescriptorSet0.vp_c9)._m0[86].y, _810);
    float _834 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _836 = _814 + _834;
    float _838 = fma(_818, (*spvDescriptorSet0.vp_c8)._m0[28].x, _820);
    float _840 = -_832;
    float _842 = fma(_826, _730, _840);
    float _844 = fma(_676, (*spvDescriptorSet0.vp_c9)._m0[132].x, _812);
    float _846 = fma(_836, (*spvDescriptorSet0.vp_c8)._m0[28].z, _838);
    float _848 = _802 * _802;
    float _850 = in.m_61.w;
    float _852 = _804 * (*spvDescriptorSet0.vp_c9)._m0[90].x;
    float _854 = _842 + 0.5;
    bool _856 = _846 >= 0.0;
    float _858 = fma(_818, _818, _848);
    float _860 = _824 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _862 = fma(_852, _770, -0.5);
    float _864 = fma(_836, _836, _858);
    float _866 = fma(_860, _786, -0.5);
    float _868 = fma(_796, _862, _830);
    float _870 = rsqrt(_864);
    float _872 = _808 + 0.5;
    float _874 = fma(_822, _866, _774);
    float _876 = _808;
    if (_856)
    {
        _876 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _878 = _876;
    float _880 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _882 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _884 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _886 = _880 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _888 = _882 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _890 = _884 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _892 = _844 * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    float _894 = _874 + 0.5;
    float _896 = _868 + 0.5;
    int _898 = as_type<int>(_878);
    if (_856)
    {
        float _900 = _878 * 5.0;
        _898 = as_type<int>(_900);
    }
    int _902 = _898;
    out.m_63.w = _850;
    float _904 = _802 * _870;
    float _906 = _818 * _870;
    out.m_67.x = _886;
    out.m_67.y = _888;
    out.m_67.z = _890;
    out.m_67.w = _892;
    out.m_69.x = _894;
    out.m_69.y = _872;
    out.m_71.x = _896;
    out.m_71.y = _854;
    float _908 = as_type<float>(_902);
    if (_856)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _4113 = as_type<float>(_902);
        out.gl_Position.z = _4113;
    }
    if (_856)
    {
        out.m_49.x = 0.0;
    }
    if (_856)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_59.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_59.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_59.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_59.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_67.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_67.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_67.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_67.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_49.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_49.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_49.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_49.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_89.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_89.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_89.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_89.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_63.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_63.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_63.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_63.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_69.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_69.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_69.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_69.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_81.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_81.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_81.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_81.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_71.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_71.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_71.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_71.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_79.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_79.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_79.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_79.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_87.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_87.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_87.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_87.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_83.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_83.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_83.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_83.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_85.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_85.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_85.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_85.w)); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _910 = -_904;
    float _912 = fma(_910, (*spvDescriptorSet0.vp_c9)._m0[18].w, _778);
    float _914 = _836 * _870;
    float _916 = -_906;
    float _918 = fma(_916, (*spvDescriptorSet0.vp_c9)._m0[18].w, _798);
    float _920 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _922 = _912 + _920;
    float _924 = -_914;
    float _926 = fma(_924, (*spvDescriptorSet0.vp_c9)._m0[18].w, _814);
    float _928 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _930 = _918 + _928;
    float _932 = _922 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _934 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _936 = _926 + _934;
    float _938 = fma(_930, (*spvDescriptorSet0.vp_c8)._m0[28].x, _932);
    float _940 = fma(_936, (*spvDescriptorSet0.vp_c8)._m0[28].z, _938);
    bool _942 = _940 >= 0.0;
    float _944 = _912;
    float _946 = _936;
    if (_942)
    {
        _908 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _948 = _908;
    int _950 = as_type<int>(_948);
    if (_942)
    {
        out.m_49.x = 0.0;
    }
    if (_942)
    {
        float _952 = _948 * 5.0;
        _950 = as_type<int>(_952);
    }
    int _954 = _950;
    if (_942)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _4209 = as_type<float>(_954);
        out.gl_Position.z = _4209;
    }
    if (_942)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_59.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_59.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_59.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_59.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_67.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_67.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_67.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_67.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_49.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_49.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_49.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_49.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_89.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_89.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_89.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_89.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_63.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_63.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_63.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_63.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_69.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_69.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_69.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_69.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_81.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_81.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_81.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_81.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_71.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_71.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_71.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_71.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_79.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_79.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_79.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_79.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_87.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_87.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_87.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_87.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_83.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_83.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_83.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_83.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_85.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_85.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_85.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_85.w)); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _956 = -_778;
    float _958 = _956 + (*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _960 = -_798;
    float _962 = _960 + (*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _964 = -_814;
    float _966 = _964 + (*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _968 = _958 * _958;
    float _970 = -_904;
    float _972 = fma(_970, (*spvDescriptorSet0.vp_c9)._m0[18].w, _802);
    float _974 = fma(_962, _962, _968);
    float _976 = (*spvDescriptorSet0.vp_c8)._m0[2].w * (*spvDescriptorSet0.vp_c8)._m0[3].z;
    float _978 = -_906;
    float _980 = fma(_978, (*spvDescriptorSet0.vp_c9)._m0[18].w, _818);
    float _982 = fma(_966, _966, _974);
    float _984 = -_976;
    float _986 = fma((*spvDescriptorSet0.vp_c8)._m0[3].w, (*spvDescriptorSet0.vp_c8)._m0[2].z, _984);
    float _988 = _972 * _972;
    float _990 = rsqrt(_982);
    float _992 = fma(_980, _980, _988);
    float _994 = (*spvDescriptorSet0.vp_c8)._m0[2].w * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _996 = (*spvDescriptorSet0.vp_c8)._m0[2].w * (*spvDescriptorSet0.vp_c8)._m0[3].x;
    float _998 = -_994;
    float _1000 = fma((*spvDescriptorSet0.vp_c8)._m0[3].w, (*spvDescriptorSet0.vp_c8)._m0[2].y, _998);
    float _1002 = -_996;
    float _1004 = fma((*spvDescriptorSet0.vp_c8)._m0[3].w, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1002);
    float _1006 = _962 * _990;
    float _1008 = _966 * _990;
    float _1010 = _1004 * (*spvDescriptorSet0.vp_c8)._m0[1].z;
    float _1012 = _1000 * (*spvDescriptorSet0.vp_c8)._m0[1].z;
    float _1014 = _1006 * _1006;
    float _1016 = _958 * _990;
    float _1018 = fma(_1008, _1008, _1014);
    float _1020 = (*spvDescriptorSet0.vp_c8)._m0[2].z * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1022 = (*spvDescriptorSet0.vp_c8)._m0[2].z * (*spvDescriptorSet0.vp_c8)._m0[3].x;
    float _1024 = rsqrt(_1018);
    float _1026 = -_1020;
    float _1028 = fma((*spvDescriptorSet0.vp_c8)._m0[2].y, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1026);
    float _1030 = -_1022;
    float _1032 = fma((*spvDescriptorSet0.vp_c8)._m0[2].x, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1030);
    float _1034 = _1032 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1036 = (*spvDescriptorSet0.vp_c8)._m0[2].y * (*spvDescriptorSet0.vp_c8)._m0[3].x;
    float _1038 = -_1012;
    float _1040 = fma(_986, (*spvDescriptorSet0.vp_c8)._m0[1].y, _1038);
    float _1042 = -_1034;
    float _1044 = fma(_1028, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1042);
    float _1046 = -_1036;
    float _1048 = fma((*spvDescriptorSet0.vp_c8)._m0[2].x, (*spvDescriptorSet0.vp_c8)._m0[3].y, _1046);
    float _1050 = -_1010;
    float _1052 = fma(_986, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1050);
    float _1054 = fma(_1028, (*spvDescriptorSet0.vp_c8)._m0[1].w, _1040);
    float _1056 = _1008 * _1024;
    float _1058 = _1006 * _1024;
    float _1060 = fma(_1032, (*spvDescriptorSet0.vp_c8)._m0[1].w, _1052);
    float _1062 = -_1056;
    float _1064 = _1008 * _1062;
    float _1066 = -_1056;
    float _1068 = _1016 * _1066;
    float _1070 = _1060 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1072 = _1004 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1074 = -_1064;
    float _1076 = fma(_1006, _1058, _1074);
    float _1078 = _1016 * _1058;
    float _1080 = -_1070;
    float _1082 = fma(_1054, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1080);
    float _1084 = -_1072;
    float _1086 = fma(_1000, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1084);
    float _1088 = _1076 * _1076;
    float _1090 = fma(_1048, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1044);
    float _1092 = fma(_1048, (*spvDescriptorSet0.vp_c8)._m0[1].w, _1086);
    float _1094 = fma(_1078, _1078, _1088);
    float _1096 = fma(_1092, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1082);
    float _1098 = fma(_1068, _1068, _1094);
    float _1100 = _1004 * (*spvDescriptorSet0.vp_c8)._m0[0].z;
    float _1102 = _1004 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1104 = -_1090;
    float _1106 = fma(_1104, (*spvDescriptorSet0.vp_c8)._m0[0].w, _1096);
    float _1108 = rsqrt(_1098);
    float _1110 = -_1100;
    float _1112 = fma(_986, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1110);
    float _1114 = _1000 * (*spvDescriptorSet0.vp_c8)._m0[0].z;
    float _1116 = -_1102;
    float _1118 = fma(_1000, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1116);
    float _1120 = fma(_1032, (*spvDescriptorSet0.vp_c8)._m0[0].w, _1112);
    float _1122 = -_1114;
    float _1124 = fma(_986, (*spvDescriptorSet0.vp_c8)._m0[0].y, _1122);
    float _1126 = fma(_1048, (*spvDescriptorSet0.vp_c8)._m0[0].w, _1118);
    float _1128 = 1.0 / _1106;
    float _1130 = fma(_1028, (*spvDescriptorSet0.vp_c8)._m0[0].w, _1124);
    float _1132 = _1076 * _1108;
    float _1134 = precise::clamp(_1132, 0.0, 1.0);
    float _1136 = -_1134;
    float _1138 = _1136 + 1.0;
    float _1140 = fma(_1120, _1128, -1.0);
    float _1142 = _1138 * _1128;
    float _1144 = _480 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _1146 = fma(_1138, _1140, 1.0);
    float _1148 = _1130 * _1142;
    float _1150 = _1126 * _1142;
    float _1152 = _1146 * _1146;
    float _1154 = fma(_1148, _1148, _1152);
    float _1156 = fma(_1150, _1150, _1154);
    float _1158 = rsqrt(_1156);
    float _1160 = _1150 * _1158;
    float _1162 = _1148 * _1158;
    float _1164 = _1146 * _1158;
    float _1166 = -_1160;
    float _1168 = _1006 * _1166;
    float _1170 = _1008 * _1164;
    float _1172 = -_1162;
    float _1174 = -_1168;
    float _1176 = fma(_1008, _1172, _1174);
    float _1178 = -_1162;
    float _1180 = _1016 * _1178;
    float _1182 = -_1160;
    float _1184 = -_1170;
    float _1186 = fma(_1016, _1182, _1184);
    float _1188 = _1176 * _1176;
    float _1190 = -_1180;
    float _1192 = fma(_1006, _1164, _1190);
    float _1194 = fma(_1186, _1186, _1188);
    float _1196 = fma(_1192, _1192, _1194);
    float _1198 = rsqrt(_1196);
    float _1200 = _1186 * _1198;
    float _1202 = _1192 * _1198;
    float _1204 = _1176 * _1198;
    float _1206 = _1008 * _1200;
    float _1208 = _1016 * _1202;
    float _1210 = -_1206;
    float _1212 = fma(_1006, _1202, _1210);
    float _1214 = _1006 * _1204;
    float _1216 = -_1208;
    float _1218 = fma(_1008, _1204, _1216);
    float _1220 = -_914;
    float _1222 = fma(_1220, (*spvDescriptorSet0.vp_c9)._m0[18].w, _836);
    float _1224 = _1212 * _1212;
    float _1226 = -_1214;
    float _1228 = fma(_1016, _1200, _1226);
    float _1230 = fma(_1222, _1222, _992);
    float _1232 = fma(_1218, _1218, _1224);
    float _1234 = sqrt(_1230);
    float _1236 = fma(_1228, _1228, _1232);
    float _1238 = rsqrt(_1236);
    float _1240 = _870 * _1234;
    float _1242 = _1228 * _1238;
    float _1244 = _1218 * _1238;
    float _1246 = _1212 * _1238;
    float _1248 = _1006 * _1242;
    float _1250 = in.m_73.x;
    float _1252 = in.m_73.y;
    float _1254 = in.m_73.z;
    float _1256 = _1008 * _1246;
    float _1258 = -_1248;
    float _1260 = fma(_1008, _1244, _1258);
    float _1262 = _1016 * _1244;
    float _1264 = -_1256;
    float _1266 = fma(_1016, _1242, _1264);
    float _1268 = _1260 * _1260;
    float _1270 = -_1262;
    float _1272 = fma(_1006, _1246, _1270);
    float _1274 = fma(_1266, _1266, _1268);
    float _1276 = fma(_1272, _1272, _1274);
    float _1278 = _500 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _1280 = rsqrt(_1276);
    float _1282 = _1240 * _1278;
    float _1284 = _474 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _1286 = _1240 * _1144;
    float _1288 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _1252);
    float _1290 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _1250);
    float _1292 = _1284 * _1240;
    float _1294 = _1288 * _1282;
    float _1296 = _1290 * _1286;
    float _1298 = _1292 * _1254;
    float _1300 = _912 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _1302 = _1294 * _1242;
    float _1304 = _1294 * _1244;
    float _1306 = _1272 * _1280;
    float _1308 = _1266 * _1280;
    float _1310 = _1260 * _1280;
    float _1312 = fma(_918, (*spvDescriptorSet0.vp_c8)._m0[11].x, _1300);
    float _1314 = fma(_1296, _1306, _1302);
    float _1316 = fma(_1296, _1308, _1304);
    float _1318 = fma(_926, (*spvDescriptorSet0.vp_c8)._m0[11].z, _1312);
    float _1320 = fma(_1298, _1008, _1314);
    float _1322 = fma(_1298, _1006, _1316);
    float _1324 = _814 + _1320;
    float _1326 = _798 + _1322;
    float _1328 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1330 = _1324 + _1328;
    float _1332 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1334 = _1326 + _1332;
    float _1336 = _1330 * _1330;
    float _1338 = fma(_1334, _1334, _1336);
    float _1340 = _1294 * _1246;
    float _1342 = sqrt(_1338);
    float _1344 = fma(_1296, _1310, _1340);
    float _1346 = fma(_1298, _1016, _1344);
    float _1348 = _778 + _1346;
    bool _1350 = _1342 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1352 = _1298;
    float _1354 = _1340;
    float _1356 = _1346;
    if (!_1350)
    {
        _1352 = _1326;
    }
    float _1358 = _1352;
    float _1360 = _1358;
    if (!_1350)
    {
        _1354 = _1324;
    }
    float _1362 = _1354;
    float _1364 = _1362;
    if (!_1350)
    {
        _1356 = _1348;
    }
    float _1366 = _1356;
    bool _1368 = !_1350;
    float _1370 = _1366;
    if (!_1368)
    {
        float _1372 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1374 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1376 = _1342 + _1374;
        float _1378 = rsqrt(_1338);
        float _1380 = _1376 * _1372;
        float _1382 = _1348 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1384 = _1380 * 0.15915493667125701904296875;
        float _1386 = _1384 * 6.283185482025146484375;
        float _1388 = cos(_1386);
        float _1390 = _1384 * 6.283185482025146484375;
        float _1392 = sin(_1390);
        float _1394 = _1388 + (-1.0);
        float _1396 = _1394 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1398 = fma(_1392, _1382, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1400 = fma(_1348, _1388, _1396);
        float _1402 = _1378 * _1398;
        float _1404 = fma(_1334, _1402, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1406 = fma(_1330, _1402, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _1370 = _1400;
        _1360 = _1404;
        _1364 = _1406;
    }
    float _1408 = _1370;
    float _1410 = _1360;
    float _1412 = _1364;
    float _1414 = -_778;
    float _1416 = _1414 + _1408;
    float _1418 = -_798;
    float _1420 = _1418 + _1410;
    float _1422 = -_814;
    float _1424 = _1422 + _1412;
    float _1426 = _1318 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _1428 = _1416 * _1416;
    float _1430 = _912 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _1432 = 1.0 / _1426;
    float _1434 = fma(_1420, _1420, _1428);
    float _1436 = fma(_918, (*spvDescriptorSet0.vp_c8)._m0[10].x, _1430);
    float _1438 = fma(_1424, _1424, _1434);
    float _1440 = fma(_926, (*spvDescriptorSet0.vp_c8)._m0[10].z, _1436);
    bool _1442 = (*spvDescriptorSet0.vp_c15)._m0[653].w >= 0.5;
    bool _1444 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _1446 = _1442 || _1444;
    bool _1448 = isnan(0.5);
    bool _1450 = _1446 || _1448;
    float _1452 = sqrt(_1438);
    float _1454 = _1440 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _1456 = _1454 + _1426;
    float _1458 = _1456 * _1432;
    float _1460 = _1458 * 0.5;
    bool _1462 = _1452 > 0.0;
    float _1464 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _1466 = fma(_1460, (*spvDescriptorSet0.vp_c8)._m0[30].w, _1464);
    bool _1468 = (*spvDescriptorSet0.vp_c15)._m0[660].y >= 0.5;
    bool _1470 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _1472 = _1468 || _1470;
    bool _1474 = isnan(0.5);
    bool _1476 = _1472 || _1474;
    float _1478 = 1.0 / _1466;
    bool _1480 = !_1462;
    float _1482 = _1410;
    float _1484 = _1408;
    float _1486 = _1412;
    float _1488 = (*spvDescriptorSet0.vp_c15)._m0[653].w;
    if (!_1480)
    {
        float _1490 = _184 * _184;
        float _1492 = rsqrt(_1438);
        float _1494 = fma(_182, _182, _1490);
        float _1496 = fma(_186, _186, _1494);
        float _1498 = sqrt(_1496);
        float _1500 = _1420 * _1492;
        float _1502 = _1416 * _1492;
        float _1504 = _1424 * _1492;
        bool _1506 = _1498 > 0.0;
        bool _1508 = !_1506;
        _1488 = _1498;
        if (!_1508)
        {
            float _1510 = rsqrt(_1496);
            float _1512 = 1.0 / (*spvDescriptorSet0.vp_c10)._m0[2].z;
            float _1514 = _184 * _1510;
            float _1516 = _182 * _1510;
            float _1518 = _1502 * _1514;
            float _1520 = _186 * _1510;
            float _1522 = fma(_1500, _1516, _1518);
            float _1524 = _1512 * (*spvDescriptorSet0.vp_c9)._m0[142].x;
            float _1526 = fma(_1504, _1520, _1522);
            float _1528 = _1526 * _1524;
            float _1530 = fma(_182, _1528, _1410);
            float _1532 = fma(_184, _1528, _1408);
            float _1534 = fma(_186, _1528, _1412);
            _1482 = _1530;
            _1484 = _1532;
            _1486 = _1534;
            _1488 = _1528;
        }
    }
    float _1536 = _1482;
    float _1538 = _1484;
    float _1540 = _1486;
    float _1542 = _1488;
    float _1544 = -_906;
    float _1546 = fma(_1544, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1536);
    float _1548 = -_904;
    float _1550 = fma(_1548, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1538);
    float _1552 = -_914;
    float _1554 = fma(_1552, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1540);
    float _1556 = _1542;
    float _1558 = _1550;
    float _1560 = _1546;
    float _1562 = _1554;
    if (_1450)
    {
        _1556 = 1.0;
    }
    float _1564 = _1556;
    float _1566 = _1564;
    if (!_1476)
    {
        float _1568 = _922 * _922;
        float _1570 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _1572 = -_798;
        float _1574 = _1572 + _1536;
        float _1576 = -_778;
        float _1578 = _1576 + _1538;
        float _1580 = fma(_930, _930, _1568);
        float _1582 = -_814;
        float _1584 = _1582 + _1540;
        float _1586 = fma(_936, _936, _1580);
        float _1588 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1590 = sqrt(_1586);
        float _1592 = 1.0 / _1240;
        bool _1594 = _1590 > (*spvDescriptorSet0.vp_c9)._m0[199].x;
        bool _1596 = isnan(_1590);
        bool _1598 = _1594 || _1596;
        bool _1600 = isnan((*spvDescriptorSet0.vp_c9)._m0[199].x);
        bool _1602 = _1598 || _1600;
        float _1604 = precise::min(_1590, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _1606 = _1604 * _1570;
        float _1608 = _1588 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1610 = _1578 * _1592;
        float _1612 = _1574 * _1592;
        float _1614 = _1584 * _1592;
        float _1616 = _1608 * _1606;
        float _1618 = _1550;
        float _1620 = _1590;
        _782 = _1578;
        if (_1602)
        {
            float _1622 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].y;
            _1618 = _1622;
        }
        float _1624 = _1618;
        if (_1602)
        {
            float _1626 = precise::max(_1590, (*spvDescriptorSet0.vp_c9)._m0[199].y);
            _1620 = _1626;
        }
        float _1628 = _1620;
        float _1630 = fma(_1612, _1616, _918);
        float _1632 = fma(_1614, _1616, _926);
        float _1634 = _1628;
        float _1636 = _1630;
        _1562 = _1632;
        if (_1602)
        {
            float _1638 = _1628 * _1624;
            _1634 = _1638;
        }
        float _1640 = _1634;
        float _1642 = fma(_1610, _1616, _912);
        float _1644 = _1640;
        float _1646 = _1642;
        if (_1602)
        {
            float _1648 = _1608 * _1640;
            _1644 = _1648;
        }
        float _1650 = _1644;
        if (_1602)
        {
            float _1652 = fma(_1610, _1650, _912);
            _1646 = _1652;
        }
        float _1654 = _1646;
        _1558 = _1654;
        if (_1602)
        {
            float _1656 = fma(_1612, _1650, _918);
            _1636 = _1656;
        }
        float _1658 = _1636;
        _1560 = _1658;
        if (_1602)
        {
            float _1660 = fma(_1614, _1650, _926);
            _1562 = _1660;
        }
    }
    float _1662 = _782;
    float _1664 = _1558;
    float _1666 = _1560;
    float _1668 = _1562;
    float _1670 = _1662;
    if (_1450)
    {
        _944 = 1.0;
    }
    float _1672 = _944;
    float _1674 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _1676 = _1478 * _1674;
    float _1678 = _1672;
    if (!_1450)
    {
        float _1680 = (*spvDescriptorSet0.vp_c8)._m0[31].x * 0.5;
        float _1682 = _1680 * 0.15915493667125701904296875;
        float _1684 = _1682 * 6.283185482025146484375;
        float _1686 = cos(_1684);
        float _1688 = (*spvDescriptorSet0.vp_c8)._m0[31].y * 0.5;
        float _1690 = _1688 * 0.15915493667125701904296875;
        float _1692 = _1682 * 6.283185482025146484375;
        float _1694 = sin(_1692);
        float _1696 = 1.0 / _1686;
        float _1698 = _1690 * 6.283185482025146484375;
        float _1700 = cos(_1698);
        float _1702 = _1694 * _1696;
        float _1704 = _1690 * 6.283185482025146484375;
        float _1706 = sin(_1704);
        float _1708 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1710 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _1708;
        float _1712 = _1700 * _1702;
        float _1714 = 1.0 / _1710;
        float _1716 = 1.0 / _1712;
        float _1718 = _1706 * _1716;
        float _1720 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1722 = fma(_1676, _1718, _1720);
        float _1724 = _1722 * _1714;
        float _1726 = precise::clamp(_1724, 0.0, 1.0);
        _1670 = _1702;
        _1566 = _1726;
    }
    float _1728 = _1670;
    float _1730 = _1566;
    float _1732 = _1728;
    if (!_1450)
    {
        float _1734 = (*spvDescriptorSet0.vp_c8)._m0[31].x * 0.5;
        float _1736 = _1734 * 0.15915493667125701904296875;
        float _1738 = _1736 * 6.283185482025146484375;
        float _1740 = cos(_1738);
        float _1742 = (*spvDescriptorSet0.vp_c8)._m0[31].y * 0.5;
        float _1744 = _1742 * 0.15915493667125701904296875;
        float _1746 = _1736 * 6.283185482025146484375;
        float _1748 = sin(_1746);
        float _1750 = 1.0 / _1740;
        float _1752 = _1744 * 6.283185482025146484375;
        float _1754 = cos(_1752);
        float _1756 = _1748 * _1750;
        float _1758 = _1744 * 6.283185482025146484375;
        float _1760 = sin(_1758);
        float _1762 = _1754 * _1756;
        float _1764 = 1.0 / _1762;
        float _1766 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _1768 = (*spvDescriptorSet0.vp_c9)._m0[140].w + _1766;
        float _1770 = 1.0 / _1768;
        float _1772 = _1760 * _1764;
        float _1774 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _1776 = fma(_1676, _1772, _1774);
        float _1778 = _1776 * _1770;
        float _1780 = precise::clamp(_1778, 0.0, 1.0);
        float _1782 = -_1780;
        float _1784 = _1782 + 1.0;
        _1732 = _1750;
        _1678 = _1784;
    }
    float _1786 = _1732;
    float _1788 = _1678;
    float _1790 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1792 = _1664 + _1790;
    float _1794 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1796 = _1666 + _1794;
    float _1798 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1800 = _1668 + _1798;
    float _1802 = _1664 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1804 = _1792 * _1792;
    float _1806 = fma(_1666, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1802);
    float _1808 = fma(_1796, _1796, _1804);
    float _1810 = fma(_1800, _1800, _1808);
    float _1812 = rsqrt(_1810);
    float _1814 = _1812 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1816 = _1796 * _1814;
    float _1818 = _1800 * _1814;
    float _1820 = _1816 * _1816;
    float _1822 = _1818 * _1818;
    float _1824 = _1820 + _1822;
    float _1826 = sqrt(_1824);
    bool _1828 = _1826 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1830 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1832 = _1826 + _1830;
    float _1834 = _1800;
    float _1836 = _1812;
    float _1838 = _1832;
    float _1840 = _1804;
    float _1842 = _1820;
    if (_1828)
    {
        float _1844 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1834 = _1844;
    }
    float _1846 = _1834;
    if (_1828)
    {
        float _1848 = rsqrt(_1824);
        _1836 = _1848;
    }
    float _1850 = _1836;
    float _1852 = _1850;
    if (_1828)
    {
        float _1854 = _1832 * _1846;
        _1838 = _1854;
    }
    float _1856 = _1838;
    if (_1828)
    {
        float _1858 = _1856 * 0.15915493667125701904296875;
        _1840 = _1858;
    }
    float _1860 = _1840;
    float _1862 = _1846;
    float _1864 = _1860;
    if (_1828)
    {
        float _1866 = _1860 * 6.283185482025146484375;
        float _1868 = sin(_1866);
        _1862 = _1868;
    }
    float _1870 = _1862;
    float _1872 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _1874 = precise::max(0.0, _1872);
    float _1876 = _1786;
    float _1878 = _1874;
    if (_1828)
    {
        float _1880 = _1860 * 6.283185482025146484375;
        float _1882 = cos(_1880);
        _1876 = _1882;
    }
    float _1884 = _1876;
    float _1886 = -_1814;
    float _1888 = -_1874;
    float _1890 = fma(_1792, _1886, _1888);
    float _1892 = (*spvDescriptorSet0.vp_c15)._m0[652].x;
    if (_1828)
    {
        float _1894 = _1890 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1878 = _1894;
    }
    float _1896 = _1878;
    if (!_1828)
    {
        _1864 = _1816;
    }
    float _1898 = _1864;
    float _1900 = _1870;
    float _1902 = _1898;
    if (_1828)
    {
        float _1904 = fma(_1870, _1896, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1900 = _1904;
    }
    float _1906 = _1900;
    float _1908 = fma(_918, (*spvDescriptorSet0.vp_c15)._m0[652].x, (*spvDescriptorSet0.vp_c15)._m0[652].z);
    float _1910 = sqrt(_1810);
    float _1912 = _1906;
    float _1914 = _1884;
    if (_1828)
    {
        float _1916 = _1884 + (-1.0);
        _1892 = _1916;
    }
    float _1918 = _1892;
    float _1920 = _1918;
    if (_1828)
    {
        float _1922 = _1850 * _1906;
        _946 = _1922;
    }
    float _1924 = _946;
    if (!_1828)
    {
        _1852 = _1890;
    }
    float _1926 = _1852;
    float _1928 = _1926;
    if (_1828)
    {
        float _1930 = _1918 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1920 = _1930;
    }
    float _1932 = _1920;
    if (_1828)
    {
        float _1934 = _1816 * _1924;
        _1902 = _1934;
    }
    float _1936 = _1902;
    if (!_1828)
    {
        _1912 = _1818;
    }
    float _1938 = _1912;
    float _1940 = _1938;
    if (_1828)
    {
        float _1942 = _1818 * _1924;
        _1940 = _1942;
    }
    float _1944 = _1940;
    if (_1828)
    {
        float _1946 = fma(_1890, _1884, _1932);
        _1928 = _1946;
    }
    float _1948 = _1928;
    if (_1828)
    {
        float _1950 = _1936 * _1936;
        _1842 = _1950;
    }
    float _1952 = _1842;
    if (!_1828)
    {
        _1914 = _1822;
    }
    float _1954 = _1914;
    float _1956 = _1954;
    if (_1828)
    {
        float _1958 = _1944 * _1944;
        _1956 = _1958;
    }
    float _1960 = _1956;
    float _1962 = fma(_1948, _1948, _1952);
    float _1964 = _1664 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1966 = floor(_1908);
    float _1968 = fma(_1668, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1806);
    float _1970 = _1962 + _1960;
    float _1972 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _1974 = fma(_1910, (*spvDescriptorSet0.vp_c15)._m0[23].w, _1972);
    float _1976 = precise::clamp(_1974, 0.0, 1.0);
    float _1978 = fma(_1666, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1964);
    float _1980 = _1968 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1982 = -_1976;
    float _1984 = _1982 + 1.0;
    float _1986 = rsqrt(_1970);
    float _1988 = fma(_926, (*spvDescriptorSet0.vp_c15)._m0[652].y, (*spvDescriptorSet0.vp_c15)._m0[652].w);
    float _1990 = _1664 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1992 = fma(_1668, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1978);
    float _1994 = fma(_1666, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1990);
    float _1996 = _1992 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1998 = abs(_1984);
    float _2000 = log2(_1998);
    float _2002 = _1664 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _2004 = fma(_1668, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1994);
    float _2006 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _2008 = _1996 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _2010 = fma(_1666, (*spvDescriptorSet0.vp_c8)._m0[0].x, _2002);
    float _2012 = _2004 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _2014 = -_1966;
    float _2016 = _1908 + _2014;
    float _2018 = _1986 * _1936;
    float _2020 = _1986 * _1948;
    float _2022 = fma(_1668, (*spvDescriptorSet0.vp_c8)._m0[0].z, _2010);
    float _2024 = _1986 * _1944;
    float _2026 = _2018 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _2028 = -_2008;
    float _2030 = fma(_2028, _2006, 1.0);
    float _2032 = _2012 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _2034 = floor(_1988);
    float _2036 = -_2026;
    float _2038 = fma(_2020, (*spvDescriptorSet0.vp_c15)._m0[21].y, _2036);
    float _2040 = _2022 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _2042 = _2000 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _2044 = _2012 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _2046 = -_2024;
    float _2048 = fma(_2046, (*spvDescriptorSet0.vp_c15)._m0[21].z, _2038);
    float _2050 = fma(_2040, (*spvDescriptorSet0.vp_c8)._m0[7].x, _2032);
    float _2052 = log2(_2030);
    float _2054 = fma(_2040, (*spvDescriptorSet0.vp_c8)._m0[4].x, _2044);
    float _2056 = fma(_1996, (*spvDescriptorSet0.vp_c8)._m0[7].z, _2050);
    float _2058 = _2012 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _2060 = fma(_1996, (*spvDescriptorSet0.vp_c8)._m0[4].z, _2054);
    float _2062 = fma(_1980, (*spvDescriptorSet0.vp_c8)._m0[7].w, _2056);
    float _2064 = fma(_2040, (*spvDescriptorSet0.vp_c8)._m0[5].x, _2058);
    float _2066 = exp2(_2042);
    float _2068 = fma(_2048, -0.5, 0.5);
    float _2070 = fma(_2048, 0.5, 0.5);
    float _2072 = -_2034;
    float _2074 = _1988 + _2072;
    float _2076 = fma(_1996, (*spvDescriptorSet0.vp_c8)._m0[5].z, _2064);
    float _2078 = fma(_1980, (*spvDescriptorSet0.vp_c8)._m0[4].w, _2060);
    float _2080 = fma(_2070, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _2082 = 1.0 / _2062;
    float _2084 = fma(_1980, (*spvDescriptorSet0.vp_c8)._m0[5].w, _2076);
    float _2086 = fma(_2070, _2080, -0.212114393711090087890625);
    float _2088 = sqrt(_2068);
    float2 _6030 = float2(_2016, _2074);
    float _2090 = dm_bs(spvDescriptorSet0.vp_t_tcb_24.sample(spvDescriptorSet0.vp_t_tcb_24Smplr, select(_6030, float2(0.0), isnan(_6030)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_24, spvDescriptorSet0.vp_t_tcb_24Smplr_w, select(_6030, float2(0.0), isnan(_6030)), level(0.0)).x;
    float _2092 = fma(_2070, _2086, 1.570728778839111328125);
    float _2094 = _2020 + 1.0;
    float _2096 = -_2020;
    float _2098 = fma(_2066, _2094, _2096);
    float _2100 = _2052 * 0.693147182464599609375;
    float _2102 = _2078 * _2082;
    float _2104 = _2084 * _2082;
    float _2106 = _2088 * 0.636619746685028076171875;
    float _2108 = _2100 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _2110 = fma(_2102, 0.5, 0.5);
    float _2112 = fma(_2104, -0.5, 0.5);
    float _2114 = -_2092;
    float _2116 = fma(_2106, _2114, 1.0);
    float _2118 = fma(_2098, 0.5, 0.5);
    float3 _6080 = float3(_2110, _2112, _2108);
    float _2120 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_6080, float3(0.0), isnan(_6080)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_6080, float3(0.0), isnan(_6080)), level(0.0)).x;
    float3 _6091 = float3(_2110, _2112, _2108);
    float4 _2123 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_6091, float3(0.0), isnan(_6091)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_6091, float3(0.0), isnan(_6091)), level(0.0)).xyzw;
    float _2125 = _2123.x;
    float _2127 = _2123.y;
    float _2129 = _2123.z;
    float _2131 = _2123.w;
    float2 _6107 = float2(_2116, _2118);
    float3 _2135 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_6107, float2(0.0), isnan(_6107)), level(0.0)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_6107, float2(0.0), isnan(_6107)), level(0.0)).xyz;
    float _2137 = _2135.x;
    float _2139 = _2135.y;
    float _2141 = _2135.z;
    float _2143 = abs(_1676);
    float _2145 = log2(_2143);
    bool _2147 = _1252 != 0.0;
    bool _2149 = isnan(_1252);
    bool _2151 = _2147 || _2149;
    bool _2153 = isnan(0.0);
    bool _2155 = _2151 || _2153;
    float _2157 = _2012 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    bool _2159 = _1250 == 0.0;
    bool _2161 = !_2155;
    bool _2163 = _2159 && _2161;
    float _2165 = fma(_2040, (*spvDescriptorSet0.vp_c8)._m0[6].x, _2157);
    bool _2167 = _1254 == 0.0;
    bool _2169 = _2167 && _2163;
    float _2171 = fma(_1996, (*spvDescriptorSet0.vp_c8)._m0[6].z, _2165);
    bool _2173 = _1676 <= 8000.0;
    bool _2175 = isnan(_1676);
    bool _2177 = _2173 || _2175;
    bool _2179 = isnan(8000.0);
    bool _2181 = _2177 || _2179;
    float _2183 = float(_2181);
    float _2185 = _2145 * (*spvDescriptorSet0.vp_c15)._m0[654].z;
    float _2187 = in.m_75.x;
    float _2189 = in.m_75.y;
    float _2191 = in.m_75.z;
    float _2193 = exp2(_2185);
    float _2195 = fma(_2193, (*spvDescriptorSet0.vp_c15)._m0[654].x, (*spvDescriptorSet0.vp_c15)._m0[654].y);
    float _2197 = precise::clamp(_2195, 0.0, 1.0);
    float _2199 = _2189;
    float _2201 = _2187;
    float _2203 = _2191;
    float _2205 = _2062;
    float _2207 = _2084;
    if (!_2169)
    {
        float _2209 = fma(_1252, (*spvDescriptorSet0.vp_c9)._m0[17].y, _2189);
        _2199 = _2209;
    }
    float _2211 = _2199;
    if (!_2169)
    {
        float _2213 = fma(_1250, (*spvDescriptorSet0.vp_c9)._m0[17].y, _2187);
        _2201 = _2213;
    }
    float _2215 = _2201;
    float _2217 = fma(_2197, -2.0, 3.0);
    float _2219 = _2197 * _2197;
    float _2221 = _1244 * _2211;
    float _2223 = _1246 * _2211;
    float _2225 = _1242 * _2211;
    float _2227 = _2000 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _2229 = _2219 * _2217;
    float _2231 = fma(_1310, _2215, _2223);
    float _2233 = fma(_1308, _2215, _2221);
    float _2235 = exp2(_2227);
    float _2237 = -_2229;
    float _2239 = _2237 + 1.0;
    float _2241 = in.m_77.x;
    float _2243 = fma(_1306, _2215, _2225);
    float _2245 = _2062 * 0.5;
    float _2247 = fma(_2239, (*spvDescriptorSet0.vp_c15)._m0[654].w, _2229);
    if (!_2169)
    {
        float _2249 = fma(_1254, (*spvDescriptorSet0.vp_c9)._m0[17].y, _2191);
        _2203 = _2249;
    }
    float _2251 = _2203;
    float _2253 = fma(_1980, (*spvDescriptorSet0.vp_c8)._m0[6].w, _2171);
    float _2255 = fma(_2084, -0.5, _2245);
    float _2257 = _2183 * _2247;
    float _2259 = fma(_1006, _2251, _2233);
    float _2261 = fma(_1016, _2251, _2231);
    float _2263 = fma(_1008, _2251, _2243);
    float _2265 = _2257 * (*spvDescriptorSet0.vp_c15)._m0[653].x;
    float _2267 = _2078 + _2062;
    float _2269 = -_2235;
    float _2271 = _2269 + 1.0;
    out.gl_Position.x = _2078;
    out.gl_Position.y = _2084;
    out.gl_Position.z = _2253;
    out.gl_Position.w = _2062;
    bool _2273 = _1910 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _2275 = isnan(_1910);
    bool _2277 = _2273 || _2275;
    bool _2279 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _2281 = _2277 || _2279;
    float _2283 = _2253 + _2062;
    float _2285 = _2271 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    out.m_79.x = _2259;
    out.m_79.y = _2261;
    out.m_79.z = _2263;
    float _2287 = _2283 * 0.5;
    float _2289 = _2267 * 0.5;
    out.m_81.x = _2289;
    out.m_81.y = _2255;
    out.m_81.z = _2287;
    out.m_81.w = _2062;
    float _2291 = -_2285;
    float _2293 = _2291 + 1.0;
    float _2295 = _2253;
    float _2297 = _2289;
    float _2299 = (*spvDescriptorSet0.vp_c15)._m0[653].y;
    if (!_2281)
    {
        _2205 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _2301 = _2205;
    float _2303 = _2301;
    float _2305 = _2301;
    if (!_2281)
    {
        _2295 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _2307 = _2295;
    float _2309 = _2307;
    float _2311 = _2307;
    if (!_2281)
    {
        _2207 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _2313 = _2207;
    float _2315 = _2313;
    float _2317 = _2313;
    if (!_2281)
    {
        _2297 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _2319 = _2297;
    float _2321 = -_2090;
    float _2323 = _2321 + 1.0;
    float _2325 = _2323 * _2265;
    float _2327 = precise::clamp(_2325, 0.0, 1.0);
    float _2329 = -_2327;
    float _2331 = fma(_2329, (*spvDescriptorSet0.vp_c15)._m0[653].y, 1.0);
    float _2333 = _2319;
    float _2335 = _2319;
    if (!_2281)
    {
        _2299 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _2337 = _2299;
    float _2339 = _2331 * _2241;
    float _2341 = _2339 * (*spvDescriptorSet0.vp_c13)._m0[1].w;
    out.m_83.x = _2341;
    float _2343 = _2285 * _2120;
    float _2345 = _2131 * _2293;
    float _2347 = _1730 * _1788;
    float _2349 = _2131 * _2343;
    float _2351 = _2141 * _2343;
    float _2353 = _2347 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _2355 = _2347;
    float _2357 = _2337;
    float _2359 = _2337;
    if (!_2281)
    {
        _2355 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _2361 = _2355;
    float _2363 = fma(_2137, _2349, _2125);
    float _2365 = fma(_2139, _2349, _2127);
    float _2367 = fma(_2131, _2351, _2129);
    out.m_85.x = _2363;
    out.m_85.y = _2365;
    out.m_85.z = _2367;
    out.m_85.w = _2345;
    bool _2369 = !_2281;
    float _2371 = _2361;
    float _2373 = _2361;
    if (!_2369)
    {
        bool _2375 = _1910 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _2377 = isnan(_1910);
        bool _2379 = _2375 || _2377;
        bool _2381 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _2383 = _2379 || _2381;
        if (!_2383)
        {
            float _2385 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2387 = _1910 + _2385;
            float _2389 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2391 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _2389;
            float _2393 = 1.0 / _2391;
            float _2395 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _2397 = _2395 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _2399 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _2401 = _2399 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _2403 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _2405 = _2403 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _2407 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _2409 = _2407 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _2411 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _2413 = _2411 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _2415 = _2387 * _2393;
            float _2417 = precise::clamp(_2415, 0.0, 1.0);
            float _2419 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _2421 = _2419 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _2423 = fma(_2417, _2397, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _2425 = fma(_2417, _2421, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _2427 = fma(_2417, _2401, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _2429 = fma(_2417, _2405, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _2431 = fma(_2417, _2409, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _2433 = fma(_2417, _2413, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            _2335 = _2425;
            _2317 = _2431;
            _2359 = _2423;
            _2311 = _2429;
            _2305 = _2427;
            _2373 = _2433;
            _2435 = true;
        }
        else
        {
            bool _2437 = _1910 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _2439 = isnan(_1910);
            bool _2441 = _2437 || _2439;
            bool _2443 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _2445 = _2441 || _2443;
            if (!_2445)
            {
                _2357 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _2447 = _2357;
            _2359 = _2447;
            if (!_2445)
            {
                _2333 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _2449 = _2333;
            _2335 = _2449;
            if (!_2445)
            {
                _2303 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _2451 = _2303;
            _2305 = _2451;
            if (!_2445)
            {
                _2309 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _2453 = _2309;
            _2311 = _2453;
            if (!_2445)
            {
                _2315 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _2455 = _2315;
            _2317 = _2455;
            if (!_2445)
            {
                _2371 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _2457 = _2371;
            bool _2459 = !_2445;
            _2373 = _2457;
            if (!_2459)
            {
                bool _2461 = _1910 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _2463 = isnan(_1910);
                bool _2465 = _2461 || _2463;
                bool _2467 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _2469 = _2465 || _2467;
                if (!_2469)
                {
                    float _2471 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2473 = _1910 + _2471;
                    float _2475 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2477 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _2475;
                    float _2479 = 1.0 / _2477;
                    float _2481 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _2483 = _2481 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _2485 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _2487 = _2485 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _2489 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _2491 = _2489 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _2493 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _2495 = _2493 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _2497 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _2499 = _2497 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _2501 = _2473 * _2479;
                    float _2503 = precise::clamp(_2501, 0.0, 1.0);
                    float _2505 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _2507 = _2505 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _2509 = fma(_2503, _2483, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _2511 = fma(_2503, _2507, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _2513 = fma(_2503, _2487, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _2515 = fma(_2503, _2491, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _2517 = fma(_2503, _2495, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _2519 = fma(_2503, _2499, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    _2335 = _2511;
                    _2317 = _2517;
                    _2359 = _2509;
                    _2311 = _2515;
                    _2305 = _2513;
                    _2373 = _2519;
                    _2435 = true;
                }
                else
                {
                    _2335 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _2317 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _2359 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _2311 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _2305 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _2373 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _2435 = false;
    float _2521 = _2335;
    float _2523 = _2317;
    float _2525 = _2359;
    float _2527 = _2311;
    float _2529 = _2305;
    float _2531 = _2373;
    float _2533 = fma(_2261, -0.5, 0.5);
    float _2535 = precise::clamp(_2533, 0.0, 1.0);
    float _2537 = -_2521;
    float _2539 = _2537 + _2523;
    float _2541 = _2353 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _2543 = -_2525;
    float _2545 = _2543 + _2527;
    float _2547 = fma(_2535, _2539, _2521);
    out.m_87.x = 0.0;
    float _2549 = -_2529;
    float _2551 = _2549 + _2531;
    float _2553 = fma(_2535, _2545, _2525);
    float _2555 = _2547 * 0.586610972881317138671875;
    out.m_49.x = _2541;
    bool _2557 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _2559 = fma(_2535, _2551, _2529);
    float _2561 = fma(_2553, 0.298911988735198974609375, _2555);
    bool _2563 = _1730 > 0.0;
    bool _2565 = isnan(_1730);
    bool _2567 = _2563 || _2565;
    bool _2569 = isnan(0.0);
    bool _2571 = _2567 || _2569;
    float _2573 = fma(_2559, 0.114477999508380889892578125, _2561);
    bool _2575 = _1788 <= 0.0;
    bool _2577 = !_2571;
    bool _2579 = _2575 || _2577;
    float _2581 = -_2573;
    float _2583 = _2553 + _2581;
    float _2585 = -_2573;
    float _2587 = _2547 + _2585;
    float _2589 = -_2573;
    float _2591 = _2559 + _2589;
    float _2593 = fma(_2583, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2573);
    float _2595 = fma(_2587, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2573);
    float _2597 = fma(_2591, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2573);
    bool _2599 = !_2557;
    if (!_2599)
    {
        float _2601 = -_1664;
        float _2603 = _2601 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
        float _2605 = -_1666;
        float _2607 = _2605 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
        float _2609 = -_1668;
        float _2611 = _2609 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
        float _2613 = _2603 * _2603;
        float _2615 = fma(_2607, _2607, _2613);
        float _2617 = fma(_2611, _2611, _2615);
        float _2619 = sqrt(_2617);
        float _2621 = rsqrt(_2617);
        float _2623 = -_2619;
        float _2625 = _2623 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
        float _2627 = _2625 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
        float _2629 = precise::clamp(_2627, 0.0, 1.0);
        float _2631 = _2607 * _2621;
        float _2633 = _2603 * _2621;
        float _2635 = abs(_2629);
        float _2637 = log2(_2635);
        float _2639 = _2611 * _2621;
        float _2641 = _2631 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
        float _2643 = _2261 * _2633;
        float _2645 = -_2633;
        float _2647 = -_2641;
        float _2649 = fma(_2645, (*spvDescriptorSet0.vp_c15)._m0[656].y, _2647);
        float _2651 = fma(_2259, _2631, _2643);
        float _2653 = -_2639;
        float _2655 = fma(_2653, (*spvDescriptorSet0.vp_c15)._m0[656].z, _2649);
        float _2657 = fma(_2263, _2639, _2651);
        float _2659 = precise::clamp(_2657, 0.0, 1.0);
        float _2661 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
        float _2663 = _2655 + _2661;
        float _2665 = _2637 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
        float _2667 = _2663 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
        float _2669 = precise::clamp(_2667, 0.0, 1.0);
        float _2671 = exp2(_2665);
        float _2673 = _2671 * _2669;
        float _2675 = _2659 * _2673;
        float _2677 = _2675 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
        float _2679 = _2675 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
        float _2681 = _2675 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
        out.m_87.x = _2677;
        out.m_87.y = _2679;
        out.m_87.z = _2681;
    }
    out.m_89.x = _2593;
    out.m_89.y = _2595;
    out.m_89.z = _2597;
    if (!_2579)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_59.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_59.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_59.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_59.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_67.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_67.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_67.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_67.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_49.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_49.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_49.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_49.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_89.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_89.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_89.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_89.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_63.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_63.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_63.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_63.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_69.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_69.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_69.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_69.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_81.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_81.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_81.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_81.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_71.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_71.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_71.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_71.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_79.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_79.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_79.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_79.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_87.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_87.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_87.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_87.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_83.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_83.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_83.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_83.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_85.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_85.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_85.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_85.w)); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    out.m_49.x = 0.0;
    float _2683 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _2683;
    { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_59.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_59.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_59.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_59.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_67.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_67.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_67.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_67.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_49.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_49.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_49.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_49.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_89.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_89.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_89.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_89.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_63.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_63.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_63.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_63.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_69.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_69.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_69.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_69.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_81.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_81.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_81.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_81.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_71.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_71.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_71.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_71.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_79.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_79.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_79.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_79.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_87.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_87.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_87.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_87.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_83.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_83.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_83.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_83.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_85.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_85.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_85.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_85.w)); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
}

