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
    constant _16* vp_c10 [[id(1)]];
    constant _16* vp_c8 [[id(2)]];
    constant _16* vp_c15 [[id(3)]];
    constant _16* vp_c7 [[id(4)]];
    texture3d<float> vp_t_tcb_32 [[id(5)]];
    sampler vp_t_tcb_32Smplr [[id(6)]];
    texture3d<float> vp_t_tcb_30 [[id(7)]];
    sampler vp_t_tcb_30Smplr [[id(8)]];
    texture2d<float> vp_t_tcb_1C [[id(9)]];
    sampler vp_t_tcb_1CSmplr [[id(10)]];
    sampler vp_t_tcb_32Smplr_w [[id(11)]];
    sampler vp_t_tcb_30Smplr_w [[id(12)]];
    sampler vp_t_tcb_1CSmplr_w [[id(13)]];
    constant dm_border_t* dm_border [[id(14)]];
};

struct main0_out
{
    float4 m_61 [[user(locn0)]];
    float4 m_67 [[user(locn1)]];
    float4 m_49 [[user(locn2)]];
    float4 m_71 [[user(locn3)]];
    float4 m_65 [[user(locn4)]];
    float4 m_47 [[user(locn5)]];
    float4 m_73 [[user(locn6)]];
    float4 m_69 [[user(locn7)]];
    float4 m_75 [[user(locn9)]];
    float4 gl_Position [[position, invariant]];
    float gl_PointSize [[point_size]];
};

struct main0_in
{
    float4 m_57 [[attribute(1)]];
    float4 m_51 [[attribute(2)]];
    float4 m_42 [[attribute(3)]];
    float4 m_44 [[attribute(4)]];
    float4 m_59 [[attribute(6)]];
    float4 m_53 [[attribute(7)]];
    float4 m_55 [[attribute(8)]];
    float4 m_63 [[attribute(10)]];
};

vertex main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]])
{
    main0_out out = {};
    out.m_61 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_67 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_49 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_71 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_65 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_47 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_73 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_69 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_75 = float4(0.0, 0.0, 0.0, 1.0);
    bool _954 = false;
    bool _738 = false;
    bool _640 = false;
    bool _412 = false;
    bool _196 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _89 = in.m_42.w;
    float _91 = in.m_44.w;
    float _93 = trunc(_89);
    int _96 = int(_93);
    float _98 = -_91;
    float _100 = _98 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    out.m_47.y = _100;
    bool _104 = _96 >= 1;
    float _106 = 0.0;
    float _108 = _91;
    float _110 = _100;
    if (!_104)
    {
        _106 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _112 = _106;
    if (!_104)
    {
        out.m_49.x = 0.0;
    }
    int _114 = 0;
    if (!_104)
    {
        float _116 = _112 * 5.0;
        _114 = as_type<int>(_116);
    }
    int _118 = _114;
    int _120 = _118;
    if (!_104)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _3172 = as_type<float>(_118);
        out.gl_Position.z = _3172;
    }
    if (!_104)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    bool _122 = _91 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _124 = isnan(_91);
    bool _126 = _122 || _124;
    bool _128 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _130 = _126 || _128;
    float _132 = float(_96);
    bool _134 = _100 >= _132;
    bool _136 = !_130;
    bool _138 = _134 || _136;
    if (_138)
    {
        _108 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _140 = _108;
    if (_138)
    {
        out.m_49.x = 0.0;
    }
    if (_138)
    {
        float _142 = _140 * 5.0;
        _120 = as_type<int>(_142);
    }
    int _144 = _120;
    if (_138)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _3227 = as_type<float>(_144);
        out.gl_Position.z = _3227;
    }
    if (_138)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _146 = in.m_51.x;
    float _148 = in.m_51.y;
    float _150 = in.m_51.z;
    float _152 = 1.0 / _132;
    bool _154 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _156 = _100 * _152;
    float _158 = _148 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _160 = _148 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _162 = _148 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _164 = fma(_146, (*spvDescriptorSet0.vp_c10)._m0[4].x, _158);
    float _166 = fma(_146, (*spvDescriptorSet0.vp_c10)._m0[5].x, _160);
    float _168 = fma(_146, (*spvDescriptorSet0.vp_c10)._m0[6].x, _162);
    float _170 = fma(_150, (*spvDescriptorSet0.vp_c10)._m0[4].z, _164);
    float _172 = fma(_150, (*spvDescriptorSet0.vp_c10)._m0[5].z, _166);
    float _174 = fma(_150, (*spvDescriptorSet0.vp_c10)._m0[6].z, _168);
    bool _176 = !_154;
    float _194;
    if (!_176)
    {
        float _178 = in.m_53.x;
        float _180 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _182 = _178 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _184 = fma(_182, (*spvDescriptorSet0.vp_c9)._m0[12].x, _100);
        float _186 = _184 * _180;
        float _188 = floor(_186);
        float _190 = -_188;
        float _192 = _186 + _190;
        _194 = _192;
        _196 = true;
    }
    else
    {
        _194 = _156;
    }
    _196 = false;
    float _198 = _194;
    float _200 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _202 = _198 + _200;
    float _204 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _206 = _198 + _204;
    bool _208 = _198 >= (*spvDescriptorSet0.vp_c9)._m0[146].w;
    bool _210 = isnan(_198);
    bool _212 = _208 || _210;
    bool _214 = isnan((*spvDescriptorSet0.vp_c9)._m0[146].w);
    bool _216 = _212 || _214;
    float _218 = float(_216);
    float _220 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _222 = (*spvDescriptorSet0.vp_c9)._m0[146].w + _220;
    float _224 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _226 = _198 + _224;
    float _228 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _230 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _228;
    float _232 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _234 = _232 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _236 = 1.0 / _222;
    bool _238 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].x;
    float _240 = 1.0 / _234;
    float _242 = 1.0 / _230;
    float _244 = _202 * _236;
    bool _246 = _198 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _248 = isnan(_198);
    bool _250 = _246 || _248;
    bool _252 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _254 = _250 || _252;
    float _256 = float(_254);
    float _258 = -_218;
    float _260 = _258 + 1.0;
    float _262 = _256 * _260;
    float _264 = _206 * _240;
    bool _266 = _198 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _268 = isnan(_198);
    bool _270 = _266 || _268;
    bool _272 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _274 = _270 || _272;
    float _276 = float(_274);
    float _278 = -(*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _280 = (*spvDescriptorSet0.vp_c9)._m0[144].z + _278;
    bool _282 = _198 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _284 = isnan(_198);
    bool _286 = _282 || _284;
    bool _288 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _290 = _286 || _288;
    float _292 = float(_290);
    float _294 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _296 = _294 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _298 = -_256;
    float _300 = _298 + 1.0;
    float _302 = -_276;
    float _304 = _302 + 1.0;
    float _306 = _226 * _242;
    float _308 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _310 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _308;
    float _312 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _314 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _312;
    float _316 = _292 * _304;
    float _318 = fma(_280, _306, (*spvDescriptorSet0.vp_c9)._m0[143].z);
    float _320 = fma(_310, _306, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _322 = fma(_314, _306, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _324 = _276 * _300;
    float _326 = -(*spvDescriptorSet0.vp_c9)._m0[144].z;
    float _328 = _326 + (*spvDescriptorSet0.vp_c9)._m0[145].z;
    float _330 = _320 * _316;
    float _332 = _322 * _316;
    float _334 = _318 * _316;
    float _336 = -_292;
    float _338 = _336 + 1.0;
    float _340 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _342 = _340 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _344 = fma(_338, (*spvDescriptorSet0.vp_c9)._m0[143].x, _332);
    float _346 = fma(_338, (*spvDescriptorSet0.vp_c9)._m0[143].y, _330);
    float _348 = fma(_338, (*spvDescriptorSet0.vp_c9)._m0[143].z, _334);
    float _350 = -(*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _352 = (*spvDescriptorSet0.vp_c9)._m0[146].x + _350;
    float _354 = fma(_296, _264, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _356 = fma(_342, _264, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _358 = fma(_328, _264, (*spvDescriptorSet0.vp_c9)._m0[144].z);
    float _360 = -(*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _362 = (*spvDescriptorSet0.vp_c9)._m0[146].y + _360;
    float _364 = -(*spvDescriptorSet0.vp_c9)._m0[145].z;
    float _366 = (*spvDescriptorSet0.vp_c9)._m0[146].z + _364;
    float _368 = fma(_354, _324, _344);
    float _370 = fma(_352, _244, (*spvDescriptorSet0.vp_c9)._m0[145].x);
    float _372 = fma(_362, _244, (*spvDescriptorSet0.vp_c9)._m0[145].y);
    float _374 = fma(_366, _244, (*spvDescriptorSet0.vp_c9)._m0[145].z);
    float _376 = fma(_356, _324, _346);
    float _378 = fma(_358, _324, _348);
    float _380 = fma(_370, _262, _368);
    float _382 = fma(_372, _262, _376);
    float _384 = fma(_374, _262, _378);
    float _386 = fma(_218, (*spvDescriptorSet0.vp_c9)._m0[146].x, _380);
    float _388 = fma(_218, (*spvDescriptorSet0.vp_c9)._m0[146].y, _382);
    float _390 = fma(_218, (*spvDescriptorSet0.vp_c9)._m0[146].z, _384);
    bool _392 = !_238;
    float _410;
    if (!_392)
    {
        float _394 = in.m_53.x;
        float _396 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].x;
        float _398 = _394 * (*spvDescriptorSet0.vp_c9)._m0[12].y;
        float _400 = fma(_398, (*spvDescriptorSet0.vp_c9)._m0[11].x, _100);
        float _402 = _400 * _396;
        float _404 = floor(_402);
        float _406 = -_404;
        float _408 = _402 + _406;
        _410 = _408;
        _412 = true;
    }
    else
    {
        _410 = _156;
    }
    _412 = false;
    float _414 = _410;
    float _416 = in.m_55.x;
    float _418 = in.m_55.y;
    float _420 = in.m_55.z;
    float _422 = -(*spvDescriptorSet0.vp_c9)._m0[109].w;
    float _424 = _414 + _422;
    float _426 = -(*spvDescriptorSet0.vp_c9)._m0[108].w;
    float _428 = _414 + _426;
    float _430 = -(*spvDescriptorSet0.vp_c9)._m0[109].w;
    float _432 = (*spvDescriptorSet0.vp_c9)._m0[110].w + _430;
    float _434 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _436 = (*spvDescriptorSet0.vp_c9)._m0[108].w + _434;
    float _438 = -(*spvDescriptorSet0.vp_c9)._m0[108].w;
    float _440 = _438 + (*spvDescriptorSet0.vp_c9)._m0[109].w;
    float _442 = 1.0 / _432;
    bool _444 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _446 = 1.0 / _440;
    float _448 = _388 * _418;
    bool _450 = _414 >= (*spvDescriptorSet0.vp_c9)._m0[110].w;
    bool _452 = isnan(_414);
    bool _454 = _450 || _452;
    bool _456 = isnan((*spvDescriptorSet0.vp_c9)._m0[110].w);
    bool _458 = _454 || _456;
    float _460 = float(_458);
    float _462 = _390 * _420;
    float _464 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _466 = _414 + _464;
    float _468 = 1.0 / _436;
    float _470 = _424 * _442;
    bool _472 = _414 >= (*spvDescriptorSet0.vp_c9)._m0[109].w;
    bool _474 = isnan(_414);
    bool _476 = _472 || _474;
    bool _478 = isnan((*spvDescriptorSet0.vp_c9)._m0[109].w);
    bool _480 = _476 || _478;
    float _482 = float(_480);
    float _484 = -_460;
    float _486 = _484 + 1.0;
    float _488 = _386 * _416;
    float _490 = _482 * _486;
    float _492 = _428 * _446;
    bool _494 = _414 >= (*spvDescriptorSet0.vp_c9)._m0[108].w;
    bool _496 = isnan(_414);
    bool _498 = _494 || _496;
    bool _500 = isnan((*spvDescriptorSet0.vp_c9)._m0[108].w);
    bool _502 = _498 || _500;
    float _504 = float(_502);
    float _506 = -(*spvDescriptorSet0.vp_c9)._m0[107].z;
    float _508 = (*spvDescriptorSet0.vp_c9)._m0[108].z + _506;
    bool _510 = _414 >= (*spvDescriptorSet0.vp_c9)._m0[107].w;
    bool _512 = isnan(_414);
    bool _514 = _510 || _512;
    bool _516 = isnan((*spvDescriptorSet0.vp_c9)._m0[107].w);
    bool _518 = _514 || _516;
    float _520 = float(_518);
    float _522 = -(*spvDescriptorSet0.vp_c9)._m0[108].x;
    float _524 = _522 + (*spvDescriptorSet0.vp_c9)._m0[109].x;
    float _526 = -_482;
    float _528 = _526 + 1.0;
    float _530 = -_504;
    float _532 = _530 + 1.0;
    float _534 = _466 * _468;
    float _536 = -(*spvDescriptorSet0.vp_c9)._m0[107].y;
    float _538 = (*spvDescriptorSet0.vp_c9)._m0[108].y + _536;
    float _540 = -(*spvDescriptorSet0.vp_c9)._m0[107].x;
    float _542 = (*spvDescriptorSet0.vp_c9)._m0[108].x + _540;
    float _544 = _520 * _532;
    float _546 = fma(_508, _534, (*spvDescriptorSet0.vp_c9)._m0[107].z);
    float _548 = fma(_538, _534, (*spvDescriptorSet0.vp_c9)._m0[107].y);
    float _550 = fma(_542, _534, (*spvDescriptorSet0.vp_c9)._m0[107].x);
    float _552 = _504 * _528;
    float _554 = -(*spvDescriptorSet0.vp_c9)._m0[108].y;
    float _556 = _554 + (*spvDescriptorSet0.vp_c9)._m0[109].y;
    float _558 = _548 * _544;
    float _560 = -(*spvDescriptorSet0.vp_c9)._m0[108].z;
    float _562 = _560 + (*spvDescriptorSet0.vp_c9)._m0[109].z;
    float _564 = _550 * _544;
    float _566 = -_520;
    float _568 = _566 + 1.0;
    float _570 = _546 * _544;
    float _572 = fma(_568, (*spvDescriptorSet0.vp_c9)._m0[107].x, _564);
    float _574 = fma(_568, (*spvDescriptorSet0.vp_c9)._m0[107].y, _558);
    float _576 = fma(_568, (*spvDescriptorSet0.vp_c9)._m0[107].z, _570);
    float _578 = -(*spvDescriptorSet0.vp_c9)._m0[109].x;
    float _580 = (*spvDescriptorSet0.vp_c9)._m0[110].x + _578;
    float _582 = fma(_524, _492, (*spvDescriptorSet0.vp_c9)._m0[108].x);
    float _584 = fma(_556, _492, (*spvDescriptorSet0.vp_c9)._m0[108].y);
    float _586 = fma(_562, _492, (*spvDescriptorSet0.vp_c9)._m0[108].z);
    float _588 = -(*spvDescriptorSet0.vp_c9)._m0[109].y;
    float _590 = (*spvDescriptorSet0.vp_c9)._m0[110].y + _588;
    float _592 = -(*spvDescriptorSet0.vp_c9)._m0[109].z;
    float _594 = (*spvDescriptorSet0.vp_c9)._m0[110].z + _592;
    float _596 = fma(_582, _552, _572);
    float _598 = fma(_580, _470, (*spvDescriptorSet0.vp_c9)._m0[109].x);
    float _600 = fma(_590, _470, (*spvDescriptorSet0.vp_c9)._m0[109].y);
    float _602 = fma(_594, _470, (*spvDescriptorSet0.vp_c9)._m0[109].z);
    float _604 = fma(_584, _552, _574);
    float _606 = fma(_586, _552, _576);
    float _608 = fma(_598, _490, _596);
    float _610 = fma(_600, _490, _604);
    float _612 = fma(_602, _490, _606);
    float _614 = fma(_460, (*spvDescriptorSet0.vp_c9)._m0[110].x, _608);
    float _616 = fma(_460, (*spvDescriptorSet0.vp_c9)._m0[110].y, _610);
    float _618 = fma(_460, (*spvDescriptorSet0.vp_c9)._m0[110].z, _612);
    bool _620 = !_444;
    float _638;
    if (!_620)
    {
        float _622 = in.m_53.x;
        float _624 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _626 = _622 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _628 = fma(_626, (*spvDescriptorSet0.vp_c9)._m0[11].y, _100);
        float _630 = _628 * _624;
        float _632 = floor(_630);
        float _634 = -_632;
        float _636 = _630 + _634;
        _638 = _636;
        _640 = true;
    }
    else
    {
        _638 = _156;
    }
    _640 = false;
    float _642 = _638;
    bool _644 = _642 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _646 = isnan(_642);
    bool _648 = _644 || _646;
    bool _650 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _652 = _648 || _650;
    float _654 = float(_652);
    float _656 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _658 = _656 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _660 = _642 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _662 = isnan(_642);
    bool _664 = _660 || _662;
    bool _666 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _668 = _664 || _666;
    float _670 = float(_668);
    float _672 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _674 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _672;
    float _676 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _678 = _642 + _676;
    float _680 = -_654;
    float _682 = _680 + 1.0;
    bool _684 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].z;
    float _686 = 1.0 / _658;
    float _688 = _670 * _682;
    float _690 = -_670;
    float _692 = _690 + 1.0;
    float _694 = _674 * _686;
    float _696 = _616 * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _698 = fma(_694, _678, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _700 = _614 * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _702 = _698 * _688;
    float _704 = _618 * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _706 = fma(_692, (*spvDescriptorSet0.vp_c9)._m0[115].x, _702);
    float _708 = _700 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _710 = _696 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _712 = _704 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _714 = fma(_654, (*spvDescriptorSet0.vp_c9)._m0[116].x, _706);
    float _716 = _714 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    bool _718 = !_684;
    float _736;
    if (!_718)
    {
        float _720 = in.m_53.x;
        float _722 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].z;
        float _724 = _720 * (*spvDescriptorSet0.vp_c9)._m0[12].w;
        float _726 = fma(_724, (*spvDescriptorSet0.vp_c9)._m0[11].z, _100);
        float _728 = _726 * _722;
        float _730 = floor(_728);
        float _732 = -_730;
        float _734 = _728 + _732;
        _736 = _734;
        _738 = true;
    }
    else
    {
        _736 = _156;
    }
    _738 = false;
    float _740 = _736;
    float _742 = -(*spvDescriptorSet0.vp_c9)._m0[125].w;
    float _744 = _740 + _742;
    float _746 = -(*spvDescriptorSet0.vp_c9)._m0[124].w;
    float _748 = _740 + _746;
    bool _750 = _740 >= (*spvDescriptorSet0.vp_c9)._m0[126].w;
    bool _752 = isnan(_740);
    bool _754 = _750 || _752;
    bool _756 = isnan((*spvDescriptorSet0.vp_c9)._m0[126].w);
    bool _758 = _754 || _756;
    float _760 = float(_758);
    float _762 = -(*spvDescriptorSet0.vp_c9)._m0[125].w;
    float _764 = (*spvDescriptorSet0.vp_c9)._m0[126].w + _762;
    float _766 = -(*spvDescriptorSet0.vp_c9)._m0[123].w;
    float _768 = _740 + _766;
    float _770 = -(*spvDescriptorSet0.vp_c9)._m0[123].w;
    float _772 = (*spvDescriptorSet0.vp_c9)._m0[124].w + _770;
    float _774 = -(*spvDescriptorSet0.vp_c9)._m0[124].w;
    float _776 = _774 + (*spvDescriptorSet0.vp_c9)._m0[125].w;
    float _778 = 1.0 / _764;
    bool _780 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].w;
    float _782 = 1.0 / _776;
    float _784 = 1.0 / _772;
    float _786 = _744 * _778;
    bool _788 = _740 >= (*spvDescriptorSet0.vp_c9)._m0[125].w;
    bool _790 = isnan(_740);
    bool _792 = _788 || _790;
    bool _794 = isnan((*spvDescriptorSet0.vp_c9)._m0[125].w);
    bool _796 = _792 || _794;
    float _798 = float(_796);
    float _800 = -_760;
    float _802 = _800 + 1.0;
    float _804 = _798 * _802;
    float _806 = _748 * _782;
    bool _808 = _740 >= (*spvDescriptorSet0.vp_c9)._m0[124].w;
    bool _810 = isnan(_740);
    bool _812 = _808 || _810;
    bool _814 = isnan((*spvDescriptorSet0.vp_c9)._m0[124].w);
    bool _816 = _812 || _814;
    float _818 = float(_816);
    float _820 = -(*spvDescriptorSet0.vp_c9)._m0[123].z;
    float _822 = (*spvDescriptorSet0.vp_c9)._m0[124].z + _820;
    bool _824 = _740 >= (*spvDescriptorSet0.vp_c9)._m0[123].w;
    bool _826 = isnan(_740);
    bool _828 = _824 || _826;
    bool _830 = isnan((*spvDescriptorSet0.vp_c9)._m0[123].w);
    bool _832 = _828 || _830;
    float _834 = float(_832);
    float _836 = -(*spvDescriptorSet0.vp_c9)._m0[124].x;
    float _838 = _836 + (*spvDescriptorSet0.vp_c9)._m0[125].x;
    float _840 = -_798;
    float _842 = _840 + 1.0;
    float _844 = -_818;
    float _846 = _844 + 1.0;
    float _848 = _768 * _784;
    float _850 = -(*spvDescriptorSet0.vp_c9)._m0[123].y;
    float _852 = (*spvDescriptorSet0.vp_c9)._m0[124].y + _850;
    float _854 = -(*spvDescriptorSet0.vp_c9)._m0[123].x;
    float _856 = (*spvDescriptorSet0.vp_c9)._m0[124].x + _854;
    float _858 = _834 * _846;
    float _860 = fma(_822, _848, (*spvDescriptorSet0.vp_c9)._m0[123].z);
    float _862 = fma(_852, _848, (*spvDescriptorSet0.vp_c9)._m0[123].y);
    float _864 = fma(_856, _848, (*spvDescriptorSet0.vp_c9)._m0[123].x);
    float _866 = _818 * _842;
    float _868 = _860 * _858;
    float _870 = _862 * _858;
    float _872 = _864 * _858;
    float _874 = -_834;
    float _876 = _874 + 1.0;
    float _878 = -(*spvDescriptorSet0.vp_c9)._m0[124].y;
    float _880 = _878 + (*spvDescriptorSet0.vp_c9)._m0[125].y;
    float _882 = -(*spvDescriptorSet0.vp_c9)._m0[124].z;
    float _884 = _882 + (*spvDescriptorSet0.vp_c9)._m0[125].z;
    float _886 = fma(_876, (*spvDescriptorSet0.vp_c9)._m0[123].x, _872);
    float _888 = fma(_876, (*spvDescriptorSet0.vp_c9)._m0[123].y, _870);
    float _890 = -(*spvDescriptorSet0.vp_c9)._m0[125].x;
    float _892 = (*spvDescriptorSet0.vp_c9)._m0[126].x + _890;
    float _894 = fma(_838, _806, (*spvDescriptorSet0.vp_c9)._m0[124].x);
    float _896 = fma(_880, _806, (*spvDescriptorSet0.vp_c9)._m0[124].y);
    float _898 = fma(_876, (*spvDescriptorSet0.vp_c9)._m0[123].z, _868);
    float _900 = -(*spvDescriptorSet0.vp_c9)._m0[125].y;
    float _902 = (*spvDescriptorSet0.vp_c9)._m0[126].y + _900;
    float _904 = fma(_884, _806, (*spvDescriptorSet0.vp_c9)._m0[124].z);
    float _906 = -(*spvDescriptorSet0.vp_c9)._m0[125].z;
    float _908 = (*spvDescriptorSet0.vp_c9)._m0[126].z + _906;
    float _910 = fma(_894, _866, _886);
    float _912 = fma(_892, _786, (*spvDescriptorSet0.vp_c9)._m0[125].x);
    float _914 = fma(_902, _786, (*spvDescriptorSet0.vp_c9)._m0[125].y);
    float _916 = fma(_896, _866, _888);
    float _918 = fma(_908, _786, (*spvDescriptorSet0.vp_c9)._m0[125].z);
    float _920 = fma(_904, _866, _898);
    float _922 = fma(_912, _804, _910);
    float _924 = fma(_914, _804, _916);
    float _926 = fma(_918, _804, _920);
    float _928 = fma(_760, (*spvDescriptorSet0.vp_c9)._m0[126].x, _922);
    float _930 = fma(_760, (*spvDescriptorSet0.vp_c9)._m0[126].y, _924);
    float _932 = fma(_760, (*spvDescriptorSet0.vp_c9)._m0[126].z, _926);
    bool _934 = !_780;
    float _952;
    if (!_934)
    {
        float _936 = in.m_53.x;
        float _938 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].w;
        float _940 = _936 * (*spvDescriptorSet0.vp_c9)._m0[13].x;
        float _942 = fma(_940, (*spvDescriptorSet0.vp_c9)._m0[11].w, _100);
        float _944 = _942 * _938;
        float _946 = floor(_944);
        float _948 = -_946;
        float _950 = _944 + _948;
        _952 = _950;
        _954 = true;
    }
    else
    {
        _952 = _156;
    }
    _954 = false;
    float _956 = _952;
    float _958 = in.m_53.x;
    float _960 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].x);
    int _962 = int(_960);
    float _964 = in.m_53.z;
    int _966 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _968 = _966 != 0;
    float _970 = in.m_53.y;
    float _972 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    float _974 = in.m_42.x;
    float _976 = in.m_42.y;
    float _978 = in.m_42.z;
    float _980 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _982 = (*spvDescriptorSet0.vp_c8)._m0[28].y * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _984 = fma((*spvDescriptorSet0.vp_c8)._m0[28].x, (*spvDescriptorSet0.vp_c8)._m0[28].x, _982);
    float _986 = (*spvDescriptorSet0.vp_c8)._m0[0].y * (*spvDescriptorSet0.vp_c10)._m0[9].w;
    float _988 = _958 * 2.0;
    float _990 = _958 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    float _992 = (*spvDescriptorSet0.vp_c9)._m0[83].z + (*spvDescriptorSet0.vp_c9)._m0[83].x;
    float _994 = floor(_988);
    float _996 = -_972;
    float _998 = fma(_990, 2.0, _996);
    float _1000 = fma((*spvDescriptorSet0.vp_c8)._m0[0].x, (*spvDescriptorSet0.vp_c10)._m0[8].w, _986);
    float _1002 = _970 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    float _1004 = _970 * 2.0;
    float _1006 = (*spvDescriptorSet0.vp_c9)._m0[82].x + (*spvDescriptorSet0.vp_c9)._m0[81].z;
    float _1008 = fma((*spvDescriptorSet0.vp_c8)._m0[0].z, (*spvDescriptorSet0.vp_c10)._m0[10].w, _1000);
    float _1010 = fma(_1002, -2.0, _980);
    float _1012 = _964 * 2.0;
    float _1014 = _976 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _1016 = _976 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _1018 = _976 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _1020 = floor(_1004);
    float _1022 = fma(_974, (*spvDescriptorSet0.vp_c10)._m0[4].x, _1014);
    float _1024 = fma(_974, (*spvDescriptorSet0.vp_c10)._m0[5].x, _1016);
    float _1026 = fma(_974, (*spvDescriptorSet0.vp_c10)._m0[6].x, _1018);
    float _1028 = _958 + _970;
    float _1030 = _958 + _964;
    float _1032 = fma(_978, (*spvDescriptorSet0.vp_c10)._m0[4].z, _1022);
    float _1034 = fma(_978, (*spvDescriptorSet0.vp_c10)._m0[5].z, _1024);
    float _1036 = floor(_1012);
    float _1038 = _1028 + (-1.0);
    float _1040 = _970 + _964;
    float _1042 = _1030 + (-1.0);
    float _1044 = fma(_978, (*spvDescriptorSet0.vp_c10)._m0[6].z, _1026);
    bool _1046 = _994 > 0.0;
    float _1048 = _1040 + (-1.0);
    float _1050 = fma(_1042, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _1052 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].y);
    int _1054 = int(_1052);
    float _1056 = fma(_1048, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    float _1058 = _1048;
    if (!_968)
    {
        _1058 = _964;
    }
    float _1060 = _1058;
    float _1062 = -_100;
    float _1064 = fma(_1062, (*spvDescriptorSet0.vp_c9)._m0[76].x, _998);
    float _1066 = _1060;
    if (_968)
    {
        _1066 = _970;
    }
    float _1068 = _1066;
    float _1070 = (*spvDescriptorSet0.vp_c9)._m0[83].w + (*spvDescriptorSet0.vp_c9)._m0[83].y;
    bool _1072 = _1036 > 0.0;
    float _1074 = _1044 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    bool _1076 = _1036 >= 0.0;
    bool _1078 = isnan(_1036);
    bool _1080 = _1076 || _1078;
    bool _1082 = isnan(0.0);
    bool _1084 = _1080 || _1082;
    float _1086 = fma(_1068, (*spvDescriptorSet0.vp_c9)._m0[83].w, _1070);
    float _1088 = _1068;
    float _1090 = _1070;
    if (!_968)
    {
        _1088 = _964;
    }
    float _1092 = _1088;
    float _1094 = _1092;
    if (!_968)
    {
        _1090 = _970;
    }
    float _1096 = _1090;
    float _1098 = fma((*spvDescriptorSet0.vp_c8)._m0[28].z, (*spvDescriptorSet0.vp_c8)._m0[28].z, _984);
    float _1100 = _1096;
    if (_968)
    {
        _1094 = _970;
    }
    float _1102 = _1094;
    float _1104 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _1106 = log2(_1104);
    if (_968)
    {
        _1100 = _958;
    }
    float _1108 = _1100;
    float _1110 = fma(_100, (*spvDescriptorSet0.vp_c9)._m0[76].y, _1010);
    bool _1112 = _994 >= 0.0;
    bool _1114 = isnan(_994);
    bool _1116 = _1112 || _1114;
    bool _1118 = isnan(0.0);
    bool _1120 = _1116 || _1118;
    float _1122 = _1102 * (*spvDescriptorSet0.vp_c9)._m0[82].y;
    int _1124 = _1084 ? 0 : 1;
    float _1126 = fma(_1108, (*spvDescriptorSet0.vp_c9)._m0[83].z, _992);
    float _1128 = _1108 * (*spvDescriptorSet0.vp_c9)._m0[82].x;
    bool _1130 = _1020 >= 0.0;
    bool _1132 = isnan(_1020);
    bool _1134 = _1130 || _1132;
    bool _1136 = isnan(0.0);
    bool _1138 = _1134 || _1136;
    float _1140 = rsqrt(_1098);
    int _1142 = ~_1124;
    int _1144 = _1142 + 1;
    int _1146 = _1144 + 1;
    float _1148 = -_1006;
    float _1150 = fma(_1128, 2.0, _1148);
    int _1152 = _1146;
    if (!_1072)
    {
        int _1154 = ~_1124;
        int _1156 = _1154 + 1;
        _1152 = _1156;
    }
    int _1158 = _1152;
    bool _1160 = _1020 > 0.0;
    float _1162 = _1106 * _100;
    int _1164 = _1120 ? 0 : 1;
    bool _1166 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _1168 = isnan(0.0);
    bool _1170 = _1166 || _1168;
    bool _1172 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _1174 = _1170 || _1172;
    float _1176 = exp2(_1162);
    int _1178 = _1138 ? 0 : 1;
    float _1180 = float(_1054);
    float _1182 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _1184 = 1.0 + _1182;
    int _1186 = ~_1164;
    int _1188 = _1186 + 1;
    int _1190 = _1188 + 1;
    int _1192 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 16;
    bool _1194 = _1192 != 0;
    int _1196 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 32;
    bool _1198 = _1196 != 0;
    int _1200 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 64;
    bool _1202 = _1200 != 0;
    float _1204 = 1.0 / _1180;
    int _1206 = _1190;
    if (!_1046)
    {
        int _1208 = ~_1164;
        int _1210 = _1208 + 1;
        _1206 = _1210;
    }
    int _1212 = _1206;
    float _1214 = fma(_1038, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    bool _1216 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _1218 = isnan(1.0);
    bool _1220 = _1216 || _1218;
    bool _1222 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _1224 = _1220 || _1222;
    float _1226 = 1.0 / _1184;
    bool _1228 = !_1198;
    int _1230 = _1228 ? 0 : 1;
    float _1232 = (*spvDescriptorSet0.vp_c9)._m0[82].y + (*spvDescriptorSet0.vp_c9)._m0[81].w;
    bool _1234 = !_1194;
    int _1236 = _1234 ? 0 : 1;
    float _1238 = -_1176;
    float _1240 = _1238 + 1.0;
    bool _1242 = !_1202;
    int _1244 = _1242 ? 0 : 1;
    float _1246 = fma(_1122, -2.0, _1232);
    int _1248 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _1250 = _1248 != 0;
    int _1252 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _1254 = _1252 != 0;
    int _1256 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _1258 = _1256 != 0;
    int _1260 = ~_1178;
    int _1262 = _1260 + 1;
    int _1264 = _1262 + 1;
    float _1266 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    int _1268 = _1264;
    if (!_1160)
    {
        int _1270 = ~_1178;
        int _1272 = _1270 + 1;
        _1268 = _1272;
    }
    int _1274 = _1268;
    float _1276 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    bool _1278 = !_1250;
    int _1280 = _1278 ? 0 : 1;
    float _1282 = in.m_57.x;
    float _1284 = in.m_57.y;
    float _1286 = in.m_57.z;
    bool _1288 = !_1254;
    int _1290 = _1288 ? 0 : 1;
    float _1292 = fma(_958, (*spvDescriptorSet0.vp_c9)._m0[78].z, _1266);
    int _1294 = abs(_1280);
    float _1296 = fma(_970, (*spvDescriptorSet0.vp_c9)._m0[78].w, _1276);
    int _1298 = abs(_1290);
    float _1300 = -_100;
    float _1302 = fma(_1300, (*spvDescriptorSet0.vp_c9)._m0[81].x, _1150);
    float _1304 = _1204 * _100;
    float _1306 = fma(_100, (*spvDescriptorSet0.vp_c9)._m0[82].w, _1086);
    float _1308 = fma(_100, (*spvDescriptorSet0.vp_c9)._m0[77].z, _1292);
    float _1310 = fma(_100, (*spvDescriptorSet0.vp_c9)._m0[77].w, _1296);
    float _1312 = float(_962);
    float _1314 = float(_1212);
    float _1316 = fma(_100, (*spvDescriptorSet0.vp_c9)._m0[81].y, _1246);
    float _1318 = _1174 ? _1240 : 0.0;
    float _1320 = _1312 * _100;
    float _1322 = float(_1294);
    float _1324 = fma(_100, (*spvDescriptorSet0.vp_c9)._m0[82].z, _1126);
    float _1326 = float(_1158);
    if (_1224)
    {
        float _1328 = _1318 * _1226;
        _110 = _1328;
    }
    float _1330 = _110;
    bool _1332 = !_1258;
    int _1334 = _1332 ? 0 : 1;
    float _1336 = float(_1298);
    float _1338 = _1322 * _1326;
    int _1340 = abs(_1334);
    float _1342 = _1140 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _1344 = _1336 * _1314;
    float _1346 = _1338 * (-2.0);
    float _1348 = _1140 * (*spvDescriptorSet0.vp_c8)._m0[28].x;
    float _1350 = _1342 * _1342;
    float _1352 = -(*spvDescriptorSet0.vp_c9)._m0[194].y;
    float _1354 = (*spvDescriptorSet0.vp_c9)._m0[194].z + _1352;
    float _1356 = _958 + (-0.5);
    float _1358 = fma(_1346, _1282, _1282);
    float _1360 = _1140 * (*spvDescriptorSet0.vp_c8)._m0[28].z;
    float _1362 = fma(_1348, _1348, _1350);
    float _1364 = float(_1274);
    float _1366 = fma(_1214, _1346, _1214);
    float _1368 = float(_1340);
    float _1370 = fma(_1356, (*spvDescriptorSet0.vp_c9)._m0[196].x, _1358);
    float _1372 = fma(_1360, _1360, _1362);
    float _1374 = _1344 * (-2.0);
    float _1376 = 1.0 / _1354;
    float _1378 = _1368 * _1364;
    float _1380 = fma(_1366, _1330, _1370);
    float _1382 = _1034 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _1384 = fma(_1056, _1374, _1056);
    float _1386 = fma(_1374, _1284, _1284);
    float _1388 = _970 + (-0.5);
    float _1390 = _1032 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _1392 = _1382 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1394 = in.m_59.x;
    float _1396 = in.m_59.y;
    float _1398 = in.m_59.z;
    float _1400 = fma(_1388, (*spvDescriptorSet0.vp_c9)._m0[196].y, _1386);
    float _1402 = _1378 * (-2.0);
    float _1404 = fma(_1390, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1392);
    float _1406 = rsqrt(_1372);
    float _1408 = fma(_1384, _1330, _1400);
    float _1410 = fma(_1050, _1402, _1050);
    float _1412 = fma(_1074, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1404);
    float _1414 = fma(_1402, _1286, _1286);
    float _1416 = _1408 * 0.15915493667125701904296875;
    float _1418 = _1008 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1420 = _1412 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1422 = _1380 * 0.15915493667125701904296875;
    float _1424 = _964 + (-0.5);
    float _1426 = _1416 * 6.283185482025146484375;
    float _1428 = sin(_1426);
    bool _1430 = _1420 >= _1418;
    bool _1432 = isnan(_1420);
    bool _1434 = _1430 || _1432;
    bool _1436 = isnan(_1418);
    bool _1438 = _1434 || _1436;
    float _1440 = fma(_1424, (*spvDescriptorSet0.vp_c9)._m0[196].z, _1414);
    float _1442 = -_1420;
    float _1444 = _1418 + _1442;
    float _1446 = _1348 * _1406;
    float _1448 = fma(_1410, _1330, _1440);
    float _1450 = _1422 * 6.283185482025146484375;
    float _1452 = sin(_1450);
    float _1454 = abs(_1444);
    float _1456 = precise::max(_1454, (*spvDescriptorSet0.vp_c9)._m0[194].y);
    float _1458 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _1396);
    float _1460 = _1448 * 0.15915493667125701904296875;
    float _1462 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _1394);
    float _1464 = precise::min(_1456, (*spvDescriptorSet0.vp_c9)._m0[194].z);
    float _1466 = _448 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _1468 = _462 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _1470 = _1422 * 6.283185482025146484375;
    float _1472 = cos(_1470);
    float _1474 = _1342 * _1406;
    float _1476 = -(*spvDescriptorSet0.vp_c9)._m0[194].y;
    float _1478 = _1464 + _1476;
    float _1480 = _1466 * _1458;
    float _1482 = _1360 * _1406;
    float _1484 = _1478 * _1376;
    float _1486 = _1460 * 6.283185482025146484375;
    float _1488 = cos(_1486);
    float _1490 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _1398);
    float _1492 = _488 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    bool _1494 = !_1438;
    float _1496 = _1494 ? 1.0 : (-1.0);
    float _1498 = _1468 * _1490;
    float _1500 = _1492 * _1462;
    float _1502 = _156 * (*spvDescriptorSet0.vp_c9)._m0[194].w;
    float _1504 = _1416 * 6.283185482025146484375;
    float _1506 = cos(_1504);
    float _1508 = _1496 * _1484;
    float _1510 = _1472 * _1428;
    float _1512 = _1502 * _1508;
    float _1514 = _1452 * _1428;
    float _1516 = _1460 * 6.283185482025146484375;
    float _1518 = sin(_1516);
    float _1520 = _1428 * _1488;
    float _1522 = _1512 * 0.15915493667125701904296875;
    float _1524 = _1488 * _1480;
    float _1526 = _1472 * _1506;
    float _1528 = _1452 * _1506;
    float _1530 = _1522 * 6.283185482025146484375;
    float _1532 = cos(_1530);
    float _1534 = _1472 * _1524;
    float _1536 = _1506 * _1488;
    float _1538 = _1452 * _1524;
    float _1540 = fma(_1518, _1526, _1514);
    float _1542 = -_1510;
    float _1544 = fma(_1518, _1528, _1542);
    float _1546 = -_1528;
    float _1548 = fma(_1518, _1510, _1546);
    float _1550 = -_1480;
    float _1552 = _1518 * _1550;
    float _1554 = fma(_1540, _1500, _1534);
    float _1556 = _1522 * 6.283185482025146484375;
    float _1558 = sin(_1556);
    float _1560 = fma(_1518, _1514, _1526);
    float _1562 = fma(_1536, _1500, _1552);
    float _1564 = fma(_1548, _1498, _1554);
    float _1566 = fma(_1544, _1500, _1538);
    float _1568 = -_1532;
    float _1570 = _1568 + 1.0;
    float _1572 = fma(_1520, _1498, _1562);
    float _1574 = _1564 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _1576 = _1564 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _1578 = fma(_1560, _1498, _1566);
    float _1580 = _1564 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _1582 = fma(_1572, (*spvDescriptorSet0.vp_c8)._m0[25].x, _1574);
    float _1584 = fma(_1572, (*spvDescriptorSet0.vp_c8)._m0[24].x, _1576);
    float _1586 = _1474 * _1570;
    float _1588 = _1482 * _1482;
    float _1590 = fma(_1578, (*spvDescriptorSet0.vp_c8)._m0[25].z, _1582);
    float _1592 = _1446 * _1558;
    float _1594 = _1474 * _1558;
    float _1596 = _1482 * _1558;
    float _1598 = _1446 * _1570;
    float _1600 = fma(_1572, (*spvDescriptorSet0.vp_c8)._m0[26].x, _1580);
    float _1602 = fma(_1482, _1586, _1592);
    float _1604 = fma(_1578, (*spvDescriptorSet0.vp_c8)._m0[24].z, _1584);
    float _1606 = _1590 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _1608 = fma(_1570, _1588, _1532);
    float _1610 = -_1596;
    float _1612 = fma(_1474, _1598, _1610);
    float _1614 = -_1594;
    float _1616 = fma(_1482, _1598, _1614);
    float _1618 = _1604 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _1620 = _1606 * _1602;
    float _1622 = fma(_1578, (*spvDescriptorSet0.vp_c8)._m0[26].z, _1600);
    float _1624 = fma(_1446, _1598, _1532);
    float _1626 = _1606 * _1612;
    float _1628 = fma(_1618, _1616, _1620);
    float _1630 = _1622 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _1632 = fma(_1474, _1586, _1532);
    float _1634 = fma(_1618, _1624, _1626);
    float _1636 = fma(_1482, _1598, _1594);
    float _1638 = fma(_1630, _1608, _1628);
    float _1640 = fma(_1474, _1598, _1596);
    float _1642 = _1606 * _1632;
    float _1644 = fma(_1630, _1636, _1634);
    float _1646 = _1074 + _1638;
    float _1648 = -_1592;
    float _1650 = fma(_1482, _1586, _1648);
    float _1652 = fma(_1618, _1640, _1642);
    float _1654 = _1390 + _1644;
    float _1656 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1658 = _1646 + _1656;
    float _1660 = _1382 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _1662 = fma(_1630, _1650, _1652);
    float _1664 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1666 = _1654 + _1664;
    float _1668 = _1658 * _1658;
    float _1670 = fma(_1390, (*spvDescriptorSet0.vp_c8)._m0[11].x, _1660);
    float _1672 = _1382 + _1662;
    float _1674 = fma(_1666, _1666, _1668);
    float _1676 = fma(_1074, (*spvDescriptorSet0.vp_c8)._m0[11].z, _1670);
    float _1678 = sqrt(_1674);
    bool _1680 = _1678 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1682 = _1670;
    float _1684 = _1662;
    float _1686 = _1586;
    float _1688 = _1678;
    if (!_1680)
    {
        _1682 = _1654;
    }
    float _1690 = _1682;
    float _1692 = _1690;
    if (!_1680)
    {
        _1684 = _1646;
    }
    float _1694 = _1684;
    float _1696 = _1694;
    if (!_1680)
    {
        _1686 = _1672;
    }
    float _1698 = _1686;
    bool _1700 = !_1680;
    float _1702 = _1698;
    if (!_1700)
    {
        float _1704 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1706 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1708 = _1678 + _1706;
        float _1710 = rsqrt(_1674);
        float _1712 = _1708 * _1704;
        float _1714 = _1672 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1716 = _1712 * 0.15915493667125701904296875;
        float _1718 = _1716 * 6.283185482025146484375;
        float _1720 = cos(_1718);
        float _1722 = _1716 * 6.283185482025146484375;
        float _1724 = sin(_1722);
        float _1726 = _1720 + (-1.0);
        float _1728 = fma(_1724, _1714, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1730 = _1726 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1732 = _1710 * _1728;
        float _1734 = fma(_1672, _1720, _1730);
        float _1736 = fma(_1666, _1732, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1738 = fma(_1658, _1732, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _1702 = _1734;
        _1692 = _1736;
        _1696 = _1738;
    }
    float _1740 = _1702;
    float _1742 = _1692;
    float _1744 = _1696;
    float _1746 = -_1382;
    float _1748 = _1746 + _1740;
    float _1750 = _1676 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _1752 = -_1390;
    float _1754 = _1752 + _1742;
    float _1756 = -_1074;
    float _1758 = _1756 + _1744;
    float _1760 = _1748 * _1748;
    float _1762 = _1382 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _1764 = 1.0 / _1750;
    float _1766 = fma(_1754, _1754, _1760);
    float _1768 = fma(_1390, (*spvDescriptorSet0.vp_c8)._m0[10].x, _1762);
    float _1770 = fma(_1758, _1758, _1766);
    float _1772 = fma(_1074, (*spvDescriptorSet0.vp_c8)._m0[10].z, _1768);
    bool _1774 = (*spvDescriptorSet0.vp_c15)._m0[653].w >= 0.5;
    bool _1776 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _1778 = _1774 || _1776;
    bool _1780 = isnan(0.5);
    bool _1782 = _1778 || _1780;
    float _1784 = sqrt(_1770);
    float _1786 = _1772 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _1788 = _1786 + _1750;
    float _1790 = _1788 * _1764;
    float _1792 = _1790 * 0.5;
    bool _1794 = _1784 > 0.0;
    float _1796 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _1798 = fma(_1792, (*spvDescriptorSet0.vp_c8)._m0[30].w, _1796);
    float _1800 = _1792;
    float _1802 = _1754;
    float _1804 = _1740;
    float _1806 = _1742;
    float _1808 = _1744;
    float _1810 = _1758;
    float _1812 = (*spvDescriptorSet0.vp_c15)._m0[653].w;
    float _1814 = _1750;
    if (_1782)
    {
        _1800 = 1.0;
    }
    float _1816 = _1800;
    float _1818 = 1.0 / _1798;
    bool _1820 = !_1794;
    float _1822 = _1816;
    if (!_1820)
    {
        float _1824 = _172 * _172;
        float _1826 = rsqrt(_1770);
        float _1828 = fma(_170, _170, _1824);
        float _1830 = fma(_174, _174, _1828);
        float _1832 = sqrt(_1830);
        float _1834 = _1748 * _1826;
        float _1836 = _1758 * _1826;
        bool _1838 = _1832 > 0.0;
        float _1840 = _1754 * _1826;
        bool _1842 = !_1838;
        _1812 = _1836;
        _1814 = _1840;
        if (!_1842)
        {
            float _1844 = rsqrt(_1830);
            float _1846 = 1.0 / (*spvDescriptorSet0.vp_c10)._m0[2].z;
            float _1848 = _172 * _1844;
            float _1850 = _170 * _1844;
            float _1852 = _174 * _1844;
            float _1854 = _1834 * _1848;
            float _1856 = fma(_1840, _1850, _1854);
            float _1858 = _1846 * (*spvDescriptorSet0.vp_c9)._m0[142].x;
            float _1860 = fma(_1836, _1852, _1856);
            float _1862 = _1860 * _1858;
            float _1864 = fma(_170, _1862, _1742);
            float _1866 = fma(_172, _1862, _1740);
            float _1868 = fma(_174, _1862, _1744);
            _1802 = _1856;
            _1804 = _1866;
            _1806 = _1864;
            _1808 = _1868;
            _1810 = _1854;
        }
    }
    float _1870 = _1802;
    float _1872 = _1804;
    float _1874 = _1806;
    float _1876 = _1808;
    float _1878 = _1810;
    float _1880 = _1812;
    float _1882 = _1814;
    float _1884 = _1882;
    float _1886 = _1870;
    float _1888 = _1878;
    float _1890 = _1880;
    if (_1782)
    {
        _1884 = 1.0;
    }
    float _1892 = _1884;
    float _1894 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _1896 = _1818 * _1894;
    float _1898 = _1892;
    if (!_1782)
    {
        float _1900 = (*spvDescriptorSet0.vp_c8)._m0[31].x * 0.5;
        float _1902 = _1900 * 0.15915493667125701904296875;
        float _1904 = _1902 * 6.283185482025146484375;
        float _1906 = cos(_1904);
        float _1908 = (*spvDescriptorSet0.vp_c8)._m0[31].y * 0.5;
        float _1910 = _1908 * 0.15915493667125701904296875;
        float _1912 = _1902 * 6.283185482025146484375;
        float _1914 = sin(_1912);
        float _1916 = 1.0 / _1906;
        float _1918 = _1910 * 6.283185482025146484375;
        float _1920 = cos(_1918);
        float _1922 = _1914 * _1916;
        float _1924 = _1910 * 6.283185482025146484375;
        float _1926 = sin(_1924);
        float _1928 = _1920 * _1922;
        float _1930 = 1.0 / _1928;
        float _1932 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1934 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _1932;
        float _1936 = 1.0 / _1934;
        float _1938 = _1926 * _1930;
        float _1940 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1942 = fma(_1896, _1938, _1940);
        float _1944 = _1942 * _1936;
        float _1946 = precise::clamp(_1944, 0.0, 1.0);
        _1886 = _1910;
        _1888 = _1902;
        _1822 = _1946;
    }
    float _1948 = _1886;
    float _1950 = _1888;
    float _1952 = _1822;
    float _1954 = _1948;
    if (!_1782)
    {
        float _1956 = (*spvDescriptorSet0.vp_c8)._m0[31].x * 0.5;
        float _1958 = _1956 * 0.15915493667125701904296875;
        float _1960 = _1958 * 6.283185482025146484375;
        float _1962 = cos(_1960);
        float _1964 = (*spvDescriptorSet0.vp_c8)._m0[31].y * 0.5;
        float _1966 = _1964 * 0.15915493667125701904296875;
        float _1968 = _1958 * 6.283185482025146484375;
        float _1970 = sin(_1968);
        float _1972 = 1.0 / _1962;
        float _1974 = _1966 * 6.283185482025146484375;
        float _1976 = cos(_1974);
        float _1978 = _1970 * _1972;
        float _1980 = _1966 * 6.283185482025146484375;
        float _1982 = sin(_1980);
        float _1984 = _1976 * _1978;
        float _1986 = 1.0 / _1984;
        float _1988 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _1990 = (*spvDescriptorSet0.vp_c9)._m0[140].w + _1988;
        float _1992 = 1.0 / _1990;
        float _1994 = _1982 * _1986;
        float _1996 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _1998 = fma(_1896, _1994, _1996);
        float _2000 = _1998 * _1992;
        float _2002 = precise::clamp(_2000, 0.0, 1.0);
        float _2004 = -_2002;
        float _2006 = _2004 + 1.0;
        _1954 = _1972;
        _1898 = _2006;
    }
    float _2008 = _1954;
    float _2010 = _1898;
    float _2012 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _2014 = _1872 + _2012;
    float _2016 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _2018 = _1874 + _2016;
    float _2020 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _2022 = _1876 + _2020;
    float _2024 = _2014 * _2014;
    float _2026 = fma(_2018, _2018, _2024);
    float _2028 = fma(_2022, _2022, _2026);
    float _2030 = rsqrt(_2028);
    float _2032 = sqrt(_2028);
    float _2034 = _2030 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _2036 = _2018 * _2034;
    float _2038 = _2022 * _2034;
    float _2040 = _2036 * _2036;
    float _2042 = _2038 * _2038;
    float _2044 = _2040 + _2042;
    float _2046 = sqrt(_2044);
    bool _2048 = _2046 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2050 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2052 = _2046 + _2050;
    float _2054 = _2008;
    float _2056 = _2044;
    float _2058 = _2052;
    float _2060 = _2014;
    float _2062 = _2038;
    float _2064 = _2040;
    float _2066 = _2042;
    if (_2048)
    {
        float _2068 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2054 = _2068;
    }
    float _2070 = _2054;
    if (_2048)
    {
        float _2072 = rsqrt(_2044);
        _2056 = _2072;
    }
    float _2074 = _2056;
    if (_2048)
    {
        float _2076 = _2052 * _2070;
        _2058 = _2076;
    }
    float _2078 = _2058;
    if (_2048)
    {
        float _2080 = _2078 * 0.15915493667125701904296875;
        _1890 = _2080;
    }
    float _2082 = _1890;
    float _2084 = _1950;
    if (_2048)
    {
        float _2086 = _2082 * 6.283185482025146484375;
        float _2088 = sin(_2086);
        _2084 = _2088;
    }
    float _2090 = _2084;
    float _2092 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _2094 = precise::max(0.0, _2092);
    float _2096 = _2070;
    float _2098 = _2094;
    if (_2048)
    {
        float _2100 = _2082 * 6.283185482025146484375;
        float _2102 = cos(_2100);
        _2096 = _2102;
    }
    float _2104 = _2096;
    float _2106 = -_2034;
    float _2108 = -_2094;
    float _2110 = fma(_2014, _2106, _2108);
    if (_2048)
    {
        float _2112 = _2110 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2060 = _2112;
    }
    float _2114 = _2060;
    float _2116 = _2114;
    float _2118 = _2090;
    if (_2048)
    {
        float _2120 = fma(_2090, _2114, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _2098 = _2120;
    }
    float _2122 = _2098;
    float _2124 = _2122;
    if (!_2048)
    {
        _2116 = _2036;
    }
    float _2126 = _2116;
    float _2128 = _2126;
    if (_2048)
    {
        float _2130 = _2104 + (-1.0);
        _2118 = _2130;
    }
    float _2132 = _2118;
    float _2134 = _2132;
    if (_2048)
    {
        float _2136 = _2074 * _2122;
        _1688 = _2136;
    }
    float _2138 = _1688;
    if (!_2048)
    {
        _2124 = _2110;
    }
    float _2140 = _2124;
    float _2142 = _2140;
    if (_2048)
    {
        float _2144 = _2132 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2134 = _2144;
    }
    float _2146 = _2134;
    if (_2048)
    {
        float _2148 = _2036 * _2138;
        _2128 = _2148;
    }
    float _2150 = _2128;
    if (_2048)
    {
        float _2152 = _2038 * _2138;
        _2062 = _2152;
    }
    float _2154 = _2062;
    if (_2048)
    {
        float _2156 = fma(_2110, _2104, _2146);
        _2142 = _2156;
    }
    float _2158 = _2142;
    if (_2048)
    {
        float _2160 = _2150 * _2150;
        _2064 = _2160;
    }
    float _2162 = _2064;
    if (_2048)
    {
        float _2164 = _2154 * _2154;
        _2066 = _2164;
    }
    float _2166 = _2066;
    float _2168 = fma(_2158, _2158, _2162);
    float _2170 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _2172 = fma(_2032, (*spvDescriptorSet0.vp_c15)._m0[23].w, _2170);
    float _2174 = precise::clamp(_2172, 0.0, 1.0);
    float _2176 = _2168 + _2166;
    float _2178 = _1872 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _2180 = _1872 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _2182 = -_2174;
    float _2184 = _2182 + 1.0;
    float _2186 = rsqrt(_2176);
    float _2188 = fma(_1874, (*spvDescriptorSet0.vp_c8)._m0[2].x, _2178);
    float _2190 = _1872 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _2192 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _2194 = fma(_1876, (*spvDescriptorSet0.vp_c8)._m0[2].z, _2188);
    float _2196 = fma(_1874, (*spvDescriptorSet0.vp_c8)._m0[1].x, _2180);
    float _2198 = _1872 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _2200 = abs(_2184);
    float _2202 = log2(_2200);
    float _2204 = fma(_1874, (*spvDescriptorSet0.vp_c8)._m0[0].x, _2190);
    float _2206 = fma(_1876, (*spvDescriptorSet0.vp_c8)._m0[1].z, _2196);
    float _2208 = fma(_1874, (*spvDescriptorSet0.vp_c8)._m0[3].x, _2198);
    float _2210 = _2194 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _2212 = fma(_1876, (*spvDescriptorSet0.vp_c8)._m0[0].z, _2204);
    float _2214 = _2206 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _2216 = fma(_1876, (*spvDescriptorSet0.vp_c8)._m0[3].z, _2208);
    float _2218 = _2186 * _2150;
    float _2220 = _2186 * _2158;
    float _2222 = _2212 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _2224 = _2214 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _2226 = _2218 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _2228 = _2210 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _2230 = _2186 * _2154;
    float _2232 = fma(_2222, (*spvDescriptorSet0.vp_c8)._m0[7].x, _2224);
    float _2234 = -_2226;
    float _2236 = fma(_2220, (*spvDescriptorSet0.vp_c15)._m0[21].y, _2234);
    float _2238 = _2202 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _2240 = -_2228;
    float _2242 = fma(_2240, _2192, 1.0);
    float _2244 = _2216 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _2246 = -_2230;
    float _2248 = fma(_2246, (*spvDescriptorSet0.vp_c15)._m0[21].z, _2236);
    float _2250 = fma(_2210, (*spvDescriptorSet0.vp_c8)._m0[7].z, _2232);
    float _2252 = log2(_2242);
    float _2254 = _2214 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _2256 = _2214 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _2258 = fma(_2244, (*spvDescriptorSet0.vp_c8)._m0[7].w, _2250);
    float _2260 = fma(_2222, (*spvDescriptorSet0.vp_c8)._m0[4].x, _2254);
    float _2262 = fma(_2222, (*spvDescriptorSet0.vp_c8)._m0[5].x, _2256);
    float _2264 = _2220 + 1.0;
    float _2266 = exp2(_2238);
    float _2268 = fma(_2248, -0.5, 0.5);
    float _2270 = fma(_2248, 0.5, 0.5);
    float _2272 = fma(_2210, (*spvDescriptorSet0.vp_c8)._m0[4].z, _2260);
    float _2274 = fma(_2210, (*spvDescriptorSet0.vp_c8)._m0[5].z, _2262);
    float _2276 = fma(_2270, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _2278 = 1.0 / _2258;
    float _2280 = fma(_2270, _2276, -0.212114393711090087890625);
    float _2282 = fma(_2270, _2280, 1.570728778839111328125);
    float _2284 = sqrt(_2268);
    float _2286 = -_2220;
    float _2288 = fma(_2266, _2264, _2286);
    float _2290 = fma(_2244, (*spvDescriptorSet0.vp_c8)._m0[4].w, _2272);
    float _2292 = fma(_2244, (*spvDescriptorSet0.vp_c8)._m0[5].w, _2274);
    float _2294 = _2252 * 0.693147182464599609375;
    float _2296 = _2290 * _2278;
    float _2298 = _2292 * _2278;
    float _2300 = _2294 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _2302 = fma(_2296, 0.5, 0.5);
    float _2304 = fma(_2298, -0.5, 0.5);
    float _2306 = fma(_2288, 0.5, 0.5);
    float _2308 = _2284 * 0.636619746685028076171875;
    float _2310 = -_2282;
    float _2312 = fma(_2308, _2310, 1.0);
    float3 _6695 = float3(_2302, _2304, _2300);
    float _2314 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_6695, float3(0.0), isnan(_6695)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_6695, float3(0.0), isnan(_6695)), level(0.0)).x;
    float3 _6706 = float3(_2302, _2304, _2300);
    float4 _2317 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_6706, float3(0.0), isnan(_6706)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_6706, float3(0.0), isnan(_6706)), level(0.0)).xyzw;
    float _2319 = _2317.x;
    float _2321 = _2317.y;
    float _2323 = _2317.z;
    float _2325 = _2317.w;
    float2 _6723 = float2(_2312, _2306);
    float3 _2329 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_6723, float2(0.0), isnan(_6723)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_6723, float2(0.0), isnan(_6723)), level(0.0)).xyz;
    float _2331 = _2329.x;
    float _2333 = _2329.y;
    float _2335 = _2329.z;
    float _2337 = float(uint(_962));
    float _2339 = trunc(_1304);
    int _2341 = int(_2339);
    int _2343 = ~_962;
    int _2345 = _2343 + 1;
    out.m_61.x = _708;
    out.m_61.y = _710;
    out.m_61.z = _712;
    out.m_61.w = _716;
    int _2347 = ~_962;
    int _2349 = _2347 + 1;
    float _2351 = _2202 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    int _2353 = abs(_1230);
    float _2355 = 1.0 / _2337;
    float _2357 = float(uint(_2341));
    float _2359 = exp2(_2351);
    int _2361 = as_type<int>(_2355) + (-2);
    float _2363 = as_type<float>(_2361) * _2357;
    float _2365 = trunc(_2363);
    float _2367 = precise::max(_2365, 0.0);
    uint _2370 = uint(_2367);
    float _2372 = float(_2341);
    float _2374 = -_2359;
    float _2376 = _2374 + 1.0;
    int _2378 = _2345 * int(_2370);
    int _2380 = _2378 + _2341;
    float _2382 = float(uint(_2380));
    float _2384 = as_type<float>(_2361) * _2382;
    bool _2386 = !_968;
    float _2388 = _2386 ? 7.345489978790283203125 : 1.0;
    float _2390 = trunc(_2384);
    float _2392 = precise::max(_2390, 0.0);
    uint _2394 = uint(_2392);
    float _2396 = _2388 * _958;
    bool _2398 = _2372 >= _1312;
    bool _2400 = isnan(_2372);
    bool _2402 = _2398 || _2400;
    bool _2404 = isnan(_1312);
    bool _2406 = _2402 || _2404;
    float _2408 = float(_2406);
    float _2410 = floor(_2396);
    int _2412 = int(_2370) + int(_2394);
    float _2414 = trunc(_2408);
    int _2416 = int(_2414);
    int _2418 = _2349 * _2412;
    int _2420 = _2418 + _2341;
    float _2422 = -_2410;
    float _2424 = _2396 + _2422;
    bool _2426 = uint(_2420) >= uint(_962);
    bool _2428 = !_2426;
    int _2430 = _2428 ? 0 : (-1);
    bool _2432 = _962 == 0;
    int _2434 = ~_2412;
    int _2436 = _2434 + _2430;
    int _2438 = _2436 + 1;
    float _2440 = _2424 * _1312;
    float _2442 = _1320 * _152;
    int _2444 = ~_2416;
    int _2446 = _2444 + 1;
    int _2448 = _2446 + 1;
    int _2450 = _962 * _2438;
    int _2452 = _2450 + _2341;
    int _2454 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4096;
    bool _2456 = _2454 != 0;
    float _2458 = trunc(_2440);
    int _2460 = int(_2458);
    int _2462 = _962 + (-1);
    bool _2464 = !_2432;
    int _2466 = _2464 ? _2452 : (-1);
    bool _2468 = !_2456;
    int _2470 = _2468 ? 0 : 1;
    int _2472 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 128;
    bool _2474 = _2472 != 0;
    float _2476 = trunc(_2442);
    int _2478 = int(_2476);
    int _2480 = _2466 * _2448;
    int _2482 = abs(_2470);
    int _2484 = abs(_1244);
    int _2486 = _2416 * _2462;
    int _2488 = _2486 + _2480;
    int _2490 = abs(_1236);
    int _2492 = _2488 * _2353;
    bool _2494 = !_2474;
    int _2496 = _2494 ? 0 : 1;
    int _2498 = _2460 * _2482;
    int _2500 = _2498 + _2341;
    int _2502 = abs(_2496);
    float _2504 = in.m_53.w;
    int _2506 = _2478 * _2490;
    int _2508 = _2506 + _2492;
    int _2510 = ~_962;
    int _2512 = _2510 + 1;
    int _2514 = _2500 * _2484;
    int _2516 = _2514 + _2508;
    float _2518 = float(uint(_2500));
    int _2520 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _2522 = _2520 != 0;
    int _2524 = _2460 * _2502;
    int _2526 = _2524 + _2516;
    int _2528 = ~_962;
    int _2530 = _2528 + 1;
    int _2532 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _2534 = _2532 != 0;
    float _2536 = float(uint(_2526));
    int _2538 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _2540 = _2538 != 0;
    float _2542 = as_type<float>(_2361) * _2536;
    int _2544 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2097152;
    bool _2546 = _2544 != 0;
    float _2548 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _2550 = _2548 + (*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _2552 = trunc(_2542);
    float _2554 = precise::max(_2552, 0.0);
    uint _2556 = uint(_2554);
    bool _2558 = _2504 > 0.5;
    float _2560 = 1.0 / _2550;
    int _2562 = _2530 * int(_2556);
    int _2564 = _2562 + _2526;
    float _2566 = float(uint(_2564));
    float _2568 = as_type<float>(_2361) * _2566;
    float _2570 = in.m_63.y;
    float _2572 = trunc(_2568);
    float _2574 = precise::max(_2572, 0.0);
    uint _2576 = uint(_2574);
    out.m_65.x = 1.0;
    out.m_65.y = 1.0;
    out.m_65.z = 1.0;
    float _2578 = as_type<float>(_2361) * _2518;
    int _2580 = int(_2556) + int(_2576);
    float _2582 = trunc(_2578);
    float _2584 = precise::max(_2582, 0.0);
    uint _2586 = uint(_2584);
    float _2588 = -_2570;
    float _2590 = _2588 + 1.0;
    int _2592 = _2512 * _2580;
    int _2594 = _2592 + _2526;
    int _2596 = _2558 ? as_type<int>(_2590) : as_type<int>(_2570);
    bool _2598 = uint(_2594) >= uint(_962);
    float _2600 = -(*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _2602 = _2600 + (*spvDescriptorSet0.vp_c9)._m0[133].w;
    bool _2604 = _970 > 0.5;
    float _2606 = -(*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _2608 = _956 + _2606;
    bool _2610 = !_2598;
    int _2612 = _2610 ? 0 : (-1);
    float _2614 = 1.0 / _2602;
    int _2616 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _2618 = _2616 != 0;
    int _2620 = ~_2580;
    int _2622 = _2620 + _2612;
    int _2624 = _2622 + 1;
    float _2626 = -(*spvDescriptorSet0.vp_c9)._m0[131].x;
    float _2628 = (*spvDescriptorSet0.vp_c9)._m0[132].x + _2626;
    float _2630 = _2618 ? as_type<float>(_2596) : _2570;
    float _2632 = -(*spvDescriptorSet0.vp_c9)._m0[132].x;
    float _2634 = _2632 + (*spvDescriptorSet0.vp_c9)._m0[133].x;
    float _2636 = _2570;
    bool _2638 = _2604;
    bool _2640 = _2618;
    int _2642 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[132].w);
    if (_2522)
    {
        float _2644 = _2604 ? _2590 : _2570;
        _2636 = _2644;
    }
    float _2646 = _2636;
    int _2648 = _962 * _2624;
    int _2650 = _2648 + _2526;
    float _2652 = in.m_63.x;
    if (_2534)
    {
        bool _2654 = _964 > 0.5;
        _2638 = _2654;
    }
    bool _2656 = _2638;
    float _2658 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    int _2660 = ~_962;
    int _2662 = _2660 + 1;
    float _2664 = _2628 * _2560;
    bool _2666 = !_2432;
    int _2668 = _2666 ? _2650 : (-1);
    if (_2540)
    {
        bool _2670 = _958 > 0.5;
        _2640 = _2670;
    }
    bool _2672 = _2640;
    int _2674 = _2662 * int(_2586);
    int _2676 = _2674 + _2500;
    int _2678 = _2668 >> 31;
    float _2680 = _2634 * _2614;
    bool _2682 = _956 >= (*spvDescriptorSet0.vp_c9)._m0[133].w;
    bool _2684 = isnan(_956);
    bool _2686 = _2682 || _2684;
    bool _2688 = isnan((*spvDescriptorSet0.vp_c9)._m0[133].w);
    bool _2690 = _2686 || _2688;
    float _2692 = float(_2690);
    float _2694 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _2696 = _956 + _2694;
    float _2698 = float(uint(_2676));
    float _2700 = fma(_2680, _2608, (*spvDescriptorSet0.vp_c9)._m0[132].x);
    int _2702 = _2678 & 3;
    float _2704 = -_2692;
    float _2706 = _2704 + 1.0;
    bool _2708 = _956 >= (*spvDescriptorSet0.vp_c9)._m0[132].w;
    bool _2710 = isnan(_956);
    bool _2712 = _2708 || _2710;
    bool _2714 = isnan((*spvDescriptorSet0.vp_c9)._m0[132].w);
    bool _2716 = _2712 || _2714;
    float _2718 = float(_2716);
    float _2720 = as_type<float>(_2361) * _2698;
    int _2722 = _2668 + _2702;
    float _2724 = fma(_2664, _2696, (*spvDescriptorSet0.vp_c9)._m0[131].x);
    bool _2726 = _956 >= (*spvDescriptorSet0.vp_c9)._m0[131].w;
    bool _2728 = isnan(_956);
    bool _2730 = _2726 || _2728;
    bool _2732 = isnan((*spvDescriptorSet0.vp_c9)._m0[131].w);
    bool _2734 = _2730 || _2732;
    float _2736 = float(_2734);
    float _2738 = _2718 * _2706;
    float _2740 = -_2718;
    float _2742 = _2740 + 1.0;
    int _2744 = _2722 >> 2;
    float _2746 = _2658 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    float _2748 = _2658;
    float _2750 = _2742;
    int _2752 = _2744;
    if (!_2540)
    {
        _2748 = _2652;
    }
    float _2754 = _2748;
    float _2756 = _2736 * _2742;
    int _2758 = _2744 << 4;
    int _2760 = _2758 + 368;
    float _2762 = fma(_2630, _2746, -0.5);
    float _2764 = _2754;
    if (!_2540)
    {
        _2750 = _2754;
    }
    float _2766 = _2750;
    float _2768 = _2724 * _2756;
    float _2770 = _2766;
    if (_2540)
    {
        _2764 = _2652;
    }
    float _2772 = _2764;
    float _2774 = -_2736;
    float _2776 = _2774 + 1.0;
    uint _2778 = uint(int(uint(_2760) >> uint(2)));
    uint _2780 = uint(int(uint(int(_2778)) >> uint(2)));
    int _2782 = int(_2778) & 3;
    float _2784 = (*spvDescriptorSet0.vp_c9)._m0[int(_2780)][_2782];
    int _2786 = int(_2778) + 1;
    uint _2788 = uint(int(uint(_2786) >> uint(2)));
    int _2790 = _2786 & 3;
    float _2792 = (*spvDescriptorSet0.vp_c9)._m0[int(_2788)][_2790];
    float _2794 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    float _2796 = _2772;
    if (_2540)
    {
        float _2798 = -_2772;
        float _2800 = _2798 + 1.0;
        _2752 = as_type<int>(_2800);
    }
    int _2802 = _2752;
    if (_2534)
    {
        float _2804 = -_2772;
        float _2806 = _2804 + 1.0;
        _2642 = as_type<int>(_2806);
    }
    int _2808 = _2642;
    float _2810 = -_1316;
    float _2812 = fma(_1306, _2762, _2810);
    float _2814 = fma((*spvDescriptorSet0.vp_c9)._m0[80].y, _2646, -0.5);
    float _2816 = fma(_2776, (*spvDescriptorSet0.vp_c9)._m0[131].x, _2768);
    if (_2540)
    {
        float _2818 = _2672 ? as_type<float>(_2802) : _2772;
        _2770 = _2818;
    }
    float _2820 = _2770;
    int _2822 = _2760 + 8;
    uint _2824 = uint(int(uint(_2822) >> uint(2)));
    uint _2826 = uint(int(uint(int(_2824)) >> uint(2)));
    int _2828 = int(_2824) & 3;
    float _2830 = (*spvDescriptorSet0.vp_c9)._m0[int(_2826)][_2828];
    int _2832 = int(_2824) + 1;
    uint _2834 = uint(int(uint(_2832) >> uint(2)));
    int _2836 = _2832 & 3;
    float _2838 = (*spvDescriptorSet0.vp_c9)._m0[int(_2834)][_2836];
    if (_2534)
    {
        float _2840 = _2656 ? as_type<float>(_2808) : _2772;
        _2796 = _2840;
    }
    float _2842 = _2796;
    float _2844 = fma(_2700, _2738, _2816);
    int _2846 = _2668 & 3;
    bool _2848 = _2846 != 0;
    float _2850 = trunc(_2720);
    float _2852 = precise::max(_2850, 0.0);
    uint _2854 = uint(_2852);
    float _2856 = -_1110;
    float _2858 = fma(_1310, _2814, _2856);
    bool _2860 = uint(_2846) > 1u;
    float _2862 = _2794 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    int _2864 = _2668 & 3;
    bool _2866 = _2864 != 0;
    float _2868 = fma(_2820, (*spvDescriptorSet0.vp_c9)._m0[80].x, -0.5);
    bool _2870 = uint(_2846) >= 2u;
    float _2872 = fma(_2862, _2842, -0.5);
    int _2874 = _2866 ? 0 : 1;
    float _2876 = fma(_1308, _2868, _1064);
    bool _2878 = _2846 != 3;
    float _2880 = fma(_1324, _2872, _1302);
    int _2882 = ~_2874;
    int _2884 = _2882 + 1;
    int _2886 = _2884 + 1;
    int _2888 = int(_2586) + int(_2854);
    float _2890 = _2880 + 0.5;
    int _2892 = _2886;
    if (!_2860)
    {
        int _2894 = ~_2874;
        int _2896 = _2894 + 1;
        _2892 = _2896;
    }
    int _2898 = _2892;
    int _2900 = ~_962;
    int _2902 = _2900 + 1;
    int _2904 = abs(_2898);
    bool _2906 = !_2848;
    int _2908 = _2906 ? 0 : 1;
    int _2910 = _2902 * _2888;
    int _2912 = _2910 + _2500;
    int _2914 = _2870 ? 0 : 1;
    bool _2916 = _2846 != 3;
    int _2918 = ~_2914;
    int _2920 = _2918 + 1;
    int _2922 = _2920 + 1;
    bool _2924 = !_2916;
    int _2926 = _2924 ? 0 : (-1);
    int _2928 = abs(_2908);
    int _2930 = _2922;
    if (_2878)
    {
        int _2932 = ~_2914;
        int _2934 = _2932 + 1;
        _2930 = _2934;
    }
    int _2936 = _2930;
    int _2938 = ~_2904;
    int _2940 = _2938 + 1;
    int _2942 = _2940 + 1;
    bool _2944 = uint(_2912) >= uint(_962);
    int _2946 = abs(_2926);
    int _2948 = _2942 * as_type<int>(_2792);
    int _2950 = abs(_2936);
    int _2952 = ~_2928;
    int _2954 = _2952 + 1;
    int _2956 = _2954 + 1;
    bool _2958 = !_2546;
    int _2960 = _2958 ? 0 : 1;
    int _2962 = _2956 * as_type<int>(_2784);
    int _2964 = _2962 + _2948;
    int _2966 = ~_2950;
    int _2968 = _2966 + 1;
    int _2970 = _2968 + 1;
    bool _2972 = !_2944;
    int _2974 = _2972 ? 0 : (-1);
    int _2976 = abs(_2960);
    int _2978 = _2970 * as_type<int>(_2830);
    int _2980 = _2978 + _2964;
    int _2982 = ~_2946;
    int _2984 = _2982 + 1;
    int _2986 = _2984 + 1;
    float _2988 = _2214 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    int _2990 = ~_2888;
    int _2992 = _2990 + _2974;
    int _2994 = _2992 + 1;
    int _2996 = ~_2976;
    int _2998 = _2996 + 1;
    int _3000 = _2998 + 1;
    int _3002 = _2986 * as_type<int>(_2838);
    int _3004 = _3002 + _2980;
    float _3006 = fma(_2692, (*spvDescriptorSet0.vp_c9)._m0[133].x, _2844);
    float _3008 = fma(_2222, (*spvDescriptorSet0.vp_c8)._m0[6].x, _2988);
    float _3010 = _930 * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    int _3012 = _3004 * _3000;
    float _3014 = _928 * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _3016 = _932 * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    int _3018 = _962 * _2994;
    int _3020 = _3018 + _2500;
    float _3022 = _3010 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _3024 = _3014 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _3026 = _3016 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _3028 = _3006 * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    bool _3030 = !_2432;
    int _3032 = _3030 ? _3020 : (-1);
    float _3034 = _1952 * _2010;
    float _3036 = fma(_2210, (*spvDescriptorSet0.vp_c8)._m0[6].z, _3008);
    bool _3038 = _1952 > 0.0;
    bool _3040 = isnan(_1952);
    bool _3042 = _3038 || _3040;
    bool _3044 = isnan(0.0);
    bool _3046 = _3042 || _3044;
    out.m_67.x = _3024;
    out.m_67.y = _3022;
    out.m_67.z = _3026;
    out.m_67.w = _3028;
    int _3048 = _3032 * _2976;
    int _3050 = _3048 + _3012;
    float _3052 = _3034 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _3054 = fma(_2244, (*spvDescriptorSet0.vp_c8)._m0[6].w, _3036);
    bool _3056 = _2010 <= 0.0;
    bool _3058 = !_3046;
    bool _3060 = _3056 || _3058;
    float _3062 = _2290 + _2258;
    float _3064 = _3052 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _3066 = float(_3050);
    float _3068 = _3054 + _2258;
    float _3070 = _2258 * 0.5;
    float _3072 = _2858 + 0.5;
    out.m_49.x = _3064;
    float _3074 = _2812 + 0.5;
    float _3076 = _2876 + 0.5;
    float _3078 = _2376 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    out.m_69.x = _3066;
    float _3080 = _3068 * 0.5;
    float _3082 = _3078 * _2314;
    float _3084 = -_3078;
    float _3086 = _3084 + 1.0;
    float _3088 = _3062 * 0.5;
    float _3090 = fma(_2292, -0.5, _3070);
    float _3092 = _2325 * _3082;
    float _3094 = _2335 * _3082;
    float _3096 = _2325 * _3086;
    float _3098 = fma(_2331, _3092, _2319);
    float _3100 = fma(_2333, _3092, _2321);
    float _3102 = fma(_2325, _3094, _2323);
    out.m_71.x = _3076;
    out.m_71.y = _3072;
    out.m_71.z = _2890;
    out.m_71.w = _3074;
    out.gl_Position.x = _2290;
    out.gl_Position.y = _2292;
    out.gl_Position.z = _3054;
    out.gl_Position.w = _2258;
    out.m_73.x = _3088;
    out.m_73.y = _3090;
    out.m_73.z = _3080;
    out.m_73.w = _2258;
    out.m_75.x = _3098;
    out.m_75.y = _3100;
    out.m_75.z = _3102;
    out.m_75.w = _3096;
    if (!_3060)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    out.m_49.x = 0.0;
    float _3104 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _3104;
    out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
}


vertex main0_out main0_z(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]])
{
    main0_out out = {};
    out.m_61 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_67 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_49 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_71 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_65 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_47 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_73 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_69 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_75 = float4(0.0, 0.0, 0.0, 1.0);
    bool _954 = false;
    bool _738 = false;
    bool _640 = false;
    bool _412 = false;
    bool _196 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _89 = in.m_42.w;
    float _91 = in.m_44.w;
    float _93 = trunc(_89);
    int _96 = int(_93);
    float _98 = -_91;
    float _100 = _98 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    out.m_47.y = _100;
    bool _104 = _96 >= 1;
    float _106 = 0.0;
    float _108 = _91;
    float _110 = _100;
    if (!_104)
    {
        _106 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _112 = _106;
    if (!_104)
    {
        out.m_49.x = 0.0;
    }
    int _114 = 0;
    if (!_104)
    {
        float _116 = _112 * 5.0;
        _114 = as_type<int>(_116);
    }
    int _118 = _114;
    int _120 = _118;
    if (!_104)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _3172 = as_type<float>(_118);
        out.gl_Position.z = _3172;
    }
    if (!_104)
    {
        return out;
    }
    bool _122 = _91 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _124 = isnan(_91);
    bool _126 = _122 || _124;
    bool _128 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _130 = _126 || _128;
    float _132 = float(_96);
    bool _134 = _100 >= _132;
    bool _136 = !_130;
    bool _138 = _134 || _136;
    if (_138)
    {
        _108 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _140 = _108;
    if (_138)
    {
        out.m_49.x = 0.0;
    }
    if (_138)
    {
        float _142 = _140 * 5.0;
        _120 = as_type<int>(_142);
    }
    int _144 = _120;
    if (_138)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _3227 = as_type<float>(_144);
        out.gl_Position.z = _3227;
    }
    if (_138)
    {
        return out;
    }
    float _146 = in.m_51.x;
    float _148 = in.m_51.y;
    float _150 = in.m_51.z;
    float _152 = 1.0 / _132;
    bool _154 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _156 = _100 * _152;
    float _158 = _148 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _160 = _148 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _162 = _148 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _164 = fma(_146, (*spvDescriptorSet0.vp_c10)._m0[4].x, _158);
    float _166 = fma(_146, (*spvDescriptorSet0.vp_c10)._m0[5].x, _160);
    float _168 = fma(_146, (*spvDescriptorSet0.vp_c10)._m0[6].x, _162);
    float _170 = fma(_150, (*spvDescriptorSet0.vp_c10)._m0[4].z, _164);
    float _172 = fma(_150, (*spvDescriptorSet0.vp_c10)._m0[5].z, _166);
    float _174 = fma(_150, (*spvDescriptorSet0.vp_c10)._m0[6].z, _168);
    bool _176 = !_154;
    float _194;
    if (!_176)
    {
        float _178 = in.m_53.x;
        float _180 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _182 = _178 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _184 = fma(_182, (*spvDescriptorSet0.vp_c9)._m0[12].x, _100);
        float _186 = _184 * _180;
        float _188 = floor(_186);
        float _190 = -_188;
        float _192 = _186 + _190;
        _194 = _192;
        _196 = true;
    }
    else
    {
        _194 = _156;
    }
    _196 = false;
    float _198 = _194;
    float _200 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _202 = _198 + _200;
    float _204 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _206 = _198 + _204;
    bool _208 = _198 >= (*spvDescriptorSet0.vp_c9)._m0[146].w;
    bool _210 = isnan(_198);
    bool _212 = _208 || _210;
    bool _214 = isnan((*spvDescriptorSet0.vp_c9)._m0[146].w);
    bool _216 = _212 || _214;
    float _218 = float(_216);
    float _220 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _222 = (*spvDescriptorSet0.vp_c9)._m0[146].w + _220;
    float _224 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _226 = _198 + _224;
    float _228 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _230 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _228;
    float _232 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _234 = _232 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _236 = 1.0 / _222;
    bool _238 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].x;
    float _240 = 1.0 / _234;
    float _242 = 1.0 / _230;
    float _244 = _202 * _236;
    bool _246 = _198 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _248 = isnan(_198);
    bool _250 = _246 || _248;
    bool _252 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _254 = _250 || _252;
    float _256 = float(_254);
    float _258 = -_218;
    float _260 = _258 + 1.0;
    float _262 = _256 * _260;
    float _264 = _206 * _240;
    bool _266 = _198 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _268 = isnan(_198);
    bool _270 = _266 || _268;
    bool _272 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _274 = _270 || _272;
    float _276 = float(_274);
    float _278 = -(*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _280 = (*spvDescriptorSet0.vp_c9)._m0[144].z + _278;
    bool _282 = _198 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _284 = isnan(_198);
    bool _286 = _282 || _284;
    bool _288 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _290 = _286 || _288;
    float _292 = float(_290);
    float _294 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _296 = _294 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _298 = -_256;
    float _300 = _298 + 1.0;
    float _302 = -_276;
    float _304 = _302 + 1.0;
    float _306 = _226 * _242;
    float _308 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _310 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _308;
    float _312 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _314 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _312;
    float _316 = _292 * _304;
    float _318 = fma(_280, _306, (*spvDescriptorSet0.vp_c9)._m0[143].z);
    float _320 = fma(_310, _306, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _322 = fma(_314, _306, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _324 = _276 * _300;
    float _326 = -(*spvDescriptorSet0.vp_c9)._m0[144].z;
    float _328 = _326 + (*spvDescriptorSet0.vp_c9)._m0[145].z;
    float _330 = _320 * _316;
    float _332 = _322 * _316;
    float _334 = _318 * _316;
    float _336 = -_292;
    float _338 = _336 + 1.0;
    float _340 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _342 = _340 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _344 = fma(_338, (*spvDescriptorSet0.vp_c9)._m0[143].x, _332);
    float _346 = fma(_338, (*spvDescriptorSet0.vp_c9)._m0[143].y, _330);
    float _348 = fma(_338, (*spvDescriptorSet0.vp_c9)._m0[143].z, _334);
    float _350 = -(*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _352 = (*spvDescriptorSet0.vp_c9)._m0[146].x + _350;
    float _354 = fma(_296, _264, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _356 = fma(_342, _264, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _358 = fma(_328, _264, (*spvDescriptorSet0.vp_c9)._m0[144].z);
    float _360 = -(*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _362 = (*spvDescriptorSet0.vp_c9)._m0[146].y + _360;
    float _364 = -(*spvDescriptorSet0.vp_c9)._m0[145].z;
    float _366 = (*spvDescriptorSet0.vp_c9)._m0[146].z + _364;
    float _368 = fma(_354, _324, _344);
    float _370 = fma(_352, _244, (*spvDescriptorSet0.vp_c9)._m0[145].x);
    float _372 = fma(_362, _244, (*spvDescriptorSet0.vp_c9)._m0[145].y);
    float _374 = fma(_366, _244, (*spvDescriptorSet0.vp_c9)._m0[145].z);
    float _376 = fma(_356, _324, _346);
    float _378 = fma(_358, _324, _348);
    float _380 = fma(_370, _262, _368);
    float _382 = fma(_372, _262, _376);
    float _384 = fma(_374, _262, _378);
    float _386 = fma(_218, (*spvDescriptorSet0.vp_c9)._m0[146].x, _380);
    float _388 = fma(_218, (*spvDescriptorSet0.vp_c9)._m0[146].y, _382);
    float _390 = fma(_218, (*spvDescriptorSet0.vp_c9)._m0[146].z, _384);
    bool _392 = !_238;
    float _410;
    if (!_392)
    {
        float _394 = in.m_53.x;
        float _396 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].x;
        float _398 = _394 * (*spvDescriptorSet0.vp_c9)._m0[12].y;
        float _400 = fma(_398, (*spvDescriptorSet0.vp_c9)._m0[11].x, _100);
        float _402 = _400 * _396;
        float _404 = floor(_402);
        float _406 = -_404;
        float _408 = _402 + _406;
        _410 = _408;
        _412 = true;
    }
    else
    {
        _410 = _156;
    }
    _412 = false;
    float _414 = _410;
    float _416 = in.m_55.x;
    float _418 = in.m_55.y;
    float _420 = in.m_55.z;
    float _422 = -(*spvDescriptorSet0.vp_c9)._m0[109].w;
    float _424 = _414 + _422;
    float _426 = -(*spvDescriptorSet0.vp_c9)._m0[108].w;
    float _428 = _414 + _426;
    float _430 = -(*spvDescriptorSet0.vp_c9)._m0[109].w;
    float _432 = (*spvDescriptorSet0.vp_c9)._m0[110].w + _430;
    float _434 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _436 = (*spvDescriptorSet0.vp_c9)._m0[108].w + _434;
    float _438 = -(*spvDescriptorSet0.vp_c9)._m0[108].w;
    float _440 = _438 + (*spvDescriptorSet0.vp_c9)._m0[109].w;
    float _442 = 1.0 / _432;
    bool _444 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _446 = 1.0 / _440;
    float _448 = _388 * _418;
    bool _450 = _414 >= (*spvDescriptorSet0.vp_c9)._m0[110].w;
    bool _452 = isnan(_414);
    bool _454 = _450 || _452;
    bool _456 = isnan((*spvDescriptorSet0.vp_c9)._m0[110].w);
    bool _458 = _454 || _456;
    float _460 = float(_458);
    float _462 = _390 * _420;
    float _464 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _466 = _414 + _464;
    float _468 = 1.0 / _436;
    float _470 = _424 * _442;
    bool _472 = _414 >= (*spvDescriptorSet0.vp_c9)._m0[109].w;
    bool _474 = isnan(_414);
    bool _476 = _472 || _474;
    bool _478 = isnan((*spvDescriptorSet0.vp_c9)._m0[109].w);
    bool _480 = _476 || _478;
    float _482 = float(_480);
    float _484 = -_460;
    float _486 = _484 + 1.0;
    float _488 = _386 * _416;
    float _490 = _482 * _486;
    float _492 = _428 * _446;
    bool _494 = _414 >= (*spvDescriptorSet0.vp_c9)._m0[108].w;
    bool _496 = isnan(_414);
    bool _498 = _494 || _496;
    bool _500 = isnan((*spvDescriptorSet0.vp_c9)._m0[108].w);
    bool _502 = _498 || _500;
    float _504 = float(_502);
    float _506 = -(*spvDescriptorSet0.vp_c9)._m0[107].z;
    float _508 = (*spvDescriptorSet0.vp_c9)._m0[108].z + _506;
    bool _510 = _414 >= (*spvDescriptorSet0.vp_c9)._m0[107].w;
    bool _512 = isnan(_414);
    bool _514 = _510 || _512;
    bool _516 = isnan((*spvDescriptorSet0.vp_c9)._m0[107].w);
    bool _518 = _514 || _516;
    float _520 = float(_518);
    float _522 = -(*spvDescriptorSet0.vp_c9)._m0[108].x;
    float _524 = _522 + (*spvDescriptorSet0.vp_c9)._m0[109].x;
    float _526 = -_482;
    float _528 = _526 + 1.0;
    float _530 = -_504;
    float _532 = _530 + 1.0;
    float _534 = _466 * _468;
    float _536 = -(*spvDescriptorSet0.vp_c9)._m0[107].y;
    float _538 = (*spvDescriptorSet0.vp_c9)._m0[108].y + _536;
    float _540 = -(*spvDescriptorSet0.vp_c9)._m0[107].x;
    float _542 = (*spvDescriptorSet0.vp_c9)._m0[108].x + _540;
    float _544 = _520 * _532;
    float _546 = fma(_508, _534, (*spvDescriptorSet0.vp_c9)._m0[107].z);
    float _548 = fma(_538, _534, (*spvDescriptorSet0.vp_c9)._m0[107].y);
    float _550 = fma(_542, _534, (*spvDescriptorSet0.vp_c9)._m0[107].x);
    float _552 = _504 * _528;
    float _554 = -(*spvDescriptorSet0.vp_c9)._m0[108].y;
    float _556 = _554 + (*spvDescriptorSet0.vp_c9)._m0[109].y;
    float _558 = _548 * _544;
    float _560 = -(*spvDescriptorSet0.vp_c9)._m0[108].z;
    float _562 = _560 + (*spvDescriptorSet0.vp_c9)._m0[109].z;
    float _564 = _550 * _544;
    float _566 = -_520;
    float _568 = _566 + 1.0;
    float _570 = _546 * _544;
    float _572 = fma(_568, (*spvDescriptorSet0.vp_c9)._m0[107].x, _564);
    float _574 = fma(_568, (*spvDescriptorSet0.vp_c9)._m0[107].y, _558);
    float _576 = fma(_568, (*spvDescriptorSet0.vp_c9)._m0[107].z, _570);
    float _578 = -(*spvDescriptorSet0.vp_c9)._m0[109].x;
    float _580 = (*spvDescriptorSet0.vp_c9)._m0[110].x + _578;
    float _582 = fma(_524, _492, (*spvDescriptorSet0.vp_c9)._m0[108].x);
    float _584 = fma(_556, _492, (*spvDescriptorSet0.vp_c9)._m0[108].y);
    float _586 = fma(_562, _492, (*spvDescriptorSet0.vp_c9)._m0[108].z);
    float _588 = -(*spvDescriptorSet0.vp_c9)._m0[109].y;
    float _590 = (*spvDescriptorSet0.vp_c9)._m0[110].y + _588;
    float _592 = -(*spvDescriptorSet0.vp_c9)._m0[109].z;
    float _594 = (*spvDescriptorSet0.vp_c9)._m0[110].z + _592;
    float _596 = fma(_582, _552, _572);
    float _598 = fma(_580, _470, (*spvDescriptorSet0.vp_c9)._m0[109].x);
    float _600 = fma(_590, _470, (*spvDescriptorSet0.vp_c9)._m0[109].y);
    float _602 = fma(_594, _470, (*spvDescriptorSet0.vp_c9)._m0[109].z);
    float _604 = fma(_584, _552, _574);
    float _606 = fma(_586, _552, _576);
    float _608 = fma(_598, _490, _596);
    float _610 = fma(_600, _490, _604);
    float _612 = fma(_602, _490, _606);
    float _614 = fma(_460, (*spvDescriptorSet0.vp_c9)._m0[110].x, _608);
    float _616 = fma(_460, (*spvDescriptorSet0.vp_c9)._m0[110].y, _610);
    float _618 = fma(_460, (*spvDescriptorSet0.vp_c9)._m0[110].z, _612);
    bool _620 = !_444;
    float _638;
    if (!_620)
    {
        float _622 = in.m_53.x;
        float _624 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _626 = _622 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _628 = fma(_626, (*spvDescriptorSet0.vp_c9)._m0[11].y, _100);
        float _630 = _628 * _624;
        float _632 = floor(_630);
        float _634 = -_632;
        float _636 = _630 + _634;
        _638 = _636;
        _640 = true;
    }
    else
    {
        _638 = _156;
    }
    _640 = false;
    float _642 = _638;
    bool _644 = _642 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _646 = isnan(_642);
    bool _648 = _644 || _646;
    bool _650 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _652 = _648 || _650;
    float _654 = float(_652);
    float _656 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _658 = _656 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _660 = _642 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _662 = isnan(_642);
    bool _664 = _660 || _662;
    bool _666 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _668 = _664 || _666;
    float _670 = float(_668);
    float _672 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _674 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _672;
    float _676 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _678 = _642 + _676;
    float _680 = -_654;
    float _682 = _680 + 1.0;
    bool _684 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].z;
    float _686 = 1.0 / _658;
    float _688 = _670 * _682;
    float _690 = -_670;
    float _692 = _690 + 1.0;
    float _694 = _674 * _686;
    float _696 = _616 * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _698 = fma(_694, _678, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _700 = _614 * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _702 = _698 * _688;
    float _704 = _618 * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _706 = fma(_692, (*spvDescriptorSet0.vp_c9)._m0[115].x, _702);
    float _708 = _700 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _710 = _696 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _712 = _704 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _714 = fma(_654, (*spvDescriptorSet0.vp_c9)._m0[116].x, _706);
    float _716 = _714 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    bool _718 = !_684;
    float _736;
    if (!_718)
    {
        float _720 = in.m_53.x;
        float _722 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].z;
        float _724 = _720 * (*spvDescriptorSet0.vp_c9)._m0[12].w;
        float _726 = fma(_724, (*spvDescriptorSet0.vp_c9)._m0[11].z, _100);
        float _728 = _726 * _722;
        float _730 = floor(_728);
        float _732 = -_730;
        float _734 = _728 + _732;
        _736 = _734;
        _738 = true;
    }
    else
    {
        _736 = _156;
    }
    _738 = false;
    float _740 = _736;
    float _742 = -(*spvDescriptorSet0.vp_c9)._m0[125].w;
    float _744 = _740 + _742;
    float _746 = -(*spvDescriptorSet0.vp_c9)._m0[124].w;
    float _748 = _740 + _746;
    bool _750 = _740 >= (*spvDescriptorSet0.vp_c9)._m0[126].w;
    bool _752 = isnan(_740);
    bool _754 = _750 || _752;
    bool _756 = isnan((*spvDescriptorSet0.vp_c9)._m0[126].w);
    bool _758 = _754 || _756;
    float _760 = float(_758);
    float _762 = -(*spvDescriptorSet0.vp_c9)._m0[125].w;
    float _764 = (*spvDescriptorSet0.vp_c9)._m0[126].w + _762;
    float _766 = -(*spvDescriptorSet0.vp_c9)._m0[123].w;
    float _768 = _740 + _766;
    float _770 = -(*spvDescriptorSet0.vp_c9)._m0[123].w;
    float _772 = (*spvDescriptorSet0.vp_c9)._m0[124].w + _770;
    float _774 = -(*spvDescriptorSet0.vp_c9)._m0[124].w;
    float _776 = _774 + (*spvDescriptorSet0.vp_c9)._m0[125].w;
    float _778 = 1.0 / _764;
    bool _780 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].w;
    float _782 = 1.0 / _776;
    float _784 = 1.0 / _772;
    float _786 = _744 * _778;
    bool _788 = _740 >= (*spvDescriptorSet0.vp_c9)._m0[125].w;
    bool _790 = isnan(_740);
    bool _792 = _788 || _790;
    bool _794 = isnan((*spvDescriptorSet0.vp_c9)._m0[125].w);
    bool _796 = _792 || _794;
    float _798 = float(_796);
    float _800 = -_760;
    float _802 = _800 + 1.0;
    float _804 = _798 * _802;
    float _806 = _748 * _782;
    bool _808 = _740 >= (*spvDescriptorSet0.vp_c9)._m0[124].w;
    bool _810 = isnan(_740);
    bool _812 = _808 || _810;
    bool _814 = isnan((*spvDescriptorSet0.vp_c9)._m0[124].w);
    bool _816 = _812 || _814;
    float _818 = float(_816);
    float _820 = -(*spvDescriptorSet0.vp_c9)._m0[123].z;
    float _822 = (*spvDescriptorSet0.vp_c9)._m0[124].z + _820;
    bool _824 = _740 >= (*spvDescriptorSet0.vp_c9)._m0[123].w;
    bool _826 = isnan(_740);
    bool _828 = _824 || _826;
    bool _830 = isnan((*spvDescriptorSet0.vp_c9)._m0[123].w);
    bool _832 = _828 || _830;
    float _834 = float(_832);
    float _836 = -(*spvDescriptorSet0.vp_c9)._m0[124].x;
    float _838 = _836 + (*spvDescriptorSet0.vp_c9)._m0[125].x;
    float _840 = -_798;
    float _842 = _840 + 1.0;
    float _844 = -_818;
    float _846 = _844 + 1.0;
    float _848 = _768 * _784;
    float _850 = -(*spvDescriptorSet0.vp_c9)._m0[123].y;
    float _852 = (*spvDescriptorSet0.vp_c9)._m0[124].y + _850;
    float _854 = -(*spvDescriptorSet0.vp_c9)._m0[123].x;
    float _856 = (*spvDescriptorSet0.vp_c9)._m0[124].x + _854;
    float _858 = _834 * _846;
    float _860 = fma(_822, _848, (*spvDescriptorSet0.vp_c9)._m0[123].z);
    float _862 = fma(_852, _848, (*spvDescriptorSet0.vp_c9)._m0[123].y);
    float _864 = fma(_856, _848, (*spvDescriptorSet0.vp_c9)._m0[123].x);
    float _866 = _818 * _842;
    float _868 = _860 * _858;
    float _870 = _862 * _858;
    float _872 = _864 * _858;
    float _874 = -_834;
    float _876 = _874 + 1.0;
    float _878 = -(*spvDescriptorSet0.vp_c9)._m0[124].y;
    float _880 = _878 + (*spvDescriptorSet0.vp_c9)._m0[125].y;
    float _882 = -(*spvDescriptorSet0.vp_c9)._m0[124].z;
    float _884 = _882 + (*spvDescriptorSet0.vp_c9)._m0[125].z;
    float _886 = fma(_876, (*spvDescriptorSet0.vp_c9)._m0[123].x, _872);
    float _888 = fma(_876, (*spvDescriptorSet0.vp_c9)._m0[123].y, _870);
    float _890 = -(*spvDescriptorSet0.vp_c9)._m0[125].x;
    float _892 = (*spvDescriptorSet0.vp_c9)._m0[126].x + _890;
    float _894 = fma(_838, _806, (*spvDescriptorSet0.vp_c9)._m0[124].x);
    float _896 = fma(_880, _806, (*spvDescriptorSet0.vp_c9)._m0[124].y);
    float _898 = fma(_876, (*spvDescriptorSet0.vp_c9)._m0[123].z, _868);
    float _900 = -(*spvDescriptorSet0.vp_c9)._m0[125].y;
    float _902 = (*spvDescriptorSet0.vp_c9)._m0[126].y + _900;
    float _904 = fma(_884, _806, (*spvDescriptorSet0.vp_c9)._m0[124].z);
    float _906 = -(*spvDescriptorSet0.vp_c9)._m0[125].z;
    float _908 = (*spvDescriptorSet0.vp_c9)._m0[126].z + _906;
    float _910 = fma(_894, _866, _886);
    float _912 = fma(_892, _786, (*spvDescriptorSet0.vp_c9)._m0[125].x);
    float _914 = fma(_902, _786, (*spvDescriptorSet0.vp_c9)._m0[125].y);
    float _916 = fma(_896, _866, _888);
    float _918 = fma(_908, _786, (*spvDescriptorSet0.vp_c9)._m0[125].z);
    float _920 = fma(_904, _866, _898);
    float _922 = fma(_912, _804, _910);
    float _924 = fma(_914, _804, _916);
    float _926 = fma(_918, _804, _920);
    float _928 = fma(_760, (*spvDescriptorSet0.vp_c9)._m0[126].x, _922);
    float _930 = fma(_760, (*spvDescriptorSet0.vp_c9)._m0[126].y, _924);
    float _932 = fma(_760, (*spvDescriptorSet0.vp_c9)._m0[126].z, _926);
    bool _934 = !_780;
    float _952;
    if (!_934)
    {
        float _936 = in.m_53.x;
        float _938 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].w;
        float _940 = _936 * (*spvDescriptorSet0.vp_c9)._m0[13].x;
        float _942 = fma(_940, (*spvDescriptorSet0.vp_c9)._m0[11].w, _100);
        float _944 = _942 * _938;
        float _946 = floor(_944);
        float _948 = -_946;
        float _950 = _944 + _948;
        _952 = _950;
        _954 = true;
    }
    else
    {
        _952 = _156;
    }
    _954 = false;
    float _956 = _952;
    float _958 = in.m_53.x;
    float _960 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].x);
    int _962 = int(_960);
    float _964 = in.m_53.z;
    int _966 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _968 = _966 != 0;
    float _970 = in.m_53.y;
    float _972 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    float _974 = in.m_42.x;
    float _976 = in.m_42.y;
    float _978 = in.m_42.z;
    float _980 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _982 = (*spvDescriptorSet0.vp_c8)._m0[28].y * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _984 = fma((*spvDescriptorSet0.vp_c8)._m0[28].x, (*spvDescriptorSet0.vp_c8)._m0[28].x, _982);
    float _986 = (*spvDescriptorSet0.vp_c8)._m0[0].y * (*spvDescriptorSet0.vp_c10)._m0[9].w;
    float _988 = _958 * 2.0;
    float _990 = _958 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    float _992 = (*spvDescriptorSet0.vp_c9)._m0[83].z + (*spvDescriptorSet0.vp_c9)._m0[83].x;
    float _994 = floor(_988);
    float _996 = -_972;
    float _998 = fma(_990, 2.0, _996);
    float _1000 = fma((*spvDescriptorSet0.vp_c8)._m0[0].x, (*spvDescriptorSet0.vp_c10)._m0[8].w, _986);
    float _1002 = _970 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    float _1004 = _970 * 2.0;
    float _1006 = (*spvDescriptorSet0.vp_c9)._m0[82].x + (*spvDescriptorSet0.vp_c9)._m0[81].z;
    float _1008 = fma((*spvDescriptorSet0.vp_c8)._m0[0].z, (*spvDescriptorSet0.vp_c10)._m0[10].w, _1000);
    float _1010 = fma(_1002, -2.0, _980);
    float _1012 = _964 * 2.0;
    float _1014 = _976 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _1016 = _976 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _1018 = _976 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _1020 = floor(_1004);
    float _1022 = fma(_974, (*spvDescriptorSet0.vp_c10)._m0[4].x, _1014);
    float _1024 = fma(_974, (*spvDescriptorSet0.vp_c10)._m0[5].x, _1016);
    float _1026 = fma(_974, (*spvDescriptorSet0.vp_c10)._m0[6].x, _1018);
    float _1028 = _958 + _970;
    float _1030 = _958 + _964;
    float _1032 = fma(_978, (*spvDescriptorSet0.vp_c10)._m0[4].z, _1022);
    float _1034 = fma(_978, (*spvDescriptorSet0.vp_c10)._m0[5].z, _1024);
    float _1036 = floor(_1012);
    float _1038 = _1028 + (-1.0);
    float _1040 = _970 + _964;
    float _1042 = _1030 + (-1.0);
    float _1044 = fma(_978, (*spvDescriptorSet0.vp_c10)._m0[6].z, _1026);
    bool _1046 = _994 > 0.0;
    float _1048 = _1040 + (-1.0);
    float _1050 = fma(_1042, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _1052 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].y);
    int _1054 = int(_1052);
    float _1056 = fma(_1048, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    float _1058 = _1048;
    if (!_968)
    {
        _1058 = _964;
    }
    float _1060 = _1058;
    float _1062 = -_100;
    float _1064 = fma(_1062, (*spvDescriptorSet0.vp_c9)._m0[76].x, _998);
    float _1066 = _1060;
    if (_968)
    {
        _1066 = _970;
    }
    float _1068 = _1066;
    float _1070 = (*spvDescriptorSet0.vp_c9)._m0[83].w + (*spvDescriptorSet0.vp_c9)._m0[83].y;
    bool _1072 = _1036 > 0.0;
    float _1074 = _1044 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    bool _1076 = _1036 >= 0.0;
    bool _1078 = isnan(_1036);
    bool _1080 = _1076 || _1078;
    bool _1082 = isnan(0.0);
    bool _1084 = _1080 || _1082;
    float _1086 = fma(_1068, (*spvDescriptorSet0.vp_c9)._m0[83].w, _1070);
    float _1088 = _1068;
    float _1090 = _1070;
    if (!_968)
    {
        _1088 = _964;
    }
    float _1092 = _1088;
    float _1094 = _1092;
    if (!_968)
    {
        _1090 = _970;
    }
    float _1096 = _1090;
    float _1098 = fma((*spvDescriptorSet0.vp_c8)._m0[28].z, (*spvDescriptorSet0.vp_c8)._m0[28].z, _984);
    float _1100 = _1096;
    if (_968)
    {
        _1094 = _970;
    }
    float _1102 = _1094;
    float _1104 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _1106 = log2(_1104);
    if (_968)
    {
        _1100 = _958;
    }
    float _1108 = _1100;
    float _1110 = fma(_100, (*spvDescriptorSet0.vp_c9)._m0[76].y, _1010);
    bool _1112 = _994 >= 0.0;
    bool _1114 = isnan(_994);
    bool _1116 = _1112 || _1114;
    bool _1118 = isnan(0.0);
    bool _1120 = _1116 || _1118;
    float _1122 = _1102 * (*spvDescriptorSet0.vp_c9)._m0[82].y;
    int _1124 = _1084 ? 0 : 1;
    float _1126 = fma(_1108, (*spvDescriptorSet0.vp_c9)._m0[83].z, _992);
    float _1128 = _1108 * (*spvDescriptorSet0.vp_c9)._m0[82].x;
    bool _1130 = _1020 >= 0.0;
    bool _1132 = isnan(_1020);
    bool _1134 = _1130 || _1132;
    bool _1136 = isnan(0.0);
    bool _1138 = _1134 || _1136;
    float _1140 = rsqrt(_1098);
    int _1142 = ~_1124;
    int _1144 = _1142 + 1;
    int _1146 = _1144 + 1;
    float _1148 = -_1006;
    float _1150 = fma(_1128, 2.0, _1148);
    int _1152 = _1146;
    if (!_1072)
    {
        int _1154 = ~_1124;
        int _1156 = _1154 + 1;
        _1152 = _1156;
    }
    int _1158 = _1152;
    bool _1160 = _1020 > 0.0;
    float _1162 = _1106 * _100;
    int _1164 = _1120 ? 0 : 1;
    bool _1166 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _1168 = isnan(0.0);
    bool _1170 = _1166 || _1168;
    bool _1172 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _1174 = _1170 || _1172;
    float _1176 = exp2(_1162);
    int _1178 = _1138 ? 0 : 1;
    float _1180 = float(_1054);
    float _1182 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _1184 = 1.0 + _1182;
    int _1186 = ~_1164;
    int _1188 = _1186 + 1;
    int _1190 = _1188 + 1;
    int _1192 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 16;
    bool _1194 = _1192 != 0;
    int _1196 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 32;
    bool _1198 = _1196 != 0;
    int _1200 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 64;
    bool _1202 = _1200 != 0;
    float _1204 = 1.0 / _1180;
    int _1206 = _1190;
    if (!_1046)
    {
        int _1208 = ~_1164;
        int _1210 = _1208 + 1;
        _1206 = _1210;
    }
    int _1212 = _1206;
    float _1214 = fma(_1038, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    bool _1216 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _1218 = isnan(1.0);
    bool _1220 = _1216 || _1218;
    bool _1222 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _1224 = _1220 || _1222;
    float _1226 = 1.0 / _1184;
    bool _1228 = !_1198;
    int _1230 = _1228 ? 0 : 1;
    float _1232 = (*spvDescriptorSet0.vp_c9)._m0[82].y + (*spvDescriptorSet0.vp_c9)._m0[81].w;
    bool _1234 = !_1194;
    int _1236 = _1234 ? 0 : 1;
    float _1238 = -_1176;
    float _1240 = _1238 + 1.0;
    bool _1242 = !_1202;
    int _1244 = _1242 ? 0 : 1;
    float _1246 = fma(_1122, -2.0, _1232);
    int _1248 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _1250 = _1248 != 0;
    int _1252 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _1254 = _1252 != 0;
    int _1256 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _1258 = _1256 != 0;
    int _1260 = ~_1178;
    int _1262 = _1260 + 1;
    int _1264 = _1262 + 1;
    float _1266 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    int _1268 = _1264;
    if (!_1160)
    {
        int _1270 = ~_1178;
        int _1272 = _1270 + 1;
        _1268 = _1272;
    }
    int _1274 = _1268;
    float _1276 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    bool _1278 = !_1250;
    int _1280 = _1278 ? 0 : 1;
    float _1282 = in.m_57.x;
    float _1284 = in.m_57.y;
    float _1286 = in.m_57.z;
    bool _1288 = !_1254;
    int _1290 = _1288 ? 0 : 1;
    float _1292 = fma(_958, (*spvDescriptorSet0.vp_c9)._m0[78].z, _1266);
    int _1294 = abs(_1280);
    float _1296 = fma(_970, (*spvDescriptorSet0.vp_c9)._m0[78].w, _1276);
    int _1298 = abs(_1290);
    float _1300 = -_100;
    float _1302 = fma(_1300, (*spvDescriptorSet0.vp_c9)._m0[81].x, _1150);
    float _1304 = _1204 * _100;
    float _1306 = fma(_100, (*spvDescriptorSet0.vp_c9)._m0[82].w, _1086);
    float _1308 = fma(_100, (*spvDescriptorSet0.vp_c9)._m0[77].z, _1292);
    float _1310 = fma(_100, (*spvDescriptorSet0.vp_c9)._m0[77].w, _1296);
    float _1312 = float(_962);
    float _1314 = float(_1212);
    float _1316 = fma(_100, (*spvDescriptorSet0.vp_c9)._m0[81].y, _1246);
    float _1318 = _1174 ? _1240 : 0.0;
    float _1320 = _1312 * _100;
    float _1322 = float(_1294);
    float _1324 = fma(_100, (*spvDescriptorSet0.vp_c9)._m0[82].z, _1126);
    float _1326 = float(_1158);
    if (_1224)
    {
        float _1328 = _1318 * _1226;
        _110 = _1328;
    }
    float _1330 = _110;
    bool _1332 = !_1258;
    int _1334 = _1332 ? 0 : 1;
    float _1336 = float(_1298);
    float _1338 = _1322 * _1326;
    int _1340 = abs(_1334);
    float _1342 = _1140 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _1344 = _1336 * _1314;
    float _1346 = _1338 * (-2.0);
    float _1348 = _1140 * (*spvDescriptorSet0.vp_c8)._m0[28].x;
    float _1350 = _1342 * _1342;
    float _1352 = -(*spvDescriptorSet0.vp_c9)._m0[194].y;
    float _1354 = (*spvDescriptorSet0.vp_c9)._m0[194].z + _1352;
    float _1356 = _958 + (-0.5);
    float _1358 = fma(_1346, _1282, _1282);
    float _1360 = _1140 * (*spvDescriptorSet0.vp_c8)._m0[28].z;
    float _1362 = fma(_1348, _1348, _1350);
    float _1364 = float(_1274);
    float _1366 = fma(_1214, _1346, _1214);
    float _1368 = float(_1340);
    float _1370 = fma(_1356, (*spvDescriptorSet0.vp_c9)._m0[196].x, _1358);
    float _1372 = fma(_1360, _1360, _1362);
    float _1374 = _1344 * (-2.0);
    float _1376 = 1.0 / _1354;
    float _1378 = _1368 * _1364;
    float _1380 = fma(_1366, _1330, _1370);
    float _1382 = _1034 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _1384 = fma(_1056, _1374, _1056);
    float _1386 = fma(_1374, _1284, _1284);
    float _1388 = _970 + (-0.5);
    float _1390 = _1032 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _1392 = _1382 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1394 = in.m_59.x;
    float _1396 = in.m_59.y;
    float _1398 = in.m_59.z;
    float _1400 = fma(_1388, (*spvDescriptorSet0.vp_c9)._m0[196].y, _1386);
    float _1402 = _1378 * (-2.0);
    float _1404 = fma(_1390, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1392);
    float _1406 = rsqrt(_1372);
    float _1408 = fma(_1384, _1330, _1400);
    float _1410 = fma(_1050, _1402, _1050);
    float _1412 = fma(_1074, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1404);
    float _1414 = fma(_1402, _1286, _1286);
    float _1416 = _1408 * 0.15915493667125701904296875;
    float _1418 = _1008 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1420 = _1412 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1422 = _1380 * 0.15915493667125701904296875;
    float _1424 = _964 + (-0.5);
    float _1426 = _1416 * 6.283185482025146484375;
    float _1428 = sin(_1426);
    bool _1430 = _1420 >= _1418;
    bool _1432 = isnan(_1420);
    bool _1434 = _1430 || _1432;
    bool _1436 = isnan(_1418);
    bool _1438 = _1434 || _1436;
    float _1440 = fma(_1424, (*spvDescriptorSet0.vp_c9)._m0[196].z, _1414);
    float _1442 = -_1420;
    float _1444 = _1418 + _1442;
    float _1446 = _1348 * _1406;
    float _1448 = fma(_1410, _1330, _1440);
    float _1450 = _1422 * 6.283185482025146484375;
    float _1452 = sin(_1450);
    float _1454 = abs(_1444);
    float _1456 = precise::max(_1454, (*spvDescriptorSet0.vp_c9)._m0[194].y);
    float _1458 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _1396);
    float _1460 = _1448 * 0.15915493667125701904296875;
    float _1462 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _1394);
    float _1464 = precise::min(_1456, (*spvDescriptorSet0.vp_c9)._m0[194].z);
    float _1466 = _448 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _1468 = _462 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _1470 = _1422 * 6.283185482025146484375;
    float _1472 = cos(_1470);
    float _1474 = _1342 * _1406;
    float _1476 = -(*spvDescriptorSet0.vp_c9)._m0[194].y;
    float _1478 = _1464 + _1476;
    float _1480 = _1466 * _1458;
    float _1482 = _1360 * _1406;
    float _1484 = _1478 * _1376;
    float _1486 = _1460 * 6.283185482025146484375;
    float _1488 = cos(_1486);
    float _1490 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _1398);
    float _1492 = _488 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    bool _1494 = !_1438;
    float _1496 = _1494 ? 1.0 : (-1.0);
    float _1498 = _1468 * _1490;
    float _1500 = _1492 * _1462;
    float _1502 = _156 * (*spvDescriptorSet0.vp_c9)._m0[194].w;
    float _1504 = _1416 * 6.283185482025146484375;
    float _1506 = cos(_1504);
    float _1508 = _1496 * _1484;
    float _1510 = _1472 * _1428;
    float _1512 = _1502 * _1508;
    float _1514 = _1452 * _1428;
    float _1516 = _1460 * 6.283185482025146484375;
    float _1518 = sin(_1516);
    float _1520 = _1428 * _1488;
    float _1522 = _1512 * 0.15915493667125701904296875;
    float _1524 = _1488 * _1480;
    float _1526 = _1472 * _1506;
    float _1528 = _1452 * _1506;
    float _1530 = _1522 * 6.283185482025146484375;
    float _1532 = cos(_1530);
    float _1534 = _1472 * _1524;
    float _1536 = _1506 * _1488;
    float _1538 = _1452 * _1524;
    float _1540 = fma(_1518, _1526, _1514);
    float _1542 = -_1510;
    float _1544 = fma(_1518, _1528, _1542);
    float _1546 = -_1528;
    float _1548 = fma(_1518, _1510, _1546);
    float _1550 = -_1480;
    float _1552 = _1518 * _1550;
    float _1554 = fma(_1540, _1500, _1534);
    float _1556 = _1522 * 6.283185482025146484375;
    float _1558 = sin(_1556);
    float _1560 = fma(_1518, _1514, _1526);
    float _1562 = fma(_1536, _1500, _1552);
    float _1564 = fma(_1548, _1498, _1554);
    float _1566 = fma(_1544, _1500, _1538);
    float _1568 = -_1532;
    float _1570 = _1568 + 1.0;
    float _1572 = fma(_1520, _1498, _1562);
    float _1574 = _1564 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _1576 = _1564 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _1578 = fma(_1560, _1498, _1566);
    float _1580 = _1564 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _1582 = fma(_1572, (*spvDescriptorSet0.vp_c8)._m0[25].x, _1574);
    float _1584 = fma(_1572, (*spvDescriptorSet0.vp_c8)._m0[24].x, _1576);
    float _1586 = _1474 * _1570;
    float _1588 = _1482 * _1482;
    float _1590 = fma(_1578, (*spvDescriptorSet0.vp_c8)._m0[25].z, _1582);
    float _1592 = _1446 * _1558;
    float _1594 = _1474 * _1558;
    float _1596 = _1482 * _1558;
    float _1598 = _1446 * _1570;
    float _1600 = fma(_1572, (*spvDescriptorSet0.vp_c8)._m0[26].x, _1580);
    float _1602 = fma(_1482, _1586, _1592);
    float _1604 = fma(_1578, (*spvDescriptorSet0.vp_c8)._m0[24].z, _1584);
    float _1606 = _1590 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _1608 = fma(_1570, _1588, _1532);
    float _1610 = -_1596;
    float _1612 = fma(_1474, _1598, _1610);
    float _1614 = -_1594;
    float _1616 = fma(_1482, _1598, _1614);
    float _1618 = _1604 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _1620 = _1606 * _1602;
    float _1622 = fma(_1578, (*spvDescriptorSet0.vp_c8)._m0[26].z, _1600);
    float _1624 = fma(_1446, _1598, _1532);
    float _1626 = _1606 * _1612;
    float _1628 = fma(_1618, _1616, _1620);
    float _1630 = _1622 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _1632 = fma(_1474, _1586, _1532);
    float _1634 = fma(_1618, _1624, _1626);
    float _1636 = fma(_1482, _1598, _1594);
    float _1638 = fma(_1630, _1608, _1628);
    float _1640 = fma(_1474, _1598, _1596);
    float _1642 = _1606 * _1632;
    float _1644 = fma(_1630, _1636, _1634);
    float _1646 = _1074 + _1638;
    float _1648 = -_1592;
    float _1650 = fma(_1482, _1586, _1648);
    float _1652 = fma(_1618, _1640, _1642);
    float _1654 = _1390 + _1644;
    float _1656 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1658 = _1646 + _1656;
    float _1660 = _1382 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _1662 = fma(_1630, _1650, _1652);
    float _1664 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1666 = _1654 + _1664;
    float _1668 = _1658 * _1658;
    float _1670 = fma(_1390, (*spvDescriptorSet0.vp_c8)._m0[11].x, _1660);
    float _1672 = _1382 + _1662;
    float _1674 = fma(_1666, _1666, _1668);
    float _1676 = fma(_1074, (*spvDescriptorSet0.vp_c8)._m0[11].z, _1670);
    float _1678 = sqrt(_1674);
    bool _1680 = _1678 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1682 = _1670;
    float _1684 = _1662;
    float _1686 = _1586;
    float _1688 = _1678;
    if (!_1680)
    {
        _1682 = _1654;
    }
    float _1690 = _1682;
    float _1692 = _1690;
    if (!_1680)
    {
        _1684 = _1646;
    }
    float _1694 = _1684;
    float _1696 = _1694;
    if (!_1680)
    {
        _1686 = _1672;
    }
    float _1698 = _1686;
    bool _1700 = !_1680;
    float _1702 = _1698;
    if (!_1700)
    {
        float _1704 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1706 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1708 = _1678 + _1706;
        float _1710 = rsqrt(_1674);
        float _1712 = _1708 * _1704;
        float _1714 = _1672 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1716 = _1712 * 0.15915493667125701904296875;
        float _1718 = _1716 * 6.283185482025146484375;
        float _1720 = cos(_1718);
        float _1722 = _1716 * 6.283185482025146484375;
        float _1724 = sin(_1722);
        float _1726 = _1720 + (-1.0);
        float _1728 = fma(_1724, _1714, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1730 = _1726 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1732 = _1710 * _1728;
        float _1734 = fma(_1672, _1720, _1730);
        float _1736 = fma(_1666, _1732, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1738 = fma(_1658, _1732, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _1702 = _1734;
        _1692 = _1736;
        _1696 = _1738;
    }
    float _1740 = _1702;
    float _1742 = _1692;
    float _1744 = _1696;
    float _1746 = -_1382;
    float _1748 = _1746 + _1740;
    float _1750 = _1676 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _1752 = -_1390;
    float _1754 = _1752 + _1742;
    float _1756 = -_1074;
    float _1758 = _1756 + _1744;
    float _1760 = _1748 * _1748;
    float _1762 = _1382 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _1764 = 1.0 / _1750;
    float _1766 = fma(_1754, _1754, _1760);
    float _1768 = fma(_1390, (*spvDescriptorSet0.vp_c8)._m0[10].x, _1762);
    float _1770 = fma(_1758, _1758, _1766);
    float _1772 = fma(_1074, (*spvDescriptorSet0.vp_c8)._m0[10].z, _1768);
    bool _1774 = (*spvDescriptorSet0.vp_c15)._m0[653].w >= 0.5;
    bool _1776 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _1778 = _1774 || _1776;
    bool _1780 = isnan(0.5);
    bool _1782 = _1778 || _1780;
    float _1784 = sqrt(_1770);
    float _1786 = _1772 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _1788 = _1786 + _1750;
    float _1790 = _1788 * _1764;
    float _1792 = _1790 * 0.5;
    bool _1794 = _1784 > 0.0;
    float _1796 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _1798 = fma(_1792, (*spvDescriptorSet0.vp_c8)._m0[30].w, _1796);
    float _1800 = _1792;
    float _1802 = _1754;
    float _1804 = _1740;
    float _1806 = _1742;
    float _1808 = _1744;
    float _1810 = _1758;
    float _1812 = (*spvDescriptorSet0.vp_c15)._m0[653].w;
    float _1814 = _1750;
    if (_1782)
    {
        _1800 = 1.0;
    }
    float _1816 = _1800;
    float _1818 = 1.0 / _1798;
    bool _1820 = !_1794;
    float _1822 = _1816;
    if (!_1820)
    {
        float _1824 = _172 * _172;
        float _1826 = rsqrt(_1770);
        float _1828 = fma(_170, _170, _1824);
        float _1830 = fma(_174, _174, _1828);
        float _1832 = sqrt(_1830);
        float _1834 = _1748 * _1826;
        float _1836 = _1758 * _1826;
        bool _1838 = _1832 > 0.0;
        float _1840 = _1754 * _1826;
        bool _1842 = !_1838;
        _1812 = _1836;
        _1814 = _1840;
        if (!_1842)
        {
            float _1844 = rsqrt(_1830);
            float _1846 = 1.0 / (*spvDescriptorSet0.vp_c10)._m0[2].z;
            float _1848 = _172 * _1844;
            float _1850 = _170 * _1844;
            float _1852 = _174 * _1844;
            float _1854 = _1834 * _1848;
            float _1856 = fma(_1840, _1850, _1854);
            float _1858 = _1846 * (*spvDescriptorSet0.vp_c9)._m0[142].x;
            float _1860 = fma(_1836, _1852, _1856);
            float _1862 = _1860 * _1858;
            float _1864 = fma(_170, _1862, _1742);
            float _1866 = fma(_172, _1862, _1740);
            float _1868 = fma(_174, _1862, _1744);
            _1802 = _1856;
            _1804 = _1866;
            _1806 = _1864;
            _1808 = _1868;
            _1810 = _1854;
        }
    }
    float _1870 = _1802;
    float _1872 = _1804;
    float _1874 = _1806;
    float _1876 = _1808;
    float _1878 = _1810;
    float _1880 = _1812;
    float _1882 = _1814;
    float _1884 = _1882;
    float _1886 = _1870;
    float _1888 = _1878;
    float _1890 = _1880;
    if (_1782)
    {
        _1884 = 1.0;
    }
    float _1892 = _1884;
    float _1894 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _1896 = _1818 * _1894;
    float _1898 = _1892;
    if (!_1782)
    {
        float _1900 = (*spvDescriptorSet0.vp_c8)._m0[31].x * 0.5;
        float _1902 = _1900 * 0.15915493667125701904296875;
        float _1904 = _1902 * 6.283185482025146484375;
        float _1906 = cos(_1904);
        float _1908 = (*spvDescriptorSet0.vp_c8)._m0[31].y * 0.5;
        float _1910 = _1908 * 0.15915493667125701904296875;
        float _1912 = _1902 * 6.283185482025146484375;
        float _1914 = sin(_1912);
        float _1916 = 1.0 / _1906;
        float _1918 = _1910 * 6.283185482025146484375;
        float _1920 = cos(_1918);
        float _1922 = _1914 * _1916;
        float _1924 = _1910 * 6.283185482025146484375;
        float _1926 = sin(_1924);
        float _1928 = _1920 * _1922;
        float _1930 = 1.0 / _1928;
        float _1932 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1934 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _1932;
        float _1936 = 1.0 / _1934;
        float _1938 = _1926 * _1930;
        float _1940 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1942 = fma(_1896, _1938, _1940);
        float _1944 = _1942 * _1936;
        float _1946 = precise::clamp(_1944, 0.0, 1.0);
        _1886 = _1910;
        _1888 = _1902;
        _1822 = _1946;
    }
    float _1948 = _1886;
    float _1950 = _1888;
    float _1952 = _1822;
    float _1954 = _1948;
    if (!_1782)
    {
        float _1956 = (*spvDescriptorSet0.vp_c8)._m0[31].x * 0.5;
        float _1958 = _1956 * 0.15915493667125701904296875;
        float _1960 = _1958 * 6.283185482025146484375;
        float _1962 = cos(_1960);
        float _1964 = (*spvDescriptorSet0.vp_c8)._m0[31].y * 0.5;
        float _1966 = _1964 * 0.15915493667125701904296875;
        float _1968 = _1958 * 6.283185482025146484375;
        float _1970 = sin(_1968);
        float _1972 = 1.0 / _1962;
        float _1974 = _1966 * 6.283185482025146484375;
        float _1976 = cos(_1974);
        float _1978 = _1970 * _1972;
        float _1980 = _1966 * 6.283185482025146484375;
        float _1982 = sin(_1980);
        float _1984 = _1976 * _1978;
        float _1986 = 1.0 / _1984;
        float _1988 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _1990 = (*spvDescriptorSet0.vp_c9)._m0[140].w + _1988;
        float _1992 = 1.0 / _1990;
        float _1994 = _1982 * _1986;
        float _1996 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _1998 = fma(_1896, _1994, _1996);
        float _2000 = _1998 * _1992;
        float _2002 = precise::clamp(_2000, 0.0, 1.0);
        float _2004 = -_2002;
        float _2006 = _2004 + 1.0;
        _1954 = _1972;
        _1898 = _2006;
    }
    float _2008 = _1954;
    float _2010 = _1898;
    float _2012 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _2014 = _1872 + _2012;
    float _2016 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _2018 = _1874 + _2016;
    float _2020 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _2022 = _1876 + _2020;
    float _2024 = _2014 * _2014;
    float _2026 = fma(_2018, _2018, _2024);
    float _2028 = fma(_2022, _2022, _2026);
    float _2030 = rsqrt(_2028);
    float _2032 = sqrt(_2028);
    float _2034 = _2030 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _2036 = _2018 * _2034;
    float _2038 = _2022 * _2034;
    float _2040 = _2036 * _2036;
    float _2042 = _2038 * _2038;
    float _2044 = _2040 + _2042;
    float _2046 = sqrt(_2044);
    bool _2048 = _2046 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2050 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2052 = _2046 + _2050;
    float _2054 = _2008;
    float _2056 = _2044;
    float _2058 = _2052;
    float _2060 = _2014;
    float _2062 = _2038;
    float _2064 = _2040;
    float _2066 = _2042;
    if (_2048)
    {
        float _2068 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2054 = _2068;
    }
    float _2070 = _2054;
    if (_2048)
    {
        float _2072 = rsqrt(_2044);
        _2056 = _2072;
    }
    float _2074 = _2056;
    if (_2048)
    {
        float _2076 = _2052 * _2070;
        _2058 = _2076;
    }
    float _2078 = _2058;
    if (_2048)
    {
        float _2080 = _2078 * 0.15915493667125701904296875;
        _1890 = _2080;
    }
    float _2082 = _1890;
    float _2084 = _1950;
    if (_2048)
    {
        float _2086 = _2082 * 6.283185482025146484375;
        float _2088 = sin(_2086);
        _2084 = _2088;
    }
    float _2090 = _2084;
    float _2092 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _2094 = precise::max(0.0, _2092);
    float _2096 = _2070;
    float _2098 = _2094;
    if (_2048)
    {
        float _2100 = _2082 * 6.283185482025146484375;
        float _2102 = cos(_2100);
        _2096 = _2102;
    }
    float _2104 = _2096;
    float _2106 = -_2034;
    float _2108 = -_2094;
    float _2110 = fma(_2014, _2106, _2108);
    if (_2048)
    {
        float _2112 = _2110 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2060 = _2112;
    }
    float _2114 = _2060;
    float _2116 = _2114;
    float _2118 = _2090;
    if (_2048)
    {
        float _2120 = fma(_2090, _2114, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _2098 = _2120;
    }
    float _2122 = _2098;
    float _2124 = _2122;
    if (!_2048)
    {
        _2116 = _2036;
    }
    float _2126 = _2116;
    float _2128 = _2126;
    if (_2048)
    {
        float _2130 = _2104 + (-1.0);
        _2118 = _2130;
    }
    float _2132 = _2118;
    float _2134 = _2132;
    if (_2048)
    {
        float _2136 = _2074 * _2122;
        _1688 = _2136;
    }
    float _2138 = _1688;
    if (!_2048)
    {
        _2124 = _2110;
    }
    float _2140 = _2124;
    float _2142 = _2140;
    if (_2048)
    {
        float _2144 = _2132 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2134 = _2144;
    }
    float _2146 = _2134;
    if (_2048)
    {
        float _2148 = _2036 * _2138;
        _2128 = _2148;
    }
    float _2150 = _2128;
    if (_2048)
    {
        float _2152 = _2038 * _2138;
        _2062 = _2152;
    }
    float _2154 = _2062;
    if (_2048)
    {
        float _2156 = fma(_2110, _2104, _2146);
        _2142 = _2156;
    }
    float _2158 = _2142;
    if (_2048)
    {
        float _2160 = _2150 * _2150;
        _2064 = _2160;
    }
    float _2162 = _2064;
    if (_2048)
    {
        float _2164 = _2154 * _2154;
        _2066 = _2164;
    }
    float _2166 = _2066;
    float _2168 = fma(_2158, _2158, _2162);
    float _2170 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _2172 = fma(_2032, (*spvDescriptorSet0.vp_c15)._m0[23].w, _2170);
    float _2174 = precise::clamp(_2172, 0.0, 1.0);
    float _2176 = _2168 + _2166;
    float _2178 = _1872 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _2180 = _1872 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _2182 = -_2174;
    float _2184 = _2182 + 1.0;
    float _2186 = rsqrt(_2176);
    float _2188 = fma(_1874, (*spvDescriptorSet0.vp_c8)._m0[2].x, _2178);
    float _2190 = _1872 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _2192 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _2194 = fma(_1876, (*spvDescriptorSet0.vp_c8)._m0[2].z, _2188);
    float _2196 = fma(_1874, (*spvDescriptorSet0.vp_c8)._m0[1].x, _2180);
    float _2198 = _1872 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _2200 = abs(_2184);
    float _2202 = log2(_2200);
    float _2204 = fma(_1874, (*spvDescriptorSet0.vp_c8)._m0[0].x, _2190);
    float _2206 = fma(_1876, (*spvDescriptorSet0.vp_c8)._m0[1].z, _2196);
    float _2208 = fma(_1874, (*spvDescriptorSet0.vp_c8)._m0[3].x, _2198);
    float _2210 = _2194 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _2212 = fma(_1876, (*spvDescriptorSet0.vp_c8)._m0[0].z, _2204);
    float _2214 = _2206 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _2216 = fma(_1876, (*spvDescriptorSet0.vp_c8)._m0[3].z, _2208);
    float _2218 = _2186 * _2150;
    float _2220 = _2186 * _2158;
    float _2222 = _2212 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _2224 = _2214 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _2226 = _2218 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _2228 = _2210 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _2230 = _2186 * _2154;
    float _2232 = fma(_2222, (*spvDescriptorSet0.vp_c8)._m0[7].x, _2224);
    float _2234 = -_2226;
    float _2236 = fma(_2220, (*spvDescriptorSet0.vp_c15)._m0[21].y, _2234);
    float _2238 = _2202 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _2240 = -_2228;
    float _2242 = fma(_2240, _2192, 1.0);
    float _2244 = _2216 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _2246 = -_2230;
    float _2248 = fma(_2246, (*spvDescriptorSet0.vp_c15)._m0[21].z, _2236);
    float _2250 = fma(_2210, (*spvDescriptorSet0.vp_c8)._m0[7].z, _2232);
    float _2252 = log2(_2242);
    float _2254 = _2214 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _2256 = _2214 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _2258 = fma(_2244, (*spvDescriptorSet0.vp_c8)._m0[7].w, _2250);
    float _2260 = fma(_2222, (*spvDescriptorSet0.vp_c8)._m0[4].x, _2254);
    float _2262 = fma(_2222, (*spvDescriptorSet0.vp_c8)._m0[5].x, _2256);
    float _2264 = _2220 + 1.0;
    float _2266 = exp2(_2238);
    float _2268 = fma(_2248, -0.5, 0.5);
    float _2270 = fma(_2248, 0.5, 0.5);
    float _2272 = fma(_2210, (*spvDescriptorSet0.vp_c8)._m0[4].z, _2260);
    float _2274 = fma(_2210, (*spvDescriptorSet0.vp_c8)._m0[5].z, _2262);
    float _2276 = fma(_2270, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _2278 = 1.0 / _2258;
    float _2280 = fma(_2270, _2276, -0.212114393711090087890625);
    float _2282 = fma(_2270, _2280, 1.570728778839111328125);
    float _2284 = sqrt(_2268);
    float _2286 = -_2220;
    float _2288 = fma(_2266, _2264, _2286);
    float _2290 = fma(_2244, (*spvDescriptorSet0.vp_c8)._m0[4].w, _2272);
    float _2292 = fma(_2244, (*spvDescriptorSet0.vp_c8)._m0[5].w, _2274);
    float _2294 = _2252 * 0.693147182464599609375;
    float _2296 = _2290 * _2278;
    float _2298 = _2292 * _2278;
    float _2300 = _2294 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _2302 = fma(_2296, 0.5, 0.5);
    float _2304 = fma(_2298, -0.5, 0.5);
    float _2306 = fma(_2288, 0.5, 0.5);
    float _2308 = _2284 * 0.636619746685028076171875;
    float _2310 = -_2282;
    float _2312 = fma(_2308, _2310, 1.0);
    float3 _6695 = float3(_2302, _2304, _2300);
    float _2314 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_6695, float3(0.0), isnan(_6695)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_6695, float3(0.0), isnan(_6695)), level(0.0)).x;
    float3 _6706 = float3(_2302, _2304, _2300);
    float4 _2317 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_6706, float3(0.0), isnan(_6706)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_6706, float3(0.0), isnan(_6706)), level(0.0)).xyzw;
    float _2319 = _2317.x;
    float _2321 = _2317.y;
    float _2323 = _2317.z;
    float _2325 = _2317.w;
    float2 _6723 = float2(_2312, _2306);
    float3 _2329 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_6723, float2(0.0), isnan(_6723)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_6723, float2(0.0), isnan(_6723)), level(0.0)).xyz;
    float _2331 = _2329.x;
    float _2333 = _2329.y;
    float _2335 = _2329.z;
    float _2337 = float(uint(_962));
    float _2339 = trunc(_1304);
    int _2341 = int(_2339);
    int _2343 = ~_962;
    int _2345 = _2343 + 1;
    out.m_61.x = _708;
    out.m_61.y = _710;
    out.m_61.z = _712;
    out.m_61.w = _716;
    int _2347 = ~_962;
    int _2349 = _2347 + 1;
    float _2351 = _2202 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    int _2353 = abs(_1230);
    float _2355 = 1.0 / _2337;
    float _2357 = float(uint(_2341));
    float _2359 = exp2(_2351);
    int _2361 = as_type<int>(_2355) + (-2);
    float _2363 = as_type<float>(_2361) * _2357;
    float _2365 = trunc(_2363);
    float _2367 = precise::max(_2365, 0.0);
    uint _2370 = uint(_2367);
    float _2372 = float(_2341);
    float _2374 = -_2359;
    float _2376 = _2374 + 1.0;
    int _2378 = _2345 * int(_2370);
    int _2380 = _2378 + _2341;
    float _2382 = float(uint(_2380));
    float _2384 = as_type<float>(_2361) * _2382;
    bool _2386 = !_968;
    float _2388 = _2386 ? 7.345489978790283203125 : 1.0;
    float _2390 = trunc(_2384);
    float _2392 = precise::max(_2390, 0.0);
    uint _2394 = uint(_2392);
    float _2396 = _2388 * _958;
    bool _2398 = _2372 >= _1312;
    bool _2400 = isnan(_2372);
    bool _2402 = _2398 || _2400;
    bool _2404 = isnan(_1312);
    bool _2406 = _2402 || _2404;
    float _2408 = float(_2406);
    float _2410 = floor(_2396);
    int _2412 = int(_2370) + int(_2394);
    float _2414 = trunc(_2408);
    int _2416 = int(_2414);
    int _2418 = _2349 * _2412;
    int _2420 = _2418 + _2341;
    float _2422 = -_2410;
    float _2424 = _2396 + _2422;
    bool _2426 = uint(_2420) >= uint(_962);
    bool _2428 = !_2426;
    int _2430 = _2428 ? 0 : (-1);
    bool _2432 = _962 == 0;
    int _2434 = ~_2412;
    int _2436 = _2434 + _2430;
    int _2438 = _2436 + 1;
    float _2440 = _2424 * _1312;
    float _2442 = _1320 * _152;
    int _2444 = ~_2416;
    int _2446 = _2444 + 1;
    int _2448 = _2446 + 1;
    int _2450 = _962 * _2438;
    int _2452 = _2450 + _2341;
    int _2454 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4096;
    bool _2456 = _2454 != 0;
    float _2458 = trunc(_2440);
    int _2460 = int(_2458);
    int _2462 = _962 + (-1);
    bool _2464 = !_2432;
    int _2466 = _2464 ? _2452 : (-1);
    bool _2468 = !_2456;
    int _2470 = _2468 ? 0 : 1;
    int _2472 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 128;
    bool _2474 = _2472 != 0;
    float _2476 = trunc(_2442);
    int _2478 = int(_2476);
    int _2480 = _2466 * _2448;
    int _2482 = abs(_2470);
    int _2484 = abs(_1244);
    int _2486 = _2416 * _2462;
    int _2488 = _2486 + _2480;
    int _2490 = abs(_1236);
    int _2492 = _2488 * _2353;
    bool _2494 = !_2474;
    int _2496 = _2494 ? 0 : 1;
    int _2498 = _2460 * _2482;
    int _2500 = _2498 + _2341;
    int _2502 = abs(_2496);
    float _2504 = in.m_53.w;
    int _2506 = _2478 * _2490;
    int _2508 = _2506 + _2492;
    int _2510 = ~_962;
    int _2512 = _2510 + 1;
    int _2514 = _2500 * _2484;
    int _2516 = _2514 + _2508;
    float _2518 = float(uint(_2500));
    int _2520 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _2522 = _2520 != 0;
    int _2524 = _2460 * _2502;
    int _2526 = _2524 + _2516;
    int _2528 = ~_962;
    int _2530 = _2528 + 1;
    int _2532 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _2534 = _2532 != 0;
    float _2536 = float(uint(_2526));
    int _2538 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _2540 = _2538 != 0;
    float _2542 = as_type<float>(_2361) * _2536;
    int _2544 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2097152;
    bool _2546 = _2544 != 0;
    float _2548 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _2550 = _2548 + (*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _2552 = trunc(_2542);
    float _2554 = precise::max(_2552, 0.0);
    uint _2556 = uint(_2554);
    bool _2558 = _2504 > 0.5;
    float _2560 = 1.0 / _2550;
    int _2562 = _2530 * int(_2556);
    int _2564 = _2562 + _2526;
    float _2566 = float(uint(_2564));
    float _2568 = as_type<float>(_2361) * _2566;
    float _2570 = in.m_63.y;
    float _2572 = trunc(_2568);
    float _2574 = precise::max(_2572, 0.0);
    uint _2576 = uint(_2574);
    out.m_65.x = 1.0;
    out.m_65.y = 1.0;
    out.m_65.z = 1.0;
    float _2578 = as_type<float>(_2361) * _2518;
    int _2580 = int(_2556) + int(_2576);
    float _2582 = trunc(_2578);
    float _2584 = precise::max(_2582, 0.0);
    uint _2586 = uint(_2584);
    float _2588 = -_2570;
    float _2590 = _2588 + 1.0;
    int _2592 = _2512 * _2580;
    int _2594 = _2592 + _2526;
    int _2596 = _2558 ? as_type<int>(_2590) : as_type<int>(_2570);
    bool _2598 = uint(_2594) >= uint(_962);
    float _2600 = -(*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _2602 = _2600 + (*spvDescriptorSet0.vp_c9)._m0[133].w;
    bool _2604 = _970 > 0.5;
    float _2606 = -(*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _2608 = _956 + _2606;
    bool _2610 = !_2598;
    int _2612 = _2610 ? 0 : (-1);
    float _2614 = 1.0 / _2602;
    int _2616 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _2618 = _2616 != 0;
    int _2620 = ~_2580;
    int _2622 = _2620 + _2612;
    int _2624 = _2622 + 1;
    float _2626 = -(*spvDescriptorSet0.vp_c9)._m0[131].x;
    float _2628 = (*spvDescriptorSet0.vp_c9)._m0[132].x + _2626;
    float _2630 = _2618 ? as_type<float>(_2596) : _2570;
    float _2632 = -(*spvDescriptorSet0.vp_c9)._m0[132].x;
    float _2634 = _2632 + (*spvDescriptorSet0.vp_c9)._m0[133].x;
    float _2636 = _2570;
    bool _2638 = _2604;
    bool _2640 = _2618;
    int _2642 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[132].w);
    if (_2522)
    {
        float _2644 = _2604 ? _2590 : _2570;
        _2636 = _2644;
    }
    float _2646 = _2636;
    int _2648 = _962 * _2624;
    int _2650 = _2648 + _2526;
    float _2652 = in.m_63.x;
    if (_2534)
    {
        bool _2654 = _964 > 0.5;
        _2638 = _2654;
    }
    bool _2656 = _2638;
    float _2658 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    int _2660 = ~_962;
    int _2662 = _2660 + 1;
    float _2664 = _2628 * _2560;
    bool _2666 = !_2432;
    int _2668 = _2666 ? _2650 : (-1);
    if (_2540)
    {
        bool _2670 = _958 > 0.5;
        _2640 = _2670;
    }
    bool _2672 = _2640;
    int _2674 = _2662 * int(_2586);
    int _2676 = _2674 + _2500;
    int _2678 = _2668 >> 31;
    float _2680 = _2634 * _2614;
    bool _2682 = _956 >= (*spvDescriptorSet0.vp_c9)._m0[133].w;
    bool _2684 = isnan(_956);
    bool _2686 = _2682 || _2684;
    bool _2688 = isnan((*spvDescriptorSet0.vp_c9)._m0[133].w);
    bool _2690 = _2686 || _2688;
    float _2692 = float(_2690);
    float _2694 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _2696 = _956 + _2694;
    float _2698 = float(uint(_2676));
    float _2700 = fma(_2680, _2608, (*spvDescriptorSet0.vp_c9)._m0[132].x);
    int _2702 = _2678 & 3;
    float _2704 = -_2692;
    float _2706 = _2704 + 1.0;
    bool _2708 = _956 >= (*spvDescriptorSet0.vp_c9)._m0[132].w;
    bool _2710 = isnan(_956);
    bool _2712 = _2708 || _2710;
    bool _2714 = isnan((*spvDescriptorSet0.vp_c9)._m0[132].w);
    bool _2716 = _2712 || _2714;
    float _2718 = float(_2716);
    float _2720 = as_type<float>(_2361) * _2698;
    int _2722 = _2668 + _2702;
    float _2724 = fma(_2664, _2696, (*spvDescriptorSet0.vp_c9)._m0[131].x);
    bool _2726 = _956 >= (*spvDescriptorSet0.vp_c9)._m0[131].w;
    bool _2728 = isnan(_956);
    bool _2730 = _2726 || _2728;
    bool _2732 = isnan((*spvDescriptorSet0.vp_c9)._m0[131].w);
    bool _2734 = _2730 || _2732;
    float _2736 = float(_2734);
    float _2738 = _2718 * _2706;
    float _2740 = -_2718;
    float _2742 = _2740 + 1.0;
    int _2744 = _2722 >> 2;
    float _2746 = _2658 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    float _2748 = _2658;
    float _2750 = _2742;
    int _2752 = _2744;
    if (!_2540)
    {
        _2748 = _2652;
    }
    float _2754 = _2748;
    float _2756 = _2736 * _2742;
    int _2758 = _2744 << 4;
    int _2760 = _2758 + 368;
    float _2762 = fma(_2630, _2746, -0.5);
    float _2764 = _2754;
    if (!_2540)
    {
        _2750 = _2754;
    }
    float _2766 = _2750;
    float _2768 = _2724 * _2756;
    float _2770 = _2766;
    if (_2540)
    {
        _2764 = _2652;
    }
    float _2772 = _2764;
    float _2774 = -_2736;
    float _2776 = _2774 + 1.0;
    uint _2778 = uint(int(uint(_2760) >> uint(2)));
    uint _2780 = uint(int(uint(int(_2778)) >> uint(2)));
    int _2782 = int(_2778) & 3;
    float _2784 = (*spvDescriptorSet0.vp_c9)._m0[int(_2780)][_2782];
    int _2786 = int(_2778) + 1;
    uint _2788 = uint(int(uint(_2786) >> uint(2)));
    int _2790 = _2786 & 3;
    float _2792 = (*spvDescriptorSet0.vp_c9)._m0[int(_2788)][_2790];
    float _2794 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    float _2796 = _2772;
    if (_2540)
    {
        float _2798 = -_2772;
        float _2800 = _2798 + 1.0;
        _2752 = as_type<int>(_2800);
    }
    int _2802 = _2752;
    if (_2534)
    {
        float _2804 = -_2772;
        float _2806 = _2804 + 1.0;
        _2642 = as_type<int>(_2806);
    }
    int _2808 = _2642;
    float _2810 = -_1316;
    float _2812 = fma(_1306, _2762, _2810);
    float _2814 = fma((*spvDescriptorSet0.vp_c9)._m0[80].y, _2646, -0.5);
    float _2816 = fma(_2776, (*spvDescriptorSet0.vp_c9)._m0[131].x, _2768);
    if (_2540)
    {
        float _2818 = _2672 ? as_type<float>(_2802) : _2772;
        _2770 = _2818;
    }
    float _2820 = _2770;
    int _2822 = _2760 + 8;
    uint _2824 = uint(int(uint(_2822) >> uint(2)));
    uint _2826 = uint(int(uint(int(_2824)) >> uint(2)));
    int _2828 = int(_2824) & 3;
    float _2830 = (*spvDescriptorSet0.vp_c9)._m0[int(_2826)][_2828];
    int _2832 = int(_2824) + 1;
    uint _2834 = uint(int(uint(_2832) >> uint(2)));
    int _2836 = _2832 & 3;
    float _2838 = (*spvDescriptorSet0.vp_c9)._m0[int(_2834)][_2836];
    if (_2534)
    {
        float _2840 = _2656 ? as_type<float>(_2808) : _2772;
        _2796 = _2840;
    }
    float _2842 = _2796;
    float _2844 = fma(_2700, _2738, _2816);
    int _2846 = _2668 & 3;
    bool _2848 = _2846 != 0;
    float _2850 = trunc(_2720);
    float _2852 = precise::max(_2850, 0.0);
    uint _2854 = uint(_2852);
    float _2856 = -_1110;
    float _2858 = fma(_1310, _2814, _2856);
    bool _2860 = uint(_2846) > 1u;
    float _2862 = _2794 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    int _2864 = _2668 & 3;
    bool _2866 = _2864 != 0;
    float _2868 = fma(_2820, (*spvDescriptorSet0.vp_c9)._m0[80].x, -0.5);
    bool _2870 = uint(_2846) >= 2u;
    float _2872 = fma(_2862, _2842, -0.5);
    int _2874 = _2866 ? 0 : 1;
    float _2876 = fma(_1308, _2868, _1064);
    bool _2878 = _2846 != 3;
    float _2880 = fma(_1324, _2872, _1302);
    int _2882 = ~_2874;
    int _2884 = _2882 + 1;
    int _2886 = _2884 + 1;
    int _2888 = int(_2586) + int(_2854);
    float _2890 = _2880 + 0.5;
    int _2892 = _2886;
    if (!_2860)
    {
        int _2894 = ~_2874;
        int _2896 = _2894 + 1;
        _2892 = _2896;
    }
    int _2898 = _2892;
    int _2900 = ~_962;
    int _2902 = _2900 + 1;
    int _2904 = abs(_2898);
    bool _2906 = !_2848;
    int _2908 = _2906 ? 0 : 1;
    int _2910 = _2902 * _2888;
    int _2912 = _2910 + _2500;
    int _2914 = _2870 ? 0 : 1;
    bool _2916 = _2846 != 3;
    int _2918 = ~_2914;
    int _2920 = _2918 + 1;
    int _2922 = _2920 + 1;
    bool _2924 = !_2916;
    int _2926 = _2924 ? 0 : (-1);
    int _2928 = abs(_2908);
    int _2930 = _2922;
    if (_2878)
    {
        int _2932 = ~_2914;
        int _2934 = _2932 + 1;
        _2930 = _2934;
    }
    int _2936 = _2930;
    int _2938 = ~_2904;
    int _2940 = _2938 + 1;
    int _2942 = _2940 + 1;
    bool _2944 = uint(_2912) >= uint(_962);
    int _2946 = abs(_2926);
    int _2948 = _2942 * as_type<int>(_2792);
    int _2950 = abs(_2936);
    int _2952 = ~_2928;
    int _2954 = _2952 + 1;
    int _2956 = _2954 + 1;
    bool _2958 = !_2546;
    int _2960 = _2958 ? 0 : 1;
    int _2962 = _2956 * as_type<int>(_2784);
    int _2964 = _2962 + _2948;
    int _2966 = ~_2950;
    int _2968 = _2966 + 1;
    int _2970 = _2968 + 1;
    bool _2972 = !_2944;
    int _2974 = _2972 ? 0 : (-1);
    int _2976 = abs(_2960);
    int _2978 = _2970 * as_type<int>(_2830);
    int _2980 = _2978 + _2964;
    int _2982 = ~_2946;
    int _2984 = _2982 + 1;
    int _2986 = _2984 + 1;
    float _2988 = _2214 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    int _2990 = ~_2888;
    int _2992 = _2990 + _2974;
    int _2994 = _2992 + 1;
    int _2996 = ~_2976;
    int _2998 = _2996 + 1;
    int _3000 = _2998 + 1;
    int _3002 = _2986 * as_type<int>(_2838);
    int _3004 = _3002 + _2980;
    float _3006 = fma(_2692, (*spvDescriptorSet0.vp_c9)._m0[133].x, _2844);
    float _3008 = fma(_2222, (*spvDescriptorSet0.vp_c8)._m0[6].x, _2988);
    float _3010 = _930 * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    int _3012 = _3004 * _3000;
    float _3014 = _928 * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _3016 = _932 * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    int _3018 = _962 * _2994;
    int _3020 = _3018 + _2500;
    float _3022 = _3010 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _3024 = _3014 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _3026 = _3016 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _3028 = _3006 * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    bool _3030 = !_2432;
    int _3032 = _3030 ? _3020 : (-1);
    float _3034 = _1952 * _2010;
    float _3036 = fma(_2210, (*spvDescriptorSet0.vp_c8)._m0[6].z, _3008);
    bool _3038 = _1952 > 0.0;
    bool _3040 = isnan(_1952);
    bool _3042 = _3038 || _3040;
    bool _3044 = isnan(0.0);
    bool _3046 = _3042 || _3044;
    out.m_67.x = _3024;
    out.m_67.y = _3022;
    out.m_67.z = _3026;
    out.m_67.w = _3028;
    int _3048 = _3032 * _2976;
    int _3050 = _3048 + _3012;
    float _3052 = _3034 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _3054 = fma(_2244, (*spvDescriptorSet0.vp_c8)._m0[6].w, _3036);
    bool _3056 = _2010 <= 0.0;
    bool _3058 = !_3046;
    bool _3060 = _3056 || _3058;
    float _3062 = _2290 + _2258;
    float _3064 = _3052 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _3066 = float(_3050);
    float _3068 = _3054 + _2258;
    float _3070 = _2258 * 0.5;
    float _3072 = _2858 + 0.5;
    out.m_49.x = _3064;
    float _3074 = _2812 + 0.5;
    float _3076 = _2876 + 0.5;
    float _3078 = _2376 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    out.m_69.x = _3066;
    float _3080 = _3068 * 0.5;
    float _3082 = _3078 * _2314;
    float _3084 = -_3078;
    float _3086 = _3084 + 1.0;
    float _3088 = _3062 * 0.5;
    float _3090 = fma(_2292, -0.5, _3070);
    float _3092 = _2325 * _3082;
    float _3094 = _2335 * _3082;
    float _3096 = _2325 * _3086;
    float _3098 = fma(_2331, _3092, _2319);
    float _3100 = fma(_2333, _3092, _2321);
    float _3102 = fma(_2325, _3094, _2323);
    out.m_71.x = _3076;
    out.m_71.y = _3072;
    out.m_71.z = _2890;
    out.m_71.w = _3074;
    out.gl_Position.x = _2290;
    out.gl_Position.y = _2292;
    out.gl_Position.z = _3054;
    out.gl_Position.w = _2258;
    out.m_73.x = _3088;
    out.m_73.y = _3090;
    out.m_73.z = _3080;
    out.m_73.w = _2258;
    out.m_75.x = _3098;
    out.m_75.y = _3100;
    out.m_75.z = _3102;
    out.m_75.w = _3096;
    if (!_3060)
    {
        return out;
    }
    out.m_49.x = 0.0;
    float _3104 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _3104;
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
    out.m_61 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_67 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_49 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_71 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_65 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_47 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_73 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_69 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_75 = float4(0.0, 0.0, 0.0, 1.0);
    bool _954 = false;
    bool _738 = false;
    bool _640 = false;
    bool _412 = false;
    bool _196 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _89 = in.m_42.w;
    float _91 = in.m_44.w;
    float _93 = trunc(_89);
    int _96 = int(_93);
    float _98 = -_91;
    float _100 = _98 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    out.m_47.y = _100;
    bool _104 = _96 >= 1;
    float _106 = 0.0;
    float _108 = _91;
    float _110 = _100;
    if (!_104)
    {
        _106 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _112 = _106;
    if (!_104)
    {
        out.m_49.x = 0.0;
    }
    int _114 = 0;
    if (!_104)
    {
        float _116 = _112 * 5.0;
        _114 = as_type<int>(_116);
    }
    int _118 = _114;
    int _120 = _118;
    if (!_104)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _3172 = as_type<float>(_118);
        out.gl_Position.z = _3172;
    }
    if (!_104)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_61.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_61.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_61.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_61.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_67.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_67.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_67.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_67.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_49.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_49.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_49.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_49.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_71.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_71.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_71.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_71.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_65.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_65.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_65.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_65.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_47.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_47.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_47.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_47.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_73.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_73.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_73.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_73.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_69.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_69.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_69.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_69.w)); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_75.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_75.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_75.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_75.w)); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    bool _122 = _91 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _124 = isnan(_91);
    bool _126 = _122 || _124;
    bool _128 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _130 = _126 || _128;
    float _132 = float(_96);
    bool _134 = _100 >= _132;
    bool _136 = !_130;
    bool _138 = _134 || _136;
    if (_138)
    {
        _108 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _140 = _108;
    if (_138)
    {
        out.m_49.x = 0.0;
    }
    if (_138)
    {
        float _142 = _140 * 5.0;
        _120 = as_type<int>(_142);
    }
    int _144 = _120;
    if (_138)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _3227 = as_type<float>(_144);
        out.gl_Position.z = _3227;
    }
    if (_138)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_61.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_61.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_61.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_61.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_67.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_67.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_67.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_67.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_49.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_49.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_49.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_49.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_71.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_71.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_71.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_71.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_65.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_65.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_65.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_65.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_47.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_47.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_47.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_47.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_73.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_73.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_73.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_73.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_69.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_69.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_69.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_69.w)); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_75.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_75.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_75.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_75.w)); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _146 = in.m_51.x;
    float _148 = in.m_51.y;
    float _150 = in.m_51.z;
    float _152 = 1.0 / _132;
    bool _154 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _156 = _100 * _152;
    float _158 = _148 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _160 = _148 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _162 = _148 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _164 = fma(_146, (*spvDescriptorSet0.vp_c10)._m0[4].x, _158);
    float _166 = fma(_146, (*spvDescriptorSet0.vp_c10)._m0[5].x, _160);
    float _168 = fma(_146, (*spvDescriptorSet0.vp_c10)._m0[6].x, _162);
    float _170 = fma(_150, (*spvDescriptorSet0.vp_c10)._m0[4].z, _164);
    float _172 = fma(_150, (*spvDescriptorSet0.vp_c10)._m0[5].z, _166);
    float _174 = fma(_150, (*spvDescriptorSet0.vp_c10)._m0[6].z, _168);
    bool _176 = !_154;
    float _194;
    if (!_176)
    {
        float _178 = in.m_53.x;
        float _180 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _182 = _178 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _184 = fma(_182, (*spvDescriptorSet0.vp_c9)._m0[12].x, _100);
        float _186 = _184 * _180;
        float _188 = floor(_186);
        float _190 = -_188;
        float _192 = _186 + _190;
        _194 = _192;
        _196 = true;
    }
    else
    {
        _194 = _156;
    }
    _196 = false;
    float _198 = _194;
    float _200 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _202 = _198 + _200;
    float _204 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _206 = _198 + _204;
    bool _208 = _198 >= (*spvDescriptorSet0.vp_c9)._m0[146].w;
    bool _210 = isnan(_198);
    bool _212 = _208 || _210;
    bool _214 = isnan((*spvDescriptorSet0.vp_c9)._m0[146].w);
    bool _216 = _212 || _214;
    float _218 = float(_216);
    float _220 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _222 = (*spvDescriptorSet0.vp_c9)._m0[146].w + _220;
    float _224 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _226 = _198 + _224;
    float _228 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _230 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _228;
    float _232 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _234 = _232 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _236 = 1.0 / _222;
    bool _238 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].x;
    float _240 = 1.0 / _234;
    float _242 = 1.0 / _230;
    float _244 = _202 * _236;
    bool _246 = _198 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _248 = isnan(_198);
    bool _250 = _246 || _248;
    bool _252 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _254 = _250 || _252;
    float _256 = float(_254);
    float _258 = -_218;
    float _260 = _258 + 1.0;
    float _262 = _256 * _260;
    float _264 = _206 * _240;
    bool _266 = _198 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _268 = isnan(_198);
    bool _270 = _266 || _268;
    bool _272 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _274 = _270 || _272;
    float _276 = float(_274);
    float _278 = -(*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _280 = (*spvDescriptorSet0.vp_c9)._m0[144].z + _278;
    bool _282 = _198 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _284 = isnan(_198);
    bool _286 = _282 || _284;
    bool _288 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _290 = _286 || _288;
    float _292 = float(_290);
    float _294 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _296 = _294 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _298 = -_256;
    float _300 = _298 + 1.0;
    float _302 = -_276;
    float _304 = _302 + 1.0;
    float _306 = _226 * _242;
    float _308 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _310 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _308;
    float _312 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _314 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _312;
    float _316 = _292 * _304;
    float _318 = fma(_280, _306, (*spvDescriptorSet0.vp_c9)._m0[143].z);
    float _320 = fma(_310, _306, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _322 = fma(_314, _306, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _324 = _276 * _300;
    float _326 = -(*spvDescriptorSet0.vp_c9)._m0[144].z;
    float _328 = _326 + (*spvDescriptorSet0.vp_c9)._m0[145].z;
    float _330 = _320 * _316;
    float _332 = _322 * _316;
    float _334 = _318 * _316;
    float _336 = -_292;
    float _338 = _336 + 1.0;
    float _340 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _342 = _340 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _344 = fma(_338, (*spvDescriptorSet0.vp_c9)._m0[143].x, _332);
    float _346 = fma(_338, (*spvDescriptorSet0.vp_c9)._m0[143].y, _330);
    float _348 = fma(_338, (*spvDescriptorSet0.vp_c9)._m0[143].z, _334);
    float _350 = -(*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _352 = (*spvDescriptorSet0.vp_c9)._m0[146].x + _350;
    float _354 = fma(_296, _264, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _356 = fma(_342, _264, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _358 = fma(_328, _264, (*spvDescriptorSet0.vp_c9)._m0[144].z);
    float _360 = -(*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _362 = (*spvDescriptorSet0.vp_c9)._m0[146].y + _360;
    float _364 = -(*spvDescriptorSet0.vp_c9)._m0[145].z;
    float _366 = (*spvDescriptorSet0.vp_c9)._m0[146].z + _364;
    float _368 = fma(_354, _324, _344);
    float _370 = fma(_352, _244, (*spvDescriptorSet0.vp_c9)._m0[145].x);
    float _372 = fma(_362, _244, (*spvDescriptorSet0.vp_c9)._m0[145].y);
    float _374 = fma(_366, _244, (*spvDescriptorSet0.vp_c9)._m0[145].z);
    float _376 = fma(_356, _324, _346);
    float _378 = fma(_358, _324, _348);
    float _380 = fma(_370, _262, _368);
    float _382 = fma(_372, _262, _376);
    float _384 = fma(_374, _262, _378);
    float _386 = fma(_218, (*spvDescriptorSet0.vp_c9)._m0[146].x, _380);
    float _388 = fma(_218, (*spvDescriptorSet0.vp_c9)._m0[146].y, _382);
    float _390 = fma(_218, (*spvDescriptorSet0.vp_c9)._m0[146].z, _384);
    bool _392 = !_238;
    float _410;
    if (!_392)
    {
        float _394 = in.m_53.x;
        float _396 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].x;
        float _398 = _394 * (*spvDescriptorSet0.vp_c9)._m0[12].y;
        float _400 = fma(_398, (*spvDescriptorSet0.vp_c9)._m0[11].x, _100);
        float _402 = _400 * _396;
        float _404 = floor(_402);
        float _406 = -_404;
        float _408 = _402 + _406;
        _410 = _408;
        _412 = true;
    }
    else
    {
        _410 = _156;
    }
    _412 = false;
    float _414 = _410;
    float _416 = in.m_55.x;
    float _418 = in.m_55.y;
    float _420 = in.m_55.z;
    float _422 = -(*spvDescriptorSet0.vp_c9)._m0[109].w;
    float _424 = _414 + _422;
    float _426 = -(*spvDescriptorSet0.vp_c9)._m0[108].w;
    float _428 = _414 + _426;
    float _430 = -(*spvDescriptorSet0.vp_c9)._m0[109].w;
    float _432 = (*spvDescriptorSet0.vp_c9)._m0[110].w + _430;
    float _434 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _436 = (*spvDescriptorSet0.vp_c9)._m0[108].w + _434;
    float _438 = -(*spvDescriptorSet0.vp_c9)._m0[108].w;
    float _440 = _438 + (*spvDescriptorSet0.vp_c9)._m0[109].w;
    float _442 = 1.0 / _432;
    bool _444 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _446 = 1.0 / _440;
    float _448 = _388 * _418;
    bool _450 = _414 >= (*spvDescriptorSet0.vp_c9)._m0[110].w;
    bool _452 = isnan(_414);
    bool _454 = _450 || _452;
    bool _456 = isnan((*spvDescriptorSet0.vp_c9)._m0[110].w);
    bool _458 = _454 || _456;
    float _460 = float(_458);
    float _462 = _390 * _420;
    float _464 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _466 = _414 + _464;
    float _468 = 1.0 / _436;
    float _470 = _424 * _442;
    bool _472 = _414 >= (*spvDescriptorSet0.vp_c9)._m0[109].w;
    bool _474 = isnan(_414);
    bool _476 = _472 || _474;
    bool _478 = isnan((*spvDescriptorSet0.vp_c9)._m0[109].w);
    bool _480 = _476 || _478;
    float _482 = float(_480);
    float _484 = -_460;
    float _486 = _484 + 1.0;
    float _488 = _386 * _416;
    float _490 = _482 * _486;
    float _492 = _428 * _446;
    bool _494 = _414 >= (*spvDescriptorSet0.vp_c9)._m0[108].w;
    bool _496 = isnan(_414);
    bool _498 = _494 || _496;
    bool _500 = isnan((*spvDescriptorSet0.vp_c9)._m0[108].w);
    bool _502 = _498 || _500;
    float _504 = float(_502);
    float _506 = -(*spvDescriptorSet0.vp_c9)._m0[107].z;
    float _508 = (*spvDescriptorSet0.vp_c9)._m0[108].z + _506;
    bool _510 = _414 >= (*spvDescriptorSet0.vp_c9)._m0[107].w;
    bool _512 = isnan(_414);
    bool _514 = _510 || _512;
    bool _516 = isnan((*spvDescriptorSet0.vp_c9)._m0[107].w);
    bool _518 = _514 || _516;
    float _520 = float(_518);
    float _522 = -(*spvDescriptorSet0.vp_c9)._m0[108].x;
    float _524 = _522 + (*spvDescriptorSet0.vp_c9)._m0[109].x;
    float _526 = -_482;
    float _528 = _526 + 1.0;
    float _530 = -_504;
    float _532 = _530 + 1.0;
    float _534 = _466 * _468;
    float _536 = -(*spvDescriptorSet0.vp_c9)._m0[107].y;
    float _538 = (*spvDescriptorSet0.vp_c9)._m0[108].y + _536;
    float _540 = -(*spvDescriptorSet0.vp_c9)._m0[107].x;
    float _542 = (*spvDescriptorSet0.vp_c9)._m0[108].x + _540;
    float _544 = _520 * _532;
    float _546 = fma(_508, _534, (*spvDescriptorSet0.vp_c9)._m0[107].z);
    float _548 = fma(_538, _534, (*spvDescriptorSet0.vp_c9)._m0[107].y);
    float _550 = fma(_542, _534, (*spvDescriptorSet0.vp_c9)._m0[107].x);
    float _552 = _504 * _528;
    float _554 = -(*spvDescriptorSet0.vp_c9)._m0[108].y;
    float _556 = _554 + (*spvDescriptorSet0.vp_c9)._m0[109].y;
    float _558 = _548 * _544;
    float _560 = -(*spvDescriptorSet0.vp_c9)._m0[108].z;
    float _562 = _560 + (*spvDescriptorSet0.vp_c9)._m0[109].z;
    float _564 = _550 * _544;
    float _566 = -_520;
    float _568 = _566 + 1.0;
    float _570 = _546 * _544;
    float _572 = fma(_568, (*spvDescriptorSet0.vp_c9)._m0[107].x, _564);
    float _574 = fma(_568, (*spvDescriptorSet0.vp_c9)._m0[107].y, _558);
    float _576 = fma(_568, (*spvDescriptorSet0.vp_c9)._m0[107].z, _570);
    float _578 = -(*spvDescriptorSet0.vp_c9)._m0[109].x;
    float _580 = (*spvDescriptorSet0.vp_c9)._m0[110].x + _578;
    float _582 = fma(_524, _492, (*spvDescriptorSet0.vp_c9)._m0[108].x);
    float _584 = fma(_556, _492, (*spvDescriptorSet0.vp_c9)._m0[108].y);
    float _586 = fma(_562, _492, (*spvDescriptorSet0.vp_c9)._m0[108].z);
    float _588 = -(*spvDescriptorSet0.vp_c9)._m0[109].y;
    float _590 = (*spvDescriptorSet0.vp_c9)._m0[110].y + _588;
    float _592 = -(*spvDescriptorSet0.vp_c9)._m0[109].z;
    float _594 = (*spvDescriptorSet0.vp_c9)._m0[110].z + _592;
    float _596 = fma(_582, _552, _572);
    float _598 = fma(_580, _470, (*spvDescriptorSet0.vp_c9)._m0[109].x);
    float _600 = fma(_590, _470, (*spvDescriptorSet0.vp_c9)._m0[109].y);
    float _602 = fma(_594, _470, (*spvDescriptorSet0.vp_c9)._m0[109].z);
    float _604 = fma(_584, _552, _574);
    float _606 = fma(_586, _552, _576);
    float _608 = fma(_598, _490, _596);
    float _610 = fma(_600, _490, _604);
    float _612 = fma(_602, _490, _606);
    float _614 = fma(_460, (*spvDescriptorSet0.vp_c9)._m0[110].x, _608);
    float _616 = fma(_460, (*spvDescriptorSet0.vp_c9)._m0[110].y, _610);
    float _618 = fma(_460, (*spvDescriptorSet0.vp_c9)._m0[110].z, _612);
    bool _620 = !_444;
    float _638;
    if (!_620)
    {
        float _622 = in.m_53.x;
        float _624 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _626 = _622 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _628 = fma(_626, (*spvDescriptorSet0.vp_c9)._m0[11].y, _100);
        float _630 = _628 * _624;
        float _632 = floor(_630);
        float _634 = -_632;
        float _636 = _630 + _634;
        _638 = _636;
        _640 = true;
    }
    else
    {
        _638 = _156;
    }
    _640 = false;
    float _642 = _638;
    bool _644 = _642 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _646 = isnan(_642);
    bool _648 = _644 || _646;
    bool _650 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _652 = _648 || _650;
    float _654 = float(_652);
    float _656 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _658 = _656 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _660 = _642 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _662 = isnan(_642);
    bool _664 = _660 || _662;
    bool _666 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _668 = _664 || _666;
    float _670 = float(_668);
    float _672 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _674 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _672;
    float _676 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _678 = _642 + _676;
    float _680 = -_654;
    float _682 = _680 + 1.0;
    bool _684 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].z;
    float _686 = 1.0 / _658;
    float _688 = _670 * _682;
    float _690 = -_670;
    float _692 = _690 + 1.0;
    float _694 = _674 * _686;
    float _696 = _616 * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _698 = fma(_694, _678, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _700 = _614 * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _702 = _698 * _688;
    float _704 = _618 * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _706 = fma(_692, (*spvDescriptorSet0.vp_c9)._m0[115].x, _702);
    float _708 = _700 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _710 = _696 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _712 = _704 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _714 = fma(_654, (*spvDescriptorSet0.vp_c9)._m0[116].x, _706);
    float _716 = _714 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    bool _718 = !_684;
    float _736;
    if (!_718)
    {
        float _720 = in.m_53.x;
        float _722 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].z;
        float _724 = _720 * (*spvDescriptorSet0.vp_c9)._m0[12].w;
        float _726 = fma(_724, (*spvDescriptorSet0.vp_c9)._m0[11].z, _100);
        float _728 = _726 * _722;
        float _730 = floor(_728);
        float _732 = -_730;
        float _734 = _728 + _732;
        _736 = _734;
        _738 = true;
    }
    else
    {
        _736 = _156;
    }
    _738 = false;
    float _740 = _736;
    float _742 = -(*spvDescriptorSet0.vp_c9)._m0[125].w;
    float _744 = _740 + _742;
    float _746 = -(*spvDescriptorSet0.vp_c9)._m0[124].w;
    float _748 = _740 + _746;
    bool _750 = _740 >= (*spvDescriptorSet0.vp_c9)._m0[126].w;
    bool _752 = isnan(_740);
    bool _754 = _750 || _752;
    bool _756 = isnan((*spvDescriptorSet0.vp_c9)._m0[126].w);
    bool _758 = _754 || _756;
    float _760 = float(_758);
    float _762 = -(*spvDescriptorSet0.vp_c9)._m0[125].w;
    float _764 = (*spvDescriptorSet0.vp_c9)._m0[126].w + _762;
    float _766 = -(*spvDescriptorSet0.vp_c9)._m0[123].w;
    float _768 = _740 + _766;
    float _770 = -(*spvDescriptorSet0.vp_c9)._m0[123].w;
    float _772 = (*spvDescriptorSet0.vp_c9)._m0[124].w + _770;
    float _774 = -(*spvDescriptorSet0.vp_c9)._m0[124].w;
    float _776 = _774 + (*spvDescriptorSet0.vp_c9)._m0[125].w;
    float _778 = 1.0 / _764;
    bool _780 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].w;
    float _782 = 1.0 / _776;
    float _784 = 1.0 / _772;
    float _786 = _744 * _778;
    bool _788 = _740 >= (*spvDescriptorSet0.vp_c9)._m0[125].w;
    bool _790 = isnan(_740);
    bool _792 = _788 || _790;
    bool _794 = isnan((*spvDescriptorSet0.vp_c9)._m0[125].w);
    bool _796 = _792 || _794;
    float _798 = float(_796);
    float _800 = -_760;
    float _802 = _800 + 1.0;
    float _804 = _798 * _802;
    float _806 = _748 * _782;
    bool _808 = _740 >= (*spvDescriptorSet0.vp_c9)._m0[124].w;
    bool _810 = isnan(_740);
    bool _812 = _808 || _810;
    bool _814 = isnan((*spvDescriptorSet0.vp_c9)._m0[124].w);
    bool _816 = _812 || _814;
    float _818 = float(_816);
    float _820 = -(*spvDescriptorSet0.vp_c9)._m0[123].z;
    float _822 = (*spvDescriptorSet0.vp_c9)._m0[124].z + _820;
    bool _824 = _740 >= (*spvDescriptorSet0.vp_c9)._m0[123].w;
    bool _826 = isnan(_740);
    bool _828 = _824 || _826;
    bool _830 = isnan((*spvDescriptorSet0.vp_c9)._m0[123].w);
    bool _832 = _828 || _830;
    float _834 = float(_832);
    float _836 = -(*spvDescriptorSet0.vp_c9)._m0[124].x;
    float _838 = _836 + (*spvDescriptorSet0.vp_c9)._m0[125].x;
    float _840 = -_798;
    float _842 = _840 + 1.0;
    float _844 = -_818;
    float _846 = _844 + 1.0;
    float _848 = _768 * _784;
    float _850 = -(*spvDescriptorSet0.vp_c9)._m0[123].y;
    float _852 = (*spvDescriptorSet0.vp_c9)._m0[124].y + _850;
    float _854 = -(*spvDescriptorSet0.vp_c9)._m0[123].x;
    float _856 = (*spvDescriptorSet0.vp_c9)._m0[124].x + _854;
    float _858 = _834 * _846;
    float _860 = fma(_822, _848, (*spvDescriptorSet0.vp_c9)._m0[123].z);
    float _862 = fma(_852, _848, (*spvDescriptorSet0.vp_c9)._m0[123].y);
    float _864 = fma(_856, _848, (*spvDescriptorSet0.vp_c9)._m0[123].x);
    float _866 = _818 * _842;
    float _868 = _860 * _858;
    float _870 = _862 * _858;
    float _872 = _864 * _858;
    float _874 = -_834;
    float _876 = _874 + 1.0;
    float _878 = -(*spvDescriptorSet0.vp_c9)._m0[124].y;
    float _880 = _878 + (*spvDescriptorSet0.vp_c9)._m0[125].y;
    float _882 = -(*spvDescriptorSet0.vp_c9)._m0[124].z;
    float _884 = _882 + (*spvDescriptorSet0.vp_c9)._m0[125].z;
    float _886 = fma(_876, (*spvDescriptorSet0.vp_c9)._m0[123].x, _872);
    float _888 = fma(_876, (*spvDescriptorSet0.vp_c9)._m0[123].y, _870);
    float _890 = -(*spvDescriptorSet0.vp_c9)._m0[125].x;
    float _892 = (*spvDescriptorSet0.vp_c9)._m0[126].x + _890;
    float _894 = fma(_838, _806, (*spvDescriptorSet0.vp_c9)._m0[124].x);
    float _896 = fma(_880, _806, (*spvDescriptorSet0.vp_c9)._m0[124].y);
    float _898 = fma(_876, (*spvDescriptorSet0.vp_c9)._m0[123].z, _868);
    float _900 = -(*spvDescriptorSet0.vp_c9)._m0[125].y;
    float _902 = (*spvDescriptorSet0.vp_c9)._m0[126].y + _900;
    float _904 = fma(_884, _806, (*spvDescriptorSet0.vp_c9)._m0[124].z);
    float _906 = -(*spvDescriptorSet0.vp_c9)._m0[125].z;
    float _908 = (*spvDescriptorSet0.vp_c9)._m0[126].z + _906;
    float _910 = fma(_894, _866, _886);
    float _912 = fma(_892, _786, (*spvDescriptorSet0.vp_c9)._m0[125].x);
    float _914 = fma(_902, _786, (*spvDescriptorSet0.vp_c9)._m0[125].y);
    float _916 = fma(_896, _866, _888);
    float _918 = fma(_908, _786, (*spvDescriptorSet0.vp_c9)._m0[125].z);
    float _920 = fma(_904, _866, _898);
    float _922 = fma(_912, _804, _910);
    float _924 = fma(_914, _804, _916);
    float _926 = fma(_918, _804, _920);
    float _928 = fma(_760, (*spvDescriptorSet0.vp_c9)._m0[126].x, _922);
    float _930 = fma(_760, (*spvDescriptorSet0.vp_c9)._m0[126].y, _924);
    float _932 = fma(_760, (*spvDescriptorSet0.vp_c9)._m0[126].z, _926);
    bool _934 = !_780;
    float _952;
    if (!_934)
    {
        float _936 = in.m_53.x;
        float _938 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].w;
        float _940 = _936 * (*spvDescriptorSet0.vp_c9)._m0[13].x;
        float _942 = fma(_940, (*spvDescriptorSet0.vp_c9)._m0[11].w, _100);
        float _944 = _942 * _938;
        float _946 = floor(_944);
        float _948 = -_946;
        float _950 = _944 + _948;
        _952 = _950;
        _954 = true;
    }
    else
    {
        _952 = _156;
    }
    _954 = false;
    float _956 = _952;
    float _958 = in.m_53.x;
    float _960 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].x);
    int _962 = int(_960);
    float _964 = in.m_53.z;
    int _966 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _968 = _966 != 0;
    float _970 = in.m_53.y;
    float _972 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    float _974 = in.m_42.x;
    float _976 = in.m_42.y;
    float _978 = in.m_42.z;
    float _980 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _982 = (*spvDescriptorSet0.vp_c8)._m0[28].y * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _984 = fma((*spvDescriptorSet0.vp_c8)._m0[28].x, (*spvDescriptorSet0.vp_c8)._m0[28].x, _982);
    float _986 = (*spvDescriptorSet0.vp_c8)._m0[0].y * (*spvDescriptorSet0.vp_c10)._m0[9].w;
    float _988 = _958 * 2.0;
    float _990 = _958 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    float _992 = (*spvDescriptorSet0.vp_c9)._m0[83].z + (*spvDescriptorSet0.vp_c9)._m0[83].x;
    float _994 = floor(_988);
    float _996 = -_972;
    float _998 = fma(_990, 2.0, _996);
    float _1000 = fma((*spvDescriptorSet0.vp_c8)._m0[0].x, (*spvDescriptorSet0.vp_c10)._m0[8].w, _986);
    float _1002 = _970 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    float _1004 = _970 * 2.0;
    float _1006 = (*spvDescriptorSet0.vp_c9)._m0[82].x + (*spvDescriptorSet0.vp_c9)._m0[81].z;
    float _1008 = fma((*spvDescriptorSet0.vp_c8)._m0[0].z, (*spvDescriptorSet0.vp_c10)._m0[10].w, _1000);
    float _1010 = fma(_1002, -2.0, _980);
    float _1012 = _964 * 2.0;
    float _1014 = _976 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _1016 = _976 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _1018 = _976 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _1020 = floor(_1004);
    float _1022 = fma(_974, (*spvDescriptorSet0.vp_c10)._m0[4].x, _1014);
    float _1024 = fma(_974, (*spvDescriptorSet0.vp_c10)._m0[5].x, _1016);
    float _1026 = fma(_974, (*spvDescriptorSet0.vp_c10)._m0[6].x, _1018);
    float _1028 = _958 + _970;
    float _1030 = _958 + _964;
    float _1032 = fma(_978, (*spvDescriptorSet0.vp_c10)._m0[4].z, _1022);
    float _1034 = fma(_978, (*spvDescriptorSet0.vp_c10)._m0[5].z, _1024);
    float _1036 = floor(_1012);
    float _1038 = _1028 + (-1.0);
    float _1040 = _970 + _964;
    float _1042 = _1030 + (-1.0);
    float _1044 = fma(_978, (*spvDescriptorSet0.vp_c10)._m0[6].z, _1026);
    bool _1046 = _994 > 0.0;
    float _1048 = _1040 + (-1.0);
    float _1050 = fma(_1042, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _1052 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].y);
    int _1054 = int(_1052);
    float _1056 = fma(_1048, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    float _1058 = _1048;
    if (!_968)
    {
        _1058 = _964;
    }
    float _1060 = _1058;
    float _1062 = -_100;
    float _1064 = fma(_1062, (*spvDescriptorSet0.vp_c9)._m0[76].x, _998);
    float _1066 = _1060;
    if (_968)
    {
        _1066 = _970;
    }
    float _1068 = _1066;
    float _1070 = (*spvDescriptorSet0.vp_c9)._m0[83].w + (*spvDescriptorSet0.vp_c9)._m0[83].y;
    bool _1072 = _1036 > 0.0;
    float _1074 = _1044 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    bool _1076 = _1036 >= 0.0;
    bool _1078 = isnan(_1036);
    bool _1080 = _1076 || _1078;
    bool _1082 = isnan(0.0);
    bool _1084 = _1080 || _1082;
    float _1086 = fma(_1068, (*spvDescriptorSet0.vp_c9)._m0[83].w, _1070);
    float _1088 = _1068;
    float _1090 = _1070;
    if (!_968)
    {
        _1088 = _964;
    }
    float _1092 = _1088;
    float _1094 = _1092;
    if (!_968)
    {
        _1090 = _970;
    }
    float _1096 = _1090;
    float _1098 = fma((*spvDescriptorSet0.vp_c8)._m0[28].z, (*spvDescriptorSet0.vp_c8)._m0[28].z, _984);
    float _1100 = _1096;
    if (_968)
    {
        _1094 = _970;
    }
    float _1102 = _1094;
    float _1104 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _1106 = log2(_1104);
    if (_968)
    {
        _1100 = _958;
    }
    float _1108 = _1100;
    float _1110 = fma(_100, (*spvDescriptorSet0.vp_c9)._m0[76].y, _1010);
    bool _1112 = _994 >= 0.0;
    bool _1114 = isnan(_994);
    bool _1116 = _1112 || _1114;
    bool _1118 = isnan(0.0);
    bool _1120 = _1116 || _1118;
    float _1122 = _1102 * (*spvDescriptorSet0.vp_c9)._m0[82].y;
    int _1124 = _1084 ? 0 : 1;
    float _1126 = fma(_1108, (*spvDescriptorSet0.vp_c9)._m0[83].z, _992);
    float _1128 = _1108 * (*spvDescriptorSet0.vp_c9)._m0[82].x;
    bool _1130 = _1020 >= 0.0;
    bool _1132 = isnan(_1020);
    bool _1134 = _1130 || _1132;
    bool _1136 = isnan(0.0);
    bool _1138 = _1134 || _1136;
    float _1140 = rsqrt(_1098);
    int _1142 = ~_1124;
    int _1144 = _1142 + 1;
    int _1146 = _1144 + 1;
    float _1148 = -_1006;
    float _1150 = fma(_1128, 2.0, _1148);
    int _1152 = _1146;
    if (!_1072)
    {
        int _1154 = ~_1124;
        int _1156 = _1154 + 1;
        _1152 = _1156;
    }
    int _1158 = _1152;
    bool _1160 = _1020 > 0.0;
    float _1162 = _1106 * _100;
    int _1164 = _1120 ? 0 : 1;
    bool _1166 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _1168 = isnan(0.0);
    bool _1170 = _1166 || _1168;
    bool _1172 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _1174 = _1170 || _1172;
    float _1176 = exp2(_1162);
    int _1178 = _1138 ? 0 : 1;
    float _1180 = float(_1054);
    float _1182 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _1184 = 1.0 + _1182;
    int _1186 = ~_1164;
    int _1188 = _1186 + 1;
    int _1190 = _1188 + 1;
    int _1192 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 16;
    bool _1194 = _1192 != 0;
    int _1196 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 32;
    bool _1198 = _1196 != 0;
    int _1200 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 64;
    bool _1202 = _1200 != 0;
    float _1204 = 1.0 / _1180;
    int _1206 = _1190;
    if (!_1046)
    {
        int _1208 = ~_1164;
        int _1210 = _1208 + 1;
        _1206 = _1210;
    }
    int _1212 = _1206;
    float _1214 = fma(_1038, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    bool _1216 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _1218 = isnan(1.0);
    bool _1220 = _1216 || _1218;
    bool _1222 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _1224 = _1220 || _1222;
    float _1226 = 1.0 / _1184;
    bool _1228 = !_1198;
    int _1230 = _1228 ? 0 : 1;
    float _1232 = (*spvDescriptorSet0.vp_c9)._m0[82].y + (*spvDescriptorSet0.vp_c9)._m0[81].w;
    bool _1234 = !_1194;
    int _1236 = _1234 ? 0 : 1;
    float _1238 = -_1176;
    float _1240 = _1238 + 1.0;
    bool _1242 = !_1202;
    int _1244 = _1242 ? 0 : 1;
    float _1246 = fma(_1122, -2.0, _1232);
    int _1248 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _1250 = _1248 != 0;
    int _1252 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _1254 = _1252 != 0;
    int _1256 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _1258 = _1256 != 0;
    int _1260 = ~_1178;
    int _1262 = _1260 + 1;
    int _1264 = _1262 + 1;
    float _1266 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    int _1268 = _1264;
    if (!_1160)
    {
        int _1270 = ~_1178;
        int _1272 = _1270 + 1;
        _1268 = _1272;
    }
    int _1274 = _1268;
    float _1276 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    bool _1278 = !_1250;
    int _1280 = _1278 ? 0 : 1;
    float _1282 = in.m_57.x;
    float _1284 = in.m_57.y;
    float _1286 = in.m_57.z;
    bool _1288 = !_1254;
    int _1290 = _1288 ? 0 : 1;
    float _1292 = fma(_958, (*spvDescriptorSet0.vp_c9)._m0[78].z, _1266);
    int _1294 = abs(_1280);
    float _1296 = fma(_970, (*spvDescriptorSet0.vp_c9)._m0[78].w, _1276);
    int _1298 = abs(_1290);
    float _1300 = -_100;
    float _1302 = fma(_1300, (*spvDescriptorSet0.vp_c9)._m0[81].x, _1150);
    float _1304 = _1204 * _100;
    float _1306 = fma(_100, (*spvDescriptorSet0.vp_c9)._m0[82].w, _1086);
    float _1308 = fma(_100, (*spvDescriptorSet0.vp_c9)._m0[77].z, _1292);
    float _1310 = fma(_100, (*spvDescriptorSet0.vp_c9)._m0[77].w, _1296);
    float _1312 = float(_962);
    float _1314 = float(_1212);
    float _1316 = fma(_100, (*spvDescriptorSet0.vp_c9)._m0[81].y, _1246);
    float _1318 = _1174 ? _1240 : 0.0;
    float _1320 = _1312 * _100;
    float _1322 = float(_1294);
    float _1324 = fma(_100, (*spvDescriptorSet0.vp_c9)._m0[82].z, _1126);
    float _1326 = float(_1158);
    if (_1224)
    {
        float _1328 = _1318 * _1226;
        _110 = _1328;
    }
    float _1330 = _110;
    bool _1332 = !_1258;
    int _1334 = _1332 ? 0 : 1;
    float _1336 = float(_1298);
    float _1338 = _1322 * _1326;
    int _1340 = abs(_1334);
    float _1342 = _1140 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _1344 = _1336 * _1314;
    float _1346 = _1338 * (-2.0);
    float _1348 = _1140 * (*spvDescriptorSet0.vp_c8)._m0[28].x;
    float _1350 = _1342 * _1342;
    float _1352 = -(*spvDescriptorSet0.vp_c9)._m0[194].y;
    float _1354 = (*spvDescriptorSet0.vp_c9)._m0[194].z + _1352;
    float _1356 = _958 + (-0.5);
    float _1358 = fma(_1346, _1282, _1282);
    float _1360 = _1140 * (*spvDescriptorSet0.vp_c8)._m0[28].z;
    float _1362 = fma(_1348, _1348, _1350);
    float _1364 = float(_1274);
    float _1366 = fma(_1214, _1346, _1214);
    float _1368 = float(_1340);
    float _1370 = fma(_1356, (*spvDescriptorSet0.vp_c9)._m0[196].x, _1358);
    float _1372 = fma(_1360, _1360, _1362);
    float _1374 = _1344 * (-2.0);
    float _1376 = 1.0 / _1354;
    float _1378 = _1368 * _1364;
    float _1380 = fma(_1366, _1330, _1370);
    float _1382 = _1034 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _1384 = fma(_1056, _1374, _1056);
    float _1386 = fma(_1374, _1284, _1284);
    float _1388 = _970 + (-0.5);
    float _1390 = _1032 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _1392 = _1382 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1394 = in.m_59.x;
    float _1396 = in.m_59.y;
    float _1398 = in.m_59.z;
    float _1400 = fma(_1388, (*spvDescriptorSet0.vp_c9)._m0[196].y, _1386);
    float _1402 = _1378 * (-2.0);
    float _1404 = fma(_1390, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1392);
    float _1406 = rsqrt(_1372);
    float _1408 = fma(_1384, _1330, _1400);
    float _1410 = fma(_1050, _1402, _1050);
    float _1412 = fma(_1074, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1404);
    float _1414 = fma(_1402, _1286, _1286);
    float _1416 = _1408 * 0.15915493667125701904296875;
    float _1418 = _1008 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1420 = _1412 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1422 = _1380 * 0.15915493667125701904296875;
    float _1424 = _964 + (-0.5);
    float _1426 = _1416 * 6.283185482025146484375;
    float _1428 = sin(_1426);
    bool _1430 = _1420 >= _1418;
    bool _1432 = isnan(_1420);
    bool _1434 = _1430 || _1432;
    bool _1436 = isnan(_1418);
    bool _1438 = _1434 || _1436;
    float _1440 = fma(_1424, (*spvDescriptorSet0.vp_c9)._m0[196].z, _1414);
    float _1442 = -_1420;
    float _1444 = _1418 + _1442;
    float _1446 = _1348 * _1406;
    float _1448 = fma(_1410, _1330, _1440);
    float _1450 = _1422 * 6.283185482025146484375;
    float _1452 = sin(_1450);
    float _1454 = abs(_1444);
    float _1456 = precise::max(_1454, (*spvDescriptorSet0.vp_c9)._m0[194].y);
    float _1458 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _1396);
    float _1460 = _1448 * 0.15915493667125701904296875;
    float _1462 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _1394);
    float _1464 = precise::min(_1456, (*spvDescriptorSet0.vp_c9)._m0[194].z);
    float _1466 = _448 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _1468 = _462 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _1470 = _1422 * 6.283185482025146484375;
    float _1472 = cos(_1470);
    float _1474 = _1342 * _1406;
    float _1476 = -(*spvDescriptorSet0.vp_c9)._m0[194].y;
    float _1478 = _1464 + _1476;
    float _1480 = _1466 * _1458;
    float _1482 = _1360 * _1406;
    float _1484 = _1478 * _1376;
    float _1486 = _1460 * 6.283185482025146484375;
    float _1488 = cos(_1486);
    float _1490 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _1398);
    float _1492 = _488 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    bool _1494 = !_1438;
    float _1496 = _1494 ? 1.0 : (-1.0);
    float _1498 = _1468 * _1490;
    float _1500 = _1492 * _1462;
    float _1502 = _156 * (*spvDescriptorSet0.vp_c9)._m0[194].w;
    float _1504 = _1416 * 6.283185482025146484375;
    float _1506 = cos(_1504);
    float _1508 = _1496 * _1484;
    float _1510 = _1472 * _1428;
    float _1512 = _1502 * _1508;
    float _1514 = _1452 * _1428;
    float _1516 = _1460 * 6.283185482025146484375;
    float _1518 = sin(_1516);
    float _1520 = _1428 * _1488;
    float _1522 = _1512 * 0.15915493667125701904296875;
    float _1524 = _1488 * _1480;
    float _1526 = _1472 * _1506;
    float _1528 = _1452 * _1506;
    float _1530 = _1522 * 6.283185482025146484375;
    float _1532 = cos(_1530);
    float _1534 = _1472 * _1524;
    float _1536 = _1506 * _1488;
    float _1538 = _1452 * _1524;
    float _1540 = fma(_1518, _1526, _1514);
    float _1542 = -_1510;
    float _1544 = fma(_1518, _1528, _1542);
    float _1546 = -_1528;
    float _1548 = fma(_1518, _1510, _1546);
    float _1550 = -_1480;
    float _1552 = _1518 * _1550;
    float _1554 = fma(_1540, _1500, _1534);
    float _1556 = _1522 * 6.283185482025146484375;
    float _1558 = sin(_1556);
    float _1560 = fma(_1518, _1514, _1526);
    float _1562 = fma(_1536, _1500, _1552);
    float _1564 = fma(_1548, _1498, _1554);
    float _1566 = fma(_1544, _1500, _1538);
    float _1568 = -_1532;
    float _1570 = _1568 + 1.0;
    float _1572 = fma(_1520, _1498, _1562);
    float _1574 = _1564 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _1576 = _1564 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _1578 = fma(_1560, _1498, _1566);
    float _1580 = _1564 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _1582 = fma(_1572, (*spvDescriptorSet0.vp_c8)._m0[25].x, _1574);
    float _1584 = fma(_1572, (*spvDescriptorSet0.vp_c8)._m0[24].x, _1576);
    float _1586 = _1474 * _1570;
    float _1588 = _1482 * _1482;
    float _1590 = fma(_1578, (*spvDescriptorSet0.vp_c8)._m0[25].z, _1582);
    float _1592 = _1446 * _1558;
    float _1594 = _1474 * _1558;
    float _1596 = _1482 * _1558;
    float _1598 = _1446 * _1570;
    float _1600 = fma(_1572, (*spvDescriptorSet0.vp_c8)._m0[26].x, _1580);
    float _1602 = fma(_1482, _1586, _1592);
    float _1604 = fma(_1578, (*spvDescriptorSet0.vp_c8)._m0[24].z, _1584);
    float _1606 = _1590 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _1608 = fma(_1570, _1588, _1532);
    float _1610 = -_1596;
    float _1612 = fma(_1474, _1598, _1610);
    float _1614 = -_1594;
    float _1616 = fma(_1482, _1598, _1614);
    float _1618 = _1604 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _1620 = _1606 * _1602;
    float _1622 = fma(_1578, (*spvDescriptorSet0.vp_c8)._m0[26].z, _1600);
    float _1624 = fma(_1446, _1598, _1532);
    float _1626 = _1606 * _1612;
    float _1628 = fma(_1618, _1616, _1620);
    float _1630 = _1622 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _1632 = fma(_1474, _1586, _1532);
    float _1634 = fma(_1618, _1624, _1626);
    float _1636 = fma(_1482, _1598, _1594);
    float _1638 = fma(_1630, _1608, _1628);
    float _1640 = fma(_1474, _1598, _1596);
    float _1642 = _1606 * _1632;
    float _1644 = fma(_1630, _1636, _1634);
    float _1646 = _1074 + _1638;
    float _1648 = -_1592;
    float _1650 = fma(_1482, _1586, _1648);
    float _1652 = fma(_1618, _1640, _1642);
    float _1654 = _1390 + _1644;
    float _1656 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1658 = _1646 + _1656;
    float _1660 = _1382 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _1662 = fma(_1630, _1650, _1652);
    float _1664 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1666 = _1654 + _1664;
    float _1668 = _1658 * _1658;
    float _1670 = fma(_1390, (*spvDescriptorSet0.vp_c8)._m0[11].x, _1660);
    float _1672 = _1382 + _1662;
    float _1674 = fma(_1666, _1666, _1668);
    float _1676 = fma(_1074, (*spvDescriptorSet0.vp_c8)._m0[11].z, _1670);
    float _1678 = sqrt(_1674);
    bool _1680 = _1678 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1682 = _1670;
    float _1684 = _1662;
    float _1686 = _1586;
    float _1688 = _1678;
    if (!_1680)
    {
        _1682 = _1654;
    }
    float _1690 = _1682;
    float _1692 = _1690;
    if (!_1680)
    {
        _1684 = _1646;
    }
    float _1694 = _1684;
    float _1696 = _1694;
    if (!_1680)
    {
        _1686 = _1672;
    }
    float _1698 = _1686;
    bool _1700 = !_1680;
    float _1702 = _1698;
    if (!_1700)
    {
        float _1704 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1706 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1708 = _1678 + _1706;
        float _1710 = rsqrt(_1674);
        float _1712 = _1708 * _1704;
        float _1714 = _1672 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1716 = _1712 * 0.15915493667125701904296875;
        float _1718 = _1716 * 6.283185482025146484375;
        float _1720 = cos(_1718);
        float _1722 = _1716 * 6.283185482025146484375;
        float _1724 = sin(_1722);
        float _1726 = _1720 + (-1.0);
        float _1728 = fma(_1724, _1714, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1730 = _1726 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1732 = _1710 * _1728;
        float _1734 = fma(_1672, _1720, _1730);
        float _1736 = fma(_1666, _1732, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1738 = fma(_1658, _1732, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _1702 = _1734;
        _1692 = _1736;
        _1696 = _1738;
    }
    float _1740 = _1702;
    float _1742 = _1692;
    float _1744 = _1696;
    float _1746 = -_1382;
    float _1748 = _1746 + _1740;
    float _1750 = _1676 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _1752 = -_1390;
    float _1754 = _1752 + _1742;
    float _1756 = -_1074;
    float _1758 = _1756 + _1744;
    float _1760 = _1748 * _1748;
    float _1762 = _1382 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _1764 = 1.0 / _1750;
    float _1766 = fma(_1754, _1754, _1760);
    float _1768 = fma(_1390, (*spvDescriptorSet0.vp_c8)._m0[10].x, _1762);
    float _1770 = fma(_1758, _1758, _1766);
    float _1772 = fma(_1074, (*spvDescriptorSet0.vp_c8)._m0[10].z, _1768);
    bool _1774 = (*spvDescriptorSet0.vp_c15)._m0[653].w >= 0.5;
    bool _1776 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _1778 = _1774 || _1776;
    bool _1780 = isnan(0.5);
    bool _1782 = _1778 || _1780;
    float _1784 = sqrt(_1770);
    float _1786 = _1772 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _1788 = _1786 + _1750;
    float _1790 = _1788 * _1764;
    float _1792 = _1790 * 0.5;
    bool _1794 = _1784 > 0.0;
    float _1796 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _1798 = fma(_1792, (*spvDescriptorSet0.vp_c8)._m0[30].w, _1796);
    float _1800 = _1792;
    float _1802 = _1754;
    float _1804 = _1740;
    float _1806 = _1742;
    float _1808 = _1744;
    float _1810 = _1758;
    float _1812 = (*spvDescriptorSet0.vp_c15)._m0[653].w;
    float _1814 = _1750;
    if (_1782)
    {
        _1800 = 1.0;
    }
    float _1816 = _1800;
    float _1818 = 1.0 / _1798;
    bool _1820 = !_1794;
    float _1822 = _1816;
    if (!_1820)
    {
        float _1824 = _172 * _172;
        float _1826 = rsqrt(_1770);
        float _1828 = fma(_170, _170, _1824);
        float _1830 = fma(_174, _174, _1828);
        float _1832 = sqrt(_1830);
        float _1834 = _1748 * _1826;
        float _1836 = _1758 * _1826;
        bool _1838 = _1832 > 0.0;
        float _1840 = _1754 * _1826;
        bool _1842 = !_1838;
        _1812 = _1836;
        _1814 = _1840;
        if (!_1842)
        {
            float _1844 = rsqrt(_1830);
            float _1846 = 1.0 / (*spvDescriptorSet0.vp_c10)._m0[2].z;
            float _1848 = _172 * _1844;
            float _1850 = _170 * _1844;
            float _1852 = _174 * _1844;
            float _1854 = _1834 * _1848;
            float _1856 = fma(_1840, _1850, _1854);
            float _1858 = _1846 * (*spvDescriptorSet0.vp_c9)._m0[142].x;
            float _1860 = fma(_1836, _1852, _1856);
            float _1862 = _1860 * _1858;
            float _1864 = fma(_170, _1862, _1742);
            float _1866 = fma(_172, _1862, _1740);
            float _1868 = fma(_174, _1862, _1744);
            _1802 = _1856;
            _1804 = _1866;
            _1806 = _1864;
            _1808 = _1868;
            _1810 = _1854;
        }
    }
    float _1870 = _1802;
    float _1872 = _1804;
    float _1874 = _1806;
    float _1876 = _1808;
    float _1878 = _1810;
    float _1880 = _1812;
    float _1882 = _1814;
    float _1884 = _1882;
    float _1886 = _1870;
    float _1888 = _1878;
    float _1890 = _1880;
    if (_1782)
    {
        _1884 = 1.0;
    }
    float _1892 = _1884;
    float _1894 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _1896 = _1818 * _1894;
    float _1898 = _1892;
    if (!_1782)
    {
        float _1900 = (*spvDescriptorSet0.vp_c8)._m0[31].x * 0.5;
        float _1902 = _1900 * 0.15915493667125701904296875;
        float _1904 = _1902 * 6.283185482025146484375;
        float _1906 = cos(_1904);
        float _1908 = (*spvDescriptorSet0.vp_c8)._m0[31].y * 0.5;
        float _1910 = _1908 * 0.15915493667125701904296875;
        float _1912 = _1902 * 6.283185482025146484375;
        float _1914 = sin(_1912);
        float _1916 = 1.0 / _1906;
        float _1918 = _1910 * 6.283185482025146484375;
        float _1920 = cos(_1918);
        float _1922 = _1914 * _1916;
        float _1924 = _1910 * 6.283185482025146484375;
        float _1926 = sin(_1924);
        float _1928 = _1920 * _1922;
        float _1930 = 1.0 / _1928;
        float _1932 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1934 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _1932;
        float _1936 = 1.0 / _1934;
        float _1938 = _1926 * _1930;
        float _1940 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1942 = fma(_1896, _1938, _1940);
        float _1944 = _1942 * _1936;
        float _1946 = precise::clamp(_1944, 0.0, 1.0);
        _1886 = _1910;
        _1888 = _1902;
        _1822 = _1946;
    }
    float _1948 = _1886;
    float _1950 = _1888;
    float _1952 = _1822;
    float _1954 = _1948;
    if (!_1782)
    {
        float _1956 = (*spvDescriptorSet0.vp_c8)._m0[31].x * 0.5;
        float _1958 = _1956 * 0.15915493667125701904296875;
        float _1960 = _1958 * 6.283185482025146484375;
        float _1962 = cos(_1960);
        float _1964 = (*spvDescriptorSet0.vp_c8)._m0[31].y * 0.5;
        float _1966 = _1964 * 0.15915493667125701904296875;
        float _1968 = _1958 * 6.283185482025146484375;
        float _1970 = sin(_1968);
        float _1972 = 1.0 / _1962;
        float _1974 = _1966 * 6.283185482025146484375;
        float _1976 = cos(_1974);
        float _1978 = _1970 * _1972;
        float _1980 = _1966 * 6.283185482025146484375;
        float _1982 = sin(_1980);
        float _1984 = _1976 * _1978;
        float _1986 = 1.0 / _1984;
        float _1988 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _1990 = (*spvDescriptorSet0.vp_c9)._m0[140].w + _1988;
        float _1992 = 1.0 / _1990;
        float _1994 = _1982 * _1986;
        float _1996 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _1998 = fma(_1896, _1994, _1996);
        float _2000 = _1998 * _1992;
        float _2002 = precise::clamp(_2000, 0.0, 1.0);
        float _2004 = -_2002;
        float _2006 = _2004 + 1.0;
        _1954 = _1972;
        _1898 = _2006;
    }
    float _2008 = _1954;
    float _2010 = _1898;
    float _2012 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _2014 = _1872 + _2012;
    float _2016 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _2018 = _1874 + _2016;
    float _2020 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _2022 = _1876 + _2020;
    float _2024 = _2014 * _2014;
    float _2026 = fma(_2018, _2018, _2024);
    float _2028 = fma(_2022, _2022, _2026);
    float _2030 = rsqrt(_2028);
    float _2032 = sqrt(_2028);
    float _2034 = _2030 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _2036 = _2018 * _2034;
    float _2038 = _2022 * _2034;
    float _2040 = _2036 * _2036;
    float _2042 = _2038 * _2038;
    float _2044 = _2040 + _2042;
    float _2046 = sqrt(_2044);
    bool _2048 = _2046 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2050 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2052 = _2046 + _2050;
    float _2054 = _2008;
    float _2056 = _2044;
    float _2058 = _2052;
    float _2060 = _2014;
    float _2062 = _2038;
    float _2064 = _2040;
    float _2066 = _2042;
    if (_2048)
    {
        float _2068 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2054 = _2068;
    }
    float _2070 = _2054;
    if (_2048)
    {
        float _2072 = rsqrt(_2044);
        _2056 = _2072;
    }
    float _2074 = _2056;
    if (_2048)
    {
        float _2076 = _2052 * _2070;
        _2058 = _2076;
    }
    float _2078 = _2058;
    if (_2048)
    {
        float _2080 = _2078 * 0.15915493667125701904296875;
        _1890 = _2080;
    }
    float _2082 = _1890;
    float _2084 = _1950;
    if (_2048)
    {
        float _2086 = _2082 * 6.283185482025146484375;
        float _2088 = sin(_2086);
        _2084 = _2088;
    }
    float _2090 = _2084;
    float _2092 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _2094 = precise::max(0.0, _2092);
    float _2096 = _2070;
    float _2098 = _2094;
    if (_2048)
    {
        float _2100 = _2082 * 6.283185482025146484375;
        float _2102 = cos(_2100);
        _2096 = _2102;
    }
    float _2104 = _2096;
    float _2106 = -_2034;
    float _2108 = -_2094;
    float _2110 = fma(_2014, _2106, _2108);
    if (_2048)
    {
        float _2112 = _2110 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2060 = _2112;
    }
    float _2114 = _2060;
    float _2116 = _2114;
    float _2118 = _2090;
    if (_2048)
    {
        float _2120 = fma(_2090, _2114, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _2098 = _2120;
    }
    float _2122 = _2098;
    float _2124 = _2122;
    if (!_2048)
    {
        _2116 = _2036;
    }
    float _2126 = _2116;
    float _2128 = _2126;
    if (_2048)
    {
        float _2130 = _2104 + (-1.0);
        _2118 = _2130;
    }
    float _2132 = _2118;
    float _2134 = _2132;
    if (_2048)
    {
        float _2136 = _2074 * _2122;
        _1688 = _2136;
    }
    float _2138 = _1688;
    if (!_2048)
    {
        _2124 = _2110;
    }
    float _2140 = _2124;
    float _2142 = _2140;
    if (_2048)
    {
        float _2144 = _2132 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2134 = _2144;
    }
    float _2146 = _2134;
    if (_2048)
    {
        float _2148 = _2036 * _2138;
        _2128 = _2148;
    }
    float _2150 = _2128;
    if (_2048)
    {
        float _2152 = _2038 * _2138;
        _2062 = _2152;
    }
    float _2154 = _2062;
    if (_2048)
    {
        float _2156 = fma(_2110, _2104, _2146);
        _2142 = _2156;
    }
    float _2158 = _2142;
    if (_2048)
    {
        float _2160 = _2150 * _2150;
        _2064 = _2160;
    }
    float _2162 = _2064;
    if (_2048)
    {
        float _2164 = _2154 * _2154;
        _2066 = _2164;
    }
    float _2166 = _2066;
    float _2168 = fma(_2158, _2158, _2162);
    float _2170 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _2172 = fma(_2032, (*spvDescriptorSet0.vp_c15)._m0[23].w, _2170);
    float _2174 = precise::clamp(_2172, 0.0, 1.0);
    float _2176 = _2168 + _2166;
    float _2178 = _1872 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _2180 = _1872 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _2182 = -_2174;
    float _2184 = _2182 + 1.0;
    float _2186 = rsqrt(_2176);
    float _2188 = fma(_1874, (*spvDescriptorSet0.vp_c8)._m0[2].x, _2178);
    float _2190 = _1872 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _2192 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _2194 = fma(_1876, (*spvDescriptorSet0.vp_c8)._m0[2].z, _2188);
    float _2196 = fma(_1874, (*spvDescriptorSet0.vp_c8)._m0[1].x, _2180);
    float _2198 = _1872 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _2200 = abs(_2184);
    float _2202 = log2(_2200);
    float _2204 = fma(_1874, (*spvDescriptorSet0.vp_c8)._m0[0].x, _2190);
    float _2206 = fma(_1876, (*spvDescriptorSet0.vp_c8)._m0[1].z, _2196);
    float _2208 = fma(_1874, (*spvDescriptorSet0.vp_c8)._m0[3].x, _2198);
    float _2210 = _2194 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _2212 = fma(_1876, (*spvDescriptorSet0.vp_c8)._m0[0].z, _2204);
    float _2214 = _2206 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _2216 = fma(_1876, (*spvDescriptorSet0.vp_c8)._m0[3].z, _2208);
    float _2218 = _2186 * _2150;
    float _2220 = _2186 * _2158;
    float _2222 = _2212 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _2224 = _2214 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _2226 = _2218 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _2228 = _2210 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _2230 = _2186 * _2154;
    float _2232 = fma(_2222, (*spvDescriptorSet0.vp_c8)._m0[7].x, _2224);
    float _2234 = -_2226;
    float _2236 = fma(_2220, (*spvDescriptorSet0.vp_c15)._m0[21].y, _2234);
    float _2238 = _2202 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _2240 = -_2228;
    float _2242 = fma(_2240, _2192, 1.0);
    float _2244 = _2216 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _2246 = -_2230;
    float _2248 = fma(_2246, (*spvDescriptorSet0.vp_c15)._m0[21].z, _2236);
    float _2250 = fma(_2210, (*spvDescriptorSet0.vp_c8)._m0[7].z, _2232);
    float _2252 = log2(_2242);
    float _2254 = _2214 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _2256 = _2214 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _2258 = fma(_2244, (*spvDescriptorSet0.vp_c8)._m0[7].w, _2250);
    float _2260 = fma(_2222, (*spvDescriptorSet0.vp_c8)._m0[4].x, _2254);
    float _2262 = fma(_2222, (*spvDescriptorSet0.vp_c8)._m0[5].x, _2256);
    float _2264 = _2220 + 1.0;
    float _2266 = exp2(_2238);
    float _2268 = fma(_2248, -0.5, 0.5);
    float _2270 = fma(_2248, 0.5, 0.5);
    float _2272 = fma(_2210, (*spvDescriptorSet0.vp_c8)._m0[4].z, _2260);
    float _2274 = fma(_2210, (*spvDescriptorSet0.vp_c8)._m0[5].z, _2262);
    float _2276 = fma(_2270, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _2278 = 1.0 / _2258;
    float _2280 = fma(_2270, _2276, -0.212114393711090087890625);
    float _2282 = fma(_2270, _2280, 1.570728778839111328125);
    float _2284 = sqrt(_2268);
    float _2286 = -_2220;
    float _2288 = fma(_2266, _2264, _2286);
    float _2290 = fma(_2244, (*spvDescriptorSet0.vp_c8)._m0[4].w, _2272);
    float _2292 = fma(_2244, (*spvDescriptorSet0.vp_c8)._m0[5].w, _2274);
    float _2294 = _2252 * 0.693147182464599609375;
    float _2296 = _2290 * _2278;
    float _2298 = _2292 * _2278;
    float _2300 = _2294 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _2302 = fma(_2296, 0.5, 0.5);
    float _2304 = fma(_2298, -0.5, 0.5);
    float _2306 = fma(_2288, 0.5, 0.5);
    float _2308 = _2284 * 0.636619746685028076171875;
    float _2310 = -_2282;
    float _2312 = fma(_2308, _2310, 1.0);
    float3 _6695 = float3(_2302, _2304, _2300);
    float _2314 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_6695, float3(0.0), isnan(_6695)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_6695, float3(0.0), isnan(_6695)), level(0.0)).x;
    float3 _6706 = float3(_2302, _2304, _2300);
    float4 _2317 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_6706, float3(0.0), isnan(_6706)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_6706, float3(0.0), isnan(_6706)), level(0.0)).xyzw;
    float _2319 = _2317.x;
    float _2321 = _2317.y;
    float _2323 = _2317.z;
    float _2325 = _2317.w;
    float2 _6723 = float2(_2312, _2306);
    float3 _2329 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_6723, float2(0.0), isnan(_6723)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_6723, float2(0.0), isnan(_6723)), level(0.0)).xyz;
    float _2331 = _2329.x;
    float _2333 = _2329.y;
    float _2335 = _2329.z;
    float _2337 = float(uint(_962));
    float _2339 = trunc(_1304);
    int _2341 = int(_2339);
    int _2343 = ~_962;
    int _2345 = _2343 + 1;
    out.m_61.x = _708;
    out.m_61.y = _710;
    out.m_61.z = _712;
    out.m_61.w = _716;
    int _2347 = ~_962;
    int _2349 = _2347 + 1;
    float _2351 = _2202 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    int _2353 = abs(_1230);
    float _2355 = 1.0 / _2337;
    float _2357 = float(uint(_2341));
    float _2359 = exp2(_2351);
    int _2361 = as_type<int>(_2355) + (-2);
    float _2363 = as_type<float>(_2361) * _2357;
    float _2365 = trunc(_2363);
    float _2367 = precise::max(_2365, 0.0);
    uint _2370 = uint(_2367);
    float _2372 = float(_2341);
    float _2374 = -_2359;
    float _2376 = _2374 + 1.0;
    int _2378 = _2345 * int(_2370);
    int _2380 = _2378 + _2341;
    float _2382 = float(uint(_2380));
    float _2384 = as_type<float>(_2361) * _2382;
    bool _2386 = !_968;
    float _2388 = _2386 ? 7.345489978790283203125 : 1.0;
    float _2390 = trunc(_2384);
    float _2392 = precise::max(_2390, 0.0);
    uint _2394 = uint(_2392);
    float _2396 = _2388 * _958;
    bool _2398 = _2372 >= _1312;
    bool _2400 = isnan(_2372);
    bool _2402 = _2398 || _2400;
    bool _2404 = isnan(_1312);
    bool _2406 = _2402 || _2404;
    float _2408 = float(_2406);
    float _2410 = floor(_2396);
    int _2412 = int(_2370) + int(_2394);
    float _2414 = trunc(_2408);
    int _2416 = int(_2414);
    int _2418 = _2349 * _2412;
    int _2420 = _2418 + _2341;
    float _2422 = -_2410;
    float _2424 = _2396 + _2422;
    bool _2426 = uint(_2420) >= uint(_962);
    bool _2428 = !_2426;
    int _2430 = _2428 ? 0 : (-1);
    bool _2432 = _962 == 0;
    int _2434 = ~_2412;
    int _2436 = _2434 + _2430;
    int _2438 = _2436 + 1;
    float _2440 = _2424 * _1312;
    float _2442 = _1320 * _152;
    int _2444 = ~_2416;
    int _2446 = _2444 + 1;
    int _2448 = _2446 + 1;
    int _2450 = _962 * _2438;
    int _2452 = _2450 + _2341;
    int _2454 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4096;
    bool _2456 = _2454 != 0;
    float _2458 = trunc(_2440);
    int _2460 = int(_2458);
    int _2462 = _962 + (-1);
    bool _2464 = !_2432;
    int _2466 = _2464 ? _2452 : (-1);
    bool _2468 = !_2456;
    int _2470 = _2468 ? 0 : 1;
    int _2472 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 128;
    bool _2474 = _2472 != 0;
    float _2476 = trunc(_2442);
    int _2478 = int(_2476);
    int _2480 = _2466 * _2448;
    int _2482 = abs(_2470);
    int _2484 = abs(_1244);
    int _2486 = _2416 * _2462;
    int _2488 = _2486 + _2480;
    int _2490 = abs(_1236);
    int _2492 = _2488 * _2353;
    bool _2494 = !_2474;
    int _2496 = _2494 ? 0 : 1;
    int _2498 = _2460 * _2482;
    int _2500 = _2498 + _2341;
    int _2502 = abs(_2496);
    float _2504 = in.m_53.w;
    int _2506 = _2478 * _2490;
    int _2508 = _2506 + _2492;
    int _2510 = ~_962;
    int _2512 = _2510 + 1;
    int _2514 = _2500 * _2484;
    int _2516 = _2514 + _2508;
    float _2518 = float(uint(_2500));
    int _2520 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _2522 = _2520 != 0;
    int _2524 = _2460 * _2502;
    int _2526 = _2524 + _2516;
    int _2528 = ~_962;
    int _2530 = _2528 + 1;
    int _2532 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _2534 = _2532 != 0;
    float _2536 = float(uint(_2526));
    int _2538 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _2540 = _2538 != 0;
    float _2542 = as_type<float>(_2361) * _2536;
    int _2544 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2097152;
    bool _2546 = _2544 != 0;
    float _2548 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _2550 = _2548 + (*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _2552 = trunc(_2542);
    float _2554 = precise::max(_2552, 0.0);
    uint _2556 = uint(_2554);
    bool _2558 = _2504 > 0.5;
    float _2560 = 1.0 / _2550;
    int _2562 = _2530 * int(_2556);
    int _2564 = _2562 + _2526;
    float _2566 = float(uint(_2564));
    float _2568 = as_type<float>(_2361) * _2566;
    float _2570 = in.m_63.y;
    float _2572 = trunc(_2568);
    float _2574 = precise::max(_2572, 0.0);
    uint _2576 = uint(_2574);
    out.m_65.x = 1.0;
    out.m_65.y = 1.0;
    out.m_65.z = 1.0;
    float _2578 = as_type<float>(_2361) * _2518;
    int _2580 = int(_2556) + int(_2576);
    float _2582 = trunc(_2578);
    float _2584 = precise::max(_2582, 0.0);
    uint _2586 = uint(_2584);
    float _2588 = -_2570;
    float _2590 = _2588 + 1.0;
    int _2592 = _2512 * _2580;
    int _2594 = _2592 + _2526;
    int _2596 = _2558 ? as_type<int>(_2590) : as_type<int>(_2570);
    bool _2598 = uint(_2594) >= uint(_962);
    float _2600 = -(*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _2602 = _2600 + (*spvDescriptorSet0.vp_c9)._m0[133].w;
    bool _2604 = _970 > 0.5;
    float _2606 = -(*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _2608 = _956 + _2606;
    bool _2610 = !_2598;
    int _2612 = _2610 ? 0 : (-1);
    float _2614 = 1.0 / _2602;
    int _2616 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _2618 = _2616 != 0;
    int _2620 = ~_2580;
    int _2622 = _2620 + _2612;
    int _2624 = _2622 + 1;
    float _2626 = -(*spvDescriptorSet0.vp_c9)._m0[131].x;
    float _2628 = (*spvDescriptorSet0.vp_c9)._m0[132].x + _2626;
    float _2630 = _2618 ? as_type<float>(_2596) : _2570;
    float _2632 = -(*spvDescriptorSet0.vp_c9)._m0[132].x;
    float _2634 = _2632 + (*spvDescriptorSet0.vp_c9)._m0[133].x;
    float _2636 = _2570;
    bool _2638 = _2604;
    bool _2640 = _2618;
    int _2642 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[132].w);
    if (_2522)
    {
        float _2644 = _2604 ? _2590 : _2570;
        _2636 = _2644;
    }
    float _2646 = _2636;
    int _2648 = _962 * _2624;
    int _2650 = _2648 + _2526;
    float _2652 = in.m_63.x;
    if (_2534)
    {
        bool _2654 = _964 > 0.5;
        _2638 = _2654;
    }
    bool _2656 = _2638;
    float _2658 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    int _2660 = ~_962;
    int _2662 = _2660 + 1;
    float _2664 = _2628 * _2560;
    bool _2666 = !_2432;
    int _2668 = _2666 ? _2650 : (-1);
    if (_2540)
    {
        bool _2670 = _958 > 0.5;
        _2640 = _2670;
    }
    bool _2672 = _2640;
    int _2674 = _2662 * int(_2586);
    int _2676 = _2674 + _2500;
    int _2678 = _2668 >> 31;
    float _2680 = _2634 * _2614;
    bool _2682 = _956 >= (*spvDescriptorSet0.vp_c9)._m0[133].w;
    bool _2684 = isnan(_956);
    bool _2686 = _2682 || _2684;
    bool _2688 = isnan((*spvDescriptorSet0.vp_c9)._m0[133].w);
    bool _2690 = _2686 || _2688;
    float _2692 = float(_2690);
    float _2694 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _2696 = _956 + _2694;
    float _2698 = float(uint(_2676));
    float _2700 = fma(_2680, _2608, (*spvDescriptorSet0.vp_c9)._m0[132].x);
    int _2702 = _2678 & 3;
    float _2704 = -_2692;
    float _2706 = _2704 + 1.0;
    bool _2708 = _956 >= (*spvDescriptorSet0.vp_c9)._m0[132].w;
    bool _2710 = isnan(_956);
    bool _2712 = _2708 || _2710;
    bool _2714 = isnan((*spvDescriptorSet0.vp_c9)._m0[132].w);
    bool _2716 = _2712 || _2714;
    float _2718 = float(_2716);
    float _2720 = as_type<float>(_2361) * _2698;
    int _2722 = _2668 + _2702;
    float _2724 = fma(_2664, _2696, (*spvDescriptorSet0.vp_c9)._m0[131].x);
    bool _2726 = _956 >= (*spvDescriptorSet0.vp_c9)._m0[131].w;
    bool _2728 = isnan(_956);
    bool _2730 = _2726 || _2728;
    bool _2732 = isnan((*spvDescriptorSet0.vp_c9)._m0[131].w);
    bool _2734 = _2730 || _2732;
    float _2736 = float(_2734);
    float _2738 = _2718 * _2706;
    float _2740 = -_2718;
    float _2742 = _2740 + 1.0;
    int _2744 = _2722 >> 2;
    float _2746 = _2658 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    float _2748 = _2658;
    float _2750 = _2742;
    int _2752 = _2744;
    if (!_2540)
    {
        _2748 = _2652;
    }
    float _2754 = _2748;
    float _2756 = _2736 * _2742;
    int _2758 = _2744 << 4;
    int _2760 = _2758 + 368;
    float _2762 = fma(_2630, _2746, -0.5);
    float _2764 = _2754;
    if (!_2540)
    {
        _2750 = _2754;
    }
    float _2766 = _2750;
    float _2768 = _2724 * _2756;
    float _2770 = _2766;
    if (_2540)
    {
        _2764 = _2652;
    }
    float _2772 = _2764;
    float _2774 = -_2736;
    float _2776 = _2774 + 1.0;
    uint _2778 = uint(int(uint(_2760) >> uint(2)));
    uint _2780 = uint(int(uint(int(_2778)) >> uint(2)));
    int _2782 = int(_2778) & 3;
    float _2784 = (*spvDescriptorSet0.vp_c9)._m0[int(_2780)][_2782];
    int _2786 = int(_2778) + 1;
    uint _2788 = uint(int(uint(_2786) >> uint(2)));
    int _2790 = _2786 & 3;
    float _2792 = (*spvDescriptorSet0.vp_c9)._m0[int(_2788)][_2790];
    float _2794 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    float _2796 = _2772;
    if (_2540)
    {
        float _2798 = -_2772;
        float _2800 = _2798 + 1.0;
        _2752 = as_type<int>(_2800);
    }
    int _2802 = _2752;
    if (_2534)
    {
        float _2804 = -_2772;
        float _2806 = _2804 + 1.0;
        _2642 = as_type<int>(_2806);
    }
    int _2808 = _2642;
    float _2810 = -_1316;
    float _2812 = fma(_1306, _2762, _2810);
    float _2814 = fma((*spvDescriptorSet0.vp_c9)._m0[80].y, _2646, -0.5);
    float _2816 = fma(_2776, (*spvDescriptorSet0.vp_c9)._m0[131].x, _2768);
    if (_2540)
    {
        float _2818 = _2672 ? as_type<float>(_2802) : _2772;
        _2770 = _2818;
    }
    float _2820 = _2770;
    int _2822 = _2760 + 8;
    uint _2824 = uint(int(uint(_2822) >> uint(2)));
    uint _2826 = uint(int(uint(int(_2824)) >> uint(2)));
    int _2828 = int(_2824) & 3;
    float _2830 = (*spvDescriptorSet0.vp_c9)._m0[int(_2826)][_2828];
    int _2832 = int(_2824) + 1;
    uint _2834 = uint(int(uint(_2832) >> uint(2)));
    int _2836 = _2832 & 3;
    float _2838 = (*spvDescriptorSet0.vp_c9)._m0[int(_2834)][_2836];
    if (_2534)
    {
        float _2840 = _2656 ? as_type<float>(_2808) : _2772;
        _2796 = _2840;
    }
    float _2842 = _2796;
    float _2844 = fma(_2700, _2738, _2816);
    int _2846 = _2668 & 3;
    bool _2848 = _2846 != 0;
    float _2850 = trunc(_2720);
    float _2852 = precise::max(_2850, 0.0);
    uint _2854 = uint(_2852);
    float _2856 = -_1110;
    float _2858 = fma(_1310, _2814, _2856);
    bool _2860 = uint(_2846) > 1u;
    float _2862 = _2794 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    int _2864 = _2668 & 3;
    bool _2866 = _2864 != 0;
    float _2868 = fma(_2820, (*spvDescriptorSet0.vp_c9)._m0[80].x, -0.5);
    bool _2870 = uint(_2846) >= 2u;
    float _2872 = fma(_2862, _2842, -0.5);
    int _2874 = _2866 ? 0 : 1;
    float _2876 = fma(_1308, _2868, _1064);
    bool _2878 = _2846 != 3;
    float _2880 = fma(_1324, _2872, _1302);
    int _2882 = ~_2874;
    int _2884 = _2882 + 1;
    int _2886 = _2884 + 1;
    int _2888 = int(_2586) + int(_2854);
    float _2890 = _2880 + 0.5;
    int _2892 = _2886;
    if (!_2860)
    {
        int _2894 = ~_2874;
        int _2896 = _2894 + 1;
        _2892 = _2896;
    }
    int _2898 = _2892;
    int _2900 = ~_962;
    int _2902 = _2900 + 1;
    int _2904 = abs(_2898);
    bool _2906 = !_2848;
    int _2908 = _2906 ? 0 : 1;
    int _2910 = _2902 * _2888;
    int _2912 = _2910 + _2500;
    int _2914 = _2870 ? 0 : 1;
    bool _2916 = _2846 != 3;
    int _2918 = ~_2914;
    int _2920 = _2918 + 1;
    int _2922 = _2920 + 1;
    bool _2924 = !_2916;
    int _2926 = _2924 ? 0 : (-1);
    int _2928 = abs(_2908);
    int _2930 = _2922;
    if (_2878)
    {
        int _2932 = ~_2914;
        int _2934 = _2932 + 1;
        _2930 = _2934;
    }
    int _2936 = _2930;
    int _2938 = ~_2904;
    int _2940 = _2938 + 1;
    int _2942 = _2940 + 1;
    bool _2944 = uint(_2912) >= uint(_962);
    int _2946 = abs(_2926);
    int _2948 = _2942 * as_type<int>(_2792);
    int _2950 = abs(_2936);
    int _2952 = ~_2928;
    int _2954 = _2952 + 1;
    int _2956 = _2954 + 1;
    bool _2958 = !_2546;
    int _2960 = _2958 ? 0 : 1;
    int _2962 = _2956 * as_type<int>(_2784);
    int _2964 = _2962 + _2948;
    int _2966 = ~_2950;
    int _2968 = _2966 + 1;
    int _2970 = _2968 + 1;
    bool _2972 = !_2944;
    int _2974 = _2972 ? 0 : (-1);
    int _2976 = abs(_2960);
    int _2978 = _2970 * as_type<int>(_2830);
    int _2980 = _2978 + _2964;
    int _2982 = ~_2946;
    int _2984 = _2982 + 1;
    int _2986 = _2984 + 1;
    float _2988 = _2214 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    int _2990 = ~_2888;
    int _2992 = _2990 + _2974;
    int _2994 = _2992 + 1;
    int _2996 = ~_2976;
    int _2998 = _2996 + 1;
    int _3000 = _2998 + 1;
    int _3002 = _2986 * as_type<int>(_2838);
    int _3004 = _3002 + _2980;
    float _3006 = fma(_2692, (*spvDescriptorSet0.vp_c9)._m0[133].x, _2844);
    float _3008 = fma(_2222, (*spvDescriptorSet0.vp_c8)._m0[6].x, _2988);
    float _3010 = _930 * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    int _3012 = _3004 * _3000;
    float _3014 = _928 * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _3016 = _932 * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    int _3018 = _962 * _2994;
    int _3020 = _3018 + _2500;
    float _3022 = _3010 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _3024 = _3014 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _3026 = _3016 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _3028 = _3006 * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    bool _3030 = !_2432;
    int _3032 = _3030 ? _3020 : (-1);
    float _3034 = _1952 * _2010;
    float _3036 = fma(_2210, (*spvDescriptorSet0.vp_c8)._m0[6].z, _3008);
    bool _3038 = _1952 > 0.0;
    bool _3040 = isnan(_1952);
    bool _3042 = _3038 || _3040;
    bool _3044 = isnan(0.0);
    bool _3046 = _3042 || _3044;
    out.m_67.x = _3024;
    out.m_67.y = _3022;
    out.m_67.z = _3026;
    out.m_67.w = _3028;
    int _3048 = _3032 * _2976;
    int _3050 = _3048 + _3012;
    float _3052 = _3034 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _3054 = fma(_2244, (*spvDescriptorSet0.vp_c8)._m0[6].w, _3036);
    bool _3056 = _2010 <= 0.0;
    bool _3058 = !_3046;
    bool _3060 = _3056 || _3058;
    float _3062 = _2290 + _2258;
    float _3064 = _3052 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _3066 = float(_3050);
    float _3068 = _3054 + _2258;
    float _3070 = _2258 * 0.5;
    float _3072 = _2858 + 0.5;
    out.m_49.x = _3064;
    float _3074 = _2812 + 0.5;
    float _3076 = _2876 + 0.5;
    float _3078 = _2376 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    out.m_69.x = _3066;
    float _3080 = _3068 * 0.5;
    float _3082 = _3078 * _2314;
    float _3084 = -_3078;
    float _3086 = _3084 + 1.0;
    float _3088 = _3062 * 0.5;
    float _3090 = fma(_2292, -0.5, _3070);
    float _3092 = _2325 * _3082;
    float _3094 = _2335 * _3082;
    float _3096 = _2325 * _3086;
    float _3098 = fma(_2331, _3092, _2319);
    float _3100 = fma(_2333, _3092, _2321);
    float _3102 = fma(_2325, _3094, _2323);
    out.m_71.x = _3076;
    out.m_71.y = _3072;
    out.m_71.z = _2890;
    out.m_71.w = _3074;
    out.gl_Position.x = _2290;
    out.gl_Position.y = _2292;
    out.gl_Position.z = _3054;
    out.gl_Position.w = _2258;
    out.m_73.x = _3088;
    out.m_73.y = _3090;
    out.m_73.z = _3080;
    out.m_73.w = _2258;
    out.m_75.x = _3098;
    out.m_75.y = _3100;
    out.m_75.z = _3102;
    out.m_75.w = _3096;
    if (!_3060)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_61.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_61.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_61.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_61.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_67.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_67.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_67.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_67.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_49.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_49.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_49.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_49.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_71.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_71.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_71.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_71.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_65.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_65.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_65.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_65.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_47.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_47.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_47.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_47.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_73.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_73.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_73.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_73.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_69.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_69.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_69.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_69.w)); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_75.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_75.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_75.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_75.w)); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    out.m_49.x = 0.0;
    float _3104 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _3104;
    { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_61.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_61.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_61.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_61.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_67.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_67.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_67.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_67.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_49.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_49.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_49.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_49.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_71.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_71.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_71.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_71.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_65.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_65.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_65.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_65.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_47.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_47.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_47.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_47.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_73.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_73.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_73.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_73.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_69.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_69.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_69.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_69.w)); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_75.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_75.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_75.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_75.w)); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
}

