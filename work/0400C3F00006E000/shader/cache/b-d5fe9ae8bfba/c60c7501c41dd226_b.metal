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
    float4 m_67 [[user(locn0)]];
    float4 m_79 [[user(locn1)]];
    float4 m_101 [[user(locn2)]];
    float4 m_97 [[user(locn3)]];
    float4 m_99 [[user(locn4)]];
    float4 m_69 [[user(locn5)]];
    float4 m_53 [[user(locn6)]];
    float4 m_89 [[user(locn7)]];
    float4 m_77 [[user(locn8)]];
    float4 m_81 [[user(locn9)]];
    float4 m_71 [[user(locn10)]];
    float4 m_91 [[user(locn11)]];
    float4 m_49 [[user(locn12)]];
    float4 m_85 [[user(locn13)]];
    float4 m_93 [[user(locn14)]];
    float4 m_95 [[user(locn15)]];
    float4 m_87 [[user(locn16)]];
    float4 gl_Position [[position, invariant]];
    float gl_PointSize [[point_size]];
};

struct main0_in
{
    float4 m_83 [[attribute(0)]];
    float4 m_61 [[attribute(1)]];
    float4 m_55 [[attribute(2)]];
    float4 m_46 [[attribute(3)]];
    float4 m_51 [[attribute(4)]];
    float4 m_73 [[attribute(5)]];
    float4 m_63 [[attribute(6)]];
    float4 m_57 [[attribute(7)]];
    float4 m_59 [[attribute(8)]];
    float4 m_75 [[attribute(9)]];
    float4 m_65 [[attribute(10)]];
};

vertex main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]])
{
    main0_out out = {};
    out.m_67 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_79 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_101 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_97 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_99 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_69 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_53 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_89 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_77 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_81 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_71 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_91 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_49 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_85 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_93 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_95 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_87 = float4(0.0, 0.0, 0.0, 1.0);
    bool _3031 = false;
    bool _656 = false;
    bool _558 = false;
    bool _450 = false;
    bool _222 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _115 = in.m_46.w;
    float _117 = trunc(_115);
    int _120 = int(_117);
    bool _124 = _120 >= 1;
    float _126 = 0.0;
    if (!_124)
    {
        _126 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _128 = _126;
    if (!_124)
    {
        out.m_49.x = 0.0;
    }
    int _130 = 0;
    if (!_124)
    {
        float _132 = _128 * 5.0;
        _130 = as_type<int>(_132);
    }
    int _134 = _130;
    if (!_124)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _3334 = as_type<float>(_134);
        out.gl_Position.z = _3334;
    }
    if (!_124)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _136 = in.m_51.w;
    float _138 = float(_120);
    float _140 = 1.0 / _138;
    float _142 = -_136;
    float _144 = _142 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _146 = _136 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _148 = isnan(_136);
    bool _150 = _146 || _148;
    bool _152 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _154 = _150 || _152;
    float _156 = _144 * _140;
    bool _158 = _144 >= _138;
    bool _160 = !_154;
    bool _162 = _158 || _160;
    out.m_53.x = _156;
    float _164 = _136;
    float _166 = _144;
    if (_162)
    {
        _164 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _168 = _164;
    if (_162)
    {
        out.m_49.x = 0.0;
    }
    int _170 = 0;
    if (_162)
    {
        float _172 = _168 * 5.0;
        _170 = as_type<int>(_172);
    }
    int _174 = _170;
    if (_162)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _3406 = as_type<float>(_174);
        out.gl_Position.z = _3406;
    }
    if (_162)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _176 = in.m_55.x;
    float _178 = in.m_55.y;
    float _180 = in.m_55.z;
    bool _182 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _184 = _178 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _186 = _178 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _188 = _178 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _190 = fma(_176, (*spvDescriptorSet0.vp_c10)._m0[4].x, _184);
    float _192 = fma(_176, (*spvDescriptorSet0.vp_c10)._m0[5].x, _186);
    float _194 = fma(_176, (*spvDescriptorSet0.vp_c10)._m0[6].x, _188);
    float _196 = fma(_180, (*spvDescriptorSet0.vp_c10)._m0[4].z, _190);
    float _198 = fma(_180, (*spvDescriptorSet0.vp_c10)._m0[5].z, _192);
    float _200 = fma(_180, (*spvDescriptorSet0.vp_c10)._m0[6].z, _194);
    bool _202 = !_182;
    float _220;
    if (!_202)
    {
        float _204 = in.m_57.x;
        float _206 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _208 = _204 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _210 = fma(_208, (*spvDescriptorSet0.vp_c9)._m0[12].x, _144);
        float _212 = _210 * _206;
        float _214 = floor(_212);
        float _216 = -_214;
        float _218 = _212 + _216;
        _220 = _218;
        _222 = true;
    }
    else
    {
        _220 = _156;
    }
    _222 = false;
    float _224 = _220;
    float _226 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _228 = _224 + _226;
    float _230 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _232 = _224 + _230;
    float _234 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _236 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _234;
    float _238 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _240 = _238 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _242 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _244 = (*spvDescriptorSet0.vp_c9)._m0[146].w + _242;
    float _246 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _248 = _224 + _246;
    float _250 = 1.0 / _236;
    bool _252 = _224 >= (*spvDescriptorSet0.vp_c9)._m0[146].w;
    bool _254 = isnan(_224);
    bool _256 = _252 || _254;
    bool _258 = isnan((*spvDescriptorSet0.vp_c9)._m0[146].w);
    bool _260 = _256 || _258;
    float _262 = float(_260);
    bool _264 = _224 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _266 = isnan(_224);
    bool _268 = _264 || _266;
    bool _270 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _272 = _268 || _270;
    float _274 = float(_272);
    float _276 = -_262;
    float _278 = _276 + 1.0;
    float _280 = 1.0 / _240;
    float _282 = _274 * _278;
    float _284 = -_274;
    float _286 = _284 + 1.0;
    bool _288 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].x;
    float _290 = 1.0 / _244;
    float _292 = _228 * _250;
    float _294 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _296 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _294;
    float _298 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _300 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _298;
    float _302 = _232 * _280;
    float _304 = -(*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _306 = (*spvDescriptorSet0.vp_c9)._m0[144].z + _304;
    float _308 = fma(_296, _292, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _310 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _312 = _310 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _314 = fma(_306, _292, (*spvDescriptorSet0.vp_c9)._m0[143].z);
    float _316 = fma(_312, _302, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _318 = _248 * _290;
    bool _320 = _224 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _322 = isnan(_224);
    bool _324 = _320 || _322;
    bool _326 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _328 = _324 || _326;
    float _330 = float(_328);
    float _332 = fma(_300, _292, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    bool _334 = _224 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _336 = isnan(_224);
    bool _338 = _334 || _336;
    bool _340 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _342 = _338 || _340;
    float _344 = float(_342);
    float _346 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _348 = _346 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _350 = -(*spvDescriptorSet0.vp_c9)._m0[144].z;
    float _352 = _350 + (*spvDescriptorSet0.vp_c9)._m0[145].z;
    float _354 = -_330;
    float _356 = _354 + 1.0;
    float _358 = _330 * _286;
    float _360 = fma(_348, _302, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _362 = fma(_352, _302, (*spvDescriptorSet0.vp_c9)._m0[144].z);
    float _364 = _344 * _356;
    float _366 = in.m_59.x;
    float _368 = in.m_59.y;
    float _370 = in.m_59.z;
    float _372 = -_344;
    float _374 = _372 + 1.0;
    float _376 = _308 * _364;
    float _378 = _332 * _364;
    float _380 = _314 * _364;
    float _382 = -(*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _384 = (*spvDescriptorSet0.vp_c9)._m0[146].x + _382;
    float _386 = -(*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _388 = (*spvDescriptorSet0.vp_c9)._m0[146].y + _386;
    float _390 = fma(_374, (*spvDescriptorSet0.vp_c9)._m0[143].x, _376);
    float _392 = fma(_374, (*spvDescriptorSet0.vp_c9)._m0[143].y, _378);
    float _394 = -(*spvDescriptorSet0.vp_c9)._m0[145].z;
    float _396 = (*spvDescriptorSet0.vp_c9)._m0[146].z + _394;
    float _398 = fma(_374, (*spvDescriptorSet0.vp_c9)._m0[143].z, _380);
    float _400 = fma(_384, _318, (*spvDescriptorSet0.vp_c9)._m0[145].x);
    float _402 = fma(_388, _318, (*spvDescriptorSet0.vp_c9)._m0[145].y);
    float _404 = fma(_360, _358, _390);
    float _406 = fma(_316, _358, _392);
    float _408 = fma(_396, _318, (*spvDescriptorSet0.vp_c9)._m0[145].z);
    float _410 = fma(_362, _358, _398);
    float _412 = fma(_400, _282, _404);
    float _414 = fma(_402, _282, _406);
    float _416 = fma(_408, _282, _410);
    float _418 = fma(_262, (*spvDescriptorSet0.vp_c9)._m0[146].x, _412);
    float _420 = fma(_262, (*spvDescriptorSet0.vp_c9)._m0[146].y, _414);
    float _422 = fma(_262, (*spvDescriptorSet0.vp_c9)._m0[146].z, _416);
    float _424 = _418 * _366;
    float _426 = _420 * _368;
    float _428 = _422 * _370;
    bool _430 = !_288;
    float _448;
    if (!_430)
    {
        float _432 = in.m_57.x;
        float _434 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].x;
        float _436 = _432 * (*spvDescriptorSet0.vp_c9)._m0[12].y;
        float _438 = fma(_436, (*spvDescriptorSet0.vp_c9)._m0[11].x, _144);
        float _440 = _438 * _434;
        float _442 = floor(_440);
        float _444 = -_442;
        float _446 = _440 + _444;
        _448 = _446;
        _450 = true;
    }
    else
    {
        _448 = _156;
    }
    _450 = false;
    float _452 = _448;
    float _454 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _456 = _452 + _454;
    bool _458 = _452 >= (*spvDescriptorSet0.vp_c9)._m0[108].w;
    bool _460 = isnan(_452);
    bool _462 = _458 || _460;
    bool _464 = isnan((*spvDescriptorSet0.vp_c9)._m0[108].w);
    bool _466 = _462 || _464;
    float _468 = float(_466);
    float _470 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _472 = (*spvDescriptorSet0.vp_c9)._m0[108].w + _470;
    bool _474 = _452 >= (*spvDescriptorSet0.vp_c9)._m0[107].w;
    bool _476 = isnan(_452);
    bool _478 = _474 || _476;
    bool _480 = isnan((*spvDescriptorSet0.vp_c9)._m0[107].w);
    bool _482 = _478 || _480;
    float _484 = float(_482);
    float _486 = -_468;
    float _488 = _486 + 1.0;
    float _490 = -(*spvDescriptorSet0.vp_c9)._m0[107].x;
    float _492 = (*spvDescriptorSet0.vp_c9)._m0[108].x + _490;
    float _494 = 1.0 / _472;
    bool _496 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _498 = _484 * _488;
    float _500 = -_484;
    float _502 = _500 + 1.0;
    float _504 = _456 * _494;
    float _506 = -(*spvDescriptorSet0.vp_c9)._m0[107].z;
    float _508 = (*spvDescriptorSet0.vp_c9)._m0[108].z + _506;
    float _510 = fma(_492, _504, (*spvDescriptorSet0.vp_c9)._m0[107].x);
    float _512 = -(*spvDescriptorSet0.vp_c9)._m0[107].y;
    float _514 = (*spvDescriptorSet0.vp_c9)._m0[108].y + _512;
    float _516 = fma(_508, _504, (*spvDescriptorSet0.vp_c9)._m0[107].z);
    float _518 = _510 * _498;
    float _520 = fma(_514, _504, (*spvDescriptorSet0.vp_c9)._m0[107].y);
    float _522 = _516 * _498;
    float _524 = _520 * _498;
    float _526 = fma(_502, (*spvDescriptorSet0.vp_c9)._m0[107].x, _518);
    float _528 = fma(_502, (*spvDescriptorSet0.vp_c9)._m0[107].y, _524);
    float _530 = fma(_502, (*spvDescriptorSet0.vp_c9)._m0[107].z, _522);
    float _532 = fma(_468, (*spvDescriptorSet0.vp_c9)._m0[108].x, _526);
    float _534 = fma(_468, (*spvDescriptorSet0.vp_c9)._m0[108].y, _528);
    float _536 = fma(_468, (*spvDescriptorSet0.vp_c9)._m0[108].z, _530);
    bool _538 = !_496;
    float _556;
    if (!_538)
    {
        float _540 = in.m_57.x;
        float _542 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _544 = _540 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _546 = fma(_544, (*spvDescriptorSet0.vp_c9)._m0[11].y, _144);
        float _548 = _546 * _542;
        float _550 = floor(_548);
        float _552 = -_550;
        float _554 = _548 + _552;
        _556 = _554;
        _558 = true;
    }
    else
    {
        _556 = _156;
    }
    _558 = false;
    float _560 = _556;
    bool _562 = _560 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _564 = isnan(_560);
    bool _566 = _562 || _564;
    bool _568 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _570 = _566 || _568;
    float _572 = float(_570);
    float _574 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _576 = _574 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _578 = _560 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _580 = isnan(_560);
    bool _582 = _578 || _580;
    bool _584 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _586 = _582 || _584;
    float _588 = float(_586);
    float _590 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _592 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _590;
    float _594 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _596 = _560 + _594;
    float _598 = -_572;
    float _600 = _598 + 1.0;
    bool _602 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].w;
    float _604 = 1.0 / _576;
    float _606 = _588 * _600;
    float _608 = -_588;
    float _610 = _608 + 1.0;
    float _612 = _532 * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _614 = _536 * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _616 = _612 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _618 = _614 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _620 = _592 * _604;
    float _622 = fma(_620, _596, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _624 = _622 * _606;
    float _626 = _534 * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _628 = fma(_610, (*spvDescriptorSet0.vp_c9)._m0[115].x, _624);
    float _630 = _626 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _632 = fma(_572, (*spvDescriptorSet0.vp_c9)._m0[116].x, _628);
    float _634 = _632 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    bool _636 = !_602;
    float _654;
    if (!_636)
    {
        float _638 = in.m_57.x;
        float _640 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].w;
        float _642 = _638 * (*spvDescriptorSet0.vp_c9)._m0[13].x;
        float _644 = fma(_642, (*spvDescriptorSet0.vp_c9)._m0[11].w, _144);
        float _646 = _644 * _640;
        float _648 = floor(_646);
        float _650 = -_648;
        float _652 = _646 + _650;
        _654 = _652;
        _656 = true;
    }
    else
    {
        _654 = _156;
    }
    _656 = false;
    float _658 = _654;
    float _660 = in.m_57.z;
    float _662 = _424 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _664 = in.m_57.y;
    int _666 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _668 = _666 != 0;
    float _670 = _662 * (*spvDescriptorSet0.vp_c13)._m0[2].y;
    float _672 = in.m_46.x;
    float _674 = in.m_46.y;
    float _676 = in.m_46.z;
    int _678 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _680 = _678 != 0;
    int _682 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _684 = _682 != 0;
    int _686 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _688 = _686 != 0;
    float _690 = _426 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _692 = in.m_57.x;
    float _694 = (*spvDescriptorSet0.vp_c8)._m0[0].y * (*spvDescriptorSet0.vp_c10)._m0[9].w;
    float _696 = _428 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _698 = fma((*spvDescriptorSet0.vp_c8)._m0[0].x, (*spvDescriptorSet0.vp_c10)._m0[8].w, _694);
    float _700 = -(*spvDescriptorSet0.vp_c9)._m0[194].y;
    float _702 = (*spvDescriptorSet0.vp_c9)._m0[194].z + _700;
    float _704 = -(*spvDescriptorSet0.vp_c9)._m0[193].w;
    float _706 = _704 + (*spvDescriptorSet0.vp_c9)._m0[194].x;
    float _708 = _660 * 2.0;
    float _710 = fma(_156, _706, (*spvDescriptorSet0.vp_c9)._m0[193].w);
    float _712 = _664 * 2.0;
    float _714 = _664 + _660;
    float _716 = floor(_708);
    float _718 = _674 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _720 = _674 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _722 = _674 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _724 = _714 + (-1.0);
    float _726 = fma(_672, (*spvDescriptorSet0.vp_c10)._m0[4].x, _718);
    float _728 = fma(_672, (*spvDescriptorSet0.vp_c10)._m0[5].x, _720);
    float _730 = floor(_712);
    float _732 = fma(_672, (*spvDescriptorSet0.vp_c10)._m0[6].x, _722);
    float _734 = _672;
    if (_668)
    {
        _734 = _692;
    }
    float _736 = _734;
    float _738 = fma(_676, (*spvDescriptorSet0.vp_c10)._m0[5].z, _728);
    float _740 = fma(_676, (*spvDescriptorSet0.vp_c10)._m0[4].z, _726);
    float _742 = _736;
    if (!_668)
    {
        _742 = _660;
    }
    float _744 = _742;
    float _746 = fma(_676, (*spvDescriptorSet0.vp_c10)._m0[6].z, _732);
    bool _748 = _716 > 0.0;
    float _750 = (*spvDescriptorSet0.vp_c9)._m0[87].x + (*spvDescriptorSet0.vp_c9)._m0[86].z;
    bool _752 = _716 >= 0.0;
    bool _754 = isnan(_716);
    bool _756 = _752 || _754;
    bool _758 = isnan(0.0);
    bool _760 = _756 || _758;
    float _762 = _744 * (*spvDescriptorSet0.vp_c9)._m0[87].x;
    float _764 = _660 + _692;
    float _766 = fma(_724, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    int _768 = _760 ? 0 : 1;
    float _770 = -_750;
    float _772 = fma(_762, 2.0, _770);
    bool _774 = _730 > 0.0;
    float _776 = _764 + (-1.0);
    bool _778 = _730 >= 0.0;
    bool _780 = isnan(_730);
    bool _782 = _778 || _780;
    bool _784 = isnan(0.0);
    bool _786 = _782 || _784;
    float _788 = _738 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _790 = _762;
    if (_668)
    {
        _790 = _664;
    }
    float _792 = _790;
    float _794 = _740 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    int _796 = ~_768;
    int _798 = _796 + 1;
    int _800 = _798 + 1;
    float _802 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _804 = _788 + _802;
    float _806 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _808 = _794 + _806;
    float _810 = _792;
    int _812 = _800;
    if (!_668)
    {
        _810 = _692;
    }
    float _814 = _810;
    float _816 = _804 * _804;
    if (!_748)
    {
        int _818 = ~_768;
        int _820 = _818 + 1;
        _812 = _820;
    }
    int _822 = _812;
    float _824 = (*spvDescriptorSet0.vp_c9)._m0[87].y + (*spvDescriptorSet0.vp_c9)._m0[86].w;
    float _826 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _828 = log2(_826);
    int _830 = _786 ? 0 : 1;
    float _832 = _814 * (*spvDescriptorSet0.vp_c9)._m0[87].y;
    float _834 = -_788;
    float _836 = _834 + (*spvDescriptorSet0.vp_c8)._m0[29].y;
    int _838 = ~_830;
    int _840 = _838 + 1;
    int _842 = _840 + 1;
    float _844 = fma((*spvDescriptorSet0.vp_c8)._m0[0].z, (*spvDescriptorSet0.vp_c10)._m0[10].w, _698);
    int _846 = _842;
    if (!_774)
    {
        int _848 = ~_830;
        int _850 = _848 + 1;
        _846 = _850;
    }
    int _852 = _846;
    float _854 = fma(_832, -2.0, _824);
    float _856 = _692 * 2.0;
    float _858 = fma(_776, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    bool _860 = !_680;
    int _862 = _860 ? 0 : 1;
    float _864 = _664 + _692;
    bool _866 = !_688;
    int _868 = _866 ? 0 : 1;
    float _870 = floor(_856);
    int _872 = abs(_862);
    float _874 = _864 + (-1.0);
    int _876 = abs(_868);
    float _878 = _828 * _144;
    float _880 = _844 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _882 = exp2(_878);
    float _884 = fma(_874, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    float _886 = float(_872);
    float _888 = float(_876);
    float _890 = float(_852);
    float _892 = float(_822);
    float _894 = _888 * _890;
    bool _896 = _870 > 0.0;
    float _898 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _900 = 1.0 + _898;
    bool _902 = _870 >= 0.0;
    bool _904 = isnan(_870);
    bool _906 = _902 || _904;
    bool _908 = isnan(0.0);
    bool _910 = _906 || _908;
    float _912 = _886 * _892;
    float _914 = in.m_61.x;
    float _916 = in.m_61.y;
    float _918 = in.m_61.z;
    bool _920 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _922 = isnan(1.0);
    bool _924 = _920 || _922;
    bool _926 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _928 = _924 || _926;
    float _930 = 1.0 / _900;
    float _932 = -_882;
    float _934 = _932 + 1.0;
    float _936 = (*spvDescriptorSet0.vp_c9)._m0[88].w + (*spvDescriptorSet0.vp_c9)._m0[88].y;
    float _938 = _894 * (-2.0);
    bool _940 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _942 = isnan(0.0);
    bool _944 = _940 || _942;
    bool _946 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _948 = _944 || _946;
    float _950 = fma(_664, (*spvDescriptorSet0.vp_c9)._m0[88].w, _936);
    float _952 = (*spvDescriptorSet0.vp_c9)._m0[88].z + (*spvDescriptorSet0.vp_c9)._m0[88].x;
    float _954 = _948 ? _934 : 0.0;
    float _956 = _746 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _958 = fma(_144, (*spvDescriptorSet0.vp_c9)._m0[87].w, _950);
    float _960 = fma(_692, (*spvDescriptorSet0.vp_c9)._m0[88].z, _952);
    float _962 = -_144;
    float _964 = fma(_962, (*spvDescriptorSet0.vp_c9)._m0[86].x, _772);
    float _966 = fma(_144, (*spvDescriptorSet0.vp_c9)._m0[86].y, _854);
    float _968 = fma(_808, _808, _816);
    float _970 = fma(_144, (*spvDescriptorSet0.vp_c9)._m0[87].z, _960);
    if (_928)
    {
        float _972 = _954 * _930;
        _166 = _972;
    }
    float _974 = _166;
    float _976 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _978 = _956 + _976;
    float _980 = _912 * (-2.0);
    int _982 = _910 ? 0 : 1;
    float _984 = _836 * _836;
    float _986 = fma(_978, _978, _968);
    float _988 = _692 + (-0.5);
    float _990 = fma(_980, _914, _914);
    bool _992 = !_684;
    int _994 = _992 ? 0 : 1;
    float _996 = sqrt(_986);
    int _998 = ~_982;
    int _1000 = _998 + 1;
    int _1002 = _1000 + 1;
    float _1004 = fma(_988, (*spvDescriptorSet0.vp_c9)._m0[196].x, _990);
    float _1006 = fma(_884, _980, _884);
    int _1008 = _1002;
    if (!_896)
    {
        int _1010 = ~_982;
        int _1012 = _1010 + 1;
        _1008 = _1012;
    }
    int _1014 = _1008;
    float _1016 = -_794;
    float _1018 = _1016 + (*spvDescriptorSet0.vp_c8)._m0[29].x;
    int _1020 = abs(_994);
    float _1022 = _660 + (-0.5);
    float _1024 = rsqrt(_986);
    float _1026 = float(_1014);
    float _1028 = -_956;
    float _1030 = _1028 + (*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1032 = float(_1020);
    float _1034 = fma(_1018, _1018, _984);
    float _1036 = fma(_1006, _974, _1004);
    float _1038 = _996 * (*spvDescriptorSet0.vp_c13)._m0[2].x;
    float _1040 = fma(_938, _918, _918);
    float _1042 = _1032 * _1026;
    float _1044 = _788 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1046 = fma(_1030, _1030, _1034);
    float _1048 = precise::min(_670, _1038);
    float _1050 = fma(_1022, (*spvDescriptorSet0.vp_c9)._m0[196].z, _1040);
    float _1052 = fma(_794, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1044);
    float _1054 = _1042 * (-2.0);
    float _1056 = fma(_858, _938, _858);
    float _1058 = _1024 * _1048;
    float _1060 = rsqrt(_1046);
    float _1062 = _1036 * 0.15915493667125701904296875;
    float _1064 = fma(_1054, _916, _916);
    float _1066 = _804 * _1058;
    float _1068 = _808 * _1058;
    float _1070 = fma(_956, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1052);
    float _1072 = _664 + (-0.5);
    float _1074 = -_1066;
    float _1076 = _804 + _1074;
    float _1078 = sqrt(_1046);
    float _1080 = -_1068;
    float _1082 = _808 + _1080;
    float _1084 = fma(_1056, _974, _1050);
    float _1086 = _1076 * _1076;
    float _1088 = fma(_1072, (*spvDescriptorSet0.vp_c9)._m0[196].y, _1064);
    float _1090 = _1084 * 0.15915493667125701904296875;
    float _1092 = fma(_1082, _1082, _1086);
    float _1094 = 1.0 / _702;
    float _1096 = fma(_766, _1054, _766);
    float _1098 = _978 * _1058;
    float _1100 = _1070 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1102 = fma(_1096, _974, _1088);
    float _1104 = -_1098;
    float _1106 = _978 + _1104;
    float _1108 = -_1100;
    float _1110 = _880 + _1108;
    bool _1112 = _1100 >= _880;
    bool _1114 = isnan(_1100);
    bool _1116 = _1112 || _1114;
    bool _1118 = isnan(_880);
    bool _1120 = _1116 || _1118;
    float _1122 = _1102 * 0.15915493667125701904296875;
    float _1124 = fma(_1106, _1106, _1092);
    float _1126 = (*spvDescriptorSet0.vp_c8)._m0[28].y * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _1128 = abs(_1110);
    float _1130 = precise::max(_1128, (*spvDescriptorSet0.vp_c9)._m0[194].y);
    float _1132 = _1062 * 6.283185482025146484375;
    float _1134 = sin(_1132);
    float _1136 = abs(_1078);
    float _1138 = precise::max(0.0, _1136);
    float _1140 = _1018 * _1060;
    float _1142 = precise::min(_1130, (*spvDescriptorSet0.vp_c9)._m0[194].z);
    float _1144 = fma((*spvDescriptorSet0.vp_c8)._m0[28].x, (*spvDescriptorSet0.vp_c8)._m0[28].x, _1126);
    float _1146 = _1030 * _1060;
    float _1148 = precise::min(_1138, 40.0);
    float _1150 = sqrt(_1124);
    float _1152 = -(*spvDescriptorSet0.vp_c9)._m0[194].y;
    float _1154 = _1142 + _1152;
    bool _1156 = !_1120;
    float _1158 = _1156 ? 1.0 : (-1.0);
    float _1160 = -(*spvDescriptorSet0.vp_c8)._m0[1].z;
    float _1162 = _1140 * _1160;
    float _1164 = fma((*spvDescriptorSet0.vp_c8)._m0[28].z, (*spvDescriptorSet0.vp_c8)._m0[28].z, _1144);
    float _1166 = _1154 * _1094;
    float _1168 = _836 * _1060;
    float _1170 = fma(_1148, -0.02500000037252902984619140625, 1.0);
    float _1172 = _1062 * 6.283185482025146484375;
    float _1174 = cos(_1172);
    float _1176 = -(*spvDescriptorSet0.vp_c8)._m0[1].x;
    float _1178 = -_1162;
    float _1180 = fma(_1146, _1176, _1178);
    float _1182 = _1158 * _1166;
    float _1184 = _156 * (*spvDescriptorSet0.vp_c9)._m0[194].w;
    float _1186 = -(*spvDescriptorSet0.vp_c8)._m0[1].x;
    float _1188 = _1168 * _1186;
    float _1190 = _1180 * _1180;
    float _1192 = _1184 * _1182;
    float _1194 = _1090 * 6.283185482025146484375;
    float _1196 = cos(_1194);
    float _1198 = _1024 * _1150;
    float _1200 = -(*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1202 = _1146 * _1200;
    float _1204 = in.m_63.x;
    float _1206 = in.m_63.y;
    float _1208 = in.m_63.z;
    float _1210 = _1192 * 0.15915493667125701904296875;
    float _1212 = _662 * _1198;
    float _1214 = -(*spvDescriptorSet0.vp_c8)._m0[1].z;
    float _1216 = -_1202;
    float _1218 = fma(_1168, _1214, _1216);
    float _1220 = _696 * _1198;
    float _1222 = _1122 * 6.283185482025146484375;
    float _1224 = cos(_1222);
    float _1226 = fma(_1218, _1218, _1190);
    float _1228 = _1122 * 6.283185482025146484375;
    float _1230 = sin(_1228);
    float _1232 = _1134 * _1196;
    float _1234 = _1174 * _1224;
    float _1236 = _1134 * _1224;
    float _1238 = _1224 * _1196;
    float _1240 = -(*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1242 = -_1188;
    float _1244 = fma(_1140, _1240, _1242);
    float _1246 = _1090 * 6.283185482025146484375;
    float _1248 = sin(_1246);
    float _1250 = _1174 * _1196;
    float _1252 = fma(_1244, _1244, _1226);
    float _1254 = _1134 * _1230;
    float _1256 = _1174 * _1230;
    float _1258 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _1206);
    float _1260 = _1230 * _1196;
    float _1262 = rsqrt(_1164);
    float _1264 = _690 * _1198;
    float _1266 = _1264 * _1258;
    float _1268 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _1208);
    float _1270 = rsqrt(_1252);
    float _1272 = fma(_1248, _1234, _1254);
    float _1274 = fma(_1248, _1254, _1234);
    float _1276 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _1204);
    float _1278 = -_1256;
    float _1280 = fma(_1248, _1236, _1278);
    float _1282 = -_1236;
    float _1284 = fma(_1248, _1256, _1282);
    float _1286 = -_1266;
    float _1288 = _1248 * _1286;
    float _1290 = _1212 * _1276;
    float _1292 = _1250 * _1266;
    float _1294 = _1232 * _1266;
    float _1296 = _1220 * _1268;
    float _1298 = fma(_1238, _1290, _1288);
    float _1300 = fma(_1272, _1290, _1292);
    float _1302 = fma(_1280, _1290, _1294);
    float _1304 = _1262 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _1306 = fma(_1260, _1296, _1298);
    float _1308 = _1244 * _1270;
    float _1310 = _1218 * _1270;
    float _1312 = _1180 * _1270;
    float _1314 = fma(_1284, _1296, _1300);
    float _1316 = _1140 * _1308;
    float _1318 = fma(_1274, _1296, _1302);
    float _1320 = _1146 * _1312;
    float _1322 = _1168 * _1310;
    float _1324 = -_1316;
    float _1326 = fma(_1146, _1310, _1324);
    float _1328 = _1262 * (*spvDescriptorSet0.vp_c8)._m0[28].x;
    float _1330 = -_1320;
    float _1332 = fma(_1168, _1308, _1330);
    float _1334 = -_1322;
    float _1336 = fma(_1140, _1312, _1334);
    float _1338 = _1326 * _1314;
    float _1340 = _1304 * _1304;
    float _1342 = _1332 * _1314;
    float _1344 = _1336 * _1314;
    float _1346 = fma(_1312, _1306, _1338);
    float _1348 = _1262 * (*spvDescriptorSet0.vp_c8)._m0[28].z;
    float _1350 = fma(_1310, _1306, _1342);
    float _1352 = fma(_1308, _1306, _1344);
    float _1354 = fma(_1168, _1318, _1346);
    float _1356 = fma(_1328, _1328, _1340);
    float _1358 = fma(_1140, _1318, _1350);
    float _1360 = _788 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1362 = _788 + _1354;
    float _1364 = fma(_1146, _1318, _1352);
    float _1366 = _794 + _1358;
    float _1368 = fma(_1348, _1348, _1356);
    float _1370 = _1362 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1372 = _1362 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1374 = _1362 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1376 = fma(_794, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1360);
    float _1378 = fma(_1366, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1370);
    float _1380 = fma(_1366, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1372);
    float _1382 = _956 + _1364;
    float _1384 = fma(_1366, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1374);
    float _1386 = rsqrt(_1368);
    float _1388 = fma(_956, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1376);
    float _1390 = fma(_1382, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1380);
    float _1392 = fma(_1382, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1384);
    float _1394 = fma(_1382, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1378);
    float _1396 = _1388 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1398 = _1390 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1400 = _1392 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1402 = _1210 * 6.283185482025146484375;
    float _1404 = cos(_1402);
    float _1406 = _1394 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1408 = -_1398;
    float _1410 = _1408 + _1396;
    float _1412 = _1400 * (*spvDescriptorSet0.vp_c8)._m0[12].y;
    float _1414 = _1400 * (*spvDescriptorSet0.vp_c8)._m0[13].y;
    float _1416 = _1400 * (*spvDescriptorSet0.vp_c8)._m0[14].y;
    float _1418 = fma(_1170, _1410, _1398);
    float _1420 = fma(_1406, (*spvDescriptorSet0.vp_c8)._m0[12].x, _1412);
    float _1422 = _1210 * 6.283185482025146484375;
    float _1424 = sin(_1422);
    float _1426 = fma(_1406, (*spvDescriptorSet0.vp_c8)._m0[13].x, _1414);
    float _1428 = fma(_1406, (*spvDescriptorSet0.vp_c8)._m0[14].x, _1416);
    float _1430 = _1348 * _1386;
    float _1432 = fma(_1418, (*spvDescriptorSet0.vp_c8)._m0[12].z, _1420);
    float _1434 = fma(_1418, (*spvDescriptorSet0.vp_c8)._m0[13].z, _1426);
    float _1436 = fma(_1418, (*spvDescriptorSet0.vp_c8)._m0[14].z, _1428);
    float _1438 = _1430 * _1430;
    float _1440 = -_1404;
    float _1442 = _1440 + 1.0;
    float _1444 = _1328 * _1386;
    float _1446 = _1304 * _1386;
    float _1448 = _1432 + (*spvDescriptorSet0.vp_c8)._m0[12].w;
    float _1450 = fma(_1442, _1438, _1404);
    float _1452 = _1434 + (*spvDescriptorSet0.vp_c8)._m0[13].w;
    float _1454 = _1446 * _1442;
    float _1456 = _1444 * _1442;
    float _1458 = _1444 * _1424;
    float _1460 = _1446 * _1424;
    float _1462 = _1430 * _1424;
    float _1464 = -_788;
    float _1466 = _1464 + _1452;
    float _1468 = fma(_1430, _1454, _1458);
    float _1470 = -_1460;
    float _1472 = fma(_1430, _1456, _1470);
    float _1474 = -_1462;
    float _1476 = fma(_1446, _1456, _1474);
    float _1478 = -_794;
    float _1480 = _1478 + _1448;
    float _1482 = _1468 * _1466;
    float _1484 = _1436 + (*spvDescriptorSet0.vp_c8)._m0[14].w;
    float _1486 = fma(_1444, _1456, _1404);
    float _1488 = _1476 * _1466;
    float _1490 = fma(_1472, _1480, _1482);
    float _1492 = -_956;
    float _1494 = _1492 + _1484;
    float _1496 = fma(_1430, _1456, _1460);
    float _1498 = fma(_1486, _1480, _1488);
    float _1500 = fma(_1446, _1454, _1404);
    float _1502 = fma(_1450, _1494, _1490);
    float _1504 = fma(_1446, _1456, _1462);
    float _1506 = fma(_1496, _1494, _1498);
    float _1508 = _1500 * _1466;
    float _1510 = fma(_1502, _710, _956);
    float _1512 = -_1458;
    float _1514 = fma(_1430, _1454, _1512);
    float _1516 = fma(_1506, _710, _794);
    float _1518 = fma(_1504, _1480, _1508);
    float _1520 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1522 = _1510 + _1520;
    float _1524 = -_1066;
    float _1526 = _788 + _1524;
    float _1528 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1530 = _1516 + _1528;
    float _1532 = fma(_1514, _1494, _1518);
    float _1534 = _1522 * _1522;
    float _1536 = _1526 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _1538 = -_1098;
    float _1540 = _956 + _1538;
    float _1542 = _788 + _1532;
    float _1544 = fma(_1530, _1530, _1534);
    float _1546 = -_1068;
    float _1548 = _794 + _1546;
    float _1550 = sqrt(_1544);
    float _1552 = fma(_1548, (*spvDescriptorSet0.vp_c8)._m0[11].x, _1536);
    float _1554 = fma(_1540, (*spvDescriptorSet0.vp_c8)._m0[11].z, _1552);
    bool _1556 = _1550 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1558 = _1446;
    float _1560 = _1532;
    float _1562 = _1518;
    float _1564 = _1554;
    float _1566 = _1516;
    if (!_1556)
    {
        _1558 = _1516;
    }
    float _1568 = _1558;
    float _1570 = _1568;
    if (!_1556)
    {
        _1560 = _1510;
    }
    float _1572 = _1560;
    float _1574 = _1572;
    if (!_1556)
    {
        _1562 = _1542;
    }
    float _1576 = _1562;
    bool _1578 = !_1556;
    float _1580 = _1576;
    if (!_1578)
    {
        float _1582 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1584 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1586 = _1550 + _1584;
        float _1588 = _1542 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1590 = rsqrt(_1544);
        float _1592 = _1586 * _1582;
        float _1594 = _1592 * 0.15915493667125701904296875;
        float _1596 = _1594 * 6.283185482025146484375;
        float _1598 = cos(_1596);
        float _1600 = _1594 * 6.283185482025146484375;
        float _1602 = sin(_1600);
        float _1604 = _1598 + (-1.0);
        float _1606 = _1604 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1608 = fma(_1602, _1588, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1610 = fma(_1542, _1598, _1606);
        float _1612 = _1590 * _1608;
        float _1614 = fma(_1530, _1612, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1616 = fma(_1522, _1612, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _1580 = _1610;
        _1570 = _1614;
        _1574 = _1616;
    }
    float _1618 = _1580;
    float _1620 = _1570;
    float _1622 = _1574;
    float _1624 = -_788;
    float _1626 = _1624 + _1618;
    float _1628 = -_794;
    float _1630 = _1628 + _1620;
    float _1632 = _1554 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _1634 = _1526 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _1636 = _1626 * _1626;
    float _1638 = -_956;
    float _1640 = _1638 + _1622;
    float _1642 = 1.0 / _1632;
    float _1644 = fma(_1548, (*spvDescriptorSet0.vp_c8)._m0[10].x, _1634);
    float _1646 = fma(_1630, _1630, _1636);
    float _1648 = -_1066;
    float _1650 = _1648 + _1618;
    float _1652 = fma(_1540, (*spvDescriptorSet0.vp_c8)._m0[10].z, _1644);
    float _1654 = fma(_1640, _1640, _1646);
    bool _1656 = (*spvDescriptorSet0.vp_c15)._m0[653].w >= 0.5;
    bool _1658 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _1660 = _1656 || _1658;
    bool _1662 = isnan(0.5);
    bool _1664 = _1660 || _1662;
    float _1666 = -_1098;
    float _1668 = _1666 + _1622;
    float _1670 = _1652 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _1672 = sqrt(_1654);
    float _1674 = _1670 + _1632;
    float _1676 = _1674 * _1642;
    float _1678 = _1676 * 0.5;
    float _1680 = -_1068;
    float _1682 = _1680 + _1620;
    float _1684 = _1622;
    float _1686 = _1618;
    float _1688 = _1620;
    float _1690 = (*spvDescriptorSet0.vp_c8)._m0[30].w;
    float _1692 = _1682;
    float _1694 = _1668;
    if (_1664)
    {
        _1564 = 1.0;
    }
    float _1696 = _1564;
    float _1698 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _1700 = fma(_1678, (*spvDescriptorSet0.vp_c8)._m0[30].w, _1698);
    float _1702 = 1.0 / _1700;
    bool _1704 = _1672 > 0.0;
    float _1706 = _1696;
    if (!_1704)
    {
        _1684 = _1682;
    }
    float _1708 = _1684;
    float _1710 = _1708;
    if (!_1704)
    {
        _1686 = _1650;
    }
    float _1712 = _1686;
    float _1714 = _1712;
    if (!_1704)
    {
        _1688 = _1668;
    }
    float _1716 = _1688;
    bool _1718 = !_1704;
    float _1720 = _1716;
    float _1722 = _1716;
    if (!_1718)
    {
        float _1724 = _198 * _198;
        float _1726 = fma(_196, _196, _1724);
        float _1728 = rsqrt(_1654);
        float _1730 = fma(_200, _200, _1726);
        float _1732 = sqrt(_1730);
        float _1734 = _1630 * _1728;
        float _1736 = _1626 * _1728;
        float _1738 = _1640 * _1728;
        bool _1740 = _1732 > 0.0;
        float _1742 = _1728;
        float _1744 = _1732;
        _1690 = _1736;
        if (!_1740)
        {
            _1742 = _1682;
        }
        float _1746 = _1742;
        _1710 = _1746;
        if (!_1740)
        {
            _1744 = _1650;
        }
        float _1748 = _1744;
        _1714 = _1748;
        if (!_1740)
        {
            _1720 = _1668;
        }
        float _1750 = _1720;
        bool _1752 = !_1740;
        _1722 = _1750;
        if (!_1752)
        {
            float _1754 = rsqrt(_1730);
            float _1756 = 1.0 / (*spvDescriptorSet0.vp_c10)._m0[2].z;
            float _1758 = _198 * _1754;
            float _1760 = _196 * _1754;
            float _1762 = _1736 * _1758;
            float _1764 = _200 * _1754;
            float _1766 = fma(_1734, _1760, _1762);
            float _1768 = _1756 * (*spvDescriptorSet0.vp_c9)._m0[142].x;
            float _1770 = fma(_1738, _1764, _1766);
            float _1772 = _1770 * _1768;
            float _1774 = fma(_196, _1772, _1682);
            float _1776 = fma(_198, _1772, _1650);
            float _1778 = fma(_200, _1772, _1668);
            _1714 = _1776;
            _1710 = _1774;
            _1722 = _1778;
        }
    }
    float _1780 = _1714;
    float _1782 = _1710;
    float _1784 = _1722;
    float _1786 = _1690;
    float _1788 = _1786;
    if (_1664)
    {
        _1788 = 1.0;
    }
    float _1790 = _1788;
    float _1792 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _1794 = _1702 * _1792;
    float _1796 = _1790;
    if (!_1664)
    {
        float _1798 = (*spvDescriptorSet0.vp_c8)._m0[31].x * 0.5;
        float _1800 = _1798 * 0.15915493667125701904296875;
        float _1802 = _1800 * 6.283185482025146484375;
        float _1804 = cos(_1802);
        float _1806 = (*spvDescriptorSet0.vp_c8)._m0[31].y * 0.5;
        float _1808 = _1806 * 0.15915493667125701904296875;
        float _1810 = _1800 * 6.283185482025146484375;
        float _1812 = sin(_1810);
        float _1814 = 1.0 / _1804;
        float _1816 = _1808 * 6.283185482025146484375;
        float _1818 = cos(_1816);
        float _1820 = _1812 * _1814;
        float _1822 = _1808 * 6.283185482025146484375;
        float _1824 = sin(_1822);
        float _1826 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1828 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _1826;
        float _1830 = _1818 * _1820;
        float _1832 = 1.0 / _1828;
        float _1834 = 1.0 / _1830;
        float _1836 = _1824 * _1834;
        float _1838 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1840 = fma(_1794, _1836, _1838);
        float _1842 = _1840 * _1832;
        float _1844 = precise::clamp(_1842, 0.0, 1.0);
        _1692 = _1820;
        _1694 = _1800;
        _1706 = _1844;
    }
    float _1846 = _1692;
    float _1848 = _1694;
    float _1850 = _1706;
    float _1852 = _1846;
    float _1854 = _1848;
    if (!_1664)
    {
        float _1856 = (*spvDescriptorSet0.vp_c8)._m0[31].x * 0.5;
        float _1858 = _1856 * 0.15915493667125701904296875;
        float _1860 = _1858 * 6.283185482025146484375;
        float _1862 = cos(_1860);
        float _1864 = (*spvDescriptorSet0.vp_c8)._m0[31].y * 0.5;
        float _1866 = _1864 * 0.15915493667125701904296875;
        float _1868 = _1858 * 6.283185482025146484375;
        float _1870 = sin(_1868);
        float _1872 = 1.0 / _1862;
        float _1874 = _1866 * 6.283185482025146484375;
        float _1876 = cos(_1874);
        float _1878 = _1870 * _1872;
        float _1880 = _1866 * 6.283185482025146484375;
        float _1882 = sin(_1880);
        float _1884 = _1876 * _1878;
        float _1886 = 1.0 / _1884;
        float _1888 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _1890 = (*spvDescriptorSet0.vp_c9)._m0[140].w + _1888;
        float _1892 = 1.0 / _1890;
        float _1894 = _1882 * _1886;
        float _1896 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _1898 = fma(_1794, _1894, _1896);
        float _1900 = _1898 * _1892;
        float _1902 = precise::clamp(_1900, 0.0, 1.0);
        float _1904 = -_1902;
        float _1906 = _1904 + 1.0;
        _1852 = _1872;
        _1796 = _1906;
    }
    float _1908 = _1852;
    float _1910 = _1796;
    float _1912 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1914 = _1780 + _1912;
    float _1916 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1918 = _1782 + _1916;
    float _1920 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1922 = _1784 + _1920;
    float _1924 = _1914 * _1914;
    float _1926 = fma(_1918, _1918, _1924);
    float _1928 = fma(_1922, _1922, _1926);
    float _1930 = rsqrt(_1928);
    float _1932 = sqrt(_1928);
    float _1934 = _1930 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1936 = _1918 * _1934;
    float _1938 = _1922 * _1934;
    float _1940 = _1936 * _1936;
    float _1942 = _1938 * _1938;
    float _1944 = _1940 + _1942;
    float _1946 = sqrt(_1944);
    bool _1948 = _1946 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1950 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1952 = _1946 + _1950;
    float _1954 = _1922;
    float _1956 = _1924;
    float _1958 = _1952;
    float _1960 = _1914;
    float _1962 = _1908;
    if (_1948)
    {
        float _1964 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1954 = _1964;
    }
    float _1966 = _1954;
    if (_1948)
    {
        float _1968 = rsqrt(_1944);
        _1956 = _1968;
    }
    float _1970 = _1956;
    float _1972 = _1970;
    if (_1948)
    {
        float _1974 = _1952 * _1966;
        _1958 = _1974;
    }
    float _1976 = _1958;
    if (_1948)
    {
        float _1978 = _1976 * 0.15915493667125701904296875;
        _1854 = _1978;
    }
    float _1980 = _1854;
    float _1982 = _1930;
    float _1984 = _1980;
    if (_1948)
    {
        float _1986 = _1980 * 6.283185482025146484375;
        float _1988 = sin(_1986);
        _1982 = _1988;
    }
    float _1990 = _1982;
    float _1992 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _1994 = precise::max(0.0, _1992);
    float _1996 = _1966;
    float _1998 = _1994;
    if (_1948)
    {
        float _2000 = _1980 * 6.283185482025146484375;
        float _2002 = cos(_2000);
        _1996 = _2002;
    }
    float _2004 = _1996;
    float _2006 = -_1934;
    float _2008 = -_1994;
    float _2010 = fma(_1914, _2006, _2008);
    if (_1948)
    {
        float _2012 = _2010 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1960 = _2012;
    }
    float _2014 = _1960;
    if (!_1948)
    {
        _1984 = _1940;
    }
    float _2016 = _1984;
    float _2018 = _1990;
    float _2020 = _2016;
    if (_1948)
    {
        float _2022 = fma(_1990, _2014, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1962 = _2022;
    }
    float _2024 = _1962;
    float _2026 = _2024;
    if (!_1948)
    {
        _2018 = _2010;
    }
    float _2028 = _2018;
    float _2030 = _2028;
    float _2032 = _2004;
    if (_1948)
    {
        float _2034 = _2004 + (-1.0);
        _1998 = _2034;
    }
    float _2036 = _1998;
    float _2038 = _2036;
    if (_1948)
    {
        float _2040 = _1970 * _2024;
        _1566 = _2040;
    }
    float _2042 = _1566;
    if (!_1948)
    {
        _1972 = _1936;
    }
    float _2044 = _1972;
    float _2046 = _2044;
    if (_1948)
    {
        float _2048 = _2036 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2038 = _2048;
    }
    float _2050 = _2038;
    if (_1948)
    {
        float _2052 = _1936 * _2042;
        _2046 = _2052;
    }
    float _2054 = _2046;
    if (!_1948)
    {
        _2026 = _1942;
    }
    float _2056 = _2026;
    float _2058 = fma(_1548, (*spvDescriptorSet0.vp_c15)._m0[652].x, (*spvDescriptorSet0.vp_c15)._m0[652].z);
    float _2060 = _2056;
    if (_1948)
    {
        float _2062 = fma(_2010, _2004, _2050);
        _2030 = _2062;
    }
    float _2064 = _2030;
    if (_1948)
    {
        float _2066 = _2054 * _2054;
        _2020 = _2066;
    }
    float _2068 = _2020;
    if (!_1948)
    {
        _2032 = _1938;
    }
    float _2070 = _2032;
    float _2072 = _2070;
    if (_1948)
    {
        float _2074 = _1938 * _2042;
        _2072 = _2074;
    }
    float _2076 = _2072;
    float _2078 = fma(_2064, _2064, _2068);
    float _2080 = _1780 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    if (_1948)
    {
        float _2082 = _2076 * _2076;
        _2060 = _2082;
    }
    float _2084 = _2060;
    float _2086 = floor(_2058);
    float _2088 = fma(_1782, (*spvDescriptorSet0.vp_c8)._m0[2].x, _2080);
    float _2090 = _2078 + _2084;
    float _2092 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _2094 = fma(_1932, (*spvDescriptorSet0.vp_c15)._m0[23].w, _2092);
    float _2096 = precise::clamp(_2094, 0.0, 1.0);
    float _2098 = fma(_1784, (*spvDescriptorSet0.vp_c8)._m0[2].z, _2088);
    float _2100 = -_2096;
    float _2102 = _2100 + 1.0;
    float _2104 = rsqrt(_2090);
    float _2106 = _2098 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _2108 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _2110 = fma(_1540, (*spvDescriptorSet0.vp_c15)._m0[652].y, (*spvDescriptorSet0.vp_c15)._m0[652].w);
    float _2112 = _1780 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _2114 = _2106 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _2116 = abs(_2102);
    float _2118 = log2(_2116);
    float _2120 = _1780 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _2122 = -_2114;
    float _2124 = fma(_2122, _2108, 1.0);
    float _2126 = _1780 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _2128 = fma(_1782, (*spvDescriptorSet0.vp_c8)._m0[3].x, _2112);
    float _2130 = fma(_1782, (*spvDescriptorSet0.vp_c8)._m0[1].x, _2120);
    float _2132 = -_2086;
    float _2134 = _2058 + _2132;
    float _2136 = fma(_1782, (*spvDescriptorSet0.vp_c8)._m0[0].x, _2126);
    float _2138 = _2104 * _2054;
    float _2140 = fma(_1784, (*spvDescriptorSet0.vp_c8)._m0[1].z, _2130);
    float _2142 = _2104 * _2064;
    float _2144 = fma(_1784, (*spvDescriptorSet0.vp_c8)._m0[0].z, _2136);
    float _2146 = _2104 * _2076;
    float _2148 = _2140 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _2150 = _2138 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _2152 = _2144 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _2154 = floor(_2110);
    float _2156 = _2148 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _2158 = -_2150;
    float _2160 = fma(_2142, (*spvDescriptorSet0.vp_c15)._m0[21].y, _2158);
    float _2162 = fma(_1784, (*spvDescriptorSet0.vp_c8)._m0[3].z, _2128);
    float _2164 = _2118 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _2166 = fma(_2152, (*spvDescriptorSet0.vp_c8)._m0[7].x, _2156);
    float _2168 = -_2146;
    float _2170 = fma(_2168, (*spvDescriptorSet0.vp_c15)._m0[21].z, _2160);
    float _2172 = _2162 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _2174 = fma(_2106, (*spvDescriptorSet0.vp_c8)._m0[7].z, _2166);
    float _2176 = fma(_2170, -0.5, 0.5);
    float _2178 = fma(_2170, 0.5, 0.5);
    float _2180 = exp2(_2164);
    float _2182 = fma(_2172, (*spvDescriptorSet0.vp_c8)._m0[7].w, _2174);
    float _2184 = _2148 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _2186 = _2148 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _2188 = -_2154;
    float _2190 = _2110 + _2188;
    float _2192 = fma(_2178, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _2194 = fma(_2152, (*spvDescriptorSet0.vp_c8)._m0[4].x, _2184);
    float _2196 = fma(_2152, (*spvDescriptorSet0.vp_c8)._m0[5].x, _2186);
    float _2198 = 1.0 / _2182;
    float _2200 = fma(_2178, _2192, -0.212114393711090087890625);
    float _2202 = fma(_2106, (*spvDescriptorSet0.vp_c8)._m0[4].z, _2194);
    float _2204 = fma(_2106, (*spvDescriptorSet0.vp_c8)._m0[5].z, _2196);
    float _2206 = log2(_2124);
    float _2208 = fma(_2172, (*spvDescriptorSet0.vp_c8)._m0[4].w, _2202);
    float _2210 = fma(_2172, (*spvDescriptorSet0.vp_c8)._m0[5].w, _2204);
    float _2212 = sqrt(_2176);
    float _2214 = _2208 * _2198;
    float2 _6663 = float2(_2134, _2190);
    float _2216 = dm_bs(spvDescriptorSet0.vp_t_tcb_24.sample(spvDescriptorSet0.vp_t_tcb_24Smplr, select(_6663, float2(0.0), isnan(_6663)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_24, spvDescriptorSet0.vp_t_tcb_24Smplr_w, select(_6663, float2(0.0), isnan(_6663)), level(0.0)).x;
    float _2218 = fma(_2178, _2200, 1.570728778839111328125);
    float _2220 = _2206 * 0.693147182464599609375;
    float _2222 = _2142 + 1.0;
    float _2224 = _2220 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _2226 = -_2142;
    float _2228 = fma(_2180, _2222, _2226);
    float _2230 = _2210 * _2198;
    float _2232 = fma(_2214, 0.5, 0.5);
    float _2234 = _2212 * 0.636619746685028076171875;
    float _2236 = fma(_2228, 0.5, 0.5);
    float _2238 = fma(_2230, -0.5, 0.5);
    float _2240 = -_2218;
    float _2242 = fma(_2234, _2240, 1.0);
    float3 _6710 = float3(_2232, _2238, _2224);
    float _2244 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_6710, float3(0.0), isnan(_6710)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_6710, float3(0.0), isnan(_6710)), level(0.0)).x;
    float3 _6721 = float3(_2232, _2238, _2224);
    float4 _2247 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_6721, float3(0.0), isnan(_6721)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_6721, float3(0.0), isnan(_6721)), level(0.0)).xyzw;
    float _2249 = _2247.x;
    float _2251 = _2247.y;
    float _2253 = _2247.z;
    float _2255 = _2247.w;
    float2 _6737 = float2(_2242, _2236);
    float3 _2259 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_6737, float2(0.0), isnan(_6737)), level(0.0)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_6737, float2(0.0), isnan(_6737)), level(0.0)).xyz;
    float _2261 = _2259.x;
    float _2263 = _2259.y;
    float _2265 = _2259.z;
    float _2267 = in.m_57.w;
    float _2269 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].z;
    float _2271 = in.m_65.y;
    bool _2273 = _660 > 0.5;
    float _2275 = _2118 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    bool _2277 = _664 > 0.5;
    float _2279 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _2281 = _2279 + (*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _2283 = -(*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _2285 = _2283 + (*spvDescriptorSet0.vp_c9)._m0[133].w;
    float _2287 = in.m_65.x;
    float _2289 = 1.0 / _2281;
    float _2291 = _2148 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _2293 = -(*spvDescriptorSet0.vp_c9)._m0[133].w;
    float _2295 = _2293 + (*spvDescriptorSet0.vp_c9)._m0[134].w;
    out.m_67.x = _616;
    out.m_67.y = _630;
    out.m_67.z = _618;
    out.m_67.w = _634;
    float _2297 = fma(_2152, (*spvDescriptorSet0.vp_c8)._m0[6].x, _2291);
    float _2299 = 1.0 / _2285;
    out.m_69.w = _1048;
    float _2301 = fma(_2106, (*spvDescriptorSet0.vp_c8)._m0[6].z, _2297);
    bool _2303 = _2267 > 0.5;
    out.m_71.x = _1548;
    out.m_71.y = _1526;
    out.m_71.z = _1540;
    float _2305 = -_2271;
    float _2307 = _2305 + 1.0;
    float _2309 = 1.0 / _2295;
    int _2311 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _2313 = _2311 != 0;
    float _2315 = -(*spvDescriptorSet0.vp_c9)._m0[132].x;
    float _2317 = _2315 + (*spvDescriptorSet0.vp_c9)._m0[133].x;
    int _2319 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _2321 = _2319 != 0;
    float _2323 = -(*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _2325 = _658 + _2323;
    int _2327 = _2277 ? as_type<int>(_2307) : as_type<int>(_2271);
    float _2329 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _2331 = _658 + _2329;
    float _2333 = _2317 * _2299;
    int _2335 = _2303 ? as_type<int>(_2307) : as_type<int>(_2271);
    float _2337 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].w;
    float _2339 = _2321 ? as_type<float>(_2327) : _2271;
    float _2341 = -(*spvDescriptorSet0.vp_c9)._m0[131].x;
    float _2343 = (*spvDescriptorSet0.vp_c9)._m0[132].x + _2341;
    int _2345 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 32;
    bool _2347 = _2345 != 0;
    float _2349 = _1272 * _1326;
    float _2351 = _2299;
    float _2353 = _2289;
    float _2355 = _2271;
    float _2357 = _2208;
    if (!_2313)
    {
        _2351 = _2287;
    }
    float _2359 = _2351;
    float _2361 = _2343 * _2289;
    bool _2363 = _658 >= (*spvDescriptorSet0.vp_c9)._m0[134].w;
    bool _2365 = isnan(_658);
    bool _2367 = _2363 || _2365;
    bool _2369 = isnan((*spvDescriptorSet0.vp_c9)._m0[134].w);
    bool _2371 = _2367 || _2369;
    float _2373 = float(_2371);
    float _2375 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _2377 = fma(_2361, _2331, (*spvDescriptorSet0.vp_c9)._m0[131].x);
    int _2379 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _2381 = _2379 != 0;
    float _2383 = _1272 * _1336;
    int _2385 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 16;
    bool _2387 = _2385 != 0;
    float _2389 = -(*spvDescriptorSet0.vp_c9)._m0[133].x;
    float _2391 = (*spvDescriptorSet0.vp_c9)._m0[134].x + _2389;
    int _2393 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _2395 = _2393 != 0;
    float _2397 = fma(_2333, _2325, (*spvDescriptorSet0.vp_c9)._m0[132].x);
    float _2399 = _2359;
    bool _2401 = _2395;
    if (!_2313)
    {
        _2353 = _2359;
    }
    float _2403 = _2353;
    float _2405 = _2391 * _2309;
    float _2407 = _2403;
    if (_2313)
    {
        _2399 = _2287;
    }
    float _2409 = _2399;
    float _2411 = -_2373;
    float _2413 = _2411 + 1.0;
    bool _2415 = _658 >= (*spvDescriptorSet0.vp_c9)._m0[133].w;
    bool _2417 = isnan(_658);
    bool _2419 = _2415 || _2417;
    bool _2421 = isnan((*spvDescriptorSet0.vp_c9)._m0[133].w);
    bool _2423 = _2419 || _2421;
    float _2425 = float(_2423);
    float _2427 = _2337 * (*spvDescriptorSet0.vp_c9)._m0[90].y;
    bool _2429 = _658 >= (*spvDescriptorSet0.vp_c9)._m0[132].w;
    bool _2431 = isnan(_658);
    bool _2433 = _2429 || _2431;
    bool _2435 = isnan((*spvDescriptorSet0.vp_c9)._m0[132].w);
    bool _2437 = _2433 || _2435;
    float _2439 = float(_2437);
    int _2441 = 0;
    float _2443 = _2409;
    if (_2381)
    {
        float _2445 = -_2409;
        float _2447 = _2445 + 1.0;
        _2441 = as_type<int>(_2447);
    }
    int _2449 = _2441;
    float _2451 = _2395 ? as_type<float>(_2335) : _2271;
    float _2453 = _2425 * _2413;
    float _2455 = -_2425;
    float _2457 = _2455 + 1.0;
    int _2459 = as_type<int>(_2457);
    float _2461 = as_type<float>(_2449);
    if (_2313)
    {
        bool _2463 = _692 > 0.5;
        _2401 = _2463;
    }
    bool _2465 = _2401;
    int _2467 = 0;
    if (_2387)
    {
        float _2469 = -_2409;
        float _2471 = _2469 + 1.0;
        _2467 = as_type<int>(_2471);
    }
    int _2473 = _2467;
    float _2475 = in.m_73.x;
    float _2477 = in.m_73.y;
    float _2479 = in.m_73.z;
    if (_2347)
    {
        float _2481 = _2273 ? _2307 : _2271;
        _2355 = _2481;
    }
    float _2483 = _2355;
    float _2485 = _2439 * _2457;
    bool _2487 = _658 >= (*spvDescriptorSet0.vp_c9)._m0[131].w;
    bool _2489 = isnan(_658);
    bool _2491 = _2487 || _2489;
    bool _2493 = isnan((*spvDescriptorSet0.vp_c9)._m0[131].w);
    bool _2495 = _2491 || _2493;
    float _2497 = float(_2495);
    float _2499 = -_2439;
    float _2501 = _2499 + 1.0;
    bool _2503 = _1206 != 0.0;
    bool _2505 = isnan(_1206);
    bool _2507 = _2503 || _2505;
    bool _2509 = isnan(0.0);
    bool _2511 = _2507 || _2509;
    float _2513 = _2483;
    if (_2313)
    {
        float _2515 = -_2409;
        float _2517 = _2515 + 1.0;
        _2459 = as_type<int>(_2517);
    }
    int _2519 = _2459;
    float _2521 = -(*spvDescriptorSet0.vp_c9)._m0[133].w;
    float _2523 = _658 + _2521;
    float _2525 = _2497 * _2501;
    bool _2527 = _1204 == 0.0;
    bool _2529 = !_2511;
    bool _2531 = _2527 && _2529;
    float _2533 = -_2497;
    float _2535 = _2533 + 1.0;
    float _2537 = _2535;
    if (_2313)
    {
        float _2539 = _2465 ? as_type<float>(_2519) : _2409;
        _2407 = _2539;
    }
    float _2541 = _2407;
    float _2543 = _2377 * _2525;
    bool _2545 = _1208 == 0.0;
    bool _2547 = _2545 && _2531;
    float _2549 = in.m_75.x;
    float _2551 = in.m_75.y;
    float _2553 = in.m_75.z;
    float _2555 = in.m_75.w;
    float _2557 = 0.0;
    if (!_2381)
    {
        _2557 = _2409;
    }
    float _2559 = _2557;
    float _2561 = fma(_2535, (*spvDescriptorSet0.vp_c9)._m0[131].x, _2543);
    float _2563 = _2559;
    if (_2381)
    {
        float _2565 = _2273 ? as_type<float>(_2449) : _2409;
        _2563 = _2565;
    }
    float _2567 = _2563;
    float _2569 = fma(_2405, _2523, (*spvDescriptorSet0.vp_c9)._m0[133].x);
    float _2571 = 0.0;
    if (!_2387)
    {
        _2571 = _2409;
    }
    float _2573 = _2571;
    float _2575 = fma(_2427, _2483, -0.5);
    float _2577 = _2573;
    if (_2387)
    {
        float _2579 = _2277 ? as_type<float>(_2473) : _2409;
        _2577 = _2579;
    }
    float _2581 = _2577;
    float _2583 = _2269 * (*spvDescriptorSet0.vp_c9)._m0[90].x;
    float _2585 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _2587 = _2541 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _2589 = fma(_2397, _2485, _2561);
    float _2591 = 0.0;
    if (_2547)
    {
        _2591 = _2475;
    }
    float _2593 = _2591;
    float _2595 = fma(_2583, _2581, -0.5);
    float _2597 = _2593;
    if (_2547)
    {
        _2461 = _2477;
    }
    float _2599 = _2461;
    float _2601 = fma(_2569, _2453, _2589);
    float _2603 = _2599;
    if (_2547)
    {
        _2537 = _2593;
    }
    float _2605 = _2537;
    float _2607 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    float _2609 = _2605;
    if (!_2547)
    {
        _2597 = _2475;
    }
    float _2611 = _2597;
    float _2613 = -_966;
    float _2615 = fma(_958, _2575, _2613);
    if (_2547)
    {
        _2513 = _2599;
    }
    float _2617 = _2513;
    float _2619 = fma(_2373, (*spvDescriptorSet0.vp_c9)._m0[134].x, _2601);
    float _2621 = _2617;
    if (!_2547)
    {
        _2603 = _2477;
    }
    float _2623 = _2603;
    float _2625 = _2339 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _2627 = fma(_970, _2595, _964);
    float _2629 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    if (_2547)
    {
        _2443 = _2479;
    }
    float _2631 = _2443;
    float _2633 = _2631;
    if (!_2547)
    {
        float _2635 = fma(_1206, (*spvDescriptorSet0.vp_c9)._m0[17].y, _2623);
        _2621 = _2635;
    }
    float _2637 = _2621;
    float _2639 = _2553 * _2611;
    if (!_2547)
    {
        float _2641 = fma(_1208, (*spvDescriptorSet0.vp_c9)._m0[17].y, _2479);
        _2633 = _2641;
    }
    float _2643 = _2633;
    float _2645 = _2451 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    float _2647 = _2625 * _2375;
    float _2649 = -_2639;
    float _2651 = fma(_2549, _2479, _2649);
    float _2653 = _2551 * _2479;
    float _2655 = _2567 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    if (!_2547)
    {
        float _2657 = fma(_1204, (*spvDescriptorSet0.vp_c9)._m0[17].y, _2611);
        _2609 = _2657;
    }
    float _2659 = _2609;
    float _2661 = _2549 * _2623;
    float _2663 = -_2653;
    float _2665 = fma(_2553, _2623, _2663);
    float _2667 = _2655 * _2607;
    float _2669 = -_2661;
    float _2671 = fma(_2551, _2611, _2669);
    float _2673 = _2645 * _2629;
    float _2675 = _2587 * _2585;
    float _2677 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _2679 = _2627 + 0.5;
    out.m_77.x = _2675;
    out.m_77.y = _2647;
    out.m_77.z = _2667;
    out.m_77.w = _2673;
    float _2681 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _2683 = _2677 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2685 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _2687 = _2619 * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    float _2689 = _2681 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2691 = _1250 * _1326;
    float _2693 = _2685 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2695 = _1284 * _1326;
    float _2697 = fma(_1238, _1312, _2349);
    float _2699 = -_1248;
    float _2701 = fma(_2699, _1312, _2691);
    float _2703 = _2615 + 0.5;
    out.m_79.x = _2689;
    out.m_79.y = _2683;
    out.m_79.z = _2693;
    out.m_79.w = _2687;
    float _2705 = fma(_1238, _1308, _2383);
    float _2707 = _2651 * _2555;
    float _2709 = _1250 * _1332;
    float _2711 = abs(_1794);
    float _2713 = log2(_2711);
    float _2715 = _1250 * _1336;
    float _2717 = _1272 * _1332;
    float _2719 = _1284 * _1332;
    float _2721 = -_1248;
    float _2723 = fma(_2721, _1310, _2709);
    float _2725 = -_1248;
    float _2727 = fma(_2725, _1308, _2715);
    float _2729 = _1284 * _1336;
    float _2731 = fma(_1232, _1168, _2701);
    float _2733 = fma(_1232, _1140, _2723);
    float _2735 = fma(_1232, _1146, _2727);
    float _2737 = fma(_1260, _1312, _2695);
    float _2739 = fma(_1260, _1308, _2729);
    float _2741 = fma(_1280, _1168, _2697);
    out.m_81.x = _2679;
    out.m_81.y = _2703;
    float _2743 = fma(_1274, _1168, _2737);
    float _2745 = _2713 * (*spvDescriptorSet0.vp_c15)._m0[654].z;
    float _2747 = fma(_1238, _1310, _2717);
    float _2749 = fma(_1280, _1146, _2705);
    float _2751 = fma(_1274, _1146, _2739);
    float _2753 = _2733 * _2551;
    float _2755 = _2731 * _2551;
    float _2757 = exp2(_2745);
    float _2759 = _2735 * _2551;
    float _2761 = _2735 * _2637;
    float _2763 = _2707 * _2733;
    float _2765 = _2707 * _2731;
    float _2767 = _2707 * _2735;
    float _2769 = fma(_1280, _1140, _2747);
    float _2771 = _2733 * _2637;
    float _2773 = _2665 * _2555;
    float _2775 = _2731 * _2637;
    float _2777 = _2671 * _2555;
    float _2779 = exp2(_2275);
    float _2781 = fma(_2773, _2741, _2765);
    float _2783 = fma(_2741, _2659, _2775);
    float _2785 = fma(_2749, _2659, _2761);
    float _2787 = fma(_2757, (*spvDescriptorSet0.vp_c15)._m0[654].x, (*spvDescriptorSet0.vp_c15)._m0[654].y);
    float _2789 = precise::clamp(_2787, 0.0, 1.0);
    float _2791 = fma(_2769, _2659, _2771);
    float _2793 = fma(_2773, _2769, _2763);
    float _2795 = fma(_2741, _2549, _2755);
    float _2797 = fma(_2789, -2.0, 3.0);
    float _2799 = _2789 * _2789;
    float _2801 = fma(_2773, _2749, _2767);
    float _2803 = fma(_1260, _1310, _2719);
    bool _2805 = _1794 <= 8000.0;
    bool _2807 = isnan(_1794);
    bool _2809 = _2805 || _2807;
    bool _2811 = isnan(8000.0);
    bool _2813 = _2809 || _2811;
    float _2815 = float(_2813);
    float _2817 = _2799 * _2797;
    float _2819 = fma(_2769, _2549, _2753);
    float _2821 = fma(_1274, _1140, _2803);
    float _2823 = fma(_2749, _2549, _2759);
    float _2825 = -_2817;
    float _2827 = _2825 + 1.0;
    float _2829 = fma(_2777, _2743, _2781);
    float _2831 = fma(_2777, _2821, _2793);
    float _2833 = -_2779;
    float _2835 = _2833 + 1.0;
    float _2837 = fma(_2827, (*spvDescriptorSet0.vp_c15)._m0[654].w, _2817);
    float _2839 = fma(_2777, _2751, _2801);
    float _2841 = fma(_2821, _2553, _2819);
    float _2843 = in.m_83.x;
    float _2845 = _2815 * _2837;
    float _2847 = fma(_2743, _2553, _2795);
    float _2849 = fma(_2751, _2553, _2823);
    out.m_85.x = _2831;
    out.m_85.y = _2829;
    out.m_85.z = _2839;
    float _2851 = _2845 * (*spvDescriptorSet0.vp_c15)._m0[653].x;
    float _2853 = fma(_2172, (*spvDescriptorSet0.vp_c8)._m0[6].w, _2301);
    float _2855 = _2182 * 0.5;
    out.m_87.x = _2841;
    out.m_87.y = _2847;
    out.m_87.z = _2849;
    float _2857 = _2208 + _2182;
    float _2859 = _2853 + _2182;
    float _2861 = fma(_2210, -0.5, _2855);
    float _2863 = fma(_2821, _2643, _2791);
    float _2865 = _2859 * 0.5;
    float _2867 = _2857 * 0.5;
    float _2869 = _2835 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _2871 = fma(_2743, _2643, _2783);
    float _2873 = fma(_2751, _2643, _2785);
    out.m_89.x = _1212;
    bool _2875 = _1932 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _2877 = isnan(_1932);
    bool _2879 = _2875 || _2877;
    bool _2881 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _2883 = _2879 || _2881;
    out.m_91.x = _2867;
    out.m_91.y = _2861;
    out.m_91.z = _2865;
    out.m_91.w = _2182;
    out.m_93.x = _2863;
    out.m_93.y = _2871;
    out.m_93.z = _2873;
    out.m_95.x = _1782;
    out.m_95.y = _1780;
    out.m_95.z = _1784;
    float _2885 = _2823;
    float _2887 = (*spvDescriptorSet0.vp_c15)._m0[653].y;
    if (!_2883)
    {
        _2885 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _2889 = _2885;
    out.gl_Position.x = _2208;
    out.gl_Position.y = _2210;
    out.gl_Position.z = _2853;
    out.gl_Position.w = _2182;
    float _2891 = _2889;
    float _2893 = _2889;
    if (!_2883)
    {
        _2357 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _2895 = _2357;
    float _2897 = -_2216;
    float _2899 = _2897 + 1.0;
    float _2901 = _2899 * _2851;
    float _2903 = precise::clamp(_2901, 0.0, 1.0);
    float _2905 = -_2903;
    float _2907 = fma(_2905, (*spvDescriptorSet0.vp_c15)._m0[653].y, 1.0);
    float _2909 = _2843;
    float _2911 = _2895;
    float _2913 = _2895;
    if (!_2883)
    {
        _2887 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _2915 = _2887;
    float _2917 = _2907 * _2843;
    float _2919 = _2915;
    float _2921 = _2915;
    if (!_2883)
    {
        _2909 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _2923 = _2909;
    float _2925 = _2917 * (*spvDescriptorSet0.vp_c13)._m0[1].w;
    float _2927 = _2869 * _2244;
    float _2929 = -_2869;
    float _2931 = _2929 + 1.0;
    out.m_97.x = _2925;
    float _2933 = _2255 * _2927;
    float _2935 = _2265 * _2927;
    float _2937 = _2255 * _2931;
    float _2939 = _1850 * _1910;
    float _2941 = fma(_2261, _2933, _2249);
    float _2943 = fma(_2263, _2933, _2251);
    float _2945 = fma(_2255, _2935, _2253);
    float _2947 = _2939 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _2949 = _2927;
    float _2951 = _2939;
    float _2953 = _2923;
    float _2955 = _2923;
    if (!_2883)
    {
        _2949 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _2957 = _2949;
    float _2959 = _2957;
    float _2961 = _2957;
    if (!_2883)
    {
        _2951 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _2963 = _2951;
    out.m_99.x = _2941;
    out.m_99.y = _2943;
    out.m_99.z = _2945;
    out.m_99.w = _2937;
    bool _2965 = !_2883;
    float _2967 = _2963;
    float _2969 = _2963;
    if (!_2965)
    {
        bool _2971 = _1932 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _2973 = isnan(_1932);
        bool _2975 = _2971 || _2973;
        bool _2977 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _2979 = _2975 || _2977;
        if (!_2979)
        {
            float _2981 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2983 = _1932 + _2981;
            float _2985 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2987 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _2985;
            float _2989 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _2991 = _2989 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _2993 = 1.0 / _2987;
            float _2995 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _2997 = _2995 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _2999 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _3001 = _2999 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _3003 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _3005 = _3003 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _3007 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _3009 = _3007 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _3011 = _2983 * _2993;
            float _3013 = precise::clamp(_3011, 0.0, 1.0);
            float _3015 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _3017 = _3015 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _3019 = fma(_3013, _2991, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _3021 = fma(_3013, _3017, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _3023 = fma(_3013, _2997, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _3025 = fma(_3013, _3001, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _3027 = fma(_3013, _3005, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _3029 = fma(_3013, _3009, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            _2913 = _3023;
            _2921 = _3027;
            _2893 = _3019;
            _2961 = _3025;
            _2955 = _3021;
            _2969 = _3029;
            _3031 = true;
        }
        else
        {
            bool _3033 = _1932 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _3035 = isnan(_1932);
            bool _3037 = _3033 || _3035;
            bool _3039 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _3041 = _3037 || _3039;
            if (!_3041)
            {
                _2891 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _3043 = _2891;
            _2893 = _3043;
            if (!_3041)
            {
                _2911 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _3045 = _2911;
            _2913 = _3045;
            if (!_3041)
            {
                _2953 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _3047 = _2953;
            _2955 = _3047;
            if (!_3041)
            {
                _2959 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _3049 = _2959;
            _2961 = _3049;
            if (!_3041)
            {
                _2919 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _3051 = _2919;
            _2921 = _3051;
            if (!_3041)
            {
                _2967 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _3053 = _2967;
            bool _3055 = !_3041;
            _2969 = _3053;
            if (!_3055)
            {
                bool _3057 = _1932 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _3059 = isnan(_1932);
                bool _3061 = _3057 || _3059;
                bool _3063 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _3065 = _3061 || _3063;
                if (!_3065)
                {
                    float _3067 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _3069 = _1932 + _3067;
                    float _3071 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _3073 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _3071;
                    float _3075 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _3077 = _3075 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _3079 = 1.0 / _3073;
                    float _3081 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _3083 = _3081 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _3085 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _3087 = _3085 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _3089 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _3091 = _3089 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _3093 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _3095 = _3093 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _3097 = _3069 * _3079;
                    float _3099 = precise::clamp(_3097, 0.0, 1.0);
                    float _3101 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _3103 = _3101 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _3105 = fma(_3099, _3077, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _3107 = fma(_3099, _3103, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _3109 = fma(_3099, _3083, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _3111 = fma(_3099, _3087, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _3113 = fma(_3099, _3091, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _3115 = fma(_3099, _3095, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    _2913 = _3109;
                    _2921 = _3113;
                    _2893 = _3105;
                    _2961 = _3111;
                    _2955 = _3107;
                    _2969 = _3115;
                    _3031 = true;
                }
                else
                {
                    _2913 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _2921 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _2893 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _2961 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _2955 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _2969 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _3031 = false;
    float _3117 = _2913;
    float _3119 = _2921;
    float _3121 = _2893;
    float _3123 = _2961;
    float _3125 = _2955;
    float _3127 = _2969;
    float _3129 = fma(_2871, -0.5, 0.5);
    float _3131 = precise::clamp(_3129, 0.0, 1.0);
    float _3133 = -_3117;
    float _3135 = _3133 + _3119;
    float _3137 = _2947 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _3139 = -_3121;
    float _3141 = _3139 + _3123;
    float _3143 = fma(_3131, _3135, _3117);
    out.m_101.x = 0.0;
    float _3145 = -_3125;
    float _3147 = _3145 + _3127;
    float _3149 = fma(_3131, _3141, _3121);
    float _3151 = _3143 * 0.586610972881317138671875;
    out.m_49.x = _3137;
    bool _3153 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _3155 = fma(_3131, _3147, _3125);
    float _3157 = fma(_3149, 0.298911988735198974609375, _3151);
    bool _3159 = _1850 > 0.0;
    bool _3161 = isnan(_1850);
    bool _3163 = _3159 || _3161;
    bool _3165 = isnan(0.0);
    bool _3167 = _3163 || _3165;
    float _3169 = fma(_3155, 0.114477999508380889892578125, _3157);
    bool _3171 = _1910 <= 0.0;
    bool _3173 = !_3167;
    bool _3175 = _3171 || _3173;
    float _3177 = -_3169;
    float _3179 = _3149 + _3177;
    float _3181 = -_3169;
    float _3183 = _3143 + _3181;
    float _3185 = -_3169;
    float _3187 = _3155 + _3185;
    float _3189 = fma(_3179, (*spvDescriptorSet0.vp_c13)._m0[1].z, _3169);
    float _3191 = fma(_3183, (*spvDescriptorSet0.vp_c13)._m0[1].z, _3169);
    float _3193 = fma(_3187, (*spvDescriptorSet0.vp_c13)._m0[1].z, _3169);
    bool _3195 = !_3153;
    if (!_3195)
    {
        float _3197 = -_1780;
        float _3199 = _3197 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
        float _3201 = -_1782;
        float _3203 = _3201 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
        float _3205 = -_1784;
        float _3207 = _3205 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
        float _3209 = _3199 * _3199;
        float _3211 = fma(_3203, _3203, _3209);
        float _3213 = fma(_3207, _3207, _3211);
        float _3215 = sqrt(_3213);
        float _3217 = rsqrt(_3213);
        float _3219 = -_3215;
        float _3221 = _3219 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
        float _3223 = _3221 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
        float _3225 = precise::clamp(_3223, 0.0, 1.0);
        float _3227 = _3203 * _3217;
        float _3229 = _3199 * _3217;
        float _3231 = abs(_3225);
        float _3233 = log2(_3231);
        float _3235 = _3207 * _3217;
        float _3237 = _3227 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
        float _3239 = _2871 * _3229;
        float _3241 = -_3229;
        float _3243 = -_3237;
        float _3245 = fma(_3241, (*spvDescriptorSet0.vp_c15)._m0[656].y, _3243);
        float _3247 = fma(_2863, _3227, _3239);
        float _3249 = -_3235;
        float _3251 = fma(_3249, (*spvDescriptorSet0.vp_c15)._m0[656].z, _3245);
        float _3253 = fma(_2873, _3235, _3247);
        float _3255 = precise::clamp(_3253, 0.0, 1.0);
        float _3257 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
        float _3259 = _3251 + _3257;
        float _3261 = _3233 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
        float _3263 = _3259 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
        float _3265 = precise::clamp(_3263, 0.0, 1.0);
        float _3267 = exp2(_3261);
        float _3269 = _3267 * _3265;
        float _3271 = _3255 * _3269;
        float _3273 = _3271 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
        float _3275 = _3271 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
        float _3277 = _3271 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
        out.m_101.x = _3273;
        out.m_101.y = _3275;
        out.m_101.z = _3277;
    }
    out.m_69.x = _3189;
    out.m_69.y = _3191;
    out.m_69.z = _3193;
    if (!_3175)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    out.m_49.x = 0.0;
    float _3279 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _3279;
    out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
}


vertex main0_out main0_z(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]])
{
    main0_out out = {};
    out.m_67 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_79 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_101 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_97 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_99 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_69 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_53 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_89 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_77 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_81 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_71 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_91 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_49 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_85 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_93 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_95 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_87 = float4(0.0, 0.0, 0.0, 1.0);
    bool _3031 = false;
    bool _656 = false;
    bool _558 = false;
    bool _450 = false;
    bool _222 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _115 = in.m_46.w;
    float _117 = trunc(_115);
    int _120 = int(_117);
    bool _124 = _120 >= 1;
    float _126 = 0.0;
    if (!_124)
    {
        _126 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _128 = _126;
    if (!_124)
    {
        out.m_49.x = 0.0;
    }
    int _130 = 0;
    if (!_124)
    {
        float _132 = _128 * 5.0;
        _130 = as_type<int>(_132);
    }
    int _134 = _130;
    if (!_124)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _3334 = as_type<float>(_134);
        out.gl_Position.z = _3334;
    }
    if (!_124)
    {
        return out;
    }
    float _136 = in.m_51.w;
    float _138 = float(_120);
    float _140 = 1.0 / _138;
    float _142 = -_136;
    float _144 = _142 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _146 = _136 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _148 = isnan(_136);
    bool _150 = _146 || _148;
    bool _152 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _154 = _150 || _152;
    float _156 = _144 * _140;
    bool _158 = _144 >= _138;
    bool _160 = !_154;
    bool _162 = _158 || _160;
    out.m_53.x = _156;
    float _164 = _136;
    float _166 = _144;
    if (_162)
    {
        _164 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _168 = _164;
    if (_162)
    {
        out.m_49.x = 0.0;
    }
    int _170 = 0;
    if (_162)
    {
        float _172 = _168 * 5.0;
        _170 = as_type<int>(_172);
    }
    int _174 = _170;
    if (_162)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _3406 = as_type<float>(_174);
        out.gl_Position.z = _3406;
    }
    if (_162)
    {
        return out;
    }
    float _176 = in.m_55.x;
    float _178 = in.m_55.y;
    float _180 = in.m_55.z;
    bool _182 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _184 = _178 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _186 = _178 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _188 = _178 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _190 = fma(_176, (*spvDescriptorSet0.vp_c10)._m0[4].x, _184);
    float _192 = fma(_176, (*spvDescriptorSet0.vp_c10)._m0[5].x, _186);
    float _194 = fma(_176, (*spvDescriptorSet0.vp_c10)._m0[6].x, _188);
    float _196 = fma(_180, (*spvDescriptorSet0.vp_c10)._m0[4].z, _190);
    float _198 = fma(_180, (*spvDescriptorSet0.vp_c10)._m0[5].z, _192);
    float _200 = fma(_180, (*spvDescriptorSet0.vp_c10)._m0[6].z, _194);
    bool _202 = !_182;
    float _220;
    if (!_202)
    {
        float _204 = in.m_57.x;
        float _206 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _208 = _204 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _210 = fma(_208, (*spvDescriptorSet0.vp_c9)._m0[12].x, _144);
        float _212 = _210 * _206;
        float _214 = floor(_212);
        float _216 = -_214;
        float _218 = _212 + _216;
        _220 = _218;
        _222 = true;
    }
    else
    {
        _220 = _156;
    }
    _222 = false;
    float _224 = _220;
    float _226 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _228 = _224 + _226;
    float _230 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _232 = _224 + _230;
    float _234 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _236 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _234;
    float _238 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _240 = _238 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _242 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _244 = (*spvDescriptorSet0.vp_c9)._m0[146].w + _242;
    float _246 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _248 = _224 + _246;
    float _250 = 1.0 / _236;
    bool _252 = _224 >= (*spvDescriptorSet0.vp_c9)._m0[146].w;
    bool _254 = isnan(_224);
    bool _256 = _252 || _254;
    bool _258 = isnan((*spvDescriptorSet0.vp_c9)._m0[146].w);
    bool _260 = _256 || _258;
    float _262 = float(_260);
    bool _264 = _224 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _266 = isnan(_224);
    bool _268 = _264 || _266;
    bool _270 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _272 = _268 || _270;
    float _274 = float(_272);
    float _276 = -_262;
    float _278 = _276 + 1.0;
    float _280 = 1.0 / _240;
    float _282 = _274 * _278;
    float _284 = -_274;
    float _286 = _284 + 1.0;
    bool _288 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].x;
    float _290 = 1.0 / _244;
    float _292 = _228 * _250;
    float _294 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _296 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _294;
    float _298 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _300 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _298;
    float _302 = _232 * _280;
    float _304 = -(*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _306 = (*spvDescriptorSet0.vp_c9)._m0[144].z + _304;
    float _308 = fma(_296, _292, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _310 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _312 = _310 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _314 = fma(_306, _292, (*spvDescriptorSet0.vp_c9)._m0[143].z);
    float _316 = fma(_312, _302, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _318 = _248 * _290;
    bool _320 = _224 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _322 = isnan(_224);
    bool _324 = _320 || _322;
    bool _326 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _328 = _324 || _326;
    float _330 = float(_328);
    float _332 = fma(_300, _292, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    bool _334 = _224 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _336 = isnan(_224);
    bool _338 = _334 || _336;
    bool _340 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _342 = _338 || _340;
    float _344 = float(_342);
    float _346 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _348 = _346 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _350 = -(*spvDescriptorSet0.vp_c9)._m0[144].z;
    float _352 = _350 + (*spvDescriptorSet0.vp_c9)._m0[145].z;
    float _354 = -_330;
    float _356 = _354 + 1.0;
    float _358 = _330 * _286;
    float _360 = fma(_348, _302, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _362 = fma(_352, _302, (*spvDescriptorSet0.vp_c9)._m0[144].z);
    float _364 = _344 * _356;
    float _366 = in.m_59.x;
    float _368 = in.m_59.y;
    float _370 = in.m_59.z;
    float _372 = -_344;
    float _374 = _372 + 1.0;
    float _376 = _308 * _364;
    float _378 = _332 * _364;
    float _380 = _314 * _364;
    float _382 = -(*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _384 = (*spvDescriptorSet0.vp_c9)._m0[146].x + _382;
    float _386 = -(*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _388 = (*spvDescriptorSet0.vp_c9)._m0[146].y + _386;
    float _390 = fma(_374, (*spvDescriptorSet0.vp_c9)._m0[143].x, _376);
    float _392 = fma(_374, (*spvDescriptorSet0.vp_c9)._m0[143].y, _378);
    float _394 = -(*spvDescriptorSet0.vp_c9)._m0[145].z;
    float _396 = (*spvDescriptorSet0.vp_c9)._m0[146].z + _394;
    float _398 = fma(_374, (*spvDescriptorSet0.vp_c9)._m0[143].z, _380);
    float _400 = fma(_384, _318, (*spvDescriptorSet0.vp_c9)._m0[145].x);
    float _402 = fma(_388, _318, (*spvDescriptorSet0.vp_c9)._m0[145].y);
    float _404 = fma(_360, _358, _390);
    float _406 = fma(_316, _358, _392);
    float _408 = fma(_396, _318, (*spvDescriptorSet0.vp_c9)._m0[145].z);
    float _410 = fma(_362, _358, _398);
    float _412 = fma(_400, _282, _404);
    float _414 = fma(_402, _282, _406);
    float _416 = fma(_408, _282, _410);
    float _418 = fma(_262, (*spvDescriptorSet0.vp_c9)._m0[146].x, _412);
    float _420 = fma(_262, (*spvDescriptorSet0.vp_c9)._m0[146].y, _414);
    float _422 = fma(_262, (*spvDescriptorSet0.vp_c9)._m0[146].z, _416);
    float _424 = _418 * _366;
    float _426 = _420 * _368;
    float _428 = _422 * _370;
    bool _430 = !_288;
    float _448;
    if (!_430)
    {
        float _432 = in.m_57.x;
        float _434 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].x;
        float _436 = _432 * (*spvDescriptorSet0.vp_c9)._m0[12].y;
        float _438 = fma(_436, (*spvDescriptorSet0.vp_c9)._m0[11].x, _144);
        float _440 = _438 * _434;
        float _442 = floor(_440);
        float _444 = -_442;
        float _446 = _440 + _444;
        _448 = _446;
        _450 = true;
    }
    else
    {
        _448 = _156;
    }
    _450 = false;
    float _452 = _448;
    float _454 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _456 = _452 + _454;
    bool _458 = _452 >= (*spvDescriptorSet0.vp_c9)._m0[108].w;
    bool _460 = isnan(_452);
    bool _462 = _458 || _460;
    bool _464 = isnan((*spvDescriptorSet0.vp_c9)._m0[108].w);
    bool _466 = _462 || _464;
    float _468 = float(_466);
    float _470 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _472 = (*spvDescriptorSet0.vp_c9)._m0[108].w + _470;
    bool _474 = _452 >= (*spvDescriptorSet0.vp_c9)._m0[107].w;
    bool _476 = isnan(_452);
    bool _478 = _474 || _476;
    bool _480 = isnan((*spvDescriptorSet0.vp_c9)._m0[107].w);
    bool _482 = _478 || _480;
    float _484 = float(_482);
    float _486 = -_468;
    float _488 = _486 + 1.0;
    float _490 = -(*spvDescriptorSet0.vp_c9)._m0[107].x;
    float _492 = (*spvDescriptorSet0.vp_c9)._m0[108].x + _490;
    float _494 = 1.0 / _472;
    bool _496 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _498 = _484 * _488;
    float _500 = -_484;
    float _502 = _500 + 1.0;
    float _504 = _456 * _494;
    float _506 = -(*spvDescriptorSet0.vp_c9)._m0[107].z;
    float _508 = (*spvDescriptorSet0.vp_c9)._m0[108].z + _506;
    float _510 = fma(_492, _504, (*spvDescriptorSet0.vp_c9)._m0[107].x);
    float _512 = -(*spvDescriptorSet0.vp_c9)._m0[107].y;
    float _514 = (*spvDescriptorSet0.vp_c9)._m0[108].y + _512;
    float _516 = fma(_508, _504, (*spvDescriptorSet0.vp_c9)._m0[107].z);
    float _518 = _510 * _498;
    float _520 = fma(_514, _504, (*spvDescriptorSet0.vp_c9)._m0[107].y);
    float _522 = _516 * _498;
    float _524 = _520 * _498;
    float _526 = fma(_502, (*spvDescriptorSet0.vp_c9)._m0[107].x, _518);
    float _528 = fma(_502, (*spvDescriptorSet0.vp_c9)._m0[107].y, _524);
    float _530 = fma(_502, (*spvDescriptorSet0.vp_c9)._m0[107].z, _522);
    float _532 = fma(_468, (*spvDescriptorSet0.vp_c9)._m0[108].x, _526);
    float _534 = fma(_468, (*spvDescriptorSet0.vp_c9)._m0[108].y, _528);
    float _536 = fma(_468, (*spvDescriptorSet0.vp_c9)._m0[108].z, _530);
    bool _538 = !_496;
    float _556;
    if (!_538)
    {
        float _540 = in.m_57.x;
        float _542 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _544 = _540 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _546 = fma(_544, (*spvDescriptorSet0.vp_c9)._m0[11].y, _144);
        float _548 = _546 * _542;
        float _550 = floor(_548);
        float _552 = -_550;
        float _554 = _548 + _552;
        _556 = _554;
        _558 = true;
    }
    else
    {
        _556 = _156;
    }
    _558 = false;
    float _560 = _556;
    bool _562 = _560 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _564 = isnan(_560);
    bool _566 = _562 || _564;
    bool _568 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _570 = _566 || _568;
    float _572 = float(_570);
    float _574 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _576 = _574 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _578 = _560 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _580 = isnan(_560);
    bool _582 = _578 || _580;
    bool _584 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _586 = _582 || _584;
    float _588 = float(_586);
    float _590 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _592 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _590;
    float _594 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _596 = _560 + _594;
    float _598 = -_572;
    float _600 = _598 + 1.0;
    bool _602 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].w;
    float _604 = 1.0 / _576;
    float _606 = _588 * _600;
    float _608 = -_588;
    float _610 = _608 + 1.0;
    float _612 = _532 * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _614 = _536 * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _616 = _612 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _618 = _614 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _620 = _592 * _604;
    float _622 = fma(_620, _596, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _624 = _622 * _606;
    float _626 = _534 * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _628 = fma(_610, (*spvDescriptorSet0.vp_c9)._m0[115].x, _624);
    float _630 = _626 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _632 = fma(_572, (*spvDescriptorSet0.vp_c9)._m0[116].x, _628);
    float _634 = _632 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    bool _636 = !_602;
    float _654;
    if (!_636)
    {
        float _638 = in.m_57.x;
        float _640 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].w;
        float _642 = _638 * (*spvDescriptorSet0.vp_c9)._m0[13].x;
        float _644 = fma(_642, (*spvDescriptorSet0.vp_c9)._m0[11].w, _144);
        float _646 = _644 * _640;
        float _648 = floor(_646);
        float _650 = -_648;
        float _652 = _646 + _650;
        _654 = _652;
        _656 = true;
    }
    else
    {
        _654 = _156;
    }
    _656 = false;
    float _658 = _654;
    float _660 = in.m_57.z;
    float _662 = _424 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _664 = in.m_57.y;
    int _666 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _668 = _666 != 0;
    float _670 = _662 * (*spvDescriptorSet0.vp_c13)._m0[2].y;
    float _672 = in.m_46.x;
    float _674 = in.m_46.y;
    float _676 = in.m_46.z;
    int _678 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _680 = _678 != 0;
    int _682 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _684 = _682 != 0;
    int _686 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _688 = _686 != 0;
    float _690 = _426 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _692 = in.m_57.x;
    float _694 = (*spvDescriptorSet0.vp_c8)._m0[0].y * (*spvDescriptorSet0.vp_c10)._m0[9].w;
    float _696 = _428 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _698 = fma((*spvDescriptorSet0.vp_c8)._m0[0].x, (*spvDescriptorSet0.vp_c10)._m0[8].w, _694);
    float _700 = -(*spvDescriptorSet0.vp_c9)._m0[194].y;
    float _702 = (*spvDescriptorSet0.vp_c9)._m0[194].z + _700;
    float _704 = -(*spvDescriptorSet0.vp_c9)._m0[193].w;
    float _706 = _704 + (*spvDescriptorSet0.vp_c9)._m0[194].x;
    float _708 = _660 * 2.0;
    float _710 = fma(_156, _706, (*spvDescriptorSet0.vp_c9)._m0[193].w);
    float _712 = _664 * 2.0;
    float _714 = _664 + _660;
    float _716 = floor(_708);
    float _718 = _674 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _720 = _674 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _722 = _674 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _724 = _714 + (-1.0);
    float _726 = fma(_672, (*spvDescriptorSet0.vp_c10)._m0[4].x, _718);
    float _728 = fma(_672, (*spvDescriptorSet0.vp_c10)._m0[5].x, _720);
    float _730 = floor(_712);
    float _732 = fma(_672, (*spvDescriptorSet0.vp_c10)._m0[6].x, _722);
    float _734 = _672;
    if (_668)
    {
        _734 = _692;
    }
    float _736 = _734;
    float _738 = fma(_676, (*spvDescriptorSet0.vp_c10)._m0[5].z, _728);
    float _740 = fma(_676, (*spvDescriptorSet0.vp_c10)._m0[4].z, _726);
    float _742 = _736;
    if (!_668)
    {
        _742 = _660;
    }
    float _744 = _742;
    float _746 = fma(_676, (*spvDescriptorSet0.vp_c10)._m0[6].z, _732);
    bool _748 = _716 > 0.0;
    float _750 = (*spvDescriptorSet0.vp_c9)._m0[87].x + (*spvDescriptorSet0.vp_c9)._m0[86].z;
    bool _752 = _716 >= 0.0;
    bool _754 = isnan(_716);
    bool _756 = _752 || _754;
    bool _758 = isnan(0.0);
    bool _760 = _756 || _758;
    float _762 = _744 * (*spvDescriptorSet0.vp_c9)._m0[87].x;
    float _764 = _660 + _692;
    float _766 = fma(_724, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    int _768 = _760 ? 0 : 1;
    float _770 = -_750;
    float _772 = fma(_762, 2.0, _770);
    bool _774 = _730 > 0.0;
    float _776 = _764 + (-1.0);
    bool _778 = _730 >= 0.0;
    bool _780 = isnan(_730);
    bool _782 = _778 || _780;
    bool _784 = isnan(0.0);
    bool _786 = _782 || _784;
    float _788 = _738 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _790 = _762;
    if (_668)
    {
        _790 = _664;
    }
    float _792 = _790;
    float _794 = _740 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    int _796 = ~_768;
    int _798 = _796 + 1;
    int _800 = _798 + 1;
    float _802 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _804 = _788 + _802;
    float _806 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _808 = _794 + _806;
    float _810 = _792;
    int _812 = _800;
    if (!_668)
    {
        _810 = _692;
    }
    float _814 = _810;
    float _816 = _804 * _804;
    if (!_748)
    {
        int _818 = ~_768;
        int _820 = _818 + 1;
        _812 = _820;
    }
    int _822 = _812;
    float _824 = (*spvDescriptorSet0.vp_c9)._m0[87].y + (*spvDescriptorSet0.vp_c9)._m0[86].w;
    float _826 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _828 = log2(_826);
    int _830 = _786 ? 0 : 1;
    float _832 = _814 * (*spvDescriptorSet0.vp_c9)._m0[87].y;
    float _834 = -_788;
    float _836 = _834 + (*spvDescriptorSet0.vp_c8)._m0[29].y;
    int _838 = ~_830;
    int _840 = _838 + 1;
    int _842 = _840 + 1;
    float _844 = fma((*spvDescriptorSet0.vp_c8)._m0[0].z, (*spvDescriptorSet0.vp_c10)._m0[10].w, _698);
    int _846 = _842;
    if (!_774)
    {
        int _848 = ~_830;
        int _850 = _848 + 1;
        _846 = _850;
    }
    int _852 = _846;
    float _854 = fma(_832, -2.0, _824);
    float _856 = _692 * 2.0;
    float _858 = fma(_776, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    bool _860 = !_680;
    int _862 = _860 ? 0 : 1;
    float _864 = _664 + _692;
    bool _866 = !_688;
    int _868 = _866 ? 0 : 1;
    float _870 = floor(_856);
    int _872 = abs(_862);
    float _874 = _864 + (-1.0);
    int _876 = abs(_868);
    float _878 = _828 * _144;
    float _880 = _844 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _882 = exp2(_878);
    float _884 = fma(_874, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    float _886 = float(_872);
    float _888 = float(_876);
    float _890 = float(_852);
    float _892 = float(_822);
    float _894 = _888 * _890;
    bool _896 = _870 > 0.0;
    float _898 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _900 = 1.0 + _898;
    bool _902 = _870 >= 0.0;
    bool _904 = isnan(_870);
    bool _906 = _902 || _904;
    bool _908 = isnan(0.0);
    bool _910 = _906 || _908;
    float _912 = _886 * _892;
    float _914 = in.m_61.x;
    float _916 = in.m_61.y;
    float _918 = in.m_61.z;
    bool _920 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _922 = isnan(1.0);
    bool _924 = _920 || _922;
    bool _926 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _928 = _924 || _926;
    float _930 = 1.0 / _900;
    float _932 = -_882;
    float _934 = _932 + 1.0;
    float _936 = (*spvDescriptorSet0.vp_c9)._m0[88].w + (*spvDescriptorSet0.vp_c9)._m0[88].y;
    float _938 = _894 * (-2.0);
    bool _940 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _942 = isnan(0.0);
    bool _944 = _940 || _942;
    bool _946 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _948 = _944 || _946;
    float _950 = fma(_664, (*spvDescriptorSet0.vp_c9)._m0[88].w, _936);
    float _952 = (*spvDescriptorSet0.vp_c9)._m0[88].z + (*spvDescriptorSet0.vp_c9)._m0[88].x;
    float _954 = _948 ? _934 : 0.0;
    float _956 = _746 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _958 = fma(_144, (*spvDescriptorSet0.vp_c9)._m0[87].w, _950);
    float _960 = fma(_692, (*spvDescriptorSet0.vp_c9)._m0[88].z, _952);
    float _962 = -_144;
    float _964 = fma(_962, (*spvDescriptorSet0.vp_c9)._m0[86].x, _772);
    float _966 = fma(_144, (*spvDescriptorSet0.vp_c9)._m0[86].y, _854);
    float _968 = fma(_808, _808, _816);
    float _970 = fma(_144, (*spvDescriptorSet0.vp_c9)._m0[87].z, _960);
    if (_928)
    {
        float _972 = _954 * _930;
        _166 = _972;
    }
    float _974 = _166;
    float _976 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _978 = _956 + _976;
    float _980 = _912 * (-2.0);
    int _982 = _910 ? 0 : 1;
    float _984 = _836 * _836;
    float _986 = fma(_978, _978, _968);
    float _988 = _692 + (-0.5);
    float _990 = fma(_980, _914, _914);
    bool _992 = !_684;
    int _994 = _992 ? 0 : 1;
    float _996 = sqrt(_986);
    int _998 = ~_982;
    int _1000 = _998 + 1;
    int _1002 = _1000 + 1;
    float _1004 = fma(_988, (*spvDescriptorSet0.vp_c9)._m0[196].x, _990);
    float _1006 = fma(_884, _980, _884);
    int _1008 = _1002;
    if (!_896)
    {
        int _1010 = ~_982;
        int _1012 = _1010 + 1;
        _1008 = _1012;
    }
    int _1014 = _1008;
    float _1016 = -_794;
    float _1018 = _1016 + (*spvDescriptorSet0.vp_c8)._m0[29].x;
    int _1020 = abs(_994);
    float _1022 = _660 + (-0.5);
    float _1024 = rsqrt(_986);
    float _1026 = float(_1014);
    float _1028 = -_956;
    float _1030 = _1028 + (*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1032 = float(_1020);
    float _1034 = fma(_1018, _1018, _984);
    float _1036 = fma(_1006, _974, _1004);
    float _1038 = _996 * (*spvDescriptorSet0.vp_c13)._m0[2].x;
    float _1040 = fma(_938, _918, _918);
    float _1042 = _1032 * _1026;
    float _1044 = _788 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1046 = fma(_1030, _1030, _1034);
    float _1048 = precise::min(_670, _1038);
    float _1050 = fma(_1022, (*spvDescriptorSet0.vp_c9)._m0[196].z, _1040);
    float _1052 = fma(_794, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1044);
    float _1054 = _1042 * (-2.0);
    float _1056 = fma(_858, _938, _858);
    float _1058 = _1024 * _1048;
    float _1060 = rsqrt(_1046);
    float _1062 = _1036 * 0.15915493667125701904296875;
    float _1064 = fma(_1054, _916, _916);
    float _1066 = _804 * _1058;
    float _1068 = _808 * _1058;
    float _1070 = fma(_956, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1052);
    float _1072 = _664 + (-0.5);
    float _1074 = -_1066;
    float _1076 = _804 + _1074;
    float _1078 = sqrt(_1046);
    float _1080 = -_1068;
    float _1082 = _808 + _1080;
    float _1084 = fma(_1056, _974, _1050);
    float _1086 = _1076 * _1076;
    float _1088 = fma(_1072, (*spvDescriptorSet0.vp_c9)._m0[196].y, _1064);
    float _1090 = _1084 * 0.15915493667125701904296875;
    float _1092 = fma(_1082, _1082, _1086);
    float _1094 = 1.0 / _702;
    float _1096 = fma(_766, _1054, _766);
    float _1098 = _978 * _1058;
    float _1100 = _1070 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1102 = fma(_1096, _974, _1088);
    float _1104 = -_1098;
    float _1106 = _978 + _1104;
    float _1108 = -_1100;
    float _1110 = _880 + _1108;
    bool _1112 = _1100 >= _880;
    bool _1114 = isnan(_1100);
    bool _1116 = _1112 || _1114;
    bool _1118 = isnan(_880);
    bool _1120 = _1116 || _1118;
    float _1122 = _1102 * 0.15915493667125701904296875;
    float _1124 = fma(_1106, _1106, _1092);
    float _1126 = (*spvDescriptorSet0.vp_c8)._m0[28].y * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _1128 = abs(_1110);
    float _1130 = precise::max(_1128, (*spvDescriptorSet0.vp_c9)._m0[194].y);
    float _1132 = _1062 * 6.283185482025146484375;
    float _1134 = sin(_1132);
    float _1136 = abs(_1078);
    float _1138 = precise::max(0.0, _1136);
    float _1140 = _1018 * _1060;
    float _1142 = precise::min(_1130, (*spvDescriptorSet0.vp_c9)._m0[194].z);
    float _1144 = fma((*spvDescriptorSet0.vp_c8)._m0[28].x, (*spvDescriptorSet0.vp_c8)._m0[28].x, _1126);
    float _1146 = _1030 * _1060;
    float _1148 = precise::min(_1138, 40.0);
    float _1150 = sqrt(_1124);
    float _1152 = -(*spvDescriptorSet0.vp_c9)._m0[194].y;
    float _1154 = _1142 + _1152;
    bool _1156 = !_1120;
    float _1158 = _1156 ? 1.0 : (-1.0);
    float _1160 = -(*spvDescriptorSet0.vp_c8)._m0[1].z;
    float _1162 = _1140 * _1160;
    float _1164 = fma((*spvDescriptorSet0.vp_c8)._m0[28].z, (*spvDescriptorSet0.vp_c8)._m0[28].z, _1144);
    float _1166 = _1154 * _1094;
    float _1168 = _836 * _1060;
    float _1170 = fma(_1148, -0.02500000037252902984619140625, 1.0);
    float _1172 = _1062 * 6.283185482025146484375;
    float _1174 = cos(_1172);
    float _1176 = -(*spvDescriptorSet0.vp_c8)._m0[1].x;
    float _1178 = -_1162;
    float _1180 = fma(_1146, _1176, _1178);
    float _1182 = _1158 * _1166;
    float _1184 = _156 * (*spvDescriptorSet0.vp_c9)._m0[194].w;
    float _1186 = -(*spvDescriptorSet0.vp_c8)._m0[1].x;
    float _1188 = _1168 * _1186;
    float _1190 = _1180 * _1180;
    float _1192 = _1184 * _1182;
    float _1194 = _1090 * 6.283185482025146484375;
    float _1196 = cos(_1194);
    float _1198 = _1024 * _1150;
    float _1200 = -(*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1202 = _1146 * _1200;
    float _1204 = in.m_63.x;
    float _1206 = in.m_63.y;
    float _1208 = in.m_63.z;
    float _1210 = _1192 * 0.15915493667125701904296875;
    float _1212 = _662 * _1198;
    float _1214 = -(*spvDescriptorSet0.vp_c8)._m0[1].z;
    float _1216 = -_1202;
    float _1218 = fma(_1168, _1214, _1216);
    float _1220 = _696 * _1198;
    float _1222 = _1122 * 6.283185482025146484375;
    float _1224 = cos(_1222);
    float _1226 = fma(_1218, _1218, _1190);
    float _1228 = _1122 * 6.283185482025146484375;
    float _1230 = sin(_1228);
    float _1232 = _1134 * _1196;
    float _1234 = _1174 * _1224;
    float _1236 = _1134 * _1224;
    float _1238 = _1224 * _1196;
    float _1240 = -(*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1242 = -_1188;
    float _1244 = fma(_1140, _1240, _1242);
    float _1246 = _1090 * 6.283185482025146484375;
    float _1248 = sin(_1246);
    float _1250 = _1174 * _1196;
    float _1252 = fma(_1244, _1244, _1226);
    float _1254 = _1134 * _1230;
    float _1256 = _1174 * _1230;
    float _1258 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _1206);
    float _1260 = _1230 * _1196;
    float _1262 = rsqrt(_1164);
    float _1264 = _690 * _1198;
    float _1266 = _1264 * _1258;
    float _1268 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _1208);
    float _1270 = rsqrt(_1252);
    float _1272 = fma(_1248, _1234, _1254);
    float _1274 = fma(_1248, _1254, _1234);
    float _1276 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _1204);
    float _1278 = -_1256;
    float _1280 = fma(_1248, _1236, _1278);
    float _1282 = -_1236;
    float _1284 = fma(_1248, _1256, _1282);
    float _1286 = -_1266;
    float _1288 = _1248 * _1286;
    float _1290 = _1212 * _1276;
    float _1292 = _1250 * _1266;
    float _1294 = _1232 * _1266;
    float _1296 = _1220 * _1268;
    float _1298 = fma(_1238, _1290, _1288);
    float _1300 = fma(_1272, _1290, _1292);
    float _1302 = fma(_1280, _1290, _1294);
    float _1304 = _1262 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _1306 = fma(_1260, _1296, _1298);
    float _1308 = _1244 * _1270;
    float _1310 = _1218 * _1270;
    float _1312 = _1180 * _1270;
    float _1314 = fma(_1284, _1296, _1300);
    float _1316 = _1140 * _1308;
    float _1318 = fma(_1274, _1296, _1302);
    float _1320 = _1146 * _1312;
    float _1322 = _1168 * _1310;
    float _1324 = -_1316;
    float _1326 = fma(_1146, _1310, _1324);
    float _1328 = _1262 * (*spvDescriptorSet0.vp_c8)._m0[28].x;
    float _1330 = -_1320;
    float _1332 = fma(_1168, _1308, _1330);
    float _1334 = -_1322;
    float _1336 = fma(_1140, _1312, _1334);
    float _1338 = _1326 * _1314;
    float _1340 = _1304 * _1304;
    float _1342 = _1332 * _1314;
    float _1344 = _1336 * _1314;
    float _1346 = fma(_1312, _1306, _1338);
    float _1348 = _1262 * (*spvDescriptorSet0.vp_c8)._m0[28].z;
    float _1350 = fma(_1310, _1306, _1342);
    float _1352 = fma(_1308, _1306, _1344);
    float _1354 = fma(_1168, _1318, _1346);
    float _1356 = fma(_1328, _1328, _1340);
    float _1358 = fma(_1140, _1318, _1350);
    float _1360 = _788 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1362 = _788 + _1354;
    float _1364 = fma(_1146, _1318, _1352);
    float _1366 = _794 + _1358;
    float _1368 = fma(_1348, _1348, _1356);
    float _1370 = _1362 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1372 = _1362 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1374 = _1362 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1376 = fma(_794, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1360);
    float _1378 = fma(_1366, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1370);
    float _1380 = fma(_1366, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1372);
    float _1382 = _956 + _1364;
    float _1384 = fma(_1366, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1374);
    float _1386 = rsqrt(_1368);
    float _1388 = fma(_956, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1376);
    float _1390 = fma(_1382, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1380);
    float _1392 = fma(_1382, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1384);
    float _1394 = fma(_1382, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1378);
    float _1396 = _1388 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1398 = _1390 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1400 = _1392 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1402 = _1210 * 6.283185482025146484375;
    float _1404 = cos(_1402);
    float _1406 = _1394 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1408 = -_1398;
    float _1410 = _1408 + _1396;
    float _1412 = _1400 * (*spvDescriptorSet0.vp_c8)._m0[12].y;
    float _1414 = _1400 * (*spvDescriptorSet0.vp_c8)._m0[13].y;
    float _1416 = _1400 * (*spvDescriptorSet0.vp_c8)._m0[14].y;
    float _1418 = fma(_1170, _1410, _1398);
    float _1420 = fma(_1406, (*spvDescriptorSet0.vp_c8)._m0[12].x, _1412);
    float _1422 = _1210 * 6.283185482025146484375;
    float _1424 = sin(_1422);
    float _1426 = fma(_1406, (*spvDescriptorSet0.vp_c8)._m0[13].x, _1414);
    float _1428 = fma(_1406, (*spvDescriptorSet0.vp_c8)._m0[14].x, _1416);
    float _1430 = _1348 * _1386;
    float _1432 = fma(_1418, (*spvDescriptorSet0.vp_c8)._m0[12].z, _1420);
    float _1434 = fma(_1418, (*spvDescriptorSet0.vp_c8)._m0[13].z, _1426);
    float _1436 = fma(_1418, (*spvDescriptorSet0.vp_c8)._m0[14].z, _1428);
    float _1438 = _1430 * _1430;
    float _1440 = -_1404;
    float _1442 = _1440 + 1.0;
    float _1444 = _1328 * _1386;
    float _1446 = _1304 * _1386;
    float _1448 = _1432 + (*spvDescriptorSet0.vp_c8)._m0[12].w;
    float _1450 = fma(_1442, _1438, _1404);
    float _1452 = _1434 + (*spvDescriptorSet0.vp_c8)._m0[13].w;
    float _1454 = _1446 * _1442;
    float _1456 = _1444 * _1442;
    float _1458 = _1444 * _1424;
    float _1460 = _1446 * _1424;
    float _1462 = _1430 * _1424;
    float _1464 = -_788;
    float _1466 = _1464 + _1452;
    float _1468 = fma(_1430, _1454, _1458);
    float _1470 = -_1460;
    float _1472 = fma(_1430, _1456, _1470);
    float _1474 = -_1462;
    float _1476 = fma(_1446, _1456, _1474);
    float _1478 = -_794;
    float _1480 = _1478 + _1448;
    float _1482 = _1468 * _1466;
    float _1484 = _1436 + (*spvDescriptorSet0.vp_c8)._m0[14].w;
    float _1486 = fma(_1444, _1456, _1404);
    float _1488 = _1476 * _1466;
    float _1490 = fma(_1472, _1480, _1482);
    float _1492 = -_956;
    float _1494 = _1492 + _1484;
    float _1496 = fma(_1430, _1456, _1460);
    float _1498 = fma(_1486, _1480, _1488);
    float _1500 = fma(_1446, _1454, _1404);
    float _1502 = fma(_1450, _1494, _1490);
    float _1504 = fma(_1446, _1456, _1462);
    float _1506 = fma(_1496, _1494, _1498);
    float _1508 = _1500 * _1466;
    float _1510 = fma(_1502, _710, _956);
    float _1512 = -_1458;
    float _1514 = fma(_1430, _1454, _1512);
    float _1516 = fma(_1506, _710, _794);
    float _1518 = fma(_1504, _1480, _1508);
    float _1520 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1522 = _1510 + _1520;
    float _1524 = -_1066;
    float _1526 = _788 + _1524;
    float _1528 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1530 = _1516 + _1528;
    float _1532 = fma(_1514, _1494, _1518);
    float _1534 = _1522 * _1522;
    float _1536 = _1526 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _1538 = -_1098;
    float _1540 = _956 + _1538;
    float _1542 = _788 + _1532;
    float _1544 = fma(_1530, _1530, _1534);
    float _1546 = -_1068;
    float _1548 = _794 + _1546;
    float _1550 = sqrt(_1544);
    float _1552 = fma(_1548, (*spvDescriptorSet0.vp_c8)._m0[11].x, _1536);
    float _1554 = fma(_1540, (*spvDescriptorSet0.vp_c8)._m0[11].z, _1552);
    bool _1556 = _1550 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1558 = _1446;
    float _1560 = _1532;
    float _1562 = _1518;
    float _1564 = _1554;
    float _1566 = _1516;
    if (!_1556)
    {
        _1558 = _1516;
    }
    float _1568 = _1558;
    float _1570 = _1568;
    if (!_1556)
    {
        _1560 = _1510;
    }
    float _1572 = _1560;
    float _1574 = _1572;
    if (!_1556)
    {
        _1562 = _1542;
    }
    float _1576 = _1562;
    bool _1578 = !_1556;
    float _1580 = _1576;
    if (!_1578)
    {
        float _1582 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1584 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1586 = _1550 + _1584;
        float _1588 = _1542 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1590 = rsqrt(_1544);
        float _1592 = _1586 * _1582;
        float _1594 = _1592 * 0.15915493667125701904296875;
        float _1596 = _1594 * 6.283185482025146484375;
        float _1598 = cos(_1596);
        float _1600 = _1594 * 6.283185482025146484375;
        float _1602 = sin(_1600);
        float _1604 = _1598 + (-1.0);
        float _1606 = _1604 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1608 = fma(_1602, _1588, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1610 = fma(_1542, _1598, _1606);
        float _1612 = _1590 * _1608;
        float _1614 = fma(_1530, _1612, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1616 = fma(_1522, _1612, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _1580 = _1610;
        _1570 = _1614;
        _1574 = _1616;
    }
    float _1618 = _1580;
    float _1620 = _1570;
    float _1622 = _1574;
    float _1624 = -_788;
    float _1626 = _1624 + _1618;
    float _1628 = -_794;
    float _1630 = _1628 + _1620;
    float _1632 = _1554 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _1634 = _1526 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _1636 = _1626 * _1626;
    float _1638 = -_956;
    float _1640 = _1638 + _1622;
    float _1642 = 1.0 / _1632;
    float _1644 = fma(_1548, (*spvDescriptorSet0.vp_c8)._m0[10].x, _1634);
    float _1646 = fma(_1630, _1630, _1636);
    float _1648 = -_1066;
    float _1650 = _1648 + _1618;
    float _1652 = fma(_1540, (*spvDescriptorSet0.vp_c8)._m0[10].z, _1644);
    float _1654 = fma(_1640, _1640, _1646);
    bool _1656 = (*spvDescriptorSet0.vp_c15)._m0[653].w >= 0.5;
    bool _1658 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _1660 = _1656 || _1658;
    bool _1662 = isnan(0.5);
    bool _1664 = _1660 || _1662;
    float _1666 = -_1098;
    float _1668 = _1666 + _1622;
    float _1670 = _1652 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _1672 = sqrt(_1654);
    float _1674 = _1670 + _1632;
    float _1676 = _1674 * _1642;
    float _1678 = _1676 * 0.5;
    float _1680 = -_1068;
    float _1682 = _1680 + _1620;
    float _1684 = _1622;
    float _1686 = _1618;
    float _1688 = _1620;
    float _1690 = (*spvDescriptorSet0.vp_c8)._m0[30].w;
    float _1692 = _1682;
    float _1694 = _1668;
    if (_1664)
    {
        _1564 = 1.0;
    }
    float _1696 = _1564;
    float _1698 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _1700 = fma(_1678, (*spvDescriptorSet0.vp_c8)._m0[30].w, _1698);
    float _1702 = 1.0 / _1700;
    bool _1704 = _1672 > 0.0;
    float _1706 = _1696;
    if (!_1704)
    {
        _1684 = _1682;
    }
    float _1708 = _1684;
    float _1710 = _1708;
    if (!_1704)
    {
        _1686 = _1650;
    }
    float _1712 = _1686;
    float _1714 = _1712;
    if (!_1704)
    {
        _1688 = _1668;
    }
    float _1716 = _1688;
    bool _1718 = !_1704;
    float _1720 = _1716;
    float _1722 = _1716;
    if (!_1718)
    {
        float _1724 = _198 * _198;
        float _1726 = fma(_196, _196, _1724);
        float _1728 = rsqrt(_1654);
        float _1730 = fma(_200, _200, _1726);
        float _1732 = sqrt(_1730);
        float _1734 = _1630 * _1728;
        float _1736 = _1626 * _1728;
        float _1738 = _1640 * _1728;
        bool _1740 = _1732 > 0.0;
        float _1742 = _1728;
        float _1744 = _1732;
        _1690 = _1736;
        if (!_1740)
        {
            _1742 = _1682;
        }
        float _1746 = _1742;
        _1710 = _1746;
        if (!_1740)
        {
            _1744 = _1650;
        }
        float _1748 = _1744;
        _1714 = _1748;
        if (!_1740)
        {
            _1720 = _1668;
        }
        float _1750 = _1720;
        bool _1752 = !_1740;
        _1722 = _1750;
        if (!_1752)
        {
            float _1754 = rsqrt(_1730);
            float _1756 = 1.0 / (*spvDescriptorSet0.vp_c10)._m0[2].z;
            float _1758 = _198 * _1754;
            float _1760 = _196 * _1754;
            float _1762 = _1736 * _1758;
            float _1764 = _200 * _1754;
            float _1766 = fma(_1734, _1760, _1762);
            float _1768 = _1756 * (*spvDescriptorSet0.vp_c9)._m0[142].x;
            float _1770 = fma(_1738, _1764, _1766);
            float _1772 = _1770 * _1768;
            float _1774 = fma(_196, _1772, _1682);
            float _1776 = fma(_198, _1772, _1650);
            float _1778 = fma(_200, _1772, _1668);
            _1714 = _1776;
            _1710 = _1774;
            _1722 = _1778;
        }
    }
    float _1780 = _1714;
    float _1782 = _1710;
    float _1784 = _1722;
    float _1786 = _1690;
    float _1788 = _1786;
    if (_1664)
    {
        _1788 = 1.0;
    }
    float _1790 = _1788;
    float _1792 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _1794 = _1702 * _1792;
    float _1796 = _1790;
    if (!_1664)
    {
        float _1798 = (*spvDescriptorSet0.vp_c8)._m0[31].x * 0.5;
        float _1800 = _1798 * 0.15915493667125701904296875;
        float _1802 = _1800 * 6.283185482025146484375;
        float _1804 = cos(_1802);
        float _1806 = (*spvDescriptorSet0.vp_c8)._m0[31].y * 0.5;
        float _1808 = _1806 * 0.15915493667125701904296875;
        float _1810 = _1800 * 6.283185482025146484375;
        float _1812 = sin(_1810);
        float _1814 = 1.0 / _1804;
        float _1816 = _1808 * 6.283185482025146484375;
        float _1818 = cos(_1816);
        float _1820 = _1812 * _1814;
        float _1822 = _1808 * 6.283185482025146484375;
        float _1824 = sin(_1822);
        float _1826 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1828 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _1826;
        float _1830 = _1818 * _1820;
        float _1832 = 1.0 / _1828;
        float _1834 = 1.0 / _1830;
        float _1836 = _1824 * _1834;
        float _1838 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1840 = fma(_1794, _1836, _1838);
        float _1842 = _1840 * _1832;
        float _1844 = precise::clamp(_1842, 0.0, 1.0);
        _1692 = _1820;
        _1694 = _1800;
        _1706 = _1844;
    }
    float _1846 = _1692;
    float _1848 = _1694;
    float _1850 = _1706;
    float _1852 = _1846;
    float _1854 = _1848;
    if (!_1664)
    {
        float _1856 = (*spvDescriptorSet0.vp_c8)._m0[31].x * 0.5;
        float _1858 = _1856 * 0.15915493667125701904296875;
        float _1860 = _1858 * 6.283185482025146484375;
        float _1862 = cos(_1860);
        float _1864 = (*spvDescriptorSet0.vp_c8)._m0[31].y * 0.5;
        float _1866 = _1864 * 0.15915493667125701904296875;
        float _1868 = _1858 * 6.283185482025146484375;
        float _1870 = sin(_1868);
        float _1872 = 1.0 / _1862;
        float _1874 = _1866 * 6.283185482025146484375;
        float _1876 = cos(_1874);
        float _1878 = _1870 * _1872;
        float _1880 = _1866 * 6.283185482025146484375;
        float _1882 = sin(_1880);
        float _1884 = _1876 * _1878;
        float _1886 = 1.0 / _1884;
        float _1888 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _1890 = (*spvDescriptorSet0.vp_c9)._m0[140].w + _1888;
        float _1892 = 1.0 / _1890;
        float _1894 = _1882 * _1886;
        float _1896 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _1898 = fma(_1794, _1894, _1896);
        float _1900 = _1898 * _1892;
        float _1902 = precise::clamp(_1900, 0.0, 1.0);
        float _1904 = -_1902;
        float _1906 = _1904 + 1.0;
        _1852 = _1872;
        _1796 = _1906;
    }
    float _1908 = _1852;
    float _1910 = _1796;
    float _1912 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1914 = _1780 + _1912;
    float _1916 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1918 = _1782 + _1916;
    float _1920 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1922 = _1784 + _1920;
    float _1924 = _1914 * _1914;
    float _1926 = fma(_1918, _1918, _1924);
    float _1928 = fma(_1922, _1922, _1926);
    float _1930 = rsqrt(_1928);
    float _1932 = sqrt(_1928);
    float _1934 = _1930 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1936 = _1918 * _1934;
    float _1938 = _1922 * _1934;
    float _1940 = _1936 * _1936;
    float _1942 = _1938 * _1938;
    float _1944 = _1940 + _1942;
    float _1946 = sqrt(_1944);
    bool _1948 = _1946 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1950 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1952 = _1946 + _1950;
    float _1954 = _1922;
    float _1956 = _1924;
    float _1958 = _1952;
    float _1960 = _1914;
    float _1962 = _1908;
    if (_1948)
    {
        float _1964 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1954 = _1964;
    }
    float _1966 = _1954;
    if (_1948)
    {
        float _1968 = rsqrt(_1944);
        _1956 = _1968;
    }
    float _1970 = _1956;
    float _1972 = _1970;
    if (_1948)
    {
        float _1974 = _1952 * _1966;
        _1958 = _1974;
    }
    float _1976 = _1958;
    if (_1948)
    {
        float _1978 = _1976 * 0.15915493667125701904296875;
        _1854 = _1978;
    }
    float _1980 = _1854;
    float _1982 = _1930;
    float _1984 = _1980;
    if (_1948)
    {
        float _1986 = _1980 * 6.283185482025146484375;
        float _1988 = sin(_1986);
        _1982 = _1988;
    }
    float _1990 = _1982;
    float _1992 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _1994 = precise::max(0.0, _1992);
    float _1996 = _1966;
    float _1998 = _1994;
    if (_1948)
    {
        float _2000 = _1980 * 6.283185482025146484375;
        float _2002 = cos(_2000);
        _1996 = _2002;
    }
    float _2004 = _1996;
    float _2006 = -_1934;
    float _2008 = -_1994;
    float _2010 = fma(_1914, _2006, _2008);
    if (_1948)
    {
        float _2012 = _2010 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1960 = _2012;
    }
    float _2014 = _1960;
    if (!_1948)
    {
        _1984 = _1940;
    }
    float _2016 = _1984;
    float _2018 = _1990;
    float _2020 = _2016;
    if (_1948)
    {
        float _2022 = fma(_1990, _2014, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1962 = _2022;
    }
    float _2024 = _1962;
    float _2026 = _2024;
    if (!_1948)
    {
        _2018 = _2010;
    }
    float _2028 = _2018;
    float _2030 = _2028;
    float _2032 = _2004;
    if (_1948)
    {
        float _2034 = _2004 + (-1.0);
        _1998 = _2034;
    }
    float _2036 = _1998;
    float _2038 = _2036;
    if (_1948)
    {
        float _2040 = _1970 * _2024;
        _1566 = _2040;
    }
    float _2042 = _1566;
    if (!_1948)
    {
        _1972 = _1936;
    }
    float _2044 = _1972;
    float _2046 = _2044;
    if (_1948)
    {
        float _2048 = _2036 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2038 = _2048;
    }
    float _2050 = _2038;
    if (_1948)
    {
        float _2052 = _1936 * _2042;
        _2046 = _2052;
    }
    float _2054 = _2046;
    if (!_1948)
    {
        _2026 = _1942;
    }
    float _2056 = _2026;
    float _2058 = fma(_1548, (*spvDescriptorSet0.vp_c15)._m0[652].x, (*spvDescriptorSet0.vp_c15)._m0[652].z);
    float _2060 = _2056;
    if (_1948)
    {
        float _2062 = fma(_2010, _2004, _2050);
        _2030 = _2062;
    }
    float _2064 = _2030;
    if (_1948)
    {
        float _2066 = _2054 * _2054;
        _2020 = _2066;
    }
    float _2068 = _2020;
    if (!_1948)
    {
        _2032 = _1938;
    }
    float _2070 = _2032;
    float _2072 = _2070;
    if (_1948)
    {
        float _2074 = _1938 * _2042;
        _2072 = _2074;
    }
    float _2076 = _2072;
    float _2078 = fma(_2064, _2064, _2068);
    float _2080 = _1780 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    if (_1948)
    {
        float _2082 = _2076 * _2076;
        _2060 = _2082;
    }
    float _2084 = _2060;
    float _2086 = floor(_2058);
    float _2088 = fma(_1782, (*spvDescriptorSet0.vp_c8)._m0[2].x, _2080);
    float _2090 = _2078 + _2084;
    float _2092 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _2094 = fma(_1932, (*spvDescriptorSet0.vp_c15)._m0[23].w, _2092);
    float _2096 = precise::clamp(_2094, 0.0, 1.0);
    float _2098 = fma(_1784, (*spvDescriptorSet0.vp_c8)._m0[2].z, _2088);
    float _2100 = -_2096;
    float _2102 = _2100 + 1.0;
    float _2104 = rsqrt(_2090);
    float _2106 = _2098 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _2108 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _2110 = fma(_1540, (*spvDescriptorSet0.vp_c15)._m0[652].y, (*spvDescriptorSet0.vp_c15)._m0[652].w);
    float _2112 = _1780 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _2114 = _2106 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _2116 = abs(_2102);
    float _2118 = log2(_2116);
    float _2120 = _1780 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _2122 = -_2114;
    float _2124 = fma(_2122, _2108, 1.0);
    float _2126 = _1780 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _2128 = fma(_1782, (*spvDescriptorSet0.vp_c8)._m0[3].x, _2112);
    float _2130 = fma(_1782, (*spvDescriptorSet0.vp_c8)._m0[1].x, _2120);
    float _2132 = -_2086;
    float _2134 = _2058 + _2132;
    float _2136 = fma(_1782, (*spvDescriptorSet0.vp_c8)._m0[0].x, _2126);
    float _2138 = _2104 * _2054;
    float _2140 = fma(_1784, (*spvDescriptorSet0.vp_c8)._m0[1].z, _2130);
    float _2142 = _2104 * _2064;
    float _2144 = fma(_1784, (*spvDescriptorSet0.vp_c8)._m0[0].z, _2136);
    float _2146 = _2104 * _2076;
    float _2148 = _2140 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _2150 = _2138 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _2152 = _2144 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _2154 = floor(_2110);
    float _2156 = _2148 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _2158 = -_2150;
    float _2160 = fma(_2142, (*spvDescriptorSet0.vp_c15)._m0[21].y, _2158);
    float _2162 = fma(_1784, (*spvDescriptorSet0.vp_c8)._m0[3].z, _2128);
    float _2164 = _2118 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _2166 = fma(_2152, (*spvDescriptorSet0.vp_c8)._m0[7].x, _2156);
    float _2168 = -_2146;
    float _2170 = fma(_2168, (*spvDescriptorSet0.vp_c15)._m0[21].z, _2160);
    float _2172 = _2162 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _2174 = fma(_2106, (*spvDescriptorSet0.vp_c8)._m0[7].z, _2166);
    float _2176 = fma(_2170, -0.5, 0.5);
    float _2178 = fma(_2170, 0.5, 0.5);
    float _2180 = exp2(_2164);
    float _2182 = fma(_2172, (*spvDescriptorSet0.vp_c8)._m0[7].w, _2174);
    float _2184 = _2148 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _2186 = _2148 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _2188 = -_2154;
    float _2190 = _2110 + _2188;
    float _2192 = fma(_2178, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _2194 = fma(_2152, (*spvDescriptorSet0.vp_c8)._m0[4].x, _2184);
    float _2196 = fma(_2152, (*spvDescriptorSet0.vp_c8)._m0[5].x, _2186);
    float _2198 = 1.0 / _2182;
    float _2200 = fma(_2178, _2192, -0.212114393711090087890625);
    float _2202 = fma(_2106, (*spvDescriptorSet0.vp_c8)._m0[4].z, _2194);
    float _2204 = fma(_2106, (*spvDescriptorSet0.vp_c8)._m0[5].z, _2196);
    float _2206 = log2(_2124);
    float _2208 = fma(_2172, (*spvDescriptorSet0.vp_c8)._m0[4].w, _2202);
    float _2210 = fma(_2172, (*spvDescriptorSet0.vp_c8)._m0[5].w, _2204);
    float _2212 = sqrt(_2176);
    float _2214 = _2208 * _2198;
    float2 _6663 = float2(_2134, _2190);
    float _2216 = dm_bs(spvDescriptorSet0.vp_t_tcb_24.sample(spvDescriptorSet0.vp_t_tcb_24Smplr, select(_6663, float2(0.0), isnan(_6663)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_24, spvDescriptorSet0.vp_t_tcb_24Smplr_w, select(_6663, float2(0.0), isnan(_6663)), level(0.0)).x;
    float _2218 = fma(_2178, _2200, 1.570728778839111328125);
    float _2220 = _2206 * 0.693147182464599609375;
    float _2222 = _2142 + 1.0;
    float _2224 = _2220 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _2226 = -_2142;
    float _2228 = fma(_2180, _2222, _2226);
    float _2230 = _2210 * _2198;
    float _2232 = fma(_2214, 0.5, 0.5);
    float _2234 = _2212 * 0.636619746685028076171875;
    float _2236 = fma(_2228, 0.5, 0.5);
    float _2238 = fma(_2230, -0.5, 0.5);
    float _2240 = -_2218;
    float _2242 = fma(_2234, _2240, 1.0);
    float3 _6710 = float3(_2232, _2238, _2224);
    float _2244 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_6710, float3(0.0), isnan(_6710)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_6710, float3(0.0), isnan(_6710)), level(0.0)).x;
    float3 _6721 = float3(_2232, _2238, _2224);
    float4 _2247 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_6721, float3(0.0), isnan(_6721)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_6721, float3(0.0), isnan(_6721)), level(0.0)).xyzw;
    float _2249 = _2247.x;
    float _2251 = _2247.y;
    float _2253 = _2247.z;
    float _2255 = _2247.w;
    float2 _6737 = float2(_2242, _2236);
    float3 _2259 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_6737, float2(0.0), isnan(_6737)), level(0.0)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_6737, float2(0.0), isnan(_6737)), level(0.0)).xyz;
    float _2261 = _2259.x;
    float _2263 = _2259.y;
    float _2265 = _2259.z;
    float _2267 = in.m_57.w;
    float _2269 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].z;
    float _2271 = in.m_65.y;
    bool _2273 = _660 > 0.5;
    float _2275 = _2118 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    bool _2277 = _664 > 0.5;
    float _2279 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _2281 = _2279 + (*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _2283 = -(*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _2285 = _2283 + (*spvDescriptorSet0.vp_c9)._m0[133].w;
    float _2287 = in.m_65.x;
    float _2289 = 1.0 / _2281;
    float _2291 = _2148 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _2293 = -(*spvDescriptorSet0.vp_c9)._m0[133].w;
    float _2295 = _2293 + (*spvDescriptorSet0.vp_c9)._m0[134].w;
    out.m_67.x = _616;
    out.m_67.y = _630;
    out.m_67.z = _618;
    out.m_67.w = _634;
    float _2297 = fma(_2152, (*spvDescriptorSet0.vp_c8)._m0[6].x, _2291);
    float _2299 = 1.0 / _2285;
    out.m_69.w = _1048;
    float _2301 = fma(_2106, (*spvDescriptorSet0.vp_c8)._m0[6].z, _2297);
    bool _2303 = _2267 > 0.5;
    out.m_71.x = _1548;
    out.m_71.y = _1526;
    out.m_71.z = _1540;
    float _2305 = -_2271;
    float _2307 = _2305 + 1.0;
    float _2309 = 1.0 / _2295;
    int _2311 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _2313 = _2311 != 0;
    float _2315 = -(*spvDescriptorSet0.vp_c9)._m0[132].x;
    float _2317 = _2315 + (*spvDescriptorSet0.vp_c9)._m0[133].x;
    int _2319 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _2321 = _2319 != 0;
    float _2323 = -(*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _2325 = _658 + _2323;
    int _2327 = _2277 ? as_type<int>(_2307) : as_type<int>(_2271);
    float _2329 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _2331 = _658 + _2329;
    float _2333 = _2317 * _2299;
    int _2335 = _2303 ? as_type<int>(_2307) : as_type<int>(_2271);
    float _2337 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].w;
    float _2339 = _2321 ? as_type<float>(_2327) : _2271;
    float _2341 = -(*spvDescriptorSet0.vp_c9)._m0[131].x;
    float _2343 = (*spvDescriptorSet0.vp_c9)._m0[132].x + _2341;
    int _2345 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 32;
    bool _2347 = _2345 != 0;
    float _2349 = _1272 * _1326;
    float _2351 = _2299;
    float _2353 = _2289;
    float _2355 = _2271;
    float _2357 = _2208;
    if (!_2313)
    {
        _2351 = _2287;
    }
    float _2359 = _2351;
    float _2361 = _2343 * _2289;
    bool _2363 = _658 >= (*spvDescriptorSet0.vp_c9)._m0[134].w;
    bool _2365 = isnan(_658);
    bool _2367 = _2363 || _2365;
    bool _2369 = isnan((*spvDescriptorSet0.vp_c9)._m0[134].w);
    bool _2371 = _2367 || _2369;
    float _2373 = float(_2371);
    float _2375 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _2377 = fma(_2361, _2331, (*spvDescriptorSet0.vp_c9)._m0[131].x);
    int _2379 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _2381 = _2379 != 0;
    float _2383 = _1272 * _1336;
    int _2385 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 16;
    bool _2387 = _2385 != 0;
    float _2389 = -(*spvDescriptorSet0.vp_c9)._m0[133].x;
    float _2391 = (*spvDescriptorSet0.vp_c9)._m0[134].x + _2389;
    int _2393 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _2395 = _2393 != 0;
    float _2397 = fma(_2333, _2325, (*spvDescriptorSet0.vp_c9)._m0[132].x);
    float _2399 = _2359;
    bool _2401 = _2395;
    if (!_2313)
    {
        _2353 = _2359;
    }
    float _2403 = _2353;
    float _2405 = _2391 * _2309;
    float _2407 = _2403;
    if (_2313)
    {
        _2399 = _2287;
    }
    float _2409 = _2399;
    float _2411 = -_2373;
    float _2413 = _2411 + 1.0;
    bool _2415 = _658 >= (*spvDescriptorSet0.vp_c9)._m0[133].w;
    bool _2417 = isnan(_658);
    bool _2419 = _2415 || _2417;
    bool _2421 = isnan((*spvDescriptorSet0.vp_c9)._m0[133].w);
    bool _2423 = _2419 || _2421;
    float _2425 = float(_2423);
    float _2427 = _2337 * (*spvDescriptorSet0.vp_c9)._m0[90].y;
    bool _2429 = _658 >= (*spvDescriptorSet0.vp_c9)._m0[132].w;
    bool _2431 = isnan(_658);
    bool _2433 = _2429 || _2431;
    bool _2435 = isnan((*spvDescriptorSet0.vp_c9)._m0[132].w);
    bool _2437 = _2433 || _2435;
    float _2439 = float(_2437);
    int _2441 = 0;
    float _2443 = _2409;
    if (_2381)
    {
        float _2445 = -_2409;
        float _2447 = _2445 + 1.0;
        _2441 = as_type<int>(_2447);
    }
    int _2449 = _2441;
    float _2451 = _2395 ? as_type<float>(_2335) : _2271;
    float _2453 = _2425 * _2413;
    float _2455 = -_2425;
    float _2457 = _2455 + 1.0;
    int _2459 = as_type<int>(_2457);
    float _2461 = as_type<float>(_2449);
    if (_2313)
    {
        bool _2463 = _692 > 0.5;
        _2401 = _2463;
    }
    bool _2465 = _2401;
    int _2467 = 0;
    if (_2387)
    {
        float _2469 = -_2409;
        float _2471 = _2469 + 1.0;
        _2467 = as_type<int>(_2471);
    }
    int _2473 = _2467;
    float _2475 = in.m_73.x;
    float _2477 = in.m_73.y;
    float _2479 = in.m_73.z;
    if (_2347)
    {
        float _2481 = _2273 ? _2307 : _2271;
        _2355 = _2481;
    }
    float _2483 = _2355;
    float _2485 = _2439 * _2457;
    bool _2487 = _658 >= (*spvDescriptorSet0.vp_c9)._m0[131].w;
    bool _2489 = isnan(_658);
    bool _2491 = _2487 || _2489;
    bool _2493 = isnan((*spvDescriptorSet0.vp_c9)._m0[131].w);
    bool _2495 = _2491 || _2493;
    float _2497 = float(_2495);
    float _2499 = -_2439;
    float _2501 = _2499 + 1.0;
    bool _2503 = _1206 != 0.0;
    bool _2505 = isnan(_1206);
    bool _2507 = _2503 || _2505;
    bool _2509 = isnan(0.0);
    bool _2511 = _2507 || _2509;
    float _2513 = _2483;
    if (_2313)
    {
        float _2515 = -_2409;
        float _2517 = _2515 + 1.0;
        _2459 = as_type<int>(_2517);
    }
    int _2519 = _2459;
    float _2521 = -(*spvDescriptorSet0.vp_c9)._m0[133].w;
    float _2523 = _658 + _2521;
    float _2525 = _2497 * _2501;
    bool _2527 = _1204 == 0.0;
    bool _2529 = !_2511;
    bool _2531 = _2527 && _2529;
    float _2533 = -_2497;
    float _2535 = _2533 + 1.0;
    float _2537 = _2535;
    if (_2313)
    {
        float _2539 = _2465 ? as_type<float>(_2519) : _2409;
        _2407 = _2539;
    }
    float _2541 = _2407;
    float _2543 = _2377 * _2525;
    bool _2545 = _1208 == 0.0;
    bool _2547 = _2545 && _2531;
    float _2549 = in.m_75.x;
    float _2551 = in.m_75.y;
    float _2553 = in.m_75.z;
    float _2555 = in.m_75.w;
    float _2557 = 0.0;
    if (!_2381)
    {
        _2557 = _2409;
    }
    float _2559 = _2557;
    float _2561 = fma(_2535, (*spvDescriptorSet0.vp_c9)._m0[131].x, _2543);
    float _2563 = _2559;
    if (_2381)
    {
        float _2565 = _2273 ? as_type<float>(_2449) : _2409;
        _2563 = _2565;
    }
    float _2567 = _2563;
    float _2569 = fma(_2405, _2523, (*spvDescriptorSet0.vp_c9)._m0[133].x);
    float _2571 = 0.0;
    if (!_2387)
    {
        _2571 = _2409;
    }
    float _2573 = _2571;
    float _2575 = fma(_2427, _2483, -0.5);
    float _2577 = _2573;
    if (_2387)
    {
        float _2579 = _2277 ? as_type<float>(_2473) : _2409;
        _2577 = _2579;
    }
    float _2581 = _2577;
    float _2583 = _2269 * (*spvDescriptorSet0.vp_c9)._m0[90].x;
    float _2585 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _2587 = _2541 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _2589 = fma(_2397, _2485, _2561);
    float _2591 = 0.0;
    if (_2547)
    {
        _2591 = _2475;
    }
    float _2593 = _2591;
    float _2595 = fma(_2583, _2581, -0.5);
    float _2597 = _2593;
    if (_2547)
    {
        _2461 = _2477;
    }
    float _2599 = _2461;
    float _2601 = fma(_2569, _2453, _2589);
    float _2603 = _2599;
    if (_2547)
    {
        _2537 = _2593;
    }
    float _2605 = _2537;
    float _2607 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    float _2609 = _2605;
    if (!_2547)
    {
        _2597 = _2475;
    }
    float _2611 = _2597;
    float _2613 = -_966;
    float _2615 = fma(_958, _2575, _2613);
    if (_2547)
    {
        _2513 = _2599;
    }
    float _2617 = _2513;
    float _2619 = fma(_2373, (*spvDescriptorSet0.vp_c9)._m0[134].x, _2601);
    float _2621 = _2617;
    if (!_2547)
    {
        _2603 = _2477;
    }
    float _2623 = _2603;
    float _2625 = _2339 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _2627 = fma(_970, _2595, _964);
    float _2629 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    if (_2547)
    {
        _2443 = _2479;
    }
    float _2631 = _2443;
    float _2633 = _2631;
    if (!_2547)
    {
        float _2635 = fma(_1206, (*spvDescriptorSet0.vp_c9)._m0[17].y, _2623);
        _2621 = _2635;
    }
    float _2637 = _2621;
    float _2639 = _2553 * _2611;
    if (!_2547)
    {
        float _2641 = fma(_1208, (*spvDescriptorSet0.vp_c9)._m0[17].y, _2479);
        _2633 = _2641;
    }
    float _2643 = _2633;
    float _2645 = _2451 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    float _2647 = _2625 * _2375;
    float _2649 = -_2639;
    float _2651 = fma(_2549, _2479, _2649);
    float _2653 = _2551 * _2479;
    float _2655 = _2567 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    if (!_2547)
    {
        float _2657 = fma(_1204, (*spvDescriptorSet0.vp_c9)._m0[17].y, _2611);
        _2609 = _2657;
    }
    float _2659 = _2609;
    float _2661 = _2549 * _2623;
    float _2663 = -_2653;
    float _2665 = fma(_2553, _2623, _2663);
    float _2667 = _2655 * _2607;
    float _2669 = -_2661;
    float _2671 = fma(_2551, _2611, _2669);
    float _2673 = _2645 * _2629;
    float _2675 = _2587 * _2585;
    float _2677 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _2679 = _2627 + 0.5;
    out.m_77.x = _2675;
    out.m_77.y = _2647;
    out.m_77.z = _2667;
    out.m_77.w = _2673;
    float _2681 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _2683 = _2677 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2685 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _2687 = _2619 * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    float _2689 = _2681 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2691 = _1250 * _1326;
    float _2693 = _2685 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2695 = _1284 * _1326;
    float _2697 = fma(_1238, _1312, _2349);
    float _2699 = -_1248;
    float _2701 = fma(_2699, _1312, _2691);
    float _2703 = _2615 + 0.5;
    out.m_79.x = _2689;
    out.m_79.y = _2683;
    out.m_79.z = _2693;
    out.m_79.w = _2687;
    float _2705 = fma(_1238, _1308, _2383);
    float _2707 = _2651 * _2555;
    float _2709 = _1250 * _1332;
    float _2711 = abs(_1794);
    float _2713 = log2(_2711);
    float _2715 = _1250 * _1336;
    float _2717 = _1272 * _1332;
    float _2719 = _1284 * _1332;
    float _2721 = -_1248;
    float _2723 = fma(_2721, _1310, _2709);
    float _2725 = -_1248;
    float _2727 = fma(_2725, _1308, _2715);
    float _2729 = _1284 * _1336;
    float _2731 = fma(_1232, _1168, _2701);
    float _2733 = fma(_1232, _1140, _2723);
    float _2735 = fma(_1232, _1146, _2727);
    float _2737 = fma(_1260, _1312, _2695);
    float _2739 = fma(_1260, _1308, _2729);
    float _2741 = fma(_1280, _1168, _2697);
    out.m_81.x = _2679;
    out.m_81.y = _2703;
    float _2743 = fma(_1274, _1168, _2737);
    float _2745 = _2713 * (*spvDescriptorSet0.vp_c15)._m0[654].z;
    float _2747 = fma(_1238, _1310, _2717);
    float _2749 = fma(_1280, _1146, _2705);
    float _2751 = fma(_1274, _1146, _2739);
    float _2753 = _2733 * _2551;
    float _2755 = _2731 * _2551;
    float _2757 = exp2(_2745);
    float _2759 = _2735 * _2551;
    float _2761 = _2735 * _2637;
    float _2763 = _2707 * _2733;
    float _2765 = _2707 * _2731;
    float _2767 = _2707 * _2735;
    float _2769 = fma(_1280, _1140, _2747);
    float _2771 = _2733 * _2637;
    float _2773 = _2665 * _2555;
    float _2775 = _2731 * _2637;
    float _2777 = _2671 * _2555;
    float _2779 = exp2(_2275);
    float _2781 = fma(_2773, _2741, _2765);
    float _2783 = fma(_2741, _2659, _2775);
    float _2785 = fma(_2749, _2659, _2761);
    float _2787 = fma(_2757, (*spvDescriptorSet0.vp_c15)._m0[654].x, (*spvDescriptorSet0.vp_c15)._m0[654].y);
    float _2789 = precise::clamp(_2787, 0.0, 1.0);
    float _2791 = fma(_2769, _2659, _2771);
    float _2793 = fma(_2773, _2769, _2763);
    float _2795 = fma(_2741, _2549, _2755);
    float _2797 = fma(_2789, -2.0, 3.0);
    float _2799 = _2789 * _2789;
    float _2801 = fma(_2773, _2749, _2767);
    float _2803 = fma(_1260, _1310, _2719);
    bool _2805 = _1794 <= 8000.0;
    bool _2807 = isnan(_1794);
    bool _2809 = _2805 || _2807;
    bool _2811 = isnan(8000.0);
    bool _2813 = _2809 || _2811;
    float _2815 = float(_2813);
    float _2817 = _2799 * _2797;
    float _2819 = fma(_2769, _2549, _2753);
    float _2821 = fma(_1274, _1140, _2803);
    float _2823 = fma(_2749, _2549, _2759);
    float _2825 = -_2817;
    float _2827 = _2825 + 1.0;
    float _2829 = fma(_2777, _2743, _2781);
    float _2831 = fma(_2777, _2821, _2793);
    float _2833 = -_2779;
    float _2835 = _2833 + 1.0;
    float _2837 = fma(_2827, (*spvDescriptorSet0.vp_c15)._m0[654].w, _2817);
    float _2839 = fma(_2777, _2751, _2801);
    float _2841 = fma(_2821, _2553, _2819);
    float _2843 = in.m_83.x;
    float _2845 = _2815 * _2837;
    float _2847 = fma(_2743, _2553, _2795);
    float _2849 = fma(_2751, _2553, _2823);
    out.m_85.x = _2831;
    out.m_85.y = _2829;
    out.m_85.z = _2839;
    float _2851 = _2845 * (*spvDescriptorSet0.vp_c15)._m0[653].x;
    float _2853 = fma(_2172, (*spvDescriptorSet0.vp_c8)._m0[6].w, _2301);
    float _2855 = _2182 * 0.5;
    out.m_87.x = _2841;
    out.m_87.y = _2847;
    out.m_87.z = _2849;
    float _2857 = _2208 + _2182;
    float _2859 = _2853 + _2182;
    float _2861 = fma(_2210, -0.5, _2855);
    float _2863 = fma(_2821, _2643, _2791);
    float _2865 = _2859 * 0.5;
    float _2867 = _2857 * 0.5;
    float _2869 = _2835 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _2871 = fma(_2743, _2643, _2783);
    float _2873 = fma(_2751, _2643, _2785);
    out.m_89.x = _1212;
    bool _2875 = _1932 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _2877 = isnan(_1932);
    bool _2879 = _2875 || _2877;
    bool _2881 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _2883 = _2879 || _2881;
    out.m_91.x = _2867;
    out.m_91.y = _2861;
    out.m_91.z = _2865;
    out.m_91.w = _2182;
    out.m_93.x = _2863;
    out.m_93.y = _2871;
    out.m_93.z = _2873;
    out.m_95.x = _1782;
    out.m_95.y = _1780;
    out.m_95.z = _1784;
    float _2885 = _2823;
    float _2887 = (*spvDescriptorSet0.vp_c15)._m0[653].y;
    if (!_2883)
    {
        _2885 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _2889 = _2885;
    out.gl_Position.x = _2208;
    out.gl_Position.y = _2210;
    out.gl_Position.z = _2853;
    out.gl_Position.w = _2182;
    float _2891 = _2889;
    float _2893 = _2889;
    if (!_2883)
    {
        _2357 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _2895 = _2357;
    float _2897 = -_2216;
    float _2899 = _2897 + 1.0;
    float _2901 = _2899 * _2851;
    float _2903 = precise::clamp(_2901, 0.0, 1.0);
    float _2905 = -_2903;
    float _2907 = fma(_2905, (*spvDescriptorSet0.vp_c15)._m0[653].y, 1.0);
    float _2909 = _2843;
    float _2911 = _2895;
    float _2913 = _2895;
    if (!_2883)
    {
        _2887 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _2915 = _2887;
    float _2917 = _2907 * _2843;
    float _2919 = _2915;
    float _2921 = _2915;
    if (!_2883)
    {
        _2909 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _2923 = _2909;
    float _2925 = _2917 * (*spvDescriptorSet0.vp_c13)._m0[1].w;
    float _2927 = _2869 * _2244;
    float _2929 = -_2869;
    float _2931 = _2929 + 1.0;
    out.m_97.x = _2925;
    float _2933 = _2255 * _2927;
    float _2935 = _2265 * _2927;
    float _2937 = _2255 * _2931;
    float _2939 = _1850 * _1910;
    float _2941 = fma(_2261, _2933, _2249);
    float _2943 = fma(_2263, _2933, _2251);
    float _2945 = fma(_2255, _2935, _2253);
    float _2947 = _2939 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _2949 = _2927;
    float _2951 = _2939;
    float _2953 = _2923;
    float _2955 = _2923;
    if (!_2883)
    {
        _2949 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _2957 = _2949;
    float _2959 = _2957;
    float _2961 = _2957;
    if (!_2883)
    {
        _2951 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _2963 = _2951;
    out.m_99.x = _2941;
    out.m_99.y = _2943;
    out.m_99.z = _2945;
    out.m_99.w = _2937;
    bool _2965 = !_2883;
    float _2967 = _2963;
    float _2969 = _2963;
    if (!_2965)
    {
        bool _2971 = _1932 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _2973 = isnan(_1932);
        bool _2975 = _2971 || _2973;
        bool _2977 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _2979 = _2975 || _2977;
        if (!_2979)
        {
            float _2981 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2983 = _1932 + _2981;
            float _2985 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2987 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _2985;
            float _2989 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _2991 = _2989 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _2993 = 1.0 / _2987;
            float _2995 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _2997 = _2995 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _2999 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _3001 = _2999 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _3003 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _3005 = _3003 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _3007 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _3009 = _3007 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _3011 = _2983 * _2993;
            float _3013 = precise::clamp(_3011, 0.0, 1.0);
            float _3015 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _3017 = _3015 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _3019 = fma(_3013, _2991, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _3021 = fma(_3013, _3017, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _3023 = fma(_3013, _2997, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _3025 = fma(_3013, _3001, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _3027 = fma(_3013, _3005, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _3029 = fma(_3013, _3009, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            _2913 = _3023;
            _2921 = _3027;
            _2893 = _3019;
            _2961 = _3025;
            _2955 = _3021;
            _2969 = _3029;
            _3031 = true;
        }
        else
        {
            bool _3033 = _1932 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _3035 = isnan(_1932);
            bool _3037 = _3033 || _3035;
            bool _3039 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _3041 = _3037 || _3039;
            if (!_3041)
            {
                _2891 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _3043 = _2891;
            _2893 = _3043;
            if (!_3041)
            {
                _2911 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _3045 = _2911;
            _2913 = _3045;
            if (!_3041)
            {
                _2953 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _3047 = _2953;
            _2955 = _3047;
            if (!_3041)
            {
                _2959 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _3049 = _2959;
            _2961 = _3049;
            if (!_3041)
            {
                _2919 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _3051 = _2919;
            _2921 = _3051;
            if (!_3041)
            {
                _2967 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _3053 = _2967;
            bool _3055 = !_3041;
            _2969 = _3053;
            if (!_3055)
            {
                bool _3057 = _1932 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _3059 = isnan(_1932);
                bool _3061 = _3057 || _3059;
                bool _3063 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _3065 = _3061 || _3063;
                if (!_3065)
                {
                    float _3067 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _3069 = _1932 + _3067;
                    float _3071 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _3073 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _3071;
                    float _3075 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _3077 = _3075 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _3079 = 1.0 / _3073;
                    float _3081 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _3083 = _3081 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _3085 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _3087 = _3085 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _3089 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _3091 = _3089 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _3093 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _3095 = _3093 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _3097 = _3069 * _3079;
                    float _3099 = precise::clamp(_3097, 0.0, 1.0);
                    float _3101 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _3103 = _3101 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _3105 = fma(_3099, _3077, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _3107 = fma(_3099, _3103, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _3109 = fma(_3099, _3083, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _3111 = fma(_3099, _3087, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _3113 = fma(_3099, _3091, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _3115 = fma(_3099, _3095, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    _2913 = _3109;
                    _2921 = _3113;
                    _2893 = _3105;
                    _2961 = _3111;
                    _2955 = _3107;
                    _2969 = _3115;
                    _3031 = true;
                }
                else
                {
                    _2913 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _2921 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _2893 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _2961 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _2955 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _2969 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _3031 = false;
    float _3117 = _2913;
    float _3119 = _2921;
    float _3121 = _2893;
    float _3123 = _2961;
    float _3125 = _2955;
    float _3127 = _2969;
    float _3129 = fma(_2871, -0.5, 0.5);
    float _3131 = precise::clamp(_3129, 0.0, 1.0);
    float _3133 = -_3117;
    float _3135 = _3133 + _3119;
    float _3137 = _2947 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _3139 = -_3121;
    float _3141 = _3139 + _3123;
    float _3143 = fma(_3131, _3135, _3117);
    out.m_101.x = 0.0;
    float _3145 = -_3125;
    float _3147 = _3145 + _3127;
    float _3149 = fma(_3131, _3141, _3121);
    float _3151 = _3143 * 0.586610972881317138671875;
    out.m_49.x = _3137;
    bool _3153 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _3155 = fma(_3131, _3147, _3125);
    float _3157 = fma(_3149, 0.298911988735198974609375, _3151);
    bool _3159 = _1850 > 0.0;
    bool _3161 = isnan(_1850);
    bool _3163 = _3159 || _3161;
    bool _3165 = isnan(0.0);
    bool _3167 = _3163 || _3165;
    float _3169 = fma(_3155, 0.114477999508380889892578125, _3157);
    bool _3171 = _1910 <= 0.0;
    bool _3173 = !_3167;
    bool _3175 = _3171 || _3173;
    float _3177 = -_3169;
    float _3179 = _3149 + _3177;
    float _3181 = -_3169;
    float _3183 = _3143 + _3181;
    float _3185 = -_3169;
    float _3187 = _3155 + _3185;
    float _3189 = fma(_3179, (*spvDescriptorSet0.vp_c13)._m0[1].z, _3169);
    float _3191 = fma(_3183, (*spvDescriptorSet0.vp_c13)._m0[1].z, _3169);
    float _3193 = fma(_3187, (*spvDescriptorSet0.vp_c13)._m0[1].z, _3169);
    bool _3195 = !_3153;
    if (!_3195)
    {
        float _3197 = -_1780;
        float _3199 = _3197 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
        float _3201 = -_1782;
        float _3203 = _3201 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
        float _3205 = -_1784;
        float _3207 = _3205 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
        float _3209 = _3199 * _3199;
        float _3211 = fma(_3203, _3203, _3209);
        float _3213 = fma(_3207, _3207, _3211);
        float _3215 = sqrt(_3213);
        float _3217 = rsqrt(_3213);
        float _3219 = -_3215;
        float _3221 = _3219 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
        float _3223 = _3221 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
        float _3225 = precise::clamp(_3223, 0.0, 1.0);
        float _3227 = _3203 * _3217;
        float _3229 = _3199 * _3217;
        float _3231 = abs(_3225);
        float _3233 = log2(_3231);
        float _3235 = _3207 * _3217;
        float _3237 = _3227 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
        float _3239 = _2871 * _3229;
        float _3241 = -_3229;
        float _3243 = -_3237;
        float _3245 = fma(_3241, (*spvDescriptorSet0.vp_c15)._m0[656].y, _3243);
        float _3247 = fma(_2863, _3227, _3239);
        float _3249 = -_3235;
        float _3251 = fma(_3249, (*spvDescriptorSet0.vp_c15)._m0[656].z, _3245);
        float _3253 = fma(_2873, _3235, _3247);
        float _3255 = precise::clamp(_3253, 0.0, 1.0);
        float _3257 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
        float _3259 = _3251 + _3257;
        float _3261 = _3233 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
        float _3263 = _3259 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
        float _3265 = precise::clamp(_3263, 0.0, 1.0);
        float _3267 = exp2(_3261);
        float _3269 = _3267 * _3265;
        float _3271 = _3255 * _3269;
        float _3273 = _3271 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
        float _3275 = _3271 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
        float _3277 = _3271 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
        out.m_101.x = _3273;
        out.m_101.y = _3275;
        out.m_101.z = _3277;
    }
    out.m_69.x = _3189;
    out.m_69.y = _3191;
    out.m_69.z = _3193;
    if (!_3175)
    {
        return out;
    }
    out.m_49.x = 0.0;
    float _3279 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _3279;
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
    out.m_67 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_79 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_101 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_97 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_99 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_69 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_53 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_89 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_77 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_81 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_71 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_91 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_49 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_85 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_93 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_95 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_87 = float4(0.0, 0.0, 0.0, 1.0);
    bool _3031 = false;
    bool _656 = false;
    bool _558 = false;
    bool _450 = false;
    bool _222 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _115 = in.m_46.w;
    float _117 = trunc(_115);
    int _120 = int(_117);
    bool _124 = _120 >= 1;
    float _126 = 0.0;
    if (!_124)
    {
        _126 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _128 = _126;
    if (!_124)
    {
        out.m_49.x = 0.0;
    }
    int _130 = 0;
    if (!_124)
    {
        float _132 = _128 * 5.0;
        _130 = as_type<int>(_132);
    }
    int _134 = _130;
    if (!_124)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _3334 = as_type<float>(_134);
        out.gl_Position.z = _3334;
    }
    if (!_124)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_67.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_67.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_67.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_67.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_79.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_79.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_79.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_79.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_101.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_101.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_101.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_101.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_97.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_97.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_97.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_97.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_99.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_99.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_99.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_99.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_69.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_69.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_69.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_69.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_53.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_53.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_53.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_53.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_89.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_89.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_89.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_89.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_77.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_77.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_77.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_77.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_81.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_81.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_81.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_81.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_71.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_71.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_71.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_71.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_91.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_91.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_91.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_91.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_49.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_49.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_49.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_49.w)); dm_cw(dm_gs, dm_p, 68, as_type<uint>(out.m_85.x)); dm_cw(dm_gs, dm_p, 69, as_type<uint>(out.m_85.y)); dm_cw(dm_gs, dm_p, 70, as_type<uint>(out.m_85.z)); dm_cw(dm_gs, dm_p, 71, as_type<uint>(out.m_85.w)); dm_cw(dm_gs, dm_p, 72, as_type<uint>(out.m_93.x)); dm_cw(dm_gs, dm_p, 73, as_type<uint>(out.m_93.y)); dm_cw(dm_gs, dm_p, 74, as_type<uint>(out.m_93.z)); dm_cw(dm_gs, dm_p, 75, as_type<uint>(out.m_93.w)); dm_cw(dm_gs, dm_p, 76, as_type<uint>(out.m_95.x)); dm_cw(dm_gs, dm_p, 77, as_type<uint>(out.m_95.y)); dm_cw(dm_gs, dm_p, 78, as_type<uint>(out.m_95.z)); dm_cw(dm_gs, dm_p, 79, as_type<uint>(out.m_95.w)); dm_cw(dm_gs, dm_p, 80, as_type<uint>(out.m_87.x)); dm_cw(dm_gs, dm_p, 81, as_type<uint>(out.m_87.y)); dm_cw(dm_gs, dm_p, 82, as_type<uint>(out.m_87.z)); dm_cw(dm_gs, dm_p, 83, as_type<uint>(out.m_87.w)); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _136 = in.m_51.w;
    float _138 = float(_120);
    float _140 = 1.0 / _138;
    float _142 = -_136;
    float _144 = _142 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _146 = _136 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _148 = isnan(_136);
    bool _150 = _146 || _148;
    bool _152 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _154 = _150 || _152;
    float _156 = _144 * _140;
    bool _158 = _144 >= _138;
    bool _160 = !_154;
    bool _162 = _158 || _160;
    out.m_53.x = _156;
    float _164 = _136;
    float _166 = _144;
    if (_162)
    {
        _164 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _168 = _164;
    if (_162)
    {
        out.m_49.x = 0.0;
    }
    int _170 = 0;
    if (_162)
    {
        float _172 = _168 * 5.0;
        _170 = as_type<int>(_172);
    }
    int _174 = _170;
    if (_162)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _3406 = as_type<float>(_174);
        out.gl_Position.z = _3406;
    }
    if (_162)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_67.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_67.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_67.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_67.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_79.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_79.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_79.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_79.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_101.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_101.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_101.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_101.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_97.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_97.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_97.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_97.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_99.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_99.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_99.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_99.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_69.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_69.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_69.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_69.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_53.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_53.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_53.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_53.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_89.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_89.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_89.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_89.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_77.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_77.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_77.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_77.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_81.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_81.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_81.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_81.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_71.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_71.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_71.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_71.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_91.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_91.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_91.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_91.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_49.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_49.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_49.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_49.w)); dm_cw(dm_gs, dm_p, 68, as_type<uint>(out.m_85.x)); dm_cw(dm_gs, dm_p, 69, as_type<uint>(out.m_85.y)); dm_cw(dm_gs, dm_p, 70, as_type<uint>(out.m_85.z)); dm_cw(dm_gs, dm_p, 71, as_type<uint>(out.m_85.w)); dm_cw(dm_gs, dm_p, 72, as_type<uint>(out.m_93.x)); dm_cw(dm_gs, dm_p, 73, as_type<uint>(out.m_93.y)); dm_cw(dm_gs, dm_p, 74, as_type<uint>(out.m_93.z)); dm_cw(dm_gs, dm_p, 75, as_type<uint>(out.m_93.w)); dm_cw(dm_gs, dm_p, 76, as_type<uint>(out.m_95.x)); dm_cw(dm_gs, dm_p, 77, as_type<uint>(out.m_95.y)); dm_cw(dm_gs, dm_p, 78, as_type<uint>(out.m_95.z)); dm_cw(dm_gs, dm_p, 79, as_type<uint>(out.m_95.w)); dm_cw(dm_gs, dm_p, 80, as_type<uint>(out.m_87.x)); dm_cw(dm_gs, dm_p, 81, as_type<uint>(out.m_87.y)); dm_cw(dm_gs, dm_p, 82, as_type<uint>(out.m_87.z)); dm_cw(dm_gs, dm_p, 83, as_type<uint>(out.m_87.w)); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _176 = in.m_55.x;
    float _178 = in.m_55.y;
    float _180 = in.m_55.z;
    bool _182 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _184 = _178 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _186 = _178 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _188 = _178 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _190 = fma(_176, (*spvDescriptorSet0.vp_c10)._m0[4].x, _184);
    float _192 = fma(_176, (*spvDescriptorSet0.vp_c10)._m0[5].x, _186);
    float _194 = fma(_176, (*spvDescriptorSet0.vp_c10)._m0[6].x, _188);
    float _196 = fma(_180, (*spvDescriptorSet0.vp_c10)._m0[4].z, _190);
    float _198 = fma(_180, (*spvDescriptorSet0.vp_c10)._m0[5].z, _192);
    float _200 = fma(_180, (*spvDescriptorSet0.vp_c10)._m0[6].z, _194);
    bool _202 = !_182;
    float _220;
    if (!_202)
    {
        float _204 = in.m_57.x;
        float _206 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _208 = _204 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _210 = fma(_208, (*spvDescriptorSet0.vp_c9)._m0[12].x, _144);
        float _212 = _210 * _206;
        float _214 = floor(_212);
        float _216 = -_214;
        float _218 = _212 + _216;
        _220 = _218;
        _222 = true;
    }
    else
    {
        _220 = _156;
    }
    _222 = false;
    float _224 = _220;
    float _226 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _228 = _224 + _226;
    float _230 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _232 = _224 + _230;
    float _234 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _236 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _234;
    float _238 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _240 = _238 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _242 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _244 = (*spvDescriptorSet0.vp_c9)._m0[146].w + _242;
    float _246 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _248 = _224 + _246;
    float _250 = 1.0 / _236;
    bool _252 = _224 >= (*spvDescriptorSet0.vp_c9)._m0[146].w;
    bool _254 = isnan(_224);
    bool _256 = _252 || _254;
    bool _258 = isnan((*spvDescriptorSet0.vp_c9)._m0[146].w);
    bool _260 = _256 || _258;
    float _262 = float(_260);
    bool _264 = _224 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _266 = isnan(_224);
    bool _268 = _264 || _266;
    bool _270 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _272 = _268 || _270;
    float _274 = float(_272);
    float _276 = -_262;
    float _278 = _276 + 1.0;
    float _280 = 1.0 / _240;
    float _282 = _274 * _278;
    float _284 = -_274;
    float _286 = _284 + 1.0;
    bool _288 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].x;
    float _290 = 1.0 / _244;
    float _292 = _228 * _250;
    float _294 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _296 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _294;
    float _298 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _300 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _298;
    float _302 = _232 * _280;
    float _304 = -(*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _306 = (*spvDescriptorSet0.vp_c9)._m0[144].z + _304;
    float _308 = fma(_296, _292, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _310 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _312 = _310 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _314 = fma(_306, _292, (*spvDescriptorSet0.vp_c9)._m0[143].z);
    float _316 = fma(_312, _302, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _318 = _248 * _290;
    bool _320 = _224 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _322 = isnan(_224);
    bool _324 = _320 || _322;
    bool _326 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _328 = _324 || _326;
    float _330 = float(_328);
    float _332 = fma(_300, _292, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    bool _334 = _224 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _336 = isnan(_224);
    bool _338 = _334 || _336;
    bool _340 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _342 = _338 || _340;
    float _344 = float(_342);
    float _346 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _348 = _346 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _350 = -(*spvDescriptorSet0.vp_c9)._m0[144].z;
    float _352 = _350 + (*spvDescriptorSet0.vp_c9)._m0[145].z;
    float _354 = -_330;
    float _356 = _354 + 1.0;
    float _358 = _330 * _286;
    float _360 = fma(_348, _302, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _362 = fma(_352, _302, (*spvDescriptorSet0.vp_c9)._m0[144].z);
    float _364 = _344 * _356;
    float _366 = in.m_59.x;
    float _368 = in.m_59.y;
    float _370 = in.m_59.z;
    float _372 = -_344;
    float _374 = _372 + 1.0;
    float _376 = _308 * _364;
    float _378 = _332 * _364;
    float _380 = _314 * _364;
    float _382 = -(*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _384 = (*spvDescriptorSet0.vp_c9)._m0[146].x + _382;
    float _386 = -(*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _388 = (*spvDescriptorSet0.vp_c9)._m0[146].y + _386;
    float _390 = fma(_374, (*spvDescriptorSet0.vp_c9)._m0[143].x, _376);
    float _392 = fma(_374, (*spvDescriptorSet0.vp_c9)._m0[143].y, _378);
    float _394 = -(*spvDescriptorSet0.vp_c9)._m0[145].z;
    float _396 = (*spvDescriptorSet0.vp_c9)._m0[146].z + _394;
    float _398 = fma(_374, (*spvDescriptorSet0.vp_c9)._m0[143].z, _380);
    float _400 = fma(_384, _318, (*spvDescriptorSet0.vp_c9)._m0[145].x);
    float _402 = fma(_388, _318, (*spvDescriptorSet0.vp_c9)._m0[145].y);
    float _404 = fma(_360, _358, _390);
    float _406 = fma(_316, _358, _392);
    float _408 = fma(_396, _318, (*spvDescriptorSet0.vp_c9)._m0[145].z);
    float _410 = fma(_362, _358, _398);
    float _412 = fma(_400, _282, _404);
    float _414 = fma(_402, _282, _406);
    float _416 = fma(_408, _282, _410);
    float _418 = fma(_262, (*spvDescriptorSet0.vp_c9)._m0[146].x, _412);
    float _420 = fma(_262, (*spvDescriptorSet0.vp_c9)._m0[146].y, _414);
    float _422 = fma(_262, (*spvDescriptorSet0.vp_c9)._m0[146].z, _416);
    float _424 = _418 * _366;
    float _426 = _420 * _368;
    float _428 = _422 * _370;
    bool _430 = !_288;
    float _448;
    if (!_430)
    {
        float _432 = in.m_57.x;
        float _434 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].x;
        float _436 = _432 * (*spvDescriptorSet0.vp_c9)._m0[12].y;
        float _438 = fma(_436, (*spvDescriptorSet0.vp_c9)._m0[11].x, _144);
        float _440 = _438 * _434;
        float _442 = floor(_440);
        float _444 = -_442;
        float _446 = _440 + _444;
        _448 = _446;
        _450 = true;
    }
    else
    {
        _448 = _156;
    }
    _450 = false;
    float _452 = _448;
    float _454 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _456 = _452 + _454;
    bool _458 = _452 >= (*spvDescriptorSet0.vp_c9)._m0[108].w;
    bool _460 = isnan(_452);
    bool _462 = _458 || _460;
    bool _464 = isnan((*spvDescriptorSet0.vp_c9)._m0[108].w);
    bool _466 = _462 || _464;
    float _468 = float(_466);
    float _470 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _472 = (*spvDescriptorSet0.vp_c9)._m0[108].w + _470;
    bool _474 = _452 >= (*spvDescriptorSet0.vp_c9)._m0[107].w;
    bool _476 = isnan(_452);
    bool _478 = _474 || _476;
    bool _480 = isnan((*spvDescriptorSet0.vp_c9)._m0[107].w);
    bool _482 = _478 || _480;
    float _484 = float(_482);
    float _486 = -_468;
    float _488 = _486 + 1.0;
    float _490 = -(*spvDescriptorSet0.vp_c9)._m0[107].x;
    float _492 = (*spvDescriptorSet0.vp_c9)._m0[108].x + _490;
    float _494 = 1.0 / _472;
    bool _496 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _498 = _484 * _488;
    float _500 = -_484;
    float _502 = _500 + 1.0;
    float _504 = _456 * _494;
    float _506 = -(*spvDescriptorSet0.vp_c9)._m0[107].z;
    float _508 = (*spvDescriptorSet0.vp_c9)._m0[108].z + _506;
    float _510 = fma(_492, _504, (*spvDescriptorSet0.vp_c9)._m0[107].x);
    float _512 = -(*spvDescriptorSet0.vp_c9)._m0[107].y;
    float _514 = (*spvDescriptorSet0.vp_c9)._m0[108].y + _512;
    float _516 = fma(_508, _504, (*spvDescriptorSet0.vp_c9)._m0[107].z);
    float _518 = _510 * _498;
    float _520 = fma(_514, _504, (*spvDescriptorSet0.vp_c9)._m0[107].y);
    float _522 = _516 * _498;
    float _524 = _520 * _498;
    float _526 = fma(_502, (*spvDescriptorSet0.vp_c9)._m0[107].x, _518);
    float _528 = fma(_502, (*spvDescriptorSet0.vp_c9)._m0[107].y, _524);
    float _530 = fma(_502, (*spvDescriptorSet0.vp_c9)._m0[107].z, _522);
    float _532 = fma(_468, (*spvDescriptorSet0.vp_c9)._m0[108].x, _526);
    float _534 = fma(_468, (*spvDescriptorSet0.vp_c9)._m0[108].y, _528);
    float _536 = fma(_468, (*spvDescriptorSet0.vp_c9)._m0[108].z, _530);
    bool _538 = !_496;
    float _556;
    if (!_538)
    {
        float _540 = in.m_57.x;
        float _542 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _544 = _540 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _546 = fma(_544, (*spvDescriptorSet0.vp_c9)._m0[11].y, _144);
        float _548 = _546 * _542;
        float _550 = floor(_548);
        float _552 = -_550;
        float _554 = _548 + _552;
        _556 = _554;
        _558 = true;
    }
    else
    {
        _556 = _156;
    }
    _558 = false;
    float _560 = _556;
    bool _562 = _560 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _564 = isnan(_560);
    bool _566 = _562 || _564;
    bool _568 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _570 = _566 || _568;
    float _572 = float(_570);
    float _574 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _576 = _574 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _578 = _560 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _580 = isnan(_560);
    bool _582 = _578 || _580;
    bool _584 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _586 = _582 || _584;
    float _588 = float(_586);
    float _590 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _592 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _590;
    float _594 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _596 = _560 + _594;
    float _598 = -_572;
    float _600 = _598 + 1.0;
    bool _602 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].w;
    float _604 = 1.0 / _576;
    float _606 = _588 * _600;
    float _608 = -_588;
    float _610 = _608 + 1.0;
    float _612 = _532 * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _614 = _536 * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _616 = _612 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _618 = _614 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _620 = _592 * _604;
    float _622 = fma(_620, _596, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _624 = _622 * _606;
    float _626 = _534 * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _628 = fma(_610, (*spvDescriptorSet0.vp_c9)._m0[115].x, _624);
    float _630 = _626 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _632 = fma(_572, (*spvDescriptorSet0.vp_c9)._m0[116].x, _628);
    float _634 = _632 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    bool _636 = !_602;
    float _654;
    if (!_636)
    {
        float _638 = in.m_57.x;
        float _640 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].w;
        float _642 = _638 * (*spvDescriptorSet0.vp_c9)._m0[13].x;
        float _644 = fma(_642, (*spvDescriptorSet0.vp_c9)._m0[11].w, _144);
        float _646 = _644 * _640;
        float _648 = floor(_646);
        float _650 = -_648;
        float _652 = _646 + _650;
        _654 = _652;
        _656 = true;
    }
    else
    {
        _654 = _156;
    }
    _656 = false;
    float _658 = _654;
    float _660 = in.m_57.z;
    float _662 = _424 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _664 = in.m_57.y;
    int _666 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _668 = _666 != 0;
    float _670 = _662 * (*spvDescriptorSet0.vp_c13)._m0[2].y;
    float _672 = in.m_46.x;
    float _674 = in.m_46.y;
    float _676 = in.m_46.z;
    int _678 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _680 = _678 != 0;
    int _682 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _684 = _682 != 0;
    int _686 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _688 = _686 != 0;
    float _690 = _426 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _692 = in.m_57.x;
    float _694 = (*spvDescriptorSet0.vp_c8)._m0[0].y * (*spvDescriptorSet0.vp_c10)._m0[9].w;
    float _696 = _428 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _698 = fma((*spvDescriptorSet0.vp_c8)._m0[0].x, (*spvDescriptorSet0.vp_c10)._m0[8].w, _694);
    float _700 = -(*spvDescriptorSet0.vp_c9)._m0[194].y;
    float _702 = (*spvDescriptorSet0.vp_c9)._m0[194].z + _700;
    float _704 = -(*spvDescriptorSet0.vp_c9)._m0[193].w;
    float _706 = _704 + (*spvDescriptorSet0.vp_c9)._m0[194].x;
    float _708 = _660 * 2.0;
    float _710 = fma(_156, _706, (*spvDescriptorSet0.vp_c9)._m0[193].w);
    float _712 = _664 * 2.0;
    float _714 = _664 + _660;
    float _716 = floor(_708);
    float _718 = _674 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _720 = _674 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _722 = _674 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _724 = _714 + (-1.0);
    float _726 = fma(_672, (*spvDescriptorSet0.vp_c10)._m0[4].x, _718);
    float _728 = fma(_672, (*spvDescriptorSet0.vp_c10)._m0[5].x, _720);
    float _730 = floor(_712);
    float _732 = fma(_672, (*spvDescriptorSet0.vp_c10)._m0[6].x, _722);
    float _734 = _672;
    if (_668)
    {
        _734 = _692;
    }
    float _736 = _734;
    float _738 = fma(_676, (*spvDescriptorSet0.vp_c10)._m0[5].z, _728);
    float _740 = fma(_676, (*spvDescriptorSet0.vp_c10)._m0[4].z, _726);
    float _742 = _736;
    if (!_668)
    {
        _742 = _660;
    }
    float _744 = _742;
    float _746 = fma(_676, (*spvDescriptorSet0.vp_c10)._m0[6].z, _732);
    bool _748 = _716 > 0.0;
    float _750 = (*spvDescriptorSet0.vp_c9)._m0[87].x + (*spvDescriptorSet0.vp_c9)._m0[86].z;
    bool _752 = _716 >= 0.0;
    bool _754 = isnan(_716);
    bool _756 = _752 || _754;
    bool _758 = isnan(0.0);
    bool _760 = _756 || _758;
    float _762 = _744 * (*spvDescriptorSet0.vp_c9)._m0[87].x;
    float _764 = _660 + _692;
    float _766 = fma(_724, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    int _768 = _760 ? 0 : 1;
    float _770 = -_750;
    float _772 = fma(_762, 2.0, _770);
    bool _774 = _730 > 0.0;
    float _776 = _764 + (-1.0);
    bool _778 = _730 >= 0.0;
    bool _780 = isnan(_730);
    bool _782 = _778 || _780;
    bool _784 = isnan(0.0);
    bool _786 = _782 || _784;
    float _788 = _738 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _790 = _762;
    if (_668)
    {
        _790 = _664;
    }
    float _792 = _790;
    float _794 = _740 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    int _796 = ~_768;
    int _798 = _796 + 1;
    int _800 = _798 + 1;
    float _802 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _804 = _788 + _802;
    float _806 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _808 = _794 + _806;
    float _810 = _792;
    int _812 = _800;
    if (!_668)
    {
        _810 = _692;
    }
    float _814 = _810;
    float _816 = _804 * _804;
    if (!_748)
    {
        int _818 = ~_768;
        int _820 = _818 + 1;
        _812 = _820;
    }
    int _822 = _812;
    float _824 = (*spvDescriptorSet0.vp_c9)._m0[87].y + (*spvDescriptorSet0.vp_c9)._m0[86].w;
    float _826 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _828 = log2(_826);
    int _830 = _786 ? 0 : 1;
    float _832 = _814 * (*spvDescriptorSet0.vp_c9)._m0[87].y;
    float _834 = -_788;
    float _836 = _834 + (*spvDescriptorSet0.vp_c8)._m0[29].y;
    int _838 = ~_830;
    int _840 = _838 + 1;
    int _842 = _840 + 1;
    float _844 = fma((*spvDescriptorSet0.vp_c8)._m0[0].z, (*spvDescriptorSet0.vp_c10)._m0[10].w, _698);
    int _846 = _842;
    if (!_774)
    {
        int _848 = ~_830;
        int _850 = _848 + 1;
        _846 = _850;
    }
    int _852 = _846;
    float _854 = fma(_832, -2.0, _824);
    float _856 = _692 * 2.0;
    float _858 = fma(_776, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    bool _860 = !_680;
    int _862 = _860 ? 0 : 1;
    float _864 = _664 + _692;
    bool _866 = !_688;
    int _868 = _866 ? 0 : 1;
    float _870 = floor(_856);
    int _872 = abs(_862);
    float _874 = _864 + (-1.0);
    int _876 = abs(_868);
    float _878 = _828 * _144;
    float _880 = _844 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _882 = exp2(_878);
    float _884 = fma(_874, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    float _886 = float(_872);
    float _888 = float(_876);
    float _890 = float(_852);
    float _892 = float(_822);
    float _894 = _888 * _890;
    bool _896 = _870 > 0.0;
    float _898 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _900 = 1.0 + _898;
    bool _902 = _870 >= 0.0;
    bool _904 = isnan(_870);
    bool _906 = _902 || _904;
    bool _908 = isnan(0.0);
    bool _910 = _906 || _908;
    float _912 = _886 * _892;
    float _914 = in.m_61.x;
    float _916 = in.m_61.y;
    float _918 = in.m_61.z;
    bool _920 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _922 = isnan(1.0);
    bool _924 = _920 || _922;
    bool _926 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _928 = _924 || _926;
    float _930 = 1.0 / _900;
    float _932 = -_882;
    float _934 = _932 + 1.0;
    float _936 = (*spvDescriptorSet0.vp_c9)._m0[88].w + (*spvDescriptorSet0.vp_c9)._m0[88].y;
    float _938 = _894 * (-2.0);
    bool _940 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _942 = isnan(0.0);
    bool _944 = _940 || _942;
    bool _946 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _948 = _944 || _946;
    float _950 = fma(_664, (*spvDescriptorSet0.vp_c9)._m0[88].w, _936);
    float _952 = (*spvDescriptorSet0.vp_c9)._m0[88].z + (*spvDescriptorSet0.vp_c9)._m0[88].x;
    float _954 = _948 ? _934 : 0.0;
    float _956 = _746 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _958 = fma(_144, (*spvDescriptorSet0.vp_c9)._m0[87].w, _950);
    float _960 = fma(_692, (*spvDescriptorSet0.vp_c9)._m0[88].z, _952);
    float _962 = -_144;
    float _964 = fma(_962, (*spvDescriptorSet0.vp_c9)._m0[86].x, _772);
    float _966 = fma(_144, (*spvDescriptorSet0.vp_c9)._m0[86].y, _854);
    float _968 = fma(_808, _808, _816);
    float _970 = fma(_144, (*spvDescriptorSet0.vp_c9)._m0[87].z, _960);
    if (_928)
    {
        float _972 = _954 * _930;
        _166 = _972;
    }
    float _974 = _166;
    float _976 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _978 = _956 + _976;
    float _980 = _912 * (-2.0);
    int _982 = _910 ? 0 : 1;
    float _984 = _836 * _836;
    float _986 = fma(_978, _978, _968);
    float _988 = _692 + (-0.5);
    float _990 = fma(_980, _914, _914);
    bool _992 = !_684;
    int _994 = _992 ? 0 : 1;
    float _996 = sqrt(_986);
    int _998 = ~_982;
    int _1000 = _998 + 1;
    int _1002 = _1000 + 1;
    float _1004 = fma(_988, (*spvDescriptorSet0.vp_c9)._m0[196].x, _990);
    float _1006 = fma(_884, _980, _884);
    int _1008 = _1002;
    if (!_896)
    {
        int _1010 = ~_982;
        int _1012 = _1010 + 1;
        _1008 = _1012;
    }
    int _1014 = _1008;
    float _1016 = -_794;
    float _1018 = _1016 + (*spvDescriptorSet0.vp_c8)._m0[29].x;
    int _1020 = abs(_994);
    float _1022 = _660 + (-0.5);
    float _1024 = rsqrt(_986);
    float _1026 = float(_1014);
    float _1028 = -_956;
    float _1030 = _1028 + (*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1032 = float(_1020);
    float _1034 = fma(_1018, _1018, _984);
    float _1036 = fma(_1006, _974, _1004);
    float _1038 = _996 * (*spvDescriptorSet0.vp_c13)._m0[2].x;
    float _1040 = fma(_938, _918, _918);
    float _1042 = _1032 * _1026;
    float _1044 = _788 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1046 = fma(_1030, _1030, _1034);
    float _1048 = precise::min(_670, _1038);
    float _1050 = fma(_1022, (*spvDescriptorSet0.vp_c9)._m0[196].z, _1040);
    float _1052 = fma(_794, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1044);
    float _1054 = _1042 * (-2.0);
    float _1056 = fma(_858, _938, _858);
    float _1058 = _1024 * _1048;
    float _1060 = rsqrt(_1046);
    float _1062 = _1036 * 0.15915493667125701904296875;
    float _1064 = fma(_1054, _916, _916);
    float _1066 = _804 * _1058;
    float _1068 = _808 * _1058;
    float _1070 = fma(_956, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1052);
    float _1072 = _664 + (-0.5);
    float _1074 = -_1066;
    float _1076 = _804 + _1074;
    float _1078 = sqrt(_1046);
    float _1080 = -_1068;
    float _1082 = _808 + _1080;
    float _1084 = fma(_1056, _974, _1050);
    float _1086 = _1076 * _1076;
    float _1088 = fma(_1072, (*spvDescriptorSet0.vp_c9)._m0[196].y, _1064);
    float _1090 = _1084 * 0.15915493667125701904296875;
    float _1092 = fma(_1082, _1082, _1086);
    float _1094 = 1.0 / _702;
    float _1096 = fma(_766, _1054, _766);
    float _1098 = _978 * _1058;
    float _1100 = _1070 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1102 = fma(_1096, _974, _1088);
    float _1104 = -_1098;
    float _1106 = _978 + _1104;
    float _1108 = -_1100;
    float _1110 = _880 + _1108;
    bool _1112 = _1100 >= _880;
    bool _1114 = isnan(_1100);
    bool _1116 = _1112 || _1114;
    bool _1118 = isnan(_880);
    bool _1120 = _1116 || _1118;
    float _1122 = _1102 * 0.15915493667125701904296875;
    float _1124 = fma(_1106, _1106, _1092);
    float _1126 = (*spvDescriptorSet0.vp_c8)._m0[28].y * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _1128 = abs(_1110);
    float _1130 = precise::max(_1128, (*spvDescriptorSet0.vp_c9)._m0[194].y);
    float _1132 = _1062 * 6.283185482025146484375;
    float _1134 = sin(_1132);
    float _1136 = abs(_1078);
    float _1138 = precise::max(0.0, _1136);
    float _1140 = _1018 * _1060;
    float _1142 = precise::min(_1130, (*spvDescriptorSet0.vp_c9)._m0[194].z);
    float _1144 = fma((*spvDescriptorSet0.vp_c8)._m0[28].x, (*spvDescriptorSet0.vp_c8)._m0[28].x, _1126);
    float _1146 = _1030 * _1060;
    float _1148 = precise::min(_1138, 40.0);
    float _1150 = sqrt(_1124);
    float _1152 = -(*spvDescriptorSet0.vp_c9)._m0[194].y;
    float _1154 = _1142 + _1152;
    bool _1156 = !_1120;
    float _1158 = _1156 ? 1.0 : (-1.0);
    float _1160 = -(*spvDescriptorSet0.vp_c8)._m0[1].z;
    float _1162 = _1140 * _1160;
    float _1164 = fma((*spvDescriptorSet0.vp_c8)._m0[28].z, (*spvDescriptorSet0.vp_c8)._m0[28].z, _1144);
    float _1166 = _1154 * _1094;
    float _1168 = _836 * _1060;
    float _1170 = fma(_1148, -0.02500000037252902984619140625, 1.0);
    float _1172 = _1062 * 6.283185482025146484375;
    float _1174 = cos(_1172);
    float _1176 = -(*spvDescriptorSet0.vp_c8)._m0[1].x;
    float _1178 = -_1162;
    float _1180 = fma(_1146, _1176, _1178);
    float _1182 = _1158 * _1166;
    float _1184 = _156 * (*spvDescriptorSet0.vp_c9)._m0[194].w;
    float _1186 = -(*spvDescriptorSet0.vp_c8)._m0[1].x;
    float _1188 = _1168 * _1186;
    float _1190 = _1180 * _1180;
    float _1192 = _1184 * _1182;
    float _1194 = _1090 * 6.283185482025146484375;
    float _1196 = cos(_1194);
    float _1198 = _1024 * _1150;
    float _1200 = -(*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1202 = _1146 * _1200;
    float _1204 = in.m_63.x;
    float _1206 = in.m_63.y;
    float _1208 = in.m_63.z;
    float _1210 = _1192 * 0.15915493667125701904296875;
    float _1212 = _662 * _1198;
    float _1214 = -(*spvDescriptorSet0.vp_c8)._m0[1].z;
    float _1216 = -_1202;
    float _1218 = fma(_1168, _1214, _1216);
    float _1220 = _696 * _1198;
    float _1222 = _1122 * 6.283185482025146484375;
    float _1224 = cos(_1222);
    float _1226 = fma(_1218, _1218, _1190);
    float _1228 = _1122 * 6.283185482025146484375;
    float _1230 = sin(_1228);
    float _1232 = _1134 * _1196;
    float _1234 = _1174 * _1224;
    float _1236 = _1134 * _1224;
    float _1238 = _1224 * _1196;
    float _1240 = -(*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1242 = -_1188;
    float _1244 = fma(_1140, _1240, _1242);
    float _1246 = _1090 * 6.283185482025146484375;
    float _1248 = sin(_1246);
    float _1250 = _1174 * _1196;
    float _1252 = fma(_1244, _1244, _1226);
    float _1254 = _1134 * _1230;
    float _1256 = _1174 * _1230;
    float _1258 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _1206);
    float _1260 = _1230 * _1196;
    float _1262 = rsqrt(_1164);
    float _1264 = _690 * _1198;
    float _1266 = _1264 * _1258;
    float _1268 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _1208);
    float _1270 = rsqrt(_1252);
    float _1272 = fma(_1248, _1234, _1254);
    float _1274 = fma(_1248, _1254, _1234);
    float _1276 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _1204);
    float _1278 = -_1256;
    float _1280 = fma(_1248, _1236, _1278);
    float _1282 = -_1236;
    float _1284 = fma(_1248, _1256, _1282);
    float _1286 = -_1266;
    float _1288 = _1248 * _1286;
    float _1290 = _1212 * _1276;
    float _1292 = _1250 * _1266;
    float _1294 = _1232 * _1266;
    float _1296 = _1220 * _1268;
    float _1298 = fma(_1238, _1290, _1288);
    float _1300 = fma(_1272, _1290, _1292);
    float _1302 = fma(_1280, _1290, _1294);
    float _1304 = _1262 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _1306 = fma(_1260, _1296, _1298);
    float _1308 = _1244 * _1270;
    float _1310 = _1218 * _1270;
    float _1312 = _1180 * _1270;
    float _1314 = fma(_1284, _1296, _1300);
    float _1316 = _1140 * _1308;
    float _1318 = fma(_1274, _1296, _1302);
    float _1320 = _1146 * _1312;
    float _1322 = _1168 * _1310;
    float _1324 = -_1316;
    float _1326 = fma(_1146, _1310, _1324);
    float _1328 = _1262 * (*spvDescriptorSet0.vp_c8)._m0[28].x;
    float _1330 = -_1320;
    float _1332 = fma(_1168, _1308, _1330);
    float _1334 = -_1322;
    float _1336 = fma(_1140, _1312, _1334);
    float _1338 = _1326 * _1314;
    float _1340 = _1304 * _1304;
    float _1342 = _1332 * _1314;
    float _1344 = _1336 * _1314;
    float _1346 = fma(_1312, _1306, _1338);
    float _1348 = _1262 * (*spvDescriptorSet0.vp_c8)._m0[28].z;
    float _1350 = fma(_1310, _1306, _1342);
    float _1352 = fma(_1308, _1306, _1344);
    float _1354 = fma(_1168, _1318, _1346);
    float _1356 = fma(_1328, _1328, _1340);
    float _1358 = fma(_1140, _1318, _1350);
    float _1360 = _788 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1362 = _788 + _1354;
    float _1364 = fma(_1146, _1318, _1352);
    float _1366 = _794 + _1358;
    float _1368 = fma(_1348, _1348, _1356);
    float _1370 = _1362 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1372 = _1362 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1374 = _1362 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1376 = fma(_794, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1360);
    float _1378 = fma(_1366, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1370);
    float _1380 = fma(_1366, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1372);
    float _1382 = _956 + _1364;
    float _1384 = fma(_1366, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1374);
    float _1386 = rsqrt(_1368);
    float _1388 = fma(_956, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1376);
    float _1390 = fma(_1382, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1380);
    float _1392 = fma(_1382, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1384);
    float _1394 = fma(_1382, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1378);
    float _1396 = _1388 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1398 = _1390 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1400 = _1392 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1402 = _1210 * 6.283185482025146484375;
    float _1404 = cos(_1402);
    float _1406 = _1394 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1408 = -_1398;
    float _1410 = _1408 + _1396;
    float _1412 = _1400 * (*spvDescriptorSet0.vp_c8)._m0[12].y;
    float _1414 = _1400 * (*spvDescriptorSet0.vp_c8)._m0[13].y;
    float _1416 = _1400 * (*spvDescriptorSet0.vp_c8)._m0[14].y;
    float _1418 = fma(_1170, _1410, _1398);
    float _1420 = fma(_1406, (*spvDescriptorSet0.vp_c8)._m0[12].x, _1412);
    float _1422 = _1210 * 6.283185482025146484375;
    float _1424 = sin(_1422);
    float _1426 = fma(_1406, (*spvDescriptorSet0.vp_c8)._m0[13].x, _1414);
    float _1428 = fma(_1406, (*spvDescriptorSet0.vp_c8)._m0[14].x, _1416);
    float _1430 = _1348 * _1386;
    float _1432 = fma(_1418, (*spvDescriptorSet0.vp_c8)._m0[12].z, _1420);
    float _1434 = fma(_1418, (*spvDescriptorSet0.vp_c8)._m0[13].z, _1426);
    float _1436 = fma(_1418, (*spvDescriptorSet0.vp_c8)._m0[14].z, _1428);
    float _1438 = _1430 * _1430;
    float _1440 = -_1404;
    float _1442 = _1440 + 1.0;
    float _1444 = _1328 * _1386;
    float _1446 = _1304 * _1386;
    float _1448 = _1432 + (*spvDescriptorSet0.vp_c8)._m0[12].w;
    float _1450 = fma(_1442, _1438, _1404);
    float _1452 = _1434 + (*spvDescriptorSet0.vp_c8)._m0[13].w;
    float _1454 = _1446 * _1442;
    float _1456 = _1444 * _1442;
    float _1458 = _1444 * _1424;
    float _1460 = _1446 * _1424;
    float _1462 = _1430 * _1424;
    float _1464 = -_788;
    float _1466 = _1464 + _1452;
    float _1468 = fma(_1430, _1454, _1458);
    float _1470 = -_1460;
    float _1472 = fma(_1430, _1456, _1470);
    float _1474 = -_1462;
    float _1476 = fma(_1446, _1456, _1474);
    float _1478 = -_794;
    float _1480 = _1478 + _1448;
    float _1482 = _1468 * _1466;
    float _1484 = _1436 + (*spvDescriptorSet0.vp_c8)._m0[14].w;
    float _1486 = fma(_1444, _1456, _1404);
    float _1488 = _1476 * _1466;
    float _1490 = fma(_1472, _1480, _1482);
    float _1492 = -_956;
    float _1494 = _1492 + _1484;
    float _1496 = fma(_1430, _1456, _1460);
    float _1498 = fma(_1486, _1480, _1488);
    float _1500 = fma(_1446, _1454, _1404);
    float _1502 = fma(_1450, _1494, _1490);
    float _1504 = fma(_1446, _1456, _1462);
    float _1506 = fma(_1496, _1494, _1498);
    float _1508 = _1500 * _1466;
    float _1510 = fma(_1502, _710, _956);
    float _1512 = -_1458;
    float _1514 = fma(_1430, _1454, _1512);
    float _1516 = fma(_1506, _710, _794);
    float _1518 = fma(_1504, _1480, _1508);
    float _1520 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1522 = _1510 + _1520;
    float _1524 = -_1066;
    float _1526 = _788 + _1524;
    float _1528 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1530 = _1516 + _1528;
    float _1532 = fma(_1514, _1494, _1518);
    float _1534 = _1522 * _1522;
    float _1536 = _1526 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _1538 = -_1098;
    float _1540 = _956 + _1538;
    float _1542 = _788 + _1532;
    float _1544 = fma(_1530, _1530, _1534);
    float _1546 = -_1068;
    float _1548 = _794 + _1546;
    float _1550 = sqrt(_1544);
    float _1552 = fma(_1548, (*spvDescriptorSet0.vp_c8)._m0[11].x, _1536);
    float _1554 = fma(_1540, (*spvDescriptorSet0.vp_c8)._m0[11].z, _1552);
    bool _1556 = _1550 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1558 = _1446;
    float _1560 = _1532;
    float _1562 = _1518;
    float _1564 = _1554;
    float _1566 = _1516;
    if (!_1556)
    {
        _1558 = _1516;
    }
    float _1568 = _1558;
    float _1570 = _1568;
    if (!_1556)
    {
        _1560 = _1510;
    }
    float _1572 = _1560;
    float _1574 = _1572;
    if (!_1556)
    {
        _1562 = _1542;
    }
    float _1576 = _1562;
    bool _1578 = !_1556;
    float _1580 = _1576;
    if (!_1578)
    {
        float _1582 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1584 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1586 = _1550 + _1584;
        float _1588 = _1542 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1590 = rsqrt(_1544);
        float _1592 = _1586 * _1582;
        float _1594 = _1592 * 0.15915493667125701904296875;
        float _1596 = _1594 * 6.283185482025146484375;
        float _1598 = cos(_1596);
        float _1600 = _1594 * 6.283185482025146484375;
        float _1602 = sin(_1600);
        float _1604 = _1598 + (-1.0);
        float _1606 = _1604 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1608 = fma(_1602, _1588, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1610 = fma(_1542, _1598, _1606);
        float _1612 = _1590 * _1608;
        float _1614 = fma(_1530, _1612, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1616 = fma(_1522, _1612, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _1580 = _1610;
        _1570 = _1614;
        _1574 = _1616;
    }
    float _1618 = _1580;
    float _1620 = _1570;
    float _1622 = _1574;
    float _1624 = -_788;
    float _1626 = _1624 + _1618;
    float _1628 = -_794;
    float _1630 = _1628 + _1620;
    float _1632 = _1554 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _1634 = _1526 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _1636 = _1626 * _1626;
    float _1638 = -_956;
    float _1640 = _1638 + _1622;
    float _1642 = 1.0 / _1632;
    float _1644 = fma(_1548, (*spvDescriptorSet0.vp_c8)._m0[10].x, _1634);
    float _1646 = fma(_1630, _1630, _1636);
    float _1648 = -_1066;
    float _1650 = _1648 + _1618;
    float _1652 = fma(_1540, (*spvDescriptorSet0.vp_c8)._m0[10].z, _1644);
    float _1654 = fma(_1640, _1640, _1646);
    bool _1656 = (*spvDescriptorSet0.vp_c15)._m0[653].w >= 0.5;
    bool _1658 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _1660 = _1656 || _1658;
    bool _1662 = isnan(0.5);
    bool _1664 = _1660 || _1662;
    float _1666 = -_1098;
    float _1668 = _1666 + _1622;
    float _1670 = _1652 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _1672 = sqrt(_1654);
    float _1674 = _1670 + _1632;
    float _1676 = _1674 * _1642;
    float _1678 = _1676 * 0.5;
    float _1680 = -_1068;
    float _1682 = _1680 + _1620;
    float _1684 = _1622;
    float _1686 = _1618;
    float _1688 = _1620;
    float _1690 = (*spvDescriptorSet0.vp_c8)._m0[30].w;
    float _1692 = _1682;
    float _1694 = _1668;
    if (_1664)
    {
        _1564 = 1.0;
    }
    float _1696 = _1564;
    float _1698 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _1700 = fma(_1678, (*spvDescriptorSet0.vp_c8)._m0[30].w, _1698);
    float _1702 = 1.0 / _1700;
    bool _1704 = _1672 > 0.0;
    float _1706 = _1696;
    if (!_1704)
    {
        _1684 = _1682;
    }
    float _1708 = _1684;
    float _1710 = _1708;
    if (!_1704)
    {
        _1686 = _1650;
    }
    float _1712 = _1686;
    float _1714 = _1712;
    if (!_1704)
    {
        _1688 = _1668;
    }
    float _1716 = _1688;
    bool _1718 = !_1704;
    float _1720 = _1716;
    float _1722 = _1716;
    if (!_1718)
    {
        float _1724 = _198 * _198;
        float _1726 = fma(_196, _196, _1724);
        float _1728 = rsqrt(_1654);
        float _1730 = fma(_200, _200, _1726);
        float _1732 = sqrt(_1730);
        float _1734 = _1630 * _1728;
        float _1736 = _1626 * _1728;
        float _1738 = _1640 * _1728;
        bool _1740 = _1732 > 0.0;
        float _1742 = _1728;
        float _1744 = _1732;
        _1690 = _1736;
        if (!_1740)
        {
            _1742 = _1682;
        }
        float _1746 = _1742;
        _1710 = _1746;
        if (!_1740)
        {
            _1744 = _1650;
        }
        float _1748 = _1744;
        _1714 = _1748;
        if (!_1740)
        {
            _1720 = _1668;
        }
        float _1750 = _1720;
        bool _1752 = !_1740;
        _1722 = _1750;
        if (!_1752)
        {
            float _1754 = rsqrt(_1730);
            float _1756 = 1.0 / (*spvDescriptorSet0.vp_c10)._m0[2].z;
            float _1758 = _198 * _1754;
            float _1760 = _196 * _1754;
            float _1762 = _1736 * _1758;
            float _1764 = _200 * _1754;
            float _1766 = fma(_1734, _1760, _1762);
            float _1768 = _1756 * (*spvDescriptorSet0.vp_c9)._m0[142].x;
            float _1770 = fma(_1738, _1764, _1766);
            float _1772 = _1770 * _1768;
            float _1774 = fma(_196, _1772, _1682);
            float _1776 = fma(_198, _1772, _1650);
            float _1778 = fma(_200, _1772, _1668);
            _1714 = _1776;
            _1710 = _1774;
            _1722 = _1778;
        }
    }
    float _1780 = _1714;
    float _1782 = _1710;
    float _1784 = _1722;
    float _1786 = _1690;
    float _1788 = _1786;
    if (_1664)
    {
        _1788 = 1.0;
    }
    float _1790 = _1788;
    float _1792 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _1794 = _1702 * _1792;
    float _1796 = _1790;
    if (!_1664)
    {
        float _1798 = (*spvDescriptorSet0.vp_c8)._m0[31].x * 0.5;
        float _1800 = _1798 * 0.15915493667125701904296875;
        float _1802 = _1800 * 6.283185482025146484375;
        float _1804 = cos(_1802);
        float _1806 = (*spvDescriptorSet0.vp_c8)._m0[31].y * 0.5;
        float _1808 = _1806 * 0.15915493667125701904296875;
        float _1810 = _1800 * 6.283185482025146484375;
        float _1812 = sin(_1810);
        float _1814 = 1.0 / _1804;
        float _1816 = _1808 * 6.283185482025146484375;
        float _1818 = cos(_1816);
        float _1820 = _1812 * _1814;
        float _1822 = _1808 * 6.283185482025146484375;
        float _1824 = sin(_1822);
        float _1826 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1828 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _1826;
        float _1830 = _1818 * _1820;
        float _1832 = 1.0 / _1828;
        float _1834 = 1.0 / _1830;
        float _1836 = _1824 * _1834;
        float _1838 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1840 = fma(_1794, _1836, _1838);
        float _1842 = _1840 * _1832;
        float _1844 = precise::clamp(_1842, 0.0, 1.0);
        _1692 = _1820;
        _1694 = _1800;
        _1706 = _1844;
    }
    float _1846 = _1692;
    float _1848 = _1694;
    float _1850 = _1706;
    float _1852 = _1846;
    float _1854 = _1848;
    if (!_1664)
    {
        float _1856 = (*spvDescriptorSet0.vp_c8)._m0[31].x * 0.5;
        float _1858 = _1856 * 0.15915493667125701904296875;
        float _1860 = _1858 * 6.283185482025146484375;
        float _1862 = cos(_1860);
        float _1864 = (*spvDescriptorSet0.vp_c8)._m0[31].y * 0.5;
        float _1866 = _1864 * 0.15915493667125701904296875;
        float _1868 = _1858 * 6.283185482025146484375;
        float _1870 = sin(_1868);
        float _1872 = 1.0 / _1862;
        float _1874 = _1866 * 6.283185482025146484375;
        float _1876 = cos(_1874);
        float _1878 = _1870 * _1872;
        float _1880 = _1866 * 6.283185482025146484375;
        float _1882 = sin(_1880);
        float _1884 = _1876 * _1878;
        float _1886 = 1.0 / _1884;
        float _1888 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _1890 = (*spvDescriptorSet0.vp_c9)._m0[140].w + _1888;
        float _1892 = 1.0 / _1890;
        float _1894 = _1882 * _1886;
        float _1896 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _1898 = fma(_1794, _1894, _1896);
        float _1900 = _1898 * _1892;
        float _1902 = precise::clamp(_1900, 0.0, 1.0);
        float _1904 = -_1902;
        float _1906 = _1904 + 1.0;
        _1852 = _1872;
        _1796 = _1906;
    }
    float _1908 = _1852;
    float _1910 = _1796;
    float _1912 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1914 = _1780 + _1912;
    float _1916 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1918 = _1782 + _1916;
    float _1920 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1922 = _1784 + _1920;
    float _1924 = _1914 * _1914;
    float _1926 = fma(_1918, _1918, _1924);
    float _1928 = fma(_1922, _1922, _1926);
    float _1930 = rsqrt(_1928);
    float _1932 = sqrt(_1928);
    float _1934 = _1930 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1936 = _1918 * _1934;
    float _1938 = _1922 * _1934;
    float _1940 = _1936 * _1936;
    float _1942 = _1938 * _1938;
    float _1944 = _1940 + _1942;
    float _1946 = sqrt(_1944);
    bool _1948 = _1946 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1950 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1952 = _1946 + _1950;
    float _1954 = _1922;
    float _1956 = _1924;
    float _1958 = _1952;
    float _1960 = _1914;
    float _1962 = _1908;
    if (_1948)
    {
        float _1964 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1954 = _1964;
    }
    float _1966 = _1954;
    if (_1948)
    {
        float _1968 = rsqrt(_1944);
        _1956 = _1968;
    }
    float _1970 = _1956;
    float _1972 = _1970;
    if (_1948)
    {
        float _1974 = _1952 * _1966;
        _1958 = _1974;
    }
    float _1976 = _1958;
    if (_1948)
    {
        float _1978 = _1976 * 0.15915493667125701904296875;
        _1854 = _1978;
    }
    float _1980 = _1854;
    float _1982 = _1930;
    float _1984 = _1980;
    if (_1948)
    {
        float _1986 = _1980 * 6.283185482025146484375;
        float _1988 = sin(_1986);
        _1982 = _1988;
    }
    float _1990 = _1982;
    float _1992 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _1994 = precise::max(0.0, _1992);
    float _1996 = _1966;
    float _1998 = _1994;
    if (_1948)
    {
        float _2000 = _1980 * 6.283185482025146484375;
        float _2002 = cos(_2000);
        _1996 = _2002;
    }
    float _2004 = _1996;
    float _2006 = -_1934;
    float _2008 = -_1994;
    float _2010 = fma(_1914, _2006, _2008);
    if (_1948)
    {
        float _2012 = _2010 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1960 = _2012;
    }
    float _2014 = _1960;
    if (!_1948)
    {
        _1984 = _1940;
    }
    float _2016 = _1984;
    float _2018 = _1990;
    float _2020 = _2016;
    if (_1948)
    {
        float _2022 = fma(_1990, _2014, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1962 = _2022;
    }
    float _2024 = _1962;
    float _2026 = _2024;
    if (!_1948)
    {
        _2018 = _2010;
    }
    float _2028 = _2018;
    float _2030 = _2028;
    float _2032 = _2004;
    if (_1948)
    {
        float _2034 = _2004 + (-1.0);
        _1998 = _2034;
    }
    float _2036 = _1998;
    float _2038 = _2036;
    if (_1948)
    {
        float _2040 = _1970 * _2024;
        _1566 = _2040;
    }
    float _2042 = _1566;
    if (!_1948)
    {
        _1972 = _1936;
    }
    float _2044 = _1972;
    float _2046 = _2044;
    if (_1948)
    {
        float _2048 = _2036 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2038 = _2048;
    }
    float _2050 = _2038;
    if (_1948)
    {
        float _2052 = _1936 * _2042;
        _2046 = _2052;
    }
    float _2054 = _2046;
    if (!_1948)
    {
        _2026 = _1942;
    }
    float _2056 = _2026;
    float _2058 = fma(_1548, (*spvDescriptorSet0.vp_c15)._m0[652].x, (*spvDescriptorSet0.vp_c15)._m0[652].z);
    float _2060 = _2056;
    if (_1948)
    {
        float _2062 = fma(_2010, _2004, _2050);
        _2030 = _2062;
    }
    float _2064 = _2030;
    if (_1948)
    {
        float _2066 = _2054 * _2054;
        _2020 = _2066;
    }
    float _2068 = _2020;
    if (!_1948)
    {
        _2032 = _1938;
    }
    float _2070 = _2032;
    float _2072 = _2070;
    if (_1948)
    {
        float _2074 = _1938 * _2042;
        _2072 = _2074;
    }
    float _2076 = _2072;
    float _2078 = fma(_2064, _2064, _2068);
    float _2080 = _1780 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    if (_1948)
    {
        float _2082 = _2076 * _2076;
        _2060 = _2082;
    }
    float _2084 = _2060;
    float _2086 = floor(_2058);
    float _2088 = fma(_1782, (*spvDescriptorSet0.vp_c8)._m0[2].x, _2080);
    float _2090 = _2078 + _2084;
    float _2092 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _2094 = fma(_1932, (*spvDescriptorSet0.vp_c15)._m0[23].w, _2092);
    float _2096 = precise::clamp(_2094, 0.0, 1.0);
    float _2098 = fma(_1784, (*spvDescriptorSet0.vp_c8)._m0[2].z, _2088);
    float _2100 = -_2096;
    float _2102 = _2100 + 1.0;
    float _2104 = rsqrt(_2090);
    float _2106 = _2098 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _2108 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _2110 = fma(_1540, (*spvDescriptorSet0.vp_c15)._m0[652].y, (*spvDescriptorSet0.vp_c15)._m0[652].w);
    float _2112 = _1780 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _2114 = _2106 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _2116 = abs(_2102);
    float _2118 = log2(_2116);
    float _2120 = _1780 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _2122 = -_2114;
    float _2124 = fma(_2122, _2108, 1.0);
    float _2126 = _1780 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _2128 = fma(_1782, (*spvDescriptorSet0.vp_c8)._m0[3].x, _2112);
    float _2130 = fma(_1782, (*spvDescriptorSet0.vp_c8)._m0[1].x, _2120);
    float _2132 = -_2086;
    float _2134 = _2058 + _2132;
    float _2136 = fma(_1782, (*spvDescriptorSet0.vp_c8)._m0[0].x, _2126);
    float _2138 = _2104 * _2054;
    float _2140 = fma(_1784, (*spvDescriptorSet0.vp_c8)._m0[1].z, _2130);
    float _2142 = _2104 * _2064;
    float _2144 = fma(_1784, (*spvDescriptorSet0.vp_c8)._m0[0].z, _2136);
    float _2146 = _2104 * _2076;
    float _2148 = _2140 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _2150 = _2138 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _2152 = _2144 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _2154 = floor(_2110);
    float _2156 = _2148 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _2158 = -_2150;
    float _2160 = fma(_2142, (*spvDescriptorSet0.vp_c15)._m0[21].y, _2158);
    float _2162 = fma(_1784, (*spvDescriptorSet0.vp_c8)._m0[3].z, _2128);
    float _2164 = _2118 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _2166 = fma(_2152, (*spvDescriptorSet0.vp_c8)._m0[7].x, _2156);
    float _2168 = -_2146;
    float _2170 = fma(_2168, (*spvDescriptorSet0.vp_c15)._m0[21].z, _2160);
    float _2172 = _2162 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _2174 = fma(_2106, (*spvDescriptorSet0.vp_c8)._m0[7].z, _2166);
    float _2176 = fma(_2170, -0.5, 0.5);
    float _2178 = fma(_2170, 0.5, 0.5);
    float _2180 = exp2(_2164);
    float _2182 = fma(_2172, (*spvDescriptorSet0.vp_c8)._m0[7].w, _2174);
    float _2184 = _2148 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _2186 = _2148 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _2188 = -_2154;
    float _2190 = _2110 + _2188;
    float _2192 = fma(_2178, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _2194 = fma(_2152, (*spvDescriptorSet0.vp_c8)._m0[4].x, _2184);
    float _2196 = fma(_2152, (*spvDescriptorSet0.vp_c8)._m0[5].x, _2186);
    float _2198 = 1.0 / _2182;
    float _2200 = fma(_2178, _2192, -0.212114393711090087890625);
    float _2202 = fma(_2106, (*spvDescriptorSet0.vp_c8)._m0[4].z, _2194);
    float _2204 = fma(_2106, (*spvDescriptorSet0.vp_c8)._m0[5].z, _2196);
    float _2206 = log2(_2124);
    float _2208 = fma(_2172, (*spvDescriptorSet0.vp_c8)._m0[4].w, _2202);
    float _2210 = fma(_2172, (*spvDescriptorSet0.vp_c8)._m0[5].w, _2204);
    float _2212 = sqrt(_2176);
    float _2214 = _2208 * _2198;
    float2 _6663 = float2(_2134, _2190);
    float _2216 = dm_bs(spvDescriptorSet0.vp_t_tcb_24.sample(spvDescriptorSet0.vp_t_tcb_24Smplr, select(_6663, float2(0.0), isnan(_6663)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_24, spvDescriptorSet0.vp_t_tcb_24Smplr_w, select(_6663, float2(0.0), isnan(_6663)), level(0.0)).x;
    float _2218 = fma(_2178, _2200, 1.570728778839111328125);
    float _2220 = _2206 * 0.693147182464599609375;
    float _2222 = _2142 + 1.0;
    float _2224 = _2220 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _2226 = -_2142;
    float _2228 = fma(_2180, _2222, _2226);
    float _2230 = _2210 * _2198;
    float _2232 = fma(_2214, 0.5, 0.5);
    float _2234 = _2212 * 0.636619746685028076171875;
    float _2236 = fma(_2228, 0.5, 0.5);
    float _2238 = fma(_2230, -0.5, 0.5);
    float _2240 = -_2218;
    float _2242 = fma(_2234, _2240, 1.0);
    float3 _6710 = float3(_2232, _2238, _2224);
    float _2244 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_6710, float3(0.0), isnan(_6710)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_6710, float3(0.0), isnan(_6710)), level(0.0)).x;
    float3 _6721 = float3(_2232, _2238, _2224);
    float4 _2247 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_6721, float3(0.0), isnan(_6721)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_6721, float3(0.0), isnan(_6721)), level(0.0)).xyzw;
    float _2249 = _2247.x;
    float _2251 = _2247.y;
    float _2253 = _2247.z;
    float _2255 = _2247.w;
    float2 _6737 = float2(_2242, _2236);
    float3 _2259 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_6737, float2(0.0), isnan(_6737)), level(0.0)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_6737, float2(0.0), isnan(_6737)), level(0.0)).xyz;
    float _2261 = _2259.x;
    float _2263 = _2259.y;
    float _2265 = _2259.z;
    float _2267 = in.m_57.w;
    float _2269 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].z;
    float _2271 = in.m_65.y;
    bool _2273 = _660 > 0.5;
    float _2275 = _2118 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    bool _2277 = _664 > 0.5;
    float _2279 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _2281 = _2279 + (*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _2283 = -(*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _2285 = _2283 + (*spvDescriptorSet0.vp_c9)._m0[133].w;
    float _2287 = in.m_65.x;
    float _2289 = 1.0 / _2281;
    float _2291 = _2148 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _2293 = -(*spvDescriptorSet0.vp_c9)._m0[133].w;
    float _2295 = _2293 + (*spvDescriptorSet0.vp_c9)._m0[134].w;
    out.m_67.x = _616;
    out.m_67.y = _630;
    out.m_67.z = _618;
    out.m_67.w = _634;
    float _2297 = fma(_2152, (*spvDescriptorSet0.vp_c8)._m0[6].x, _2291);
    float _2299 = 1.0 / _2285;
    out.m_69.w = _1048;
    float _2301 = fma(_2106, (*spvDescriptorSet0.vp_c8)._m0[6].z, _2297);
    bool _2303 = _2267 > 0.5;
    out.m_71.x = _1548;
    out.m_71.y = _1526;
    out.m_71.z = _1540;
    float _2305 = -_2271;
    float _2307 = _2305 + 1.0;
    float _2309 = 1.0 / _2295;
    int _2311 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _2313 = _2311 != 0;
    float _2315 = -(*spvDescriptorSet0.vp_c9)._m0[132].x;
    float _2317 = _2315 + (*spvDescriptorSet0.vp_c9)._m0[133].x;
    int _2319 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _2321 = _2319 != 0;
    float _2323 = -(*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _2325 = _658 + _2323;
    int _2327 = _2277 ? as_type<int>(_2307) : as_type<int>(_2271);
    float _2329 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _2331 = _658 + _2329;
    float _2333 = _2317 * _2299;
    int _2335 = _2303 ? as_type<int>(_2307) : as_type<int>(_2271);
    float _2337 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].w;
    float _2339 = _2321 ? as_type<float>(_2327) : _2271;
    float _2341 = -(*spvDescriptorSet0.vp_c9)._m0[131].x;
    float _2343 = (*spvDescriptorSet0.vp_c9)._m0[132].x + _2341;
    int _2345 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 32;
    bool _2347 = _2345 != 0;
    float _2349 = _1272 * _1326;
    float _2351 = _2299;
    float _2353 = _2289;
    float _2355 = _2271;
    float _2357 = _2208;
    if (!_2313)
    {
        _2351 = _2287;
    }
    float _2359 = _2351;
    float _2361 = _2343 * _2289;
    bool _2363 = _658 >= (*spvDescriptorSet0.vp_c9)._m0[134].w;
    bool _2365 = isnan(_658);
    bool _2367 = _2363 || _2365;
    bool _2369 = isnan((*spvDescriptorSet0.vp_c9)._m0[134].w);
    bool _2371 = _2367 || _2369;
    float _2373 = float(_2371);
    float _2375 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _2377 = fma(_2361, _2331, (*spvDescriptorSet0.vp_c9)._m0[131].x);
    int _2379 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _2381 = _2379 != 0;
    float _2383 = _1272 * _1336;
    int _2385 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 16;
    bool _2387 = _2385 != 0;
    float _2389 = -(*spvDescriptorSet0.vp_c9)._m0[133].x;
    float _2391 = (*spvDescriptorSet0.vp_c9)._m0[134].x + _2389;
    int _2393 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _2395 = _2393 != 0;
    float _2397 = fma(_2333, _2325, (*spvDescriptorSet0.vp_c9)._m0[132].x);
    float _2399 = _2359;
    bool _2401 = _2395;
    if (!_2313)
    {
        _2353 = _2359;
    }
    float _2403 = _2353;
    float _2405 = _2391 * _2309;
    float _2407 = _2403;
    if (_2313)
    {
        _2399 = _2287;
    }
    float _2409 = _2399;
    float _2411 = -_2373;
    float _2413 = _2411 + 1.0;
    bool _2415 = _658 >= (*spvDescriptorSet0.vp_c9)._m0[133].w;
    bool _2417 = isnan(_658);
    bool _2419 = _2415 || _2417;
    bool _2421 = isnan((*spvDescriptorSet0.vp_c9)._m0[133].w);
    bool _2423 = _2419 || _2421;
    float _2425 = float(_2423);
    float _2427 = _2337 * (*spvDescriptorSet0.vp_c9)._m0[90].y;
    bool _2429 = _658 >= (*spvDescriptorSet0.vp_c9)._m0[132].w;
    bool _2431 = isnan(_658);
    bool _2433 = _2429 || _2431;
    bool _2435 = isnan((*spvDescriptorSet0.vp_c9)._m0[132].w);
    bool _2437 = _2433 || _2435;
    float _2439 = float(_2437);
    int _2441 = 0;
    float _2443 = _2409;
    if (_2381)
    {
        float _2445 = -_2409;
        float _2447 = _2445 + 1.0;
        _2441 = as_type<int>(_2447);
    }
    int _2449 = _2441;
    float _2451 = _2395 ? as_type<float>(_2335) : _2271;
    float _2453 = _2425 * _2413;
    float _2455 = -_2425;
    float _2457 = _2455 + 1.0;
    int _2459 = as_type<int>(_2457);
    float _2461 = as_type<float>(_2449);
    if (_2313)
    {
        bool _2463 = _692 > 0.5;
        _2401 = _2463;
    }
    bool _2465 = _2401;
    int _2467 = 0;
    if (_2387)
    {
        float _2469 = -_2409;
        float _2471 = _2469 + 1.0;
        _2467 = as_type<int>(_2471);
    }
    int _2473 = _2467;
    float _2475 = in.m_73.x;
    float _2477 = in.m_73.y;
    float _2479 = in.m_73.z;
    if (_2347)
    {
        float _2481 = _2273 ? _2307 : _2271;
        _2355 = _2481;
    }
    float _2483 = _2355;
    float _2485 = _2439 * _2457;
    bool _2487 = _658 >= (*spvDescriptorSet0.vp_c9)._m0[131].w;
    bool _2489 = isnan(_658);
    bool _2491 = _2487 || _2489;
    bool _2493 = isnan((*spvDescriptorSet0.vp_c9)._m0[131].w);
    bool _2495 = _2491 || _2493;
    float _2497 = float(_2495);
    float _2499 = -_2439;
    float _2501 = _2499 + 1.0;
    bool _2503 = _1206 != 0.0;
    bool _2505 = isnan(_1206);
    bool _2507 = _2503 || _2505;
    bool _2509 = isnan(0.0);
    bool _2511 = _2507 || _2509;
    float _2513 = _2483;
    if (_2313)
    {
        float _2515 = -_2409;
        float _2517 = _2515 + 1.0;
        _2459 = as_type<int>(_2517);
    }
    int _2519 = _2459;
    float _2521 = -(*spvDescriptorSet0.vp_c9)._m0[133].w;
    float _2523 = _658 + _2521;
    float _2525 = _2497 * _2501;
    bool _2527 = _1204 == 0.0;
    bool _2529 = !_2511;
    bool _2531 = _2527 && _2529;
    float _2533 = -_2497;
    float _2535 = _2533 + 1.0;
    float _2537 = _2535;
    if (_2313)
    {
        float _2539 = _2465 ? as_type<float>(_2519) : _2409;
        _2407 = _2539;
    }
    float _2541 = _2407;
    float _2543 = _2377 * _2525;
    bool _2545 = _1208 == 0.0;
    bool _2547 = _2545 && _2531;
    float _2549 = in.m_75.x;
    float _2551 = in.m_75.y;
    float _2553 = in.m_75.z;
    float _2555 = in.m_75.w;
    float _2557 = 0.0;
    if (!_2381)
    {
        _2557 = _2409;
    }
    float _2559 = _2557;
    float _2561 = fma(_2535, (*spvDescriptorSet0.vp_c9)._m0[131].x, _2543);
    float _2563 = _2559;
    if (_2381)
    {
        float _2565 = _2273 ? as_type<float>(_2449) : _2409;
        _2563 = _2565;
    }
    float _2567 = _2563;
    float _2569 = fma(_2405, _2523, (*spvDescriptorSet0.vp_c9)._m0[133].x);
    float _2571 = 0.0;
    if (!_2387)
    {
        _2571 = _2409;
    }
    float _2573 = _2571;
    float _2575 = fma(_2427, _2483, -0.5);
    float _2577 = _2573;
    if (_2387)
    {
        float _2579 = _2277 ? as_type<float>(_2473) : _2409;
        _2577 = _2579;
    }
    float _2581 = _2577;
    float _2583 = _2269 * (*spvDescriptorSet0.vp_c9)._m0[90].x;
    float _2585 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _2587 = _2541 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _2589 = fma(_2397, _2485, _2561);
    float _2591 = 0.0;
    if (_2547)
    {
        _2591 = _2475;
    }
    float _2593 = _2591;
    float _2595 = fma(_2583, _2581, -0.5);
    float _2597 = _2593;
    if (_2547)
    {
        _2461 = _2477;
    }
    float _2599 = _2461;
    float _2601 = fma(_2569, _2453, _2589);
    float _2603 = _2599;
    if (_2547)
    {
        _2537 = _2593;
    }
    float _2605 = _2537;
    float _2607 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    float _2609 = _2605;
    if (!_2547)
    {
        _2597 = _2475;
    }
    float _2611 = _2597;
    float _2613 = -_966;
    float _2615 = fma(_958, _2575, _2613);
    if (_2547)
    {
        _2513 = _2599;
    }
    float _2617 = _2513;
    float _2619 = fma(_2373, (*spvDescriptorSet0.vp_c9)._m0[134].x, _2601);
    float _2621 = _2617;
    if (!_2547)
    {
        _2603 = _2477;
    }
    float _2623 = _2603;
    float _2625 = _2339 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _2627 = fma(_970, _2595, _964);
    float _2629 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    if (_2547)
    {
        _2443 = _2479;
    }
    float _2631 = _2443;
    float _2633 = _2631;
    if (!_2547)
    {
        float _2635 = fma(_1206, (*spvDescriptorSet0.vp_c9)._m0[17].y, _2623);
        _2621 = _2635;
    }
    float _2637 = _2621;
    float _2639 = _2553 * _2611;
    if (!_2547)
    {
        float _2641 = fma(_1208, (*spvDescriptorSet0.vp_c9)._m0[17].y, _2479);
        _2633 = _2641;
    }
    float _2643 = _2633;
    float _2645 = _2451 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    float _2647 = _2625 * _2375;
    float _2649 = -_2639;
    float _2651 = fma(_2549, _2479, _2649);
    float _2653 = _2551 * _2479;
    float _2655 = _2567 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    if (!_2547)
    {
        float _2657 = fma(_1204, (*spvDescriptorSet0.vp_c9)._m0[17].y, _2611);
        _2609 = _2657;
    }
    float _2659 = _2609;
    float _2661 = _2549 * _2623;
    float _2663 = -_2653;
    float _2665 = fma(_2553, _2623, _2663);
    float _2667 = _2655 * _2607;
    float _2669 = -_2661;
    float _2671 = fma(_2551, _2611, _2669);
    float _2673 = _2645 * _2629;
    float _2675 = _2587 * _2585;
    float _2677 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _2679 = _2627 + 0.5;
    out.m_77.x = _2675;
    out.m_77.y = _2647;
    out.m_77.z = _2667;
    out.m_77.w = _2673;
    float _2681 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _2683 = _2677 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2685 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _2687 = _2619 * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    float _2689 = _2681 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2691 = _1250 * _1326;
    float _2693 = _2685 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2695 = _1284 * _1326;
    float _2697 = fma(_1238, _1312, _2349);
    float _2699 = -_1248;
    float _2701 = fma(_2699, _1312, _2691);
    float _2703 = _2615 + 0.5;
    out.m_79.x = _2689;
    out.m_79.y = _2683;
    out.m_79.z = _2693;
    out.m_79.w = _2687;
    float _2705 = fma(_1238, _1308, _2383);
    float _2707 = _2651 * _2555;
    float _2709 = _1250 * _1332;
    float _2711 = abs(_1794);
    float _2713 = log2(_2711);
    float _2715 = _1250 * _1336;
    float _2717 = _1272 * _1332;
    float _2719 = _1284 * _1332;
    float _2721 = -_1248;
    float _2723 = fma(_2721, _1310, _2709);
    float _2725 = -_1248;
    float _2727 = fma(_2725, _1308, _2715);
    float _2729 = _1284 * _1336;
    float _2731 = fma(_1232, _1168, _2701);
    float _2733 = fma(_1232, _1140, _2723);
    float _2735 = fma(_1232, _1146, _2727);
    float _2737 = fma(_1260, _1312, _2695);
    float _2739 = fma(_1260, _1308, _2729);
    float _2741 = fma(_1280, _1168, _2697);
    out.m_81.x = _2679;
    out.m_81.y = _2703;
    float _2743 = fma(_1274, _1168, _2737);
    float _2745 = _2713 * (*spvDescriptorSet0.vp_c15)._m0[654].z;
    float _2747 = fma(_1238, _1310, _2717);
    float _2749 = fma(_1280, _1146, _2705);
    float _2751 = fma(_1274, _1146, _2739);
    float _2753 = _2733 * _2551;
    float _2755 = _2731 * _2551;
    float _2757 = exp2(_2745);
    float _2759 = _2735 * _2551;
    float _2761 = _2735 * _2637;
    float _2763 = _2707 * _2733;
    float _2765 = _2707 * _2731;
    float _2767 = _2707 * _2735;
    float _2769 = fma(_1280, _1140, _2747);
    float _2771 = _2733 * _2637;
    float _2773 = _2665 * _2555;
    float _2775 = _2731 * _2637;
    float _2777 = _2671 * _2555;
    float _2779 = exp2(_2275);
    float _2781 = fma(_2773, _2741, _2765);
    float _2783 = fma(_2741, _2659, _2775);
    float _2785 = fma(_2749, _2659, _2761);
    float _2787 = fma(_2757, (*spvDescriptorSet0.vp_c15)._m0[654].x, (*spvDescriptorSet0.vp_c15)._m0[654].y);
    float _2789 = precise::clamp(_2787, 0.0, 1.0);
    float _2791 = fma(_2769, _2659, _2771);
    float _2793 = fma(_2773, _2769, _2763);
    float _2795 = fma(_2741, _2549, _2755);
    float _2797 = fma(_2789, -2.0, 3.0);
    float _2799 = _2789 * _2789;
    float _2801 = fma(_2773, _2749, _2767);
    float _2803 = fma(_1260, _1310, _2719);
    bool _2805 = _1794 <= 8000.0;
    bool _2807 = isnan(_1794);
    bool _2809 = _2805 || _2807;
    bool _2811 = isnan(8000.0);
    bool _2813 = _2809 || _2811;
    float _2815 = float(_2813);
    float _2817 = _2799 * _2797;
    float _2819 = fma(_2769, _2549, _2753);
    float _2821 = fma(_1274, _1140, _2803);
    float _2823 = fma(_2749, _2549, _2759);
    float _2825 = -_2817;
    float _2827 = _2825 + 1.0;
    float _2829 = fma(_2777, _2743, _2781);
    float _2831 = fma(_2777, _2821, _2793);
    float _2833 = -_2779;
    float _2835 = _2833 + 1.0;
    float _2837 = fma(_2827, (*spvDescriptorSet0.vp_c15)._m0[654].w, _2817);
    float _2839 = fma(_2777, _2751, _2801);
    float _2841 = fma(_2821, _2553, _2819);
    float _2843 = in.m_83.x;
    float _2845 = _2815 * _2837;
    float _2847 = fma(_2743, _2553, _2795);
    float _2849 = fma(_2751, _2553, _2823);
    out.m_85.x = _2831;
    out.m_85.y = _2829;
    out.m_85.z = _2839;
    float _2851 = _2845 * (*spvDescriptorSet0.vp_c15)._m0[653].x;
    float _2853 = fma(_2172, (*spvDescriptorSet0.vp_c8)._m0[6].w, _2301);
    float _2855 = _2182 * 0.5;
    out.m_87.x = _2841;
    out.m_87.y = _2847;
    out.m_87.z = _2849;
    float _2857 = _2208 + _2182;
    float _2859 = _2853 + _2182;
    float _2861 = fma(_2210, -0.5, _2855);
    float _2863 = fma(_2821, _2643, _2791);
    float _2865 = _2859 * 0.5;
    float _2867 = _2857 * 0.5;
    float _2869 = _2835 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _2871 = fma(_2743, _2643, _2783);
    float _2873 = fma(_2751, _2643, _2785);
    out.m_89.x = _1212;
    bool _2875 = _1932 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _2877 = isnan(_1932);
    bool _2879 = _2875 || _2877;
    bool _2881 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _2883 = _2879 || _2881;
    out.m_91.x = _2867;
    out.m_91.y = _2861;
    out.m_91.z = _2865;
    out.m_91.w = _2182;
    out.m_93.x = _2863;
    out.m_93.y = _2871;
    out.m_93.z = _2873;
    out.m_95.x = _1782;
    out.m_95.y = _1780;
    out.m_95.z = _1784;
    float _2885 = _2823;
    float _2887 = (*spvDescriptorSet0.vp_c15)._m0[653].y;
    if (!_2883)
    {
        _2885 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _2889 = _2885;
    out.gl_Position.x = _2208;
    out.gl_Position.y = _2210;
    out.gl_Position.z = _2853;
    out.gl_Position.w = _2182;
    float _2891 = _2889;
    float _2893 = _2889;
    if (!_2883)
    {
        _2357 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _2895 = _2357;
    float _2897 = -_2216;
    float _2899 = _2897 + 1.0;
    float _2901 = _2899 * _2851;
    float _2903 = precise::clamp(_2901, 0.0, 1.0);
    float _2905 = -_2903;
    float _2907 = fma(_2905, (*spvDescriptorSet0.vp_c15)._m0[653].y, 1.0);
    float _2909 = _2843;
    float _2911 = _2895;
    float _2913 = _2895;
    if (!_2883)
    {
        _2887 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _2915 = _2887;
    float _2917 = _2907 * _2843;
    float _2919 = _2915;
    float _2921 = _2915;
    if (!_2883)
    {
        _2909 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _2923 = _2909;
    float _2925 = _2917 * (*spvDescriptorSet0.vp_c13)._m0[1].w;
    float _2927 = _2869 * _2244;
    float _2929 = -_2869;
    float _2931 = _2929 + 1.0;
    out.m_97.x = _2925;
    float _2933 = _2255 * _2927;
    float _2935 = _2265 * _2927;
    float _2937 = _2255 * _2931;
    float _2939 = _1850 * _1910;
    float _2941 = fma(_2261, _2933, _2249);
    float _2943 = fma(_2263, _2933, _2251);
    float _2945 = fma(_2255, _2935, _2253);
    float _2947 = _2939 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _2949 = _2927;
    float _2951 = _2939;
    float _2953 = _2923;
    float _2955 = _2923;
    if (!_2883)
    {
        _2949 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _2957 = _2949;
    float _2959 = _2957;
    float _2961 = _2957;
    if (!_2883)
    {
        _2951 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _2963 = _2951;
    out.m_99.x = _2941;
    out.m_99.y = _2943;
    out.m_99.z = _2945;
    out.m_99.w = _2937;
    bool _2965 = !_2883;
    float _2967 = _2963;
    float _2969 = _2963;
    if (!_2965)
    {
        bool _2971 = _1932 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _2973 = isnan(_1932);
        bool _2975 = _2971 || _2973;
        bool _2977 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _2979 = _2975 || _2977;
        if (!_2979)
        {
            float _2981 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2983 = _1932 + _2981;
            float _2985 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2987 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _2985;
            float _2989 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _2991 = _2989 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _2993 = 1.0 / _2987;
            float _2995 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _2997 = _2995 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _2999 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _3001 = _2999 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _3003 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _3005 = _3003 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _3007 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _3009 = _3007 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _3011 = _2983 * _2993;
            float _3013 = precise::clamp(_3011, 0.0, 1.0);
            float _3015 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _3017 = _3015 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _3019 = fma(_3013, _2991, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _3021 = fma(_3013, _3017, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _3023 = fma(_3013, _2997, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _3025 = fma(_3013, _3001, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _3027 = fma(_3013, _3005, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _3029 = fma(_3013, _3009, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            _2913 = _3023;
            _2921 = _3027;
            _2893 = _3019;
            _2961 = _3025;
            _2955 = _3021;
            _2969 = _3029;
            _3031 = true;
        }
        else
        {
            bool _3033 = _1932 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _3035 = isnan(_1932);
            bool _3037 = _3033 || _3035;
            bool _3039 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _3041 = _3037 || _3039;
            if (!_3041)
            {
                _2891 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _3043 = _2891;
            _2893 = _3043;
            if (!_3041)
            {
                _2911 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _3045 = _2911;
            _2913 = _3045;
            if (!_3041)
            {
                _2953 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _3047 = _2953;
            _2955 = _3047;
            if (!_3041)
            {
                _2959 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _3049 = _2959;
            _2961 = _3049;
            if (!_3041)
            {
                _2919 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _3051 = _2919;
            _2921 = _3051;
            if (!_3041)
            {
                _2967 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _3053 = _2967;
            bool _3055 = !_3041;
            _2969 = _3053;
            if (!_3055)
            {
                bool _3057 = _1932 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _3059 = isnan(_1932);
                bool _3061 = _3057 || _3059;
                bool _3063 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _3065 = _3061 || _3063;
                if (!_3065)
                {
                    float _3067 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _3069 = _1932 + _3067;
                    float _3071 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _3073 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _3071;
                    float _3075 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _3077 = _3075 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _3079 = 1.0 / _3073;
                    float _3081 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _3083 = _3081 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _3085 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _3087 = _3085 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _3089 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _3091 = _3089 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _3093 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _3095 = _3093 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _3097 = _3069 * _3079;
                    float _3099 = precise::clamp(_3097, 0.0, 1.0);
                    float _3101 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _3103 = _3101 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _3105 = fma(_3099, _3077, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _3107 = fma(_3099, _3103, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _3109 = fma(_3099, _3083, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _3111 = fma(_3099, _3087, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _3113 = fma(_3099, _3091, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _3115 = fma(_3099, _3095, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    _2913 = _3109;
                    _2921 = _3113;
                    _2893 = _3105;
                    _2961 = _3111;
                    _2955 = _3107;
                    _2969 = _3115;
                    _3031 = true;
                }
                else
                {
                    _2913 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _2921 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _2893 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _2961 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _2955 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _2969 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _3031 = false;
    float _3117 = _2913;
    float _3119 = _2921;
    float _3121 = _2893;
    float _3123 = _2961;
    float _3125 = _2955;
    float _3127 = _2969;
    float _3129 = fma(_2871, -0.5, 0.5);
    float _3131 = precise::clamp(_3129, 0.0, 1.0);
    float _3133 = -_3117;
    float _3135 = _3133 + _3119;
    float _3137 = _2947 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _3139 = -_3121;
    float _3141 = _3139 + _3123;
    float _3143 = fma(_3131, _3135, _3117);
    out.m_101.x = 0.0;
    float _3145 = -_3125;
    float _3147 = _3145 + _3127;
    float _3149 = fma(_3131, _3141, _3121);
    float _3151 = _3143 * 0.586610972881317138671875;
    out.m_49.x = _3137;
    bool _3153 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _3155 = fma(_3131, _3147, _3125);
    float _3157 = fma(_3149, 0.298911988735198974609375, _3151);
    bool _3159 = _1850 > 0.0;
    bool _3161 = isnan(_1850);
    bool _3163 = _3159 || _3161;
    bool _3165 = isnan(0.0);
    bool _3167 = _3163 || _3165;
    float _3169 = fma(_3155, 0.114477999508380889892578125, _3157);
    bool _3171 = _1910 <= 0.0;
    bool _3173 = !_3167;
    bool _3175 = _3171 || _3173;
    float _3177 = -_3169;
    float _3179 = _3149 + _3177;
    float _3181 = -_3169;
    float _3183 = _3143 + _3181;
    float _3185 = -_3169;
    float _3187 = _3155 + _3185;
    float _3189 = fma(_3179, (*spvDescriptorSet0.vp_c13)._m0[1].z, _3169);
    float _3191 = fma(_3183, (*spvDescriptorSet0.vp_c13)._m0[1].z, _3169);
    float _3193 = fma(_3187, (*spvDescriptorSet0.vp_c13)._m0[1].z, _3169);
    bool _3195 = !_3153;
    if (!_3195)
    {
        float _3197 = -_1780;
        float _3199 = _3197 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
        float _3201 = -_1782;
        float _3203 = _3201 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
        float _3205 = -_1784;
        float _3207 = _3205 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
        float _3209 = _3199 * _3199;
        float _3211 = fma(_3203, _3203, _3209);
        float _3213 = fma(_3207, _3207, _3211);
        float _3215 = sqrt(_3213);
        float _3217 = rsqrt(_3213);
        float _3219 = -_3215;
        float _3221 = _3219 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
        float _3223 = _3221 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
        float _3225 = precise::clamp(_3223, 0.0, 1.0);
        float _3227 = _3203 * _3217;
        float _3229 = _3199 * _3217;
        float _3231 = abs(_3225);
        float _3233 = log2(_3231);
        float _3235 = _3207 * _3217;
        float _3237 = _3227 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
        float _3239 = _2871 * _3229;
        float _3241 = -_3229;
        float _3243 = -_3237;
        float _3245 = fma(_3241, (*spvDescriptorSet0.vp_c15)._m0[656].y, _3243);
        float _3247 = fma(_2863, _3227, _3239);
        float _3249 = -_3235;
        float _3251 = fma(_3249, (*spvDescriptorSet0.vp_c15)._m0[656].z, _3245);
        float _3253 = fma(_2873, _3235, _3247);
        float _3255 = precise::clamp(_3253, 0.0, 1.0);
        float _3257 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
        float _3259 = _3251 + _3257;
        float _3261 = _3233 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
        float _3263 = _3259 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
        float _3265 = precise::clamp(_3263, 0.0, 1.0);
        float _3267 = exp2(_3261);
        float _3269 = _3267 * _3265;
        float _3271 = _3255 * _3269;
        float _3273 = _3271 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
        float _3275 = _3271 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
        float _3277 = _3271 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
        out.m_101.x = _3273;
        out.m_101.y = _3275;
        out.m_101.z = _3277;
    }
    out.m_69.x = _3189;
    out.m_69.y = _3191;
    out.m_69.z = _3193;
    if (!_3175)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_67.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_67.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_67.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_67.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_79.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_79.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_79.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_79.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_101.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_101.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_101.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_101.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_97.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_97.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_97.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_97.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_99.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_99.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_99.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_99.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_69.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_69.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_69.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_69.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_53.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_53.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_53.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_53.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_89.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_89.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_89.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_89.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_77.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_77.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_77.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_77.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_81.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_81.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_81.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_81.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_71.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_71.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_71.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_71.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_91.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_91.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_91.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_91.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_49.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_49.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_49.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_49.w)); dm_cw(dm_gs, dm_p, 68, as_type<uint>(out.m_85.x)); dm_cw(dm_gs, dm_p, 69, as_type<uint>(out.m_85.y)); dm_cw(dm_gs, dm_p, 70, as_type<uint>(out.m_85.z)); dm_cw(dm_gs, dm_p, 71, as_type<uint>(out.m_85.w)); dm_cw(dm_gs, dm_p, 72, as_type<uint>(out.m_93.x)); dm_cw(dm_gs, dm_p, 73, as_type<uint>(out.m_93.y)); dm_cw(dm_gs, dm_p, 74, as_type<uint>(out.m_93.z)); dm_cw(dm_gs, dm_p, 75, as_type<uint>(out.m_93.w)); dm_cw(dm_gs, dm_p, 76, as_type<uint>(out.m_95.x)); dm_cw(dm_gs, dm_p, 77, as_type<uint>(out.m_95.y)); dm_cw(dm_gs, dm_p, 78, as_type<uint>(out.m_95.z)); dm_cw(dm_gs, dm_p, 79, as_type<uint>(out.m_95.w)); dm_cw(dm_gs, dm_p, 80, as_type<uint>(out.m_87.x)); dm_cw(dm_gs, dm_p, 81, as_type<uint>(out.m_87.y)); dm_cw(dm_gs, dm_p, 82, as_type<uint>(out.m_87.z)); dm_cw(dm_gs, dm_p, 83, as_type<uint>(out.m_87.w)); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    out.m_49.x = 0.0;
    float _3279 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _3279;
    { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_67.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_67.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_67.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_67.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_79.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_79.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_79.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_79.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_101.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_101.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_101.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_101.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_97.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_97.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_97.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_97.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_99.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_99.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_99.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_99.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_69.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_69.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_69.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_69.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_53.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_53.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_53.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_53.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_89.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_89.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_89.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_89.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_77.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_77.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_77.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_77.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_81.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_81.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_81.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_81.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_71.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_71.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_71.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_71.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_91.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_91.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_91.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_91.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_49.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_49.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_49.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_49.w)); dm_cw(dm_gs, dm_p, 68, as_type<uint>(out.m_85.x)); dm_cw(dm_gs, dm_p, 69, as_type<uint>(out.m_85.y)); dm_cw(dm_gs, dm_p, 70, as_type<uint>(out.m_85.z)); dm_cw(dm_gs, dm_p, 71, as_type<uint>(out.m_85.w)); dm_cw(dm_gs, dm_p, 72, as_type<uint>(out.m_93.x)); dm_cw(dm_gs, dm_p, 73, as_type<uint>(out.m_93.y)); dm_cw(dm_gs, dm_p, 74, as_type<uint>(out.m_93.z)); dm_cw(dm_gs, dm_p, 75, as_type<uint>(out.m_93.w)); dm_cw(dm_gs, dm_p, 76, as_type<uint>(out.m_95.x)); dm_cw(dm_gs, dm_p, 77, as_type<uint>(out.m_95.y)); dm_cw(dm_gs, dm_p, 78, as_type<uint>(out.m_95.z)); dm_cw(dm_gs, dm_p, 79, as_type<uint>(out.m_95.w)); dm_cw(dm_gs, dm_p, 80, as_type<uint>(out.m_87.x)); dm_cw(dm_gs, dm_p, 81, as_type<uint>(out.m_87.y)); dm_cw(dm_gs, dm_p, 82, as_type<uint>(out.m_87.z)); dm_cw(dm_gs, dm_p, 83, as_type<uint>(out.m_87.w)); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
}

