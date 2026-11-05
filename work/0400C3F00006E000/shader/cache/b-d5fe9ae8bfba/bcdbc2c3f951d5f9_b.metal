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
    float4 m_81 [[user(locn1)]];
    float4 m_101 [[user(locn2)]];
    float4 m_97 [[user(locn3)]];
    float4 m_99 [[user(locn4)]];
    float4 m_69 [[user(locn5)]];
    float4 m_53 [[user(locn6)]];
    float4 m_73 [[user(locn7)]];
    float4 m_79 [[user(locn8)]];
    float4 m_83 [[user(locn9)]];
    float4 m_71 [[user(locn10)]];
    float4 m_91 [[user(locn11)]];
    float4 m_49 [[user(locn12)]];
    float4 m_87 [[user(locn13)]];
    float4 m_93 [[user(locn14)]];
    float4 m_95 [[user(locn15)]];
    float4 m_89 [[user(locn16)]];
    float4 gl_Position [[position, invariant]];
    float gl_PointSize [[point_size]];
};

struct main0_in
{
    float4 m_85 [[attribute(0)]];
    float4 m_61 [[attribute(1)]];
    float4 m_55 [[attribute(2)]];
    float4 m_46 [[attribute(3)]];
    float4 m_51 [[attribute(4)]];
    float4 m_75 [[attribute(5)]];
    float4 m_63 [[attribute(6)]];
    float4 m_57 [[attribute(7)]];
    float4 m_59 [[attribute(8)]];
    float4 m_77 [[attribute(9)]];
    float4 m_65 [[attribute(10)]];
};

vertex main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]])
{
    main0_out out = {};
    out.m_67 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_81 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_101 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_97 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_99 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_69 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_53 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_73 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_79 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_83 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_71 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_91 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_49 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_87 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_93 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_95 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_89 = float4(0.0, 0.0, 0.0, 1.0);
    bool _2989 = false;
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
        float _3292 = as_type<float>(_134);
        out.gl_Position.z = _3292;
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
        float _3364 = as_type<float>(_174);
        out.gl_Position.z = _3364;
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
    float _834 = -_144;
    float _836 = fma(_834, (*spvDescriptorSet0.vp_c9)._m0[86].x, _772);
    float _838 = -_788;
    float _840 = _838 + (*spvDescriptorSet0.vp_c8)._m0[29].y;
    int _842 = ~_830;
    int _844 = _842 + 1;
    int _846 = _844 + 1;
    float _848 = fma((*spvDescriptorSet0.vp_c8)._m0[0].z, (*spvDescriptorSet0.vp_c10)._m0[10].w, _698);
    int _850 = _846;
    if (!_774)
    {
        int _852 = ~_830;
        int _854 = _852 + 1;
        _850 = _854;
    }
    int _856 = _850;
    float _858 = fma(_832, -2.0, _824);
    float _860 = _692 * 2.0;
    float _862 = fma(_776, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    bool _864 = !_680;
    int _866 = _864 ? 0 : 1;
    float _868 = _664 + _692;
    bool _870 = !_688;
    int _872 = _870 ? 0 : 1;
    float _874 = floor(_860);
    int _876 = abs(_866);
    float _878 = _868 + (-1.0);
    int _880 = abs(_872);
    float _882 = _828 * _144;
    float _884 = _848 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _886 = exp2(_882);
    float _888 = fma(_878, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    float _890 = float(_876);
    float _892 = float(_880);
    float _894 = float(_856);
    float _896 = float(_822);
    float _898 = _892 * _894;
    bool _900 = _874 > 0.0;
    float _902 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _904 = 1.0 + _902;
    bool _906 = _874 >= 0.0;
    bool _908 = isnan(_874);
    bool _910 = _906 || _908;
    bool _912 = isnan(0.0);
    bool _914 = _910 || _912;
    float _916 = _890 * _896;
    float _918 = in.m_61.x;
    float _920 = in.m_61.y;
    float _922 = in.m_61.z;
    bool _924 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _926 = isnan(1.0);
    bool _928 = _924 || _926;
    bool _930 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _932 = _928 || _930;
    float _934 = 1.0 / _904;
    float _936 = -_886;
    float _938 = _936 + 1.0;
    float _940 = (*spvDescriptorSet0.vp_c9)._m0[88].w + (*spvDescriptorSet0.vp_c9)._m0[88].y;
    float _942 = _898 * (-2.0);
    bool _944 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _946 = isnan(0.0);
    bool _948 = _944 || _946;
    bool _950 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _952 = _948 || _950;
    float _954 = fma(_664, (*spvDescriptorSet0.vp_c9)._m0[88].w, _940);
    float _956 = (*spvDescriptorSet0.vp_c9)._m0[88].z + (*spvDescriptorSet0.vp_c9)._m0[88].x;
    float _958 = _952 ? _938 : 0.0;
    float _960 = _746 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _962 = fma(_144, (*spvDescriptorSet0.vp_c9)._m0[87].w, _954);
    float _964 = fma(_692, (*spvDescriptorSet0.vp_c9)._m0[88].z, _956);
    float _966 = fma(_144, (*spvDescriptorSet0.vp_c9)._m0[86].y, _858);
    float _968 = fma(_808, _808, _816);
    float _970 = _916 * (-2.0);
    float _972 = fma(_144, (*spvDescriptorSet0.vp_c9)._m0[87].z, _964);
    if (_932)
    {
        float _974 = _958 * _934;
        _166 = _974;
    }
    float _976 = _166;
    float _978 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _980 = _960 + _978;
    int _982 = _914 ? 0 : 1;
    float _984 = fma(_888, _970, _888);
    float _986 = _840 * _840;
    float _988 = fma(_980, _980, _968);
    float _990 = _692 + (-0.5);
    float _992 = fma(_970, _918, _918);
    bool _994 = !_684;
    int _996 = _994 ? 0 : 1;
    float _998 = sqrt(_988);
    int _1000 = ~_982;
    int _1002 = _1000 + 1;
    int _1004 = _1002 + 1;
    float _1006 = fma(_990, (*spvDescriptorSet0.vp_c9)._m0[196].x, _992);
    int _1008 = _1004;
    if (!_900)
    {
        int _1010 = ~_982;
        int _1012 = _1010 + 1;
        _1008 = _1012;
    }
    int _1014 = _1008;
    float _1016 = -_794;
    float _1018 = _1016 + (*spvDescriptorSet0.vp_c8)._m0[29].x;
    int _1020 = abs(_996);
    float _1022 = _660 + (-0.5);
    float _1024 = float(_1014);
    float _1026 = rsqrt(_988);
    float _1028 = float(_1020);
    float _1030 = -_960;
    float _1032 = _1030 + (*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1034 = fma(_1018, _1018, _986);
    float _1036 = fma(_984, _976, _1006);
    float _1038 = _1028 * _1024;
    float _1040 = _788 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1042 = _998 * (*spvDescriptorSet0.vp_c13)._m0[2].x;
    float _1044 = fma(_942, _922, _922);
    float _1046 = fma(_1032, _1032, _1034);
    float _1048 = _1038 * (-2.0);
    float _1050 = fma(_862, _942, _862);
    float _1052 = precise::min(_670, _1042);
    float _1054 = fma(_1022, (*spvDescriptorSet0.vp_c9)._m0[196].z, _1044);
    float _1056 = fma(_794, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1040);
    float _1058 = rsqrt(_1046);
    float _1060 = _1036 * 0.15915493667125701904296875;
    float _1062 = _1026 * _1052;
    float _1064 = fma(_1048, _920, _920);
    float _1066 = fma(_960, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1056);
    float _1068 = _664 + (-0.5);
    float _1070 = _804 * _1062;
    float _1072 = _808 * _1062;
    float _1074 = sqrt(_1046);
    float _1076 = fma(_1050, _976, _1054);
    float _1078 = -_1070;
    float _1080 = _804 + _1078;
    float _1082 = -_1072;
    float _1084 = _808 + _1082;
    float _1086 = fma(_1068, (*spvDescriptorSet0.vp_c9)._m0[196].y, _1064);
    float _1088 = _1076 * 0.15915493667125701904296875;
    float _1090 = _1080 * _1080;
    float _1092 = 1.0 / _702;
    float _1094 = fma(_766, _1048, _766);
    float _1096 = _980 * _1062;
    float _1098 = fma(_1084, _1084, _1090);
    float _1100 = _1066 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1102 = fma(_1094, _976, _1086);
    float _1104 = -_1096;
    float _1106 = _980 + _1104;
    float _1108 = -_1100;
    float _1110 = _884 + _1108;
    bool _1112 = _1100 >= _884;
    bool _1114 = isnan(_1100);
    bool _1116 = _1112 || _1114;
    bool _1118 = isnan(_884);
    bool _1120 = _1116 || _1118;
    float _1122 = fma(_1106, _1106, _1098);
    float _1124 = _1102 * 0.15915493667125701904296875;
    float _1126 = (*spvDescriptorSet0.vp_c8)._m0[28].y * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _1128 = abs(_1110);
    float _1130 = precise::max(_1128, (*spvDescriptorSet0.vp_c9)._m0[194].y);
    float _1132 = sqrt(_1122);
    float _1134 = abs(_1074);
    float _1136 = precise::max(0.0, _1134);
    float _1138 = _1018 * _1058;
    float _1140 = precise::min(_1130, (*spvDescriptorSet0.vp_c9)._m0[194].z);
    float _1142 = fma((*spvDescriptorSet0.vp_c8)._m0[28].x, (*spvDescriptorSet0.vp_c8)._m0[28].x, _1126);
    float _1144 = _1032 * _1058;
    float _1146 = precise::min(_1136, 40.0);
    float _1148 = _1060 * 6.283185482025146484375;
    float _1150 = sin(_1148);
    float _1152 = -(*spvDescriptorSet0.vp_c9)._m0[194].y;
    float _1154 = _1140 + _1152;
    bool _1156 = !_1120;
    float _1158 = _1156 ? 1.0 : (-1.0);
    float _1160 = -(*spvDescriptorSet0.vp_c8)._m0[1].z;
    float _1162 = _1138 * _1160;
    float _1164 = fma((*spvDescriptorSet0.vp_c8)._m0[28].z, (*spvDescriptorSet0.vp_c8)._m0[28].z, _1142);
    float _1166 = _1154 * _1092;
    float _1168 = _840 * _1058;
    float _1170 = fma(_1146, -0.02500000037252902984619140625, 1.0);
    float _1172 = _1060 * 6.283185482025146484375;
    float _1174 = cos(_1172);
    float _1176 = _1026 * _1132;
    float _1178 = -(*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1180 = _1144 * _1178;
    float _1182 = in.m_63.x;
    float _1184 = in.m_63.y;
    float _1186 = in.m_63.z;
    float _1188 = -(*spvDescriptorSet0.vp_c8)._m0[1].x;
    float _1190 = -_1162;
    float _1192 = fma(_1144, _1188, _1190);
    float _1194 = _1158 * _1166;
    float _1196 = _156 * (*spvDescriptorSet0.vp_c9)._m0[194].w;
    float _1198 = -(*spvDescriptorSet0.vp_c8)._m0[1].x;
    float _1200 = _1168 * _1198;
    float _1202 = _1088 * 6.283185482025146484375;
    float _1204 = cos(_1202);
    float _1206 = -(*spvDescriptorSet0.vp_c8)._m0[1].z;
    float _1208 = -_1180;
    float _1210 = fma(_1168, _1206, _1208);
    float _1212 = _1192 * _1192;
    float _1214 = _1196 * _1194;
    float _1216 = _662 * _1176;
    float _1218 = _696 * _1176;
    float _1220 = fma(_1210, _1210, _1212);
    float _1222 = _1214 * 0.15915493667125701904296875;
    float _1224 = _1124 * 6.283185482025146484375;
    float _1226 = cos(_1224);
    float _1228 = _1124 * 6.283185482025146484375;
    float _1230 = sin(_1228);
    float _1232 = _1150 * _1204;
    float _1234 = _1174 * _1226;
    float _1236 = _1150 * _1226;
    float _1238 = _1226 * _1204;
    float _1240 = -(*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1242 = -_1200;
    float _1244 = fma(_1138, _1240, _1242);
    float _1246 = _1088 * 6.283185482025146484375;
    float _1248 = sin(_1246);
    float _1250 = _1174 * _1204;
    float _1252 = fma(_1244, _1244, _1220);
    float _1254 = _1150 * _1230;
    float _1256 = _1174 * _1230;
    float _1258 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _1184);
    float _1260 = _1230 * _1204;
    float _1262 = rsqrt(_1164);
    float _1264 = _690 * _1176;
    float _1266 = _1264 * _1258;
    float _1268 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _1186);
    float _1270 = rsqrt(_1252);
    float _1272 = fma(_1248, _1234, _1254);
    float _1274 = fma(_1248, _1254, _1234);
    float _1276 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _1182);
    float _1278 = -_1256;
    float _1280 = fma(_1248, _1236, _1278);
    float _1282 = -_1236;
    float _1284 = fma(_1248, _1256, _1282);
    float _1286 = -_1266;
    float _1288 = _1248 * _1286;
    float _1290 = _1216 * _1276;
    float _1292 = _1250 * _1266;
    float _1294 = _1232 * _1266;
    float _1296 = _1218 * _1268;
    float _1298 = fma(_1238, _1290, _1288);
    float _1300 = fma(_1272, _1290, _1292);
    float _1302 = fma(_1280, _1290, _1294);
    float _1304 = _1262 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _1306 = fma(_1260, _1296, _1298);
    float _1308 = _1244 * _1270;
    float _1310 = _1210 * _1270;
    float _1312 = _1192 * _1270;
    float _1314 = fma(_1284, _1296, _1300);
    float _1316 = _1138 * _1308;
    float _1318 = fma(_1274, _1296, _1302);
    float _1320 = _1144 * _1312;
    float _1322 = _1168 * _1310;
    float _1324 = -_1316;
    float _1326 = fma(_1144, _1310, _1324);
    float _1328 = _1262 * (*spvDescriptorSet0.vp_c8)._m0[28].x;
    float _1330 = -_1320;
    float _1332 = fma(_1168, _1308, _1330);
    float _1334 = -_1322;
    float _1336 = fma(_1138, _1312, _1334);
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
    float _1358 = fma(_1138, _1318, _1350);
    float _1360 = _788 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1362 = _788 + _1354;
    float _1364 = fma(_1144, _1318, _1352);
    float _1366 = _794 + _1358;
    float _1368 = fma(_1348, _1348, _1356);
    float _1370 = _1362 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1372 = _1362 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1374 = _1362 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1376 = fma(_794, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1360);
    float _1378 = fma(_1366, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1370);
    float _1380 = fma(_1366, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1372);
    float _1382 = _960 + _1364;
    float _1384 = fma(_1366, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1374);
    float _1386 = rsqrt(_1368);
    float _1388 = fma(_960, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1376);
    float _1390 = fma(_1382, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1380);
    float _1392 = fma(_1382, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1384);
    float _1394 = fma(_1382, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1378);
    float _1396 = _1388 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1398 = _1390 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1400 = _1392 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1402 = _1222 * 6.283185482025146484375;
    float _1404 = cos(_1402);
    float _1406 = _1394 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1408 = -_1398;
    float _1410 = _1408 + _1396;
    float _1412 = _1400 * (*spvDescriptorSet0.vp_c8)._m0[12].y;
    float _1414 = _1400 * (*spvDescriptorSet0.vp_c8)._m0[13].y;
    float _1416 = _1400 * (*spvDescriptorSet0.vp_c8)._m0[14].y;
    float _1418 = fma(_1170, _1410, _1398);
    float _1420 = fma(_1406, (*spvDescriptorSet0.vp_c8)._m0[12].x, _1412);
    float _1422 = _1222 * 6.283185482025146484375;
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
    float _1486 = _1476 * _1466;
    float _1488 = fma(_1444, _1456, _1404);
    float _1490 = fma(_1472, _1480, _1482);
    float _1492 = -_960;
    float _1494 = _1492 + _1484;
    float _1496 = fma(_1430, _1456, _1460);
    float _1498 = fma(_1488, _1480, _1486);
    float _1500 = fma(_1446, _1454, _1404);
    float _1502 = fma(_1450, _1494, _1490);
    float _1504 = fma(_1446, _1456, _1462);
    float _1506 = fma(_1496, _1494, _1498);
    float _1508 = _1500 * _1466;
    float _1510 = fma(_1502, _710, _960);
    float _1512 = -_1458;
    float _1514 = fma(_1430, _1454, _1512);
    float _1516 = fma(_1506, _710, _794);
    float _1518 = fma(_1504, _1480, _1508);
    float _1520 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1522 = _1510 + _1520;
    float _1524 = -_1070;
    float _1526 = _788 + _1524;
    float _1528 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1530 = _1516 + _1528;
    float _1532 = fma(_1514, _1494, _1518);
    float _1534 = _1522 * _1522;
    float _1536 = _1526 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _1538 = -_1096;
    float _1540 = _960 + _1538;
    float _1542 = _788 + _1532;
    float _1544 = fma(_1530, _1530, _1534);
    float _1546 = -_1072;
    float _1548 = _794 + _1546;
    float _1550 = sqrt(_1544);
    float _1552 = fma(_1548, (*spvDescriptorSet0.vp_c8)._m0[11].x, _1536);
    float _1554 = fma(_1540, (*spvDescriptorSet0.vp_c8)._m0[11].z, _1552);
    bool _1556 = _1550 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1558 = _1446;
    float _1560 = _1518;
    float _1562 = _1510;
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
        _1560 = _1542;
    }
    float _1572 = _1560;
    bool _1574 = !_1556;
    float _1576 = _1572;
    if (!_1574)
    {
        float _1578 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1580 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1582 = _1550 + _1580;
        float _1584 = _1542 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1586 = rsqrt(_1544);
        float _1588 = _1582 * _1578;
        float _1590 = _1588 * 0.15915493667125701904296875;
        float _1592 = _1590 * 6.283185482025146484375;
        float _1594 = cos(_1592);
        float _1596 = _1590 * 6.283185482025146484375;
        float _1598 = sin(_1596);
        float _1600 = _1594 + (-1.0);
        float _1602 = _1600 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1604 = fma(_1598, _1584, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1606 = fma(_1542, _1594, _1602);
        float _1608 = _1586 * _1604;
        float _1610 = fma(_1530, _1608, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1612 = fma(_1522, _1608, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _1576 = _1606;
        _1570 = _1610;
        _1562 = _1612;
    }
    float _1614 = _1576;
    float _1616 = _1570;
    float _1618 = _1562;
    float _1620 = -_788;
    float _1622 = _1620 + _1614;
    float _1624 = -_794;
    float _1626 = _1624 + _1616;
    float _1628 = _1554 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _1630 = _1526 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _1632 = _1622 * _1622;
    float _1634 = -_960;
    float _1636 = _1634 + _1618;
    float _1638 = 1.0 / _1628;
    float _1640 = fma(_1548, (*spvDescriptorSet0.vp_c8)._m0[10].x, _1630);
    float _1642 = fma(_1626, _1626, _1632);
    float _1644 = -_1070;
    float _1646 = _1644 + _1614;
    float _1648 = fma(_1540, (*spvDescriptorSet0.vp_c8)._m0[10].z, _1640);
    float _1650 = fma(_1636, _1636, _1642);
    bool _1652 = (*spvDescriptorSet0.vp_c15)._m0[653].w >= 0.5;
    bool _1654 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _1656 = _1652 || _1654;
    bool _1658 = isnan(0.5);
    bool _1660 = _1656 || _1658;
    float _1662 = -_1096;
    float _1664 = _1662 + _1618;
    float _1666 = _1648 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _1668 = sqrt(_1650);
    float _1670 = _1666 + _1628;
    float _1672 = _1670 * _1638;
    float _1674 = _1672 * 0.5;
    float _1676 = -_1072;
    float _1678 = _1676 + _1616;
    float _1680 = _1618;
    float _1682 = _1614;
    float _1684 = _1616;
    float _1686 = (*spvDescriptorSet0.vp_c8)._m0[30].w;
    float _1688 = _1678;
    float _1690 = _1664;
    if (_1660)
    {
        _1564 = 1.0;
    }
    float _1692 = _1564;
    float _1694 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _1696 = fma(_1674, (*spvDescriptorSet0.vp_c8)._m0[30].w, _1694);
    float _1698 = 1.0 / _1696;
    bool _1700 = _1668 > 0.0;
    float _1702 = _1692;
    if (!_1700)
    {
        _1680 = _1678;
    }
    float _1704 = _1680;
    float _1706 = _1704;
    if (!_1700)
    {
        _1682 = _1646;
    }
    float _1708 = _1682;
    float _1710 = _1708;
    if (!_1700)
    {
        _1684 = _1664;
    }
    float _1712 = _1684;
    bool _1714 = !_1700;
    float _1716 = _1712;
    float _1718 = _1712;
    if (!_1714)
    {
        float _1720 = _198 * _198;
        float _1722 = fma(_196, _196, _1720);
        float _1724 = rsqrt(_1650);
        float _1726 = fma(_200, _200, _1722);
        float _1728 = sqrt(_1726);
        float _1730 = _1626 * _1724;
        float _1732 = _1622 * _1724;
        float _1734 = _1636 * _1724;
        bool _1736 = _1728 > 0.0;
        float _1738 = _1724;
        float _1740 = _1728;
        _1686 = _1732;
        if (!_1736)
        {
            _1738 = _1678;
        }
        float _1742 = _1738;
        _1706 = _1742;
        if (!_1736)
        {
            _1740 = _1646;
        }
        float _1744 = _1740;
        _1710 = _1744;
        if (!_1736)
        {
            _1716 = _1664;
        }
        float _1746 = _1716;
        bool _1748 = !_1736;
        _1718 = _1746;
        if (!_1748)
        {
            float _1750 = rsqrt(_1726);
            float _1752 = 1.0 / (*spvDescriptorSet0.vp_c10)._m0[2].z;
            float _1754 = _198 * _1750;
            float _1756 = _196 * _1750;
            float _1758 = _1732 * _1754;
            float _1760 = _200 * _1750;
            float _1762 = fma(_1730, _1756, _1758);
            float _1764 = _1752 * (*spvDescriptorSet0.vp_c9)._m0[142].x;
            float _1766 = fma(_1734, _1760, _1762);
            float _1768 = _1766 * _1764;
            float _1770 = fma(_196, _1768, _1678);
            float _1772 = fma(_198, _1768, _1646);
            float _1774 = fma(_200, _1768, _1664);
            _1710 = _1772;
            _1706 = _1770;
            _1718 = _1774;
        }
    }
    float _1776 = _1710;
    float _1778 = _1706;
    float _1780 = _1718;
    float _1782 = _1686;
    float _1784 = _1782;
    if (_1660)
    {
        _1784 = 1.0;
    }
    float _1786 = _1784;
    float _1788 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _1790 = _1698 * _1788;
    float _1792 = _1786;
    if (!_1660)
    {
        float _1794 = (*spvDescriptorSet0.vp_c8)._m0[31].x * 0.5;
        float _1796 = _1794 * 0.15915493667125701904296875;
        float _1798 = _1796 * 6.283185482025146484375;
        float _1800 = cos(_1798);
        float _1802 = (*spvDescriptorSet0.vp_c8)._m0[31].y * 0.5;
        float _1804 = _1802 * 0.15915493667125701904296875;
        float _1806 = _1796 * 6.283185482025146484375;
        float _1808 = sin(_1806);
        float _1810 = 1.0 / _1800;
        float _1812 = _1804 * 6.283185482025146484375;
        float _1814 = cos(_1812);
        float _1816 = _1808 * _1810;
        float _1818 = _1804 * 6.283185482025146484375;
        float _1820 = sin(_1818);
        float _1822 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1824 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _1822;
        float _1826 = _1814 * _1816;
        float _1828 = 1.0 / _1824;
        float _1830 = 1.0 / _1826;
        float _1832 = _1820 * _1830;
        float _1834 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1836 = fma(_1790, _1832, _1834);
        float _1838 = _1836 * _1828;
        float _1840 = precise::clamp(_1838, 0.0, 1.0);
        _1688 = _1816;
        _1690 = _1796;
        _1702 = _1840;
    }
    float _1842 = _1688;
    float _1844 = _1690;
    float _1846 = _1702;
    float _1848 = _1842;
    float _1850 = _1844;
    if (!_1660)
    {
        float _1852 = (*spvDescriptorSet0.vp_c8)._m0[31].x * 0.5;
        float _1854 = _1852 * 0.15915493667125701904296875;
        float _1856 = _1854 * 6.283185482025146484375;
        float _1858 = cos(_1856);
        float _1860 = (*spvDescriptorSet0.vp_c8)._m0[31].y * 0.5;
        float _1862 = _1860 * 0.15915493667125701904296875;
        float _1864 = _1854 * 6.283185482025146484375;
        float _1866 = sin(_1864);
        float _1868 = 1.0 / _1858;
        float _1870 = _1862 * 6.283185482025146484375;
        float _1872 = cos(_1870);
        float _1874 = _1866 * _1868;
        float _1876 = _1862 * 6.283185482025146484375;
        float _1878 = sin(_1876);
        float _1880 = _1872 * _1874;
        float _1882 = 1.0 / _1880;
        float _1884 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _1886 = (*spvDescriptorSet0.vp_c9)._m0[140].w + _1884;
        float _1888 = 1.0 / _1886;
        float _1890 = _1878 * _1882;
        float _1892 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _1894 = fma(_1790, _1890, _1892);
        float _1896 = _1894 * _1888;
        float _1898 = precise::clamp(_1896, 0.0, 1.0);
        float _1900 = -_1898;
        float _1902 = _1900 + 1.0;
        _1848 = _1868;
        _1792 = _1902;
    }
    float _1904 = _1848;
    float _1906 = _1792;
    float _1908 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1910 = _1776 + _1908;
    float _1912 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1914 = _1778 + _1912;
    float _1916 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1918 = _1780 + _1916;
    float _1920 = _1910 * _1910;
    float _1922 = fma(_1914, _1914, _1920);
    float _1924 = fma(_1918, _1918, _1922);
    float _1926 = rsqrt(_1924);
    float _1928 = sqrt(_1924);
    float _1930 = _1926 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1932 = _1914 * _1930;
    float _1934 = _1918 * _1930;
    float _1936 = _1932 * _1932;
    float _1938 = _1934 * _1934;
    float _1940 = _1936 + _1938;
    float _1942 = sqrt(_1940);
    bool _1944 = _1942 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1946 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1948 = _1942 + _1946;
    float _1950 = _1918;
    float _1952 = _1920;
    float _1954 = _1948;
    float _1956 = _1910;
    float _1958 = _1904;
    if (_1944)
    {
        float _1960 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1950 = _1960;
    }
    float _1962 = _1950;
    if (_1944)
    {
        float _1964 = rsqrt(_1940);
        _1952 = _1964;
    }
    float _1966 = _1952;
    float _1968 = _1966;
    if (_1944)
    {
        float _1970 = _1948 * _1962;
        _1954 = _1970;
    }
    float _1972 = _1954;
    if (_1944)
    {
        float _1974 = _1972 * 0.15915493667125701904296875;
        _1850 = _1974;
    }
    float _1976 = _1850;
    float _1978 = _1926;
    float _1980 = _1976;
    if (_1944)
    {
        float _1982 = _1976 * 6.283185482025146484375;
        float _1984 = sin(_1982);
        _1978 = _1984;
    }
    float _1986 = _1978;
    float _1988 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _1990 = precise::max(0.0, _1988);
    float _1992 = _1962;
    float _1994 = _1990;
    if (_1944)
    {
        float _1996 = _1976 * 6.283185482025146484375;
        float _1998 = cos(_1996);
        _1992 = _1998;
    }
    float _2000 = _1992;
    float _2002 = -_1930;
    float _2004 = -_1990;
    float _2006 = fma(_1910, _2002, _2004);
    if (_1944)
    {
        float _2008 = _2006 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1956 = _2008;
    }
    float _2010 = _1956;
    if (!_1944)
    {
        _1980 = _1936;
    }
    float _2012 = _1980;
    float _2014 = _1986;
    float _2016 = _2012;
    if (_1944)
    {
        float _2018 = fma(_1986, _2010, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1958 = _2018;
    }
    float _2020 = _1958;
    float _2022 = _2020;
    if (!_1944)
    {
        _2014 = _2006;
    }
    float _2024 = _2014;
    float _2026 = _2024;
    float _2028 = _2000;
    if (_1944)
    {
        float _2030 = _2000 + (-1.0);
        _1994 = _2030;
    }
    float _2032 = _1994;
    float _2034 = _2032;
    if (_1944)
    {
        float _2036 = _1966 * _2020;
        _1566 = _2036;
    }
    float _2038 = _1566;
    if (!_1944)
    {
        _1968 = _1932;
    }
    float _2040 = _1968;
    float _2042 = _2040;
    if (_1944)
    {
        float _2044 = _2032 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2034 = _2044;
    }
    float _2046 = _2034;
    if (_1944)
    {
        float _2048 = _1932 * _2038;
        _2042 = _2048;
    }
    float _2050 = _2042;
    if (!_1944)
    {
        _2022 = _1938;
    }
    float _2052 = _2022;
    float _2054 = fma(_1548, (*spvDescriptorSet0.vp_c15)._m0[652].x, (*spvDescriptorSet0.vp_c15)._m0[652].z);
    float _2056 = _2052;
    if (_1944)
    {
        float _2058 = fma(_2006, _2000, _2046);
        _2026 = _2058;
    }
    float _2060 = _2026;
    if (!_1944)
    {
        _2028 = _1934;
    }
    float _2062 = _2028;
    float _2064 = _2062;
    if (_1944)
    {
        float _2066 = _2050 * _2050;
        _2016 = _2066;
    }
    float _2068 = _2016;
    if (_1944)
    {
        float _2070 = _1934 * _2038;
        _2064 = _2070;
    }
    float _2072 = _2064;
    float _2074 = floor(_2054);
    float _2076 = fma(_2060, _2060, _2068);
    if (_1944)
    {
        float _2078 = _2072 * _2072;
        _2056 = _2078;
    }
    float _2080 = _2056;
    float _2082 = _1776 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _2084 = _2076 + _2080;
    float _2086 = fma(_1778, (*spvDescriptorSet0.vp_c8)._m0[2].x, _2082);
    float _2088 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _2090 = fma(_1928, (*spvDescriptorSet0.vp_c15)._m0[23].w, _2088);
    float _2092 = precise::clamp(_2090, 0.0, 1.0);
    float _2094 = rsqrt(_2084);
    float _2096 = fma(_1780, (*spvDescriptorSet0.vp_c8)._m0[2].z, _2086);
    float _2098 = -_2092;
    float _2100 = _2098 + 1.0;
    float _2102 = _2096 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _2104 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _2106 = fma(_1540, (*spvDescriptorSet0.vp_c15)._m0[652].y, (*spvDescriptorSet0.vp_c15)._m0[652].w);
    float _2108 = abs(_2100);
    float _2110 = log2(_2108);
    float _2112 = _2102 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _2114 = _1776 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _2116 = _1776 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _2118 = -_2074;
    float _2120 = _2054 + _2118;
    float _2122 = -_2112;
    float _2124 = fma(_2122, _2104, 1.0);
    float _2126 = _1776 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _2128 = fma(_1778, (*spvDescriptorSet0.vp_c8)._m0[1].x, _2114);
    float _2130 = _2094 * _2050;
    float _2132 = _2094 * _2060;
    float _2134 = fma(_1778, (*spvDescriptorSet0.vp_c8)._m0[0].x, _2126);
    float _2136 = fma(_1780, (*spvDescriptorSet0.vp_c8)._m0[1].z, _2128);
    float _2138 = _2130 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _2140 = _2094 * _2072;
    float _2142 = fma(_1780, (*spvDescriptorSet0.vp_c8)._m0[0].z, _2134);
    float _2144 = _2136 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _2146 = -_2138;
    float _2148 = fma(_2132, (*spvDescriptorSet0.vp_c15)._m0[21].y, _2146);
    float _2150 = fma(_1778, (*spvDescriptorSet0.vp_c8)._m0[3].x, _2116);
    float _2152 = _2142 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _2154 = _2144 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _2156 = -_2140;
    float _2158 = fma(_2156, (*spvDescriptorSet0.vp_c15)._m0[21].z, _2148);
    float _2160 = fma(_1780, (*spvDescriptorSet0.vp_c8)._m0[3].z, _2150);
    float _2162 = _2110 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _2164 = fma(_2152, (*spvDescriptorSet0.vp_c8)._m0[7].x, _2154);
    float _2166 = floor(_2106);
    float _2168 = _2160 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _2170 = fma(_2158, -0.5, 0.5);
    float _2172 = fma(_2102, (*spvDescriptorSet0.vp_c8)._m0[7].z, _2164);
    float _2174 = _2144 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _2176 = fma(_2158, 0.5, 0.5);
    float _2178 = fma(_2168, (*spvDescriptorSet0.vp_c8)._m0[7].w, _2172);
    float _2180 = exp2(_2162);
    float _2182 = _2144 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _2184 = fma(_2152, (*spvDescriptorSet0.vp_c8)._m0[4].x, _2174);
    float _2186 = fma(_2152, (*spvDescriptorSet0.vp_c8)._m0[5].x, _2182);
    float _2188 = fma(_2102, (*spvDescriptorSet0.vp_c8)._m0[4].z, _2184);
    float _2190 = 1.0 / _2178;
    float _2192 = fma(_2102, (*spvDescriptorSet0.vp_c8)._m0[5].z, _2186);
    float _2194 = -_2166;
    float _2196 = _2106 + _2194;
    float _2198 = fma(_2176, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _2200 = fma(_2168, (*spvDescriptorSet0.vp_c8)._m0[4].w, _2188);
    float _2202 = fma(_2168, (*spvDescriptorSet0.vp_c8)._m0[5].w, _2192);
    float _2204 = fma(_2176, _2198, -0.212114393711090087890625);
    float _2206 = log2(_2124);
    float _2208 = sqrt(_2170);
    float _2210 = _2200 * _2190;
    float2 _6614 = float2(_2120, _2196);
    float _2212 = dm_bs(spvDescriptorSet0.vp_t_tcb_24.sample(spvDescriptorSet0.vp_t_tcb_24Smplr, select(_6614, float2(0.0), isnan(_6614)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_24, spvDescriptorSet0.vp_t_tcb_24Smplr_w, select(_6614, float2(0.0), isnan(_6614)), level(0.0)).x;
    float _2214 = fma(_2176, _2204, 1.570728778839111328125);
    float _2216 = _2206 * 0.693147182464599609375;
    float _2218 = _2132 + 1.0;
    float _2220 = _2216 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _2222 = -_2132;
    float _2224 = fma(_2180, _2218, _2222);
    float _2226 = _2202 * _2190;
    float _2228 = fma(_2210, 0.5, 0.5);
    float _2230 = _2208 * 0.636619746685028076171875;
    float _2232 = fma(_2224, 0.5, 0.5);
    float _2234 = fma(_2226, -0.5, 0.5);
    float _2236 = -_2214;
    float _2238 = fma(_2230, _2236, 1.0);
    float3 _6661 = float3(_2228, _2234, _2220);
    float _2240 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_6661, float3(0.0), isnan(_6661)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_6661, float3(0.0), isnan(_6661)), level(0.0)).x;
    float3 _6672 = float3(_2228, _2234, _2220);
    float4 _2243 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_6672, float3(0.0), isnan(_6672)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_6672, float3(0.0), isnan(_6672)), level(0.0)).xyzw;
    float _2245 = _2243.x;
    float _2247 = _2243.y;
    float _2249 = _2243.z;
    float _2251 = _2243.w;
    float2 _6688 = float2(_2238, _2232);
    float3 _2255 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_6688, float2(0.0), isnan(_6688)), level(0.0)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_6688, float2(0.0), isnan(_6688)), level(0.0)).xyz;
    float _2257 = _2255.x;
    float _2259 = _2255.y;
    float _2261 = _2255.z;
    float _2263 = in.m_57.w;
    float _2265 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].w;
    float _2267 = in.m_65.y;
    bool _2269 = _664 > 0.5;
    float _2271 = _2110 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    bool _2273 = _660 > 0.5;
    float _2275 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _2277 = _2275 + (*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _2279 = -(*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _2281 = _2279 + (*spvDescriptorSet0.vp_c9)._m0[133].w;
    out.m_67.x = _616;
    out.m_67.y = _630;
    out.m_67.z = _618;
    out.m_67.w = _634;
    float _2283 = 1.0 / _2277;
    int _2285 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _2287 = _2285 != 0;
    float _2289 = in.m_65.x;
    int _2291 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _2293 = _2291 != 0;
    int _2295 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _2297 = _2295 != 0;
    float _2299 = _2265 * (*spvDescriptorSet0.vp_c9)._m0[90].y;
    float _2301 = 1.0 / _2281;
    int _2303 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 16;
    bool _2305 = _2303 != 0;
    out.m_69.w = _1052;
    bool _2307 = _2263 > 0.5;
    float _2309 = -(*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _2311 = _658 + _2309;
    out.m_71.x = _1548;
    out.m_71.y = _1526;
    out.m_71.z = _1540;
    float _2313 = -_2267;
    float _2315 = _2313 + 1.0;
    bool _2317 = _658 >= (*spvDescriptorSet0.vp_c9)._m0[132].w;
    bool _2319 = isnan(_658);
    bool _2321 = _2317 || _2319;
    bool _2323 = isnan((*spvDescriptorSet0.vp_c9)._m0[132].w);
    bool _2325 = _2321 || _2323;
    float _2327 = float(_2325);
    float _2329 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].z;
    float _2331 = _1272 * _1326;
    out.m_73.x = _1216;
    int _2333 = _2269 ? as_type<int>(_2315) : as_type<int>(_2267);
    int _2335 = _2307 ? as_type<int>(_2315) : as_type<int>(_2267);
    float _2337 = fma(_1238, _1312, _2331);
    float _2339 = _2287 ? as_type<float>(_2333) : _2267;
    float _2341 = -(*spvDescriptorSet0.vp_c9)._m0[131].x;
    float _2343 = (*spvDescriptorSet0.vp_c9)._m0[132].x + _2341;
    int _2345 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 32;
    bool _2347 = _2345 != 0;
    float _2349 = -(*spvDescriptorSet0.vp_c9)._m0[132].x;
    float _2351 = _2349 + (*spvDescriptorSet0.vp_c9)._m0[133].x;
    int _2353 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _2355 = _2353 != 0;
    float _2357 = _2343 * _2283;
    bool _2359 = _658 >= (*spvDescriptorSet0.vp_c9)._m0[133].w;
    bool _2361 = isnan(_658);
    bool _2363 = _2359 || _2361;
    bool _2365 = isnan((*spvDescriptorSet0.vp_c9)._m0[133].w);
    bool _2367 = _2363 || _2365;
    float _2369 = float(_2367);
    float _2371 = _2351 * _2301;
    float _2373 = _2355 ? as_type<float>(_2335) : _2267;
    float _2375 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _2377 = _658 + _2375;
    bool _2379 = _2355;
    float _2381 = _2267;
    float _2383 = (*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _2385 = _2299;
    float _2387 = _2196;
    float _2389 = _2289;
    float _2391 = _2200;
    if (_2293)
    {
        bool _2393 = _692 > 0.5;
        _2379 = _2393;
    }
    bool _2395 = _2379;
    float _2397 = -_2369;
    float _2399 = _2397 + 1.0;
    float _2401 = in.m_75.x;
    float _2403 = in.m_75.y;
    float _2405 = in.m_75.z;
    float _2407 = fma(_2357, _2377, (*spvDescriptorSet0.vp_c9)._m0[131].x);
    bool _2409 = _658 >= (*spvDescriptorSet0.vp_c9)._m0[131].w;
    bool _2411 = isnan(_658);
    bool _2413 = _2409 || _2411;
    bool _2415 = isnan((*spvDescriptorSet0.vp_c9)._m0[131].w);
    bool _2417 = _2413 || _2415;
    float _2419 = float(_2417);
    float _2421 = _2327 * _2399;
    if (_2347)
    {
        float _2423 = _2273 ? _2315 : _2267;
        _2381 = _2423;
    }
    float _2425 = _2381;
    float _2427 = -_2327;
    float _2429 = _2427 + 1.0;
    bool _2431 = _1184 != 0.0;
    bool _2433 = isnan(_1184);
    bool _2435 = _2431 || _2433;
    bool _2437 = isnan(0.0);
    bool _2439 = _2435 || _2437;
    int _2441 = 0;
    if (_2297)
    {
        float _2443 = -_2289;
        float _2445 = _2443 + 1.0;
        _2441 = as_type<int>(_2445);
    }
    int _2447 = _2441;
    float _2449 = fma(_2371, _2311, (*spvDescriptorSet0.vp_c9)._m0[132].x);
    float _2451 = _2419 * _2429;
    bool _2453 = _1182 == 0.0;
    bool _2455 = !_2439;
    bool _2457 = _2453 && _2455;
    float _2459 = fma(_2299, _2425, -0.5);
    int _2461 = _2447;
    if (!_2297)
    {
        _2383 = _2289;
    }
    float _2463 = _2383;
    float _2465 = _2407 * _2451;
    bool _2467 = _1186 == 0.0;
    bool _2469 = _2467 && _2457;
    float _2471 = -_2419;
    float _2473 = _2471 + 1.0;
    float _2475 = _2463;
    float _2477 = _2465;
    float _2479 = _2473;
    if (_2297)
    {
        float _2481 = _2273 ? as_type<float>(_2447) : _2289;
        _2475 = _2481;
    }
    float _2483 = _2475;
    if (_2305)
    {
        float _2485 = -_2289;
        float _2487 = _2485 + 1.0;
        _2461 = as_type<int>(_2487);
    }
    int _2489 = _2461;
    if (!_2305)
    {
        _2385 = _2289;
    }
    float _2491 = _2385;
    float _2493 = in.m_77.x;
    float _2495 = in.m_77.y;
    float _2497 = in.m_77.z;
    float _2499 = in.m_77.w;
    int _2501 = 0;
    float _2503 = _2491;
    if (_2293)
    {
        float _2505 = -_2289;
        float _2507 = _2505 + 1.0;
        _2501 = as_type<int>(_2507);
    }
    int _2509 = _2501;
    float _2511 = as_type<float>(_2509);
    if (!_2293)
    {
        _2387 = _2289;
    }
    float _2513 = _2387;
    float _2515 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _2517 = _2513;
    if (_2305)
    {
        float _2519 = _2269 ? as_type<float>(_2489) : _2289;
        _2503 = _2519;
    }
    float _2521 = _2503;
    float _2523 = fma(_2473, (*spvDescriptorSet0.vp_c9)._m0[131].x, _2465);
    if (_2293)
    {
        float _2525 = _2395 ? as_type<float>(_2509) : _2289;
        _2517 = _2525;
    }
    float _2527 = _2517;
    float _2529 = -_966;
    float _2531 = fma(_962, _2459, _2529);
    if (_2469)
    {
        _2477 = _2403;
    }
    float _2533 = _2477;
    float _2535 = fma(_2449, _2421, _2523);
    float _2537 = _2533;
    if (_2469)
    {
        _2511 = _2401;
    }
    float _2539 = _2511;
    float _2541 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _2543 = _2539;
    if (_2469)
    {
        _2479 = _2533;
    }
    float _2545 = _2479;
    float _2547 = fma(_2369, (*spvDescriptorSet0.vp_c9)._m0[133].x, _2535);
    float _2549 = _2545;
    if (!_2469)
    {
        _2537 = _2403;
    }
    float _2551 = _2537;
    float _2553 = _2329 * (*spvDescriptorSet0.vp_c9)._m0[90].x;
    float _2555 = _2329;
    if (_2469)
    {
        _2389 = _2539;
    }
    float _2557 = _2389;
    float _2559 = _2547 * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    float _2561 = _2557;
    if (!_2469)
    {
        _2543 = _2401;
    }
    float _2563 = _2543;
    float _2565 = fma(_2553, _2521, -0.5);
    float _2567 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    float _2569 = 0.0;
    if (_2469)
    {
        _2569 = _2405;
    }
    float _2571 = _2569;
    float _2573 = _2339 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _2575 = fma(_972, _2565, _836);
    float _2577 = _2497 * _2563;
    float _2579 = _2571;
    if (_2469)
    {
        _2555 = _2571;
    }
    float _2581 = _2555;
    float _2583 = _2581;
    if (!_2469)
    {
        float _2585 = fma(_1184, (*spvDescriptorSet0.vp_c9)._m0[17].y, _2551);
        _2549 = _2585;
    }
    float _2587 = _2549;
    float _2589 = _2575 + 0.5;
    float _2591 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    if (!_2469)
    {
        _2579 = _2405;
    }
    float _2593 = _2579;
    float _2595 = _2373 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    float _2597 = _2527 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    if (!_2469)
    {
        float _2599 = fma(_1182, (*spvDescriptorSet0.vp_c9)._m0[17].y, _2563);
        _2561 = _2599;
    }
    float _2601 = _2561;
    float _2603 = _2493 * _2551;
    float _2605 = -_2577;
    float _2607 = fma(_2493, _2593, _2605);
    float _2609 = _2495 * _2593;
    float _2611 = abs(_1790);
    float _2613 = log2(_2611);
    float _2615 = _2595 * _2567;
    float _2617 = _2597 * _2515;
    if (!_2469)
    {
        float _2619 = fma(_1186, (*spvDescriptorSet0.vp_c9)._m0[17].y, _2593);
        _2583 = _2619;
    }
    float _2621 = _2583;
    float _2623 = -_2609;
    float _2625 = fma(_2497, _2551, _2623);
    float _2627 = _2483 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    float _2629 = -_2603;
    float _2631 = fma(_2495, _2563, _2629);
    float _2633 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _2635 = _2573 * _2541;
    float _2637 = _2627 * _2591;
    float _2639 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _2641 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _2643 = _2633 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2645 = _2613 * (*spvDescriptorSet0.vp_c15)._m0[654].z;
    out.m_79.x = _2617;
    out.m_79.y = _2635;
    out.m_79.z = _2637;
    out.m_79.w = _2615;
    float _2647 = _2639 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2649 = _2641 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2651 = _1250 * _1326;
    float _2653 = _1284 * _1326;
    float _2655 = exp2(_2645);
    float _2657 = _1272 * _1336;
    out.m_81.x = _2643;
    out.m_81.y = _2647;
    out.m_81.z = _2649;
    out.m_81.w = _2559;
    float _2659 = -_1248;
    float _2661 = fma(_2659, _1312, _2651);
    float _2663 = _2531 + 0.5;
    float _2665 = fma(_1238, _1308, _2657);
    float _2667 = fma(_1280, _1168, _2337);
    bool _2669 = _1790 <= 8000.0;
    bool _2671 = isnan(_1790);
    bool _2673 = _2669 || _2671;
    bool _2675 = isnan(8000.0);
    bool _2677 = _2673 || _2675;
    float _2679 = float(_2677);
    float _2681 = exp2(_2271);
    float _2683 = _1250 * _1332;
    float _2685 = _1250 * _1336;
    float _2687 = _1272 * _1332;
    float _2689 = _1284 * _1332;
    float _2691 = -_1248;
    float _2693 = fma(_2691, _1310, _2683);
    float _2695 = -_1248;
    float _2697 = fma(_2695, _1308, _2685);
    float _2699 = _1284 * _1336;
    float _2701 = fma(_1260, _1312, _2653);
    float _2703 = fma(_1232, _1138, _2693);
    float _2705 = fma(_1232, _1168, _2661);
    float _2707 = fma(_1260, _1308, _2699);
    float _2709 = fma(_1232, _1144, _2697);
    float _2711 = _2607 * _2499;
    float _2713 = fma(_1274, _1168, _2701);
    out.m_83.x = _2589;
    out.m_83.y = _2663;
    float _2715 = fma(_1238, _1310, _2687);
    float _2717 = fma(_1280, _1144, _2665);
    float _2719 = fma(_1274, _1144, _2707);
    float _2721 = _2703 * _2495;
    float _2723 = _2705 * _2495;
    float _2725 = _2709 * _2495;
    float _2727 = _2711 * _2703;
    float _2729 = _2711 * _2705;
    float _2731 = fma(_2655, (*spvDescriptorSet0.vp_c15)._m0[654].x, (*spvDescriptorSet0.vp_c15)._m0[654].y);
    float _2733 = precise::clamp(_2731, 0.0, 1.0);
    float _2735 = _2709 * _2587;
    float _2737 = _2711 * _2709;
    float _2739 = fma(_1280, _1138, _2715);
    float _2741 = _2703 * _2587;
    float _2743 = _2625 * _2499;
    float _2745 = _2705 * _2587;
    float _2747 = fma(_2733, -2.0, 3.0);
    float _2749 = _2733 * _2733;
    float _2751 = _2144 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _2753 = fma(_2739, _2601, _2741);
    float _2755 = fma(_2743, _2739, _2727);
    float _2757 = _2749 * _2747;
    float _2759 = fma(_2667, _2601, _2745);
    float _2761 = fma(_2667, _2493, _2723);
    float _2763 = fma(_2743, _2667, _2729);
    float _2765 = fma(_2152, (*spvDescriptorSet0.vp_c8)._m0[6].x, _2751);
    float _2767 = fma(_2743, _2717, _2737);
    float _2769 = -_2757;
    float _2771 = _2769 + 1.0;
    float _2773 = _2631 * _2499;
    float _2775 = fma(_2717, _2601, _2735);
    float _2777 = fma(_1260, _1310, _2689);
    float _2779 = fma(_2771, (*spvDescriptorSet0.vp_c15)._m0[654].w, _2757);
    float _2781 = fma(_2773, _2719, _2767);
    float _2783 = fma(_2739, _2493, _2721);
    float _2785 = in.m_85.x;
    float _2787 = fma(_1274, _1138, _2777);
    float _2789 = fma(_2717, _2493, _2725);
    float _2791 = _2679 * _2779;
    float _2793 = fma(_2773, _2713, _2763);
    float _2795 = fma(_2773, _2787, _2755);
    float _2797 = -_2681;
    float _2799 = _2797 + 1.0;
    float _2801 = _2791 * (*spvDescriptorSet0.vp_c15)._m0[653].x;
    float _2803 = fma(_2102, (*spvDescriptorSet0.vp_c8)._m0[6].z, _2765);
    float _2805 = _2178 * 0.5;
    out.m_87.x = _2795;
    out.m_87.y = _2793;
    out.m_87.z = _2781;
    float _2807 = _2200 + _2178;
    float _2809 = fma(_2168, (*spvDescriptorSet0.vp_c8)._m0[6].w, _2803);
    float _2811 = fma(_2787, _2497, _2783);
    float _2813 = fma(_2202, -0.5, _2805);
    float _2815 = fma(_2787, _2621, _2753);
    float _2817 = _2809 + _2178;
    float _2819 = fma(_2713, _2497, _2761);
    float _2821 = fma(_2713, _2621, _2759);
    float _2823 = fma(_2719, _2621, _2775);
    float _2825 = fma(_2719, _2497, _2789);
    float _2827 = _2799 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _2829 = _2817 * 0.5;
    float _2831 = _2807 * 0.5;
    out.m_89.x = _2811;
    out.m_89.y = _2819;
    out.m_89.z = _2825;
    bool _2833 = _1928 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _2835 = isnan(_1928);
    bool _2837 = _2833 || _2835;
    bool _2839 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _2841 = _2837 || _2839;
    out.m_91.x = _2831;
    out.m_91.y = _2813;
    out.m_91.z = _2829;
    out.m_91.w = _2178;
    out.m_93.x = _2815;
    out.m_93.y = _2821;
    out.m_93.z = _2823;
    out.m_95.x = _1778;
    out.m_95.y = _1776;
    out.m_95.z = _1780;
    float _2843 = _2789;
    float _2845 = _2781;
    float _2847 = (*spvDescriptorSet0.vp_c15)._m0[653].y;
    if (!_2841)
    {
        _2843 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _2849 = _2843;
    out.gl_Position.x = _2200;
    out.gl_Position.y = _2202;
    out.gl_Position.z = _2809;
    out.gl_Position.w = _2178;
    float _2851 = _2849;
    float _2853 = _2849;
    if (!_2841)
    {
        _2845 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _2855 = _2845;
    float _2857 = _2855;
    float _2859 = _2855;
    if (!_2841)
    {
        _2391 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _2861 = _2391;
    float _2863 = -_2212;
    float _2865 = _2863 + 1.0;
    float _2867 = _2865 * _2801;
    float _2869 = precise::clamp(_2867, 0.0, 1.0);
    float _2871 = -_2869;
    float _2873 = fma(_2871, (*spvDescriptorSet0.vp_c15)._m0[653].y, 1.0);
    float _2875 = _2785;
    float _2877 = _2861;
    float _2879 = _2861;
    if (!_2841)
    {
        _2847 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _2881 = _2847;
    float _2883 = _2873 * _2785;
    float _2885 = _2881;
    float _2887 = _2881;
    if (!_2841)
    {
        _2875 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _2889 = _2875;
    float _2891 = _2883 * (*spvDescriptorSet0.vp_c13)._m0[1].w;
    float _2893 = _2827 * _2240;
    float _2895 = -_2827;
    float _2897 = _2895 + 1.0;
    out.m_97.x = _2891;
    float _2899 = _2251 * _2893;
    float _2901 = _2261 * _2893;
    float _2903 = _2251 * _2897;
    float _2905 = _1846 * _1906;
    float _2907 = fma(_2257, _2899, _2245);
    float _2909 = fma(_2259, _2899, _2247);
    float _2911 = fma(_2251, _2901, _2249);
    float _2913 = _2905 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _2915 = _2905;
    float _2917 = _2889;
    float _2919 = _2889;
    if (!_2841)
    {
        _2915 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _2921 = _2915;
    out.m_99.x = _2907;
    out.m_99.y = _2909;
    out.m_99.z = _2911;
    out.m_99.w = _2903;
    bool _2923 = !_2841;
    float _2925 = _2921;
    float _2927 = _2921;
    if (!_2923)
    {
        bool _2929 = _1928 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _2931 = isnan(_1928);
        bool _2933 = _2929 || _2931;
        bool _2935 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _2937 = _2933 || _2935;
        if (!_2937)
        {
            float _2939 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2941 = _1928 + _2939;
            float _2943 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2945 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _2943;
            float _2947 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _2949 = _2947 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _2951 = 1.0 / _2945;
            float _2953 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _2955 = _2953 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _2957 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _2959 = _2957 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _2961 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _2963 = _2961 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _2965 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _2967 = _2965 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _2969 = _2941 * _2951;
            float _2971 = precise::clamp(_2969, 0.0, 1.0);
            float _2973 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _2975 = _2973 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _2977 = fma(_2971, _2949, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _2979 = fma(_2971, _2975, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _2981 = fma(_2971, _2955, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _2983 = fma(_2971, _2959, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _2985 = fma(_2971, _2963, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _2987 = fma(_2971, _2967, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            _2879 = _2981;
            _2887 = _2985;
            _2853 = _2977;
            _2859 = _2983;
            _2919 = _2979;
            _2927 = _2987;
            _2989 = true;
        }
        else
        {
            bool _2991 = _1928 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _2993 = isnan(_1928);
            bool _2995 = _2991 || _2993;
            bool _2997 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _2999 = _2995 || _2997;
            if (!_2999)
            {
                _2851 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _3001 = _2851;
            _2853 = _3001;
            if (!_2999)
            {
                _2877 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _3003 = _2877;
            _2879 = _3003;
            if (!_2999)
            {
                _2917 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _3005 = _2917;
            _2919 = _3005;
            if (!_2999)
            {
                _2857 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _3007 = _2857;
            _2859 = _3007;
            if (!_2999)
            {
                _2885 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _3009 = _2885;
            _2887 = _3009;
            if (!_2999)
            {
                _2925 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _3011 = _2925;
            bool _3013 = !_2999;
            _2927 = _3011;
            if (!_3013)
            {
                bool _3015 = _1928 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _3017 = isnan(_1928);
                bool _3019 = _3015 || _3017;
                bool _3021 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _3023 = _3019 || _3021;
                if (!_3023)
                {
                    float _3025 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _3027 = _1928 + _3025;
                    float _3029 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _3031 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _3029;
                    float _3033 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _3035 = _3033 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _3037 = 1.0 / _3031;
                    float _3039 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _3041 = _3039 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _3043 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _3045 = _3043 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _3047 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _3049 = _3047 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _3051 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _3053 = _3051 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _3055 = _3027 * _3037;
                    float _3057 = precise::clamp(_3055, 0.0, 1.0);
                    float _3059 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _3061 = _3059 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _3063 = fma(_3057, _3035, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _3065 = fma(_3057, _3061, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _3067 = fma(_3057, _3041, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _3069 = fma(_3057, _3045, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _3071 = fma(_3057, _3049, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _3073 = fma(_3057, _3053, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    _2879 = _3067;
                    _2887 = _3071;
                    _2853 = _3063;
                    _2859 = _3069;
                    _2919 = _3065;
                    _2927 = _3073;
                    _2989 = true;
                }
                else
                {
                    _2879 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _2887 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _2853 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _2859 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _2919 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _2927 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _2989 = false;
    float _3075 = _2879;
    float _3077 = _2887;
    float _3079 = _2853;
    float _3081 = _2859;
    float _3083 = _2919;
    float _3085 = _2927;
    float _3087 = fma(_2821, -0.5, 0.5);
    float _3089 = precise::clamp(_3087, 0.0, 1.0);
    float _3091 = -_3075;
    float _3093 = _3091 + _3077;
    float _3095 = _2913 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _3097 = -_3079;
    float _3099 = _3097 + _3081;
    float _3101 = fma(_3089, _3093, _3075);
    out.m_101.x = 0.0;
    float _3103 = -_3083;
    float _3105 = _3103 + _3085;
    float _3107 = fma(_3089, _3099, _3079);
    float _3109 = _3101 * 0.586610972881317138671875;
    out.m_49.x = _3095;
    bool _3111 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _3113 = fma(_3089, _3105, _3083);
    float _3115 = fma(_3107, 0.298911988735198974609375, _3109);
    bool _3117 = _1846 > 0.0;
    bool _3119 = isnan(_1846);
    bool _3121 = _3117 || _3119;
    bool _3123 = isnan(0.0);
    bool _3125 = _3121 || _3123;
    float _3127 = fma(_3113, 0.114477999508380889892578125, _3115);
    bool _3129 = _1906 <= 0.0;
    bool _3131 = !_3125;
    bool _3133 = _3129 || _3131;
    float _3135 = -_3127;
    float _3137 = _3107 + _3135;
    float _3139 = -_3127;
    float _3141 = _3101 + _3139;
    float _3143 = -_3127;
    float _3145 = _3113 + _3143;
    float _3147 = fma(_3137, (*spvDescriptorSet0.vp_c13)._m0[1].z, _3127);
    float _3149 = fma(_3141, (*spvDescriptorSet0.vp_c13)._m0[1].z, _3127);
    float _3151 = fma(_3145, (*spvDescriptorSet0.vp_c13)._m0[1].z, _3127);
    bool _3153 = !_3111;
    if (!_3153)
    {
        float _3155 = -_1776;
        float _3157 = _3155 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
        float _3159 = -_1778;
        float _3161 = _3159 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
        float _3163 = -_1780;
        float _3165 = _3163 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
        float _3167 = _3157 * _3157;
        float _3169 = fma(_3161, _3161, _3167);
        float _3171 = fma(_3165, _3165, _3169);
        float _3173 = sqrt(_3171);
        float _3175 = rsqrt(_3171);
        float _3177 = -_3173;
        float _3179 = _3177 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
        float _3181 = _3179 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
        float _3183 = precise::clamp(_3181, 0.0, 1.0);
        float _3185 = _3161 * _3175;
        float _3187 = _3157 * _3175;
        float _3189 = abs(_3183);
        float _3191 = log2(_3189);
        float _3193 = _3165 * _3175;
        float _3195 = _3185 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
        float _3197 = _2821 * _3187;
        float _3199 = -_3187;
        float _3201 = -_3195;
        float _3203 = fma(_3199, (*spvDescriptorSet0.vp_c15)._m0[656].y, _3201);
        float _3205 = fma(_2815, _3185, _3197);
        float _3207 = -_3193;
        float _3209 = fma(_3207, (*spvDescriptorSet0.vp_c15)._m0[656].z, _3203);
        float _3211 = fma(_2823, _3193, _3205);
        float _3213 = precise::clamp(_3211, 0.0, 1.0);
        float _3215 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
        float _3217 = _3209 + _3215;
        float _3219 = _3191 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
        float _3221 = _3217 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
        float _3223 = precise::clamp(_3221, 0.0, 1.0);
        float _3225 = exp2(_3219);
        float _3227 = _3225 * _3223;
        float _3229 = _3213 * _3227;
        float _3231 = _3229 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
        float _3233 = _3229 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
        float _3235 = _3229 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
        out.m_101.x = _3231;
        out.m_101.y = _3233;
        out.m_101.z = _3235;
    }
    out.m_69.x = _3147;
    out.m_69.y = _3149;
    out.m_69.z = _3151;
    if (!_3133)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    out.m_49.x = 0.0;
    float _3237 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _3237;
    out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
}


vertex main0_out main0_z(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]])
{
    main0_out out = {};
    out.m_67 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_81 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_101 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_97 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_99 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_69 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_53 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_73 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_79 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_83 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_71 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_91 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_49 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_87 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_93 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_95 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_89 = float4(0.0, 0.0, 0.0, 1.0);
    bool _2989 = false;
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
        float _3292 = as_type<float>(_134);
        out.gl_Position.z = _3292;
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
        float _3364 = as_type<float>(_174);
        out.gl_Position.z = _3364;
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
    float _834 = -_144;
    float _836 = fma(_834, (*spvDescriptorSet0.vp_c9)._m0[86].x, _772);
    float _838 = -_788;
    float _840 = _838 + (*spvDescriptorSet0.vp_c8)._m0[29].y;
    int _842 = ~_830;
    int _844 = _842 + 1;
    int _846 = _844 + 1;
    float _848 = fma((*spvDescriptorSet0.vp_c8)._m0[0].z, (*spvDescriptorSet0.vp_c10)._m0[10].w, _698);
    int _850 = _846;
    if (!_774)
    {
        int _852 = ~_830;
        int _854 = _852 + 1;
        _850 = _854;
    }
    int _856 = _850;
    float _858 = fma(_832, -2.0, _824);
    float _860 = _692 * 2.0;
    float _862 = fma(_776, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    bool _864 = !_680;
    int _866 = _864 ? 0 : 1;
    float _868 = _664 + _692;
    bool _870 = !_688;
    int _872 = _870 ? 0 : 1;
    float _874 = floor(_860);
    int _876 = abs(_866);
    float _878 = _868 + (-1.0);
    int _880 = abs(_872);
    float _882 = _828 * _144;
    float _884 = _848 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _886 = exp2(_882);
    float _888 = fma(_878, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    float _890 = float(_876);
    float _892 = float(_880);
    float _894 = float(_856);
    float _896 = float(_822);
    float _898 = _892 * _894;
    bool _900 = _874 > 0.0;
    float _902 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _904 = 1.0 + _902;
    bool _906 = _874 >= 0.0;
    bool _908 = isnan(_874);
    bool _910 = _906 || _908;
    bool _912 = isnan(0.0);
    bool _914 = _910 || _912;
    float _916 = _890 * _896;
    float _918 = in.m_61.x;
    float _920 = in.m_61.y;
    float _922 = in.m_61.z;
    bool _924 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _926 = isnan(1.0);
    bool _928 = _924 || _926;
    bool _930 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _932 = _928 || _930;
    float _934 = 1.0 / _904;
    float _936 = -_886;
    float _938 = _936 + 1.0;
    float _940 = (*spvDescriptorSet0.vp_c9)._m0[88].w + (*spvDescriptorSet0.vp_c9)._m0[88].y;
    float _942 = _898 * (-2.0);
    bool _944 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _946 = isnan(0.0);
    bool _948 = _944 || _946;
    bool _950 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _952 = _948 || _950;
    float _954 = fma(_664, (*spvDescriptorSet0.vp_c9)._m0[88].w, _940);
    float _956 = (*spvDescriptorSet0.vp_c9)._m0[88].z + (*spvDescriptorSet0.vp_c9)._m0[88].x;
    float _958 = _952 ? _938 : 0.0;
    float _960 = _746 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _962 = fma(_144, (*spvDescriptorSet0.vp_c9)._m0[87].w, _954);
    float _964 = fma(_692, (*spvDescriptorSet0.vp_c9)._m0[88].z, _956);
    float _966 = fma(_144, (*spvDescriptorSet0.vp_c9)._m0[86].y, _858);
    float _968 = fma(_808, _808, _816);
    float _970 = _916 * (-2.0);
    float _972 = fma(_144, (*spvDescriptorSet0.vp_c9)._m0[87].z, _964);
    if (_932)
    {
        float _974 = _958 * _934;
        _166 = _974;
    }
    float _976 = _166;
    float _978 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _980 = _960 + _978;
    int _982 = _914 ? 0 : 1;
    float _984 = fma(_888, _970, _888);
    float _986 = _840 * _840;
    float _988 = fma(_980, _980, _968);
    float _990 = _692 + (-0.5);
    float _992 = fma(_970, _918, _918);
    bool _994 = !_684;
    int _996 = _994 ? 0 : 1;
    float _998 = sqrt(_988);
    int _1000 = ~_982;
    int _1002 = _1000 + 1;
    int _1004 = _1002 + 1;
    float _1006 = fma(_990, (*spvDescriptorSet0.vp_c9)._m0[196].x, _992);
    int _1008 = _1004;
    if (!_900)
    {
        int _1010 = ~_982;
        int _1012 = _1010 + 1;
        _1008 = _1012;
    }
    int _1014 = _1008;
    float _1016 = -_794;
    float _1018 = _1016 + (*spvDescriptorSet0.vp_c8)._m0[29].x;
    int _1020 = abs(_996);
    float _1022 = _660 + (-0.5);
    float _1024 = float(_1014);
    float _1026 = rsqrt(_988);
    float _1028 = float(_1020);
    float _1030 = -_960;
    float _1032 = _1030 + (*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1034 = fma(_1018, _1018, _986);
    float _1036 = fma(_984, _976, _1006);
    float _1038 = _1028 * _1024;
    float _1040 = _788 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1042 = _998 * (*spvDescriptorSet0.vp_c13)._m0[2].x;
    float _1044 = fma(_942, _922, _922);
    float _1046 = fma(_1032, _1032, _1034);
    float _1048 = _1038 * (-2.0);
    float _1050 = fma(_862, _942, _862);
    float _1052 = precise::min(_670, _1042);
    float _1054 = fma(_1022, (*spvDescriptorSet0.vp_c9)._m0[196].z, _1044);
    float _1056 = fma(_794, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1040);
    float _1058 = rsqrt(_1046);
    float _1060 = _1036 * 0.15915493667125701904296875;
    float _1062 = _1026 * _1052;
    float _1064 = fma(_1048, _920, _920);
    float _1066 = fma(_960, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1056);
    float _1068 = _664 + (-0.5);
    float _1070 = _804 * _1062;
    float _1072 = _808 * _1062;
    float _1074 = sqrt(_1046);
    float _1076 = fma(_1050, _976, _1054);
    float _1078 = -_1070;
    float _1080 = _804 + _1078;
    float _1082 = -_1072;
    float _1084 = _808 + _1082;
    float _1086 = fma(_1068, (*spvDescriptorSet0.vp_c9)._m0[196].y, _1064);
    float _1088 = _1076 * 0.15915493667125701904296875;
    float _1090 = _1080 * _1080;
    float _1092 = 1.0 / _702;
    float _1094 = fma(_766, _1048, _766);
    float _1096 = _980 * _1062;
    float _1098 = fma(_1084, _1084, _1090);
    float _1100 = _1066 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1102 = fma(_1094, _976, _1086);
    float _1104 = -_1096;
    float _1106 = _980 + _1104;
    float _1108 = -_1100;
    float _1110 = _884 + _1108;
    bool _1112 = _1100 >= _884;
    bool _1114 = isnan(_1100);
    bool _1116 = _1112 || _1114;
    bool _1118 = isnan(_884);
    bool _1120 = _1116 || _1118;
    float _1122 = fma(_1106, _1106, _1098);
    float _1124 = _1102 * 0.15915493667125701904296875;
    float _1126 = (*spvDescriptorSet0.vp_c8)._m0[28].y * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _1128 = abs(_1110);
    float _1130 = precise::max(_1128, (*spvDescriptorSet0.vp_c9)._m0[194].y);
    float _1132 = sqrt(_1122);
    float _1134 = abs(_1074);
    float _1136 = precise::max(0.0, _1134);
    float _1138 = _1018 * _1058;
    float _1140 = precise::min(_1130, (*spvDescriptorSet0.vp_c9)._m0[194].z);
    float _1142 = fma((*spvDescriptorSet0.vp_c8)._m0[28].x, (*spvDescriptorSet0.vp_c8)._m0[28].x, _1126);
    float _1144 = _1032 * _1058;
    float _1146 = precise::min(_1136, 40.0);
    float _1148 = _1060 * 6.283185482025146484375;
    float _1150 = sin(_1148);
    float _1152 = -(*spvDescriptorSet0.vp_c9)._m0[194].y;
    float _1154 = _1140 + _1152;
    bool _1156 = !_1120;
    float _1158 = _1156 ? 1.0 : (-1.0);
    float _1160 = -(*spvDescriptorSet0.vp_c8)._m0[1].z;
    float _1162 = _1138 * _1160;
    float _1164 = fma((*spvDescriptorSet0.vp_c8)._m0[28].z, (*spvDescriptorSet0.vp_c8)._m0[28].z, _1142);
    float _1166 = _1154 * _1092;
    float _1168 = _840 * _1058;
    float _1170 = fma(_1146, -0.02500000037252902984619140625, 1.0);
    float _1172 = _1060 * 6.283185482025146484375;
    float _1174 = cos(_1172);
    float _1176 = _1026 * _1132;
    float _1178 = -(*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1180 = _1144 * _1178;
    float _1182 = in.m_63.x;
    float _1184 = in.m_63.y;
    float _1186 = in.m_63.z;
    float _1188 = -(*spvDescriptorSet0.vp_c8)._m0[1].x;
    float _1190 = -_1162;
    float _1192 = fma(_1144, _1188, _1190);
    float _1194 = _1158 * _1166;
    float _1196 = _156 * (*spvDescriptorSet0.vp_c9)._m0[194].w;
    float _1198 = -(*spvDescriptorSet0.vp_c8)._m0[1].x;
    float _1200 = _1168 * _1198;
    float _1202 = _1088 * 6.283185482025146484375;
    float _1204 = cos(_1202);
    float _1206 = -(*spvDescriptorSet0.vp_c8)._m0[1].z;
    float _1208 = -_1180;
    float _1210 = fma(_1168, _1206, _1208);
    float _1212 = _1192 * _1192;
    float _1214 = _1196 * _1194;
    float _1216 = _662 * _1176;
    float _1218 = _696 * _1176;
    float _1220 = fma(_1210, _1210, _1212);
    float _1222 = _1214 * 0.15915493667125701904296875;
    float _1224 = _1124 * 6.283185482025146484375;
    float _1226 = cos(_1224);
    float _1228 = _1124 * 6.283185482025146484375;
    float _1230 = sin(_1228);
    float _1232 = _1150 * _1204;
    float _1234 = _1174 * _1226;
    float _1236 = _1150 * _1226;
    float _1238 = _1226 * _1204;
    float _1240 = -(*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1242 = -_1200;
    float _1244 = fma(_1138, _1240, _1242);
    float _1246 = _1088 * 6.283185482025146484375;
    float _1248 = sin(_1246);
    float _1250 = _1174 * _1204;
    float _1252 = fma(_1244, _1244, _1220);
    float _1254 = _1150 * _1230;
    float _1256 = _1174 * _1230;
    float _1258 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _1184);
    float _1260 = _1230 * _1204;
    float _1262 = rsqrt(_1164);
    float _1264 = _690 * _1176;
    float _1266 = _1264 * _1258;
    float _1268 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _1186);
    float _1270 = rsqrt(_1252);
    float _1272 = fma(_1248, _1234, _1254);
    float _1274 = fma(_1248, _1254, _1234);
    float _1276 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _1182);
    float _1278 = -_1256;
    float _1280 = fma(_1248, _1236, _1278);
    float _1282 = -_1236;
    float _1284 = fma(_1248, _1256, _1282);
    float _1286 = -_1266;
    float _1288 = _1248 * _1286;
    float _1290 = _1216 * _1276;
    float _1292 = _1250 * _1266;
    float _1294 = _1232 * _1266;
    float _1296 = _1218 * _1268;
    float _1298 = fma(_1238, _1290, _1288);
    float _1300 = fma(_1272, _1290, _1292);
    float _1302 = fma(_1280, _1290, _1294);
    float _1304 = _1262 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _1306 = fma(_1260, _1296, _1298);
    float _1308 = _1244 * _1270;
    float _1310 = _1210 * _1270;
    float _1312 = _1192 * _1270;
    float _1314 = fma(_1284, _1296, _1300);
    float _1316 = _1138 * _1308;
    float _1318 = fma(_1274, _1296, _1302);
    float _1320 = _1144 * _1312;
    float _1322 = _1168 * _1310;
    float _1324 = -_1316;
    float _1326 = fma(_1144, _1310, _1324);
    float _1328 = _1262 * (*spvDescriptorSet0.vp_c8)._m0[28].x;
    float _1330 = -_1320;
    float _1332 = fma(_1168, _1308, _1330);
    float _1334 = -_1322;
    float _1336 = fma(_1138, _1312, _1334);
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
    float _1358 = fma(_1138, _1318, _1350);
    float _1360 = _788 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1362 = _788 + _1354;
    float _1364 = fma(_1144, _1318, _1352);
    float _1366 = _794 + _1358;
    float _1368 = fma(_1348, _1348, _1356);
    float _1370 = _1362 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1372 = _1362 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1374 = _1362 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1376 = fma(_794, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1360);
    float _1378 = fma(_1366, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1370);
    float _1380 = fma(_1366, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1372);
    float _1382 = _960 + _1364;
    float _1384 = fma(_1366, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1374);
    float _1386 = rsqrt(_1368);
    float _1388 = fma(_960, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1376);
    float _1390 = fma(_1382, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1380);
    float _1392 = fma(_1382, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1384);
    float _1394 = fma(_1382, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1378);
    float _1396 = _1388 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1398 = _1390 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1400 = _1392 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1402 = _1222 * 6.283185482025146484375;
    float _1404 = cos(_1402);
    float _1406 = _1394 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1408 = -_1398;
    float _1410 = _1408 + _1396;
    float _1412 = _1400 * (*spvDescriptorSet0.vp_c8)._m0[12].y;
    float _1414 = _1400 * (*spvDescriptorSet0.vp_c8)._m0[13].y;
    float _1416 = _1400 * (*spvDescriptorSet0.vp_c8)._m0[14].y;
    float _1418 = fma(_1170, _1410, _1398);
    float _1420 = fma(_1406, (*spvDescriptorSet0.vp_c8)._m0[12].x, _1412);
    float _1422 = _1222 * 6.283185482025146484375;
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
    float _1486 = _1476 * _1466;
    float _1488 = fma(_1444, _1456, _1404);
    float _1490 = fma(_1472, _1480, _1482);
    float _1492 = -_960;
    float _1494 = _1492 + _1484;
    float _1496 = fma(_1430, _1456, _1460);
    float _1498 = fma(_1488, _1480, _1486);
    float _1500 = fma(_1446, _1454, _1404);
    float _1502 = fma(_1450, _1494, _1490);
    float _1504 = fma(_1446, _1456, _1462);
    float _1506 = fma(_1496, _1494, _1498);
    float _1508 = _1500 * _1466;
    float _1510 = fma(_1502, _710, _960);
    float _1512 = -_1458;
    float _1514 = fma(_1430, _1454, _1512);
    float _1516 = fma(_1506, _710, _794);
    float _1518 = fma(_1504, _1480, _1508);
    float _1520 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1522 = _1510 + _1520;
    float _1524 = -_1070;
    float _1526 = _788 + _1524;
    float _1528 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1530 = _1516 + _1528;
    float _1532 = fma(_1514, _1494, _1518);
    float _1534 = _1522 * _1522;
    float _1536 = _1526 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _1538 = -_1096;
    float _1540 = _960 + _1538;
    float _1542 = _788 + _1532;
    float _1544 = fma(_1530, _1530, _1534);
    float _1546 = -_1072;
    float _1548 = _794 + _1546;
    float _1550 = sqrt(_1544);
    float _1552 = fma(_1548, (*spvDescriptorSet0.vp_c8)._m0[11].x, _1536);
    float _1554 = fma(_1540, (*spvDescriptorSet0.vp_c8)._m0[11].z, _1552);
    bool _1556 = _1550 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1558 = _1446;
    float _1560 = _1518;
    float _1562 = _1510;
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
        _1560 = _1542;
    }
    float _1572 = _1560;
    bool _1574 = !_1556;
    float _1576 = _1572;
    if (!_1574)
    {
        float _1578 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1580 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1582 = _1550 + _1580;
        float _1584 = _1542 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1586 = rsqrt(_1544);
        float _1588 = _1582 * _1578;
        float _1590 = _1588 * 0.15915493667125701904296875;
        float _1592 = _1590 * 6.283185482025146484375;
        float _1594 = cos(_1592);
        float _1596 = _1590 * 6.283185482025146484375;
        float _1598 = sin(_1596);
        float _1600 = _1594 + (-1.0);
        float _1602 = _1600 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1604 = fma(_1598, _1584, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1606 = fma(_1542, _1594, _1602);
        float _1608 = _1586 * _1604;
        float _1610 = fma(_1530, _1608, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1612 = fma(_1522, _1608, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _1576 = _1606;
        _1570 = _1610;
        _1562 = _1612;
    }
    float _1614 = _1576;
    float _1616 = _1570;
    float _1618 = _1562;
    float _1620 = -_788;
    float _1622 = _1620 + _1614;
    float _1624 = -_794;
    float _1626 = _1624 + _1616;
    float _1628 = _1554 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _1630 = _1526 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _1632 = _1622 * _1622;
    float _1634 = -_960;
    float _1636 = _1634 + _1618;
    float _1638 = 1.0 / _1628;
    float _1640 = fma(_1548, (*spvDescriptorSet0.vp_c8)._m0[10].x, _1630);
    float _1642 = fma(_1626, _1626, _1632);
    float _1644 = -_1070;
    float _1646 = _1644 + _1614;
    float _1648 = fma(_1540, (*spvDescriptorSet0.vp_c8)._m0[10].z, _1640);
    float _1650 = fma(_1636, _1636, _1642);
    bool _1652 = (*spvDescriptorSet0.vp_c15)._m0[653].w >= 0.5;
    bool _1654 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _1656 = _1652 || _1654;
    bool _1658 = isnan(0.5);
    bool _1660 = _1656 || _1658;
    float _1662 = -_1096;
    float _1664 = _1662 + _1618;
    float _1666 = _1648 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _1668 = sqrt(_1650);
    float _1670 = _1666 + _1628;
    float _1672 = _1670 * _1638;
    float _1674 = _1672 * 0.5;
    float _1676 = -_1072;
    float _1678 = _1676 + _1616;
    float _1680 = _1618;
    float _1682 = _1614;
    float _1684 = _1616;
    float _1686 = (*spvDescriptorSet0.vp_c8)._m0[30].w;
    float _1688 = _1678;
    float _1690 = _1664;
    if (_1660)
    {
        _1564 = 1.0;
    }
    float _1692 = _1564;
    float _1694 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _1696 = fma(_1674, (*spvDescriptorSet0.vp_c8)._m0[30].w, _1694);
    float _1698 = 1.0 / _1696;
    bool _1700 = _1668 > 0.0;
    float _1702 = _1692;
    if (!_1700)
    {
        _1680 = _1678;
    }
    float _1704 = _1680;
    float _1706 = _1704;
    if (!_1700)
    {
        _1682 = _1646;
    }
    float _1708 = _1682;
    float _1710 = _1708;
    if (!_1700)
    {
        _1684 = _1664;
    }
    float _1712 = _1684;
    bool _1714 = !_1700;
    float _1716 = _1712;
    float _1718 = _1712;
    if (!_1714)
    {
        float _1720 = _198 * _198;
        float _1722 = fma(_196, _196, _1720);
        float _1724 = rsqrt(_1650);
        float _1726 = fma(_200, _200, _1722);
        float _1728 = sqrt(_1726);
        float _1730 = _1626 * _1724;
        float _1732 = _1622 * _1724;
        float _1734 = _1636 * _1724;
        bool _1736 = _1728 > 0.0;
        float _1738 = _1724;
        float _1740 = _1728;
        _1686 = _1732;
        if (!_1736)
        {
            _1738 = _1678;
        }
        float _1742 = _1738;
        _1706 = _1742;
        if (!_1736)
        {
            _1740 = _1646;
        }
        float _1744 = _1740;
        _1710 = _1744;
        if (!_1736)
        {
            _1716 = _1664;
        }
        float _1746 = _1716;
        bool _1748 = !_1736;
        _1718 = _1746;
        if (!_1748)
        {
            float _1750 = rsqrt(_1726);
            float _1752 = 1.0 / (*spvDescriptorSet0.vp_c10)._m0[2].z;
            float _1754 = _198 * _1750;
            float _1756 = _196 * _1750;
            float _1758 = _1732 * _1754;
            float _1760 = _200 * _1750;
            float _1762 = fma(_1730, _1756, _1758);
            float _1764 = _1752 * (*spvDescriptorSet0.vp_c9)._m0[142].x;
            float _1766 = fma(_1734, _1760, _1762);
            float _1768 = _1766 * _1764;
            float _1770 = fma(_196, _1768, _1678);
            float _1772 = fma(_198, _1768, _1646);
            float _1774 = fma(_200, _1768, _1664);
            _1710 = _1772;
            _1706 = _1770;
            _1718 = _1774;
        }
    }
    float _1776 = _1710;
    float _1778 = _1706;
    float _1780 = _1718;
    float _1782 = _1686;
    float _1784 = _1782;
    if (_1660)
    {
        _1784 = 1.0;
    }
    float _1786 = _1784;
    float _1788 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _1790 = _1698 * _1788;
    float _1792 = _1786;
    if (!_1660)
    {
        float _1794 = (*spvDescriptorSet0.vp_c8)._m0[31].x * 0.5;
        float _1796 = _1794 * 0.15915493667125701904296875;
        float _1798 = _1796 * 6.283185482025146484375;
        float _1800 = cos(_1798);
        float _1802 = (*spvDescriptorSet0.vp_c8)._m0[31].y * 0.5;
        float _1804 = _1802 * 0.15915493667125701904296875;
        float _1806 = _1796 * 6.283185482025146484375;
        float _1808 = sin(_1806);
        float _1810 = 1.0 / _1800;
        float _1812 = _1804 * 6.283185482025146484375;
        float _1814 = cos(_1812);
        float _1816 = _1808 * _1810;
        float _1818 = _1804 * 6.283185482025146484375;
        float _1820 = sin(_1818);
        float _1822 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1824 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _1822;
        float _1826 = _1814 * _1816;
        float _1828 = 1.0 / _1824;
        float _1830 = 1.0 / _1826;
        float _1832 = _1820 * _1830;
        float _1834 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1836 = fma(_1790, _1832, _1834);
        float _1838 = _1836 * _1828;
        float _1840 = precise::clamp(_1838, 0.0, 1.0);
        _1688 = _1816;
        _1690 = _1796;
        _1702 = _1840;
    }
    float _1842 = _1688;
    float _1844 = _1690;
    float _1846 = _1702;
    float _1848 = _1842;
    float _1850 = _1844;
    if (!_1660)
    {
        float _1852 = (*spvDescriptorSet0.vp_c8)._m0[31].x * 0.5;
        float _1854 = _1852 * 0.15915493667125701904296875;
        float _1856 = _1854 * 6.283185482025146484375;
        float _1858 = cos(_1856);
        float _1860 = (*spvDescriptorSet0.vp_c8)._m0[31].y * 0.5;
        float _1862 = _1860 * 0.15915493667125701904296875;
        float _1864 = _1854 * 6.283185482025146484375;
        float _1866 = sin(_1864);
        float _1868 = 1.0 / _1858;
        float _1870 = _1862 * 6.283185482025146484375;
        float _1872 = cos(_1870);
        float _1874 = _1866 * _1868;
        float _1876 = _1862 * 6.283185482025146484375;
        float _1878 = sin(_1876);
        float _1880 = _1872 * _1874;
        float _1882 = 1.0 / _1880;
        float _1884 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _1886 = (*spvDescriptorSet0.vp_c9)._m0[140].w + _1884;
        float _1888 = 1.0 / _1886;
        float _1890 = _1878 * _1882;
        float _1892 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _1894 = fma(_1790, _1890, _1892);
        float _1896 = _1894 * _1888;
        float _1898 = precise::clamp(_1896, 0.0, 1.0);
        float _1900 = -_1898;
        float _1902 = _1900 + 1.0;
        _1848 = _1868;
        _1792 = _1902;
    }
    float _1904 = _1848;
    float _1906 = _1792;
    float _1908 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1910 = _1776 + _1908;
    float _1912 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1914 = _1778 + _1912;
    float _1916 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1918 = _1780 + _1916;
    float _1920 = _1910 * _1910;
    float _1922 = fma(_1914, _1914, _1920);
    float _1924 = fma(_1918, _1918, _1922);
    float _1926 = rsqrt(_1924);
    float _1928 = sqrt(_1924);
    float _1930 = _1926 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1932 = _1914 * _1930;
    float _1934 = _1918 * _1930;
    float _1936 = _1932 * _1932;
    float _1938 = _1934 * _1934;
    float _1940 = _1936 + _1938;
    float _1942 = sqrt(_1940);
    bool _1944 = _1942 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1946 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1948 = _1942 + _1946;
    float _1950 = _1918;
    float _1952 = _1920;
    float _1954 = _1948;
    float _1956 = _1910;
    float _1958 = _1904;
    if (_1944)
    {
        float _1960 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1950 = _1960;
    }
    float _1962 = _1950;
    if (_1944)
    {
        float _1964 = rsqrt(_1940);
        _1952 = _1964;
    }
    float _1966 = _1952;
    float _1968 = _1966;
    if (_1944)
    {
        float _1970 = _1948 * _1962;
        _1954 = _1970;
    }
    float _1972 = _1954;
    if (_1944)
    {
        float _1974 = _1972 * 0.15915493667125701904296875;
        _1850 = _1974;
    }
    float _1976 = _1850;
    float _1978 = _1926;
    float _1980 = _1976;
    if (_1944)
    {
        float _1982 = _1976 * 6.283185482025146484375;
        float _1984 = sin(_1982);
        _1978 = _1984;
    }
    float _1986 = _1978;
    float _1988 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _1990 = precise::max(0.0, _1988);
    float _1992 = _1962;
    float _1994 = _1990;
    if (_1944)
    {
        float _1996 = _1976 * 6.283185482025146484375;
        float _1998 = cos(_1996);
        _1992 = _1998;
    }
    float _2000 = _1992;
    float _2002 = -_1930;
    float _2004 = -_1990;
    float _2006 = fma(_1910, _2002, _2004);
    if (_1944)
    {
        float _2008 = _2006 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1956 = _2008;
    }
    float _2010 = _1956;
    if (!_1944)
    {
        _1980 = _1936;
    }
    float _2012 = _1980;
    float _2014 = _1986;
    float _2016 = _2012;
    if (_1944)
    {
        float _2018 = fma(_1986, _2010, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1958 = _2018;
    }
    float _2020 = _1958;
    float _2022 = _2020;
    if (!_1944)
    {
        _2014 = _2006;
    }
    float _2024 = _2014;
    float _2026 = _2024;
    float _2028 = _2000;
    if (_1944)
    {
        float _2030 = _2000 + (-1.0);
        _1994 = _2030;
    }
    float _2032 = _1994;
    float _2034 = _2032;
    if (_1944)
    {
        float _2036 = _1966 * _2020;
        _1566 = _2036;
    }
    float _2038 = _1566;
    if (!_1944)
    {
        _1968 = _1932;
    }
    float _2040 = _1968;
    float _2042 = _2040;
    if (_1944)
    {
        float _2044 = _2032 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2034 = _2044;
    }
    float _2046 = _2034;
    if (_1944)
    {
        float _2048 = _1932 * _2038;
        _2042 = _2048;
    }
    float _2050 = _2042;
    if (!_1944)
    {
        _2022 = _1938;
    }
    float _2052 = _2022;
    float _2054 = fma(_1548, (*spvDescriptorSet0.vp_c15)._m0[652].x, (*spvDescriptorSet0.vp_c15)._m0[652].z);
    float _2056 = _2052;
    if (_1944)
    {
        float _2058 = fma(_2006, _2000, _2046);
        _2026 = _2058;
    }
    float _2060 = _2026;
    if (!_1944)
    {
        _2028 = _1934;
    }
    float _2062 = _2028;
    float _2064 = _2062;
    if (_1944)
    {
        float _2066 = _2050 * _2050;
        _2016 = _2066;
    }
    float _2068 = _2016;
    if (_1944)
    {
        float _2070 = _1934 * _2038;
        _2064 = _2070;
    }
    float _2072 = _2064;
    float _2074 = floor(_2054);
    float _2076 = fma(_2060, _2060, _2068);
    if (_1944)
    {
        float _2078 = _2072 * _2072;
        _2056 = _2078;
    }
    float _2080 = _2056;
    float _2082 = _1776 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _2084 = _2076 + _2080;
    float _2086 = fma(_1778, (*spvDescriptorSet0.vp_c8)._m0[2].x, _2082);
    float _2088 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _2090 = fma(_1928, (*spvDescriptorSet0.vp_c15)._m0[23].w, _2088);
    float _2092 = precise::clamp(_2090, 0.0, 1.0);
    float _2094 = rsqrt(_2084);
    float _2096 = fma(_1780, (*spvDescriptorSet0.vp_c8)._m0[2].z, _2086);
    float _2098 = -_2092;
    float _2100 = _2098 + 1.0;
    float _2102 = _2096 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _2104 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _2106 = fma(_1540, (*spvDescriptorSet0.vp_c15)._m0[652].y, (*spvDescriptorSet0.vp_c15)._m0[652].w);
    float _2108 = abs(_2100);
    float _2110 = log2(_2108);
    float _2112 = _2102 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _2114 = _1776 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _2116 = _1776 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _2118 = -_2074;
    float _2120 = _2054 + _2118;
    float _2122 = -_2112;
    float _2124 = fma(_2122, _2104, 1.0);
    float _2126 = _1776 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _2128 = fma(_1778, (*spvDescriptorSet0.vp_c8)._m0[1].x, _2114);
    float _2130 = _2094 * _2050;
    float _2132 = _2094 * _2060;
    float _2134 = fma(_1778, (*spvDescriptorSet0.vp_c8)._m0[0].x, _2126);
    float _2136 = fma(_1780, (*spvDescriptorSet0.vp_c8)._m0[1].z, _2128);
    float _2138 = _2130 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _2140 = _2094 * _2072;
    float _2142 = fma(_1780, (*spvDescriptorSet0.vp_c8)._m0[0].z, _2134);
    float _2144 = _2136 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _2146 = -_2138;
    float _2148 = fma(_2132, (*spvDescriptorSet0.vp_c15)._m0[21].y, _2146);
    float _2150 = fma(_1778, (*spvDescriptorSet0.vp_c8)._m0[3].x, _2116);
    float _2152 = _2142 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _2154 = _2144 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _2156 = -_2140;
    float _2158 = fma(_2156, (*spvDescriptorSet0.vp_c15)._m0[21].z, _2148);
    float _2160 = fma(_1780, (*spvDescriptorSet0.vp_c8)._m0[3].z, _2150);
    float _2162 = _2110 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _2164 = fma(_2152, (*spvDescriptorSet0.vp_c8)._m0[7].x, _2154);
    float _2166 = floor(_2106);
    float _2168 = _2160 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _2170 = fma(_2158, -0.5, 0.5);
    float _2172 = fma(_2102, (*spvDescriptorSet0.vp_c8)._m0[7].z, _2164);
    float _2174 = _2144 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _2176 = fma(_2158, 0.5, 0.5);
    float _2178 = fma(_2168, (*spvDescriptorSet0.vp_c8)._m0[7].w, _2172);
    float _2180 = exp2(_2162);
    float _2182 = _2144 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _2184 = fma(_2152, (*spvDescriptorSet0.vp_c8)._m0[4].x, _2174);
    float _2186 = fma(_2152, (*spvDescriptorSet0.vp_c8)._m0[5].x, _2182);
    float _2188 = fma(_2102, (*spvDescriptorSet0.vp_c8)._m0[4].z, _2184);
    float _2190 = 1.0 / _2178;
    float _2192 = fma(_2102, (*spvDescriptorSet0.vp_c8)._m0[5].z, _2186);
    float _2194 = -_2166;
    float _2196 = _2106 + _2194;
    float _2198 = fma(_2176, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _2200 = fma(_2168, (*spvDescriptorSet0.vp_c8)._m0[4].w, _2188);
    float _2202 = fma(_2168, (*spvDescriptorSet0.vp_c8)._m0[5].w, _2192);
    float _2204 = fma(_2176, _2198, -0.212114393711090087890625);
    float _2206 = log2(_2124);
    float _2208 = sqrt(_2170);
    float _2210 = _2200 * _2190;
    float2 _6614 = float2(_2120, _2196);
    float _2212 = dm_bs(spvDescriptorSet0.vp_t_tcb_24.sample(spvDescriptorSet0.vp_t_tcb_24Smplr, select(_6614, float2(0.0), isnan(_6614)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_24, spvDescriptorSet0.vp_t_tcb_24Smplr_w, select(_6614, float2(0.0), isnan(_6614)), level(0.0)).x;
    float _2214 = fma(_2176, _2204, 1.570728778839111328125);
    float _2216 = _2206 * 0.693147182464599609375;
    float _2218 = _2132 + 1.0;
    float _2220 = _2216 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _2222 = -_2132;
    float _2224 = fma(_2180, _2218, _2222);
    float _2226 = _2202 * _2190;
    float _2228 = fma(_2210, 0.5, 0.5);
    float _2230 = _2208 * 0.636619746685028076171875;
    float _2232 = fma(_2224, 0.5, 0.5);
    float _2234 = fma(_2226, -0.5, 0.5);
    float _2236 = -_2214;
    float _2238 = fma(_2230, _2236, 1.0);
    float3 _6661 = float3(_2228, _2234, _2220);
    float _2240 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_6661, float3(0.0), isnan(_6661)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_6661, float3(0.0), isnan(_6661)), level(0.0)).x;
    float3 _6672 = float3(_2228, _2234, _2220);
    float4 _2243 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_6672, float3(0.0), isnan(_6672)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_6672, float3(0.0), isnan(_6672)), level(0.0)).xyzw;
    float _2245 = _2243.x;
    float _2247 = _2243.y;
    float _2249 = _2243.z;
    float _2251 = _2243.w;
    float2 _6688 = float2(_2238, _2232);
    float3 _2255 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_6688, float2(0.0), isnan(_6688)), level(0.0)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_6688, float2(0.0), isnan(_6688)), level(0.0)).xyz;
    float _2257 = _2255.x;
    float _2259 = _2255.y;
    float _2261 = _2255.z;
    float _2263 = in.m_57.w;
    float _2265 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].w;
    float _2267 = in.m_65.y;
    bool _2269 = _664 > 0.5;
    float _2271 = _2110 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    bool _2273 = _660 > 0.5;
    float _2275 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _2277 = _2275 + (*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _2279 = -(*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _2281 = _2279 + (*spvDescriptorSet0.vp_c9)._m0[133].w;
    out.m_67.x = _616;
    out.m_67.y = _630;
    out.m_67.z = _618;
    out.m_67.w = _634;
    float _2283 = 1.0 / _2277;
    int _2285 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _2287 = _2285 != 0;
    float _2289 = in.m_65.x;
    int _2291 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _2293 = _2291 != 0;
    int _2295 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _2297 = _2295 != 0;
    float _2299 = _2265 * (*spvDescriptorSet0.vp_c9)._m0[90].y;
    float _2301 = 1.0 / _2281;
    int _2303 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 16;
    bool _2305 = _2303 != 0;
    out.m_69.w = _1052;
    bool _2307 = _2263 > 0.5;
    float _2309 = -(*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _2311 = _658 + _2309;
    out.m_71.x = _1548;
    out.m_71.y = _1526;
    out.m_71.z = _1540;
    float _2313 = -_2267;
    float _2315 = _2313 + 1.0;
    bool _2317 = _658 >= (*spvDescriptorSet0.vp_c9)._m0[132].w;
    bool _2319 = isnan(_658);
    bool _2321 = _2317 || _2319;
    bool _2323 = isnan((*spvDescriptorSet0.vp_c9)._m0[132].w);
    bool _2325 = _2321 || _2323;
    float _2327 = float(_2325);
    float _2329 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].z;
    float _2331 = _1272 * _1326;
    out.m_73.x = _1216;
    int _2333 = _2269 ? as_type<int>(_2315) : as_type<int>(_2267);
    int _2335 = _2307 ? as_type<int>(_2315) : as_type<int>(_2267);
    float _2337 = fma(_1238, _1312, _2331);
    float _2339 = _2287 ? as_type<float>(_2333) : _2267;
    float _2341 = -(*spvDescriptorSet0.vp_c9)._m0[131].x;
    float _2343 = (*spvDescriptorSet0.vp_c9)._m0[132].x + _2341;
    int _2345 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 32;
    bool _2347 = _2345 != 0;
    float _2349 = -(*spvDescriptorSet0.vp_c9)._m0[132].x;
    float _2351 = _2349 + (*spvDescriptorSet0.vp_c9)._m0[133].x;
    int _2353 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _2355 = _2353 != 0;
    float _2357 = _2343 * _2283;
    bool _2359 = _658 >= (*spvDescriptorSet0.vp_c9)._m0[133].w;
    bool _2361 = isnan(_658);
    bool _2363 = _2359 || _2361;
    bool _2365 = isnan((*spvDescriptorSet0.vp_c9)._m0[133].w);
    bool _2367 = _2363 || _2365;
    float _2369 = float(_2367);
    float _2371 = _2351 * _2301;
    float _2373 = _2355 ? as_type<float>(_2335) : _2267;
    float _2375 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _2377 = _658 + _2375;
    bool _2379 = _2355;
    float _2381 = _2267;
    float _2383 = (*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _2385 = _2299;
    float _2387 = _2196;
    float _2389 = _2289;
    float _2391 = _2200;
    if (_2293)
    {
        bool _2393 = _692 > 0.5;
        _2379 = _2393;
    }
    bool _2395 = _2379;
    float _2397 = -_2369;
    float _2399 = _2397 + 1.0;
    float _2401 = in.m_75.x;
    float _2403 = in.m_75.y;
    float _2405 = in.m_75.z;
    float _2407 = fma(_2357, _2377, (*spvDescriptorSet0.vp_c9)._m0[131].x);
    bool _2409 = _658 >= (*spvDescriptorSet0.vp_c9)._m0[131].w;
    bool _2411 = isnan(_658);
    bool _2413 = _2409 || _2411;
    bool _2415 = isnan((*spvDescriptorSet0.vp_c9)._m0[131].w);
    bool _2417 = _2413 || _2415;
    float _2419 = float(_2417);
    float _2421 = _2327 * _2399;
    if (_2347)
    {
        float _2423 = _2273 ? _2315 : _2267;
        _2381 = _2423;
    }
    float _2425 = _2381;
    float _2427 = -_2327;
    float _2429 = _2427 + 1.0;
    bool _2431 = _1184 != 0.0;
    bool _2433 = isnan(_1184);
    bool _2435 = _2431 || _2433;
    bool _2437 = isnan(0.0);
    bool _2439 = _2435 || _2437;
    int _2441 = 0;
    if (_2297)
    {
        float _2443 = -_2289;
        float _2445 = _2443 + 1.0;
        _2441 = as_type<int>(_2445);
    }
    int _2447 = _2441;
    float _2449 = fma(_2371, _2311, (*spvDescriptorSet0.vp_c9)._m0[132].x);
    float _2451 = _2419 * _2429;
    bool _2453 = _1182 == 0.0;
    bool _2455 = !_2439;
    bool _2457 = _2453 && _2455;
    float _2459 = fma(_2299, _2425, -0.5);
    int _2461 = _2447;
    if (!_2297)
    {
        _2383 = _2289;
    }
    float _2463 = _2383;
    float _2465 = _2407 * _2451;
    bool _2467 = _1186 == 0.0;
    bool _2469 = _2467 && _2457;
    float _2471 = -_2419;
    float _2473 = _2471 + 1.0;
    float _2475 = _2463;
    float _2477 = _2465;
    float _2479 = _2473;
    if (_2297)
    {
        float _2481 = _2273 ? as_type<float>(_2447) : _2289;
        _2475 = _2481;
    }
    float _2483 = _2475;
    if (_2305)
    {
        float _2485 = -_2289;
        float _2487 = _2485 + 1.0;
        _2461 = as_type<int>(_2487);
    }
    int _2489 = _2461;
    if (!_2305)
    {
        _2385 = _2289;
    }
    float _2491 = _2385;
    float _2493 = in.m_77.x;
    float _2495 = in.m_77.y;
    float _2497 = in.m_77.z;
    float _2499 = in.m_77.w;
    int _2501 = 0;
    float _2503 = _2491;
    if (_2293)
    {
        float _2505 = -_2289;
        float _2507 = _2505 + 1.0;
        _2501 = as_type<int>(_2507);
    }
    int _2509 = _2501;
    float _2511 = as_type<float>(_2509);
    if (!_2293)
    {
        _2387 = _2289;
    }
    float _2513 = _2387;
    float _2515 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _2517 = _2513;
    if (_2305)
    {
        float _2519 = _2269 ? as_type<float>(_2489) : _2289;
        _2503 = _2519;
    }
    float _2521 = _2503;
    float _2523 = fma(_2473, (*spvDescriptorSet0.vp_c9)._m0[131].x, _2465);
    if (_2293)
    {
        float _2525 = _2395 ? as_type<float>(_2509) : _2289;
        _2517 = _2525;
    }
    float _2527 = _2517;
    float _2529 = -_966;
    float _2531 = fma(_962, _2459, _2529);
    if (_2469)
    {
        _2477 = _2403;
    }
    float _2533 = _2477;
    float _2535 = fma(_2449, _2421, _2523);
    float _2537 = _2533;
    if (_2469)
    {
        _2511 = _2401;
    }
    float _2539 = _2511;
    float _2541 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _2543 = _2539;
    if (_2469)
    {
        _2479 = _2533;
    }
    float _2545 = _2479;
    float _2547 = fma(_2369, (*spvDescriptorSet0.vp_c9)._m0[133].x, _2535);
    float _2549 = _2545;
    if (!_2469)
    {
        _2537 = _2403;
    }
    float _2551 = _2537;
    float _2553 = _2329 * (*spvDescriptorSet0.vp_c9)._m0[90].x;
    float _2555 = _2329;
    if (_2469)
    {
        _2389 = _2539;
    }
    float _2557 = _2389;
    float _2559 = _2547 * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    float _2561 = _2557;
    if (!_2469)
    {
        _2543 = _2401;
    }
    float _2563 = _2543;
    float _2565 = fma(_2553, _2521, -0.5);
    float _2567 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    float _2569 = 0.0;
    if (_2469)
    {
        _2569 = _2405;
    }
    float _2571 = _2569;
    float _2573 = _2339 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _2575 = fma(_972, _2565, _836);
    float _2577 = _2497 * _2563;
    float _2579 = _2571;
    if (_2469)
    {
        _2555 = _2571;
    }
    float _2581 = _2555;
    float _2583 = _2581;
    if (!_2469)
    {
        float _2585 = fma(_1184, (*spvDescriptorSet0.vp_c9)._m0[17].y, _2551);
        _2549 = _2585;
    }
    float _2587 = _2549;
    float _2589 = _2575 + 0.5;
    float _2591 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    if (!_2469)
    {
        _2579 = _2405;
    }
    float _2593 = _2579;
    float _2595 = _2373 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    float _2597 = _2527 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    if (!_2469)
    {
        float _2599 = fma(_1182, (*spvDescriptorSet0.vp_c9)._m0[17].y, _2563);
        _2561 = _2599;
    }
    float _2601 = _2561;
    float _2603 = _2493 * _2551;
    float _2605 = -_2577;
    float _2607 = fma(_2493, _2593, _2605);
    float _2609 = _2495 * _2593;
    float _2611 = abs(_1790);
    float _2613 = log2(_2611);
    float _2615 = _2595 * _2567;
    float _2617 = _2597 * _2515;
    if (!_2469)
    {
        float _2619 = fma(_1186, (*spvDescriptorSet0.vp_c9)._m0[17].y, _2593);
        _2583 = _2619;
    }
    float _2621 = _2583;
    float _2623 = -_2609;
    float _2625 = fma(_2497, _2551, _2623);
    float _2627 = _2483 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    float _2629 = -_2603;
    float _2631 = fma(_2495, _2563, _2629);
    float _2633 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _2635 = _2573 * _2541;
    float _2637 = _2627 * _2591;
    float _2639 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _2641 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _2643 = _2633 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2645 = _2613 * (*spvDescriptorSet0.vp_c15)._m0[654].z;
    out.m_79.x = _2617;
    out.m_79.y = _2635;
    out.m_79.z = _2637;
    out.m_79.w = _2615;
    float _2647 = _2639 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2649 = _2641 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2651 = _1250 * _1326;
    float _2653 = _1284 * _1326;
    float _2655 = exp2(_2645);
    float _2657 = _1272 * _1336;
    out.m_81.x = _2643;
    out.m_81.y = _2647;
    out.m_81.z = _2649;
    out.m_81.w = _2559;
    float _2659 = -_1248;
    float _2661 = fma(_2659, _1312, _2651);
    float _2663 = _2531 + 0.5;
    float _2665 = fma(_1238, _1308, _2657);
    float _2667 = fma(_1280, _1168, _2337);
    bool _2669 = _1790 <= 8000.0;
    bool _2671 = isnan(_1790);
    bool _2673 = _2669 || _2671;
    bool _2675 = isnan(8000.0);
    bool _2677 = _2673 || _2675;
    float _2679 = float(_2677);
    float _2681 = exp2(_2271);
    float _2683 = _1250 * _1332;
    float _2685 = _1250 * _1336;
    float _2687 = _1272 * _1332;
    float _2689 = _1284 * _1332;
    float _2691 = -_1248;
    float _2693 = fma(_2691, _1310, _2683);
    float _2695 = -_1248;
    float _2697 = fma(_2695, _1308, _2685);
    float _2699 = _1284 * _1336;
    float _2701 = fma(_1260, _1312, _2653);
    float _2703 = fma(_1232, _1138, _2693);
    float _2705 = fma(_1232, _1168, _2661);
    float _2707 = fma(_1260, _1308, _2699);
    float _2709 = fma(_1232, _1144, _2697);
    float _2711 = _2607 * _2499;
    float _2713 = fma(_1274, _1168, _2701);
    out.m_83.x = _2589;
    out.m_83.y = _2663;
    float _2715 = fma(_1238, _1310, _2687);
    float _2717 = fma(_1280, _1144, _2665);
    float _2719 = fma(_1274, _1144, _2707);
    float _2721 = _2703 * _2495;
    float _2723 = _2705 * _2495;
    float _2725 = _2709 * _2495;
    float _2727 = _2711 * _2703;
    float _2729 = _2711 * _2705;
    float _2731 = fma(_2655, (*spvDescriptorSet0.vp_c15)._m0[654].x, (*spvDescriptorSet0.vp_c15)._m0[654].y);
    float _2733 = precise::clamp(_2731, 0.0, 1.0);
    float _2735 = _2709 * _2587;
    float _2737 = _2711 * _2709;
    float _2739 = fma(_1280, _1138, _2715);
    float _2741 = _2703 * _2587;
    float _2743 = _2625 * _2499;
    float _2745 = _2705 * _2587;
    float _2747 = fma(_2733, -2.0, 3.0);
    float _2749 = _2733 * _2733;
    float _2751 = _2144 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _2753 = fma(_2739, _2601, _2741);
    float _2755 = fma(_2743, _2739, _2727);
    float _2757 = _2749 * _2747;
    float _2759 = fma(_2667, _2601, _2745);
    float _2761 = fma(_2667, _2493, _2723);
    float _2763 = fma(_2743, _2667, _2729);
    float _2765 = fma(_2152, (*spvDescriptorSet0.vp_c8)._m0[6].x, _2751);
    float _2767 = fma(_2743, _2717, _2737);
    float _2769 = -_2757;
    float _2771 = _2769 + 1.0;
    float _2773 = _2631 * _2499;
    float _2775 = fma(_2717, _2601, _2735);
    float _2777 = fma(_1260, _1310, _2689);
    float _2779 = fma(_2771, (*spvDescriptorSet0.vp_c15)._m0[654].w, _2757);
    float _2781 = fma(_2773, _2719, _2767);
    float _2783 = fma(_2739, _2493, _2721);
    float _2785 = in.m_85.x;
    float _2787 = fma(_1274, _1138, _2777);
    float _2789 = fma(_2717, _2493, _2725);
    float _2791 = _2679 * _2779;
    float _2793 = fma(_2773, _2713, _2763);
    float _2795 = fma(_2773, _2787, _2755);
    float _2797 = -_2681;
    float _2799 = _2797 + 1.0;
    float _2801 = _2791 * (*spvDescriptorSet0.vp_c15)._m0[653].x;
    float _2803 = fma(_2102, (*spvDescriptorSet0.vp_c8)._m0[6].z, _2765);
    float _2805 = _2178 * 0.5;
    out.m_87.x = _2795;
    out.m_87.y = _2793;
    out.m_87.z = _2781;
    float _2807 = _2200 + _2178;
    float _2809 = fma(_2168, (*spvDescriptorSet0.vp_c8)._m0[6].w, _2803);
    float _2811 = fma(_2787, _2497, _2783);
    float _2813 = fma(_2202, -0.5, _2805);
    float _2815 = fma(_2787, _2621, _2753);
    float _2817 = _2809 + _2178;
    float _2819 = fma(_2713, _2497, _2761);
    float _2821 = fma(_2713, _2621, _2759);
    float _2823 = fma(_2719, _2621, _2775);
    float _2825 = fma(_2719, _2497, _2789);
    float _2827 = _2799 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _2829 = _2817 * 0.5;
    float _2831 = _2807 * 0.5;
    out.m_89.x = _2811;
    out.m_89.y = _2819;
    out.m_89.z = _2825;
    bool _2833 = _1928 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _2835 = isnan(_1928);
    bool _2837 = _2833 || _2835;
    bool _2839 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _2841 = _2837 || _2839;
    out.m_91.x = _2831;
    out.m_91.y = _2813;
    out.m_91.z = _2829;
    out.m_91.w = _2178;
    out.m_93.x = _2815;
    out.m_93.y = _2821;
    out.m_93.z = _2823;
    out.m_95.x = _1778;
    out.m_95.y = _1776;
    out.m_95.z = _1780;
    float _2843 = _2789;
    float _2845 = _2781;
    float _2847 = (*spvDescriptorSet0.vp_c15)._m0[653].y;
    if (!_2841)
    {
        _2843 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _2849 = _2843;
    out.gl_Position.x = _2200;
    out.gl_Position.y = _2202;
    out.gl_Position.z = _2809;
    out.gl_Position.w = _2178;
    float _2851 = _2849;
    float _2853 = _2849;
    if (!_2841)
    {
        _2845 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _2855 = _2845;
    float _2857 = _2855;
    float _2859 = _2855;
    if (!_2841)
    {
        _2391 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _2861 = _2391;
    float _2863 = -_2212;
    float _2865 = _2863 + 1.0;
    float _2867 = _2865 * _2801;
    float _2869 = precise::clamp(_2867, 0.0, 1.0);
    float _2871 = -_2869;
    float _2873 = fma(_2871, (*spvDescriptorSet0.vp_c15)._m0[653].y, 1.0);
    float _2875 = _2785;
    float _2877 = _2861;
    float _2879 = _2861;
    if (!_2841)
    {
        _2847 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _2881 = _2847;
    float _2883 = _2873 * _2785;
    float _2885 = _2881;
    float _2887 = _2881;
    if (!_2841)
    {
        _2875 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _2889 = _2875;
    float _2891 = _2883 * (*spvDescriptorSet0.vp_c13)._m0[1].w;
    float _2893 = _2827 * _2240;
    float _2895 = -_2827;
    float _2897 = _2895 + 1.0;
    out.m_97.x = _2891;
    float _2899 = _2251 * _2893;
    float _2901 = _2261 * _2893;
    float _2903 = _2251 * _2897;
    float _2905 = _1846 * _1906;
    float _2907 = fma(_2257, _2899, _2245);
    float _2909 = fma(_2259, _2899, _2247);
    float _2911 = fma(_2251, _2901, _2249);
    float _2913 = _2905 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _2915 = _2905;
    float _2917 = _2889;
    float _2919 = _2889;
    if (!_2841)
    {
        _2915 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _2921 = _2915;
    out.m_99.x = _2907;
    out.m_99.y = _2909;
    out.m_99.z = _2911;
    out.m_99.w = _2903;
    bool _2923 = !_2841;
    float _2925 = _2921;
    float _2927 = _2921;
    if (!_2923)
    {
        bool _2929 = _1928 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _2931 = isnan(_1928);
        bool _2933 = _2929 || _2931;
        bool _2935 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _2937 = _2933 || _2935;
        if (!_2937)
        {
            float _2939 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2941 = _1928 + _2939;
            float _2943 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2945 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _2943;
            float _2947 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _2949 = _2947 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _2951 = 1.0 / _2945;
            float _2953 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _2955 = _2953 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _2957 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _2959 = _2957 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _2961 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _2963 = _2961 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _2965 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _2967 = _2965 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _2969 = _2941 * _2951;
            float _2971 = precise::clamp(_2969, 0.0, 1.0);
            float _2973 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _2975 = _2973 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _2977 = fma(_2971, _2949, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _2979 = fma(_2971, _2975, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _2981 = fma(_2971, _2955, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _2983 = fma(_2971, _2959, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _2985 = fma(_2971, _2963, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _2987 = fma(_2971, _2967, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            _2879 = _2981;
            _2887 = _2985;
            _2853 = _2977;
            _2859 = _2983;
            _2919 = _2979;
            _2927 = _2987;
            _2989 = true;
        }
        else
        {
            bool _2991 = _1928 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _2993 = isnan(_1928);
            bool _2995 = _2991 || _2993;
            bool _2997 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _2999 = _2995 || _2997;
            if (!_2999)
            {
                _2851 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _3001 = _2851;
            _2853 = _3001;
            if (!_2999)
            {
                _2877 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _3003 = _2877;
            _2879 = _3003;
            if (!_2999)
            {
                _2917 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _3005 = _2917;
            _2919 = _3005;
            if (!_2999)
            {
                _2857 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _3007 = _2857;
            _2859 = _3007;
            if (!_2999)
            {
                _2885 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _3009 = _2885;
            _2887 = _3009;
            if (!_2999)
            {
                _2925 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _3011 = _2925;
            bool _3013 = !_2999;
            _2927 = _3011;
            if (!_3013)
            {
                bool _3015 = _1928 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _3017 = isnan(_1928);
                bool _3019 = _3015 || _3017;
                bool _3021 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _3023 = _3019 || _3021;
                if (!_3023)
                {
                    float _3025 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _3027 = _1928 + _3025;
                    float _3029 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _3031 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _3029;
                    float _3033 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _3035 = _3033 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _3037 = 1.0 / _3031;
                    float _3039 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _3041 = _3039 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _3043 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _3045 = _3043 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _3047 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _3049 = _3047 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _3051 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _3053 = _3051 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _3055 = _3027 * _3037;
                    float _3057 = precise::clamp(_3055, 0.0, 1.0);
                    float _3059 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _3061 = _3059 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _3063 = fma(_3057, _3035, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _3065 = fma(_3057, _3061, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _3067 = fma(_3057, _3041, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _3069 = fma(_3057, _3045, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _3071 = fma(_3057, _3049, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _3073 = fma(_3057, _3053, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    _2879 = _3067;
                    _2887 = _3071;
                    _2853 = _3063;
                    _2859 = _3069;
                    _2919 = _3065;
                    _2927 = _3073;
                    _2989 = true;
                }
                else
                {
                    _2879 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _2887 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _2853 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _2859 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _2919 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _2927 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _2989 = false;
    float _3075 = _2879;
    float _3077 = _2887;
    float _3079 = _2853;
    float _3081 = _2859;
    float _3083 = _2919;
    float _3085 = _2927;
    float _3087 = fma(_2821, -0.5, 0.5);
    float _3089 = precise::clamp(_3087, 0.0, 1.0);
    float _3091 = -_3075;
    float _3093 = _3091 + _3077;
    float _3095 = _2913 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _3097 = -_3079;
    float _3099 = _3097 + _3081;
    float _3101 = fma(_3089, _3093, _3075);
    out.m_101.x = 0.0;
    float _3103 = -_3083;
    float _3105 = _3103 + _3085;
    float _3107 = fma(_3089, _3099, _3079);
    float _3109 = _3101 * 0.586610972881317138671875;
    out.m_49.x = _3095;
    bool _3111 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _3113 = fma(_3089, _3105, _3083);
    float _3115 = fma(_3107, 0.298911988735198974609375, _3109);
    bool _3117 = _1846 > 0.0;
    bool _3119 = isnan(_1846);
    bool _3121 = _3117 || _3119;
    bool _3123 = isnan(0.0);
    bool _3125 = _3121 || _3123;
    float _3127 = fma(_3113, 0.114477999508380889892578125, _3115);
    bool _3129 = _1906 <= 0.0;
    bool _3131 = !_3125;
    bool _3133 = _3129 || _3131;
    float _3135 = -_3127;
    float _3137 = _3107 + _3135;
    float _3139 = -_3127;
    float _3141 = _3101 + _3139;
    float _3143 = -_3127;
    float _3145 = _3113 + _3143;
    float _3147 = fma(_3137, (*spvDescriptorSet0.vp_c13)._m0[1].z, _3127);
    float _3149 = fma(_3141, (*spvDescriptorSet0.vp_c13)._m0[1].z, _3127);
    float _3151 = fma(_3145, (*spvDescriptorSet0.vp_c13)._m0[1].z, _3127);
    bool _3153 = !_3111;
    if (!_3153)
    {
        float _3155 = -_1776;
        float _3157 = _3155 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
        float _3159 = -_1778;
        float _3161 = _3159 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
        float _3163 = -_1780;
        float _3165 = _3163 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
        float _3167 = _3157 * _3157;
        float _3169 = fma(_3161, _3161, _3167);
        float _3171 = fma(_3165, _3165, _3169);
        float _3173 = sqrt(_3171);
        float _3175 = rsqrt(_3171);
        float _3177 = -_3173;
        float _3179 = _3177 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
        float _3181 = _3179 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
        float _3183 = precise::clamp(_3181, 0.0, 1.0);
        float _3185 = _3161 * _3175;
        float _3187 = _3157 * _3175;
        float _3189 = abs(_3183);
        float _3191 = log2(_3189);
        float _3193 = _3165 * _3175;
        float _3195 = _3185 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
        float _3197 = _2821 * _3187;
        float _3199 = -_3187;
        float _3201 = -_3195;
        float _3203 = fma(_3199, (*spvDescriptorSet0.vp_c15)._m0[656].y, _3201);
        float _3205 = fma(_2815, _3185, _3197);
        float _3207 = -_3193;
        float _3209 = fma(_3207, (*spvDescriptorSet0.vp_c15)._m0[656].z, _3203);
        float _3211 = fma(_2823, _3193, _3205);
        float _3213 = precise::clamp(_3211, 0.0, 1.0);
        float _3215 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
        float _3217 = _3209 + _3215;
        float _3219 = _3191 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
        float _3221 = _3217 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
        float _3223 = precise::clamp(_3221, 0.0, 1.0);
        float _3225 = exp2(_3219);
        float _3227 = _3225 * _3223;
        float _3229 = _3213 * _3227;
        float _3231 = _3229 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
        float _3233 = _3229 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
        float _3235 = _3229 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
        out.m_101.x = _3231;
        out.m_101.y = _3233;
        out.m_101.z = _3235;
    }
    out.m_69.x = _3147;
    out.m_69.y = _3149;
    out.m_69.z = _3151;
    if (!_3133)
    {
        return out;
    }
    out.m_49.x = 0.0;
    float _3237 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _3237;
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
    out.m_81 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_101 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_97 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_99 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_69 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_53 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_73 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_79 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_83 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_71 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_91 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_49 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_87 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_93 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_95 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_89 = float4(0.0, 0.0, 0.0, 1.0);
    bool _2989 = false;
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
        float _3292 = as_type<float>(_134);
        out.gl_Position.z = _3292;
    }
    if (!_124)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_67.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_67.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_67.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_67.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_81.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_81.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_81.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_81.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_101.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_101.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_101.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_101.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_97.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_97.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_97.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_97.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_99.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_99.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_99.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_99.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_69.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_69.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_69.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_69.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_53.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_53.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_53.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_53.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_73.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_73.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_73.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_73.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_79.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_79.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_79.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_79.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_83.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_83.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_83.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_83.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_71.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_71.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_71.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_71.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_91.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_91.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_91.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_91.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_49.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_49.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_49.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_49.w)); dm_cw(dm_gs, dm_p, 68, as_type<uint>(out.m_87.x)); dm_cw(dm_gs, dm_p, 69, as_type<uint>(out.m_87.y)); dm_cw(dm_gs, dm_p, 70, as_type<uint>(out.m_87.z)); dm_cw(dm_gs, dm_p, 71, as_type<uint>(out.m_87.w)); dm_cw(dm_gs, dm_p, 72, as_type<uint>(out.m_93.x)); dm_cw(dm_gs, dm_p, 73, as_type<uint>(out.m_93.y)); dm_cw(dm_gs, dm_p, 74, as_type<uint>(out.m_93.z)); dm_cw(dm_gs, dm_p, 75, as_type<uint>(out.m_93.w)); dm_cw(dm_gs, dm_p, 76, as_type<uint>(out.m_95.x)); dm_cw(dm_gs, dm_p, 77, as_type<uint>(out.m_95.y)); dm_cw(dm_gs, dm_p, 78, as_type<uint>(out.m_95.z)); dm_cw(dm_gs, dm_p, 79, as_type<uint>(out.m_95.w)); dm_cw(dm_gs, dm_p, 80, as_type<uint>(out.m_89.x)); dm_cw(dm_gs, dm_p, 81, as_type<uint>(out.m_89.y)); dm_cw(dm_gs, dm_p, 82, as_type<uint>(out.m_89.z)); dm_cw(dm_gs, dm_p, 83, as_type<uint>(out.m_89.w)); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
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
        float _3364 = as_type<float>(_174);
        out.gl_Position.z = _3364;
    }
    if (_162)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_67.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_67.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_67.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_67.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_81.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_81.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_81.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_81.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_101.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_101.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_101.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_101.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_97.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_97.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_97.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_97.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_99.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_99.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_99.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_99.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_69.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_69.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_69.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_69.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_53.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_53.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_53.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_53.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_73.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_73.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_73.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_73.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_79.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_79.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_79.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_79.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_83.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_83.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_83.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_83.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_71.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_71.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_71.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_71.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_91.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_91.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_91.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_91.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_49.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_49.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_49.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_49.w)); dm_cw(dm_gs, dm_p, 68, as_type<uint>(out.m_87.x)); dm_cw(dm_gs, dm_p, 69, as_type<uint>(out.m_87.y)); dm_cw(dm_gs, dm_p, 70, as_type<uint>(out.m_87.z)); dm_cw(dm_gs, dm_p, 71, as_type<uint>(out.m_87.w)); dm_cw(dm_gs, dm_p, 72, as_type<uint>(out.m_93.x)); dm_cw(dm_gs, dm_p, 73, as_type<uint>(out.m_93.y)); dm_cw(dm_gs, dm_p, 74, as_type<uint>(out.m_93.z)); dm_cw(dm_gs, dm_p, 75, as_type<uint>(out.m_93.w)); dm_cw(dm_gs, dm_p, 76, as_type<uint>(out.m_95.x)); dm_cw(dm_gs, dm_p, 77, as_type<uint>(out.m_95.y)); dm_cw(dm_gs, dm_p, 78, as_type<uint>(out.m_95.z)); dm_cw(dm_gs, dm_p, 79, as_type<uint>(out.m_95.w)); dm_cw(dm_gs, dm_p, 80, as_type<uint>(out.m_89.x)); dm_cw(dm_gs, dm_p, 81, as_type<uint>(out.m_89.y)); dm_cw(dm_gs, dm_p, 82, as_type<uint>(out.m_89.z)); dm_cw(dm_gs, dm_p, 83, as_type<uint>(out.m_89.w)); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
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
    float _834 = -_144;
    float _836 = fma(_834, (*spvDescriptorSet0.vp_c9)._m0[86].x, _772);
    float _838 = -_788;
    float _840 = _838 + (*spvDescriptorSet0.vp_c8)._m0[29].y;
    int _842 = ~_830;
    int _844 = _842 + 1;
    int _846 = _844 + 1;
    float _848 = fma((*spvDescriptorSet0.vp_c8)._m0[0].z, (*spvDescriptorSet0.vp_c10)._m0[10].w, _698);
    int _850 = _846;
    if (!_774)
    {
        int _852 = ~_830;
        int _854 = _852 + 1;
        _850 = _854;
    }
    int _856 = _850;
    float _858 = fma(_832, -2.0, _824);
    float _860 = _692 * 2.0;
    float _862 = fma(_776, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    bool _864 = !_680;
    int _866 = _864 ? 0 : 1;
    float _868 = _664 + _692;
    bool _870 = !_688;
    int _872 = _870 ? 0 : 1;
    float _874 = floor(_860);
    int _876 = abs(_866);
    float _878 = _868 + (-1.0);
    int _880 = abs(_872);
    float _882 = _828 * _144;
    float _884 = _848 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _886 = exp2(_882);
    float _888 = fma(_878, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    float _890 = float(_876);
    float _892 = float(_880);
    float _894 = float(_856);
    float _896 = float(_822);
    float _898 = _892 * _894;
    bool _900 = _874 > 0.0;
    float _902 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _904 = 1.0 + _902;
    bool _906 = _874 >= 0.0;
    bool _908 = isnan(_874);
    bool _910 = _906 || _908;
    bool _912 = isnan(0.0);
    bool _914 = _910 || _912;
    float _916 = _890 * _896;
    float _918 = in.m_61.x;
    float _920 = in.m_61.y;
    float _922 = in.m_61.z;
    bool _924 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _926 = isnan(1.0);
    bool _928 = _924 || _926;
    bool _930 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _932 = _928 || _930;
    float _934 = 1.0 / _904;
    float _936 = -_886;
    float _938 = _936 + 1.0;
    float _940 = (*spvDescriptorSet0.vp_c9)._m0[88].w + (*spvDescriptorSet0.vp_c9)._m0[88].y;
    float _942 = _898 * (-2.0);
    bool _944 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _946 = isnan(0.0);
    bool _948 = _944 || _946;
    bool _950 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _952 = _948 || _950;
    float _954 = fma(_664, (*spvDescriptorSet0.vp_c9)._m0[88].w, _940);
    float _956 = (*spvDescriptorSet0.vp_c9)._m0[88].z + (*spvDescriptorSet0.vp_c9)._m0[88].x;
    float _958 = _952 ? _938 : 0.0;
    float _960 = _746 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _962 = fma(_144, (*spvDescriptorSet0.vp_c9)._m0[87].w, _954);
    float _964 = fma(_692, (*spvDescriptorSet0.vp_c9)._m0[88].z, _956);
    float _966 = fma(_144, (*spvDescriptorSet0.vp_c9)._m0[86].y, _858);
    float _968 = fma(_808, _808, _816);
    float _970 = _916 * (-2.0);
    float _972 = fma(_144, (*spvDescriptorSet0.vp_c9)._m0[87].z, _964);
    if (_932)
    {
        float _974 = _958 * _934;
        _166 = _974;
    }
    float _976 = _166;
    float _978 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _980 = _960 + _978;
    int _982 = _914 ? 0 : 1;
    float _984 = fma(_888, _970, _888);
    float _986 = _840 * _840;
    float _988 = fma(_980, _980, _968);
    float _990 = _692 + (-0.5);
    float _992 = fma(_970, _918, _918);
    bool _994 = !_684;
    int _996 = _994 ? 0 : 1;
    float _998 = sqrt(_988);
    int _1000 = ~_982;
    int _1002 = _1000 + 1;
    int _1004 = _1002 + 1;
    float _1006 = fma(_990, (*spvDescriptorSet0.vp_c9)._m0[196].x, _992);
    int _1008 = _1004;
    if (!_900)
    {
        int _1010 = ~_982;
        int _1012 = _1010 + 1;
        _1008 = _1012;
    }
    int _1014 = _1008;
    float _1016 = -_794;
    float _1018 = _1016 + (*spvDescriptorSet0.vp_c8)._m0[29].x;
    int _1020 = abs(_996);
    float _1022 = _660 + (-0.5);
    float _1024 = float(_1014);
    float _1026 = rsqrt(_988);
    float _1028 = float(_1020);
    float _1030 = -_960;
    float _1032 = _1030 + (*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1034 = fma(_1018, _1018, _986);
    float _1036 = fma(_984, _976, _1006);
    float _1038 = _1028 * _1024;
    float _1040 = _788 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1042 = _998 * (*spvDescriptorSet0.vp_c13)._m0[2].x;
    float _1044 = fma(_942, _922, _922);
    float _1046 = fma(_1032, _1032, _1034);
    float _1048 = _1038 * (-2.0);
    float _1050 = fma(_862, _942, _862);
    float _1052 = precise::min(_670, _1042);
    float _1054 = fma(_1022, (*spvDescriptorSet0.vp_c9)._m0[196].z, _1044);
    float _1056 = fma(_794, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1040);
    float _1058 = rsqrt(_1046);
    float _1060 = _1036 * 0.15915493667125701904296875;
    float _1062 = _1026 * _1052;
    float _1064 = fma(_1048, _920, _920);
    float _1066 = fma(_960, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1056);
    float _1068 = _664 + (-0.5);
    float _1070 = _804 * _1062;
    float _1072 = _808 * _1062;
    float _1074 = sqrt(_1046);
    float _1076 = fma(_1050, _976, _1054);
    float _1078 = -_1070;
    float _1080 = _804 + _1078;
    float _1082 = -_1072;
    float _1084 = _808 + _1082;
    float _1086 = fma(_1068, (*spvDescriptorSet0.vp_c9)._m0[196].y, _1064);
    float _1088 = _1076 * 0.15915493667125701904296875;
    float _1090 = _1080 * _1080;
    float _1092 = 1.0 / _702;
    float _1094 = fma(_766, _1048, _766);
    float _1096 = _980 * _1062;
    float _1098 = fma(_1084, _1084, _1090);
    float _1100 = _1066 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1102 = fma(_1094, _976, _1086);
    float _1104 = -_1096;
    float _1106 = _980 + _1104;
    float _1108 = -_1100;
    float _1110 = _884 + _1108;
    bool _1112 = _1100 >= _884;
    bool _1114 = isnan(_1100);
    bool _1116 = _1112 || _1114;
    bool _1118 = isnan(_884);
    bool _1120 = _1116 || _1118;
    float _1122 = fma(_1106, _1106, _1098);
    float _1124 = _1102 * 0.15915493667125701904296875;
    float _1126 = (*spvDescriptorSet0.vp_c8)._m0[28].y * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _1128 = abs(_1110);
    float _1130 = precise::max(_1128, (*spvDescriptorSet0.vp_c9)._m0[194].y);
    float _1132 = sqrt(_1122);
    float _1134 = abs(_1074);
    float _1136 = precise::max(0.0, _1134);
    float _1138 = _1018 * _1058;
    float _1140 = precise::min(_1130, (*spvDescriptorSet0.vp_c9)._m0[194].z);
    float _1142 = fma((*spvDescriptorSet0.vp_c8)._m0[28].x, (*spvDescriptorSet0.vp_c8)._m0[28].x, _1126);
    float _1144 = _1032 * _1058;
    float _1146 = precise::min(_1136, 40.0);
    float _1148 = _1060 * 6.283185482025146484375;
    float _1150 = sin(_1148);
    float _1152 = -(*spvDescriptorSet0.vp_c9)._m0[194].y;
    float _1154 = _1140 + _1152;
    bool _1156 = !_1120;
    float _1158 = _1156 ? 1.0 : (-1.0);
    float _1160 = -(*spvDescriptorSet0.vp_c8)._m0[1].z;
    float _1162 = _1138 * _1160;
    float _1164 = fma((*spvDescriptorSet0.vp_c8)._m0[28].z, (*spvDescriptorSet0.vp_c8)._m0[28].z, _1142);
    float _1166 = _1154 * _1092;
    float _1168 = _840 * _1058;
    float _1170 = fma(_1146, -0.02500000037252902984619140625, 1.0);
    float _1172 = _1060 * 6.283185482025146484375;
    float _1174 = cos(_1172);
    float _1176 = _1026 * _1132;
    float _1178 = -(*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1180 = _1144 * _1178;
    float _1182 = in.m_63.x;
    float _1184 = in.m_63.y;
    float _1186 = in.m_63.z;
    float _1188 = -(*spvDescriptorSet0.vp_c8)._m0[1].x;
    float _1190 = -_1162;
    float _1192 = fma(_1144, _1188, _1190);
    float _1194 = _1158 * _1166;
    float _1196 = _156 * (*spvDescriptorSet0.vp_c9)._m0[194].w;
    float _1198 = -(*spvDescriptorSet0.vp_c8)._m0[1].x;
    float _1200 = _1168 * _1198;
    float _1202 = _1088 * 6.283185482025146484375;
    float _1204 = cos(_1202);
    float _1206 = -(*spvDescriptorSet0.vp_c8)._m0[1].z;
    float _1208 = -_1180;
    float _1210 = fma(_1168, _1206, _1208);
    float _1212 = _1192 * _1192;
    float _1214 = _1196 * _1194;
    float _1216 = _662 * _1176;
    float _1218 = _696 * _1176;
    float _1220 = fma(_1210, _1210, _1212);
    float _1222 = _1214 * 0.15915493667125701904296875;
    float _1224 = _1124 * 6.283185482025146484375;
    float _1226 = cos(_1224);
    float _1228 = _1124 * 6.283185482025146484375;
    float _1230 = sin(_1228);
    float _1232 = _1150 * _1204;
    float _1234 = _1174 * _1226;
    float _1236 = _1150 * _1226;
    float _1238 = _1226 * _1204;
    float _1240 = -(*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1242 = -_1200;
    float _1244 = fma(_1138, _1240, _1242);
    float _1246 = _1088 * 6.283185482025146484375;
    float _1248 = sin(_1246);
    float _1250 = _1174 * _1204;
    float _1252 = fma(_1244, _1244, _1220);
    float _1254 = _1150 * _1230;
    float _1256 = _1174 * _1230;
    float _1258 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _1184);
    float _1260 = _1230 * _1204;
    float _1262 = rsqrt(_1164);
    float _1264 = _690 * _1176;
    float _1266 = _1264 * _1258;
    float _1268 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _1186);
    float _1270 = rsqrt(_1252);
    float _1272 = fma(_1248, _1234, _1254);
    float _1274 = fma(_1248, _1254, _1234);
    float _1276 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _1182);
    float _1278 = -_1256;
    float _1280 = fma(_1248, _1236, _1278);
    float _1282 = -_1236;
    float _1284 = fma(_1248, _1256, _1282);
    float _1286 = -_1266;
    float _1288 = _1248 * _1286;
    float _1290 = _1216 * _1276;
    float _1292 = _1250 * _1266;
    float _1294 = _1232 * _1266;
    float _1296 = _1218 * _1268;
    float _1298 = fma(_1238, _1290, _1288);
    float _1300 = fma(_1272, _1290, _1292);
    float _1302 = fma(_1280, _1290, _1294);
    float _1304 = _1262 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _1306 = fma(_1260, _1296, _1298);
    float _1308 = _1244 * _1270;
    float _1310 = _1210 * _1270;
    float _1312 = _1192 * _1270;
    float _1314 = fma(_1284, _1296, _1300);
    float _1316 = _1138 * _1308;
    float _1318 = fma(_1274, _1296, _1302);
    float _1320 = _1144 * _1312;
    float _1322 = _1168 * _1310;
    float _1324 = -_1316;
    float _1326 = fma(_1144, _1310, _1324);
    float _1328 = _1262 * (*spvDescriptorSet0.vp_c8)._m0[28].x;
    float _1330 = -_1320;
    float _1332 = fma(_1168, _1308, _1330);
    float _1334 = -_1322;
    float _1336 = fma(_1138, _1312, _1334);
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
    float _1358 = fma(_1138, _1318, _1350);
    float _1360 = _788 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1362 = _788 + _1354;
    float _1364 = fma(_1144, _1318, _1352);
    float _1366 = _794 + _1358;
    float _1368 = fma(_1348, _1348, _1356);
    float _1370 = _1362 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1372 = _1362 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1374 = _1362 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1376 = fma(_794, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1360);
    float _1378 = fma(_1366, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1370);
    float _1380 = fma(_1366, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1372);
    float _1382 = _960 + _1364;
    float _1384 = fma(_1366, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1374);
    float _1386 = rsqrt(_1368);
    float _1388 = fma(_960, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1376);
    float _1390 = fma(_1382, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1380);
    float _1392 = fma(_1382, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1384);
    float _1394 = fma(_1382, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1378);
    float _1396 = _1388 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1398 = _1390 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1400 = _1392 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1402 = _1222 * 6.283185482025146484375;
    float _1404 = cos(_1402);
    float _1406 = _1394 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1408 = -_1398;
    float _1410 = _1408 + _1396;
    float _1412 = _1400 * (*spvDescriptorSet0.vp_c8)._m0[12].y;
    float _1414 = _1400 * (*spvDescriptorSet0.vp_c8)._m0[13].y;
    float _1416 = _1400 * (*spvDescriptorSet0.vp_c8)._m0[14].y;
    float _1418 = fma(_1170, _1410, _1398);
    float _1420 = fma(_1406, (*spvDescriptorSet0.vp_c8)._m0[12].x, _1412);
    float _1422 = _1222 * 6.283185482025146484375;
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
    float _1486 = _1476 * _1466;
    float _1488 = fma(_1444, _1456, _1404);
    float _1490 = fma(_1472, _1480, _1482);
    float _1492 = -_960;
    float _1494 = _1492 + _1484;
    float _1496 = fma(_1430, _1456, _1460);
    float _1498 = fma(_1488, _1480, _1486);
    float _1500 = fma(_1446, _1454, _1404);
    float _1502 = fma(_1450, _1494, _1490);
    float _1504 = fma(_1446, _1456, _1462);
    float _1506 = fma(_1496, _1494, _1498);
    float _1508 = _1500 * _1466;
    float _1510 = fma(_1502, _710, _960);
    float _1512 = -_1458;
    float _1514 = fma(_1430, _1454, _1512);
    float _1516 = fma(_1506, _710, _794);
    float _1518 = fma(_1504, _1480, _1508);
    float _1520 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1522 = _1510 + _1520;
    float _1524 = -_1070;
    float _1526 = _788 + _1524;
    float _1528 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1530 = _1516 + _1528;
    float _1532 = fma(_1514, _1494, _1518);
    float _1534 = _1522 * _1522;
    float _1536 = _1526 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _1538 = -_1096;
    float _1540 = _960 + _1538;
    float _1542 = _788 + _1532;
    float _1544 = fma(_1530, _1530, _1534);
    float _1546 = -_1072;
    float _1548 = _794 + _1546;
    float _1550 = sqrt(_1544);
    float _1552 = fma(_1548, (*spvDescriptorSet0.vp_c8)._m0[11].x, _1536);
    float _1554 = fma(_1540, (*spvDescriptorSet0.vp_c8)._m0[11].z, _1552);
    bool _1556 = _1550 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1558 = _1446;
    float _1560 = _1518;
    float _1562 = _1510;
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
        _1560 = _1542;
    }
    float _1572 = _1560;
    bool _1574 = !_1556;
    float _1576 = _1572;
    if (!_1574)
    {
        float _1578 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1580 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1582 = _1550 + _1580;
        float _1584 = _1542 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1586 = rsqrt(_1544);
        float _1588 = _1582 * _1578;
        float _1590 = _1588 * 0.15915493667125701904296875;
        float _1592 = _1590 * 6.283185482025146484375;
        float _1594 = cos(_1592);
        float _1596 = _1590 * 6.283185482025146484375;
        float _1598 = sin(_1596);
        float _1600 = _1594 + (-1.0);
        float _1602 = _1600 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1604 = fma(_1598, _1584, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1606 = fma(_1542, _1594, _1602);
        float _1608 = _1586 * _1604;
        float _1610 = fma(_1530, _1608, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1612 = fma(_1522, _1608, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _1576 = _1606;
        _1570 = _1610;
        _1562 = _1612;
    }
    float _1614 = _1576;
    float _1616 = _1570;
    float _1618 = _1562;
    float _1620 = -_788;
    float _1622 = _1620 + _1614;
    float _1624 = -_794;
    float _1626 = _1624 + _1616;
    float _1628 = _1554 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _1630 = _1526 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _1632 = _1622 * _1622;
    float _1634 = -_960;
    float _1636 = _1634 + _1618;
    float _1638 = 1.0 / _1628;
    float _1640 = fma(_1548, (*spvDescriptorSet0.vp_c8)._m0[10].x, _1630);
    float _1642 = fma(_1626, _1626, _1632);
    float _1644 = -_1070;
    float _1646 = _1644 + _1614;
    float _1648 = fma(_1540, (*spvDescriptorSet0.vp_c8)._m0[10].z, _1640);
    float _1650 = fma(_1636, _1636, _1642);
    bool _1652 = (*spvDescriptorSet0.vp_c15)._m0[653].w >= 0.5;
    bool _1654 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _1656 = _1652 || _1654;
    bool _1658 = isnan(0.5);
    bool _1660 = _1656 || _1658;
    float _1662 = -_1096;
    float _1664 = _1662 + _1618;
    float _1666 = _1648 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _1668 = sqrt(_1650);
    float _1670 = _1666 + _1628;
    float _1672 = _1670 * _1638;
    float _1674 = _1672 * 0.5;
    float _1676 = -_1072;
    float _1678 = _1676 + _1616;
    float _1680 = _1618;
    float _1682 = _1614;
    float _1684 = _1616;
    float _1686 = (*spvDescriptorSet0.vp_c8)._m0[30].w;
    float _1688 = _1678;
    float _1690 = _1664;
    if (_1660)
    {
        _1564 = 1.0;
    }
    float _1692 = _1564;
    float _1694 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _1696 = fma(_1674, (*spvDescriptorSet0.vp_c8)._m0[30].w, _1694);
    float _1698 = 1.0 / _1696;
    bool _1700 = _1668 > 0.0;
    float _1702 = _1692;
    if (!_1700)
    {
        _1680 = _1678;
    }
    float _1704 = _1680;
    float _1706 = _1704;
    if (!_1700)
    {
        _1682 = _1646;
    }
    float _1708 = _1682;
    float _1710 = _1708;
    if (!_1700)
    {
        _1684 = _1664;
    }
    float _1712 = _1684;
    bool _1714 = !_1700;
    float _1716 = _1712;
    float _1718 = _1712;
    if (!_1714)
    {
        float _1720 = _198 * _198;
        float _1722 = fma(_196, _196, _1720);
        float _1724 = rsqrt(_1650);
        float _1726 = fma(_200, _200, _1722);
        float _1728 = sqrt(_1726);
        float _1730 = _1626 * _1724;
        float _1732 = _1622 * _1724;
        float _1734 = _1636 * _1724;
        bool _1736 = _1728 > 0.0;
        float _1738 = _1724;
        float _1740 = _1728;
        _1686 = _1732;
        if (!_1736)
        {
            _1738 = _1678;
        }
        float _1742 = _1738;
        _1706 = _1742;
        if (!_1736)
        {
            _1740 = _1646;
        }
        float _1744 = _1740;
        _1710 = _1744;
        if (!_1736)
        {
            _1716 = _1664;
        }
        float _1746 = _1716;
        bool _1748 = !_1736;
        _1718 = _1746;
        if (!_1748)
        {
            float _1750 = rsqrt(_1726);
            float _1752 = 1.0 / (*spvDescriptorSet0.vp_c10)._m0[2].z;
            float _1754 = _198 * _1750;
            float _1756 = _196 * _1750;
            float _1758 = _1732 * _1754;
            float _1760 = _200 * _1750;
            float _1762 = fma(_1730, _1756, _1758);
            float _1764 = _1752 * (*spvDescriptorSet0.vp_c9)._m0[142].x;
            float _1766 = fma(_1734, _1760, _1762);
            float _1768 = _1766 * _1764;
            float _1770 = fma(_196, _1768, _1678);
            float _1772 = fma(_198, _1768, _1646);
            float _1774 = fma(_200, _1768, _1664);
            _1710 = _1772;
            _1706 = _1770;
            _1718 = _1774;
        }
    }
    float _1776 = _1710;
    float _1778 = _1706;
    float _1780 = _1718;
    float _1782 = _1686;
    float _1784 = _1782;
    if (_1660)
    {
        _1784 = 1.0;
    }
    float _1786 = _1784;
    float _1788 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _1790 = _1698 * _1788;
    float _1792 = _1786;
    if (!_1660)
    {
        float _1794 = (*spvDescriptorSet0.vp_c8)._m0[31].x * 0.5;
        float _1796 = _1794 * 0.15915493667125701904296875;
        float _1798 = _1796 * 6.283185482025146484375;
        float _1800 = cos(_1798);
        float _1802 = (*spvDescriptorSet0.vp_c8)._m0[31].y * 0.5;
        float _1804 = _1802 * 0.15915493667125701904296875;
        float _1806 = _1796 * 6.283185482025146484375;
        float _1808 = sin(_1806);
        float _1810 = 1.0 / _1800;
        float _1812 = _1804 * 6.283185482025146484375;
        float _1814 = cos(_1812);
        float _1816 = _1808 * _1810;
        float _1818 = _1804 * 6.283185482025146484375;
        float _1820 = sin(_1818);
        float _1822 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1824 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _1822;
        float _1826 = _1814 * _1816;
        float _1828 = 1.0 / _1824;
        float _1830 = 1.0 / _1826;
        float _1832 = _1820 * _1830;
        float _1834 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1836 = fma(_1790, _1832, _1834);
        float _1838 = _1836 * _1828;
        float _1840 = precise::clamp(_1838, 0.0, 1.0);
        _1688 = _1816;
        _1690 = _1796;
        _1702 = _1840;
    }
    float _1842 = _1688;
    float _1844 = _1690;
    float _1846 = _1702;
    float _1848 = _1842;
    float _1850 = _1844;
    if (!_1660)
    {
        float _1852 = (*spvDescriptorSet0.vp_c8)._m0[31].x * 0.5;
        float _1854 = _1852 * 0.15915493667125701904296875;
        float _1856 = _1854 * 6.283185482025146484375;
        float _1858 = cos(_1856);
        float _1860 = (*spvDescriptorSet0.vp_c8)._m0[31].y * 0.5;
        float _1862 = _1860 * 0.15915493667125701904296875;
        float _1864 = _1854 * 6.283185482025146484375;
        float _1866 = sin(_1864);
        float _1868 = 1.0 / _1858;
        float _1870 = _1862 * 6.283185482025146484375;
        float _1872 = cos(_1870);
        float _1874 = _1866 * _1868;
        float _1876 = _1862 * 6.283185482025146484375;
        float _1878 = sin(_1876);
        float _1880 = _1872 * _1874;
        float _1882 = 1.0 / _1880;
        float _1884 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _1886 = (*spvDescriptorSet0.vp_c9)._m0[140].w + _1884;
        float _1888 = 1.0 / _1886;
        float _1890 = _1878 * _1882;
        float _1892 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _1894 = fma(_1790, _1890, _1892);
        float _1896 = _1894 * _1888;
        float _1898 = precise::clamp(_1896, 0.0, 1.0);
        float _1900 = -_1898;
        float _1902 = _1900 + 1.0;
        _1848 = _1868;
        _1792 = _1902;
    }
    float _1904 = _1848;
    float _1906 = _1792;
    float _1908 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1910 = _1776 + _1908;
    float _1912 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1914 = _1778 + _1912;
    float _1916 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1918 = _1780 + _1916;
    float _1920 = _1910 * _1910;
    float _1922 = fma(_1914, _1914, _1920);
    float _1924 = fma(_1918, _1918, _1922);
    float _1926 = rsqrt(_1924);
    float _1928 = sqrt(_1924);
    float _1930 = _1926 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1932 = _1914 * _1930;
    float _1934 = _1918 * _1930;
    float _1936 = _1932 * _1932;
    float _1938 = _1934 * _1934;
    float _1940 = _1936 + _1938;
    float _1942 = sqrt(_1940);
    bool _1944 = _1942 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1946 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1948 = _1942 + _1946;
    float _1950 = _1918;
    float _1952 = _1920;
    float _1954 = _1948;
    float _1956 = _1910;
    float _1958 = _1904;
    if (_1944)
    {
        float _1960 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1950 = _1960;
    }
    float _1962 = _1950;
    if (_1944)
    {
        float _1964 = rsqrt(_1940);
        _1952 = _1964;
    }
    float _1966 = _1952;
    float _1968 = _1966;
    if (_1944)
    {
        float _1970 = _1948 * _1962;
        _1954 = _1970;
    }
    float _1972 = _1954;
    if (_1944)
    {
        float _1974 = _1972 * 0.15915493667125701904296875;
        _1850 = _1974;
    }
    float _1976 = _1850;
    float _1978 = _1926;
    float _1980 = _1976;
    if (_1944)
    {
        float _1982 = _1976 * 6.283185482025146484375;
        float _1984 = sin(_1982);
        _1978 = _1984;
    }
    float _1986 = _1978;
    float _1988 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _1990 = precise::max(0.0, _1988);
    float _1992 = _1962;
    float _1994 = _1990;
    if (_1944)
    {
        float _1996 = _1976 * 6.283185482025146484375;
        float _1998 = cos(_1996);
        _1992 = _1998;
    }
    float _2000 = _1992;
    float _2002 = -_1930;
    float _2004 = -_1990;
    float _2006 = fma(_1910, _2002, _2004);
    if (_1944)
    {
        float _2008 = _2006 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1956 = _2008;
    }
    float _2010 = _1956;
    if (!_1944)
    {
        _1980 = _1936;
    }
    float _2012 = _1980;
    float _2014 = _1986;
    float _2016 = _2012;
    if (_1944)
    {
        float _2018 = fma(_1986, _2010, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1958 = _2018;
    }
    float _2020 = _1958;
    float _2022 = _2020;
    if (!_1944)
    {
        _2014 = _2006;
    }
    float _2024 = _2014;
    float _2026 = _2024;
    float _2028 = _2000;
    if (_1944)
    {
        float _2030 = _2000 + (-1.0);
        _1994 = _2030;
    }
    float _2032 = _1994;
    float _2034 = _2032;
    if (_1944)
    {
        float _2036 = _1966 * _2020;
        _1566 = _2036;
    }
    float _2038 = _1566;
    if (!_1944)
    {
        _1968 = _1932;
    }
    float _2040 = _1968;
    float _2042 = _2040;
    if (_1944)
    {
        float _2044 = _2032 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2034 = _2044;
    }
    float _2046 = _2034;
    if (_1944)
    {
        float _2048 = _1932 * _2038;
        _2042 = _2048;
    }
    float _2050 = _2042;
    if (!_1944)
    {
        _2022 = _1938;
    }
    float _2052 = _2022;
    float _2054 = fma(_1548, (*spvDescriptorSet0.vp_c15)._m0[652].x, (*spvDescriptorSet0.vp_c15)._m0[652].z);
    float _2056 = _2052;
    if (_1944)
    {
        float _2058 = fma(_2006, _2000, _2046);
        _2026 = _2058;
    }
    float _2060 = _2026;
    if (!_1944)
    {
        _2028 = _1934;
    }
    float _2062 = _2028;
    float _2064 = _2062;
    if (_1944)
    {
        float _2066 = _2050 * _2050;
        _2016 = _2066;
    }
    float _2068 = _2016;
    if (_1944)
    {
        float _2070 = _1934 * _2038;
        _2064 = _2070;
    }
    float _2072 = _2064;
    float _2074 = floor(_2054);
    float _2076 = fma(_2060, _2060, _2068);
    if (_1944)
    {
        float _2078 = _2072 * _2072;
        _2056 = _2078;
    }
    float _2080 = _2056;
    float _2082 = _1776 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _2084 = _2076 + _2080;
    float _2086 = fma(_1778, (*spvDescriptorSet0.vp_c8)._m0[2].x, _2082);
    float _2088 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _2090 = fma(_1928, (*spvDescriptorSet0.vp_c15)._m0[23].w, _2088);
    float _2092 = precise::clamp(_2090, 0.0, 1.0);
    float _2094 = rsqrt(_2084);
    float _2096 = fma(_1780, (*spvDescriptorSet0.vp_c8)._m0[2].z, _2086);
    float _2098 = -_2092;
    float _2100 = _2098 + 1.0;
    float _2102 = _2096 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _2104 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _2106 = fma(_1540, (*spvDescriptorSet0.vp_c15)._m0[652].y, (*spvDescriptorSet0.vp_c15)._m0[652].w);
    float _2108 = abs(_2100);
    float _2110 = log2(_2108);
    float _2112 = _2102 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _2114 = _1776 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _2116 = _1776 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _2118 = -_2074;
    float _2120 = _2054 + _2118;
    float _2122 = -_2112;
    float _2124 = fma(_2122, _2104, 1.0);
    float _2126 = _1776 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _2128 = fma(_1778, (*spvDescriptorSet0.vp_c8)._m0[1].x, _2114);
    float _2130 = _2094 * _2050;
    float _2132 = _2094 * _2060;
    float _2134 = fma(_1778, (*spvDescriptorSet0.vp_c8)._m0[0].x, _2126);
    float _2136 = fma(_1780, (*spvDescriptorSet0.vp_c8)._m0[1].z, _2128);
    float _2138 = _2130 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _2140 = _2094 * _2072;
    float _2142 = fma(_1780, (*spvDescriptorSet0.vp_c8)._m0[0].z, _2134);
    float _2144 = _2136 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _2146 = -_2138;
    float _2148 = fma(_2132, (*spvDescriptorSet0.vp_c15)._m0[21].y, _2146);
    float _2150 = fma(_1778, (*spvDescriptorSet0.vp_c8)._m0[3].x, _2116);
    float _2152 = _2142 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _2154 = _2144 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _2156 = -_2140;
    float _2158 = fma(_2156, (*spvDescriptorSet0.vp_c15)._m0[21].z, _2148);
    float _2160 = fma(_1780, (*spvDescriptorSet0.vp_c8)._m0[3].z, _2150);
    float _2162 = _2110 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _2164 = fma(_2152, (*spvDescriptorSet0.vp_c8)._m0[7].x, _2154);
    float _2166 = floor(_2106);
    float _2168 = _2160 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _2170 = fma(_2158, -0.5, 0.5);
    float _2172 = fma(_2102, (*spvDescriptorSet0.vp_c8)._m0[7].z, _2164);
    float _2174 = _2144 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _2176 = fma(_2158, 0.5, 0.5);
    float _2178 = fma(_2168, (*spvDescriptorSet0.vp_c8)._m0[7].w, _2172);
    float _2180 = exp2(_2162);
    float _2182 = _2144 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _2184 = fma(_2152, (*spvDescriptorSet0.vp_c8)._m0[4].x, _2174);
    float _2186 = fma(_2152, (*spvDescriptorSet0.vp_c8)._m0[5].x, _2182);
    float _2188 = fma(_2102, (*spvDescriptorSet0.vp_c8)._m0[4].z, _2184);
    float _2190 = 1.0 / _2178;
    float _2192 = fma(_2102, (*spvDescriptorSet0.vp_c8)._m0[5].z, _2186);
    float _2194 = -_2166;
    float _2196 = _2106 + _2194;
    float _2198 = fma(_2176, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _2200 = fma(_2168, (*spvDescriptorSet0.vp_c8)._m0[4].w, _2188);
    float _2202 = fma(_2168, (*spvDescriptorSet0.vp_c8)._m0[5].w, _2192);
    float _2204 = fma(_2176, _2198, -0.212114393711090087890625);
    float _2206 = log2(_2124);
    float _2208 = sqrt(_2170);
    float _2210 = _2200 * _2190;
    float2 _6614 = float2(_2120, _2196);
    float _2212 = dm_bs(spvDescriptorSet0.vp_t_tcb_24.sample(spvDescriptorSet0.vp_t_tcb_24Smplr, select(_6614, float2(0.0), isnan(_6614)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_24, spvDescriptorSet0.vp_t_tcb_24Smplr_w, select(_6614, float2(0.0), isnan(_6614)), level(0.0)).x;
    float _2214 = fma(_2176, _2204, 1.570728778839111328125);
    float _2216 = _2206 * 0.693147182464599609375;
    float _2218 = _2132 + 1.0;
    float _2220 = _2216 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _2222 = -_2132;
    float _2224 = fma(_2180, _2218, _2222);
    float _2226 = _2202 * _2190;
    float _2228 = fma(_2210, 0.5, 0.5);
    float _2230 = _2208 * 0.636619746685028076171875;
    float _2232 = fma(_2224, 0.5, 0.5);
    float _2234 = fma(_2226, -0.5, 0.5);
    float _2236 = -_2214;
    float _2238 = fma(_2230, _2236, 1.0);
    float3 _6661 = float3(_2228, _2234, _2220);
    float _2240 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_6661, float3(0.0), isnan(_6661)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_6661, float3(0.0), isnan(_6661)), level(0.0)).x;
    float3 _6672 = float3(_2228, _2234, _2220);
    float4 _2243 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_6672, float3(0.0), isnan(_6672)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_6672, float3(0.0), isnan(_6672)), level(0.0)).xyzw;
    float _2245 = _2243.x;
    float _2247 = _2243.y;
    float _2249 = _2243.z;
    float _2251 = _2243.w;
    float2 _6688 = float2(_2238, _2232);
    float3 _2255 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_6688, float2(0.0), isnan(_6688)), level(0.0)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_6688, float2(0.0), isnan(_6688)), level(0.0)).xyz;
    float _2257 = _2255.x;
    float _2259 = _2255.y;
    float _2261 = _2255.z;
    float _2263 = in.m_57.w;
    float _2265 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].w;
    float _2267 = in.m_65.y;
    bool _2269 = _664 > 0.5;
    float _2271 = _2110 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    bool _2273 = _660 > 0.5;
    float _2275 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _2277 = _2275 + (*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _2279 = -(*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _2281 = _2279 + (*spvDescriptorSet0.vp_c9)._m0[133].w;
    out.m_67.x = _616;
    out.m_67.y = _630;
    out.m_67.z = _618;
    out.m_67.w = _634;
    float _2283 = 1.0 / _2277;
    int _2285 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _2287 = _2285 != 0;
    float _2289 = in.m_65.x;
    int _2291 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _2293 = _2291 != 0;
    int _2295 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _2297 = _2295 != 0;
    float _2299 = _2265 * (*spvDescriptorSet0.vp_c9)._m0[90].y;
    float _2301 = 1.0 / _2281;
    int _2303 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 16;
    bool _2305 = _2303 != 0;
    out.m_69.w = _1052;
    bool _2307 = _2263 > 0.5;
    float _2309 = -(*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _2311 = _658 + _2309;
    out.m_71.x = _1548;
    out.m_71.y = _1526;
    out.m_71.z = _1540;
    float _2313 = -_2267;
    float _2315 = _2313 + 1.0;
    bool _2317 = _658 >= (*spvDescriptorSet0.vp_c9)._m0[132].w;
    bool _2319 = isnan(_658);
    bool _2321 = _2317 || _2319;
    bool _2323 = isnan((*spvDescriptorSet0.vp_c9)._m0[132].w);
    bool _2325 = _2321 || _2323;
    float _2327 = float(_2325);
    float _2329 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].z;
    float _2331 = _1272 * _1326;
    out.m_73.x = _1216;
    int _2333 = _2269 ? as_type<int>(_2315) : as_type<int>(_2267);
    int _2335 = _2307 ? as_type<int>(_2315) : as_type<int>(_2267);
    float _2337 = fma(_1238, _1312, _2331);
    float _2339 = _2287 ? as_type<float>(_2333) : _2267;
    float _2341 = -(*spvDescriptorSet0.vp_c9)._m0[131].x;
    float _2343 = (*spvDescriptorSet0.vp_c9)._m0[132].x + _2341;
    int _2345 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 32;
    bool _2347 = _2345 != 0;
    float _2349 = -(*spvDescriptorSet0.vp_c9)._m0[132].x;
    float _2351 = _2349 + (*spvDescriptorSet0.vp_c9)._m0[133].x;
    int _2353 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _2355 = _2353 != 0;
    float _2357 = _2343 * _2283;
    bool _2359 = _658 >= (*spvDescriptorSet0.vp_c9)._m0[133].w;
    bool _2361 = isnan(_658);
    bool _2363 = _2359 || _2361;
    bool _2365 = isnan((*spvDescriptorSet0.vp_c9)._m0[133].w);
    bool _2367 = _2363 || _2365;
    float _2369 = float(_2367);
    float _2371 = _2351 * _2301;
    float _2373 = _2355 ? as_type<float>(_2335) : _2267;
    float _2375 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _2377 = _658 + _2375;
    bool _2379 = _2355;
    float _2381 = _2267;
    float _2383 = (*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _2385 = _2299;
    float _2387 = _2196;
    float _2389 = _2289;
    float _2391 = _2200;
    if (_2293)
    {
        bool _2393 = _692 > 0.5;
        _2379 = _2393;
    }
    bool _2395 = _2379;
    float _2397 = -_2369;
    float _2399 = _2397 + 1.0;
    float _2401 = in.m_75.x;
    float _2403 = in.m_75.y;
    float _2405 = in.m_75.z;
    float _2407 = fma(_2357, _2377, (*spvDescriptorSet0.vp_c9)._m0[131].x);
    bool _2409 = _658 >= (*spvDescriptorSet0.vp_c9)._m0[131].w;
    bool _2411 = isnan(_658);
    bool _2413 = _2409 || _2411;
    bool _2415 = isnan((*spvDescriptorSet0.vp_c9)._m0[131].w);
    bool _2417 = _2413 || _2415;
    float _2419 = float(_2417);
    float _2421 = _2327 * _2399;
    if (_2347)
    {
        float _2423 = _2273 ? _2315 : _2267;
        _2381 = _2423;
    }
    float _2425 = _2381;
    float _2427 = -_2327;
    float _2429 = _2427 + 1.0;
    bool _2431 = _1184 != 0.0;
    bool _2433 = isnan(_1184);
    bool _2435 = _2431 || _2433;
    bool _2437 = isnan(0.0);
    bool _2439 = _2435 || _2437;
    int _2441 = 0;
    if (_2297)
    {
        float _2443 = -_2289;
        float _2445 = _2443 + 1.0;
        _2441 = as_type<int>(_2445);
    }
    int _2447 = _2441;
    float _2449 = fma(_2371, _2311, (*spvDescriptorSet0.vp_c9)._m0[132].x);
    float _2451 = _2419 * _2429;
    bool _2453 = _1182 == 0.0;
    bool _2455 = !_2439;
    bool _2457 = _2453 && _2455;
    float _2459 = fma(_2299, _2425, -0.5);
    int _2461 = _2447;
    if (!_2297)
    {
        _2383 = _2289;
    }
    float _2463 = _2383;
    float _2465 = _2407 * _2451;
    bool _2467 = _1186 == 0.0;
    bool _2469 = _2467 && _2457;
    float _2471 = -_2419;
    float _2473 = _2471 + 1.0;
    float _2475 = _2463;
    float _2477 = _2465;
    float _2479 = _2473;
    if (_2297)
    {
        float _2481 = _2273 ? as_type<float>(_2447) : _2289;
        _2475 = _2481;
    }
    float _2483 = _2475;
    if (_2305)
    {
        float _2485 = -_2289;
        float _2487 = _2485 + 1.0;
        _2461 = as_type<int>(_2487);
    }
    int _2489 = _2461;
    if (!_2305)
    {
        _2385 = _2289;
    }
    float _2491 = _2385;
    float _2493 = in.m_77.x;
    float _2495 = in.m_77.y;
    float _2497 = in.m_77.z;
    float _2499 = in.m_77.w;
    int _2501 = 0;
    float _2503 = _2491;
    if (_2293)
    {
        float _2505 = -_2289;
        float _2507 = _2505 + 1.0;
        _2501 = as_type<int>(_2507);
    }
    int _2509 = _2501;
    float _2511 = as_type<float>(_2509);
    if (!_2293)
    {
        _2387 = _2289;
    }
    float _2513 = _2387;
    float _2515 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _2517 = _2513;
    if (_2305)
    {
        float _2519 = _2269 ? as_type<float>(_2489) : _2289;
        _2503 = _2519;
    }
    float _2521 = _2503;
    float _2523 = fma(_2473, (*spvDescriptorSet0.vp_c9)._m0[131].x, _2465);
    if (_2293)
    {
        float _2525 = _2395 ? as_type<float>(_2509) : _2289;
        _2517 = _2525;
    }
    float _2527 = _2517;
    float _2529 = -_966;
    float _2531 = fma(_962, _2459, _2529);
    if (_2469)
    {
        _2477 = _2403;
    }
    float _2533 = _2477;
    float _2535 = fma(_2449, _2421, _2523);
    float _2537 = _2533;
    if (_2469)
    {
        _2511 = _2401;
    }
    float _2539 = _2511;
    float _2541 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _2543 = _2539;
    if (_2469)
    {
        _2479 = _2533;
    }
    float _2545 = _2479;
    float _2547 = fma(_2369, (*spvDescriptorSet0.vp_c9)._m0[133].x, _2535);
    float _2549 = _2545;
    if (!_2469)
    {
        _2537 = _2403;
    }
    float _2551 = _2537;
    float _2553 = _2329 * (*spvDescriptorSet0.vp_c9)._m0[90].x;
    float _2555 = _2329;
    if (_2469)
    {
        _2389 = _2539;
    }
    float _2557 = _2389;
    float _2559 = _2547 * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    float _2561 = _2557;
    if (!_2469)
    {
        _2543 = _2401;
    }
    float _2563 = _2543;
    float _2565 = fma(_2553, _2521, -0.5);
    float _2567 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    float _2569 = 0.0;
    if (_2469)
    {
        _2569 = _2405;
    }
    float _2571 = _2569;
    float _2573 = _2339 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _2575 = fma(_972, _2565, _836);
    float _2577 = _2497 * _2563;
    float _2579 = _2571;
    if (_2469)
    {
        _2555 = _2571;
    }
    float _2581 = _2555;
    float _2583 = _2581;
    if (!_2469)
    {
        float _2585 = fma(_1184, (*spvDescriptorSet0.vp_c9)._m0[17].y, _2551);
        _2549 = _2585;
    }
    float _2587 = _2549;
    float _2589 = _2575 + 0.5;
    float _2591 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    if (!_2469)
    {
        _2579 = _2405;
    }
    float _2593 = _2579;
    float _2595 = _2373 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    float _2597 = _2527 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    if (!_2469)
    {
        float _2599 = fma(_1182, (*spvDescriptorSet0.vp_c9)._m0[17].y, _2563);
        _2561 = _2599;
    }
    float _2601 = _2561;
    float _2603 = _2493 * _2551;
    float _2605 = -_2577;
    float _2607 = fma(_2493, _2593, _2605);
    float _2609 = _2495 * _2593;
    float _2611 = abs(_1790);
    float _2613 = log2(_2611);
    float _2615 = _2595 * _2567;
    float _2617 = _2597 * _2515;
    if (!_2469)
    {
        float _2619 = fma(_1186, (*spvDescriptorSet0.vp_c9)._m0[17].y, _2593);
        _2583 = _2619;
    }
    float _2621 = _2583;
    float _2623 = -_2609;
    float _2625 = fma(_2497, _2551, _2623);
    float _2627 = _2483 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    float _2629 = -_2603;
    float _2631 = fma(_2495, _2563, _2629);
    float _2633 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _2635 = _2573 * _2541;
    float _2637 = _2627 * _2591;
    float _2639 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _2641 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _2643 = _2633 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2645 = _2613 * (*spvDescriptorSet0.vp_c15)._m0[654].z;
    out.m_79.x = _2617;
    out.m_79.y = _2635;
    out.m_79.z = _2637;
    out.m_79.w = _2615;
    float _2647 = _2639 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2649 = _2641 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2651 = _1250 * _1326;
    float _2653 = _1284 * _1326;
    float _2655 = exp2(_2645);
    float _2657 = _1272 * _1336;
    out.m_81.x = _2643;
    out.m_81.y = _2647;
    out.m_81.z = _2649;
    out.m_81.w = _2559;
    float _2659 = -_1248;
    float _2661 = fma(_2659, _1312, _2651);
    float _2663 = _2531 + 0.5;
    float _2665 = fma(_1238, _1308, _2657);
    float _2667 = fma(_1280, _1168, _2337);
    bool _2669 = _1790 <= 8000.0;
    bool _2671 = isnan(_1790);
    bool _2673 = _2669 || _2671;
    bool _2675 = isnan(8000.0);
    bool _2677 = _2673 || _2675;
    float _2679 = float(_2677);
    float _2681 = exp2(_2271);
    float _2683 = _1250 * _1332;
    float _2685 = _1250 * _1336;
    float _2687 = _1272 * _1332;
    float _2689 = _1284 * _1332;
    float _2691 = -_1248;
    float _2693 = fma(_2691, _1310, _2683);
    float _2695 = -_1248;
    float _2697 = fma(_2695, _1308, _2685);
    float _2699 = _1284 * _1336;
    float _2701 = fma(_1260, _1312, _2653);
    float _2703 = fma(_1232, _1138, _2693);
    float _2705 = fma(_1232, _1168, _2661);
    float _2707 = fma(_1260, _1308, _2699);
    float _2709 = fma(_1232, _1144, _2697);
    float _2711 = _2607 * _2499;
    float _2713 = fma(_1274, _1168, _2701);
    out.m_83.x = _2589;
    out.m_83.y = _2663;
    float _2715 = fma(_1238, _1310, _2687);
    float _2717 = fma(_1280, _1144, _2665);
    float _2719 = fma(_1274, _1144, _2707);
    float _2721 = _2703 * _2495;
    float _2723 = _2705 * _2495;
    float _2725 = _2709 * _2495;
    float _2727 = _2711 * _2703;
    float _2729 = _2711 * _2705;
    float _2731 = fma(_2655, (*spvDescriptorSet0.vp_c15)._m0[654].x, (*spvDescriptorSet0.vp_c15)._m0[654].y);
    float _2733 = precise::clamp(_2731, 0.0, 1.0);
    float _2735 = _2709 * _2587;
    float _2737 = _2711 * _2709;
    float _2739 = fma(_1280, _1138, _2715);
    float _2741 = _2703 * _2587;
    float _2743 = _2625 * _2499;
    float _2745 = _2705 * _2587;
    float _2747 = fma(_2733, -2.0, 3.0);
    float _2749 = _2733 * _2733;
    float _2751 = _2144 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _2753 = fma(_2739, _2601, _2741);
    float _2755 = fma(_2743, _2739, _2727);
    float _2757 = _2749 * _2747;
    float _2759 = fma(_2667, _2601, _2745);
    float _2761 = fma(_2667, _2493, _2723);
    float _2763 = fma(_2743, _2667, _2729);
    float _2765 = fma(_2152, (*spvDescriptorSet0.vp_c8)._m0[6].x, _2751);
    float _2767 = fma(_2743, _2717, _2737);
    float _2769 = -_2757;
    float _2771 = _2769 + 1.0;
    float _2773 = _2631 * _2499;
    float _2775 = fma(_2717, _2601, _2735);
    float _2777 = fma(_1260, _1310, _2689);
    float _2779 = fma(_2771, (*spvDescriptorSet0.vp_c15)._m0[654].w, _2757);
    float _2781 = fma(_2773, _2719, _2767);
    float _2783 = fma(_2739, _2493, _2721);
    float _2785 = in.m_85.x;
    float _2787 = fma(_1274, _1138, _2777);
    float _2789 = fma(_2717, _2493, _2725);
    float _2791 = _2679 * _2779;
    float _2793 = fma(_2773, _2713, _2763);
    float _2795 = fma(_2773, _2787, _2755);
    float _2797 = -_2681;
    float _2799 = _2797 + 1.0;
    float _2801 = _2791 * (*spvDescriptorSet0.vp_c15)._m0[653].x;
    float _2803 = fma(_2102, (*spvDescriptorSet0.vp_c8)._m0[6].z, _2765);
    float _2805 = _2178 * 0.5;
    out.m_87.x = _2795;
    out.m_87.y = _2793;
    out.m_87.z = _2781;
    float _2807 = _2200 + _2178;
    float _2809 = fma(_2168, (*spvDescriptorSet0.vp_c8)._m0[6].w, _2803);
    float _2811 = fma(_2787, _2497, _2783);
    float _2813 = fma(_2202, -0.5, _2805);
    float _2815 = fma(_2787, _2621, _2753);
    float _2817 = _2809 + _2178;
    float _2819 = fma(_2713, _2497, _2761);
    float _2821 = fma(_2713, _2621, _2759);
    float _2823 = fma(_2719, _2621, _2775);
    float _2825 = fma(_2719, _2497, _2789);
    float _2827 = _2799 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _2829 = _2817 * 0.5;
    float _2831 = _2807 * 0.5;
    out.m_89.x = _2811;
    out.m_89.y = _2819;
    out.m_89.z = _2825;
    bool _2833 = _1928 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _2835 = isnan(_1928);
    bool _2837 = _2833 || _2835;
    bool _2839 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _2841 = _2837 || _2839;
    out.m_91.x = _2831;
    out.m_91.y = _2813;
    out.m_91.z = _2829;
    out.m_91.w = _2178;
    out.m_93.x = _2815;
    out.m_93.y = _2821;
    out.m_93.z = _2823;
    out.m_95.x = _1778;
    out.m_95.y = _1776;
    out.m_95.z = _1780;
    float _2843 = _2789;
    float _2845 = _2781;
    float _2847 = (*spvDescriptorSet0.vp_c15)._m0[653].y;
    if (!_2841)
    {
        _2843 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _2849 = _2843;
    out.gl_Position.x = _2200;
    out.gl_Position.y = _2202;
    out.gl_Position.z = _2809;
    out.gl_Position.w = _2178;
    float _2851 = _2849;
    float _2853 = _2849;
    if (!_2841)
    {
        _2845 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _2855 = _2845;
    float _2857 = _2855;
    float _2859 = _2855;
    if (!_2841)
    {
        _2391 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _2861 = _2391;
    float _2863 = -_2212;
    float _2865 = _2863 + 1.0;
    float _2867 = _2865 * _2801;
    float _2869 = precise::clamp(_2867, 0.0, 1.0);
    float _2871 = -_2869;
    float _2873 = fma(_2871, (*spvDescriptorSet0.vp_c15)._m0[653].y, 1.0);
    float _2875 = _2785;
    float _2877 = _2861;
    float _2879 = _2861;
    if (!_2841)
    {
        _2847 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _2881 = _2847;
    float _2883 = _2873 * _2785;
    float _2885 = _2881;
    float _2887 = _2881;
    if (!_2841)
    {
        _2875 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _2889 = _2875;
    float _2891 = _2883 * (*spvDescriptorSet0.vp_c13)._m0[1].w;
    float _2893 = _2827 * _2240;
    float _2895 = -_2827;
    float _2897 = _2895 + 1.0;
    out.m_97.x = _2891;
    float _2899 = _2251 * _2893;
    float _2901 = _2261 * _2893;
    float _2903 = _2251 * _2897;
    float _2905 = _1846 * _1906;
    float _2907 = fma(_2257, _2899, _2245);
    float _2909 = fma(_2259, _2899, _2247);
    float _2911 = fma(_2251, _2901, _2249);
    float _2913 = _2905 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _2915 = _2905;
    float _2917 = _2889;
    float _2919 = _2889;
    if (!_2841)
    {
        _2915 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _2921 = _2915;
    out.m_99.x = _2907;
    out.m_99.y = _2909;
    out.m_99.z = _2911;
    out.m_99.w = _2903;
    bool _2923 = !_2841;
    float _2925 = _2921;
    float _2927 = _2921;
    if (!_2923)
    {
        bool _2929 = _1928 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _2931 = isnan(_1928);
        bool _2933 = _2929 || _2931;
        bool _2935 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _2937 = _2933 || _2935;
        if (!_2937)
        {
            float _2939 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2941 = _1928 + _2939;
            float _2943 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2945 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _2943;
            float _2947 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _2949 = _2947 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _2951 = 1.0 / _2945;
            float _2953 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _2955 = _2953 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _2957 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _2959 = _2957 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _2961 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _2963 = _2961 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _2965 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _2967 = _2965 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _2969 = _2941 * _2951;
            float _2971 = precise::clamp(_2969, 0.0, 1.0);
            float _2973 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _2975 = _2973 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _2977 = fma(_2971, _2949, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _2979 = fma(_2971, _2975, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _2981 = fma(_2971, _2955, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _2983 = fma(_2971, _2959, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _2985 = fma(_2971, _2963, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _2987 = fma(_2971, _2967, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            _2879 = _2981;
            _2887 = _2985;
            _2853 = _2977;
            _2859 = _2983;
            _2919 = _2979;
            _2927 = _2987;
            _2989 = true;
        }
        else
        {
            bool _2991 = _1928 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _2993 = isnan(_1928);
            bool _2995 = _2991 || _2993;
            bool _2997 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _2999 = _2995 || _2997;
            if (!_2999)
            {
                _2851 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _3001 = _2851;
            _2853 = _3001;
            if (!_2999)
            {
                _2877 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _3003 = _2877;
            _2879 = _3003;
            if (!_2999)
            {
                _2917 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _3005 = _2917;
            _2919 = _3005;
            if (!_2999)
            {
                _2857 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _3007 = _2857;
            _2859 = _3007;
            if (!_2999)
            {
                _2885 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _3009 = _2885;
            _2887 = _3009;
            if (!_2999)
            {
                _2925 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _3011 = _2925;
            bool _3013 = !_2999;
            _2927 = _3011;
            if (!_3013)
            {
                bool _3015 = _1928 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _3017 = isnan(_1928);
                bool _3019 = _3015 || _3017;
                bool _3021 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _3023 = _3019 || _3021;
                if (!_3023)
                {
                    float _3025 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _3027 = _1928 + _3025;
                    float _3029 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _3031 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _3029;
                    float _3033 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _3035 = _3033 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _3037 = 1.0 / _3031;
                    float _3039 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _3041 = _3039 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _3043 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _3045 = _3043 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _3047 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _3049 = _3047 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _3051 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _3053 = _3051 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _3055 = _3027 * _3037;
                    float _3057 = precise::clamp(_3055, 0.0, 1.0);
                    float _3059 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _3061 = _3059 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _3063 = fma(_3057, _3035, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _3065 = fma(_3057, _3061, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _3067 = fma(_3057, _3041, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _3069 = fma(_3057, _3045, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _3071 = fma(_3057, _3049, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _3073 = fma(_3057, _3053, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    _2879 = _3067;
                    _2887 = _3071;
                    _2853 = _3063;
                    _2859 = _3069;
                    _2919 = _3065;
                    _2927 = _3073;
                    _2989 = true;
                }
                else
                {
                    _2879 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _2887 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _2853 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _2859 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _2919 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _2927 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _2989 = false;
    float _3075 = _2879;
    float _3077 = _2887;
    float _3079 = _2853;
    float _3081 = _2859;
    float _3083 = _2919;
    float _3085 = _2927;
    float _3087 = fma(_2821, -0.5, 0.5);
    float _3089 = precise::clamp(_3087, 0.0, 1.0);
    float _3091 = -_3075;
    float _3093 = _3091 + _3077;
    float _3095 = _2913 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _3097 = -_3079;
    float _3099 = _3097 + _3081;
    float _3101 = fma(_3089, _3093, _3075);
    out.m_101.x = 0.0;
    float _3103 = -_3083;
    float _3105 = _3103 + _3085;
    float _3107 = fma(_3089, _3099, _3079);
    float _3109 = _3101 * 0.586610972881317138671875;
    out.m_49.x = _3095;
    bool _3111 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _3113 = fma(_3089, _3105, _3083);
    float _3115 = fma(_3107, 0.298911988735198974609375, _3109);
    bool _3117 = _1846 > 0.0;
    bool _3119 = isnan(_1846);
    bool _3121 = _3117 || _3119;
    bool _3123 = isnan(0.0);
    bool _3125 = _3121 || _3123;
    float _3127 = fma(_3113, 0.114477999508380889892578125, _3115);
    bool _3129 = _1906 <= 0.0;
    bool _3131 = !_3125;
    bool _3133 = _3129 || _3131;
    float _3135 = -_3127;
    float _3137 = _3107 + _3135;
    float _3139 = -_3127;
    float _3141 = _3101 + _3139;
    float _3143 = -_3127;
    float _3145 = _3113 + _3143;
    float _3147 = fma(_3137, (*spvDescriptorSet0.vp_c13)._m0[1].z, _3127);
    float _3149 = fma(_3141, (*spvDescriptorSet0.vp_c13)._m0[1].z, _3127);
    float _3151 = fma(_3145, (*spvDescriptorSet0.vp_c13)._m0[1].z, _3127);
    bool _3153 = !_3111;
    if (!_3153)
    {
        float _3155 = -_1776;
        float _3157 = _3155 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
        float _3159 = -_1778;
        float _3161 = _3159 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
        float _3163 = -_1780;
        float _3165 = _3163 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
        float _3167 = _3157 * _3157;
        float _3169 = fma(_3161, _3161, _3167);
        float _3171 = fma(_3165, _3165, _3169);
        float _3173 = sqrt(_3171);
        float _3175 = rsqrt(_3171);
        float _3177 = -_3173;
        float _3179 = _3177 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
        float _3181 = _3179 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
        float _3183 = precise::clamp(_3181, 0.0, 1.0);
        float _3185 = _3161 * _3175;
        float _3187 = _3157 * _3175;
        float _3189 = abs(_3183);
        float _3191 = log2(_3189);
        float _3193 = _3165 * _3175;
        float _3195 = _3185 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
        float _3197 = _2821 * _3187;
        float _3199 = -_3187;
        float _3201 = -_3195;
        float _3203 = fma(_3199, (*spvDescriptorSet0.vp_c15)._m0[656].y, _3201);
        float _3205 = fma(_2815, _3185, _3197);
        float _3207 = -_3193;
        float _3209 = fma(_3207, (*spvDescriptorSet0.vp_c15)._m0[656].z, _3203);
        float _3211 = fma(_2823, _3193, _3205);
        float _3213 = precise::clamp(_3211, 0.0, 1.0);
        float _3215 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
        float _3217 = _3209 + _3215;
        float _3219 = _3191 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
        float _3221 = _3217 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
        float _3223 = precise::clamp(_3221, 0.0, 1.0);
        float _3225 = exp2(_3219);
        float _3227 = _3225 * _3223;
        float _3229 = _3213 * _3227;
        float _3231 = _3229 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
        float _3233 = _3229 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
        float _3235 = _3229 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
        out.m_101.x = _3231;
        out.m_101.y = _3233;
        out.m_101.z = _3235;
    }
    out.m_69.x = _3147;
    out.m_69.y = _3149;
    out.m_69.z = _3151;
    if (!_3133)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_67.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_67.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_67.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_67.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_81.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_81.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_81.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_81.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_101.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_101.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_101.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_101.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_97.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_97.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_97.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_97.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_99.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_99.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_99.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_99.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_69.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_69.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_69.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_69.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_53.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_53.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_53.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_53.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_73.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_73.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_73.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_73.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_79.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_79.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_79.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_79.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_83.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_83.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_83.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_83.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_71.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_71.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_71.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_71.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_91.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_91.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_91.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_91.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_49.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_49.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_49.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_49.w)); dm_cw(dm_gs, dm_p, 68, as_type<uint>(out.m_87.x)); dm_cw(dm_gs, dm_p, 69, as_type<uint>(out.m_87.y)); dm_cw(dm_gs, dm_p, 70, as_type<uint>(out.m_87.z)); dm_cw(dm_gs, dm_p, 71, as_type<uint>(out.m_87.w)); dm_cw(dm_gs, dm_p, 72, as_type<uint>(out.m_93.x)); dm_cw(dm_gs, dm_p, 73, as_type<uint>(out.m_93.y)); dm_cw(dm_gs, dm_p, 74, as_type<uint>(out.m_93.z)); dm_cw(dm_gs, dm_p, 75, as_type<uint>(out.m_93.w)); dm_cw(dm_gs, dm_p, 76, as_type<uint>(out.m_95.x)); dm_cw(dm_gs, dm_p, 77, as_type<uint>(out.m_95.y)); dm_cw(dm_gs, dm_p, 78, as_type<uint>(out.m_95.z)); dm_cw(dm_gs, dm_p, 79, as_type<uint>(out.m_95.w)); dm_cw(dm_gs, dm_p, 80, as_type<uint>(out.m_89.x)); dm_cw(dm_gs, dm_p, 81, as_type<uint>(out.m_89.y)); dm_cw(dm_gs, dm_p, 82, as_type<uint>(out.m_89.z)); dm_cw(dm_gs, dm_p, 83, as_type<uint>(out.m_89.w)); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    out.m_49.x = 0.0;
    float _3237 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _3237;
    { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_67.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_67.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_67.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_67.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_81.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_81.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_81.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_81.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_101.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_101.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_101.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_101.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_97.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_97.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_97.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_97.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_99.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_99.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_99.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_99.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_69.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_69.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_69.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_69.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_53.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_53.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_53.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_53.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_73.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_73.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_73.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_73.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_79.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_79.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_79.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_79.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_83.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_83.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_83.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_83.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_71.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_71.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_71.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_71.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_91.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_91.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_91.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_91.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_49.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_49.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_49.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_49.w)); dm_cw(dm_gs, dm_p, 68, as_type<uint>(out.m_87.x)); dm_cw(dm_gs, dm_p, 69, as_type<uint>(out.m_87.y)); dm_cw(dm_gs, dm_p, 70, as_type<uint>(out.m_87.z)); dm_cw(dm_gs, dm_p, 71, as_type<uint>(out.m_87.w)); dm_cw(dm_gs, dm_p, 72, as_type<uint>(out.m_93.x)); dm_cw(dm_gs, dm_p, 73, as_type<uint>(out.m_93.y)); dm_cw(dm_gs, dm_p, 74, as_type<uint>(out.m_93.z)); dm_cw(dm_gs, dm_p, 75, as_type<uint>(out.m_93.w)); dm_cw(dm_gs, dm_p, 76, as_type<uint>(out.m_95.x)); dm_cw(dm_gs, dm_p, 77, as_type<uint>(out.m_95.y)); dm_cw(dm_gs, dm_p, 78, as_type<uint>(out.m_95.z)); dm_cw(dm_gs, dm_p, 79, as_type<uint>(out.m_95.w)); dm_cw(dm_gs, dm_p, 80, as_type<uint>(out.m_89.x)); dm_cw(dm_gs, dm_p, 81, as_type<uint>(out.m_89.y)); dm_cw(dm_gs, dm_p, 82, as_type<uint>(out.m_89.z)); dm_cw(dm_gs, dm_p, 83, as_type<uint>(out.m_89.w)); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
}

