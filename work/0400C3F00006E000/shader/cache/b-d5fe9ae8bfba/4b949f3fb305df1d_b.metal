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
    constant _16* vp_c13 [[id(4)]];
    constant _16* vp_c7 [[id(5)]];
    texture2d<float> vp_t_tcb_A [[id(6)]];
    sampler vp_t_tcb_ASmplr [[id(7)]];
    texture2d<float> vp_t_tcb_24 [[id(8)]];
    sampler vp_t_tcb_24Smplr [[id(9)]];
    texture3d<float> vp_t_tcb_32 [[id(10)]];
    sampler vp_t_tcb_32Smplr [[id(11)]];
    texture3d<float> vp_t_tcb_30 [[id(12)]];
    sampler vp_t_tcb_30Smplr [[id(13)]];
    texture2d<float> vp_t_tcb_1C [[id(14)]];
    sampler vp_t_tcb_1CSmplr [[id(15)]];
    sampler vp_t_tcb_ASmplr_w [[id(16)]];
    sampler vp_t_tcb_24Smplr_w [[id(17)]];
    sampler vp_t_tcb_32Smplr_w [[id(18)]];
    sampler vp_t_tcb_30Smplr_w [[id(19)]];
    sampler vp_t_tcb_1CSmplr_w [[id(20)]];
    constant dm_border_t* dm_border [[id(21)]];
};

struct main0_out
{
    float4 m_63 [[user(locn0)]];
    float4 m_65 [[user(locn1)]];
    float4 m_91 [[user(locn2)]];
    float4 m_53 [[user(locn3)]];
    float4 m_97 [[user(locn4)]];
    float4 m_103 [[user(locn5)]];
    float4 m_85 [[user(locn6)]];
    float4 m_105 [[user(locn7)]];
    float4 m_95 [[user(locn8)]];
    float4 m_93 [[user(locn9)]];
    float4 m_83 [[user(locn10)]];
    float4 m_109 [[user(locn11)]];
    float4 m_55 [[user(locn12)]];
    float4 m_59 [[user(locn13)]];
    float4 m_101 [[user(locn14)]];
    float4 m_113 [[user(locn15)]];
    float4 m_107 [[user(locn16)]];
    float4 m_111 [[user(locn17)]];
    float4 m_115 [[user(locn18)]];
    float4 m_67 [[user(locn19)]];
    float4 gl_Position [[position, invariant]];
    float gl_PointSize [[point_size]];
};

struct main0_in
{
    float4 m_99 [[attribute(0)]];
    float4 m_73 [[attribute(1)]];
    float4 m_71 [[attribute(2)]];
    float4 m_75 [[attribute(3)]];
    float4 m_77 [[attribute(4)]];
    float4 m_48 [[attribute(5)]];
    float4 m_50 [[attribute(6)]];
    float4 m_87 [[attribute(7)]];
    float4 m_79 [[attribute(8)]];
    float4 m_57 [[attribute(9)]];
    float4 m_61 [[attribute(10)]];
    float4 m_89 [[attribute(11)]];
    float4 m_69 [[attribute(12)]];
    float4 m_81 [[attribute(13)]];
};

vertex main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]])
{
    main0_out out = {};
    out.m_63 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_65 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_91 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_53 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_97 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_103 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_85 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_105 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_95 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_93 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_83 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_109 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_55 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_59 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_101 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_113 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_107 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_111 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_115 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_67 = float4(0.0, 0.0, 0.0, 1.0);
    bool _4152 = false;
    bool _1260 = false;
    bool _1164 = false;
    bool _1004 = false;
    bool _794 = false;
    bool _622 = false;
    bool _300 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _129 = in.m_48.w;
    float _131 = in.m_50.w;
    float _133 = trunc(_129);
    int _136 = int(_133);
    float _138 = -_131;
    float _140 = _138 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    out.m_53.y = _140;
    bool _144 = _136 >= 1;
    float _146 = 0.0;
    float _148 = _131;
    float _150 = _140;
    if (!_144)
    {
        _146 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _152 = _146;
    if (!_144)
    {
        out.m_55.x = 0.0;
    }
    int _154 = 0;
    if (!_144)
    {
        float _156 = _152 * 5.0;
        _154 = as_type<int>(_156);
    }
    int _158 = _154;
    int _160 = _158;
    if (!_144)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _4410 = as_type<float>(_158);
        out.gl_Position.z = _4410;
    }
    if (!_144)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    bool _162 = _131 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _164 = isnan(_131);
    bool _166 = _162 || _164;
    bool _168 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _170 = _166 || _168;
    float _172 = in.m_57.x;
    float _174 = float(_136);
    bool _176 = _140 >= _174;
    bool _178 = !_170;
    bool _180 = _176 || _178;
    float _182 = 1.0 / _174;
    if (_180)
    {
        _148 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _184 = _148;
    if (_180)
    {
        out.m_55.x = 0.0;
    }
    float _186 = _140 * _182;
    float _188 = _186;
    if (_180)
    {
        float _190 = _184 * 5.0;
        _160 = as_type<int>(_190);
    }
    int _192 = _160;
    out.m_59.x = _172;
    if (_180)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _4475 = as_type<float>(_192);
        out.gl_Position.z = _4475;
    }
    out.m_53.x = _186;
    if (_180)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _194 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[19].z;
    float _196 = _140 + (*spvDescriptorSet0.vp_c9)._m0[20].z;
    int _198 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 2;
    bool _200 = _198 != 0;
    int _202 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 4;
    bool _204 = _202 != 0;
    int _206 = 1 & as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x);
    bool _208 = _206 != 0;
    float _210 = _196 * _194;
    float _212 = fma(_172, (*spvDescriptorSet0.vp_c9)._m0[20].x, _210);
    float _214 = _212 * 6.283185482025146484375;
    float _216 = floor(_212);
    float _218 = _214 * 0.15915493667125701904296875;
    bool _220 = !_200;
    int _222 = _220 ? 0 : 1;
    int _224 = abs(_222);
    float _226 = _218 * 6.283185482025146484375;
    float _228 = cos(_226);
    bool _230 = !_208;
    int _232 = _230 ? 0 : 1;
    bool _234 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    int _236 = abs(_232);
    float _238 = -_216;
    float _240 = _212 + _238;
    float _242 = float(_224);
    float _244 = -_240;
    float _246 = fma(_244, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    bool _248 = !_204;
    int _250 = _248 ? 0 : 1;
    float _252 = abs(_246);
    float _254 = _242 * _252;
    float _256 = fma(_228, 0.5, 0.5);
    int _258 = abs(_250);
    bool _260 = _240 < 0.5;
    float _262 = float(_260);
    float _264 = -_256;
    float _266 = fma(_264, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    float _268 = float(_236);
    float _270 = float(_258);
    float _272 = -_262;
    float _274 = fma(_272, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    float _276 = fma(_268, _266, _254);
    float _278 = abs(_274);
    float _280 = fma(_270, _278, _276);
    bool _282 = !_234;
    float _298;
    if (!_282)
    {
        float _284 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _286 = _172 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _288 = fma(_286, (*spvDescriptorSet0.vp_c9)._m0[12].x, _140);
        float _290 = _288 * _284;
        float _292 = floor(_290);
        float _294 = -_292;
        float _296 = _290 + _294;
        _298 = _296;
        _300 = true;
    }
    else
    {
        _298 = _186;
    }
    _300 = false;
    float _302 = _298;
    float _304 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _306 = _302 + _304;
    float _308 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _310 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _308;
    float _312 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _314 = _312 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _316 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _318 = (*spvDescriptorSet0.vp_c9)._m0[146].w + _316;
    float _320 = -(*spvDescriptorSet0.vp_c9)._m0[146].w;
    float _322 = _320 + (*spvDescriptorSet0.vp_c9)._m0[147].w;
    float _324 = 1.0 / _310;
    float _326 = -(*spvDescriptorSet0.vp_c9)._m0[147].w;
    float _328 = (*spvDescriptorSet0.vp_c9)._m0[148].w + _326;
    float _330 = 1.0 / _318;
    float _332 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _334 = _302 + _332;
    bool _336 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].x;
    float _338 = 1.0 / _314;
    float _340 = _334 * _324;
    float _342 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _344 = _302 + _342;
    bool _346 = _302 >= (*spvDescriptorSet0.vp_c9)._m0[147].w;
    bool _348 = isnan(_302);
    bool _350 = _346 || _348;
    bool _352 = isnan((*spvDescriptorSet0.vp_c9)._m0[147].w);
    bool _354 = _350 || _352;
    float _356 = float(_354);
    float _358 = -(*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _360 = (*spvDescriptorSet0.vp_c9)._m0[144].z + _358;
    float _362 = 1.0 / _322;
    float _364 = _344 * _330;
    bool _366 = _302 >= (*spvDescriptorSet0.vp_c9)._m0[148].w;
    bool _368 = isnan(_302);
    bool _370 = _366 || _368;
    bool _372 = isnan((*spvDescriptorSet0.vp_c9)._m0[148].w);
    bool _374 = _370 || _372;
    float _376 = float(_374);
    float _378 = -(*spvDescriptorSet0.vp_c9)._m0[146].w;
    float _380 = _302 + _378;
    bool _382 = _302 >= (*spvDescriptorSet0.vp_c9)._m0[146].w;
    bool _384 = isnan(_302);
    bool _386 = _382 || _384;
    bool _388 = isnan((*spvDescriptorSet0.vp_c9)._m0[146].w);
    bool _390 = _386 || _388;
    float _392 = float(_390);
    float _394 = fma(_360, _340, (*spvDescriptorSet0.vp_c9)._m0[143].z);
    float _396 = 1.0 / _328;
    float _398 = _306 * _338;
    float _400 = -(*spvDescriptorSet0.vp_c9)._m0[147].w;
    float _402 = _302 + _400;
    bool _404 = _302 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _406 = isnan(_302);
    bool _408 = _404 || _406;
    bool _410 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _412 = _408 || _410;
    float _414 = float(_412);
    float _416 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _418 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _416;
    float _420 = _380 * _362;
    float _422 = -_376;
    float _424 = _422 + 1.0;
    float _426 = -_414;
    float _428 = _426 + 1.0;
    bool _430 = _302 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _432 = isnan(_302);
    bool _434 = _430 || _432;
    bool _436 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _438 = _434 || _436;
    float _440 = float(_438);
    float _442 = fma(_418, _340, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _444 = _356 * _424;
    float _446 = -_356;
    float _448 = _446 + 1.0;
    float _450 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _452 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _450;
    float _454 = _402 * _396;
    bool _456 = _302 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _458 = isnan(_302);
    bool _460 = _456 || _458;
    bool _462 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _464 = _460 || _462;
    float _466 = float(_464);
    float _468 = _392 * _448;
    float _470 = -_392;
    float _472 = _470 + 1.0;
    float _474 = fma(_452, _340, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _476 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _478 = _476 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _480 = _466 * _428;
    float _482 = -_466;
    float _484 = _482 + 1.0;
    float _486 = _414 * _472;
    float _488 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _490 = _488 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _492 = -(*spvDescriptorSet0.vp_c9)._m0[144].z;
    float _494 = _492 + (*spvDescriptorSet0.vp_c9)._m0[145].z;
    float _496 = _440 * _484;
    float _498 = -_440;
    float _500 = _498 + 1.0;
    float _502 = fma(_478, _398, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _504 = _442 * _496;
    float _506 = fma(_490, _398, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _508 = fma(_494, _398, (*spvDescriptorSet0.vp_c9)._m0[144].z);
    float _510 = _474 * _496;
    float _512 = _394 * _496;
    float _514 = -(*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _516 = (*spvDescriptorSet0.vp_c9)._m0[146].x + _514;
    float _518 = fma(_500, (*spvDescriptorSet0.vp_c9)._m0[143].x, _504);
    float _520 = fma(_500, (*spvDescriptorSet0.vp_c9)._m0[143].y, _510);
    float _522 = fma(_500, (*spvDescriptorSet0.vp_c9)._m0[143].z, _512);
    float _524 = -(*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _526 = (*spvDescriptorSet0.vp_c9)._m0[146].y + _524;
    float _528 = -(*spvDescriptorSet0.vp_c9)._m0[146].y;
    float _530 = _528 + (*spvDescriptorSet0.vp_c9)._m0[147].y;
    float _532 = -(*spvDescriptorSet0.vp_c9)._m0[146].z;
    float _534 = _532 + (*spvDescriptorSet0.vp_c9)._m0[147].z;
    float _536 = fma(_516, _364, (*spvDescriptorSet0.vp_c9)._m0[145].x);
    float _538 = fma(_502, _480, _518);
    float _540 = -(*spvDescriptorSet0.vp_c9)._m0[146].x;
    float _542 = _540 + (*spvDescriptorSet0.vp_c9)._m0[147].x;
    float _544 = -(*spvDescriptorSet0.vp_c9)._m0[145].z;
    float _546 = (*spvDescriptorSet0.vp_c9)._m0[146].z + _544;
    float _548 = fma(_534, _420, (*spvDescriptorSet0.vp_c9)._m0[146].z);
    float _550 = fma(_508, _480, _522);
    float _552 = fma(_536, _486, _538);
    float _554 = fma(_526, _364, (*spvDescriptorSet0.vp_c9)._m0[145].y);
    float _556 = fma(_530, _420, (*spvDescriptorSet0.vp_c9)._m0[146].y);
    float _558 = fma(_506, _480, _520);
    float _560 = fma(_546, _364, (*spvDescriptorSet0.vp_c9)._m0[145].z);
    float _562 = fma(_554, _486, _558);
    float _564 = -(*spvDescriptorSet0.vp_c9)._m0[147].x;
    float _566 = (*spvDescriptorSet0.vp_c9)._m0[148].x + _564;
    float _568 = fma(_542, _420, (*spvDescriptorSet0.vp_c9)._m0[146].x);
    float _570 = -(*spvDescriptorSet0.vp_c9)._m0[147].y;
    float _572 = (*spvDescriptorSet0.vp_c9)._m0[148].y + _570;
    float _574 = fma(_560, _486, _550);
    float _576 = -(*spvDescriptorSet0.vp_c9)._m0[147].z;
    float _578 = (*spvDescriptorSet0.vp_c9)._m0[148].z + _576;
    float _580 = fma(_566, _454, (*spvDescriptorSet0.vp_c9)._m0[147].x);
    float _582 = fma(_572, _454, (*spvDescriptorSet0.vp_c9)._m0[147].y);
    float _584 = fma(_556, _468, _562);
    float _586 = fma(_568, _468, _552);
    float _588 = fma(_578, _454, (*spvDescriptorSet0.vp_c9)._m0[147].z);
    float _590 = fma(_548, _468, _574);
    float _592 = fma(_582, _444, _584);
    float _594 = fma(_580, _444, _586);
    float _596 = fma(_588, _444, _590);
    float _598 = fma(_376, (*spvDescriptorSet0.vp_c9)._m0[148].y, _592);
    float _600 = fma(_376, (*spvDescriptorSet0.vp_c9)._m0[148].x, _594);
    float _602 = fma(_376, (*spvDescriptorSet0.vp_c9)._m0[148].z, _596);
    bool _604 = !_336;
    float _620;
    if (!_604)
    {
        float _606 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].x;
        float _608 = _172 * (*spvDescriptorSet0.vp_c9)._m0[12].y;
        float _610 = fma(_608, (*spvDescriptorSet0.vp_c9)._m0[11].x, _140);
        float _612 = _610 * _606;
        float _614 = floor(_612);
        float _616 = -_614;
        float _618 = _612 + _616;
        _620 = _618;
        _622 = true;
    }
    else
    {
        _620 = _186;
    }
    _622 = false;
    float _624 = _620;
    float _626 = in.m_61.x;
    float _628 = in.m_61.y;
    float _630 = in.m_61.z;
    float _632 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _634 = _624 + _632;
    float _636 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _638 = (*spvDescriptorSet0.vp_c9)._m0[108].w + _636;
    bool _640 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _642 = 1.0 / _638;
    float _644 = _598 * _628;
    float _646 = -(*spvDescriptorSet0.vp_c9)._m0[108].w;
    float _648 = _646 + (*spvDescriptorSet0.vp_c9)._m0[109].w;
    bool _650 = _624 >= (*spvDescriptorSet0.vp_c9)._m0[109].w;
    bool _652 = isnan(_624);
    bool _654 = _650 || _652;
    bool _656 = isnan((*spvDescriptorSet0.vp_c9)._m0[109].w);
    bool _658 = _654 || _656;
    float _660 = float(_658);
    float _662 = _602 * _630;
    float _664 = -(*spvDescriptorSet0.vp_c9)._m0[108].w;
    float _666 = _624 + _664;
    float _668 = 1.0 / _648;
    bool _670 = _624 >= (*spvDescriptorSet0.vp_c9)._m0[107].w;
    bool _672 = isnan(_624);
    bool _674 = _670 || _672;
    bool _676 = isnan((*spvDescriptorSet0.vp_c9)._m0[107].w);
    bool _678 = _674 || _676;
    float _680 = float(_678);
    float _682 = _634 * _642;
    bool _684 = _624 >= (*spvDescriptorSet0.vp_c9)._m0[108].w;
    bool _686 = isnan(_624);
    bool _688 = _684 || _686;
    bool _690 = isnan((*spvDescriptorSet0.vp_c9)._m0[108].w);
    bool _692 = _688 || _690;
    float _694 = float(_692);
    float _696 = -_660;
    float _698 = _696 + 1.0;
    float _700 = -(*spvDescriptorSet0.vp_c9)._m0[107].y;
    float _702 = (*spvDescriptorSet0.vp_c9)._m0[108].y + _700;
    float _704 = _694 * _698;
    float _706 = -_694;
    float _708 = _706 + 1.0;
    float _710 = -(*spvDescriptorSet0.vp_c9)._m0[107].x;
    float _712 = (*spvDescriptorSet0.vp_c9)._m0[108].x + _710;
    float _714 = -(*spvDescriptorSet0.vp_c9)._m0[107].z;
    float _716 = (*spvDescriptorSet0.vp_c9)._m0[108].z + _714;
    float _718 = fma(_702, _682, (*spvDescriptorSet0.vp_c9)._m0[107].y);
    float _720 = _680 * _708;
    float _722 = fma(_712, _682, (*spvDescriptorSet0.vp_c9)._m0[107].x);
    float _724 = fma(_716, _682, (*spvDescriptorSet0.vp_c9)._m0[107].z);
    float _726 = _666 * _668;
    float _728 = _718 * _720;
    float _730 = _722 * _720;
    float _732 = _724 * _720;
    float _734 = -(*spvDescriptorSet0.vp_c9)._m0[108].x;
    float _736 = _734 + (*spvDescriptorSet0.vp_c9)._m0[109].x;
    float _738 = -(*spvDescriptorSet0.vp_c9)._m0[108].y;
    float _740 = _738 + (*spvDescriptorSet0.vp_c9)._m0[109].y;
    float _742 = -(*spvDescriptorSet0.vp_c9)._m0[108].z;
    float _744 = _742 + (*spvDescriptorSet0.vp_c9)._m0[109].z;
    float _746 = -_680;
    float _748 = _746 + 1.0;
    float _750 = fma(_736, _726, (*spvDescriptorSet0.vp_c9)._m0[108].x);
    float _752 = fma(_740, _726, (*spvDescriptorSet0.vp_c9)._m0[108].y);
    float _754 = fma(_744, _726, (*spvDescriptorSet0.vp_c9)._m0[108].z);
    float _756 = fma(_748, (*spvDescriptorSet0.vp_c9)._m0[107].x, _730);
    float _758 = fma(_748, (*spvDescriptorSet0.vp_c9)._m0[107].y, _728);
    float _760 = fma(_748, (*spvDescriptorSet0.vp_c9)._m0[107].z, _732);
    float _762 = fma(_750, _704, _756);
    float _764 = fma(_752, _704, _758);
    float _766 = fma(_754, _704, _760);
    float _768 = _600 * _626;
    float _770 = fma(_660, (*spvDescriptorSet0.vp_c9)._m0[109].x, _762);
    float _772 = fma(_660, (*spvDescriptorSet0.vp_c9)._m0[109].y, _764);
    float _774 = fma(_660, (*spvDescriptorSet0.vp_c9)._m0[109].z, _766);
    bool _776 = !_640;
    float _792;
    if (!_776)
    {
        float _778 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _780 = _172 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _782 = fma(_780, (*spvDescriptorSet0.vp_c9)._m0[11].y, _140);
        float _784 = _782 * _778;
        float _786 = floor(_784);
        float _788 = -_786;
        float _790 = _784 + _788;
        _792 = _790;
        _794 = true;
    }
    else
    {
        _792 = _186;
    }
    _794 = false;
    float _796 = _792;
    float _798 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _800 = _796 + _798;
    float _802 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _804 = _802 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _806 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _808 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _806;
    float _810 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _812 = _810 + (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _814 = _796 >= (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _816 = isnan(_796);
    bool _818 = _814 || _816;
    bool _820 = isnan((*spvDescriptorSet0.vp_c9)._m0[117].w);
    bool _822 = _818 || _820;
    float _824 = float(_822);
    float _826 = 1.0 / _804;
    float _828 = -(*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _830 = _828 + (*spvDescriptorSet0.vp_c9)._m0[118].w;
    bool _832 = _796 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _834 = isnan(_796);
    bool _836 = _832 || _834;
    bool _838 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _840 = _836 || _838;
    float _842 = float(_840);
    bool _844 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].z;
    float _846 = 1.0 / _812;
    float _848 = _808 * _826;
    bool _850 = _796 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _852 = isnan(_796);
    bool _854 = _850 || _852;
    bool _856 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _858 = _854 || _856;
    float _860 = float(_858);
    float _862 = 1.0 / _830;
    float _864 = -_824;
    float _866 = _864 + 1.0;
    float _868 = fma(_848, _800, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _870 = -(*spvDescriptorSet0.vp_c9)._m0[118].w;
    float _872 = _870 + (*spvDescriptorSet0.vp_c9)._m0[119].w;
    bool _874 = _796 >= (*spvDescriptorSet0.vp_c9)._m0[118].w;
    bool _876 = isnan(_796);
    bool _878 = _874 || _876;
    bool _880 = isnan((*spvDescriptorSet0.vp_c9)._m0[118].w);
    bool _882 = _878 || _880;
    float _884 = float(_882);
    float _886 = -_860;
    float _888 = _886 + 1.0;
    float _890 = _860 * _866;
    float _892 = -(*spvDescriptorSet0.vp_c9)._m0[116].x;
    float _894 = _892 + (*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _896 = 1.0 / _872;
    float _898 = -_884;
    float _900 = _898 + 1.0;
    float _902 = _842 * _888;
    float _904 = -(*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _906 = (*spvDescriptorSet0.vp_c9)._m0[118].x + _904;
    float _908 = _894 * _846;
    float _910 = _824 * _900;
    float _912 = _868 * _902;
    float _914 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _916 = _796 + _914;
    float _918 = -_842;
    float _920 = _918 + 1.0;
    bool _922 = _796 >= (*spvDescriptorSet0.vp_c9)._m0[119].w;
    bool _924 = isnan(_796);
    bool _926 = _922 || _924;
    bool _928 = isnan((*spvDescriptorSet0.vp_c9)._m0[119].w);
    bool _930 = _926 || _928;
    float _932 = float(_930);
    float _934 = _906 * _862;
    float _936 = -(*spvDescriptorSet0.vp_c9)._m0[118].x;
    float _938 = _936 + (*spvDescriptorSet0.vp_c9)._m0[119].x;
    float _940 = -(*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _942 = _796 + _940;
    float _944 = fma(_908, _916, (*spvDescriptorSet0.vp_c9)._m0[116].x);
    float _946 = fma(_920, (*spvDescriptorSet0.vp_c9)._m0[115].x, _912);
    float _948 = -_932;
    float _950 = _948 + 1.0;
    float _952 = _938 * _896;
    float _954 = fma(_934, _942, (*spvDescriptorSet0.vp_c9)._m0[117].x);
    float _956 = -(*spvDescriptorSet0.vp_c9)._m0[118].w;
    float _958 = _796 + _956;
    float _960 = fma(_944, _890, _946);
    float _962 = _884 * _950;
    float _964 = _770 * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _966 = fma(_952, _958, (*spvDescriptorSet0.vp_c9)._m0[118].x);
    float _968 = fma(_954, _910, _960);
    float _970 = _772 * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _972 = _964 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _974 = fma(_966, _962, _968);
    float _976 = _774 * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _978 = _970 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _980 = fma(_932, (*spvDescriptorSet0.vp_c9)._m0[119].x, _974);
    float _982 = _976 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _984 = _980 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    out.m_63.x = _972;
    out.m_63.y = _978;
    out.m_63.z = _982;
    out.m_63.w = _984;
    bool _986 = !_844;
    float _1002;
    if (!_986)
    {
        float _988 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].z;
        float _990 = _172 * (*spvDescriptorSet0.vp_c9)._m0[12].w;
        float _992 = fma(_990, (*spvDescriptorSet0.vp_c9)._m0[11].z, _140);
        float _994 = _992 * _988;
        float _996 = floor(_994);
        float _998 = -_996;
        float _1000 = _994 + _998;
        _1002 = _1000;
        _1004 = true;
    }
    else
    {
        _1002 = _186;
    }
    _1004 = false;
    float _1006 = _1002;
    float _1008 = -(*spvDescriptorSet0.vp_c9)._m0[123].w;
    float _1010 = _1006 + _1008;
    bool _1012 = _1006 >= (*spvDescriptorSet0.vp_c9)._m0[125].w;
    bool _1014 = isnan(_1006);
    bool _1016 = _1012 || _1014;
    bool _1018 = isnan((*spvDescriptorSet0.vp_c9)._m0[125].w);
    bool _1020 = _1016 || _1018;
    float _1022 = float(_1020);
    float _1024 = -(*spvDescriptorSet0.vp_c9)._m0[124].w;
    float _1026 = _1006 + _1024;
    bool _1028 = _1006 >= (*spvDescriptorSet0.vp_c9)._m0[123].w;
    bool _1030 = isnan(_1006);
    bool _1032 = _1028 || _1030;
    bool _1034 = isnan((*spvDescriptorSet0.vp_c9)._m0[123].w);
    bool _1036 = _1032 || _1034;
    float _1038 = float(_1036);
    float _1040 = -(*spvDescriptorSet0.vp_c9)._m0[123].w;
    float _1042 = (*spvDescriptorSet0.vp_c9)._m0[124].w + _1040;
    float _1044 = -(*spvDescriptorSet0.vp_c9)._m0[124].w;
    float _1046 = _1044 + (*spvDescriptorSet0.vp_c9)._m0[125].w;
    bool _1048 = _1006 >= (*spvDescriptorSet0.vp_c9)._m0[124].w;
    bool _1050 = isnan(_1006);
    bool _1052 = _1048 || _1050;
    bool _1054 = isnan((*spvDescriptorSet0.vp_c9)._m0[124].w);
    bool _1056 = _1052 || _1054;
    float _1058 = float(_1056);
    float _1060 = 1.0 / _1042;
    float _1062 = -_1058;
    float _1064 = _1062 + 1.0;
    bool _1066 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].w;
    float _1068 = _1038 * _1064;
    float _1070 = -_1038;
    float _1072 = _1070 + 1.0;
    float _1074 = 1.0 / _1046;
    float _1076 = _1010 * _1060;
    float _1078 = -_1022;
    float _1080 = _1078 + 1.0;
    float _1082 = -(*spvDescriptorSet0.vp_c9)._m0[123].y;
    float _1084 = (*spvDescriptorSet0.vp_c9)._m0[124].y + _1082;
    float _1086 = _1058 * _1080;
    float _1088 = -(*spvDescriptorSet0.vp_c9)._m0[123].x;
    float _1090 = (*spvDescriptorSet0.vp_c9)._m0[124].x + _1088;
    float _1092 = -(*spvDescriptorSet0.vp_c9)._m0[123].z;
    float _1094 = (*spvDescriptorSet0.vp_c9)._m0[124].z + _1092;
    float _1096 = fma(_1084, _1076, (*spvDescriptorSet0.vp_c9)._m0[123].y);
    float _1098 = _1026 * _1074;
    float _1100 = fma(_1090, _1076, (*spvDescriptorSet0.vp_c9)._m0[123].x);
    float _1102 = fma(_1094, _1076, (*spvDescriptorSet0.vp_c9)._m0[123].z);
    float _1104 = _1096 * _1068;
    float _1106 = -(*spvDescriptorSet0.vp_c9)._m0[124].y;
    float _1108 = _1106 + (*spvDescriptorSet0.vp_c9)._m0[125].y;
    float _1110 = _1100 * _1068;
    float _1112 = _1102 * _1068;
    float _1114 = -(*spvDescriptorSet0.vp_c9)._m0[124].x;
    float _1116 = _1114 + (*spvDescriptorSet0.vp_c9)._m0[125].x;
    float _1118 = -(*spvDescriptorSet0.vp_c9)._m0[124].z;
    float _1120 = _1118 + (*spvDescriptorSet0.vp_c9)._m0[125].z;
    float _1122 = fma(_1072, (*spvDescriptorSet0.vp_c9)._m0[123].x, _1110);
    float _1124 = fma(_1072, (*spvDescriptorSet0.vp_c9)._m0[123].y, _1104);
    float _1126 = fma(_1116, _1098, (*spvDescriptorSet0.vp_c9)._m0[124].x);
    float _1128 = fma(_1108, _1098, (*spvDescriptorSet0.vp_c9)._m0[124].y);
    float _1130 = fma(_1120, _1098, (*spvDescriptorSet0.vp_c9)._m0[124].z);
    float _1132 = fma(_1072, (*spvDescriptorSet0.vp_c9)._m0[123].z, _1112);
    float _1134 = fma(_1126, _1086, _1122);
    float _1136 = fma(_1128, _1086, _1124);
    float _1138 = fma(_1130, _1086, _1132);
    float _1140 = fma(_1022, (*spvDescriptorSet0.vp_c9)._m0[125].x, _1134);
    float _1142 = fma(_1022, (*spvDescriptorSet0.vp_c9)._m0[125].y, _1136);
    float _1144 = fma(_1022, (*spvDescriptorSet0.vp_c9)._m0[125].z, _1138);
    bool _1146 = !_1066;
    float _1162;
    if (!_1146)
    {
        float _1148 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].w;
        float _1150 = _172 * (*spvDescriptorSet0.vp_c9)._m0[13].x;
        float _1152 = fma(_1150, (*spvDescriptorSet0.vp_c9)._m0[11].w, _140);
        float _1154 = _1152 * _1148;
        float _1156 = floor(_1154);
        float _1158 = -_1156;
        float _1160 = _1154 + _1158;
        _1162 = _1160;
        _1164 = true;
    }
    else
    {
        _1162 = _186;
    }
    _1164 = false;
    float _1166 = _1162;
    float _1168 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _1170 = _1166 + _1168;
    bool _1172 = _1166 >= (*spvDescriptorSet0.vp_c9)._m0[132].w;
    bool _1174 = isnan(_1166);
    bool _1176 = _1172 || _1174;
    bool _1178 = isnan((*spvDescriptorSet0.vp_c9)._m0[132].w);
    bool _1180 = _1176 || _1178;
    float _1182 = float(_1180);
    float _1184 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _1186 = _1184 + (*spvDescriptorSet0.vp_c9)._m0[132].w;
    bool _1188 = _1166 >= (*spvDescriptorSet0.vp_c9)._m0[131].w;
    bool _1190 = isnan(_1166);
    bool _1192 = _1188 || _1190;
    bool _1194 = isnan((*spvDescriptorSet0.vp_c9)._m0[131].w);
    bool _1196 = _1192 || _1194;
    float _1198 = float(_1196);
    float _1200 = -(*spvDescriptorSet0.vp_c9)._m0[131].x;
    float _1202 = (*spvDescriptorSet0.vp_c9)._m0[132].x + _1200;
    float _1204 = _1140 * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _1206 = -_1182;
    float _1208 = _1206 + 1.0;
    bool _1210 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[14].x;
    float _1212 = 1.0 / _1186;
    float _1214 = _1198 * _1208;
    float _1216 = -_1198;
    float _1218 = _1216 + 1.0;
    float _1220 = _1202 * _1212;
    float _1222 = _1144 * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _1224 = fma(_1220, _1170, (*spvDescriptorSet0.vp_c9)._m0[131].x);
    float _1226 = _1224 * _1214;
    float _1228 = _1142 * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _1230 = fma(_1218, (*spvDescriptorSet0.vp_c9)._m0[131].x, _1226);
    float _1232 = _1204 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1234 = _1228 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1236 = fma(_1182, (*spvDescriptorSet0.vp_c9)._m0[132].x, _1230);
    float _1238 = _1222 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1240 = _1236 * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    out.m_65.x = _1232;
    out.m_65.y = _1234;
    out.m_65.z = _1238;
    out.m_65.w = _1240;
    bool _1242 = !_1210;
    float _1258;
    if (!_1242)
    {
        float _1244 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[14].x;
        float _1246 = _172 * (*spvDescriptorSet0.vp_c9)._m0[15].x;
        float _1248 = fma(_1246, (*spvDescriptorSet0.vp_c9)._m0[14].x, _140);
        float _1250 = _1248 * _1244;
        float _1252 = floor(_1250);
        float _1254 = -_1252;
        float _1256 = _1250 + _1254;
        _1258 = _1256;
        _1260 = true;
    }
    else
    {
        _1258 = _186;
    }
    _1260 = false;
    float _1262 = _1258;
    float _1264 = -(*spvDescriptorSet0.vp_c9)._m0[159].w;
    float _1266 = (*spvDescriptorSet0.vp_c9)._m0[160].w + _1264;
    float _1268 = -(*spvDescriptorSet0.vp_c9)._m0[160].w;
    float _1270 = _1268 + (*spvDescriptorSet0.vp_c9)._m0[161].w;
    float _1272 = -(*spvDescriptorSet0.vp_c9)._m0[161].w;
    float _1274 = (*spvDescriptorSet0.vp_c9)._m0[162].w + _1272;
    float _1276 = -(*spvDescriptorSet0.vp_c9)._m0[162].w;
    float _1278 = _1276 + (*spvDescriptorSet0.vp_c9)._m0[163].w;
    float _1280 = -(*spvDescriptorSet0.vp_c9)._m0[163].w;
    float _1282 = (*spvDescriptorSet0.vp_c9)._m0[164].w + _1280;
    float _1284 = 1.0 / _1266;
    float _1286 = -(*spvDescriptorSet0.vp_c9)._m0[164].w;
    float _1288 = _1286 + (*spvDescriptorSet0.vp_c9)._m0[165].w;
    float _1290 = -(*spvDescriptorSet0.vp_c9)._m0[165].w;
    float _1292 = (*spvDescriptorSet0.vp_c9)._m0[166].w + _1290;
    bool _1294 = _1262 >= (*spvDescriptorSet0.vp_c9)._m0[161].w;
    bool _1296 = isnan(_1262);
    bool _1298 = _1294 || _1296;
    bool _1300 = isnan((*spvDescriptorSet0.vp_c9)._m0[161].w);
    bool _1302 = _1298 || _1300;
    float _1304 = float(_1302);
    float _1306 = 1.0 / _1270;
    float _1308 = -(*spvDescriptorSet0.vp_c9)._m0[159].w;
    float _1310 = _1262 + _1308;
    bool _1312 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[14].y;
    float _1314 = 1.0 / _1278;
    float _1316 = -(*spvDescriptorSet0.vp_c9)._m0[160].w;
    float _1318 = _1262 + _1316;
    float _1320 = _1310 * _1284;
    bool _1322 = _1262 >= (*spvDescriptorSet0.vp_c9)._m0[166].w;
    bool _1324 = isnan(_1262);
    bool _1326 = _1322 || _1324;
    bool _1328 = isnan((*spvDescriptorSet0.vp_c9)._m0[166].w);
    bool _1330 = _1326 || _1328;
    float _1332 = float(_1330);
    float _1334 = 1.0 / _1274;
    float _1336 = _1318 * _1306;
    float _1338 = -(*spvDescriptorSet0.vp_c9)._m0[161].w;
    float _1340 = _1262 + _1338;
    float _1342 = -(*spvDescriptorSet0.vp_c9)._m0[163].w;
    float _1344 = _1262 + _1342;
    float _1346 = 1.0 / _1282;
    float _1348 = -(*spvDescriptorSet0.vp_c9)._m0[162].w;
    float _1350 = _1262 + _1348;
    float _1352 = _1350 * _1314;
    bool _1354 = _1262 >= (*spvDescriptorSet0.vp_c9)._m0[165].w;
    bool _1356 = isnan(_1262);
    bool _1358 = _1354 || _1356;
    bool _1360 = isnan((*spvDescriptorSet0.vp_c9)._m0[165].w);
    bool _1362 = _1358 || _1360;
    float _1364 = float(_1362);
    float _1366 = 1.0 / _1292;
    float _1368 = _1340 * _1334;
    float _1370 = -_1332;
    float _1372 = _1370 + 1.0;
    float _1374 = -_1364;
    float _1376 = _1374 + 1.0;
    float _1378 = _1364 * _1372;
    float _1380 = _1344 * _1346;
    bool _1382 = _1262 >= (*spvDescriptorSet0.vp_c9)._m0[164].w;
    bool _1384 = isnan(_1262);
    bool _1386 = _1382 || _1384;
    bool _1388 = isnan((*spvDescriptorSet0.vp_c9)._m0[164].w);
    bool _1390 = _1386 || _1388;
    float _1392 = float(_1390);
    float _1394 = 1.0 / _1288;
    bool _1396 = _1262 >= (*spvDescriptorSet0.vp_c9)._m0[163].w;
    bool _1398 = isnan(_1262);
    bool _1400 = _1396 || _1398;
    bool _1402 = isnan((*spvDescriptorSet0.vp_c9)._m0[163].w);
    bool _1404 = _1400 || _1402;
    float _1406 = float(_1404);
    float _1408 = -(*spvDescriptorSet0.vp_c9)._m0[165].w;
    float _1410 = _1262 + _1408;
    float _1412 = _1392 * _1376;
    bool _1414 = _1262 >= (*spvDescriptorSet0.vp_c9)._m0[162].w;
    bool _1416 = isnan(_1262);
    bool _1418 = _1414 || _1416;
    bool _1420 = isnan((*spvDescriptorSet0.vp_c9)._m0[162].w);
    bool _1422 = _1418 || _1420;
    float _1424 = float(_1422);
    float _1426 = -_1392;
    float _1428 = _1426 + 1.0;
    float _1430 = -_1406;
    float _1432 = _1430 + 1.0;
    float _1434 = _1410 * _1366;
    float _1436 = -(*spvDescriptorSet0.vp_c9)._m0[159].z;
    float _1438 = (*spvDescriptorSet0.vp_c9)._m0[160].z + _1436;
    float _1440 = _1406 * _1428;
    float _1442 = _1424 * _1432;
    float _1444 = -_1424;
    float _1446 = _1444 + 1.0;
    float _1448 = -(*spvDescriptorSet0.vp_c9)._m0[159].x;
    float _1450 = (*spvDescriptorSet0.vp_c9)._m0[160].x + _1448;
    bool _1452 = _1262 >= (*spvDescriptorSet0.vp_c9)._m0[160].w;
    bool _1454 = isnan(_1262);
    bool _1456 = _1452 || _1454;
    bool _1458 = isnan((*spvDescriptorSet0.vp_c9)._m0[160].w);
    bool _1460 = _1456 || _1458;
    float _1462 = float(_1460);
    float _1464 = fma(_1438, _1320, (*spvDescriptorSet0.vp_c9)._m0[159].z);
    bool _1466 = _1262 >= (*spvDescriptorSet0.vp_c9)._m0[159].w;
    bool _1468 = isnan(_1262);
    bool _1470 = _1466 || _1468;
    bool _1472 = isnan((*spvDescriptorSet0.vp_c9)._m0[159].w);
    bool _1474 = _1470 || _1472;
    float _1476 = float(_1474);
    float _1478 = fma(_1450, _1320, (*spvDescriptorSet0.vp_c9)._m0[159].x);
    float _1480 = -(*spvDescriptorSet0.vp_c9)._m0[164].w;
    float _1482 = _1262 + _1480;
    float _1484 = -_1462;
    float _1486 = _1484 + 1.0;
    float _1488 = _1304 * _1446;
    float _1490 = -_1304;
    float _1492 = _1490 + 1.0;
    float _1494 = _1482 * _1394;
    float _1496 = _1476 * _1486;
    float _1498 = -(*spvDescriptorSet0.vp_c9)._m0[160].x;
    float _1500 = _1498 + (*spvDescriptorSet0.vp_c9)._m0[161].x;
    float _1502 = _1462 * _1492;
    float _1504 = -(*spvDescriptorSet0.vp_c9)._m0[160].z;
    float _1506 = _1504 + (*spvDescriptorSet0.vp_c9)._m0[161].z;
    float _1508 = _1478 * _1496;
    float _1510 = -_1476;
    float _1512 = _1510 + 1.0;
    float _1514 = _1464 * _1496;
    float _1516 = -(*spvDescriptorSet0.vp_c9)._m0[161].x;
    float _1518 = (*spvDescriptorSet0.vp_c9)._m0[162].x + _1516;
    float _1520 = fma(_1500, _1336, (*spvDescriptorSet0.vp_c9)._m0[160].x);
    float _1522 = fma(_1512, (*spvDescriptorSet0.vp_c9)._m0[159].x, _1508);
    float _1524 = -(*spvDescriptorSet0.vp_c9)._m0[161].z;
    float _1526 = (*spvDescriptorSet0.vp_c9)._m0[162].z + _1524;
    float _1528 = fma(_1506, _1336, (*spvDescriptorSet0.vp_c9)._m0[160].z);
    float _1530 = fma(_1512, (*spvDescriptorSet0.vp_c9)._m0[159].z, _1514);
    float _1532 = -(*spvDescriptorSet0.vp_c9)._m0[162].x;
    float _1534 = _1532 + (*spvDescriptorSet0.vp_c9)._m0[163].x;
    float _1536 = fma(_1518, _1368, (*spvDescriptorSet0.vp_c9)._m0[161].x);
    float _1538 = fma(_1520, _1502, _1522);
    float _1540 = fma(_1526, _1368, (*spvDescriptorSet0.vp_c9)._m0[161].z);
    float _1542 = -(*spvDescriptorSet0.vp_c9)._m0[162].z;
    float _1544 = _1542 + (*spvDescriptorSet0.vp_c9)._m0[163].z;
    float _1546 = fma(_1528, _1502, _1530);
    float _1548 = fma(_1534, _1352, (*spvDescriptorSet0.vp_c9)._m0[162].x);
    float _1550 = -(*spvDescriptorSet0.vp_c9)._m0[163].x;
    float _1552 = (*spvDescriptorSet0.vp_c9)._m0[164].x + _1550;
    float _1554 = fma(_1536, _1488, _1538);
    float _1556 = fma(_1544, _1352, (*spvDescriptorSet0.vp_c9)._m0[162].z);
    float _1558 = -(*spvDescriptorSet0.vp_c9)._m0[163].z;
    float _1560 = (*spvDescriptorSet0.vp_c9)._m0[164].z + _1558;
    float _1562 = fma(_1540, _1488, _1546);
    float _1564 = fma(_1552, _1380, (*spvDescriptorSet0.vp_c9)._m0[163].x);
    float _1566 = -(*spvDescriptorSet0.vp_c9)._m0[164].x;
    float _1568 = _1566 + (*spvDescriptorSet0.vp_c9)._m0[165].x;
    float _1570 = fma(_1548, _1442, _1554);
    float _1572 = fma(_1560, _1380, (*spvDescriptorSet0.vp_c9)._m0[163].z);
    float _1574 = -(*spvDescriptorSet0.vp_c9)._m0[164].z;
    float _1576 = _1574 + (*spvDescriptorSet0.vp_c9)._m0[165].z;
    float _1578 = fma(_1556, _1442, _1562);
    float _1580 = fma(_1568, _1494, (*spvDescriptorSet0.vp_c9)._m0[164].x);
    float _1582 = -(*spvDescriptorSet0.vp_c9)._m0[165].x;
    float _1584 = (*spvDescriptorSet0.vp_c9)._m0[166].x + _1582;
    float _1586 = fma(_1576, _1494, (*spvDescriptorSet0.vp_c9)._m0[164].z);
    float _1588 = -(*spvDescriptorSet0.vp_c9)._m0[165].z;
    float _1590 = (*spvDescriptorSet0.vp_c9)._m0[166].z + _1588;
    float _1592 = fma(_1564, _1440, _1570);
    float _1594 = fma(_1572, _1440, _1578);
    float _1596 = fma(_1584, _1434, (*spvDescriptorSet0.vp_c9)._m0[165].x);
    float _1598 = fma(_1590, _1434, (*spvDescriptorSet0.vp_c9)._m0[165].z);
    float _1600 = fma(_1580, _1412, _1592);
    float _1602 = fma(_1586, _1412, _1594);
    float _1604 = fma(_1596, _1378, _1600);
    float _1606 = fma(_1598, _1378, _1602);
    float _1608 = fma(_1332, (*spvDescriptorSet0.vp_c9)._m0[166].x, _1604);
    float _1610 = fma(_1332, (*spvDescriptorSet0.vp_c9)._m0[166].z, _1606);
    out.m_67.x = _1608;
    out.m_67.z = _1610;
    bool _1612 = !_1312;
    int _1614 = as_type<int>(_1440);
    float _1616 = _1434;
    float _1618 = _1600;
    if (!_1612)
    {
        float _1620 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[14].y;
        float _1622 = _172 * (*spvDescriptorSet0.vp_c9)._m0[15].y;
        float _1624 = fma(_1622, (*spvDescriptorSet0.vp_c9)._m0[14].y, _140);
        float _1626 = _1624 * _1620;
        float _1628 = floor(_1626);
        float _1630 = -_1628;
        float _1632 = _1626 + _1630;
        _188 = _1632;
    }
    float _1634 = _188;
    float _1636 = in.m_69.y;
    float _1638 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    float _1640 = in.m_57.w;
    int _1642 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _1644 = _1642 != 0;
    int _1646 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _1648 = _1646 != 0;
    float _1650 = in.m_69.x;
    int _1652 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _1654 = _1652 != 0;
    float _1656 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    float _1658 = in.m_57.z;
    float _1660 = in.m_57.y;
    float _1662 = (*spvDescriptorSet0.vp_c9)._m0[83].z + (*spvDescriptorSet0.vp_c9)._m0[83].x;
    float _1664 = _1638 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    float _1666 = (*spvDescriptorSet0.vp_c9)._m0[82].y + (*spvDescriptorSet0.vp_c9)._m0[81].w;
    float _1668 = (*spvDescriptorSet0.vp_c9)._m0[83].w + (*spvDescriptorSet0.vp_c9)._m0[83].y;
    int _1670 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _1672 = _1670 != 0;
    float _1674 = -_1636;
    float _1676 = _1674 + 1.0;
    bool _1678 = _1640 > 0.5;
    int _1680 = _1678 ? as_type<int>(_1676) : as_type<int>(_1636);
    bool _1682 = _1678;
    float _1684 = (*spvDescriptorSet0.vp_c9)._m0[7].z;
    float _1686 = _1664;
    float _1688 = _1636;
    if (_1644)
    {
        float _1690 = -_1650;
        float _1692 = _1690 + 1.0;
        _1614 = as_type<int>(_1692);
    }
    int _1694 = _1614;
    if (!_1644)
    {
        _1616 = _1650;
    }
    float _1696 = _1616;
    float _1698 = _1654 ? as_type<float>(_1680) : _1636;
    float _1700 = _1696;
    float _1702 = _1698;
    if (_1644)
    {
        bool _1704 = _1658 > 0.5;
        _1682 = _1704;
    }
    bool _1706 = _1682;
    if (!_1648)
    {
        _1684 = _1658;
    }
    float _1708 = _1684;
    float _1710 = fma(_1698, _1664, -0.5);
    float _1712 = _1708;
    if (!_1648)
    {
        _1686 = _1660;
    }
    float _1714 = _1686;
    float _1716 = _1714;
    if (_1644)
    {
        float _1718 = _1706 ? as_type<float>(_1694) : _1650;
        _1700 = _1718;
    }
    float _1720 = _1700;
    if (_1648)
    {
        _1716 = _172;
    }
    float _1722 = _1716;
    if (_1648)
    {
        _1712 = _1660;
    }
    float _1724 = _1712;
    float _1726 = fma(_1722, (*spvDescriptorSet0.vp_c9)._m0[83].z, _1662);
    if (!_1648)
    {
        _1702 = _1658;
    }
    float _1728 = _1702;
    float _1730 = _1724 * (*spvDescriptorSet0.vp_c9)._m0[82].y;
    float _1732 = _1728;
    if (_1648)
    {
        _1732 = _1660;
    }
    float _1734 = _1732;
    float _1736 = (*spvDescriptorSet0.vp_c9)._m0[82].x + (*spvDescriptorSet0.vp_c9)._m0[81].z;
    float _1738 = _1722 * (*spvDescriptorSet0.vp_c9)._m0[82].x;
    float _1740 = _1656 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    float _1742 = fma(_1730, -2.0, _1666);
    float _1744 = fma(_1734, (*spvDescriptorSet0.vp_c9)._m0[83].w, _1668);
    float _1746 = -_1736;
    float _1748 = fma(_1738, 2.0, _1746);
    float _1750 = fma(_1740, _1720, -0.5);
    float _1752 = fma(_140, (*spvDescriptorSet0.vp_c9)._m0[81].y, _1742);
    float _1754 = fma(_140, (*spvDescriptorSet0.vp_c9)._m0[82].w, _1744);
    float _1756 = fma(_140, (*spvDescriptorSet0.vp_c9)._m0[82].z, _1726);
    float _1758 = -_140;
    float _1760 = fma(_1758, (*spvDescriptorSet0.vp_c9)._m0[81].x, _1748);
    if (!_1672)
    {
        _1618 = _1650;
    }
    float _1762 = _1618;
    float _1764 = -_1752;
    float _1766 = fma(_1754, _1710, _1764);
    float _1768 = fma(_1756, _1750, _1760);
    float _1770 = _1766 + 0.5;
    float _1772 = _1768 + 0.5;
    float2 _7080 = float2(_1772, _1770);
    float _1774 = dm_bs(spvDescriptorSet0.vp_t_tcb_A.sample(spvDescriptorSet0.vp_t_tcb_ASmplr, select(_7080, float2(0.0), isnan(_7080)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_A, spvDescriptorSet0.vp_t_tcb_ASmplr_w, select(_7080, float2(0.0), isnan(_7080)), level(0.0)).w;
    float _1776 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].y);
    int _1778 = int(_1776);
    float _1780 = in.m_48.x;
    float _1782 = in.m_48.y;
    float _1784 = in.m_48.z;
    float _1786 = _172 * 2.0;
    float _1788 = _280 * _644;
    float _1790 = in.m_71.x;
    float _1792 = in.m_71.y;
    float _1794 = in.m_71.z;
    float _1796 = in.m_71.w;
    int _1798 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 16;
    bool _1800 = _1798 != 0;
    int _1802 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 32;
    bool _1804 = _1802 != 0;
    int _1806 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 64;
    bool _1808 = _1806 != 0;
    float _1810 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].x);
    int _1812 = int(_1810);
    float _1814 = in.m_73.x;
    float _1816 = in.m_73.y;
    float _1818 = in.m_73.z;
    float _1820 = in.m_73.w;
    float _1822 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _1824 = _1788 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _1826 = in.m_75.x;
    float _1828 = in.m_75.y;
    float _1830 = in.m_75.z;
    float _1832 = in.m_75.w;
    float _1834 = float(_1778);
    float _1836 = floor(_1786);
    float _1838 = _280 * _768;
    float _1840 = _280 * _662;
    float _1842 = _1660 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    float _1844 = _1838 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _1846 = _1840 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _1848 = float(uint(_1812));
    float _1850 = 1.0 / _1834;
    float _1852 = fma(_1842, -2.0, _1822);
    float _1854 = _1660 * 2.0;
    int _1856 = ~_1812;
    int _1858 = _1856 + 1;
    float _1860 = _1782 * _1792;
    float _1862 = 1.0 / _1848;
    float _1864 = fma(_1780, _1790, _1860);
    float _1866 = _1782 * _1816;
    float _1868 = _1782 * _1828;
    float _1870 = _172 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    bool _1872 = _1836 > 0.0;
    float _1874 = fma(_1780, _1814, _1866);
    float _1876 = _1850 * _140;
    float _1878 = fma(_1780, _1826, _1868);
    float _1880 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    float _1882 = float(_1812);
    float _1884 = fma(_1784, _1818, _1874);
    float _1886 = trunc(_1876);
    int _1888 = int(_1886);
    float _1890 = -_1880;
    float _1892 = fma(_1870, 2.0, _1890);
    int _1894 = as_type<int>(_1862) + (-2);
    float _1896 = fma(_1784, _1794, _1864);
    bool _1898 = !_1648;
    float _1900 = _1898 ? 7.345489978790283203125 : 1.0;
    float _1902 = _172 + _1660;
    float _1904 = _1882 * _140;
    float _1906 = fma(_1784, _1830, _1878);
    float _1908 = floor(_1854);
    bool _1910 = _1836 >= 0.0;
    bool _1912 = isnan(_1836);
    bool _1914 = _1910 || _1912;
    bool _1916 = isnan(0.0);
    bool _1918 = _1914 || _1916;
    float _1920 = _1902 + (-1.0);
    int _1922 = ~_1812;
    int _1924 = _1922 + 1;
    float _1926 = _1904 * _182;
    float _1928 = _1900 * _172;
    int _1930 = _1918 ? 0 : 1;
    float _1932 = _1658 * 2.0;
    float _1934 = float(uint(_1888));
    float _1936 = fma(_1920, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    float _1938 = _1660 + _1658;
    int _1940 = ~_1930;
    int _1942 = _1940 + 1;
    int _1944 = _1942 + 1;
    float _1946 = _172 + _1658;
    float _1948 = as_type<float>(_1894) * _1934;
    int _1950 = _1944;
    float _1952 = _1762;
    if (!_1872)
    {
        int _1954 = ~_1930;
        int _1956 = _1954 + 1;
        _1950 = _1956;
    }
    int _1958 = _1950;
    float _1960 = _1938 + (-1.0);
    bool _1962 = !_1804;
    int _1964 = _1962 ? 0 : 1;
    float _1966 = floor(_1932);
    bool _1968 = !_1800;
    int _1970 = _1968 ? 0 : 1;
    float _1972 = _1946 + (-1.0);
    bool _1974 = !_1808;
    int _1976 = _1974 ? 0 : 1;
    float _1978 = _1658 + (-0.5);
    float _1980 = fma(_1972, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    int _1982 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _1984 = _1982 != 0;
    int _1986 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _1988 = _1986 != 0;
    int _1990 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _1992 = _1990 != 0;
    float _1994 = trunc(_1948);
    float _1996 = precise::max(_1994, 0.0);
    uint _1999 = uint(_1996);
    bool _2001 = _1908 >= 0.0;
    bool _2003 = isnan(_1908);
    bool _2005 = _2001 || _2003;
    bool _2007 = isnan(0.0);
    bool _2009 = _2005 || _2007;
    float _2011 = fma(_1960, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    bool _2013 = _1908 > 0.0;
    float _2015 = _1906 + _1832;
    bool _2017 = !_1988;
    int _2019 = _2017 ? 0 : 1;
    float _2021 = float(_1958);
    float _2023 = floor(_1928);
    int _2025 = abs(_2019);
    float _2027 = _1896 + _1796;
    int _2029 = _2009 ? 0 : 1;
    float _2031 = float(_2025);
    bool _2033 = _1966 > 0.0;
    int _2035 = _1924 * int(_1999);
    int _2037 = _2035 + _1888;
    int _2039 = ~_2029;
    int _2041 = _2039 + 1;
    int _2043 = _2041 + 1;
    float _2045 = _2031 * _2021;
    int _2047 = _2043;
    float _2049 = _2027;
    if (!_2013)
    {
        int _2051 = ~_2029;
        int _2053 = _2051 + 1;
        _2047 = _2053;
    }
    int _2055 = _2047;
    float _2057 = trunc(_1926);
    int _2059 = int(_2057);
    float _2061 = float(uint(_2037));
    float _2063 = _2045 * (-2.0);
    bool _2065 = _1966 >= 0.0;
    bool _2067 = isnan(_1966);
    bool _2069 = _2065 || _2067;
    bool _2071 = isnan(0.0);
    bool _2073 = _2069 || _2071;
    float _2075 = -_2023;
    float _2077 = _1928 + _2075;
    float _2079 = float(_1888);
    float _2081 = as_type<float>(_1894) * _2061;
    float _2083 = _1884 + _1820;
    float _2085 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _2087 = log2(_2085);
    int _2089 = _2073 ? 0 : 1;
    bool _2091 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _2093 = isnan(1.0);
    bool _2095 = _2091 || _2093;
    bool _2097 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _2099 = _2095 || _2097;
    float _2101 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _2103 = 1.0 + _2101;
    bool _2105 = !_1992;
    int _2107 = _2105 ? 0 : 1;
    float _2109 = trunc(_2081);
    float _2111 = precise::max(_2109, 0.0);
    uint _2113 = uint(_2111);
    int _2115 = ~_2089;
    int _2117 = _2115 + 1;
    int _2119 = _2117 + 1;
    float _2121 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    bool _2123 = _2079 >= _1882;
    bool _2125 = isnan(_2079);
    bool _2127 = _2123 || _2125;
    bool _2129 = isnan(_1882);
    bool _2131 = _2127 || _2129;
    float _2133 = float(_2131);
    int _2135 = _2119;
    if (!_2033)
    {
        int _2137 = ~_2089;
        int _2139 = _2137 + 1;
        _2135 = _2139;
    }
    int _2141 = _2135;
    float _2143 = fma(_1660, (*spvDescriptorSet0.vp_c9)._m0[78].w, _2121);
    bool _2145 = !_1984;
    int _2147 = _2145 ? 0 : 1;
    float _2149 = _2087 * _140;
    float _2151 = _2077 * _1882;
    float _2153 = 1.0 / _2103;
    float _2155 = in.m_77.x;
    float _2157 = in.m_77.y;
    float _2159 = in.m_77.z;
    int _2161 = abs(_2107);
    float _2163 = _172 * 6.283185482025146484375;
    bool _2165 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _2167 = isnan(0.0);
    bool _2169 = _2165 || _2167;
    bool _2171 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _2173 = _2169 || _2171;
    int _2175 = int(_1999) + int(_2113);
    float _2177 = _2163 * 0.15915493667125701904296875;
    float _2179 = exp2(_2149);
    float _2181 = _2163 + _140;
    int _2183 = abs(_2147);
    float _2185 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    int _2187 = abs(_1964);
    float _2189 = trunc(_2133);
    int _2191 = int(_2189);
    int _2193 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 128;
    bool _2195 = _2193 != 0;
    float _2197 = fma(_172, (*spvDescriptorSet0.vp_c9)._m0[78].z, _2185);
    float _2199 = _2181 * 0.070000000298023223876953125;
    int _2201 = abs(_1976);
    float _2203 = fma(_140, (*spvDescriptorSet0.vp_c9)._m0[77].z, _2197);
    float _2205 = -_140;
    float _2207 = fma(_2205, (*spvDescriptorSet0.vp_c9)._m0[76].x, _1892);
    float _2209 = -_2179;
    float _2211 = _2209 + 1.0;
    float _2213 = fma(_140, (*spvDescriptorSet0.vp_c9)._m0[77].w, _2143);
    float _2215 = float(_2161);
    float _2217 = trunc(_2151);
    int _2219 = int(_2217);
    float _2221 = float(_2055);
    float _2223 = float(_2183);
    float _2225 = _2173 ? _2211 : 0.0;
    float _2227 = _2215 * _2221;
    float _2229 = float(_2141);
    float _2231 = fma(_140, (*spvDescriptorSet0.vp_c9)._m0[76].y, _1852);
    int _2233 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4096;
    bool _2235 = _2233 != 0;
    if (_2099)
    {
        float _2237 = _2225 * _2153;
        _150 = _2237;
    }
    float _2239 = _150;
    int _2241 = _1858 * _2175;
    int _2243 = _2241 + _1888;
    float _2245 = _2223 * _2229;
    float _2247 = fma(_2011, _2063, _2011);
    float _2249 = fma(_2063, _2157, _2157);
    bool _2251 = !_2235;
    int _2253 = _2251 ? 0 : 1;
    float _2255 = _2245 * (-2.0);
    bool _2257 = uint(_2243) >= uint(_1812);
    float _2259 = _1660 + (-0.5);
    bool _2261 = _1812 == 0;
    float _2263 = fma(_1936, _2255, _1936);
    float _2265 = fma(_2255, _2155, _2155);
    bool _2267 = !_2257;
    int _2269 = _2267 ? 0 : (-1);
    float _2271 = fma(_2259, (*spvDescriptorSet0.vp_c9)._m0[196].y, _2249);
    int _2273 = abs(_2253);
    float _2275 = _2227 * (-2.0);
    int _2277 = ~_2175;
    int _2279 = _2277 + _2269;
    int _2281 = _2279 + 1;
    float _2283 = _172 + (-0.5);
    float _2285 = fma(_1980, _2275, _1980);
    float _2287 = fma(_2275, _2159, _2159);
    int _2289 = _1812 * _2281;
    int _2291 = _2289 + _1888;
    float _2293 = fma(_2283, (*spvDescriptorSet0.vp_c9)._m0[196].x, _2265);
    float _2295 = fma(_2247, _2239, _2271);
    float _2297 = in.m_79.x;
    float _2299 = in.m_79.y;
    float _2301 = in.m_79.z;
    int _2303 = ~_2191;
    int _2305 = _2303 + 1;
    int _2307 = _2305 + 1;
    int _2309 = _2219 * _2273;
    int _2311 = _2309 + _1888;
    bool _2313 = !_2261;
    int _2315 = _2313 ? _2291 : (-1);
    float _2317 = _2177 * 6.283185482025146484375;
    float _2319 = sin(_2317);
    int _2321 = _1812 + (-1);
    float _2323 = fma(_1978, (*spvDescriptorSet0.vp_c9)._m0[196].z, _2287);
    float _2325 = fma(_2263, _2239, _2293);
    int _2327 = _2315 * _2307;
    int _2329 = abs(_1970);
    float _2331 = fma(_2285, _2239, _2323);
    float _2333 = _2177 * 6.283185482025146484375;
    float _2335 = cos(_2333);
    int _2337 = _2191 * _2321;
    int _2339 = _2337 + _2327;
    float _2341 = _2295 * 0.15915493667125701904296875;
    float _2343 = _2325 * 0.15915493667125701904296875;
    int _2345 = _2339 * _2187;
    float _2347 = _2331 * 0.15915493667125701904296875;
    bool _2349 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[660].y;
    bool _2351 = isnan(0.5);
    bool _2353 = _2349 || _2351;
    bool _2355 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _2357 = _2353 || _2355;
    float _2359 = _2341 * 6.283185482025146484375;
    float _2361 = sin(_2359);
    int _2363 = _2059 * _2329;
    int _2365 = _2363 + _2345;
    bool _2367 = !_2195;
    int _2369 = _2367 ? 0 : 1;
    float _2371 = _2319 * _2299;
    int _2373 = _2311 * _2201;
    int _2375 = _2373 + _2365;
    int _2377 = abs(_2369);
    float _2379 = _2027 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _2381 = _2335 * _2299;
    float _2383 = -_2371;
    float _2385 = fma(_2335, _2297, _2383);
    float _2387 = _2341 * 6.283185482025146484375;
    float _2389 = cos(_2387);
    float _2391 = fma(_2319, _2297, _2381);
    float _2393 = fma(_2083, (*spvDescriptorSet0.vp_c8)._m0[11].x, _2379);
    bool _2395 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[653].w;
    bool _2397 = isnan(0.5);
    bool _2399 = _2395 || _2397;
    bool _2401 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _2403 = _2399 || _2401;
    int _2405 = _2219 * _2377;
    int _2407 = _2405 + _2375;
    float _2409 = fma(_2015, (*spvDescriptorSet0.vp_c8)._m0[11].z, _2393);
    float _2411 = _2343 * 6.283185482025146484375;
    float _2413 = sin(_2411);
    float _2415 = _2343 * 6.283185482025146484375;
    float _2417 = cos(_2415);
    float _2419 = _2347 * 6.283185482025146484375;
    float _2421 = cos(_2419);
    float _2423 = _2413 * _2389;
    float _2425 = _2417 * _2389;
    float _2427 = _2417 * _2361;
    float _2429 = _2347 * 6.283185482025146484375;
    float _2431 = sin(_2429);
    float _2433 = _2389 * _2421;
    float _2435 = _2417 * _2421;
    float _2437 = -_2427;
    float _2439 = fma(_2431, _2423, _2437);
    float _2441 = -_2423;
    float _2443 = fma(_2431, _2427, _2441);
    float _2445 = fma(_1774, 6.283185482025146484375, _2199);
    float _2447 = _2445 * 0.15915493667125701904296875;
    float _2449 = _2413 * _2361;
    float _2451 = _2413 * _2421;
    float _2453 = _2361 * _2421;
    float _2455 = fma(_2431, _2425, _2449);
    float _2457 = _2447 * 6.283185482025146484375;
    float _2459 = sin(_2457);
    float _2461 = fma(_2431, _2449, _2425);
    float _2463 = _2459 * 0.100000001490116119384765625;
    float _2465 = fma(_2391, _2463, _2391);
    float _2467 = fma(_2385, _2463, _2385);
    float _2469 = fma(_2463, _2301, _2301);
    float _2471 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _2465);
    float _2473 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _2467);
    float _2475 = _1824 * _2471;
    float _2477 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _2469);
    float _2479 = _1844 * _2473;
    float _2481 = _2435 * _2475;
    float _2483 = _1846 * _2477;
    float _2485 = -_2475;
    float _2487 = _2431 * _2485;
    float _2489 = _2451 * _2475;
    float _2491 = fma(_2455, _2479, _2481);
    float _2493 = fma(_2433, _2479, _2487);
    float _2495 = fma(_2439, _2479, _2489);
    float _2497 = fma(_2443, _2483, _2491);
    float _2499 = _2027 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _2501 = fma(_2453, _2483, _2493);
    float _2503 = fma(_2461, _2483, _2495);
    float _2505 = _2497 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _2507 = _2497 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _2509 = fma(_2083, (*spvDescriptorSet0.vp_c8)._m0[10].x, _2499);
    float _2511 = fma(_2501, (*spvDescriptorSet0.vp_c8)._m0[26].x, _2505);
    float _2513 = fma(_2501, (*spvDescriptorSet0.vp_c8)._m0[24].x, _2507);
    float _2515 = fma(_2015, (*spvDescriptorSet0.vp_c8)._m0[10].z, _2509);
    float _2517 = _2409 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _2519 = fma(_2503, (*spvDescriptorSet0.vp_c8)._m0[26].z, _2511);
    float _2521 = fma(_2503, (*spvDescriptorSet0.vp_c8)._m0[24].z, _2513);
    float _2523 = _2515 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _2525 = _2519 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _2527 = _2521 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _2529 = _2523 + _2517;
    float _2531 = _2015 + _2525;
    float _2533 = _2083 + _2527;
    float _2535 = 1.0 / _2517;
    float _2537 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _2539 = _2531 + _2537;
    float _2541 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _2543 = _2533 + _2541;
    float _2545 = _2539 * _2539;
    float _2547 = fma(_2543, _2543, _2545);
    float _2549 = _2497 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _2551 = sqrt(_2547);
    float _2553 = fma(_2501, (*spvDescriptorSet0.vp_c8)._m0[25].x, _2549);
    float _2555 = _2529 * _2535;
    float _2557 = _2555 * 0.5;
    float _2559 = fma(_2503, (*spvDescriptorSet0.vp_c8)._m0[25].z, _2553);
    float _2561 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _2563 = fma(_2557, (*spvDescriptorSet0.vp_c8)._m0[30].w, _2561);
    float _2565 = _2559 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _2567 = 1.0 / _2563;
    float _2569 = _2027 + _2565;
    bool _2571 = _2551 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2573 = _2549;
    float _2575 = _2535;
    float _2577 = _2559;
    float _2579 = _2569;
    float _2581 = _2547;
    float _2583 = _2531;
    bool _2585 = _2357;
    if (!_2571)
    {
        _2573 = _2533;
    }
    float _2587 = _2573;
    float _2589 = _2587;
    if (!_2571)
    {
        _2575 = _2531;
    }
    float _2591 = _2575;
    float _2593 = _2591;
    if (!_2571)
    {
        _2577 = _2569;
    }
    float _2595 = _2577;
    bool _2597 = !_2571;
    float _2599 = _2595;
    if (!_2597)
    {
        float _2601 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _2603 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _2605 = _2551 + _2603;
        float _2607 = _2569 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _2609 = rsqrt(_2547);
        float _2611 = _2605 * _2601;
        float _2613 = _2611 * 0.15915493667125701904296875;
        float _2615 = _2613 * 6.283185482025146484375;
        float _2617 = cos(_2615);
        float _2619 = _2613 * 6.283185482025146484375;
        float _2621 = sin(_2619);
        float _2623 = _2617 + (-1.0);
        float _2625 = _2623 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _2627 = fma(_2621, _2607, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _2629 = fma(_2569, _2617, _2625);
        float _2631 = _2609 * _2627;
        float _2633 = fma(_2543, _2631, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _2635 = fma(_2539, _2631, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _2589 = _2633;
        _2599 = _2629;
        _2593 = _2635;
    }
    float _2637 = _2589;
    float _2639 = _2599;
    float _2641 = _2593;
    float _2643 = _2639;
    float _2645 = _2637;
    float _2647 = _2641;
    if (!_2357)
    {
        float _2649 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
        float _2651 = _2027 + _2649;
        float _2653 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
        float _2655 = _2083 + _2653;
        float _2657 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _2659 = _2651 * _2651;
        float _2661 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
        float _2663 = _2015 + _2661;
        float _2665 = fma(_2655, _2655, _2659);
        float _2667 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _2669 = fma(_2663, _2663, _2665);
        float _2671 = sqrt(_2669);
        float _2673 = _2657 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _2675 = -_2083;
        float _2677 = _2675 + _2637;
        float _2679 = precise::min(_2671, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _2681 = _2679 * _2667;
        float _2683 = _2673 * _2681;
        float _2685 = -_2027;
        float _2687 = _2685 + _2639;
        float _2689 = -_2015;
        float _2691 = _2689 + _2641;
        float _2693 = fma(_2677, _2683, _2083);
        float _2695 = fma(_2687, _2683, _2027);
        float _2697 = fma(_2691, _2683, _2015);
        _2643 = _2695;
        _2645 = _2693;
        _2647 = _2697;
        _2579 = _2691;
    }
    float _2699 = _2643;
    float _2701 = _2645;
    float _2703 = _2647;
    float _2705 = _2579;
    float _2707 = _2705;
    if (_2403)
    {
        _2581 = 1.0;
    }
    float _2709 = _2581;
    float _2711 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _2713 = _2567 * _2711;
    float _2715 = _2709;
    float _2717 = _2713;
    if (!_2403)
    {
        float _2719 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _2721 = _2719 * 0.15915493667125701904296875;
        float _2723 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _2725 = _2721 * 6.283185482025146484375;
        float _2727 = cos(_2725);
        float _2729 = _2723 * 0.15915493667125701904296875;
        float _2731 = _2721 * 6.283185482025146484375;
        float _2733 = sin(_2731);
        float _2735 = 1.0 / _2727;
        float _2737 = _2729 * 6.283185482025146484375;
        float _2739 = cos(_2737);
        float _2741 = _2733 * _2735;
        float _2743 = _2729 * 6.283185482025146484375;
        float _2745 = sin(_2743);
        float _2747 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _2749 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _2747;
        float _2751 = _2739 * _2741;
        float _2753 = 1.0 / _2751;
        float _2755 = 1.0 / _2749;
        float _2757 = _2745 * _2753;
        float _2759 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _2761 = fma(_2713, _2757, _2759);
        float _2763 = _2761 * _2755;
        float _2765 = precise::clamp(_2763, 0.0, 1.0);
        _2583 = _2721;
        _2707 = _2729;
        _2715 = _2765;
    }
    float _2767 = _2583;
    float _2769 = _2707;
    float _2771 = _2715;
    float _2773 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _2775 = _2699 + _2773;
    float _2777 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _2779 = _2701 + _2777;
    float _2781 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _2783 = _2703 + _2781;
    float _2785 = _2775 * _2775;
    float _2787 = in.m_81.w;
    float _2789 = fma(_2779, _2779, _2785);
    float _2791 = fma(_2015, (*spvDescriptorSet0.vp_c15)._m0[652].y, (*spvDescriptorSet0.vp_c15)._m0[652].w);
    float _2793 = fma(_2783, _2783, _2789);
    float _2795 = -(*spvDescriptorSet0.vp_c9)._m0[167].w;
    float _2797 = _2795 + (*spvDescriptorSet0.vp_c9)._m0[168].w;
    float _2799 = -(*spvDescriptorSet0.vp_c9)._m0[168].w;
    float _2801 = _2799 + (*spvDescriptorSet0.vp_c9)._m0[169].w;
    float _2803 = rsqrt(_2793);
    float _2805 = float(uint(_2407));
    float _2807 = -(*spvDescriptorSet0.vp_c9)._m0[170].w;
    float _2809 = _2807 + (*spvDescriptorSet0.vp_c9)._m0[171].w;
    float _2811 = sqrt(_2793);
    float _2813 = -(*spvDescriptorSet0.vp_c9)._m0[171].w;
    float _2815 = _2813 + (*spvDescriptorSet0.vp_c9)._m0[172].w;
    float _2817 = -(*spvDescriptorSet0.vp_c9)._m0[169].w;
    float _2819 = _2817 + (*spvDescriptorSet0.vp_c9)._m0[170].w;
    float _2821 = _2803 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _2823 = 1.0 / _2797;
    float _2825 = _2779 * _2821;
    float _2827 = _2783 * _2821;
    float _2829 = _2825 * _2825;
    float _2831 = _2827 * _2827;
    float _2833 = 1.0 / _2801;
    float _2835 = _2829 + _2831;
    float _2837 = sqrt(_2835);
    float _2839 = 1.0 / _2809;
    bool _2841 = _2837 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2843 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2845 = _2837 + _2843;
    float _2847 = 1.0 / _2815;
    float _2849 = 1.0 / _2819;
    float _2851 = _2783;
    float _2853 = _2769;
    float _2855 = _2845;
    float _2857 = _2767;
    float _2859 = _2835;
    float _2861 = _2775;
    if (_2841)
    {
        float _2863 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2851 = _2863;
    }
    float _2865 = _2851;
    if (_2841)
    {
        float _2867 = rsqrt(_2835);
        _2853 = _2867;
    }
    float _2869 = _2853;
    float _2871 = _2869;
    if (_2841)
    {
        float _2873 = _2845 * _2865;
        _2855 = _2873;
    }
    float _2875 = _2855;
    if (_2841)
    {
        float _2877 = _2875 * 0.15915493667125701904296875;
        _2857 = _2877;
    }
    float _2879 = _2857;
    float _2881 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _2883 = _2803;
    float _2885 = _2881;
    if (_2841)
    {
        float _2887 = _2879 * 6.283185482025146484375;
        float _2889 = sin(_2887);
        _2883 = _2889;
    }
    float _2891 = _2883;
    float _2893 = precise::max(0.0, _2881);
    float _2895 = _2789;
    float _2897 = _2893;
    if (_2841)
    {
        float _2899 = _2879 * 6.283185482025146484375;
        float _2901 = cos(_2899);
        _2895 = _2901;
    }
    float _2903 = _2895;
    float _2905 = -_2821;
    float _2907 = -_2893;
    float _2909 = fma(_2775, _2905, _2907);
    if (!_2841)
    {
        _2897 = _2825;
    }
    float _2911 = _2897;
    float _2913 = _2911;
    if (_2841)
    {
        float _2915 = _2909 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2885 = _2915;
    }
    float _2917 = _2885;
    float _2919 = _2917;
    float _2921 = _2891;
    if (_2841)
    {
        float _2923 = fma(_2891, _2917, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _2919 = _2923;
    }
    float _2925 = _2919;
    float _2927 = _2925;
    if (!_2841)
    {
        _2921 = _2829;
    }
    float _2929 = _2921;
    float _2931 = _2929;
    if (_2841)
    {
        float _2933 = _2869 * _2925;
        _2859 = _2933;
    }
    float _2935 = _2859;
    if (!_2841)
    {
        _2927 = _2909;
    }
    float _2937 = _2927;
    float _2939 = _2937;
    float _2941 = _2903;
    if (_2841)
    {
        float _2943 = _2903 + (-1.0);
        _2861 = _2943;
    }
    float _2945 = _2861;
    float _2947 = _2945;
    if (_2841)
    {
        float _2949 = _2825 * _2935;
        _2913 = _2949;
    }
    float _2951 = _2913;
    float _2953 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _2955 = fma(_2811, (*spvDescriptorSet0.vp_c15)._m0[23].w, _2953);
    float _2957 = precise::clamp(_2955, 0.0, 1.0);
    float _2959 = _2699 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    if (_2841)
    {
        float _2961 = _2945 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2871 = _2961;
    }
    float _2963 = _2871;
    if (!_2841)
    {
        _2947 = _2827;
    }
    float _2965 = _2947;
    float _2967 = _2965;
    if (_2841)
    {
        float _2969 = _2827 * _2935;
        _2967 = _2969;
    }
    float _2971 = _2967;
    if (_2841)
    {
        float _2973 = _2951 * _2951;
        _2931 = _2973;
    }
    float _2975 = _2931;
    if (_2841)
    {
        float _2977 = fma(_2909, _2903, _2963);
        _2939 = _2977;
    }
    float _2979 = _2939;
    if (!_2841)
    {
        _2941 = _2831;
    }
    float _2981 = _2941;
    float _2983 = _2981;
    if (_2841)
    {
        float _2985 = _2971 * _2971;
        _2983 = _2985;
    }
    float _2987 = _2983;
    float _2989 = -_2957;
    float _2991 = _2989 + 1.0;
    float _2993 = fma(_2979, _2979, _2975);
    float _2995 = fma(_2701, (*spvDescriptorSet0.vp_c8)._m0[3].x, _2959);
    float _2997 = abs(_2991);
    float _2999 = log2(_2997);
    float _3001 = _2993 + _2987;
    float _3003 = fma(_2703, (*spvDescriptorSet0.vp_c8)._m0[3].z, _2995);
    float _3005 = fma(_2083, (*spvDescriptorSet0.vp_c15)._m0[652].x, (*spvDescriptorSet0.vp_c15)._m0[652].z);
    float _3007 = rsqrt(_3001);
    float _3009 = _3003 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _3011 = floor(_3005);
    float _3013 = _2999 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _3015 = _3007 * _2951;
    float _3017 = _3007 * _2979;
    float _3019 = _3007 * _2971;
    float _3021 = _3015 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _3023 = exp2(_3013);
    float _3025 = -_3021;
    float _3027 = fma(_3017, (*spvDescriptorSet0.vp_c15)._m0[21].y, _3025);
    float _3029 = -_3011;
    float _3031 = _3005 + _3029;
    float _3033 = _2699 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _3035 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _3037 = -_3019;
    float _3039 = fma(_3037, (*spvDescriptorSet0.vp_c15)._m0[21].z, _3027);
    float _3041 = _2699 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _3043 = fma(_2701, (*spvDescriptorSet0.vp_c8)._m0[1].x, _3033);
    float _3045 = _2699 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _3047 = fma(_3039, -0.5, 0.5);
    float _3049 = fma(_2701, (*spvDescriptorSet0.vp_c8)._m0[0].x, _3041);
    float _3051 = fma(_2703, (*spvDescriptorSet0.vp_c8)._m0[1].z, _3043);
    float _3053 = fma(_2701, (*spvDescriptorSet0.vp_c8)._m0[2].x, _3045);
    float _3055 = fma(_3039, 0.5, 0.5);
    float _3057 = fma(_2703, (*spvDescriptorSet0.vp_c8)._m0[0].z, _3049);
    float _3059 = _3051 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _3061 = fma(_2703, (*spvDescriptorSet0.vp_c8)._m0[2].z, _3053);
    float _3063 = floor(_2791);
    float _3065 = _3057 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _3067 = _3059 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _3069 = _3061 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _3071 = fma(_3065, (*spvDescriptorSet0.vp_c8)._m0[7].x, _3067);
    float _3073 = _3069 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _3075 = fma(_3055, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _3077 = sqrt(_3047);
    float _3079 = fma(_3069, (*spvDescriptorSet0.vp_c8)._m0[7].z, _3071);
    float _3081 = -_3073;
    float _3083 = fma(_3081, _3035, 1.0);
    float _3085 = _3017 + 1.0;
    float _3087 = fma(_3055, _3075, -0.212114393711090087890625);
    float _3089 = fma(_3009, (*spvDescriptorSet0.vp_c8)._m0[7].w, _3079);
    float _3091 = -_3017;
    float _3093 = fma(_3023, _3085, _3091);
    float _3095 = fma(_3055, _3087, 1.570728778839111328125);
    float _3097 = log2(_3083);
    float _3099 = _3059 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _3101 = -_3063;
    float _3103 = _2791 + _3101;
    float _3105 = fma(_3065, (*spvDescriptorSet0.vp_c8)._m0[4].x, _3099);
    float _3107 = _3077 * 0.636619746685028076171875;
    float _3109 = 1.0 / _3089;
    float _3111 = _3059 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _3113 = fma(_3069, (*spvDescriptorSet0.vp_c8)._m0[4].z, _3105);
    float2 _9073 = float2(_3031, _3103);
    float _3115 = dm_bs(spvDescriptorSet0.vp_t_tcb_24.sample(spvDescriptorSet0.vp_t_tcb_24Smplr, select(_9073, float2(0.0), isnan(_9073)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_24, spvDescriptorSet0.vp_t_tcb_24Smplr_w, select(_9073, float2(0.0), isnan(_9073)), level(0.0)).x;
    float _3117 = -_3095;
    float _3119 = fma(_3107, _3117, 1.0);
    float _3121 = fma(_3065, (*spvDescriptorSet0.vp_c8)._m0[5].x, _3111);
    float _3123 = _3097 * 0.693147182464599609375;
    float _3125 = fma(_3069, (*spvDescriptorSet0.vp_c8)._m0[5].z, _3121);
    float _3127 = fma(_3009, (*spvDescriptorSet0.vp_c8)._m0[4].w, _3113);
    float _3129 = _3123 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _3131 = fma(_3009, (*spvDescriptorSet0.vp_c8)._m0[5].w, _3125);
    float _3133 = _3127 * _3109;
    float _3135 = _3131 * _3109;
    float _3137 = fma(_3093, 0.5, 0.5);
    float _3139 = fma(_3133, 0.5, 0.5);
    float _3141 = fma(_3135, -0.5, 0.5);
    float3 _9126 = float3(_3139, _3141, _3129);
    float _3143 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_9126, float3(0.0), isnan(_9126)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_9126, float3(0.0), isnan(_9126)), level(0.0)).x;
    float3 _9137 = float3(_3139, _3141, _3129);
    float4 _3146 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_9137, float3(0.0), isnan(_9137)), level(0.0)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_9137, float3(0.0), isnan(_9137)), level(0.0)).xyzw;
    float _3148 = _3146.x;
    float _3150 = _3146.y;
    float _3152 = _3146.z;
    float _3154 = _3146.w;
    float2 _9153 = float2(_3119, _3137);
    float3 _3158 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_9153, float2(0.0), isnan(_9153)), level(0.0)), spvDescriptorSet0.dm_border, 4u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_9153, float2(0.0), isnan(_9153)), level(0.0)).xyz;
    float _3160 = _3158.x;
    float _3162 = _3158.y;
    float _3164 = _3158.z;
    float _3166 = as_type<float>(_1894) * _2805;
    int _3168 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2097152;
    bool _3170 = _3168 != 0;
    out.m_83.w = _2787;
    int _3172 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _3174 = _3172 != 0;
    float _3176 = -(*spvDescriptorSet0.vp_c9)._m0[170].w;
    float _3178 = _1634 + _3176;
    float _3180 = trunc(_3166);
    float _3182 = precise::max(_3180, 0.0);
    uint _3184 = uint(_3182);
    float _3186 = _2999 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    if (_1672)
    {
        bool _3188 = _172 > 0.5;
        _2585 = _3188;
    }
    bool _3190 = _2585;
    out.m_85.x = _2083;
    out.m_85.y = _2027;
    out.m_85.z = _2015;
    float _3192 = -(*spvDescriptorSet0.vp_c9)._m0[167].x;
    float _3194 = (*spvDescriptorSet0.vp_c9)._m0[168].x + _3192;
    float _3196 = -(*spvDescriptorSet0.vp_c9)._m0[168].x;
    float _3198 = _3196 + (*spvDescriptorSet0.vp_c9)._m0[169].x;
    bool _3200 = _1660 > 0.5;
    float _3202 = _3194 * _2823;
    float _3204 = -(*spvDescriptorSet0.vp_c9)._m0[172].w;
    float _3206 = _3204 + (*spvDescriptorSet0.vp_c9)._m0[173].w;
    float _3208 = _3198 * _2833;
    float _3210 = -(*spvDescriptorSet0.vp_c9)._m0[173].w;
    float _3212 = _3210 + (*spvDescriptorSet0.vp_c9)._m0[174].w;
    int _3214 = ~_1812;
    int _3216 = _3214 + 1;
    float _3218 = -(*spvDescriptorSet0.vp_c9)._m0[170].x;
    float _3220 = _3218 + (*spvDescriptorSet0.vp_c9)._m0[171].x;
    float _3222 = -(*spvDescriptorSet0.vp_c9)._m0[169].x;
    float _3224 = (*spvDescriptorSet0.vp_c9)._m0[170].x + _3222;
    float _3226 = 1.0 / _3212;
    float _3228 = -(*spvDescriptorSet0.vp_c9)._m0[171].x;
    float _3230 = (*spvDescriptorSet0.vp_c9)._m0[172].x + _3228;
    float _3232 = _3220 * _2839;
    int _3234 = _3216 * int(_3184);
    int _3236 = _3234 + _2407;
    float _3238 = _3230 * _2847;
    float _3240 = -(*spvDescriptorSet0.vp_c9)._m0[172].x;
    float _3242 = _3240 + (*spvDescriptorSet0.vp_c9)._m0[173].x;
    float _3244 = _3224 * _2849;
    float _3246 = 1.0 / _3206;
    bool _3248 = _1634 >= (*spvDescriptorSet0.vp_c9)._m0[174].w;
    bool _3250 = isnan(_1634);
    bool _3252 = _3248 || _3250;
    bool _3254 = isnan((*spvDescriptorSet0.vp_c9)._m0[174].w);
    bool _3256 = _3252 || _3254;
    float _3258 = float(_3256);
    float _3260 = -(*spvDescriptorSet0.vp_c9)._m0[173].x;
    float _3262 = (*spvDescriptorSet0.vp_c9)._m0[174].x + _3260;
    float _3264 = float(uint(_3236));
    float _3266 = -(*spvDescriptorSet0.vp_c9)._m0[167].w;
    float _3268 = _1634 + _3266;
    bool _3270 = _1634 >= (*spvDescriptorSet0.vp_c9)._m0[173].w;
    bool _3272 = isnan(_1634);
    bool _3274 = _3270 || _3272;
    bool _3276 = isnan((*spvDescriptorSet0.vp_c9)._m0[173].w);
    bool _3278 = _3274 || _3276;
    float _3280 = float(_3278);
    float _3282 = -_3258;
    float _3284 = _3282 + 1.0;
    bool _3286 = _1634 >= (*spvDescriptorSet0.vp_c9)._m0[170].w;
    bool _3288 = isnan(_1634);
    bool _3290 = _3286 || _3288;
    bool _3292 = isnan((*spvDescriptorSet0.vp_c9)._m0[170].w);
    bool _3294 = _3290 || _3292;
    float _3296 = float(_3294);
    float _3298 = as_type<float>(_1894) * _3264;
    float _3300 = _3262 * _3226;
    float _3302 = _3280 * _3284;
    float _3304 = -_3280;
    float _3306 = _3304 + 1.0;
    bool _3308 = _1634 >= (*spvDescriptorSet0.vp_c9)._m0[172].w;
    bool _3310 = isnan(_1634);
    bool _3312 = _3308 || _3310;
    bool _3314 = isnan((*spvDescriptorSet0.vp_c9)._m0[172].w);
    bool _3316 = _3312 || _3314;
    float _3318 = float(_3316);
    float _3320 = trunc(_3298);
    float _3322 = precise::max(_3320, 0.0);
    uint _3324 = uint(_3322);
    float _3326 = fma(_3202, _3268, (*spvDescriptorSet0.vp_c9)._m0[167].x);
    float _3328 = -(*spvDescriptorSet0.vp_c9)._m0[168].w;
    float _3330 = _1634 + _3328;
    float _3332 = _3242 * _3246;
    bool _3334 = _1634 >= (*spvDescriptorSet0.vp_c9)._m0[171].w;
    bool _3336 = isnan(_1634);
    bool _3338 = _3334 || _3336;
    bool _3340 = isnan((*spvDescriptorSet0.vp_c9)._m0[171].w);
    bool _3342 = _3338 || _3340;
    float _3344 = float(_3342);
    float _3346 = -_3318;
    float _3348 = _3346 + 1.0;
    float _3350 = _3318 * _3306;
    float _3352 = fma(_3208, _3330, (*spvDescriptorSet0.vp_c9)._m0[168].x);
    int _3354 = ~_1812;
    int _3356 = _3354 + 1;
    float _3358 = -_3344;
    float _3360 = _3358 + 1.0;
    float _3362 = _3344 * _3348;
    bool _3364 = _1634 >= (*spvDescriptorSet0.vp_c9)._m0[169].w;
    bool _3366 = isnan(_1634);
    bool _3368 = _3364 || _3366;
    bool _3370 = isnan((*spvDescriptorSet0.vp_c9)._m0[169].w);
    bool _3372 = _3368 || _3370;
    float _3374 = float(_3372);
    float _3376 = -(*spvDescriptorSet0.vp_c9)._m0[169].w;
    float _3378 = _1634 + _3376;
    float _3380 = _3296 * _3360;
    float _3382 = -_3296;
    float _3384 = _3382 + 1.0;
    bool _3386 = _1634 >= (*spvDescriptorSet0.vp_c9)._m0[167].w;
    bool _3388 = isnan(_1634);
    bool _3390 = _3386 || _3388;
    bool _3392 = isnan((*spvDescriptorSet0.vp_c9)._m0[167].w);
    bool _3394 = _3390 || _3392;
    float _3396 = float(_3394);
    float _3398 = fma(_3244, _3378, (*spvDescriptorSet0.vp_c9)._m0[169].x);
    int _3400 = int(_3184) + int(_3324);
    float _3402 = _3374 * _3384;
    bool _3404 = _1634 >= (*spvDescriptorSet0.vp_c9)._m0[168].w;
    bool _3406 = isnan(_1634);
    bool _3408 = _3404 || _3406;
    bool _3410 = isnan((*spvDescriptorSet0.vp_c9)._m0[168].w);
    bool _3412 = _3408 || _3410;
    float _3414 = float(_3412);
    float _3416 = -_3374;
    float _3418 = _3416 + 1.0;
    float _3420 = fma(_3232, _3178, (*spvDescriptorSet0.vp_c9)._m0[170].x);
    int _3422 = _3356 * _3400;
    int _3424 = _3422 + _2407;
    float _3426 = -(*spvDescriptorSet0.vp_c9)._m0[171].w;
    float _3428 = _1634 + _3426;
    float _3430 = _3414 * _3418;
    float _3432 = -_3414;
    float _3434 = _3432 + 1.0;
    float _3436 = float(uint(_2311));
    float _3438 = in.m_87.x;
    float _3440 = in.m_87.y;
    bool _3442 = uint(_3424) >= uint(_1812);
    float _3444 = _3396 * _3434;
    float _3446 = fma(_3238, _3428, (*spvDescriptorSet0.vp_c9)._m0[171].x);
    float _3448 = as_type<float>(_1894) * _3436;
    bool _3450 = !_3442;
    int _3452 = _3450 ? 0 : (-1);
    float _3454 = _3326 * _3444;
    float _3456 = -_3396;
    float _3458 = _3456 + 1.0;
    if (_3174)
    {
        float _3460 = _3200 ? _1676 : _1636;
        _1688 = _3460;
    }
    float _3462 = _1688;
    float _3464 = exp2(_3186);
    int _3466 = ~_3400;
    int _3468 = _3466 + _3452;
    int _3470 = _3468 + 1;
    float _3472 = fma(_3458, (*spvDescriptorSet0.vp_c9)._m0[167].x, _3454);
    float _3474 = -(*spvDescriptorSet0.vp_c9)._m0[172].w;
    float _3476 = _1634 + _3474;
    float _3478 = -(*spvDescriptorSet0.vp_c9)._m0[173].w;
    float _3480 = _1634 + _3478;
    int _3482 = ~_1812;
    int _3484 = _3482 + 1;
    int _3486 = _1812 * _3470;
    int _3488 = _3486 + _2407;
    float _3490 = fma(_3352, _3430, _3472);
    float _3492 = trunc(_3448);
    float _3494 = precise::max(_3492, 0.0);
    uint _3496 = uint(_3494);
    float _3498 = fma(_3332, _3476, (*spvDescriptorSet0.vp_c9)._m0[172].x);
    float _3500 = fma(_3300, _3480, (*spvDescriptorSet0.vp_c9)._m0[173].x);
    bool _3502 = !_2261;
    int _3504 = _3502 ? _3488 : (-1);
    float _3506 = fma(_3398, _3402, _3490);
    float _3508 = _3059 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _3510 = _2319 * _3440;
    float _3512 = _2335 * _3440;
    float _3514 = in.m_89.x;
    float _3516 = in.m_89.y;
    int _3518 = as_type<int>(_3440);
    if (_1672)
    {
        float _3520 = -_1650;
        float _3522 = _3520 + 1.0;
        _3518 = as_type<int>(_3522);
    }
    int _3524 = _3518;
    float _3526 = -_3510;
    float _3528 = fma(_2335, _3438, _3526);
    float _3530 = fma(_2319, _3438, _3512);
    int _3532 = _3504 >> 31;
    float _3534 = fma(_3420, _3380, _3506);
    if (_1672)
    {
        float _3536 = _3190 ? as_type<float>(_3524) : _1650;
        _1952 = _3536;
    }
    float _3538 = _1952;
    int _3540 = _3484 * int(_3496);
    int _3542 = _3540 + _2311;
    int _3544 = _3532 & 3;
    float _3546 = fma(_3446, _3362, _3534);
    float _3548 = abs(_2713);
    float _3550 = log2(_3548);
    int _3552 = _3504 + _3544;
    float _3554 = fma(_3498, _3350, _3546);
    float _3556 = float(uint(_3542));
    float _3558 = fma((*spvDescriptorSet0.vp_c9)._m0[80].y, _3462, -0.5);
    int _3560 = _3552 >> 2;
    float _3562 = fma(_3500, _3302, _3554);
    float _3564 = as_type<float>(_1894) * _3556;
    int _3566 = _3560 << 4;
    int _3568 = _3566 + 368;
    float _3570 = fma(_3258, (*spvDescriptorSet0.vp_c9)._m0[174].x, _3562);
    int _3572 = _3504 & 3;
    bool _3574 = _3572 != 0;
    float _3576 = fma(_3538, (*spvDescriptorSet0.vp_c9)._m0[80].x, -0.5);
    float _3578 = _2319 * _3516;
    uint _3580 = uint(int(uint(_3568) >> uint(2)));
    uint _3582 = uint(int(uint(int(_3580)) >> uint(2)));
    int _3584 = int(_3580) & 3;
    float _3586 = (*spvDescriptorSet0.vp_c9)._m0[int(_3582)][_3584];
    int _3588 = int(_3580) + 1;
    uint _3590 = uint(int(uint(_3588) >> uint(2)));
    int _3592 = _3588 & 3;
    float _3594 = (*spvDescriptorSet0.vp_c9)._m0[int(_3590)][_3592];
    float _3596 = _2335 * _3516;
    float _3598 = trunc(_3564);
    float _3600 = precise::max(_3598, 0.0);
    uint _3602 = uint(_3600);
    float _3604 = -_3578;
    float _3606 = fma(_2335, _3514, _3604);
    float _3608 = fma(_2203, _3576, _2207);
    float _3610 = fma(_2319, _3514, _3596);
    int _3612 = _3504 & 3;
    bool _3614 = _3612 != 0;
    float _3616 = _3550 * (*spvDescriptorSet0.vp_c15)._m0[654].z;
    int _3618 = _3568 + 8;
    uint _3620 = uint(int(uint(_3618) >> uint(2)));
    uint _3622 = uint(int(uint(int(_3620)) >> uint(2)));
    int _3624 = int(_3620) & 3;
    float _3626 = (*spvDescriptorSet0.vp_c9)._m0[int(_3622)][_3624];
    int _3628 = int(_3620) + 1;
    uint _3630 = uint(int(uint(_3628) >> uint(2)));
    int _3632 = _3628 & 3;
    float _3634 = (*spvDescriptorSet0.vp_c9)._m0[int(_3630)][_3632];
    int _3636 = ~_1812;
    int _3638 = _3636 + 1;
    float _3640 = -_2231;
    float _3642 = fma(_2213, _3558, _3640);
    bool _3644 = uint(_3612) > 1u;
    float _3646 = _2435 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    bool _3648 = _3612 != 3;
    float _3650 = _2435 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    bool _3652 = uint(_3612) >= 2u;
    float _3654 = _2435 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _3656 = _2455 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    int _3658 = int(_3496) + int(_3602);
    float _3660 = _2455 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _3662 = exp2(_3616);
    int _3664 = _3652 ? 0 : 1;
    float _3666 = -_2431;
    float _3668 = fma(_3666, (*spvDescriptorSet0.vp_c8)._m0[24].x, _3646);
    float _3670 = -_2431;
    float _3672 = fma(_3670, (*spvDescriptorSet0.vp_c8)._m0[25].x, _3650);
    float _3674 = -_2431;
    float _3676 = fma(_3674, (*spvDescriptorSet0.vp_c8)._m0[26].x, _3654);
    int _3678 = ~_3664;
    int _3680 = _3678 + 1;
    int _3682 = _3680 + 1;
    float _3684 = fma(_2451, (*spvDescriptorSet0.vp_c8)._m0[24].z, _3668);
    int _3686 = _3682;
    if (_3648)
    {
        int _3688 = ~_3664;
        int _3690 = _3688 + 1;
        _3686 = _3690;
    }
    int _3692 = _3686;
    float _3694 = fma(_2451, (*spvDescriptorSet0.vp_c8)._m0[25].z, _3672);
    int _3696 = _3638 * _3658;
    int _3698 = _3696 + _2311;
    int _3700 = _3574 ? 0 : 1;
    float _3702 = fma(_2451, (*spvDescriptorSet0.vp_c8)._m0[26].z, _3676);
    float _3704 = _2443 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    int _3706 = ~_3700;
    int _3708 = _3706 + 1;
    int _3710 = _3708 + 1;
    float _3712 = fma(_2433, (*spvDescriptorSet0.vp_c8)._m0[25].x, _3656);
    int _3714 = _3710;
    if (!_3644)
    {
        int _3716 = ~_3700;
        int _3718 = _3716 + 1;
        _3714 = _3718;
    }
    int _3720 = _3714;
    float _3722 = fma(_3662, (*spvDescriptorSet0.vp_c15)._m0[654].x, (*spvDescriptorSet0.vp_c15)._m0[654].y);
    float _3724 = precise::clamp(_3722, 0.0, 1.0);
    bool _3726 = !_3614;
    int _3728 = _3726 ? 0 : 1;
    float _3730 = fma(_2439, (*spvDescriptorSet0.vp_c8)._m0[25].z, _3712);
    bool _3732 = uint(_3698) >= uint(_1812);
    float _3734 = _2455 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    int _3736 = abs(_3720);
    float _3738 = -_3464;
    float _3740 = _3738 + 1.0;
    int _3742 = abs(_3728);
    float _3744 = fma(_2433, (*spvDescriptorSet0.vp_c8)._m0[24].x, _3734);
    int _3746 = ~_3736;
    int _3748 = _3746 + 1;
    int _3750 = _3748 + 1;
    float _3752 = fma(_2433, (*spvDescriptorSet0.vp_c8)._m0[26].x, _3660);
    bool _3754 = _3612 != 3;
    float _3756 = _3740 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    int _3758 = _3750 * as_type<int>(_3594);
    bool _3760 = !_3754;
    int _3762 = _3760 ? 0 : (-1);
    float _3764 = fma(_2439, (*spvDescriptorSet0.vp_c8)._m0[26].z, _3752);
    int _3766 = ~_3742;
    int _3768 = _3766 + 1;
    int _3770 = _3768 + 1;
    float _3772 = fma(_3065, (*spvDescriptorSet0.vp_c8)._m0[6].x, _3508);
    int _3774 = abs(_3692);
    out.m_91.x = _3570;
    bool _3776 = !_3170;
    int _3778 = _3776 ? 0 : 1;
    int _3780 = _3770 * as_type<int>(_3586);
    int _3782 = _3780 + _3758;
    int _3784 = abs(_3762);
    float _3786 = _2443 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    bool _3788 = !_3732;
    int _3790 = _3788 ? 0 : (-1);
    out.m_93.x = _2701;
    out.m_93.y = _2699;
    out.m_93.z = _2703;
    int _3792 = ~_3774;
    int _3794 = _3792 + 1;
    int _3796 = _3794 + 1;
    int _3798 = abs(_3778);
    int _3800 = _3796 * as_type<int>(_3626);
    int _3802 = _3800 + _3782;
    int _3804 = ~_3658;
    int _3806 = _3804 + _3790;
    int _3808 = _3806 + 1;
    float _3810 = in.m_87.z;
    int _3812 = ~_3784;
    int _3814 = _3812 + 1;
    int _3816 = _3814 + 1;
    bool _3818 = _2465 != 0.0;
    bool _3820 = isnan(_2465);
    bool _3822 = _3818 || _3820;
    bool _3824 = isnan(0.0);
    bool _3826 = _3822 || _3824;
    int _3828 = _1812 * _3808;
    int _3830 = _3828 + _2311;
    int _3832 = ~_3798;
    int _3834 = _3832 + 1;
    int _3836 = _3834 + 1;
    int _3838 = _3816 * as_type<int>(_3634);
    int _3840 = _3838 + _3802;
    float _3842 = fma(_2453, (*spvDescriptorSet0.vp_c8)._m0[25].x, _3786);
    float _3844 = _2443 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    bool _3846 = !_2261;
    int _3848 = _3846 ? _3830 : (-1);
    int _3850 = _3840 * _3836;
    bool _3852 = _2467 == 0.0;
    bool _3854 = !_3826;
    bool _3856 = _3852 && _3854;
    float _3858 = fma(_2453, (*spvDescriptorSet0.vp_c8)._m0[24].x, _3844);
    float _3860 = fma(_2453, (*spvDescriptorSet0.vp_c8)._m0[26].x, _3704);
    int _3862 = _3848 * _3798;
    int _3864 = _3862 + _3850;
    float _3866 = in.m_89.z;
    float _3868 = in.m_89.w;
    bool _3870 = _2469 == 0.0;
    bool _3872 = _3870 && _3856;
    float _3874 = fma(_2439, (*spvDescriptorSet0.vp_c8)._m0[24].z, _3744);
    float _3876 = float(_3864);
    float _3878 = fma(_3724, -2.0, 3.0);
    float _3880 = _3724 * _3724;
    float _3882 = fma(_2461, (*spvDescriptorSet0.vp_c8)._m0[24].z, _3858);
    float _3884 = fma(_2461, (*spvDescriptorSet0.vp_c8)._m0[25].z, _3842);
    float _3886 = _3608 + 0.5;
    float _3888 = _3610 * _3694;
    float _3890 = _3880 * _3878;
    float _3892 = _3610 * _3684;
    float _3894 = _3610 * _3702;
    float _3896 = _3642 + 0.5;
    float _3898 = fma(_3606, _3730, _3888);
    float _3900 = fma(_2461, (*spvDescriptorSet0.vp_c8)._m0[26].z, _3860);
    float _3902 = fma(_3606, _3874, _3892);
    float _3904 = fma(_3606, _3764, _3894);
    float _3906 = -_3890;
    float _3908 = _3906 + 1.0;
    out.m_95.x = _3886;
    out.m_95.y = _3896;
    out.m_95.z = _1772;
    out.m_95.w = _1770;
    float _3910 = _3904;
    if (_3872)
    {
        _2049 = _3530;
    }
    float _3912 = _2049;
    float _3914 = _3912;
    if (!_3872)
    {
        float _3916 = fma(_2465, (*spvDescriptorSet0.vp_c9)._m0[17].y, _3530);
        _3914 = _3916;
    }
    float _3918 = _3914;
    float _3920 = fma(_3908, (*spvDescriptorSet0.vp_c15)._m0[654].w, _3890);
    out.m_97.x = _3876;
    float _3922 = fma(_3884, _3866, _3898);
    float _3924 = fma(_3900, _3866, _3904);
    float _3926 = _3530 * _3606;
    float _3928 = in.m_99.x;
    bool _3930 = _2713 <= 8000.0;
    bool _3932 = isnan(_2713);
    bool _3934 = _3930 || _3932;
    bool _3936 = isnan(8000.0);
    bool _3938 = _3934 || _3936;
    float _3940 = float(_3938);
    if (_3872)
    {
        _3910 = _3528;
    }
    float _3942 = _3910;
    float _3944 = fma(_3882, _3866, _3902);
    float _3946 = _3942;
    if (!_3872)
    {
        float _3948 = fma(_2467, (*spvDescriptorSet0.vp_c9)._m0[17].y, _3528);
        _3946 = _3948;
    }
    float _3950 = _3946;
    float _3952 = _3528 * _3866;
    float _3954 = _3610 * _3810;
    float _3956 = _3940 * _3920;
    out.m_101.x = _3944;
    out.m_101.y = _3922;
    out.m_101.z = _3924;
    float _3958 = -_3952;
    float _3960 = fma(_3606, _3810, _3958);
    float _3962 = -_3954;
    float _3964 = fma(_3530, _3866, _3962);
    float _3966 = _3702 * _3918;
    if (_3872)
    {
        _2717 = _3810;
    }
    float _3968 = _2717;
    float _3970 = _3960 * _3868;
    float _3972 = _3968;
    if (!_3872)
    {
        float _3974 = fma(_2469, (*spvDescriptorSet0.vp_c9)._m0[17].y, _3810);
        _3972 = _3974;
    }
    float _3976 = _3972;
    float _3978 = _3684 * _3918;
    float _3980 = -_3926;
    float _3982 = fma(_3528, _3610, _3980);
    float _3984 = _3964 * _3868;
    float _3986 = _3970 * _3684;
    float _3988 = _3970 * _3702;
    float _3990 = _3694 * _3918;
    float _3992 = _3970 * _3694;
    float _3994 = fma(_3764, _3950, _3966);
    float _3996 = _3956 * (*spvDescriptorSet0.vp_c15)._m0[653].x;
    float _3998 = fma(_3730, _3950, _3990);
    float _4000 = fma(_3874, _3950, _3978);
    float _4002 = _3982 * _3868;
    float _4004 = fma(_3984, _3874, _3986);
    float _4006 = fma(_3884, _3976, _3998);
    float _4008 = fma(_3984, _3730, _3992);
    float _4010 = fma(_3984, _3764, _3988);
    float _4012 = fma(_3900, _3976, _3994);
    float _4014 = fma(_4002, _3882, _4004);
    float _4016 = fma(_4002, _3884, _4008);
    float _4018 = fma(_4002, _3900, _4010);
    float _4020 = fma(_3069, (*spvDescriptorSet0.vp_c8)._m0[6].z, _3772);
    float _4022 = -_3115;
    float _4024 = _4022 + 1.0;
    float _4026 = fma(_3882, _3976, _4000);
    bool _4028 = _2811 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _4030 = isnan(_2811);
    bool _4032 = _4028 || _4030;
    bool _4034 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _4036 = _4032 || _4034;
    out.m_103.x = _4014;
    out.m_103.y = _4016;
    out.m_103.z = _4018;
    float _4038 = _4024 * _3996;
    float _4040 = precise::clamp(_4038, 0.0, 1.0);
    float _4042 = fma(_3009, (*spvDescriptorSet0.vp_c8)._m0[6].w, _4020);
    float _4044 = _3127 + _3089;
    out.m_105.x = _4026;
    out.m_105.y = _4006;
    out.m_105.z = _4012;
    float _4046 = -_4040;
    float _4048 = fma(_4046, (*spvDescriptorSet0.vp_c15)._m0[653].y, 1.0);
    float _4050 = _4042 + _3089;
    float _4052 = _3089 * 0.5;
    out.gl_Position.x = _3127;
    out.gl_Position.y = _3131;
    out.gl_Position.z = _4042;
    out.gl_Position.w = _3089;
    float _4054 = _4048 * _3928;
    float _4056 = _4050 * 0.5;
    float _4058 = -_3756;
    float _4060 = _4058 + 1.0;
    float _4062 = _4054 * (*spvDescriptorSet0.vp_c13)._m0[1].w;
    float _4064 = _4044 * 0.5;
    float _4066 = fma(_3131, -0.5, _4052);
    float _4068 = _4018;
    float _4070 = _4060;
    if (!_4036)
    {
        _4068 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _4072 = _4068;
    out.m_107.x = _4062;
    float _4074 = _3756 * _3143;
    float _4076 = _3154 * _4060;
    float _4078 = _4072;
    float _4080 = _4072;
    if (!_4036)
    {
        _4070 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _4082 = _4070;
    out.m_109.x = _4064;
    out.m_109.y = _4066;
    out.m_109.z = _4056;
    out.m_109.w = _3089;
    float _4084 = _3154 * _4074;
    float _4086 = _3164 * _4074;
    float _4088 = fma(_3160, _4084, _3148);
    float _4090 = fma(_3162, _4084, _3150);
    float _4092 = fma(_3154, _4086, _3152);
    float _4094 = _4084;
    float _4096 = _4082;
    float _4098 = _4082;
    if (!_4036)
    {
        _4094 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _4100 = _4094;
    out.m_111.x = _4088;
    out.m_111.y = _4090;
    out.m_111.z = _4092;
    out.m_111.w = _4076;
    float _4102 = _2771 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    bool _4104 = !_4036;
    float _4106 = _4100;
    float _4108 = _4100;
    if (!_4104)
    {
        bool _4110 = _2811 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _4112 = isnan(_2811);
        bool _4114 = _4110 || _4112;
        bool _4116 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _4118 = _4114 || _4116;
        if (!_4118)
        {
            float _4120 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _4122 = _2811 + _4120;
            float _4124 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _4126 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _4124;
            float _4128 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _4130 = _4128 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _4132 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _4134 = _4132 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _4136 = 1.0 / _4126;
            float _4138 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _4140 = _4138 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _4142 = _4122 * _4136;
            float _4144 = precise::clamp(_4142, 0.0, 1.0);
            float _4146 = fma(_4144, _4130, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _4148 = fma(_4144, _4134, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _4150 = fma(_4144, _4140, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            _4108 = _4148;
            _4080 = _4146;
            _4098 = _4150;
            _4152 = true;
        }
        else
        {
            bool _4154 = _2811 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _4156 = isnan(_2811);
            bool _4158 = _4154 || _4156;
            bool _4160 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _4162 = _4158 || _4160;
            if (!_4162)
            {
                _4078 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _4164 = _4078;
            _4080 = _4164;
            if (!_4162)
            {
                _4106 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _4166 = _4106;
            _4108 = _4166;
            if (!_4162)
            {
                _4096 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _4168 = _4096;
            bool _4170 = !_4162;
            _4098 = _4168;
            if (!_4170)
            {
                bool _4172 = _2811 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _4174 = isnan(_2811);
                bool _4176 = _4172 || _4174;
                bool _4178 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _4180 = _4176 || _4178;
                if (!_4180)
                {
                    float _4182 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _4184 = _2811 + _4182;
                    float _4186 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _4188 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _4186;
                    float _4190 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _4192 = _4190 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _4194 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _4196 = _4194 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _4198 = 1.0 / _4188;
                    float _4200 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _4202 = _4200 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _4204 = _4184 * _4198;
                    float _4206 = precise::clamp(_4204, 0.0, 1.0);
                    float _4208 = fma(_4206, _4192, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _4210 = fma(_4206, _4196, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _4212 = fma(_4206, _4202, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    _4108 = _4210;
                    _4080 = _4208;
                    _4098 = _4212;
                    _4152 = true;
                }
                else
                {
                    _4108 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _4080 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _4098 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                }
            }
        }
    }
    _4152 = false;
    float _4214 = _4108;
    float _4216 = _4080;
    float _4218 = _4098;
    float _4220 = _4102 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    out.m_113.x = 0.0;
    float _4222 = _4214 * 0.586610972881317138671875;
    bool _4224 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    out.m_55.x = _4220;
    float _4226 = fma(_4216, 0.298911988735198974609375, _4222);
    bool _4228 = _2771 > 0.0;
    bool _4230 = isnan(_2771);
    bool _4232 = _4228 || _4230;
    bool _4234 = isnan(0.0);
    bool _4236 = _4232 || _4234;
    float _4238 = fma(_4218, 0.114477999508380889892578125, _4226);
    float _4240 = -_4238;
    float _4242 = _4240 + _4216;
    float _4244 = -_4238;
    float _4246 = _4244 + _4214;
    float _4248 = -_4238;
    float _4250 = _4248 + _4218;
    float _4252 = fma(_4242, (*spvDescriptorSet0.vp_c13)._m0[1].z, _4238);
    float _4254 = fma(_4246, (*spvDescriptorSet0.vp_c13)._m0[1].z, _4238);
    float _4256 = fma(_4250, (*spvDescriptorSet0.vp_c13)._m0[1].z, _4238);
    bool _4258 = !_4224;
    if (!_4258)
    {
        float _4260 = -_2699;
        float _4262 = _4260 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
        float _4264 = -_2701;
        float _4266 = _4264 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
        float _4268 = -_2703;
        float _4270 = _4268 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
        float _4272 = _4262 * _4262;
        float _4274 = fma(_4266, _4266, _4272);
        float _4276 = fma(_4270, _4270, _4274);
        float _4278 = sqrt(_4276);
        float _4280 = rsqrt(_4276);
        float _4282 = -_4278;
        float _4284 = _4282 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
        float _4286 = _4284 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
        float _4288 = precise::clamp(_4286, 0.0, 1.0);
        float _4290 = _4266 * _4280;
        float _4292 = _4262 * _4280;
        float _4294 = abs(_4288);
        float _4296 = log2(_4294);
        float _4298 = _4270 * _4280;
        float _4300 = _4290 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
        float _4302 = _4006 * _4292;
        float _4304 = -_4292;
        float _4306 = -_4300;
        float _4308 = fma(_4304, (*spvDescriptorSet0.vp_c15)._m0[656].y, _4306);
        float _4310 = fma(_4026, _4290, _4302);
        float _4312 = -_4298;
        float _4314 = fma(_4312, (*spvDescriptorSet0.vp_c15)._m0[656].z, _4308);
        float _4316 = fma(_4012, _4298, _4310);
        float _4318 = precise::clamp(_4316, 0.0, 1.0);
        float _4320 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
        float _4322 = _4314 + _4320;
        float _4324 = _4296 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
        float _4326 = _4322 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
        float _4328 = precise::clamp(_4326, 0.0, 1.0);
        float _4330 = exp2(_4324);
        float _4332 = _4330 * _4328;
        float _4334 = _4318 * _4332;
        float _4336 = _4334 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
        float _4338 = _4334 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
        float _4340 = _4334 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
        out.m_113.x = _4336;
        out.m_113.y = _4338;
        out.m_113.z = _4340;
    }
    out.m_115.x = _4252;
    out.m_115.y = _4254;
    out.m_115.z = _4256;
    if (_4236)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    out.m_55.x = 0.0;
    float _4342 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _4342;
    out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
}


vertex main0_out main0_z(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]])
{
    main0_out out = {};
    out.m_63 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_65 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_91 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_53 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_97 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_103 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_85 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_105 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_95 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_93 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_83 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_109 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_55 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_59 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_101 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_113 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_107 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_111 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_115 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_67 = float4(0.0, 0.0, 0.0, 1.0);
    bool _4152 = false;
    bool _1260 = false;
    bool _1164 = false;
    bool _1004 = false;
    bool _794 = false;
    bool _622 = false;
    bool _300 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _129 = in.m_48.w;
    float _131 = in.m_50.w;
    float _133 = trunc(_129);
    int _136 = int(_133);
    float _138 = -_131;
    float _140 = _138 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    out.m_53.y = _140;
    bool _144 = _136 >= 1;
    float _146 = 0.0;
    float _148 = _131;
    float _150 = _140;
    if (!_144)
    {
        _146 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _152 = _146;
    if (!_144)
    {
        out.m_55.x = 0.0;
    }
    int _154 = 0;
    if (!_144)
    {
        float _156 = _152 * 5.0;
        _154 = as_type<int>(_156);
    }
    int _158 = _154;
    int _160 = _158;
    if (!_144)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _4410 = as_type<float>(_158);
        out.gl_Position.z = _4410;
    }
    if (!_144)
    {
        return out;
    }
    bool _162 = _131 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _164 = isnan(_131);
    bool _166 = _162 || _164;
    bool _168 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _170 = _166 || _168;
    float _172 = in.m_57.x;
    float _174 = float(_136);
    bool _176 = _140 >= _174;
    bool _178 = !_170;
    bool _180 = _176 || _178;
    float _182 = 1.0 / _174;
    if (_180)
    {
        _148 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _184 = _148;
    if (_180)
    {
        out.m_55.x = 0.0;
    }
    float _186 = _140 * _182;
    float _188 = _186;
    if (_180)
    {
        float _190 = _184 * 5.0;
        _160 = as_type<int>(_190);
    }
    int _192 = _160;
    out.m_59.x = _172;
    if (_180)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _4475 = as_type<float>(_192);
        out.gl_Position.z = _4475;
    }
    out.m_53.x = _186;
    if (_180)
    {
        return out;
    }
    float _194 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[19].z;
    float _196 = _140 + (*spvDescriptorSet0.vp_c9)._m0[20].z;
    int _198 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 2;
    bool _200 = _198 != 0;
    int _202 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 4;
    bool _204 = _202 != 0;
    int _206 = 1 & as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x);
    bool _208 = _206 != 0;
    float _210 = _196 * _194;
    float _212 = fma(_172, (*spvDescriptorSet0.vp_c9)._m0[20].x, _210);
    float _214 = _212 * 6.283185482025146484375;
    float _216 = floor(_212);
    float _218 = _214 * 0.15915493667125701904296875;
    bool _220 = !_200;
    int _222 = _220 ? 0 : 1;
    int _224 = abs(_222);
    float _226 = _218 * 6.283185482025146484375;
    float _228 = cos(_226);
    bool _230 = !_208;
    int _232 = _230 ? 0 : 1;
    bool _234 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    int _236 = abs(_232);
    float _238 = -_216;
    float _240 = _212 + _238;
    float _242 = float(_224);
    float _244 = -_240;
    float _246 = fma(_244, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    bool _248 = !_204;
    int _250 = _248 ? 0 : 1;
    float _252 = abs(_246);
    float _254 = _242 * _252;
    float _256 = fma(_228, 0.5, 0.5);
    int _258 = abs(_250);
    bool _260 = _240 < 0.5;
    float _262 = float(_260);
    float _264 = -_256;
    float _266 = fma(_264, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    float _268 = float(_236);
    float _270 = float(_258);
    float _272 = -_262;
    float _274 = fma(_272, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    float _276 = fma(_268, _266, _254);
    float _278 = abs(_274);
    float _280 = fma(_270, _278, _276);
    bool _282 = !_234;
    float _298;
    if (!_282)
    {
        float _284 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _286 = _172 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _288 = fma(_286, (*spvDescriptorSet0.vp_c9)._m0[12].x, _140);
        float _290 = _288 * _284;
        float _292 = floor(_290);
        float _294 = -_292;
        float _296 = _290 + _294;
        _298 = _296;
        _300 = true;
    }
    else
    {
        _298 = _186;
    }
    _300 = false;
    float _302 = _298;
    float _304 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _306 = _302 + _304;
    float _308 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _310 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _308;
    float _312 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _314 = _312 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _316 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _318 = (*spvDescriptorSet0.vp_c9)._m0[146].w + _316;
    float _320 = -(*spvDescriptorSet0.vp_c9)._m0[146].w;
    float _322 = _320 + (*spvDescriptorSet0.vp_c9)._m0[147].w;
    float _324 = 1.0 / _310;
    float _326 = -(*spvDescriptorSet0.vp_c9)._m0[147].w;
    float _328 = (*spvDescriptorSet0.vp_c9)._m0[148].w + _326;
    float _330 = 1.0 / _318;
    float _332 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _334 = _302 + _332;
    bool _336 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].x;
    float _338 = 1.0 / _314;
    float _340 = _334 * _324;
    float _342 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _344 = _302 + _342;
    bool _346 = _302 >= (*spvDescriptorSet0.vp_c9)._m0[147].w;
    bool _348 = isnan(_302);
    bool _350 = _346 || _348;
    bool _352 = isnan((*spvDescriptorSet0.vp_c9)._m0[147].w);
    bool _354 = _350 || _352;
    float _356 = float(_354);
    float _358 = -(*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _360 = (*spvDescriptorSet0.vp_c9)._m0[144].z + _358;
    float _362 = 1.0 / _322;
    float _364 = _344 * _330;
    bool _366 = _302 >= (*spvDescriptorSet0.vp_c9)._m0[148].w;
    bool _368 = isnan(_302);
    bool _370 = _366 || _368;
    bool _372 = isnan((*spvDescriptorSet0.vp_c9)._m0[148].w);
    bool _374 = _370 || _372;
    float _376 = float(_374);
    float _378 = -(*spvDescriptorSet0.vp_c9)._m0[146].w;
    float _380 = _302 + _378;
    bool _382 = _302 >= (*spvDescriptorSet0.vp_c9)._m0[146].w;
    bool _384 = isnan(_302);
    bool _386 = _382 || _384;
    bool _388 = isnan((*spvDescriptorSet0.vp_c9)._m0[146].w);
    bool _390 = _386 || _388;
    float _392 = float(_390);
    float _394 = fma(_360, _340, (*spvDescriptorSet0.vp_c9)._m0[143].z);
    float _396 = 1.0 / _328;
    float _398 = _306 * _338;
    float _400 = -(*spvDescriptorSet0.vp_c9)._m0[147].w;
    float _402 = _302 + _400;
    bool _404 = _302 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _406 = isnan(_302);
    bool _408 = _404 || _406;
    bool _410 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _412 = _408 || _410;
    float _414 = float(_412);
    float _416 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _418 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _416;
    float _420 = _380 * _362;
    float _422 = -_376;
    float _424 = _422 + 1.0;
    float _426 = -_414;
    float _428 = _426 + 1.0;
    bool _430 = _302 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _432 = isnan(_302);
    bool _434 = _430 || _432;
    bool _436 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _438 = _434 || _436;
    float _440 = float(_438);
    float _442 = fma(_418, _340, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _444 = _356 * _424;
    float _446 = -_356;
    float _448 = _446 + 1.0;
    float _450 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _452 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _450;
    float _454 = _402 * _396;
    bool _456 = _302 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _458 = isnan(_302);
    bool _460 = _456 || _458;
    bool _462 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _464 = _460 || _462;
    float _466 = float(_464);
    float _468 = _392 * _448;
    float _470 = -_392;
    float _472 = _470 + 1.0;
    float _474 = fma(_452, _340, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _476 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _478 = _476 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _480 = _466 * _428;
    float _482 = -_466;
    float _484 = _482 + 1.0;
    float _486 = _414 * _472;
    float _488 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _490 = _488 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _492 = -(*spvDescriptorSet0.vp_c9)._m0[144].z;
    float _494 = _492 + (*spvDescriptorSet0.vp_c9)._m0[145].z;
    float _496 = _440 * _484;
    float _498 = -_440;
    float _500 = _498 + 1.0;
    float _502 = fma(_478, _398, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _504 = _442 * _496;
    float _506 = fma(_490, _398, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _508 = fma(_494, _398, (*spvDescriptorSet0.vp_c9)._m0[144].z);
    float _510 = _474 * _496;
    float _512 = _394 * _496;
    float _514 = -(*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _516 = (*spvDescriptorSet0.vp_c9)._m0[146].x + _514;
    float _518 = fma(_500, (*spvDescriptorSet0.vp_c9)._m0[143].x, _504);
    float _520 = fma(_500, (*spvDescriptorSet0.vp_c9)._m0[143].y, _510);
    float _522 = fma(_500, (*spvDescriptorSet0.vp_c9)._m0[143].z, _512);
    float _524 = -(*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _526 = (*spvDescriptorSet0.vp_c9)._m0[146].y + _524;
    float _528 = -(*spvDescriptorSet0.vp_c9)._m0[146].y;
    float _530 = _528 + (*spvDescriptorSet0.vp_c9)._m0[147].y;
    float _532 = -(*spvDescriptorSet0.vp_c9)._m0[146].z;
    float _534 = _532 + (*spvDescriptorSet0.vp_c9)._m0[147].z;
    float _536 = fma(_516, _364, (*spvDescriptorSet0.vp_c9)._m0[145].x);
    float _538 = fma(_502, _480, _518);
    float _540 = -(*spvDescriptorSet0.vp_c9)._m0[146].x;
    float _542 = _540 + (*spvDescriptorSet0.vp_c9)._m0[147].x;
    float _544 = -(*spvDescriptorSet0.vp_c9)._m0[145].z;
    float _546 = (*spvDescriptorSet0.vp_c9)._m0[146].z + _544;
    float _548 = fma(_534, _420, (*spvDescriptorSet0.vp_c9)._m0[146].z);
    float _550 = fma(_508, _480, _522);
    float _552 = fma(_536, _486, _538);
    float _554 = fma(_526, _364, (*spvDescriptorSet0.vp_c9)._m0[145].y);
    float _556 = fma(_530, _420, (*spvDescriptorSet0.vp_c9)._m0[146].y);
    float _558 = fma(_506, _480, _520);
    float _560 = fma(_546, _364, (*spvDescriptorSet0.vp_c9)._m0[145].z);
    float _562 = fma(_554, _486, _558);
    float _564 = -(*spvDescriptorSet0.vp_c9)._m0[147].x;
    float _566 = (*spvDescriptorSet0.vp_c9)._m0[148].x + _564;
    float _568 = fma(_542, _420, (*spvDescriptorSet0.vp_c9)._m0[146].x);
    float _570 = -(*spvDescriptorSet0.vp_c9)._m0[147].y;
    float _572 = (*spvDescriptorSet0.vp_c9)._m0[148].y + _570;
    float _574 = fma(_560, _486, _550);
    float _576 = -(*spvDescriptorSet0.vp_c9)._m0[147].z;
    float _578 = (*spvDescriptorSet0.vp_c9)._m0[148].z + _576;
    float _580 = fma(_566, _454, (*spvDescriptorSet0.vp_c9)._m0[147].x);
    float _582 = fma(_572, _454, (*spvDescriptorSet0.vp_c9)._m0[147].y);
    float _584 = fma(_556, _468, _562);
    float _586 = fma(_568, _468, _552);
    float _588 = fma(_578, _454, (*spvDescriptorSet0.vp_c9)._m0[147].z);
    float _590 = fma(_548, _468, _574);
    float _592 = fma(_582, _444, _584);
    float _594 = fma(_580, _444, _586);
    float _596 = fma(_588, _444, _590);
    float _598 = fma(_376, (*spvDescriptorSet0.vp_c9)._m0[148].y, _592);
    float _600 = fma(_376, (*spvDescriptorSet0.vp_c9)._m0[148].x, _594);
    float _602 = fma(_376, (*spvDescriptorSet0.vp_c9)._m0[148].z, _596);
    bool _604 = !_336;
    float _620;
    if (!_604)
    {
        float _606 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].x;
        float _608 = _172 * (*spvDescriptorSet0.vp_c9)._m0[12].y;
        float _610 = fma(_608, (*spvDescriptorSet0.vp_c9)._m0[11].x, _140);
        float _612 = _610 * _606;
        float _614 = floor(_612);
        float _616 = -_614;
        float _618 = _612 + _616;
        _620 = _618;
        _622 = true;
    }
    else
    {
        _620 = _186;
    }
    _622 = false;
    float _624 = _620;
    float _626 = in.m_61.x;
    float _628 = in.m_61.y;
    float _630 = in.m_61.z;
    float _632 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _634 = _624 + _632;
    float _636 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _638 = (*spvDescriptorSet0.vp_c9)._m0[108].w + _636;
    bool _640 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _642 = 1.0 / _638;
    float _644 = _598 * _628;
    float _646 = -(*spvDescriptorSet0.vp_c9)._m0[108].w;
    float _648 = _646 + (*spvDescriptorSet0.vp_c9)._m0[109].w;
    bool _650 = _624 >= (*spvDescriptorSet0.vp_c9)._m0[109].w;
    bool _652 = isnan(_624);
    bool _654 = _650 || _652;
    bool _656 = isnan((*spvDescriptorSet0.vp_c9)._m0[109].w);
    bool _658 = _654 || _656;
    float _660 = float(_658);
    float _662 = _602 * _630;
    float _664 = -(*spvDescriptorSet0.vp_c9)._m0[108].w;
    float _666 = _624 + _664;
    float _668 = 1.0 / _648;
    bool _670 = _624 >= (*spvDescriptorSet0.vp_c9)._m0[107].w;
    bool _672 = isnan(_624);
    bool _674 = _670 || _672;
    bool _676 = isnan((*spvDescriptorSet0.vp_c9)._m0[107].w);
    bool _678 = _674 || _676;
    float _680 = float(_678);
    float _682 = _634 * _642;
    bool _684 = _624 >= (*spvDescriptorSet0.vp_c9)._m0[108].w;
    bool _686 = isnan(_624);
    bool _688 = _684 || _686;
    bool _690 = isnan((*spvDescriptorSet0.vp_c9)._m0[108].w);
    bool _692 = _688 || _690;
    float _694 = float(_692);
    float _696 = -_660;
    float _698 = _696 + 1.0;
    float _700 = -(*spvDescriptorSet0.vp_c9)._m0[107].y;
    float _702 = (*spvDescriptorSet0.vp_c9)._m0[108].y + _700;
    float _704 = _694 * _698;
    float _706 = -_694;
    float _708 = _706 + 1.0;
    float _710 = -(*spvDescriptorSet0.vp_c9)._m0[107].x;
    float _712 = (*spvDescriptorSet0.vp_c9)._m0[108].x + _710;
    float _714 = -(*spvDescriptorSet0.vp_c9)._m0[107].z;
    float _716 = (*spvDescriptorSet0.vp_c9)._m0[108].z + _714;
    float _718 = fma(_702, _682, (*spvDescriptorSet0.vp_c9)._m0[107].y);
    float _720 = _680 * _708;
    float _722 = fma(_712, _682, (*spvDescriptorSet0.vp_c9)._m0[107].x);
    float _724 = fma(_716, _682, (*spvDescriptorSet0.vp_c9)._m0[107].z);
    float _726 = _666 * _668;
    float _728 = _718 * _720;
    float _730 = _722 * _720;
    float _732 = _724 * _720;
    float _734 = -(*spvDescriptorSet0.vp_c9)._m0[108].x;
    float _736 = _734 + (*spvDescriptorSet0.vp_c9)._m0[109].x;
    float _738 = -(*spvDescriptorSet0.vp_c9)._m0[108].y;
    float _740 = _738 + (*spvDescriptorSet0.vp_c9)._m0[109].y;
    float _742 = -(*spvDescriptorSet0.vp_c9)._m0[108].z;
    float _744 = _742 + (*spvDescriptorSet0.vp_c9)._m0[109].z;
    float _746 = -_680;
    float _748 = _746 + 1.0;
    float _750 = fma(_736, _726, (*spvDescriptorSet0.vp_c9)._m0[108].x);
    float _752 = fma(_740, _726, (*spvDescriptorSet0.vp_c9)._m0[108].y);
    float _754 = fma(_744, _726, (*spvDescriptorSet0.vp_c9)._m0[108].z);
    float _756 = fma(_748, (*spvDescriptorSet0.vp_c9)._m0[107].x, _730);
    float _758 = fma(_748, (*spvDescriptorSet0.vp_c9)._m0[107].y, _728);
    float _760 = fma(_748, (*spvDescriptorSet0.vp_c9)._m0[107].z, _732);
    float _762 = fma(_750, _704, _756);
    float _764 = fma(_752, _704, _758);
    float _766 = fma(_754, _704, _760);
    float _768 = _600 * _626;
    float _770 = fma(_660, (*spvDescriptorSet0.vp_c9)._m0[109].x, _762);
    float _772 = fma(_660, (*spvDescriptorSet0.vp_c9)._m0[109].y, _764);
    float _774 = fma(_660, (*spvDescriptorSet0.vp_c9)._m0[109].z, _766);
    bool _776 = !_640;
    float _792;
    if (!_776)
    {
        float _778 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _780 = _172 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _782 = fma(_780, (*spvDescriptorSet0.vp_c9)._m0[11].y, _140);
        float _784 = _782 * _778;
        float _786 = floor(_784);
        float _788 = -_786;
        float _790 = _784 + _788;
        _792 = _790;
        _794 = true;
    }
    else
    {
        _792 = _186;
    }
    _794 = false;
    float _796 = _792;
    float _798 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _800 = _796 + _798;
    float _802 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _804 = _802 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _806 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _808 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _806;
    float _810 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _812 = _810 + (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _814 = _796 >= (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _816 = isnan(_796);
    bool _818 = _814 || _816;
    bool _820 = isnan((*spvDescriptorSet0.vp_c9)._m0[117].w);
    bool _822 = _818 || _820;
    float _824 = float(_822);
    float _826 = 1.0 / _804;
    float _828 = -(*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _830 = _828 + (*spvDescriptorSet0.vp_c9)._m0[118].w;
    bool _832 = _796 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _834 = isnan(_796);
    bool _836 = _832 || _834;
    bool _838 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _840 = _836 || _838;
    float _842 = float(_840);
    bool _844 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].z;
    float _846 = 1.0 / _812;
    float _848 = _808 * _826;
    bool _850 = _796 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _852 = isnan(_796);
    bool _854 = _850 || _852;
    bool _856 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _858 = _854 || _856;
    float _860 = float(_858);
    float _862 = 1.0 / _830;
    float _864 = -_824;
    float _866 = _864 + 1.0;
    float _868 = fma(_848, _800, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _870 = -(*spvDescriptorSet0.vp_c9)._m0[118].w;
    float _872 = _870 + (*spvDescriptorSet0.vp_c9)._m0[119].w;
    bool _874 = _796 >= (*spvDescriptorSet0.vp_c9)._m0[118].w;
    bool _876 = isnan(_796);
    bool _878 = _874 || _876;
    bool _880 = isnan((*spvDescriptorSet0.vp_c9)._m0[118].w);
    bool _882 = _878 || _880;
    float _884 = float(_882);
    float _886 = -_860;
    float _888 = _886 + 1.0;
    float _890 = _860 * _866;
    float _892 = -(*spvDescriptorSet0.vp_c9)._m0[116].x;
    float _894 = _892 + (*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _896 = 1.0 / _872;
    float _898 = -_884;
    float _900 = _898 + 1.0;
    float _902 = _842 * _888;
    float _904 = -(*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _906 = (*spvDescriptorSet0.vp_c9)._m0[118].x + _904;
    float _908 = _894 * _846;
    float _910 = _824 * _900;
    float _912 = _868 * _902;
    float _914 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _916 = _796 + _914;
    float _918 = -_842;
    float _920 = _918 + 1.0;
    bool _922 = _796 >= (*spvDescriptorSet0.vp_c9)._m0[119].w;
    bool _924 = isnan(_796);
    bool _926 = _922 || _924;
    bool _928 = isnan((*spvDescriptorSet0.vp_c9)._m0[119].w);
    bool _930 = _926 || _928;
    float _932 = float(_930);
    float _934 = _906 * _862;
    float _936 = -(*spvDescriptorSet0.vp_c9)._m0[118].x;
    float _938 = _936 + (*spvDescriptorSet0.vp_c9)._m0[119].x;
    float _940 = -(*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _942 = _796 + _940;
    float _944 = fma(_908, _916, (*spvDescriptorSet0.vp_c9)._m0[116].x);
    float _946 = fma(_920, (*spvDescriptorSet0.vp_c9)._m0[115].x, _912);
    float _948 = -_932;
    float _950 = _948 + 1.0;
    float _952 = _938 * _896;
    float _954 = fma(_934, _942, (*spvDescriptorSet0.vp_c9)._m0[117].x);
    float _956 = -(*spvDescriptorSet0.vp_c9)._m0[118].w;
    float _958 = _796 + _956;
    float _960 = fma(_944, _890, _946);
    float _962 = _884 * _950;
    float _964 = _770 * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _966 = fma(_952, _958, (*spvDescriptorSet0.vp_c9)._m0[118].x);
    float _968 = fma(_954, _910, _960);
    float _970 = _772 * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _972 = _964 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _974 = fma(_966, _962, _968);
    float _976 = _774 * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _978 = _970 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _980 = fma(_932, (*spvDescriptorSet0.vp_c9)._m0[119].x, _974);
    float _982 = _976 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _984 = _980 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    out.m_63.x = _972;
    out.m_63.y = _978;
    out.m_63.z = _982;
    out.m_63.w = _984;
    bool _986 = !_844;
    float _1002;
    if (!_986)
    {
        float _988 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].z;
        float _990 = _172 * (*spvDescriptorSet0.vp_c9)._m0[12].w;
        float _992 = fma(_990, (*spvDescriptorSet0.vp_c9)._m0[11].z, _140);
        float _994 = _992 * _988;
        float _996 = floor(_994);
        float _998 = -_996;
        float _1000 = _994 + _998;
        _1002 = _1000;
        _1004 = true;
    }
    else
    {
        _1002 = _186;
    }
    _1004 = false;
    float _1006 = _1002;
    float _1008 = -(*spvDescriptorSet0.vp_c9)._m0[123].w;
    float _1010 = _1006 + _1008;
    bool _1012 = _1006 >= (*spvDescriptorSet0.vp_c9)._m0[125].w;
    bool _1014 = isnan(_1006);
    bool _1016 = _1012 || _1014;
    bool _1018 = isnan((*spvDescriptorSet0.vp_c9)._m0[125].w);
    bool _1020 = _1016 || _1018;
    float _1022 = float(_1020);
    float _1024 = -(*spvDescriptorSet0.vp_c9)._m0[124].w;
    float _1026 = _1006 + _1024;
    bool _1028 = _1006 >= (*spvDescriptorSet0.vp_c9)._m0[123].w;
    bool _1030 = isnan(_1006);
    bool _1032 = _1028 || _1030;
    bool _1034 = isnan((*spvDescriptorSet0.vp_c9)._m0[123].w);
    bool _1036 = _1032 || _1034;
    float _1038 = float(_1036);
    float _1040 = -(*spvDescriptorSet0.vp_c9)._m0[123].w;
    float _1042 = (*spvDescriptorSet0.vp_c9)._m0[124].w + _1040;
    float _1044 = -(*spvDescriptorSet0.vp_c9)._m0[124].w;
    float _1046 = _1044 + (*spvDescriptorSet0.vp_c9)._m0[125].w;
    bool _1048 = _1006 >= (*spvDescriptorSet0.vp_c9)._m0[124].w;
    bool _1050 = isnan(_1006);
    bool _1052 = _1048 || _1050;
    bool _1054 = isnan((*spvDescriptorSet0.vp_c9)._m0[124].w);
    bool _1056 = _1052 || _1054;
    float _1058 = float(_1056);
    float _1060 = 1.0 / _1042;
    float _1062 = -_1058;
    float _1064 = _1062 + 1.0;
    bool _1066 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].w;
    float _1068 = _1038 * _1064;
    float _1070 = -_1038;
    float _1072 = _1070 + 1.0;
    float _1074 = 1.0 / _1046;
    float _1076 = _1010 * _1060;
    float _1078 = -_1022;
    float _1080 = _1078 + 1.0;
    float _1082 = -(*spvDescriptorSet0.vp_c9)._m0[123].y;
    float _1084 = (*spvDescriptorSet0.vp_c9)._m0[124].y + _1082;
    float _1086 = _1058 * _1080;
    float _1088 = -(*spvDescriptorSet0.vp_c9)._m0[123].x;
    float _1090 = (*spvDescriptorSet0.vp_c9)._m0[124].x + _1088;
    float _1092 = -(*spvDescriptorSet0.vp_c9)._m0[123].z;
    float _1094 = (*spvDescriptorSet0.vp_c9)._m0[124].z + _1092;
    float _1096 = fma(_1084, _1076, (*spvDescriptorSet0.vp_c9)._m0[123].y);
    float _1098 = _1026 * _1074;
    float _1100 = fma(_1090, _1076, (*spvDescriptorSet0.vp_c9)._m0[123].x);
    float _1102 = fma(_1094, _1076, (*spvDescriptorSet0.vp_c9)._m0[123].z);
    float _1104 = _1096 * _1068;
    float _1106 = -(*spvDescriptorSet0.vp_c9)._m0[124].y;
    float _1108 = _1106 + (*spvDescriptorSet0.vp_c9)._m0[125].y;
    float _1110 = _1100 * _1068;
    float _1112 = _1102 * _1068;
    float _1114 = -(*spvDescriptorSet0.vp_c9)._m0[124].x;
    float _1116 = _1114 + (*spvDescriptorSet0.vp_c9)._m0[125].x;
    float _1118 = -(*spvDescriptorSet0.vp_c9)._m0[124].z;
    float _1120 = _1118 + (*spvDescriptorSet0.vp_c9)._m0[125].z;
    float _1122 = fma(_1072, (*spvDescriptorSet0.vp_c9)._m0[123].x, _1110);
    float _1124 = fma(_1072, (*spvDescriptorSet0.vp_c9)._m0[123].y, _1104);
    float _1126 = fma(_1116, _1098, (*spvDescriptorSet0.vp_c9)._m0[124].x);
    float _1128 = fma(_1108, _1098, (*spvDescriptorSet0.vp_c9)._m0[124].y);
    float _1130 = fma(_1120, _1098, (*spvDescriptorSet0.vp_c9)._m0[124].z);
    float _1132 = fma(_1072, (*spvDescriptorSet0.vp_c9)._m0[123].z, _1112);
    float _1134 = fma(_1126, _1086, _1122);
    float _1136 = fma(_1128, _1086, _1124);
    float _1138 = fma(_1130, _1086, _1132);
    float _1140 = fma(_1022, (*spvDescriptorSet0.vp_c9)._m0[125].x, _1134);
    float _1142 = fma(_1022, (*spvDescriptorSet0.vp_c9)._m0[125].y, _1136);
    float _1144 = fma(_1022, (*spvDescriptorSet0.vp_c9)._m0[125].z, _1138);
    bool _1146 = !_1066;
    float _1162;
    if (!_1146)
    {
        float _1148 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].w;
        float _1150 = _172 * (*spvDescriptorSet0.vp_c9)._m0[13].x;
        float _1152 = fma(_1150, (*spvDescriptorSet0.vp_c9)._m0[11].w, _140);
        float _1154 = _1152 * _1148;
        float _1156 = floor(_1154);
        float _1158 = -_1156;
        float _1160 = _1154 + _1158;
        _1162 = _1160;
        _1164 = true;
    }
    else
    {
        _1162 = _186;
    }
    _1164 = false;
    float _1166 = _1162;
    float _1168 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _1170 = _1166 + _1168;
    bool _1172 = _1166 >= (*spvDescriptorSet0.vp_c9)._m0[132].w;
    bool _1174 = isnan(_1166);
    bool _1176 = _1172 || _1174;
    bool _1178 = isnan((*spvDescriptorSet0.vp_c9)._m0[132].w);
    bool _1180 = _1176 || _1178;
    float _1182 = float(_1180);
    float _1184 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _1186 = _1184 + (*spvDescriptorSet0.vp_c9)._m0[132].w;
    bool _1188 = _1166 >= (*spvDescriptorSet0.vp_c9)._m0[131].w;
    bool _1190 = isnan(_1166);
    bool _1192 = _1188 || _1190;
    bool _1194 = isnan((*spvDescriptorSet0.vp_c9)._m0[131].w);
    bool _1196 = _1192 || _1194;
    float _1198 = float(_1196);
    float _1200 = -(*spvDescriptorSet0.vp_c9)._m0[131].x;
    float _1202 = (*spvDescriptorSet0.vp_c9)._m0[132].x + _1200;
    float _1204 = _1140 * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _1206 = -_1182;
    float _1208 = _1206 + 1.0;
    bool _1210 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[14].x;
    float _1212 = 1.0 / _1186;
    float _1214 = _1198 * _1208;
    float _1216 = -_1198;
    float _1218 = _1216 + 1.0;
    float _1220 = _1202 * _1212;
    float _1222 = _1144 * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _1224 = fma(_1220, _1170, (*spvDescriptorSet0.vp_c9)._m0[131].x);
    float _1226 = _1224 * _1214;
    float _1228 = _1142 * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _1230 = fma(_1218, (*spvDescriptorSet0.vp_c9)._m0[131].x, _1226);
    float _1232 = _1204 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1234 = _1228 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1236 = fma(_1182, (*spvDescriptorSet0.vp_c9)._m0[132].x, _1230);
    float _1238 = _1222 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1240 = _1236 * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    out.m_65.x = _1232;
    out.m_65.y = _1234;
    out.m_65.z = _1238;
    out.m_65.w = _1240;
    bool _1242 = !_1210;
    float _1258;
    if (!_1242)
    {
        float _1244 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[14].x;
        float _1246 = _172 * (*spvDescriptorSet0.vp_c9)._m0[15].x;
        float _1248 = fma(_1246, (*spvDescriptorSet0.vp_c9)._m0[14].x, _140);
        float _1250 = _1248 * _1244;
        float _1252 = floor(_1250);
        float _1254 = -_1252;
        float _1256 = _1250 + _1254;
        _1258 = _1256;
        _1260 = true;
    }
    else
    {
        _1258 = _186;
    }
    _1260 = false;
    float _1262 = _1258;
    float _1264 = -(*spvDescriptorSet0.vp_c9)._m0[159].w;
    float _1266 = (*spvDescriptorSet0.vp_c9)._m0[160].w + _1264;
    float _1268 = -(*spvDescriptorSet0.vp_c9)._m0[160].w;
    float _1270 = _1268 + (*spvDescriptorSet0.vp_c9)._m0[161].w;
    float _1272 = -(*spvDescriptorSet0.vp_c9)._m0[161].w;
    float _1274 = (*spvDescriptorSet0.vp_c9)._m0[162].w + _1272;
    float _1276 = -(*spvDescriptorSet0.vp_c9)._m0[162].w;
    float _1278 = _1276 + (*spvDescriptorSet0.vp_c9)._m0[163].w;
    float _1280 = -(*spvDescriptorSet0.vp_c9)._m0[163].w;
    float _1282 = (*spvDescriptorSet0.vp_c9)._m0[164].w + _1280;
    float _1284 = 1.0 / _1266;
    float _1286 = -(*spvDescriptorSet0.vp_c9)._m0[164].w;
    float _1288 = _1286 + (*spvDescriptorSet0.vp_c9)._m0[165].w;
    float _1290 = -(*spvDescriptorSet0.vp_c9)._m0[165].w;
    float _1292 = (*spvDescriptorSet0.vp_c9)._m0[166].w + _1290;
    bool _1294 = _1262 >= (*spvDescriptorSet0.vp_c9)._m0[161].w;
    bool _1296 = isnan(_1262);
    bool _1298 = _1294 || _1296;
    bool _1300 = isnan((*spvDescriptorSet0.vp_c9)._m0[161].w);
    bool _1302 = _1298 || _1300;
    float _1304 = float(_1302);
    float _1306 = 1.0 / _1270;
    float _1308 = -(*spvDescriptorSet0.vp_c9)._m0[159].w;
    float _1310 = _1262 + _1308;
    bool _1312 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[14].y;
    float _1314 = 1.0 / _1278;
    float _1316 = -(*spvDescriptorSet0.vp_c9)._m0[160].w;
    float _1318 = _1262 + _1316;
    float _1320 = _1310 * _1284;
    bool _1322 = _1262 >= (*spvDescriptorSet0.vp_c9)._m0[166].w;
    bool _1324 = isnan(_1262);
    bool _1326 = _1322 || _1324;
    bool _1328 = isnan((*spvDescriptorSet0.vp_c9)._m0[166].w);
    bool _1330 = _1326 || _1328;
    float _1332 = float(_1330);
    float _1334 = 1.0 / _1274;
    float _1336 = _1318 * _1306;
    float _1338 = -(*spvDescriptorSet0.vp_c9)._m0[161].w;
    float _1340 = _1262 + _1338;
    float _1342 = -(*spvDescriptorSet0.vp_c9)._m0[163].w;
    float _1344 = _1262 + _1342;
    float _1346 = 1.0 / _1282;
    float _1348 = -(*spvDescriptorSet0.vp_c9)._m0[162].w;
    float _1350 = _1262 + _1348;
    float _1352 = _1350 * _1314;
    bool _1354 = _1262 >= (*spvDescriptorSet0.vp_c9)._m0[165].w;
    bool _1356 = isnan(_1262);
    bool _1358 = _1354 || _1356;
    bool _1360 = isnan((*spvDescriptorSet0.vp_c9)._m0[165].w);
    bool _1362 = _1358 || _1360;
    float _1364 = float(_1362);
    float _1366 = 1.0 / _1292;
    float _1368 = _1340 * _1334;
    float _1370 = -_1332;
    float _1372 = _1370 + 1.0;
    float _1374 = -_1364;
    float _1376 = _1374 + 1.0;
    float _1378 = _1364 * _1372;
    float _1380 = _1344 * _1346;
    bool _1382 = _1262 >= (*spvDescriptorSet0.vp_c9)._m0[164].w;
    bool _1384 = isnan(_1262);
    bool _1386 = _1382 || _1384;
    bool _1388 = isnan((*spvDescriptorSet0.vp_c9)._m0[164].w);
    bool _1390 = _1386 || _1388;
    float _1392 = float(_1390);
    float _1394 = 1.0 / _1288;
    bool _1396 = _1262 >= (*spvDescriptorSet0.vp_c9)._m0[163].w;
    bool _1398 = isnan(_1262);
    bool _1400 = _1396 || _1398;
    bool _1402 = isnan((*spvDescriptorSet0.vp_c9)._m0[163].w);
    bool _1404 = _1400 || _1402;
    float _1406 = float(_1404);
    float _1408 = -(*spvDescriptorSet0.vp_c9)._m0[165].w;
    float _1410 = _1262 + _1408;
    float _1412 = _1392 * _1376;
    bool _1414 = _1262 >= (*spvDescriptorSet0.vp_c9)._m0[162].w;
    bool _1416 = isnan(_1262);
    bool _1418 = _1414 || _1416;
    bool _1420 = isnan((*spvDescriptorSet0.vp_c9)._m0[162].w);
    bool _1422 = _1418 || _1420;
    float _1424 = float(_1422);
    float _1426 = -_1392;
    float _1428 = _1426 + 1.0;
    float _1430 = -_1406;
    float _1432 = _1430 + 1.0;
    float _1434 = _1410 * _1366;
    float _1436 = -(*spvDescriptorSet0.vp_c9)._m0[159].z;
    float _1438 = (*spvDescriptorSet0.vp_c9)._m0[160].z + _1436;
    float _1440 = _1406 * _1428;
    float _1442 = _1424 * _1432;
    float _1444 = -_1424;
    float _1446 = _1444 + 1.0;
    float _1448 = -(*spvDescriptorSet0.vp_c9)._m0[159].x;
    float _1450 = (*spvDescriptorSet0.vp_c9)._m0[160].x + _1448;
    bool _1452 = _1262 >= (*spvDescriptorSet0.vp_c9)._m0[160].w;
    bool _1454 = isnan(_1262);
    bool _1456 = _1452 || _1454;
    bool _1458 = isnan((*spvDescriptorSet0.vp_c9)._m0[160].w);
    bool _1460 = _1456 || _1458;
    float _1462 = float(_1460);
    float _1464 = fma(_1438, _1320, (*spvDescriptorSet0.vp_c9)._m0[159].z);
    bool _1466 = _1262 >= (*spvDescriptorSet0.vp_c9)._m0[159].w;
    bool _1468 = isnan(_1262);
    bool _1470 = _1466 || _1468;
    bool _1472 = isnan((*spvDescriptorSet0.vp_c9)._m0[159].w);
    bool _1474 = _1470 || _1472;
    float _1476 = float(_1474);
    float _1478 = fma(_1450, _1320, (*spvDescriptorSet0.vp_c9)._m0[159].x);
    float _1480 = -(*spvDescriptorSet0.vp_c9)._m0[164].w;
    float _1482 = _1262 + _1480;
    float _1484 = -_1462;
    float _1486 = _1484 + 1.0;
    float _1488 = _1304 * _1446;
    float _1490 = -_1304;
    float _1492 = _1490 + 1.0;
    float _1494 = _1482 * _1394;
    float _1496 = _1476 * _1486;
    float _1498 = -(*spvDescriptorSet0.vp_c9)._m0[160].x;
    float _1500 = _1498 + (*spvDescriptorSet0.vp_c9)._m0[161].x;
    float _1502 = _1462 * _1492;
    float _1504 = -(*spvDescriptorSet0.vp_c9)._m0[160].z;
    float _1506 = _1504 + (*spvDescriptorSet0.vp_c9)._m0[161].z;
    float _1508 = _1478 * _1496;
    float _1510 = -_1476;
    float _1512 = _1510 + 1.0;
    float _1514 = _1464 * _1496;
    float _1516 = -(*spvDescriptorSet0.vp_c9)._m0[161].x;
    float _1518 = (*spvDescriptorSet0.vp_c9)._m0[162].x + _1516;
    float _1520 = fma(_1500, _1336, (*spvDescriptorSet0.vp_c9)._m0[160].x);
    float _1522 = fma(_1512, (*spvDescriptorSet0.vp_c9)._m0[159].x, _1508);
    float _1524 = -(*spvDescriptorSet0.vp_c9)._m0[161].z;
    float _1526 = (*spvDescriptorSet0.vp_c9)._m0[162].z + _1524;
    float _1528 = fma(_1506, _1336, (*spvDescriptorSet0.vp_c9)._m0[160].z);
    float _1530 = fma(_1512, (*spvDescriptorSet0.vp_c9)._m0[159].z, _1514);
    float _1532 = -(*spvDescriptorSet0.vp_c9)._m0[162].x;
    float _1534 = _1532 + (*spvDescriptorSet0.vp_c9)._m0[163].x;
    float _1536 = fma(_1518, _1368, (*spvDescriptorSet0.vp_c9)._m0[161].x);
    float _1538 = fma(_1520, _1502, _1522);
    float _1540 = fma(_1526, _1368, (*spvDescriptorSet0.vp_c9)._m0[161].z);
    float _1542 = -(*spvDescriptorSet0.vp_c9)._m0[162].z;
    float _1544 = _1542 + (*spvDescriptorSet0.vp_c9)._m0[163].z;
    float _1546 = fma(_1528, _1502, _1530);
    float _1548 = fma(_1534, _1352, (*spvDescriptorSet0.vp_c9)._m0[162].x);
    float _1550 = -(*spvDescriptorSet0.vp_c9)._m0[163].x;
    float _1552 = (*spvDescriptorSet0.vp_c9)._m0[164].x + _1550;
    float _1554 = fma(_1536, _1488, _1538);
    float _1556 = fma(_1544, _1352, (*spvDescriptorSet0.vp_c9)._m0[162].z);
    float _1558 = -(*spvDescriptorSet0.vp_c9)._m0[163].z;
    float _1560 = (*spvDescriptorSet0.vp_c9)._m0[164].z + _1558;
    float _1562 = fma(_1540, _1488, _1546);
    float _1564 = fma(_1552, _1380, (*spvDescriptorSet0.vp_c9)._m0[163].x);
    float _1566 = -(*spvDescriptorSet0.vp_c9)._m0[164].x;
    float _1568 = _1566 + (*spvDescriptorSet0.vp_c9)._m0[165].x;
    float _1570 = fma(_1548, _1442, _1554);
    float _1572 = fma(_1560, _1380, (*spvDescriptorSet0.vp_c9)._m0[163].z);
    float _1574 = -(*spvDescriptorSet0.vp_c9)._m0[164].z;
    float _1576 = _1574 + (*spvDescriptorSet0.vp_c9)._m0[165].z;
    float _1578 = fma(_1556, _1442, _1562);
    float _1580 = fma(_1568, _1494, (*spvDescriptorSet0.vp_c9)._m0[164].x);
    float _1582 = -(*spvDescriptorSet0.vp_c9)._m0[165].x;
    float _1584 = (*spvDescriptorSet0.vp_c9)._m0[166].x + _1582;
    float _1586 = fma(_1576, _1494, (*spvDescriptorSet0.vp_c9)._m0[164].z);
    float _1588 = -(*spvDescriptorSet0.vp_c9)._m0[165].z;
    float _1590 = (*spvDescriptorSet0.vp_c9)._m0[166].z + _1588;
    float _1592 = fma(_1564, _1440, _1570);
    float _1594 = fma(_1572, _1440, _1578);
    float _1596 = fma(_1584, _1434, (*spvDescriptorSet0.vp_c9)._m0[165].x);
    float _1598 = fma(_1590, _1434, (*spvDescriptorSet0.vp_c9)._m0[165].z);
    float _1600 = fma(_1580, _1412, _1592);
    float _1602 = fma(_1586, _1412, _1594);
    float _1604 = fma(_1596, _1378, _1600);
    float _1606 = fma(_1598, _1378, _1602);
    float _1608 = fma(_1332, (*spvDescriptorSet0.vp_c9)._m0[166].x, _1604);
    float _1610 = fma(_1332, (*spvDescriptorSet0.vp_c9)._m0[166].z, _1606);
    out.m_67.x = _1608;
    out.m_67.z = _1610;
    bool _1612 = !_1312;
    int _1614 = as_type<int>(_1440);
    float _1616 = _1434;
    float _1618 = _1600;
    if (!_1612)
    {
        float _1620 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[14].y;
        float _1622 = _172 * (*spvDescriptorSet0.vp_c9)._m0[15].y;
        float _1624 = fma(_1622, (*spvDescriptorSet0.vp_c9)._m0[14].y, _140);
        float _1626 = _1624 * _1620;
        float _1628 = floor(_1626);
        float _1630 = -_1628;
        float _1632 = _1626 + _1630;
        _188 = _1632;
    }
    float _1634 = _188;
    float _1636 = in.m_69.y;
    float _1638 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    float _1640 = in.m_57.w;
    int _1642 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _1644 = _1642 != 0;
    int _1646 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _1648 = _1646 != 0;
    float _1650 = in.m_69.x;
    int _1652 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _1654 = _1652 != 0;
    float _1656 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    float _1658 = in.m_57.z;
    float _1660 = in.m_57.y;
    float _1662 = (*spvDescriptorSet0.vp_c9)._m0[83].z + (*spvDescriptorSet0.vp_c9)._m0[83].x;
    float _1664 = _1638 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    float _1666 = (*spvDescriptorSet0.vp_c9)._m0[82].y + (*spvDescriptorSet0.vp_c9)._m0[81].w;
    float _1668 = (*spvDescriptorSet0.vp_c9)._m0[83].w + (*spvDescriptorSet0.vp_c9)._m0[83].y;
    int _1670 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _1672 = _1670 != 0;
    float _1674 = -_1636;
    float _1676 = _1674 + 1.0;
    bool _1678 = _1640 > 0.5;
    int _1680 = _1678 ? as_type<int>(_1676) : as_type<int>(_1636);
    bool _1682 = _1678;
    float _1684 = (*spvDescriptorSet0.vp_c9)._m0[7].z;
    float _1686 = _1664;
    float _1688 = _1636;
    if (_1644)
    {
        float _1690 = -_1650;
        float _1692 = _1690 + 1.0;
        _1614 = as_type<int>(_1692);
    }
    int _1694 = _1614;
    if (!_1644)
    {
        _1616 = _1650;
    }
    float _1696 = _1616;
    float _1698 = _1654 ? as_type<float>(_1680) : _1636;
    float _1700 = _1696;
    float _1702 = _1698;
    if (_1644)
    {
        bool _1704 = _1658 > 0.5;
        _1682 = _1704;
    }
    bool _1706 = _1682;
    if (!_1648)
    {
        _1684 = _1658;
    }
    float _1708 = _1684;
    float _1710 = fma(_1698, _1664, -0.5);
    float _1712 = _1708;
    if (!_1648)
    {
        _1686 = _1660;
    }
    float _1714 = _1686;
    float _1716 = _1714;
    if (_1644)
    {
        float _1718 = _1706 ? as_type<float>(_1694) : _1650;
        _1700 = _1718;
    }
    float _1720 = _1700;
    if (_1648)
    {
        _1716 = _172;
    }
    float _1722 = _1716;
    if (_1648)
    {
        _1712 = _1660;
    }
    float _1724 = _1712;
    float _1726 = fma(_1722, (*spvDescriptorSet0.vp_c9)._m0[83].z, _1662);
    if (!_1648)
    {
        _1702 = _1658;
    }
    float _1728 = _1702;
    float _1730 = _1724 * (*spvDescriptorSet0.vp_c9)._m0[82].y;
    float _1732 = _1728;
    if (_1648)
    {
        _1732 = _1660;
    }
    float _1734 = _1732;
    float _1736 = (*spvDescriptorSet0.vp_c9)._m0[82].x + (*spvDescriptorSet0.vp_c9)._m0[81].z;
    float _1738 = _1722 * (*spvDescriptorSet0.vp_c9)._m0[82].x;
    float _1740 = _1656 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    float _1742 = fma(_1730, -2.0, _1666);
    float _1744 = fma(_1734, (*spvDescriptorSet0.vp_c9)._m0[83].w, _1668);
    float _1746 = -_1736;
    float _1748 = fma(_1738, 2.0, _1746);
    float _1750 = fma(_1740, _1720, -0.5);
    float _1752 = fma(_140, (*spvDescriptorSet0.vp_c9)._m0[81].y, _1742);
    float _1754 = fma(_140, (*spvDescriptorSet0.vp_c9)._m0[82].w, _1744);
    float _1756 = fma(_140, (*spvDescriptorSet0.vp_c9)._m0[82].z, _1726);
    float _1758 = -_140;
    float _1760 = fma(_1758, (*spvDescriptorSet0.vp_c9)._m0[81].x, _1748);
    if (!_1672)
    {
        _1618 = _1650;
    }
    float _1762 = _1618;
    float _1764 = -_1752;
    float _1766 = fma(_1754, _1710, _1764);
    float _1768 = fma(_1756, _1750, _1760);
    float _1770 = _1766 + 0.5;
    float _1772 = _1768 + 0.5;
    float2 _7080 = float2(_1772, _1770);
    float _1774 = dm_bs(spvDescriptorSet0.vp_t_tcb_A.sample(spvDescriptorSet0.vp_t_tcb_ASmplr, select(_7080, float2(0.0), isnan(_7080)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_A, spvDescriptorSet0.vp_t_tcb_ASmplr_w, select(_7080, float2(0.0), isnan(_7080)), level(0.0)).w;
    float _1776 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].y);
    int _1778 = int(_1776);
    float _1780 = in.m_48.x;
    float _1782 = in.m_48.y;
    float _1784 = in.m_48.z;
    float _1786 = _172 * 2.0;
    float _1788 = _280 * _644;
    float _1790 = in.m_71.x;
    float _1792 = in.m_71.y;
    float _1794 = in.m_71.z;
    float _1796 = in.m_71.w;
    int _1798 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 16;
    bool _1800 = _1798 != 0;
    int _1802 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 32;
    bool _1804 = _1802 != 0;
    int _1806 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 64;
    bool _1808 = _1806 != 0;
    float _1810 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].x);
    int _1812 = int(_1810);
    float _1814 = in.m_73.x;
    float _1816 = in.m_73.y;
    float _1818 = in.m_73.z;
    float _1820 = in.m_73.w;
    float _1822 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _1824 = _1788 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _1826 = in.m_75.x;
    float _1828 = in.m_75.y;
    float _1830 = in.m_75.z;
    float _1832 = in.m_75.w;
    float _1834 = float(_1778);
    float _1836 = floor(_1786);
    float _1838 = _280 * _768;
    float _1840 = _280 * _662;
    float _1842 = _1660 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    float _1844 = _1838 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _1846 = _1840 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _1848 = float(uint(_1812));
    float _1850 = 1.0 / _1834;
    float _1852 = fma(_1842, -2.0, _1822);
    float _1854 = _1660 * 2.0;
    int _1856 = ~_1812;
    int _1858 = _1856 + 1;
    float _1860 = _1782 * _1792;
    float _1862 = 1.0 / _1848;
    float _1864 = fma(_1780, _1790, _1860);
    float _1866 = _1782 * _1816;
    float _1868 = _1782 * _1828;
    float _1870 = _172 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    bool _1872 = _1836 > 0.0;
    float _1874 = fma(_1780, _1814, _1866);
    float _1876 = _1850 * _140;
    float _1878 = fma(_1780, _1826, _1868);
    float _1880 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    float _1882 = float(_1812);
    float _1884 = fma(_1784, _1818, _1874);
    float _1886 = trunc(_1876);
    int _1888 = int(_1886);
    float _1890 = -_1880;
    float _1892 = fma(_1870, 2.0, _1890);
    int _1894 = as_type<int>(_1862) + (-2);
    float _1896 = fma(_1784, _1794, _1864);
    bool _1898 = !_1648;
    float _1900 = _1898 ? 7.345489978790283203125 : 1.0;
    float _1902 = _172 + _1660;
    float _1904 = _1882 * _140;
    float _1906 = fma(_1784, _1830, _1878);
    float _1908 = floor(_1854);
    bool _1910 = _1836 >= 0.0;
    bool _1912 = isnan(_1836);
    bool _1914 = _1910 || _1912;
    bool _1916 = isnan(0.0);
    bool _1918 = _1914 || _1916;
    float _1920 = _1902 + (-1.0);
    int _1922 = ~_1812;
    int _1924 = _1922 + 1;
    float _1926 = _1904 * _182;
    float _1928 = _1900 * _172;
    int _1930 = _1918 ? 0 : 1;
    float _1932 = _1658 * 2.0;
    float _1934 = float(uint(_1888));
    float _1936 = fma(_1920, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    float _1938 = _1660 + _1658;
    int _1940 = ~_1930;
    int _1942 = _1940 + 1;
    int _1944 = _1942 + 1;
    float _1946 = _172 + _1658;
    float _1948 = as_type<float>(_1894) * _1934;
    int _1950 = _1944;
    float _1952 = _1762;
    if (!_1872)
    {
        int _1954 = ~_1930;
        int _1956 = _1954 + 1;
        _1950 = _1956;
    }
    int _1958 = _1950;
    float _1960 = _1938 + (-1.0);
    bool _1962 = !_1804;
    int _1964 = _1962 ? 0 : 1;
    float _1966 = floor(_1932);
    bool _1968 = !_1800;
    int _1970 = _1968 ? 0 : 1;
    float _1972 = _1946 + (-1.0);
    bool _1974 = !_1808;
    int _1976 = _1974 ? 0 : 1;
    float _1978 = _1658 + (-0.5);
    float _1980 = fma(_1972, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    int _1982 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _1984 = _1982 != 0;
    int _1986 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _1988 = _1986 != 0;
    int _1990 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _1992 = _1990 != 0;
    float _1994 = trunc(_1948);
    float _1996 = precise::max(_1994, 0.0);
    uint _1999 = uint(_1996);
    bool _2001 = _1908 >= 0.0;
    bool _2003 = isnan(_1908);
    bool _2005 = _2001 || _2003;
    bool _2007 = isnan(0.0);
    bool _2009 = _2005 || _2007;
    float _2011 = fma(_1960, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    bool _2013 = _1908 > 0.0;
    float _2015 = _1906 + _1832;
    bool _2017 = !_1988;
    int _2019 = _2017 ? 0 : 1;
    float _2021 = float(_1958);
    float _2023 = floor(_1928);
    int _2025 = abs(_2019);
    float _2027 = _1896 + _1796;
    int _2029 = _2009 ? 0 : 1;
    float _2031 = float(_2025);
    bool _2033 = _1966 > 0.0;
    int _2035 = _1924 * int(_1999);
    int _2037 = _2035 + _1888;
    int _2039 = ~_2029;
    int _2041 = _2039 + 1;
    int _2043 = _2041 + 1;
    float _2045 = _2031 * _2021;
    int _2047 = _2043;
    float _2049 = _2027;
    if (!_2013)
    {
        int _2051 = ~_2029;
        int _2053 = _2051 + 1;
        _2047 = _2053;
    }
    int _2055 = _2047;
    float _2057 = trunc(_1926);
    int _2059 = int(_2057);
    float _2061 = float(uint(_2037));
    float _2063 = _2045 * (-2.0);
    bool _2065 = _1966 >= 0.0;
    bool _2067 = isnan(_1966);
    bool _2069 = _2065 || _2067;
    bool _2071 = isnan(0.0);
    bool _2073 = _2069 || _2071;
    float _2075 = -_2023;
    float _2077 = _1928 + _2075;
    float _2079 = float(_1888);
    float _2081 = as_type<float>(_1894) * _2061;
    float _2083 = _1884 + _1820;
    float _2085 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _2087 = log2(_2085);
    int _2089 = _2073 ? 0 : 1;
    bool _2091 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _2093 = isnan(1.0);
    bool _2095 = _2091 || _2093;
    bool _2097 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _2099 = _2095 || _2097;
    float _2101 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _2103 = 1.0 + _2101;
    bool _2105 = !_1992;
    int _2107 = _2105 ? 0 : 1;
    float _2109 = trunc(_2081);
    float _2111 = precise::max(_2109, 0.0);
    uint _2113 = uint(_2111);
    int _2115 = ~_2089;
    int _2117 = _2115 + 1;
    int _2119 = _2117 + 1;
    float _2121 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    bool _2123 = _2079 >= _1882;
    bool _2125 = isnan(_2079);
    bool _2127 = _2123 || _2125;
    bool _2129 = isnan(_1882);
    bool _2131 = _2127 || _2129;
    float _2133 = float(_2131);
    int _2135 = _2119;
    if (!_2033)
    {
        int _2137 = ~_2089;
        int _2139 = _2137 + 1;
        _2135 = _2139;
    }
    int _2141 = _2135;
    float _2143 = fma(_1660, (*spvDescriptorSet0.vp_c9)._m0[78].w, _2121);
    bool _2145 = !_1984;
    int _2147 = _2145 ? 0 : 1;
    float _2149 = _2087 * _140;
    float _2151 = _2077 * _1882;
    float _2153 = 1.0 / _2103;
    float _2155 = in.m_77.x;
    float _2157 = in.m_77.y;
    float _2159 = in.m_77.z;
    int _2161 = abs(_2107);
    float _2163 = _172 * 6.283185482025146484375;
    bool _2165 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _2167 = isnan(0.0);
    bool _2169 = _2165 || _2167;
    bool _2171 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _2173 = _2169 || _2171;
    int _2175 = int(_1999) + int(_2113);
    float _2177 = _2163 * 0.15915493667125701904296875;
    float _2179 = exp2(_2149);
    float _2181 = _2163 + _140;
    int _2183 = abs(_2147);
    float _2185 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    int _2187 = abs(_1964);
    float _2189 = trunc(_2133);
    int _2191 = int(_2189);
    int _2193 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 128;
    bool _2195 = _2193 != 0;
    float _2197 = fma(_172, (*spvDescriptorSet0.vp_c9)._m0[78].z, _2185);
    float _2199 = _2181 * 0.070000000298023223876953125;
    int _2201 = abs(_1976);
    float _2203 = fma(_140, (*spvDescriptorSet0.vp_c9)._m0[77].z, _2197);
    float _2205 = -_140;
    float _2207 = fma(_2205, (*spvDescriptorSet0.vp_c9)._m0[76].x, _1892);
    float _2209 = -_2179;
    float _2211 = _2209 + 1.0;
    float _2213 = fma(_140, (*spvDescriptorSet0.vp_c9)._m0[77].w, _2143);
    float _2215 = float(_2161);
    float _2217 = trunc(_2151);
    int _2219 = int(_2217);
    float _2221 = float(_2055);
    float _2223 = float(_2183);
    float _2225 = _2173 ? _2211 : 0.0;
    float _2227 = _2215 * _2221;
    float _2229 = float(_2141);
    float _2231 = fma(_140, (*spvDescriptorSet0.vp_c9)._m0[76].y, _1852);
    int _2233 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4096;
    bool _2235 = _2233 != 0;
    if (_2099)
    {
        float _2237 = _2225 * _2153;
        _150 = _2237;
    }
    float _2239 = _150;
    int _2241 = _1858 * _2175;
    int _2243 = _2241 + _1888;
    float _2245 = _2223 * _2229;
    float _2247 = fma(_2011, _2063, _2011);
    float _2249 = fma(_2063, _2157, _2157);
    bool _2251 = !_2235;
    int _2253 = _2251 ? 0 : 1;
    float _2255 = _2245 * (-2.0);
    bool _2257 = uint(_2243) >= uint(_1812);
    float _2259 = _1660 + (-0.5);
    bool _2261 = _1812 == 0;
    float _2263 = fma(_1936, _2255, _1936);
    float _2265 = fma(_2255, _2155, _2155);
    bool _2267 = !_2257;
    int _2269 = _2267 ? 0 : (-1);
    float _2271 = fma(_2259, (*spvDescriptorSet0.vp_c9)._m0[196].y, _2249);
    int _2273 = abs(_2253);
    float _2275 = _2227 * (-2.0);
    int _2277 = ~_2175;
    int _2279 = _2277 + _2269;
    int _2281 = _2279 + 1;
    float _2283 = _172 + (-0.5);
    float _2285 = fma(_1980, _2275, _1980);
    float _2287 = fma(_2275, _2159, _2159);
    int _2289 = _1812 * _2281;
    int _2291 = _2289 + _1888;
    float _2293 = fma(_2283, (*spvDescriptorSet0.vp_c9)._m0[196].x, _2265);
    float _2295 = fma(_2247, _2239, _2271);
    float _2297 = in.m_79.x;
    float _2299 = in.m_79.y;
    float _2301 = in.m_79.z;
    int _2303 = ~_2191;
    int _2305 = _2303 + 1;
    int _2307 = _2305 + 1;
    int _2309 = _2219 * _2273;
    int _2311 = _2309 + _1888;
    bool _2313 = !_2261;
    int _2315 = _2313 ? _2291 : (-1);
    float _2317 = _2177 * 6.283185482025146484375;
    float _2319 = sin(_2317);
    int _2321 = _1812 + (-1);
    float _2323 = fma(_1978, (*spvDescriptorSet0.vp_c9)._m0[196].z, _2287);
    float _2325 = fma(_2263, _2239, _2293);
    int _2327 = _2315 * _2307;
    int _2329 = abs(_1970);
    float _2331 = fma(_2285, _2239, _2323);
    float _2333 = _2177 * 6.283185482025146484375;
    float _2335 = cos(_2333);
    int _2337 = _2191 * _2321;
    int _2339 = _2337 + _2327;
    float _2341 = _2295 * 0.15915493667125701904296875;
    float _2343 = _2325 * 0.15915493667125701904296875;
    int _2345 = _2339 * _2187;
    float _2347 = _2331 * 0.15915493667125701904296875;
    bool _2349 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[660].y;
    bool _2351 = isnan(0.5);
    bool _2353 = _2349 || _2351;
    bool _2355 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _2357 = _2353 || _2355;
    float _2359 = _2341 * 6.283185482025146484375;
    float _2361 = sin(_2359);
    int _2363 = _2059 * _2329;
    int _2365 = _2363 + _2345;
    bool _2367 = !_2195;
    int _2369 = _2367 ? 0 : 1;
    float _2371 = _2319 * _2299;
    int _2373 = _2311 * _2201;
    int _2375 = _2373 + _2365;
    int _2377 = abs(_2369);
    float _2379 = _2027 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _2381 = _2335 * _2299;
    float _2383 = -_2371;
    float _2385 = fma(_2335, _2297, _2383);
    float _2387 = _2341 * 6.283185482025146484375;
    float _2389 = cos(_2387);
    float _2391 = fma(_2319, _2297, _2381);
    float _2393 = fma(_2083, (*spvDescriptorSet0.vp_c8)._m0[11].x, _2379);
    bool _2395 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[653].w;
    bool _2397 = isnan(0.5);
    bool _2399 = _2395 || _2397;
    bool _2401 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _2403 = _2399 || _2401;
    int _2405 = _2219 * _2377;
    int _2407 = _2405 + _2375;
    float _2409 = fma(_2015, (*spvDescriptorSet0.vp_c8)._m0[11].z, _2393);
    float _2411 = _2343 * 6.283185482025146484375;
    float _2413 = sin(_2411);
    float _2415 = _2343 * 6.283185482025146484375;
    float _2417 = cos(_2415);
    float _2419 = _2347 * 6.283185482025146484375;
    float _2421 = cos(_2419);
    float _2423 = _2413 * _2389;
    float _2425 = _2417 * _2389;
    float _2427 = _2417 * _2361;
    float _2429 = _2347 * 6.283185482025146484375;
    float _2431 = sin(_2429);
    float _2433 = _2389 * _2421;
    float _2435 = _2417 * _2421;
    float _2437 = -_2427;
    float _2439 = fma(_2431, _2423, _2437);
    float _2441 = -_2423;
    float _2443 = fma(_2431, _2427, _2441);
    float _2445 = fma(_1774, 6.283185482025146484375, _2199);
    float _2447 = _2445 * 0.15915493667125701904296875;
    float _2449 = _2413 * _2361;
    float _2451 = _2413 * _2421;
    float _2453 = _2361 * _2421;
    float _2455 = fma(_2431, _2425, _2449);
    float _2457 = _2447 * 6.283185482025146484375;
    float _2459 = sin(_2457);
    float _2461 = fma(_2431, _2449, _2425);
    float _2463 = _2459 * 0.100000001490116119384765625;
    float _2465 = fma(_2391, _2463, _2391);
    float _2467 = fma(_2385, _2463, _2385);
    float _2469 = fma(_2463, _2301, _2301);
    float _2471 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _2465);
    float _2473 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _2467);
    float _2475 = _1824 * _2471;
    float _2477 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _2469);
    float _2479 = _1844 * _2473;
    float _2481 = _2435 * _2475;
    float _2483 = _1846 * _2477;
    float _2485 = -_2475;
    float _2487 = _2431 * _2485;
    float _2489 = _2451 * _2475;
    float _2491 = fma(_2455, _2479, _2481);
    float _2493 = fma(_2433, _2479, _2487);
    float _2495 = fma(_2439, _2479, _2489);
    float _2497 = fma(_2443, _2483, _2491);
    float _2499 = _2027 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _2501 = fma(_2453, _2483, _2493);
    float _2503 = fma(_2461, _2483, _2495);
    float _2505 = _2497 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _2507 = _2497 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _2509 = fma(_2083, (*spvDescriptorSet0.vp_c8)._m0[10].x, _2499);
    float _2511 = fma(_2501, (*spvDescriptorSet0.vp_c8)._m0[26].x, _2505);
    float _2513 = fma(_2501, (*spvDescriptorSet0.vp_c8)._m0[24].x, _2507);
    float _2515 = fma(_2015, (*spvDescriptorSet0.vp_c8)._m0[10].z, _2509);
    float _2517 = _2409 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _2519 = fma(_2503, (*spvDescriptorSet0.vp_c8)._m0[26].z, _2511);
    float _2521 = fma(_2503, (*spvDescriptorSet0.vp_c8)._m0[24].z, _2513);
    float _2523 = _2515 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _2525 = _2519 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _2527 = _2521 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _2529 = _2523 + _2517;
    float _2531 = _2015 + _2525;
    float _2533 = _2083 + _2527;
    float _2535 = 1.0 / _2517;
    float _2537 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _2539 = _2531 + _2537;
    float _2541 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _2543 = _2533 + _2541;
    float _2545 = _2539 * _2539;
    float _2547 = fma(_2543, _2543, _2545);
    float _2549 = _2497 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _2551 = sqrt(_2547);
    float _2553 = fma(_2501, (*spvDescriptorSet0.vp_c8)._m0[25].x, _2549);
    float _2555 = _2529 * _2535;
    float _2557 = _2555 * 0.5;
    float _2559 = fma(_2503, (*spvDescriptorSet0.vp_c8)._m0[25].z, _2553);
    float _2561 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _2563 = fma(_2557, (*spvDescriptorSet0.vp_c8)._m0[30].w, _2561);
    float _2565 = _2559 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _2567 = 1.0 / _2563;
    float _2569 = _2027 + _2565;
    bool _2571 = _2551 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2573 = _2549;
    float _2575 = _2535;
    float _2577 = _2559;
    float _2579 = _2569;
    float _2581 = _2547;
    float _2583 = _2531;
    bool _2585 = _2357;
    if (!_2571)
    {
        _2573 = _2533;
    }
    float _2587 = _2573;
    float _2589 = _2587;
    if (!_2571)
    {
        _2575 = _2531;
    }
    float _2591 = _2575;
    float _2593 = _2591;
    if (!_2571)
    {
        _2577 = _2569;
    }
    float _2595 = _2577;
    bool _2597 = !_2571;
    float _2599 = _2595;
    if (!_2597)
    {
        float _2601 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _2603 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _2605 = _2551 + _2603;
        float _2607 = _2569 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _2609 = rsqrt(_2547);
        float _2611 = _2605 * _2601;
        float _2613 = _2611 * 0.15915493667125701904296875;
        float _2615 = _2613 * 6.283185482025146484375;
        float _2617 = cos(_2615);
        float _2619 = _2613 * 6.283185482025146484375;
        float _2621 = sin(_2619);
        float _2623 = _2617 + (-1.0);
        float _2625 = _2623 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _2627 = fma(_2621, _2607, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _2629 = fma(_2569, _2617, _2625);
        float _2631 = _2609 * _2627;
        float _2633 = fma(_2543, _2631, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _2635 = fma(_2539, _2631, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _2589 = _2633;
        _2599 = _2629;
        _2593 = _2635;
    }
    float _2637 = _2589;
    float _2639 = _2599;
    float _2641 = _2593;
    float _2643 = _2639;
    float _2645 = _2637;
    float _2647 = _2641;
    if (!_2357)
    {
        float _2649 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
        float _2651 = _2027 + _2649;
        float _2653 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
        float _2655 = _2083 + _2653;
        float _2657 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _2659 = _2651 * _2651;
        float _2661 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
        float _2663 = _2015 + _2661;
        float _2665 = fma(_2655, _2655, _2659);
        float _2667 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _2669 = fma(_2663, _2663, _2665);
        float _2671 = sqrt(_2669);
        float _2673 = _2657 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _2675 = -_2083;
        float _2677 = _2675 + _2637;
        float _2679 = precise::min(_2671, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _2681 = _2679 * _2667;
        float _2683 = _2673 * _2681;
        float _2685 = -_2027;
        float _2687 = _2685 + _2639;
        float _2689 = -_2015;
        float _2691 = _2689 + _2641;
        float _2693 = fma(_2677, _2683, _2083);
        float _2695 = fma(_2687, _2683, _2027);
        float _2697 = fma(_2691, _2683, _2015);
        _2643 = _2695;
        _2645 = _2693;
        _2647 = _2697;
        _2579 = _2691;
    }
    float _2699 = _2643;
    float _2701 = _2645;
    float _2703 = _2647;
    float _2705 = _2579;
    float _2707 = _2705;
    if (_2403)
    {
        _2581 = 1.0;
    }
    float _2709 = _2581;
    float _2711 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _2713 = _2567 * _2711;
    float _2715 = _2709;
    float _2717 = _2713;
    if (!_2403)
    {
        float _2719 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _2721 = _2719 * 0.15915493667125701904296875;
        float _2723 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _2725 = _2721 * 6.283185482025146484375;
        float _2727 = cos(_2725);
        float _2729 = _2723 * 0.15915493667125701904296875;
        float _2731 = _2721 * 6.283185482025146484375;
        float _2733 = sin(_2731);
        float _2735 = 1.0 / _2727;
        float _2737 = _2729 * 6.283185482025146484375;
        float _2739 = cos(_2737);
        float _2741 = _2733 * _2735;
        float _2743 = _2729 * 6.283185482025146484375;
        float _2745 = sin(_2743);
        float _2747 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _2749 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _2747;
        float _2751 = _2739 * _2741;
        float _2753 = 1.0 / _2751;
        float _2755 = 1.0 / _2749;
        float _2757 = _2745 * _2753;
        float _2759 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _2761 = fma(_2713, _2757, _2759);
        float _2763 = _2761 * _2755;
        float _2765 = precise::clamp(_2763, 0.0, 1.0);
        _2583 = _2721;
        _2707 = _2729;
        _2715 = _2765;
    }
    float _2767 = _2583;
    float _2769 = _2707;
    float _2771 = _2715;
    float _2773 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _2775 = _2699 + _2773;
    float _2777 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _2779 = _2701 + _2777;
    float _2781 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _2783 = _2703 + _2781;
    float _2785 = _2775 * _2775;
    float _2787 = in.m_81.w;
    float _2789 = fma(_2779, _2779, _2785);
    float _2791 = fma(_2015, (*spvDescriptorSet0.vp_c15)._m0[652].y, (*spvDescriptorSet0.vp_c15)._m0[652].w);
    float _2793 = fma(_2783, _2783, _2789);
    float _2795 = -(*spvDescriptorSet0.vp_c9)._m0[167].w;
    float _2797 = _2795 + (*spvDescriptorSet0.vp_c9)._m0[168].w;
    float _2799 = -(*spvDescriptorSet0.vp_c9)._m0[168].w;
    float _2801 = _2799 + (*spvDescriptorSet0.vp_c9)._m0[169].w;
    float _2803 = rsqrt(_2793);
    float _2805 = float(uint(_2407));
    float _2807 = -(*spvDescriptorSet0.vp_c9)._m0[170].w;
    float _2809 = _2807 + (*spvDescriptorSet0.vp_c9)._m0[171].w;
    float _2811 = sqrt(_2793);
    float _2813 = -(*spvDescriptorSet0.vp_c9)._m0[171].w;
    float _2815 = _2813 + (*spvDescriptorSet0.vp_c9)._m0[172].w;
    float _2817 = -(*spvDescriptorSet0.vp_c9)._m0[169].w;
    float _2819 = _2817 + (*spvDescriptorSet0.vp_c9)._m0[170].w;
    float _2821 = _2803 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _2823 = 1.0 / _2797;
    float _2825 = _2779 * _2821;
    float _2827 = _2783 * _2821;
    float _2829 = _2825 * _2825;
    float _2831 = _2827 * _2827;
    float _2833 = 1.0 / _2801;
    float _2835 = _2829 + _2831;
    float _2837 = sqrt(_2835);
    float _2839 = 1.0 / _2809;
    bool _2841 = _2837 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2843 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2845 = _2837 + _2843;
    float _2847 = 1.0 / _2815;
    float _2849 = 1.0 / _2819;
    float _2851 = _2783;
    float _2853 = _2769;
    float _2855 = _2845;
    float _2857 = _2767;
    float _2859 = _2835;
    float _2861 = _2775;
    if (_2841)
    {
        float _2863 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2851 = _2863;
    }
    float _2865 = _2851;
    if (_2841)
    {
        float _2867 = rsqrt(_2835);
        _2853 = _2867;
    }
    float _2869 = _2853;
    float _2871 = _2869;
    if (_2841)
    {
        float _2873 = _2845 * _2865;
        _2855 = _2873;
    }
    float _2875 = _2855;
    if (_2841)
    {
        float _2877 = _2875 * 0.15915493667125701904296875;
        _2857 = _2877;
    }
    float _2879 = _2857;
    float _2881 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _2883 = _2803;
    float _2885 = _2881;
    if (_2841)
    {
        float _2887 = _2879 * 6.283185482025146484375;
        float _2889 = sin(_2887);
        _2883 = _2889;
    }
    float _2891 = _2883;
    float _2893 = precise::max(0.0, _2881);
    float _2895 = _2789;
    float _2897 = _2893;
    if (_2841)
    {
        float _2899 = _2879 * 6.283185482025146484375;
        float _2901 = cos(_2899);
        _2895 = _2901;
    }
    float _2903 = _2895;
    float _2905 = -_2821;
    float _2907 = -_2893;
    float _2909 = fma(_2775, _2905, _2907);
    if (!_2841)
    {
        _2897 = _2825;
    }
    float _2911 = _2897;
    float _2913 = _2911;
    if (_2841)
    {
        float _2915 = _2909 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2885 = _2915;
    }
    float _2917 = _2885;
    float _2919 = _2917;
    float _2921 = _2891;
    if (_2841)
    {
        float _2923 = fma(_2891, _2917, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _2919 = _2923;
    }
    float _2925 = _2919;
    float _2927 = _2925;
    if (!_2841)
    {
        _2921 = _2829;
    }
    float _2929 = _2921;
    float _2931 = _2929;
    if (_2841)
    {
        float _2933 = _2869 * _2925;
        _2859 = _2933;
    }
    float _2935 = _2859;
    if (!_2841)
    {
        _2927 = _2909;
    }
    float _2937 = _2927;
    float _2939 = _2937;
    float _2941 = _2903;
    if (_2841)
    {
        float _2943 = _2903 + (-1.0);
        _2861 = _2943;
    }
    float _2945 = _2861;
    float _2947 = _2945;
    if (_2841)
    {
        float _2949 = _2825 * _2935;
        _2913 = _2949;
    }
    float _2951 = _2913;
    float _2953 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _2955 = fma(_2811, (*spvDescriptorSet0.vp_c15)._m0[23].w, _2953);
    float _2957 = precise::clamp(_2955, 0.0, 1.0);
    float _2959 = _2699 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    if (_2841)
    {
        float _2961 = _2945 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2871 = _2961;
    }
    float _2963 = _2871;
    if (!_2841)
    {
        _2947 = _2827;
    }
    float _2965 = _2947;
    float _2967 = _2965;
    if (_2841)
    {
        float _2969 = _2827 * _2935;
        _2967 = _2969;
    }
    float _2971 = _2967;
    if (_2841)
    {
        float _2973 = _2951 * _2951;
        _2931 = _2973;
    }
    float _2975 = _2931;
    if (_2841)
    {
        float _2977 = fma(_2909, _2903, _2963);
        _2939 = _2977;
    }
    float _2979 = _2939;
    if (!_2841)
    {
        _2941 = _2831;
    }
    float _2981 = _2941;
    float _2983 = _2981;
    if (_2841)
    {
        float _2985 = _2971 * _2971;
        _2983 = _2985;
    }
    float _2987 = _2983;
    float _2989 = -_2957;
    float _2991 = _2989 + 1.0;
    float _2993 = fma(_2979, _2979, _2975);
    float _2995 = fma(_2701, (*spvDescriptorSet0.vp_c8)._m0[3].x, _2959);
    float _2997 = abs(_2991);
    float _2999 = log2(_2997);
    float _3001 = _2993 + _2987;
    float _3003 = fma(_2703, (*spvDescriptorSet0.vp_c8)._m0[3].z, _2995);
    float _3005 = fma(_2083, (*spvDescriptorSet0.vp_c15)._m0[652].x, (*spvDescriptorSet0.vp_c15)._m0[652].z);
    float _3007 = rsqrt(_3001);
    float _3009 = _3003 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _3011 = floor(_3005);
    float _3013 = _2999 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _3015 = _3007 * _2951;
    float _3017 = _3007 * _2979;
    float _3019 = _3007 * _2971;
    float _3021 = _3015 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _3023 = exp2(_3013);
    float _3025 = -_3021;
    float _3027 = fma(_3017, (*spvDescriptorSet0.vp_c15)._m0[21].y, _3025);
    float _3029 = -_3011;
    float _3031 = _3005 + _3029;
    float _3033 = _2699 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _3035 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _3037 = -_3019;
    float _3039 = fma(_3037, (*spvDescriptorSet0.vp_c15)._m0[21].z, _3027);
    float _3041 = _2699 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _3043 = fma(_2701, (*spvDescriptorSet0.vp_c8)._m0[1].x, _3033);
    float _3045 = _2699 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _3047 = fma(_3039, -0.5, 0.5);
    float _3049 = fma(_2701, (*spvDescriptorSet0.vp_c8)._m0[0].x, _3041);
    float _3051 = fma(_2703, (*spvDescriptorSet0.vp_c8)._m0[1].z, _3043);
    float _3053 = fma(_2701, (*spvDescriptorSet0.vp_c8)._m0[2].x, _3045);
    float _3055 = fma(_3039, 0.5, 0.5);
    float _3057 = fma(_2703, (*spvDescriptorSet0.vp_c8)._m0[0].z, _3049);
    float _3059 = _3051 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _3061 = fma(_2703, (*spvDescriptorSet0.vp_c8)._m0[2].z, _3053);
    float _3063 = floor(_2791);
    float _3065 = _3057 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _3067 = _3059 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _3069 = _3061 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _3071 = fma(_3065, (*spvDescriptorSet0.vp_c8)._m0[7].x, _3067);
    float _3073 = _3069 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _3075 = fma(_3055, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _3077 = sqrt(_3047);
    float _3079 = fma(_3069, (*spvDescriptorSet0.vp_c8)._m0[7].z, _3071);
    float _3081 = -_3073;
    float _3083 = fma(_3081, _3035, 1.0);
    float _3085 = _3017 + 1.0;
    float _3087 = fma(_3055, _3075, -0.212114393711090087890625);
    float _3089 = fma(_3009, (*spvDescriptorSet0.vp_c8)._m0[7].w, _3079);
    float _3091 = -_3017;
    float _3093 = fma(_3023, _3085, _3091);
    float _3095 = fma(_3055, _3087, 1.570728778839111328125);
    float _3097 = log2(_3083);
    float _3099 = _3059 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _3101 = -_3063;
    float _3103 = _2791 + _3101;
    float _3105 = fma(_3065, (*spvDescriptorSet0.vp_c8)._m0[4].x, _3099);
    float _3107 = _3077 * 0.636619746685028076171875;
    float _3109 = 1.0 / _3089;
    float _3111 = _3059 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _3113 = fma(_3069, (*spvDescriptorSet0.vp_c8)._m0[4].z, _3105);
    float2 _9073 = float2(_3031, _3103);
    float _3115 = dm_bs(spvDescriptorSet0.vp_t_tcb_24.sample(spvDescriptorSet0.vp_t_tcb_24Smplr, select(_9073, float2(0.0), isnan(_9073)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_24, spvDescriptorSet0.vp_t_tcb_24Smplr_w, select(_9073, float2(0.0), isnan(_9073)), level(0.0)).x;
    float _3117 = -_3095;
    float _3119 = fma(_3107, _3117, 1.0);
    float _3121 = fma(_3065, (*spvDescriptorSet0.vp_c8)._m0[5].x, _3111);
    float _3123 = _3097 * 0.693147182464599609375;
    float _3125 = fma(_3069, (*spvDescriptorSet0.vp_c8)._m0[5].z, _3121);
    float _3127 = fma(_3009, (*spvDescriptorSet0.vp_c8)._m0[4].w, _3113);
    float _3129 = _3123 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _3131 = fma(_3009, (*spvDescriptorSet0.vp_c8)._m0[5].w, _3125);
    float _3133 = _3127 * _3109;
    float _3135 = _3131 * _3109;
    float _3137 = fma(_3093, 0.5, 0.5);
    float _3139 = fma(_3133, 0.5, 0.5);
    float _3141 = fma(_3135, -0.5, 0.5);
    float3 _9126 = float3(_3139, _3141, _3129);
    float _3143 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_9126, float3(0.0), isnan(_9126)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_9126, float3(0.0), isnan(_9126)), level(0.0)).x;
    float3 _9137 = float3(_3139, _3141, _3129);
    float4 _3146 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_9137, float3(0.0), isnan(_9137)), level(0.0)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_9137, float3(0.0), isnan(_9137)), level(0.0)).xyzw;
    float _3148 = _3146.x;
    float _3150 = _3146.y;
    float _3152 = _3146.z;
    float _3154 = _3146.w;
    float2 _9153 = float2(_3119, _3137);
    float3 _3158 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_9153, float2(0.0), isnan(_9153)), level(0.0)), spvDescriptorSet0.dm_border, 4u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_9153, float2(0.0), isnan(_9153)), level(0.0)).xyz;
    float _3160 = _3158.x;
    float _3162 = _3158.y;
    float _3164 = _3158.z;
    float _3166 = as_type<float>(_1894) * _2805;
    int _3168 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2097152;
    bool _3170 = _3168 != 0;
    out.m_83.w = _2787;
    int _3172 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _3174 = _3172 != 0;
    float _3176 = -(*spvDescriptorSet0.vp_c9)._m0[170].w;
    float _3178 = _1634 + _3176;
    float _3180 = trunc(_3166);
    float _3182 = precise::max(_3180, 0.0);
    uint _3184 = uint(_3182);
    float _3186 = _2999 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    if (_1672)
    {
        bool _3188 = _172 > 0.5;
        _2585 = _3188;
    }
    bool _3190 = _2585;
    out.m_85.x = _2083;
    out.m_85.y = _2027;
    out.m_85.z = _2015;
    float _3192 = -(*spvDescriptorSet0.vp_c9)._m0[167].x;
    float _3194 = (*spvDescriptorSet0.vp_c9)._m0[168].x + _3192;
    float _3196 = -(*spvDescriptorSet0.vp_c9)._m0[168].x;
    float _3198 = _3196 + (*spvDescriptorSet0.vp_c9)._m0[169].x;
    bool _3200 = _1660 > 0.5;
    float _3202 = _3194 * _2823;
    float _3204 = -(*spvDescriptorSet0.vp_c9)._m0[172].w;
    float _3206 = _3204 + (*spvDescriptorSet0.vp_c9)._m0[173].w;
    float _3208 = _3198 * _2833;
    float _3210 = -(*spvDescriptorSet0.vp_c9)._m0[173].w;
    float _3212 = _3210 + (*spvDescriptorSet0.vp_c9)._m0[174].w;
    int _3214 = ~_1812;
    int _3216 = _3214 + 1;
    float _3218 = -(*spvDescriptorSet0.vp_c9)._m0[170].x;
    float _3220 = _3218 + (*spvDescriptorSet0.vp_c9)._m0[171].x;
    float _3222 = -(*spvDescriptorSet0.vp_c9)._m0[169].x;
    float _3224 = (*spvDescriptorSet0.vp_c9)._m0[170].x + _3222;
    float _3226 = 1.0 / _3212;
    float _3228 = -(*spvDescriptorSet0.vp_c9)._m0[171].x;
    float _3230 = (*spvDescriptorSet0.vp_c9)._m0[172].x + _3228;
    float _3232 = _3220 * _2839;
    int _3234 = _3216 * int(_3184);
    int _3236 = _3234 + _2407;
    float _3238 = _3230 * _2847;
    float _3240 = -(*spvDescriptorSet0.vp_c9)._m0[172].x;
    float _3242 = _3240 + (*spvDescriptorSet0.vp_c9)._m0[173].x;
    float _3244 = _3224 * _2849;
    float _3246 = 1.0 / _3206;
    bool _3248 = _1634 >= (*spvDescriptorSet0.vp_c9)._m0[174].w;
    bool _3250 = isnan(_1634);
    bool _3252 = _3248 || _3250;
    bool _3254 = isnan((*spvDescriptorSet0.vp_c9)._m0[174].w);
    bool _3256 = _3252 || _3254;
    float _3258 = float(_3256);
    float _3260 = -(*spvDescriptorSet0.vp_c9)._m0[173].x;
    float _3262 = (*spvDescriptorSet0.vp_c9)._m0[174].x + _3260;
    float _3264 = float(uint(_3236));
    float _3266 = -(*spvDescriptorSet0.vp_c9)._m0[167].w;
    float _3268 = _1634 + _3266;
    bool _3270 = _1634 >= (*spvDescriptorSet0.vp_c9)._m0[173].w;
    bool _3272 = isnan(_1634);
    bool _3274 = _3270 || _3272;
    bool _3276 = isnan((*spvDescriptorSet0.vp_c9)._m0[173].w);
    bool _3278 = _3274 || _3276;
    float _3280 = float(_3278);
    float _3282 = -_3258;
    float _3284 = _3282 + 1.0;
    bool _3286 = _1634 >= (*spvDescriptorSet0.vp_c9)._m0[170].w;
    bool _3288 = isnan(_1634);
    bool _3290 = _3286 || _3288;
    bool _3292 = isnan((*spvDescriptorSet0.vp_c9)._m0[170].w);
    bool _3294 = _3290 || _3292;
    float _3296 = float(_3294);
    float _3298 = as_type<float>(_1894) * _3264;
    float _3300 = _3262 * _3226;
    float _3302 = _3280 * _3284;
    float _3304 = -_3280;
    float _3306 = _3304 + 1.0;
    bool _3308 = _1634 >= (*spvDescriptorSet0.vp_c9)._m0[172].w;
    bool _3310 = isnan(_1634);
    bool _3312 = _3308 || _3310;
    bool _3314 = isnan((*spvDescriptorSet0.vp_c9)._m0[172].w);
    bool _3316 = _3312 || _3314;
    float _3318 = float(_3316);
    float _3320 = trunc(_3298);
    float _3322 = precise::max(_3320, 0.0);
    uint _3324 = uint(_3322);
    float _3326 = fma(_3202, _3268, (*spvDescriptorSet0.vp_c9)._m0[167].x);
    float _3328 = -(*spvDescriptorSet0.vp_c9)._m0[168].w;
    float _3330 = _1634 + _3328;
    float _3332 = _3242 * _3246;
    bool _3334 = _1634 >= (*spvDescriptorSet0.vp_c9)._m0[171].w;
    bool _3336 = isnan(_1634);
    bool _3338 = _3334 || _3336;
    bool _3340 = isnan((*spvDescriptorSet0.vp_c9)._m0[171].w);
    bool _3342 = _3338 || _3340;
    float _3344 = float(_3342);
    float _3346 = -_3318;
    float _3348 = _3346 + 1.0;
    float _3350 = _3318 * _3306;
    float _3352 = fma(_3208, _3330, (*spvDescriptorSet0.vp_c9)._m0[168].x);
    int _3354 = ~_1812;
    int _3356 = _3354 + 1;
    float _3358 = -_3344;
    float _3360 = _3358 + 1.0;
    float _3362 = _3344 * _3348;
    bool _3364 = _1634 >= (*spvDescriptorSet0.vp_c9)._m0[169].w;
    bool _3366 = isnan(_1634);
    bool _3368 = _3364 || _3366;
    bool _3370 = isnan((*spvDescriptorSet0.vp_c9)._m0[169].w);
    bool _3372 = _3368 || _3370;
    float _3374 = float(_3372);
    float _3376 = -(*spvDescriptorSet0.vp_c9)._m0[169].w;
    float _3378 = _1634 + _3376;
    float _3380 = _3296 * _3360;
    float _3382 = -_3296;
    float _3384 = _3382 + 1.0;
    bool _3386 = _1634 >= (*spvDescriptorSet0.vp_c9)._m0[167].w;
    bool _3388 = isnan(_1634);
    bool _3390 = _3386 || _3388;
    bool _3392 = isnan((*spvDescriptorSet0.vp_c9)._m0[167].w);
    bool _3394 = _3390 || _3392;
    float _3396 = float(_3394);
    float _3398 = fma(_3244, _3378, (*spvDescriptorSet0.vp_c9)._m0[169].x);
    int _3400 = int(_3184) + int(_3324);
    float _3402 = _3374 * _3384;
    bool _3404 = _1634 >= (*spvDescriptorSet0.vp_c9)._m0[168].w;
    bool _3406 = isnan(_1634);
    bool _3408 = _3404 || _3406;
    bool _3410 = isnan((*spvDescriptorSet0.vp_c9)._m0[168].w);
    bool _3412 = _3408 || _3410;
    float _3414 = float(_3412);
    float _3416 = -_3374;
    float _3418 = _3416 + 1.0;
    float _3420 = fma(_3232, _3178, (*spvDescriptorSet0.vp_c9)._m0[170].x);
    int _3422 = _3356 * _3400;
    int _3424 = _3422 + _2407;
    float _3426 = -(*spvDescriptorSet0.vp_c9)._m0[171].w;
    float _3428 = _1634 + _3426;
    float _3430 = _3414 * _3418;
    float _3432 = -_3414;
    float _3434 = _3432 + 1.0;
    float _3436 = float(uint(_2311));
    float _3438 = in.m_87.x;
    float _3440 = in.m_87.y;
    bool _3442 = uint(_3424) >= uint(_1812);
    float _3444 = _3396 * _3434;
    float _3446 = fma(_3238, _3428, (*spvDescriptorSet0.vp_c9)._m0[171].x);
    float _3448 = as_type<float>(_1894) * _3436;
    bool _3450 = !_3442;
    int _3452 = _3450 ? 0 : (-1);
    float _3454 = _3326 * _3444;
    float _3456 = -_3396;
    float _3458 = _3456 + 1.0;
    if (_3174)
    {
        float _3460 = _3200 ? _1676 : _1636;
        _1688 = _3460;
    }
    float _3462 = _1688;
    float _3464 = exp2(_3186);
    int _3466 = ~_3400;
    int _3468 = _3466 + _3452;
    int _3470 = _3468 + 1;
    float _3472 = fma(_3458, (*spvDescriptorSet0.vp_c9)._m0[167].x, _3454);
    float _3474 = -(*spvDescriptorSet0.vp_c9)._m0[172].w;
    float _3476 = _1634 + _3474;
    float _3478 = -(*spvDescriptorSet0.vp_c9)._m0[173].w;
    float _3480 = _1634 + _3478;
    int _3482 = ~_1812;
    int _3484 = _3482 + 1;
    int _3486 = _1812 * _3470;
    int _3488 = _3486 + _2407;
    float _3490 = fma(_3352, _3430, _3472);
    float _3492 = trunc(_3448);
    float _3494 = precise::max(_3492, 0.0);
    uint _3496 = uint(_3494);
    float _3498 = fma(_3332, _3476, (*spvDescriptorSet0.vp_c9)._m0[172].x);
    float _3500 = fma(_3300, _3480, (*spvDescriptorSet0.vp_c9)._m0[173].x);
    bool _3502 = !_2261;
    int _3504 = _3502 ? _3488 : (-1);
    float _3506 = fma(_3398, _3402, _3490);
    float _3508 = _3059 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _3510 = _2319 * _3440;
    float _3512 = _2335 * _3440;
    float _3514 = in.m_89.x;
    float _3516 = in.m_89.y;
    int _3518 = as_type<int>(_3440);
    if (_1672)
    {
        float _3520 = -_1650;
        float _3522 = _3520 + 1.0;
        _3518 = as_type<int>(_3522);
    }
    int _3524 = _3518;
    float _3526 = -_3510;
    float _3528 = fma(_2335, _3438, _3526);
    float _3530 = fma(_2319, _3438, _3512);
    int _3532 = _3504 >> 31;
    float _3534 = fma(_3420, _3380, _3506);
    if (_1672)
    {
        float _3536 = _3190 ? as_type<float>(_3524) : _1650;
        _1952 = _3536;
    }
    float _3538 = _1952;
    int _3540 = _3484 * int(_3496);
    int _3542 = _3540 + _2311;
    int _3544 = _3532 & 3;
    float _3546 = fma(_3446, _3362, _3534);
    float _3548 = abs(_2713);
    float _3550 = log2(_3548);
    int _3552 = _3504 + _3544;
    float _3554 = fma(_3498, _3350, _3546);
    float _3556 = float(uint(_3542));
    float _3558 = fma((*spvDescriptorSet0.vp_c9)._m0[80].y, _3462, -0.5);
    int _3560 = _3552 >> 2;
    float _3562 = fma(_3500, _3302, _3554);
    float _3564 = as_type<float>(_1894) * _3556;
    int _3566 = _3560 << 4;
    int _3568 = _3566 + 368;
    float _3570 = fma(_3258, (*spvDescriptorSet0.vp_c9)._m0[174].x, _3562);
    int _3572 = _3504 & 3;
    bool _3574 = _3572 != 0;
    float _3576 = fma(_3538, (*spvDescriptorSet0.vp_c9)._m0[80].x, -0.5);
    float _3578 = _2319 * _3516;
    uint _3580 = uint(int(uint(_3568) >> uint(2)));
    uint _3582 = uint(int(uint(int(_3580)) >> uint(2)));
    int _3584 = int(_3580) & 3;
    float _3586 = (*spvDescriptorSet0.vp_c9)._m0[int(_3582)][_3584];
    int _3588 = int(_3580) + 1;
    uint _3590 = uint(int(uint(_3588) >> uint(2)));
    int _3592 = _3588 & 3;
    float _3594 = (*spvDescriptorSet0.vp_c9)._m0[int(_3590)][_3592];
    float _3596 = _2335 * _3516;
    float _3598 = trunc(_3564);
    float _3600 = precise::max(_3598, 0.0);
    uint _3602 = uint(_3600);
    float _3604 = -_3578;
    float _3606 = fma(_2335, _3514, _3604);
    float _3608 = fma(_2203, _3576, _2207);
    float _3610 = fma(_2319, _3514, _3596);
    int _3612 = _3504 & 3;
    bool _3614 = _3612 != 0;
    float _3616 = _3550 * (*spvDescriptorSet0.vp_c15)._m0[654].z;
    int _3618 = _3568 + 8;
    uint _3620 = uint(int(uint(_3618) >> uint(2)));
    uint _3622 = uint(int(uint(int(_3620)) >> uint(2)));
    int _3624 = int(_3620) & 3;
    float _3626 = (*spvDescriptorSet0.vp_c9)._m0[int(_3622)][_3624];
    int _3628 = int(_3620) + 1;
    uint _3630 = uint(int(uint(_3628) >> uint(2)));
    int _3632 = _3628 & 3;
    float _3634 = (*spvDescriptorSet0.vp_c9)._m0[int(_3630)][_3632];
    int _3636 = ~_1812;
    int _3638 = _3636 + 1;
    float _3640 = -_2231;
    float _3642 = fma(_2213, _3558, _3640);
    bool _3644 = uint(_3612) > 1u;
    float _3646 = _2435 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    bool _3648 = _3612 != 3;
    float _3650 = _2435 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    bool _3652 = uint(_3612) >= 2u;
    float _3654 = _2435 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _3656 = _2455 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    int _3658 = int(_3496) + int(_3602);
    float _3660 = _2455 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _3662 = exp2(_3616);
    int _3664 = _3652 ? 0 : 1;
    float _3666 = -_2431;
    float _3668 = fma(_3666, (*spvDescriptorSet0.vp_c8)._m0[24].x, _3646);
    float _3670 = -_2431;
    float _3672 = fma(_3670, (*spvDescriptorSet0.vp_c8)._m0[25].x, _3650);
    float _3674 = -_2431;
    float _3676 = fma(_3674, (*spvDescriptorSet0.vp_c8)._m0[26].x, _3654);
    int _3678 = ~_3664;
    int _3680 = _3678 + 1;
    int _3682 = _3680 + 1;
    float _3684 = fma(_2451, (*spvDescriptorSet0.vp_c8)._m0[24].z, _3668);
    int _3686 = _3682;
    if (_3648)
    {
        int _3688 = ~_3664;
        int _3690 = _3688 + 1;
        _3686 = _3690;
    }
    int _3692 = _3686;
    float _3694 = fma(_2451, (*spvDescriptorSet0.vp_c8)._m0[25].z, _3672);
    int _3696 = _3638 * _3658;
    int _3698 = _3696 + _2311;
    int _3700 = _3574 ? 0 : 1;
    float _3702 = fma(_2451, (*spvDescriptorSet0.vp_c8)._m0[26].z, _3676);
    float _3704 = _2443 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    int _3706 = ~_3700;
    int _3708 = _3706 + 1;
    int _3710 = _3708 + 1;
    float _3712 = fma(_2433, (*spvDescriptorSet0.vp_c8)._m0[25].x, _3656);
    int _3714 = _3710;
    if (!_3644)
    {
        int _3716 = ~_3700;
        int _3718 = _3716 + 1;
        _3714 = _3718;
    }
    int _3720 = _3714;
    float _3722 = fma(_3662, (*spvDescriptorSet0.vp_c15)._m0[654].x, (*spvDescriptorSet0.vp_c15)._m0[654].y);
    float _3724 = precise::clamp(_3722, 0.0, 1.0);
    bool _3726 = !_3614;
    int _3728 = _3726 ? 0 : 1;
    float _3730 = fma(_2439, (*spvDescriptorSet0.vp_c8)._m0[25].z, _3712);
    bool _3732 = uint(_3698) >= uint(_1812);
    float _3734 = _2455 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    int _3736 = abs(_3720);
    float _3738 = -_3464;
    float _3740 = _3738 + 1.0;
    int _3742 = abs(_3728);
    float _3744 = fma(_2433, (*spvDescriptorSet0.vp_c8)._m0[24].x, _3734);
    int _3746 = ~_3736;
    int _3748 = _3746 + 1;
    int _3750 = _3748 + 1;
    float _3752 = fma(_2433, (*spvDescriptorSet0.vp_c8)._m0[26].x, _3660);
    bool _3754 = _3612 != 3;
    float _3756 = _3740 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    int _3758 = _3750 * as_type<int>(_3594);
    bool _3760 = !_3754;
    int _3762 = _3760 ? 0 : (-1);
    float _3764 = fma(_2439, (*spvDescriptorSet0.vp_c8)._m0[26].z, _3752);
    int _3766 = ~_3742;
    int _3768 = _3766 + 1;
    int _3770 = _3768 + 1;
    float _3772 = fma(_3065, (*spvDescriptorSet0.vp_c8)._m0[6].x, _3508);
    int _3774 = abs(_3692);
    out.m_91.x = _3570;
    bool _3776 = !_3170;
    int _3778 = _3776 ? 0 : 1;
    int _3780 = _3770 * as_type<int>(_3586);
    int _3782 = _3780 + _3758;
    int _3784 = abs(_3762);
    float _3786 = _2443 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    bool _3788 = !_3732;
    int _3790 = _3788 ? 0 : (-1);
    out.m_93.x = _2701;
    out.m_93.y = _2699;
    out.m_93.z = _2703;
    int _3792 = ~_3774;
    int _3794 = _3792 + 1;
    int _3796 = _3794 + 1;
    int _3798 = abs(_3778);
    int _3800 = _3796 * as_type<int>(_3626);
    int _3802 = _3800 + _3782;
    int _3804 = ~_3658;
    int _3806 = _3804 + _3790;
    int _3808 = _3806 + 1;
    float _3810 = in.m_87.z;
    int _3812 = ~_3784;
    int _3814 = _3812 + 1;
    int _3816 = _3814 + 1;
    bool _3818 = _2465 != 0.0;
    bool _3820 = isnan(_2465);
    bool _3822 = _3818 || _3820;
    bool _3824 = isnan(0.0);
    bool _3826 = _3822 || _3824;
    int _3828 = _1812 * _3808;
    int _3830 = _3828 + _2311;
    int _3832 = ~_3798;
    int _3834 = _3832 + 1;
    int _3836 = _3834 + 1;
    int _3838 = _3816 * as_type<int>(_3634);
    int _3840 = _3838 + _3802;
    float _3842 = fma(_2453, (*spvDescriptorSet0.vp_c8)._m0[25].x, _3786);
    float _3844 = _2443 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    bool _3846 = !_2261;
    int _3848 = _3846 ? _3830 : (-1);
    int _3850 = _3840 * _3836;
    bool _3852 = _2467 == 0.0;
    bool _3854 = !_3826;
    bool _3856 = _3852 && _3854;
    float _3858 = fma(_2453, (*spvDescriptorSet0.vp_c8)._m0[24].x, _3844);
    float _3860 = fma(_2453, (*spvDescriptorSet0.vp_c8)._m0[26].x, _3704);
    int _3862 = _3848 * _3798;
    int _3864 = _3862 + _3850;
    float _3866 = in.m_89.z;
    float _3868 = in.m_89.w;
    bool _3870 = _2469 == 0.0;
    bool _3872 = _3870 && _3856;
    float _3874 = fma(_2439, (*spvDescriptorSet0.vp_c8)._m0[24].z, _3744);
    float _3876 = float(_3864);
    float _3878 = fma(_3724, -2.0, 3.0);
    float _3880 = _3724 * _3724;
    float _3882 = fma(_2461, (*spvDescriptorSet0.vp_c8)._m0[24].z, _3858);
    float _3884 = fma(_2461, (*spvDescriptorSet0.vp_c8)._m0[25].z, _3842);
    float _3886 = _3608 + 0.5;
    float _3888 = _3610 * _3694;
    float _3890 = _3880 * _3878;
    float _3892 = _3610 * _3684;
    float _3894 = _3610 * _3702;
    float _3896 = _3642 + 0.5;
    float _3898 = fma(_3606, _3730, _3888);
    float _3900 = fma(_2461, (*spvDescriptorSet0.vp_c8)._m0[26].z, _3860);
    float _3902 = fma(_3606, _3874, _3892);
    float _3904 = fma(_3606, _3764, _3894);
    float _3906 = -_3890;
    float _3908 = _3906 + 1.0;
    out.m_95.x = _3886;
    out.m_95.y = _3896;
    out.m_95.z = _1772;
    out.m_95.w = _1770;
    float _3910 = _3904;
    if (_3872)
    {
        _2049 = _3530;
    }
    float _3912 = _2049;
    float _3914 = _3912;
    if (!_3872)
    {
        float _3916 = fma(_2465, (*spvDescriptorSet0.vp_c9)._m0[17].y, _3530);
        _3914 = _3916;
    }
    float _3918 = _3914;
    float _3920 = fma(_3908, (*spvDescriptorSet0.vp_c15)._m0[654].w, _3890);
    out.m_97.x = _3876;
    float _3922 = fma(_3884, _3866, _3898);
    float _3924 = fma(_3900, _3866, _3904);
    float _3926 = _3530 * _3606;
    float _3928 = in.m_99.x;
    bool _3930 = _2713 <= 8000.0;
    bool _3932 = isnan(_2713);
    bool _3934 = _3930 || _3932;
    bool _3936 = isnan(8000.0);
    bool _3938 = _3934 || _3936;
    float _3940 = float(_3938);
    if (_3872)
    {
        _3910 = _3528;
    }
    float _3942 = _3910;
    float _3944 = fma(_3882, _3866, _3902);
    float _3946 = _3942;
    if (!_3872)
    {
        float _3948 = fma(_2467, (*spvDescriptorSet0.vp_c9)._m0[17].y, _3528);
        _3946 = _3948;
    }
    float _3950 = _3946;
    float _3952 = _3528 * _3866;
    float _3954 = _3610 * _3810;
    float _3956 = _3940 * _3920;
    out.m_101.x = _3944;
    out.m_101.y = _3922;
    out.m_101.z = _3924;
    float _3958 = -_3952;
    float _3960 = fma(_3606, _3810, _3958);
    float _3962 = -_3954;
    float _3964 = fma(_3530, _3866, _3962);
    float _3966 = _3702 * _3918;
    if (_3872)
    {
        _2717 = _3810;
    }
    float _3968 = _2717;
    float _3970 = _3960 * _3868;
    float _3972 = _3968;
    if (!_3872)
    {
        float _3974 = fma(_2469, (*spvDescriptorSet0.vp_c9)._m0[17].y, _3810);
        _3972 = _3974;
    }
    float _3976 = _3972;
    float _3978 = _3684 * _3918;
    float _3980 = -_3926;
    float _3982 = fma(_3528, _3610, _3980);
    float _3984 = _3964 * _3868;
    float _3986 = _3970 * _3684;
    float _3988 = _3970 * _3702;
    float _3990 = _3694 * _3918;
    float _3992 = _3970 * _3694;
    float _3994 = fma(_3764, _3950, _3966);
    float _3996 = _3956 * (*spvDescriptorSet0.vp_c15)._m0[653].x;
    float _3998 = fma(_3730, _3950, _3990);
    float _4000 = fma(_3874, _3950, _3978);
    float _4002 = _3982 * _3868;
    float _4004 = fma(_3984, _3874, _3986);
    float _4006 = fma(_3884, _3976, _3998);
    float _4008 = fma(_3984, _3730, _3992);
    float _4010 = fma(_3984, _3764, _3988);
    float _4012 = fma(_3900, _3976, _3994);
    float _4014 = fma(_4002, _3882, _4004);
    float _4016 = fma(_4002, _3884, _4008);
    float _4018 = fma(_4002, _3900, _4010);
    float _4020 = fma(_3069, (*spvDescriptorSet0.vp_c8)._m0[6].z, _3772);
    float _4022 = -_3115;
    float _4024 = _4022 + 1.0;
    float _4026 = fma(_3882, _3976, _4000);
    bool _4028 = _2811 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _4030 = isnan(_2811);
    bool _4032 = _4028 || _4030;
    bool _4034 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _4036 = _4032 || _4034;
    out.m_103.x = _4014;
    out.m_103.y = _4016;
    out.m_103.z = _4018;
    float _4038 = _4024 * _3996;
    float _4040 = precise::clamp(_4038, 0.0, 1.0);
    float _4042 = fma(_3009, (*spvDescriptorSet0.vp_c8)._m0[6].w, _4020);
    float _4044 = _3127 + _3089;
    out.m_105.x = _4026;
    out.m_105.y = _4006;
    out.m_105.z = _4012;
    float _4046 = -_4040;
    float _4048 = fma(_4046, (*spvDescriptorSet0.vp_c15)._m0[653].y, 1.0);
    float _4050 = _4042 + _3089;
    float _4052 = _3089 * 0.5;
    out.gl_Position.x = _3127;
    out.gl_Position.y = _3131;
    out.gl_Position.z = _4042;
    out.gl_Position.w = _3089;
    float _4054 = _4048 * _3928;
    float _4056 = _4050 * 0.5;
    float _4058 = -_3756;
    float _4060 = _4058 + 1.0;
    float _4062 = _4054 * (*spvDescriptorSet0.vp_c13)._m0[1].w;
    float _4064 = _4044 * 0.5;
    float _4066 = fma(_3131, -0.5, _4052);
    float _4068 = _4018;
    float _4070 = _4060;
    if (!_4036)
    {
        _4068 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _4072 = _4068;
    out.m_107.x = _4062;
    float _4074 = _3756 * _3143;
    float _4076 = _3154 * _4060;
    float _4078 = _4072;
    float _4080 = _4072;
    if (!_4036)
    {
        _4070 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _4082 = _4070;
    out.m_109.x = _4064;
    out.m_109.y = _4066;
    out.m_109.z = _4056;
    out.m_109.w = _3089;
    float _4084 = _3154 * _4074;
    float _4086 = _3164 * _4074;
    float _4088 = fma(_3160, _4084, _3148);
    float _4090 = fma(_3162, _4084, _3150);
    float _4092 = fma(_3154, _4086, _3152);
    float _4094 = _4084;
    float _4096 = _4082;
    float _4098 = _4082;
    if (!_4036)
    {
        _4094 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _4100 = _4094;
    out.m_111.x = _4088;
    out.m_111.y = _4090;
    out.m_111.z = _4092;
    out.m_111.w = _4076;
    float _4102 = _2771 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    bool _4104 = !_4036;
    float _4106 = _4100;
    float _4108 = _4100;
    if (!_4104)
    {
        bool _4110 = _2811 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _4112 = isnan(_2811);
        bool _4114 = _4110 || _4112;
        bool _4116 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _4118 = _4114 || _4116;
        if (!_4118)
        {
            float _4120 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _4122 = _2811 + _4120;
            float _4124 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _4126 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _4124;
            float _4128 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _4130 = _4128 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _4132 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _4134 = _4132 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _4136 = 1.0 / _4126;
            float _4138 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _4140 = _4138 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _4142 = _4122 * _4136;
            float _4144 = precise::clamp(_4142, 0.0, 1.0);
            float _4146 = fma(_4144, _4130, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _4148 = fma(_4144, _4134, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _4150 = fma(_4144, _4140, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            _4108 = _4148;
            _4080 = _4146;
            _4098 = _4150;
            _4152 = true;
        }
        else
        {
            bool _4154 = _2811 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _4156 = isnan(_2811);
            bool _4158 = _4154 || _4156;
            bool _4160 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _4162 = _4158 || _4160;
            if (!_4162)
            {
                _4078 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _4164 = _4078;
            _4080 = _4164;
            if (!_4162)
            {
                _4106 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _4166 = _4106;
            _4108 = _4166;
            if (!_4162)
            {
                _4096 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _4168 = _4096;
            bool _4170 = !_4162;
            _4098 = _4168;
            if (!_4170)
            {
                bool _4172 = _2811 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _4174 = isnan(_2811);
                bool _4176 = _4172 || _4174;
                bool _4178 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _4180 = _4176 || _4178;
                if (!_4180)
                {
                    float _4182 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _4184 = _2811 + _4182;
                    float _4186 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _4188 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _4186;
                    float _4190 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _4192 = _4190 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _4194 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _4196 = _4194 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _4198 = 1.0 / _4188;
                    float _4200 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _4202 = _4200 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _4204 = _4184 * _4198;
                    float _4206 = precise::clamp(_4204, 0.0, 1.0);
                    float _4208 = fma(_4206, _4192, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _4210 = fma(_4206, _4196, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _4212 = fma(_4206, _4202, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    _4108 = _4210;
                    _4080 = _4208;
                    _4098 = _4212;
                    _4152 = true;
                }
                else
                {
                    _4108 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _4080 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _4098 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                }
            }
        }
    }
    _4152 = false;
    float _4214 = _4108;
    float _4216 = _4080;
    float _4218 = _4098;
    float _4220 = _4102 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    out.m_113.x = 0.0;
    float _4222 = _4214 * 0.586610972881317138671875;
    bool _4224 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    out.m_55.x = _4220;
    float _4226 = fma(_4216, 0.298911988735198974609375, _4222);
    bool _4228 = _2771 > 0.0;
    bool _4230 = isnan(_2771);
    bool _4232 = _4228 || _4230;
    bool _4234 = isnan(0.0);
    bool _4236 = _4232 || _4234;
    float _4238 = fma(_4218, 0.114477999508380889892578125, _4226);
    float _4240 = -_4238;
    float _4242 = _4240 + _4216;
    float _4244 = -_4238;
    float _4246 = _4244 + _4214;
    float _4248 = -_4238;
    float _4250 = _4248 + _4218;
    float _4252 = fma(_4242, (*spvDescriptorSet0.vp_c13)._m0[1].z, _4238);
    float _4254 = fma(_4246, (*spvDescriptorSet0.vp_c13)._m0[1].z, _4238);
    float _4256 = fma(_4250, (*spvDescriptorSet0.vp_c13)._m0[1].z, _4238);
    bool _4258 = !_4224;
    if (!_4258)
    {
        float _4260 = -_2699;
        float _4262 = _4260 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
        float _4264 = -_2701;
        float _4266 = _4264 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
        float _4268 = -_2703;
        float _4270 = _4268 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
        float _4272 = _4262 * _4262;
        float _4274 = fma(_4266, _4266, _4272);
        float _4276 = fma(_4270, _4270, _4274);
        float _4278 = sqrt(_4276);
        float _4280 = rsqrt(_4276);
        float _4282 = -_4278;
        float _4284 = _4282 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
        float _4286 = _4284 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
        float _4288 = precise::clamp(_4286, 0.0, 1.0);
        float _4290 = _4266 * _4280;
        float _4292 = _4262 * _4280;
        float _4294 = abs(_4288);
        float _4296 = log2(_4294);
        float _4298 = _4270 * _4280;
        float _4300 = _4290 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
        float _4302 = _4006 * _4292;
        float _4304 = -_4292;
        float _4306 = -_4300;
        float _4308 = fma(_4304, (*spvDescriptorSet0.vp_c15)._m0[656].y, _4306);
        float _4310 = fma(_4026, _4290, _4302);
        float _4312 = -_4298;
        float _4314 = fma(_4312, (*spvDescriptorSet0.vp_c15)._m0[656].z, _4308);
        float _4316 = fma(_4012, _4298, _4310);
        float _4318 = precise::clamp(_4316, 0.0, 1.0);
        float _4320 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
        float _4322 = _4314 + _4320;
        float _4324 = _4296 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
        float _4326 = _4322 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
        float _4328 = precise::clamp(_4326, 0.0, 1.0);
        float _4330 = exp2(_4324);
        float _4332 = _4330 * _4328;
        float _4334 = _4318 * _4332;
        float _4336 = _4334 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
        float _4338 = _4334 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
        float _4340 = _4334 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
        out.m_113.x = _4336;
        out.m_113.y = _4338;
        out.m_113.z = _4340;
    }
    out.m_115.x = _4252;
    out.m_115.y = _4254;
    out.m_115.z = _4256;
    if (_4236)
    {
        return out;
    }
    out.m_55.x = 0.0;
    float _4342 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _4342;
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
    out.m_65 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_91 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_53 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_97 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_103 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_85 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_105 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_95 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_93 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_83 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_109 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_55 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_59 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_101 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_113 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_107 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_111 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_115 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_67 = float4(0.0, 0.0, 0.0, 1.0);
    bool _4152 = false;
    bool _1260 = false;
    bool _1164 = false;
    bool _1004 = false;
    bool _794 = false;
    bool _622 = false;
    bool _300 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _129 = in.m_48.w;
    float _131 = in.m_50.w;
    float _133 = trunc(_129);
    int _136 = int(_133);
    float _138 = -_131;
    float _140 = _138 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    out.m_53.y = _140;
    bool _144 = _136 >= 1;
    float _146 = 0.0;
    float _148 = _131;
    float _150 = _140;
    if (!_144)
    {
        _146 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _152 = _146;
    if (!_144)
    {
        out.m_55.x = 0.0;
    }
    int _154 = 0;
    if (!_144)
    {
        float _156 = _152 * 5.0;
        _154 = as_type<int>(_156);
    }
    int _158 = _154;
    int _160 = _158;
    if (!_144)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _4410 = as_type<float>(_158);
        out.gl_Position.z = _4410;
    }
    if (!_144)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_63.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_63.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_63.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_63.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_65.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_65.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_65.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_65.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_91.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_91.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_91.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_91.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_53.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_53.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_53.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_53.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_97.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_97.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_97.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_97.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_103.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_103.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_103.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_103.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_85.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_85.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_85.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_85.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_105.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_105.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_105.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_105.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_95.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_95.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_95.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_95.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_93.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_93.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_93.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_93.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_83.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_83.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_83.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_83.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_109.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_109.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_109.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_109.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_55.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_55.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_55.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_55.w)); dm_cw(dm_gs, dm_p, 68, as_type<uint>(out.m_59.x)); dm_cw(dm_gs, dm_p, 69, as_type<uint>(out.m_59.y)); dm_cw(dm_gs, dm_p, 70, as_type<uint>(out.m_59.z)); dm_cw(dm_gs, dm_p, 71, as_type<uint>(out.m_59.w)); dm_cw(dm_gs, dm_p, 72, as_type<uint>(out.m_101.x)); dm_cw(dm_gs, dm_p, 73, as_type<uint>(out.m_101.y)); dm_cw(dm_gs, dm_p, 74, as_type<uint>(out.m_101.z)); dm_cw(dm_gs, dm_p, 75, as_type<uint>(out.m_101.w)); dm_cw(dm_gs, dm_p, 76, as_type<uint>(out.m_113.x)); dm_cw(dm_gs, dm_p, 77, as_type<uint>(out.m_113.y)); dm_cw(dm_gs, dm_p, 78, as_type<uint>(out.m_113.z)); dm_cw(dm_gs, dm_p, 79, as_type<uint>(out.m_113.w)); dm_cw(dm_gs, dm_p, 80, as_type<uint>(out.m_107.x)); dm_cw(dm_gs, dm_p, 81, as_type<uint>(out.m_107.y)); dm_cw(dm_gs, dm_p, 82, as_type<uint>(out.m_107.z)); dm_cw(dm_gs, dm_p, 83, as_type<uint>(out.m_107.w)); dm_cw(dm_gs, dm_p, 84, as_type<uint>(out.m_111.x)); dm_cw(dm_gs, dm_p, 85, as_type<uint>(out.m_111.y)); dm_cw(dm_gs, dm_p, 86, as_type<uint>(out.m_111.z)); dm_cw(dm_gs, dm_p, 87, as_type<uint>(out.m_111.w)); dm_cw(dm_gs, dm_p, 88, as_type<uint>(out.m_115.x)); dm_cw(dm_gs, dm_p, 89, as_type<uint>(out.m_115.y)); dm_cw(dm_gs, dm_p, 90, as_type<uint>(out.m_115.z)); dm_cw(dm_gs, dm_p, 91, as_type<uint>(out.m_115.w)); dm_cw(dm_gs, dm_p, 92, as_type<uint>(out.m_67.x)); dm_cw(dm_gs, dm_p, 93, as_type<uint>(out.m_67.y)); dm_cw(dm_gs, dm_p, 94, as_type<uint>(out.m_67.z)); dm_cw(dm_gs, dm_p, 95, as_type<uint>(out.m_67.w)); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    bool _162 = _131 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _164 = isnan(_131);
    bool _166 = _162 || _164;
    bool _168 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _170 = _166 || _168;
    float _172 = in.m_57.x;
    float _174 = float(_136);
    bool _176 = _140 >= _174;
    bool _178 = !_170;
    bool _180 = _176 || _178;
    float _182 = 1.0 / _174;
    if (_180)
    {
        _148 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _184 = _148;
    if (_180)
    {
        out.m_55.x = 0.0;
    }
    float _186 = _140 * _182;
    float _188 = _186;
    if (_180)
    {
        float _190 = _184 * 5.0;
        _160 = as_type<int>(_190);
    }
    int _192 = _160;
    out.m_59.x = _172;
    if (_180)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _4475 = as_type<float>(_192);
        out.gl_Position.z = _4475;
    }
    out.m_53.x = _186;
    if (_180)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_63.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_63.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_63.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_63.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_65.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_65.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_65.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_65.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_91.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_91.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_91.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_91.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_53.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_53.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_53.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_53.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_97.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_97.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_97.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_97.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_103.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_103.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_103.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_103.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_85.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_85.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_85.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_85.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_105.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_105.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_105.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_105.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_95.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_95.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_95.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_95.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_93.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_93.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_93.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_93.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_83.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_83.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_83.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_83.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_109.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_109.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_109.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_109.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_55.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_55.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_55.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_55.w)); dm_cw(dm_gs, dm_p, 68, as_type<uint>(out.m_59.x)); dm_cw(dm_gs, dm_p, 69, as_type<uint>(out.m_59.y)); dm_cw(dm_gs, dm_p, 70, as_type<uint>(out.m_59.z)); dm_cw(dm_gs, dm_p, 71, as_type<uint>(out.m_59.w)); dm_cw(dm_gs, dm_p, 72, as_type<uint>(out.m_101.x)); dm_cw(dm_gs, dm_p, 73, as_type<uint>(out.m_101.y)); dm_cw(dm_gs, dm_p, 74, as_type<uint>(out.m_101.z)); dm_cw(dm_gs, dm_p, 75, as_type<uint>(out.m_101.w)); dm_cw(dm_gs, dm_p, 76, as_type<uint>(out.m_113.x)); dm_cw(dm_gs, dm_p, 77, as_type<uint>(out.m_113.y)); dm_cw(dm_gs, dm_p, 78, as_type<uint>(out.m_113.z)); dm_cw(dm_gs, dm_p, 79, as_type<uint>(out.m_113.w)); dm_cw(dm_gs, dm_p, 80, as_type<uint>(out.m_107.x)); dm_cw(dm_gs, dm_p, 81, as_type<uint>(out.m_107.y)); dm_cw(dm_gs, dm_p, 82, as_type<uint>(out.m_107.z)); dm_cw(dm_gs, dm_p, 83, as_type<uint>(out.m_107.w)); dm_cw(dm_gs, dm_p, 84, as_type<uint>(out.m_111.x)); dm_cw(dm_gs, dm_p, 85, as_type<uint>(out.m_111.y)); dm_cw(dm_gs, dm_p, 86, as_type<uint>(out.m_111.z)); dm_cw(dm_gs, dm_p, 87, as_type<uint>(out.m_111.w)); dm_cw(dm_gs, dm_p, 88, as_type<uint>(out.m_115.x)); dm_cw(dm_gs, dm_p, 89, as_type<uint>(out.m_115.y)); dm_cw(dm_gs, dm_p, 90, as_type<uint>(out.m_115.z)); dm_cw(dm_gs, dm_p, 91, as_type<uint>(out.m_115.w)); dm_cw(dm_gs, dm_p, 92, as_type<uint>(out.m_67.x)); dm_cw(dm_gs, dm_p, 93, as_type<uint>(out.m_67.y)); dm_cw(dm_gs, dm_p, 94, as_type<uint>(out.m_67.z)); dm_cw(dm_gs, dm_p, 95, as_type<uint>(out.m_67.w)); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _194 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[19].z;
    float _196 = _140 + (*spvDescriptorSet0.vp_c9)._m0[20].z;
    int _198 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 2;
    bool _200 = _198 != 0;
    int _202 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 4;
    bool _204 = _202 != 0;
    int _206 = 1 & as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x);
    bool _208 = _206 != 0;
    float _210 = _196 * _194;
    float _212 = fma(_172, (*spvDescriptorSet0.vp_c9)._m0[20].x, _210);
    float _214 = _212 * 6.283185482025146484375;
    float _216 = floor(_212);
    float _218 = _214 * 0.15915493667125701904296875;
    bool _220 = !_200;
    int _222 = _220 ? 0 : 1;
    int _224 = abs(_222);
    float _226 = _218 * 6.283185482025146484375;
    float _228 = cos(_226);
    bool _230 = !_208;
    int _232 = _230 ? 0 : 1;
    bool _234 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    int _236 = abs(_232);
    float _238 = -_216;
    float _240 = _212 + _238;
    float _242 = float(_224);
    float _244 = -_240;
    float _246 = fma(_244, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    bool _248 = !_204;
    int _250 = _248 ? 0 : 1;
    float _252 = abs(_246);
    float _254 = _242 * _252;
    float _256 = fma(_228, 0.5, 0.5);
    int _258 = abs(_250);
    bool _260 = _240 < 0.5;
    float _262 = float(_260);
    float _264 = -_256;
    float _266 = fma(_264, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    float _268 = float(_236);
    float _270 = float(_258);
    float _272 = -_262;
    float _274 = fma(_272, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    float _276 = fma(_268, _266, _254);
    float _278 = abs(_274);
    float _280 = fma(_270, _278, _276);
    bool _282 = !_234;
    float _298;
    if (!_282)
    {
        float _284 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _286 = _172 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _288 = fma(_286, (*spvDescriptorSet0.vp_c9)._m0[12].x, _140);
        float _290 = _288 * _284;
        float _292 = floor(_290);
        float _294 = -_292;
        float _296 = _290 + _294;
        _298 = _296;
        _300 = true;
    }
    else
    {
        _298 = _186;
    }
    _300 = false;
    float _302 = _298;
    float _304 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _306 = _302 + _304;
    float _308 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _310 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _308;
    float _312 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _314 = _312 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _316 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _318 = (*spvDescriptorSet0.vp_c9)._m0[146].w + _316;
    float _320 = -(*spvDescriptorSet0.vp_c9)._m0[146].w;
    float _322 = _320 + (*spvDescriptorSet0.vp_c9)._m0[147].w;
    float _324 = 1.0 / _310;
    float _326 = -(*spvDescriptorSet0.vp_c9)._m0[147].w;
    float _328 = (*spvDescriptorSet0.vp_c9)._m0[148].w + _326;
    float _330 = 1.0 / _318;
    float _332 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _334 = _302 + _332;
    bool _336 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].x;
    float _338 = 1.0 / _314;
    float _340 = _334 * _324;
    float _342 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _344 = _302 + _342;
    bool _346 = _302 >= (*spvDescriptorSet0.vp_c9)._m0[147].w;
    bool _348 = isnan(_302);
    bool _350 = _346 || _348;
    bool _352 = isnan((*spvDescriptorSet0.vp_c9)._m0[147].w);
    bool _354 = _350 || _352;
    float _356 = float(_354);
    float _358 = -(*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _360 = (*spvDescriptorSet0.vp_c9)._m0[144].z + _358;
    float _362 = 1.0 / _322;
    float _364 = _344 * _330;
    bool _366 = _302 >= (*spvDescriptorSet0.vp_c9)._m0[148].w;
    bool _368 = isnan(_302);
    bool _370 = _366 || _368;
    bool _372 = isnan((*spvDescriptorSet0.vp_c9)._m0[148].w);
    bool _374 = _370 || _372;
    float _376 = float(_374);
    float _378 = -(*spvDescriptorSet0.vp_c9)._m0[146].w;
    float _380 = _302 + _378;
    bool _382 = _302 >= (*spvDescriptorSet0.vp_c9)._m0[146].w;
    bool _384 = isnan(_302);
    bool _386 = _382 || _384;
    bool _388 = isnan((*spvDescriptorSet0.vp_c9)._m0[146].w);
    bool _390 = _386 || _388;
    float _392 = float(_390);
    float _394 = fma(_360, _340, (*spvDescriptorSet0.vp_c9)._m0[143].z);
    float _396 = 1.0 / _328;
    float _398 = _306 * _338;
    float _400 = -(*spvDescriptorSet0.vp_c9)._m0[147].w;
    float _402 = _302 + _400;
    bool _404 = _302 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _406 = isnan(_302);
    bool _408 = _404 || _406;
    bool _410 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _412 = _408 || _410;
    float _414 = float(_412);
    float _416 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _418 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _416;
    float _420 = _380 * _362;
    float _422 = -_376;
    float _424 = _422 + 1.0;
    float _426 = -_414;
    float _428 = _426 + 1.0;
    bool _430 = _302 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _432 = isnan(_302);
    bool _434 = _430 || _432;
    bool _436 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _438 = _434 || _436;
    float _440 = float(_438);
    float _442 = fma(_418, _340, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _444 = _356 * _424;
    float _446 = -_356;
    float _448 = _446 + 1.0;
    float _450 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _452 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _450;
    float _454 = _402 * _396;
    bool _456 = _302 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _458 = isnan(_302);
    bool _460 = _456 || _458;
    bool _462 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _464 = _460 || _462;
    float _466 = float(_464);
    float _468 = _392 * _448;
    float _470 = -_392;
    float _472 = _470 + 1.0;
    float _474 = fma(_452, _340, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _476 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _478 = _476 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _480 = _466 * _428;
    float _482 = -_466;
    float _484 = _482 + 1.0;
    float _486 = _414 * _472;
    float _488 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _490 = _488 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _492 = -(*spvDescriptorSet0.vp_c9)._m0[144].z;
    float _494 = _492 + (*spvDescriptorSet0.vp_c9)._m0[145].z;
    float _496 = _440 * _484;
    float _498 = -_440;
    float _500 = _498 + 1.0;
    float _502 = fma(_478, _398, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _504 = _442 * _496;
    float _506 = fma(_490, _398, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _508 = fma(_494, _398, (*spvDescriptorSet0.vp_c9)._m0[144].z);
    float _510 = _474 * _496;
    float _512 = _394 * _496;
    float _514 = -(*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _516 = (*spvDescriptorSet0.vp_c9)._m0[146].x + _514;
    float _518 = fma(_500, (*spvDescriptorSet0.vp_c9)._m0[143].x, _504);
    float _520 = fma(_500, (*spvDescriptorSet0.vp_c9)._m0[143].y, _510);
    float _522 = fma(_500, (*spvDescriptorSet0.vp_c9)._m0[143].z, _512);
    float _524 = -(*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _526 = (*spvDescriptorSet0.vp_c9)._m0[146].y + _524;
    float _528 = -(*spvDescriptorSet0.vp_c9)._m0[146].y;
    float _530 = _528 + (*spvDescriptorSet0.vp_c9)._m0[147].y;
    float _532 = -(*spvDescriptorSet0.vp_c9)._m0[146].z;
    float _534 = _532 + (*spvDescriptorSet0.vp_c9)._m0[147].z;
    float _536 = fma(_516, _364, (*spvDescriptorSet0.vp_c9)._m0[145].x);
    float _538 = fma(_502, _480, _518);
    float _540 = -(*spvDescriptorSet0.vp_c9)._m0[146].x;
    float _542 = _540 + (*spvDescriptorSet0.vp_c9)._m0[147].x;
    float _544 = -(*spvDescriptorSet0.vp_c9)._m0[145].z;
    float _546 = (*spvDescriptorSet0.vp_c9)._m0[146].z + _544;
    float _548 = fma(_534, _420, (*spvDescriptorSet0.vp_c9)._m0[146].z);
    float _550 = fma(_508, _480, _522);
    float _552 = fma(_536, _486, _538);
    float _554 = fma(_526, _364, (*spvDescriptorSet0.vp_c9)._m0[145].y);
    float _556 = fma(_530, _420, (*spvDescriptorSet0.vp_c9)._m0[146].y);
    float _558 = fma(_506, _480, _520);
    float _560 = fma(_546, _364, (*spvDescriptorSet0.vp_c9)._m0[145].z);
    float _562 = fma(_554, _486, _558);
    float _564 = -(*spvDescriptorSet0.vp_c9)._m0[147].x;
    float _566 = (*spvDescriptorSet0.vp_c9)._m0[148].x + _564;
    float _568 = fma(_542, _420, (*spvDescriptorSet0.vp_c9)._m0[146].x);
    float _570 = -(*spvDescriptorSet0.vp_c9)._m0[147].y;
    float _572 = (*spvDescriptorSet0.vp_c9)._m0[148].y + _570;
    float _574 = fma(_560, _486, _550);
    float _576 = -(*spvDescriptorSet0.vp_c9)._m0[147].z;
    float _578 = (*spvDescriptorSet0.vp_c9)._m0[148].z + _576;
    float _580 = fma(_566, _454, (*spvDescriptorSet0.vp_c9)._m0[147].x);
    float _582 = fma(_572, _454, (*spvDescriptorSet0.vp_c9)._m0[147].y);
    float _584 = fma(_556, _468, _562);
    float _586 = fma(_568, _468, _552);
    float _588 = fma(_578, _454, (*spvDescriptorSet0.vp_c9)._m0[147].z);
    float _590 = fma(_548, _468, _574);
    float _592 = fma(_582, _444, _584);
    float _594 = fma(_580, _444, _586);
    float _596 = fma(_588, _444, _590);
    float _598 = fma(_376, (*spvDescriptorSet0.vp_c9)._m0[148].y, _592);
    float _600 = fma(_376, (*spvDescriptorSet0.vp_c9)._m0[148].x, _594);
    float _602 = fma(_376, (*spvDescriptorSet0.vp_c9)._m0[148].z, _596);
    bool _604 = !_336;
    float _620;
    if (!_604)
    {
        float _606 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].x;
        float _608 = _172 * (*spvDescriptorSet0.vp_c9)._m0[12].y;
        float _610 = fma(_608, (*spvDescriptorSet0.vp_c9)._m0[11].x, _140);
        float _612 = _610 * _606;
        float _614 = floor(_612);
        float _616 = -_614;
        float _618 = _612 + _616;
        _620 = _618;
        _622 = true;
    }
    else
    {
        _620 = _186;
    }
    _622 = false;
    float _624 = _620;
    float _626 = in.m_61.x;
    float _628 = in.m_61.y;
    float _630 = in.m_61.z;
    float _632 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _634 = _624 + _632;
    float _636 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _638 = (*spvDescriptorSet0.vp_c9)._m0[108].w + _636;
    bool _640 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _642 = 1.0 / _638;
    float _644 = _598 * _628;
    float _646 = -(*spvDescriptorSet0.vp_c9)._m0[108].w;
    float _648 = _646 + (*spvDescriptorSet0.vp_c9)._m0[109].w;
    bool _650 = _624 >= (*spvDescriptorSet0.vp_c9)._m0[109].w;
    bool _652 = isnan(_624);
    bool _654 = _650 || _652;
    bool _656 = isnan((*spvDescriptorSet0.vp_c9)._m0[109].w);
    bool _658 = _654 || _656;
    float _660 = float(_658);
    float _662 = _602 * _630;
    float _664 = -(*spvDescriptorSet0.vp_c9)._m0[108].w;
    float _666 = _624 + _664;
    float _668 = 1.0 / _648;
    bool _670 = _624 >= (*spvDescriptorSet0.vp_c9)._m0[107].w;
    bool _672 = isnan(_624);
    bool _674 = _670 || _672;
    bool _676 = isnan((*spvDescriptorSet0.vp_c9)._m0[107].w);
    bool _678 = _674 || _676;
    float _680 = float(_678);
    float _682 = _634 * _642;
    bool _684 = _624 >= (*spvDescriptorSet0.vp_c9)._m0[108].w;
    bool _686 = isnan(_624);
    bool _688 = _684 || _686;
    bool _690 = isnan((*spvDescriptorSet0.vp_c9)._m0[108].w);
    bool _692 = _688 || _690;
    float _694 = float(_692);
    float _696 = -_660;
    float _698 = _696 + 1.0;
    float _700 = -(*spvDescriptorSet0.vp_c9)._m0[107].y;
    float _702 = (*spvDescriptorSet0.vp_c9)._m0[108].y + _700;
    float _704 = _694 * _698;
    float _706 = -_694;
    float _708 = _706 + 1.0;
    float _710 = -(*spvDescriptorSet0.vp_c9)._m0[107].x;
    float _712 = (*spvDescriptorSet0.vp_c9)._m0[108].x + _710;
    float _714 = -(*spvDescriptorSet0.vp_c9)._m0[107].z;
    float _716 = (*spvDescriptorSet0.vp_c9)._m0[108].z + _714;
    float _718 = fma(_702, _682, (*spvDescriptorSet0.vp_c9)._m0[107].y);
    float _720 = _680 * _708;
    float _722 = fma(_712, _682, (*spvDescriptorSet0.vp_c9)._m0[107].x);
    float _724 = fma(_716, _682, (*spvDescriptorSet0.vp_c9)._m0[107].z);
    float _726 = _666 * _668;
    float _728 = _718 * _720;
    float _730 = _722 * _720;
    float _732 = _724 * _720;
    float _734 = -(*spvDescriptorSet0.vp_c9)._m0[108].x;
    float _736 = _734 + (*spvDescriptorSet0.vp_c9)._m0[109].x;
    float _738 = -(*spvDescriptorSet0.vp_c9)._m0[108].y;
    float _740 = _738 + (*spvDescriptorSet0.vp_c9)._m0[109].y;
    float _742 = -(*spvDescriptorSet0.vp_c9)._m0[108].z;
    float _744 = _742 + (*spvDescriptorSet0.vp_c9)._m0[109].z;
    float _746 = -_680;
    float _748 = _746 + 1.0;
    float _750 = fma(_736, _726, (*spvDescriptorSet0.vp_c9)._m0[108].x);
    float _752 = fma(_740, _726, (*spvDescriptorSet0.vp_c9)._m0[108].y);
    float _754 = fma(_744, _726, (*spvDescriptorSet0.vp_c9)._m0[108].z);
    float _756 = fma(_748, (*spvDescriptorSet0.vp_c9)._m0[107].x, _730);
    float _758 = fma(_748, (*spvDescriptorSet0.vp_c9)._m0[107].y, _728);
    float _760 = fma(_748, (*spvDescriptorSet0.vp_c9)._m0[107].z, _732);
    float _762 = fma(_750, _704, _756);
    float _764 = fma(_752, _704, _758);
    float _766 = fma(_754, _704, _760);
    float _768 = _600 * _626;
    float _770 = fma(_660, (*spvDescriptorSet0.vp_c9)._m0[109].x, _762);
    float _772 = fma(_660, (*spvDescriptorSet0.vp_c9)._m0[109].y, _764);
    float _774 = fma(_660, (*spvDescriptorSet0.vp_c9)._m0[109].z, _766);
    bool _776 = !_640;
    float _792;
    if (!_776)
    {
        float _778 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _780 = _172 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _782 = fma(_780, (*spvDescriptorSet0.vp_c9)._m0[11].y, _140);
        float _784 = _782 * _778;
        float _786 = floor(_784);
        float _788 = -_786;
        float _790 = _784 + _788;
        _792 = _790;
        _794 = true;
    }
    else
    {
        _792 = _186;
    }
    _794 = false;
    float _796 = _792;
    float _798 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _800 = _796 + _798;
    float _802 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _804 = _802 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _806 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _808 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _806;
    float _810 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _812 = _810 + (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _814 = _796 >= (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _816 = isnan(_796);
    bool _818 = _814 || _816;
    bool _820 = isnan((*spvDescriptorSet0.vp_c9)._m0[117].w);
    bool _822 = _818 || _820;
    float _824 = float(_822);
    float _826 = 1.0 / _804;
    float _828 = -(*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _830 = _828 + (*spvDescriptorSet0.vp_c9)._m0[118].w;
    bool _832 = _796 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _834 = isnan(_796);
    bool _836 = _832 || _834;
    bool _838 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _840 = _836 || _838;
    float _842 = float(_840);
    bool _844 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].z;
    float _846 = 1.0 / _812;
    float _848 = _808 * _826;
    bool _850 = _796 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _852 = isnan(_796);
    bool _854 = _850 || _852;
    bool _856 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _858 = _854 || _856;
    float _860 = float(_858);
    float _862 = 1.0 / _830;
    float _864 = -_824;
    float _866 = _864 + 1.0;
    float _868 = fma(_848, _800, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _870 = -(*spvDescriptorSet0.vp_c9)._m0[118].w;
    float _872 = _870 + (*spvDescriptorSet0.vp_c9)._m0[119].w;
    bool _874 = _796 >= (*spvDescriptorSet0.vp_c9)._m0[118].w;
    bool _876 = isnan(_796);
    bool _878 = _874 || _876;
    bool _880 = isnan((*spvDescriptorSet0.vp_c9)._m0[118].w);
    bool _882 = _878 || _880;
    float _884 = float(_882);
    float _886 = -_860;
    float _888 = _886 + 1.0;
    float _890 = _860 * _866;
    float _892 = -(*spvDescriptorSet0.vp_c9)._m0[116].x;
    float _894 = _892 + (*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _896 = 1.0 / _872;
    float _898 = -_884;
    float _900 = _898 + 1.0;
    float _902 = _842 * _888;
    float _904 = -(*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _906 = (*spvDescriptorSet0.vp_c9)._m0[118].x + _904;
    float _908 = _894 * _846;
    float _910 = _824 * _900;
    float _912 = _868 * _902;
    float _914 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _916 = _796 + _914;
    float _918 = -_842;
    float _920 = _918 + 1.0;
    bool _922 = _796 >= (*spvDescriptorSet0.vp_c9)._m0[119].w;
    bool _924 = isnan(_796);
    bool _926 = _922 || _924;
    bool _928 = isnan((*spvDescriptorSet0.vp_c9)._m0[119].w);
    bool _930 = _926 || _928;
    float _932 = float(_930);
    float _934 = _906 * _862;
    float _936 = -(*spvDescriptorSet0.vp_c9)._m0[118].x;
    float _938 = _936 + (*spvDescriptorSet0.vp_c9)._m0[119].x;
    float _940 = -(*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _942 = _796 + _940;
    float _944 = fma(_908, _916, (*spvDescriptorSet0.vp_c9)._m0[116].x);
    float _946 = fma(_920, (*spvDescriptorSet0.vp_c9)._m0[115].x, _912);
    float _948 = -_932;
    float _950 = _948 + 1.0;
    float _952 = _938 * _896;
    float _954 = fma(_934, _942, (*spvDescriptorSet0.vp_c9)._m0[117].x);
    float _956 = -(*spvDescriptorSet0.vp_c9)._m0[118].w;
    float _958 = _796 + _956;
    float _960 = fma(_944, _890, _946);
    float _962 = _884 * _950;
    float _964 = _770 * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _966 = fma(_952, _958, (*spvDescriptorSet0.vp_c9)._m0[118].x);
    float _968 = fma(_954, _910, _960);
    float _970 = _772 * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _972 = _964 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _974 = fma(_966, _962, _968);
    float _976 = _774 * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _978 = _970 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _980 = fma(_932, (*spvDescriptorSet0.vp_c9)._m0[119].x, _974);
    float _982 = _976 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _984 = _980 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    out.m_63.x = _972;
    out.m_63.y = _978;
    out.m_63.z = _982;
    out.m_63.w = _984;
    bool _986 = !_844;
    float _1002;
    if (!_986)
    {
        float _988 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].z;
        float _990 = _172 * (*spvDescriptorSet0.vp_c9)._m0[12].w;
        float _992 = fma(_990, (*spvDescriptorSet0.vp_c9)._m0[11].z, _140);
        float _994 = _992 * _988;
        float _996 = floor(_994);
        float _998 = -_996;
        float _1000 = _994 + _998;
        _1002 = _1000;
        _1004 = true;
    }
    else
    {
        _1002 = _186;
    }
    _1004 = false;
    float _1006 = _1002;
    float _1008 = -(*spvDescriptorSet0.vp_c9)._m0[123].w;
    float _1010 = _1006 + _1008;
    bool _1012 = _1006 >= (*spvDescriptorSet0.vp_c9)._m0[125].w;
    bool _1014 = isnan(_1006);
    bool _1016 = _1012 || _1014;
    bool _1018 = isnan((*spvDescriptorSet0.vp_c9)._m0[125].w);
    bool _1020 = _1016 || _1018;
    float _1022 = float(_1020);
    float _1024 = -(*spvDescriptorSet0.vp_c9)._m0[124].w;
    float _1026 = _1006 + _1024;
    bool _1028 = _1006 >= (*spvDescriptorSet0.vp_c9)._m0[123].w;
    bool _1030 = isnan(_1006);
    bool _1032 = _1028 || _1030;
    bool _1034 = isnan((*spvDescriptorSet0.vp_c9)._m0[123].w);
    bool _1036 = _1032 || _1034;
    float _1038 = float(_1036);
    float _1040 = -(*spvDescriptorSet0.vp_c9)._m0[123].w;
    float _1042 = (*spvDescriptorSet0.vp_c9)._m0[124].w + _1040;
    float _1044 = -(*spvDescriptorSet0.vp_c9)._m0[124].w;
    float _1046 = _1044 + (*spvDescriptorSet0.vp_c9)._m0[125].w;
    bool _1048 = _1006 >= (*spvDescriptorSet0.vp_c9)._m0[124].w;
    bool _1050 = isnan(_1006);
    bool _1052 = _1048 || _1050;
    bool _1054 = isnan((*spvDescriptorSet0.vp_c9)._m0[124].w);
    bool _1056 = _1052 || _1054;
    float _1058 = float(_1056);
    float _1060 = 1.0 / _1042;
    float _1062 = -_1058;
    float _1064 = _1062 + 1.0;
    bool _1066 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].w;
    float _1068 = _1038 * _1064;
    float _1070 = -_1038;
    float _1072 = _1070 + 1.0;
    float _1074 = 1.0 / _1046;
    float _1076 = _1010 * _1060;
    float _1078 = -_1022;
    float _1080 = _1078 + 1.0;
    float _1082 = -(*spvDescriptorSet0.vp_c9)._m0[123].y;
    float _1084 = (*spvDescriptorSet0.vp_c9)._m0[124].y + _1082;
    float _1086 = _1058 * _1080;
    float _1088 = -(*spvDescriptorSet0.vp_c9)._m0[123].x;
    float _1090 = (*spvDescriptorSet0.vp_c9)._m0[124].x + _1088;
    float _1092 = -(*spvDescriptorSet0.vp_c9)._m0[123].z;
    float _1094 = (*spvDescriptorSet0.vp_c9)._m0[124].z + _1092;
    float _1096 = fma(_1084, _1076, (*spvDescriptorSet0.vp_c9)._m0[123].y);
    float _1098 = _1026 * _1074;
    float _1100 = fma(_1090, _1076, (*spvDescriptorSet0.vp_c9)._m0[123].x);
    float _1102 = fma(_1094, _1076, (*spvDescriptorSet0.vp_c9)._m0[123].z);
    float _1104 = _1096 * _1068;
    float _1106 = -(*spvDescriptorSet0.vp_c9)._m0[124].y;
    float _1108 = _1106 + (*spvDescriptorSet0.vp_c9)._m0[125].y;
    float _1110 = _1100 * _1068;
    float _1112 = _1102 * _1068;
    float _1114 = -(*spvDescriptorSet0.vp_c9)._m0[124].x;
    float _1116 = _1114 + (*spvDescriptorSet0.vp_c9)._m0[125].x;
    float _1118 = -(*spvDescriptorSet0.vp_c9)._m0[124].z;
    float _1120 = _1118 + (*spvDescriptorSet0.vp_c9)._m0[125].z;
    float _1122 = fma(_1072, (*spvDescriptorSet0.vp_c9)._m0[123].x, _1110);
    float _1124 = fma(_1072, (*spvDescriptorSet0.vp_c9)._m0[123].y, _1104);
    float _1126 = fma(_1116, _1098, (*spvDescriptorSet0.vp_c9)._m0[124].x);
    float _1128 = fma(_1108, _1098, (*spvDescriptorSet0.vp_c9)._m0[124].y);
    float _1130 = fma(_1120, _1098, (*spvDescriptorSet0.vp_c9)._m0[124].z);
    float _1132 = fma(_1072, (*spvDescriptorSet0.vp_c9)._m0[123].z, _1112);
    float _1134 = fma(_1126, _1086, _1122);
    float _1136 = fma(_1128, _1086, _1124);
    float _1138 = fma(_1130, _1086, _1132);
    float _1140 = fma(_1022, (*spvDescriptorSet0.vp_c9)._m0[125].x, _1134);
    float _1142 = fma(_1022, (*spvDescriptorSet0.vp_c9)._m0[125].y, _1136);
    float _1144 = fma(_1022, (*spvDescriptorSet0.vp_c9)._m0[125].z, _1138);
    bool _1146 = !_1066;
    float _1162;
    if (!_1146)
    {
        float _1148 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].w;
        float _1150 = _172 * (*spvDescriptorSet0.vp_c9)._m0[13].x;
        float _1152 = fma(_1150, (*spvDescriptorSet0.vp_c9)._m0[11].w, _140);
        float _1154 = _1152 * _1148;
        float _1156 = floor(_1154);
        float _1158 = -_1156;
        float _1160 = _1154 + _1158;
        _1162 = _1160;
        _1164 = true;
    }
    else
    {
        _1162 = _186;
    }
    _1164 = false;
    float _1166 = _1162;
    float _1168 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _1170 = _1166 + _1168;
    bool _1172 = _1166 >= (*spvDescriptorSet0.vp_c9)._m0[132].w;
    bool _1174 = isnan(_1166);
    bool _1176 = _1172 || _1174;
    bool _1178 = isnan((*spvDescriptorSet0.vp_c9)._m0[132].w);
    bool _1180 = _1176 || _1178;
    float _1182 = float(_1180);
    float _1184 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _1186 = _1184 + (*spvDescriptorSet0.vp_c9)._m0[132].w;
    bool _1188 = _1166 >= (*spvDescriptorSet0.vp_c9)._m0[131].w;
    bool _1190 = isnan(_1166);
    bool _1192 = _1188 || _1190;
    bool _1194 = isnan((*spvDescriptorSet0.vp_c9)._m0[131].w);
    bool _1196 = _1192 || _1194;
    float _1198 = float(_1196);
    float _1200 = -(*spvDescriptorSet0.vp_c9)._m0[131].x;
    float _1202 = (*spvDescriptorSet0.vp_c9)._m0[132].x + _1200;
    float _1204 = _1140 * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _1206 = -_1182;
    float _1208 = _1206 + 1.0;
    bool _1210 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[14].x;
    float _1212 = 1.0 / _1186;
    float _1214 = _1198 * _1208;
    float _1216 = -_1198;
    float _1218 = _1216 + 1.0;
    float _1220 = _1202 * _1212;
    float _1222 = _1144 * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _1224 = fma(_1220, _1170, (*spvDescriptorSet0.vp_c9)._m0[131].x);
    float _1226 = _1224 * _1214;
    float _1228 = _1142 * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _1230 = fma(_1218, (*spvDescriptorSet0.vp_c9)._m0[131].x, _1226);
    float _1232 = _1204 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1234 = _1228 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1236 = fma(_1182, (*spvDescriptorSet0.vp_c9)._m0[132].x, _1230);
    float _1238 = _1222 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1240 = _1236 * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    out.m_65.x = _1232;
    out.m_65.y = _1234;
    out.m_65.z = _1238;
    out.m_65.w = _1240;
    bool _1242 = !_1210;
    float _1258;
    if (!_1242)
    {
        float _1244 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[14].x;
        float _1246 = _172 * (*spvDescriptorSet0.vp_c9)._m0[15].x;
        float _1248 = fma(_1246, (*spvDescriptorSet0.vp_c9)._m0[14].x, _140);
        float _1250 = _1248 * _1244;
        float _1252 = floor(_1250);
        float _1254 = -_1252;
        float _1256 = _1250 + _1254;
        _1258 = _1256;
        _1260 = true;
    }
    else
    {
        _1258 = _186;
    }
    _1260 = false;
    float _1262 = _1258;
    float _1264 = -(*spvDescriptorSet0.vp_c9)._m0[159].w;
    float _1266 = (*spvDescriptorSet0.vp_c9)._m0[160].w + _1264;
    float _1268 = -(*spvDescriptorSet0.vp_c9)._m0[160].w;
    float _1270 = _1268 + (*spvDescriptorSet0.vp_c9)._m0[161].w;
    float _1272 = -(*spvDescriptorSet0.vp_c9)._m0[161].w;
    float _1274 = (*spvDescriptorSet0.vp_c9)._m0[162].w + _1272;
    float _1276 = -(*spvDescriptorSet0.vp_c9)._m0[162].w;
    float _1278 = _1276 + (*spvDescriptorSet0.vp_c9)._m0[163].w;
    float _1280 = -(*spvDescriptorSet0.vp_c9)._m0[163].w;
    float _1282 = (*spvDescriptorSet0.vp_c9)._m0[164].w + _1280;
    float _1284 = 1.0 / _1266;
    float _1286 = -(*spvDescriptorSet0.vp_c9)._m0[164].w;
    float _1288 = _1286 + (*spvDescriptorSet0.vp_c9)._m0[165].w;
    float _1290 = -(*spvDescriptorSet0.vp_c9)._m0[165].w;
    float _1292 = (*spvDescriptorSet0.vp_c9)._m0[166].w + _1290;
    bool _1294 = _1262 >= (*spvDescriptorSet0.vp_c9)._m0[161].w;
    bool _1296 = isnan(_1262);
    bool _1298 = _1294 || _1296;
    bool _1300 = isnan((*spvDescriptorSet0.vp_c9)._m0[161].w);
    bool _1302 = _1298 || _1300;
    float _1304 = float(_1302);
    float _1306 = 1.0 / _1270;
    float _1308 = -(*spvDescriptorSet0.vp_c9)._m0[159].w;
    float _1310 = _1262 + _1308;
    bool _1312 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[14].y;
    float _1314 = 1.0 / _1278;
    float _1316 = -(*spvDescriptorSet0.vp_c9)._m0[160].w;
    float _1318 = _1262 + _1316;
    float _1320 = _1310 * _1284;
    bool _1322 = _1262 >= (*spvDescriptorSet0.vp_c9)._m0[166].w;
    bool _1324 = isnan(_1262);
    bool _1326 = _1322 || _1324;
    bool _1328 = isnan((*spvDescriptorSet0.vp_c9)._m0[166].w);
    bool _1330 = _1326 || _1328;
    float _1332 = float(_1330);
    float _1334 = 1.0 / _1274;
    float _1336 = _1318 * _1306;
    float _1338 = -(*spvDescriptorSet0.vp_c9)._m0[161].w;
    float _1340 = _1262 + _1338;
    float _1342 = -(*spvDescriptorSet0.vp_c9)._m0[163].w;
    float _1344 = _1262 + _1342;
    float _1346 = 1.0 / _1282;
    float _1348 = -(*spvDescriptorSet0.vp_c9)._m0[162].w;
    float _1350 = _1262 + _1348;
    float _1352 = _1350 * _1314;
    bool _1354 = _1262 >= (*spvDescriptorSet0.vp_c9)._m0[165].w;
    bool _1356 = isnan(_1262);
    bool _1358 = _1354 || _1356;
    bool _1360 = isnan((*spvDescriptorSet0.vp_c9)._m0[165].w);
    bool _1362 = _1358 || _1360;
    float _1364 = float(_1362);
    float _1366 = 1.0 / _1292;
    float _1368 = _1340 * _1334;
    float _1370 = -_1332;
    float _1372 = _1370 + 1.0;
    float _1374 = -_1364;
    float _1376 = _1374 + 1.0;
    float _1378 = _1364 * _1372;
    float _1380 = _1344 * _1346;
    bool _1382 = _1262 >= (*spvDescriptorSet0.vp_c9)._m0[164].w;
    bool _1384 = isnan(_1262);
    bool _1386 = _1382 || _1384;
    bool _1388 = isnan((*spvDescriptorSet0.vp_c9)._m0[164].w);
    bool _1390 = _1386 || _1388;
    float _1392 = float(_1390);
    float _1394 = 1.0 / _1288;
    bool _1396 = _1262 >= (*spvDescriptorSet0.vp_c9)._m0[163].w;
    bool _1398 = isnan(_1262);
    bool _1400 = _1396 || _1398;
    bool _1402 = isnan((*spvDescriptorSet0.vp_c9)._m0[163].w);
    bool _1404 = _1400 || _1402;
    float _1406 = float(_1404);
    float _1408 = -(*spvDescriptorSet0.vp_c9)._m0[165].w;
    float _1410 = _1262 + _1408;
    float _1412 = _1392 * _1376;
    bool _1414 = _1262 >= (*spvDescriptorSet0.vp_c9)._m0[162].w;
    bool _1416 = isnan(_1262);
    bool _1418 = _1414 || _1416;
    bool _1420 = isnan((*spvDescriptorSet0.vp_c9)._m0[162].w);
    bool _1422 = _1418 || _1420;
    float _1424 = float(_1422);
    float _1426 = -_1392;
    float _1428 = _1426 + 1.0;
    float _1430 = -_1406;
    float _1432 = _1430 + 1.0;
    float _1434 = _1410 * _1366;
    float _1436 = -(*spvDescriptorSet0.vp_c9)._m0[159].z;
    float _1438 = (*spvDescriptorSet0.vp_c9)._m0[160].z + _1436;
    float _1440 = _1406 * _1428;
    float _1442 = _1424 * _1432;
    float _1444 = -_1424;
    float _1446 = _1444 + 1.0;
    float _1448 = -(*spvDescriptorSet0.vp_c9)._m0[159].x;
    float _1450 = (*spvDescriptorSet0.vp_c9)._m0[160].x + _1448;
    bool _1452 = _1262 >= (*spvDescriptorSet0.vp_c9)._m0[160].w;
    bool _1454 = isnan(_1262);
    bool _1456 = _1452 || _1454;
    bool _1458 = isnan((*spvDescriptorSet0.vp_c9)._m0[160].w);
    bool _1460 = _1456 || _1458;
    float _1462 = float(_1460);
    float _1464 = fma(_1438, _1320, (*spvDescriptorSet0.vp_c9)._m0[159].z);
    bool _1466 = _1262 >= (*spvDescriptorSet0.vp_c9)._m0[159].w;
    bool _1468 = isnan(_1262);
    bool _1470 = _1466 || _1468;
    bool _1472 = isnan((*spvDescriptorSet0.vp_c9)._m0[159].w);
    bool _1474 = _1470 || _1472;
    float _1476 = float(_1474);
    float _1478 = fma(_1450, _1320, (*spvDescriptorSet0.vp_c9)._m0[159].x);
    float _1480 = -(*spvDescriptorSet0.vp_c9)._m0[164].w;
    float _1482 = _1262 + _1480;
    float _1484 = -_1462;
    float _1486 = _1484 + 1.0;
    float _1488 = _1304 * _1446;
    float _1490 = -_1304;
    float _1492 = _1490 + 1.0;
    float _1494 = _1482 * _1394;
    float _1496 = _1476 * _1486;
    float _1498 = -(*spvDescriptorSet0.vp_c9)._m0[160].x;
    float _1500 = _1498 + (*spvDescriptorSet0.vp_c9)._m0[161].x;
    float _1502 = _1462 * _1492;
    float _1504 = -(*spvDescriptorSet0.vp_c9)._m0[160].z;
    float _1506 = _1504 + (*spvDescriptorSet0.vp_c9)._m0[161].z;
    float _1508 = _1478 * _1496;
    float _1510 = -_1476;
    float _1512 = _1510 + 1.0;
    float _1514 = _1464 * _1496;
    float _1516 = -(*spvDescriptorSet0.vp_c9)._m0[161].x;
    float _1518 = (*spvDescriptorSet0.vp_c9)._m0[162].x + _1516;
    float _1520 = fma(_1500, _1336, (*spvDescriptorSet0.vp_c9)._m0[160].x);
    float _1522 = fma(_1512, (*spvDescriptorSet0.vp_c9)._m0[159].x, _1508);
    float _1524 = -(*spvDescriptorSet0.vp_c9)._m0[161].z;
    float _1526 = (*spvDescriptorSet0.vp_c9)._m0[162].z + _1524;
    float _1528 = fma(_1506, _1336, (*spvDescriptorSet0.vp_c9)._m0[160].z);
    float _1530 = fma(_1512, (*spvDescriptorSet0.vp_c9)._m0[159].z, _1514);
    float _1532 = -(*spvDescriptorSet0.vp_c9)._m0[162].x;
    float _1534 = _1532 + (*spvDescriptorSet0.vp_c9)._m0[163].x;
    float _1536 = fma(_1518, _1368, (*spvDescriptorSet0.vp_c9)._m0[161].x);
    float _1538 = fma(_1520, _1502, _1522);
    float _1540 = fma(_1526, _1368, (*spvDescriptorSet0.vp_c9)._m0[161].z);
    float _1542 = -(*spvDescriptorSet0.vp_c9)._m0[162].z;
    float _1544 = _1542 + (*spvDescriptorSet0.vp_c9)._m0[163].z;
    float _1546 = fma(_1528, _1502, _1530);
    float _1548 = fma(_1534, _1352, (*spvDescriptorSet0.vp_c9)._m0[162].x);
    float _1550 = -(*spvDescriptorSet0.vp_c9)._m0[163].x;
    float _1552 = (*spvDescriptorSet0.vp_c9)._m0[164].x + _1550;
    float _1554 = fma(_1536, _1488, _1538);
    float _1556 = fma(_1544, _1352, (*spvDescriptorSet0.vp_c9)._m0[162].z);
    float _1558 = -(*spvDescriptorSet0.vp_c9)._m0[163].z;
    float _1560 = (*spvDescriptorSet0.vp_c9)._m0[164].z + _1558;
    float _1562 = fma(_1540, _1488, _1546);
    float _1564 = fma(_1552, _1380, (*spvDescriptorSet0.vp_c9)._m0[163].x);
    float _1566 = -(*spvDescriptorSet0.vp_c9)._m0[164].x;
    float _1568 = _1566 + (*spvDescriptorSet0.vp_c9)._m0[165].x;
    float _1570 = fma(_1548, _1442, _1554);
    float _1572 = fma(_1560, _1380, (*spvDescriptorSet0.vp_c9)._m0[163].z);
    float _1574 = -(*spvDescriptorSet0.vp_c9)._m0[164].z;
    float _1576 = _1574 + (*spvDescriptorSet0.vp_c9)._m0[165].z;
    float _1578 = fma(_1556, _1442, _1562);
    float _1580 = fma(_1568, _1494, (*spvDescriptorSet0.vp_c9)._m0[164].x);
    float _1582 = -(*spvDescriptorSet0.vp_c9)._m0[165].x;
    float _1584 = (*spvDescriptorSet0.vp_c9)._m0[166].x + _1582;
    float _1586 = fma(_1576, _1494, (*spvDescriptorSet0.vp_c9)._m0[164].z);
    float _1588 = -(*spvDescriptorSet0.vp_c9)._m0[165].z;
    float _1590 = (*spvDescriptorSet0.vp_c9)._m0[166].z + _1588;
    float _1592 = fma(_1564, _1440, _1570);
    float _1594 = fma(_1572, _1440, _1578);
    float _1596 = fma(_1584, _1434, (*spvDescriptorSet0.vp_c9)._m0[165].x);
    float _1598 = fma(_1590, _1434, (*spvDescriptorSet0.vp_c9)._m0[165].z);
    float _1600 = fma(_1580, _1412, _1592);
    float _1602 = fma(_1586, _1412, _1594);
    float _1604 = fma(_1596, _1378, _1600);
    float _1606 = fma(_1598, _1378, _1602);
    float _1608 = fma(_1332, (*spvDescriptorSet0.vp_c9)._m0[166].x, _1604);
    float _1610 = fma(_1332, (*spvDescriptorSet0.vp_c9)._m0[166].z, _1606);
    out.m_67.x = _1608;
    out.m_67.z = _1610;
    bool _1612 = !_1312;
    int _1614 = as_type<int>(_1440);
    float _1616 = _1434;
    float _1618 = _1600;
    if (!_1612)
    {
        float _1620 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[14].y;
        float _1622 = _172 * (*spvDescriptorSet0.vp_c9)._m0[15].y;
        float _1624 = fma(_1622, (*spvDescriptorSet0.vp_c9)._m0[14].y, _140);
        float _1626 = _1624 * _1620;
        float _1628 = floor(_1626);
        float _1630 = -_1628;
        float _1632 = _1626 + _1630;
        _188 = _1632;
    }
    float _1634 = _188;
    float _1636 = in.m_69.y;
    float _1638 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    float _1640 = in.m_57.w;
    int _1642 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _1644 = _1642 != 0;
    int _1646 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _1648 = _1646 != 0;
    float _1650 = in.m_69.x;
    int _1652 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _1654 = _1652 != 0;
    float _1656 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    float _1658 = in.m_57.z;
    float _1660 = in.m_57.y;
    float _1662 = (*spvDescriptorSet0.vp_c9)._m0[83].z + (*spvDescriptorSet0.vp_c9)._m0[83].x;
    float _1664 = _1638 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    float _1666 = (*spvDescriptorSet0.vp_c9)._m0[82].y + (*spvDescriptorSet0.vp_c9)._m0[81].w;
    float _1668 = (*spvDescriptorSet0.vp_c9)._m0[83].w + (*spvDescriptorSet0.vp_c9)._m0[83].y;
    int _1670 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _1672 = _1670 != 0;
    float _1674 = -_1636;
    float _1676 = _1674 + 1.0;
    bool _1678 = _1640 > 0.5;
    int _1680 = _1678 ? as_type<int>(_1676) : as_type<int>(_1636);
    bool _1682 = _1678;
    float _1684 = (*spvDescriptorSet0.vp_c9)._m0[7].z;
    float _1686 = _1664;
    float _1688 = _1636;
    if (_1644)
    {
        float _1690 = -_1650;
        float _1692 = _1690 + 1.0;
        _1614 = as_type<int>(_1692);
    }
    int _1694 = _1614;
    if (!_1644)
    {
        _1616 = _1650;
    }
    float _1696 = _1616;
    float _1698 = _1654 ? as_type<float>(_1680) : _1636;
    float _1700 = _1696;
    float _1702 = _1698;
    if (_1644)
    {
        bool _1704 = _1658 > 0.5;
        _1682 = _1704;
    }
    bool _1706 = _1682;
    if (!_1648)
    {
        _1684 = _1658;
    }
    float _1708 = _1684;
    float _1710 = fma(_1698, _1664, -0.5);
    float _1712 = _1708;
    if (!_1648)
    {
        _1686 = _1660;
    }
    float _1714 = _1686;
    float _1716 = _1714;
    if (_1644)
    {
        float _1718 = _1706 ? as_type<float>(_1694) : _1650;
        _1700 = _1718;
    }
    float _1720 = _1700;
    if (_1648)
    {
        _1716 = _172;
    }
    float _1722 = _1716;
    if (_1648)
    {
        _1712 = _1660;
    }
    float _1724 = _1712;
    float _1726 = fma(_1722, (*spvDescriptorSet0.vp_c9)._m0[83].z, _1662);
    if (!_1648)
    {
        _1702 = _1658;
    }
    float _1728 = _1702;
    float _1730 = _1724 * (*spvDescriptorSet0.vp_c9)._m0[82].y;
    float _1732 = _1728;
    if (_1648)
    {
        _1732 = _1660;
    }
    float _1734 = _1732;
    float _1736 = (*spvDescriptorSet0.vp_c9)._m0[82].x + (*spvDescriptorSet0.vp_c9)._m0[81].z;
    float _1738 = _1722 * (*spvDescriptorSet0.vp_c9)._m0[82].x;
    float _1740 = _1656 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    float _1742 = fma(_1730, -2.0, _1666);
    float _1744 = fma(_1734, (*spvDescriptorSet0.vp_c9)._m0[83].w, _1668);
    float _1746 = -_1736;
    float _1748 = fma(_1738, 2.0, _1746);
    float _1750 = fma(_1740, _1720, -0.5);
    float _1752 = fma(_140, (*spvDescriptorSet0.vp_c9)._m0[81].y, _1742);
    float _1754 = fma(_140, (*spvDescriptorSet0.vp_c9)._m0[82].w, _1744);
    float _1756 = fma(_140, (*spvDescriptorSet0.vp_c9)._m0[82].z, _1726);
    float _1758 = -_140;
    float _1760 = fma(_1758, (*spvDescriptorSet0.vp_c9)._m0[81].x, _1748);
    if (!_1672)
    {
        _1618 = _1650;
    }
    float _1762 = _1618;
    float _1764 = -_1752;
    float _1766 = fma(_1754, _1710, _1764);
    float _1768 = fma(_1756, _1750, _1760);
    float _1770 = _1766 + 0.5;
    float _1772 = _1768 + 0.5;
    float2 _7080 = float2(_1772, _1770);
    float _1774 = dm_bs(spvDescriptorSet0.vp_t_tcb_A.sample(spvDescriptorSet0.vp_t_tcb_ASmplr, select(_7080, float2(0.0), isnan(_7080)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_A, spvDescriptorSet0.vp_t_tcb_ASmplr_w, select(_7080, float2(0.0), isnan(_7080)), level(0.0)).w;
    float _1776 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].y);
    int _1778 = int(_1776);
    float _1780 = in.m_48.x;
    float _1782 = in.m_48.y;
    float _1784 = in.m_48.z;
    float _1786 = _172 * 2.0;
    float _1788 = _280 * _644;
    float _1790 = in.m_71.x;
    float _1792 = in.m_71.y;
    float _1794 = in.m_71.z;
    float _1796 = in.m_71.w;
    int _1798 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 16;
    bool _1800 = _1798 != 0;
    int _1802 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 32;
    bool _1804 = _1802 != 0;
    int _1806 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 64;
    bool _1808 = _1806 != 0;
    float _1810 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].x);
    int _1812 = int(_1810);
    float _1814 = in.m_73.x;
    float _1816 = in.m_73.y;
    float _1818 = in.m_73.z;
    float _1820 = in.m_73.w;
    float _1822 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _1824 = _1788 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _1826 = in.m_75.x;
    float _1828 = in.m_75.y;
    float _1830 = in.m_75.z;
    float _1832 = in.m_75.w;
    float _1834 = float(_1778);
    float _1836 = floor(_1786);
    float _1838 = _280 * _768;
    float _1840 = _280 * _662;
    float _1842 = _1660 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    float _1844 = _1838 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _1846 = _1840 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _1848 = float(uint(_1812));
    float _1850 = 1.0 / _1834;
    float _1852 = fma(_1842, -2.0, _1822);
    float _1854 = _1660 * 2.0;
    int _1856 = ~_1812;
    int _1858 = _1856 + 1;
    float _1860 = _1782 * _1792;
    float _1862 = 1.0 / _1848;
    float _1864 = fma(_1780, _1790, _1860);
    float _1866 = _1782 * _1816;
    float _1868 = _1782 * _1828;
    float _1870 = _172 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    bool _1872 = _1836 > 0.0;
    float _1874 = fma(_1780, _1814, _1866);
    float _1876 = _1850 * _140;
    float _1878 = fma(_1780, _1826, _1868);
    float _1880 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    float _1882 = float(_1812);
    float _1884 = fma(_1784, _1818, _1874);
    float _1886 = trunc(_1876);
    int _1888 = int(_1886);
    float _1890 = -_1880;
    float _1892 = fma(_1870, 2.0, _1890);
    int _1894 = as_type<int>(_1862) + (-2);
    float _1896 = fma(_1784, _1794, _1864);
    bool _1898 = !_1648;
    float _1900 = _1898 ? 7.345489978790283203125 : 1.0;
    float _1902 = _172 + _1660;
    float _1904 = _1882 * _140;
    float _1906 = fma(_1784, _1830, _1878);
    float _1908 = floor(_1854);
    bool _1910 = _1836 >= 0.0;
    bool _1912 = isnan(_1836);
    bool _1914 = _1910 || _1912;
    bool _1916 = isnan(0.0);
    bool _1918 = _1914 || _1916;
    float _1920 = _1902 + (-1.0);
    int _1922 = ~_1812;
    int _1924 = _1922 + 1;
    float _1926 = _1904 * _182;
    float _1928 = _1900 * _172;
    int _1930 = _1918 ? 0 : 1;
    float _1932 = _1658 * 2.0;
    float _1934 = float(uint(_1888));
    float _1936 = fma(_1920, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    float _1938 = _1660 + _1658;
    int _1940 = ~_1930;
    int _1942 = _1940 + 1;
    int _1944 = _1942 + 1;
    float _1946 = _172 + _1658;
    float _1948 = as_type<float>(_1894) * _1934;
    int _1950 = _1944;
    float _1952 = _1762;
    if (!_1872)
    {
        int _1954 = ~_1930;
        int _1956 = _1954 + 1;
        _1950 = _1956;
    }
    int _1958 = _1950;
    float _1960 = _1938 + (-1.0);
    bool _1962 = !_1804;
    int _1964 = _1962 ? 0 : 1;
    float _1966 = floor(_1932);
    bool _1968 = !_1800;
    int _1970 = _1968 ? 0 : 1;
    float _1972 = _1946 + (-1.0);
    bool _1974 = !_1808;
    int _1976 = _1974 ? 0 : 1;
    float _1978 = _1658 + (-0.5);
    float _1980 = fma(_1972, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    int _1982 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _1984 = _1982 != 0;
    int _1986 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _1988 = _1986 != 0;
    int _1990 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _1992 = _1990 != 0;
    float _1994 = trunc(_1948);
    float _1996 = precise::max(_1994, 0.0);
    uint _1999 = uint(_1996);
    bool _2001 = _1908 >= 0.0;
    bool _2003 = isnan(_1908);
    bool _2005 = _2001 || _2003;
    bool _2007 = isnan(0.0);
    bool _2009 = _2005 || _2007;
    float _2011 = fma(_1960, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    bool _2013 = _1908 > 0.0;
    float _2015 = _1906 + _1832;
    bool _2017 = !_1988;
    int _2019 = _2017 ? 0 : 1;
    float _2021 = float(_1958);
    float _2023 = floor(_1928);
    int _2025 = abs(_2019);
    float _2027 = _1896 + _1796;
    int _2029 = _2009 ? 0 : 1;
    float _2031 = float(_2025);
    bool _2033 = _1966 > 0.0;
    int _2035 = _1924 * int(_1999);
    int _2037 = _2035 + _1888;
    int _2039 = ~_2029;
    int _2041 = _2039 + 1;
    int _2043 = _2041 + 1;
    float _2045 = _2031 * _2021;
    int _2047 = _2043;
    float _2049 = _2027;
    if (!_2013)
    {
        int _2051 = ~_2029;
        int _2053 = _2051 + 1;
        _2047 = _2053;
    }
    int _2055 = _2047;
    float _2057 = trunc(_1926);
    int _2059 = int(_2057);
    float _2061 = float(uint(_2037));
    float _2063 = _2045 * (-2.0);
    bool _2065 = _1966 >= 0.0;
    bool _2067 = isnan(_1966);
    bool _2069 = _2065 || _2067;
    bool _2071 = isnan(0.0);
    bool _2073 = _2069 || _2071;
    float _2075 = -_2023;
    float _2077 = _1928 + _2075;
    float _2079 = float(_1888);
    float _2081 = as_type<float>(_1894) * _2061;
    float _2083 = _1884 + _1820;
    float _2085 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _2087 = log2(_2085);
    int _2089 = _2073 ? 0 : 1;
    bool _2091 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _2093 = isnan(1.0);
    bool _2095 = _2091 || _2093;
    bool _2097 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _2099 = _2095 || _2097;
    float _2101 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _2103 = 1.0 + _2101;
    bool _2105 = !_1992;
    int _2107 = _2105 ? 0 : 1;
    float _2109 = trunc(_2081);
    float _2111 = precise::max(_2109, 0.0);
    uint _2113 = uint(_2111);
    int _2115 = ~_2089;
    int _2117 = _2115 + 1;
    int _2119 = _2117 + 1;
    float _2121 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    bool _2123 = _2079 >= _1882;
    bool _2125 = isnan(_2079);
    bool _2127 = _2123 || _2125;
    bool _2129 = isnan(_1882);
    bool _2131 = _2127 || _2129;
    float _2133 = float(_2131);
    int _2135 = _2119;
    if (!_2033)
    {
        int _2137 = ~_2089;
        int _2139 = _2137 + 1;
        _2135 = _2139;
    }
    int _2141 = _2135;
    float _2143 = fma(_1660, (*spvDescriptorSet0.vp_c9)._m0[78].w, _2121);
    bool _2145 = !_1984;
    int _2147 = _2145 ? 0 : 1;
    float _2149 = _2087 * _140;
    float _2151 = _2077 * _1882;
    float _2153 = 1.0 / _2103;
    float _2155 = in.m_77.x;
    float _2157 = in.m_77.y;
    float _2159 = in.m_77.z;
    int _2161 = abs(_2107);
    float _2163 = _172 * 6.283185482025146484375;
    bool _2165 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _2167 = isnan(0.0);
    bool _2169 = _2165 || _2167;
    bool _2171 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _2173 = _2169 || _2171;
    int _2175 = int(_1999) + int(_2113);
    float _2177 = _2163 * 0.15915493667125701904296875;
    float _2179 = exp2(_2149);
    float _2181 = _2163 + _140;
    int _2183 = abs(_2147);
    float _2185 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    int _2187 = abs(_1964);
    float _2189 = trunc(_2133);
    int _2191 = int(_2189);
    int _2193 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 128;
    bool _2195 = _2193 != 0;
    float _2197 = fma(_172, (*spvDescriptorSet0.vp_c9)._m0[78].z, _2185);
    float _2199 = _2181 * 0.070000000298023223876953125;
    int _2201 = abs(_1976);
    float _2203 = fma(_140, (*spvDescriptorSet0.vp_c9)._m0[77].z, _2197);
    float _2205 = -_140;
    float _2207 = fma(_2205, (*spvDescriptorSet0.vp_c9)._m0[76].x, _1892);
    float _2209 = -_2179;
    float _2211 = _2209 + 1.0;
    float _2213 = fma(_140, (*spvDescriptorSet0.vp_c9)._m0[77].w, _2143);
    float _2215 = float(_2161);
    float _2217 = trunc(_2151);
    int _2219 = int(_2217);
    float _2221 = float(_2055);
    float _2223 = float(_2183);
    float _2225 = _2173 ? _2211 : 0.0;
    float _2227 = _2215 * _2221;
    float _2229 = float(_2141);
    float _2231 = fma(_140, (*spvDescriptorSet0.vp_c9)._m0[76].y, _1852);
    int _2233 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4096;
    bool _2235 = _2233 != 0;
    if (_2099)
    {
        float _2237 = _2225 * _2153;
        _150 = _2237;
    }
    float _2239 = _150;
    int _2241 = _1858 * _2175;
    int _2243 = _2241 + _1888;
    float _2245 = _2223 * _2229;
    float _2247 = fma(_2011, _2063, _2011);
    float _2249 = fma(_2063, _2157, _2157);
    bool _2251 = !_2235;
    int _2253 = _2251 ? 0 : 1;
    float _2255 = _2245 * (-2.0);
    bool _2257 = uint(_2243) >= uint(_1812);
    float _2259 = _1660 + (-0.5);
    bool _2261 = _1812 == 0;
    float _2263 = fma(_1936, _2255, _1936);
    float _2265 = fma(_2255, _2155, _2155);
    bool _2267 = !_2257;
    int _2269 = _2267 ? 0 : (-1);
    float _2271 = fma(_2259, (*spvDescriptorSet0.vp_c9)._m0[196].y, _2249);
    int _2273 = abs(_2253);
    float _2275 = _2227 * (-2.0);
    int _2277 = ~_2175;
    int _2279 = _2277 + _2269;
    int _2281 = _2279 + 1;
    float _2283 = _172 + (-0.5);
    float _2285 = fma(_1980, _2275, _1980);
    float _2287 = fma(_2275, _2159, _2159);
    int _2289 = _1812 * _2281;
    int _2291 = _2289 + _1888;
    float _2293 = fma(_2283, (*spvDescriptorSet0.vp_c9)._m0[196].x, _2265);
    float _2295 = fma(_2247, _2239, _2271);
    float _2297 = in.m_79.x;
    float _2299 = in.m_79.y;
    float _2301 = in.m_79.z;
    int _2303 = ~_2191;
    int _2305 = _2303 + 1;
    int _2307 = _2305 + 1;
    int _2309 = _2219 * _2273;
    int _2311 = _2309 + _1888;
    bool _2313 = !_2261;
    int _2315 = _2313 ? _2291 : (-1);
    float _2317 = _2177 * 6.283185482025146484375;
    float _2319 = sin(_2317);
    int _2321 = _1812 + (-1);
    float _2323 = fma(_1978, (*spvDescriptorSet0.vp_c9)._m0[196].z, _2287);
    float _2325 = fma(_2263, _2239, _2293);
    int _2327 = _2315 * _2307;
    int _2329 = abs(_1970);
    float _2331 = fma(_2285, _2239, _2323);
    float _2333 = _2177 * 6.283185482025146484375;
    float _2335 = cos(_2333);
    int _2337 = _2191 * _2321;
    int _2339 = _2337 + _2327;
    float _2341 = _2295 * 0.15915493667125701904296875;
    float _2343 = _2325 * 0.15915493667125701904296875;
    int _2345 = _2339 * _2187;
    float _2347 = _2331 * 0.15915493667125701904296875;
    bool _2349 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[660].y;
    bool _2351 = isnan(0.5);
    bool _2353 = _2349 || _2351;
    bool _2355 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _2357 = _2353 || _2355;
    float _2359 = _2341 * 6.283185482025146484375;
    float _2361 = sin(_2359);
    int _2363 = _2059 * _2329;
    int _2365 = _2363 + _2345;
    bool _2367 = !_2195;
    int _2369 = _2367 ? 0 : 1;
    float _2371 = _2319 * _2299;
    int _2373 = _2311 * _2201;
    int _2375 = _2373 + _2365;
    int _2377 = abs(_2369);
    float _2379 = _2027 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _2381 = _2335 * _2299;
    float _2383 = -_2371;
    float _2385 = fma(_2335, _2297, _2383);
    float _2387 = _2341 * 6.283185482025146484375;
    float _2389 = cos(_2387);
    float _2391 = fma(_2319, _2297, _2381);
    float _2393 = fma(_2083, (*spvDescriptorSet0.vp_c8)._m0[11].x, _2379);
    bool _2395 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[653].w;
    bool _2397 = isnan(0.5);
    bool _2399 = _2395 || _2397;
    bool _2401 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _2403 = _2399 || _2401;
    int _2405 = _2219 * _2377;
    int _2407 = _2405 + _2375;
    float _2409 = fma(_2015, (*spvDescriptorSet0.vp_c8)._m0[11].z, _2393);
    float _2411 = _2343 * 6.283185482025146484375;
    float _2413 = sin(_2411);
    float _2415 = _2343 * 6.283185482025146484375;
    float _2417 = cos(_2415);
    float _2419 = _2347 * 6.283185482025146484375;
    float _2421 = cos(_2419);
    float _2423 = _2413 * _2389;
    float _2425 = _2417 * _2389;
    float _2427 = _2417 * _2361;
    float _2429 = _2347 * 6.283185482025146484375;
    float _2431 = sin(_2429);
    float _2433 = _2389 * _2421;
    float _2435 = _2417 * _2421;
    float _2437 = -_2427;
    float _2439 = fma(_2431, _2423, _2437);
    float _2441 = -_2423;
    float _2443 = fma(_2431, _2427, _2441);
    float _2445 = fma(_1774, 6.283185482025146484375, _2199);
    float _2447 = _2445 * 0.15915493667125701904296875;
    float _2449 = _2413 * _2361;
    float _2451 = _2413 * _2421;
    float _2453 = _2361 * _2421;
    float _2455 = fma(_2431, _2425, _2449);
    float _2457 = _2447 * 6.283185482025146484375;
    float _2459 = sin(_2457);
    float _2461 = fma(_2431, _2449, _2425);
    float _2463 = _2459 * 0.100000001490116119384765625;
    float _2465 = fma(_2391, _2463, _2391);
    float _2467 = fma(_2385, _2463, _2385);
    float _2469 = fma(_2463, _2301, _2301);
    float _2471 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _2465);
    float _2473 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _2467);
    float _2475 = _1824 * _2471;
    float _2477 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _2469);
    float _2479 = _1844 * _2473;
    float _2481 = _2435 * _2475;
    float _2483 = _1846 * _2477;
    float _2485 = -_2475;
    float _2487 = _2431 * _2485;
    float _2489 = _2451 * _2475;
    float _2491 = fma(_2455, _2479, _2481);
    float _2493 = fma(_2433, _2479, _2487);
    float _2495 = fma(_2439, _2479, _2489);
    float _2497 = fma(_2443, _2483, _2491);
    float _2499 = _2027 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _2501 = fma(_2453, _2483, _2493);
    float _2503 = fma(_2461, _2483, _2495);
    float _2505 = _2497 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _2507 = _2497 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _2509 = fma(_2083, (*spvDescriptorSet0.vp_c8)._m0[10].x, _2499);
    float _2511 = fma(_2501, (*spvDescriptorSet0.vp_c8)._m0[26].x, _2505);
    float _2513 = fma(_2501, (*spvDescriptorSet0.vp_c8)._m0[24].x, _2507);
    float _2515 = fma(_2015, (*spvDescriptorSet0.vp_c8)._m0[10].z, _2509);
    float _2517 = _2409 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _2519 = fma(_2503, (*spvDescriptorSet0.vp_c8)._m0[26].z, _2511);
    float _2521 = fma(_2503, (*spvDescriptorSet0.vp_c8)._m0[24].z, _2513);
    float _2523 = _2515 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _2525 = _2519 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _2527 = _2521 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _2529 = _2523 + _2517;
    float _2531 = _2015 + _2525;
    float _2533 = _2083 + _2527;
    float _2535 = 1.0 / _2517;
    float _2537 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _2539 = _2531 + _2537;
    float _2541 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _2543 = _2533 + _2541;
    float _2545 = _2539 * _2539;
    float _2547 = fma(_2543, _2543, _2545);
    float _2549 = _2497 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _2551 = sqrt(_2547);
    float _2553 = fma(_2501, (*spvDescriptorSet0.vp_c8)._m0[25].x, _2549);
    float _2555 = _2529 * _2535;
    float _2557 = _2555 * 0.5;
    float _2559 = fma(_2503, (*spvDescriptorSet0.vp_c8)._m0[25].z, _2553);
    float _2561 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _2563 = fma(_2557, (*spvDescriptorSet0.vp_c8)._m0[30].w, _2561);
    float _2565 = _2559 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _2567 = 1.0 / _2563;
    float _2569 = _2027 + _2565;
    bool _2571 = _2551 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2573 = _2549;
    float _2575 = _2535;
    float _2577 = _2559;
    float _2579 = _2569;
    float _2581 = _2547;
    float _2583 = _2531;
    bool _2585 = _2357;
    if (!_2571)
    {
        _2573 = _2533;
    }
    float _2587 = _2573;
    float _2589 = _2587;
    if (!_2571)
    {
        _2575 = _2531;
    }
    float _2591 = _2575;
    float _2593 = _2591;
    if (!_2571)
    {
        _2577 = _2569;
    }
    float _2595 = _2577;
    bool _2597 = !_2571;
    float _2599 = _2595;
    if (!_2597)
    {
        float _2601 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _2603 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _2605 = _2551 + _2603;
        float _2607 = _2569 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _2609 = rsqrt(_2547);
        float _2611 = _2605 * _2601;
        float _2613 = _2611 * 0.15915493667125701904296875;
        float _2615 = _2613 * 6.283185482025146484375;
        float _2617 = cos(_2615);
        float _2619 = _2613 * 6.283185482025146484375;
        float _2621 = sin(_2619);
        float _2623 = _2617 + (-1.0);
        float _2625 = _2623 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _2627 = fma(_2621, _2607, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _2629 = fma(_2569, _2617, _2625);
        float _2631 = _2609 * _2627;
        float _2633 = fma(_2543, _2631, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _2635 = fma(_2539, _2631, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _2589 = _2633;
        _2599 = _2629;
        _2593 = _2635;
    }
    float _2637 = _2589;
    float _2639 = _2599;
    float _2641 = _2593;
    float _2643 = _2639;
    float _2645 = _2637;
    float _2647 = _2641;
    if (!_2357)
    {
        float _2649 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
        float _2651 = _2027 + _2649;
        float _2653 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
        float _2655 = _2083 + _2653;
        float _2657 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _2659 = _2651 * _2651;
        float _2661 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
        float _2663 = _2015 + _2661;
        float _2665 = fma(_2655, _2655, _2659);
        float _2667 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _2669 = fma(_2663, _2663, _2665);
        float _2671 = sqrt(_2669);
        float _2673 = _2657 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _2675 = -_2083;
        float _2677 = _2675 + _2637;
        float _2679 = precise::min(_2671, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _2681 = _2679 * _2667;
        float _2683 = _2673 * _2681;
        float _2685 = -_2027;
        float _2687 = _2685 + _2639;
        float _2689 = -_2015;
        float _2691 = _2689 + _2641;
        float _2693 = fma(_2677, _2683, _2083);
        float _2695 = fma(_2687, _2683, _2027);
        float _2697 = fma(_2691, _2683, _2015);
        _2643 = _2695;
        _2645 = _2693;
        _2647 = _2697;
        _2579 = _2691;
    }
    float _2699 = _2643;
    float _2701 = _2645;
    float _2703 = _2647;
    float _2705 = _2579;
    float _2707 = _2705;
    if (_2403)
    {
        _2581 = 1.0;
    }
    float _2709 = _2581;
    float _2711 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _2713 = _2567 * _2711;
    float _2715 = _2709;
    float _2717 = _2713;
    if (!_2403)
    {
        float _2719 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _2721 = _2719 * 0.15915493667125701904296875;
        float _2723 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _2725 = _2721 * 6.283185482025146484375;
        float _2727 = cos(_2725);
        float _2729 = _2723 * 0.15915493667125701904296875;
        float _2731 = _2721 * 6.283185482025146484375;
        float _2733 = sin(_2731);
        float _2735 = 1.0 / _2727;
        float _2737 = _2729 * 6.283185482025146484375;
        float _2739 = cos(_2737);
        float _2741 = _2733 * _2735;
        float _2743 = _2729 * 6.283185482025146484375;
        float _2745 = sin(_2743);
        float _2747 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _2749 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _2747;
        float _2751 = _2739 * _2741;
        float _2753 = 1.0 / _2751;
        float _2755 = 1.0 / _2749;
        float _2757 = _2745 * _2753;
        float _2759 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _2761 = fma(_2713, _2757, _2759);
        float _2763 = _2761 * _2755;
        float _2765 = precise::clamp(_2763, 0.0, 1.0);
        _2583 = _2721;
        _2707 = _2729;
        _2715 = _2765;
    }
    float _2767 = _2583;
    float _2769 = _2707;
    float _2771 = _2715;
    float _2773 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _2775 = _2699 + _2773;
    float _2777 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _2779 = _2701 + _2777;
    float _2781 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _2783 = _2703 + _2781;
    float _2785 = _2775 * _2775;
    float _2787 = in.m_81.w;
    float _2789 = fma(_2779, _2779, _2785);
    float _2791 = fma(_2015, (*spvDescriptorSet0.vp_c15)._m0[652].y, (*spvDescriptorSet0.vp_c15)._m0[652].w);
    float _2793 = fma(_2783, _2783, _2789);
    float _2795 = -(*spvDescriptorSet0.vp_c9)._m0[167].w;
    float _2797 = _2795 + (*spvDescriptorSet0.vp_c9)._m0[168].w;
    float _2799 = -(*spvDescriptorSet0.vp_c9)._m0[168].w;
    float _2801 = _2799 + (*spvDescriptorSet0.vp_c9)._m0[169].w;
    float _2803 = rsqrt(_2793);
    float _2805 = float(uint(_2407));
    float _2807 = -(*spvDescriptorSet0.vp_c9)._m0[170].w;
    float _2809 = _2807 + (*spvDescriptorSet0.vp_c9)._m0[171].w;
    float _2811 = sqrt(_2793);
    float _2813 = -(*spvDescriptorSet0.vp_c9)._m0[171].w;
    float _2815 = _2813 + (*spvDescriptorSet0.vp_c9)._m0[172].w;
    float _2817 = -(*spvDescriptorSet0.vp_c9)._m0[169].w;
    float _2819 = _2817 + (*spvDescriptorSet0.vp_c9)._m0[170].w;
    float _2821 = _2803 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _2823 = 1.0 / _2797;
    float _2825 = _2779 * _2821;
    float _2827 = _2783 * _2821;
    float _2829 = _2825 * _2825;
    float _2831 = _2827 * _2827;
    float _2833 = 1.0 / _2801;
    float _2835 = _2829 + _2831;
    float _2837 = sqrt(_2835);
    float _2839 = 1.0 / _2809;
    bool _2841 = _2837 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2843 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2845 = _2837 + _2843;
    float _2847 = 1.0 / _2815;
    float _2849 = 1.0 / _2819;
    float _2851 = _2783;
    float _2853 = _2769;
    float _2855 = _2845;
    float _2857 = _2767;
    float _2859 = _2835;
    float _2861 = _2775;
    if (_2841)
    {
        float _2863 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2851 = _2863;
    }
    float _2865 = _2851;
    if (_2841)
    {
        float _2867 = rsqrt(_2835);
        _2853 = _2867;
    }
    float _2869 = _2853;
    float _2871 = _2869;
    if (_2841)
    {
        float _2873 = _2845 * _2865;
        _2855 = _2873;
    }
    float _2875 = _2855;
    if (_2841)
    {
        float _2877 = _2875 * 0.15915493667125701904296875;
        _2857 = _2877;
    }
    float _2879 = _2857;
    float _2881 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _2883 = _2803;
    float _2885 = _2881;
    if (_2841)
    {
        float _2887 = _2879 * 6.283185482025146484375;
        float _2889 = sin(_2887);
        _2883 = _2889;
    }
    float _2891 = _2883;
    float _2893 = precise::max(0.0, _2881);
    float _2895 = _2789;
    float _2897 = _2893;
    if (_2841)
    {
        float _2899 = _2879 * 6.283185482025146484375;
        float _2901 = cos(_2899);
        _2895 = _2901;
    }
    float _2903 = _2895;
    float _2905 = -_2821;
    float _2907 = -_2893;
    float _2909 = fma(_2775, _2905, _2907);
    if (!_2841)
    {
        _2897 = _2825;
    }
    float _2911 = _2897;
    float _2913 = _2911;
    if (_2841)
    {
        float _2915 = _2909 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2885 = _2915;
    }
    float _2917 = _2885;
    float _2919 = _2917;
    float _2921 = _2891;
    if (_2841)
    {
        float _2923 = fma(_2891, _2917, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _2919 = _2923;
    }
    float _2925 = _2919;
    float _2927 = _2925;
    if (!_2841)
    {
        _2921 = _2829;
    }
    float _2929 = _2921;
    float _2931 = _2929;
    if (_2841)
    {
        float _2933 = _2869 * _2925;
        _2859 = _2933;
    }
    float _2935 = _2859;
    if (!_2841)
    {
        _2927 = _2909;
    }
    float _2937 = _2927;
    float _2939 = _2937;
    float _2941 = _2903;
    if (_2841)
    {
        float _2943 = _2903 + (-1.0);
        _2861 = _2943;
    }
    float _2945 = _2861;
    float _2947 = _2945;
    if (_2841)
    {
        float _2949 = _2825 * _2935;
        _2913 = _2949;
    }
    float _2951 = _2913;
    float _2953 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _2955 = fma(_2811, (*spvDescriptorSet0.vp_c15)._m0[23].w, _2953);
    float _2957 = precise::clamp(_2955, 0.0, 1.0);
    float _2959 = _2699 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    if (_2841)
    {
        float _2961 = _2945 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2871 = _2961;
    }
    float _2963 = _2871;
    if (!_2841)
    {
        _2947 = _2827;
    }
    float _2965 = _2947;
    float _2967 = _2965;
    if (_2841)
    {
        float _2969 = _2827 * _2935;
        _2967 = _2969;
    }
    float _2971 = _2967;
    if (_2841)
    {
        float _2973 = _2951 * _2951;
        _2931 = _2973;
    }
    float _2975 = _2931;
    if (_2841)
    {
        float _2977 = fma(_2909, _2903, _2963);
        _2939 = _2977;
    }
    float _2979 = _2939;
    if (!_2841)
    {
        _2941 = _2831;
    }
    float _2981 = _2941;
    float _2983 = _2981;
    if (_2841)
    {
        float _2985 = _2971 * _2971;
        _2983 = _2985;
    }
    float _2987 = _2983;
    float _2989 = -_2957;
    float _2991 = _2989 + 1.0;
    float _2993 = fma(_2979, _2979, _2975);
    float _2995 = fma(_2701, (*spvDescriptorSet0.vp_c8)._m0[3].x, _2959);
    float _2997 = abs(_2991);
    float _2999 = log2(_2997);
    float _3001 = _2993 + _2987;
    float _3003 = fma(_2703, (*spvDescriptorSet0.vp_c8)._m0[3].z, _2995);
    float _3005 = fma(_2083, (*spvDescriptorSet0.vp_c15)._m0[652].x, (*spvDescriptorSet0.vp_c15)._m0[652].z);
    float _3007 = rsqrt(_3001);
    float _3009 = _3003 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _3011 = floor(_3005);
    float _3013 = _2999 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _3015 = _3007 * _2951;
    float _3017 = _3007 * _2979;
    float _3019 = _3007 * _2971;
    float _3021 = _3015 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _3023 = exp2(_3013);
    float _3025 = -_3021;
    float _3027 = fma(_3017, (*spvDescriptorSet0.vp_c15)._m0[21].y, _3025);
    float _3029 = -_3011;
    float _3031 = _3005 + _3029;
    float _3033 = _2699 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _3035 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _3037 = -_3019;
    float _3039 = fma(_3037, (*spvDescriptorSet0.vp_c15)._m0[21].z, _3027);
    float _3041 = _2699 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _3043 = fma(_2701, (*spvDescriptorSet0.vp_c8)._m0[1].x, _3033);
    float _3045 = _2699 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _3047 = fma(_3039, -0.5, 0.5);
    float _3049 = fma(_2701, (*spvDescriptorSet0.vp_c8)._m0[0].x, _3041);
    float _3051 = fma(_2703, (*spvDescriptorSet0.vp_c8)._m0[1].z, _3043);
    float _3053 = fma(_2701, (*spvDescriptorSet0.vp_c8)._m0[2].x, _3045);
    float _3055 = fma(_3039, 0.5, 0.5);
    float _3057 = fma(_2703, (*spvDescriptorSet0.vp_c8)._m0[0].z, _3049);
    float _3059 = _3051 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _3061 = fma(_2703, (*spvDescriptorSet0.vp_c8)._m0[2].z, _3053);
    float _3063 = floor(_2791);
    float _3065 = _3057 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _3067 = _3059 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _3069 = _3061 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _3071 = fma(_3065, (*spvDescriptorSet0.vp_c8)._m0[7].x, _3067);
    float _3073 = _3069 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _3075 = fma(_3055, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _3077 = sqrt(_3047);
    float _3079 = fma(_3069, (*spvDescriptorSet0.vp_c8)._m0[7].z, _3071);
    float _3081 = -_3073;
    float _3083 = fma(_3081, _3035, 1.0);
    float _3085 = _3017 + 1.0;
    float _3087 = fma(_3055, _3075, -0.212114393711090087890625);
    float _3089 = fma(_3009, (*spvDescriptorSet0.vp_c8)._m0[7].w, _3079);
    float _3091 = -_3017;
    float _3093 = fma(_3023, _3085, _3091);
    float _3095 = fma(_3055, _3087, 1.570728778839111328125);
    float _3097 = log2(_3083);
    float _3099 = _3059 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _3101 = -_3063;
    float _3103 = _2791 + _3101;
    float _3105 = fma(_3065, (*spvDescriptorSet0.vp_c8)._m0[4].x, _3099);
    float _3107 = _3077 * 0.636619746685028076171875;
    float _3109 = 1.0 / _3089;
    float _3111 = _3059 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _3113 = fma(_3069, (*spvDescriptorSet0.vp_c8)._m0[4].z, _3105);
    float2 _9073 = float2(_3031, _3103);
    float _3115 = dm_bs(spvDescriptorSet0.vp_t_tcb_24.sample(spvDescriptorSet0.vp_t_tcb_24Smplr, select(_9073, float2(0.0), isnan(_9073)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_24, spvDescriptorSet0.vp_t_tcb_24Smplr_w, select(_9073, float2(0.0), isnan(_9073)), level(0.0)).x;
    float _3117 = -_3095;
    float _3119 = fma(_3107, _3117, 1.0);
    float _3121 = fma(_3065, (*spvDescriptorSet0.vp_c8)._m0[5].x, _3111);
    float _3123 = _3097 * 0.693147182464599609375;
    float _3125 = fma(_3069, (*spvDescriptorSet0.vp_c8)._m0[5].z, _3121);
    float _3127 = fma(_3009, (*spvDescriptorSet0.vp_c8)._m0[4].w, _3113);
    float _3129 = _3123 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _3131 = fma(_3009, (*spvDescriptorSet0.vp_c8)._m0[5].w, _3125);
    float _3133 = _3127 * _3109;
    float _3135 = _3131 * _3109;
    float _3137 = fma(_3093, 0.5, 0.5);
    float _3139 = fma(_3133, 0.5, 0.5);
    float _3141 = fma(_3135, -0.5, 0.5);
    float3 _9126 = float3(_3139, _3141, _3129);
    float _3143 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_9126, float3(0.0), isnan(_9126)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_9126, float3(0.0), isnan(_9126)), level(0.0)).x;
    float3 _9137 = float3(_3139, _3141, _3129);
    float4 _3146 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_9137, float3(0.0), isnan(_9137)), level(0.0)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_9137, float3(0.0), isnan(_9137)), level(0.0)).xyzw;
    float _3148 = _3146.x;
    float _3150 = _3146.y;
    float _3152 = _3146.z;
    float _3154 = _3146.w;
    float2 _9153 = float2(_3119, _3137);
    float3 _3158 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_9153, float2(0.0), isnan(_9153)), level(0.0)), spvDescriptorSet0.dm_border, 4u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_9153, float2(0.0), isnan(_9153)), level(0.0)).xyz;
    float _3160 = _3158.x;
    float _3162 = _3158.y;
    float _3164 = _3158.z;
    float _3166 = as_type<float>(_1894) * _2805;
    int _3168 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2097152;
    bool _3170 = _3168 != 0;
    out.m_83.w = _2787;
    int _3172 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _3174 = _3172 != 0;
    float _3176 = -(*spvDescriptorSet0.vp_c9)._m0[170].w;
    float _3178 = _1634 + _3176;
    float _3180 = trunc(_3166);
    float _3182 = precise::max(_3180, 0.0);
    uint _3184 = uint(_3182);
    float _3186 = _2999 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    if (_1672)
    {
        bool _3188 = _172 > 0.5;
        _2585 = _3188;
    }
    bool _3190 = _2585;
    out.m_85.x = _2083;
    out.m_85.y = _2027;
    out.m_85.z = _2015;
    float _3192 = -(*spvDescriptorSet0.vp_c9)._m0[167].x;
    float _3194 = (*spvDescriptorSet0.vp_c9)._m0[168].x + _3192;
    float _3196 = -(*spvDescriptorSet0.vp_c9)._m0[168].x;
    float _3198 = _3196 + (*spvDescriptorSet0.vp_c9)._m0[169].x;
    bool _3200 = _1660 > 0.5;
    float _3202 = _3194 * _2823;
    float _3204 = -(*spvDescriptorSet0.vp_c9)._m0[172].w;
    float _3206 = _3204 + (*spvDescriptorSet0.vp_c9)._m0[173].w;
    float _3208 = _3198 * _2833;
    float _3210 = -(*spvDescriptorSet0.vp_c9)._m0[173].w;
    float _3212 = _3210 + (*spvDescriptorSet0.vp_c9)._m0[174].w;
    int _3214 = ~_1812;
    int _3216 = _3214 + 1;
    float _3218 = -(*spvDescriptorSet0.vp_c9)._m0[170].x;
    float _3220 = _3218 + (*spvDescriptorSet0.vp_c9)._m0[171].x;
    float _3222 = -(*spvDescriptorSet0.vp_c9)._m0[169].x;
    float _3224 = (*spvDescriptorSet0.vp_c9)._m0[170].x + _3222;
    float _3226 = 1.0 / _3212;
    float _3228 = -(*spvDescriptorSet0.vp_c9)._m0[171].x;
    float _3230 = (*spvDescriptorSet0.vp_c9)._m0[172].x + _3228;
    float _3232 = _3220 * _2839;
    int _3234 = _3216 * int(_3184);
    int _3236 = _3234 + _2407;
    float _3238 = _3230 * _2847;
    float _3240 = -(*spvDescriptorSet0.vp_c9)._m0[172].x;
    float _3242 = _3240 + (*spvDescriptorSet0.vp_c9)._m0[173].x;
    float _3244 = _3224 * _2849;
    float _3246 = 1.0 / _3206;
    bool _3248 = _1634 >= (*spvDescriptorSet0.vp_c9)._m0[174].w;
    bool _3250 = isnan(_1634);
    bool _3252 = _3248 || _3250;
    bool _3254 = isnan((*spvDescriptorSet0.vp_c9)._m0[174].w);
    bool _3256 = _3252 || _3254;
    float _3258 = float(_3256);
    float _3260 = -(*spvDescriptorSet0.vp_c9)._m0[173].x;
    float _3262 = (*spvDescriptorSet0.vp_c9)._m0[174].x + _3260;
    float _3264 = float(uint(_3236));
    float _3266 = -(*spvDescriptorSet0.vp_c9)._m0[167].w;
    float _3268 = _1634 + _3266;
    bool _3270 = _1634 >= (*spvDescriptorSet0.vp_c9)._m0[173].w;
    bool _3272 = isnan(_1634);
    bool _3274 = _3270 || _3272;
    bool _3276 = isnan((*spvDescriptorSet0.vp_c9)._m0[173].w);
    bool _3278 = _3274 || _3276;
    float _3280 = float(_3278);
    float _3282 = -_3258;
    float _3284 = _3282 + 1.0;
    bool _3286 = _1634 >= (*spvDescriptorSet0.vp_c9)._m0[170].w;
    bool _3288 = isnan(_1634);
    bool _3290 = _3286 || _3288;
    bool _3292 = isnan((*spvDescriptorSet0.vp_c9)._m0[170].w);
    bool _3294 = _3290 || _3292;
    float _3296 = float(_3294);
    float _3298 = as_type<float>(_1894) * _3264;
    float _3300 = _3262 * _3226;
    float _3302 = _3280 * _3284;
    float _3304 = -_3280;
    float _3306 = _3304 + 1.0;
    bool _3308 = _1634 >= (*spvDescriptorSet0.vp_c9)._m0[172].w;
    bool _3310 = isnan(_1634);
    bool _3312 = _3308 || _3310;
    bool _3314 = isnan((*spvDescriptorSet0.vp_c9)._m0[172].w);
    bool _3316 = _3312 || _3314;
    float _3318 = float(_3316);
    float _3320 = trunc(_3298);
    float _3322 = precise::max(_3320, 0.0);
    uint _3324 = uint(_3322);
    float _3326 = fma(_3202, _3268, (*spvDescriptorSet0.vp_c9)._m0[167].x);
    float _3328 = -(*spvDescriptorSet0.vp_c9)._m0[168].w;
    float _3330 = _1634 + _3328;
    float _3332 = _3242 * _3246;
    bool _3334 = _1634 >= (*spvDescriptorSet0.vp_c9)._m0[171].w;
    bool _3336 = isnan(_1634);
    bool _3338 = _3334 || _3336;
    bool _3340 = isnan((*spvDescriptorSet0.vp_c9)._m0[171].w);
    bool _3342 = _3338 || _3340;
    float _3344 = float(_3342);
    float _3346 = -_3318;
    float _3348 = _3346 + 1.0;
    float _3350 = _3318 * _3306;
    float _3352 = fma(_3208, _3330, (*spvDescriptorSet0.vp_c9)._m0[168].x);
    int _3354 = ~_1812;
    int _3356 = _3354 + 1;
    float _3358 = -_3344;
    float _3360 = _3358 + 1.0;
    float _3362 = _3344 * _3348;
    bool _3364 = _1634 >= (*spvDescriptorSet0.vp_c9)._m0[169].w;
    bool _3366 = isnan(_1634);
    bool _3368 = _3364 || _3366;
    bool _3370 = isnan((*spvDescriptorSet0.vp_c9)._m0[169].w);
    bool _3372 = _3368 || _3370;
    float _3374 = float(_3372);
    float _3376 = -(*spvDescriptorSet0.vp_c9)._m0[169].w;
    float _3378 = _1634 + _3376;
    float _3380 = _3296 * _3360;
    float _3382 = -_3296;
    float _3384 = _3382 + 1.0;
    bool _3386 = _1634 >= (*spvDescriptorSet0.vp_c9)._m0[167].w;
    bool _3388 = isnan(_1634);
    bool _3390 = _3386 || _3388;
    bool _3392 = isnan((*spvDescriptorSet0.vp_c9)._m0[167].w);
    bool _3394 = _3390 || _3392;
    float _3396 = float(_3394);
    float _3398 = fma(_3244, _3378, (*spvDescriptorSet0.vp_c9)._m0[169].x);
    int _3400 = int(_3184) + int(_3324);
    float _3402 = _3374 * _3384;
    bool _3404 = _1634 >= (*spvDescriptorSet0.vp_c9)._m0[168].w;
    bool _3406 = isnan(_1634);
    bool _3408 = _3404 || _3406;
    bool _3410 = isnan((*spvDescriptorSet0.vp_c9)._m0[168].w);
    bool _3412 = _3408 || _3410;
    float _3414 = float(_3412);
    float _3416 = -_3374;
    float _3418 = _3416 + 1.0;
    float _3420 = fma(_3232, _3178, (*spvDescriptorSet0.vp_c9)._m0[170].x);
    int _3422 = _3356 * _3400;
    int _3424 = _3422 + _2407;
    float _3426 = -(*spvDescriptorSet0.vp_c9)._m0[171].w;
    float _3428 = _1634 + _3426;
    float _3430 = _3414 * _3418;
    float _3432 = -_3414;
    float _3434 = _3432 + 1.0;
    float _3436 = float(uint(_2311));
    float _3438 = in.m_87.x;
    float _3440 = in.m_87.y;
    bool _3442 = uint(_3424) >= uint(_1812);
    float _3444 = _3396 * _3434;
    float _3446 = fma(_3238, _3428, (*spvDescriptorSet0.vp_c9)._m0[171].x);
    float _3448 = as_type<float>(_1894) * _3436;
    bool _3450 = !_3442;
    int _3452 = _3450 ? 0 : (-1);
    float _3454 = _3326 * _3444;
    float _3456 = -_3396;
    float _3458 = _3456 + 1.0;
    if (_3174)
    {
        float _3460 = _3200 ? _1676 : _1636;
        _1688 = _3460;
    }
    float _3462 = _1688;
    float _3464 = exp2(_3186);
    int _3466 = ~_3400;
    int _3468 = _3466 + _3452;
    int _3470 = _3468 + 1;
    float _3472 = fma(_3458, (*spvDescriptorSet0.vp_c9)._m0[167].x, _3454);
    float _3474 = -(*spvDescriptorSet0.vp_c9)._m0[172].w;
    float _3476 = _1634 + _3474;
    float _3478 = -(*spvDescriptorSet0.vp_c9)._m0[173].w;
    float _3480 = _1634 + _3478;
    int _3482 = ~_1812;
    int _3484 = _3482 + 1;
    int _3486 = _1812 * _3470;
    int _3488 = _3486 + _2407;
    float _3490 = fma(_3352, _3430, _3472);
    float _3492 = trunc(_3448);
    float _3494 = precise::max(_3492, 0.0);
    uint _3496 = uint(_3494);
    float _3498 = fma(_3332, _3476, (*spvDescriptorSet0.vp_c9)._m0[172].x);
    float _3500 = fma(_3300, _3480, (*spvDescriptorSet0.vp_c9)._m0[173].x);
    bool _3502 = !_2261;
    int _3504 = _3502 ? _3488 : (-1);
    float _3506 = fma(_3398, _3402, _3490);
    float _3508 = _3059 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _3510 = _2319 * _3440;
    float _3512 = _2335 * _3440;
    float _3514 = in.m_89.x;
    float _3516 = in.m_89.y;
    int _3518 = as_type<int>(_3440);
    if (_1672)
    {
        float _3520 = -_1650;
        float _3522 = _3520 + 1.0;
        _3518 = as_type<int>(_3522);
    }
    int _3524 = _3518;
    float _3526 = -_3510;
    float _3528 = fma(_2335, _3438, _3526);
    float _3530 = fma(_2319, _3438, _3512);
    int _3532 = _3504 >> 31;
    float _3534 = fma(_3420, _3380, _3506);
    if (_1672)
    {
        float _3536 = _3190 ? as_type<float>(_3524) : _1650;
        _1952 = _3536;
    }
    float _3538 = _1952;
    int _3540 = _3484 * int(_3496);
    int _3542 = _3540 + _2311;
    int _3544 = _3532 & 3;
    float _3546 = fma(_3446, _3362, _3534);
    float _3548 = abs(_2713);
    float _3550 = log2(_3548);
    int _3552 = _3504 + _3544;
    float _3554 = fma(_3498, _3350, _3546);
    float _3556 = float(uint(_3542));
    float _3558 = fma((*spvDescriptorSet0.vp_c9)._m0[80].y, _3462, -0.5);
    int _3560 = _3552 >> 2;
    float _3562 = fma(_3500, _3302, _3554);
    float _3564 = as_type<float>(_1894) * _3556;
    int _3566 = _3560 << 4;
    int _3568 = _3566 + 368;
    float _3570 = fma(_3258, (*spvDescriptorSet0.vp_c9)._m0[174].x, _3562);
    int _3572 = _3504 & 3;
    bool _3574 = _3572 != 0;
    float _3576 = fma(_3538, (*spvDescriptorSet0.vp_c9)._m0[80].x, -0.5);
    float _3578 = _2319 * _3516;
    uint _3580 = uint(int(uint(_3568) >> uint(2)));
    uint _3582 = uint(int(uint(int(_3580)) >> uint(2)));
    int _3584 = int(_3580) & 3;
    float _3586 = (*spvDescriptorSet0.vp_c9)._m0[int(_3582)][_3584];
    int _3588 = int(_3580) + 1;
    uint _3590 = uint(int(uint(_3588) >> uint(2)));
    int _3592 = _3588 & 3;
    float _3594 = (*spvDescriptorSet0.vp_c9)._m0[int(_3590)][_3592];
    float _3596 = _2335 * _3516;
    float _3598 = trunc(_3564);
    float _3600 = precise::max(_3598, 0.0);
    uint _3602 = uint(_3600);
    float _3604 = -_3578;
    float _3606 = fma(_2335, _3514, _3604);
    float _3608 = fma(_2203, _3576, _2207);
    float _3610 = fma(_2319, _3514, _3596);
    int _3612 = _3504 & 3;
    bool _3614 = _3612 != 0;
    float _3616 = _3550 * (*spvDescriptorSet0.vp_c15)._m0[654].z;
    int _3618 = _3568 + 8;
    uint _3620 = uint(int(uint(_3618) >> uint(2)));
    uint _3622 = uint(int(uint(int(_3620)) >> uint(2)));
    int _3624 = int(_3620) & 3;
    float _3626 = (*spvDescriptorSet0.vp_c9)._m0[int(_3622)][_3624];
    int _3628 = int(_3620) + 1;
    uint _3630 = uint(int(uint(_3628) >> uint(2)));
    int _3632 = _3628 & 3;
    float _3634 = (*spvDescriptorSet0.vp_c9)._m0[int(_3630)][_3632];
    int _3636 = ~_1812;
    int _3638 = _3636 + 1;
    float _3640 = -_2231;
    float _3642 = fma(_2213, _3558, _3640);
    bool _3644 = uint(_3612) > 1u;
    float _3646 = _2435 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    bool _3648 = _3612 != 3;
    float _3650 = _2435 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    bool _3652 = uint(_3612) >= 2u;
    float _3654 = _2435 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _3656 = _2455 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    int _3658 = int(_3496) + int(_3602);
    float _3660 = _2455 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _3662 = exp2(_3616);
    int _3664 = _3652 ? 0 : 1;
    float _3666 = -_2431;
    float _3668 = fma(_3666, (*spvDescriptorSet0.vp_c8)._m0[24].x, _3646);
    float _3670 = -_2431;
    float _3672 = fma(_3670, (*spvDescriptorSet0.vp_c8)._m0[25].x, _3650);
    float _3674 = -_2431;
    float _3676 = fma(_3674, (*spvDescriptorSet0.vp_c8)._m0[26].x, _3654);
    int _3678 = ~_3664;
    int _3680 = _3678 + 1;
    int _3682 = _3680 + 1;
    float _3684 = fma(_2451, (*spvDescriptorSet0.vp_c8)._m0[24].z, _3668);
    int _3686 = _3682;
    if (_3648)
    {
        int _3688 = ~_3664;
        int _3690 = _3688 + 1;
        _3686 = _3690;
    }
    int _3692 = _3686;
    float _3694 = fma(_2451, (*spvDescriptorSet0.vp_c8)._m0[25].z, _3672);
    int _3696 = _3638 * _3658;
    int _3698 = _3696 + _2311;
    int _3700 = _3574 ? 0 : 1;
    float _3702 = fma(_2451, (*spvDescriptorSet0.vp_c8)._m0[26].z, _3676);
    float _3704 = _2443 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    int _3706 = ~_3700;
    int _3708 = _3706 + 1;
    int _3710 = _3708 + 1;
    float _3712 = fma(_2433, (*spvDescriptorSet0.vp_c8)._m0[25].x, _3656);
    int _3714 = _3710;
    if (!_3644)
    {
        int _3716 = ~_3700;
        int _3718 = _3716 + 1;
        _3714 = _3718;
    }
    int _3720 = _3714;
    float _3722 = fma(_3662, (*spvDescriptorSet0.vp_c15)._m0[654].x, (*spvDescriptorSet0.vp_c15)._m0[654].y);
    float _3724 = precise::clamp(_3722, 0.0, 1.0);
    bool _3726 = !_3614;
    int _3728 = _3726 ? 0 : 1;
    float _3730 = fma(_2439, (*spvDescriptorSet0.vp_c8)._m0[25].z, _3712);
    bool _3732 = uint(_3698) >= uint(_1812);
    float _3734 = _2455 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    int _3736 = abs(_3720);
    float _3738 = -_3464;
    float _3740 = _3738 + 1.0;
    int _3742 = abs(_3728);
    float _3744 = fma(_2433, (*spvDescriptorSet0.vp_c8)._m0[24].x, _3734);
    int _3746 = ~_3736;
    int _3748 = _3746 + 1;
    int _3750 = _3748 + 1;
    float _3752 = fma(_2433, (*spvDescriptorSet0.vp_c8)._m0[26].x, _3660);
    bool _3754 = _3612 != 3;
    float _3756 = _3740 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    int _3758 = _3750 * as_type<int>(_3594);
    bool _3760 = !_3754;
    int _3762 = _3760 ? 0 : (-1);
    float _3764 = fma(_2439, (*spvDescriptorSet0.vp_c8)._m0[26].z, _3752);
    int _3766 = ~_3742;
    int _3768 = _3766 + 1;
    int _3770 = _3768 + 1;
    float _3772 = fma(_3065, (*spvDescriptorSet0.vp_c8)._m0[6].x, _3508);
    int _3774 = abs(_3692);
    out.m_91.x = _3570;
    bool _3776 = !_3170;
    int _3778 = _3776 ? 0 : 1;
    int _3780 = _3770 * as_type<int>(_3586);
    int _3782 = _3780 + _3758;
    int _3784 = abs(_3762);
    float _3786 = _2443 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    bool _3788 = !_3732;
    int _3790 = _3788 ? 0 : (-1);
    out.m_93.x = _2701;
    out.m_93.y = _2699;
    out.m_93.z = _2703;
    int _3792 = ~_3774;
    int _3794 = _3792 + 1;
    int _3796 = _3794 + 1;
    int _3798 = abs(_3778);
    int _3800 = _3796 * as_type<int>(_3626);
    int _3802 = _3800 + _3782;
    int _3804 = ~_3658;
    int _3806 = _3804 + _3790;
    int _3808 = _3806 + 1;
    float _3810 = in.m_87.z;
    int _3812 = ~_3784;
    int _3814 = _3812 + 1;
    int _3816 = _3814 + 1;
    bool _3818 = _2465 != 0.0;
    bool _3820 = isnan(_2465);
    bool _3822 = _3818 || _3820;
    bool _3824 = isnan(0.0);
    bool _3826 = _3822 || _3824;
    int _3828 = _1812 * _3808;
    int _3830 = _3828 + _2311;
    int _3832 = ~_3798;
    int _3834 = _3832 + 1;
    int _3836 = _3834 + 1;
    int _3838 = _3816 * as_type<int>(_3634);
    int _3840 = _3838 + _3802;
    float _3842 = fma(_2453, (*spvDescriptorSet0.vp_c8)._m0[25].x, _3786);
    float _3844 = _2443 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    bool _3846 = !_2261;
    int _3848 = _3846 ? _3830 : (-1);
    int _3850 = _3840 * _3836;
    bool _3852 = _2467 == 0.0;
    bool _3854 = !_3826;
    bool _3856 = _3852 && _3854;
    float _3858 = fma(_2453, (*spvDescriptorSet0.vp_c8)._m0[24].x, _3844);
    float _3860 = fma(_2453, (*spvDescriptorSet0.vp_c8)._m0[26].x, _3704);
    int _3862 = _3848 * _3798;
    int _3864 = _3862 + _3850;
    float _3866 = in.m_89.z;
    float _3868 = in.m_89.w;
    bool _3870 = _2469 == 0.0;
    bool _3872 = _3870 && _3856;
    float _3874 = fma(_2439, (*spvDescriptorSet0.vp_c8)._m0[24].z, _3744);
    float _3876 = float(_3864);
    float _3878 = fma(_3724, -2.0, 3.0);
    float _3880 = _3724 * _3724;
    float _3882 = fma(_2461, (*spvDescriptorSet0.vp_c8)._m0[24].z, _3858);
    float _3884 = fma(_2461, (*spvDescriptorSet0.vp_c8)._m0[25].z, _3842);
    float _3886 = _3608 + 0.5;
    float _3888 = _3610 * _3694;
    float _3890 = _3880 * _3878;
    float _3892 = _3610 * _3684;
    float _3894 = _3610 * _3702;
    float _3896 = _3642 + 0.5;
    float _3898 = fma(_3606, _3730, _3888);
    float _3900 = fma(_2461, (*spvDescriptorSet0.vp_c8)._m0[26].z, _3860);
    float _3902 = fma(_3606, _3874, _3892);
    float _3904 = fma(_3606, _3764, _3894);
    float _3906 = -_3890;
    float _3908 = _3906 + 1.0;
    out.m_95.x = _3886;
    out.m_95.y = _3896;
    out.m_95.z = _1772;
    out.m_95.w = _1770;
    float _3910 = _3904;
    if (_3872)
    {
        _2049 = _3530;
    }
    float _3912 = _2049;
    float _3914 = _3912;
    if (!_3872)
    {
        float _3916 = fma(_2465, (*spvDescriptorSet0.vp_c9)._m0[17].y, _3530);
        _3914 = _3916;
    }
    float _3918 = _3914;
    float _3920 = fma(_3908, (*spvDescriptorSet0.vp_c15)._m0[654].w, _3890);
    out.m_97.x = _3876;
    float _3922 = fma(_3884, _3866, _3898);
    float _3924 = fma(_3900, _3866, _3904);
    float _3926 = _3530 * _3606;
    float _3928 = in.m_99.x;
    bool _3930 = _2713 <= 8000.0;
    bool _3932 = isnan(_2713);
    bool _3934 = _3930 || _3932;
    bool _3936 = isnan(8000.0);
    bool _3938 = _3934 || _3936;
    float _3940 = float(_3938);
    if (_3872)
    {
        _3910 = _3528;
    }
    float _3942 = _3910;
    float _3944 = fma(_3882, _3866, _3902);
    float _3946 = _3942;
    if (!_3872)
    {
        float _3948 = fma(_2467, (*spvDescriptorSet0.vp_c9)._m0[17].y, _3528);
        _3946 = _3948;
    }
    float _3950 = _3946;
    float _3952 = _3528 * _3866;
    float _3954 = _3610 * _3810;
    float _3956 = _3940 * _3920;
    out.m_101.x = _3944;
    out.m_101.y = _3922;
    out.m_101.z = _3924;
    float _3958 = -_3952;
    float _3960 = fma(_3606, _3810, _3958);
    float _3962 = -_3954;
    float _3964 = fma(_3530, _3866, _3962);
    float _3966 = _3702 * _3918;
    if (_3872)
    {
        _2717 = _3810;
    }
    float _3968 = _2717;
    float _3970 = _3960 * _3868;
    float _3972 = _3968;
    if (!_3872)
    {
        float _3974 = fma(_2469, (*spvDescriptorSet0.vp_c9)._m0[17].y, _3810);
        _3972 = _3974;
    }
    float _3976 = _3972;
    float _3978 = _3684 * _3918;
    float _3980 = -_3926;
    float _3982 = fma(_3528, _3610, _3980);
    float _3984 = _3964 * _3868;
    float _3986 = _3970 * _3684;
    float _3988 = _3970 * _3702;
    float _3990 = _3694 * _3918;
    float _3992 = _3970 * _3694;
    float _3994 = fma(_3764, _3950, _3966);
    float _3996 = _3956 * (*spvDescriptorSet0.vp_c15)._m0[653].x;
    float _3998 = fma(_3730, _3950, _3990);
    float _4000 = fma(_3874, _3950, _3978);
    float _4002 = _3982 * _3868;
    float _4004 = fma(_3984, _3874, _3986);
    float _4006 = fma(_3884, _3976, _3998);
    float _4008 = fma(_3984, _3730, _3992);
    float _4010 = fma(_3984, _3764, _3988);
    float _4012 = fma(_3900, _3976, _3994);
    float _4014 = fma(_4002, _3882, _4004);
    float _4016 = fma(_4002, _3884, _4008);
    float _4018 = fma(_4002, _3900, _4010);
    float _4020 = fma(_3069, (*spvDescriptorSet0.vp_c8)._m0[6].z, _3772);
    float _4022 = -_3115;
    float _4024 = _4022 + 1.0;
    float _4026 = fma(_3882, _3976, _4000);
    bool _4028 = _2811 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _4030 = isnan(_2811);
    bool _4032 = _4028 || _4030;
    bool _4034 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _4036 = _4032 || _4034;
    out.m_103.x = _4014;
    out.m_103.y = _4016;
    out.m_103.z = _4018;
    float _4038 = _4024 * _3996;
    float _4040 = precise::clamp(_4038, 0.0, 1.0);
    float _4042 = fma(_3009, (*spvDescriptorSet0.vp_c8)._m0[6].w, _4020);
    float _4044 = _3127 + _3089;
    out.m_105.x = _4026;
    out.m_105.y = _4006;
    out.m_105.z = _4012;
    float _4046 = -_4040;
    float _4048 = fma(_4046, (*spvDescriptorSet0.vp_c15)._m0[653].y, 1.0);
    float _4050 = _4042 + _3089;
    float _4052 = _3089 * 0.5;
    out.gl_Position.x = _3127;
    out.gl_Position.y = _3131;
    out.gl_Position.z = _4042;
    out.gl_Position.w = _3089;
    float _4054 = _4048 * _3928;
    float _4056 = _4050 * 0.5;
    float _4058 = -_3756;
    float _4060 = _4058 + 1.0;
    float _4062 = _4054 * (*spvDescriptorSet0.vp_c13)._m0[1].w;
    float _4064 = _4044 * 0.5;
    float _4066 = fma(_3131, -0.5, _4052);
    float _4068 = _4018;
    float _4070 = _4060;
    if (!_4036)
    {
        _4068 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _4072 = _4068;
    out.m_107.x = _4062;
    float _4074 = _3756 * _3143;
    float _4076 = _3154 * _4060;
    float _4078 = _4072;
    float _4080 = _4072;
    if (!_4036)
    {
        _4070 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _4082 = _4070;
    out.m_109.x = _4064;
    out.m_109.y = _4066;
    out.m_109.z = _4056;
    out.m_109.w = _3089;
    float _4084 = _3154 * _4074;
    float _4086 = _3164 * _4074;
    float _4088 = fma(_3160, _4084, _3148);
    float _4090 = fma(_3162, _4084, _3150);
    float _4092 = fma(_3154, _4086, _3152);
    float _4094 = _4084;
    float _4096 = _4082;
    float _4098 = _4082;
    if (!_4036)
    {
        _4094 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _4100 = _4094;
    out.m_111.x = _4088;
    out.m_111.y = _4090;
    out.m_111.z = _4092;
    out.m_111.w = _4076;
    float _4102 = _2771 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    bool _4104 = !_4036;
    float _4106 = _4100;
    float _4108 = _4100;
    if (!_4104)
    {
        bool _4110 = _2811 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _4112 = isnan(_2811);
        bool _4114 = _4110 || _4112;
        bool _4116 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _4118 = _4114 || _4116;
        if (!_4118)
        {
            float _4120 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _4122 = _2811 + _4120;
            float _4124 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _4126 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _4124;
            float _4128 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _4130 = _4128 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _4132 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _4134 = _4132 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _4136 = 1.0 / _4126;
            float _4138 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _4140 = _4138 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _4142 = _4122 * _4136;
            float _4144 = precise::clamp(_4142, 0.0, 1.0);
            float _4146 = fma(_4144, _4130, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _4148 = fma(_4144, _4134, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _4150 = fma(_4144, _4140, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            _4108 = _4148;
            _4080 = _4146;
            _4098 = _4150;
            _4152 = true;
        }
        else
        {
            bool _4154 = _2811 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _4156 = isnan(_2811);
            bool _4158 = _4154 || _4156;
            bool _4160 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _4162 = _4158 || _4160;
            if (!_4162)
            {
                _4078 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _4164 = _4078;
            _4080 = _4164;
            if (!_4162)
            {
                _4106 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _4166 = _4106;
            _4108 = _4166;
            if (!_4162)
            {
                _4096 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _4168 = _4096;
            bool _4170 = !_4162;
            _4098 = _4168;
            if (!_4170)
            {
                bool _4172 = _2811 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _4174 = isnan(_2811);
                bool _4176 = _4172 || _4174;
                bool _4178 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _4180 = _4176 || _4178;
                if (!_4180)
                {
                    float _4182 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _4184 = _2811 + _4182;
                    float _4186 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _4188 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _4186;
                    float _4190 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _4192 = _4190 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _4194 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _4196 = _4194 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _4198 = 1.0 / _4188;
                    float _4200 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _4202 = _4200 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _4204 = _4184 * _4198;
                    float _4206 = precise::clamp(_4204, 0.0, 1.0);
                    float _4208 = fma(_4206, _4192, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _4210 = fma(_4206, _4196, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _4212 = fma(_4206, _4202, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    _4108 = _4210;
                    _4080 = _4208;
                    _4098 = _4212;
                    _4152 = true;
                }
                else
                {
                    _4108 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _4080 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _4098 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                }
            }
        }
    }
    _4152 = false;
    float _4214 = _4108;
    float _4216 = _4080;
    float _4218 = _4098;
    float _4220 = _4102 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    out.m_113.x = 0.0;
    float _4222 = _4214 * 0.586610972881317138671875;
    bool _4224 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    out.m_55.x = _4220;
    float _4226 = fma(_4216, 0.298911988735198974609375, _4222);
    bool _4228 = _2771 > 0.0;
    bool _4230 = isnan(_2771);
    bool _4232 = _4228 || _4230;
    bool _4234 = isnan(0.0);
    bool _4236 = _4232 || _4234;
    float _4238 = fma(_4218, 0.114477999508380889892578125, _4226);
    float _4240 = -_4238;
    float _4242 = _4240 + _4216;
    float _4244 = -_4238;
    float _4246 = _4244 + _4214;
    float _4248 = -_4238;
    float _4250 = _4248 + _4218;
    float _4252 = fma(_4242, (*spvDescriptorSet0.vp_c13)._m0[1].z, _4238);
    float _4254 = fma(_4246, (*spvDescriptorSet0.vp_c13)._m0[1].z, _4238);
    float _4256 = fma(_4250, (*spvDescriptorSet0.vp_c13)._m0[1].z, _4238);
    bool _4258 = !_4224;
    if (!_4258)
    {
        float _4260 = -_2699;
        float _4262 = _4260 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
        float _4264 = -_2701;
        float _4266 = _4264 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
        float _4268 = -_2703;
        float _4270 = _4268 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
        float _4272 = _4262 * _4262;
        float _4274 = fma(_4266, _4266, _4272);
        float _4276 = fma(_4270, _4270, _4274);
        float _4278 = sqrt(_4276);
        float _4280 = rsqrt(_4276);
        float _4282 = -_4278;
        float _4284 = _4282 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
        float _4286 = _4284 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
        float _4288 = precise::clamp(_4286, 0.0, 1.0);
        float _4290 = _4266 * _4280;
        float _4292 = _4262 * _4280;
        float _4294 = abs(_4288);
        float _4296 = log2(_4294);
        float _4298 = _4270 * _4280;
        float _4300 = _4290 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
        float _4302 = _4006 * _4292;
        float _4304 = -_4292;
        float _4306 = -_4300;
        float _4308 = fma(_4304, (*spvDescriptorSet0.vp_c15)._m0[656].y, _4306);
        float _4310 = fma(_4026, _4290, _4302);
        float _4312 = -_4298;
        float _4314 = fma(_4312, (*spvDescriptorSet0.vp_c15)._m0[656].z, _4308);
        float _4316 = fma(_4012, _4298, _4310);
        float _4318 = precise::clamp(_4316, 0.0, 1.0);
        float _4320 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
        float _4322 = _4314 + _4320;
        float _4324 = _4296 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
        float _4326 = _4322 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
        float _4328 = precise::clamp(_4326, 0.0, 1.0);
        float _4330 = exp2(_4324);
        float _4332 = _4330 * _4328;
        float _4334 = _4318 * _4332;
        float _4336 = _4334 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
        float _4338 = _4334 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
        float _4340 = _4334 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
        out.m_113.x = _4336;
        out.m_113.y = _4338;
        out.m_113.z = _4340;
    }
    out.m_115.x = _4252;
    out.m_115.y = _4254;
    out.m_115.z = _4256;
    if (_4236)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_63.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_63.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_63.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_63.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_65.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_65.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_65.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_65.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_91.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_91.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_91.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_91.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_53.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_53.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_53.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_53.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_97.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_97.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_97.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_97.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_103.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_103.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_103.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_103.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_85.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_85.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_85.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_85.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_105.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_105.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_105.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_105.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_95.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_95.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_95.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_95.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_93.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_93.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_93.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_93.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_83.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_83.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_83.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_83.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_109.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_109.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_109.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_109.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_55.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_55.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_55.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_55.w)); dm_cw(dm_gs, dm_p, 68, as_type<uint>(out.m_59.x)); dm_cw(dm_gs, dm_p, 69, as_type<uint>(out.m_59.y)); dm_cw(dm_gs, dm_p, 70, as_type<uint>(out.m_59.z)); dm_cw(dm_gs, dm_p, 71, as_type<uint>(out.m_59.w)); dm_cw(dm_gs, dm_p, 72, as_type<uint>(out.m_101.x)); dm_cw(dm_gs, dm_p, 73, as_type<uint>(out.m_101.y)); dm_cw(dm_gs, dm_p, 74, as_type<uint>(out.m_101.z)); dm_cw(dm_gs, dm_p, 75, as_type<uint>(out.m_101.w)); dm_cw(dm_gs, dm_p, 76, as_type<uint>(out.m_113.x)); dm_cw(dm_gs, dm_p, 77, as_type<uint>(out.m_113.y)); dm_cw(dm_gs, dm_p, 78, as_type<uint>(out.m_113.z)); dm_cw(dm_gs, dm_p, 79, as_type<uint>(out.m_113.w)); dm_cw(dm_gs, dm_p, 80, as_type<uint>(out.m_107.x)); dm_cw(dm_gs, dm_p, 81, as_type<uint>(out.m_107.y)); dm_cw(dm_gs, dm_p, 82, as_type<uint>(out.m_107.z)); dm_cw(dm_gs, dm_p, 83, as_type<uint>(out.m_107.w)); dm_cw(dm_gs, dm_p, 84, as_type<uint>(out.m_111.x)); dm_cw(dm_gs, dm_p, 85, as_type<uint>(out.m_111.y)); dm_cw(dm_gs, dm_p, 86, as_type<uint>(out.m_111.z)); dm_cw(dm_gs, dm_p, 87, as_type<uint>(out.m_111.w)); dm_cw(dm_gs, dm_p, 88, as_type<uint>(out.m_115.x)); dm_cw(dm_gs, dm_p, 89, as_type<uint>(out.m_115.y)); dm_cw(dm_gs, dm_p, 90, as_type<uint>(out.m_115.z)); dm_cw(dm_gs, dm_p, 91, as_type<uint>(out.m_115.w)); dm_cw(dm_gs, dm_p, 92, as_type<uint>(out.m_67.x)); dm_cw(dm_gs, dm_p, 93, as_type<uint>(out.m_67.y)); dm_cw(dm_gs, dm_p, 94, as_type<uint>(out.m_67.z)); dm_cw(dm_gs, dm_p, 95, as_type<uint>(out.m_67.w)); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    out.m_55.x = 0.0;
    float _4342 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _4342;
    { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_63.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_63.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_63.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_63.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_65.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_65.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_65.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_65.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_91.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_91.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_91.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_91.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_53.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_53.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_53.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_53.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_97.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_97.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_97.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_97.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_103.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_103.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_103.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_103.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_85.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_85.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_85.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_85.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_105.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_105.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_105.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_105.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_95.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_95.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_95.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_95.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_93.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_93.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_93.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_93.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_83.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_83.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_83.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_83.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_109.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_109.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_109.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_109.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_55.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_55.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_55.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_55.w)); dm_cw(dm_gs, dm_p, 68, as_type<uint>(out.m_59.x)); dm_cw(dm_gs, dm_p, 69, as_type<uint>(out.m_59.y)); dm_cw(dm_gs, dm_p, 70, as_type<uint>(out.m_59.z)); dm_cw(dm_gs, dm_p, 71, as_type<uint>(out.m_59.w)); dm_cw(dm_gs, dm_p, 72, as_type<uint>(out.m_101.x)); dm_cw(dm_gs, dm_p, 73, as_type<uint>(out.m_101.y)); dm_cw(dm_gs, dm_p, 74, as_type<uint>(out.m_101.z)); dm_cw(dm_gs, dm_p, 75, as_type<uint>(out.m_101.w)); dm_cw(dm_gs, dm_p, 76, as_type<uint>(out.m_113.x)); dm_cw(dm_gs, dm_p, 77, as_type<uint>(out.m_113.y)); dm_cw(dm_gs, dm_p, 78, as_type<uint>(out.m_113.z)); dm_cw(dm_gs, dm_p, 79, as_type<uint>(out.m_113.w)); dm_cw(dm_gs, dm_p, 80, as_type<uint>(out.m_107.x)); dm_cw(dm_gs, dm_p, 81, as_type<uint>(out.m_107.y)); dm_cw(dm_gs, dm_p, 82, as_type<uint>(out.m_107.z)); dm_cw(dm_gs, dm_p, 83, as_type<uint>(out.m_107.w)); dm_cw(dm_gs, dm_p, 84, as_type<uint>(out.m_111.x)); dm_cw(dm_gs, dm_p, 85, as_type<uint>(out.m_111.y)); dm_cw(dm_gs, dm_p, 86, as_type<uint>(out.m_111.z)); dm_cw(dm_gs, dm_p, 87, as_type<uint>(out.m_111.w)); dm_cw(dm_gs, dm_p, 88, as_type<uint>(out.m_115.x)); dm_cw(dm_gs, dm_p, 89, as_type<uint>(out.m_115.y)); dm_cw(dm_gs, dm_p, 90, as_type<uint>(out.m_115.z)); dm_cw(dm_gs, dm_p, 91, as_type<uint>(out.m_115.w)); dm_cw(dm_gs, dm_p, 92, as_type<uint>(out.m_67.x)); dm_cw(dm_gs, dm_p, 93, as_type<uint>(out.m_67.y)); dm_cw(dm_gs, dm_p, 94, as_type<uint>(out.m_67.z)); dm_cw(dm_gs, dm_p, 95, as_type<uint>(out.m_67.w)); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
}

