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
    float4 m_65 [[user(locn0)]];
    float4 m_67 [[user(locn1)]];
    float4 m_75 [[user(locn2)]];
    float4 m_85 [[user(locn3)]];
    float4 m_95 [[user(locn4)]];
    float4 m_99 [[user(locn5)]];
    float4 m_97 [[user(locn6)]];
    float4 m_101 [[user(locn7)]];
    float4 m_79 [[user(locn8)]];
    float4 m_73 [[user(locn9)]];
    float4 m_93 [[user(locn10)]];
    float4 m_105 [[user(locn11)]];
    float4 m_51 [[user(locn12)]];
    float4 m_111 [[user(locn13)]];
    float4 m_107 [[user(locn14)]];
    float4 m_109 [[user(locn15)]];
    float4 m_113 [[user(locn16)]];
    float4 m_59 [[user(locn17)]];
    float4 m_69 [[user(locn18)]];
    float4 m_77 [[user(locn19)]];
    float4 m_83 [[user(locn20)]];
    float4 gl_Position [[position, invariant]];
    float gl_PointSize [[point_size]];
};

struct main0_in
{
    float4 m_103 [[attribute(0)]];
    float4 m_81 [[attribute(1)]];
    float4 m_57 [[attribute(2)]];
    float4 m_48 [[attribute(3)]];
    float4 m_53 [[attribute(4)]];
    float4 m_89 [[attribute(5)]];
    float4 m_87 [[attribute(6)]];
    float4 m_61 [[attribute(7)]];
    float4 m_63 [[attribute(8)]];
    float4 m_91 [[attribute(9)]];
    float4 m_55 [[attribute(10)]];
    float4 m_71 [[attribute(11)]];
};

vertex main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]])
{
    main0_out out = {};
    out.m_65 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_67 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_75 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_85 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_95 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_99 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_97 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_101 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_79 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_73 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_93 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_105 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_51 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_111 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_107 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_109 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_113 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_59 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_69 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_77 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_83 = float4(0.0, 0.0, 0.0, 1.0);
    bool _5136 = false;
    bool _4289 = false;
    bool _1650 = false;
    bool _1204 = false;
    bool _1100 = false;
    bool _932 = false;
    bool _752 = false;
    bool _464 = false;
    bool _242 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _127 = in.m_48.w;
    float _129 = trunc(_127);
    int _132 = int(_129);
    bool _136 = _132 >= 1;
    float _138 = 0.0;
    if (!_136)
    {
        _138 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _140 = _138;
    float _142 = _140;
    if (!_136)
    {
        out.m_51.x = 0.0;
    }
    int _144 = 0;
    if (!_136)
    {
        float _146 = _140 * 5.0;
        _144 = as_type<int>(_146);
    }
    int _148 = _144;
    int _150 = _148;
    if (!_136)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _5421 = as_type<float>(_148);
        out.gl_Position.z = _5421;
    }
    if (!_136)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _152 = in.m_53.w;
    bool _154 = _152 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _156 = isnan(_152);
    bool _158 = _154 || _156;
    bool _160 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _162 = _158 || _160;
    float _164 = -_152;
    float _166 = _164 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    float _168 = _166;
    if (_162)
    {
        float _170 = float(_132);
        _142 = _170;
    }
    float _172 = _142;
    bool _174 = _166 >= _172;
    bool _176 = !_162;
    bool _178 = _174 || _176;
    float _180 = _172;
    if (_178)
    {
        _180 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _182 = _180;
    if (_178)
    {
        out.m_51.x = 0.0;
    }
    if (_178)
    {
        float _184 = _182 * 5.0;
        _150 = as_type<int>(_184);
    }
    int _186 = _150;
    if (_178)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _5491 = as_type<float>(_186);
        out.gl_Position.z = _5491;
    }
    if (_178)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _188 = in.m_55.x;
    bool _190 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _192 = in.m_55.y;
    float _194 = in.m_57.x;
    float _196 = in.m_57.y;
    float _198 = in.m_57.z;
    out.m_59.x = _188;
    out.m_59.y = _192;
    float _200 = _196 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _202 = _196 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _204 = _196 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _206 = fma(_194, (*spvDescriptorSet0.vp_c10)._m0[4].x, _200);
    float _208 = fma(_194, (*spvDescriptorSet0.vp_c10)._m0[5].x, _202);
    float _210 = fma(_194, (*spvDescriptorSet0.vp_c10)._m0[6].x, _204);
    float _212 = fma(_198, (*spvDescriptorSet0.vp_c10)._m0[4].z, _206);
    float _214 = fma(_198, (*spvDescriptorSet0.vp_c10)._m0[5].z, _208);
    float _216 = fma(_198, (*spvDescriptorSet0.vp_c10)._m0[6].z, _210);
    bool _218 = !_190;
    float _220 = _188;
    float _222 = _216;
    float _240;
    if (!_218)
    {
        float _224 = in.m_61.x;
        float _226 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _228 = _224 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _230 = fma(_228, (*spvDescriptorSet0.vp_c9)._m0[12].x, _166);
        float _232 = _230 * _226;
        float _234 = floor(_232);
        float _236 = -_234;
        float _238 = _232 + _236;
        _240 = _238;
        _242 = true;
    }
    else
    {
        float _244 = float(_132);
        float _246 = 1.0 / _244;
        float _248 = _166 * _246;
        _240 = _248;
    }
    _242 = false;
    float _250 = _240;
    float _252 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _254 = _250 + _252;
    float _256 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _258 = _250 + _256;
    bool _260 = _250 >= (*spvDescriptorSet0.vp_c9)._m0[146].w;
    bool _262 = isnan(_250);
    bool _264 = _260 || _262;
    bool _266 = isnan((*spvDescriptorSet0.vp_c9)._m0[146].w);
    bool _268 = _264 || _266;
    float _270 = float(_268);
    float _272 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _274 = (*spvDescriptorSet0.vp_c9)._m0[146].w + _272;
    float _276 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _278 = _250 + _276;
    float _280 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _282 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _280;
    float _284 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _286 = _284 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _288 = 1.0 / _274;
    bool _290 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].x;
    float _292 = 1.0 / _286;
    float _294 = 1.0 / _282;
    float _296 = _254 * _288;
    bool _298 = _250 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _300 = isnan(_250);
    bool _302 = _298 || _300;
    bool _304 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _306 = _302 || _304;
    float _308 = float(_306);
    float _310 = -_270;
    float _312 = _310 + 1.0;
    float _314 = _308 * _312;
    float _316 = _258 * _292;
    bool _318 = _250 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _320 = isnan(_250);
    bool _322 = _318 || _320;
    bool _324 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _326 = _322 || _324;
    float _328 = float(_326);
    float _330 = -(*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _332 = (*spvDescriptorSet0.vp_c9)._m0[144].z + _330;
    bool _334 = _250 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _336 = isnan(_250);
    bool _338 = _334 || _336;
    bool _340 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _342 = _338 || _340;
    float _344 = float(_342);
    float _346 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _348 = _346 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _350 = -_308;
    float _352 = _350 + 1.0;
    float _354 = -_328;
    float _356 = _354 + 1.0;
    float _358 = _278 * _294;
    float _360 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _362 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _360;
    float _364 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _366 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _364;
    float _368 = _344 * _356;
    float _370 = fma(_332, _358, (*spvDescriptorSet0.vp_c9)._m0[143].z);
    float _372 = fma(_362, _358, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _374 = fma(_366, _358, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _376 = _328 * _352;
    float _378 = -_344;
    float _380 = _378 + 1.0;
    float _382 = _372 * _368;
    float _384 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _386 = _384 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _388 = -(*spvDescriptorSet0.vp_c9)._m0[144].z;
    float _390 = _388 + (*spvDescriptorSet0.vp_c9)._m0[145].z;
    float _392 = _374 * _368;
    float _394 = _370 * _368;
    float _396 = fma(_380, (*spvDescriptorSet0.vp_c9)._m0[143].x, _382);
    float _398 = fma(_380, (*spvDescriptorSet0.vp_c9)._m0[143].y, _392);
    float _400 = fma(_380, (*spvDescriptorSet0.vp_c9)._m0[143].z, _394);
    float _402 = fma(_348, _316, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _404 = fma(_386, _316, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _406 = fma(_390, _316, (*spvDescriptorSet0.vp_c9)._m0[144].z);
    float _408 = -(*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _410 = (*spvDescriptorSet0.vp_c9)._m0[146].x + _408;
    float _412 = -(*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _414 = (*spvDescriptorSet0.vp_c9)._m0[146].y + _412;
    float _416 = -(*spvDescriptorSet0.vp_c9)._m0[145].z;
    float _418 = (*spvDescriptorSet0.vp_c9)._m0[146].z + _416;
    float _420 = fma(_402, _376, _396);
    float _422 = fma(_410, _296, (*spvDescriptorSet0.vp_c9)._m0[145].x);
    float _424 = fma(_414, _296, (*spvDescriptorSet0.vp_c9)._m0[145].y);
    float _426 = fma(_418, _296, (*spvDescriptorSet0.vp_c9)._m0[145].z);
    float _428 = fma(_404, _376, _398);
    float _430 = fma(_406, _376, _400);
    float _432 = fma(_422, _314, _420);
    float _434 = fma(_424, _314, _428);
    float _436 = fma(_426, _314, _430);
    float _438 = fma(_270, (*spvDescriptorSet0.vp_c9)._m0[146].x, _432);
    float _440 = fma(_270, (*spvDescriptorSet0.vp_c9)._m0[146].y, _434);
    float _442 = fma(_270, (*spvDescriptorSet0.vp_c9)._m0[146].z, _436);
    bool _444 = !_290;
    float _462;
    if (!_444)
    {
        float _446 = in.m_61.x;
        float _448 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].x;
        float _450 = _446 * (*spvDescriptorSet0.vp_c9)._m0[12].y;
        float _452 = fma(_450, (*spvDescriptorSet0.vp_c9)._m0[11].x, _166);
        float _454 = _452 * _448;
        float _456 = floor(_454);
        float _458 = -_456;
        float _460 = _454 + _458;
        _462 = _460;
        _464 = true;
    }
    else
    {
        float _466 = float(_132);
        float _468 = 1.0 / _466;
        float _470 = _166 * _468;
        _462 = _470;
    }
    _464 = false;
    float _472 = _462;
    float _474 = in.m_63.x;
    float _476 = in.m_63.y;
    float _478 = in.m_63.z;
    float _480 = -(*spvDescriptorSet0.vp_c9)._m0[109].w;
    float _482 = (*spvDescriptorSet0.vp_c9)._m0[110].w + _480;
    float _484 = -(*spvDescriptorSet0.vp_c9)._m0[110].w;
    float _486 = _484 + (*spvDescriptorSet0.vp_c9)._m0[111].w;
    float _488 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _490 = (*spvDescriptorSet0.vp_c9)._m0[108].w + _488;
    float _492 = -(*spvDescriptorSet0.vp_c9)._m0[108].w;
    float _494 = _492 + (*spvDescriptorSet0.vp_c9)._m0[109].w;
    float _496 = 1.0 / _482;
    bool _498 = _472 >= (*spvDescriptorSet0.vp_c9)._m0[111].w;
    bool _500 = isnan(_472);
    bool _502 = _498 || _500;
    bool _504 = isnan((*spvDescriptorSet0.vp_c9)._m0[111].w);
    bool _506 = _502 || _504;
    float _508 = float(_506);
    float _510 = 1.0 / _490;
    bool _512 = _472 >= (*spvDescriptorSet0.vp_c9)._m0[109].w;
    bool _514 = isnan(_472);
    bool _516 = _512 || _514;
    bool _518 = isnan((*spvDescriptorSet0.vp_c9)._m0[109].w);
    bool _520 = _516 || _518;
    float _522 = float(_520);
    bool _524 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _526 = _442 * _478;
    float _528 = _440 * _476;
    float _530 = 1.0 / _494;
    float _532 = -(*spvDescriptorSet0.vp_c9)._m0[109].w;
    float _534 = _472 + _532;
    float _536 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _538 = _472 + _536;
    float _540 = -(*spvDescriptorSet0.vp_c9)._m0[108].w;
    float _542 = _472 + _540;
    float _544 = -(*spvDescriptorSet0.vp_c9)._m0[110].w;
    float _546 = _472 + _544;
    float _548 = _534 * _496;
    float _550 = 1.0 / _486;
    bool _552 = _472 >= (*spvDescriptorSet0.vp_c9)._m0[110].w;
    bool _554 = isnan(_472);
    bool _556 = _552 || _554;
    bool _558 = isnan((*spvDescriptorSet0.vp_c9)._m0[110].w);
    bool _560 = _556 || _558;
    float _562 = float(_560);
    float _564 = _538 * _510;
    float _566 = -(*spvDescriptorSet0.vp_c9)._m0[107].x;
    float _568 = (*spvDescriptorSet0.vp_c9)._m0[108].x + _566;
    float _570 = -_562;
    float _572 = _570 + 1.0;
    float _574 = fma(_568, _564, (*spvDescriptorSet0.vp_c9)._m0[107].x);
    float _576 = _542 * _530;
    float _578 = -(*spvDescriptorSet0.vp_c9)._m0[107].y;
    float _580 = (*spvDescriptorSet0.vp_c9)._m0[108].y + _578;
    float _582 = -(*spvDescriptorSet0.vp_c9)._m0[107].z;
    float _584 = (*spvDescriptorSet0.vp_c9)._m0[108].z + _582;
    float _586 = fma(_580, _564, (*spvDescriptorSet0.vp_c9)._m0[107].y);
    float _588 = fma(_584, _564, (*spvDescriptorSet0.vp_c9)._m0[107].z);
    float _590 = _522 * _572;
    float _592 = _546 * _550;
    float _594 = -_508;
    float _596 = _594 + 1.0;
    bool _598 = _472 >= (*spvDescriptorSet0.vp_c9)._m0[108].w;
    bool _600 = isnan(_472);
    bool _602 = _598 || _600;
    bool _604 = isnan((*spvDescriptorSet0.vp_c9)._m0[108].w);
    bool _606 = _602 || _604;
    float _608 = float(_606);
    float _610 = -_522;
    float _612 = _610 + 1.0;
    float _614 = -(*spvDescriptorSet0.vp_c9)._m0[108].y;
    float _616 = _614 + (*spvDescriptorSet0.vp_c9)._m0[109].y;
    float _618 = _562 * _596;
    bool _620 = _472 >= (*spvDescriptorSet0.vp_c9)._m0[107].w;
    bool _622 = isnan(_472);
    bool _624 = _620 || _622;
    bool _626 = isnan((*spvDescriptorSet0.vp_c9)._m0[107].w);
    bool _628 = _624 || _626;
    float _630 = float(_628);
    float _632 = -(*spvDescriptorSet0.vp_c9)._m0[108].x;
    float _634 = _632 + (*spvDescriptorSet0.vp_c9)._m0[109].x;
    float _636 = _608 * _612;
    float _638 = -_608;
    float _640 = _638 + 1.0;
    float _642 = -(*spvDescriptorSet0.vp_c9)._m0[108].z;
    float _644 = _642 + (*spvDescriptorSet0.vp_c9)._m0[109].z;
    float _646 = fma(_634, _576, (*spvDescriptorSet0.vp_c9)._m0[108].x);
    float _648 = fma(_616, _576, (*spvDescriptorSet0.vp_c9)._m0[108].y);
    float _650 = _630 * _640;
    float _652 = fma(_644, _576, (*spvDescriptorSet0.vp_c9)._m0[108].z);
    float _654 = -_630;
    float _656 = _654 + 1.0;
    float _658 = _574 * _650;
    float _660 = _586 * _650;
    float _662 = _588 * _650;
    float _664 = -(*spvDescriptorSet0.vp_c9)._m0[109].x;
    float _666 = (*spvDescriptorSet0.vp_c9)._m0[110].x + _664;
    float _668 = fma(_656, (*spvDescriptorSet0.vp_c9)._m0[107].x, _658);
    float _670 = fma(_656, (*spvDescriptorSet0.vp_c9)._m0[107].y, _660);
    float _672 = -(*spvDescriptorSet0.vp_c9)._m0[109].y;
    float _674 = (*spvDescriptorSet0.vp_c9)._m0[110].y + _672;
    float _676 = fma(_656, (*spvDescriptorSet0.vp_c9)._m0[107].z, _662);
    float _678 = -(*spvDescriptorSet0.vp_c9)._m0[109].z;
    float _680 = (*spvDescriptorSet0.vp_c9)._m0[110].z + _678;
    float _682 = fma(_646, _636, _668);
    float _684 = fma(_648, _636, _670);
    float _686 = fma(_666, _548, (*spvDescriptorSet0.vp_c9)._m0[109].x);
    float _688 = fma(_674, _548, (*spvDescriptorSet0.vp_c9)._m0[109].y);
    float _690 = fma(_652, _636, _676);
    float _692 = -(*spvDescriptorSet0.vp_c9)._m0[110].x;
    float _694 = _692 + (*spvDescriptorSet0.vp_c9)._m0[111].x;
    float _696 = -(*spvDescriptorSet0.vp_c9)._m0[110].y;
    float _698 = _696 + (*spvDescriptorSet0.vp_c9)._m0[111].y;
    float _700 = fma(_680, _548, (*spvDescriptorSet0.vp_c9)._m0[109].z);
    float _702 = -(*spvDescriptorSet0.vp_c9)._m0[110].z;
    float _704 = _702 + (*spvDescriptorSet0.vp_c9)._m0[111].z;
    float _706 = fma(_686, _590, _682);
    float _708 = fma(_694, _592, (*spvDescriptorSet0.vp_c9)._m0[110].x);
    float _710 = fma(_698, _592, (*spvDescriptorSet0.vp_c9)._m0[110].y);
    float _712 = fma(_688, _590, _684);
    float _714 = fma(_704, _592, (*spvDescriptorSet0.vp_c9)._m0[110].z);
    float _716 = fma(_700, _590, _690);
    float _718 = fma(_708, _618, _706);
    float _720 = fma(_710, _618, _712);
    float _722 = _438 * _474;
    float _724 = fma(_714, _618, _716);
    float _726 = fma(_508, (*spvDescriptorSet0.vp_c9)._m0[111].x, _718);
    float _728 = fma(_508, (*spvDescriptorSet0.vp_c9)._m0[111].y, _720);
    float _730 = fma(_508, (*spvDescriptorSet0.vp_c9)._m0[111].z, _724);
    bool _732 = !_524;
    float _750;
    if (!_732)
    {
        float _734 = in.m_61.x;
        float _736 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _738 = _734 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _740 = fma(_738, (*spvDescriptorSet0.vp_c9)._m0[11].y, _166);
        float _742 = _740 * _736;
        float _744 = floor(_742);
        float _746 = -_744;
        float _748 = _742 + _746;
        _750 = _748;
        _752 = true;
    }
    else
    {
        float _754 = float(_132);
        float _756 = 1.0 / _754;
        float _758 = _166 * _756;
        _750 = _758;
    }
    _752 = false;
    float _760 = _750;
    float _762 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _764 = _760 + _762;
    float _766 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _768 = _766 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _770 = _760 >= (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _772 = isnan(_760);
    bool _774 = _770 || _772;
    bool _776 = isnan((*spvDescriptorSet0.vp_c9)._m0[117].w);
    bool _778 = _774 || _776;
    float _780 = float(_778);
    float _782 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _784 = _782 + (*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _786 = -(*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _788 = _786 + (*spvDescriptorSet0.vp_c9)._m0[118].w;
    bool _790 = _760 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _792 = isnan(_760);
    bool _794 = _790 || _792;
    bool _796 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _798 = _794 || _796;
    float _800 = float(_798);
    float _802 = 1.0 / _768;
    float _804 = -_780;
    float _806 = _804 + 1.0;
    float _808 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _810 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _808;
    bool _812 = _760 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _814 = isnan(_760);
    bool _816 = _812 || _814;
    bool _818 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _820 = _816 || _818;
    float _822 = float(_820);
    float _824 = _800 * _806;
    float _826 = -_800;
    float _828 = _826 + 1.0;
    bool _830 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].z;
    float _832 = 1.0 / _784;
    float _834 = _822 * _828;
    float _836 = -_822;
    float _838 = _836 + 1.0;
    float _840 = 1.0 / _788;
    float _842 = _810 * _802;
    float _844 = -(*spvDescriptorSet0.vp_c9)._m0[116].x;
    float _846 = _844 + (*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _848 = fma(_842, _764, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _850 = _846 * _832;
    bool _852 = _760 >= (*spvDescriptorSet0.vp_c9)._m0[118].w;
    bool _854 = isnan(_760);
    bool _856 = _852 || _854;
    bool _858 = isnan((*spvDescriptorSet0.vp_c9)._m0[118].w);
    bool _860 = _856 || _858;
    float _862 = float(_860);
    float _864 = -(*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _866 = (*spvDescriptorSet0.vp_c9)._m0[118].x + _864;
    float _868 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _870 = _760 + _868;
    float _872 = _848 * _834;
    float _874 = -(*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _876 = _760 + _874;
    float _878 = -_862;
    float _880 = _878 + 1.0;
    float _882 = fma(_850, _870, (*spvDescriptorSet0.vp_c9)._m0[116].x);
    float _884 = _866 * _840;
    float _886 = fma(_838, (*spvDescriptorSet0.vp_c9)._m0[115].x, _872);
    float _888 = _780 * _880;
    float _890 = _726 * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _892 = fma(_884, _876, (*spvDescriptorSet0.vp_c9)._m0[117].x);
    float _894 = fma(_882, _824, _886);
    float _896 = _730 * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _898 = _890 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _900 = fma(_892, _888, _894);
    float _902 = _728 * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _904 = _896 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _906 = fma(_862, (*spvDescriptorSet0.vp_c9)._m0[118].x, _900);
    float _908 = _902 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _910 = _906 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    out.m_65.x = _898;
    out.m_65.y = _908;
    out.m_65.z = _904;
    out.m_65.w = _910;
    bool _912 = !_830;
    float _930;
    if (!_912)
    {
        float _914 = in.m_61.x;
        float _916 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].z;
        float _918 = _914 * (*spvDescriptorSet0.vp_c9)._m0[12].w;
        float _920 = fma(_918, (*spvDescriptorSet0.vp_c9)._m0[11].z, _166);
        float _922 = _920 * _916;
        float _924 = floor(_922);
        float _926 = -_924;
        float _928 = _922 + _926;
        _930 = _928;
        _932 = true;
    }
    else
    {
        float _934 = float(_132);
        float _936 = 1.0 / _934;
        float _938 = _166 * _936;
        _930 = _938;
    }
    _932 = false;
    float _940 = _930;
    float _942 = -(*spvDescriptorSet0.vp_c9)._m0[123].w;
    float _944 = _940 + _942;
    bool _946 = _940 >= (*spvDescriptorSet0.vp_c9)._m0[125].w;
    bool _948 = isnan(_940);
    bool _950 = _946 || _948;
    bool _952 = isnan((*spvDescriptorSet0.vp_c9)._m0[125].w);
    bool _954 = _950 || _952;
    float _956 = float(_954);
    float _958 = -(*spvDescriptorSet0.vp_c9)._m0[124].w;
    float _960 = _940 + _958;
    bool _962 = _940 >= (*spvDescriptorSet0.vp_c9)._m0[123].w;
    bool _964 = isnan(_940);
    bool _966 = _962 || _964;
    bool _968 = isnan((*spvDescriptorSet0.vp_c9)._m0[123].w);
    bool _970 = _966 || _968;
    float _972 = float(_970);
    float _974 = -(*spvDescriptorSet0.vp_c9)._m0[123].w;
    float _976 = (*spvDescriptorSet0.vp_c9)._m0[124].w + _974;
    float _978 = -(*spvDescriptorSet0.vp_c9)._m0[124].w;
    float _980 = _978 + (*spvDescriptorSet0.vp_c9)._m0[125].w;
    bool _982 = _940 >= (*spvDescriptorSet0.vp_c9)._m0[124].w;
    bool _984 = isnan(_940);
    bool _986 = _982 || _984;
    bool _988 = isnan((*spvDescriptorSet0.vp_c9)._m0[124].w);
    bool _990 = _986 || _988;
    float _992 = float(_990);
    float _994 = -_956;
    float _996 = _994 + 1.0;
    float _998 = 1.0 / _976;
    float _1000 = _992 * _996;
    float _1002 = -_992;
    float _1004 = _1002 + 1.0;
    float _1006 = -(*spvDescriptorSet0.vp_c9)._m0[123].x;
    float _1008 = (*spvDescriptorSet0.vp_c9)._m0[124].x + _1006;
    bool _1010 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].w;
    float _1012 = 1.0 / _980;
    float _1014 = _972 * _1004;
    float _1016 = -_972;
    float _1018 = _1016 + 1.0;
    float _1020 = _944 * _998;
    float _1022 = -(*spvDescriptorSet0.vp_c9)._m0[123].y;
    float _1024 = (*spvDescriptorSet0.vp_c9)._m0[124].y + _1022;
    float _1026 = -(*spvDescriptorSet0.vp_c9)._m0[123].z;
    float _1028 = (*spvDescriptorSet0.vp_c9)._m0[124].z + _1026;
    float _1030 = fma(_1008, _1020, (*spvDescriptorSet0.vp_c9)._m0[123].x);
    float _1032 = fma(_1024, _1020, (*spvDescriptorSet0.vp_c9)._m0[123].y);
    float _1034 = fma(_1028, _1020, (*spvDescriptorSet0.vp_c9)._m0[123].z);
    float _1036 = _960 * _1012;
    float _1038 = _1030 * _1014;
    float _1040 = _1032 * _1014;
    float _1042 = _1034 * _1014;
    float _1044 = -(*spvDescriptorSet0.vp_c9)._m0[124].x;
    float _1046 = _1044 + (*spvDescriptorSet0.vp_c9)._m0[125].x;
    float _1048 = -(*spvDescriptorSet0.vp_c9)._m0[124].y;
    float _1050 = _1048 + (*spvDescriptorSet0.vp_c9)._m0[125].y;
    float _1052 = -(*spvDescriptorSet0.vp_c9)._m0[124].z;
    float _1054 = _1052 + (*spvDescriptorSet0.vp_c9)._m0[125].z;
    float _1056 = fma(_1018, (*spvDescriptorSet0.vp_c9)._m0[123].x, _1038);
    float _1058 = fma(_1046, _1036, (*spvDescriptorSet0.vp_c9)._m0[124].x);
    float _1060 = fma(_1050, _1036, (*spvDescriptorSet0.vp_c9)._m0[124].y);
    float _1062 = fma(_1054, _1036, (*spvDescriptorSet0.vp_c9)._m0[124].z);
    float _1064 = fma(_1018, (*spvDescriptorSet0.vp_c9)._m0[123].y, _1040);
    float _1066 = fma(_1018, (*spvDescriptorSet0.vp_c9)._m0[123].z, _1042);
    float _1068 = fma(_1058, _1000, _1056);
    float _1070 = fma(_1060, _1000, _1064);
    float _1072 = fma(_1062, _1000, _1066);
    float _1074 = fma(_956, (*spvDescriptorSet0.vp_c9)._m0[125].x, _1068);
    float _1076 = fma(_956, (*spvDescriptorSet0.vp_c9)._m0[125].y, _1070);
    float _1078 = fma(_956, (*spvDescriptorSet0.vp_c9)._m0[125].z, _1072);
    bool _1080 = !_1010;
    float _1098;
    if (!_1080)
    {
        float _1082 = in.m_61.x;
        float _1084 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].w;
        float _1086 = _1082 * (*spvDescriptorSet0.vp_c9)._m0[13].x;
        float _1088 = fma(_1086, (*spvDescriptorSet0.vp_c9)._m0[11].w, _166);
        float _1090 = _1088 * _1084;
        float _1092 = floor(_1090);
        float _1094 = -_1092;
        float _1096 = _1090 + _1094;
        _1098 = _1096;
        _1100 = true;
    }
    else
    {
        float _1102 = float(_132);
        float _1104 = 1.0 / _1102;
        float _1106 = _166 * _1104;
        _1098 = _1106;
    }
    _1100 = false;
    float _1108 = _1098;
    bool _1110 = _1108 >= (*spvDescriptorSet0.vp_c9)._m0[132].w;
    bool _1112 = isnan(_1108);
    bool _1114 = _1110 || _1112;
    bool _1116 = isnan((*spvDescriptorSet0.vp_c9)._m0[132].w);
    bool _1118 = _1114 || _1116;
    float _1120 = float(_1118);
    float _1122 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _1124 = _1122 + (*spvDescriptorSet0.vp_c9)._m0[132].w;
    bool _1126 = _1108 >= (*spvDescriptorSet0.vp_c9)._m0[131].w;
    bool _1128 = isnan(_1108);
    bool _1130 = _1126 || _1128;
    bool _1132 = isnan((*spvDescriptorSet0.vp_c9)._m0[131].w);
    bool _1134 = _1130 || _1132;
    float _1136 = float(_1134);
    float _1138 = -(*spvDescriptorSet0.vp_c9)._m0[131].x;
    float _1140 = (*spvDescriptorSet0.vp_c9)._m0[132].x + _1138;
    float _1142 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _1144 = _1108 + _1142;
    float _1146 = -_1120;
    float _1148 = _1146 + 1.0;
    bool _1150 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[14].x;
    float _1152 = 1.0 / _1124;
    float _1154 = _1136 * _1148;
    float _1156 = -_1136;
    float _1158 = _1156 + 1.0;
    float _1160 = _1140 * _1152;
    float _1162 = _1078 * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _1164 = fma(_1160, _1144, (*spvDescriptorSet0.vp_c9)._m0[131].x);
    float _1166 = _1076 * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _1168 = _1162 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1170 = _1164 * _1154;
    float _1172 = _1074 * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _1174 = _1166 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1176 = fma(_1158, (*spvDescriptorSet0.vp_c9)._m0[131].x, _1170);
    float _1178 = _1172 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1180 = fma(_1120, (*spvDescriptorSet0.vp_c9)._m0[132].x, _1176);
    float _1182 = _1180 * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    out.m_67.x = _1178;
    out.m_67.y = _1174;
    out.m_67.z = _1168;
    out.m_67.w = _1182;
    bool _1184 = !_1150;
    float _1202;
    if (!_1184)
    {
        float _1186 = in.m_61.x;
        float _1188 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[14].x;
        float _1190 = _1186 * (*spvDescriptorSet0.vp_c9)._m0[15].x;
        float _1192 = fma(_1190, (*spvDescriptorSet0.vp_c9)._m0[14].x, _166);
        float _1194 = _1192 * _1188;
        float _1196 = floor(_1194);
        float _1198 = -_1196;
        float _1200 = _1194 + _1198;
        _1202 = _1200;
        _1204 = true;
    }
    else
    {
        float _1206 = float(_132);
        float _1208 = 1.0 / _1206;
        float _1210 = _166 * _1208;
        _1202 = _1210;
    }
    _1204 = false;
    float _1212 = _1202;
    float _1214 = -(*spvDescriptorSet0.vp_c9)._m0[159].w;
    float _1216 = (*spvDescriptorSet0.vp_c9)._m0[160].w + _1214;
    float _1218 = -(*spvDescriptorSet0.vp_c9)._m0[160].w;
    float _1220 = _1218 + (*spvDescriptorSet0.vp_c9)._m0[161].w;
    float _1222 = -(*spvDescriptorSet0.vp_c9)._m0[161].w;
    float _1224 = (*spvDescriptorSet0.vp_c9)._m0[162].w + _1222;
    float _1226 = 1.0 / _1216;
    float _1228 = -(*spvDescriptorSet0.vp_c9)._m0[165].w;
    float _1230 = (*spvDescriptorSet0.vp_c9)._m0[166].w + _1228;
    float _1232 = -(*spvDescriptorSet0.vp_c9)._m0[162].w;
    float _1234 = _1232 + (*spvDescriptorSet0.vp_c9)._m0[163].w;
    float _1236 = -(*spvDescriptorSet0.vp_c9)._m0[163].w;
    float _1238 = (*spvDescriptorSet0.vp_c9)._m0[164].w + _1236;
    float _1240 = -(*spvDescriptorSet0.vp_c9)._m0[164].w;
    float _1242 = _1240 + (*spvDescriptorSet0.vp_c9)._m0[165].w;
    float _1244 = 1.0 / _1224;
    float _1246 = -(*spvDescriptorSet0.vp_c9)._m0[159].w;
    float _1248 = _1212 + _1246;
    bool _1250 = _1212 >= (*spvDescriptorSet0.vp_c9)._m0[161].w;
    bool _1252 = isnan(_1212);
    bool _1254 = _1250 || _1252;
    bool _1256 = isnan((*spvDescriptorSet0.vp_c9)._m0[161].w);
    bool _1258 = _1254 || _1256;
    float _1260 = float(_1258);
    bool _1262 = _1212 >= (*spvDescriptorSet0.vp_c9)._m0[159].w;
    bool _1264 = isnan(_1212);
    bool _1266 = _1262 || _1264;
    bool _1268 = isnan((*spvDescriptorSet0.vp_c9)._m0[159].w);
    bool _1270 = _1266 || _1268;
    float _1272 = float(_1270);
    float _1274 = 1.0 / _1220;
    float _1276 = _1248 * _1226;
    float _1278 = -(*spvDescriptorSet0.vp_c9)._m0[160].w;
    float _1280 = _1212 + _1278;
    float _1282 = -(*spvDescriptorSet0.vp_c9)._m0[162].w;
    float _1284 = _1212 + _1282;
    float _1286 = -(*spvDescriptorSet0.vp_c9)._m0[163].w;
    float _1288 = _1212 + _1286;
    float _1290 = 1.0 / _1230;
    float _1292 = -(*spvDescriptorSet0.vp_c9)._m0[161].w;
    float _1294 = _1212 + _1292;
    bool _1296 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[14].y;
    float _1298 = _1294 * _1244;
    float _1300 = -(*spvDescriptorSet0.vp_c9)._m0[165].w;
    float _1302 = _1212 + _1300;
    float _1304 = 1.0 / _1234;
    float _1306 = _1280 * _1274;
    bool _1308 = _1212 >= (*spvDescriptorSet0.vp_c9)._m0[166].w;
    bool _1310 = isnan(_1212);
    bool _1312 = _1308 || _1310;
    bool _1314 = isnan((*spvDescriptorSet0.vp_c9)._m0[166].w);
    bool _1316 = _1312 || _1314;
    float _1318 = float(_1316);
    float _1320 = 1.0 / _1238;
    float _1322 = -(*spvDescriptorSet0.vp_c9)._m0[164].w;
    float _1324 = _1212 + _1322;
    float _1326 = _1302 * _1290;
    bool _1328 = _1212 >= (*spvDescriptorSet0.vp_c9)._m0[165].w;
    bool _1330 = isnan(_1212);
    bool _1332 = _1328 || _1330;
    bool _1334 = isnan((*spvDescriptorSet0.vp_c9)._m0[165].w);
    bool _1336 = _1332 || _1334;
    float _1338 = float(_1336);
    float _1340 = 1.0 / _1242;
    float _1342 = -(*spvDescriptorSet0.vp_c9)._m0[159].y;
    float _1344 = (*spvDescriptorSet0.vp_c9)._m0[160].y + _1342;
    float _1346 = _1284 * _1304;
    float _1348 = -(*spvDescriptorSet0.vp_c9)._m0[159].x;
    float _1350 = (*spvDescriptorSet0.vp_c9)._m0[160].x + _1348;
    float _1352 = -_1318;
    float _1354 = _1352 + 1.0;
    float _1356 = fma(_1350, _1276, (*spvDescriptorSet0.vp_c9)._m0[159].x);
    float _1358 = _1288 * _1320;
    float _1360 = -(*spvDescriptorSet0.vp_c9)._m0[159].z;
    float _1362 = (*spvDescriptorSet0.vp_c9)._m0[160].z + _1360;
    float _1364 = fma(_1344, _1276, (*spvDescriptorSet0.vp_c9)._m0[159].y);
    float _1366 = -(*spvDescriptorSet0.vp_c9)._m0[160].x;
    float _1368 = _1366 + (*spvDescriptorSet0.vp_c9)._m0[161].x;
    float _1370 = _1338 * _1354;
    float _1372 = fma(_1362, _1276, (*spvDescriptorSet0.vp_c9)._m0[159].z);
    float _1374 = -(*spvDescriptorSet0.vp_c9)._m0[160].y;
    float _1376 = _1374 + (*spvDescriptorSet0.vp_c9)._m0[161].y;
    float _1378 = -(*spvDescriptorSet0.vp_c9)._m0[160].z;
    float _1380 = _1378 + (*spvDescriptorSet0.vp_c9)._m0[161].z;
    float _1382 = _1324 * _1340;
    bool _1384 = _1212 >= (*spvDescriptorSet0.vp_c9)._m0[164].w;
    bool _1386 = isnan(_1212);
    bool _1388 = _1384 || _1386;
    bool _1390 = isnan((*spvDescriptorSet0.vp_c9)._m0[164].w);
    bool _1392 = _1388 || _1390;
    float _1394 = float(_1392);
    float _1396 = -_1338;
    float _1398 = _1396 + 1.0;
    float _1400 = fma(_1368, _1306, (*spvDescriptorSet0.vp_c9)._m0[160].x);
    float _1402 = fma(_1376, _1306, (*spvDescriptorSet0.vp_c9)._m0[160].y);
    float _1404 = fma(_1380, _1306, (*spvDescriptorSet0.vp_c9)._m0[160].z);
    float _1406 = _1394 * _1398;
    float _1408 = -_1394;
    float _1410 = _1408 + 1.0;
    bool _1412 = _1212 >= (*spvDescriptorSet0.vp_c9)._m0[162].w;
    bool _1414 = isnan(_1212);
    bool _1416 = _1412 || _1414;
    bool _1418 = isnan((*spvDescriptorSet0.vp_c9)._m0[162].w);
    bool _1420 = _1416 || _1418;
    float _1422 = float(_1420);
    float _1424 = -(*spvDescriptorSet0.vp_c9)._m0[161].z;
    float _1426 = (*spvDescriptorSet0.vp_c9)._m0[162].z + _1424;
    bool _1428 = _1212 >= (*spvDescriptorSet0.vp_c9)._m0[163].w;
    bool _1430 = isnan(_1212);
    bool _1432 = _1428 || _1430;
    bool _1434 = isnan((*spvDescriptorSet0.vp_c9)._m0[163].w);
    bool _1436 = _1432 || _1434;
    float _1438 = float(_1436);
    bool _1440 = _1212 >= (*spvDescriptorSet0.vp_c9)._m0[160].w;
    bool _1442 = isnan(_1212);
    bool _1444 = _1440 || _1442;
    bool _1446 = isnan((*spvDescriptorSet0.vp_c9)._m0[160].w);
    bool _1448 = _1444 || _1446;
    float _1450 = float(_1448);
    float _1452 = -_1422;
    float _1454 = _1452 + 1.0;
    float _1456 = -(*spvDescriptorSet0.vp_c9)._m0[162].x;
    float _1458 = _1456 + (*spvDescriptorSet0.vp_c9)._m0[163].x;
    float _1460 = -_1438;
    float _1462 = _1460 + 1.0;
    float _1464 = _1438 * _1410;
    float _1466 = _1260 * _1454;
    float _1468 = -_1260;
    float _1470 = _1468 + 1.0;
    float _1472 = -_1450;
    float _1474 = _1472 + 1.0;
    float _1476 = _1422 * _1462;
    float _1478 = -(*spvDescriptorSet0.vp_c9)._m0[161].y;
    float _1480 = (*spvDescriptorSet0.vp_c9)._m0[162].y + _1478;
    float _1482 = _1450 * _1470;
    float _1484 = -(*spvDescriptorSet0.vp_c9)._m0[162].y;
    float _1486 = _1484 + (*spvDescriptorSet0.vp_c9)._m0[163].y;
    float _1488 = _1272 * _1474;
    float _1490 = -(*spvDescriptorSet0.vp_c9)._m0[161].x;
    float _1492 = (*spvDescriptorSet0.vp_c9)._m0[162].x + _1490;
    float _1494 = -_1272;
    float _1496 = _1494 + 1.0;
    float _1498 = -(*spvDescriptorSet0.vp_c9)._m0[162].z;
    float _1500 = _1498 + (*spvDescriptorSet0.vp_c9)._m0[163].z;
    float _1502 = _1356 * _1488;
    float _1504 = _1364 * _1488;
    float _1506 = _1372 * _1488;
    float _1508 = fma(_1492, _1298, (*spvDescriptorSet0.vp_c9)._m0[161].x);
    float _1510 = fma(_1496, (*spvDescriptorSet0.vp_c9)._m0[159].x, _1502);
    float _1512 = fma(_1496, (*spvDescriptorSet0.vp_c9)._m0[159].y, _1504);
    float _1514 = fma(_1496, (*spvDescriptorSet0.vp_c9)._m0[159].z, _1506);
    float _1516 = fma(_1480, _1298, (*spvDescriptorSet0.vp_c9)._m0[161].y);
    float _1518 = fma(_1426, _1298, (*spvDescriptorSet0.vp_c9)._m0[161].z);
    float _1520 = fma(_1458, _1346, (*spvDescriptorSet0.vp_c9)._m0[162].x);
    float _1522 = fma(_1486, _1346, (*spvDescriptorSet0.vp_c9)._m0[162].y);
    float _1524 = fma(_1500, _1346, (*spvDescriptorSet0.vp_c9)._m0[162].z);
    float _1526 = fma(_1400, _1482, _1510);
    float _1528 = fma(_1402, _1482, _1512);
    float _1530 = fma(_1404, _1482, _1514);
    float _1532 = -(*spvDescriptorSet0.vp_c9)._m0[163].x;
    float _1534 = (*spvDescriptorSet0.vp_c9)._m0[164].x + _1532;
    float _1536 = -(*spvDescriptorSet0.vp_c9)._m0[163].z;
    float _1538 = (*spvDescriptorSet0.vp_c9)._m0[164].z + _1536;
    float _1540 = -(*spvDescriptorSet0.vp_c9)._m0[163].y;
    float _1542 = (*spvDescriptorSet0.vp_c9)._m0[164].y + _1540;
    float _1544 = fma(_1508, _1466, _1526);
    float _1546 = fma(_1516, _1466, _1528);
    float _1548 = fma(_1518, _1466, _1530);
    float _1550 = fma(_1534, _1358, (*spvDescriptorSet0.vp_c9)._m0[163].x);
    float _1552 = fma(_1542, _1358, (*spvDescriptorSet0.vp_c9)._m0[163].y);
    float _1554 = fma(_1538, _1358, (*spvDescriptorSet0.vp_c9)._m0[163].z);
    float _1556 = fma(_1520, _1476, _1544);
    float _1558 = fma(_1522, _1476, _1546);
    float _1560 = fma(_1524, _1476, _1548);
    float _1562 = -(*spvDescriptorSet0.vp_c9)._m0[164].x;
    float _1564 = _1562 + (*spvDescriptorSet0.vp_c9)._m0[165].x;
    float _1566 = -(*spvDescriptorSet0.vp_c9)._m0[164].y;
    float _1568 = _1566 + (*spvDescriptorSet0.vp_c9)._m0[165].y;
    float _1570 = -(*spvDescriptorSet0.vp_c9)._m0[164].z;
    float _1572 = _1570 + (*spvDescriptorSet0.vp_c9)._m0[165].z;
    float _1574 = fma(_1550, _1464, _1556);
    float _1576 = fma(_1564, _1382, (*spvDescriptorSet0.vp_c9)._m0[164].x);
    float _1578 = fma(_1568, _1382, (*spvDescriptorSet0.vp_c9)._m0[164].y);
    float _1580 = fma(_1552, _1464, _1558);
    float _1582 = -(*spvDescriptorSet0.vp_c9)._m0[165].x;
    float _1584 = (*spvDescriptorSet0.vp_c9)._m0[166].x + _1582;
    float _1586 = -(*spvDescriptorSet0.vp_c9)._m0[165].y;
    float _1588 = (*spvDescriptorSet0.vp_c9)._m0[166].y + _1586;
    float _1590 = fma(_1572, _1382, (*spvDescriptorSet0.vp_c9)._m0[164].z);
    float _1592 = -(*spvDescriptorSet0.vp_c9)._m0[165].z;
    float _1594 = (*spvDescriptorSet0.vp_c9)._m0[166].z + _1592;
    float _1596 = fma(_1554, _1464, _1560);
    float _1598 = fma(_1584, _1326, (*spvDescriptorSet0.vp_c9)._m0[165].x);
    float _1600 = fma(_1588, _1326, (*spvDescriptorSet0.vp_c9)._m0[165].y);
    float _1602 = fma(_1578, _1406, _1580);
    float _1604 = fma(_1594, _1326, (*spvDescriptorSet0.vp_c9)._m0[165].z);
    float _1606 = fma(_1576, _1406, _1574);
    float _1608 = fma(_1590, _1406, _1596);
    float _1610 = fma(_1600, _1370, _1602);
    float _1612 = fma(_1598, _1370, _1606);
    float _1614 = fma(_1604, _1370, _1608);
    float _1616 = fma(_1318, (*spvDescriptorSet0.vp_c9)._m0[166].y, _1610);
    float _1618 = fma(_1318, (*spvDescriptorSet0.vp_c9)._m0[166].x, _1612);
    float _1620 = fma(_1318, (*spvDescriptorSet0.vp_c9)._m0[166].z, _1614);
    out.m_69.x = _1618;
    out.m_69.y = _1616;
    out.m_69.z = _1620;
    bool _1622 = !_1296;
    int _1624 = as_type<int>(_1516);
    float _1626 = _1620;
    float _1628 = _1606;
    float _1630 = _1618;
    float _1648;
    if (!_1622)
    {
        float _1632 = in.m_61.x;
        float _1634 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[14].y;
        float _1636 = _1632 * (*spvDescriptorSet0.vp_c9)._m0[15].y;
        float _1638 = fma(_1636, (*spvDescriptorSet0.vp_c9)._m0[14].y, _166);
        float _1640 = _1638 * _1634;
        float _1642 = floor(_1640);
        float _1644 = -_1642;
        float _1646 = _1640 + _1644;
        _1648 = _1646;
        _1650 = true;
    }
    else
    {
        float _1652 = float(_132);
        float _1654 = 1.0 / _1652;
        float _1656 = _166 * _1654;
        _1648 = _1656;
    }
    _1650 = false;
    float _1658 = _1648;
    float _1660 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].y);
    int _1662 = int(_1660);
    float _1664 = in.m_61.y;
    int _1666 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _1668 = _1666 != 0;
    float _1670 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].x);
    int _1672 = int(_1670);
    float _1674 = float(_1662);
    float _1676 = trunc((*spvDescriptorSet0.vp_c9)._m0[31].y);
    int _1678 = int(_1676);
    float _1680 = _1602;
    if (_1668)
    {
        float _1682 = in.m_61.x;
        _1680 = _1682;
    }
    float _1684 = _1680;
    if (_1668)
    {
        _1624 = 0;
    }
    int _1686 = _1624;
    float _1688 = float(uint(_1672));
    float _1690 = 1.0 / _1674;
    int _1692 = _1686;
    if (_1668)
    {
        _1626 = _1664;
    }
    float _1694 = _1626;
    float _1696 = 1.0 / _1688;
    float _1698 = float(_1678);
    float _1700 = _1690 * _166;
    float _1702 = trunc((*spvDescriptorSet0.vp_c9)._m0[31].x);
    int _1704 = int(_1702);
    float _1706 = _1698;
    float _1708 = _1684;
    float _1710 = _1694;
    if (_1668)
    {
        _1628 = _1684;
    }
    float _1712 = _1628;
    float _1714 = _1712;
    if (_1668)
    {
        _1630 = _1712;
    }
    float _1716 = _1630;
    int _1718 = as_type<int>(_1696) + (-2);
    float _1720 = trunc(_1700);
    int _1722 = int(_1720);
    int _1724 = ~_1672;
    int _1726 = _1724 + 1;
    float _1728 = 1.0 / _1698;
    float _1730 = float(uint(_1704));
    float _1732 = float(uint(_1722));
    float _1734 = 1.0 / _1730;
    float _1736 = _1716;
    if (_1668)
    {
        _1706 = 1.0;
    }
    float _1738 = _1706;
    float _1740 = as_type<float>(_1718) * _1732;
    float _1742 = _1728 * _166;
    float _1744 = trunc(_1740);
    float _1746 = precise::max(_1744, 0.0);
    uint _1749 = uint(_1746);
    float _1751 = _1728;
    float _1753 = _1738;
    if (_1668)
    {
        _1751 = 1.0;
    }
    float _1755 = _1751;
    float _1757 = trunc(_1742);
    int _1759 = int(_1757);
    int _1761 = as_type<int>(_1734) + (-2);
    int _1763 = _1726 * int(_1749);
    int _1765 = _1763 + _1722;
    float _1767 = float(uint(_1765));
    float _1769 = float(uint(_1759));
    float _1771 = as_type<float>(_1718) * _1767;
    float _1773 = trunc(_1771);
    float _1775 = precise::max(_1773, 0.0);
    uint _1777 = uint(_1775);
    float _1779 = _1755;
    if (!_1668)
    {
        float _1781 = in.m_61.x;
        float _1783 = _1664 * 3.1415927410125732421875;
        float _1785 = _1783 * 0.15915493667125701904296875;
        float _1787 = _1785 * 6.283185482025146484375;
        float _1789 = sin(_1787);
        float _1791 = _1781 * 3.1415927410125732421875;
        float _1793 = _1791 * 0.15915493667125701904296875;
        float _1795 = _1793 * 6.283185482025146484375;
        float _1797 = sin(_1795);
        _1753 = 7.345489978790283203125;
        _1708 = _1781;
        _1736 = _1664;
        _1779 = 1.2345600128173828125;
        _1692 = 2;
        _1714 = _1797;
        _1710 = _1789;
    }
    float _1799 = _1753;
    float _1801 = _1708;
    float _1803 = _1736;
    float _1805 = _1779;
    int _1807 = _1692;
    float _1809 = _1714;
    float _1811 = _1710;
    float _1813 = as_type<float>(_1761) * _1769;
    float _1815 = _1799 * _1801;
    int _1817 = ~_1672;
    int _1819 = _1817 + 1;
    float _1821 = in.m_71.w;
    float _1823 = trunc(_1813);
    float _1825 = precise::max(_1823, 0.0);
    uint _1827 = uint(_1825);
    int _1829 = int(_1749) + int(_1777);
    float _1831 = -(*spvDescriptorSet0.vp_c9)._m0[172].w;
    float _1833 = _1658 + _1831;
    int _1835 = ~_1704;
    int _1837 = _1835 + 1;
    float _1839 = -(*spvDescriptorSet0.vp_c9)._m0[173].w;
    float _1841 = _1658 + _1839;
    float _1843 = float(_132);
    int _1845 = _1819 * _1829;
    int _1847 = _1845 + _1722;
    float _1849 = float(_1672);
    float _1851 = floor(_1815);
    float _1853 = float(_1722);
    bool _1855 = _1853 >= _1849;
    bool _1857 = isnan(_1853);
    bool _1859 = _1855 || _1857;
    bool _1861 = isnan(_1849);
    bool _1863 = _1859 || _1861;
    float _1865 = float(_1863);
    bool _1867 = uint(_1847) >= uint(_1672);
    float _1869 = 1.0 / _1843;
    int _1871 = _1837 * int(_1827);
    int _1873 = _1871 + _1759;
    bool _1875 = _1672 == 0;
    bool _1877 = !_1867;
    int _1879 = _1877 ? 0 : (-1);
    float _1881 = float(uint(_1873));
    out.m_73.w = _1821;
    float _1883 = trunc(_1865);
    int _1885 = int(_1883);
    float _1887 = -_1851;
    float _1889 = _1815 + _1887;
    float _1891 = as_type<float>(_1761) * _1881;
    int _1893 = ~_1829;
    int _1895 = _1893 + _1879;
    int _1897 = _1895 + 1;
    float _1899 = _1849 * _1889;
    int _1901 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4096;
    bool _1903 = _1901 != 0;
    float _1905 = _1869 * _166;
    float _1907 = trunc(_1899);
    int _1909 = int(_1907);
    int _1911 = _1672 * _1897;
    int _1913 = _1911 + _1722;
    float _1915 = _1849 * _1905;
    int _1917 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 16;
    bool _1919 = _1917 != 0;
    int _1921 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 32;
    bool _1923 = _1921 != 0;
    bool _1925 = _1704 == 0;
    int _1927 = ~_1885;
    int _1929 = _1927 + 1;
    int _1931 = _1929 + 1;
    float _1933 = trunc(_1891);
    float _1935 = precise::max(_1933, 0.0);
    uint _1937 = uint(_1935);
    bool _1939 = !_1875;
    int _1941 = _1939 ? _1913 : (-1);
    bool _1943 = !_1903;
    int _1945 = _1943 ? 0 : 1;
    bool _1947 = !_1923;
    int _1949 = _1947 ? 0 : 1;
    int _1951 = _1941 * _1931;
    int _1953 = abs(_1945);
    float _1955 = trunc(_1915);
    int _1957 = int(_1955);
    int _1959 = _1672 + (-1);
    int _1961 = abs(_1949);
    float _1963 = _1803 * _1805;
    int _1965 = _1909 * _1953;
    int _1967 = _1965 + _1722;
    int _1969 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 64;
    bool _1971 = _1969 != 0;
    int _1973 = _1885 * _1959;
    int _1975 = _1973 + _1951;
    float _1977 = floor(_1963);
    bool _1979 = !_1919;
    int _1981 = _1979 ? 0 : 1;
    int _1983 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 128;
    bool _1985 = _1983 != 0;
    int _1987 = _1975 * _1961;
    int _1989 = int(_1827) + int(_1937);
    bool _1991 = !_1971;
    int _1993 = _1991 ? 0 : 1;
    float _1995 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].z;
    int _1997 = abs(_1981);
    int _1999 = ~_1704;
    int _2001 = _1999 + 1;
    bool _2003 = !_1985;
    int _2005 = _2003 ? 0 : 1;
    int _2007 = _1957 * _1997;
    int _2009 = _2007 + _1987;
    int _2011 = abs(_1993);
    int _2013 = _2001 * _1989;
    int _2015 = _2013 + _1759;
    float _2017 = float(_1704);
    float _2019 = -_1977;
    float _2021 = _1963 + _2019;
    float _2023 = float(_1759);
    int _2025 = _1967 * _2011;
    int _2027 = _2025 + _2009;
    int _2029 = abs(_2005);
    float _2031 = _2017 * _1905;
    bool _2033 = _2023 >= _2017;
    bool _2035 = isnan(_2023);
    bool _2037 = _2033 || _2035;
    bool _2039 = isnan(_2017);
    bool _2041 = _2037 || _2039;
    float _2043 = float(_2041);
    float _2045 = _2017 * _2021;
    float _2047 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].w;
    bool _2049 = uint(_2015) >= uint(_1704);
    int _2051 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _2053 = _2051 != 0;
    int _2055 = _1909 * _2029;
    int _2057 = _2055 + _2027;
    bool _2059 = !_2049;
    int _2061 = _2059 ? 0 : (-1);
    int _2063 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8192;
    bool _2065 = _2063 != 0;
    float _2067 = trunc(_2043);
    int _2069 = int(_2067);
    int _2071 = ~_1989;
    int _2073 = _2071 + _2061;
    int _2075 = _2073 + 1;
    float _2077 = float(uint(_2057));
    int _2079 = _1704 + (-1);
    int _2081 = _1704 * _2075;
    int _2083 = _2081 + _1759;
    int _2085 = ~_1672;
    int _2087 = _2085 + 1;
    float _2089 = as_type<float>(_1718) * _2077;
    float _2091 = trunc(_2045);
    int _2093 = int(_2091);
    float _2095 = as_type<float>(_2011);
    if (_2053)
    {
        float _2097 = in.m_61.x;
        _2095 = _2097;
    }
    float _2099 = _2095;
    bool _2101 = !_1925;
    int _2103 = _2101 ? _2083 : (-1);
    float _2105 = trunc(_2089);
    float _2107 = precise::max(_2105, 0.0);
    uint _2109 = uint(_2107);
    int _2111 = ~_2069;
    int _2113 = _2111 + 1;
    int _2115 = _2113 + 1;
    float _2117 = -(*spvDescriptorSet0.vp_c9)._m0[167].x;
    float _2119 = (*spvDescriptorSet0.vp_c9)._m0[168].x + _2117;
    float _2121 = -(*spvDescriptorSet0.vp_c9)._m0[168].x;
    float _2123 = _2121 + (*spvDescriptorSet0.vp_c9)._m0[169].x;
    int _2125 = _2103 * _2115;
    bool _2127 = !_2065;
    int _2129 = _2127 ? 0 : 1;
    float _2131 = trunc(_2031);
    int _2133 = int(_2131);
    int _2135 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 256;
    bool _2137 = _2135 != 0;
    int _2139 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 512;
    bool _2141 = _2139 != 0;
    int _2143 = _2069 * _2079;
    int _2145 = _2143 + _2125;
    int _2147 = abs(_2129);
    float _2149 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    bool _2151 = !_2141;
    int _2153 = _2151 ? 0 : 1;
    int _2155 = _2087 * int(_2109);
    int _2157 = _2155 + _2057;
    int _2159 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1024;
    bool _2161 = _2159 != 0;
    int _2163 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 2048;
    bool _2165 = _2163 != 0;
    float _2167 = (*spvDescriptorSet0.vp_c9)._m0[87].x + (*spvDescriptorSet0.vp_c9)._m0[86].z;
    bool _2169 = !_2137;
    int _2171 = _2169 ? 0 : 1;
    int _2173 = abs(_2153);
    float _2175 = float(uint(_2157));
    bool _2177 = !_2161;
    int _2179 = _2177 ? 0 : 1;
    float _2181 = as_type<float>(_1718) * _2175;
    int _2183 = abs(_2171);
    int _2185 = _2093 * _2147;
    int _2187 = _2185 + _1759;
    bool _2189 = !_2165;
    int _2191 = _2189 ? 0 : 1;
    float _2193 = trunc(_2181);
    float _2195 = precise::max(_2193, 0.0);
    uint _2197 = uint(_2195);
    int _2199 = abs(_2179);
    int _2201 = _2145 * _2173;
    int _2203 = abs(_2191);
    int _2205 = _2133 * _2183;
    int _2207 = _2205 + _2201;
    int _2209 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 16;
    bool _2211 = _2209 != 0;
    int _2213 = _2187 * _2199;
    int _2215 = _2213 + _2207;
    int _2217 = ~_1672;
    int _2219 = _2217 + 1;
    int _2221 = _2207;
    bool _2223 = _2137;
    int _2225 = int(_2109);
    float _2227 = as_type<float>(_2147);
    float _2229 = as_type<float>(_2219);
    if (_2053)
    {
        float _2231 = -_188;
        float _2233 = _2231 + 1.0;
        _2221 = as_type<int>(_2233);
    }
    int _2235 = _2221;
    if (_2053)
    {
        bool _2237 = _2099 > 0.5;
        _2223 = _2237;
    }
    bool _2239 = _2223;
    int _2241 = _2093 * _2203;
    int _2243 = _2241 + _2215;
    int _2245 = int(_2109) + int(_2197);
    float _2247 = -_192;
    float _2249 = _2247 + 1.0;
    float _2251 = in.m_61.z;
    bool _2253 = _1664 > 0.5;
    float _2255 = float(uint(_2243));
    if (_2211)
    {
        float _2257 = -_188;
        float _2259 = _2257 + 1.0;
        _2225 = as_type<int>(_2259);
    }
    int _2261 = _2225;
    int _2263 = ~_1704;
    int _2265 = _2263 + 1;
    float _2267 = as_type<float>(_1761) * _2255;
    int _2269 = _2219 * _2245;
    int _2271 = _2269 + _2057;
    if (!_2053)
    {
        _2227 = _188;
    }
    float _2273 = _2227;
    float _2275 = trunc(_2267);
    float _2277 = precise::max(_2275, 0.0);
    uint _2279 = uint(_2277);
    float _2281 = 0.0;
    float _2283 = _2273;
    if (!_2211)
    {
        _2281 = _188;
    }
    float _2285 = _2281;
    float _2287 = _2285;
    if (_2211)
    {
        float _2289 = _2253 ? as_type<float>(_2261) : _188;
        _2287 = _2289;
    }
    float _2291 = _2287;
    if (_2053)
    {
        float _2293 = _2239 ? as_type<float>(_2235) : _188;
        _2283 = _2293;
    }
    float _2295 = _2283;
    int _2297 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 64;
    bool _2299 = _2297 != 0;
    bool _2301 = uint(_2271) >= uint(_1672);
    float _2303 = in.m_48.x;
    float _2305 = in.m_48.y;
    float _2307 = in.m_48.z;
    bool _2309 = _1664 > 0.5;
    bool _2311 = _2309 && _2299;
    int _2313 = _2265 * int(_2279);
    int _2315 = _2313 + _2243;
    float _2317 = -(*spvDescriptorSet0.vp_c9)._m0[167].w;
    float _2319 = _2317 + (*spvDescriptorSet0.vp_c9)._m0[168].w;
    bool _2321 = _2251 > 0.5;
    if (!_2299)
    {
        _2229 = _188;
    }
    float _2323 = _2229;
    float _2325 = 1.0 / _2319;
    float _2327 = float(uint(_2315));
    int _2329 = _2321 ? as_type<int>(_2249) : as_type<int>(_192);
    bool _2331 = !_2301;
    int _2333 = _2331 ? 0 : (-1);
    float _2335 = as_type<float>(_1761) * _2327;
    float _2337 = _2323;
    if (_2311)
    {
        float _2339 = -_188;
        float _2341 = _2339 + 1.0;
        _220 = _2341;
    }
    float _2343 = _220;
    int _2345 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 32;
    bool _2347 = _2345 != 0;
    float _2349 = _1664 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    float _2351 = trunc(_2335);
    float _2353 = precise::max(_2351, 0.0);
    uint _2355 = uint(_2353);
    int _2357 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _2359 = _2357 != 0;
    float _2361 = -(*spvDescriptorSet0.vp_c9)._m0[168].w;
    float _2363 = _2361 + (*spvDescriptorSet0.vp_c9)._m0[169].w;
    float _2365 = _2347 ? as_type<float>(_2329) : _192;
    float _2367 = _2305 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    int _2369 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2097152;
    bool _2371 = _2369 != 0;
    float _2373 = _2119 * _2325;
    int _2375 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4194304;
    bool _2377 = _2375 != 0;
    float _2379 = 1.0 / _2363;
    int _2381 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 128;
    bool _2383 = _2381 != 0;
    float _2385 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    int _2387 = _2253 ? as_type<int>(_2249) : as_type<int>(_192);
    float _2389 = _2305 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _2391 = _2305 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    int _2393 = ~_2245;
    int _2395 = _2393 + _2333;
    int _2397 = _2395 + 1;
    float _2399 = fma(_2349, -2.0, _2385);
    float _2401 = float(uint(_1967));
    float _2403 = fma(_2303, (*spvDescriptorSet0.vp_c10)._m0[4].x, _2389);
    float _2405 = fma(_2303, (*spvDescriptorSet0.vp_c10)._m0[5].x, _2367);
    float _2407 = fma(_2303, (*spvDescriptorSet0.vp_c10)._m0[6].x, _2391);
    int _2409 = ~_1704;
    int _2411 = _2409 + 1;
    int _2413 = _1672 * _2397;
    int _2415 = _2413 + _2057;
    int _2417 = int(_2279) + int(_2355);
    float _2419 = as_type<float>(_1718) * _2401;
    bool _2421 = _1672 == 0;
    float _2423 = _2123 * _2379;
    if (_2299)
    {
        _2337 = _2343;
    }
    float _2425 = _2337;
    int _2427 = _2411 * _2417;
    int _2429 = _2427 + _2243;
    bool _2431 = !_2421;
    int _2433 = _2431 ? _2415 : (-1);
    float _2435 = trunc(_2419);
    float _2437 = precise::max(_2435, 0.0);
    uint _2439 = uint(_2437);
    float _2441 = _1801 * 2.0;
    bool _2443 = _1807 != 2;
    float _2445 = fma(_166, (*spvDescriptorSet0.vp_c9)._m0[76].y, _2399);
    float _2447 = fma(_2307, (*spvDescriptorSet0.vp_c10)._m0[5].z, _2405);
    float _2449 = _2359 ? as_type<float>(_2387) : _192;
    float _2451 = floor(_2441);
    float _2453 = _2383 ? as_type<float>(_2329) : _192;
    float _2455 = fma(_2307, (*spvDescriptorSet0.vp_c10)._m0[6].z, _2407);
    int _2457 = _2433 & 3;
    bool _2459 = uint(_2429) >= uint(_1704);
    float _2461 = (*spvDescriptorSet0.vp_c9)._m0[92].x + (*spvDescriptorSet0.vp_c9)._m0[91].z;
    float _2463 = (*spvDescriptorSet0.vp_c9)._m0[93].z + (*spvDescriptorSet0.vp_c9)._m0[93].x;
    bool _2465 = uint(_2457) > 1u;
    float _2467 = _1809 * (*spvDescriptorSet0.vp_c9)._m0[92].x;
    bool _2469 = !_2459;
    int _2471 = _2469 ? 0 : (-1);
    float _2473 = fma(_1809, (*spvDescriptorSet0.vp_c9)._m0[93].z, _2463);
    int _2475 = _2433 & 3;
    bool _2477 = _2475 != 0;
    float _2479 = -_2461;
    float _2481 = fma(_2467, 2.0, _2479);
    int _2483 = ~_1672;
    int _2485 = _2483 + 1;
    float _2487 = _1801 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    float _2489 = float(uint(_2187));
    float _2491 = -_166;
    float _2493 = fma(_2491, (*spvDescriptorSet0.vp_c9)._m0[91].x, _2481);
    int _2495 = _2477 ? 0 : 1;
    int _2497 = _2485 * int(_2439);
    int _2499 = _2497 + _1967;
    float _2501 = as_type<float>(_1761) * _2489;
    int _2503 = ~_2495;
    int _2505 = _2503 + 1;
    int _2507 = _2505 + 1;
    float _2509 = -_2149;
    float _2511 = fma(_2487, 2.0, _2509);
    int _2513 = _2507;
    float _2515 = _2487;
    if (!_2465)
    {
        int _2517 = ~_2495;
        int _2519 = _2517 + 1;
        _2513 = _2519;
    }
    int _2521 = _2513;
    float _2523 = trunc(_2501);
    float _2525 = precise::max(_2523, 0.0);
    uint _2527 = uint(_2525);
    bool _2529 = uint(_2457) >= 2u;
    float _2531 = (*spvDescriptorSet0.vp_c9)._m0[93].w + (*spvDescriptorSet0.vp_c9)._m0[93].y;
    float _2533 = float(uint(_2499));
    float _2535 = -_166;
    float _2537 = fma(_2535, (*spvDescriptorSet0.vp_c9)._m0[76].x, _2511);
    int _2539 = ~_2417;
    int _2541 = _2539 + _2471;
    int _2543 = _2541 + 1;
    float _2545 = fma(_1811, (*spvDescriptorSet0.vp_c9)._m0[93].w, _2531);
    int _2547 = _2529 ? 0 : 1;
    float _2549 = as_type<float>(_1718) * _2533;
    bool _2551 = _2457 != 3;
    int _2553 = _1704 * _2543;
    int _2555 = _2553 + _2243;
    float _2557 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _2559 = log2(_2557);
    float _2561 = _1811 * (*spvDescriptorSet0.vp_c9)._m0[92].y;
    int _2563 = ~_1704;
    int _2565 = _2563 + 1;
    float _2567 = fma(_166, (*spvDescriptorSet0.vp_c9)._m0[92].w, _2545);
    float _2569 = (*spvDescriptorSet0.vp_c9)._m0[92].y + (*spvDescriptorSet0.vp_c9)._m0[91].w;
    bool _2571 = !_1925;
    int _2573 = _2571 ? _2555 : (-1);
    float _2575 = _2455 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    int _2577 = _2565 * int(_2527);
    int _2579 = _2577 + _2187;
    float _2581 = fma(_2561, -2.0, _2569);
    int _2583 = _2573 & 3;
    float _2585 = trunc(_2549);
    float _2587 = precise::max(_2585, 0.0);
    uint _2589 = uint(_2587);
    float _2591 = _2561;
    if (_2443)
    {
        _2591 = _1801;
    }
    float _2593 = _2591;
    float _2595 = fma(_166, (*spvDescriptorSet0.vp_c9)._m0[91].y, _2581);
    int _2597 = ~_2547;
    int _2599 = _2597 + 1;
    int _2601 = _2599 + 1;
    float _2603 = _2593;
    int _2605 = _2601;
    float _2607 = _2595;
    if (!_2443)
    {
        _2603 = _2251;
    }
    float _2609 = _2603;
    if (_2551)
    {
        int _2611 = ~_2547;
        int _2613 = _2611 + 1;
        _2605 = _2613;
    }
    int _2615 = _2605;
    bool _2617 = uint(_2583) > 1u;
    float _2619 = _2609 * (*spvDescriptorSet0.vp_c9)._m0[87].x;
    if (_2443)
    {
        _2515 = _1664;
    }
    float _2621 = _2515;
    float _2623 = _2559 * _166;
    float _2625 = float(uint(_2579));
    float _2627 = -_2167;
    float _2629 = fma(_2619, 2.0, _2627);
    float _2631 = _2621;
    if (!_2443)
    {
        _2631 = _1801;
    }
    float _2633 = _2631;
    int _2635 = _2573 & 3;
    bool _2637 = _2635 != 0;
    float _2639 = as_type<float>(_1761) * _2625;
    float _2641 = exp2(_2623);
    int _2643 = _2637 ? 0 : 1;
    float _2645 = _2633 * (*spvDescriptorSet0.vp_c9)._m0[87].y;
    bool _2647 = !_2371;
    int _2649 = _2647 ? 0 : 1;
    float _2651 = (*spvDescriptorSet0.vp_c9)._m0[87].y + (*spvDescriptorSet0.vp_c9)._m0[86].w;
    int _2653 = ~_2643;
    int _2655 = _2653 + 1;
    int _2657 = _2655 + 1;
    float _2659 = -_166;
    float _2661 = fma(_2659, (*spvDescriptorSet0.vp_c9)._m0[86].x, _2629);
    int _2663 = _2657;
    if (!_2617)
    {
        int _2665 = ~_2643;
        int _2667 = _2665 + 1;
        _2663 = _2667;
    }
    int _2669 = _2663;
    float _2671 = fma(_2645, -2.0, _2651);
    bool _2673 = _2583 != 3;
    float _2675 = trunc(_2639);
    float _2677 = precise::max(_2675, 0.0);
    uint _2679 = uint(_2677);
    bool _2681 = uint(_2583) >= 2u;
    int _2683 = _2681 ? 0 : 1;
    float _2685 = -_2641;
    float _2687 = _2685 + 1.0;
    bool _2689 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _2691 = isnan(0.0);
    bool _2693 = _2689 || _2691;
    bool _2695 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _2697 = _2693 || _2695;
    int _2699 = int(_2439) + int(_2589);
    int _2701 = ~_1672;
    int _2703 = _2701 + 1;
    int _2705 = ~_2683;
    int _2707 = _2705 + 1;
    int _2709 = _2707 + 1;
    int _2711 = _2709;
    if (_2673)
    {
        int _2713 = ~_2683;
        int _2715 = _2713 + 1;
        _2711 = _2715;
    }
    int _2717 = _2711;
    int _2719 = _2703 * _2699;
    int _2721 = _2719 + _1967;
    bool _2723 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _2725 = isnan(1.0);
    bool _2727 = _2723 || _2725;
    bool _2729 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _2731 = _2727 || _2729;
    float _2733 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _2735 = 1.0 + _2733;
    float _2737 = _2697 ? _2687 : 0.0;
    float _2739 = _1664 * 2.0;
    float _2741 = 1.0 / _2735;
    bool _2743 = uint(_2721) >= uint(_1672);
    float _2745 = (*spvDescriptorSet0.vp_c9)._m0[88].w + (*spvDescriptorSet0.vp_c9)._m0[88].y;
    float _2747 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    float _2749 = fma(_1664, (*spvDescriptorSet0.vp_c9)._m0[88].w, _2745);
    float _2751 = floor(_2739);
    float _2753 = fma(_1664, (*spvDescriptorSet0.vp_c9)._m0[78].w, _2747);
    float _2755 = (*spvDescriptorSet0.vp_c9)._m0[88].z + (*spvDescriptorSet0.vp_c9)._m0[88].x;
    float _2757 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    float _2759 = fma(_166, (*spvDescriptorSet0.vp_c9)._m0[87].w, _2749);
    float _2761 = fma(_166, (*spvDescriptorSet0.vp_c9)._m0[77].w, _2753);
    float _2763 = fma(_1801, (*spvDescriptorSet0.vp_c9)._m0[88].z, _2755);
    float _2765 = fma(_1801, (*spvDescriptorSet0.vp_c9)._m0[78].z, _2757);
    float _2767 = -(*spvDescriptorSet0.vp_c9)._m0[170].w;
    float _2769 = _2767 + (*spvDescriptorSet0.vp_c9)._m0[171].w;
    float _2771 = fma(_166, (*spvDescriptorSet0.vp_c9)._m0[92].z, _2473);
    float _2773 = fma(_166, (*spvDescriptorSet0.vp_c9)._m0[87].z, _2763);
    float _2775 = fma(_166, (*spvDescriptorSet0.vp_c9)._m0[77].z, _2765);
    float _2777 = fma(_166, (*spvDescriptorSet0.vp_c9)._m0[86].y, _2671);
    float _2779 = _2773;
    if (_2731)
    {
        float _2781 = _2737 * _2741;
        _168 = _2781;
    }
    float _2783 = _168;
    float _2785 = -(*spvDescriptorSet0.vp_c9)._m0[171].w;
    float _2787 = _2785 + (*spvDescriptorSet0.vp_c9)._m0[172].w;
    bool _2789 = _2751 >= 0.0;
    bool _2791 = isnan(_2751);
    bool _2793 = _2789 || _2791;
    bool _2795 = isnan(0.0);
    bool _2797 = _2793 || _2795;
    float _2799 = 1.0 / _2769;
    float _2801 = _2251 * 2.0;
    bool _2803 = !_2743;
    int _2805 = _2803 ? 0 : (-1);
    bool _2807 = _2451 >= 0.0;
    bool _2809 = isnan(_2451);
    bool _2811 = _2807 || _2809;
    bool _2813 = isnan(0.0);
    bool _2815 = _2811 || _2813;
    float _2817 = -(*spvDescriptorSet0.vp_c9)._m0[169].w;
    float _2819 = _2817 + (*spvDescriptorSet0.vp_c9)._m0[170].w;
    float _2821 = 1.0 / _2787;
    int _2823 = _2797 ? 0 : 1;
    bool _2825 = _2451 > 0.0;
    float _2827 = -(*spvDescriptorSet0.vp_c9)._m0[172].w;
    float _2829 = _2827 + (*spvDescriptorSet0.vp_c9)._m0[173].w;
    int _2831 = _2815 ? 0 : 1;
    bool _2833 = _2751 > 0.0;
    float _2835 = 1.0 / _2819;
    int _2837 = ~_1704;
    int _2839 = _2837 + 1;
    int _2841 = int(_2527) + int(_2679);
    float _2843 = -(*spvDescriptorSet0.vp_c9)._m0[169].x;
    float _2845 = (*spvDescriptorSet0.vp_c9)._m0[170].x + _2843;
    float _2847 = -(*spvDescriptorSet0.vp_c9)._m0[170].x;
    float _2849 = _2847 + (*spvDescriptorSet0.vp_c9)._m0[171].x;
    float _2851 = 1.0 / _2829;
    int _2853 = ~_2831;
    int _2855 = _2853 + 1;
    int _2857 = _2855 + 1;
    int _2859 = _2839 * _2841;
    int _2861 = _2859 + _2187;
    int _2863 = _2857;
    if (!_2825)
    {
        int _2865 = ~_2831;
        int _2867 = _2865 + 1;
        _2863 = _2867;
    }
    int _2869 = _2863;
    float _2871 = _2849 * _2799;
    float _2873 = _1664 + _2251;
    bool _2875 = uint(_2861) >= uint(_1704);
    float _2877 = floor(_2801);
    float _2879 = _2873 + (-1.0);
    bool _2881 = !_2875;
    int _2883 = _2881 ? 0 : (-1);
    float _2885 = _2845 * _2835;
    int _2887 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _2889 = _2887 != 0;
    int _2891 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _2893 = _2891 != 0;
    int _2895 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _2897 = _2895 != 0;
    float _2899 = -(*spvDescriptorSet0.vp_c9)._m0[171].x;
    float _2901 = (*spvDescriptorSet0.vp_c9)._m0[172].x + _2899;
    float _2903 = -(*spvDescriptorSet0.vp_c9)._m0[172].x;
    float _2905 = _2903 + (*spvDescriptorSet0.vp_c9)._m0[173].x;
    int _2907 = ~_2823;
    int _2909 = _2907 + 1;
    int _2911 = _2909 + 1;
    float _2913 = _2901 * _2821;
    float _2915 = -(*spvDescriptorSet0.vp_c9)._m0[168].w;
    float _2917 = _1658 + _2915;
    int _2919 = _2911;
    if (!_2833)
    {
        int _2921 = ~_2823;
        int _2923 = _2921 + 1;
        _2919 = _2923;
    }
    int _2925 = _2919;
    float _2927 = _2905 * _2851;
    bool _2929 = !_2477;
    int _2931 = _2929 ? 0 : 1;
    float _2933 = fma(_2879, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    bool _2935 = _2877 > 0.0;
    float _2937 = fma(_2307, (*spvDescriptorSet0.vp_c10)._m0[4].z, _2403);
    bool _2939 = _2877 >= 0.0;
    bool _2941 = isnan(_2877);
    bool _2943 = _2939 || _2941;
    bool _2945 = isnan(0.0);
    bool _2947 = _2943 || _2945;
    float _2949 = -(*spvDescriptorSet0.vp_c9)._m0[167].w;
    float _2951 = _1658 + _2949;
    float _2953 = -(*spvDescriptorSet0.vp_c9)._m0[169].w;
    float _2955 = _1658 + _2953;
    bool _2957 = _1658 >= (*spvDescriptorSet0.vp_c9)._m0[174].w;
    bool _2959 = isnan(_1658);
    bool _2961 = _2957 || _2959;
    bool _2963 = isnan((*spvDescriptorSet0.vp_c9)._m0[174].w);
    bool _2965 = _2961 || _2963;
    float _2967 = float(_2965);
    float _2969 = fma(_2423, _2917, (*spvDescriptorSet0.vp_c9)._m0[168].x);
    bool _2971 = _1658 >= (*spvDescriptorSet0.vp_c9)._m0[173].w;
    bool _2973 = isnan(_1658);
    bool _2975 = _2971 || _2973;
    bool _2977 = isnan((*spvDescriptorSet0.vp_c9)._m0[173].w);
    bool _2979 = _2975 || _2977;
    float _2981 = float(_2979);
    float _2983 = fma(_2373, _2951, (*spvDescriptorSet0.vp_c9)._m0[167].x);
    float _2985 = fma(_2885, _2955, (*spvDescriptorSet0.vp_c9)._m0[169].x);
    float _2987 = -_2967;
    float _2989 = _2987 + 1.0;
    float _2991 = -(*spvDescriptorSet0.vp_c9)._m0[170].w;
    float _2993 = _1658 + _2991;
    bool _2995 = _1658 >= (*spvDescriptorSet0.vp_c9)._m0[172].w;
    bool _2997 = isnan(_1658);
    bool _2999 = _2995 || _2997;
    bool _3001 = isnan((*spvDescriptorSet0.vp_c9)._m0[172].w);
    bool _3003 = _2999 || _3001;
    float _3005 = float(_3003);
    float _3007 = -_2981;
    float _3009 = _3007 + 1.0;
    bool _3011 = _1658 >= (*spvDescriptorSet0.vp_c9)._m0[171].w;
    bool _3013 = isnan(_1658);
    bool _3015 = _3011 || _3013;
    bool _3017 = isnan((*spvDescriptorSet0.vp_c9)._m0[171].w);
    bool _3019 = _3015 || _3017;
    float _3021 = float(_3019);
    float _3023 = fma(_2927, _1833, (*spvDescriptorSet0.vp_c9)._m0[172].x);
    float _3025 = _2981 * _2989;
    float _3027 = fma(_2871, _2993, (*spvDescriptorSet0.vp_c9)._m0[170].x);
    bool _3029 = _1658 >= (*spvDescriptorSet0.vp_c9)._m0[169].w;
    bool _3031 = isnan(_1658);
    bool _3033 = _3029 || _3031;
    bool _3035 = isnan((*spvDescriptorSet0.vp_c9)._m0[169].w);
    bool _3037 = _3033 || _3035;
    float _3039 = float(_3037);
    float _3041 = _3005 * _3009;
    float _3043 = -_3005;
    float _3045 = _3043 + 1.0;
    bool _3047 = _1658 >= (*spvDescriptorSet0.vp_c9)._m0[170].w;
    bool _3049 = isnan(_1658);
    bool _3051 = _3047 || _3049;
    bool _3053 = isnan((*spvDescriptorSet0.vp_c9)._m0[170].w);
    bool _3055 = _3051 || _3053;
    float _3057 = float(_3055);
    float _3059 = -(*spvDescriptorSet0.vp_c9)._m0[171].w;
    float _3061 = _1658 + _3059;
    float _3063 = -_3021;
    float _3065 = _3063 + 1.0;
    float _3067 = -(*spvDescriptorSet0.vp_c9)._m0[173].w;
    float _3069 = _3067 + (*spvDescriptorSet0.vp_c9)._m0[174].w;
    bool _3071 = _1658 >= (*spvDescriptorSet0.vp_c9)._m0[168].w;
    bool _3073 = isnan(_1658);
    bool _3075 = _3071 || _3073;
    bool _3077 = isnan((*spvDescriptorSet0.vp_c9)._m0[168].w);
    bool _3079 = _3075 || _3077;
    float _3081 = float(_3079);
    float _3083 = -_3039;
    float _3085 = _3083 + 1.0;
    float _3087 = fma(_2913, _3061, (*spvDescriptorSet0.vp_c9)._m0[171].x);
    float _3089 = _3021 * _3045;
    float _3091 = _3057 * _3065;
    float _3093 = -_3057;
    float _3095 = _3093 + 1.0;
    float _3097 = _1995 * (*spvDescriptorSet0.vp_c9)._m0[90].x;
    bool _3099 = _1658 >= (*spvDescriptorSet0.vp_c9)._m0[167].w;
    bool _3101 = isnan(_1658);
    bool _3103 = _3099 || _3101;
    bool _3105 = isnan((*spvDescriptorSet0.vp_c9)._m0[167].w);
    bool _3107 = _3103 || _3105;
    float _3109 = float(_3107);
    float _3111 = _3081 * _3085;
    float _3113 = 1.0 / _3069;
    float _3115 = -_3081;
    float _3117 = _3115 + 1.0;
    float _3119 = _3039 * _3095;
    float _3121 = _2047 * (*spvDescriptorSet0.vp_c9)._m0[90].y;
    float _3123 = _3109 * _3117;
    float _3125 = -_3109;
    float _3127 = _3125 + 1.0;
    float _3129 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[95].w;
    float _3131 = fma(_3121, _2365, -0.5);
    float _3133 = fma(_2449, (*spvDescriptorSet0.vp_c9)._m0[80].y, -0.5);
    float _3135 = _2983 * _3123;
    float _3137 = _2447 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _3139 = fma(_3097, _2291, -0.5);
    float _3141 = -(*spvDescriptorSet0.vp_c9)._m0[173].x;
    float _3143 = (*spvDescriptorSet0.vp_c9)._m0[174].x + _3141;
    float _3145 = fma(_3127, (*spvDescriptorSet0.vp_c9)._m0[167].x, _3135);
    float _3147 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[95].z;
    float _3149 = _2937 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _3151 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _3153 = _3137 + _3151;
    float _3155 = _3143 * _3113;
    float _3157 = fma(_2969, _3111, _3145);
    float _3159 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _3161 = _3149 + _3159;
    float _3163 = _3153 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _3165 = fma(_3155, _1841, (*spvDescriptorSet0.vp_c9)._m0[173].x);
    float _3167 = _3129 * (*spvDescriptorSet0.vp_c9)._m0[95].y;
    float _3169 = fma(_2985, _3119, _3157);
    float _3171 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _3173 = _2575 + _3171;
    float _3175 = fma(_3161, (*spvDescriptorSet0.vp_c8)._m0[28].x, _3163);
    float _3177 = fma(_3027, _3091, _3169);
    int _3179 = _2947 ? 0 : 1;
    float _3181 = fma(_3173, (*spvDescriptorSet0.vp_c8)._m0[28].z, _3175);
    float _3183 = _3147 * (*spvDescriptorSet0.vp_c9)._m0[95].x;
    float _3185 = fma(_2295, (*spvDescriptorSet0.vp_c9)._m0[80].x, -0.5);
    float _3187 = fma(_3087, _3089, _3177);
    float _3189 = _3153 * _3153;
    bool _3191 = _3181 >= 0.0;
    float _3193 = fma(_2775, _3185, _2537);
    float _3195 = fma(_3183, _2425, -0.5);
    float _3197 = fma(_3161, _3161, _3189);
    int _3199 = _2433 >> 31;
    float _3201 = fma(_3167, _2453, -0.5);
    float _3203 = fma(_2771, _3195, _2493);
    int _3205 = _2573 >> 31;
    float _3207 = fma(_3173, _3173, _3197);
    int _3209 = _3199 & 3;
    float _3211 = -_2595;
    float _3213 = fma(_2567, _3201, _3211);
    int _3215 = _3205 & 3;
    int _3217 = _2433 + _3209;
    float _3219 = fma(_3023, _3041, _3187);
    int _3221 = _3199;
    float _3223 = _3131;
    if (_3191)
    {
        _2607 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _3225 = _2607;
    float _3227 = _3203 + 0.5;
    int _3229 = _2573 + _3215;
    float _3231 = -_2445;
    float _3233 = fma(_2761, _3133, _3231);
    int _3235 = _3217 >> 2;
    if (_3191)
    {
        float _3237 = _3225 * 5.0;
        _3221 = as_type<int>(_3237);
    }
    int _3239 = _3221;
    int _3241 = _3229 >> 2;
    float _3243 = rsqrt(_3207);
    int _3245 = _3235 << 4;
    int _3247 = _3245 + 368;
    float _3249 = _3233 + 0.5;
    int _3251 = _3241 << 4;
    int _3253 = _3251 + 512;
    if (_3191)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _10242 = as_type<float>(_3239);
        out.gl_Position.z = _10242;
    }
    uint _3255 = uint(int(uint(_3247) >> uint(2)));
    uint _3257 = uint(int(uint(int(_3255)) >> uint(2)));
    int _3259 = int(_3255) & 3;
    float _3261 = (*spvDescriptorSet0.vp_c9)._m0[int(_3257)][_3259];
    int _3263 = int(_3255) + 1;
    uint _3265 = uint(int(uint(_3263) >> uint(2)));
    int _3267 = _3263 & 3;
    float _3269 = (*spvDescriptorSet0.vp_c9)._m0[int(_3265)][_3267];
    bool _3271 = !_2889;
    int _3273 = _3271 ? 0 : 1;
    float _3275 = _3193 + 0.5;
    int _3277 = ~_3179;
    int _3279 = _3277 + 1;
    int _3281 = _3279 + 1;
    float _3283 = _3213 + 0.5;
    int _3285 = _3281;
    if (!_2935)
    {
        int _3287 = ~_3179;
        int _3289 = _3287 + 1;
        _3285 = _3289;
    }
    int _3291 = _3285;
    float _3293 = _1664 + _1801;
    int _3295 = abs(_2521);
    uint _3297 = uint(int(uint(_3253) >> uint(2)));
    uint _3299 = uint(int(uint(int(_3297)) >> uint(2)));
    int _3301 = int(_3297) & 3;
    float _3303 = (*spvDescriptorSet0.vp_c9)._m0[int(_3299)][_3301];
    int _3305 = int(_3297) + 1;
    uint _3307 = uint(int(uint(_3305) >> uint(2)));
    int _3309 = _3305 & 3;
    float _3311 = (*spvDescriptorSet0.vp_c9)._m0[int(_3307)][_3309];
    out.m_75.x = _3227;
    out.m_75.y = _3283;
    float _3313 = float(_3291);
    float _3315 = fma(_3165, _3025, _3219);
    float _3317 = _3153 * _3243;
    float _3319 = _3161 * _3243;
    int _3321 = ~_2841;
    int _3323 = _3321 + _2883;
    int _3325 = _3323 + 1;
    float _3327 = fma(_2967, (*spvDescriptorSet0.vp_c9)._m0[174].x, _3315);
    int _3329 = _3247 + 8;
    uint _3331 = uint(int(uint(_3329) >> uint(2)));
    uint _3333 = uint(int(uint(int(_3331)) >> uint(2)));
    int _3335 = int(_3331) & 3;
    float _3337 = (*spvDescriptorSet0.vp_c9)._m0[int(_3333)][_3335];
    int _3339 = int(_3331) + 1;
    uint _3341 = uint(int(uint(_3339) >> uint(2)));
    int _3343 = _3339 & 3;
    float _3345 = (*spvDescriptorSet0.vp_c9)._m0[int(_3341)][_3343];
    float _3347 = -_3317;
    float _3349 = fma(_3347, (*spvDescriptorSet0.vp_c9)._m0[18].w, _3153);
    float _3351 = -_3319;
    float _3353 = fma(_3351, (*spvDescriptorSet0.vp_c9)._m0[18].w, _3161);
    int _3355 = abs(_2669);
    out.m_77.x = _3327;
    float _3357 = _3349 * _3349;
    int _3359 = abs(_2717);
    int _3361 = _1704 * _3325;
    int _3363 = _3361 + _2187;
    int _3365 = _3253 + 8;
    uint _3367 = uint(int(uint(_3365) >> uint(2)));
    uint _3369 = uint(int(uint(int(_3367)) >> uint(2)));
    int _3371 = int(_3367) & 3;
    float _3373 = (*spvDescriptorSet0.vp_c9)._m0[int(_3369)][_3371];
    int _3375 = int(_3367) + 1;
    uint _3377 = uint(int(uint(_3375) >> uint(2)));
    int _3379 = _3375 & 3;
    float _3381 = (*spvDescriptorSet0.vp_c9)._m0[int(_3377)][_3379];
    float _3383 = fma(_3353, _3353, _3357);
    int _3385 = abs(_3273);
    float _3387 = _3293 + (-1.0);
    int _3389 = ~_2699;
    int _3391 = _3389 + _2805;
    int _3393 = _3391 + 1;
    out.m_79.x = _3275;
    out.m_79.y = _3249;
    float _3395 = float(_3385);
    float _3397 = fma(_2773, _3139, _2661);
    int _3399 = abs(_2931);
    int _3401 = _1672 * _3393;
    int _3403 = _3401 + _1967;
    int _3405 = ~_3355;
    int _3407 = _3405 + 1;
    int _3409 = _3407 + 1;
    float _3411 = _3395 * _3313;
    bool _3413 = !_2637;
    int _3415 = _3413 ? 0 : 1;
    float _3417 = -_2777;
    float _3419 = fma(_2759, _3131, _3417);
    int _3421 = ~_3399;
    int _3423 = _3421 + 1;
    int _3425 = _3423 + 1;
    float _3427 = _3173 * _3243;
    int _3429 = abs(_3415);
    float _3431 = _3419 + 0.5;
    float _3433 = -_3427;
    float _3435 = fma(_3433, (*spvDescriptorSet0.vp_c9)._m0[18].w, _3173);
    int _3437 = abs(_2615);
    if (_3191)
    {
        out.m_51.x = 0.0;
    }
    int _3439 = ~_3295;
    int _3441 = _3439 + 1;
    int _3443 = _3441 + 1;
    float _3445 = _1664 + (-0.5);
    bool _3447 = _2457 != 3;
    int _3449 = _3443 * as_type<int>(_3269);
    int _3451 = ~_3429;
    int _3453 = _3451 + 1;
    int _3455 = _3453 + 1;
    int _3457 = ~_3437;
    int _3459 = _3457 + 1;
    int _3461 = _3459 + 1;
    int _3463 = _3425 * as_type<int>(_3261);
    int _3465 = _3463 + _3449;
    bool _3467 = !_2377;
    int _3469 = _3467 ? 0 : 1;
    int _3471 = _3409 * as_type<int>(_3311);
    bool _3473 = !_3447;
    int _3475 = _3473 ? 0 : (-1);
    bool _3477 = _2583 != 3;
    int _3479 = _3455 * as_type<int>(_3303);
    int _3481 = _3479 + _3471;
    int _3483 = abs(_3475);
    int _3485 = _3461 * as_type<int>(_3337);
    int _3487 = _3485 + _3465;
    bool _3489 = !_3477;
    int _3491 = _3489 ? 0 : (-1);
    float _3493 = in.m_81.x;
    float _3495 = in.m_81.y;
    float _3497 = in.m_81.z;
    int _3499 = abs(_3469);
    int _3501 = abs(_3491);
    int _3503 = ~_3359;
    int _3505 = _3503 + 1;
    int _3507 = _3505 + 1;
    int _3509 = ~_3483;
    int _3511 = _3509 + 1;
    int _3513 = _3511 + 1;
    float _3515 = _3411 * (-2.0);
    bool _3517 = !_2893;
    int _3519 = _3517 ? 0 : 1;
    int _3521 = _3507 * as_type<int>(_3373);
    int _3523 = _3521 + _3481;
    int _3525 = _3513 * as_type<int>(_3345);
    int _3527 = _3525 + _3487;
    int _3529 = ~_3501;
    int _3531 = _3529 + 1;
    int _3533 = _3531 + 1;
    int _3535 = abs(_2649);
    int _3537 = ~_3499;
    int _3539 = _3537 + 1;
    int _3541 = _3539 + 1;
    int _3543 = _3533 * as_type<int>(_3381);
    int _3545 = _3543 + _3523;
    int _3547 = abs(_3519);
    int _3549 = ~_3535;
    int _3551 = _3549 + 1;
    int _3553 = _3551 + 1;
    int _3555 = _3545 * _3541;
    bool _3557 = _1672 == 0;
    bool _3559 = _1704 == 0;
    int _3561 = _3527 * _3553;
    bool _3563 = !_3557;
    int _3565 = _3563 ? _3403 : (-1);
    float _3567 = fma(_3387, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    bool _3569 = !_3559;
    int _3571 = _3569 ? _3363 : (-1);
    float _3573 = float(_2869);
    int _3575 = _3565 * _3535;
    int _3577 = _3575 + _3561;
    float _3579 = float(_3547);
    int _3581 = _3571 * _3499;
    int _3583 = _3581 + _3555;
    float _3585 = fma(_3567, _3515, _3567);
    float _3587 = fma(_3515, _3493, _3493);
    float _3589 = _1801 + (-0.5);
    float _3591 = _3579 * _3573;
    float _3593 = fma(_3435, _3435, _3383);
    float _3595 = _3397 + 0.5;
    float _3597 = float(_3577);
    float _3599 = fma(_3589, (*spvDescriptorSet0.vp_c9)._m0[196].x, _3587);
    float _3601 = float(_3583);
    float _3603 = _3591 * (-2.0);
    out.m_83.x = _3595;
    out.m_83.y = _3431;
    float _3605 = fma(_3585, _2783, _3599);
    float _3607 = fma(_2933, _3603, _2933);
    out.m_85.x = _3597;
    out.m_85.y = _3601;
    float _3609 = fma(_3603, _3495, _3495);
    bool _3611 = !_2897;
    int _3613 = _3611 ? 0 : 1;
    float _3615 = _3497;
    if (_3191)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _3617 = -_3317;
    float _3619 = fma(_3617, (*spvDescriptorSet0.vp_c9)._m0[18].w, _3137);
    int _3621 = abs(_3613);
    float _3623 = -_3319;
    float _3625 = fma(_3623, (*spvDescriptorSet0.vp_c9)._m0[18].w, _3149);
    float _3627 = float(_2925);
    float _3629 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _3631 = _3619 + _3629;
    float _3633 = float(_3621);
    float _3635 = -_3427;
    float _3637 = fma(_3635, (*spvDescriptorSet0.vp_c9)._m0[18].w, _2575);
    float _3639 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _3641 = _3625 + _3639;
    float _3643 = _3631 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _3645 = fma(_3445, (*spvDescriptorSet0.vp_c9)._m0[196].y, _3609);
    float _3647 = _3633 * _3627;
    float _3649 = _1801 + _2251;
    float _3651 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _3653 = _3637 + _3651;
    float _3655 = fma(_3641, (*spvDescriptorSet0.vp_c8)._m0[28].x, _3643);
    float _3657 = fma(_3607, _2783, _3645);
    float _3659 = _3649 + (-1.0);
    float _3661 = _3647 * (-2.0);
    float _3663 = fma(_3653, (*spvDescriptorSet0.vp_c8)._m0[28].z, _3655);
    float _3665 = _3605 * 0.15915493667125701904296875;
    float _3667 = fma(_3659, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _3669 = fma(_3661, _3497, _3497);
    float _3671 = _2251 + (-0.5);
    bool _3673 = _3663 >= 0.0;
    float _3675 = fma(_3667, _3661, _3667);
    float _3677 = _3657 * 0.15915493667125701904296875;
    float _3679 = fma(_3671, (*spvDescriptorSet0.vp_c9)._m0[196].z, _3669);
    float _3681 = _3665 * 6.283185482025146484375;
    float _3683 = sin(_3681);
    float _3685 = fma(_3675, _2783, _3679);
    float _3687 = _3685 * 0.15915493667125701904296875;
    float _3689 = _3677 * 6.283185482025146484375;
    float _3691 = sin(_3689);
    float _3693 = _3637;
    if (_3673)
    {
        _3615 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _3695 = _3615;
    int _3697 = as_type<int>(_3695);
    if (_3673)
    {
        out.m_51.x = 0.0;
    }
    if (_3673)
    {
        float _3699 = _3695 * 5.0;
        _3697 = as_type<int>(_3699);
    }
    int _3701 = _3697;
    float _3703 = _3665 * 6.283185482025146484375;
    float _3705 = cos(_3703);
    if (_3673)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _10916 = as_type<float>(_3701);
        out.gl_Position.z = _10916;
    }
    float _3707 = _3677 * 6.283185482025146484375;
    float _3709 = cos(_3707);
    float _3711 = _3687 * 6.283185482025146484375;
    float _3713 = sin(_3711);
    float _3715 = sqrt(_3593);
    float _3717 = _3683 * _3691;
    if (_3673)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _3719 = -_3137;
    float _3721 = _3719 + (*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _3723 = in.m_87.x;
    float _3725 = in.m_87.y;
    float _3727 = in.m_87.z;
    float _3729 = -_3149;
    float _3731 = _3729 + (*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _3733 = -_2575;
    float _3735 = _3733 + (*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _3737 = _3721 * _3721;
    float _3739 = _3687 * 6.283185482025146484375;
    float _3741 = cos(_3739);
    float _3743 = _3705 * _3709;
    float _3745 = _3243 * _3715;
    float _3747 = fma(_3731, _3731, _3737);
    float _3749 = _528 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _3751 = fma(_3713, _3743, _3717);
    float _3753 = fma(_3735, _3735, _3747);
    float _3755 = fma(_3713, _3717, _3743);
    float _3757 = _3745 * _3749;
    float _3759 = _722 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _3761 = rsqrt(_3753);
    float _3763 = _526 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _3765 = _3705 * _3691;
    float _3767 = _3683 * _3709;
    float _3769 = _3745 * _3759;
    float _3771 = _3705 * _3741;
    float _3773 = _3709 * _3741;
    float _3775 = _3683 * _3741;
    float _3777 = _3745 * _3763;
    float _3779 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _3725);
    float _3781 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _3723);
    float _3783 = _3691 * _3741;
    float _3785 = -_3765;
    float _3787 = fma(_3713, _3767, _3785);
    float _3789 = _3779 * _3757;
    float _3791 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _3727);
    float _3793 = -_3767;
    float _3795 = fma(_3713, _3765, _3793);
    float _3797 = _3731 * _3761;
    float _3799 = _3781 * _3769;
    float _3801 = _3791 * _3777;
    float _3803 = in.m_89.x;
    float _3805 = in.m_89.y;
    float _3807 = in.m_89.z;
    float _3809 = _3735 * _3761;
    float _3811 = -(*spvDescriptorSet0.vp_c8)._m0[1].z;
    float _3813 = _3797 * _3811;
    bool _3815 = _3725 != 0.0;
    bool _3817 = isnan(_3725);
    bool _3819 = _3815 || _3817;
    bool _3821 = isnan(0.0);
    bool _3823 = _3819 || _3821;
    float _3825 = _3721 * _3761;
    float _3827 = -(*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _3829 = _3809 * _3827;
    float _3831 = -(*spvDescriptorSet0.vp_c8)._m0[1].x;
    float _3833 = -_3813;
    float _3835 = fma(_3809, _3831, _3833);
    bool _3837 = _3723 == 0.0;
    bool _3839 = !_3823;
    bool _3841 = _3837 && _3839;
    float _3843 = -(*spvDescriptorSet0.vp_c8)._m0[1].x;
    float _3845 = _3825 * _3843;
    float _3847 = -(*spvDescriptorSet0.vp_c8)._m0[1].z;
    float _3849 = -_3829;
    float _3851 = fma(_3825, _3847, _3849);
    float _3853 = _3835 * _3835;
    bool _3855 = _3727 == 0.0;
    bool _3857 = _3855 && _3841;
    float _3859 = in.m_91.x;
    float _3861 = in.m_91.y;
    float _3863 = in.m_91.z;
    float _3865 = in.m_91.w;
    float _3867 = -(*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _3869 = -_3845;
    float _3871 = fma(_3797, _3867, _3869);
    float _3873 = fma(_3851, _3851, _3853);
    float _3875 = -_3789;
    float _3877 = _3713 * _3875;
    float _3879 = _3771 * _3789;
    float _3881 = _3775 * _3789;
    float _3883 = fma(_3871, _3871, _3873);
    float _3885 = fma(_3773, _3799, _3877);
    float _3887 = fma(_3751, _3799, _3879);
    float _3889 = fma(_3787, _3799, _3881);
    float _3891 = rsqrt(_3883);
    float _3893 = fma(_3783, _3801, _3885);
    float _3895 = _3799;
    float _3897 = _3877;
    float _3899 = _3803;
    float _3901 = _3881;
    if (_3857)
    {
        _2779 = _3803;
    }
    float _3903 = _2779;
    float _3905 = fma(_3795, _3801, _3887);
    float _3907 = _3903;
    if (_3857)
    {
        _3223 = _3805;
    }
    float _3909 = _3223;
    float _3911 = _3909;
    if (_3857)
    {
        _3895 = _3903;
    }
    float _3913 = _3895;
    float _3915 = _3913;
    if (!_3857)
    {
        _3907 = _3803;
    }
    float _3917 = _3907;
    if (_3857)
    {
        _3897 = _3807;
    }
    float _3919 = _3897;
    float _3921 = _3919;
    if (_3857)
    {
        _3899 = _3909;
    }
    float _3923 = _3899;
    float _3925 = _3923;
    if (!_3857)
    {
        float _3927 = fma(_3723, (*spvDescriptorSet0.vp_c9)._m0[17].y, _3917);
        _3915 = _3927;
    }
    float _3929 = _3915;
    if (!_3857)
    {
        _3911 = _3805;
    }
    float _3931 = _3911;
    float _3933 = _3863 * _3917;
    if (_3857)
    {
        _3901 = _3919;
    }
    float _3935 = _3901;
    float _3937 = fma(_3755, _3801, _3889);
    float _3939 = _3935;
    if (!_3857)
    {
        _3921 = _3807;
    }
    float _3941 = _3921;
    if (!_3857)
    {
        float _3943 = fma(_3725, (*spvDescriptorSet0.vp_c9)._m0[17].y, _3931);
        _3925 = _3943;
    }
    float _3945 = _3925;
    float _3947 = _3851 * _3891;
    float _3949 = _3835 * _3891;
    float _3951 = _3859 * _3931;
    float _3953 = -_3933;
    float _3955 = fma(_3859, _3941, _3953);
    if (!_3857)
    {
        float _3957 = fma(_3727, (*spvDescriptorSet0.vp_c9)._m0[17].y, _3941);
        _3939 = _3957;
    }
    float _3959 = _3939;
    float _3961 = _3861 * _3941;
    float _3963 = _3871 * _3891;
    float _3965 = _3809 * _3949;
    float _3967 = _3825 * _3947;
    float _3969 = -_3961;
    float _3971 = fma(_3863, _3931, _3969);
    float _3973 = -_3951;
    float _3975 = fma(_3861, _3917, _3973);
    float _3977 = -_3965;
    float _3979 = fma(_3825, _3963, _3977);
    float _3981 = -_3967;
    float _3983 = fma(_3797, _3949, _3981);
    float _3985 = _3971 * _3865;
    float _3987 = _3955 * _3865;
    float _3989 = _3979 * _3905;
    float _3991 = _3983 * _3905;
    float _3993 = _3797 * _3963;
    float _3995 = _3975 * _3865;
    float _3997 = fma(_3947, _3893, _3989);
    float _3999 = fma(_3963, _3893, _3991);
    float _4001 = -_3993;
    float _4003 = fma(_3809, _3947, _4001);
    float _4005 = _3751 * _3979;
    float _4007 = fma(_3797, _3937, _3997);
    float _4009 = fma(_3809, _3937, _3999);
    float _4011 = _3751 * _4003;
    float _4013 = _3751 * _3983;
    float _4015 = _3149 + _4007;
    float _4017 = _2575 + _4009;
    float _4019 = _3771 * _3979;
    float _4021 = _3771 * _4003;
    float _4023 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _4025 = _4015 + _4023;
    float _4027 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _4029 = _4017 + _4027;
    float _4031 = _3771 * _3983;
    float _4033 = _3795 * _3979;
    float _4035 = _4025 * _4025;
    float _4037 = _4029 * _4029;
    float _4039 = _3795 * _3983;
    float _4041 = _3795 * _4003;
    float _4043 = _4003 * _3905;
    float _4045 = _4035 + _4037;
    float _4047 = fma(_3773, _3947, _4005);
    float _4049 = fma(_3773, _3949, _4011);
    float _4051 = fma(_3773, _3963, _4013);
    float _4053 = -_3713;
    float _4055 = fma(_4053, _3947, _4019);
    float _4057 = sqrt(_4045);
    float _4059 = fma(_3949, _3893, _4043);
    float _4061 = -_3713;
    float _4063 = fma(_4061, _3949, _4021);
    float _4065 = -_3713;
    float _4067 = fma(_4065, _3963, _4031);
    float _4069 = fma(_3783, _3947, _4033);
    float _4071 = fma(_3783, _3963, _4039);
    float _4073 = fma(_3775, _3797, _4055);
    float _4075 = fma(_3783, _3949, _4041);
    float _4077 = fma(_3825, _3937, _4059);
    float _4079 = fma(_3787, _3797, _4047);
    float _4081 = fma(_3787, _3825, _4049);
    float _4083 = fma(_3775, _3825, _4063);
    float _4085 = fma(_3775, _3809, _4067);
    float _4087 = fma(_3787, _3809, _4051);
    float _4089 = fma(_3755, _3797, _4069);
    float _4091 = fma(_3755, _3809, _4071);
    bool _4093 = _4057 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _4095 = _4073 * _3861;
    float _4097 = _4073 * _3945;
    float _4099 = _3987 * _4073;
    float _4101 = _3137 + _4077;
    float _4103 = fma(_3755, _3825, _4075);
    float _4105 = _4083 * _3945;
    float _4107 = _4083 * _3861;
    float _4109 = _4085 * _3861;
    float _4111 = _4085 * _3945;
    float _4113 = _3987 * _4083;
    float _4115 = _3987 * _4085;
    float _4117 = _4077;
    float _4119 = _4035;
    float _4121 = _4037;
    float _4123 = _4015;
    float _4125 = _4017;
    float _4127 = _4103;
    float _4129 = _3959;
    if (!_4093)
    {
        _4117 = _4101;
    }
    float _4131 = _4117;
    bool _4133 = !_4093;
    float _4135 = _4131;
    if (!_4133)
    {
        float _4137 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _4139 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _4141 = _4057 + _4139;
        float _4143 = rsqrt(_4045);
        float _4145 = _4141 * _4137;
        float _4147 = _4101 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _4149 = _4145 * 0.15915493667125701904296875;
        float _4151 = _4149 * 6.283185482025146484375;
        float _4153 = sin(_4151);
        float _4155 = _4149 * 6.283185482025146484375;
        float _4157 = cos(_4155);
        float _4159 = fma(_4153, _4147, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _4161 = _4143 * _4159;
        float _4163 = _4157 + (-1.0);
        float _4165 = fma(_4025, _4161, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _4167 = fma(_4029, _4161, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        float _4169 = _4163 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _4171 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
        float _4173 = _4165 + _4171;
        float _4175 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
        float _4177 = _4167 + _4175;
        float _4179 = fma(_4101, _4157, _4169);
        float _4181 = _4173 * _4173;
        float _4183 = _4177 * _4177;
        _4135 = _4179;
        _4119 = _4181;
        _4121 = _4183;
        _4123 = _4165;
        _4125 = _4167;
    }
    float _4185 = _4135;
    float _4187 = _4119;
    float _4189 = _4121;
    float _4191 = _4123;
    float _4193 = _4125;
    float _4195 = -(*spvDescriptorSet0.vp_c15)._m0[0].y;
    float _4197 = _4185 + _4195;
    float _4199 = fma(_3985, _4079, _4099);
    float _4201 = fma(_4079, _3859, _4095);
    float _4203 = fma(_4081, _3859, _4107);
    float _4205 = fma(_4197, _4197, _4187);
    float _4207 = fma(_3985, _4081, _4113);
    float _4209 = fma(_4087, _3859, _4109);
    float _4211 = fma(_4079, _3929, _4097);
    float _4213 = _4205 + _4189;
    float _4215 = fma(_4081, _3929, _4105);
    float _4217 = fma(_4087, _3929, _4111);
    float _4219 = fma(_3985, _4087, _4115);
    float _4221 = fma(_3995, _4089, _4199);
    float _4223 = fma(_4089, _3863, _4201);
    float _4225 = sqrt(_4213);
    float _4227 = fma(_4103, _3863, _4203);
    float _4229 = fma(_3995, _4103, _4207);
    float _4231 = fma(_4091, _3863, _4209);
    float _4233 = fma(_4089, _3959, _4211);
    float _4235 = fma(_4103, _3959, _4215);
    float _4237 = fma(_3995, _4091, _4219);
    float _4239 = fma(_4091, _3959, _4217);
    out.m_93.x = _4223;
    out.m_93.y = _4227;
    out.m_93.z = _4231;
    out.m_95.x = _4221;
    out.m_95.y = _4229;
    out.m_95.z = _4237;
    out.m_97.x = _4233;
    out.m_97.y = _4235;
    out.m_97.z = _4239;
    bool _4241 = _4225 >= (*spvDescriptorSet0.vp_c16)._m0[1].x;
    bool _4243 = isnan(_4225);
    bool _4245 = _4241 || _4243;
    bool _4247 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].x);
    bool _4249 = _4245 || _4247;
    float _4251 = _4221;
    float _4253 = _4229;
    if (!_4249)
    {
        _4127 = 1.0;
    }
    float _4255 = _4127;
    bool _4257 = !_4249;
    float _4259 = _4255;
    if (!_4257)
    {
        bool _4261 = _4225 >= (*spvDescriptorSet0.vp_c16)._m0[1].y;
        bool _4263 = isnan(_4225);
        bool _4265 = _4261 || _4263;
        bool _4267 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].y);
        bool _4269 = _4265 || _4267;
        if (!_4269)
        {
            float _4271 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _4273 = _4225 + _4271;
            float _4275 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _4277 = (*spvDescriptorSet0.vp_c16)._m0[1].y + _4275;
            float _4279 = -(*spvDescriptorSet0.vp_c16)._m0[2].x;
            float _4281 = _4279 + (*spvDescriptorSet0.vp_c16)._m0[2].y;
            float _4283 = 1.0 / _4277;
            float _4285 = _4273 * _4283;
            float _4287 = fma(_4285, _4281, (*spvDescriptorSet0.vp_c16)._m0[2].x);
            _4259 = _4287;
            _4251 = _4283;
            _4289 = true;
        }
        else
        {
            bool _4291 = _4225 >= (*spvDescriptorSet0.vp_c16)._m0[1].z;
            bool _4293 = isnan(_4225);
            bool _4295 = _4291 || _4293;
            bool _4297 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].z);
            bool _4299 = _4295 || _4297;
            if (!_4299)
            {
                float _4301 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _4303 = _4225 + _4301;
                float _4305 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _4307 = _4305 + (*spvDescriptorSet0.vp_c16)._m0[1].z;
                float _4309 = -(*spvDescriptorSet0.vp_c16)._m0[2].y;
                float _4311 = _4309 + (*spvDescriptorSet0.vp_c16)._m0[2].z;
                float _4313 = 1.0 / _4307;
                float _4315 = _4303 * _4313;
                float _4317 = fma(_4315, _4311, (*spvDescriptorSet0.vp_c16)._m0[2].y);
                _4259 = _4317;
                _4251 = _4313;
                _4289 = true;
            }
            else
            {
                _4259 = (*spvDescriptorSet0.vp_c16)._m0[2].z;
            }
        }
    }
    _4289 = false;
    float _4319 = _4259;
    float _4321 = _4251;
    float _4323 = -(*spvDescriptorSet0.vp_c16)._m0[0].y;
    float _4325 = _4185 + _4323;
    float _4327 = -(*spvDescriptorSet0.vp_c16)._m0[0].x;
    float _4329 = _4191 + _4327;
    float _4331 = -(*spvDescriptorSet0.vp_c16)._m0[0].z;
    float _4333 = _4193 + _4331;
    float _4335 = fma(_4325, _4319, (*spvDescriptorSet0.vp_c16)._m0[0].y);
    float _4337 = fma(_4329, _4319, (*spvDescriptorSet0.vp_c16)._m0[0].x);
    float _4339 = fma(_4333, _4319, (*spvDescriptorSet0.vp_c16)._m0[0].z);
    float _4341 = -_3137;
    float _4343 = _4341 + _4335;
    float _4345 = -_3149;
    float _4347 = _4345 + _4337;
    float _4349 = -_2575;
    float _4351 = _4349 + _4339;
    float _4353 = _4343 * _4343;
    float _4355 = fma(_4347, _4347, _4353);
    float _4357 = fma(_4351, _4351, _4355);
    float _4359 = sqrt(_4357);
    bool _4361 = _4359 > 0.0;
    bool _4363 = (*spvDescriptorSet0.vp_c15)._m0[660].y >= 0.5;
    bool _4365 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _4367 = _4363 || _4365;
    bool _4369 = isnan(0.5);
    bool _4371 = _4367 || _4369;
    float _4373 = _4321;
    float _4375 = (*spvDescriptorSet0.vp_c15)._m0[660].y;
    if (!_4361)
    {
        _4373 = _4337;
    }
    float _4377 = _4373;
    float _4379 = _4377;
    if (!_4361)
    {
        _4253 = _4335;
    }
    float _4381 = _4253;
    float _4383 = _4381;
    float _4385 = _4381;
    if (!_4361)
    {
        _4375 = _4339;
    }
    float _4387 = _4375;
    bool _4389 = !_4361;
    float _4391 = _4387;
    if (!_4389)
    {
        float _4393 = _214 * _214;
        float _4395 = rsqrt(_4357);
        float _4397 = fma(_212, _212, _4393);
        float _4399 = fma(_216, _216, _4397);
        float _4401 = sqrt(_4399);
        float _4403 = _4347 * _4395;
        float _4405 = _4343 * _4395;
        float _4407 = _4351 * _4395;
        bool _4409 = _4401 > 0.0;
        float _4411 = _4401;
        float _4413 = _4395;
        if (!_4409)
        {
            _4411 = _4337;
        }
        float _4415 = _4411;
        _4379 = _4415;
        if (!_4409)
        {
            _4383 = _4335;
        }
        float _4417 = _4383;
        _4385 = _4417;
        if (!_4409)
        {
            _4413 = _4339;
        }
        float _4419 = _4413;
        bool _4421 = !_4409;
        _4391 = _4419;
        if (!_4421)
        {
            float _4423 = rsqrt(_4399);
            float _4425 = 1.0 / (*spvDescriptorSet0.vp_c10)._m0[2].z;
            float _4427 = _214 * _4423;
            float _4429 = _212 * _4423;
            float _4431 = _4405 * _4427;
            float _4433 = _216 * _4423;
            float _4435 = fma(_4403, _4429, _4431);
            float _4437 = _4425 * (*spvDescriptorSet0.vp_c9)._m0[142].x;
            float _4439 = fma(_4407, _4433, _4435);
            float _4441 = _4439 * _4437;
            float _4443 = fma(_212, _4441, _4337);
            float _4445 = fma(_214, _4441, _4335);
            float _4447 = fma(_216, _4441, _4339);
            _4379 = _4443;
            _4385 = _4445;
            _4391 = _4447;
        }
    }
    float _4449 = _4379;
    float _4451 = _4385;
    float _4453 = _4391;
    float _4455 = -_3319;
    float _4457 = fma(_4455, (*spvDescriptorSet0.vp_c9)._m0[18].w, _4449);
    float _4459 = -_3317;
    float _4461 = fma(_4459, (*spvDescriptorSet0.vp_c9)._m0[18].w, _4451);
    float _4463 = -_3427;
    float _4465 = fma(_4463, (*spvDescriptorSet0.vp_c9)._m0[18].w, _4453);
    float _4467 = _4461;
    float _4469 = _4457;
    float _4471 = _4465;
    float _4473 = _4449;
    if (!_4371)
    {
        float _4475 = _3631 * _3631;
        float _4477 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _4479 = -_2575;
        float _4481 = _4479 + _4453;
        float _4483 = fma(_3641, _3641, _4475);
        float _4485 = fma(_3653, _3653, _4483);
        float _4487 = 1.0 / _3745;
        float _4489 = sqrt(_4485);
        float _4491 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _4493 = precise::min(_4489, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _4495 = _4493 * _4477;
        float _4497 = -_3137;
        float _4499 = _4497 + _4451;
        float _4501 = _4491 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _4503 = _4495 * _4487;
        float _4505 = -_3149;
        float _4507 = _4505 + _4449;
        float _4509 = _4501 * _4503;
        float _4511 = _4481 * _4503;
        float _4513 = fma(_4507, _4509, _3625);
        float _4515 = fma(_4499, _4509, _3619);
        float _4517 = fma(_4501, _4511, _3637);
        _4467 = _4515;
        _4469 = _4513;
        _4471 = _4517;
    }
    float _4519 = _4467;
    float _4521 = _4469;
    float _4523 = _4471;
    float _4525 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _4527 = _4519 + _4525;
    float _4529 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _4531 = _4521 + _4529;
    float _4533 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _4535 = _4523 + _4533;
    float _4537 = _4527 * _4527;
    float _4539 = fma(_4531, _4531, _4537);
    float _4541 = fma(_4535, _4535, _4539);
    float _4543 = rsqrt(_4541);
    float _4545 = _4543 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _4547 = _4531 * _4545;
    float _4549 = _4535 * _4545;
    float _4551 = _4547 * _4547;
    float _4553 = _4549 * _4549;
    float _4555 = _4551 + _4553;
    float _4557 = sqrt(_4555);
    bool _4559 = _4557 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _4561 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _4563 = _4557 + _4561;
    float _4565 = _4535;
    float _4567 = _4563;
    if (_4559)
    {
        float _4569 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _4565 = _4569;
    }
    float _4571 = _4565;
    if (_4559)
    {
        float _4573 = rsqrt(_4555);
        _222 = _4573;
    }
    float _4575 = _222;
    float _4577 = _4575;
    if (_4559)
    {
        float _4579 = _4563 * _4571;
        _4567 = _4579;
    }
    float _4581 = _4567;
    if (_4559)
    {
        float _4583 = _4581 * 0.15915493667125701904296875;
        _4473 = _4583;
    }
    float _4585 = _4473;
    float _4587 = _4543;
    if (_4559)
    {
        float _4589 = _4585 * 6.283185482025146484375;
        float _4591 = cos(_4589);
        _4587 = _4591;
    }
    float _4593 = _4587;
    float _4595 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _4597 = precise::max(0.0, _4595);
    float _4599 = _4539;
    float _4601 = _4597;
    float _4603 = _4595;
    if (_4559)
    {
        float _4605 = _4585 * 6.283185482025146484375;
        float _4607 = sin(_4605);
        _4599 = _4607;
    }
    float _4609 = _4599;
    float _4611 = -_4545;
    float _4613 = -_4597;
    float _4615 = fma(_4527, _4611, _4613);
    float _4617 = (*spvDescriptorSet0.vp_c15)._m0[652].x;
    if (_4559)
    {
        float _4619 = _4615 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _4601 = _4619;
    }
    float _4621 = _4601;
    float _4623 = _4621;
    float _4625 = _4593;
    if (_4559)
    {
        float _4627 = _4593 + (-1.0);
        _4603 = _4627;
    }
    float _4629 = _4603;
    float _4631 = fma(_3625, (*spvDescriptorSet0.vp_c15)._m0[652].x, (*spvDescriptorSet0.vp_c15)._m0[652].z);
    float _4633 = _4629;
    if (!_4559)
    {
        _4617 = _4553;
    }
    float _4635 = _4617;
    float _4637 = _4635;
    if (_4559)
    {
        float _4639 = _4629 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _4633 = _4639;
    }
    float _4641 = _4633;
    float _4643 = floor(_4631);
    float _4645 = _4609;
    if (_4559)
    {
        float _4647 = fma(_4609, _4621, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _4623 = _4647;
    }
    float _4649 = _4623;
    float _4651 = _4649;
    if (!_4559)
    {
        _4645 = _4615;
    }
    float _4653 = _4645;
    float _4655 = _4653;
    if (_4559)
    {
        float _4657 = fma(_4615, _4593, _4641);
        _4655 = _4657;
    }
    float _4659 = _4655;
    if (!_4559)
    {
        _4625 = _4549;
    }
    float _4661 = _4625;
    float _4663 = _4661;
    if (_4559)
    {
        float _4665 = _4575 * _4649;
        _4129 = _4665;
    }
    float _4667 = _4129;
    if (!_4559)
    {
        _4577 = _4547;
    }
    float _4669 = _4577;
    float _4671 = sqrt(_4541);
    float _4673 = _4669;
    if (!_4559)
    {
        _4651 = _4551;
    }
    float _4675 = _4651;
    float _4677 = _4675;
    if (_4559)
    {
        float _4679 = _4547 * _4667;
        _4673 = _4679;
    }
    float _4681 = _4673;
    if (_4559)
    {
        float _4683 = _4549 * _4667;
        _4663 = _4683;
    }
    float _4685 = _4663;
    if (_4559)
    {
        float _4687 = _4681 * _4681;
        _4677 = _4687;
    }
    float _4689 = _4677;
    if (_4559)
    {
        float _4691 = _4685 * _4685;
        _4637 = _4691;
    }
    float _4693 = _4637;
    float _4695 = _4519 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _4697 = fma(_4659, _4659, _4689);
    float _4699 = -_4643;
    float _4701 = _4631 + _4699;
    float _4703 = fma(_4521, (*spvDescriptorSet0.vp_c8)._m0[2].x, _4695);
    float _4705 = _4697 + _4693;
    float _4707 = fma(_3637, (*spvDescriptorSet0.vp_c15)._m0[652].y, (*spvDescriptorSet0.vp_c15)._m0[652].w);
    float _4709 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _4711 = fma(_4671, (*spvDescriptorSet0.vp_c15)._m0[23].w, _4709);
    float _4713 = precise::clamp(_4711, 0.0, 1.0);
    float _4715 = fma(_4523, (*spvDescriptorSet0.vp_c8)._m0[2].z, _4703);
    float _4717 = rsqrt(_4705);
    float _4719 = -_4713;
    float _4721 = _4719 + 1.0;
    float _4723 = _4715 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _4725 = _4519 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _4727 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _4729 = _4723 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _4731 = abs(_4721);
    float _4733 = log2(_4731);
    float _4735 = _4519 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _4737 = fma(_4521, (*spvDescriptorSet0.vp_c8)._m0[3].x, _4725);
    float _4739 = -_4729;
    float _4741 = fma(_4739, _4727, 1.0);
    float _4743 = _4519 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _4745 = fma(_4521, (*spvDescriptorSet0.vp_c8)._m0[1].x, _4735);
    float _4747 = fma(_4523, (*spvDescriptorSet0.vp_c8)._m0[3].z, _4737);
    float _4749 = _4717 * _4681;
    float _4751 = fma(_4521, (*spvDescriptorSet0.vp_c8)._m0[0].x, _4743);
    float _4753 = fma(_4523, (*spvDescriptorSet0.vp_c8)._m0[1].z, _4745);
    float _4755 = _4717 * _4659;
    float _4757 = _4749 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _4759 = fma(_4523, (*spvDescriptorSet0.vp_c8)._m0[0].z, _4751);
    float _4761 = _4753 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _4763 = _4717 * _4685;
    float _4765 = -_4757;
    float _4767 = fma(_4755, (*spvDescriptorSet0.vp_c15)._m0[21].y, _4765);
    float _4769 = _4759 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _4771 = _4761 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _4773 = _4747 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _4775 = -_4763;
    float _4777 = fma(_4775, (*spvDescriptorSet0.vp_c15)._m0[21].z, _4767);
    float _4779 = _4733 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _4781 = fma(_4769, (*spvDescriptorSet0.vp_c8)._m0[7].x, _4771);
    float _4783 = floor(_4707);
    float _4785 = fma(_4777, -0.5, 0.5);
    float _4787 = fma(_4723, (*spvDescriptorSet0.vp_c8)._m0[7].z, _4781);
    float _4789 = fma(_4777, 0.5, 0.5);
    float _4791 = _4761 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _4793 = _4755 + 1.0;
    float _4795 = fma(_4773, (*spvDescriptorSet0.vp_c8)._m0[7].w, _4787);
    float _4797 = exp2(_4779);
    float _4799 = _4761 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _4801 = fma(_4789, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _4803 = fma(_4769, (*spvDescriptorSet0.vp_c8)._m0[5].x, _4791);
    float _4805 = fma(_4769, (*spvDescriptorSet0.vp_c8)._m0[4].x, _4799);
    float _4807 = fma(_4789, _4801, -0.212114393711090087890625);
    float _4809 = fma(_4723, (*spvDescriptorSet0.vp_c8)._m0[5].z, _4803);
    float _4811 = sqrt(_4785);
    float _4813 = fma(_4723, (*spvDescriptorSet0.vp_c8)._m0[4].z, _4805);
    float _4815 = fma(_4789, _4807, 1.570728778839111328125);
    float _4817 = fma(_4773, (*spvDescriptorSet0.vp_c8)._m0[5].w, _4809);
    float _4819 = -_4783;
    float _4821 = _4707 + _4819;
    float _4823 = fma(_4773, (*spvDescriptorSet0.vp_c8)._m0[4].w, _4813);
    float _4825 = log2(_4741);
    float _4827 = -_4755;
    float _4829 = fma(_4797, _4793, _4827);
    float _4831 = 1.0 / _4795;
    float _4833 = _4811 * 0.636619746685028076171875;
    float2 _12758 = float2(_4701, _4821);
    float _4835 = dm_bs(spvDescriptorSet0.vp_t_tcb_24.sample(spvDescriptorSet0.vp_t_tcb_24Smplr, select(_12758, float2(0.0), isnan(_12758)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_24, spvDescriptorSet0.vp_t_tcb_24Smplr_w, select(_12758, float2(0.0), isnan(_12758)), level(0.0)).x;
    float _4837 = _4825 * 0.693147182464599609375;
    float _4839 = _4823 * _4831;
    float _4841 = _4817 * _4831;
    float _4843 = -_4815;
    float _4845 = fma(_4833, _4843, 1.0);
    float _4847 = _4837 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _4849 = fma(_4839, 0.5, 0.5);
    float _4851 = fma(_4841, -0.5, 0.5);
    float _4853 = fma(_4829, 0.5, 0.5);
    float3 _12793 = float3(_4849, _4851, _4847);
    float _4855 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_12793, float3(0.0), isnan(_12793)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_12793, float3(0.0), isnan(_12793)), level(0.0)).x;
    float3 _12804 = float3(_4849, _4851, _4847);
    float4 _4858 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_12804, float3(0.0), isnan(_12804)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_12804, float3(0.0), isnan(_12804)), level(0.0)).xyzw;
    float _4860 = _4858.x;
    float _4862 = _4858.y;
    float _4864 = _4858.z;
    float _4866 = _4858.w;
    float2 _12820 = float2(_4845, _4853);
    float3 _4870 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_12820, float2(0.0), isnan(_12820)), level(0.0)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_12820, float2(0.0), isnan(_12820)), level(0.0)).xyz;
    float _4872 = _4870.x;
    float _4874 = _4870.y;
    float _4876 = _4870.z;
    float _4878 = _3619 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _4880 = _4761 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    out.m_99.x = _3625;
    out.m_99.y = _3619;
    out.m_99.z = _3637;
    float _4882 = fma(_3625, (*spvDescriptorSet0.vp_c8)._m0[11].x, _4878);
    float _4884 = fma(_4769, (*spvDescriptorSet0.vp_c8)._m0[6].x, _4880);
    out.m_101.x = _4521;
    out.m_101.y = _4519;
    out.m_101.z = _4523;
    float _4886 = fma(_3637, (*spvDescriptorSet0.vp_c8)._m0[11].z, _4882);
    float _4888 = _3619 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _4890 = fma(_4723, (*spvDescriptorSet0.vp_c8)._m0[6].z, _4884);
    float _4892 = _4886 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _4894 = fma(_3625, (*spvDescriptorSet0.vp_c8)._m0[10].x, _4888);
    float _4896 = _4795 * 0.5;
    float _4898 = fma(_4773, (*spvDescriptorSet0.vp_c8)._m0[6].w, _4890);
    float _4900 = 1.0 / _4892;
    float _4902 = fma(_3637, (*spvDescriptorSet0.vp_c8)._m0[10].z, _4894);
    float _4904 = _4823 + _4795;
    bool _4906 = _4671 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _4908 = isnan(_4671);
    bool _4910 = _4906 || _4908;
    bool _4912 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _4914 = _4910 || _4912;
    out.gl_Position.x = _4823;
    out.gl_Position.y = _4817;
    out.gl_Position.z = _4898;
    out.gl_Position.w = _4795;
    float _4916 = _4902 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _4918 = _4904 * 0.5;
    float _4920 = _4916 + _4892;
    float _4922 = _4920 * _4900;
    float _4924 = _4922 * 0.5;
    if (!_4914)
    {
        _3693 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _4926 = _3693;
    float _4928 = in.m_103.x;
    float _4930 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _4932 = fma(_4924, (*spvDescriptorSet0.vp_c8)._m0[30].w, _4930);
    float _4934 = 1.0 / _4932;
    float _4936 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _4938 = _4934 * _4936;
    float _4940 = abs(_4938);
    float _4942 = log2(_4940);
    float _4944 = _4942 * (*spvDescriptorSet0.vp_c15)._m0[654].z;
    float _4946 = exp2(_4944);
    float _4948 = fma(_4946, (*spvDescriptorSet0.vp_c15)._m0[654].x, (*spvDescriptorSet0.vp_c15)._m0[654].y);
    float _4950 = precise::clamp(_4948, 0.0, 1.0);
    float _4952 = fma(_4950, -2.0, 3.0);
    float _4954 = _4950 * _4950;
    float _4956 = _4954 * _4952;
    float _4958 = _4733 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    bool _4960 = _4938 <= 8000.0;
    bool _4962 = isnan(_4938);
    bool _4964 = _4960 || _4962;
    bool _4966 = isnan(8000.0);
    bool _4968 = _4964 || _4966;
    float _4970 = float(_4968);
    float _4972 = -_4956;
    float _4974 = _4972 + 1.0;
    float _4976 = exp2(_4958);
    float _4978 = fma(_4974, (*spvDescriptorSet0.vp_c15)._m0[654].w, _4956);
    float _4980 = fma(_4817, -0.5, _4896);
    float _4982 = _4898 + _4795;
    float _4984 = _4970 * _4978;
    float _4986 = _4982 * 0.5;
    float _4988 = _4984 * (*spvDescriptorSet0.vp_c15)._m0[653].x;
    out.m_105.x = _4918;
    out.m_105.y = _4980;
    out.m_105.z = _4986;
    out.m_105.w = _4795;
    float _4990 = -_4976;
    float _4992 = _4990 + 1.0;
    float _4994 = _4992 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _4996 = -_4994;
    float _4998 = _4996 + 1.0;
    float _5000 = -_4835;
    float _5002 = _5000 + 1.0;
    float _5004 = _5002 * _4988;
    float _5006 = precise::clamp(_5004, 0.0, 1.0);
    float _5008 = -_5006;
    float _5010 = fma(_5008, (*spvDescriptorSet0.vp_c15)._m0[653].y, 1.0);
    float _5012 = (*spvDescriptorSet0.vp_c15)._m0[653].y;
    float _5014 = _4998;
    float _5016 = _4862;
    float _5018 = _4926;
    float _5020 = _4926;
    if (!_4914)
    {
        _5012 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _5022 = _5012;
    float _5024 = _5010 * _4928;
    float _5026 = _4994 * _4855;
    float _5028 = _4866 * _4998;
    float _5030 = _5024;
    float _5032 = _5022;
    float _5034 = _5022;
    if (!_4914)
    {
        _5014 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _5036 = _5014;
    float _5038 = _4866 * _5026;
    float _5040 = _4876 * _5026;
    float _5042 = fma(_4872, _5038, _4860);
    float _5044 = fma(_4874, _5038, _4862);
    float _5046 = _5024 * (*spvDescriptorSet0.vp_c13)._m0[1].w;
    float _5048 = fma(_4866, _5040, _4864);
    float _5050 = _5038;
    float _5052 = _5036;
    float _5054 = _5036;
    if (!_4914)
    {
        _5016 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _5056 = _5016;
    float _5058 = _5056;
    float _5060 = _5056;
    if (!_4914)
    {
        _5030 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _5062 = _5030;
    out.m_107.x = _5046;
    float _5064 = _5062;
    float _5066 = _5062;
    if (!_4914)
    {
        _5050 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _5068 = _5050;
    out.m_109.x = _5042;
    out.m_109.y = _5044;
    out.m_109.z = _5048;
    out.m_109.w = _5028;
    bool _5070 = !_4914;
    float _5072 = _5068;
    float _5074 = _5068;
    if (!_5070)
    {
        bool _5076 = _4671 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _5078 = isnan(_4671);
        bool _5080 = _5076 || _5078;
        bool _5082 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _5084 = _5080 || _5082;
        if (!_5084)
        {
            float _5086 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _5088 = _4671 + _5086;
            float _5090 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _5092 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _5090;
            float _5094 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _5096 = _5094 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _5098 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _5100 = _5098 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _5102 = 1.0 / _5092;
            float _5104 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _5106 = _5104 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _5108 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _5110 = _5108 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _5112 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _5114 = _5112 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _5116 = _5088 * _5102;
            float _5118 = precise::clamp(_5116, 0.0, 1.0);
            float _5120 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _5122 = _5120 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _5124 = fma(_5118, _5096, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _5126 = fma(_5118, _5100, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _5128 = fma(_5118, _5122, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _5130 = fma(_5118, _5106, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _5132 = fma(_5118, _5110, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _5134 = fma(_5118, _5114, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            _5074 = _5124;
            _5034 = _5132;
            _5020 = _5126;
            _5060 = _5130;
            _5054 = _5128;
            _5066 = _5134;
            _5136 = true;
        }
        else
        {
            bool _5138 = _4671 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _5140 = isnan(_4671);
            bool _5142 = _5138 || _5140;
            bool _5144 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _5146 = _5142 || _5144;
            if (!_5146)
            {
                _5058 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _5148 = _5058;
            _5060 = _5148;
            if (!_5146)
            {
                _5032 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _5150 = _5032;
            _5034 = _5150;
            if (!_5146)
            {
                _5064 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _5152 = _5064;
            _5066 = _5152;
            if (!_5146)
            {
                _5018 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _5154 = _5018;
            _5020 = _5154;
            if (!_5146)
            {
                _5072 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _5156 = _5072;
            _5074 = _5156;
            if (!_5146)
            {
                _5052 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _5158 = _5052;
            bool _5160 = !_5146;
            _5054 = _5158;
            if (!_5160)
            {
                bool _5162 = _4671 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _5164 = isnan(_4671);
                bool _5166 = _5162 || _5164;
                bool _5168 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _5170 = _5166 || _5168;
                if (!_5170)
                {
                    float _5172 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _5174 = _4671 + _5172;
                    float _5176 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _5178 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _5176;
                    float _5180 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _5182 = _5180 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _5184 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _5186 = _5184 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _5188 = 1.0 / _5178;
                    float _5190 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _5192 = _5190 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _5194 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _5196 = _5194 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _5198 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _5200 = _5198 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _5202 = _5174 * _5188;
                    float _5204 = precise::clamp(_5202, 0.0, 1.0);
                    float _5206 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _5208 = _5206 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _5210 = fma(_5204, _5182, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _5212 = fma(_5204, _5186, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _5214 = fma(_5204, _5208, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _5216 = fma(_5204, _5192, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _5218 = fma(_5204, _5196, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _5220 = fma(_5204, _5200, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    _5074 = _5210;
                    _5034 = _5218;
                    _5020 = _5212;
                    _5060 = _5216;
                    _5054 = _5214;
                    _5066 = _5220;
                    _5136 = true;
                }
                else
                {
                    _5074 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _5034 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _5020 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _5060 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _5054 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _5066 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _5136 = false;
    float _5222 = _5074;
    float _5224 = _5034;
    float _5226 = _5020;
    float _5228 = _5060;
    float _5230 = _5054;
    float _5232 = _5066;
    float _5234 = fma(_4235, -0.5, 0.5);
    float _5236 = precise::clamp(_5234, 0.0, 1.0);
    float _5238 = -_5222;
    float _5240 = _5224 + _5238;
    float _5242 = -_5226;
    float _5244 = _5228 + _5242;
    float _5246 = -_5230;
    float _5248 = _5232 + _5246;
    bool _5250 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _5252 = fma(_5236, _5240, _5222);
    float _5254 = fma(_5236, _5244, _5226);
    float _5256 = fma(_5236, _5248, _5230);
    float _5258 = _5252 * 0.586610972881317138671875;
    out.m_111.x = 0.0;
    float _5260 = fma(_5254, 0.298911988735198974609375, _5258);
    float _5262 = fma(_5256, 0.114477999508380889892578125, _5260);
    float _5264 = -_5262;
    float _5266 = _5254 + _5264;
    float _5268 = -_5262;
    float _5270 = _5252 + _5268;
    float _5272 = -_5262;
    float _5274 = _5256 + _5272;
    float _5276 = (*spvDescriptorSet0.vp_c10)._m0[3].x * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _5278 = fma(_5266, (*spvDescriptorSet0.vp_c13)._m0[1].z, _5262);
    float _5280 = fma(_5270, (*spvDescriptorSet0.vp_c13)._m0[1].z, _5262);
    float _5282 = fma(_5274, (*spvDescriptorSet0.vp_c13)._m0[1].z, _5262);
    out.m_51.x = _5276;
    out.m_113.x = _5278;
    out.m_113.y = _5280;
    out.m_113.z = _5282;
    if (!_5250)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _5284 = -_4519;
    float _5286 = _5284 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
    float _5288 = -_4521;
    float _5290 = _5288 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
    float _5292 = -_4523;
    float _5294 = _5292 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
    float _5296 = _5286 * _5286;
    float _5298 = fma(_5290, _5290, _5296);
    float _5300 = fma(_5294, _5294, _5298);
    float _5302 = sqrt(_5300);
    float _5304 = rsqrt(_5300);
    float _5306 = -_5302;
    float _5308 = _5306 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _5310 = _5308 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
    float _5312 = precise::clamp(_5310, 0.0, 1.0);
    float _5314 = _5290 * _5304;
    float _5316 = _5286 * _5304;
    float _5318 = abs(_5312);
    float _5320 = log2(_5318);
    float _5322 = _5294 * _5304;
    float _5324 = _5314 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
    float _5326 = _4235 * _5316;
    float _5328 = -_5316;
    float _5330 = -_5324;
    float _5332 = fma(_5328, (*spvDescriptorSet0.vp_c15)._m0[656].y, _5330);
    float _5334 = fma(_4233, _5314, _5326);
    float _5336 = -_5322;
    float _5338 = fma(_5336, (*spvDescriptorSet0.vp_c15)._m0[656].z, _5332);
    float _5340 = fma(_4239, _5322, _5334);
    float _5342 = precise::clamp(_5340, 0.0, 1.0);
    float _5344 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
    float _5346 = _5338 + _5344;
    float _5348 = _5320 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
    float _5350 = _5346 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
    float _5352 = precise::clamp(_5350, 0.0, 1.0);
    float _5354 = exp2(_5348);
    float _5356 = _5354 * _5352;
    float _5358 = _5342 * _5356;
    float _5360 = _5358 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
    float _5362 = _5358 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
    float _5364 = _5358 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
    out.m_111.x = _5360;
    out.m_111.y = _5362;
    out.m_111.z = _5364;
    out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
}


vertex main0_out main0_z(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]])
{
    main0_out out = {};
    out.m_65 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_67 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_75 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_85 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_95 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_99 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_97 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_101 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_79 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_73 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_93 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_105 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_51 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_111 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_107 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_109 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_113 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_59 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_69 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_77 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_83 = float4(0.0, 0.0, 0.0, 1.0);
    bool _5136 = false;
    bool _4289 = false;
    bool _1650 = false;
    bool _1204 = false;
    bool _1100 = false;
    bool _932 = false;
    bool _752 = false;
    bool _464 = false;
    bool _242 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _127 = in.m_48.w;
    float _129 = trunc(_127);
    int _132 = int(_129);
    bool _136 = _132 >= 1;
    float _138 = 0.0;
    if (!_136)
    {
        _138 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _140 = _138;
    float _142 = _140;
    if (!_136)
    {
        out.m_51.x = 0.0;
    }
    int _144 = 0;
    if (!_136)
    {
        float _146 = _140 * 5.0;
        _144 = as_type<int>(_146);
    }
    int _148 = _144;
    int _150 = _148;
    if (!_136)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _5421 = as_type<float>(_148);
        out.gl_Position.z = _5421;
    }
    if (!_136)
    {
        return out;
    }
    float _152 = in.m_53.w;
    bool _154 = _152 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _156 = isnan(_152);
    bool _158 = _154 || _156;
    bool _160 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _162 = _158 || _160;
    float _164 = -_152;
    float _166 = _164 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    float _168 = _166;
    if (_162)
    {
        float _170 = float(_132);
        _142 = _170;
    }
    float _172 = _142;
    bool _174 = _166 >= _172;
    bool _176 = !_162;
    bool _178 = _174 || _176;
    float _180 = _172;
    if (_178)
    {
        _180 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _182 = _180;
    if (_178)
    {
        out.m_51.x = 0.0;
    }
    if (_178)
    {
        float _184 = _182 * 5.0;
        _150 = as_type<int>(_184);
    }
    int _186 = _150;
    if (_178)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _5491 = as_type<float>(_186);
        out.gl_Position.z = _5491;
    }
    if (_178)
    {
        return out;
    }
    float _188 = in.m_55.x;
    bool _190 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _192 = in.m_55.y;
    float _194 = in.m_57.x;
    float _196 = in.m_57.y;
    float _198 = in.m_57.z;
    out.m_59.x = _188;
    out.m_59.y = _192;
    float _200 = _196 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _202 = _196 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _204 = _196 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _206 = fma(_194, (*spvDescriptorSet0.vp_c10)._m0[4].x, _200);
    float _208 = fma(_194, (*spvDescriptorSet0.vp_c10)._m0[5].x, _202);
    float _210 = fma(_194, (*spvDescriptorSet0.vp_c10)._m0[6].x, _204);
    float _212 = fma(_198, (*spvDescriptorSet0.vp_c10)._m0[4].z, _206);
    float _214 = fma(_198, (*spvDescriptorSet0.vp_c10)._m0[5].z, _208);
    float _216 = fma(_198, (*spvDescriptorSet0.vp_c10)._m0[6].z, _210);
    bool _218 = !_190;
    float _220 = _188;
    float _222 = _216;
    float _240;
    if (!_218)
    {
        float _224 = in.m_61.x;
        float _226 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _228 = _224 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _230 = fma(_228, (*spvDescriptorSet0.vp_c9)._m0[12].x, _166);
        float _232 = _230 * _226;
        float _234 = floor(_232);
        float _236 = -_234;
        float _238 = _232 + _236;
        _240 = _238;
        _242 = true;
    }
    else
    {
        float _244 = float(_132);
        float _246 = 1.0 / _244;
        float _248 = _166 * _246;
        _240 = _248;
    }
    _242 = false;
    float _250 = _240;
    float _252 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _254 = _250 + _252;
    float _256 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _258 = _250 + _256;
    bool _260 = _250 >= (*spvDescriptorSet0.vp_c9)._m0[146].w;
    bool _262 = isnan(_250);
    bool _264 = _260 || _262;
    bool _266 = isnan((*spvDescriptorSet0.vp_c9)._m0[146].w);
    bool _268 = _264 || _266;
    float _270 = float(_268);
    float _272 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _274 = (*spvDescriptorSet0.vp_c9)._m0[146].w + _272;
    float _276 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _278 = _250 + _276;
    float _280 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _282 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _280;
    float _284 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _286 = _284 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _288 = 1.0 / _274;
    bool _290 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].x;
    float _292 = 1.0 / _286;
    float _294 = 1.0 / _282;
    float _296 = _254 * _288;
    bool _298 = _250 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _300 = isnan(_250);
    bool _302 = _298 || _300;
    bool _304 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _306 = _302 || _304;
    float _308 = float(_306);
    float _310 = -_270;
    float _312 = _310 + 1.0;
    float _314 = _308 * _312;
    float _316 = _258 * _292;
    bool _318 = _250 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _320 = isnan(_250);
    bool _322 = _318 || _320;
    bool _324 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _326 = _322 || _324;
    float _328 = float(_326);
    float _330 = -(*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _332 = (*spvDescriptorSet0.vp_c9)._m0[144].z + _330;
    bool _334 = _250 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _336 = isnan(_250);
    bool _338 = _334 || _336;
    bool _340 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _342 = _338 || _340;
    float _344 = float(_342);
    float _346 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _348 = _346 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _350 = -_308;
    float _352 = _350 + 1.0;
    float _354 = -_328;
    float _356 = _354 + 1.0;
    float _358 = _278 * _294;
    float _360 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _362 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _360;
    float _364 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _366 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _364;
    float _368 = _344 * _356;
    float _370 = fma(_332, _358, (*spvDescriptorSet0.vp_c9)._m0[143].z);
    float _372 = fma(_362, _358, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _374 = fma(_366, _358, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _376 = _328 * _352;
    float _378 = -_344;
    float _380 = _378 + 1.0;
    float _382 = _372 * _368;
    float _384 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _386 = _384 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _388 = -(*spvDescriptorSet0.vp_c9)._m0[144].z;
    float _390 = _388 + (*spvDescriptorSet0.vp_c9)._m0[145].z;
    float _392 = _374 * _368;
    float _394 = _370 * _368;
    float _396 = fma(_380, (*spvDescriptorSet0.vp_c9)._m0[143].x, _382);
    float _398 = fma(_380, (*spvDescriptorSet0.vp_c9)._m0[143].y, _392);
    float _400 = fma(_380, (*spvDescriptorSet0.vp_c9)._m0[143].z, _394);
    float _402 = fma(_348, _316, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _404 = fma(_386, _316, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _406 = fma(_390, _316, (*spvDescriptorSet0.vp_c9)._m0[144].z);
    float _408 = -(*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _410 = (*spvDescriptorSet0.vp_c9)._m0[146].x + _408;
    float _412 = -(*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _414 = (*spvDescriptorSet0.vp_c9)._m0[146].y + _412;
    float _416 = -(*spvDescriptorSet0.vp_c9)._m0[145].z;
    float _418 = (*spvDescriptorSet0.vp_c9)._m0[146].z + _416;
    float _420 = fma(_402, _376, _396);
    float _422 = fma(_410, _296, (*spvDescriptorSet0.vp_c9)._m0[145].x);
    float _424 = fma(_414, _296, (*spvDescriptorSet0.vp_c9)._m0[145].y);
    float _426 = fma(_418, _296, (*spvDescriptorSet0.vp_c9)._m0[145].z);
    float _428 = fma(_404, _376, _398);
    float _430 = fma(_406, _376, _400);
    float _432 = fma(_422, _314, _420);
    float _434 = fma(_424, _314, _428);
    float _436 = fma(_426, _314, _430);
    float _438 = fma(_270, (*spvDescriptorSet0.vp_c9)._m0[146].x, _432);
    float _440 = fma(_270, (*spvDescriptorSet0.vp_c9)._m0[146].y, _434);
    float _442 = fma(_270, (*spvDescriptorSet0.vp_c9)._m0[146].z, _436);
    bool _444 = !_290;
    float _462;
    if (!_444)
    {
        float _446 = in.m_61.x;
        float _448 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].x;
        float _450 = _446 * (*spvDescriptorSet0.vp_c9)._m0[12].y;
        float _452 = fma(_450, (*spvDescriptorSet0.vp_c9)._m0[11].x, _166);
        float _454 = _452 * _448;
        float _456 = floor(_454);
        float _458 = -_456;
        float _460 = _454 + _458;
        _462 = _460;
        _464 = true;
    }
    else
    {
        float _466 = float(_132);
        float _468 = 1.0 / _466;
        float _470 = _166 * _468;
        _462 = _470;
    }
    _464 = false;
    float _472 = _462;
    float _474 = in.m_63.x;
    float _476 = in.m_63.y;
    float _478 = in.m_63.z;
    float _480 = -(*spvDescriptorSet0.vp_c9)._m0[109].w;
    float _482 = (*spvDescriptorSet0.vp_c9)._m0[110].w + _480;
    float _484 = -(*spvDescriptorSet0.vp_c9)._m0[110].w;
    float _486 = _484 + (*spvDescriptorSet0.vp_c9)._m0[111].w;
    float _488 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _490 = (*spvDescriptorSet0.vp_c9)._m0[108].w + _488;
    float _492 = -(*spvDescriptorSet0.vp_c9)._m0[108].w;
    float _494 = _492 + (*spvDescriptorSet0.vp_c9)._m0[109].w;
    float _496 = 1.0 / _482;
    bool _498 = _472 >= (*spvDescriptorSet0.vp_c9)._m0[111].w;
    bool _500 = isnan(_472);
    bool _502 = _498 || _500;
    bool _504 = isnan((*spvDescriptorSet0.vp_c9)._m0[111].w);
    bool _506 = _502 || _504;
    float _508 = float(_506);
    float _510 = 1.0 / _490;
    bool _512 = _472 >= (*spvDescriptorSet0.vp_c9)._m0[109].w;
    bool _514 = isnan(_472);
    bool _516 = _512 || _514;
    bool _518 = isnan((*spvDescriptorSet0.vp_c9)._m0[109].w);
    bool _520 = _516 || _518;
    float _522 = float(_520);
    bool _524 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _526 = _442 * _478;
    float _528 = _440 * _476;
    float _530 = 1.0 / _494;
    float _532 = -(*spvDescriptorSet0.vp_c9)._m0[109].w;
    float _534 = _472 + _532;
    float _536 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _538 = _472 + _536;
    float _540 = -(*spvDescriptorSet0.vp_c9)._m0[108].w;
    float _542 = _472 + _540;
    float _544 = -(*spvDescriptorSet0.vp_c9)._m0[110].w;
    float _546 = _472 + _544;
    float _548 = _534 * _496;
    float _550 = 1.0 / _486;
    bool _552 = _472 >= (*spvDescriptorSet0.vp_c9)._m0[110].w;
    bool _554 = isnan(_472);
    bool _556 = _552 || _554;
    bool _558 = isnan((*spvDescriptorSet0.vp_c9)._m0[110].w);
    bool _560 = _556 || _558;
    float _562 = float(_560);
    float _564 = _538 * _510;
    float _566 = -(*spvDescriptorSet0.vp_c9)._m0[107].x;
    float _568 = (*spvDescriptorSet0.vp_c9)._m0[108].x + _566;
    float _570 = -_562;
    float _572 = _570 + 1.0;
    float _574 = fma(_568, _564, (*spvDescriptorSet0.vp_c9)._m0[107].x);
    float _576 = _542 * _530;
    float _578 = -(*spvDescriptorSet0.vp_c9)._m0[107].y;
    float _580 = (*spvDescriptorSet0.vp_c9)._m0[108].y + _578;
    float _582 = -(*spvDescriptorSet0.vp_c9)._m0[107].z;
    float _584 = (*spvDescriptorSet0.vp_c9)._m0[108].z + _582;
    float _586 = fma(_580, _564, (*spvDescriptorSet0.vp_c9)._m0[107].y);
    float _588 = fma(_584, _564, (*spvDescriptorSet0.vp_c9)._m0[107].z);
    float _590 = _522 * _572;
    float _592 = _546 * _550;
    float _594 = -_508;
    float _596 = _594 + 1.0;
    bool _598 = _472 >= (*spvDescriptorSet0.vp_c9)._m0[108].w;
    bool _600 = isnan(_472);
    bool _602 = _598 || _600;
    bool _604 = isnan((*spvDescriptorSet0.vp_c9)._m0[108].w);
    bool _606 = _602 || _604;
    float _608 = float(_606);
    float _610 = -_522;
    float _612 = _610 + 1.0;
    float _614 = -(*spvDescriptorSet0.vp_c9)._m0[108].y;
    float _616 = _614 + (*spvDescriptorSet0.vp_c9)._m0[109].y;
    float _618 = _562 * _596;
    bool _620 = _472 >= (*spvDescriptorSet0.vp_c9)._m0[107].w;
    bool _622 = isnan(_472);
    bool _624 = _620 || _622;
    bool _626 = isnan((*spvDescriptorSet0.vp_c9)._m0[107].w);
    bool _628 = _624 || _626;
    float _630 = float(_628);
    float _632 = -(*spvDescriptorSet0.vp_c9)._m0[108].x;
    float _634 = _632 + (*spvDescriptorSet0.vp_c9)._m0[109].x;
    float _636 = _608 * _612;
    float _638 = -_608;
    float _640 = _638 + 1.0;
    float _642 = -(*spvDescriptorSet0.vp_c9)._m0[108].z;
    float _644 = _642 + (*spvDescriptorSet0.vp_c9)._m0[109].z;
    float _646 = fma(_634, _576, (*spvDescriptorSet0.vp_c9)._m0[108].x);
    float _648 = fma(_616, _576, (*spvDescriptorSet0.vp_c9)._m0[108].y);
    float _650 = _630 * _640;
    float _652 = fma(_644, _576, (*spvDescriptorSet0.vp_c9)._m0[108].z);
    float _654 = -_630;
    float _656 = _654 + 1.0;
    float _658 = _574 * _650;
    float _660 = _586 * _650;
    float _662 = _588 * _650;
    float _664 = -(*spvDescriptorSet0.vp_c9)._m0[109].x;
    float _666 = (*spvDescriptorSet0.vp_c9)._m0[110].x + _664;
    float _668 = fma(_656, (*spvDescriptorSet0.vp_c9)._m0[107].x, _658);
    float _670 = fma(_656, (*spvDescriptorSet0.vp_c9)._m0[107].y, _660);
    float _672 = -(*spvDescriptorSet0.vp_c9)._m0[109].y;
    float _674 = (*spvDescriptorSet0.vp_c9)._m0[110].y + _672;
    float _676 = fma(_656, (*spvDescriptorSet0.vp_c9)._m0[107].z, _662);
    float _678 = -(*spvDescriptorSet0.vp_c9)._m0[109].z;
    float _680 = (*spvDescriptorSet0.vp_c9)._m0[110].z + _678;
    float _682 = fma(_646, _636, _668);
    float _684 = fma(_648, _636, _670);
    float _686 = fma(_666, _548, (*spvDescriptorSet0.vp_c9)._m0[109].x);
    float _688 = fma(_674, _548, (*spvDescriptorSet0.vp_c9)._m0[109].y);
    float _690 = fma(_652, _636, _676);
    float _692 = -(*spvDescriptorSet0.vp_c9)._m0[110].x;
    float _694 = _692 + (*spvDescriptorSet0.vp_c9)._m0[111].x;
    float _696 = -(*spvDescriptorSet0.vp_c9)._m0[110].y;
    float _698 = _696 + (*spvDescriptorSet0.vp_c9)._m0[111].y;
    float _700 = fma(_680, _548, (*spvDescriptorSet0.vp_c9)._m0[109].z);
    float _702 = -(*spvDescriptorSet0.vp_c9)._m0[110].z;
    float _704 = _702 + (*spvDescriptorSet0.vp_c9)._m0[111].z;
    float _706 = fma(_686, _590, _682);
    float _708 = fma(_694, _592, (*spvDescriptorSet0.vp_c9)._m0[110].x);
    float _710 = fma(_698, _592, (*spvDescriptorSet0.vp_c9)._m0[110].y);
    float _712 = fma(_688, _590, _684);
    float _714 = fma(_704, _592, (*spvDescriptorSet0.vp_c9)._m0[110].z);
    float _716 = fma(_700, _590, _690);
    float _718 = fma(_708, _618, _706);
    float _720 = fma(_710, _618, _712);
    float _722 = _438 * _474;
    float _724 = fma(_714, _618, _716);
    float _726 = fma(_508, (*spvDescriptorSet0.vp_c9)._m0[111].x, _718);
    float _728 = fma(_508, (*spvDescriptorSet0.vp_c9)._m0[111].y, _720);
    float _730 = fma(_508, (*spvDescriptorSet0.vp_c9)._m0[111].z, _724);
    bool _732 = !_524;
    float _750;
    if (!_732)
    {
        float _734 = in.m_61.x;
        float _736 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _738 = _734 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _740 = fma(_738, (*spvDescriptorSet0.vp_c9)._m0[11].y, _166);
        float _742 = _740 * _736;
        float _744 = floor(_742);
        float _746 = -_744;
        float _748 = _742 + _746;
        _750 = _748;
        _752 = true;
    }
    else
    {
        float _754 = float(_132);
        float _756 = 1.0 / _754;
        float _758 = _166 * _756;
        _750 = _758;
    }
    _752 = false;
    float _760 = _750;
    float _762 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _764 = _760 + _762;
    float _766 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _768 = _766 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _770 = _760 >= (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _772 = isnan(_760);
    bool _774 = _770 || _772;
    bool _776 = isnan((*spvDescriptorSet0.vp_c9)._m0[117].w);
    bool _778 = _774 || _776;
    float _780 = float(_778);
    float _782 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _784 = _782 + (*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _786 = -(*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _788 = _786 + (*spvDescriptorSet0.vp_c9)._m0[118].w;
    bool _790 = _760 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _792 = isnan(_760);
    bool _794 = _790 || _792;
    bool _796 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _798 = _794 || _796;
    float _800 = float(_798);
    float _802 = 1.0 / _768;
    float _804 = -_780;
    float _806 = _804 + 1.0;
    float _808 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _810 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _808;
    bool _812 = _760 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _814 = isnan(_760);
    bool _816 = _812 || _814;
    bool _818 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _820 = _816 || _818;
    float _822 = float(_820);
    float _824 = _800 * _806;
    float _826 = -_800;
    float _828 = _826 + 1.0;
    bool _830 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].z;
    float _832 = 1.0 / _784;
    float _834 = _822 * _828;
    float _836 = -_822;
    float _838 = _836 + 1.0;
    float _840 = 1.0 / _788;
    float _842 = _810 * _802;
    float _844 = -(*spvDescriptorSet0.vp_c9)._m0[116].x;
    float _846 = _844 + (*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _848 = fma(_842, _764, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _850 = _846 * _832;
    bool _852 = _760 >= (*spvDescriptorSet0.vp_c9)._m0[118].w;
    bool _854 = isnan(_760);
    bool _856 = _852 || _854;
    bool _858 = isnan((*spvDescriptorSet0.vp_c9)._m0[118].w);
    bool _860 = _856 || _858;
    float _862 = float(_860);
    float _864 = -(*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _866 = (*spvDescriptorSet0.vp_c9)._m0[118].x + _864;
    float _868 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _870 = _760 + _868;
    float _872 = _848 * _834;
    float _874 = -(*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _876 = _760 + _874;
    float _878 = -_862;
    float _880 = _878 + 1.0;
    float _882 = fma(_850, _870, (*spvDescriptorSet0.vp_c9)._m0[116].x);
    float _884 = _866 * _840;
    float _886 = fma(_838, (*spvDescriptorSet0.vp_c9)._m0[115].x, _872);
    float _888 = _780 * _880;
    float _890 = _726 * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _892 = fma(_884, _876, (*spvDescriptorSet0.vp_c9)._m0[117].x);
    float _894 = fma(_882, _824, _886);
    float _896 = _730 * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _898 = _890 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _900 = fma(_892, _888, _894);
    float _902 = _728 * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _904 = _896 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _906 = fma(_862, (*spvDescriptorSet0.vp_c9)._m0[118].x, _900);
    float _908 = _902 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _910 = _906 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    out.m_65.x = _898;
    out.m_65.y = _908;
    out.m_65.z = _904;
    out.m_65.w = _910;
    bool _912 = !_830;
    float _930;
    if (!_912)
    {
        float _914 = in.m_61.x;
        float _916 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].z;
        float _918 = _914 * (*spvDescriptorSet0.vp_c9)._m0[12].w;
        float _920 = fma(_918, (*spvDescriptorSet0.vp_c9)._m0[11].z, _166);
        float _922 = _920 * _916;
        float _924 = floor(_922);
        float _926 = -_924;
        float _928 = _922 + _926;
        _930 = _928;
        _932 = true;
    }
    else
    {
        float _934 = float(_132);
        float _936 = 1.0 / _934;
        float _938 = _166 * _936;
        _930 = _938;
    }
    _932 = false;
    float _940 = _930;
    float _942 = -(*spvDescriptorSet0.vp_c9)._m0[123].w;
    float _944 = _940 + _942;
    bool _946 = _940 >= (*spvDescriptorSet0.vp_c9)._m0[125].w;
    bool _948 = isnan(_940);
    bool _950 = _946 || _948;
    bool _952 = isnan((*spvDescriptorSet0.vp_c9)._m0[125].w);
    bool _954 = _950 || _952;
    float _956 = float(_954);
    float _958 = -(*spvDescriptorSet0.vp_c9)._m0[124].w;
    float _960 = _940 + _958;
    bool _962 = _940 >= (*spvDescriptorSet0.vp_c9)._m0[123].w;
    bool _964 = isnan(_940);
    bool _966 = _962 || _964;
    bool _968 = isnan((*spvDescriptorSet0.vp_c9)._m0[123].w);
    bool _970 = _966 || _968;
    float _972 = float(_970);
    float _974 = -(*spvDescriptorSet0.vp_c9)._m0[123].w;
    float _976 = (*spvDescriptorSet0.vp_c9)._m0[124].w + _974;
    float _978 = -(*spvDescriptorSet0.vp_c9)._m0[124].w;
    float _980 = _978 + (*spvDescriptorSet0.vp_c9)._m0[125].w;
    bool _982 = _940 >= (*spvDescriptorSet0.vp_c9)._m0[124].w;
    bool _984 = isnan(_940);
    bool _986 = _982 || _984;
    bool _988 = isnan((*spvDescriptorSet0.vp_c9)._m0[124].w);
    bool _990 = _986 || _988;
    float _992 = float(_990);
    float _994 = -_956;
    float _996 = _994 + 1.0;
    float _998 = 1.0 / _976;
    float _1000 = _992 * _996;
    float _1002 = -_992;
    float _1004 = _1002 + 1.0;
    float _1006 = -(*spvDescriptorSet0.vp_c9)._m0[123].x;
    float _1008 = (*spvDescriptorSet0.vp_c9)._m0[124].x + _1006;
    bool _1010 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].w;
    float _1012 = 1.0 / _980;
    float _1014 = _972 * _1004;
    float _1016 = -_972;
    float _1018 = _1016 + 1.0;
    float _1020 = _944 * _998;
    float _1022 = -(*spvDescriptorSet0.vp_c9)._m0[123].y;
    float _1024 = (*spvDescriptorSet0.vp_c9)._m0[124].y + _1022;
    float _1026 = -(*spvDescriptorSet0.vp_c9)._m0[123].z;
    float _1028 = (*spvDescriptorSet0.vp_c9)._m0[124].z + _1026;
    float _1030 = fma(_1008, _1020, (*spvDescriptorSet0.vp_c9)._m0[123].x);
    float _1032 = fma(_1024, _1020, (*spvDescriptorSet0.vp_c9)._m0[123].y);
    float _1034 = fma(_1028, _1020, (*spvDescriptorSet0.vp_c9)._m0[123].z);
    float _1036 = _960 * _1012;
    float _1038 = _1030 * _1014;
    float _1040 = _1032 * _1014;
    float _1042 = _1034 * _1014;
    float _1044 = -(*spvDescriptorSet0.vp_c9)._m0[124].x;
    float _1046 = _1044 + (*spvDescriptorSet0.vp_c9)._m0[125].x;
    float _1048 = -(*spvDescriptorSet0.vp_c9)._m0[124].y;
    float _1050 = _1048 + (*spvDescriptorSet0.vp_c9)._m0[125].y;
    float _1052 = -(*spvDescriptorSet0.vp_c9)._m0[124].z;
    float _1054 = _1052 + (*spvDescriptorSet0.vp_c9)._m0[125].z;
    float _1056 = fma(_1018, (*spvDescriptorSet0.vp_c9)._m0[123].x, _1038);
    float _1058 = fma(_1046, _1036, (*spvDescriptorSet0.vp_c9)._m0[124].x);
    float _1060 = fma(_1050, _1036, (*spvDescriptorSet0.vp_c9)._m0[124].y);
    float _1062 = fma(_1054, _1036, (*spvDescriptorSet0.vp_c9)._m0[124].z);
    float _1064 = fma(_1018, (*spvDescriptorSet0.vp_c9)._m0[123].y, _1040);
    float _1066 = fma(_1018, (*spvDescriptorSet0.vp_c9)._m0[123].z, _1042);
    float _1068 = fma(_1058, _1000, _1056);
    float _1070 = fma(_1060, _1000, _1064);
    float _1072 = fma(_1062, _1000, _1066);
    float _1074 = fma(_956, (*spvDescriptorSet0.vp_c9)._m0[125].x, _1068);
    float _1076 = fma(_956, (*spvDescriptorSet0.vp_c9)._m0[125].y, _1070);
    float _1078 = fma(_956, (*spvDescriptorSet0.vp_c9)._m0[125].z, _1072);
    bool _1080 = !_1010;
    float _1098;
    if (!_1080)
    {
        float _1082 = in.m_61.x;
        float _1084 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].w;
        float _1086 = _1082 * (*spvDescriptorSet0.vp_c9)._m0[13].x;
        float _1088 = fma(_1086, (*spvDescriptorSet0.vp_c9)._m0[11].w, _166);
        float _1090 = _1088 * _1084;
        float _1092 = floor(_1090);
        float _1094 = -_1092;
        float _1096 = _1090 + _1094;
        _1098 = _1096;
        _1100 = true;
    }
    else
    {
        float _1102 = float(_132);
        float _1104 = 1.0 / _1102;
        float _1106 = _166 * _1104;
        _1098 = _1106;
    }
    _1100 = false;
    float _1108 = _1098;
    bool _1110 = _1108 >= (*spvDescriptorSet0.vp_c9)._m0[132].w;
    bool _1112 = isnan(_1108);
    bool _1114 = _1110 || _1112;
    bool _1116 = isnan((*spvDescriptorSet0.vp_c9)._m0[132].w);
    bool _1118 = _1114 || _1116;
    float _1120 = float(_1118);
    float _1122 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _1124 = _1122 + (*spvDescriptorSet0.vp_c9)._m0[132].w;
    bool _1126 = _1108 >= (*spvDescriptorSet0.vp_c9)._m0[131].w;
    bool _1128 = isnan(_1108);
    bool _1130 = _1126 || _1128;
    bool _1132 = isnan((*spvDescriptorSet0.vp_c9)._m0[131].w);
    bool _1134 = _1130 || _1132;
    float _1136 = float(_1134);
    float _1138 = -(*spvDescriptorSet0.vp_c9)._m0[131].x;
    float _1140 = (*spvDescriptorSet0.vp_c9)._m0[132].x + _1138;
    float _1142 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _1144 = _1108 + _1142;
    float _1146 = -_1120;
    float _1148 = _1146 + 1.0;
    bool _1150 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[14].x;
    float _1152 = 1.0 / _1124;
    float _1154 = _1136 * _1148;
    float _1156 = -_1136;
    float _1158 = _1156 + 1.0;
    float _1160 = _1140 * _1152;
    float _1162 = _1078 * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _1164 = fma(_1160, _1144, (*spvDescriptorSet0.vp_c9)._m0[131].x);
    float _1166 = _1076 * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _1168 = _1162 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1170 = _1164 * _1154;
    float _1172 = _1074 * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _1174 = _1166 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1176 = fma(_1158, (*spvDescriptorSet0.vp_c9)._m0[131].x, _1170);
    float _1178 = _1172 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1180 = fma(_1120, (*spvDescriptorSet0.vp_c9)._m0[132].x, _1176);
    float _1182 = _1180 * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    out.m_67.x = _1178;
    out.m_67.y = _1174;
    out.m_67.z = _1168;
    out.m_67.w = _1182;
    bool _1184 = !_1150;
    float _1202;
    if (!_1184)
    {
        float _1186 = in.m_61.x;
        float _1188 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[14].x;
        float _1190 = _1186 * (*spvDescriptorSet0.vp_c9)._m0[15].x;
        float _1192 = fma(_1190, (*spvDescriptorSet0.vp_c9)._m0[14].x, _166);
        float _1194 = _1192 * _1188;
        float _1196 = floor(_1194);
        float _1198 = -_1196;
        float _1200 = _1194 + _1198;
        _1202 = _1200;
        _1204 = true;
    }
    else
    {
        float _1206 = float(_132);
        float _1208 = 1.0 / _1206;
        float _1210 = _166 * _1208;
        _1202 = _1210;
    }
    _1204 = false;
    float _1212 = _1202;
    float _1214 = -(*spvDescriptorSet0.vp_c9)._m0[159].w;
    float _1216 = (*spvDescriptorSet0.vp_c9)._m0[160].w + _1214;
    float _1218 = -(*spvDescriptorSet0.vp_c9)._m0[160].w;
    float _1220 = _1218 + (*spvDescriptorSet0.vp_c9)._m0[161].w;
    float _1222 = -(*spvDescriptorSet0.vp_c9)._m0[161].w;
    float _1224 = (*spvDescriptorSet0.vp_c9)._m0[162].w + _1222;
    float _1226 = 1.0 / _1216;
    float _1228 = -(*spvDescriptorSet0.vp_c9)._m0[165].w;
    float _1230 = (*spvDescriptorSet0.vp_c9)._m0[166].w + _1228;
    float _1232 = -(*spvDescriptorSet0.vp_c9)._m0[162].w;
    float _1234 = _1232 + (*spvDescriptorSet0.vp_c9)._m0[163].w;
    float _1236 = -(*spvDescriptorSet0.vp_c9)._m0[163].w;
    float _1238 = (*spvDescriptorSet0.vp_c9)._m0[164].w + _1236;
    float _1240 = -(*spvDescriptorSet0.vp_c9)._m0[164].w;
    float _1242 = _1240 + (*spvDescriptorSet0.vp_c9)._m0[165].w;
    float _1244 = 1.0 / _1224;
    float _1246 = -(*spvDescriptorSet0.vp_c9)._m0[159].w;
    float _1248 = _1212 + _1246;
    bool _1250 = _1212 >= (*spvDescriptorSet0.vp_c9)._m0[161].w;
    bool _1252 = isnan(_1212);
    bool _1254 = _1250 || _1252;
    bool _1256 = isnan((*spvDescriptorSet0.vp_c9)._m0[161].w);
    bool _1258 = _1254 || _1256;
    float _1260 = float(_1258);
    bool _1262 = _1212 >= (*spvDescriptorSet0.vp_c9)._m0[159].w;
    bool _1264 = isnan(_1212);
    bool _1266 = _1262 || _1264;
    bool _1268 = isnan((*spvDescriptorSet0.vp_c9)._m0[159].w);
    bool _1270 = _1266 || _1268;
    float _1272 = float(_1270);
    float _1274 = 1.0 / _1220;
    float _1276 = _1248 * _1226;
    float _1278 = -(*spvDescriptorSet0.vp_c9)._m0[160].w;
    float _1280 = _1212 + _1278;
    float _1282 = -(*spvDescriptorSet0.vp_c9)._m0[162].w;
    float _1284 = _1212 + _1282;
    float _1286 = -(*spvDescriptorSet0.vp_c9)._m0[163].w;
    float _1288 = _1212 + _1286;
    float _1290 = 1.0 / _1230;
    float _1292 = -(*spvDescriptorSet0.vp_c9)._m0[161].w;
    float _1294 = _1212 + _1292;
    bool _1296 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[14].y;
    float _1298 = _1294 * _1244;
    float _1300 = -(*spvDescriptorSet0.vp_c9)._m0[165].w;
    float _1302 = _1212 + _1300;
    float _1304 = 1.0 / _1234;
    float _1306 = _1280 * _1274;
    bool _1308 = _1212 >= (*spvDescriptorSet0.vp_c9)._m0[166].w;
    bool _1310 = isnan(_1212);
    bool _1312 = _1308 || _1310;
    bool _1314 = isnan((*spvDescriptorSet0.vp_c9)._m0[166].w);
    bool _1316 = _1312 || _1314;
    float _1318 = float(_1316);
    float _1320 = 1.0 / _1238;
    float _1322 = -(*spvDescriptorSet0.vp_c9)._m0[164].w;
    float _1324 = _1212 + _1322;
    float _1326 = _1302 * _1290;
    bool _1328 = _1212 >= (*spvDescriptorSet0.vp_c9)._m0[165].w;
    bool _1330 = isnan(_1212);
    bool _1332 = _1328 || _1330;
    bool _1334 = isnan((*spvDescriptorSet0.vp_c9)._m0[165].w);
    bool _1336 = _1332 || _1334;
    float _1338 = float(_1336);
    float _1340 = 1.0 / _1242;
    float _1342 = -(*spvDescriptorSet0.vp_c9)._m0[159].y;
    float _1344 = (*spvDescriptorSet0.vp_c9)._m0[160].y + _1342;
    float _1346 = _1284 * _1304;
    float _1348 = -(*spvDescriptorSet0.vp_c9)._m0[159].x;
    float _1350 = (*spvDescriptorSet0.vp_c9)._m0[160].x + _1348;
    float _1352 = -_1318;
    float _1354 = _1352 + 1.0;
    float _1356 = fma(_1350, _1276, (*spvDescriptorSet0.vp_c9)._m0[159].x);
    float _1358 = _1288 * _1320;
    float _1360 = -(*spvDescriptorSet0.vp_c9)._m0[159].z;
    float _1362 = (*spvDescriptorSet0.vp_c9)._m0[160].z + _1360;
    float _1364 = fma(_1344, _1276, (*spvDescriptorSet0.vp_c9)._m0[159].y);
    float _1366 = -(*spvDescriptorSet0.vp_c9)._m0[160].x;
    float _1368 = _1366 + (*spvDescriptorSet0.vp_c9)._m0[161].x;
    float _1370 = _1338 * _1354;
    float _1372 = fma(_1362, _1276, (*spvDescriptorSet0.vp_c9)._m0[159].z);
    float _1374 = -(*spvDescriptorSet0.vp_c9)._m0[160].y;
    float _1376 = _1374 + (*spvDescriptorSet0.vp_c9)._m0[161].y;
    float _1378 = -(*spvDescriptorSet0.vp_c9)._m0[160].z;
    float _1380 = _1378 + (*spvDescriptorSet0.vp_c9)._m0[161].z;
    float _1382 = _1324 * _1340;
    bool _1384 = _1212 >= (*spvDescriptorSet0.vp_c9)._m0[164].w;
    bool _1386 = isnan(_1212);
    bool _1388 = _1384 || _1386;
    bool _1390 = isnan((*spvDescriptorSet0.vp_c9)._m0[164].w);
    bool _1392 = _1388 || _1390;
    float _1394 = float(_1392);
    float _1396 = -_1338;
    float _1398 = _1396 + 1.0;
    float _1400 = fma(_1368, _1306, (*spvDescriptorSet0.vp_c9)._m0[160].x);
    float _1402 = fma(_1376, _1306, (*spvDescriptorSet0.vp_c9)._m0[160].y);
    float _1404 = fma(_1380, _1306, (*spvDescriptorSet0.vp_c9)._m0[160].z);
    float _1406 = _1394 * _1398;
    float _1408 = -_1394;
    float _1410 = _1408 + 1.0;
    bool _1412 = _1212 >= (*spvDescriptorSet0.vp_c9)._m0[162].w;
    bool _1414 = isnan(_1212);
    bool _1416 = _1412 || _1414;
    bool _1418 = isnan((*spvDescriptorSet0.vp_c9)._m0[162].w);
    bool _1420 = _1416 || _1418;
    float _1422 = float(_1420);
    float _1424 = -(*spvDescriptorSet0.vp_c9)._m0[161].z;
    float _1426 = (*spvDescriptorSet0.vp_c9)._m0[162].z + _1424;
    bool _1428 = _1212 >= (*spvDescriptorSet0.vp_c9)._m0[163].w;
    bool _1430 = isnan(_1212);
    bool _1432 = _1428 || _1430;
    bool _1434 = isnan((*spvDescriptorSet0.vp_c9)._m0[163].w);
    bool _1436 = _1432 || _1434;
    float _1438 = float(_1436);
    bool _1440 = _1212 >= (*spvDescriptorSet0.vp_c9)._m0[160].w;
    bool _1442 = isnan(_1212);
    bool _1444 = _1440 || _1442;
    bool _1446 = isnan((*spvDescriptorSet0.vp_c9)._m0[160].w);
    bool _1448 = _1444 || _1446;
    float _1450 = float(_1448);
    float _1452 = -_1422;
    float _1454 = _1452 + 1.0;
    float _1456 = -(*spvDescriptorSet0.vp_c9)._m0[162].x;
    float _1458 = _1456 + (*spvDescriptorSet0.vp_c9)._m0[163].x;
    float _1460 = -_1438;
    float _1462 = _1460 + 1.0;
    float _1464 = _1438 * _1410;
    float _1466 = _1260 * _1454;
    float _1468 = -_1260;
    float _1470 = _1468 + 1.0;
    float _1472 = -_1450;
    float _1474 = _1472 + 1.0;
    float _1476 = _1422 * _1462;
    float _1478 = -(*spvDescriptorSet0.vp_c9)._m0[161].y;
    float _1480 = (*spvDescriptorSet0.vp_c9)._m0[162].y + _1478;
    float _1482 = _1450 * _1470;
    float _1484 = -(*spvDescriptorSet0.vp_c9)._m0[162].y;
    float _1486 = _1484 + (*spvDescriptorSet0.vp_c9)._m0[163].y;
    float _1488 = _1272 * _1474;
    float _1490 = -(*spvDescriptorSet0.vp_c9)._m0[161].x;
    float _1492 = (*spvDescriptorSet0.vp_c9)._m0[162].x + _1490;
    float _1494 = -_1272;
    float _1496 = _1494 + 1.0;
    float _1498 = -(*spvDescriptorSet0.vp_c9)._m0[162].z;
    float _1500 = _1498 + (*spvDescriptorSet0.vp_c9)._m0[163].z;
    float _1502 = _1356 * _1488;
    float _1504 = _1364 * _1488;
    float _1506 = _1372 * _1488;
    float _1508 = fma(_1492, _1298, (*spvDescriptorSet0.vp_c9)._m0[161].x);
    float _1510 = fma(_1496, (*spvDescriptorSet0.vp_c9)._m0[159].x, _1502);
    float _1512 = fma(_1496, (*spvDescriptorSet0.vp_c9)._m0[159].y, _1504);
    float _1514 = fma(_1496, (*spvDescriptorSet0.vp_c9)._m0[159].z, _1506);
    float _1516 = fma(_1480, _1298, (*spvDescriptorSet0.vp_c9)._m0[161].y);
    float _1518 = fma(_1426, _1298, (*spvDescriptorSet0.vp_c9)._m0[161].z);
    float _1520 = fma(_1458, _1346, (*spvDescriptorSet0.vp_c9)._m0[162].x);
    float _1522 = fma(_1486, _1346, (*spvDescriptorSet0.vp_c9)._m0[162].y);
    float _1524 = fma(_1500, _1346, (*spvDescriptorSet0.vp_c9)._m0[162].z);
    float _1526 = fma(_1400, _1482, _1510);
    float _1528 = fma(_1402, _1482, _1512);
    float _1530 = fma(_1404, _1482, _1514);
    float _1532 = -(*spvDescriptorSet0.vp_c9)._m0[163].x;
    float _1534 = (*spvDescriptorSet0.vp_c9)._m0[164].x + _1532;
    float _1536 = -(*spvDescriptorSet0.vp_c9)._m0[163].z;
    float _1538 = (*spvDescriptorSet0.vp_c9)._m0[164].z + _1536;
    float _1540 = -(*spvDescriptorSet0.vp_c9)._m0[163].y;
    float _1542 = (*spvDescriptorSet0.vp_c9)._m0[164].y + _1540;
    float _1544 = fma(_1508, _1466, _1526);
    float _1546 = fma(_1516, _1466, _1528);
    float _1548 = fma(_1518, _1466, _1530);
    float _1550 = fma(_1534, _1358, (*spvDescriptorSet0.vp_c9)._m0[163].x);
    float _1552 = fma(_1542, _1358, (*spvDescriptorSet0.vp_c9)._m0[163].y);
    float _1554 = fma(_1538, _1358, (*spvDescriptorSet0.vp_c9)._m0[163].z);
    float _1556 = fma(_1520, _1476, _1544);
    float _1558 = fma(_1522, _1476, _1546);
    float _1560 = fma(_1524, _1476, _1548);
    float _1562 = -(*spvDescriptorSet0.vp_c9)._m0[164].x;
    float _1564 = _1562 + (*spvDescriptorSet0.vp_c9)._m0[165].x;
    float _1566 = -(*spvDescriptorSet0.vp_c9)._m0[164].y;
    float _1568 = _1566 + (*spvDescriptorSet0.vp_c9)._m0[165].y;
    float _1570 = -(*spvDescriptorSet0.vp_c9)._m0[164].z;
    float _1572 = _1570 + (*spvDescriptorSet0.vp_c9)._m0[165].z;
    float _1574 = fma(_1550, _1464, _1556);
    float _1576 = fma(_1564, _1382, (*spvDescriptorSet0.vp_c9)._m0[164].x);
    float _1578 = fma(_1568, _1382, (*spvDescriptorSet0.vp_c9)._m0[164].y);
    float _1580 = fma(_1552, _1464, _1558);
    float _1582 = -(*spvDescriptorSet0.vp_c9)._m0[165].x;
    float _1584 = (*spvDescriptorSet0.vp_c9)._m0[166].x + _1582;
    float _1586 = -(*spvDescriptorSet0.vp_c9)._m0[165].y;
    float _1588 = (*spvDescriptorSet0.vp_c9)._m0[166].y + _1586;
    float _1590 = fma(_1572, _1382, (*spvDescriptorSet0.vp_c9)._m0[164].z);
    float _1592 = -(*spvDescriptorSet0.vp_c9)._m0[165].z;
    float _1594 = (*spvDescriptorSet0.vp_c9)._m0[166].z + _1592;
    float _1596 = fma(_1554, _1464, _1560);
    float _1598 = fma(_1584, _1326, (*spvDescriptorSet0.vp_c9)._m0[165].x);
    float _1600 = fma(_1588, _1326, (*spvDescriptorSet0.vp_c9)._m0[165].y);
    float _1602 = fma(_1578, _1406, _1580);
    float _1604 = fma(_1594, _1326, (*spvDescriptorSet0.vp_c9)._m0[165].z);
    float _1606 = fma(_1576, _1406, _1574);
    float _1608 = fma(_1590, _1406, _1596);
    float _1610 = fma(_1600, _1370, _1602);
    float _1612 = fma(_1598, _1370, _1606);
    float _1614 = fma(_1604, _1370, _1608);
    float _1616 = fma(_1318, (*spvDescriptorSet0.vp_c9)._m0[166].y, _1610);
    float _1618 = fma(_1318, (*spvDescriptorSet0.vp_c9)._m0[166].x, _1612);
    float _1620 = fma(_1318, (*spvDescriptorSet0.vp_c9)._m0[166].z, _1614);
    out.m_69.x = _1618;
    out.m_69.y = _1616;
    out.m_69.z = _1620;
    bool _1622 = !_1296;
    int _1624 = as_type<int>(_1516);
    float _1626 = _1620;
    float _1628 = _1606;
    float _1630 = _1618;
    float _1648;
    if (!_1622)
    {
        float _1632 = in.m_61.x;
        float _1634 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[14].y;
        float _1636 = _1632 * (*spvDescriptorSet0.vp_c9)._m0[15].y;
        float _1638 = fma(_1636, (*spvDescriptorSet0.vp_c9)._m0[14].y, _166);
        float _1640 = _1638 * _1634;
        float _1642 = floor(_1640);
        float _1644 = -_1642;
        float _1646 = _1640 + _1644;
        _1648 = _1646;
        _1650 = true;
    }
    else
    {
        float _1652 = float(_132);
        float _1654 = 1.0 / _1652;
        float _1656 = _166 * _1654;
        _1648 = _1656;
    }
    _1650 = false;
    float _1658 = _1648;
    float _1660 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].y);
    int _1662 = int(_1660);
    float _1664 = in.m_61.y;
    int _1666 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _1668 = _1666 != 0;
    float _1670 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].x);
    int _1672 = int(_1670);
    float _1674 = float(_1662);
    float _1676 = trunc((*spvDescriptorSet0.vp_c9)._m0[31].y);
    int _1678 = int(_1676);
    float _1680 = _1602;
    if (_1668)
    {
        float _1682 = in.m_61.x;
        _1680 = _1682;
    }
    float _1684 = _1680;
    if (_1668)
    {
        _1624 = 0;
    }
    int _1686 = _1624;
    float _1688 = float(uint(_1672));
    float _1690 = 1.0 / _1674;
    int _1692 = _1686;
    if (_1668)
    {
        _1626 = _1664;
    }
    float _1694 = _1626;
    float _1696 = 1.0 / _1688;
    float _1698 = float(_1678);
    float _1700 = _1690 * _166;
    float _1702 = trunc((*spvDescriptorSet0.vp_c9)._m0[31].x);
    int _1704 = int(_1702);
    float _1706 = _1698;
    float _1708 = _1684;
    float _1710 = _1694;
    if (_1668)
    {
        _1628 = _1684;
    }
    float _1712 = _1628;
    float _1714 = _1712;
    if (_1668)
    {
        _1630 = _1712;
    }
    float _1716 = _1630;
    int _1718 = as_type<int>(_1696) + (-2);
    float _1720 = trunc(_1700);
    int _1722 = int(_1720);
    int _1724 = ~_1672;
    int _1726 = _1724 + 1;
    float _1728 = 1.0 / _1698;
    float _1730 = float(uint(_1704));
    float _1732 = float(uint(_1722));
    float _1734 = 1.0 / _1730;
    float _1736 = _1716;
    if (_1668)
    {
        _1706 = 1.0;
    }
    float _1738 = _1706;
    float _1740 = as_type<float>(_1718) * _1732;
    float _1742 = _1728 * _166;
    float _1744 = trunc(_1740);
    float _1746 = precise::max(_1744, 0.0);
    uint _1749 = uint(_1746);
    float _1751 = _1728;
    float _1753 = _1738;
    if (_1668)
    {
        _1751 = 1.0;
    }
    float _1755 = _1751;
    float _1757 = trunc(_1742);
    int _1759 = int(_1757);
    int _1761 = as_type<int>(_1734) + (-2);
    int _1763 = _1726 * int(_1749);
    int _1765 = _1763 + _1722;
    float _1767 = float(uint(_1765));
    float _1769 = float(uint(_1759));
    float _1771 = as_type<float>(_1718) * _1767;
    float _1773 = trunc(_1771);
    float _1775 = precise::max(_1773, 0.0);
    uint _1777 = uint(_1775);
    float _1779 = _1755;
    if (!_1668)
    {
        float _1781 = in.m_61.x;
        float _1783 = _1664 * 3.1415927410125732421875;
        float _1785 = _1783 * 0.15915493667125701904296875;
        float _1787 = _1785 * 6.283185482025146484375;
        float _1789 = sin(_1787);
        float _1791 = _1781 * 3.1415927410125732421875;
        float _1793 = _1791 * 0.15915493667125701904296875;
        float _1795 = _1793 * 6.283185482025146484375;
        float _1797 = sin(_1795);
        _1753 = 7.345489978790283203125;
        _1708 = _1781;
        _1736 = _1664;
        _1779 = 1.2345600128173828125;
        _1692 = 2;
        _1714 = _1797;
        _1710 = _1789;
    }
    float _1799 = _1753;
    float _1801 = _1708;
    float _1803 = _1736;
    float _1805 = _1779;
    int _1807 = _1692;
    float _1809 = _1714;
    float _1811 = _1710;
    float _1813 = as_type<float>(_1761) * _1769;
    float _1815 = _1799 * _1801;
    int _1817 = ~_1672;
    int _1819 = _1817 + 1;
    float _1821 = in.m_71.w;
    float _1823 = trunc(_1813);
    float _1825 = precise::max(_1823, 0.0);
    uint _1827 = uint(_1825);
    int _1829 = int(_1749) + int(_1777);
    float _1831 = -(*spvDescriptorSet0.vp_c9)._m0[172].w;
    float _1833 = _1658 + _1831;
    int _1835 = ~_1704;
    int _1837 = _1835 + 1;
    float _1839 = -(*spvDescriptorSet0.vp_c9)._m0[173].w;
    float _1841 = _1658 + _1839;
    float _1843 = float(_132);
    int _1845 = _1819 * _1829;
    int _1847 = _1845 + _1722;
    float _1849 = float(_1672);
    float _1851 = floor(_1815);
    float _1853 = float(_1722);
    bool _1855 = _1853 >= _1849;
    bool _1857 = isnan(_1853);
    bool _1859 = _1855 || _1857;
    bool _1861 = isnan(_1849);
    bool _1863 = _1859 || _1861;
    float _1865 = float(_1863);
    bool _1867 = uint(_1847) >= uint(_1672);
    float _1869 = 1.0 / _1843;
    int _1871 = _1837 * int(_1827);
    int _1873 = _1871 + _1759;
    bool _1875 = _1672 == 0;
    bool _1877 = !_1867;
    int _1879 = _1877 ? 0 : (-1);
    float _1881 = float(uint(_1873));
    out.m_73.w = _1821;
    float _1883 = trunc(_1865);
    int _1885 = int(_1883);
    float _1887 = -_1851;
    float _1889 = _1815 + _1887;
    float _1891 = as_type<float>(_1761) * _1881;
    int _1893 = ~_1829;
    int _1895 = _1893 + _1879;
    int _1897 = _1895 + 1;
    float _1899 = _1849 * _1889;
    int _1901 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4096;
    bool _1903 = _1901 != 0;
    float _1905 = _1869 * _166;
    float _1907 = trunc(_1899);
    int _1909 = int(_1907);
    int _1911 = _1672 * _1897;
    int _1913 = _1911 + _1722;
    float _1915 = _1849 * _1905;
    int _1917 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 16;
    bool _1919 = _1917 != 0;
    int _1921 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 32;
    bool _1923 = _1921 != 0;
    bool _1925 = _1704 == 0;
    int _1927 = ~_1885;
    int _1929 = _1927 + 1;
    int _1931 = _1929 + 1;
    float _1933 = trunc(_1891);
    float _1935 = precise::max(_1933, 0.0);
    uint _1937 = uint(_1935);
    bool _1939 = !_1875;
    int _1941 = _1939 ? _1913 : (-1);
    bool _1943 = !_1903;
    int _1945 = _1943 ? 0 : 1;
    bool _1947 = !_1923;
    int _1949 = _1947 ? 0 : 1;
    int _1951 = _1941 * _1931;
    int _1953 = abs(_1945);
    float _1955 = trunc(_1915);
    int _1957 = int(_1955);
    int _1959 = _1672 + (-1);
    int _1961 = abs(_1949);
    float _1963 = _1803 * _1805;
    int _1965 = _1909 * _1953;
    int _1967 = _1965 + _1722;
    int _1969 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 64;
    bool _1971 = _1969 != 0;
    int _1973 = _1885 * _1959;
    int _1975 = _1973 + _1951;
    float _1977 = floor(_1963);
    bool _1979 = !_1919;
    int _1981 = _1979 ? 0 : 1;
    int _1983 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 128;
    bool _1985 = _1983 != 0;
    int _1987 = _1975 * _1961;
    int _1989 = int(_1827) + int(_1937);
    bool _1991 = !_1971;
    int _1993 = _1991 ? 0 : 1;
    float _1995 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].z;
    int _1997 = abs(_1981);
    int _1999 = ~_1704;
    int _2001 = _1999 + 1;
    bool _2003 = !_1985;
    int _2005 = _2003 ? 0 : 1;
    int _2007 = _1957 * _1997;
    int _2009 = _2007 + _1987;
    int _2011 = abs(_1993);
    int _2013 = _2001 * _1989;
    int _2015 = _2013 + _1759;
    float _2017 = float(_1704);
    float _2019 = -_1977;
    float _2021 = _1963 + _2019;
    float _2023 = float(_1759);
    int _2025 = _1967 * _2011;
    int _2027 = _2025 + _2009;
    int _2029 = abs(_2005);
    float _2031 = _2017 * _1905;
    bool _2033 = _2023 >= _2017;
    bool _2035 = isnan(_2023);
    bool _2037 = _2033 || _2035;
    bool _2039 = isnan(_2017);
    bool _2041 = _2037 || _2039;
    float _2043 = float(_2041);
    float _2045 = _2017 * _2021;
    float _2047 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].w;
    bool _2049 = uint(_2015) >= uint(_1704);
    int _2051 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _2053 = _2051 != 0;
    int _2055 = _1909 * _2029;
    int _2057 = _2055 + _2027;
    bool _2059 = !_2049;
    int _2061 = _2059 ? 0 : (-1);
    int _2063 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8192;
    bool _2065 = _2063 != 0;
    float _2067 = trunc(_2043);
    int _2069 = int(_2067);
    int _2071 = ~_1989;
    int _2073 = _2071 + _2061;
    int _2075 = _2073 + 1;
    float _2077 = float(uint(_2057));
    int _2079 = _1704 + (-1);
    int _2081 = _1704 * _2075;
    int _2083 = _2081 + _1759;
    int _2085 = ~_1672;
    int _2087 = _2085 + 1;
    float _2089 = as_type<float>(_1718) * _2077;
    float _2091 = trunc(_2045);
    int _2093 = int(_2091);
    float _2095 = as_type<float>(_2011);
    if (_2053)
    {
        float _2097 = in.m_61.x;
        _2095 = _2097;
    }
    float _2099 = _2095;
    bool _2101 = !_1925;
    int _2103 = _2101 ? _2083 : (-1);
    float _2105 = trunc(_2089);
    float _2107 = precise::max(_2105, 0.0);
    uint _2109 = uint(_2107);
    int _2111 = ~_2069;
    int _2113 = _2111 + 1;
    int _2115 = _2113 + 1;
    float _2117 = -(*spvDescriptorSet0.vp_c9)._m0[167].x;
    float _2119 = (*spvDescriptorSet0.vp_c9)._m0[168].x + _2117;
    float _2121 = -(*spvDescriptorSet0.vp_c9)._m0[168].x;
    float _2123 = _2121 + (*spvDescriptorSet0.vp_c9)._m0[169].x;
    int _2125 = _2103 * _2115;
    bool _2127 = !_2065;
    int _2129 = _2127 ? 0 : 1;
    float _2131 = trunc(_2031);
    int _2133 = int(_2131);
    int _2135 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 256;
    bool _2137 = _2135 != 0;
    int _2139 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 512;
    bool _2141 = _2139 != 0;
    int _2143 = _2069 * _2079;
    int _2145 = _2143 + _2125;
    int _2147 = abs(_2129);
    float _2149 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    bool _2151 = !_2141;
    int _2153 = _2151 ? 0 : 1;
    int _2155 = _2087 * int(_2109);
    int _2157 = _2155 + _2057;
    int _2159 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1024;
    bool _2161 = _2159 != 0;
    int _2163 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 2048;
    bool _2165 = _2163 != 0;
    float _2167 = (*spvDescriptorSet0.vp_c9)._m0[87].x + (*spvDescriptorSet0.vp_c9)._m0[86].z;
    bool _2169 = !_2137;
    int _2171 = _2169 ? 0 : 1;
    int _2173 = abs(_2153);
    float _2175 = float(uint(_2157));
    bool _2177 = !_2161;
    int _2179 = _2177 ? 0 : 1;
    float _2181 = as_type<float>(_1718) * _2175;
    int _2183 = abs(_2171);
    int _2185 = _2093 * _2147;
    int _2187 = _2185 + _1759;
    bool _2189 = !_2165;
    int _2191 = _2189 ? 0 : 1;
    float _2193 = trunc(_2181);
    float _2195 = precise::max(_2193, 0.0);
    uint _2197 = uint(_2195);
    int _2199 = abs(_2179);
    int _2201 = _2145 * _2173;
    int _2203 = abs(_2191);
    int _2205 = _2133 * _2183;
    int _2207 = _2205 + _2201;
    int _2209 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 16;
    bool _2211 = _2209 != 0;
    int _2213 = _2187 * _2199;
    int _2215 = _2213 + _2207;
    int _2217 = ~_1672;
    int _2219 = _2217 + 1;
    int _2221 = _2207;
    bool _2223 = _2137;
    int _2225 = int(_2109);
    float _2227 = as_type<float>(_2147);
    float _2229 = as_type<float>(_2219);
    if (_2053)
    {
        float _2231 = -_188;
        float _2233 = _2231 + 1.0;
        _2221 = as_type<int>(_2233);
    }
    int _2235 = _2221;
    if (_2053)
    {
        bool _2237 = _2099 > 0.5;
        _2223 = _2237;
    }
    bool _2239 = _2223;
    int _2241 = _2093 * _2203;
    int _2243 = _2241 + _2215;
    int _2245 = int(_2109) + int(_2197);
    float _2247 = -_192;
    float _2249 = _2247 + 1.0;
    float _2251 = in.m_61.z;
    bool _2253 = _1664 > 0.5;
    float _2255 = float(uint(_2243));
    if (_2211)
    {
        float _2257 = -_188;
        float _2259 = _2257 + 1.0;
        _2225 = as_type<int>(_2259);
    }
    int _2261 = _2225;
    int _2263 = ~_1704;
    int _2265 = _2263 + 1;
    float _2267 = as_type<float>(_1761) * _2255;
    int _2269 = _2219 * _2245;
    int _2271 = _2269 + _2057;
    if (!_2053)
    {
        _2227 = _188;
    }
    float _2273 = _2227;
    float _2275 = trunc(_2267);
    float _2277 = precise::max(_2275, 0.0);
    uint _2279 = uint(_2277);
    float _2281 = 0.0;
    float _2283 = _2273;
    if (!_2211)
    {
        _2281 = _188;
    }
    float _2285 = _2281;
    float _2287 = _2285;
    if (_2211)
    {
        float _2289 = _2253 ? as_type<float>(_2261) : _188;
        _2287 = _2289;
    }
    float _2291 = _2287;
    if (_2053)
    {
        float _2293 = _2239 ? as_type<float>(_2235) : _188;
        _2283 = _2293;
    }
    float _2295 = _2283;
    int _2297 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 64;
    bool _2299 = _2297 != 0;
    bool _2301 = uint(_2271) >= uint(_1672);
    float _2303 = in.m_48.x;
    float _2305 = in.m_48.y;
    float _2307 = in.m_48.z;
    bool _2309 = _1664 > 0.5;
    bool _2311 = _2309 && _2299;
    int _2313 = _2265 * int(_2279);
    int _2315 = _2313 + _2243;
    float _2317 = -(*spvDescriptorSet0.vp_c9)._m0[167].w;
    float _2319 = _2317 + (*spvDescriptorSet0.vp_c9)._m0[168].w;
    bool _2321 = _2251 > 0.5;
    if (!_2299)
    {
        _2229 = _188;
    }
    float _2323 = _2229;
    float _2325 = 1.0 / _2319;
    float _2327 = float(uint(_2315));
    int _2329 = _2321 ? as_type<int>(_2249) : as_type<int>(_192);
    bool _2331 = !_2301;
    int _2333 = _2331 ? 0 : (-1);
    float _2335 = as_type<float>(_1761) * _2327;
    float _2337 = _2323;
    if (_2311)
    {
        float _2339 = -_188;
        float _2341 = _2339 + 1.0;
        _220 = _2341;
    }
    float _2343 = _220;
    int _2345 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 32;
    bool _2347 = _2345 != 0;
    float _2349 = _1664 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    float _2351 = trunc(_2335);
    float _2353 = precise::max(_2351, 0.0);
    uint _2355 = uint(_2353);
    int _2357 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _2359 = _2357 != 0;
    float _2361 = -(*spvDescriptorSet0.vp_c9)._m0[168].w;
    float _2363 = _2361 + (*spvDescriptorSet0.vp_c9)._m0[169].w;
    float _2365 = _2347 ? as_type<float>(_2329) : _192;
    float _2367 = _2305 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    int _2369 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2097152;
    bool _2371 = _2369 != 0;
    float _2373 = _2119 * _2325;
    int _2375 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4194304;
    bool _2377 = _2375 != 0;
    float _2379 = 1.0 / _2363;
    int _2381 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 128;
    bool _2383 = _2381 != 0;
    float _2385 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    int _2387 = _2253 ? as_type<int>(_2249) : as_type<int>(_192);
    float _2389 = _2305 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _2391 = _2305 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    int _2393 = ~_2245;
    int _2395 = _2393 + _2333;
    int _2397 = _2395 + 1;
    float _2399 = fma(_2349, -2.0, _2385);
    float _2401 = float(uint(_1967));
    float _2403 = fma(_2303, (*spvDescriptorSet0.vp_c10)._m0[4].x, _2389);
    float _2405 = fma(_2303, (*spvDescriptorSet0.vp_c10)._m0[5].x, _2367);
    float _2407 = fma(_2303, (*spvDescriptorSet0.vp_c10)._m0[6].x, _2391);
    int _2409 = ~_1704;
    int _2411 = _2409 + 1;
    int _2413 = _1672 * _2397;
    int _2415 = _2413 + _2057;
    int _2417 = int(_2279) + int(_2355);
    float _2419 = as_type<float>(_1718) * _2401;
    bool _2421 = _1672 == 0;
    float _2423 = _2123 * _2379;
    if (_2299)
    {
        _2337 = _2343;
    }
    float _2425 = _2337;
    int _2427 = _2411 * _2417;
    int _2429 = _2427 + _2243;
    bool _2431 = !_2421;
    int _2433 = _2431 ? _2415 : (-1);
    float _2435 = trunc(_2419);
    float _2437 = precise::max(_2435, 0.0);
    uint _2439 = uint(_2437);
    float _2441 = _1801 * 2.0;
    bool _2443 = _1807 != 2;
    float _2445 = fma(_166, (*spvDescriptorSet0.vp_c9)._m0[76].y, _2399);
    float _2447 = fma(_2307, (*spvDescriptorSet0.vp_c10)._m0[5].z, _2405);
    float _2449 = _2359 ? as_type<float>(_2387) : _192;
    float _2451 = floor(_2441);
    float _2453 = _2383 ? as_type<float>(_2329) : _192;
    float _2455 = fma(_2307, (*spvDescriptorSet0.vp_c10)._m0[6].z, _2407);
    int _2457 = _2433 & 3;
    bool _2459 = uint(_2429) >= uint(_1704);
    float _2461 = (*spvDescriptorSet0.vp_c9)._m0[92].x + (*spvDescriptorSet0.vp_c9)._m0[91].z;
    float _2463 = (*spvDescriptorSet0.vp_c9)._m0[93].z + (*spvDescriptorSet0.vp_c9)._m0[93].x;
    bool _2465 = uint(_2457) > 1u;
    float _2467 = _1809 * (*spvDescriptorSet0.vp_c9)._m0[92].x;
    bool _2469 = !_2459;
    int _2471 = _2469 ? 0 : (-1);
    float _2473 = fma(_1809, (*spvDescriptorSet0.vp_c9)._m0[93].z, _2463);
    int _2475 = _2433 & 3;
    bool _2477 = _2475 != 0;
    float _2479 = -_2461;
    float _2481 = fma(_2467, 2.0, _2479);
    int _2483 = ~_1672;
    int _2485 = _2483 + 1;
    float _2487 = _1801 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    float _2489 = float(uint(_2187));
    float _2491 = -_166;
    float _2493 = fma(_2491, (*spvDescriptorSet0.vp_c9)._m0[91].x, _2481);
    int _2495 = _2477 ? 0 : 1;
    int _2497 = _2485 * int(_2439);
    int _2499 = _2497 + _1967;
    float _2501 = as_type<float>(_1761) * _2489;
    int _2503 = ~_2495;
    int _2505 = _2503 + 1;
    int _2507 = _2505 + 1;
    float _2509 = -_2149;
    float _2511 = fma(_2487, 2.0, _2509);
    int _2513 = _2507;
    float _2515 = _2487;
    if (!_2465)
    {
        int _2517 = ~_2495;
        int _2519 = _2517 + 1;
        _2513 = _2519;
    }
    int _2521 = _2513;
    float _2523 = trunc(_2501);
    float _2525 = precise::max(_2523, 0.0);
    uint _2527 = uint(_2525);
    bool _2529 = uint(_2457) >= 2u;
    float _2531 = (*spvDescriptorSet0.vp_c9)._m0[93].w + (*spvDescriptorSet0.vp_c9)._m0[93].y;
    float _2533 = float(uint(_2499));
    float _2535 = -_166;
    float _2537 = fma(_2535, (*spvDescriptorSet0.vp_c9)._m0[76].x, _2511);
    int _2539 = ~_2417;
    int _2541 = _2539 + _2471;
    int _2543 = _2541 + 1;
    float _2545 = fma(_1811, (*spvDescriptorSet0.vp_c9)._m0[93].w, _2531);
    int _2547 = _2529 ? 0 : 1;
    float _2549 = as_type<float>(_1718) * _2533;
    bool _2551 = _2457 != 3;
    int _2553 = _1704 * _2543;
    int _2555 = _2553 + _2243;
    float _2557 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _2559 = log2(_2557);
    float _2561 = _1811 * (*spvDescriptorSet0.vp_c9)._m0[92].y;
    int _2563 = ~_1704;
    int _2565 = _2563 + 1;
    float _2567 = fma(_166, (*spvDescriptorSet0.vp_c9)._m0[92].w, _2545);
    float _2569 = (*spvDescriptorSet0.vp_c9)._m0[92].y + (*spvDescriptorSet0.vp_c9)._m0[91].w;
    bool _2571 = !_1925;
    int _2573 = _2571 ? _2555 : (-1);
    float _2575 = _2455 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    int _2577 = _2565 * int(_2527);
    int _2579 = _2577 + _2187;
    float _2581 = fma(_2561, -2.0, _2569);
    int _2583 = _2573 & 3;
    float _2585 = trunc(_2549);
    float _2587 = precise::max(_2585, 0.0);
    uint _2589 = uint(_2587);
    float _2591 = _2561;
    if (_2443)
    {
        _2591 = _1801;
    }
    float _2593 = _2591;
    float _2595 = fma(_166, (*spvDescriptorSet0.vp_c9)._m0[91].y, _2581);
    int _2597 = ~_2547;
    int _2599 = _2597 + 1;
    int _2601 = _2599 + 1;
    float _2603 = _2593;
    int _2605 = _2601;
    float _2607 = _2595;
    if (!_2443)
    {
        _2603 = _2251;
    }
    float _2609 = _2603;
    if (_2551)
    {
        int _2611 = ~_2547;
        int _2613 = _2611 + 1;
        _2605 = _2613;
    }
    int _2615 = _2605;
    bool _2617 = uint(_2583) > 1u;
    float _2619 = _2609 * (*spvDescriptorSet0.vp_c9)._m0[87].x;
    if (_2443)
    {
        _2515 = _1664;
    }
    float _2621 = _2515;
    float _2623 = _2559 * _166;
    float _2625 = float(uint(_2579));
    float _2627 = -_2167;
    float _2629 = fma(_2619, 2.0, _2627);
    float _2631 = _2621;
    if (!_2443)
    {
        _2631 = _1801;
    }
    float _2633 = _2631;
    int _2635 = _2573 & 3;
    bool _2637 = _2635 != 0;
    float _2639 = as_type<float>(_1761) * _2625;
    float _2641 = exp2(_2623);
    int _2643 = _2637 ? 0 : 1;
    float _2645 = _2633 * (*spvDescriptorSet0.vp_c9)._m0[87].y;
    bool _2647 = !_2371;
    int _2649 = _2647 ? 0 : 1;
    float _2651 = (*spvDescriptorSet0.vp_c9)._m0[87].y + (*spvDescriptorSet0.vp_c9)._m0[86].w;
    int _2653 = ~_2643;
    int _2655 = _2653 + 1;
    int _2657 = _2655 + 1;
    float _2659 = -_166;
    float _2661 = fma(_2659, (*spvDescriptorSet0.vp_c9)._m0[86].x, _2629);
    int _2663 = _2657;
    if (!_2617)
    {
        int _2665 = ~_2643;
        int _2667 = _2665 + 1;
        _2663 = _2667;
    }
    int _2669 = _2663;
    float _2671 = fma(_2645, -2.0, _2651);
    bool _2673 = _2583 != 3;
    float _2675 = trunc(_2639);
    float _2677 = precise::max(_2675, 0.0);
    uint _2679 = uint(_2677);
    bool _2681 = uint(_2583) >= 2u;
    int _2683 = _2681 ? 0 : 1;
    float _2685 = -_2641;
    float _2687 = _2685 + 1.0;
    bool _2689 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _2691 = isnan(0.0);
    bool _2693 = _2689 || _2691;
    bool _2695 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _2697 = _2693 || _2695;
    int _2699 = int(_2439) + int(_2589);
    int _2701 = ~_1672;
    int _2703 = _2701 + 1;
    int _2705 = ~_2683;
    int _2707 = _2705 + 1;
    int _2709 = _2707 + 1;
    int _2711 = _2709;
    if (_2673)
    {
        int _2713 = ~_2683;
        int _2715 = _2713 + 1;
        _2711 = _2715;
    }
    int _2717 = _2711;
    int _2719 = _2703 * _2699;
    int _2721 = _2719 + _1967;
    bool _2723 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _2725 = isnan(1.0);
    bool _2727 = _2723 || _2725;
    bool _2729 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _2731 = _2727 || _2729;
    float _2733 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _2735 = 1.0 + _2733;
    float _2737 = _2697 ? _2687 : 0.0;
    float _2739 = _1664 * 2.0;
    float _2741 = 1.0 / _2735;
    bool _2743 = uint(_2721) >= uint(_1672);
    float _2745 = (*spvDescriptorSet0.vp_c9)._m0[88].w + (*spvDescriptorSet0.vp_c9)._m0[88].y;
    float _2747 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    float _2749 = fma(_1664, (*spvDescriptorSet0.vp_c9)._m0[88].w, _2745);
    float _2751 = floor(_2739);
    float _2753 = fma(_1664, (*spvDescriptorSet0.vp_c9)._m0[78].w, _2747);
    float _2755 = (*spvDescriptorSet0.vp_c9)._m0[88].z + (*spvDescriptorSet0.vp_c9)._m0[88].x;
    float _2757 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    float _2759 = fma(_166, (*spvDescriptorSet0.vp_c9)._m0[87].w, _2749);
    float _2761 = fma(_166, (*spvDescriptorSet0.vp_c9)._m0[77].w, _2753);
    float _2763 = fma(_1801, (*spvDescriptorSet0.vp_c9)._m0[88].z, _2755);
    float _2765 = fma(_1801, (*spvDescriptorSet0.vp_c9)._m0[78].z, _2757);
    float _2767 = -(*spvDescriptorSet0.vp_c9)._m0[170].w;
    float _2769 = _2767 + (*spvDescriptorSet0.vp_c9)._m0[171].w;
    float _2771 = fma(_166, (*spvDescriptorSet0.vp_c9)._m0[92].z, _2473);
    float _2773 = fma(_166, (*spvDescriptorSet0.vp_c9)._m0[87].z, _2763);
    float _2775 = fma(_166, (*spvDescriptorSet0.vp_c9)._m0[77].z, _2765);
    float _2777 = fma(_166, (*spvDescriptorSet0.vp_c9)._m0[86].y, _2671);
    float _2779 = _2773;
    if (_2731)
    {
        float _2781 = _2737 * _2741;
        _168 = _2781;
    }
    float _2783 = _168;
    float _2785 = -(*spvDescriptorSet0.vp_c9)._m0[171].w;
    float _2787 = _2785 + (*spvDescriptorSet0.vp_c9)._m0[172].w;
    bool _2789 = _2751 >= 0.0;
    bool _2791 = isnan(_2751);
    bool _2793 = _2789 || _2791;
    bool _2795 = isnan(0.0);
    bool _2797 = _2793 || _2795;
    float _2799 = 1.0 / _2769;
    float _2801 = _2251 * 2.0;
    bool _2803 = !_2743;
    int _2805 = _2803 ? 0 : (-1);
    bool _2807 = _2451 >= 0.0;
    bool _2809 = isnan(_2451);
    bool _2811 = _2807 || _2809;
    bool _2813 = isnan(0.0);
    bool _2815 = _2811 || _2813;
    float _2817 = -(*spvDescriptorSet0.vp_c9)._m0[169].w;
    float _2819 = _2817 + (*spvDescriptorSet0.vp_c9)._m0[170].w;
    float _2821 = 1.0 / _2787;
    int _2823 = _2797 ? 0 : 1;
    bool _2825 = _2451 > 0.0;
    float _2827 = -(*spvDescriptorSet0.vp_c9)._m0[172].w;
    float _2829 = _2827 + (*spvDescriptorSet0.vp_c9)._m0[173].w;
    int _2831 = _2815 ? 0 : 1;
    bool _2833 = _2751 > 0.0;
    float _2835 = 1.0 / _2819;
    int _2837 = ~_1704;
    int _2839 = _2837 + 1;
    int _2841 = int(_2527) + int(_2679);
    float _2843 = -(*spvDescriptorSet0.vp_c9)._m0[169].x;
    float _2845 = (*spvDescriptorSet0.vp_c9)._m0[170].x + _2843;
    float _2847 = -(*spvDescriptorSet0.vp_c9)._m0[170].x;
    float _2849 = _2847 + (*spvDescriptorSet0.vp_c9)._m0[171].x;
    float _2851 = 1.0 / _2829;
    int _2853 = ~_2831;
    int _2855 = _2853 + 1;
    int _2857 = _2855 + 1;
    int _2859 = _2839 * _2841;
    int _2861 = _2859 + _2187;
    int _2863 = _2857;
    if (!_2825)
    {
        int _2865 = ~_2831;
        int _2867 = _2865 + 1;
        _2863 = _2867;
    }
    int _2869 = _2863;
    float _2871 = _2849 * _2799;
    float _2873 = _1664 + _2251;
    bool _2875 = uint(_2861) >= uint(_1704);
    float _2877 = floor(_2801);
    float _2879 = _2873 + (-1.0);
    bool _2881 = !_2875;
    int _2883 = _2881 ? 0 : (-1);
    float _2885 = _2845 * _2835;
    int _2887 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _2889 = _2887 != 0;
    int _2891 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _2893 = _2891 != 0;
    int _2895 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _2897 = _2895 != 0;
    float _2899 = -(*spvDescriptorSet0.vp_c9)._m0[171].x;
    float _2901 = (*spvDescriptorSet0.vp_c9)._m0[172].x + _2899;
    float _2903 = -(*spvDescriptorSet0.vp_c9)._m0[172].x;
    float _2905 = _2903 + (*spvDescriptorSet0.vp_c9)._m0[173].x;
    int _2907 = ~_2823;
    int _2909 = _2907 + 1;
    int _2911 = _2909 + 1;
    float _2913 = _2901 * _2821;
    float _2915 = -(*spvDescriptorSet0.vp_c9)._m0[168].w;
    float _2917 = _1658 + _2915;
    int _2919 = _2911;
    if (!_2833)
    {
        int _2921 = ~_2823;
        int _2923 = _2921 + 1;
        _2919 = _2923;
    }
    int _2925 = _2919;
    float _2927 = _2905 * _2851;
    bool _2929 = !_2477;
    int _2931 = _2929 ? 0 : 1;
    float _2933 = fma(_2879, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    bool _2935 = _2877 > 0.0;
    float _2937 = fma(_2307, (*spvDescriptorSet0.vp_c10)._m0[4].z, _2403);
    bool _2939 = _2877 >= 0.0;
    bool _2941 = isnan(_2877);
    bool _2943 = _2939 || _2941;
    bool _2945 = isnan(0.0);
    bool _2947 = _2943 || _2945;
    float _2949 = -(*spvDescriptorSet0.vp_c9)._m0[167].w;
    float _2951 = _1658 + _2949;
    float _2953 = -(*spvDescriptorSet0.vp_c9)._m0[169].w;
    float _2955 = _1658 + _2953;
    bool _2957 = _1658 >= (*spvDescriptorSet0.vp_c9)._m0[174].w;
    bool _2959 = isnan(_1658);
    bool _2961 = _2957 || _2959;
    bool _2963 = isnan((*spvDescriptorSet0.vp_c9)._m0[174].w);
    bool _2965 = _2961 || _2963;
    float _2967 = float(_2965);
    float _2969 = fma(_2423, _2917, (*spvDescriptorSet0.vp_c9)._m0[168].x);
    bool _2971 = _1658 >= (*spvDescriptorSet0.vp_c9)._m0[173].w;
    bool _2973 = isnan(_1658);
    bool _2975 = _2971 || _2973;
    bool _2977 = isnan((*spvDescriptorSet0.vp_c9)._m0[173].w);
    bool _2979 = _2975 || _2977;
    float _2981 = float(_2979);
    float _2983 = fma(_2373, _2951, (*spvDescriptorSet0.vp_c9)._m0[167].x);
    float _2985 = fma(_2885, _2955, (*spvDescriptorSet0.vp_c9)._m0[169].x);
    float _2987 = -_2967;
    float _2989 = _2987 + 1.0;
    float _2991 = -(*spvDescriptorSet0.vp_c9)._m0[170].w;
    float _2993 = _1658 + _2991;
    bool _2995 = _1658 >= (*spvDescriptorSet0.vp_c9)._m0[172].w;
    bool _2997 = isnan(_1658);
    bool _2999 = _2995 || _2997;
    bool _3001 = isnan((*spvDescriptorSet0.vp_c9)._m0[172].w);
    bool _3003 = _2999 || _3001;
    float _3005 = float(_3003);
    float _3007 = -_2981;
    float _3009 = _3007 + 1.0;
    bool _3011 = _1658 >= (*spvDescriptorSet0.vp_c9)._m0[171].w;
    bool _3013 = isnan(_1658);
    bool _3015 = _3011 || _3013;
    bool _3017 = isnan((*spvDescriptorSet0.vp_c9)._m0[171].w);
    bool _3019 = _3015 || _3017;
    float _3021 = float(_3019);
    float _3023 = fma(_2927, _1833, (*spvDescriptorSet0.vp_c9)._m0[172].x);
    float _3025 = _2981 * _2989;
    float _3027 = fma(_2871, _2993, (*spvDescriptorSet0.vp_c9)._m0[170].x);
    bool _3029 = _1658 >= (*spvDescriptorSet0.vp_c9)._m0[169].w;
    bool _3031 = isnan(_1658);
    bool _3033 = _3029 || _3031;
    bool _3035 = isnan((*spvDescriptorSet0.vp_c9)._m0[169].w);
    bool _3037 = _3033 || _3035;
    float _3039 = float(_3037);
    float _3041 = _3005 * _3009;
    float _3043 = -_3005;
    float _3045 = _3043 + 1.0;
    bool _3047 = _1658 >= (*spvDescriptorSet0.vp_c9)._m0[170].w;
    bool _3049 = isnan(_1658);
    bool _3051 = _3047 || _3049;
    bool _3053 = isnan((*spvDescriptorSet0.vp_c9)._m0[170].w);
    bool _3055 = _3051 || _3053;
    float _3057 = float(_3055);
    float _3059 = -(*spvDescriptorSet0.vp_c9)._m0[171].w;
    float _3061 = _1658 + _3059;
    float _3063 = -_3021;
    float _3065 = _3063 + 1.0;
    float _3067 = -(*spvDescriptorSet0.vp_c9)._m0[173].w;
    float _3069 = _3067 + (*spvDescriptorSet0.vp_c9)._m0[174].w;
    bool _3071 = _1658 >= (*spvDescriptorSet0.vp_c9)._m0[168].w;
    bool _3073 = isnan(_1658);
    bool _3075 = _3071 || _3073;
    bool _3077 = isnan((*spvDescriptorSet0.vp_c9)._m0[168].w);
    bool _3079 = _3075 || _3077;
    float _3081 = float(_3079);
    float _3083 = -_3039;
    float _3085 = _3083 + 1.0;
    float _3087 = fma(_2913, _3061, (*spvDescriptorSet0.vp_c9)._m0[171].x);
    float _3089 = _3021 * _3045;
    float _3091 = _3057 * _3065;
    float _3093 = -_3057;
    float _3095 = _3093 + 1.0;
    float _3097 = _1995 * (*spvDescriptorSet0.vp_c9)._m0[90].x;
    bool _3099 = _1658 >= (*spvDescriptorSet0.vp_c9)._m0[167].w;
    bool _3101 = isnan(_1658);
    bool _3103 = _3099 || _3101;
    bool _3105 = isnan((*spvDescriptorSet0.vp_c9)._m0[167].w);
    bool _3107 = _3103 || _3105;
    float _3109 = float(_3107);
    float _3111 = _3081 * _3085;
    float _3113 = 1.0 / _3069;
    float _3115 = -_3081;
    float _3117 = _3115 + 1.0;
    float _3119 = _3039 * _3095;
    float _3121 = _2047 * (*spvDescriptorSet0.vp_c9)._m0[90].y;
    float _3123 = _3109 * _3117;
    float _3125 = -_3109;
    float _3127 = _3125 + 1.0;
    float _3129 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[95].w;
    float _3131 = fma(_3121, _2365, -0.5);
    float _3133 = fma(_2449, (*spvDescriptorSet0.vp_c9)._m0[80].y, -0.5);
    float _3135 = _2983 * _3123;
    float _3137 = _2447 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _3139 = fma(_3097, _2291, -0.5);
    float _3141 = -(*spvDescriptorSet0.vp_c9)._m0[173].x;
    float _3143 = (*spvDescriptorSet0.vp_c9)._m0[174].x + _3141;
    float _3145 = fma(_3127, (*spvDescriptorSet0.vp_c9)._m0[167].x, _3135);
    float _3147 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[95].z;
    float _3149 = _2937 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _3151 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _3153 = _3137 + _3151;
    float _3155 = _3143 * _3113;
    float _3157 = fma(_2969, _3111, _3145);
    float _3159 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _3161 = _3149 + _3159;
    float _3163 = _3153 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _3165 = fma(_3155, _1841, (*spvDescriptorSet0.vp_c9)._m0[173].x);
    float _3167 = _3129 * (*spvDescriptorSet0.vp_c9)._m0[95].y;
    float _3169 = fma(_2985, _3119, _3157);
    float _3171 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _3173 = _2575 + _3171;
    float _3175 = fma(_3161, (*spvDescriptorSet0.vp_c8)._m0[28].x, _3163);
    float _3177 = fma(_3027, _3091, _3169);
    int _3179 = _2947 ? 0 : 1;
    float _3181 = fma(_3173, (*spvDescriptorSet0.vp_c8)._m0[28].z, _3175);
    float _3183 = _3147 * (*spvDescriptorSet0.vp_c9)._m0[95].x;
    float _3185 = fma(_2295, (*spvDescriptorSet0.vp_c9)._m0[80].x, -0.5);
    float _3187 = fma(_3087, _3089, _3177);
    float _3189 = _3153 * _3153;
    bool _3191 = _3181 >= 0.0;
    float _3193 = fma(_2775, _3185, _2537);
    float _3195 = fma(_3183, _2425, -0.5);
    float _3197 = fma(_3161, _3161, _3189);
    int _3199 = _2433 >> 31;
    float _3201 = fma(_3167, _2453, -0.5);
    float _3203 = fma(_2771, _3195, _2493);
    int _3205 = _2573 >> 31;
    float _3207 = fma(_3173, _3173, _3197);
    int _3209 = _3199 & 3;
    float _3211 = -_2595;
    float _3213 = fma(_2567, _3201, _3211);
    int _3215 = _3205 & 3;
    int _3217 = _2433 + _3209;
    float _3219 = fma(_3023, _3041, _3187);
    int _3221 = _3199;
    float _3223 = _3131;
    if (_3191)
    {
        _2607 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _3225 = _2607;
    float _3227 = _3203 + 0.5;
    int _3229 = _2573 + _3215;
    float _3231 = -_2445;
    float _3233 = fma(_2761, _3133, _3231);
    int _3235 = _3217 >> 2;
    if (_3191)
    {
        float _3237 = _3225 * 5.0;
        _3221 = as_type<int>(_3237);
    }
    int _3239 = _3221;
    int _3241 = _3229 >> 2;
    float _3243 = rsqrt(_3207);
    int _3245 = _3235 << 4;
    int _3247 = _3245 + 368;
    float _3249 = _3233 + 0.5;
    int _3251 = _3241 << 4;
    int _3253 = _3251 + 512;
    if (_3191)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _10242 = as_type<float>(_3239);
        out.gl_Position.z = _10242;
    }
    uint _3255 = uint(int(uint(_3247) >> uint(2)));
    uint _3257 = uint(int(uint(int(_3255)) >> uint(2)));
    int _3259 = int(_3255) & 3;
    float _3261 = (*spvDescriptorSet0.vp_c9)._m0[int(_3257)][_3259];
    int _3263 = int(_3255) + 1;
    uint _3265 = uint(int(uint(_3263) >> uint(2)));
    int _3267 = _3263 & 3;
    float _3269 = (*spvDescriptorSet0.vp_c9)._m0[int(_3265)][_3267];
    bool _3271 = !_2889;
    int _3273 = _3271 ? 0 : 1;
    float _3275 = _3193 + 0.5;
    int _3277 = ~_3179;
    int _3279 = _3277 + 1;
    int _3281 = _3279 + 1;
    float _3283 = _3213 + 0.5;
    int _3285 = _3281;
    if (!_2935)
    {
        int _3287 = ~_3179;
        int _3289 = _3287 + 1;
        _3285 = _3289;
    }
    int _3291 = _3285;
    float _3293 = _1664 + _1801;
    int _3295 = abs(_2521);
    uint _3297 = uint(int(uint(_3253) >> uint(2)));
    uint _3299 = uint(int(uint(int(_3297)) >> uint(2)));
    int _3301 = int(_3297) & 3;
    float _3303 = (*spvDescriptorSet0.vp_c9)._m0[int(_3299)][_3301];
    int _3305 = int(_3297) + 1;
    uint _3307 = uint(int(uint(_3305) >> uint(2)));
    int _3309 = _3305 & 3;
    float _3311 = (*spvDescriptorSet0.vp_c9)._m0[int(_3307)][_3309];
    out.m_75.x = _3227;
    out.m_75.y = _3283;
    float _3313 = float(_3291);
    float _3315 = fma(_3165, _3025, _3219);
    float _3317 = _3153 * _3243;
    float _3319 = _3161 * _3243;
    int _3321 = ~_2841;
    int _3323 = _3321 + _2883;
    int _3325 = _3323 + 1;
    float _3327 = fma(_2967, (*spvDescriptorSet0.vp_c9)._m0[174].x, _3315);
    int _3329 = _3247 + 8;
    uint _3331 = uint(int(uint(_3329) >> uint(2)));
    uint _3333 = uint(int(uint(int(_3331)) >> uint(2)));
    int _3335 = int(_3331) & 3;
    float _3337 = (*spvDescriptorSet0.vp_c9)._m0[int(_3333)][_3335];
    int _3339 = int(_3331) + 1;
    uint _3341 = uint(int(uint(_3339) >> uint(2)));
    int _3343 = _3339 & 3;
    float _3345 = (*spvDescriptorSet0.vp_c9)._m0[int(_3341)][_3343];
    float _3347 = -_3317;
    float _3349 = fma(_3347, (*spvDescriptorSet0.vp_c9)._m0[18].w, _3153);
    float _3351 = -_3319;
    float _3353 = fma(_3351, (*spvDescriptorSet0.vp_c9)._m0[18].w, _3161);
    int _3355 = abs(_2669);
    out.m_77.x = _3327;
    float _3357 = _3349 * _3349;
    int _3359 = abs(_2717);
    int _3361 = _1704 * _3325;
    int _3363 = _3361 + _2187;
    int _3365 = _3253 + 8;
    uint _3367 = uint(int(uint(_3365) >> uint(2)));
    uint _3369 = uint(int(uint(int(_3367)) >> uint(2)));
    int _3371 = int(_3367) & 3;
    float _3373 = (*spvDescriptorSet0.vp_c9)._m0[int(_3369)][_3371];
    int _3375 = int(_3367) + 1;
    uint _3377 = uint(int(uint(_3375) >> uint(2)));
    int _3379 = _3375 & 3;
    float _3381 = (*spvDescriptorSet0.vp_c9)._m0[int(_3377)][_3379];
    float _3383 = fma(_3353, _3353, _3357);
    int _3385 = abs(_3273);
    float _3387 = _3293 + (-1.0);
    int _3389 = ~_2699;
    int _3391 = _3389 + _2805;
    int _3393 = _3391 + 1;
    out.m_79.x = _3275;
    out.m_79.y = _3249;
    float _3395 = float(_3385);
    float _3397 = fma(_2773, _3139, _2661);
    int _3399 = abs(_2931);
    int _3401 = _1672 * _3393;
    int _3403 = _3401 + _1967;
    int _3405 = ~_3355;
    int _3407 = _3405 + 1;
    int _3409 = _3407 + 1;
    float _3411 = _3395 * _3313;
    bool _3413 = !_2637;
    int _3415 = _3413 ? 0 : 1;
    float _3417 = -_2777;
    float _3419 = fma(_2759, _3131, _3417);
    int _3421 = ~_3399;
    int _3423 = _3421 + 1;
    int _3425 = _3423 + 1;
    float _3427 = _3173 * _3243;
    int _3429 = abs(_3415);
    float _3431 = _3419 + 0.5;
    float _3433 = -_3427;
    float _3435 = fma(_3433, (*spvDescriptorSet0.vp_c9)._m0[18].w, _3173);
    int _3437 = abs(_2615);
    if (_3191)
    {
        out.m_51.x = 0.0;
    }
    int _3439 = ~_3295;
    int _3441 = _3439 + 1;
    int _3443 = _3441 + 1;
    float _3445 = _1664 + (-0.5);
    bool _3447 = _2457 != 3;
    int _3449 = _3443 * as_type<int>(_3269);
    int _3451 = ~_3429;
    int _3453 = _3451 + 1;
    int _3455 = _3453 + 1;
    int _3457 = ~_3437;
    int _3459 = _3457 + 1;
    int _3461 = _3459 + 1;
    int _3463 = _3425 * as_type<int>(_3261);
    int _3465 = _3463 + _3449;
    bool _3467 = !_2377;
    int _3469 = _3467 ? 0 : 1;
    int _3471 = _3409 * as_type<int>(_3311);
    bool _3473 = !_3447;
    int _3475 = _3473 ? 0 : (-1);
    bool _3477 = _2583 != 3;
    int _3479 = _3455 * as_type<int>(_3303);
    int _3481 = _3479 + _3471;
    int _3483 = abs(_3475);
    int _3485 = _3461 * as_type<int>(_3337);
    int _3487 = _3485 + _3465;
    bool _3489 = !_3477;
    int _3491 = _3489 ? 0 : (-1);
    float _3493 = in.m_81.x;
    float _3495 = in.m_81.y;
    float _3497 = in.m_81.z;
    int _3499 = abs(_3469);
    int _3501 = abs(_3491);
    int _3503 = ~_3359;
    int _3505 = _3503 + 1;
    int _3507 = _3505 + 1;
    int _3509 = ~_3483;
    int _3511 = _3509 + 1;
    int _3513 = _3511 + 1;
    float _3515 = _3411 * (-2.0);
    bool _3517 = !_2893;
    int _3519 = _3517 ? 0 : 1;
    int _3521 = _3507 * as_type<int>(_3373);
    int _3523 = _3521 + _3481;
    int _3525 = _3513 * as_type<int>(_3345);
    int _3527 = _3525 + _3487;
    int _3529 = ~_3501;
    int _3531 = _3529 + 1;
    int _3533 = _3531 + 1;
    int _3535 = abs(_2649);
    int _3537 = ~_3499;
    int _3539 = _3537 + 1;
    int _3541 = _3539 + 1;
    int _3543 = _3533 * as_type<int>(_3381);
    int _3545 = _3543 + _3523;
    int _3547 = abs(_3519);
    int _3549 = ~_3535;
    int _3551 = _3549 + 1;
    int _3553 = _3551 + 1;
    int _3555 = _3545 * _3541;
    bool _3557 = _1672 == 0;
    bool _3559 = _1704 == 0;
    int _3561 = _3527 * _3553;
    bool _3563 = !_3557;
    int _3565 = _3563 ? _3403 : (-1);
    float _3567 = fma(_3387, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    bool _3569 = !_3559;
    int _3571 = _3569 ? _3363 : (-1);
    float _3573 = float(_2869);
    int _3575 = _3565 * _3535;
    int _3577 = _3575 + _3561;
    float _3579 = float(_3547);
    int _3581 = _3571 * _3499;
    int _3583 = _3581 + _3555;
    float _3585 = fma(_3567, _3515, _3567);
    float _3587 = fma(_3515, _3493, _3493);
    float _3589 = _1801 + (-0.5);
    float _3591 = _3579 * _3573;
    float _3593 = fma(_3435, _3435, _3383);
    float _3595 = _3397 + 0.5;
    float _3597 = float(_3577);
    float _3599 = fma(_3589, (*spvDescriptorSet0.vp_c9)._m0[196].x, _3587);
    float _3601 = float(_3583);
    float _3603 = _3591 * (-2.0);
    out.m_83.x = _3595;
    out.m_83.y = _3431;
    float _3605 = fma(_3585, _2783, _3599);
    float _3607 = fma(_2933, _3603, _2933);
    out.m_85.x = _3597;
    out.m_85.y = _3601;
    float _3609 = fma(_3603, _3495, _3495);
    bool _3611 = !_2897;
    int _3613 = _3611 ? 0 : 1;
    float _3615 = _3497;
    if (_3191)
    {
        return out;
    }
    float _3617 = -_3317;
    float _3619 = fma(_3617, (*spvDescriptorSet0.vp_c9)._m0[18].w, _3137);
    int _3621 = abs(_3613);
    float _3623 = -_3319;
    float _3625 = fma(_3623, (*spvDescriptorSet0.vp_c9)._m0[18].w, _3149);
    float _3627 = float(_2925);
    float _3629 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _3631 = _3619 + _3629;
    float _3633 = float(_3621);
    float _3635 = -_3427;
    float _3637 = fma(_3635, (*spvDescriptorSet0.vp_c9)._m0[18].w, _2575);
    float _3639 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _3641 = _3625 + _3639;
    float _3643 = _3631 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _3645 = fma(_3445, (*spvDescriptorSet0.vp_c9)._m0[196].y, _3609);
    float _3647 = _3633 * _3627;
    float _3649 = _1801 + _2251;
    float _3651 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _3653 = _3637 + _3651;
    float _3655 = fma(_3641, (*spvDescriptorSet0.vp_c8)._m0[28].x, _3643);
    float _3657 = fma(_3607, _2783, _3645);
    float _3659 = _3649 + (-1.0);
    float _3661 = _3647 * (-2.0);
    float _3663 = fma(_3653, (*spvDescriptorSet0.vp_c8)._m0[28].z, _3655);
    float _3665 = _3605 * 0.15915493667125701904296875;
    float _3667 = fma(_3659, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _3669 = fma(_3661, _3497, _3497);
    float _3671 = _2251 + (-0.5);
    bool _3673 = _3663 >= 0.0;
    float _3675 = fma(_3667, _3661, _3667);
    float _3677 = _3657 * 0.15915493667125701904296875;
    float _3679 = fma(_3671, (*spvDescriptorSet0.vp_c9)._m0[196].z, _3669);
    float _3681 = _3665 * 6.283185482025146484375;
    float _3683 = sin(_3681);
    float _3685 = fma(_3675, _2783, _3679);
    float _3687 = _3685 * 0.15915493667125701904296875;
    float _3689 = _3677 * 6.283185482025146484375;
    float _3691 = sin(_3689);
    float _3693 = _3637;
    if (_3673)
    {
        _3615 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _3695 = _3615;
    int _3697 = as_type<int>(_3695);
    if (_3673)
    {
        out.m_51.x = 0.0;
    }
    if (_3673)
    {
        float _3699 = _3695 * 5.0;
        _3697 = as_type<int>(_3699);
    }
    int _3701 = _3697;
    float _3703 = _3665 * 6.283185482025146484375;
    float _3705 = cos(_3703);
    if (_3673)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _10916 = as_type<float>(_3701);
        out.gl_Position.z = _10916;
    }
    float _3707 = _3677 * 6.283185482025146484375;
    float _3709 = cos(_3707);
    float _3711 = _3687 * 6.283185482025146484375;
    float _3713 = sin(_3711);
    float _3715 = sqrt(_3593);
    float _3717 = _3683 * _3691;
    if (_3673)
    {
        return out;
    }
    float _3719 = -_3137;
    float _3721 = _3719 + (*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _3723 = in.m_87.x;
    float _3725 = in.m_87.y;
    float _3727 = in.m_87.z;
    float _3729 = -_3149;
    float _3731 = _3729 + (*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _3733 = -_2575;
    float _3735 = _3733 + (*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _3737 = _3721 * _3721;
    float _3739 = _3687 * 6.283185482025146484375;
    float _3741 = cos(_3739);
    float _3743 = _3705 * _3709;
    float _3745 = _3243 * _3715;
    float _3747 = fma(_3731, _3731, _3737);
    float _3749 = _528 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _3751 = fma(_3713, _3743, _3717);
    float _3753 = fma(_3735, _3735, _3747);
    float _3755 = fma(_3713, _3717, _3743);
    float _3757 = _3745 * _3749;
    float _3759 = _722 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _3761 = rsqrt(_3753);
    float _3763 = _526 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _3765 = _3705 * _3691;
    float _3767 = _3683 * _3709;
    float _3769 = _3745 * _3759;
    float _3771 = _3705 * _3741;
    float _3773 = _3709 * _3741;
    float _3775 = _3683 * _3741;
    float _3777 = _3745 * _3763;
    float _3779 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _3725);
    float _3781 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _3723);
    float _3783 = _3691 * _3741;
    float _3785 = -_3765;
    float _3787 = fma(_3713, _3767, _3785);
    float _3789 = _3779 * _3757;
    float _3791 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _3727);
    float _3793 = -_3767;
    float _3795 = fma(_3713, _3765, _3793);
    float _3797 = _3731 * _3761;
    float _3799 = _3781 * _3769;
    float _3801 = _3791 * _3777;
    float _3803 = in.m_89.x;
    float _3805 = in.m_89.y;
    float _3807 = in.m_89.z;
    float _3809 = _3735 * _3761;
    float _3811 = -(*spvDescriptorSet0.vp_c8)._m0[1].z;
    float _3813 = _3797 * _3811;
    bool _3815 = _3725 != 0.0;
    bool _3817 = isnan(_3725);
    bool _3819 = _3815 || _3817;
    bool _3821 = isnan(0.0);
    bool _3823 = _3819 || _3821;
    float _3825 = _3721 * _3761;
    float _3827 = -(*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _3829 = _3809 * _3827;
    float _3831 = -(*spvDescriptorSet0.vp_c8)._m0[1].x;
    float _3833 = -_3813;
    float _3835 = fma(_3809, _3831, _3833);
    bool _3837 = _3723 == 0.0;
    bool _3839 = !_3823;
    bool _3841 = _3837 && _3839;
    float _3843 = -(*spvDescriptorSet0.vp_c8)._m0[1].x;
    float _3845 = _3825 * _3843;
    float _3847 = -(*spvDescriptorSet0.vp_c8)._m0[1].z;
    float _3849 = -_3829;
    float _3851 = fma(_3825, _3847, _3849);
    float _3853 = _3835 * _3835;
    bool _3855 = _3727 == 0.0;
    bool _3857 = _3855 && _3841;
    float _3859 = in.m_91.x;
    float _3861 = in.m_91.y;
    float _3863 = in.m_91.z;
    float _3865 = in.m_91.w;
    float _3867 = -(*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _3869 = -_3845;
    float _3871 = fma(_3797, _3867, _3869);
    float _3873 = fma(_3851, _3851, _3853);
    float _3875 = -_3789;
    float _3877 = _3713 * _3875;
    float _3879 = _3771 * _3789;
    float _3881 = _3775 * _3789;
    float _3883 = fma(_3871, _3871, _3873);
    float _3885 = fma(_3773, _3799, _3877);
    float _3887 = fma(_3751, _3799, _3879);
    float _3889 = fma(_3787, _3799, _3881);
    float _3891 = rsqrt(_3883);
    float _3893 = fma(_3783, _3801, _3885);
    float _3895 = _3799;
    float _3897 = _3877;
    float _3899 = _3803;
    float _3901 = _3881;
    if (_3857)
    {
        _2779 = _3803;
    }
    float _3903 = _2779;
    float _3905 = fma(_3795, _3801, _3887);
    float _3907 = _3903;
    if (_3857)
    {
        _3223 = _3805;
    }
    float _3909 = _3223;
    float _3911 = _3909;
    if (_3857)
    {
        _3895 = _3903;
    }
    float _3913 = _3895;
    float _3915 = _3913;
    if (!_3857)
    {
        _3907 = _3803;
    }
    float _3917 = _3907;
    if (_3857)
    {
        _3897 = _3807;
    }
    float _3919 = _3897;
    float _3921 = _3919;
    if (_3857)
    {
        _3899 = _3909;
    }
    float _3923 = _3899;
    float _3925 = _3923;
    if (!_3857)
    {
        float _3927 = fma(_3723, (*spvDescriptorSet0.vp_c9)._m0[17].y, _3917);
        _3915 = _3927;
    }
    float _3929 = _3915;
    if (!_3857)
    {
        _3911 = _3805;
    }
    float _3931 = _3911;
    float _3933 = _3863 * _3917;
    if (_3857)
    {
        _3901 = _3919;
    }
    float _3935 = _3901;
    float _3937 = fma(_3755, _3801, _3889);
    float _3939 = _3935;
    if (!_3857)
    {
        _3921 = _3807;
    }
    float _3941 = _3921;
    if (!_3857)
    {
        float _3943 = fma(_3725, (*spvDescriptorSet0.vp_c9)._m0[17].y, _3931);
        _3925 = _3943;
    }
    float _3945 = _3925;
    float _3947 = _3851 * _3891;
    float _3949 = _3835 * _3891;
    float _3951 = _3859 * _3931;
    float _3953 = -_3933;
    float _3955 = fma(_3859, _3941, _3953);
    if (!_3857)
    {
        float _3957 = fma(_3727, (*spvDescriptorSet0.vp_c9)._m0[17].y, _3941);
        _3939 = _3957;
    }
    float _3959 = _3939;
    float _3961 = _3861 * _3941;
    float _3963 = _3871 * _3891;
    float _3965 = _3809 * _3949;
    float _3967 = _3825 * _3947;
    float _3969 = -_3961;
    float _3971 = fma(_3863, _3931, _3969);
    float _3973 = -_3951;
    float _3975 = fma(_3861, _3917, _3973);
    float _3977 = -_3965;
    float _3979 = fma(_3825, _3963, _3977);
    float _3981 = -_3967;
    float _3983 = fma(_3797, _3949, _3981);
    float _3985 = _3971 * _3865;
    float _3987 = _3955 * _3865;
    float _3989 = _3979 * _3905;
    float _3991 = _3983 * _3905;
    float _3993 = _3797 * _3963;
    float _3995 = _3975 * _3865;
    float _3997 = fma(_3947, _3893, _3989);
    float _3999 = fma(_3963, _3893, _3991);
    float _4001 = -_3993;
    float _4003 = fma(_3809, _3947, _4001);
    float _4005 = _3751 * _3979;
    float _4007 = fma(_3797, _3937, _3997);
    float _4009 = fma(_3809, _3937, _3999);
    float _4011 = _3751 * _4003;
    float _4013 = _3751 * _3983;
    float _4015 = _3149 + _4007;
    float _4017 = _2575 + _4009;
    float _4019 = _3771 * _3979;
    float _4021 = _3771 * _4003;
    float _4023 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _4025 = _4015 + _4023;
    float _4027 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _4029 = _4017 + _4027;
    float _4031 = _3771 * _3983;
    float _4033 = _3795 * _3979;
    float _4035 = _4025 * _4025;
    float _4037 = _4029 * _4029;
    float _4039 = _3795 * _3983;
    float _4041 = _3795 * _4003;
    float _4043 = _4003 * _3905;
    float _4045 = _4035 + _4037;
    float _4047 = fma(_3773, _3947, _4005);
    float _4049 = fma(_3773, _3949, _4011);
    float _4051 = fma(_3773, _3963, _4013);
    float _4053 = -_3713;
    float _4055 = fma(_4053, _3947, _4019);
    float _4057 = sqrt(_4045);
    float _4059 = fma(_3949, _3893, _4043);
    float _4061 = -_3713;
    float _4063 = fma(_4061, _3949, _4021);
    float _4065 = -_3713;
    float _4067 = fma(_4065, _3963, _4031);
    float _4069 = fma(_3783, _3947, _4033);
    float _4071 = fma(_3783, _3963, _4039);
    float _4073 = fma(_3775, _3797, _4055);
    float _4075 = fma(_3783, _3949, _4041);
    float _4077 = fma(_3825, _3937, _4059);
    float _4079 = fma(_3787, _3797, _4047);
    float _4081 = fma(_3787, _3825, _4049);
    float _4083 = fma(_3775, _3825, _4063);
    float _4085 = fma(_3775, _3809, _4067);
    float _4087 = fma(_3787, _3809, _4051);
    float _4089 = fma(_3755, _3797, _4069);
    float _4091 = fma(_3755, _3809, _4071);
    bool _4093 = _4057 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _4095 = _4073 * _3861;
    float _4097 = _4073 * _3945;
    float _4099 = _3987 * _4073;
    float _4101 = _3137 + _4077;
    float _4103 = fma(_3755, _3825, _4075);
    float _4105 = _4083 * _3945;
    float _4107 = _4083 * _3861;
    float _4109 = _4085 * _3861;
    float _4111 = _4085 * _3945;
    float _4113 = _3987 * _4083;
    float _4115 = _3987 * _4085;
    float _4117 = _4077;
    float _4119 = _4035;
    float _4121 = _4037;
    float _4123 = _4015;
    float _4125 = _4017;
    float _4127 = _4103;
    float _4129 = _3959;
    if (!_4093)
    {
        _4117 = _4101;
    }
    float _4131 = _4117;
    bool _4133 = !_4093;
    float _4135 = _4131;
    if (!_4133)
    {
        float _4137 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _4139 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _4141 = _4057 + _4139;
        float _4143 = rsqrt(_4045);
        float _4145 = _4141 * _4137;
        float _4147 = _4101 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _4149 = _4145 * 0.15915493667125701904296875;
        float _4151 = _4149 * 6.283185482025146484375;
        float _4153 = sin(_4151);
        float _4155 = _4149 * 6.283185482025146484375;
        float _4157 = cos(_4155);
        float _4159 = fma(_4153, _4147, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _4161 = _4143 * _4159;
        float _4163 = _4157 + (-1.0);
        float _4165 = fma(_4025, _4161, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _4167 = fma(_4029, _4161, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        float _4169 = _4163 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _4171 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
        float _4173 = _4165 + _4171;
        float _4175 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
        float _4177 = _4167 + _4175;
        float _4179 = fma(_4101, _4157, _4169);
        float _4181 = _4173 * _4173;
        float _4183 = _4177 * _4177;
        _4135 = _4179;
        _4119 = _4181;
        _4121 = _4183;
        _4123 = _4165;
        _4125 = _4167;
    }
    float _4185 = _4135;
    float _4187 = _4119;
    float _4189 = _4121;
    float _4191 = _4123;
    float _4193 = _4125;
    float _4195 = -(*spvDescriptorSet0.vp_c15)._m0[0].y;
    float _4197 = _4185 + _4195;
    float _4199 = fma(_3985, _4079, _4099);
    float _4201 = fma(_4079, _3859, _4095);
    float _4203 = fma(_4081, _3859, _4107);
    float _4205 = fma(_4197, _4197, _4187);
    float _4207 = fma(_3985, _4081, _4113);
    float _4209 = fma(_4087, _3859, _4109);
    float _4211 = fma(_4079, _3929, _4097);
    float _4213 = _4205 + _4189;
    float _4215 = fma(_4081, _3929, _4105);
    float _4217 = fma(_4087, _3929, _4111);
    float _4219 = fma(_3985, _4087, _4115);
    float _4221 = fma(_3995, _4089, _4199);
    float _4223 = fma(_4089, _3863, _4201);
    float _4225 = sqrt(_4213);
    float _4227 = fma(_4103, _3863, _4203);
    float _4229 = fma(_3995, _4103, _4207);
    float _4231 = fma(_4091, _3863, _4209);
    float _4233 = fma(_4089, _3959, _4211);
    float _4235 = fma(_4103, _3959, _4215);
    float _4237 = fma(_3995, _4091, _4219);
    float _4239 = fma(_4091, _3959, _4217);
    out.m_93.x = _4223;
    out.m_93.y = _4227;
    out.m_93.z = _4231;
    out.m_95.x = _4221;
    out.m_95.y = _4229;
    out.m_95.z = _4237;
    out.m_97.x = _4233;
    out.m_97.y = _4235;
    out.m_97.z = _4239;
    bool _4241 = _4225 >= (*spvDescriptorSet0.vp_c16)._m0[1].x;
    bool _4243 = isnan(_4225);
    bool _4245 = _4241 || _4243;
    bool _4247 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].x);
    bool _4249 = _4245 || _4247;
    float _4251 = _4221;
    float _4253 = _4229;
    if (!_4249)
    {
        _4127 = 1.0;
    }
    float _4255 = _4127;
    bool _4257 = !_4249;
    float _4259 = _4255;
    if (!_4257)
    {
        bool _4261 = _4225 >= (*spvDescriptorSet0.vp_c16)._m0[1].y;
        bool _4263 = isnan(_4225);
        bool _4265 = _4261 || _4263;
        bool _4267 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].y);
        bool _4269 = _4265 || _4267;
        if (!_4269)
        {
            float _4271 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _4273 = _4225 + _4271;
            float _4275 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _4277 = (*spvDescriptorSet0.vp_c16)._m0[1].y + _4275;
            float _4279 = -(*spvDescriptorSet0.vp_c16)._m0[2].x;
            float _4281 = _4279 + (*spvDescriptorSet0.vp_c16)._m0[2].y;
            float _4283 = 1.0 / _4277;
            float _4285 = _4273 * _4283;
            float _4287 = fma(_4285, _4281, (*spvDescriptorSet0.vp_c16)._m0[2].x);
            _4259 = _4287;
            _4251 = _4283;
            _4289 = true;
        }
        else
        {
            bool _4291 = _4225 >= (*spvDescriptorSet0.vp_c16)._m0[1].z;
            bool _4293 = isnan(_4225);
            bool _4295 = _4291 || _4293;
            bool _4297 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].z);
            bool _4299 = _4295 || _4297;
            if (!_4299)
            {
                float _4301 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _4303 = _4225 + _4301;
                float _4305 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _4307 = _4305 + (*spvDescriptorSet0.vp_c16)._m0[1].z;
                float _4309 = -(*spvDescriptorSet0.vp_c16)._m0[2].y;
                float _4311 = _4309 + (*spvDescriptorSet0.vp_c16)._m0[2].z;
                float _4313 = 1.0 / _4307;
                float _4315 = _4303 * _4313;
                float _4317 = fma(_4315, _4311, (*spvDescriptorSet0.vp_c16)._m0[2].y);
                _4259 = _4317;
                _4251 = _4313;
                _4289 = true;
            }
            else
            {
                _4259 = (*spvDescriptorSet0.vp_c16)._m0[2].z;
            }
        }
    }
    _4289 = false;
    float _4319 = _4259;
    float _4321 = _4251;
    float _4323 = -(*spvDescriptorSet0.vp_c16)._m0[0].y;
    float _4325 = _4185 + _4323;
    float _4327 = -(*spvDescriptorSet0.vp_c16)._m0[0].x;
    float _4329 = _4191 + _4327;
    float _4331 = -(*spvDescriptorSet0.vp_c16)._m0[0].z;
    float _4333 = _4193 + _4331;
    float _4335 = fma(_4325, _4319, (*spvDescriptorSet0.vp_c16)._m0[0].y);
    float _4337 = fma(_4329, _4319, (*spvDescriptorSet0.vp_c16)._m0[0].x);
    float _4339 = fma(_4333, _4319, (*spvDescriptorSet0.vp_c16)._m0[0].z);
    float _4341 = -_3137;
    float _4343 = _4341 + _4335;
    float _4345 = -_3149;
    float _4347 = _4345 + _4337;
    float _4349 = -_2575;
    float _4351 = _4349 + _4339;
    float _4353 = _4343 * _4343;
    float _4355 = fma(_4347, _4347, _4353);
    float _4357 = fma(_4351, _4351, _4355);
    float _4359 = sqrt(_4357);
    bool _4361 = _4359 > 0.0;
    bool _4363 = (*spvDescriptorSet0.vp_c15)._m0[660].y >= 0.5;
    bool _4365 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _4367 = _4363 || _4365;
    bool _4369 = isnan(0.5);
    bool _4371 = _4367 || _4369;
    float _4373 = _4321;
    float _4375 = (*spvDescriptorSet0.vp_c15)._m0[660].y;
    if (!_4361)
    {
        _4373 = _4337;
    }
    float _4377 = _4373;
    float _4379 = _4377;
    if (!_4361)
    {
        _4253 = _4335;
    }
    float _4381 = _4253;
    float _4383 = _4381;
    float _4385 = _4381;
    if (!_4361)
    {
        _4375 = _4339;
    }
    float _4387 = _4375;
    bool _4389 = !_4361;
    float _4391 = _4387;
    if (!_4389)
    {
        float _4393 = _214 * _214;
        float _4395 = rsqrt(_4357);
        float _4397 = fma(_212, _212, _4393);
        float _4399 = fma(_216, _216, _4397);
        float _4401 = sqrt(_4399);
        float _4403 = _4347 * _4395;
        float _4405 = _4343 * _4395;
        float _4407 = _4351 * _4395;
        bool _4409 = _4401 > 0.0;
        float _4411 = _4401;
        float _4413 = _4395;
        if (!_4409)
        {
            _4411 = _4337;
        }
        float _4415 = _4411;
        _4379 = _4415;
        if (!_4409)
        {
            _4383 = _4335;
        }
        float _4417 = _4383;
        _4385 = _4417;
        if (!_4409)
        {
            _4413 = _4339;
        }
        float _4419 = _4413;
        bool _4421 = !_4409;
        _4391 = _4419;
        if (!_4421)
        {
            float _4423 = rsqrt(_4399);
            float _4425 = 1.0 / (*spvDescriptorSet0.vp_c10)._m0[2].z;
            float _4427 = _214 * _4423;
            float _4429 = _212 * _4423;
            float _4431 = _4405 * _4427;
            float _4433 = _216 * _4423;
            float _4435 = fma(_4403, _4429, _4431);
            float _4437 = _4425 * (*spvDescriptorSet0.vp_c9)._m0[142].x;
            float _4439 = fma(_4407, _4433, _4435);
            float _4441 = _4439 * _4437;
            float _4443 = fma(_212, _4441, _4337);
            float _4445 = fma(_214, _4441, _4335);
            float _4447 = fma(_216, _4441, _4339);
            _4379 = _4443;
            _4385 = _4445;
            _4391 = _4447;
        }
    }
    float _4449 = _4379;
    float _4451 = _4385;
    float _4453 = _4391;
    float _4455 = -_3319;
    float _4457 = fma(_4455, (*spvDescriptorSet0.vp_c9)._m0[18].w, _4449);
    float _4459 = -_3317;
    float _4461 = fma(_4459, (*spvDescriptorSet0.vp_c9)._m0[18].w, _4451);
    float _4463 = -_3427;
    float _4465 = fma(_4463, (*spvDescriptorSet0.vp_c9)._m0[18].w, _4453);
    float _4467 = _4461;
    float _4469 = _4457;
    float _4471 = _4465;
    float _4473 = _4449;
    if (!_4371)
    {
        float _4475 = _3631 * _3631;
        float _4477 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _4479 = -_2575;
        float _4481 = _4479 + _4453;
        float _4483 = fma(_3641, _3641, _4475);
        float _4485 = fma(_3653, _3653, _4483);
        float _4487 = 1.0 / _3745;
        float _4489 = sqrt(_4485);
        float _4491 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _4493 = precise::min(_4489, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _4495 = _4493 * _4477;
        float _4497 = -_3137;
        float _4499 = _4497 + _4451;
        float _4501 = _4491 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _4503 = _4495 * _4487;
        float _4505 = -_3149;
        float _4507 = _4505 + _4449;
        float _4509 = _4501 * _4503;
        float _4511 = _4481 * _4503;
        float _4513 = fma(_4507, _4509, _3625);
        float _4515 = fma(_4499, _4509, _3619);
        float _4517 = fma(_4501, _4511, _3637);
        _4467 = _4515;
        _4469 = _4513;
        _4471 = _4517;
    }
    float _4519 = _4467;
    float _4521 = _4469;
    float _4523 = _4471;
    float _4525 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _4527 = _4519 + _4525;
    float _4529 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _4531 = _4521 + _4529;
    float _4533 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _4535 = _4523 + _4533;
    float _4537 = _4527 * _4527;
    float _4539 = fma(_4531, _4531, _4537);
    float _4541 = fma(_4535, _4535, _4539);
    float _4543 = rsqrt(_4541);
    float _4545 = _4543 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _4547 = _4531 * _4545;
    float _4549 = _4535 * _4545;
    float _4551 = _4547 * _4547;
    float _4553 = _4549 * _4549;
    float _4555 = _4551 + _4553;
    float _4557 = sqrt(_4555);
    bool _4559 = _4557 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _4561 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _4563 = _4557 + _4561;
    float _4565 = _4535;
    float _4567 = _4563;
    if (_4559)
    {
        float _4569 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _4565 = _4569;
    }
    float _4571 = _4565;
    if (_4559)
    {
        float _4573 = rsqrt(_4555);
        _222 = _4573;
    }
    float _4575 = _222;
    float _4577 = _4575;
    if (_4559)
    {
        float _4579 = _4563 * _4571;
        _4567 = _4579;
    }
    float _4581 = _4567;
    if (_4559)
    {
        float _4583 = _4581 * 0.15915493667125701904296875;
        _4473 = _4583;
    }
    float _4585 = _4473;
    float _4587 = _4543;
    if (_4559)
    {
        float _4589 = _4585 * 6.283185482025146484375;
        float _4591 = cos(_4589);
        _4587 = _4591;
    }
    float _4593 = _4587;
    float _4595 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _4597 = precise::max(0.0, _4595);
    float _4599 = _4539;
    float _4601 = _4597;
    float _4603 = _4595;
    if (_4559)
    {
        float _4605 = _4585 * 6.283185482025146484375;
        float _4607 = sin(_4605);
        _4599 = _4607;
    }
    float _4609 = _4599;
    float _4611 = -_4545;
    float _4613 = -_4597;
    float _4615 = fma(_4527, _4611, _4613);
    float _4617 = (*spvDescriptorSet0.vp_c15)._m0[652].x;
    if (_4559)
    {
        float _4619 = _4615 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _4601 = _4619;
    }
    float _4621 = _4601;
    float _4623 = _4621;
    float _4625 = _4593;
    if (_4559)
    {
        float _4627 = _4593 + (-1.0);
        _4603 = _4627;
    }
    float _4629 = _4603;
    float _4631 = fma(_3625, (*spvDescriptorSet0.vp_c15)._m0[652].x, (*spvDescriptorSet0.vp_c15)._m0[652].z);
    float _4633 = _4629;
    if (!_4559)
    {
        _4617 = _4553;
    }
    float _4635 = _4617;
    float _4637 = _4635;
    if (_4559)
    {
        float _4639 = _4629 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _4633 = _4639;
    }
    float _4641 = _4633;
    float _4643 = floor(_4631);
    float _4645 = _4609;
    if (_4559)
    {
        float _4647 = fma(_4609, _4621, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _4623 = _4647;
    }
    float _4649 = _4623;
    float _4651 = _4649;
    if (!_4559)
    {
        _4645 = _4615;
    }
    float _4653 = _4645;
    float _4655 = _4653;
    if (_4559)
    {
        float _4657 = fma(_4615, _4593, _4641);
        _4655 = _4657;
    }
    float _4659 = _4655;
    if (!_4559)
    {
        _4625 = _4549;
    }
    float _4661 = _4625;
    float _4663 = _4661;
    if (_4559)
    {
        float _4665 = _4575 * _4649;
        _4129 = _4665;
    }
    float _4667 = _4129;
    if (!_4559)
    {
        _4577 = _4547;
    }
    float _4669 = _4577;
    float _4671 = sqrt(_4541);
    float _4673 = _4669;
    if (!_4559)
    {
        _4651 = _4551;
    }
    float _4675 = _4651;
    float _4677 = _4675;
    if (_4559)
    {
        float _4679 = _4547 * _4667;
        _4673 = _4679;
    }
    float _4681 = _4673;
    if (_4559)
    {
        float _4683 = _4549 * _4667;
        _4663 = _4683;
    }
    float _4685 = _4663;
    if (_4559)
    {
        float _4687 = _4681 * _4681;
        _4677 = _4687;
    }
    float _4689 = _4677;
    if (_4559)
    {
        float _4691 = _4685 * _4685;
        _4637 = _4691;
    }
    float _4693 = _4637;
    float _4695 = _4519 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _4697 = fma(_4659, _4659, _4689);
    float _4699 = -_4643;
    float _4701 = _4631 + _4699;
    float _4703 = fma(_4521, (*spvDescriptorSet0.vp_c8)._m0[2].x, _4695);
    float _4705 = _4697 + _4693;
    float _4707 = fma(_3637, (*spvDescriptorSet0.vp_c15)._m0[652].y, (*spvDescriptorSet0.vp_c15)._m0[652].w);
    float _4709 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _4711 = fma(_4671, (*spvDescriptorSet0.vp_c15)._m0[23].w, _4709);
    float _4713 = precise::clamp(_4711, 0.0, 1.0);
    float _4715 = fma(_4523, (*spvDescriptorSet0.vp_c8)._m0[2].z, _4703);
    float _4717 = rsqrt(_4705);
    float _4719 = -_4713;
    float _4721 = _4719 + 1.0;
    float _4723 = _4715 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _4725 = _4519 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _4727 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _4729 = _4723 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _4731 = abs(_4721);
    float _4733 = log2(_4731);
    float _4735 = _4519 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _4737 = fma(_4521, (*spvDescriptorSet0.vp_c8)._m0[3].x, _4725);
    float _4739 = -_4729;
    float _4741 = fma(_4739, _4727, 1.0);
    float _4743 = _4519 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _4745 = fma(_4521, (*spvDescriptorSet0.vp_c8)._m0[1].x, _4735);
    float _4747 = fma(_4523, (*spvDescriptorSet0.vp_c8)._m0[3].z, _4737);
    float _4749 = _4717 * _4681;
    float _4751 = fma(_4521, (*spvDescriptorSet0.vp_c8)._m0[0].x, _4743);
    float _4753 = fma(_4523, (*spvDescriptorSet0.vp_c8)._m0[1].z, _4745);
    float _4755 = _4717 * _4659;
    float _4757 = _4749 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _4759 = fma(_4523, (*spvDescriptorSet0.vp_c8)._m0[0].z, _4751);
    float _4761 = _4753 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _4763 = _4717 * _4685;
    float _4765 = -_4757;
    float _4767 = fma(_4755, (*spvDescriptorSet0.vp_c15)._m0[21].y, _4765);
    float _4769 = _4759 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _4771 = _4761 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _4773 = _4747 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _4775 = -_4763;
    float _4777 = fma(_4775, (*spvDescriptorSet0.vp_c15)._m0[21].z, _4767);
    float _4779 = _4733 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _4781 = fma(_4769, (*spvDescriptorSet0.vp_c8)._m0[7].x, _4771);
    float _4783 = floor(_4707);
    float _4785 = fma(_4777, -0.5, 0.5);
    float _4787 = fma(_4723, (*spvDescriptorSet0.vp_c8)._m0[7].z, _4781);
    float _4789 = fma(_4777, 0.5, 0.5);
    float _4791 = _4761 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _4793 = _4755 + 1.0;
    float _4795 = fma(_4773, (*spvDescriptorSet0.vp_c8)._m0[7].w, _4787);
    float _4797 = exp2(_4779);
    float _4799 = _4761 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _4801 = fma(_4789, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _4803 = fma(_4769, (*spvDescriptorSet0.vp_c8)._m0[5].x, _4791);
    float _4805 = fma(_4769, (*spvDescriptorSet0.vp_c8)._m0[4].x, _4799);
    float _4807 = fma(_4789, _4801, -0.212114393711090087890625);
    float _4809 = fma(_4723, (*spvDescriptorSet0.vp_c8)._m0[5].z, _4803);
    float _4811 = sqrt(_4785);
    float _4813 = fma(_4723, (*spvDescriptorSet0.vp_c8)._m0[4].z, _4805);
    float _4815 = fma(_4789, _4807, 1.570728778839111328125);
    float _4817 = fma(_4773, (*spvDescriptorSet0.vp_c8)._m0[5].w, _4809);
    float _4819 = -_4783;
    float _4821 = _4707 + _4819;
    float _4823 = fma(_4773, (*spvDescriptorSet0.vp_c8)._m0[4].w, _4813);
    float _4825 = log2(_4741);
    float _4827 = -_4755;
    float _4829 = fma(_4797, _4793, _4827);
    float _4831 = 1.0 / _4795;
    float _4833 = _4811 * 0.636619746685028076171875;
    float2 _12758 = float2(_4701, _4821);
    float _4835 = dm_bs(spvDescriptorSet0.vp_t_tcb_24.sample(spvDescriptorSet0.vp_t_tcb_24Smplr, select(_12758, float2(0.0), isnan(_12758)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_24, spvDescriptorSet0.vp_t_tcb_24Smplr_w, select(_12758, float2(0.0), isnan(_12758)), level(0.0)).x;
    float _4837 = _4825 * 0.693147182464599609375;
    float _4839 = _4823 * _4831;
    float _4841 = _4817 * _4831;
    float _4843 = -_4815;
    float _4845 = fma(_4833, _4843, 1.0);
    float _4847 = _4837 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _4849 = fma(_4839, 0.5, 0.5);
    float _4851 = fma(_4841, -0.5, 0.5);
    float _4853 = fma(_4829, 0.5, 0.5);
    float3 _12793 = float3(_4849, _4851, _4847);
    float _4855 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_12793, float3(0.0), isnan(_12793)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_12793, float3(0.0), isnan(_12793)), level(0.0)).x;
    float3 _12804 = float3(_4849, _4851, _4847);
    float4 _4858 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_12804, float3(0.0), isnan(_12804)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_12804, float3(0.0), isnan(_12804)), level(0.0)).xyzw;
    float _4860 = _4858.x;
    float _4862 = _4858.y;
    float _4864 = _4858.z;
    float _4866 = _4858.w;
    float2 _12820 = float2(_4845, _4853);
    float3 _4870 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_12820, float2(0.0), isnan(_12820)), level(0.0)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_12820, float2(0.0), isnan(_12820)), level(0.0)).xyz;
    float _4872 = _4870.x;
    float _4874 = _4870.y;
    float _4876 = _4870.z;
    float _4878 = _3619 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _4880 = _4761 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    out.m_99.x = _3625;
    out.m_99.y = _3619;
    out.m_99.z = _3637;
    float _4882 = fma(_3625, (*spvDescriptorSet0.vp_c8)._m0[11].x, _4878);
    float _4884 = fma(_4769, (*spvDescriptorSet0.vp_c8)._m0[6].x, _4880);
    out.m_101.x = _4521;
    out.m_101.y = _4519;
    out.m_101.z = _4523;
    float _4886 = fma(_3637, (*spvDescriptorSet0.vp_c8)._m0[11].z, _4882);
    float _4888 = _3619 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _4890 = fma(_4723, (*spvDescriptorSet0.vp_c8)._m0[6].z, _4884);
    float _4892 = _4886 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _4894 = fma(_3625, (*spvDescriptorSet0.vp_c8)._m0[10].x, _4888);
    float _4896 = _4795 * 0.5;
    float _4898 = fma(_4773, (*spvDescriptorSet0.vp_c8)._m0[6].w, _4890);
    float _4900 = 1.0 / _4892;
    float _4902 = fma(_3637, (*spvDescriptorSet0.vp_c8)._m0[10].z, _4894);
    float _4904 = _4823 + _4795;
    bool _4906 = _4671 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _4908 = isnan(_4671);
    bool _4910 = _4906 || _4908;
    bool _4912 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _4914 = _4910 || _4912;
    out.gl_Position.x = _4823;
    out.gl_Position.y = _4817;
    out.gl_Position.z = _4898;
    out.gl_Position.w = _4795;
    float _4916 = _4902 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _4918 = _4904 * 0.5;
    float _4920 = _4916 + _4892;
    float _4922 = _4920 * _4900;
    float _4924 = _4922 * 0.5;
    if (!_4914)
    {
        _3693 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _4926 = _3693;
    float _4928 = in.m_103.x;
    float _4930 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _4932 = fma(_4924, (*spvDescriptorSet0.vp_c8)._m0[30].w, _4930);
    float _4934 = 1.0 / _4932;
    float _4936 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _4938 = _4934 * _4936;
    float _4940 = abs(_4938);
    float _4942 = log2(_4940);
    float _4944 = _4942 * (*spvDescriptorSet0.vp_c15)._m0[654].z;
    float _4946 = exp2(_4944);
    float _4948 = fma(_4946, (*spvDescriptorSet0.vp_c15)._m0[654].x, (*spvDescriptorSet0.vp_c15)._m0[654].y);
    float _4950 = precise::clamp(_4948, 0.0, 1.0);
    float _4952 = fma(_4950, -2.0, 3.0);
    float _4954 = _4950 * _4950;
    float _4956 = _4954 * _4952;
    float _4958 = _4733 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    bool _4960 = _4938 <= 8000.0;
    bool _4962 = isnan(_4938);
    bool _4964 = _4960 || _4962;
    bool _4966 = isnan(8000.0);
    bool _4968 = _4964 || _4966;
    float _4970 = float(_4968);
    float _4972 = -_4956;
    float _4974 = _4972 + 1.0;
    float _4976 = exp2(_4958);
    float _4978 = fma(_4974, (*spvDescriptorSet0.vp_c15)._m0[654].w, _4956);
    float _4980 = fma(_4817, -0.5, _4896);
    float _4982 = _4898 + _4795;
    float _4984 = _4970 * _4978;
    float _4986 = _4982 * 0.5;
    float _4988 = _4984 * (*spvDescriptorSet0.vp_c15)._m0[653].x;
    out.m_105.x = _4918;
    out.m_105.y = _4980;
    out.m_105.z = _4986;
    out.m_105.w = _4795;
    float _4990 = -_4976;
    float _4992 = _4990 + 1.0;
    float _4994 = _4992 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _4996 = -_4994;
    float _4998 = _4996 + 1.0;
    float _5000 = -_4835;
    float _5002 = _5000 + 1.0;
    float _5004 = _5002 * _4988;
    float _5006 = precise::clamp(_5004, 0.0, 1.0);
    float _5008 = -_5006;
    float _5010 = fma(_5008, (*spvDescriptorSet0.vp_c15)._m0[653].y, 1.0);
    float _5012 = (*spvDescriptorSet0.vp_c15)._m0[653].y;
    float _5014 = _4998;
    float _5016 = _4862;
    float _5018 = _4926;
    float _5020 = _4926;
    if (!_4914)
    {
        _5012 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _5022 = _5012;
    float _5024 = _5010 * _4928;
    float _5026 = _4994 * _4855;
    float _5028 = _4866 * _4998;
    float _5030 = _5024;
    float _5032 = _5022;
    float _5034 = _5022;
    if (!_4914)
    {
        _5014 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _5036 = _5014;
    float _5038 = _4866 * _5026;
    float _5040 = _4876 * _5026;
    float _5042 = fma(_4872, _5038, _4860);
    float _5044 = fma(_4874, _5038, _4862);
    float _5046 = _5024 * (*spvDescriptorSet0.vp_c13)._m0[1].w;
    float _5048 = fma(_4866, _5040, _4864);
    float _5050 = _5038;
    float _5052 = _5036;
    float _5054 = _5036;
    if (!_4914)
    {
        _5016 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _5056 = _5016;
    float _5058 = _5056;
    float _5060 = _5056;
    if (!_4914)
    {
        _5030 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _5062 = _5030;
    out.m_107.x = _5046;
    float _5064 = _5062;
    float _5066 = _5062;
    if (!_4914)
    {
        _5050 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _5068 = _5050;
    out.m_109.x = _5042;
    out.m_109.y = _5044;
    out.m_109.z = _5048;
    out.m_109.w = _5028;
    bool _5070 = !_4914;
    float _5072 = _5068;
    float _5074 = _5068;
    if (!_5070)
    {
        bool _5076 = _4671 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _5078 = isnan(_4671);
        bool _5080 = _5076 || _5078;
        bool _5082 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _5084 = _5080 || _5082;
        if (!_5084)
        {
            float _5086 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _5088 = _4671 + _5086;
            float _5090 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _5092 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _5090;
            float _5094 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _5096 = _5094 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _5098 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _5100 = _5098 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _5102 = 1.0 / _5092;
            float _5104 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _5106 = _5104 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _5108 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _5110 = _5108 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _5112 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _5114 = _5112 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _5116 = _5088 * _5102;
            float _5118 = precise::clamp(_5116, 0.0, 1.0);
            float _5120 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _5122 = _5120 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _5124 = fma(_5118, _5096, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _5126 = fma(_5118, _5100, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _5128 = fma(_5118, _5122, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _5130 = fma(_5118, _5106, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _5132 = fma(_5118, _5110, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _5134 = fma(_5118, _5114, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            _5074 = _5124;
            _5034 = _5132;
            _5020 = _5126;
            _5060 = _5130;
            _5054 = _5128;
            _5066 = _5134;
            _5136 = true;
        }
        else
        {
            bool _5138 = _4671 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _5140 = isnan(_4671);
            bool _5142 = _5138 || _5140;
            bool _5144 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _5146 = _5142 || _5144;
            if (!_5146)
            {
                _5058 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _5148 = _5058;
            _5060 = _5148;
            if (!_5146)
            {
                _5032 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _5150 = _5032;
            _5034 = _5150;
            if (!_5146)
            {
                _5064 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _5152 = _5064;
            _5066 = _5152;
            if (!_5146)
            {
                _5018 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _5154 = _5018;
            _5020 = _5154;
            if (!_5146)
            {
                _5072 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _5156 = _5072;
            _5074 = _5156;
            if (!_5146)
            {
                _5052 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _5158 = _5052;
            bool _5160 = !_5146;
            _5054 = _5158;
            if (!_5160)
            {
                bool _5162 = _4671 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _5164 = isnan(_4671);
                bool _5166 = _5162 || _5164;
                bool _5168 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _5170 = _5166 || _5168;
                if (!_5170)
                {
                    float _5172 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _5174 = _4671 + _5172;
                    float _5176 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _5178 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _5176;
                    float _5180 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _5182 = _5180 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _5184 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _5186 = _5184 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _5188 = 1.0 / _5178;
                    float _5190 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _5192 = _5190 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _5194 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _5196 = _5194 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _5198 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _5200 = _5198 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _5202 = _5174 * _5188;
                    float _5204 = precise::clamp(_5202, 0.0, 1.0);
                    float _5206 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _5208 = _5206 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _5210 = fma(_5204, _5182, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _5212 = fma(_5204, _5186, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _5214 = fma(_5204, _5208, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _5216 = fma(_5204, _5192, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _5218 = fma(_5204, _5196, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _5220 = fma(_5204, _5200, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    _5074 = _5210;
                    _5034 = _5218;
                    _5020 = _5212;
                    _5060 = _5216;
                    _5054 = _5214;
                    _5066 = _5220;
                    _5136 = true;
                }
                else
                {
                    _5074 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _5034 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _5020 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _5060 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _5054 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _5066 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _5136 = false;
    float _5222 = _5074;
    float _5224 = _5034;
    float _5226 = _5020;
    float _5228 = _5060;
    float _5230 = _5054;
    float _5232 = _5066;
    float _5234 = fma(_4235, -0.5, 0.5);
    float _5236 = precise::clamp(_5234, 0.0, 1.0);
    float _5238 = -_5222;
    float _5240 = _5224 + _5238;
    float _5242 = -_5226;
    float _5244 = _5228 + _5242;
    float _5246 = -_5230;
    float _5248 = _5232 + _5246;
    bool _5250 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _5252 = fma(_5236, _5240, _5222);
    float _5254 = fma(_5236, _5244, _5226);
    float _5256 = fma(_5236, _5248, _5230);
    float _5258 = _5252 * 0.586610972881317138671875;
    out.m_111.x = 0.0;
    float _5260 = fma(_5254, 0.298911988735198974609375, _5258);
    float _5262 = fma(_5256, 0.114477999508380889892578125, _5260);
    float _5264 = -_5262;
    float _5266 = _5254 + _5264;
    float _5268 = -_5262;
    float _5270 = _5252 + _5268;
    float _5272 = -_5262;
    float _5274 = _5256 + _5272;
    float _5276 = (*spvDescriptorSet0.vp_c10)._m0[3].x * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _5278 = fma(_5266, (*spvDescriptorSet0.vp_c13)._m0[1].z, _5262);
    float _5280 = fma(_5270, (*spvDescriptorSet0.vp_c13)._m0[1].z, _5262);
    float _5282 = fma(_5274, (*spvDescriptorSet0.vp_c13)._m0[1].z, _5262);
    out.m_51.x = _5276;
    out.m_113.x = _5278;
    out.m_113.y = _5280;
    out.m_113.z = _5282;
    if (!_5250)
    {
        return out;
    }
    float _5284 = -_4519;
    float _5286 = _5284 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
    float _5288 = -_4521;
    float _5290 = _5288 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
    float _5292 = -_4523;
    float _5294 = _5292 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
    float _5296 = _5286 * _5286;
    float _5298 = fma(_5290, _5290, _5296);
    float _5300 = fma(_5294, _5294, _5298);
    float _5302 = sqrt(_5300);
    float _5304 = rsqrt(_5300);
    float _5306 = -_5302;
    float _5308 = _5306 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _5310 = _5308 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
    float _5312 = precise::clamp(_5310, 0.0, 1.0);
    float _5314 = _5290 * _5304;
    float _5316 = _5286 * _5304;
    float _5318 = abs(_5312);
    float _5320 = log2(_5318);
    float _5322 = _5294 * _5304;
    float _5324 = _5314 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
    float _5326 = _4235 * _5316;
    float _5328 = -_5316;
    float _5330 = -_5324;
    float _5332 = fma(_5328, (*spvDescriptorSet0.vp_c15)._m0[656].y, _5330);
    float _5334 = fma(_4233, _5314, _5326);
    float _5336 = -_5322;
    float _5338 = fma(_5336, (*spvDescriptorSet0.vp_c15)._m0[656].z, _5332);
    float _5340 = fma(_4239, _5322, _5334);
    float _5342 = precise::clamp(_5340, 0.0, 1.0);
    float _5344 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
    float _5346 = _5338 + _5344;
    float _5348 = _5320 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
    float _5350 = _5346 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
    float _5352 = precise::clamp(_5350, 0.0, 1.0);
    float _5354 = exp2(_5348);
    float _5356 = _5354 * _5352;
    float _5358 = _5342 * _5356;
    float _5360 = _5358 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
    float _5362 = _5358 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
    float _5364 = _5358 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
    out.m_111.x = _5360;
    out.m_111.y = _5362;
    out.m_111.z = _5364;
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
    out.m_65 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_67 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_75 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_85 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_95 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_99 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_97 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_101 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_79 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_73 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_93 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_105 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_51 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_111 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_107 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_109 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_113 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_59 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_69 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_77 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_83 = float4(0.0, 0.0, 0.0, 1.0);
    bool _5136 = false;
    bool _4289 = false;
    bool _1650 = false;
    bool _1204 = false;
    bool _1100 = false;
    bool _932 = false;
    bool _752 = false;
    bool _464 = false;
    bool _242 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _127 = in.m_48.w;
    float _129 = trunc(_127);
    int _132 = int(_129);
    bool _136 = _132 >= 1;
    float _138 = 0.0;
    if (!_136)
    {
        _138 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _140 = _138;
    float _142 = _140;
    if (!_136)
    {
        out.m_51.x = 0.0;
    }
    int _144 = 0;
    if (!_136)
    {
        float _146 = _140 * 5.0;
        _144 = as_type<int>(_146);
    }
    int _148 = _144;
    int _150 = _148;
    if (!_136)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _5421 = as_type<float>(_148);
        out.gl_Position.z = _5421;
    }
    if (!_136)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_65.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_65.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_65.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_65.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_67.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_67.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_67.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_67.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_75.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_75.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_75.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_75.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_85.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_85.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_85.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_85.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_95.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_95.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_95.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_95.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_99.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_99.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_99.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_99.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_97.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_97.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_97.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_97.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_101.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_101.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_101.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_101.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_79.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_79.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_79.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_79.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_73.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_73.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_73.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_73.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_93.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_93.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_93.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_93.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_105.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_105.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_105.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_105.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_51.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_51.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_51.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_51.w)); dm_cw(dm_gs, dm_p, 68, as_type<uint>(out.m_111.x)); dm_cw(dm_gs, dm_p, 69, as_type<uint>(out.m_111.y)); dm_cw(dm_gs, dm_p, 70, as_type<uint>(out.m_111.z)); dm_cw(dm_gs, dm_p, 71, as_type<uint>(out.m_111.w)); dm_cw(dm_gs, dm_p, 72, as_type<uint>(out.m_107.x)); dm_cw(dm_gs, dm_p, 73, as_type<uint>(out.m_107.y)); dm_cw(dm_gs, dm_p, 74, as_type<uint>(out.m_107.z)); dm_cw(dm_gs, dm_p, 75, as_type<uint>(out.m_107.w)); dm_cw(dm_gs, dm_p, 76, as_type<uint>(out.m_109.x)); dm_cw(dm_gs, dm_p, 77, as_type<uint>(out.m_109.y)); dm_cw(dm_gs, dm_p, 78, as_type<uint>(out.m_109.z)); dm_cw(dm_gs, dm_p, 79, as_type<uint>(out.m_109.w)); dm_cw(dm_gs, dm_p, 80, as_type<uint>(out.m_113.x)); dm_cw(dm_gs, dm_p, 81, as_type<uint>(out.m_113.y)); dm_cw(dm_gs, dm_p, 82, as_type<uint>(out.m_113.z)); dm_cw(dm_gs, dm_p, 83, as_type<uint>(out.m_113.w)); dm_cw(dm_gs, dm_p, 84, as_type<uint>(out.m_59.x)); dm_cw(dm_gs, dm_p, 85, as_type<uint>(out.m_59.y)); dm_cw(dm_gs, dm_p, 86, as_type<uint>(out.m_59.z)); dm_cw(dm_gs, dm_p, 87, as_type<uint>(out.m_59.w)); dm_cw(dm_gs, dm_p, 88, as_type<uint>(out.m_69.x)); dm_cw(dm_gs, dm_p, 89, as_type<uint>(out.m_69.y)); dm_cw(dm_gs, dm_p, 90, as_type<uint>(out.m_69.z)); dm_cw(dm_gs, dm_p, 91, as_type<uint>(out.m_69.w)); dm_cw(dm_gs, dm_p, 92, as_type<uint>(out.m_77.x)); dm_cw(dm_gs, dm_p, 93, as_type<uint>(out.m_77.y)); dm_cw(dm_gs, dm_p, 94, as_type<uint>(out.m_77.z)); dm_cw(dm_gs, dm_p, 95, as_type<uint>(out.m_77.w)); dm_cw(dm_gs, dm_p, 96, as_type<uint>(out.m_83.x)); dm_cw(dm_gs, dm_p, 97, as_type<uint>(out.m_83.y)); dm_cw(dm_gs, dm_p, 98, as_type<uint>(out.m_83.z)); dm_cw(dm_gs, dm_p, 99, as_type<uint>(out.m_83.w)); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _152 = in.m_53.w;
    bool _154 = _152 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _156 = isnan(_152);
    bool _158 = _154 || _156;
    bool _160 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _162 = _158 || _160;
    float _164 = -_152;
    float _166 = _164 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    float _168 = _166;
    if (_162)
    {
        float _170 = float(_132);
        _142 = _170;
    }
    float _172 = _142;
    bool _174 = _166 >= _172;
    bool _176 = !_162;
    bool _178 = _174 || _176;
    float _180 = _172;
    if (_178)
    {
        _180 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _182 = _180;
    if (_178)
    {
        out.m_51.x = 0.0;
    }
    if (_178)
    {
        float _184 = _182 * 5.0;
        _150 = as_type<int>(_184);
    }
    int _186 = _150;
    if (_178)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _5491 = as_type<float>(_186);
        out.gl_Position.z = _5491;
    }
    if (_178)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_65.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_65.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_65.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_65.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_67.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_67.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_67.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_67.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_75.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_75.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_75.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_75.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_85.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_85.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_85.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_85.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_95.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_95.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_95.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_95.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_99.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_99.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_99.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_99.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_97.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_97.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_97.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_97.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_101.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_101.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_101.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_101.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_79.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_79.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_79.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_79.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_73.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_73.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_73.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_73.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_93.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_93.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_93.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_93.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_105.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_105.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_105.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_105.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_51.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_51.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_51.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_51.w)); dm_cw(dm_gs, dm_p, 68, as_type<uint>(out.m_111.x)); dm_cw(dm_gs, dm_p, 69, as_type<uint>(out.m_111.y)); dm_cw(dm_gs, dm_p, 70, as_type<uint>(out.m_111.z)); dm_cw(dm_gs, dm_p, 71, as_type<uint>(out.m_111.w)); dm_cw(dm_gs, dm_p, 72, as_type<uint>(out.m_107.x)); dm_cw(dm_gs, dm_p, 73, as_type<uint>(out.m_107.y)); dm_cw(dm_gs, dm_p, 74, as_type<uint>(out.m_107.z)); dm_cw(dm_gs, dm_p, 75, as_type<uint>(out.m_107.w)); dm_cw(dm_gs, dm_p, 76, as_type<uint>(out.m_109.x)); dm_cw(dm_gs, dm_p, 77, as_type<uint>(out.m_109.y)); dm_cw(dm_gs, dm_p, 78, as_type<uint>(out.m_109.z)); dm_cw(dm_gs, dm_p, 79, as_type<uint>(out.m_109.w)); dm_cw(dm_gs, dm_p, 80, as_type<uint>(out.m_113.x)); dm_cw(dm_gs, dm_p, 81, as_type<uint>(out.m_113.y)); dm_cw(dm_gs, dm_p, 82, as_type<uint>(out.m_113.z)); dm_cw(dm_gs, dm_p, 83, as_type<uint>(out.m_113.w)); dm_cw(dm_gs, dm_p, 84, as_type<uint>(out.m_59.x)); dm_cw(dm_gs, dm_p, 85, as_type<uint>(out.m_59.y)); dm_cw(dm_gs, dm_p, 86, as_type<uint>(out.m_59.z)); dm_cw(dm_gs, dm_p, 87, as_type<uint>(out.m_59.w)); dm_cw(dm_gs, dm_p, 88, as_type<uint>(out.m_69.x)); dm_cw(dm_gs, dm_p, 89, as_type<uint>(out.m_69.y)); dm_cw(dm_gs, dm_p, 90, as_type<uint>(out.m_69.z)); dm_cw(dm_gs, dm_p, 91, as_type<uint>(out.m_69.w)); dm_cw(dm_gs, dm_p, 92, as_type<uint>(out.m_77.x)); dm_cw(dm_gs, dm_p, 93, as_type<uint>(out.m_77.y)); dm_cw(dm_gs, dm_p, 94, as_type<uint>(out.m_77.z)); dm_cw(dm_gs, dm_p, 95, as_type<uint>(out.m_77.w)); dm_cw(dm_gs, dm_p, 96, as_type<uint>(out.m_83.x)); dm_cw(dm_gs, dm_p, 97, as_type<uint>(out.m_83.y)); dm_cw(dm_gs, dm_p, 98, as_type<uint>(out.m_83.z)); dm_cw(dm_gs, dm_p, 99, as_type<uint>(out.m_83.w)); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _188 = in.m_55.x;
    bool _190 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _192 = in.m_55.y;
    float _194 = in.m_57.x;
    float _196 = in.m_57.y;
    float _198 = in.m_57.z;
    out.m_59.x = _188;
    out.m_59.y = _192;
    float _200 = _196 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _202 = _196 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _204 = _196 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _206 = fma(_194, (*spvDescriptorSet0.vp_c10)._m0[4].x, _200);
    float _208 = fma(_194, (*spvDescriptorSet0.vp_c10)._m0[5].x, _202);
    float _210 = fma(_194, (*spvDescriptorSet0.vp_c10)._m0[6].x, _204);
    float _212 = fma(_198, (*spvDescriptorSet0.vp_c10)._m0[4].z, _206);
    float _214 = fma(_198, (*spvDescriptorSet0.vp_c10)._m0[5].z, _208);
    float _216 = fma(_198, (*spvDescriptorSet0.vp_c10)._m0[6].z, _210);
    bool _218 = !_190;
    float _220 = _188;
    float _222 = _216;
    float _240;
    if (!_218)
    {
        float _224 = in.m_61.x;
        float _226 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _228 = _224 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _230 = fma(_228, (*spvDescriptorSet0.vp_c9)._m0[12].x, _166);
        float _232 = _230 * _226;
        float _234 = floor(_232);
        float _236 = -_234;
        float _238 = _232 + _236;
        _240 = _238;
        _242 = true;
    }
    else
    {
        float _244 = float(_132);
        float _246 = 1.0 / _244;
        float _248 = _166 * _246;
        _240 = _248;
    }
    _242 = false;
    float _250 = _240;
    float _252 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _254 = _250 + _252;
    float _256 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _258 = _250 + _256;
    bool _260 = _250 >= (*spvDescriptorSet0.vp_c9)._m0[146].w;
    bool _262 = isnan(_250);
    bool _264 = _260 || _262;
    bool _266 = isnan((*spvDescriptorSet0.vp_c9)._m0[146].w);
    bool _268 = _264 || _266;
    float _270 = float(_268);
    float _272 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _274 = (*spvDescriptorSet0.vp_c9)._m0[146].w + _272;
    float _276 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _278 = _250 + _276;
    float _280 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _282 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _280;
    float _284 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _286 = _284 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _288 = 1.0 / _274;
    bool _290 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].x;
    float _292 = 1.0 / _286;
    float _294 = 1.0 / _282;
    float _296 = _254 * _288;
    bool _298 = _250 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _300 = isnan(_250);
    bool _302 = _298 || _300;
    bool _304 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _306 = _302 || _304;
    float _308 = float(_306);
    float _310 = -_270;
    float _312 = _310 + 1.0;
    float _314 = _308 * _312;
    float _316 = _258 * _292;
    bool _318 = _250 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _320 = isnan(_250);
    bool _322 = _318 || _320;
    bool _324 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _326 = _322 || _324;
    float _328 = float(_326);
    float _330 = -(*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _332 = (*spvDescriptorSet0.vp_c9)._m0[144].z + _330;
    bool _334 = _250 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _336 = isnan(_250);
    bool _338 = _334 || _336;
    bool _340 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _342 = _338 || _340;
    float _344 = float(_342);
    float _346 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _348 = _346 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _350 = -_308;
    float _352 = _350 + 1.0;
    float _354 = -_328;
    float _356 = _354 + 1.0;
    float _358 = _278 * _294;
    float _360 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _362 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _360;
    float _364 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _366 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _364;
    float _368 = _344 * _356;
    float _370 = fma(_332, _358, (*spvDescriptorSet0.vp_c9)._m0[143].z);
    float _372 = fma(_362, _358, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _374 = fma(_366, _358, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _376 = _328 * _352;
    float _378 = -_344;
    float _380 = _378 + 1.0;
    float _382 = _372 * _368;
    float _384 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _386 = _384 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _388 = -(*spvDescriptorSet0.vp_c9)._m0[144].z;
    float _390 = _388 + (*spvDescriptorSet0.vp_c9)._m0[145].z;
    float _392 = _374 * _368;
    float _394 = _370 * _368;
    float _396 = fma(_380, (*spvDescriptorSet0.vp_c9)._m0[143].x, _382);
    float _398 = fma(_380, (*spvDescriptorSet0.vp_c9)._m0[143].y, _392);
    float _400 = fma(_380, (*spvDescriptorSet0.vp_c9)._m0[143].z, _394);
    float _402 = fma(_348, _316, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _404 = fma(_386, _316, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _406 = fma(_390, _316, (*spvDescriptorSet0.vp_c9)._m0[144].z);
    float _408 = -(*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _410 = (*spvDescriptorSet0.vp_c9)._m0[146].x + _408;
    float _412 = -(*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _414 = (*spvDescriptorSet0.vp_c9)._m0[146].y + _412;
    float _416 = -(*spvDescriptorSet0.vp_c9)._m0[145].z;
    float _418 = (*spvDescriptorSet0.vp_c9)._m0[146].z + _416;
    float _420 = fma(_402, _376, _396);
    float _422 = fma(_410, _296, (*spvDescriptorSet0.vp_c9)._m0[145].x);
    float _424 = fma(_414, _296, (*spvDescriptorSet0.vp_c9)._m0[145].y);
    float _426 = fma(_418, _296, (*spvDescriptorSet0.vp_c9)._m0[145].z);
    float _428 = fma(_404, _376, _398);
    float _430 = fma(_406, _376, _400);
    float _432 = fma(_422, _314, _420);
    float _434 = fma(_424, _314, _428);
    float _436 = fma(_426, _314, _430);
    float _438 = fma(_270, (*spvDescriptorSet0.vp_c9)._m0[146].x, _432);
    float _440 = fma(_270, (*spvDescriptorSet0.vp_c9)._m0[146].y, _434);
    float _442 = fma(_270, (*spvDescriptorSet0.vp_c9)._m0[146].z, _436);
    bool _444 = !_290;
    float _462;
    if (!_444)
    {
        float _446 = in.m_61.x;
        float _448 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].x;
        float _450 = _446 * (*spvDescriptorSet0.vp_c9)._m0[12].y;
        float _452 = fma(_450, (*spvDescriptorSet0.vp_c9)._m0[11].x, _166);
        float _454 = _452 * _448;
        float _456 = floor(_454);
        float _458 = -_456;
        float _460 = _454 + _458;
        _462 = _460;
        _464 = true;
    }
    else
    {
        float _466 = float(_132);
        float _468 = 1.0 / _466;
        float _470 = _166 * _468;
        _462 = _470;
    }
    _464 = false;
    float _472 = _462;
    float _474 = in.m_63.x;
    float _476 = in.m_63.y;
    float _478 = in.m_63.z;
    float _480 = -(*spvDescriptorSet0.vp_c9)._m0[109].w;
    float _482 = (*spvDescriptorSet0.vp_c9)._m0[110].w + _480;
    float _484 = -(*spvDescriptorSet0.vp_c9)._m0[110].w;
    float _486 = _484 + (*spvDescriptorSet0.vp_c9)._m0[111].w;
    float _488 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _490 = (*spvDescriptorSet0.vp_c9)._m0[108].w + _488;
    float _492 = -(*spvDescriptorSet0.vp_c9)._m0[108].w;
    float _494 = _492 + (*spvDescriptorSet0.vp_c9)._m0[109].w;
    float _496 = 1.0 / _482;
    bool _498 = _472 >= (*spvDescriptorSet0.vp_c9)._m0[111].w;
    bool _500 = isnan(_472);
    bool _502 = _498 || _500;
    bool _504 = isnan((*spvDescriptorSet0.vp_c9)._m0[111].w);
    bool _506 = _502 || _504;
    float _508 = float(_506);
    float _510 = 1.0 / _490;
    bool _512 = _472 >= (*spvDescriptorSet0.vp_c9)._m0[109].w;
    bool _514 = isnan(_472);
    bool _516 = _512 || _514;
    bool _518 = isnan((*spvDescriptorSet0.vp_c9)._m0[109].w);
    bool _520 = _516 || _518;
    float _522 = float(_520);
    bool _524 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _526 = _442 * _478;
    float _528 = _440 * _476;
    float _530 = 1.0 / _494;
    float _532 = -(*spvDescriptorSet0.vp_c9)._m0[109].w;
    float _534 = _472 + _532;
    float _536 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _538 = _472 + _536;
    float _540 = -(*spvDescriptorSet0.vp_c9)._m0[108].w;
    float _542 = _472 + _540;
    float _544 = -(*spvDescriptorSet0.vp_c9)._m0[110].w;
    float _546 = _472 + _544;
    float _548 = _534 * _496;
    float _550 = 1.0 / _486;
    bool _552 = _472 >= (*spvDescriptorSet0.vp_c9)._m0[110].w;
    bool _554 = isnan(_472);
    bool _556 = _552 || _554;
    bool _558 = isnan((*spvDescriptorSet0.vp_c9)._m0[110].w);
    bool _560 = _556 || _558;
    float _562 = float(_560);
    float _564 = _538 * _510;
    float _566 = -(*spvDescriptorSet0.vp_c9)._m0[107].x;
    float _568 = (*spvDescriptorSet0.vp_c9)._m0[108].x + _566;
    float _570 = -_562;
    float _572 = _570 + 1.0;
    float _574 = fma(_568, _564, (*spvDescriptorSet0.vp_c9)._m0[107].x);
    float _576 = _542 * _530;
    float _578 = -(*spvDescriptorSet0.vp_c9)._m0[107].y;
    float _580 = (*spvDescriptorSet0.vp_c9)._m0[108].y + _578;
    float _582 = -(*spvDescriptorSet0.vp_c9)._m0[107].z;
    float _584 = (*spvDescriptorSet0.vp_c9)._m0[108].z + _582;
    float _586 = fma(_580, _564, (*spvDescriptorSet0.vp_c9)._m0[107].y);
    float _588 = fma(_584, _564, (*spvDescriptorSet0.vp_c9)._m0[107].z);
    float _590 = _522 * _572;
    float _592 = _546 * _550;
    float _594 = -_508;
    float _596 = _594 + 1.0;
    bool _598 = _472 >= (*spvDescriptorSet0.vp_c9)._m0[108].w;
    bool _600 = isnan(_472);
    bool _602 = _598 || _600;
    bool _604 = isnan((*spvDescriptorSet0.vp_c9)._m0[108].w);
    bool _606 = _602 || _604;
    float _608 = float(_606);
    float _610 = -_522;
    float _612 = _610 + 1.0;
    float _614 = -(*spvDescriptorSet0.vp_c9)._m0[108].y;
    float _616 = _614 + (*spvDescriptorSet0.vp_c9)._m0[109].y;
    float _618 = _562 * _596;
    bool _620 = _472 >= (*spvDescriptorSet0.vp_c9)._m0[107].w;
    bool _622 = isnan(_472);
    bool _624 = _620 || _622;
    bool _626 = isnan((*spvDescriptorSet0.vp_c9)._m0[107].w);
    bool _628 = _624 || _626;
    float _630 = float(_628);
    float _632 = -(*spvDescriptorSet0.vp_c9)._m0[108].x;
    float _634 = _632 + (*spvDescriptorSet0.vp_c9)._m0[109].x;
    float _636 = _608 * _612;
    float _638 = -_608;
    float _640 = _638 + 1.0;
    float _642 = -(*spvDescriptorSet0.vp_c9)._m0[108].z;
    float _644 = _642 + (*spvDescriptorSet0.vp_c9)._m0[109].z;
    float _646 = fma(_634, _576, (*spvDescriptorSet0.vp_c9)._m0[108].x);
    float _648 = fma(_616, _576, (*spvDescriptorSet0.vp_c9)._m0[108].y);
    float _650 = _630 * _640;
    float _652 = fma(_644, _576, (*spvDescriptorSet0.vp_c9)._m0[108].z);
    float _654 = -_630;
    float _656 = _654 + 1.0;
    float _658 = _574 * _650;
    float _660 = _586 * _650;
    float _662 = _588 * _650;
    float _664 = -(*spvDescriptorSet0.vp_c9)._m0[109].x;
    float _666 = (*spvDescriptorSet0.vp_c9)._m0[110].x + _664;
    float _668 = fma(_656, (*spvDescriptorSet0.vp_c9)._m0[107].x, _658);
    float _670 = fma(_656, (*spvDescriptorSet0.vp_c9)._m0[107].y, _660);
    float _672 = -(*spvDescriptorSet0.vp_c9)._m0[109].y;
    float _674 = (*spvDescriptorSet0.vp_c9)._m0[110].y + _672;
    float _676 = fma(_656, (*spvDescriptorSet0.vp_c9)._m0[107].z, _662);
    float _678 = -(*spvDescriptorSet0.vp_c9)._m0[109].z;
    float _680 = (*spvDescriptorSet0.vp_c9)._m0[110].z + _678;
    float _682 = fma(_646, _636, _668);
    float _684 = fma(_648, _636, _670);
    float _686 = fma(_666, _548, (*spvDescriptorSet0.vp_c9)._m0[109].x);
    float _688 = fma(_674, _548, (*spvDescriptorSet0.vp_c9)._m0[109].y);
    float _690 = fma(_652, _636, _676);
    float _692 = -(*spvDescriptorSet0.vp_c9)._m0[110].x;
    float _694 = _692 + (*spvDescriptorSet0.vp_c9)._m0[111].x;
    float _696 = -(*spvDescriptorSet0.vp_c9)._m0[110].y;
    float _698 = _696 + (*spvDescriptorSet0.vp_c9)._m0[111].y;
    float _700 = fma(_680, _548, (*spvDescriptorSet0.vp_c9)._m0[109].z);
    float _702 = -(*spvDescriptorSet0.vp_c9)._m0[110].z;
    float _704 = _702 + (*spvDescriptorSet0.vp_c9)._m0[111].z;
    float _706 = fma(_686, _590, _682);
    float _708 = fma(_694, _592, (*spvDescriptorSet0.vp_c9)._m0[110].x);
    float _710 = fma(_698, _592, (*spvDescriptorSet0.vp_c9)._m0[110].y);
    float _712 = fma(_688, _590, _684);
    float _714 = fma(_704, _592, (*spvDescriptorSet0.vp_c9)._m0[110].z);
    float _716 = fma(_700, _590, _690);
    float _718 = fma(_708, _618, _706);
    float _720 = fma(_710, _618, _712);
    float _722 = _438 * _474;
    float _724 = fma(_714, _618, _716);
    float _726 = fma(_508, (*spvDescriptorSet0.vp_c9)._m0[111].x, _718);
    float _728 = fma(_508, (*spvDescriptorSet0.vp_c9)._m0[111].y, _720);
    float _730 = fma(_508, (*spvDescriptorSet0.vp_c9)._m0[111].z, _724);
    bool _732 = !_524;
    float _750;
    if (!_732)
    {
        float _734 = in.m_61.x;
        float _736 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _738 = _734 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _740 = fma(_738, (*spvDescriptorSet0.vp_c9)._m0[11].y, _166);
        float _742 = _740 * _736;
        float _744 = floor(_742);
        float _746 = -_744;
        float _748 = _742 + _746;
        _750 = _748;
        _752 = true;
    }
    else
    {
        float _754 = float(_132);
        float _756 = 1.0 / _754;
        float _758 = _166 * _756;
        _750 = _758;
    }
    _752 = false;
    float _760 = _750;
    float _762 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _764 = _760 + _762;
    float _766 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _768 = _766 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _770 = _760 >= (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _772 = isnan(_760);
    bool _774 = _770 || _772;
    bool _776 = isnan((*spvDescriptorSet0.vp_c9)._m0[117].w);
    bool _778 = _774 || _776;
    float _780 = float(_778);
    float _782 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _784 = _782 + (*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _786 = -(*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _788 = _786 + (*spvDescriptorSet0.vp_c9)._m0[118].w;
    bool _790 = _760 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _792 = isnan(_760);
    bool _794 = _790 || _792;
    bool _796 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _798 = _794 || _796;
    float _800 = float(_798);
    float _802 = 1.0 / _768;
    float _804 = -_780;
    float _806 = _804 + 1.0;
    float _808 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _810 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _808;
    bool _812 = _760 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _814 = isnan(_760);
    bool _816 = _812 || _814;
    bool _818 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _820 = _816 || _818;
    float _822 = float(_820);
    float _824 = _800 * _806;
    float _826 = -_800;
    float _828 = _826 + 1.0;
    bool _830 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].z;
    float _832 = 1.0 / _784;
    float _834 = _822 * _828;
    float _836 = -_822;
    float _838 = _836 + 1.0;
    float _840 = 1.0 / _788;
    float _842 = _810 * _802;
    float _844 = -(*spvDescriptorSet0.vp_c9)._m0[116].x;
    float _846 = _844 + (*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _848 = fma(_842, _764, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _850 = _846 * _832;
    bool _852 = _760 >= (*spvDescriptorSet0.vp_c9)._m0[118].w;
    bool _854 = isnan(_760);
    bool _856 = _852 || _854;
    bool _858 = isnan((*spvDescriptorSet0.vp_c9)._m0[118].w);
    bool _860 = _856 || _858;
    float _862 = float(_860);
    float _864 = -(*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _866 = (*spvDescriptorSet0.vp_c9)._m0[118].x + _864;
    float _868 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _870 = _760 + _868;
    float _872 = _848 * _834;
    float _874 = -(*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _876 = _760 + _874;
    float _878 = -_862;
    float _880 = _878 + 1.0;
    float _882 = fma(_850, _870, (*spvDescriptorSet0.vp_c9)._m0[116].x);
    float _884 = _866 * _840;
    float _886 = fma(_838, (*spvDescriptorSet0.vp_c9)._m0[115].x, _872);
    float _888 = _780 * _880;
    float _890 = _726 * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _892 = fma(_884, _876, (*spvDescriptorSet0.vp_c9)._m0[117].x);
    float _894 = fma(_882, _824, _886);
    float _896 = _730 * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _898 = _890 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _900 = fma(_892, _888, _894);
    float _902 = _728 * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _904 = _896 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _906 = fma(_862, (*spvDescriptorSet0.vp_c9)._m0[118].x, _900);
    float _908 = _902 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _910 = _906 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    out.m_65.x = _898;
    out.m_65.y = _908;
    out.m_65.z = _904;
    out.m_65.w = _910;
    bool _912 = !_830;
    float _930;
    if (!_912)
    {
        float _914 = in.m_61.x;
        float _916 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].z;
        float _918 = _914 * (*spvDescriptorSet0.vp_c9)._m0[12].w;
        float _920 = fma(_918, (*spvDescriptorSet0.vp_c9)._m0[11].z, _166);
        float _922 = _920 * _916;
        float _924 = floor(_922);
        float _926 = -_924;
        float _928 = _922 + _926;
        _930 = _928;
        _932 = true;
    }
    else
    {
        float _934 = float(_132);
        float _936 = 1.0 / _934;
        float _938 = _166 * _936;
        _930 = _938;
    }
    _932 = false;
    float _940 = _930;
    float _942 = -(*spvDescriptorSet0.vp_c9)._m0[123].w;
    float _944 = _940 + _942;
    bool _946 = _940 >= (*spvDescriptorSet0.vp_c9)._m0[125].w;
    bool _948 = isnan(_940);
    bool _950 = _946 || _948;
    bool _952 = isnan((*spvDescriptorSet0.vp_c9)._m0[125].w);
    bool _954 = _950 || _952;
    float _956 = float(_954);
    float _958 = -(*spvDescriptorSet0.vp_c9)._m0[124].w;
    float _960 = _940 + _958;
    bool _962 = _940 >= (*spvDescriptorSet0.vp_c9)._m0[123].w;
    bool _964 = isnan(_940);
    bool _966 = _962 || _964;
    bool _968 = isnan((*spvDescriptorSet0.vp_c9)._m0[123].w);
    bool _970 = _966 || _968;
    float _972 = float(_970);
    float _974 = -(*spvDescriptorSet0.vp_c9)._m0[123].w;
    float _976 = (*spvDescriptorSet0.vp_c9)._m0[124].w + _974;
    float _978 = -(*spvDescriptorSet0.vp_c9)._m0[124].w;
    float _980 = _978 + (*spvDescriptorSet0.vp_c9)._m0[125].w;
    bool _982 = _940 >= (*spvDescriptorSet0.vp_c9)._m0[124].w;
    bool _984 = isnan(_940);
    bool _986 = _982 || _984;
    bool _988 = isnan((*spvDescriptorSet0.vp_c9)._m0[124].w);
    bool _990 = _986 || _988;
    float _992 = float(_990);
    float _994 = -_956;
    float _996 = _994 + 1.0;
    float _998 = 1.0 / _976;
    float _1000 = _992 * _996;
    float _1002 = -_992;
    float _1004 = _1002 + 1.0;
    float _1006 = -(*spvDescriptorSet0.vp_c9)._m0[123].x;
    float _1008 = (*spvDescriptorSet0.vp_c9)._m0[124].x + _1006;
    bool _1010 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].w;
    float _1012 = 1.0 / _980;
    float _1014 = _972 * _1004;
    float _1016 = -_972;
    float _1018 = _1016 + 1.0;
    float _1020 = _944 * _998;
    float _1022 = -(*spvDescriptorSet0.vp_c9)._m0[123].y;
    float _1024 = (*spvDescriptorSet0.vp_c9)._m0[124].y + _1022;
    float _1026 = -(*spvDescriptorSet0.vp_c9)._m0[123].z;
    float _1028 = (*spvDescriptorSet0.vp_c9)._m0[124].z + _1026;
    float _1030 = fma(_1008, _1020, (*spvDescriptorSet0.vp_c9)._m0[123].x);
    float _1032 = fma(_1024, _1020, (*spvDescriptorSet0.vp_c9)._m0[123].y);
    float _1034 = fma(_1028, _1020, (*spvDescriptorSet0.vp_c9)._m0[123].z);
    float _1036 = _960 * _1012;
    float _1038 = _1030 * _1014;
    float _1040 = _1032 * _1014;
    float _1042 = _1034 * _1014;
    float _1044 = -(*spvDescriptorSet0.vp_c9)._m0[124].x;
    float _1046 = _1044 + (*spvDescriptorSet0.vp_c9)._m0[125].x;
    float _1048 = -(*spvDescriptorSet0.vp_c9)._m0[124].y;
    float _1050 = _1048 + (*spvDescriptorSet0.vp_c9)._m0[125].y;
    float _1052 = -(*spvDescriptorSet0.vp_c9)._m0[124].z;
    float _1054 = _1052 + (*spvDescriptorSet0.vp_c9)._m0[125].z;
    float _1056 = fma(_1018, (*spvDescriptorSet0.vp_c9)._m0[123].x, _1038);
    float _1058 = fma(_1046, _1036, (*spvDescriptorSet0.vp_c9)._m0[124].x);
    float _1060 = fma(_1050, _1036, (*spvDescriptorSet0.vp_c9)._m0[124].y);
    float _1062 = fma(_1054, _1036, (*spvDescriptorSet0.vp_c9)._m0[124].z);
    float _1064 = fma(_1018, (*spvDescriptorSet0.vp_c9)._m0[123].y, _1040);
    float _1066 = fma(_1018, (*spvDescriptorSet0.vp_c9)._m0[123].z, _1042);
    float _1068 = fma(_1058, _1000, _1056);
    float _1070 = fma(_1060, _1000, _1064);
    float _1072 = fma(_1062, _1000, _1066);
    float _1074 = fma(_956, (*spvDescriptorSet0.vp_c9)._m0[125].x, _1068);
    float _1076 = fma(_956, (*spvDescriptorSet0.vp_c9)._m0[125].y, _1070);
    float _1078 = fma(_956, (*spvDescriptorSet0.vp_c9)._m0[125].z, _1072);
    bool _1080 = !_1010;
    float _1098;
    if (!_1080)
    {
        float _1082 = in.m_61.x;
        float _1084 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].w;
        float _1086 = _1082 * (*spvDescriptorSet0.vp_c9)._m0[13].x;
        float _1088 = fma(_1086, (*spvDescriptorSet0.vp_c9)._m0[11].w, _166);
        float _1090 = _1088 * _1084;
        float _1092 = floor(_1090);
        float _1094 = -_1092;
        float _1096 = _1090 + _1094;
        _1098 = _1096;
        _1100 = true;
    }
    else
    {
        float _1102 = float(_132);
        float _1104 = 1.0 / _1102;
        float _1106 = _166 * _1104;
        _1098 = _1106;
    }
    _1100 = false;
    float _1108 = _1098;
    bool _1110 = _1108 >= (*spvDescriptorSet0.vp_c9)._m0[132].w;
    bool _1112 = isnan(_1108);
    bool _1114 = _1110 || _1112;
    bool _1116 = isnan((*spvDescriptorSet0.vp_c9)._m0[132].w);
    bool _1118 = _1114 || _1116;
    float _1120 = float(_1118);
    float _1122 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _1124 = _1122 + (*spvDescriptorSet0.vp_c9)._m0[132].w;
    bool _1126 = _1108 >= (*spvDescriptorSet0.vp_c9)._m0[131].w;
    bool _1128 = isnan(_1108);
    bool _1130 = _1126 || _1128;
    bool _1132 = isnan((*spvDescriptorSet0.vp_c9)._m0[131].w);
    bool _1134 = _1130 || _1132;
    float _1136 = float(_1134);
    float _1138 = -(*spvDescriptorSet0.vp_c9)._m0[131].x;
    float _1140 = (*spvDescriptorSet0.vp_c9)._m0[132].x + _1138;
    float _1142 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _1144 = _1108 + _1142;
    float _1146 = -_1120;
    float _1148 = _1146 + 1.0;
    bool _1150 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[14].x;
    float _1152 = 1.0 / _1124;
    float _1154 = _1136 * _1148;
    float _1156 = -_1136;
    float _1158 = _1156 + 1.0;
    float _1160 = _1140 * _1152;
    float _1162 = _1078 * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _1164 = fma(_1160, _1144, (*spvDescriptorSet0.vp_c9)._m0[131].x);
    float _1166 = _1076 * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _1168 = _1162 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1170 = _1164 * _1154;
    float _1172 = _1074 * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _1174 = _1166 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1176 = fma(_1158, (*spvDescriptorSet0.vp_c9)._m0[131].x, _1170);
    float _1178 = _1172 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1180 = fma(_1120, (*spvDescriptorSet0.vp_c9)._m0[132].x, _1176);
    float _1182 = _1180 * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    out.m_67.x = _1178;
    out.m_67.y = _1174;
    out.m_67.z = _1168;
    out.m_67.w = _1182;
    bool _1184 = !_1150;
    float _1202;
    if (!_1184)
    {
        float _1186 = in.m_61.x;
        float _1188 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[14].x;
        float _1190 = _1186 * (*spvDescriptorSet0.vp_c9)._m0[15].x;
        float _1192 = fma(_1190, (*spvDescriptorSet0.vp_c9)._m0[14].x, _166);
        float _1194 = _1192 * _1188;
        float _1196 = floor(_1194);
        float _1198 = -_1196;
        float _1200 = _1194 + _1198;
        _1202 = _1200;
        _1204 = true;
    }
    else
    {
        float _1206 = float(_132);
        float _1208 = 1.0 / _1206;
        float _1210 = _166 * _1208;
        _1202 = _1210;
    }
    _1204 = false;
    float _1212 = _1202;
    float _1214 = -(*spvDescriptorSet0.vp_c9)._m0[159].w;
    float _1216 = (*spvDescriptorSet0.vp_c9)._m0[160].w + _1214;
    float _1218 = -(*spvDescriptorSet0.vp_c9)._m0[160].w;
    float _1220 = _1218 + (*spvDescriptorSet0.vp_c9)._m0[161].w;
    float _1222 = -(*spvDescriptorSet0.vp_c9)._m0[161].w;
    float _1224 = (*spvDescriptorSet0.vp_c9)._m0[162].w + _1222;
    float _1226 = 1.0 / _1216;
    float _1228 = -(*spvDescriptorSet0.vp_c9)._m0[165].w;
    float _1230 = (*spvDescriptorSet0.vp_c9)._m0[166].w + _1228;
    float _1232 = -(*spvDescriptorSet0.vp_c9)._m0[162].w;
    float _1234 = _1232 + (*spvDescriptorSet0.vp_c9)._m0[163].w;
    float _1236 = -(*spvDescriptorSet0.vp_c9)._m0[163].w;
    float _1238 = (*spvDescriptorSet0.vp_c9)._m0[164].w + _1236;
    float _1240 = -(*spvDescriptorSet0.vp_c9)._m0[164].w;
    float _1242 = _1240 + (*spvDescriptorSet0.vp_c9)._m0[165].w;
    float _1244 = 1.0 / _1224;
    float _1246 = -(*spvDescriptorSet0.vp_c9)._m0[159].w;
    float _1248 = _1212 + _1246;
    bool _1250 = _1212 >= (*spvDescriptorSet0.vp_c9)._m0[161].w;
    bool _1252 = isnan(_1212);
    bool _1254 = _1250 || _1252;
    bool _1256 = isnan((*spvDescriptorSet0.vp_c9)._m0[161].w);
    bool _1258 = _1254 || _1256;
    float _1260 = float(_1258);
    bool _1262 = _1212 >= (*spvDescriptorSet0.vp_c9)._m0[159].w;
    bool _1264 = isnan(_1212);
    bool _1266 = _1262 || _1264;
    bool _1268 = isnan((*spvDescriptorSet0.vp_c9)._m0[159].w);
    bool _1270 = _1266 || _1268;
    float _1272 = float(_1270);
    float _1274 = 1.0 / _1220;
    float _1276 = _1248 * _1226;
    float _1278 = -(*spvDescriptorSet0.vp_c9)._m0[160].w;
    float _1280 = _1212 + _1278;
    float _1282 = -(*spvDescriptorSet0.vp_c9)._m0[162].w;
    float _1284 = _1212 + _1282;
    float _1286 = -(*spvDescriptorSet0.vp_c9)._m0[163].w;
    float _1288 = _1212 + _1286;
    float _1290 = 1.0 / _1230;
    float _1292 = -(*spvDescriptorSet0.vp_c9)._m0[161].w;
    float _1294 = _1212 + _1292;
    bool _1296 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[14].y;
    float _1298 = _1294 * _1244;
    float _1300 = -(*spvDescriptorSet0.vp_c9)._m0[165].w;
    float _1302 = _1212 + _1300;
    float _1304 = 1.0 / _1234;
    float _1306 = _1280 * _1274;
    bool _1308 = _1212 >= (*spvDescriptorSet0.vp_c9)._m0[166].w;
    bool _1310 = isnan(_1212);
    bool _1312 = _1308 || _1310;
    bool _1314 = isnan((*spvDescriptorSet0.vp_c9)._m0[166].w);
    bool _1316 = _1312 || _1314;
    float _1318 = float(_1316);
    float _1320 = 1.0 / _1238;
    float _1322 = -(*spvDescriptorSet0.vp_c9)._m0[164].w;
    float _1324 = _1212 + _1322;
    float _1326 = _1302 * _1290;
    bool _1328 = _1212 >= (*spvDescriptorSet0.vp_c9)._m0[165].w;
    bool _1330 = isnan(_1212);
    bool _1332 = _1328 || _1330;
    bool _1334 = isnan((*spvDescriptorSet0.vp_c9)._m0[165].w);
    bool _1336 = _1332 || _1334;
    float _1338 = float(_1336);
    float _1340 = 1.0 / _1242;
    float _1342 = -(*spvDescriptorSet0.vp_c9)._m0[159].y;
    float _1344 = (*spvDescriptorSet0.vp_c9)._m0[160].y + _1342;
    float _1346 = _1284 * _1304;
    float _1348 = -(*spvDescriptorSet0.vp_c9)._m0[159].x;
    float _1350 = (*spvDescriptorSet0.vp_c9)._m0[160].x + _1348;
    float _1352 = -_1318;
    float _1354 = _1352 + 1.0;
    float _1356 = fma(_1350, _1276, (*spvDescriptorSet0.vp_c9)._m0[159].x);
    float _1358 = _1288 * _1320;
    float _1360 = -(*spvDescriptorSet0.vp_c9)._m0[159].z;
    float _1362 = (*spvDescriptorSet0.vp_c9)._m0[160].z + _1360;
    float _1364 = fma(_1344, _1276, (*spvDescriptorSet0.vp_c9)._m0[159].y);
    float _1366 = -(*spvDescriptorSet0.vp_c9)._m0[160].x;
    float _1368 = _1366 + (*spvDescriptorSet0.vp_c9)._m0[161].x;
    float _1370 = _1338 * _1354;
    float _1372 = fma(_1362, _1276, (*spvDescriptorSet0.vp_c9)._m0[159].z);
    float _1374 = -(*spvDescriptorSet0.vp_c9)._m0[160].y;
    float _1376 = _1374 + (*spvDescriptorSet0.vp_c9)._m0[161].y;
    float _1378 = -(*spvDescriptorSet0.vp_c9)._m0[160].z;
    float _1380 = _1378 + (*spvDescriptorSet0.vp_c9)._m0[161].z;
    float _1382 = _1324 * _1340;
    bool _1384 = _1212 >= (*spvDescriptorSet0.vp_c9)._m0[164].w;
    bool _1386 = isnan(_1212);
    bool _1388 = _1384 || _1386;
    bool _1390 = isnan((*spvDescriptorSet0.vp_c9)._m0[164].w);
    bool _1392 = _1388 || _1390;
    float _1394 = float(_1392);
    float _1396 = -_1338;
    float _1398 = _1396 + 1.0;
    float _1400 = fma(_1368, _1306, (*spvDescriptorSet0.vp_c9)._m0[160].x);
    float _1402 = fma(_1376, _1306, (*spvDescriptorSet0.vp_c9)._m0[160].y);
    float _1404 = fma(_1380, _1306, (*spvDescriptorSet0.vp_c9)._m0[160].z);
    float _1406 = _1394 * _1398;
    float _1408 = -_1394;
    float _1410 = _1408 + 1.0;
    bool _1412 = _1212 >= (*spvDescriptorSet0.vp_c9)._m0[162].w;
    bool _1414 = isnan(_1212);
    bool _1416 = _1412 || _1414;
    bool _1418 = isnan((*spvDescriptorSet0.vp_c9)._m0[162].w);
    bool _1420 = _1416 || _1418;
    float _1422 = float(_1420);
    float _1424 = -(*spvDescriptorSet0.vp_c9)._m0[161].z;
    float _1426 = (*spvDescriptorSet0.vp_c9)._m0[162].z + _1424;
    bool _1428 = _1212 >= (*spvDescriptorSet0.vp_c9)._m0[163].w;
    bool _1430 = isnan(_1212);
    bool _1432 = _1428 || _1430;
    bool _1434 = isnan((*spvDescriptorSet0.vp_c9)._m0[163].w);
    bool _1436 = _1432 || _1434;
    float _1438 = float(_1436);
    bool _1440 = _1212 >= (*spvDescriptorSet0.vp_c9)._m0[160].w;
    bool _1442 = isnan(_1212);
    bool _1444 = _1440 || _1442;
    bool _1446 = isnan((*spvDescriptorSet0.vp_c9)._m0[160].w);
    bool _1448 = _1444 || _1446;
    float _1450 = float(_1448);
    float _1452 = -_1422;
    float _1454 = _1452 + 1.0;
    float _1456 = -(*spvDescriptorSet0.vp_c9)._m0[162].x;
    float _1458 = _1456 + (*spvDescriptorSet0.vp_c9)._m0[163].x;
    float _1460 = -_1438;
    float _1462 = _1460 + 1.0;
    float _1464 = _1438 * _1410;
    float _1466 = _1260 * _1454;
    float _1468 = -_1260;
    float _1470 = _1468 + 1.0;
    float _1472 = -_1450;
    float _1474 = _1472 + 1.0;
    float _1476 = _1422 * _1462;
    float _1478 = -(*spvDescriptorSet0.vp_c9)._m0[161].y;
    float _1480 = (*spvDescriptorSet0.vp_c9)._m0[162].y + _1478;
    float _1482 = _1450 * _1470;
    float _1484 = -(*spvDescriptorSet0.vp_c9)._m0[162].y;
    float _1486 = _1484 + (*spvDescriptorSet0.vp_c9)._m0[163].y;
    float _1488 = _1272 * _1474;
    float _1490 = -(*spvDescriptorSet0.vp_c9)._m0[161].x;
    float _1492 = (*spvDescriptorSet0.vp_c9)._m0[162].x + _1490;
    float _1494 = -_1272;
    float _1496 = _1494 + 1.0;
    float _1498 = -(*spvDescriptorSet0.vp_c9)._m0[162].z;
    float _1500 = _1498 + (*spvDescriptorSet0.vp_c9)._m0[163].z;
    float _1502 = _1356 * _1488;
    float _1504 = _1364 * _1488;
    float _1506 = _1372 * _1488;
    float _1508 = fma(_1492, _1298, (*spvDescriptorSet0.vp_c9)._m0[161].x);
    float _1510 = fma(_1496, (*spvDescriptorSet0.vp_c9)._m0[159].x, _1502);
    float _1512 = fma(_1496, (*spvDescriptorSet0.vp_c9)._m0[159].y, _1504);
    float _1514 = fma(_1496, (*spvDescriptorSet0.vp_c9)._m0[159].z, _1506);
    float _1516 = fma(_1480, _1298, (*spvDescriptorSet0.vp_c9)._m0[161].y);
    float _1518 = fma(_1426, _1298, (*spvDescriptorSet0.vp_c9)._m0[161].z);
    float _1520 = fma(_1458, _1346, (*spvDescriptorSet0.vp_c9)._m0[162].x);
    float _1522 = fma(_1486, _1346, (*spvDescriptorSet0.vp_c9)._m0[162].y);
    float _1524 = fma(_1500, _1346, (*spvDescriptorSet0.vp_c9)._m0[162].z);
    float _1526 = fma(_1400, _1482, _1510);
    float _1528 = fma(_1402, _1482, _1512);
    float _1530 = fma(_1404, _1482, _1514);
    float _1532 = -(*spvDescriptorSet0.vp_c9)._m0[163].x;
    float _1534 = (*spvDescriptorSet0.vp_c9)._m0[164].x + _1532;
    float _1536 = -(*spvDescriptorSet0.vp_c9)._m0[163].z;
    float _1538 = (*spvDescriptorSet0.vp_c9)._m0[164].z + _1536;
    float _1540 = -(*spvDescriptorSet0.vp_c9)._m0[163].y;
    float _1542 = (*spvDescriptorSet0.vp_c9)._m0[164].y + _1540;
    float _1544 = fma(_1508, _1466, _1526);
    float _1546 = fma(_1516, _1466, _1528);
    float _1548 = fma(_1518, _1466, _1530);
    float _1550 = fma(_1534, _1358, (*spvDescriptorSet0.vp_c9)._m0[163].x);
    float _1552 = fma(_1542, _1358, (*spvDescriptorSet0.vp_c9)._m0[163].y);
    float _1554 = fma(_1538, _1358, (*spvDescriptorSet0.vp_c9)._m0[163].z);
    float _1556 = fma(_1520, _1476, _1544);
    float _1558 = fma(_1522, _1476, _1546);
    float _1560 = fma(_1524, _1476, _1548);
    float _1562 = -(*spvDescriptorSet0.vp_c9)._m0[164].x;
    float _1564 = _1562 + (*spvDescriptorSet0.vp_c9)._m0[165].x;
    float _1566 = -(*spvDescriptorSet0.vp_c9)._m0[164].y;
    float _1568 = _1566 + (*spvDescriptorSet0.vp_c9)._m0[165].y;
    float _1570 = -(*spvDescriptorSet0.vp_c9)._m0[164].z;
    float _1572 = _1570 + (*spvDescriptorSet0.vp_c9)._m0[165].z;
    float _1574 = fma(_1550, _1464, _1556);
    float _1576 = fma(_1564, _1382, (*spvDescriptorSet0.vp_c9)._m0[164].x);
    float _1578 = fma(_1568, _1382, (*spvDescriptorSet0.vp_c9)._m0[164].y);
    float _1580 = fma(_1552, _1464, _1558);
    float _1582 = -(*spvDescriptorSet0.vp_c9)._m0[165].x;
    float _1584 = (*spvDescriptorSet0.vp_c9)._m0[166].x + _1582;
    float _1586 = -(*spvDescriptorSet0.vp_c9)._m0[165].y;
    float _1588 = (*spvDescriptorSet0.vp_c9)._m0[166].y + _1586;
    float _1590 = fma(_1572, _1382, (*spvDescriptorSet0.vp_c9)._m0[164].z);
    float _1592 = -(*spvDescriptorSet0.vp_c9)._m0[165].z;
    float _1594 = (*spvDescriptorSet0.vp_c9)._m0[166].z + _1592;
    float _1596 = fma(_1554, _1464, _1560);
    float _1598 = fma(_1584, _1326, (*spvDescriptorSet0.vp_c9)._m0[165].x);
    float _1600 = fma(_1588, _1326, (*spvDescriptorSet0.vp_c9)._m0[165].y);
    float _1602 = fma(_1578, _1406, _1580);
    float _1604 = fma(_1594, _1326, (*spvDescriptorSet0.vp_c9)._m0[165].z);
    float _1606 = fma(_1576, _1406, _1574);
    float _1608 = fma(_1590, _1406, _1596);
    float _1610 = fma(_1600, _1370, _1602);
    float _1612 = fma(_1598, _1370, _1606);
    float _1614 = fma(_1604, _1370, _1608);
    float _1616 = fma(_1318, (*spvDescriptorSet0.vp_c9)._m0[166].y, _1610);
    float _1618 = fma(_1318, (*spvDescriptorSet0.vp_c9)._m0[166].x, _1612);
    float _1620 = fma(_1318, (*spvDescriptorSet0.vp_c9)._m0[166].z, _1614);
    out.m_69.x = _1618;
    out.m_69.y = _1616;
    out.m_69.z = _1620;
    bool _1622 = !_1296;
    int _1624 = as_type<int>(_1516);
    float _1626 = _1620;
    float _1628 = _1606;
    float _1630 = _1618;
    float _1648;
    if (!_1622)
    {
        float _1632 = in.m_61.x;
        float _1634 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[14].y;
        float _1636 = _1632 * (*spvDescriptorSet0.vp_c9)._m0[15].y;
        float _1638 = fma(_1636, (*spvDescriptorSet0.vp_c9)._m0[14].y, _166);
        float _1640 = _1638 * _1634;
        float _1642 = floor(_1640);
        float _1644 = -_1642;
        float _1646 = _1640 + _1644;
        _1648 = _1646;
        _1650 = true;
    }
    else
    {
        float _1652 = float(_132);
        float _1654 = 1.0 / _1652;
        float _1656 = _166 * _1654;
        _1648 = _1656;
    }
    _1650 = false;
    float _1658 = _1648;
    float _1660 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].y);
    int _1662 = int(_1660);
    float _1664 = in.m_61.y;
    int _1666 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _1668 = _1666 != 0;
    float _1670 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].x);
    int _1672 = int(_1670);
    float _1674 = float(_1662);
    float _1676 = trunc((*spvDescriptorSet0.vp_c9)._m0[31].y);
    int _1678 = int(_1676);
    float _1680 = _1602;
    if (_1668)
    {
        float _1682 = in.m_61.x;
        _1680 = _1682;
    }
    float _1684 = _1680;
    if (_1668)
    {
        _1624 = 0;
    }
    int _1686 = _1624;
    float _1688 = float(uint(_1672));
    float _1690 = 1.0 / _1674;
    int _1692 = _1686;
    if (_1668)
    {
        _1626 = _1664;
    }
    float _1694 = _1626;
    float _1696 = 1.0 / _1688;
    float _1698 = float(_1678);
    float _1700 = _1690 * _166;
    float _1702 = trunc((*spvDescriptorSet0.vp_c9)._m0[31].x);
    int _1704 = int(_1702);
    float _1706 = _1698;
    float _1708 = _1684;
    float _1710 = _1694;
    if (_1668)
    {
        _1628 = _1684;
    }
    float _1712 = _1628;
    float _1714 = _1712;
    if (_1668)
    {
        _1630 = _1712;
    }
    float _1716 = _1630;
    int _1718 = as_type<int>(_1696) + (-2);
    float _1720 = trunc(_1700);
    int _1722 = int(_1720);
    int _1724 = ~_1672;
    int _1726 = _1724 + 1;
    float _1728 = 1.0 / _1698;
    float _1730 = float(uint(_1704));
    float _1732 = float(uint(_1722));
    float _1734 = 1.0 / _1730;
    float _1736 = _1716;
    if (_1668)
    {
        _1706 = 1.0;
    }
    float _1738 = _1706;
    float _1740 = as_type<float>(_1718) * _1732;
    float _1742 = _1728 * _166;
    float _1744 = trunc(_1740);
    float _1746 = precise::max(_1744, 0.0);
    uint _1749 = uint(_1746);
    float _1751 = _1728;
    float _1753 = _1738;
    if (_1668)
    {
        _1751 = 1.0;
    }
    float _1755 = _1751;
    float _1757 = trunc(_1742);
    int _1759 = int(_1757);
    int _1761 = as_type<int>(_1734) + (-2);
    int _1763 = _1726 * int(_1749);
    int _1765 = _1763 + _1722;
    float _1767 = float(uint(_1765));
    float _1769 = float(uint(_1759));
    float _1771 = as_type<float>(_1718) * _1767;
    float _1773 = trunc(_1771);
    float _1775 = precise::max(_1773, 0.0);
    uint _1777 = uint(_1775);
    float _1779 = _1755;
    if (!_1668)
    {
        float _1781 = in.m_61.x;
        float _1783 = _1664 * 3.1415927410125732421875;
        float _1785 = _1783 * 0.15915493667125701904296875;
        float _1787 = _1785 * 6.283185482025146484375;
        float _1789 = sin(_1787);
        float _1791 = _1781 * 3.1415927410125732421875;
        float _1793 = _1791 * 0.15915493667125701904296875;
        float _1795 = _1793 * 6.283185482025146484375;
        float _1797 = sin(_1795);
        _1753 = 7.345489978790283203125;
        _1708 = _1781;
        _1736 = _1664;
        _1779 = 1.2345600128173828125;
        _1692 = 2;
        _1714 = _1797;
        _1710 = _1789;
    }
    float _1799 = _1753;
    float _1801 = _1708;
    float _1803 = _1736;
    float _1805 = _1779;
    int _1807 = _1692;
    float _1809 = _1714;
    float _1811 = _1710;
    float _1813 = as_type<float>(_1761) * _1769;
    float _1815 = _1799 * _1801;
    int _1817 = ~_1672;
    int _1819 = _1817 + 1;
    float _1821 = in.m_71.w;
    float _1823 = trunc(_1813);
    float _1825 = precise::max(_1823, 0.0);
    uint _1827 = uint(_1825);
    int _1829 = int(_1749) + int(_1777);
    float _1831 = -(*spvDescriptorSet0.vp_c9)._m0[172].w;
    float _1833 = _1658 + _1831;
    int _1835 = ~_1704;
    int _1837 = _1835 + 1;
    float _1839 = -(*spvDescriptorSet0.vp_c9)._m0[173].w;
    float _1841 = _1658 + _1839;
    float _1843 = float(_132);
    int _1845 = _1819 * _1829;
    int _1847 = _1845 + _1722;
    float _1849 = float(_1672);
    float _1851 = floor(_1815);
    float _1853 = float(_1722);
    bool _1855 = _1853 >= _1849;
    bool _1857 = isnan(_1853);
    bool _1859 = _1855 || _1857;
    bool _1861 = isnan(_1849);
    bool _1863 = _1859 || _1861;
    float _1865 = float(_1863);
    bool _1867 = uint(_1847) >= uint(_1672);
    float _1869 = 1.0 / _1843;
    int _1871 = _1837 * int(_1827);
    int _1873 = _1871 + _1759;
    bool _1875 = _1672 == 0;
    bool _1877 = !_1867;
    int _1879 = _1877 ? 0 : (-1);
    float _1881 = float(uint(_1873));
    out.m_73.w = _1821;
    float _1883 = trunc(_1865);
    int _1885 = int(_1883);
    float _1887 = -_1851;
    float _1889 = _1815 + _1887;
    float _1891 = as_type<float>(_1761) * _1881;
    int _1893 = ~_1829;
    int _1895 = _1893 + _1879;
    int _1897 = _1895 + 1;
    float _1899 = _1849 * _1889;
    int _1901 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4096;
    bool _1903 = _1901 != 0;
    float _1905 = _1869 * _166;
    float _1907 = trunc(_1899);
    int _1909 = int(_1907);
    int _1911 = _1672 * _1897;
    int _1913 = _1911 + _1722;
    float _1915 = _1849 * _1905;
    int _1917 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 16;
    bool _1919 = _1917 != 0;
    int _1921 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 32;
    bool _1923 = _1921 != 0;
    bool _1925 = _1704 == 0;
    int _1927 = ~_1885;
    int _1929 = _1927 + 1;
    int _1931 = _1929 + 1;
    float _1933 = trunc(_1891);
    float _1935 = precise::max(_1933, 0.0);
    uint _1937 = uint(_1935);
    bool _1939 = !_1875;
    int _1941 = _1939 ? _1913 : (-1);
    bool _1943 = !_1903;
    int _1945 = _1943 ? 0 : 1;
    bool _1947 = !_1923;
    int _1949 = _1947 ? 0 : 1;
    int _1951 = _1941 * _1931;
    int _1953 = abs(_1945);
    float _1955 = trunc(_1915);
    int _1957 = int(_1955);
    int _1959 = _1672 + (-1);
    int _1961 = abs(_1949);
    float _1963 = _1803 * _1805;
    int _1965 = _1909 * _1953;
    int _1967 = _1965 + _1722;
    int _1969 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 64;
    bool _1971 = _1969 != 0;
    int _1973 = _1885 * _1959;
    int _1975 = _1973 + _1951;
    float _1977 = floor(_1963);
    bool _1979 = !_1919;
    int _1981 = _1979 ? 0 : 1;
    int _1983 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 128;
    bool _1985 = _1983 != 0;
    int _1987 = _1975 * _1961;
    int _1989 = int(_1827) + int(_1937);
    bool _1991 = !_1971;
    int _1993 = _1991 ? 0 : 1;
    float _1995 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].z;
    int _1997 = abs(_1981);
    int _1999 = ~_1704;
    int _2001 = _1999 + 1;
    bool _2003 = !_1985;
    int _2005 = _2003 ? 0 : 1;
    int _2007 = _1957 * _1997;
    int _2009 = _2007 + _1987;
    int _2011 = abs(_1993);
    int _2013 = _2001 * _1989;
    int _2015 = _2013 + _1759;
    float _2017 = float(_1704);
    float _2019 = -_1977;
    float _2021 = _1963 + _2019;
    float _2023 = float(_1759);
    int _2025 = _1967 * _2011;
    int _2027 = _2025 + _2009;
    int _2029 = abs(_2005);
    float _2031 = _2017 * _1905;
    bool _2033 = _2023 >= _2017;
    bool _2035 = isnan(_2023);
    bool _2037 = _2033 || _2035;
    bool _2039 = isnan(_2017);
    bool _2041 = _2037 || _2039;
    float _2043 = float(_2041);
    float _2045 = _2017 * _2021;
    float _2047 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].w;
    bool _2049 = uint(_2015) >= uint(_1704);
    int _2051 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _2053 = _2051 != 0;
    int _2055 = _1909 * _2029;
    int _2057 = _2055 + _2027;
    bool _2059 = !_2049;
    int _2061 = _2059 ? 0 : (-1);
    int _2063 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8192;
    bool _2065 = _2063 != 0;
    float _2067 = trunc(_2043);
    int _2069 = int(_2067);
    int _2071 = ~_1989;
    int _2073 = _2071 + _2061;
    int _2075 = _2073 + 1;
    float _2077 = float(uint(_2057));
    int _2079 = _1704 + (-1);
    int _2081 = _1704 * _2075;
    int _2083 = _2081 + _1759;
    int _2085 = ~_1672;
    int _2087 = _2085 + 1;
    float _2089 = as_type<float>(_1718) * _2077;
    float _2091 = trunc(_2045);
    int _2093 = int(_2091);
    float _2095 = as_type<float>(_2011);
    if (_2053)
    {
        float _2097 = in.m_61.x;
        _2095 = _2097;
    }
    float _2099 = _2095;
    bool _2101 = !_1925;
    int _2103 = _2101 ? _2083 : (-1);
    float _2105 = trunc(_2089);
    float _2107 = precise::max(_2105, 0.0);
    uint _2109 = uint(_2107);
    int _2111 = ~_2069;
    int _2113 = _2111 + 1;
    int _2115 = _2113 + 1;
    float _2117 = -(*spvDescriptorSet0.vp_c9)._m0[167].x;
    float _2119 = (*spvDescriptorSet0.vp_c9)._m0[168].x + _2117;
    float _2121 = -(*spvDescriptorSet0.vp_c9)._m0[168].x;
    float _2123 = _2121 + (*spvDescriptorSet0.vp_c9)._m0[169].x;
    int _2125 = _2103 * _2115;
    bool _2127 = !_2065;
    int _2129 = _2127 ? 0 : 1;
    float _2131 = trunc(_2031);
    int _2133 = int(_2131);
    int _2135 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 256;
    bool _2137 = _2135 != 0;
    int _2139 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 512;
    bool _2141 = _2139 != 0;
    int _2143 = _2069 * _2079;
    int _2145 = _2143 + _2125;
    int _2147 = abs(_2129);
    float _2149 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    bool _2151 = !_2141;
    int _2153 = _2151 ? 0 : 1;
    int _2155 = _2087 * int(_2109);
    int _2157 = _2155 + _2057;
    int _2159 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1024;
    bool _2161 = _2159 != 0;
    int _2163 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 2048;
    bool _2165 = _2163 != 0;
    float _2167 = (*spvDescriptorSet0.vp_c9)._m0[87].x + (*spvDescriptorSet0.vp_c9)._m0[86].z;
    bool _2169 = !_2137;
    int _2171 = _2169 ? 0 : 1;
    int _2173 = abs(_2153);
    float _2175 = float(uint(_2157));
    bool _2177 = !_2161;
    int _2179 = _2177 ? 0 : 1;
    float _2181 = as_type<float>(_1718) * _2175;
    int _2183 = abs(_2171);
    int _2185 = _2093 * _2147;
    int _2187 = _2185 + _1759;
    bool _2189 = !_2165;
    int _2191 = _2189 ? 0 : 1;
    float _2193 = trunc(_2181);
    float _2195 = precise::max(_2193, 0.0);
    uint _2197 = uint(_2195);
    int _2199 = abs(_2179);
    int _2201 = _2145 * _2173;
    int _2203 = abs(_2191);
    int _2205 = _2133 * _2183;
    int _2207 = _2205 + _2201;
    int _2209 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 16;
    bool _2211 = _2209 != 0;
    int _2213 = _2187 * _2199;
    int _2215 = _2213 + _2207;
    int _2217 = ~_1672;
    int _2219 = _2217 + 1;
    int _2221 = _2207;
    bool _2223 = _2137;
    int _2225 = int(_2109);
    float _2227 = as_type<float>(_2147);
    float _2229 = as_type<float>(_2219);
    if (_2053)
    {
        float _2231 = -_188;
        float _2233 = _2231 + 1.0;
        _2221 = as_type<int>(_2233);
    }
    int _2235 = _2221;
    if (_2053)
    {
        bool _2237 = _2099 > 0.5;
        _2223 = _2237;
    }
    bool _2239 = _2223;
    int _2241 = _2093 * _2203;
    int _2243 = _2241 + _2215;
    int _2245 = int(_2109) + int(_2197);
    float _2247 = -_192;
    float _2249 = _2247 + 1.0;
    float _2251 = in.m_61.z;
    bool _2253 = _1664 > 0.5;
    float _2255 = float(uint(_2243));
    if (_2211)
    {
        float _2257 = -_188;
        float _2259 = _2257 + 1.0;
        _2225 = as_type<int>(_2259);
    }
    int _2261 = _2225;
    int _2263 = ~_1704;
    int _2265 = _2263 + 1;
    float _2267 = as_type<float>(_1761) * _2255;
    int _2269 = _2219 * _2245;
    int _2271 = _2269 + _2057;
    if (!_2053)
    {
        _2227 = _188;
    }
    float _2273 = _2227;
    float _2275 = trunc(_2267);
    float _2277 = precise::max(_2275, 0.0);
    uint _2279 = uint(_2277);
    float _2281 = 0.0;
    float _2283 = _2273;
    if (!_2211)
    {
        _2281 = _188;
    }
    float _2285 = _2281;
    float _2287 = _2285;
    if (_2211)
    {
        float _2289 = _2253 ? as_type<float>(_2261) : _188;
        _2287 = _2289;
    }
    float _2291 = _2287;
    if (_2053)
    {
        float _2293 = _2239 ? as_type<float>(_2235) : _188;
        _2283 = _2293;
    }
    float _2295 = _2283;
    int _2297 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 64;
    bool _2299 = _2297 != 0;
    bool _2301 = uint(_2271) >= uint(_1672);
    float _2303 = in.m_48.x;
    float _2305 = in.m_48.y;
    float _2307 = in.m_48.z;
    bool _2309 = _1664 > 0.5;
    bool _2311 = _2309 && _2299;
    int _2313 = _2265 * int(_2279);
    int _2315 = _2313 + _2243;
    float _2317 = -(*spvDescriptorSet0.vp_c9)._m0[167].w;
    float _2319 = _2317 + (*spvDescriptorSet0.vp_c9)._m0[168].w;
    bool _2321 = _2251 > 0.5;
    if (!_2299)
    {
        _2229 = _188;
    }
    float _2323 = _2229;
    float _2325 = 1.0 / _2319;
    float _2327 = float(uint(_2315));
    int _2329 = _2321 ? as_type<int>(_2249) : as_type<int>(_192);
    bool _2331 = !_2301;
    int _2333 = _2331 ? 0 : (-1);
    float _2335 = as_type<float>(_1761) * _2327;
    float _2337 = _2323;
    if (_2311)
    {
        float _2339 = -_188;
        float _2341 = _2339 + 1.0;
        _220 = _2341;
    }
    float _2343 = _220;
    int _2345 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 32;
    bool _2347 = _2345 != 0;
    float _2349 = _1664 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    float _2351 = trunc(_2335);
    float _2353 = precise::max(_2351, 0.0);
    uint _2355 = uint(_2353);
    int _2357 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _2359 = _2357 != 0;
    float _2361 = -(*spvDescriptorSet0.vp_c9)._m0[168].w;
    float _2363 = _2361 + (*spvDescriptorSet0.vp_c9)._m0[169].w;
    float _2365 = _2347 ? as_type<float>(_2329) : _192;
    float _2367 = _2305 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    int _2369 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2097152;
    bool _2371 = _2369 != 0;
    float _2373 = _2119 * _2325;
    int _2375 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4194304;
    bool _2377 = _2375 != 0;
    float _2379 = 1.0 / _2363;
    int _2381 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 128;
    bool _2383 = _2381 != 0;
    float _2385 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    int _2387 = _2253 ? as_type<int>(_2249) : as_type<int>(_192);
    float _2389 = _2305 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _2391 = _2305 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    int _2393 = ~_2245;
    int _2395 = _2393 + _2333;
    int _2397 = _2395 + 1;
    float _2399 = fma(_2349, -2.0, _2385);
    float _2401 = float(uint(_1967));
    float _2403 = fma(_2303, (*spvDescriptorSet0.vp_c10)._m0[4].x, _2389);
    float _2405 = fma(_2303, (*spvDescriptorSet0.vp_c10)._m0[5].x, _2367);
    float _2407 = fma(_2303, (*spvDescriptorSet0.vp_c10)._m0[6].x, _2391);
    int _2409 = ~_1704;
    int _2411 = _2409 + 1;
    int _2413 = _1672 * _2397;
    int _2415 = _2413 + _2057;
    int _2417 = int(_2279) + int(_2355);
    float _2419 = as_type<float>(_1718) * _2401;
    bool _2421 = _1672 == 0;
    float _2423 = _2123 * _2379;
    if (_2299)
    {
        _2337 = _2343;
    }
    float _2425 = _2337;
    int _2427 = _2411 * _2417;
    int _2429 = _2427 + _2243;
    bool _2431 = !_2421;
    int _2433 = _2431 ? _2415 : (-1);
    float _2435 = trunc(_2419);
    float _2437 = precise::max(_2435, 0.0);
    uint _2439 = uint(_2437);
    float _2441 = _1801 * 2.0;
    bool _2443 = _1807 != 2;
    float _2445 = fma(_166, (*spvDescriptorSet0.vp_c9)._m0[76].y, _2399);
    float _2447 = fma(_2307, (*spvDescriptorSet0.vp_c10)._m0[5].z, _2405);
    float _2449 = _2359 ? as_type<float>(_2387) : _192;
    float _2451 = floor(_2441);
    float _2453 = _2383 ? as_type<float>(_2329) : _192;
    float _2455 = fma(_2307, (*spvDescriptorSet0.vp_c10)._m0[6].z, _2407);
    int _2457 = _2433 & 3;
    bool _2459 = uint(_2429) >= uint(_1704);
    float _2461 = (*spvDescriptorSet0.vp_c9)._m0[92].x + (*spvDescriptorSet0.vp_c9)._m0[91].z;
    float _2463 = (*spvDescriptorSet0.vp_c9)._m0[93].z + (*spvDescriptorSet0.vp_c9)._m0[93].x;
    bool _2465 = uint(_2457) > 1u;
    float _2467 = _1809 * (*spvDescriptorSet0.vp_c9)._m0[92].x;
    bool _2469 = !_2459;
    int _2471 = _2469 ? 0 : (-1);
    float _2473 = fma(_1809, (*spvDescriptorSet0.vp_c9)._m0[93].z, _2463);
    int _2475 = _2433 & 3;
    bool _2477 = _2475 != 0;
    float _2479 = -_2461;
    float _2481 = fma(_2467, 2.0, _2479);
    int _2483 = ~_1672;
    int _2485 = _2483 + 1;
    float _2487 = _1801 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    float _2489 = float(uint(_2187));
    float _2491 = -_166;
    float _2493 = fma(_2491, (*spvDescriptorSet0.vp_c9)._m0[91].x, _2481);
    int _2495 = _2477 ? 0 : 1;
    int _2497 = _2485 * int(_2439);
    int _2499 = _2497 + _1967;
    float _2501 = as_type<float>(_1761) * _2489;
    int _2503 = ~_2495;
    int _2505 = _2503 + 1;
    int _2507 = _2505 + 1;
    float _2509 = -_2149;
    float _2511 = fma(_2487, 2.0, _2509);
    int _2513 = _2507;
    float _2515 = _2487;
    if (!_2465)
    {
        int _2517 = ~_2495;
        int _2519 = _2517 + 1;
        _2513 = _2519;
    }
    int _2521 = _2513;
    float _2523 = trunc(_2501);
    float _2525 = precise::max(_2523, 0.0);
    uint _2527 = uint(_2525);
    bool _2529 = uint(_2457) >= 2u;
    float _2531 = (*spvDescriptorSet0.vp_c9)._m0[93].w + (*spvDescriptorSet0.vp_c9)._m0[93].y;
    float _2533 = float(uint(_2499));
    float _2535 = -_166;
    float _2537 = fma(_2535, (*spvDescriptorSet0.vp_c9)._m0[76].x, _2511);
    int _2539 = ~_2417;
    int _2541 = _2539 + _2471;
    int _2543 = _2541 + 1;
    float _2545 = fma(_1811, (*spvDescriptorSet0.vp_c9)._m0[93].w, _2531);
    int _2547 = _2529 ? 0 : 1;
    float _2549 = as_type<float>(_1718) * _2533;
    bool _2551 = _2457 != 3;
    int _2553 = _1704 * _2543;
    int _2555 = _2553 + _2243;
    float _2557 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _2559 = log2(_2557);
    float _2561 = _1811 * (*spvDescriptorSet0.vp_c9)._m0[92].y;
    int _2563 = ~_1704;
    int _2565 = _2563 + 1;
    float _2567 = fma(_166, (*spvDescriptorSet0.vp_c9)._m0[92].w, _2545);
    float _2569 = (*spvDescriptorSet0.vp_c9)._m0[92].y + (*spvDescriptorSet0.vp_c9)._m0[91].w;
    bool _2571 = !_1925;
    int _2573 = _2571 ? _2555 : (-1);
    float _2575 = _2455 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    int _2577 = _2565 * int(_2527);
    int _2579 = _2577 + _2187;
    float _2581 = fma(_2561, -2.0, _2569);
    int _2583 = _2573 & 3;
    float _2585 = trunc(_2549);
    float _2587 = precise::max(_2585, 0.0);
    uint _2589 = uint(_2587);
    float _2591 = _2561;
    if (_2443)
    {
        _2591 = _1801;
    }
    float _2593 = _2591;
    float _2595 = fma(_166, (*spvDescriptorSet0.vp_c9)._m0[91].y, _2581);
    int _2597 = ~_2547;
    int _2599 = _2597 + 1;
    int _2601 = _2599 + 1;
    float _2603 = _2593;
    int _2605 = _2601;
    float _2607 = _2595;
    if (!_2443)
    {
        _2603 = _2251;
    }
    float _2609 = _2603;
    if (_2551)
    {
        int _2611 = ~_2547;
        int _2613 = _2611 + 1;
        _2605 = _2613;
    }
    int _2615 = _2605;
    bool _2617 = uint(_2583) > 1u;
    float _2619 = _2609 * (*spvDescriptorSet0.vp_c9)._m0[87].x;
    if (_2443)
    {
        _2515 = _1664;
    }
    float _2621 = _2515;
    float _2623 = _2559 * _166;
    float _2625 = float(uint(_2579));
    float _2627 = -_2167;
    float _2629 = fma(_2619, 2.0, _2627);
    float _2631 = _2621;
    if (!_2443)
    {
        _2631 = _1801;
    }
    float _2633 = _2631;
    int _2635 = _2573 & 3;
    bool _2637 = _2635 != 0;
    float _2639 = as_type<float>(_1761) * _2625;
    float _2641 = exp2(_2623);
    int _2643 = _2637 ? 0 : 1;
    float _2645 = _2633 * (*spvDescriptorSet0.vp_c9)._m0[87].y;
    bool _2647 = !_2371;
    int _2649 = _2647 ? 0 : 1;
    float _2651 = (*spvDescriptorSet0.vp_c9)._m0[87].y + (*spvDescriptorSet0.vp_c9)._m0[86].w;
    int _2653 = ~_2643;
    int _2655 = _2653 + 1;
    int _2657 = _2655 + 1;
    float _2659 = -_166;
    float _2661 = fma(_2659, (*spvDescriptorSet0.vp_c9)._m0[86].x, _2629);
    int _2663 = _2657;
    if (!_2617)
    {
        int _2665 = ~_2643;
        int _2667 = _2665 + 1;
        _2663 = _2667;
    }
    int _2669 = _2663;
    float _2671 = fma(_2645, -2.0, _2651);
    bool _2673 = _2583 != 3;
    float _2675 = trunc(_2639);
    float _2677 = precise::max(_2675, 0.0);
    uint _2679 = uint(_2677);
    bool _2681 = uint(_2583) >= 2u;
    int _2683 = _2681 ? 0 : 1;
    float _2685 = -_2641;
    float _2687 = _2685 + 1.0;
    bool _2689 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _2691 = isnan(0.0);
    bool _2693 = _2689 || _2691;
    bool _2695 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _2697 = _2693 || _2695;
    int _2699 = int(_2439) + int(_2589);
    int _2701 = ~_1672;
    int _2703 = _2701 + 1;
    int _2705 = ~_2683;
    int _2707 = _2705 + 1;
    int _2709 = _2707 + 1;
    int _2711 = _2709;
    if (_2673)
    {
        int _2713 = ~_2683;
        int _2715 = _2713 + 1;
        _2711 = _2715;
    }
    int _2717 = _2711;
    int _2719 = _2703 * _2699;
    int _2721 = _2719 + _1967;
    bool _2723 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _2725 = isnan(1.0);
    bool _2727 = _2723 || _2725;
    bool _2729 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _2731 = _2727 || _2729;
    float _2733 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _2735 = 1.0 + _2733;
    float _2737 = _2697 ? _2687 : 0.0;
    float _2739 = _1664 * 2.0;
    float _2741 = 1.0 / _2735;
    bool _2743 = uint(_2721) >= uint(_1672);
    float _2745 = (*spvDescriptorSet0.vp_c9)._m0[88].w + (*spvDescriptorSet0.vp_c9)._m0[88].y;
    float _2747 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    float _2749 = fma(_1664, (*spvDescriptorSet0.vp_c9)._m0[88].w, _2745);
    float _2751 = floor(_2739);
    float _2753 = fma(_1664, (*spvDescriptorSet0.vp_c9)._m0[78].w, _2747);
    float _2755 = (*spvDescriptorSet0.vp_c9)._m0[88].z + (*spvDescriptorSet0.vp_c9)._m0[88].x;
    float _2757 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    float _2759 = fma(_166, (*spvDescriptorSet0.vp_c9)._m0[87].w, _2749);
    float _2761 = fma(_166, (*spvDescriptorSet0.vp_c9)._m0[77].w, _2753);
    float _2763 = fma(_1801, (*spvDescriptorSet0.vp_c9)._m0[88].z, _2755);
    float _2765 = fma(_1801, (*spvDescriptorSet0.vp_c9)._m0[78].z, _2757);
    float _2767 = -(*spvDescriptorSet0.vp_c9)._m0[170].w;
    float _2769 = _2767 + (*spvDescriptorSet0.vp_c9)._m0[171].w;
    float _2771 = fma(_166, (*spvDescriptorSet0.vp_c9)._m0[92].z, _2473);
    float _2773 = fma(_166, (*spvDescriptorSet0.vp_c9)._m0[87].z, _2763);
    float _2775 = fma(_166, (*spvDescriptorSet0.vp_c9)._m0[77].z, _2765);
    float _2777 = fma(_166, (*spvDescriptorSet0.vp_c9)._m0[86].y, _2671);
    float _2779 = _2773;
    if (_2731)
    {
        float _2781 = _2737 * _2741;
        _168 = _2781;
    }
    float _2783 = _168;
    float _2785 = -(*spvDescriptorSet0.vp_c9)._m0[171].w;
    float _2787 = _2785 + (*spvDescriptorSet0.vp_c9)._m0[172].w;
    bool _2789 = _2751 >= 0.0;
    bool _2791 = isnan(_2751);
    bool _2793 = _2789 || _2791;
    bool _2795 = isnan(0.0);
    bool _2797 = _2793 || _2795;
    float _2799 = 1.0 / _2769;
    float _2801 = _2251 * 2.0;
    bool _2803 = !_2743;
    int _2805 = _2803 ? 0 : (-1);
    bool _2807 = _2451 >= 0.0;
    bool _2809 = isnan(_2451);
    bool _2811 = _2807 || _2809;
    bool _2813 = isnan(0.0);
    bool _2815 = _2811 || _2813;
    float _2817 = -(*spvDescriptorSet0.vp_c9)._m0[169].w;
    float _2819 = _2817 + (*spvDescriptorSet0.vp_c9)._m0[170].w;
    float _2821 = 1.0 / _2787;
    int _2823 = _2797 ? 0 : 1;
    bool _2825 = _2451 > 0.0;
    float _2827 = -(*spvDescriptorSet0.vp_c9)._m0[172].w;
    float _2829 = _2827 + (*spvDescriptorSet0.vp_c9)._m0[173].w;
    int _2831 = _2815 ? 0 : 1;
    bool _2833 = _2751 > 0.0;
    float _2835 = 1.0 / _2819;
    int _2837 = ~_1704;
    int _2839 = _2837 + 1;
    int _2841 = int(_2527) + int(_2679);
    float _2843 = -(*spvDescriptorSet0.vp_c9)._m0[169].x;
    float _2845 = (*spvDescriptorSet0.vp_c9)._m0[170].x + _2843;
    float _2847 = -(*spvDescriptorSet0.vp_c9)._m0[170].x;
    float _2849 = _2847 + (*spvDescriptorSet0.vp_c9)._m0[171].x;
    float _2851 = 1.0 / _2829;
    int _2853 = ~_2831;
    int _2855 = _2853 + 1;
    int _2857 = _2855 + 1;
    int _2859 = _2839 * _2841;
    int _2861 = _2859 + _2187;
    int _2863 = _2857;
    if (!_2825)
    {
        int _2865 = ~_2831;
        int _2867 = _2865 + 1;
        _2863 = _2867;
    }
    int _2869 = _2863;
    float _2871 = _2849 * _2799;
    float _2873 = _1664 + _2251;
    bool _2875 = uint(_2861) >= uint(_1704);
    float _2877 = floor(_2801);
    float _2879 = _2873 + (-1.0);
    bool _2881 = !_2875;
    int _2883 = _2881 ? 0 : (-1);
    float _2885 = _2845 * _2835;
    int _2887 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _2889 = _2887 != 0;
    int _2891 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _2893 = _2891 != 0;
    int _2895 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _2897 = _2895 != 0;
    float _2899 = -(*spvDescriptorSet0.vp_c9)._m0[171].x;
    float _2901 = (*spvDescriptorSet0.vp_c9)._m0[172].x + _2899;
    float _2903 = -(*spvDescriptorSet0.vp_c9)._m0[172].x;
    float _2905 = _2903 + (*spvDescriptorSet0.vp_c9)._m0[173].x;
    int _2907 = ~_2823;
    int _2909 = _2907 + 1;
    int _2911 = _2909 + 1;
    float _2913 = _2901 * _2821;
    float _2915 = -(*spvDescriptorSet0.vp_c9)._m0[168].w;
    float _2917 = _1658 + _2915;
    int _2919 = _2911;
    if (!_2833)
    {
        int _2921 = ~_2823;
        int _2923 = _2921 + 1;
        _2919 = _2923;
    }
    int _2925 = _2919;
    float _2927 = _2905 * _2851;
    bool _2929 = !_2477;
    int _2931 = _2929 ? 0 : 1;
    float _2933 = fma(_2879, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    bool _2935 = _2877 > 0.0;
    float _2937 = fma(_2307, (*spvDescriptorSet0.vp_c10)._m0[4].z, _2403);
    bool _2939 = _2877 >= 0.0;
    bool _2941 = isnan(_2877);
    bool _2943 = _2939 || _2941;
    bool _2945 = isnan(0.0);
    bool _2947 = _2943 || _2945;
    float _2949 = -(*spvDescriptorSet0.vp_c9)._m0[167].w;
    float _2951 = _1658 + _2949;
    float _2953 = -(*spvDescriptorSet0.vp_c9)._m0[169].w;
    float _2955 = _1658 + _2953;
    bool _2957 = _1658 >= (*spvDescriptorSet0.vp_c9)._m0[174].w;
    bool _2959 = isnan(_1658);
    bool _2961 = _2957 || _2959;
    bool _2963 = isnan((*spvDescriptorSet0.vp_c9)._m0[174].w);
    bool _2965 = _2961 || _2963;
    float _2967 = float(_2965);
    float _2969 = fma(_2423, _2917, (*spvDescriptorSet0.vp_c9)._m0[168].x);
    bool _2971 = _1658 >= (*spvDescriptorSet0.vp_c9)._m0[173].w;
    bool _2973 = isnan(_1658);
    bool _2975 = _2971 || _2973;
    bool _2977 = isnan((*spvDescriptorSet0.vp_c9)._m0[173].w);
    bool _2979 = _2975 || _2977;
    float _2981 = float(_2979);
    float _2983 = fma(_2373, _2951, (*spvDescriptorSet0.vp_c9)._m0[167].x);
    float _2985 = fma(_2885, _2955, (*spvDescriptorSet0.vp_c9)._m0[169].x);
    float _2987 = -_2967;
    float _2989 = _2987 + 1.0;
    float _2991 = -(*spvDescriptorSet0.vp_c9)._m0[170].w;
    float _2993 = _1658 + _2991;
    bool _2995 = _1658 >= (*spvDescriptorSet0.vp_c9)._m0[172].w;
    bool _2997 = isnan(_1658);
    bool _2999 = _2995 || _2997;
    bool _3001 = isnan((*spvDescriptorSet0.vp_c9)._m0[172].w);
    bool _3003 = _2999 || _3001;
    float _3005 = float(_3003);
    float _3007 = -_2981;
    float _3009 = _3007 + 1.0;
    bool _3011 = _1658 >= (*spvDescriptorSet0.vp_c9)._m0[171].w;
    bool _3013 = isnan(_1658);
    bool _3015 = _3011 || _3013;
    bool _3017 = isnan((*spvDescriptorSet0.vp_c9)._m0[171].w);
    bool _3019 = _3015 || _3017;
    float _3021 = float(_3019);
    float _3023 = fma(_2927, _1833, (*spvDescriptorSet0.vp_c9)._m0[172].x);
    float _3025 = _2981 * _2989;
    float _3027 = fma(_2871, _2993, (*spvDescriptorSet0.vp_c9)._m0[170].x);
    bool _3029 = _1658 >= (*spvDescriptorSet0.vp_c9)._m0[169].w;
    bool _3031 = isnan(_1658);
    bool _3033 = _3029 || _3031;
    bool _3035 = isnan((*spvDescriptorSet0.vp_c9)._m0[169].w);
    bool _3037 = _3033 || _3035;
    float _3039 = float(_3037);
    float _3041 = _3005 * _3009;
    float _3043 = -_3005;
    float _3045 = _3043 + 1.0;
    bool _3047 = _1658 >= (*spvDescriptorSet0.vp_c9)._m0[170].w;
    bool _3049 = isnan(_1658);
    bool _3051 = _3047 || _3049;
    bool _3053 = isnan((*spvDescriptorSet0.vp_c9)._m0[170].w);
    bool _3055 = _3051 || _3053;
    float _3057 = float(_3055);
    float _3059 = -(*spvDescriptorSet0.vp_c9)._m0[171].w;
    float _3061 = _1658 + _3059;
    float _3063 = -_3021;
    float _3065 = _3063 + 1.0;
    float _3067 = -(*spvDescriptorSet0.vp_c9)._m0[173].w;
    float _3069 = _3067 + (*spvDescriptorSet0.vp_c9)._m0[174].w;
    bool _3071 = _1658 >= (*spvDescriptorSet0.vp_c9)._m0[168].w;
    bool _3073 = isnan(_1658);
    bool _3075 = _3071 || _3073;
    bool _3077 = isnan((*spvDescriptorSet0.vp_c9)._m0[168].w);
    bool _3079 = _3075 || _3077;
    float _3081 = float(_3079);
    float _3083 = -_3039;
    float _3085 = _3083 + 1.0;
    float _3087 = fma(_2913, _3061, (*spvDescriptorSet0.vp_c9)._m0[171].x);
    float _3089 = _3021 * _3045;
    float _3091 = _3057 * _3065;
    float _3093 = -_3057;
    float _3095 = _3093 + 1.0;
    float _3097 = _1995 * (*spvDescriptorSet0.vp_c9)._m0[90].x;
    bool _3099 = _1658 >= (*spvDescriptorSet0.vp_c9)._m0[167].w;
    bool _3101 = isnan(_1658);
    bool _3103 = _3099 || _3101;
    bool _3105 = isnan((*spvDescriptorSet0.vp_c9)._m0[167].w);
    bool _3107 = _3103 || _3105;
    float _3109 = float(_3107);
    float _3111 = _3081 * _3085;
    float _3113 = 1.0 / _3069;
    float _3115 = -_3081;
    float _3117 = _3115 + 1.0;
    float _3119 = _3039 * _3095;
    float _3121 = _2047 * (*spvDescriptorSet0.vp_c9)._m0[90].y;
    float _3123 = _3109 * _3117;
    float _3125 = -_3109;
    float _3127 = _3125 + 1.0;
    float _3129 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[95].w;
    float _3131 = fma(_3121, _2365, -0.5);
    float _3133 = fma(_2449, (*spvDescriptorSet0.vp_c9)._m0[80].y, -0.5);
    float _3135 = _2983 * _3123;
    float _3137 = _2447 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _3139 = fma(_3097, _2291, -0.5);
    float _3141 = -(*spvDescriptorSet0.vp_c9)._m0[173].x;
    float _3143 = (*spvDescriptorSet0.vp_c9)._m0[174].x + _3141;
    float _3145 = fma(_3127, (*spvDescriptorSet0.vp_c9)._m0[167].x, _3135);
    float _3147 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[95].z;
    float _3149 = _2937 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _3151 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _3153 = _3137 + _3151;
    float _3155 = _3143 * _3113;
    float _3157 = fma(_2969, _3111, _3145);
    float _3159 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _3161 = _3149 + _3159;
    float _3163 = _3153 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _3165 = fma(_3155, _1841, (*spvDescriptorSet0.vp_c9)._m0[173].x);
    float _3167 = _3129 * (*spvDescriptorSet0.vp_c9)._m0[95].y;
    float _3169 = fma(_2985, _3119, _3157);
    float _3171 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _3173 = _2575 + _3171;
    float _3175 = fma(_3161, (*spvDescriptorSet0.vp_c8)._m0[28].x, _3163);
    float _3177 = fma(_3027, _3091, _3169);
    int _3179 = _2947 ? 0 : 1;
    float _3181 = fma(_3173, (*spvDescriptorSet0.vp_c8)._m0[28].z, _3175);
    float _3183 = _3147 * (*spvDescriptorSet0.vp_c9)._m0[95].x;
    float _3185 = fma(_2295, (*spvDescriptorSet0.vp_c9)._m0[80].x, -0.5);
    float _3187 = fma(_3087, _3089, _3177);
    float _3189 = _3153 * _3153;
    bool _3191 = _3181 >= 0.0;
    float _3193 = fma(_2775, _3185, _2537);
    float _3195 = fma(_3183, _2425, -0.5);
    float _3197 = fma(_3161, _3161, _3189);
    int _3199 = _2433 >> 31;
    float _3201 = fma(_3167, _2453, -0.5);
    float _3203 = fma(_2771, _3195, _2493);
    int _3205 = _2573 >> 31;
    float _3207 = fma(_3173, _3173, _3197);
    int _3209 = _3199 & 3;
    float _3211 = -_2595;
    float _3213 = fma(_2567, _3201, _3211);
    int _3215 = _3205 & 3;
    int _3217 = _2433 + _3209;
    float _3219 = fma(_3023, _3041, _3187);
    int _3221 = _3199;
    float _3223 = _3131;
    if (_3191)
    {
        _2607 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _3225 = _2607;
    float _3227 = _3203 + 0.5;
    int _3229 = _2573 + _3215;
    float _3231 = -_2445;
    float _3233 = fma(_2761, _3133, _3231);
    int _3235 = _3217 >> 2;
    if (_3191)
    {
        float _3237 = _3225 * 5.0;
        _3221 = as_type<int>(_3237);
    }
    int _3239 = _3221;
    int _3241 = _3229 >> 2;
    float _3243 = rsqrt(_3207);
    int _3245 = _3235 << 4;
    int _3247 = _3245 + 368;
    float _3249 = _3233 + 0.5;
    int _3251 = _3241 << 4;
    int _3253 = _3251 + 512;
    if (_3191)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _10242 = as_type<float>(_3239);
        out.gl_Position.z = _10242;
    }
    uint _3255 = uint(int(uint(_3247) >> uint(2)));
    uint _3257 = uint(int(uint(int(_3255)) >> uint(2)));
    int _3259 = int(_3255) & 3;
    float _3261 = (*spvDescriptorSet0.vp_c9)._m0[int(_3257)][_3259];
    int _3263 = int(_3255) + 1;
    uint _3265 = uint(int(uint(_3263) >> uint(2)));
    int _3267 = _3263 & 3;
    float _3269 = (*spvDescriptorSet0.vp_c9)._m0[int(_3265)][_3267];
    bool _3271 = !_2889;
    int _3273 = _3271 ? 0 : 1;
    float _3275 = _3193 + 0.5;
    int _3277 = ~_3179;
    int _3279 = _3277 + 1;
    int _3281 = _3279 + 1;
    float _3283 = _3213 + 0.5;
    int _3285 = _3281;
    if (!_2935)
    {
        int _3287 = ~_3179;
        int _3289 = _3287 + 1;
        _3285 = _3289;
    }
    int _3291 = _3285;
    float _3293 = _1664 + _1801;
    int _3295 = abs(_2521);
    uint _3297 = uint(int(uint(_3253) >> uint(2)));
    uint _3299 = uint(int(uint(int(_3297)) >> uint(2)));
    int _3301 = int(_3297) & 3;
    float _3303 = (*spvDescriptorSet0.vp_c9)._m0[int(_3299)][_3301];
    int _3305 = int(_3297) + 1;
    uint _3307 = uint(int(uint(_3305) >> uint(2)));
    int _3309 = _3305 & 3;
    float _3311 = (*spvDescriptorSet0.vp_c9)._m0[int(_3307)][_3309];
    out.m_75.x = _3227;
    out.m_75.y = _3283;
    float _3313 = float(_3291);
    float _3315 = fma(_3165, _3025, _3219);
    float _3317 = _3153 * _3243;
    float _3319 = _3161 * _3243;
    int _3321 = ~_2841;
    int _3323 = _3321 + _2883;
    int _3325 = _3323 + 1;
    float _3327 = fma(_2967, (*spvDescriptorSet0.vp_c9)._m0[174].x, _3315);
    int _3329 = _3247 + 8;
    uint _3331 = uint(int(uint(_3329) >> uint(2)));
    uint _3333 = uint(int(uint(int(_3331)) >> uint(2)));
    int _3335 = int(_3331) & 3;
    float _3337 = (*spvDescriptorSet0.vp_c9)._m0[int(_3333)][_3335];
    int _3339 = int(_3331) + 1;
    uint _3341 = uint(int(uint(_3339) >> uint(2)));
    int _3343 = _3339 & 3;
    float _3345 = (*spvDescriptorSet0.vp_c9)._m0[int(_3341)][_3343];
    float _3347 = -_3317;
    float _3349 = fma(_3347, (*spvDescriptorSet0.vp_c9)._m0[18].w, _3153);
    float _3351 = -_3319;
    float _3353 = fma(_3351, (*spvDescriptorSet0.vp_c9)._m0[18].w, _3161);
    int _3355 = abs(_2669);
    out.m_77.x = _3327;
    float _3357 = _3349 * _3349;
    int _3359 = abs(_2717);
    int _3361 = _1704 * _3325;
    int _3363 = _3361 + _2187;
    int _3365 = _3253 + 8;
    uint _3367 = uint(int(uint(_3365) >> uint(2)));
    uint _3369 = uint(int(uint(int(_3367)) >> uint(2)));
    int _3371 = int(_3367) & 3;
    float _3373 = (*spvDescriptorSet0.vp_c9)._m0[int(_3369)][_3371];
    int _3375 = int(_3367) + 1;
    uint _3377 = uint(int(uint(_3375) >> uint(2)));
    int _3379 = _3375 & 3;
    float _3381 = (*spvDescriptorSet0.vp_c9)._m0[int(_3377)][_3379];
    float _3383 = fma(_3353, _3353, _3357);
    int _3385 = abs(_3273);
    float _3387 = _3293 + (-1.0);
    int _3389 = ~_2699;
    int _3391 = _3389 + _2805;
    int _3393 = _3391 + 1;
    out.m_79.x = _3275;
    out.m_79.y = _3249;
    float _3395 = float(_3385);
    float _3397 = fma(_2773, _3139, _2661);
    int _3399 = abs(_2931);
    int _3401 = _1672 * _3393;
    int _3403 = _3401 + _1967;
    int _3405 = ~_3355;
    int _3407 = _3405 + 1;
    int _3409 = _3407 + 1;
    float _3411 = _3395 * _3313;
    bool _3413 = !_2637;
    int _3415 = _3413 ? 0 : 1;
    float _3417 = -_2777;
    float _3419 = fma(_2759, _3131, _3417);
    int _3421 = ~_3399;
    int _3423 = _3421 + 1;
    int _3425 = _3423 + 1;
    float _3427 = _3173 * _3243;
    int _3429 = abs(_3415);
    float _3431 = _3419 + 0.5;
    float _3433 = -_3427;
    float _3435 = fma(_3433, (*spvDescriptorSet0.vp_c9)._m0[18].w, _3173);
    int _3437 = abs(_2615);
    if (_3191)
    {
        out.m_51.x = 0.0;
    }
    int _3439 = ~_3295;
    int _3441 = _3439 + 1;
    int _3443 = _3441 + 1;
    float _3445 = _1664 + (-0.5);
    bool _3447 = _2457 != 3;
    int _3449 = _3443 * as_type<int>(_3269);
    int _3451 = ~_3429;
    int _3453 = _3451 + 1;
    int _3455 = _3453 + 1;
    int _3457 = ~_3437;
    int _3459 = _3457 + 1;
    int _3461 = _3459 + 1;
    int _3463 = _3425 * as_type<int>(_3261);
    int _3465 = _3463 + _3449;
    bool _3467 = !_2377;
    int _3469 = _3467 ? 0 : 1;
    int _3471 = _3409 * as_type<int>(_3311);
    bool _3473 = !_3447;
    int _3475 = _3473 ? 0 : (-1);
    bool _3477 = _2583 != 3;
    int _3479 = _3455 * as_type<int>(_3303);
    int _3481 = _3479 + _3471;
    int _3483 = abs(_3475);
    int _3485 = _3461 * as_type<int>(_3337);
    int _3487 = _3485 + _3465;
    bool _3489 = !_3477;
    int _3491 = _3489 ? 0 : (-1);
    float _3493 = in.m_81.x;
    float _3495 = in.m_81.y;
    float _3497 = in.m_81.z;
    int _3499 = abs(_3469);
    int _3501 = abs(_3491);
    int _3503 = ~_3359;
    int _3505 = _3503 + 1;
    int _3507 = _3505 + 1;
    int _3509 = ~_3483;
    int _3511 = _3509 + 1;
    int _3513 = _3511 + 1;
    float _3515 = _3411 * (-2.0);
    bool _3517 = !_2893;
    int _3519 = _3517 ? 0 : 1;
    int _3521 = _3507 * as_type<int>(_3373);
    int _3523 = _3521 + _3481;
    int _3525 = _3513 * as_type<int>(_3345);
    int _3527 = _3525 + _3487;
    int _3529 = ~_3501;
    int _3531 = _3529 + 1;
    int _3533 = _3531 + 1;
    int _3535 = abs(_2649);
    int _3537 = ~_3499;
    int _3539 = _3537 + 1;
    int _3541 = _3539 + 1;
    int _3543 = _3533 * as_type<int>(_3381);
    int _3545 = _3543 + _3523;
    int _3547 = abs(_3519);
    int _3549 = ~_3535;
    int _3551 = _3549 + 1;
    int _3553 = _3551 + 1;
    int _3555 = _3545 * _3541;
    bool _3557 = _1672 == 0;
    bool _3559 = _1704 == 0;
    int _3561 = _3527 * _3553;
    bool _3563 = !_3557;
    int _3565 = _3563 ? _3403 : (-1);
    float _3567 = fma(_3387, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    bool _3569 = !_3559;
    int _3571 = _3569 ? _3363 : (-1);
    float _3573 = float(_2869);
    int _3575 = _3565 * _3535;
    int _3577 = _3575 + _3561;
    float _3579 = float(_3547);
    int _3581 = _3571 * _3499;
    int _3583 = _3581 + _3555;
    float _3585 = fma(_3567, _3515, _3567);
    float _3587 = fma(_3515, _3493, _3493);
    float _3589 = _1801 + (-0.5);
    float _3591 = _3579 * _3573;
    float _3593 = fma(_3435, _3435, _3383);
    float _3595 = _3397 + 0.5;
    float _3597 = float(_3577);
    float _3599 = fma(_3589, (*spvDescriptorSet0.vp_c9)._m0[196].x, _3587);
    float _3601 = float(_3583);
    float _3603 = _3591 * (-2.0);
    out.m_83.x = _3595;
    out.m_83.y = _3431;
    float _3605 = fma(_3585, _2783, _3599);
    float _3607 = fma(_2933, _3603, _2933);
    out.m_85.x = _3597;
    out.m_85.y = _3601;
    float _3609 = fma(_3603, _3495, _3495);
    bool _3611 = !_2897;
    int _3613 = _3611 ? 0 : 1;
    float _3615 = _3497;
    if (_3191)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_65.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_65.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_65.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_65.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_67.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_67.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_67.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_67.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_75.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_75.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_75.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_75.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_85.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_85.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_85.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_85.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_95.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_95.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_95.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_95.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_99.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_99.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_99.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_99.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_97.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_97.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_97.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_97.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_101.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_101.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_101.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_101.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_79.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_79.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_79.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_79.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_73.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_73.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_73.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_73.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_93.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_93.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_93.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_93.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_105.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_105.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_105.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_105.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_51.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_51.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_51.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_51.w)); dm_cw(dm_gs, dm_p, 68, as_type<uint>(out.m_111.x)); dm_cw(dm_gs, dm_p, 69, as_type<uint>(out.m_111.y)); dm_cw(dm_gs, dm_p, 70, as_type<uint>(out.m_111.z)); dm_cw(dm_gs, dm_p, 71, as_type<uint>(out.m_111.w)); dm_cw(dm_gs, dm_p, 72, as_type<uint>(out.m_107.x)); dm_cw(dm_gs, dm_p, 73, as_type<uint>(out.m_107.y)); dm_cw(dm_gs, dm_p, 74, as_type<uint>(out.m_107.z)); dm_cw(dm_gs, dm_p, 75, as_type<uint>(out.m_107.w)); dm_cw(dm_gs, dm_p, 76, as_type<uint>(out.m_109.x)); dm_cw(dm_gs, dm_p, 77, as_type<uint>(out.m_109.y)); dm_cw(dm_gs, dm_p, 78, as_type<uint>(out.m_109.z)); dm_cw(dm_gs, dm_p, 79, as_type<uint>(out.m_109.w)); dm_cw(dm_gs, dm_p, 80, as_type<uint>(out.m_113.x)); dm_cw(dm_gs, dm_p, 81, as_type<uint>(out.m_113.y)); dm_cw(dm_gs, dm_p, 82, as_type<uint>(out.m_113.z)); dm_cw(dm_gs, dm_p, 83, as_type<uint>(out.m_113.w)); dm_cw(dm_gs, dm_p, 84, as_type<uint>(out.m_59.x)); dm_cw(dm_gs, dm_p, 85, as_type<uint>(out.m_59.y)); dm_cw(dm_gs, dm_p, 86, as_type<uint>(out.m_59.z)); dm_cw(dm_gs, dm_p, 87, as_type<uint>(out.m_59.w)); dm_cw(dm_gs, dm_p, 88, as_type<uint>(out.m_69.x)); dm_cw(dm_gs, dm_p, 89, as_type<uint>(out.m_69.y)); dm_cw(dm_gs, dm_p, 90, as_type<uint>(out.m_69.z)); dm_cw(dm_gs, dm_p, 91, as_type<uint>(out.m_69.w)); dm_cw(dm_gs, dm_p, 92, as_type<uint>(out.m_77.x)); dm_cw(dm_gs, dm_p, 93, as_type<uint>(out.m_77.y)); dm_cw(dm_gs, dm_p, 94, as_type<uint>(out.m_77.z)); dm_cw(dm_gs, dm_p, 95, as_type<uint>(out.m_77.w)); dm_cw(dm_gs, dm_p, 96, as_type<uint>(out.m_83.x)); dm_cw(dm_gs, dm_p, 97, as_type<uint>(out.m_83.y)); dm_cw(dm_gs, dm_p, 98, as_type<uint>(out.m_83.z)); dm_cw(dm_gs, dm_p, 99, as_type<uint>(out.m_83.w)); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _3617 = -_3317;
    float _3619 = fma(_3617, (*spvDescriptorSet0.vp_c9)._m0[18].w, _3137);
    int _3621 = abs(_3613);
    float _3623 = -_3319;
    float _3625 = fma(_3623, (*spvDescriptorSet0.vp_c9)._m0[18].w, _3149);
    float _3627 = float(_2925);
    float _3629 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _3631 = _3619 + _3629;
    float _3633 = float(_3621);
    float _3635 = -_3427;
    float _3637 = fma(_3635, (*spvDescriptorSet0.vp_c9)._m0[18].w, _2575);
    float _3639 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _3641 = _3625 + _3639;
    float _3643 = _3631 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _3645 = fma(_3445, (*spvDescriptorSet0.vp_c9)._m0[196].y, _3609);
    float _3647 = _3633 * _3627;
    float _3649 = _1801 + _2251;
    float _3651 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _3653 = _3637 + _3651;
    float _3655 = fma(_3641, (*spvDescriptorSet0.vp_c8)._m0[28].x, _3643);
    float _3657 = fma(_3607, _2783, _3645);
    float _3659 = _3649 + (-1.0);
    float _3661 = _3647 * (-2.0);
    float _3663 = fma(_3653, (*spvDescriptorSet0.vp_c8)._m0[28].z, _3655);
    float _3665 = _3605 * 0.15915493667125701904296875;
    float _3667 = fma(_3659, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _3669 = fma(_3661, _3497, _3497);
    float _3671 = _2251 + (-0.5);
    bool _3673 = _3663 >= 0.0;
    float _3675 = fma(_3667, _3661, _3667);
    float _3677 = _3657 * 0.15915493667125701904296875;
    float _3679 = fma(_3671, (*spvDescriptorSet0.vp_c9)._m0[196].z, _3669);
    float _3681 = _3665 * 6.283185482025146484375;
    float _3683 = sin(_3681);
    float _3685 = fma(_3675, _2783, _3679);
    float _3687 = _3685 * 0.15915493667125701904296875;
    float _3689 = _3677 * 6.283185482025146484375;
    float _3691 = sin(_3689);
    float _3693 = _3637;
    if (_3673)
    {
        _3615 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _3695 = _3615;
    int _3697 = as_type<int>(_3695);
    if (_3673)
    {
        out.m_51.x = 0.0;
    }
    if (_3673)
    {
        float _3699 = _3695 * 5.0;
        _3697 = as_type<int>(_3699);
    }
    int _3701 = _3697;
    float _3703 = _3665 * 6.283185482025146484375;
    float _3705 = cos(_3703);
    if (_3673)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _10916 = as_type<float>(_3701);
        out.gl_Position.z = _10916;
    }
    float _3707 = _3677 * 6.283185482025146484375;
    float _3709 = cos(_3707);
    float _3711 = _3687 * 6.283185482025146484375;
    float _3713 = sin(_3711);
    float _3715 = sqrt(_3593);
    float _3717 = _3683 * _3691;
    if (_3673)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_65.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_65.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_65.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_65.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_67.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_67.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_67.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_67.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_75.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_75.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_75.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_75.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_85.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_85.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_85.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_85.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_95.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_95.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_95.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_95.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_99.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_99.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_99.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_99.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_97.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_97.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_97.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_97.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_101.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_101.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_101.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_101.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_79.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_79.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_79.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_79.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_73.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_73.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_73.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_73.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_93.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_93.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_93.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_93.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_105.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_105.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_105.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_105.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_51.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_51.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_51.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_51.w)); dm_cw(dm_gs, dm_p, 68, as_type<uint>(out.m_111.x)); dm_cw(dm_gs, dm_p, 69, as_type<uint>(out.m_111.y)); dm_cw(dm_gs, dm_p, 70, as_type<uint>(out.m_111.z)); dm_cw(dm_gs, dm_p, 71, as_type<uint>(out.m_111.w)); dm_cw(dm_gs, dm_p, 72, as_type<uint>(out.m_107.x)); dm_cw(dm_gs, dm_p, 73, as_type<uint>(out.m_107.y)); dm_cw(dm_gs, dm_p, 74, as_type<uint>(out.m_107.z)); dm_cw(dm_gs, dm_p, 75, as_type<uint>(out.m_107.w)); dm_cw(dm_gs, dm_p, 76, as_type<uint>(out.m_109.x)); dm_cw(dm_gs, dm_p, 77, as_type<uint>(out.m_109.y)); dm_cw(dm_gs, dm_p, 78, as_type<uint>(out.m_109.z)); dm_cw(dm_gs, dm_p, 79, as_type<uint>(out.m_109.w)); dm_cw(dm_gs, dm_p, 80, as_type<uint>(out.m_113.x)); dm_cw(dm_gs, dm_p, 81, as_type<uint>(out.m_113.y)); dm_cw(dm_gs, dm_p, 82, as_type<uint>(out.m_113.z)); dm_cw(dm_gs, dm_p, 83, as_type<uint>(out.m_113.w)); dm_cw(dm_gs, dm_p, 84, as_type<uint>(out.m_59.x)); dm_cw(dm_gs, dm_p, 85, as_type<uint>(out.m_59.y)); dm_cw(dm_gs, dm_p, 86, as_type<uint>(out.m_59.z)); dm_cw(dm_gs, dm_p, 87, as_type<uint>(out.m_59.w)); dm_cw(dm_gs, dm_p, 88, as_type<uint>(out.m_69.x)); dm_cw(dm_gs, dm_p, 89, as_type<uint>(out.m_69.y)); dm_cw(dm_gs, dm_p, 90, as_type<uint>(out.m_69.z)); dm_cw(dm_gs, dm_p, 91, as_type<uint>(out.m_69.w)); dm_cw(dm_gs, dm_p, 92, as_type<uint>(out.m_77.x)); dm_cw(dm_gs, dm_p, 93, as_type<uint>(out.m_77.y)); dm_cw(dm_gs, dm_p, 94, as_type<uint>(out.m_77.z)); dm_cw(dm_gs, dm_p, 95, as_type<uint>(out.m_77.w)); dm_cw(dm_gs, dm_p, 96, as_type<uint>(out.m_83.x)); dm_cw(dm_gs, dm_p, 97, as_type<uint>(out.m_83.y)); dm_cw(dm_gs, dm_p, 98, as_type<uint>(out.m_83.z)); dm_cw(dm_gs, dm_p, 99, as_type<uint>(out.m_83.w)); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _3719 = -_3137;
    float _3721 = _3719 + (*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _3723 = in.m_87.x;
    float _3725 = in.m_87.y;
    float _3727 = in.m_87.z;
    float _3729 = -_3149;
    float _3731 = _3729 + (*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _3733 = -_2575;
    float _3735 = _3733 + (*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _3737 = _3721 * _3721;
    float _3739 = _3687 * 6.283185482025146484375;
    float _3741 = cos(_3739);
    float _3743 = _3705 * _3709;
    float _3745 = _3243 * _3715;
    float _3747 = fma(_3731, _3731, _3737);
    float _3749 = _528 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _3751 = fma(_3713, _3743, _3717);
    float _3753 = fma(_3735, _3735, _3747);
    float _3755 = fma(_3713, _3717, _3743);
    float _3757 = _3745 * _3749;
    float _3759 = _722 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _3761 = rsqrt(_3753);
    float _3763 = _526 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _3765 = _3705 * _3691;
    float _3767 = _3683 * _3709;
    float _3769 = _3745 * _3759;
    float _3771 = _3705 * _3741;
    float _3773 = _3709 * _3741;
    float _3775 = _3683 * _3741;
    float _3777 = _3745 * _3763;
    float _3779 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _3725);
    float _3781 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _3723);
    float _3783 = _3691 * _3741;
    float _3785 = -_3765;
    float _3787 = fma(_3713, _3767, _3785);
    float _3789 = _3779 * _3757;
    float _3791 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _3727);
    float _3793 = -_3767;
    float _3795 = fma(_3713, _3765, _3793);
    float _3797 = _3731 * _3761;
    float _3799 = _3781 * _3769;
    float _3801 = _3791 * _3777;
    float _3803 = in.m_89.x;
    float _3805 = in.m_89.y;
    float _3807 = in.m_89.z;
    float _3809 = _3735 * _3761;
    float _3811 = -(*spvDescriptorSet0.vp_c8)._m0[1].z;
    float _3813 = _3797 * _3811;
    bool _3815 = _3725 != 0.0;
    bool _3817 = isnan(_3725);
    bool _3819 = _3815 || _3817;
    bool _3821 = isnan(0.0);
    bool _3823 = _3819 || _3821;
    float _3825 = _3721 * _3761;
    float _3827 = -(*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _3829 = _3809 * _3827;
    float _3831 = -(*spvDescriptorSet0.vp_c8)._m0[1].x;
    float _3833 = -_3813;
    float _3835 = fma(_3809, _3831, _3833);
    bool _3837 = _3723 == 0.0;
    bool _3839 = !_3823;
    bool _3841 = _3837 && _3839;
    float _3843 = -(*spvDescriptorSet0.vp_c8)._m0[1].x;
    float _3845 = _3825 * _3843;
    float _3847 = -(*spvDescriptorSet0.vp_c8)._m0[1].z;
    float _3849 = -_3829;
    float _3851 = fma(_3825, _3847, _3849);
    float _3853 = _3835 * _3835;
    bool _3855 = _3727 == 0.0;
    bool _3857 = _3855 && _3841;
    float _3859 = in.m_91.x;
    float _3861 = in.m_91.y;
    float _3863 = in.m_91.z;
    float _3865 = in.m_91.w;
    float _3867 = -(*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _3869 = -_3845;
    float _3871 = fma(_3797, _3867, _3869);
    float _3873 = fma(_3851, _3851, _3853);
    float _3875 = -_3789;
    float _3877 = _3713 * _3875;
    float _3879 = _3771 * _3789;
    float _3881 = _3775 * _3789;
    float _3883 = fma(_3871, _3871, _3873);
    float _3885 = fma(_3773, _3799, _3877);
    float _3887 = fma(_3751, _3799, _3879);
    float _3889 = fma(_3787, _3799, _3881);
    float _3891 = rsqrt(_3883);
    float _3893 = fma(_3783, _3801, _3885);
    float _3895 = _3799;
    float _3897 = _3877;
    float _3899 = _3803;
    float _3901 = _3881;
    if (_3857)
    {
        _2779 = _3803;
    }
    float _3903 = _2779;
    float _3905 = fma(_3795, _3801, _3887);
    float _3907 = _3903;
    if (_3857)
    {
        _3223 = _3805;
    }
    float _3909 = _3223;
    float _3911 = _3909;
    if (_3857)
    {
        _3895 = _3903;
    }
    float _3913 = _3895;
    float _3915 = _3913;
    if (!_3857)
    {
        _3907 = _3803;
    }
    float _3917 = _3907;
    if (_3857)
    {
        _3897 = _3807;
    }
    float _3919 = _3897;
    float _3921 = _3919;
    if (_3857)
    {
        _3899 = _3909;
    }
    float _3923 = _3899;
    float _3925 = _3923;
    if (!_3857)
    {
        float _3927 = fma(_3723, (*spvDescriptorSet0.vp_c9)._m0[17].y, _3917);
        _3915 = _3927;
    }
    float _3929 = _3915;
    if (!_3857)
    {
        _3911 = _3805;
    }
    float _3931 = _3911;
    float _3933 = _3863 * _3917;
    if (_3857)
    {
        _3901 = _3919;
    }
    float _3935 = _3901;
    float _3937 = fma(_3755, _3801, _3889);
    float _3939 = _3935;
    if (!_3857)
    {
        _3921 = _3807;
    }
    float _3941 = _3921;
    if (!_3857)
    {
        float _3943 = fma(_3725, (*spvDescriptorSet0.vp_c9)._m0[17].y, _3931);
        _3925 = _3943;
    }
    float _3945 = _3925;
    float _3947 = _3851 * _3891;
    float _3949 = _3835 * _3891;
    float _3951 = _3859 * _3931;
    float _3953 = -_3933;
    float _3955 = fma(_3859, _3941, _3953);
    if (!_3857)
    {
        float _3957 = fma(_3727, (*spvDescriptorSet0.vp_c9)._m0[17].y, _3941);
        _3939 = _3957;
    }
    float _3959 = _3939;
    float _3961 = _3861 * _3941;
    float _3963 = _3871 * _3891;
    float _3965 = _3809 * _3949;
    float _3967 = _3825 * _3947;
    float _3969 = -_3961;
    float _3971 = fma(_3863, _3931, _3969);
    float _3973 = -_3951;
    float _3975 = fma(_3861, _3917, _3973);
    float _3977 = -_3965;
    float _3979 = fma(_3825, _3963, _3977);
    float _3981 = -_3967;
    float _3983 = fma(_3797, _3949, _3981);
    float _3985 = _3971 * _3865;
    float _3987 = _3955 * _3865;
    float _3989 = _3979 * _3905;
    float _3991 = _3983 * _3905;
    float _3993 = _3797 * _3963;
    float _3995 = _3975 * _3865;
    float _3997 = fma(_3947, _3893, _3989);
    float _3999 = fma(_3963, _3893, _3991);
    float _4001 = -_3993;
    float _4003 = fma(_3809, _3947, _4001);
    float _4005 = _3751 * _3979;
    float _4007 = fma(_3797, _3937, _3997);
    float _4009 = fma(_3809, _3937, _3999);
    float _4011 = _3751 * _4003;
    float _4013 = _3751 * _3983;
    float _4015 = _3149 + _4007;
    float _4017 = _2575 + _4009;
    float _4019 = _3771 * _3979;
    float _4021 = _3771 * _4003;
    float _4023 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _4025 = _4015 + _4023;
    float _4027 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _4029 = _4017 + _4027;
    float _4031 = _3771 * _3983;
    float _4033 = _3795 * _3979;
    float _4035 = _4025 * _4025;
    float _4037 = _4029 * _4029;
    float _4039 = _3795 * _3983;
    float _4041 = _3795 * _4003;
    float _4043 = _4003 * _3905;
    float _4045 = _4035 + _4037;
    float _4047 = fma(_3773, _3947, _4005);
    float _4049 = fma(_3773, _3949, _4011);
    float _4051 = fma(_3773, _3963, _4013);
    float _4053 = -_3713;
    float _4055 = fma(_4053, _3947, _4019);
    float _4057 = sqrt(_4045);
    float _4059 = fma(_3949, _3893, _4043);
    float _4061 = -_3713;
    float _4063 = fma(_4061, _3949, _4021);
    float _4065 = -_3713;
    float _4067 = fma(_4065, _3963, _4031);
    float _4069 = fma(_3783, _3947, _4033);
    float _4071 = fma(_3783, _3963, _4039);
    float _4073 = fma(_3775, _3797, _4055);
    float _4075 = fma(_3783, _3949, _4041);
    float _4077 = fma(_3825, _3937, _4059);
    float _4079 = fma(_3787, _3797, _4047);
    float _4081 = fma(_3787, _3825, _4049);
    float _4083 = fma(_3775, _3825, _4063);
    float _4085 = fma(_3775, _3809, _4067);
    float _4087 = fma(_3787, _3809, _4051);
    float _4089 = fma(_3755, _3797, _4069);
    float _4091 = fma(_3755, _3809, _4071);
    bool _4093 = _4057 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _4095 = _4073 * _3861;
    float _4097 = _4073 * _3945;
    float _4099 = _3987 * _4073;
    float _4101 = _3137 + _4077;
    float _4103 = fma(_3755, _3825, _4075);
    float _4105 = _4083 * _3945;
    float _4107 = _4083 * _3861;
    float _4109 = _4085 * _3861;
    float _4111 = _4085 * _3945;
    float _4113 = _3987 * _4083;
    float _4115 = _3987 * _4085;
    float _4117 = _4077;
    float _4119 = _4035;
    float _4121 = _4037;
    float _4123 = _4015;
    float _4125 = _4017;
    float _4127 = _4103;
    float _4129 = _3959;
    if (!_4093)
    {
        _4117 = _4101;
    }
    float _4131 = _4117;
    bool _4133 = !_4093;
    float _4135 = _4131;
    if (!_4133)
    {
        float _4137 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _4139 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _4141 = _4057 + _4139;
        float _4143 = rsqrt(_4045);
        float _4145 = _4141 * _4137;
        float _4147 = _4101 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _4149 = _4145 * 0.15915493667125701904296875;
        float _4151 = _4149 * 6.283185482025146484375;
        float _4153 = sin(_4151);
        float _4155 = _4149 * 6.283185482025146484375;
        float _4157 = cos(_4155);
        float _4159 = fma(_4153, _4147, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _4161 = _4143 * _4159;
        float _4163 = _4157 + (-1.0);
        float _4165 = fma(_4025, _4161, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _4167 = fma(_4029, _4161, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        float _4169 = _4163 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _4171 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
        float _4173 = _4165 + _4171;
        float _4175 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
        float _4177 = _4167 + _4175;
        float _4179 = fma(_4101, _4157, _4169);
        float _4181 = _4173 * _4173;
        float _4183 = _4177 * _4177;
        _4135 = _4179;
        _4119 = _4181;
        _4121 = _4183;
        _4123 = _4165;
        _4125 = _4167;
    }
    float _4185 = _4135;
    float _4187 = _4119;
    float _4189 = _4121;
    float _4191 = _4123;
    float _4193 = _4125;
    float _4195 = -(*spvDescriptorSet0.vp_c15)._m0[0].y;
    float _4197 = _4185 + _4195;
    float _4199 = fma(_3985, _4079, _4099);
    float _4201 = fma(_4079, _3859, _4095);
    float _4203 = fma(_4081, _3859, _4107);
    float _4205 = fma(_4197, _4197, _4187);
    float _4207 = fma(_3985, _4081, _4113);
    float _4209 = fma(_4087, _3859, _4109);
    float _4211 = fma(_4079, _3929, _4097);
    float _4213 = _4205 + _4189;
    float _4215 = fma(_4081, _3929, _4105);
    float _4217 = fma(_4087, _3929, _4111);
    float _4219 = fma(_3985, _4087, _4115);
    float _4221 = fma(_3995, _4089, _4199);
    float _4223 = fma(_4089, _3863, _4201);
    float _4225 = sqrt(_4213);
    float _4227 = fma(_4103, _3863, _4203);
    float _4229 = fma(_3995, _4103, _4207);
    float _4231 = fma(_4091, _3863, _4209);
    float _4233 = fma(_4089, _3959, _4211);
    float _4235 = fma(_4103, _3959, _4215);
    float _4237 = fma(_3995, _4091, _4219);
    float _4239 = fma(_4091, _3959, _4217);
    out.m_93.x = _4223;
    out.m_93.y = _4227;
    out.m_93.z = _4231;
    out.m_95.x = _4221;
    out.m_95.y = _4229;
    out.m_95.z = _4237;
    out.m_97.x = _4233;
    out.m_97.y = _4235;
    out.m_97.z = _4239;
    bool _4241 = _4225 >= (*spvDescriptorSet0.vp_c16)._m0[1].x;
    bool _4243 = isnan(_4225);
    bool _4245 = _4241 || _4243;
    bool _4247 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].x);
    bool _4249 = _4245 || _4247;
    float _4251 = _4221;
    float _4253 = _4229;
    if (!_4249)
    {
        _4127 = 1.0;
    }
    float _4255 = _4127;
    bool _4257 = !_4249;
    float _4259 = _4255;
    if (!_4257)
    {
        bool _4261 = _4225 >= (*spvDescriptorSet0.vp_c16)._m0[1].y;
        bool _4263 = isnan(_4225);
        bool _4265 = _4261 || _4263;
        bool _4267 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].y);
        bool _4269 = _4265 || _4267;
        if (!_4269)
        {
            float _4271 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _4273 = _4225 + _4271;
            float _4275 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _4277 = (*spvDescriptorSet0.vp_c16)._m0[1].y + _4275;
            float _4279 = -(*spvDescriptorSet0.vp_c16)._m0[2].x;
            float _4281 = _4279 + (*spvDescriptorSet0.vp_c16)._m0[2].y;
            float _4283 = 1.0 / _4277;
            float _4285 = _4273 * _4283;
            float _4287 = fma(_4285, _4281, (*spvDescriptorSet0.vp_c16)._m0[2].x);
            _4259 = _4287;
            _4251 = _4283;
            _4289 = true;
        }
        else
        {
            bool _4291 = _4225 >= (*spvDescriptorSet0.vp_c16)._m0[1].z;
            bool _4293 = isnan(_4225);
            bool _4295 = _4291 || _4293;
            bool _4297 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].z);
            bool _4299 = _4295 || _4297;
            if (!_4299)
            {
                float _4301 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _4303 = _4225 + _4301;
                float _4305 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _4307 = _4305 + (*spvDescriptorSet0.vp_c16)._m0[1].z;
                float _4309 = -(*spvDescriptorSet0.vp_c16)._m0[2].y;
                float _4311 = _4309 + (*spvDescriptorSet0.vp_c16)._m0[2].z;
                float _4313 = 1.0 / _4307;
                float _4315 = _4303 * _4313;
                float _4317 = fma(_4315, _4311, (*spvDescriptorSet0.vp_c16)._m0[2].y);
                _4259 = _4317;
                _4251 = _4313;
                _4289 = true;
            }
            else
            {
                _4259 = (*spvDescriptorSet0.vp_c16)._m0[2].z;
            }
        }
    }
    _4289 = false;
    float _4319 = _4259;
    float _4321 = _4251;
    float _4323 = -(*spvDescriptorSet0.vp_c16)._m0[0].y;
    float _4325 = _4185 + _4323;
    float _4327 = -(*spvDescriptorSet0.vp_c16)._m0[0].x;
    float _4329 = _4191 + _4327;
    float _4331 = -(*spvDescriptorSet0.vp_c16)._m0[0].z;
    float _4333 = _4193 + _4331;
    float _4335 = fma(_4325, _4319, (*spvDescriptorSet0.vp_c16)._m0[0].y);
    float _4337 = fma(_4329, _4319, (*spvDescriptorSet0.vp_c16)._m0[0].x);
    float _4339 = fma(_4333, _4319, (*spvDescriptorSet0.vp_c16)._m0[0].z);
    float _4341 = -_3137;
    float _4343 = _4341 + _4335;
    float _4345 = -_3149;
    float _4347 = _4345 + _4337;
    float _4349 = -_2575;
    float _4351 = _4349 + _4339;
    float _4353 = _4343 * _4343;
    float _4355 = fma(_4347, _4347, _4353);
    float _4357 = fma(_4351, _4351, _4355);
    float _4359 = sqrt(_4357);
    bool _4361 = _4359 > 0.0;
    bool _4363 = (*spvDescriptorSet0.vp_c15)._m0[660].y >= 0.5;
    bool _4365 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _4367 = _4363 || _4365;
    bool _4369 = isnan(0.5);
    bool _4371 = _4367 || _4369;
    float _4373 = _4321;
    float _4375 = (*spvDescriptorSet0.vp_c15)._m0[660].y;
    if (!_4361)
    {
        _4373 = _4337;
    }
    float _4377 = _4373;
    float _4379 = _4377;
    if (!_4361)
    {
        _4253 = _4335;
    }
    float _4381 = _4253;
    float _4383 = _4381;
    float _4385 = _4381;
    if (!_4361)
    {
        _4375 = _4339;
    }
    float _4387 = _4375;
    bool _4389 = !_4361;
    float _4391 = _4387;
    if (!_4389)
    {
        float _4393 = _214 * _214;
        float _4395 = rsqrt(_4357);
        float _4397 = fma(_212, _212, _4393);
        float _4399 = fma(_216, _216, _4397);
        float _4401 = sqrt(_4399);
        float _4403 = _4347 * _4395;
        float _4405 = _4343 * _4395;
        float _4407 = _4351 * _4395;
        bool _4409 = _4401 > 0.0;
        float _4411 = _4401;
        float _4413 = _4395;
        if (!_4409)
        {
            _4411 = _4337;
        }
        float _4415 = _4411;
        _4379 = _4415;
        if (!_4409)
        {
            _4383 = _4335;
        }
        float _4417 = _4383;
        _4385 = _4417;
        if (!_4409)
        {
            _4413 = _4339;
        }
        float _4419 = _4413;
        bool _4421 = !_4409;
        _4391 = _4419;
        if (!_4421)
        {
            float _4423 = rsqrt(_4399);
            float _4425 = 1.0 / (*spvDescriptorSet0.vp_c10)._m0[2].z;
            float _4427 = _214 * _4423;
            float _4429 = _212 * _4423;
            float _4431 = _4405 * _4427;
            float _4433 = _216 * _4423;
            float _4435 = fma(_4403, _4429, _4431);
            float _4437 = _4425 * (*spvDescriptorSet0.vp_c9)._m0[142].x;
            float _4439 = fma(_4407, _4433, _4435);
            float _4441 = _4439 * _4437;
            float _4443 = fma(_212, _4441, _4337);
            float _4445 = fma(_214, _4441, _4335);
            float _4447 = fma(_216, _4441, _4339);
            _4379 = _4443;
            _4385 = _4445;
            _4391 = _4447;
        }
    }
    float _4449 = _4379;
    float _4451 = _4385;
    float _4453 = _4391;
    float _4455 = -_3319;
    float _4457 = fma(_4455, (*spvDescriptorSet0.vp_c9)._m0[18].w, _4449);
    float _4459 = -_3317;
    float _4461 = fma(_4459, (*spvDescriptorSet0.vp_c9)._m0[18].w, _4451);
    float _4463 = -_3427;
    float _4465 = fma(_4463, (*spvDescriptorSet0.vp_c9)._m0[18].w, _4453);
    float _4467 = _4461;
    float _4469 = _4457;
    float _4471 = _4465;
    float _4473 = _4449;
    if (!_4371)
    {
        float _4475 = _3631 * _3631;
        float _4477 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _4479 = -_2575;
        float _4481 = _4479 + _4453;
        float _4483 = fma(_3641, _3641, _4475);
        float _4485 = fma(_3653, _3653, _4483);
        float _4487 = 1.0 / _3745;
        float _4489 = sqrt(_4485);
        float _4491 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _4493 = precise::min(_4489, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _4495 = _4493 * _4477;
        float _4497 = -_3137;
        float _4499 = _4497 + _4451;
        float _4501 = _4491 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _4503 = _4495 * _4487;
        float _4505 = -_3149;
        float _4507 = _4505 + _4449;
        float _4509 = _4501 * _4503;
        float _4511 = _4481 * _4503;
        float _4513 = fma(_4507, _4509, _3625);
        float _4515 = fma(_4499, _4509, _3619);
        float _4517 = fma(_4501, _4511, _3637);
        _4467 = _4515;
        _4469 = _4513;
        _4471 = _4517;
    }
    float _4519 = _4467;
    float _4521 = _4469;
    float _4523 = _4471;
    float _4525 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _4527 = _4519 + _4525;
    float _4529 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _4531 = _4521 + _4529;
    float _4533 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _4535 = _4523 + _4533;
    float _4537 = _4527 * _4527;
    float _4539 = fma(_4531, _4531, _4537);
    float _4541 = fma(_4535, _4535, _4539);
    float _4543 = rsqrt(_4541);
    float _4545 = _4543 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _4547 = _4531 * _4545;
    float _4549 = _4535 * _4545;
    float _4551 = _4547 * _4547;
    float _4553 = _4549 * _4549;
    float _4555 = _4551 + _4553;
    float _4557 = sqrt(_4555);
    bool _4559 = _4557 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _4561 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _4563 = _4557 + _4561;
    float _4565 = _4535;
    float _4567 = _4563;
    if (_4559)
    {
        float _4569 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _4565 = _4569;
    }
    float _4571 = _4565;
    if (_4559)
    {
        float _4573 = rsqrt(_4555);
        _222 = _4573;
    }
    float _4575 = _222;
    float _4577 = _4575;
    if (_4559)
    {
        float _4579 = _4563 * _4571;
        _4567 = _4579;
    }
    float _4581 = _4567;
    if (_4559)
    {
        float _4583 = _4581 * 0.15915493667125701904296875;
        _4473 = _4583;
    }
    float _4585 = _4473;
    float _4587 = _4543;
    if (_4559)
    {
        float _4589 = _4585 * 6.283185482025146484375;
        float _4591 = cos(_4589);
        _4587 = _4591;
    }
    float _4593 = _4587;
    float _4595 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _4597 = precise::max(0.0, _4595);
    float _4599 = _4539;
    float _4601 = _4597;
    float _4603 = _4595;
    if (_4559)
    {
        float _4605 = _4585 * 6.283185482025146484375;
        float _4607 = sin(_4605);
        _4599 = _4607;
    }
    float _4609 = _4599;
    float _4611 = -_4545;
    float _4613 = -_4597;
    float _4615 = fma(_4527, _4611, _4613);
    float _4617 = (*spvDescriptorSet0.vp_c15)._m0[652].x;
    if (_4559)
    {
        float _4619 = _4615 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _4601 = _4619;
    }
    float _4621 = _4601;
    float _4623 = _4621;
    float _4625 = _4593;
    if (_4559)
    {
        float _4627 = _4593 + (-1.0);
        _4603 = _4627;
    }
    float _4629 = _4603;
    float _4631 = fma(_3625, (*spvDescriptorSet0.vp_c15)._m0[652].x, (*spvDescriptorSet0.vp_c15)._m0[652].z);
    float _4633 = _4629;
    if (!_4559)
    {
        _4617 = _4553;
    }
    float _4635 = _4617;
    float _4637 = _4635;
    if (_4559)
    {
        float _4639 = _4629 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _4633 = _4639;
    }
    float _4641 = _4633;
    float _4643 = floor(_4631);
    float _4645 = _4609;
    if (_4559)
    {
        float _4647 = fma(_4609, _4621, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _4623 = _4647;
    }
    float _4649 = _4623;
    float _4651 = _4649;
    if (!_4559)
    {
        _4645 = _4615;
    }
    float _4653 = _4645;
    float _4655 = _4653;
    if (_4559)
    {
        float _4657 = fma(_4615, _4593, _4641);
        _4655 = _4657;
    }
    float _4659 = _4655;
    if (!_4559)
    {
        _4625 = _4549;
    }
    float _4661 = _4625;
    float _4663 = _4661;
    if (_4559)
    {
        float _4665 = _4575 * _4649;
        _4129 = _4665;
    }
    float _4667 = _4129;
    if (!_4559)
    {
        _4577 = _4547;
    }
    float _4669 = _4577;
    float _4671 = sqrt(_4541);
    float _4673 = _4669;
    if (!_4559)
    {
        _4651 = _4551;
    }
    float _4675 = _4651;
    float _4677 = _4675;
    if (_4559)
    {
        float _4679 = _4547 * _4667;
        _4673 = _4679;
    }
    float _4681 = _4673;
    if (_4559)
    {
        float _4683 = _4549 * _4667;
        _4663 = _4683;
    }
    float _4685 = _4663;
    if (_4559)
    {
        float _4687 = _4681 * _4681;
        _4677 = _4687;
    }
    float _4689 = _4677;
    if (_4559)
    {
        float _4691 = _4685 * _4685;
        _4637 = _4691;
    }
    float _4693 = _4637;
    float _4695 = _4519 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _4697 = fma(_4659, _4659, _4689);
    float _4699 = -_4643;
    float _4701 = _4631 + _4699;
    float _4703 = fma(_4521, (*spvDescriptorSet0.vp_c8)._m0[2].x, _4695);
    float _4705 = _4697 + _4693;
    float _4707 = fma(_3637, (*spvDescriptorSet0.vp_c15)._m0[652].y, (*spvDescriptorSet0.vp_c15)._m0[652].w);
    float _4709 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _4711 = fma(_4671, (*spvDescriptorSet0.vp_c15)._m0[23].w, _4709);
    float _4713 = precise::clamp(_4711, 0.0, 1.0);
    float _4715 = fma(_4523, (*spvDescriptorSet0.vp_c8)._m0[2].z, _4703);
    float _4717 = rsqrt(_4705);
    float _4719 = -_4713;
    float _4721 = _4719 + 1.0;
    float _4723 = _4715 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _4725 = _4519 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _4727 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _4729 = _4723 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _4731 = abs(_4721);
    float _4733 = log2(_4731);
    float _4735 = _4519 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _4737 = fma(_4521, (*spvDescriptorSet0.vp_c8)._m0[3].x, _4725);
    float _4739 = -_4729;
    float _4741 = fma(_4739, _4727, 1.0);
    float _4743 = _4519 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _4745 = fma(_4521, (*spvDescriptorSet0.vp_c8)._m0[1].x, _4735);
    float _4747 = fma(_4523, (*spvDescriptorSet0.vp_c8)._m0[3].z, _4737);
    float _4749 = _4717 * _4681;
    float _4751 = fma(_4521, (*spvDescriptorSet0.vp_c8)._m0[0].x, _4743);
    float _4753 = fma(_4523, (*spvDescriptorSet0.vp_c8)._m0[1].z, _4745);
    float _4755 = _4717 * _4659;
    float _4757 = _4749 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _4759 = fma(_4523, (*spvDescriptorSet0.vp_c8)._m0[0].z, _4751);
    float _4761 = _4753 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _4763 = _4717 * _4685;
    float _4765 = -_4757;
    float _4767 = fma(_4755, (*spvDescriptorSet0.vp_c15)._m0[21].y, _4765);
    float _4769 = _4759 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _4771 = _4761 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _4773 = _4747 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _4775 = -_4763;
    float _4777 = fma(_4775, (*spvDescriptorSet0.vp_c15)._m0[21].z, _4767);
    float _4779 = _4733 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _4781 = fma(_4769, (*spvDescriptorSet0.vp_c8)._m0[7].x, _4771);
    float _4783 = floor(_4707);
    float _4785 = fma(_4777, -0.5, 0.5);
    float _4787 = fma(_4723, (*spvDescriptorSet0.vp_c8)._m0[7].z, _4781);
    float _4789 = fma(_4777, 0.5, 0.5);
    float _4791 = _4761 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _4793 = _4755 + 1.0;
    float _4795 = fma(_4773, (*spvDescriptorSet0.vp_c8)._m0[7].w, _4787);
    float _4797 = exp2(_4779);
    float _4799 = _4761 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _4801 = fma(_4789, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _4803 = fma(_4769, (*spvDescriptorSet0.vp_c8)._m0[5].x, _4791);
    float _4805 = fma(_4769, (*spvDescriptorSet0.vp_c8)._m0[4].x, _4799);
    float _4807 = fma(_4789, _4801, -0.212114393711090087890625);
    float _4809 = fma(_4723, (*spvDescriptorSet0.vp_c8)._m0[5].z, _4803);
    float _4811 = sqrt(_4785);
    float _4813 = fma(_4723, (*spvDescriptorSet0.vp_c8)._m0[4].z, _4805);
    float _4815 = fma(_4789, _4807, 1.570728778839111328125);
    float _4817 = fma(_4773, (*spvDescriptorSet0.vp_c8)._m0[5].w, _4809);
    float _4819 = -_4783;
    float _4821 = _4707 + _4819;
    float _4823 = fma(_4773, (*spvDescriptorSet0.vp_c8)._m0[4].w, _4813);
    float _4825 = log2(_4741);
    float _4827 = -_4755;
    float _4829 = fma(_4797, _4793, _4827);
    float _4831 = 1.0 / _4795;
    float _4833 = _4811 * 0.636619746685028076171875;
    float2 _12758 = float2(_4701, _4821);
    float _4835 = dm_bs(spvDescriptorSet0.vp_t_tcb_24.sample(spvDescriptorSet0.vp_t_tcb_24Smplr, select(_12758, float2(0.0), isnan(_12758)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_24, spvDescriptorSet0.vp_t_tcb_24Smplr_w, select(_12758, float2(0.0), isnan(_12758)), level(0.0)).x;
    float _4837 = _4825 * 0.693147182464599609375;
    float _4839 = _4823 * _4831;
    float _4841 = _4817 * _4831;
    float _4843 = -_4815;
    float _4845 = fma(_4833, _4843, 1.0);
    float _4847 = _4837 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _4849 = fma(_4839, 0.5, 0.5);
    float _4851 = fma(_4841, -0.5, 0.5);
    float _4853 = fma(_4829, 0.5, 0.5);
    float3 _12793 = float3(_4849, _4851, _4847);
    float _4855 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_12793, float3(0.0), isnan(_12793)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_12793, float3(0.0), isnan(_12793)), level(0.0)).x;
    float3 _12804 = float3(_4849, _4851, _4847);
    float4 _4858 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_12804, float3(0.0), isnan(_12804)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_12804, float3(0.0), isnan(_12804)), level(0.0)).xyzw;
    float _4860 = _4858.x;
    float _4862 = _4858.y;
    float _4864 = _4858.z;
    float _4866 = _4858.w;
    float2 _12820 = float2(_4845, _4853);
    float3 _4870 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_12820, float2(0.0), isnan(_12820)), level(0.0)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_12820, float2(0.0), isnan(_12820)), level(0.0)).xyz;
    float _4872 = _4870.x;
    float _4874 = _4870.y;
    float _4876 = _4870.z;
    float _4878 = _3619 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _4880 = _4761 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    out.m_99.x = _3625;
    out.m_99.y = _3619;
    out.m_99.z = _3637;
    float _4882 = fma(_3625, (*spvDescriptorSet0.vp_c8)._m0[11].x, _4878);
    float _4884 = fma(_4769, (*spvDescriptorSet0.vp_c8)._m0[6].x, _4880);
    out.m_101.x = _4521;
    out.m_101.y = _4519;
    out.m_101.z = _4523;
    float _4886 = fma(_3637, (*spvDescriptorSet0.vp_c8)._m0[11].z, _4882);
    float _4888 = _3619 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _4890 = fma(_4723, (*spvDescriptorSet0.vp_c8)._m0[6].z, _4884);
    float _4892 = _4886 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _4894 = fma(_3625, (*spvDescriptorSet0.vp_c8)._m0[10].x, _4888);
    float _4896 = _4795 * 0.5;
    float _4898 = fma(_4773, (*spvDescriptorSet0.vp_c8)._m0[6].w, _4890);
    float _4900 = 1.0 / _4892;
    float _4902 = fma(_3637, (*spvDescriptorSet0.vp_c8)._m0[10].z, _4894);
    float _4904 = _4823 + _4795;
    bool _4906 = _4671 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _4908 = isnan(_4671);
    bool _4910 = _4906 || _4908;
    bool _4912 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _4914 = _4910 || _4912;
    out.gl_Position.x = _4823;
    out.gl_Position.y = _4817;
    out.gl_Position.z = _4898;
    out.gl_Position.w = _4795;
    float _4916 = _4902 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _4918 = _4904 * 0.5;
    float _4920 = _4916 + _4892;
    float _4922 = _4920 * _4900;
    float _4924 = _4922 * 0.5;
    if (!_4914)
    {
        _3693 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _4926 = _3693;
    float _4928 = in.m_103.x;
    float _4930 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _4932 = fma(_4924, (*spvDescriptorSet0.vp_c8)._m0[30].w, _4930);
    float _4934 = 1.0 / _4932;
    float _4936 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _4938 = _4934 * _4936;
    float _4940 = abs(_4938);
    float _4942 = log2(_4940);
    float _4944 = _4942 * (*spvDescriptorSet0.vp_c15)._m0[654].z;
    float _4946 = exp2(_4944);
    float _4948 = fma(_4946, (*spvDescriptorSet0.vp_c15)._m0[654].x, (*spvDescriptorSet0.vp_c15)._m0[654].y);
    float _4950 = precise::clamp(_4948, 0.0, 1.0);
    float _4952 = fma(_4950, -2.0, 3.0);
    float _4954 = _4950 * _4950;
    float _4956 = _4954 * _4952;
    float _4958 = _4733 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    bool _4960 = _4938 <= 8000.0;
    bool _4962 = isnan(_4938);
    bool _4964 = _4960 || _4962;
    bool _4966 = isnan(8000.0);
    bool _4968 = _4964 || _4966;
    float _4970 = float(_4968);
    float _4972 = -_4956;
    float _4974 = _4972 + 1.0;
    float _4976 = exp2(_4958);
    float _4978 = fma(_4974, (*spvDescriptorSet0.vp_c15)._m0[654].w, _4956);
    float _4980 = fma(_4817, -0.5, _4896);
    float _4982 = _4898 + _4795;
    float _4984 = _4970 * _4978;
    float _4986 = _4982 * 0.5;
    float _4988 = _4984 * (*spvDescriptorSet0.vp_c15)._m0[653].x;
    out.m_105.x = _4918;
    out.m_105.y = _4980;
    out.m_105.z = _4986;
    out.m_105.w = _4795;
    float _4990 = -_4976;
    float _4992 = _4990 + 1.0;
    float _4994 = _4992 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _4996 = -_4994;
    float _4998 = _4996 + 1.0;
    float _5000 = -_4835;
    float _5002 = _5000 + 1.0;
    float _5004 = _5002 * _4988;
    float _5006 = precise::clamp(_5004, 0.0, 1.0);
    float _5008 = -_5006;
    float _5010 = fma(_5008, (*spvDescriptorSet0.vp_c15)._m0[653].y, 1.0);
    float _5012 = (*spvDescriptorSet0.vp_c15)._m0[653].y;
    float _5014 = _4998;
    float _5016 = _4862;
    float _5018 = _4926;
    float _5020 = _4926;
    if (!_4914)
    {
        _5012 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _5022 = _5012;
    float _5024 = _5010 * _4928;
    float _5026 = _4994 * _4855;
    float _5028 = _4866 * _4998;
    float _5030 = _5024;
    float _5032 = _5022;
    float _5034 = _5022;
    if (!_4914)
    {
        _5014 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _5036 = _5014;
    float _5038 = _4866 * _5026;
    float _5040 = _4876 * _5026;
    float _5042 = fma(_4872, _5038, _4860);
    float _5044 = fma(_4874, _5038, _4862);
    float _5046 = _5024 * (*spvDescriptorSet0.vp_c13)._m0[1].w;
    float _5048 = fma(_4866, _5040, _4864);
    float _5050 = _5038;
    float _5052 = _5036;
    float _5054 = _5036;
    if (!_4914)
    {
        _5016 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _5056 = _5016;
    float _5058 = _5056;
    float _5060 = _5056;
    if (!_4914)
    {
        _5030 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _5062 = _5030;
    out.m_107.x = _5046;
    float _5064 = _5062;
    float _5066 = _5062;
    if (!_4914)
    {
        _5050 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _5068 = _5050;
    out.m_109.x = _5042;
    out.m_109.y = _5044;
    out.m_109.z = _5048;
    out.m_109.w = _5028;
    bool _5070 = !_4914;
    float _5072 = _5068;
    float _5074 = _5068;
    if (!_5070)
    {
        bool _5076 = _4671 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _5078 = isnan(_4671);
        bool _5080 = _5076 || _5078;
        bool _5082 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _5084 = _5080 || _5082;
        if (!_5084)
        {
            float _5086 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _5088 = _4671 + _5086;
            float _5090 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _5092 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _5090;
            float _5094 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _5096 = _5094 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _5098 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _5100 = _5098 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _5102 = 1.0 / _5092;
            float _5104 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _5106 = _5104 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _5108 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _5110 = _5108 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _5112 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _5114 = _5112 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _5116 = _5088 * _5102;
            float _5118 = precise::clamp(_5116, 0.0, 1.0);
            float _5120 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _5122 = _5120 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _5124 = fma(_5118, _5096, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _5126 = fma(_5118, _5100, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _5128 = fma(_5118, _5122, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _5130 = fma(_5118, _5106, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _5132 = fma(_5118, _5110, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _5134 = fma(_5118, _5114, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            _5074 = _5124;
            _5034 = _5132;
            _5020 = _5126;
            _5060 = _5130;
            _5054 = _5128;
            _5066 = _5134;
            _5136 = true;
        }
        else
        {
            bool _5138 = _4671 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _5140 = isnan(_4671);
            bool _5142 = _5138 || _5140;
            bool _5144 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _5146 = _5142 || _5144;
            if (!_5146)
            {
                _5058 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _5148 = _5058;
            _5060 = _5148;
            if (!_5146)
            {
                _5032 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _5150 = _5032;
            _5034 = _5150;
            if (!_5146)
            {
                _5064 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _5152 = _5064;
            _5066 = _5152;
            if (!_5146)
            {
                _5018 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _5154 = _5018;
            _5020 = _5154;
            if (!_5146)
            {
                _5072 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _5156 = _5072;
            _5074 = _5156;
            if (!_5146)
            {
                _5052 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _5158 = _5052;
            bool _5160 = !_5146;
            _5054 = _5158;
            if (!_5160)
            {
                bool _5162 = _4671 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _5164 = isnan(_4671);
                bool _5166 = _5162 || _5164;
                bool _5168 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _5170 = _5166 || _5168;
                if (!_5170)
                {
                    float _5172 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _5174 = _4671 + _5172;
                    float _5176 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _5178 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _5176;
                    float _5180 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _5182 = _5180 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _5184 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _5186 = _5184 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _5188 = 1.0 / _5178;
                    float _5190 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _5192 = _5190 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _5194 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _5196 = _5194 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _5198 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _5200 = _5198 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _5202 = _5174 * _5188;
                    float _5204 = precise::clamp(_5202, 0.0, 1.0);
                    float _5206 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _5208 = _5206 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _5210 = fma(_5204, _5182, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _5212 = fma(_5204, _5186, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _5214 = fma(_5204, _5208, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _5216 = fma(_5204, _5192, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _5218 = fma(_5204, _5196, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _5220 = fma(_5204, _5200, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    _5074 = _5210;
                    _5034 = _5218;
                    _5020 = _5212;
                    _5060 = _5216;
                    _5054 = _5214;
                    _5066 = _5220;
                    _5136 = true;
                }
                else
                {
                    _5074 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _5034 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _5020 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _5060 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _5054 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _5066 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _5136 = false;
    float _5222 = _5074;
    float _5224 = _5034;
    float _5226 = _5020;
    float _5228 = _5060;
    float _5230 = _5054;
    float _5232 = _5066;
    float _5234 = fma(_4235, -0.5, 0.5);
    float _5236 = precise::clamp(_5234, 0.0, 1.0);
    float _5238 = -_5222;
    float _5240 = _5224 + _5238;
    float _5242 = -_5226;
    float _5244 = _5228 + _5242;
    float _5246 = -_5230;
    float _5248 = _5232 + _5246;
    bool _5250 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _5252 = fma(_5236, _5240, _5222);
    float _5254 = fma(_5236, _5244, _5226);
    float _5256 = fma(_5236, _5248, _5230);
    float _5258 = _5252 * 0.586610972881317138671875;
    out.m_111.x = 0.0;
    float _5260 = fma(_5254, 0.298911988735198974609375, _5258);
    float _5262 = fma(_5256, 0.114477999508380889892578125, _5260);
    float _5264 = -_5262;
    float _5266 = _5254 + _5264;
    float _5268 = -_5262;
    float _5270 = _5252 + _5268;
    float _5272 = -_5262;
    float _5274 = _5256 + _5272;
    float _5276 = (*spvDescriptorSet0.vp_c10)._m0[3].x * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _5278 = fma(_5266, (*spvDescriptorSet0.vp_c13)._m0[1].z, _5262);
    float _5280 = fma(_5270, (*spvDescriptorSet0.vp_c13)._m0[1].z, _5262);
    float _5282 = fma(_5274, (*spvDescriptorSet0.vp_c13)._m0[1].z, _5262);
    out.m_51.x = _5276;
    out.m_113.x = _5278;
    out.m_113.y = _5280;
    out.m_113.z = _5282;
    if (!_5250)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_65.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_65.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_65.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_65.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_67.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_67.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_67.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_67.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_75.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_75.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_75.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_75.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_85.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_85.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_85.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_85.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_95.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_95.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_95.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_95.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_99.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_99.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_99.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_99.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_97.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_97.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_97.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_97.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_101.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_101.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_101.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_101.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_79.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_79.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_79.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_79.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_73.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_73.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_73.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_73.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_93.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_93.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_93.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_93.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_105.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_105.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_105.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_105.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_51.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_51.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_51.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_51.w)); dm_cw(dm_gs, dm_p, 68, as_type<uint>(out.m_111.x)); dm_cw(dm_gs, dm_p, 69, as_type<uint>(out.m_111.y)); dm_cw(dm_gs, dm_p, 70, as_type<uint>(out.m_111.z)); dm_cw(dm_gs, dm_p, 71, as_type<uint>(out.m_111.w)); dm_cw(dm_gs, dm_p, 72, as_type<uint>(out.m_107.x)); dm_cw(dm_gs, dm_p, 73, as_type<uint>(out.m_107.y)); dm_cw(dm_gs, dm_p, 74, as_type<uint>(out.m_107.z)); dm_cw(dm_gs, dm_p, 75, as_type<uint>(out.m_107.w)); dm_cw(dm_gs, dm_p, 76, as_type<uint>(out.m_109.x)); dm_cw(dm_gs, dm_p, 77, as_type<uint>(out.m_109.y)); dm_cw(dm_gs, dm_p, 78, as_type<uint>(out.m_109.z)); dm_cw(dm_gs, dm_p, 79, as_type<uint>(out.m_109.w)); dm_cw(dm_gs, dm_p, 80, as_type<uint>(out.m_113.x)); dm_cw(dm_gs, dm_p, 81, as_type<uint>(out.m_113.y)); dm_cw(dm_gs, dm_p, 82, as_type<uint>(out.m_113.z)); dm_cw(dm_gs, dm_p, 83, as_type<uint>(out.m_113.w)); dm_cw(dm_gs, dm_p, 84, as_type<uint>(out.m_59.x)); dm_cw(dm_gs, dm_p, 85, as_type<uint>(out.m_59.y)); dm_cw(dm_gs, dm_p, 86, as_type<uint>(out.m_59.z)); dm_cw(dm_gs, dm_p, 87, as_type<uint>(out.m_59.w)); dm_cw(dm_gs, dm_p, 88, as_type<uint>(out.m_69.x)); dm_cw(dm_gs, dm_p, 89, as_type<uint>(out.m_69.y)); dm_cw(dm_gs, dm_p, 90, as_type<uint>(out.m_69.z)); dm_cw(dm_gs, dm_p, 91, as_type<uint>(out.m_69.w)); dm_cw(dm_gs, dm_p, 92, as_type<uint>(out.m_77.x)); dm_cw(dm_gs, dm_p, 93, as_type<uint>(out.m_77.y)); dm_cw(dm_gs, dm_p, 94, as_type<uint>(out.m_77.z)); dm_cw(dm_gs, dm_p, 95, as_type<uint>(out.m_77.w)); dm_cw(dm_gs, dm_p, 96, as_type<uint>(out.m_83.x)); dm_cw(dm_gs, dm_p, 97, as_type<uint>(out.m_83.y)); dm_cw(dm_gs, dm_p, 98, as_type<uint>(out.m_83.z)); dm_cw(dm_gs, dm_p, 99, as_type<uint>(out.m_83.w)); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _5284 = -_4519;
    float _5286 = _5284 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
    float _5288 = -_4521;
    float _5290 = _5288 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
    float _5292 = -_4523;
    float _5294 = _5292 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
    float _5296 = _5286 * _5286;
    float _5298 = fma(_5290, _5290, _5296);
    float _5300 = fma(_5294, _5294, _5298);
    float _5302 = sqrt(_5300);
    float _5304 = rsqrt(_5300);
    float _5306 = -_5302;
    float _5308 = _5306 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _5310 = _5308 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
    float _5312 = precise::clamp(_5310, 0.0, 1.0);
    float _5314 = _5290 * _5304;
    float _5316 = _5286 * _5304;
    float _5318 = abs(_5312);
    float _5320 = log2(_5318);
    float _5322 = _5294 * _5304;
    float _5324 = _5314 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
    float _5326 = _4235 * _5316;
    float _5328 = -_5316;
    float _5330 = -_5324;
    float _5332 = fma(_5328, (*spvDescriptorSet0.vp_c15)._m0[656].y, _5330);
    float _5334 = fma(_4233, _5314, _5326);
    float _5336 = -_5322;
    float _5338 = fma(_5336, (*spvDescriptorSet0.vp_c15)._m0[656].z, _5332);
    float _5340 = fma(_4239, _5322, _5334);
    float _5342 = precise::clamp(_5340, 0.0, 1.0);
    float _5344 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
    float _5346 = _5338 + _5344;
    float _5348 = _5320 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
    float _5350 = _5346 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
    float _5352 = precise::clamp(_5350, 0.0, 1.0);
    float _5354 = exp2(_5348);
    float _5356 = _5354 * _5352;
    float _5358 = _5342 * _5356;
    float _5360 = _5358 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
    float _5362 = _5358 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
    float _5364 = _5358 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
    out.m_111.x = _5360;
    out.m_111.y = _5362;
    out.m_111.z = _5364;
    { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_65.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_65.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_65.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_65.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_67.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_67.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_67.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_67.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_75.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_75.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_75.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_75.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_85.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_85.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_85.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_85.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_95.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_95.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_95.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_95.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_99.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_99.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_99.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_99.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_97.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_97.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_97.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_97.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_101.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_101.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_101.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_101.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_79.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_79.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_79.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_79.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_73.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_73.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_73.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_73.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_93.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_93.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_93.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_93.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_105.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_105.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_105.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_105.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_51.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_51.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_51.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_51.w)); dm_cw(dm_gs, dm_p, 68, as_type<uint>(out.m_111.x)); dm_cw(dm_gs, dm_p, 69, as_type<uint>(out.m_111.y)); dm_cw(dm_gs, dm_p, 70, as_type<uint>(out.m_111.z)); dm_cw(dm_gs, dm_p, 71, as_type<uint>(out.m_111.w)); dm_cw(dm_gs, dm_p, 72, as_type<uint>(out.m_107.x)); dm_cw(dm_gs, dm_p, 73, as_type<uint>(out.m_107.y)); dm_cw(dm_gs, dm_p, 74, as_type<uint>(out.m_107.z)); dm_cw(dm_gs, dm_p, 75, as_type<uint>(out.m_107.w)); dm_cw(dm_gs, dm_p, 76, as_type<uint>(out.m_109.x)); dm_cw(dm_gs, dm_p, 77, as_type<uint>(out.m_109.y)); dm_cw(dm_gs, dm_p, 78, as_type<uint>(out.m_109.z)); dm_cw(dm_gs, dm_p, 79, as_type<uint>(out.m_109.w)); dm_cw(dm_gs, dm_p, 80, as_type<uint>(out.m_113.x)); dm_cw(dm_gs, dm_p, 81, as_type<uint>(out.m_113.y)); dm_cw(dm_gs, dm_p, 82, as_type<uint>(out.m_113.z)); dm_cw(dm_gs, dm_p, 83, as_type<uint>(out.m_113.w)); dm_cw(dm_gs, dm_p, 84, as_type<uint>(out.m_59.x)); dm_cw(dm_gs, dm_p, 85, as_type<uint>(out.m_59.y)); dm_cw(dm_gs, dm_p, 86, as_type<uint>(out.m_59.z)); dm_cw(dm_gs, dm_p, 87, as_type<uint>(out.m_59.w)); dm_cw(dm_gs, dm_p, 88, as_type<uint>(out.m_69.x)); dm_cw(dm_gs, dm_p, 89, as_type<uint>(out.m_69.y)); dm_cw(dm_gs, dm_p, 90, as_type<uint>(out.m_69.z)); dm_cw(dm_gs, dm_p, 91, as_type<uint>(out.m_69.w)); dm_cw(dm_gs, dm_p, 92, as_type<uint>(out.m_77.x)); dm_cw(dm_gs, dm_p, 93, as_type<uint>(out.m_77.y)); dm_cw(dm_gs, dm_p, 94, as_type<uint>(out.m_77.z)); dm_cw(dm_gs, dm_p, 95, as_type<uint>(out.m_77.w)); dm_cw(dm_gs, dm_p, 96, as_type<uint>(out.m_83.x)); dm_cw(dm_gs, dm_p, 97, as_type<uint>(out.m_83.y)); dm_cw(dm_gs, dm_p, 98, as_type<uint>(out.m_83.z)); dm_cw(dm_gs, dm_p, 99, as_type<uint>(out.m_83.w)); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
}

