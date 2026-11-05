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
    float4 m_61 [[user(locn0)]];
    float4 m_75 [[user(locn1)]];
    float4 m_51 [[user(locn2)]];
    float4 m_91 [[user(locn3)]];
    float4 m_73 [[user(locn4)]];
    float4 m_77 [[user(locn5)]];
    float4 m_83 [[user(locn6)]];
    float4 m_79 [[user(locn7)]];
    float4 m_89 [[user(locn8)]];
    float4 m_85 [[user(locn9)]];
    float4 m_87 [[user(locn10)]];
    float4 gl_Position [[position, invariant]];
    float gl_PointSize [[point_size]];
};

struct main0_in
{
    float4 m_81 [[attribute(0)]];
    float4 m_67 [[attribute(1)]];
    float4 m_55 [[attribute(2)]];
    float4 m_48 [[attribute(3)]];
    float4 m_53 [[attribute(4)]];
    float4 m_71 [[attribute(5)]];
    float4 m_65 [[attribute(6)]];
    float4 m_57 [[attribute(7)]];
    float4 m_59 [[attribute(8)]];
    float4 m_63 [[attribute(9)]];
    float4 m_69 [[attribute(10)]];
};

vertex main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]])
{
    main0_out out = {};
    out.m_61 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_75 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_51 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_91 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_73 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_77 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_83 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_79 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_89 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_85 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_87 = float4(0.0, 0.0, 0.0, 1.0);
    bool _2351 = false;
    bool _1740 = false;
    bool _588 = false;
    bool _434 = false;
    bool _212 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _105 = in.m_48.w;
    float _107 = trunc(_105);
    int _110 = int(_107);
    bool _114 = _110 >= 1;
    float _116 = 0.0;
    if (!_114)
    {
        _116 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _118 = _116;
    float _120 = _118;
    if (!_114)
    {
        out.m_51.x = 0.0;
    }
    int _122 = 0;
    if (!_114)
    {
        float _124 = _118 * 5.0;
        _122 = as_type<int>(_124);
    }
    int _126 = _122;
    int _128 = _126;
    if (!_114)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2584 = as_type<float>(_126);
        out.gl_Position.z = _2584;
    }
    if (!_114)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _130 = in.m_53.w;
    bool _132 = _130 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _134 = isnan(_130);
    bool _136 = _132 || _134;
    bool _138 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _140 = _136 || _138;
    float _142 = -_130;
    float _144 = _142 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    float _146 = 0.0;
    float _148 = _144;
    if (_140)
    {
        float _150 = float(_110);
        _146 = _150;
    }
    float _152 = _146;
    bool _154 = _144 >= _152;
    bool _156 = !_140;
    bool _158 = _154 || _156;
    if (_158)
    {
        _120 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _160 = _120;
    if (_158)
    {
        out.m_51.x = 0.0;
    }
    if (_158)
    {
        float _162 = _160 * 5.0;
        _128 = as_type<int>(_162);
    }
    int _164 = _128;
    if (_158)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2653 = as_type<float>(_164);
        out.gl_Position.z = _2653;
    }
    if (_158)
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
    float _210;
    if (!_192)
    {
        float _194 = in.m_57.x;
        float _196 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _198 = _194 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _200 = fma(_198, (*spvDescriptorSet0.vp_c9)._m0[12].x, _144);
        float _202 = _200 * _196;
        float _204 = floor(_202);
        float _206 = -_204;
        float _208 = _202 + _206;
        _210 = _208;
        _212 = true;
    }
    else
    {
        float _214 = float(_110);
        float _216 = 1.0 / _214;
        float _218 = _144 * _216;
        _210 = _218;
    }
    _212 = false;
    float _220 = _210;
    float _222 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _224 = _220 + _222;
    float _226 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _228 = _220 + _226;
    bool _230 = _220 >= (*spvDescriptorSet0.vp_c9)._m0[146].w;
    bool _232 = isnan(_220);
    bool _234 = _230 || _232;
    bool _236 = isnan((*spvDescriptorSet0.vp_c9)._m0[146].w);
    bool _238 = _234 || _236;
    float _240 = float(_238);
    float _242 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _244 = (*spvDescriptorSet0.vp_c9)._m0[146].w + _242;
    float _246 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _248 = _220 + _246;
    float _250 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _252 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _250;
    float _254 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _256 = _254 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _258 = 1.0 / _244;
    bool _260 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _262 = 1.0 / _256;
    float _264 = 1.0 / _252;
    float _266 = _224 * _258;
    bool _268 = _220 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _270 = isnan(_220);
    bool _272 = _268 || _270;
    bool _274 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _276 = _272 || _274;
    float _278 = float(_276);
    float _280 = -_240;
    float _282 = _280 + 1.0;
    float _284 = _278 * _282;
    float _286 = _228 * _262;
    bool _288 = _220 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _290 = isnan(_220);
    bool _292 = _288 || _290;
    bool _294 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _296 = _292 || _294;
    float _298 = float(_296);
    float _300 = -(*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _302 = (*spvDescriptorSet0.vp_c9)._m0[144].z + _300;
    bool _304 = _220 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _306 = isnan(_220);
    bool _308 = _304 || _306;
    bool _310 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _312 = _308 || _310;
    float _314 = float(_312);
    float _316 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _318 = _316 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _320 = -_278;
    float _322 = _320 + 1.0;
    float _324 = -_298;
    float _326 = _324 + 1.0;
    float _328 = _248 * _264;
    float _330 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _332 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _330;
    float _334 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _336 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _334;
    float _338 = _314 * _326;
    float _340 = fma(_302, _328, (*spvDescriptorSet0.vp_c9)._m0[143].z);
    float _342 = fma(_332, _328, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _344 = fma(_336, _328, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _346 = _298 * _322;
    float _348 = -(*spvDescriptorSet0.vp_c9)._m0[144].z;
    float _350 = _348 + (*spvDescriptorSet0.vp_c9)._m0[145].z;
    float _352 = _342 * _338;
    float _354 = _344 * _338;
    float _356 = _340 * _338;
    float _358 = -_314;
    float _360 = _358 + 1.0;
    float _362 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _364 = _362 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _366 = fma(_360, (*spvDescriptorSet0.vp_c9)._m0[143].x, _354);
    float _368 = fma(_360, (*spvDescriptorSet0.vp_c9)._m0[143].y, _352);
    float _370 = fma(_360, (*spvDescriptorSet0.vp_c9)._m0[143].z, _356);
    float _372 = -(*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _374 = (*spvDescriptorSet0.vp_c9)._m0[146].x + _372;
    float _376 = fma(_318, _286, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _378 = fma(_364, _286, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _380 = fma(_350, _286, (*spvDescriptorSet0.vp_c9)._m0[144].z);
    float _382 = -(*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _384 = (*spvDescriptorSet0.vp_c9)._m0[146].y + _382;
    float _386 = -(*spvDescriptorSet0.vp_c9)._m0[145].z;
    float _388 = (*spvDescriptorSet0.vp_c9)._m0[146].z + _386;
    float _390 = fma(_376, _346, _366);
    float _392 = fma(_374, _266, (*spvDescriptorSet0.vp_c9)._m0[145].x);
    float _394 = fma(_384, _266, (*spvDescriptorSet0.vp_c9)._m0[145].y);
    float _396 = fma(_388, _266, (*spvDescriptorSet0.vp_c9)._m0[145].z);
    float _398 = fma(_378, _346, _368);
    float _400 = fma(_380, _346, _370);
    float _402 = fma(_392, _284, _390);
    float _404 = fma(_394, _284, _398);
    float _406 = fma(_396, _284, _400);
    float _408 = fma(_240, (*spvDescriptorSet0.vp_c9)._m0[146].x, _402);
    float _410 = fma(_240, (*spvDescriptorSet0.vp_c9)._m0[146].y, _404);
    float _412 = fma(_240, (*spvDescriptorSet0.vp_c9)._m0[146].z, _406);
    bool _414 = !_260;
    float _432;
    if (!_414)
    {
        float _416 = in.m_57.x;
        float _418 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _420 = _416 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _422 = fma(_420, (*spvDescriptorSet0.vp_c9)._m0[11].y, _144);
        float _424 = _422 * _418;
        float _426 = floor(_424);
        float _428 = -_426;
        float _430 = _424 + _428;
        _432 = _430;
        _434 = true;
    }
    else
    {
        float _436 = float(_110);
        float _438 = 1.0 / _436;
        float _440 = _144 * _438;
        _432 = _440;
    }
    _434 = false;
    float _442 = _432;
    float _444 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _446 = _442 + _444;
    float _448 = in.m_59.x;
    float _450 = in.m_59.y;
    float _452 = in.m_59.z;
    float _454 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _456 = _454 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _458 = _442 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _460 = isnan(_442);
    bool _462 = _458 || _460;
    bool _464 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _466 = _462 || _464;
    float _468 = float(_466);
    float _470 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _472 = _470 + (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _474 = _442 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _476 = isnan(_442);
    bool _478 = _474 || _476;
    bool _480 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _482 = _478 || _480;
    float _484 = float(_482);
    float _486 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _488 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _486;
    bool _490 = _442 >= (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _492 = isnan(_442);
    bool _494 = _490 || _492;
    bool _496 = isnan((*spvDescriptorSet0.vp_c9)._m0[117].w);
    bool _498 = _494 || _496;
    float _500 = float(_498);
    float _502 = 1.0 / _456;
    float _504 = -_468;
    float _506 = _504 + 1.0;
    bool _508 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].w;
    float _510 = _484 * _506;
    float _512 = -_484;
    float _514 = _512 + 1.0;
    float _516 = 1.0 / _472;
    float _518 = _488 * _502;
    float _520 = -(*spvDescriptorSet0.vp_c9)._m0[116].x;
    float _522 = _520 + (*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _524 = _412 * _452;
    float _526 = _408 * _448;
    float _528 = fma(_518, _446, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _530 = _522 * _516;
    float _532 = _528 * _510;
    float _534 = -_500;
    float _536 = _534 + 1.0;
    float _538 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _540 = _442 + _538;
    float _542 = fma(_514, (*spvDescriptorSet0.vp_c9)._m0[115].x, _532);
    float _544 = _468 * _536;
    float _546 = fma(_530, _540, (*spvDescriptorSet0.vp_c9)._m0[116].x);
    float _548 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _550 = fma(_546, _544, _542);
    float _552 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _554 = _548 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _556 = fma(_500, (*spvDescriptorSet0.vp_c9)._m0[117].x, _550);
    float _558 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _560 = _552 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _562 = _556 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _564 = _410 * _450;
    float _566 = _558 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    out.m_61.x = _554;
    out.m_61.y = _566;
    out.m_61.z = _560;
    out.m_61.w = _562;
    bool _568 = !_508;
    float _586;
    if (!_568)
    {
        float _570 = in.m_57.x;
        float _572 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].w;
        float _574 = _570 * (*spvDescriptorSet0.vp_c9)._m0[13].x;
        float _576 = fma(_574, (*spvDescriptorSet0.vp_c9)._m0[11].w, _144);
        float _578 = _576 * _572;
        float _580 = floor(_578);
        float _582 = -_580;
        float _584 = _578 + _582;
        _586 = _584;
        _588 = true;
    }
    else
    {
        float _590 = float(_110);
        float _592 = 1.0 / _590;
        float _594 = _144 * _592;
        _586 = _594;
    }
    _588 = false;
    float _596 = _586;
    float _598 = in.m_57.x;
    float _600 = _564 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _602 = in.m_57.y;
    int _604 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _606 = _604 != 0;
    float _608 = _524 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _610 = in.m_57.z;
    int _612 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _614 = _612 != 0;
    int _616 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _618 = _616 != 0;
    int _620 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _622 = _620 != 0;
    float _624 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _626 = log2(_624);
    float _628 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    float _630 = in.m_57.w;
    float _632 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    bool _634 = !_622;
    int _636 = _634 ? 0 : 1;
    float _638 = _598 * 2.0;
    float _640 = _598 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    bool _642 = !_618;
    int _644 = _642 ? 0 : 1;
    float _646 = _626 * _144;
    float _648 = _602 * 2.0;
    float _650 = floor(_638);
    float _652 = -_628;
    float _654 = fma(_640, 2.0, _652);
    float _656 = _602 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    float _658 = _610 * 2.0;
    float _660 = -_144;
    float _662 = fma(_660, (*spvDescriptorSet0.vp_c9)._m0[76].x, _654);
    int _664 = abs(_644);
    float _666 = (*spvDescriptorSet0.vp_c9)._m0[83].z + (*spvDescriptorSet0.vp_c9)._m0[83].x;
    float _668 = floor(_648);
    float _670 = _638;
    float _672 = _666;
    bool _674 = _622;
    if (!_606)
    {
        _670 = _602;
    }
    float _676 = _670;
    float _678 = fma(_656, -2.0, _632);
    float _680 = _676;
    if (_606)
    {
        _680 = _598;
    }
    float _682 = _680;
    float _684 = _602 + (-0.5);
    float _686 = float(_664);
    float _688 = fma(_144, (*spvDescriptorSet0.vp_c9)._m0[76].y, _678);
    bool _690 = _630 > 0.5;
    float _692 = exp2(_646);
    bool _694 = _650 >= 0.0;
    bool _696 = isnan(_650);
    bool _698 = _694 || _696;
    bool _700 = isnan(0.0);
    bool _702 = _698 || _700;
    float _704 = fma(_682, (*spvDescriptorSet0.vp_c9)._m0[83].z, _666);
    bool _706 = _650 > 0.0;
    float _708 = in.m_63.x;
    int _710 = _702 ? 0 : 1;
    float _712 = _650;
    float _714 = _682;
    if (!_606)
    {
        _712 = _602;
    }
    float _716 = _712;
    float _718 = floor(_658);
    bool _720 = _668 > 0.0;
    bool _722 = _668 >= 0.0;
    bool _724 = isnan(_668);
    bool _726 = _722 || _724;
    bool _728 = isnan(0.0);
    bool _730 = _726 || _728;
    float _732 = _716;
    if (_606)
    {
        _732 = _598;
    }
    float _734 = _732;
    float _736 = -_692;
    float _738 = _736 + 1.0;
    if (!_606)
    {
        _672 = _598;
    }
    float _740 = _672;
    float _742 = (*spvDescriptorSet0.vp_c9)._m0[82].x + (*spvDescriptorSet0.vp_c9)._m0[81].z;
    float _744 = _740;
    if (_606)
    {
        _744 = _610;
    }
    float _746 = _744;
    float _748 = _734 * (*spvDescriptorSet0.vp_c9)._m0[82].x;
    float _750 = (*spvDescriptorSet0.vp_c9)._m0[84].z + (*spvDescriptorSet0.vp_c9)._m0[84].y;
    float _752 = _746;
    if (!_606)
    {
        _714 = _610;
    }
    float _754 = _714;
    float _756 = fma(_144, (*spvDescriptorSet0.vp_c9)._m0[82].z, _704);
    float _758 = -_742;
    float _760 = fma(_748, 2.0, _758);
    float _762 = fma(_746, (*spvDescriptorSet0.vp_c9)._m0[84].z, _750);
    float _764 = _754;
    if (!_606)
    {
        _752 = _754;
    }
    float _766 = _752;
    float _768 = -_144;
    float _770 = fma(_768, (*spvDescriptorSet0.vp_c9)._m0[81].x, _760);
    float _772 = _766;
    if (_606)
    {
        _772 = _602;
    }
    float _774 = _772;
    float _776 = (*spvDescriptorSet0.vp_c9)._m0[82].y + (*spvDescriptorSet0.vp_c9)._m0[81].w;
    int _778 = _730 ? 0 : 1;
    float _780 = fma(_144, (*spvDescriptorSet0.vp_c9)._m0[84].x, _762);
    float _782 = _774 * (*spvDescriptorSet0.vp_c9)._m0[82].y;
    int _784 = ~_710;
    int _786 = _784 + 1;
    int _788 = _786 + 1;
    float _790 = _188 * _188;
    int _792 = ~_778;
    int _794 = _792 + 1;
    int _796 = _794 + 1;
    float _798 = (*spvDescriptorSet0.vp_c9)._m0[83].w + (*spvDescriptorSet0.vp_c9)._m0[83].y;
    int _800 = _788;
    int _802 = _796;
    if (_606)
    {
        _764 = _602;
    }
    float _804 = _764;
    float _806 = fma(_782, -2.0, _776);
    if (!_706)
    {
        int _808 = ~_710;
        int _810 = _808 + 1;
        _800 = _810;
    }
    int _812 = _800;
    float _814 = fma(_186, _186, _790);
    if (!_720)
    {
        int _816 = ~_778;
        int _818 = _816 + 1;
        _802 = _818;
    }
    int _820 = _802;
    float _822 = fma(_804, (*spvDescriptorSet0.vp_c9)._m0[83].w, _798);
    bool _824 = _718 > 0.0;
    bool _826 = _718 >= 0.0;
    bool _828 = isnan(_718);
    bool _830 = _826 || _828;
    bool _832 = isnan(0.0);
    bool _834 = _830 || _832;
    float _836 = fma(_144, (*spvDescriptorSet0.vp_c9)._m0[82].w, _822);
    bool _838 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _840 = isnan(0.0);
    bool _842 = _838 || _840;
    bool _844 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _846 = _842 || _844;
    float _848 = _846 ? _738 : 0.0;
    bool _850 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _852 = isnan(1.0);
    bool _854 = _850 || _852;
    bool _856 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _858 = _854 || _856;
    float _860 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _862 = 1.0 + _860;
    float _864 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    int _866 = _834 ? 0 : 1;
    float _868 = 1.0 / _862;
    int _870 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _872 = _870 != 0;
    float _874 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    float _876 = fma(_598, (*spvDescriptorSet0.vp_c9)._m0[78].z, _864);
    int _878 = ~_866;
    int _880 = _878 + 1;
    int _882 = _880 + 1;
    float _884 = in.m_65.x;
    float _886 = in.m_65.y;
    float _888 = in.m_65.z;
    float _890 = fma(_602, (*spvDescriptorSet0.vp_c9)._m0[78].w, _874);
    float _892 = fma(_144, (*spvDescriptorSet0.vp_c9)._m0[77].z, _876);
    int _894 = _882;
    bool _896 = _872;
    float _898 = _836;
    if (!_824)
    {
        int _900 = ~_866;
        int _902 = _900 + 1;
        _894 = _902;
    }
    int _904 = _894;
    float _906 = in.m_48.x;
    float _908 = in.m_48.y;
    float _910 = in.m_48.z;
    float _912 = fma(_144, (*spvDescriptorSet0.vp_c9)._m0[77].w, _890);
    float _914 = fma(_144, (*spvDescriptorSet0.vp_c9)._m0[81].y, _806);
    int _916 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _918 = _916 != 0;
    if (_858)
    {
        float _920 = _848 * _868;
        _148 = _920;
    }
    float _922 = _148;
    int _924 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _926 = _924 != 0;
    int _928 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _930 = _928 != 0;
    float _932 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _934 = _932 + (*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _936 = 1.0 / _934;
    float _938 = float(_820);
    float _940 = -(*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _942 = _940 + (*spvDescriptorSet0.vp_c9)._m0[133].w;
    float _944 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _886);
    if (_918)
    {
        bool _946 = _610 > 0.5;
        _674 = _946;
    }
    bool _948 = _674;
    float _950 = _908 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _952 = _908 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _954 = _600 * _944;
    float _956 = _908 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _958 = _598 + _602;
    float _960 = fma(_906, (*spvDescriptorSet0.vp_c10)._m0[5].x, _952);
    float _962 = fma(_906, (*spvDescriptorSet0.vp_c10)._m0[4].x, _950);
    float _964 = fma(_906, (*spvDescriptorSet0.vp_c10)._m0[6].x, _956);
    float _966 = -(*spvDescriptorSet0.vp_c9)._m0[131].x;
    float _968 = (*spvDescriptorSet0.vp_c9)._m0[132].x + _966;
    float _970 = _958 + (-1.0);
    float _972 = -(*spvDescriptorSet0.vp_c9)._m0[132].x;
    float _974 = _972 + (*spvDescriptorSet0.vp_c9)._m0[133].x;
    float _976 = 1.0 / _942;
    float _978 = _968 * _936;
    float _980 = fma(_970, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    float _982 = fma(_190, _190, _814);
    int _984 = abs(_636);
    float _986 = _602 + _610;
    float _988 = -(*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _990 = _596 + _988;
    float _992 = fma(_910, (*spvDescriptorSet0.vp_c10)._m0[4].z, _962);
    float _994 = rsqrt(_982);
    float _996 = _986 + (-1.0);
    float _998 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _1000 = _596 + _998;
    float _1002 = fma(_910, (*spvDescriptorSet0.vp_c10)._m0[6].z, _964);
    float _1004 = fma(_910, (*spvDescriptorSet0.vp_c10)._m0[5].z, _960);
    float _1006 = fma(_996, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    float _1008 = fma(_978, _1000, (*spvDescriptorSet0.vp_c9)._m0[131].x);
    float _1010 = _974 * _976;
    float _1012 = in.m_63.y;
    float _1014 = float(_984);
    float _1016 = fma(_1010, _990, (*spvDescriptorSet0.vp_c9)._m0[132].x);
    float _1018 = float(_812);
    float _1020 = _598 + _610;
    float _1022 = in.m_67.x;
    float _1024 = in.m_67.y;
    float _1026 = in.m_67.z;
    float _1028 = _1014 * _938;
    float _1030 = _186 * _994;
    float _1032 = _188 * _994;
    float _1034 = _190 * _994;
    float _1036 = fma((*spvDescriptorSet0.vp_c10)._m0[2].x, (*spvDescriptorSet0.vp_c9)._m0[191].x, _598);
    float _1038 = _1020 + (-1.0);
    float _1040 = _686 * _1018;
    float _1042 = _1036 + _886;
    float _1044 = -(*spvDescriptorSet0.vp_c8)._m0[28].z;
    float _1046 = _1032 * _1044;
    float _1048 = fma(_1038, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    bool _1050 = !_614;
    int _1052 = _1050 ? 0 : 1;
    float _1054 = _1042 * (*spvDescriptorSet0.vp_c9)._m0[191].y;
    bool _1056 = _602 > 0.5;
    float _1058 = -(*spvDescriptorSet0.vp_c8)._m0[28].x;
    float _1060 = _1034 * _1058;
    float _1062 = _1040 * (-2.0);
    int _1064 = abs(_1052);
    float _1066 = _1054 * 0.15915493667125701904296875;
    float _1068 = -(*spvDescriptorSet0.vp_c8)._m0[28].z;
    float _1070 = -_1060;
    float _1072 = fma(_1030, _1068, _1070);
    float _1074 = _1028 * (-2.0);
    float _1076 = float(_1064);
    float _1078 = -(*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _1080 = -_1046;
    float _1082 = fma(_1034, _1078, _1080);
    float _1084 = _1072 * _1072;
    float _1086 = fma(_1006, _1062, _1006);
    float _1088 = -_1012;
    float _1090 = _1088 + 1.0;
    float _1092 = fma(_1062, _1024, _1024);
    float _1094 = fma(_1082, _1082, _1084);
    float _1096 = fma(_1048, _1074, _1048);
    float _1098 = float(_904);
    float _1100 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    float _1102 = fma(_1074, _1026, _1026);
    float _1104 = _610 + (-0.5);
    float _1106 = fma(_684, (*spvDescriptorSet0.vp_c9)._m0[196].y, _1092);
    float _1108 = _1076 * _1098;
    int _1110 = _690 ? as_type<int>(_1090) : as_type<int>(_1012);
    float _1112 = fma(_1104, (*spvDescriptorSet0.vp_c9)._m0[196].z, _1102);
    float _1114 = fma(_1086, _922, _1106);
    float _1116 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _1118 = _1108 * (-2.0);
    bool _1120 = _596 >= (*spvDescriptorSet0.vp_c9)._m0[133].w;
    bool _1122 = isnan(_596);
    bool _1124 = _1120 || _1122;
    bool _1126 = isnan((*spvDescriptorSet0.vp_c9)._m0[133].w);
    bool _1128 = _1124 || _1126;
    float _1130 = float(_1128);
    float _1132 = _598 + (-0.5);
    int _1134 = _872 ? _1110 : as_type<int>(_1012);
    float _1136 = fma(_1096, _922, _1112);
    float _1138 = _1012;
    int _1140 = _1134;
    float _1142 = _990;
    if (_930)
    {
        float _1144 = _1056 ? _1090 : _1012;
        _1138 = _1144;
    }
    float _1146 = _1138;
    float _1148 = fma(_1118, _1022, _1022);
    int _1150 = as_type<int>(_1146);
    if (_926)
    {
        bool _1152 = _598 > 0.5;
        _896 = _1152;
    }
    bool _1154 = _896;
    float _1156 = -_1130;
    float _1158 = _1156 + 1.0;
    bool _1160 = _596 >= (*spvDescriptorSet0.vp_c9)._m0[132].w;
    bool _1162 = isnan(_596);
    bool _1164 = _1160 || _1162;
    bool _1166 = isnan((*spvDescriptorSet0.vp_c9)._m0[132].w);
    bool _1168 = _1164 || _1166;
    float _1170 = float(_1168);
    float _1172 = in.m_69.x;
    float _1174 = -(*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _1176 = _1030 * _1174;
    float _1178 = _1114 * 0.15915493667125701904296875;
    float _1180 = _1066 * 6.283185482025146484375;
    float _1182 = sin(_1180);
    float _1184 = fma(_980, _1118, _980);
    float _1186 = fma(_1132, (*spvDescriptorSet0.vp_c9)._m0[196].x, _1148);
    bool _1188 = _596 >= (*spvDescriptorSet0.vp_c9)._m0[131].w;
    bool _1190 = isnan(_596);
    bool _1192 = _1188 || _1190;
    bool _1194 = isnan((*spvDescriptorSet0.vp_c9)._m0[131].w);
    bool _1196 = _1192 || _1194;
    float _1198 = float(_1196);
    float _1200 = _1170 * _1158;
    float _1202 = -(*spvDescriptorSet0.vp_c8)._m0[28].x;
    float _1204 = -_1176;
    float _1206 = fma(_1032, _1202, _1204);
    float _1208 = -_1170;
    float _1210 = _1208 + 1.0;
    float _1212 = _1100 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    float _1214 = fma(_1184, _922, _1186);
    float _1216 = _1116 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _1218 = fma(_1206, _1206, _1094);
    float _1220 = _1198 * _1210;
    float _1222 = fma(as_type<float>(_1134), _1212, -0.5);
    float _1224 = _1220;
    if (_918)
    {
        float _1226 = -_708;
        float _1228 = _1226 + 1.0;
        _1140 = as_type<int>(_1228);
    }
    int _1230 = _1140;
    float _1232 = _1136 * 0.15915493667125701904296875;
    float _1234 = _1214 * 0.15915493667125701904296875;
    float _1236 = fma(_1216, _1146, -0.5);
    float _1238 = _1008 * _1220;
    if (_926)
    {
        float _1240 = -_708;
        float _1242 = _1240 + 1.0;
        _1150 = as_type<int>(_1242);
    }
    int _1244 = _1150;
    if (!_918)
    {
        _1224 = _708;
    }
    float _1246 = _1224;
    float _1248 = rsqrt(_1218);
    float _1250 = _1246;
    if (_918)
    {
        float _1252 = _948 ? as_type<float>(_1230) : _708;
        _1250 = _1252;
    }
    float _1254 = _1250;
    float _1256 = _1182 * (*spvDescriptorSet0.vp_c9)._m0[191].z;
    if (!_926)
    {
        _1142 = _708;
    }
    float _1258 = _1142;
    float _1260 = -_1198;
    float _1262 = _1260 + 1.0;
    float _1264 = _1258;
    if (_926)
    {
        float _1266 = _1154 ? as_type<float>(_1244) : _708;
        _1264 = _1266;
    }
    float _1268 = _1264;
    float _1270 = _526 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _1272 = _1256 * _1172;
    float _1274 = _1178 * 6.283185482025146484375;
    float _1276 = sin(_1274);
    float _1278 = fma(_1262, (*spvDescriptorSet0.vp_c9)._m0[131].x, _1238);
    float _1280 = -_688;
    float _1282 = fma(_912, _1236, _1280);
    float _1284 = _1272 + _888;
    float _1286 = _1272 + _884;
    float _1288 = fma(_1016, _1200, _1278);
    float _1290 = _992 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _1292 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _1284);
    float _1294 = _1232 * 6.283185482025146484375;
    float _1296 = cos(_1294);
    float _1298 = _1082 * _1248;
    float _1300 = _1072 * _1248;
    float _1302 = _1206 * _1248;
    float _1304 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _1286);
    float _1306 = _608 * _1292;
    float _1308 = _1030 * _1300;
    float _1310 = _1002 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _1312 = _1234 * 6.283185482025146484375;
    float _1314 = sin(_1312);
    float _1316 = _1270 * _1304;
    bool _1318 = _886 != 0.0;
    bool _1320 = isnan(_886);
    bool _1322 = _1318 || _1320;
    bool _1324 = isnan(0.0);
    bool _1326 = _1322 || _1324;
    float _1328 = fma(_1130, (*spvDescriptorSet0.vp_c9)._m0[133].x, _1288);
    float _1330 = _1034 * _1298;
    float _1332 = _1004 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _1334 = -_884;
    bool _1336 = _1272 == _1334;
    bool _1338 = !_1326;
    bool _1340 = _1336 && _1338;
    float _1342 = _1178 * 6.283185482025146484375;
    float _1344 = cos(_1342);
    float _1346 = _1276 * _1296;
    float _1348 = -_888;
    bool _1350 = _1272 == _1348;
    bool _1352 = _1350 && _1340;
    float _1354 = -_1330;
    float _1356 = fma(_1030, _1302, _1354);
    float _1358 = _1234 * 6.283185482025146484375;
    float _1360 = cos(_1358);
    float _1362 = _1314 * _1276;
    float _1364 = _1232 * 6.283185482025146484375;
    float _1366 = sin(_1364);
    float _1368 = _1314 * _1344;
    float _1370 = _1344 * _1296;
    float _1372 = _1360 * _1344;
    float _1374 = _1360 * _1276;
    float _1376 = _1314 * _1296;
    float _1378 = _1360 * _1296;
    float _1380 = _1378 * _1030;
    float _1382 = fma(_1366, _1372, _1362);
    float _1384 = -_1374;
    float _1386 = fma(_1366, _1368, _1384);
    float _1388 = -_1368;
    float _1390 = fma(_1366, _1374, _1388);
    float _1392 = fma(_1366, _1362, _1372);
    float _1394 = _1032 * _1302;
    float _1396 = _1382 * _1030;
    float _1398 = _1390 * _1030;
    float _1400 = -_1366;
    float _1402 = fma(_1400, _1298, _1380);
    float _1404 = -_1394;
    float _1406 = fma(_1034, _1300, _1404);
    float _1408 = fma(_1370, _1298, _1396);
    float _1410 = fma(_1346, _1298, _1398);
    float _1412 = _1378 * _1034;
    float _1414 = _1382 * _1034;
    float _1416 = fma(_1386, _1406, _1408);
    float _1418 = fma(_1392, _1406, _1410);
    float _1420 = -_1308;
    float _1422 = fma(_1032, _1298, _1420);
    float _1424 = -_1366;
    float _1426 = fma(_1424, _1302, _1412);
    float _1428 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _1430 = fma(_1376, _1406, _1402);
    float _1432 = _1390 * _1034;
    float _1434 = fma(_1370, _1302, _1414);
    float _1436 = fma(_1376, _1422, _1426);
    float _1438 = _954 * _1430;
    float _1440 = fma(_1346, _1302, _1432);
    float _1442 = fma(_1386, _1422, _1434);
    float _1444 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    float _1446 = _954 * _1436;
    float _1448 = fma(_1316, _1416, _1438);
    float _1450 = fma(_1392, _1422, _1440);
    float _1452 = _1378 * _1032;
    float _1454 = fma(_1316, _1442, _1446);
    float _1456 = _780 * (-0.15915493667125701904296875);
    float _1458 = fma(_1306, _1418, _1448);
    float _1460 = _1428 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _1462 = fma(_1306, _1450, _1454);
    float _1464 = _1456 * 6.283185482025146484375;
    float _1466 = sin(_1464);
    float _1468 = _1290 + _1458;
    float _1470 = fma(_1460, _1268, -0.5);
    float _1472 = _1310 + _1462;
    float _1474 = _1382 * _1032;
    float _1476 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1478 = _1468 + _1476;
    float _1480 = _1444 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    float _1482 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1484 = _1472 + _1482;
    float _1486 = fma(_892, _1470, _662);
    float _1488 = _1478 * _1478;
    float _1490 = fma(_1480, _1254, -0.5);
    float _1492 = _1484 * _1484;
    float _1494 = in.m_71.x;
    float _1496 = in.m_71.y;
    float _1498 = in.m_71.z;
    float _1500 = _1456 * 6.283185482025146484375;
    float _1502 = cos(_1500);
    float _1504 = -_1366;
    float _1506 = fma(_1504, _1300, _1452);
    float _1508 = _1488 + _1492;
    float _1510 = _1390 * _1032;
    float _1512 = fma(_1370, _1300, _1474);
    float _1514 = fma(_1376, _1356, _1506);
    float _1516 = _1466 * _1222;
    float _1518 = fma(_1346, _1300, _1510);
    float _1520 = sqrt(_1508);
    float _1522 = fma(_1386, _1356, _1512);
    float _1524 = _954 * _1514;
    float _1526 = fma(_1392, _1356, _1518);
    float _1528 = fma(_1316, _1522, _1524);
    float _1530 = _1502 * _1222;
    float _1532 = -_1516;
    float _1534 = fma(_1502, _1490, _1532);
    float _1536 = fma(_1306, _1526, _1528);
    float _1538 = fma(_1466, _1490, _1530);
    float _1540 = fma(_756, _1534, _770);
    float _1542 = _1332 + _1536;
    float _1544 = _1496;
    float _1546 = _1494;
    float _1548 = _1488;
    float _1550 = _1492;
    float _1552 = _1468;
    float _1554 = _1472;
    float _1556 = _1498;
    float _1558 = _1486;
    float _1560 = _1272;
    if (!_1352)
    {
        float _1562 = fma(_886, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1496);
        _1544 = _1562;
    }
    float _1564 = _1544;
    bool _1566 = _1520 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1568 = -_914;
    float _1570 = fma(_836, _1538, _1568);
    if (!_1352)
    {
        float _1572 = fma(_1286, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1494);
        _1546 = _1572;
    }
    float _1574 = _1546;
    float _1576 = _1430 * _1564;
    float _1578 = _1514 * _1564;
    float _1580 = _1436 * _1564;
    if (!_1566)
    {
        _898 = _1542;
    }
    float _1582 = _898;
    bool _1584 = !_1566;
    float _1586 = _1582;
    if (!_1584)
    {
        float _1588 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1590 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1592 = _1520 + _1590;
        float _1594 = rsqrt(_1508);
        float _1596 = _1592 * _1588;
        float _1598 = _1542 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1600 = _1596 * 0.15915493667125701904296875;
        float _1602 = _1600 * 6.283185482025146484375;
        float _1604 = sin(_1602);
        float _1606 = _1600 * 6.283185482025146484375;
        float _1608 = cos(_1606);
        float _1610 = fma(_1604, _1598, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1612 = _1594 * _1610;
        float _1614 = fma(_1478, _1612, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1616 = _1608 + (-1.0);
        float _1618 = fma(_1484, _1612, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        float _1620 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
        float _1622 = _1614 + _1620;
        float _1624 = _1616 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1626 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
        float _1628 = _1618 + _1626;
        float _1630 = _1622 * _1622;
        float _1632 = fma(_1542, _1608, _1624);
        float _1634 = _1628 * _1628;
        _1586 = _1632;
        _1548 = _1630;
        _1550 = _1634;
        _1552 = _1614;
        _1554 = _1618;
    }
    float _1636 = _1586;
    float _1638 = _1548;
    float _1640 = _1550;
    float _1642 = _1552;
    float _1644 = _1554;
    float _1646 = -(*spvDescriptorSet0.vp_c15)._m0[0].y;
    float _1648 = _1636 + _1646;
    float _1650 = fma(_1522, _1574, _1578);
    if (!_1352)
    {
        float _1652 = fma(_1284, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1498);
        _1556 = _1652;
    }
    float _1654 = _1556;
    float _1656 = fma(_1648, _1648, _1638);
    float _1658 = fma(_1416, _1574, _1576);
    float _1660 = _1656 + _1640;
    float _1662 = fma(_1526, _1654, _1650);
    float _1664 = fma(_1442, _1574, _1580);
    float _1666 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _1668 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _1670 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _1672 = sqrt(_1660);
    float _1674 = fma(_1418, _1654, _1658);
    float _1676 = _1666 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1678 = _1668 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1680 = _1670 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1682 = _1282 + 0.5;
    float _1684 = _1328 * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    float _1686 = _1486 + 0.5;
    float _1688 = _1540 + 0.5;
    float _1690 = _1570 + 0.5;
    float _1692 = fma(_1450, _1654, _1664);
    out.m_73.x = _1172;
    out.m_75.x = _1676;
    out.m_75.y = _1678;
    out.m_75.z = _1680;
    out.m_75.w = _1684;
    bool _1694 = _1672 >= (*spvDescriptorSet0.vp_c16)._m0[1].x;
    bool _1696 = isnan(_1672);
    bool _1698 = _1694 || _1696;
    bool _1700 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].x);
    bool _1702 = _1698 || _1700;
    out.m_77.x = _1686;
    out.m_77.y = _1682;
    out.m_77.z = _1688;
    out.m_77.w = _1690;
    out.m_79.x = _1674;
    out.m_79.y = _1662;
    out.m_79.z = _1692;
    float _1704 = _1688;
    if (!_1702)
    {
        _1558 = 1.0;
    }
    float _1706 = _1558;
    bool _1708 = !_1702;
    float _1710 = _1706;
    if (!_1708)
    {
        bool _1712 = _1672 >= (*spvDescriptorSet0.vp_c16)._m0[1].y;
        bool _1714 = isnan(_1672);
        bool _1716 = _1712 || _1714;
        bool _1718 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].y);
        bool _1720 = _1716 || _1718;
        if (!_1720)
        {
            float _1722 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _1724 = _1672 + _1722;
            float _1726 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _1728 = (*spvDescriptorSet0.vp_c16)._m0[1].y + _1726;
            float _1730 = -(*spvDescriptorSet0.vp_c16)._m0[2].x;
            float _1732 = _1730 + (*spvDescriptorSet0.vp_c16)._m0[2].y;
            float _1734 = 1.0 / _1728;
            float _1736 = _1724 * _1734;
            float _1738 = fma(_1736, _1732, (*spvDescriptorSet0.vp_c16)._m0[2].x);
            _1710 = _1738;
            _1740 = true;
        }
        else
        {
            bool _1742 = _1672 >= (*spvDescriptorSet0.vp_c16)._m0[1].z;
            bool _1744 = isnan(_1672);
            bool _1746 = _1742 || _1744;
            bool _1748 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].z);
            bool _1750 = _1746 || _1748;
            if (!_1750)
            {
                float _1752 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _1754 = _1672 + _1752;
                float _1756 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _1758 = _1756 + (*spvDescriptorSet0.vp_c16)._m0[1].z;
                float _1760 = -(*spvDescriptorSet0.vp_c16)._m0[2].y;
                float _1762 = _1760 + (*spvDescriptorSet0.vp_c16)._m0[2].z;
                float _1764 = 1.0 / _1758;
                float _1766 = _1754 * _1764;
                float _1768 = fma(_1766, _1762, (*spvDescriptorSet0.vp_c16)._m0[2].y);
                _1710 = _1768;
                _1740 = true;
            }
            else
            {
                _1710 = (*spvDescriptorSet0.vp_c16)._m0[2].z;
            }
        }
    }
    _1740 = false;
    float _1770 = _1710;
    float _1772 = -(*spvDescriptorSet0.vp_c16)._m0[0].y;
    float _1774 = _1636 + _1772;
    float _1776 = -(*spvDescriptorSet0.vp_c16)._m0[0].x;
    float _1778 = _1642 + _1776;
    float _1780 = -(*spvDescriptorSet0.vp_c16)._m0[0].z;
    float _1782 = _1644 + _1780;
    float _1784 = fma(_1774, _1770, (*spvDescriptorSet0.vp_c16)._m0[0].y);
    float _1786 = fma(_1778, _1770, (*spvDescriptorSet0.vp_c16)._m0[0].x);
    float _1788 = fma(_1782, _1770, (*spvDescriptorSet0.vp_c16)._m0[0].z);
    float _1790 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1792 = _1784 + _1790;
    float _1794 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1796 = _1786 + _1794;
    float _1798 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1800 = _1788 + _1798;
    float _1802 = _1792 * _1792;
    float _1804 = fma(_1796, _1796, _1802);
    float _1806 = fma(_1800, _1800, _1804);
    float _1808 = rsqrt(_1806);
    float _1810 = sqrt(_1806);
    float _1812 = _1808 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1814 = _1796 * _1812;
    float _1816 = _1800 * _1812;
    float _1818 = _1814 * _1814;
    float _1820 = _1816 * _1816;
    float _1822 = _1818 + _1820;
    float _1824 = sqrt(_1822);
    bool _1826 = _1824 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1828 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1830 = _1824 + _1828;
    float _1832 = _1808;
    float _1834 = _1822;
    float _1836 = _1830;
    float _1838 = _1770;
    float _1840 = _1792;
    if (_1826)
    {
        float _1842 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1832 = _1842;
    }
    float _1844 = _1832;
    if (_1826)
    {
        float _1846 = rsqrt(_1822);
        _1834 = _1846;
    }
    float _1848 = _1834;
    if (_1826)
    {
        float _1850 = _1830 * _1844;
        _1836 = _1850;
    }
    float _1852 = _1836;
    if (_1826)
    {
        float _1854 = _1852 * 0.15915493667125701904296875;
        _1838 = _1854;
    }
    float _1856 = _1838;
    float _1858 = _1844;
    if (_1826)
    {
        float _1860 = _1856 * 6.283185482025146484375;
        float _1862 = sin(_1860);
        _1858 = _1862;
    }
    float _1864 = _1858;
    float _1866 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _1868 = precise::max(0.0, _1866);
    float _1870 = _1800;
    float _1872 = _1868;
    if (_1826)
    {
        float _1874 = _1856 * 6.283185482025146484375;
        float _1876 = cos(_1874);
        _1870 = _1876;
    }
    float _1878 = _1870;
    float _1880 = -_1812;
    float _1882 = -_1868;
    float _1884 = fma(_1792, _1880, _1882);
    float _1886 = _1884;
    if (_1826)
    {
        float _1888 = _1884 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1872 = _1888;
    }
    float _1890 = _1872;
    float _1892 = _1784 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1894 = _1864;
    float _1896 = _1890;
    if (_1826)
    {
        float _1898 = fma(_1864, _1890, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1704 = _1898;
    }
    float _1900 = _1704;
    float _1902 = _1900;
    if (!_1826)
    {
        _1894 = _1814;
    }
    float _1904 = _1894;
    float _1906 = _1904;
    float _1908 = _1878;
    if (_1826)
    {
        float _1910 = _1878 + (-1.0);
        _1896 = _1910;
    }
    float _1912 = _1896;
    float _1914 = _1912;
    if (_1826)
    {
        float _1916 = _1848 * _1900;
        _1560 = _1916;
    }
    float _1918 = _1560;
    if (!_1826)
    {
        _1902 = _1816;
    }
    float _1920 = _1902;
    float _1922 = _1920;
    if (_1826)
    {
        float _1924 = _1912 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1840 = _1924;
    }
    float _1926 = _1840;
    if (_1826)
    {
        float _1928 = _1814 * _1918;
        _1906 = _1928;
    }
    float _1930 = _1906;
    if (!_1826)
    {
        _1914 = _1818;
    }
    float _1932 = _1914;
    float _1934 = _1932;
    if (_1826)
    {
        float _1936 = _1816 * _1918;
        _1922 = _1936;
    }
    float _1938 = _1922;
    if (_1826)
    {
        float _1940 = fma(_1884, _1878, _1926);
        _1886 = _1940;
    }
    float _1942 = _1886;
    if (_1826)
    {
        float _1944 = _1930 * _1930;
        _1934 = _1944;
    }
    float _1946 = _1934;
    if (!_1826)
    {
        _1908 = _1820;
    }
    float _1948 = _1908;
    float _1950 = _1948;
    if (_1826)
    {
        float _1952 = _1938 * _1938;
        _1950 = _1952;
    }
    float _1954 = _1950;
    float _1956 = fma(_1942, _1942, _1946);
    float _1958 = _1784 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1960 = _1784 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1962 = _1956 + _1954;
    float _1964 = _1784 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1966 = fma(_1786, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1958);
    float _1968 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _1970 = fma(_1810, (*spvDescriptorSet0.vp_c15)._m0[23].w, _1968);
    float _1972 = precise::clamp(_1970, 0.0, 1.0);
    float _1974 = rsqrt(_1962);
    float _1976 = fma(_1786, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1964);
    float _1978 = fma(_1786, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1892);
    float _1980 = fma(_1788, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1966);
    float _1982 = -_1972;
    float _1984 = _1982 + 1.0;
    float _1986 = fma(_1788, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1976);
    float _1988 = fma(_1788, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1978);
    float _1990 = fma(_1786, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1960);
    float _1992 = _1980 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1994 = _1986 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1996 = _1988 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1998 = fma(_1788, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1990);
    float _2000 = abs(_1984);
    float _2002 = log2(_2000);
    float _2004 = _1994 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _2006 = fma(_1290, (*spvDescriptorSet0.vp_c15)._m0[652].x, (*spvDescriptorSet0.vp_c15)._m0[652].z);
    float _2008 = _1998 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _2010 = _1974 * _1930;
    float _2012 = fma(_1992, (*spvDescriptorSet0.vp_c8)._m0[7].x, _2004);
    float _2014 = _1974 * _1942;
    float _2016 = _1974 * _1938;
    float _2018 = floor(_2006);
    float _2020 = fma(_1996, (*spvDescriptorSet0.vp_c8)._m0[7].z, _2012);
    float _2022 = fma(_1310, (*spvDescriptorSet0.vp_c15)._m0[652].y, (*spvDescriptorSet0.vp_c15)._m0[652].w);
    float _2024 = fma(_2008, (*spvDescriptorSet0.vp_c8)._m0[7].w, _2020);
    float _2026 = _2010 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _2028 = floor(_2022);
    float _2030 = -_2026;
    float _2032 = fma(_2014, (*spvDescriptorSet0.vp_c15)._m0[21].y, _2030);
    float _2034 = _2002 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _2036 = -_2016;
    float _2038 = fma(_2036, (*spvDescriptorSet0.vp_c15)._m0[21].z, _2032);
    float _2040 = _1996 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _2042 = exp2(_2034);
    float _2044 = fma(_2038, -0.5, 0.5);
    float _2046 = fma(_2038, 0.5, 0.5);
    float _2048 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _2050 = -_2018;
    float _2052 = _2006 + _2050;
    float _2054 = -_2040;
    float _2056 = fma(_2054, _2048, 1.0);
    float _2058 = sqrt(_2044);
    float _2060 = fma(_2046, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _2062 = _1994 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _2064 = _1994 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _2066 = fma(_2046, _2060, -0.212114393711090087890625);
    float _2068 = fma(_1992, (*spvDescriptorSet0.vp_c8)._m0[4].x, _2062);
    float _2070 = fma(_1992, (*spvDescriptorSet0.vp_c8)._m0[5].x, _2064);
    float _2072 = 1.0 / _2024;
    float _2074 = -_2028;
    float _2076 = _2022 + _2074;
    float _2078 = fma(_1996, (*spvDescriptorSet0.vp_c8)._m0[4].z, _2068);
    float _2080 = fma(_1996, (*spvDescriptorSet0.vp_c8)._m0[5].z, _2070);
    float _2082 = _2014 + 1.0;
    float _2084 = fma(_2046, _2066, 1.570728778839111328125);
    float _2086 = fma(_2008, (*spvDescriptorSet0.vp_c8)._m0[4].w, _2078);
    float _2088 = fma(_2008, (*spvDescriptorSet0.vp_c8)._m0[5].w, _2080);
    float _2090 = log2(_2056);
    float _2092 = _2058 * 0.636619746685028076171875;
    float _2094 = -_2014;
    float _2096 = fma(_2042, _2082, _2094);
    float2 _5797 = float2(_2052, _2076);
    float _2098 = dm_bs(spvDescriptorSet0.vp_t_tcb_24.sample(spvDescriptorSet0.vp_t_tcb_24Smplr, select(_5797, float2(0.0), isnan(_5797)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_24, spvDescriptorSet0.vp_t_tcb_24Smplr_w, select(_5797, float2(0.0), isnan(_5797)), level(0.0)).x;
    float _2100 = -_2084;
    float _2102 = fma(_2092, _2100, 1.0);
    float _2104 = fma(_2096, 0.5, 0.5);
    float _2106 = _2086 * _2072;
    float _2108 = _2088 * _2072;
    float _2110 = fma(_2106, 0.5, 0.5);
    float _2112 = fma(_2108, -0.5, 0.5);
    float _2114 = _2090 * 0.693147182464599609375;
    float _2116 = _2114 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float3 _5832 = float3(_2110, _2112, _2116);
    float _2118 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_5832, float3(0.0), isnan(_5832)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_5832, float3(0.0), isnan(_5832)), level(0.0)).x;
    float3 _5843 = float3(_2110, _2112, _2116);
    float4 _2121 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_5843, float3(0.0), isnan(_5843)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_5843, float3(0.0), isnan(_5843)), level(0.0)).xyzw;
    float _2123 = _2121.x;
    float _2125 = _2121.y;
    float _2127 = _2121.z;
    float _2129 = _2121.w;
    float2 _5859 = float2(_2102, _2104);
    float3 _2133 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_5859, float2(0.0), isnan(_5859)), level(0.0)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_5859, float2(0.0), isnan(_5859)), level(0.0)).xyz;
    float _2135 = _2133.x;
    float _2137 = _2133.y;
    float _2139 = _2133.z;
    float _2141 = _1332 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _2143 = _1332 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _2145 = _1994 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    bool _2147 = _1810 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _2149 = isnan(_1810);
    bool _2151 = _2147 || _2149;
    bool _2153 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _2155 = _2151 || _2153;
    float _2157 = fma(_1290, (*spvDescriptorSet0.vp_c8)._m0[11].x, _2141);
    float _2159 = fma(_1290, (*spvDescriptorSet0.vp_c8)._m0[10].x, _2143);
    float _2161 = fma(_1992, (*spvDescriptorSet0.vp_c8)._m0[6].x, _2145);
    float _2163 = fma(_1310, (*spvDescriptorSet0.vp_c8)._m0[11].z, _2157);
    float _2165 = fma(_1310, (*spvDescriptorSet0.vp_c8)._m0[10].z, _2159);
    float _2167 = _2163 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _2169 = _2165 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _2171 = fma(_1996, (*spvDescriptorSet0.vp_c8)._m0[6].z, _2161);
    float _2173 = 1.0 / _2167;
    float _2175 = _2169 + _2167;
    float _2177 = in.m_81.x;
    float _2179 = fma(_2008, (*spvDescriptorSet0.vp_c8)._m0[6].w, _2171);
    float _2181 = _2175 * _2173;
    float _2183 = _2181 * 0.5;
    float _2185 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _2187 = fma(_2183, (*spvDescriptorSet0.vp_c8)._m0[30].w, _2185);
    float _2189 = _2002 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _2191 = 1.0 / _2187;
    float _2193 = exp2(_2189);
    float _2195 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _2197 = _2191 * _2195;
    float _2199 = abs(_2197);
    float _2201 = log2(_2199);
    float _2203 = -_2193;
    float _2205 = _2203 + 1.0;
    bool _2207 = _2197 <= 8000.0;
    bool _2209 = isnan(_2197);
    bool _2211 = _2207 || _2209;
    bool _2213 = isnan(8000.0);
    bool _2215 = _2211 || _2213;
    float _2217 = float(_2215);
    float _2219 = _2201 * (*spvDescriptorSet0.vp_c15)._m0[654].z;
    float _2221 = exp2(_2219);
    float _2223 = fma(_2221, (*spvDescriptorSet0.vp_c15)._m0[654].x, (*spvDescriptorSet0.vp_c15)._m0[654].y);
    float _2225 = precise::clamp(_2223, 0.0, 1.0);
    float _2227 = _2179 + _2024;
    float _2229 = fma(_2225, -2.0, 3.0);
    float _2231 = _2225 * _2225;
    float _2233 = _2227 * 0.5;
    float _2235 = _2231 * _2229;
    out.m_83.z = _2233;
    out.m_83.w = _2024;
    float _2237 = -_2235;
    float _2239 = _2237 + 1.0;
    float _2241 = fma(_2239, (*spvDescriptorSet0.vp_c15)._m0[654].w, _2235);
    float _2243 = _2205 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _2245 = _2217 * _2241;
    out.gl_Position.x = _2086;
    out.gl_Position.y = _2088;
    out.gl_Position.z = _2179;
    out.gl_Position.w = _2024;
    float _2247 = _2245 * (*spvDescriptorSet0.vp_c15)._m0[653].x;
    float _2249 = _2179;
    float _2251 = _2088;
    float _2253 = _2086;
    if (!_2155)
    {
        _2249 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _2255 = _2249;
    float _2257 = _2255;
    float _2259 = _2255;
    if (!_2155)
    {
        _2251 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _2261 = _2251;
    float _2263 = _2261;
    float _2265 = _2261;
    if (!_2155)
    {
        _2253 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _2267 = _2253;
    float _2269 = -_2098;
    float _2271 = _2269 + 1.0;
    float _2273 = _2271 * _2247;
    float _2275 = precise::clamp(_2273, 0.0, 1.0);
    float _2277 = -_2275;
    float _2279 = fma(_2277, (*spvDescriptorSet0.vp_c15)._m0[653].y, 1.0);
    float _2281 = _2279 * _2177;
    float _2283 = _2281 * (*spvDescriptorSet0.vp_c13)._m0[1].w;
    float _2285 = _2243 * _2118;
    float _2287 = -_2243;
    float _2289 = _2287 + 1.0;
    out.m_85.x = _2283;
    float _2291 = _2129 * _2285;
    float _2293 = _2139 * _2285;
    float _2295 = fma(_2135, _2291, _2123);
    float _2297 = fma(_2137, _2291, _2125);
    float _2299 = _2129 * _2289;
    float _2301 = fma(_2129, _2293, _2127);
    out.m_87.x = _2295;
    out.m_87.y = _2297;
    out.m_87.z = _2301;
    out.m_87.w = _2299;
    bool _2303 = !_2155;
    float _2305 = _2267;
    float _2307 = _2267;
    if (!_2303)
    {
        bool _2309 = _1810 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _2311 = isnan(_1810);
        bool _2313 = _2309 || _2311;
        bool _2315 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _2317 = _2313 || _2315;
        if (!_2317)
        {
            float _2319 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2321 = _1810 + _2319;
            float _2323 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2325 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _2323;
            float _2327 = 1.0 / _2325;
            float _2329 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _2331 = _2329 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _2333 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _2335 = _2333 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _2337 = _2321 * _2327;
            float _2339 = precise::clamp(_2337, 0.0, 1.0);
            float _2341 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _2343 = _2341 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _2345 = fma(_2339, _2335, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _2347 = fma(_2339, _2343, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _2349 = fma(_2339, _2331, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            _2265 = _2349;
            _2259 = _2347;
            _2307 = _2345;
            _2351 = true;
        }
        else
        {
            bool _2353 = _1810 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _2355 = isnan(_1810);
            bool _2357 = _2353 || _2355;
            bool _2359 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _2361 = _2357 || _2359;
            if (!_2361)
            {
                _2257 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _2363 = _2257;
            _2259 = _2363;
            if (!_2361)
            {
                _2263 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _2365 = _2263;
            _2265 = _2365;
            if (!_2361)
            {
                _2305 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _2367 = _2305;
            bool _2369 = !_2361;
            _2307 = _2367;
            if (!_2369)
            {
                bool _2371 = _1810 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _2373 = isnan(_1810);
                bool _2375 = _2371 || _2373;
                bool _2377 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _2379 = _2375 || _2377;
                if (!_2379)
                {
                    float _2381 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2383 = _1810 + _2381;
                    float _2385 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2387 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _2385;
                    float _2389 = 1.0 / _2387;
                    float _2391 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _2393 = _2391 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _2395 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _2397 = _2395 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _2399 = _2383 * _2389;
                    float _2401 = precise::clamp(_2399, 0.0, 1.0);
                    float _2403 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _2405 = _2403 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _2407 = fma(_2401, _2397, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _2409 = fma(_2401, _2405, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _2411 = fma(_2401, _2393, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    _2265 = _2411;
                    _2259 = _2409;
                    _2307 = _2407;
                    _2351 = true;
                }
                else
                {
                    _2265 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _2259 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _2307 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                }
            }
        }
    }
    _2351 = false;
    float _2413 = _2265;
    float _2415 = _2259;
    float _2417 = _2307;
    float _2419 = _2413 * 0.586610972881317138671875;
    bool _2421 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    out.m_89.x = 0.0;
    float _2423 = fma(_2415, 0.298911988735198974609375, _2419);
    float _2425 = fma(_2417, 0.114477999508380889892578125, _2423);
    float _2427 = -_2425;
    float _2429 = _2427 + _2415;
    float _2431 = -_2425;
    float _2433 = _2431 + _2413;
    float _2435 = -_2425;
    float _2437 = _2435 + _2417;
    float _2439 = (*spvDescriptorSet0.vp_c10)._m0[3].x * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _2441 = fma(_2429, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2425);
    float _2443 = fma(_2433, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2425);
    float _2445 = fma(_2437, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2425);
    out.m_51.x = _2439;
    out.m_91.x = _2441;
    out.m_91.y = _2443;
    out.m_91.z = _2445;
    if (!_2421)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _2447 = -_1784;
    float _2449 = _2447 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
    float _2451 = -_1786;
    float _2453 = _2451 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
    float _2455 = -_1788;
    float _2457 = _2455 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
    float _2459 = _2449 * _2449;
    float _2461 = fma(_2453, _2453, _2459);
    float _2463 = fma(_2457, _2457, _2461);
    float _2465 = sqrt(_2463);
    float _2467 = rsqrt(_2463);
    float _2469 = -_2465;
    float _2471 = _2469 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _2473 = _2471 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
    float _2475 = precise::clamp(_2473, 0.0, 1.0);
    float _2477 = _2453 * _2467;
    float _2479 = _2449 * _2467;
    float _2481 = abs(_2475);
    float _2483 = log2(_2481);
    float _2485 = _2457 * _2467;
    float _2487 = _2477 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
    float _2489 = _1662 * _2479;
    float _2491 = -_2479;
    float _2493 = -_2487;
    float _2495 = fma(_2491, (*spvDescriptorSet0.vp_c15)._m0[656].y, _2493);
    float _2497 = fma(_1674, _2477, _2489);
    float _2499 = -_2485;
    float _2501 = fma(_2499, (*spvDescriptorSet0.vp_c15)._m0[656].z, _2495);
    float _2503 = fma(_1692, _2485, _2497);
    float _2505 = precise::clamp(_2503, 0.0, 1.0);
    float _2507 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
    float _2509 = _2501 + _2507;
    float _2511 = _2483 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
    float _2513 = _2509 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
    float _2515 = precise::clamp(_2513, 0.0, 1.0);
    float _2517 = exp2(_2511);
    float _2519 = _2517 * _2515;
    float _2521 = _2505 * _2519;
    float _2523 = _2521 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
    float _2525 = _2521 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
    float _2527 = _2521 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
    out.m_89.x = _2523;
    out.m_89.y = _2525;
    out.m_89.z = _2527;
    out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
}


vertex main0_out main0_z(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]])
{
    main0_out out = {};
    out.m_61 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_75 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_51 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_91 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_73 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_77 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_83 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_79 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_89 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_85 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_87 = float4(0.0, 0.0, 0.0, 1.0);
    bool _2351 = false;
    bool _1740 = false;
    bool _588 = false;
    bool _434 = false;
    bool _212 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _105 = in.m_48.w;
    float _107 = trunc(_105);
    int _110 = int(_107);
    bool _114 = _110 >= 1;
    float _116 = 0.0;
    if (!_114)
    {
        _116 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _118 = _116;
    float _120 = _118;
    if (!_114)
    {
        out.m_51.x = 0.0;
    }
    int _122 = 0;
    if (!_114)
    {
        float _124 = _118 * 5.0;
        _122 = as_type<int>(_124);
    }
    int _126 = _122;
    int _128 = _126;
    if (!_114)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2584 = as_type<float>(_126);
        out.gl_Position.z = _2584;
    }
    if (!_114)
    {
        return out;
    }
    float _130 = in.m_53.w;
    bool _132 = _130 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _134 = isnan(_130);
    bool _136 = _132 || _134;
    bool _138 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _140 = _136 || _138;
    float _142 = -_130;
    float _144 = _142 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    float _146 = 0.0;
    float _148 = _144;
    if (_140)
    {
        float _150 = float(_110);
        _146 = _150;
    }
    float _152 = _146;
    bool _154 = _144 >= _152;
    bool _156 = !_140;
    bool _158 = _154 || _156;
    if (_158)
    {
        _120 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _160 = _120;
    if (_158)
    {
        out.m_51.x = 0.0;
    }
    if (_158)
    {
        float _162 = _160 * 5.0;
        _128 = as_type<int>(_162);
    }
    int _164 = _128;
    if (_158)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2653 = as_type<float>(_164);
        out.gl_Position.z = _2653;
    }
    if (_158)
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
    float _210;
    if (!_192)
    {
        float _194 = in.m_57.x;
        float _196 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _198 = _194 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _200 = fma(_198, (*spvDescriptorSet0.vp_c9)._m0[12].x, _144);
        float _202 = _200 * _196;
        float _204 = floor(_202);
        float _206 = -_204;
        float _208 = _202 + _206;
        _210 = _208;
        _212 = true;
    }
    else
    {
        float _214 = float(_110);
        float _216 = 1.0 / _214;
        float _218 = _144 * _216;
        _210 = _218;
    }
    _212 = false;
    float _220 = _210;
    float _222 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _224 = _220 + _222;
    float _226 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _228 = _220 + _226;
    bool _230 = _220 >= (*spvDescriptorSet0.vp_c9)._m0[146].w;
    bool _232 = isnan(_220);
    bool _234 = _230 || _232;
    bool _236 = isnan((*spvDescriptorSet0.vp_c9)._m0[146].w);
    bool _238 = _234 || _236;
    float _240 = float(_238);
    float _242 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _244 = (*spvDescriptorSet0.vp_c9)._m0[146].w + _242;
    float _246 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _248 = _220 + _246;
    float _250 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _252 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _250;
    float _254 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _256 = _254 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _258 = 1.0 / _244;
    bool _260 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _262 = 1.0 / _256;
    float _264 = 1.0 / _252;
    float _266 = _224 * _258;
    bool _268 = _220 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _270 = isnan(_220);
    bool _272 = _268 || _270;
    bool _274 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _276 = _272 || _274;
    float _278 = float(_276);
    float _280 = -_240;
    float _282 = _280 + 1.0;
    float _284 = _278 * _282;
    float _286 = _228 * _262;
    bool _288 = _220 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _290 = isnan(_220);
    bool _292 = _288 || _290;
    bool _294 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _296 = _292 || _294;
    float _298 = float(_296);
    float _300 = -(*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _302 = (*spvDescriptorSet0.vp_c9)._m0[144].z + _300;
    bool _304 = _220 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _306 = isnan(_220);
    bool _308 = _304 || _306;
    bool _310 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _312 = _308 || _310;
    float _314 = float(_312);
    float _316 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _318 = _316 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _320 = -_278;
    float _322 = _320 + 1.0;
    float _324 = -_298;
    float _326 = _324 + 1.0;
    float _328 = _248 * _264;
    float _330 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _332 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _330;
    float _334 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _336 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _334;
    float _338 = _314 * _326;
    float _340 = fma(_302, _328, (*spvDescriptorSet0.vp_c9)._m0[143].z);
    float _342 = fma(_332, _328, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _344 = fma(_336, _328, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _346 = _298 * _322;
    float _348 = -(*spvDescriptorSet0.vp_c9)._m0[144].z;
    float _350 = _348 + (*spvDescriptorSet0.vp_c9)._m0[145].z;
    float _352 = _342 * _338;
    float _354 = _344 * _338;
    float _356 = _340 * _338;
    float _358 = -_314;
    float _360 = _358 + 1.0;
    float _362 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _364 = _362 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _366 = fma(_360, (*spvDescriptorSet0.vp_c9)._m0[143].x, _354);
    float _368 = fma(_360, (*spvDescriptorSet0.vp_c9)._m0[143].y, _352);
    float _370 = fma(_360, (*spvDescriptorSet0.vp_c9)._m0[143].z, _356);
    float _372 = -(*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _374 = (*spvDescriptorSet0.vp_c9)._m0[146].x + _372;
    float _376 = fma(_318, _286, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _378 = fma(_364, _286, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _380 = fma(_350, _286, (*spvDescriptorSet0.vp_c9)._m0[144].z);
    float _382 = -(*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _384 = (*spvDescriptorSet0.vp_c9)._m0[146].y + _382;
    float _386 = -(*spvDescriptorSet0.vp_c9)._m0[145].z;
    float _388 = (*spvDescriptorSet0.vp_c9)._m0[146].z + _386;
    float _390 = fma(_376, _346, _366);
    float _392 = fma(_374, _266, (*spvDescriptorSet0.vp_c9)._m0[145].x);
    float _394 = fma(_384, _266, (*spvDescriptorSet0.vp_c9)._m0[145].y);
    float _396 = fma(_388, _266, (*spvDescriptorSet0.vp_c9)._m0[145].z);
    float _398 = fma(_378, _346, _368);
    float _400 = fma(_380, _346, _370);
    float _402 = fma(_392, _284, _390);
    float _404 = fma(_394, _284, _398);
    float _406 = fma(_396, _284, _400);
    float _408 = fma(_240, (*spvDescriptorSet0.vp_c9)._m0[146].x, _402);
    float _410 = fma(_240, (*spvDescriptorSet0.vp_c9)._m0[146].y, _404);
    float _412 = fma(_240, (*spvDescriptorSet0.vp_c9)._m0[146].z, _406);
    bool _414 = !_260;
    float _432;
    if (!_414)
    {
        float _416 = in.m_57.x;
        float _418 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _420 = _416 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _422 = fma(_420, (*spvDescriptorSet0.vp_c9)._m0[11].y, _144);
        float _424 = _422 * _418;
        float _426 = floor(_424);
        float _428 = -_426;
        float _430 = _424 + _428;
        _432 = _430;
        _434 = true;
    }
    else
    {
        float _436 = float(_110);
        float _438 = 1.0 / _436;
        float _440 = _144 * _438;
        _432 = _440;
    }
    _434 = false;
    float _442 = _432;
    float _444 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _446 = _442 + _444;
    float _448 = in.m_59.x;
    float _450 = in.m_59.y;
    float _452 = in.m_59.z;
    float _454 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _456 = _454 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _458 = _442 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _460 = isnan(_442);
    bool _462 = _458 || _460;
    bool _464 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _466 = _462 || _464;
    float _468 = float(_466);
    float _470 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _472 = _470 + (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _474 = _442 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _476 = isnan(_442);
    bool _478 = _474 || _476;
    bool _480 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _482 = _478 || _480;
    float _484 = float(_482);
    float _486 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _488 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _486;
    bool _490 = _442 >= (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _492 = isnan(_442);
    bool _494 = _490 || _492;
    bool _496 = isnan((*spvDescriptorSet0.vp_c9)._m0[117].w);
    bool _498 = _494 || _496;
    float _500 = float(_498);
    float _502 = 1.0 / _456;
    float _504 = -_468;
    float _506 = _504 + 1.0;
    bool _508 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].w;
    float _510 = _484 * _506;
    float _512 = -_484;
    float _514 = _512 + 1.0;
    float _516 = 1.0 / _472;
    float _518 = _488 * _502;
    float _520 = -(*spvDescriptorSet0.vp_c9)._m0[116].x;
    float _522 = _520 + (*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _524 = _412 * _452;
    float _526 = _408 * _448;
    float _528 = fma(_518, _446, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _530 = _522 * _516;
    float _532 = _528 * _510;
    float _534 = -_500;
    float _536 = _534 + 1.0;
    float _538 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _540 = _442 + _538;
    float _542 = fma(_514, (*spvDescriptorSet0.vp_c9)._m0[115].x, _532);
    float _544 = _468 * _536;
    float _546 = fma(_530, _540, (*spvDescriptorSet0.vp_c9)._m0[116].x);
    float _548 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _550 = fma(_546, _544, _542);
    float _552 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _554 = _548 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _556 = fma(_500, (*spvDescriptorSet0.vp_c9)._m0[117].x, _550);
    float _558 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _560 = _552 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _562 = _556 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _564 = _410 * _450;
    float _566 = _558 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    out.m_61.x = _554;
    out.m_61.y = _566;
    out.m_61.z = _560;
    out.m_61.w = _562;
    bool _568 = !_508;
    float _586;
    if (!_568)
    {
        float _570 = in.m_57.x;
        float _572 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].w;
        float _574 = _570 * (*spvDescriptorSet0.vp_c9)._m0[13].x;
        float _576 = fma(_574, (*spvDescriptorSet0.vp_c9)._m0[11].w, _144);
        float _578 = _576 * _572;
        float _580 = floor(_578);
        float _582 = -_580;
        float _584 = _578 + _582;
        _586 = _584;
        _588 = true;
    }
    else
    {
        float _590 = float(_110);
        float _592 = 1.0 / _590;
        float _594 = _144 * _592;
        _586 = _594;
    }
    _588 = false;
    float _596 = _586;
    float _598 = in.m_57.x;
    float _600 = _564 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _602 = in.m_57.y;
    int _604 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _606 = _604 != 0;
    float _608 = _524 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _610 = in.m_57.z;
    int _612 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _614 = _612 != 0;
    int _616 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _618 = _616 != 0;
    int _620 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _622 = _620 != 0;
    float _624 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _626 = log2(_624);
    float _628 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    float _630 = in.m_57.w;
    float _632 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    bool _634 = !_622;
    int _636 = _634 ? 0 : 1;
    float _638 = _598 * 2.0;
    float _640 = _598 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    bool _642 = !_618;
    int _644 = _642 ? 0 : 1;
    float _646 = _626 * _144;
    float _648 = _602 * 2.0;
    float _650 = floor(_638);
    float _652 = -_628;
    float _654 = fma(_640, 2.0, _652);
    float _656 = _602 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    float _658 = _610 * 2.0;
    float _660 = -_144;
    float _662 = fma(_660, (*spvDescriptorSet0.vp_c9)._m0[76].x, _654);
    int _664 = abs(_644);
    float _666 = (*spvDescriptorSet0.vp_c9)._m0[83].z + (*spvDescriptorSet0.vp_c9)._m0[83].x;
    float _668 = floor(_648);
    float _670 = _638;
    float _672 = _666;
    bool _674 = _622;
    if (!_606)
    {
        _670 = _602;
    }
    float _676 = _670;
    float _678 = fma(_656, -2.0, _632);
    float _680 = _676;
    if (_606)
    {
        _680 = _598;
    }
    float _682 = _680;
    float _684 = _602 + (-0.5);
    float _686 = float(_664);
    float _688 = fma(_144, (*spvDescriptorSet0.vp_c9)._m0[76].y, _678);
    bool _690 = _630 > 0.5;
    float _692 = exp2(_646);
    bool _694 = _650 >= 0.0;
    bool _696 = isnan(_650);
    bool _698 = _694 || _696;
    bool _700 = isnan(0.0);
    bool _702 = _698 || _700;
    float _704 = fma(_682, (*spvDescriptorSet0.vp_c9)._m0[83].z, _666);
    bool _706 = _650 > 0.0;
    float _708 = in.m_63.x;
    int _710 = _702 ? 0 : 1;
    float _712 = _650;
    float _714 = _682;
    if (!_606)
    {
        _712 = _602;
    }
    float _716 = _712;
    float _718 = floor(_658);
    bool _720 = _668 > 0.0;
    bool _722 = _668 >= 0.0;
    bool _724 = isnan(_668);
    bool _726 = _722 || _724;
    bool _728 = isnan(0.0);
    bool _730 = _726 || _728;
    float _732 = _716;
    if (_606)
    {
        _732 = _598;
    }
    float _734 = _732;
    float _736 = -_692;
    float _738 = _736 + 1.0;
    if (!_606)
    {
        _672 = _598;
    }
    float _740 = _672;
    float _742 = (*spvDescriptorSet0.vp_c9)._m0[82].x + (*spvDescriptorSet0.vp_c9)._m0[81].z;
    float _744 = _740;
    if (_606)
    {
        _744 = _610;
    }
    float _746 = _744;
    float _748 = _734 * (*spvDescriptorSet0.vp_c9)._m0[82].x;
    float _750 = (*spvDescriptorSet0.vp_c9)._m0[84].z + (*spvDescriptorSet0.vp_c9)._m0[84].y;
    float _752 = _746;
    if (!_606)
    {
        _714 = _610;
    }
    float _754 = _714;
    float _756 = fma(_144, (*spvDescriptorSet0.vp_c9)._m0[82].z, _704);
    float _758 = -_742;
    float _760 = fma(_748, 2.0, _758);
    float _762 = fma(_746, (*spvDescriptorSet0.vp_c9)._m0[84].z, _750);
    float _764 = _754;
    if (!_606)
    {
        _752 = _754;
    }
    float _766 = _752;
    float _768 = -_144;
    float _770 = fma(_768, (*spvDescriptorSet0.vp_c9)._m0[81].x, _760);
    float _772 = _766;
    if (_606)
    {
        _772 = _602;
    }
    float _774 = _772;
    float _776 = (*spvDescriptorSet0.vp_c9)._m0[82].y + (*spvDescriptorSet0.vp_c9)._m0[81].w;
    int _778 = _730 ? 0 : 1;
    float _780 = fma(_144, (*spvDescriptorSet0.vp_c9)._m0[84].x, _762);
    float _782 = _774 * (*spvDescriptorSet0.vp_c9)._m0[82].y;
    int _784 = ~_710;
    int _786 = _784 + 1;
    int _788 = _786 + 1;
    float _790 = _188 * _188;
    int _792 = ~_778;
    int _794 = _792 + 1;
    int _796 = _794 + 1;
    float _798 = (*spvDescriptorSet0.vp_c9)._m0[83].w + (*spvDescriptorSet0.vp_c9)._m0[83].y;
    int _800 = _788;
    int _802 = _796;
    if (_606)
    {
        _764 = _602;
    }
    float _804 = _764;
    float _806 = fma(_782, -2.0, _776);
    if (!_706)
    {
        int _808 = ~_710;
        int _810 = _808 + 1;
        _800 = _810;
    }
    int _812 = _800;
    float _814 = fma(_186, _186, _790);
    if (!_720)
    {
        int _816 = ~_778;
        int _818 = _816 + 1;
        _802 = _818;
    }
    int _820 = _802;
    float _822 = fma(_804, (*spvDescriptorSet0.vp_c9)._m0[83].w, _798);
    bool _824 = _718 > 0.0;
    bool _826 = _718 >= 0.0;
    bool _828 = isnan(_718);
    bool _830 = _826 || _828;
    bool _832 = isnan(0.0);
    bool _834 = _830 || _832;
    float _836 = fma(_144, (*spvDescriptorSet0.vp_c9)._m0[82].w, _822);
    bool _838 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _840 = isnan(0.0);
    bool _842 = _838 || _840;
    bool _844 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _846 = _842 || _844;
    float _848 = _846 ? _738 : 0.0;
    bool _850 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _852 = isnan(1.0);
    bool _854 = _850 || _852;
    bool _856 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _858 = _854 || _856;
    float _860 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _862 = 1.0 + _860;
    float _864 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    int _866 = _834 ? 0 : 1;
    float _868 = 1.0 / _862;
    int _870 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _872 = _870 != 0;
    float _874 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    float _876 = fma(_598, (*spvDescriptorSet0.vp_c9)._m0[78].z, _864);
    int _878 = ~_866;
    int _880 = _878 + 1;
    int _882 = _880 + 1;
    float _884 = in.m_65.x;
    float _886 = in.m_65.y;
    float _888 = in.m_65.z;
    float _890 = fma(_602, (*spvDescriptorSet0.vp_c9)._m0[78].w, _874);
    float _892 = fma(_144, (*spvDescriptorSet0.vp_c9)._m0[77].z, _876);
    int _894 = _882;
    bool _896 = _872;
    float _898 = _836;
    if (!_824)
    {
        int _900 = ~_866;
        int _902 = _900 + 1;
        _894 = _902;
    }
    int _904 = _894;
    float _906 = in.m_48.x;
    float _908 = in.m_48.y;
    float _910 = in.m_48.z;
    float _912 = fma(_144, (*spvDescriptorSet0.vp_c9)._m0[77].w, _890);
    float _914 = fma(_144, (*spvDescriptorSet0.vp_c9)._m0[81].y, _806);
    int _916 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _918 = _916 != 0;
    if (_858)
    {
        float _920 = _848 * _868;
        _148 = _920;
    }
    float _922 = _148;
    int _924 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _926 = _924 != 0;
    int _928 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _930 = _928 != 0;
    float _932 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _934 = _932 + (*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _936 = 1.0 / _934;
    float _938 = float(_820);
    float _940 = -(*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _942 = _940 + (*spvDescriptorSet0.vp_c9)._m0[133].w;
    float _944 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _886);
    if (_918)
    {
        bool _946 = _610 > 0.5;
        _674 = _946;
    }
    bool _948 = _674;
    float _950 = _908 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _952 = _908 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _954 = _600 * _944;
    float _956 = _908 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _958 = _598 + _602;
    float _960 = fma(_906, (*spvDescriptorSet0.vp_c10)._m0[5].x, _952);
    float _962 = fma(_906, (*spvDescriptorSet0.vp_c10)._m0[4].x, _950);
    float _964 = fma(_906, (*spvDescriptorSet0.vp_c10)._m0[6].x, _956);
    float _966 = -(*spvDescriptorSet0.vp_c9)._m0[131].x;
    float _968 = (*spvDescriptorSet0.vp_c9)._m0[132].x + _966;
    float _970 = _958 + (-1.0);
    float _972 = -(*spvDescriptorSet0.vp_c9)._m0[132].x;
    float _974 = _972 + (*spvDescriptorSet0.vp_c9)._m0[133].x;
    float _976 = 1.0 / _942;
    float _978 = _968 * _936;
    float _980 = fma(_970, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    float _982 = fma(_190, _190, _814);
    int _984 = abs(_636);
    float _986 = _602 + _610;
    float _988 = -(*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _990 = _596 + _988;
    float _992 = fma(_910, (*spvDescriptorSet0.vp_c10)._m0[4].z, _962);
    float _994 = rsqrt(_982);
    float _996 = _986 + (-1.0);
    float _998 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _1000 = _596 + _998;
    float _1002 = fma(_910, (*spvDescriptorSet0.vp_c10)._m0[6].z, _964);
    float _1004 = fma(_910, (*spvDescriptorSet0.vp_c10)._m0[5].z, _960);
    float _1006 = fma(_996, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    float _1008 = fma(_978, _1000, (*spvDescriptorSet0.vp_c9)._m0[131].x);
    float _1010 = _974 * _976;
    float _1012 = in.m_63.y;
    float _1014 = float(_984);
    float _1016 = fma(_1010, _990, (*spvDescriptorSet0.vp_c9)._m0[132].x);
    float _1018 = float(_812);
    float _1020 = _598 + _610;
    float _1022 = in.m_67.x;
    float _1024 = in.m_67.y;
    float _1026 = in.m_67.z;
    float _1028 = _1014 * _938;
    float _1030 = _186 * _994;
    float _1032 = _188 * _994;
    float _1034 = _190 * _994;
    float _1036 = fma((*spvDescriptorSet0.vp_c10)._m0[2].x, (*spvDescriptorSet0.vp_c9)._m0[191].x, _598);
    float _1038 = _1020 + (-1.0);
    float _1040 = _686 * _1018;
    float _1042 = _1036 + _886;
    float _1044 = -(*spvDescriptorSet0.vp_c8)._m0[28].z;
    float _1046 = _1032 * _1044;
    float _1048 = fma(_1038, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    bool _1050 = !_614;
    int _1052 = _1050 ? 0 : 1;
    float _1054 = _1042 * (*spvDescriptorSet0.vp_c9)._m0[191].y;
    bool _1056 = _602 > 0.5;
    float _1058 = -(*spvDescriptorSet0.vp_c8)._m0[28].x;
    float _1060 = _1034 * _1058;
    float _1062 = _1040 * (-2.0);
    int _1064 = abs(_1052);
    float _1066 = _1054 * 0.15915493667125701904296875;
    float _1068 = -(*spvDescriptorSet0.vp_c8)._m0[28].z;
    float _1070 = -_1060;
    float _1072 = fma(_1030, _1068, _1070);
    float _1074 = _1028 * (-2.0);
    float _1076 = float(_1064);
    float _1078 = -(*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _1080 = -_1046;
    float _1082 = fma(_1034, _1078, _1080);
    float _1084 = _1072 * _1072;
    float _1086 = fma(_1006, _1062, _1006);
    float _1088 = -_1012;
    float _1090 = _1088 + 1.0;
    float _1092 = fma(_1062, _1024, _1024);
    float _1094 = fma(_1082, _1082, _1084);
    float _1096 = fma(_1048, _1074, _1048);
    float _1098 = float(_904);
    float _1100 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    float _1102 = fma(_1074, _1026, _1026);
    float _1104 = _610 + (-0.5);
    float _1106 = fma(_684, (*spvDescriptorSet0.vp_c9)._m0[196].y, _1092);
    float _1108 = _1076 * _1098;
    int _1110 = _690 ? as_type<int>(_1090) : as_type<int>(_1012);
    float _1112 = fma(_1104, (*spvDescriptorSet0.vp_c9)._m0[196].z, _1102);
    float _1114 = fma(_1086, _922, _1106);
    float _1116 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _1118 = _1108 * (-2.0);
    bool _1120 = _596 >= (*spvDescriptorSet0.vp_c9)._m0[133].w;
    bool _1122 = isnan(_596);
    bool _1124 = _1120 || _1122;
    bool _1126 = isnan((*spvDescriptorSet0.vp_c9)._m0[133].w);
    bool _1128 = _1124 || _1126;
    float _1130 = float(_1128);
    float _1132 = _598 + (-0.5);
    int _1134 = _872 ? _1110 : as_type<int>(_1012);
    float _1136 = fma(_1096, _922, _1112);
    float _1138 = _1012;
    int _1140 = _1134;
    float _1142 = _990;
    if (_930)
    {
        float _1144 = _1056 ? _1090 : _1012;
        _1138 = _1144;
    }
    float _1146 = _1138;
    float _1148 = fma(_1118, _1022, _1022);
    int _1150 = as_type<int>(_1146);
    if (_926)
    {
        bool _1152 = _598 > 0.5;
        _896 = _1152;
    }
    bool _1154 = _896;
    float _1156 = -_1130;
    float _1158 = _1156 + 1.0;
    bool _1160 = _596 >= (*spvDescriptorSet0.vp_c9)._m0[132].w;
    bool _1162 = isnan(_596);
    bool _1164 = _1160 || _1162;
    bool _1166 = isnan((*spvDescriptorSet0.vp_c9)._m0[132].w);
    bool _1168 = _1164 || _1166;
    float _1170 = float(_1168);
    float _1172 = in.m_69.x;
    float _1174 = -(*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _1176 = _1030 * _1174;
    float _1178 = _1114 * 0.15915493667125701904296875;
    float _1180 = _1066 * 6.283185482025146484375;
    float _1182 = sin(_1180);
    float _1184 = fma(_980, _1118, _980);
    float _1186 = fma(_1132, (*spvDescriptorSet0.vp_c9)._m0[196].x, _1148);
    bool _1188 = _596 >= (*spvDescriptorSet0.vp_c9)._m0[131].w;
    bool _1190 = isnan(_596);
    bool _1192 = _1188 || _1190;
    bool _1194 = isnan((*spvDescriptorSet0.vp_c9)._m0[131].w);
    bool _1196 = _1192 || _1194;
    float _1198 = float(_1196);
    float _1200 = _1170 * _1158;
    float _1202 = -(*spvDescriptorSet0.vp_c8)._m0[28].x;
    float _1204 = -_1176;
    float _1206 = fma(_1032, _1202, _1204);
    float _1208 = -_1170;
    float _1210 = _1208 + 1.0;
    float _1212 = _1100 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    float _1214 = fma(_1184, _922, _1186);
    float _1216 = _1116 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _1218 = fma(_1206, _1206, _1094);
    float _1220 = _1198 * _1210;
    float _1222 = fma(as_type<float>(_1134), _1212, -0.5);
    float _1224 = _1220;
    if (_918)
    {
        float _1226 = -_708;
        float _1228 = _1226 + 1.0;
        _1140 = as_type<int>(_1228);
    }
    int _1230 = _1140;
    float _1232 = _1136 * 0.15915493667125701904296875;
    float _1234 = _1214 * 0.15915493667125701904296875;
    float _1236 = fma(_1216, _1146, -0.5);
    float _1238 = _1008 * _1220;
    if (_926)
    {
        float _1240 = -_708;
        float _1242 = _1240 + 1.0;
        _1150 = as_type<int>(_1242);
    }
    int _1244 = _1150;
    if (!_918)
    {
        _1224 = _708;
    }
    float _1246 = _1224;
    float _1248 = rsqrt(_1218);
    float _1250 = _1246;
    if (_918)
    {
        float _1252 = _948 ? as_type<float>(_1230) : _708;
        _1250 = _1252;
    }
    float _1254 = _1250;
    float _1256 = _1182 * (*spvDescriptorSet0.vp_c9)._m0[191].z;
    if (!_926)
    {
        _1142 = _708;
    }
    float _1258 = _1142;
    float _1260 = -_1198;
    float _1262 = _1260 + 1.0;
    float _1264 = _1258;
    if (_926)
    {
        float _1266 = _1154 ? as_type<float>(_1244) : _708;
        _1264 = _1266;
    }
    float _1268 = _1264;
    float _1270 = _526 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _1272 = _1256 * _1172;
    float _1274 = _1178 * 6.283185482025146484375;
    float _1276 = sin(_1274);
    float _1278 = fma(_1262, (*spvDescriptorSet0.vp_c9)._m0[131].x, _1238);
    float _1280 = -_688;
    float _1282 = fma(_912, _1236, _1280);
    float _1284 = _1272 + _888;
    float _1286 = _1272 + _884;
    float _1288 = fma(_1016, _1200, _1278);
    float _1290 = _992 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _1292 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _1284);
    float _1294 = _1232 * 6.283185482025146484375;
    float _1296 = cos(_1294);
    float _1298 = _1082 * _1248;
    float _1300 = _1072 * _1248;
    float _1302 = _1206 * _1248;
    float _1304 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _1286);
    float _1306 = _608 * _1292;
    float _1308 = _1030 * _1300;
    float _1310 = _1002 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _1312 = _1234 * 6.283185482025146484375;
    float _1314 = sin(_1312);
    float _1316 = _1270 * _1304;
    bool _1318 = _886 != 0.0;
    bool _1320 = isnan(_886);
    bool _1322 = _1318 || _1320;
    bool _1324 = isnan(0.0);
    bool _1326 = _1322 || _1324;
    float _1328 = fma(_1130, (*spvDescriptorSet0.vp_c9)._m0[133].x, _1288);
    float _1330 = _1034 * _1298;
    float _1332 = _1004 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _1334 = -_884;
    bool _1336 = _1272 == _1334;
    bool _1338 = !_1326;
    bool _1340 = _1336 && _1338;
    float _1342 = _1178 * 6.283185482025146484375;
    float _1344 = cos(_1342);
    float _1346 = _1276 * _1296;
    float _1348 = -_888;
    bool _1350 = _1272 == _1348;
    bool _1352 = _1350 && _1340;
    float _1354 = -_1330;
    float _1356 = fma(_1030, _1302, _1354);
    float _1358 = _1234 * 6.283185482025146484375;
    float _1360 = cos(_1358);
    float _1362 = _1314 * _1276;
    float _1364 = _1232 * 6.283185482025146484375;
    float _1366 = sin(_1364);
    float _1368 = _1314 * _1344;
    float _1370 = _1344 * _1296;
    float _1372 = _1360 * _1344;
    float _1374 = _1360 * _1276;
    float _1376 = _1314 * _1296;
    float _1378 = _1360 * _1296;
    float _1380 = _1378 * _1030;
    float _1382 = fma(_1366, _1372, _1362);
    float _1384 = -_1374;
    float _1386 = fma(_1366, _1368, _1384);
    float _1388 = -_1368;
    float _1390 = fma(_1366, _1374, _1388);
    float _1392 = fma(_1366, _1362, _1372);
    float _1394 = _1032 * _1302;
    float _1396 = _1382 * _1030;
    float _1398 = _1390 * _1030;
    float _1400 = -_1366;
    float _1402 = fma(_1400, _1298, _1380);
    float _1404 = -_1394;
    float _1406 = fma(_1034, _1300, _1404);
    float _1408 = fma(_1370, _1298, _1396);
    float _1410 = fma(_1346, _1298, _1398);
    float _1412 = _1378 * _1034;
    float _1414 = _1382 * _1034;
    float _1416 = fma(_1386, _1406, _1408);
    float _1418 = fma(_1392, _1406, _1410);
    float _1420 = -_1308;
    float _1422 = fma(_1032, _1298, _1420);
    float _1424 = -_1366;
    float _1426 = fma(_1424, _1302, _1412);
    float _1428 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _1430 = fma(_1376, _1406, _1402);
    float _1432 = _1390 * _1034;
    float _1434 = fma(_1370, _1302, _1414);
    float _1436 = fma(_1376, _1422, _1426);
    float _1438 = _954 * _1430;
    float _1440 = fma(_1346, _1302, _1432);
    float _1442 = fma(_1386, _1422, _1434);
    float _1444 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    float _1446 = _954 * _1436;
    float _1448 = fma(_1316, _1416, _1438);
    float _1450 = fma(_1392, _1422, _1440);
    float _1452 = _1378 * _1032;
    float _1454 = fma(_1316, _1442, _1446);
    float _1456 = _780 * (-0.15915493667125701904296875);
    float _1458 = fma(_1306, _1418, _1448);
    float _1460 = _1428 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _1462 = fma(_1306, _1450, _1454);
    float _1464 = _1456 * 6.283185482025146484375;
    float _1466 = sin(_1464);
    float _1468 = _1290 + _1458;
    float _1470 = fma(_1460, _1268, -0.5);
    float _1472 = _1310 + _1462;
    float _1474 = _1382 * _1032;
    float _1476 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1478 = _1468 + _1476;
    float _1480 = _1444 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    float _1482 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1484 = _1472 + _1482;
    float _1486 = fma(_892, _1470, _662);
    float _1488 = _1478 * _1478;
    float _1490 = fma(_1480, _1254, -0.5);
    float _1492 = _1484 * _1484;
    float _1494 = in.m_71.x;
    float _1496 = in.m_71.y;
    float _1498 = in.m_71.z;
    float _1500 = _1456 * 6.283185482025146484375;
    float _1502 = cos(_1500);
    float _1504 = -_1366;
    float _1506 = fma(_1504, _1300, _1452);
    float _1508 = _1488 + _1492;
    float _1510 = _1390 * _1032;
    float _1512 = fma(_1370, _1300, _1474);
    float _1514 = fma(_1376, _1356, _1506);
    float _1516 = _1466 * _1222;
    float _1518 = fma(_1346, _1300, _1510);
    float _1520 = sqrt(_1508);
    float _1522 = fma(_1386, _1356, _1512);
    float _1524 = _954 * _1514;
    float _1526 = fma(_1392, _1356, _1518);
    float _1528 = fma(_1316, _1522, _1524);
    float _1530 = _1502 * _1222;
    float _1532 = -_1516;
    float _1534 = fma(_1502, _1490, _1532);
    float _1536 = fma(_1306, _1526, _1528);
    float _1538 = fma(_1466, _1490, _1530);
    float _1540 = fma(_756, _1534, _770);
    float _1542 = _1332 + _1536;
    float _1544 = _1496;
    float _1546 = _1494;
    float _1548 = _1488;
    float _1550 = _1492;
    float _1552 = _1468;
    float _1554 = _1472;
    float _1556 = _1498;
    float _1558 = _1486;
    float _1560 = _1272;
    if (!_1352)
    {
        float _1562 = fma(_886, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1496);
        _1544 = _1562;
    }
    float _1564 = _1544;
    bool _1566 = _1520 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1568 = -_914;
    float _1570 = fma(_836, _1538, _1568);
    if (!_1352)
    {
        float _1572 = fma(_1286, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1494);
        _1546 = _1572;
    }
    float _1574 = _1546;
    float _1576 = _1430 * _1564;
    float _1578 = _1514 * _1564;
    float _1580 = _1436 * _1564;
    if (!_1566)
    {
        _898 = _1542;
    }
    float _1582 = _898;
    bool _1584 = !_1566;
    float _1586 = _1582;
    if (!_1584)
    {
        float _1588 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1590 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1592 = _1520 + _1590;
        float _1594 = rsqrt(_1508);
        float _1596 = _1592 * _1588;
        float _1598 = _1542 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1600 = _1596 * 0.15915493667125701904296875;
        float _1602 = _1600 * 6.283185482025146484375;
        float _1604 = sin(_1602);
        float _1606 = _1600 * 6.283185482025146484375;
        float _1608 = cos(_1606);
        float _1610 = fma(_1604, _1598, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1612 = _1594 * _1610;
        float _1614 = fma(_1478, _1612, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1616 = _1608 + (-1.0);
        float _1618 = fma(_1484, _1612, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        float _1620 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
        float _1622 = _1614 + _1620;
        float _1624 = _1616 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1626 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
        float _1628 = _1618 + _1626;
        float _1630 = _1622 * _1622;
        float _1632 = fma(_1542, _1608, _1624);
        float _1634 = _1628 * _1628;
        _1586 = _1632;
        _1548 = _1630;
        _1550 = _1634;
        _1552 = _1614;
        _1554 = _1618;
    }
    float _1636 = _1586;
    float _1638 = _1548;
    float _1640 = _1550;
    float _1642 = _1552;
    float _1644 = _1554;
    float _1646 = -(*spvDescriptorSet0.vp_c15)._m0[0].y;
    float _1648 = _1636 + _1646;
    float _1650 = fma(_1522, _1574, _1578);
    if (!_1352)
    {
        float _1652 = fma(_1284, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1498);
        _1556 = _1652;
    }
    float _1654 = _1556;
    float _1656 = fma(_1648, _1648, _1638);
    float _1658 = fma(_1416, _1574, _1576);
    float _1660 = _1656 + _1640;
    float _1662 = fma(_1526, _1654, _1650);
    float _1664 = fma(_1442, _1574, _1580);
    float _1666 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _1668 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _1670 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _1672 = sqrt(_1660);
    float _1674 = fma(_1418, _1654, _1658);
    float _1676 = _1666 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1678 = _1668 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1680 = _1670 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1682 = _1282 + 0.5;
    float _1684 = _1328 * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    float _1686 = _1486 + 0.5;
    float _1688 = _1540 + 0.5;
    float _1690 = _1570 + 0.5;
    float _1692 = fma(_1450, _1654, _1664);
    out.m_73.x = _1172;
    out.m_75.x = _1676;
    out.m_75.y = _1678;
    out.m_75.z = _1680;
    out.m_75.w = _1684;
    bool _1694 = _1672 >= (*spvDescriptorSet0.vp_c16)._m0[1].x;
    bool _1696 = isnan(_1672);
    bool _1698 = _1694 || _1696;
    bool _1700 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].x);
    bool _1702 = _1698 || _1700;
    out.m_77.x = _1686;
    out.m_77.y = _1682;
    out.m_77.z = _1688;
    out.m_77.w = _1690;
    out.m_79.x = _1674;
    out.m_79.y = _1662;
    out.m_79.z = _1692;
    float _1704 = _1688;
    if (!_1702)
    {
        _1558 = 1.0;
    }
    float _1706 = _1558;
    bool _1708 = !_1702;
    float _1710 = _1706;
    if (!_1708)
    {
        bool _1712 = _1672 >= (*spvDescriptorSet0.vp_c16)._m0[1].y;
        bool _1714 = isnan(_1672);
        bool _1716 = _1712 || _1714;
        bool _1718 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].y);
        bool _1720 = _1716 || _1718;
        if (!_1720)
        {
            float _1722 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _1724 = _1672 + _1722;
            float _1726 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _1728 = (*spvDescriptorSet0.vp_c16)._m0[1].y + _1726;
            float _1730 = -(*spvDescriptorSet0.vp_c16)._m0[2].x;
            float _1732 = _1730 + (*spvDescriptorSet0.vp_c16)._m0[2].y;
            float _1734 = 1.0 / _1728;
            float _1736 = _1724 * _1734;
            float _1738 = fma(_1736, _1732, (*spvDescriptorSet0.vp_c16)._m0[2].x);
            _1710 = _1738;
            _1740 = true;
        }
        else
        {
            bool _1742 = _1672 >= (*spvDescriptorSet0.vp_c16)._m0[1].z;
            bool _1744 = isnan(_1672);
            bool _1746 = _1742 || _1744;
            bool _1748 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].z);
            bool _1750 = _1746 || _1748;
            if (!_1750)
            {
                float _1752 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _1754 = _1672 + _1752;
                float _1756 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _1758 = _1756 + (*spvDescriptorSet0.vp_c16)._m0[1].z;
                float _1760 = -(*spvDescriptorSet0.vp_c16)._m0[2].y;
                float _1762 = _1760 + (*spvDescriptorSet0.vp_c16)._m0[2].z;
                float _1764 = 1.0 / _1758;
                float _1766 = _1754 * _1764;
                float _1768 = fma(_1766, _1762, (*spvDescriptorSet0.vp_c16)._m0[2].y);
                _1710 = _1768;
                _1740 = true;
            }
            else
            {
                _1710 = (*spvDescriptorSet0.vp_c16)._m0[2].z;
            }
        }
    }
    _1740 = false;
    float _1770 = _1710;
    float _1772 = -(*spvDescriptorSet0.vp_c16)._m0[0].y;
    float _1774 = _1636 + _1772;
    float _1776 = -(*spvDescriptorSet0.vp_c16)._m0[0].x;
    float _1778 = _1642 + _1776;
    float _1780 = -(*spvDescriptorSet0.vp_c16)._m0[0].z;
    float _1782 = _1644 + _1780;
    float _1784 = fma(_1774, _1770, (*spvDescriptorSet0.vp_c16)._m0[0].y);
    float _1786 = fma(_1778, _1770, (*spvDescriptorSet0.vp_c16)._m0[0].x);
    float _1788 = fma(_1782, _1770, (*spvDescriptorSet0.vp_c16)._m0[0].z);
    float _1790 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1792 = _1784 + _1790;
    float _1794 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1796 = _1786 + _1794;
    float _1798 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1800 = _1788 + _1798;
    float _1802 = _1792 * _1792;
    float _1804 = fma(_1796, _1796, _1802);
    float _1806 = fma(_1800, _1800, _1804);
    float _1808 = rsqrt(_1806);
    float _1810 = sqrt(_1806);
    float _1812 = _1808 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1814 = _1796 * _1812;
    float _1816 = _1800 * _1812;
    float _1818 = _1814 * _1814;
    float _1820 = _1816 * _1816;
    float _1822 = _1818 + _1820;
    float _1824 = sqrt(_1822);
    bool _1826 = _1824 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1828 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1830 = _1824 + _1828;
    float _1832 = _1808;
    float _1834 = _1822;
    float _1836 = _1830;
    float _1838 = _1770;
    float _1840 = _1792;
    if (_1826)
    {
        float _1842 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1832 = _1842;
    }
    float _1844 = _1832;
    if (_1826)
    {
        float _1846 = rsqrt(_1822);
        _1834 = _1846;
    }
    float _1848 = _1834;
    if (_1826)
    {
        float _1850 = _1830 * _1844;
        _1836 = _1850;
    }
    float _1852 = _1836;
    if (_1826)
    {
        float _1854 = _1852 * 0.15915493667125701904296875;
        _1838 = _1854;
    }
    float _1856 = _1838;
    float _1858 = _1844;
    if (_1826)
    {
        float _1860 = _1856 * 6.283185482025146484375;
        float _1862 = sin(_1860);
        _1858 = _1862;
    }
    float _1864 = _1858;
    float _1866 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _1868 = precise::max(0.0, _1866);
    float _1870 = _1800;
    float _1872 = _1868;
    if (_1826)
    {
        float _1874 = _1856 * 6.283185482025146484375;
        float _1876 = cos(_1874);
        _1870 = _1876;
    }
    float _1878 = _1870;
    float _1880 = -_1812;
    float _1882 = -_1868;
    float _1884 = fma(_1792, _1880, _1882);
    float _1886 = _1884;
    if (_1826)
    {
        float _1888 = _1884 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1872 = _1888;
    }
    float _1890 = _1872;
    float _1892 = _1784 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1894 = _1864;
    float _1896 = _1890;
    if (_1826)
    {
        float _1898 = fma(_1864, _1890, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1704 = _1898;
    }
    float _1900 = _1704;
    float _1902 = _1900;
    if (!_1826)
    {
        _1894 = _1814;
    }
    float _1904 = _1894;
    float _1906 = _1904;
    float _1908 = _1878;
    if (_1826)
    {
        float _1910 = _1878 + (-1.0);
        _1896 = _1910;
    }
    float _1912 = _1896;
    float _1914 = _1912;
    if (_1826)
    {
        float _1916 = _1848 * _1900;
        _1560 = _1916;
    }
    float _1918 = _1560;
    if (!_1826)
    {
        _1902 = _1816;
    }
    float _1920 = _1902;
    float _1922 = _1920;
    if (_1826)
    {
        float _1924 = _1912 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1840 = _1924;
    }
    float _1926 = _1840;
    if (_1826)
    {
        float _1928 = _1814 * _1918;
        _1906 = _1928;
    }
    float _1930 = _1906;
    if (!_1826)
    {
        _1914 = _1818;
    }
    float _1932 = _1914;
    float _1934 = _1932;
    if (_1826)
    {
        float _1936 = _1816 * _1918;
        _1922 = _1936;
    }
    float _1938 = _1922;
    if (_1826)
    {
        float _1940 = fma(_1884, _1878, _1926);
        _1886 = _1940;
    }
    float _1942 = _1886;
    if (_1826)
    {
        float _1944 = _1930 * _1930;
        _1934 = _1944;
    }
    float _1946 = _1934;
    if (!_1826)
    {
        _1908 = _1820;
    }
    float _1948 = _1908;
    float _1950 = _1948;
    if (_1826)
    {
        float _1952 = _1938 * _1938;
        _1950 = _1952;
    }
    float _1954 = _1950;
    float _1956 = fma(_1942, _1942, _1946);
    float _1958 = _1784 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1960 = _1784 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1962 = _1956 + _1954;
    float _1964 = _1784 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1966 = fma(_1786, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1958);
    float _1968 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _1970 = fma(_1810, (*spvDescriptorSet0.vp_c15)._m0[23].w, _1968);
    float _1972 = precise::clamp(_1970, 0.0, 1.0);
    float _1974 = rsqrt(_1962);
    float _1976 = fma(_1786, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1964);
    float _1978 = fma(_1786, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1892);
    float _1980 = fma(_1788, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1966);
    float _1982 = -_1972;
    float _1984 = _1982 + 1.0;
    float _1986 = fma(_1788, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1976);
    float _1988 = fma(_1788, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1978);
    float _1990 = fma(_1786, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1960);
    float _1992 = _1980 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1994 = _1986 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1996 = _1988 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1998 = fma(_1788, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1990);
    float _2000 = abs(_1984);
    float _2002 = log2(_2000);
    float _2004 = _1994 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _2006 = fma(_1290, (*spvDescriptorSet0.vp_c15)._m0[652].x, (*spvDescriptorSet0.vp_c15)._m0[652].z);
    float _2008 = _1998 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _2010 = _1974 * _1930;
    float _2012 = fma(_1992, (*spvDescriptorSet0.vp_c8)._m0[7].x, _2004);
    float _2014 = _1974 * _1942;
    float _2016 = _1974 * _1938;
    float _2018 = floor(_2006);
    float _2020 = fma(_1996, (*spvDescriptorSet0.vp_c8)._m0[7].z, _2012);
    float _2022 = fma(_1310, (*spvDescriptorSet0.vp_c15)._m0[652].y, (*spvDescriptorSet0.vp_c15)._m0[652].w);
    float _2024 = fma(_2008, (*spvDescriptorSet0.vp_c8)._m0[7].w, _2020);
    float _2026 = _2010 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _2028 = floor(_2022);
    float _2030 = -_2026;
    float _2032 = fma(_2014, (*spvDescriptorSet0.vp_c15)._m0[21].y, _2030);
    float _2034 = _2002 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _2036 = -_2016;
    float _2038 = fma(_2036, (*spvDescriptorSet0.vp_c15)._m0[21].z, _2032);
    float _2040 = _1996 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _2042 = exp2(_2034);
    float _2044 = fma(_2038, -0.5, 0.5);
    float _2046 = fma(_2038, 0.5, 0.5);
    float _2048 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _2050 = -_2018;
    float _2052 = _2006 + _2050;
    float _2054 = -_2040;
    float _2056 = fma(_2054, _2048, 1.0);
    float _2058 = sqrt(_2044);
    float _2060 = fma(_2046, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _2062 = _1994 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _2064 = _1994 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _2066 = fma(_2046, _2060, -0.212114393711090087890625);
    float _2068 = fma(_1992, (*spvDescriptorSet0.vp_c8)._m0[4].x, _2062);
    float _2070 = fma(_1992, (*spvDescriptorSet0.vp_c8)._m0[5].x, _2064);
    float _2072 = 1.0 / _2024;
    float _2074 = -_2028;
    float _2076 = _2022 + _2074;
    float _2078 = fma(_1996, (*spvDescriptorSet0.vp_c8)._m0[4].z, _2068);
    float _2080 = fma(_1996, (*spvDescriptorSet0.vp_c8)._m0[5].z, _2070);
    float _2082 = _2014 + 1.0;
    float _2084 = fma(_2046, _2066, 1.570728778839111328125);
    float _2086 = fma(_2008, (*spvDescriptorSet0.vp_c8)._m0[4].w, _2078);
    float _2088 = fma(_2008, (*spvDescriptorSet0.vp_c8)._m0[5].w, _2080);
    float _2090 = log2(_2056);
    float _2092 = _2058 * 0.636619746685028076171875;
    float _2094 = -_2014;
    float _2096 = fma(_2042, _2082, _2094);
    float2 _5797 = float2(_2052, _2076);
    float _2098 = dm_bs(spvDescriptorSet0.vp_t_tcb_24.sample(spvDescriptorSet0.vp_t_tcb_24Smplr, select(_5797, float2(0.0), isnan(_5797)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_24, spvDescriptorSet0.vp_t_tcb_24Smplr_w, select(_5797, float2(0.0), isnan(_5797)), level(0.0)).x;
    float _2100 = -_2084;
    float _2102 = fma(_2092, _2100, 1.0);
    float _2104 = fma(_2096, 0.5, 0.5);
    float _2106 = _2086 * _2072;
    float _2108 = _2088 * _2072;
    float _2110 = fma(_2106, 0.5, 0.5);
    float _2112 = fma(_2108, -0.5, 0.5);
    float _2114 = _2090 * 0.693147182464599609375;
    float _2116 = _2114 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float3 _5832 = float3(_2110, _2112, _2116);
    float _2118 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_5832, float3(0.0), isnan(_5832)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_5832, float3(0.0), isnan(_5832)), level(0.0)).x;
    float3 _5843 = float3(_2110, _2112, _2116);
    float4 _2121 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_5843, float3(0.0), isnan(_5843)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_5843, float3(0.0), isnan(_5843)), level(0.0)).xyzw;
    float _2123 = _2121.x;
    float _2125 = _2121.y;
    float _2127 = _2121.z;
    float _2129 = _2121.w;
    float2 _5859 = float2(_2102, _2104);
    float3 _2133 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_5859, float2(0.0), isnan(_5859)), level(0.0)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_5859, float2(0.0), isnan(_5859)), level(0.0)).xyz;
    float _2135 = _2133.x;
    float _2137 = _2133.y;
    float _2139 = _2133.z;
    float _2141 = _1332 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _2143 = _1332 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _2145 = _1994 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    bool _2147 = _1810 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _2149 = isnan(_1810);
    bool _2151 = _2147 || _2149;
    bool _2153 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _2155 = _2151 || _2153;
    float _2157 = fma(_1290, (*spvDescriptorSet0.vp_c8)._m0[11].x, _2141);
    float _2159 = fma(_1290, (*spvDescriptorSet0.vp_c8)._m0[10].x, _2143);
    float _2161 = fma(_1992, (*spvDescriptorSet0.vp_c8)._m0[6].x, _2145);
    float _2163 = fma(_1310, (*spvDescriptorSet0.vp_c8)._m0[11].z, _2157);
    float _2165 = fma(_1310, (*spvDescriptorSet0.vp_c8)._m0[10].z, _2159);
    float _2167 = _2163 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _2169 = _2165 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _2171 = fma(_1996, (*spvDescriptorSet0.vp_c8)._m0[6].z, _2161);
    float _2173 = 1.0 / _2167;
    float _2175 = _2169 + _2167;
    float _2177 = in.m_81.x;
    float _2179 = fma(_2008, (*spvDescriptorSet0.vp_c8)._m0[6].w, _2171);
    float _2181 = _2175 * _2173;
    float _2183 = _2181 * 0.5;
    float _2185 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _2187 = fma(_2183, (*spvDescriptorSet0.vp_c8)._m0[30].w, _2185);
    float _2189 = _2002 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _2191 = 1.0 / _2187;
    float _2193 = exp2(_2189);
    float _2195 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _2197 = _2191 * _2195;
    float _2199 = abs(_2197);
    float _2201 = log2(_2199);
    float _2203 = -_2193;
    float _2205 = _2203 + 1.0;
    bool _2207 = _2197 <= 8000.0;
    bool _2209 = isnan(_2197);
    bool _2211 = _2207 || _2209;
    bool _2213 = isnan(8000.0);
    bool _2215 = _2211 || _2213;
    float _2217 = float(_2215);
    float _2219 = _2201 * (*spvDescriptorSet0.vp_c15)._m0[654].z;
    float _2221 = exp2(_2219);
    float _2223 = fma(_2221, (*spvDescriptorSet0.vp_c15)._m0[654].x, (*spvDescriptorSet0.vp_c15)._m0[654].y);
    float _2225 = precise::clamp(_2223, 0.0, 1.0);
    float _2227 = _2179 + _2024;
    float _2229 = fma(_2225, -2.0, 3.0);
    float _2231 = _2225 * _2225;
    float _2233 = _2227 * 0.5;
    float _2235 = _2231 * _2229;
    out.m_83.z = _2233;
    out.m_83.w = _2024;
    float _2237 = -_2235;
    float _2239 = _2237 + 1.0;
    float _2241 = fma(_2239, (*spvDescriptorSet0.vp_c15)._m0[654].w, _2235);
    float _2243 = _2205 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _2245 = _2217 * _2241;
    out.gl_Position.x = _2086;
    out.gl_Position.y = _2088;
    out.gl_Position.z = _2179;
    out.gl_Position.w = _2024;
    float _2247 = _2245 * (*spvDescriptorSet0.vp_c15)._m0[653].x;
    float _2249 = _2179;
    float _2251 = _2088;
    float _2253 = _2086;
    if (!_2155)
    {
        _2249 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _2255 = _2249;
    float _2257 = _2255;
    float _2259 = _2255;
    if (!_2155)
    {
        _2251 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _2261 = _2251;
    float _2263 = _2261;
    float _2265 = _2261;
    if (!_2155)
    {
        _2253 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _2267 = _2253;
    float _2269 = -_2098;
    float _2271 = _2269 + 1.0;
    float _2273 = _2271 * _2247;
    float _2275 = precise::clamp(_2273, 0.0, 1.0);
    float _2277 = -_2275;
    float _2279 = fma(_2277, (*spvDescriptorSet0.vp_c15)._m0[653].y, 1.0);
    float _2281 = _2279 * _2177;
    float _2283 = _2281 * (*spvDescriptorSet0.vp_c13)._m0[1].w;
    float _2285 = _2243 * _2118;
    float _2287 = -_2243;
    float _2289 = _2287 + 1.0;
    out.m_85.x = _2283;
    float _2291 = _2129 * _2285;
    float _2293 = _2139 * _2285;
    float _2295 = fma(_2135, _2291, _2123);
    float _2297 = fma(_2137, _2291, _2125);
    float _2299 = _2129 * _2289;
    float _2301 = fma(_2129, _2293, _2127);
    out.m_87.x = _2295;
    out.m_87.y = _2297;
    out.m_87.z = _2301;
    out.m_87.w = _2299;
    bool _2303 = !_2155;
    float _2305 = _2267;
    float _2307 = _2267;
    if (!_2303)
    {
        bool _2309 = _1810 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _2311 = isnan(_1810);
        bool _2313 = _2309 || _2311;
        bool _2315 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _2317 = _2313 || _2315;
        if (!_2317)
        {
            float _2319 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2321 = _1810 + _2319;
            float _2323 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2325 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _2323;
            float _2327 = 1.0 / _2325;
            float _2329 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _2331 = _2329 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _2333 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _2335 = _2333 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _2337 = _2321 * _2327;
            float _2339 = precise::clamp(_2337, 0.0, 1.0);
            float _2341 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _2343 = _2341 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _2345 = fma(_2339, _2335, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _2347 = fma(_2339, _2343, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _2349 = fma(_2339, _2331, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            _2265 = _2349;
            _2259 = _2347;
            _2307 = _2345;
            _2351 = true;
        }
        else
        {
            bool _2353 = _1810 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _2355 = isnan(_1810);
            bool _2357 = _2353 || _2355;
            bool _2359 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _2361 = _2357 || _2359;
            if (!_2361)
            {
                _2257 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _2363 = _2257;
            _2259 = _2363;
            if (!_2361)
            {
                _2263 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _2365 = _2263;
            _2265 = _2365;
            if (!_2361)
            {
                _2305 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _2367 = _2305;
            bool _2369 = !_2361;
            _2307 = _2367;
            if (!_2369)
            {
                bool _2371 = _1810 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _2373 = isnan(_1810);
                bool _2375 = _2371 || _2373;
                bool _2377 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _2379 = _2375 || _2377;
                if (!_2379)
                {
                    float _2381 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2383 = _1810 + _2381;
                    float _2385 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2387 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _2385;
                    float _2389 = 1.0 / _2387;
                    float _2391 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _2393 = _2391 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _2395 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _2397 = _2395 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _2399 = _2383 * _2389;
                    float _2401 = precise::clamp(_2399, 0.0, 1.0);
                    float _2403 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _2405 = _2403 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _2407 = fma(_2401, _2397, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _2409 = fma(_2401, _2405, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _2411 = fma(_2401, _2393, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    _2265 = _2411;
                    _2259 = _2409;
                    _2307 = _2407;
                    _2351 = true;
                }
                else
                {
                    _2265 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _2259 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _2307 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                }
            }
        }
    }
    _2351 = false;
    float _2413 = _2265;
    float _2415 = _2259;
    float _2417 = _2307;
    float _2419 = _2413 * 0.586610972881317138671875;
    bool _2421 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    out.m_89.x = 0.0;
    float _2423 = fma(_2415, 0.298911988735198974609375, _2419);
    float _2425 = fma(_2417, 0.114477999508380889892578125, _2423);
    float _2427 = -_2425;
    float _2429 = _2427 + _2415;
    float _2431 = -_2425;
    float _2433 = _2431 + _2413;
    float _2435 = -_2425;
    float _2437 = _2435 + _2417;
    float _2439 = (*spvDescriptorSet0.vp_c10)._m0[3].x * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _2441 = fma(_2429, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2425);
    float _2443 = fma(_2433, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2425);
    float _2445 = fma(_2437, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2425);
    out.m_51.x = _2439;
    out.m_91.x = _2441;
    out.m_91.y = _2443;
    out.m_91.z = _2445;
    if (!_2421)
    {
        return out;
    }
    float _2447 = -_1784;
    float _2449 = _2447 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
    float _2451 = -_1786;
    float _2453 = _2451 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
    float _2455 = -_1788;
    float _2457 = _2455 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
    float _2459 = _2449 * _2449;
    float _2461 = fma(_2453, _2453, _2459);
    float _2463 = fma(_2457, _2457, _2461);
    float _2465 = sqrt(_2463);
    float _2467 = rsqrt(_2463);
    float _2469 = -_2465;
    float _2471 = _2469 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _2473 = _2471 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
    float _2475 = precise::clamp(_2473, 0.0, 1.0);
    float _2477 = _2453 * _2467;
    float _2479 = _2449 * _2467;
    float _2481 = abs(_2475);
    float _2483 = log2(_2481);
    float _2485 = _2457 * _2467;
    float _2487 = _2477 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
    float _2489 = _1662 * _2479;
    float _2491 = -_2479;
    float _2493 = -_2487;
    float _2495 = fma(_2491, (*spvDescriptorSet0.vp_c15)._m0[656].y, _2493);
    float _2497 = fma(_1674, _2477, _2489);
    float _2499 = -_2485;
    float _2501 = fma(_2499, (*spvDescriptorSet0.vp_c15)._m0[656].z, _2495);
    float _2503 = fma(_1692, _2485, _2497);
    float _2505 = precise::clamp(_2503, 0.0, 1.0);
    float _2507 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
    float _2509 = _2501 + _2507;
    float _2511 = _2483 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
    float _2513 = _2509 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
    float _2515 = precise::clamp(_2513, 0.0, 1.0);
    float _2517 = exp2(_2511);
    float _2519 = _2517 * _2515;
    float _2521 = _2505 * _2519;
    float _2523 = _2521 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
    float _2525 = _2521 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
    float _2527 = _2521 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
    out.m_89.x = _2523;
    out.m_89.y = _2525;
    out.m_89.z = _2527;
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
    out.m_75 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_51 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_91 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_73 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_77 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_83 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_79 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_89 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_85 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_87 = float4(0.0, 0.0, 0.0, 1.0);
    bool _2351 = false;
    bool _1740 = false;
    bool _588 = false;
    bool _434 = false;
    bool _212 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _105 = in.m_48.w;
    float _107 = trunc(_105);
    int _110 = int(_107);
    bool _114 = _110 >= 1;
    float _116 = 0.0;
    if (!_114)
    {
        _116 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _118 = _116;
    float _120 = _118;
    if (!_114)
    {
        out.m_51.x = 0.0;
    }
    int _122 = 0;
    if (!_114)
    {
        float _124 = _118 * 5.0;
        _122 = as_type<int>(_124);
    }
    int _126 = _122;
    int _128 = _126;
    if (!_114)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2584 = as_type<float>(_126);
        out.gl_Position.z = _2584;
    }
    if (!_114)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_61.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_61.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_61.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_61.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_75.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_75.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_75.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_75.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_51.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_51.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_51.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_51.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_91.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_91.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_91.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_91.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_73.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_73.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_73.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_73.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_77.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_77.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_77.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_77.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_83.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_83.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_83.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_83.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_79.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_79.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_79.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_79.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_89.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_89.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_89.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_89.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_85.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_85.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_85.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_85.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_87.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_87.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_87.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_87.w)); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _130 = in.m_53.w;
    bool _132 = _130 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _134 = isnan(_130);
    bool _136 = _132 || _134;
    bool _138 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _140 = _136 || _138;
    float _142 = -_130;
    float _144 = _142 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    float _146 = 0.0;
    float _148 = _144;
    if (_140)
    {
        float _150 = float(_110);
        _146 = _150;
    }
    float _152 = _146;
    bool _154 = _144 >= _152;
    bool _156 = !_140;
    bool _158 = _154 || _156;
    if (_158)
    {
        _120 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _160 = _120;
    if (_158)
    {
        out.m_51.x = 0.0;
    }
    if (_158)
    {
        float _162 = _160 * 5.0;
        _128 = as_type<int>(_162);
    }
    int _164 = _128;
    if (_158)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2653 = as_type<float>(_164);
        out.gl_Position.z = _2653;
    }
    if (_158)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_61.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_61.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_61.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_61.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_75.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_75.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_75.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_75.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_51.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_51.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_51.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_51.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_91.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_91.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_91.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_91.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_73.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_73.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_73.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_73.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_77.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_77.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_77.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_77.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_83.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_83.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_83.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_83.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_79.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_79.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_79.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_79.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_89.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_89.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_89.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_89.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_85.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_85.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_85.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_85.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_87.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_87.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_87.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_87.w)); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
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
    float _210;
    if (!_192)
    {
        float _194 = in.m_57.x;
        float _196 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _198 = _194 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _200 = fma(_198, (*spvDescriptorSet0.vp_c9)._m0[12].x, _144);
        float _202 = _200 * _196;
        float _204 = floor(_202);
        float _206 = -_204;
        float _208 = _202 + _206;
        _210 = _208;
        _212 = true;
    }
    else
    {
        float _214 = float(_110);
        float _216 = 1.0 / _214;
        float _218 = _144 * _216;
        _210 = _218;
    }
    _212 = false;
    float _220 = _210;
    float _222 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _224 = _220 + _222;
    float _226 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _228 = _220 + _226;
    bool _230 = _220 >= (*spvDescriptorSet0.vp_c9)._m0[146].w;
    bool _232 = isnan(_220);
    bool _234 = _230 || _232;
    bool _236 = isnan((*spvDescriptorSet0.vp_c9)._m0[146].w);
    bool _238 = _234 || _236;
    float _240 = float(_238);
    float _242 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _244 = (*spvDescriptorSet0.vp_c9)._m0[146].w + _242;
    float _246 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _248 = _220 + _246;
    float _250 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _252 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _250;
    float _254 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _256 = _254 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _258 = 1.0 / _244;
    bool _260 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _262 = 1.0 / _256;
    float _264 = 1.0 / _252;
    float _266 = _224 * _258;
    bool _268 = _220 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _270 = isnan(_220);
    bool _272 = _268 || _270;
    bool _274 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _276 = _272 || _274;
    float _278 = float(_276);
    float _280 = -_240;
    float _282 = _280 + 1.0;
    float _284 = _278 * _282;
    float _286 = _228 * _262;
    bool _288 = _220 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _290 = isnan(_220);
    bool _292 = _288 || _290;
    bool _294 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _296 = _292 || _294;
    float _298 = float(_296);
    float _300 = -(*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _302 = (*spvDescriptorSet0.vp_c9)._m0[144].z + _300;
    bool _304 = _220 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _306 = isnan(_220);
    bool _308 = _304 || _306;
    bool _310 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _312 = _308 || _310;
    float _314 = float(_312);
    float _316 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _318 = _316 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _320 = -_278;
    float _322 = _320 + 1.0;
    float _324 = -_298;
    float _326 = _324 + 1.0;
    float _328 = _248 * _264;
    float _330 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _332 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _330;
    float _334 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _336 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _334;
    float _338 = _314 * _326;
    float _340 = fma(_302, _328, (*spvDescriptorSet0.vp_c9)._m0[143].z);
    float _342 = fma(_332, _328, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _344 = fma(_336, _328, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _346 = _298 * _322;
    float _348 = -(*spvDescriptorSet0.vp_c9)._m0[144].z;
    float _350 = _348 + (*spvDescriptorSet0.vp_c9)._m0[145].z;
    float _352 = _342 * _338;
    float _354 = _344 * _338;
    float _356 = _340 * _338;
    float _358 = -_314;
    float _360 = _358 + 1.0;
    float _362 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _364 = _362 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _366 = fma(_360, (*spvDescriptorSet0.vp_c9)._m0[143].x, _354);
    float _368 = fma(_360, (*spvDescriptorSet0.vp_c9)._m0[143].y, _352);
    float _370 = fma(_360, (*spvDescriptorSet0.vp_c9)._m0[143].z, _356);
    float _372 = -(*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _374 = (*spvDescriptorSet0.vp_c9)._m0[146].x + _372;
    float _376 = fma(_318, _286, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _378 = fma(_364, _286, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _380 = fma(_350, _286, (*spvDescriptorSet0.vp_c9)._m0[144].z);
    float _382 = -(*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _384 = (*spvDescriptorSet0.vp_c9)._m0[146].y + _382;
    float _386 = -(*spvDescriptorSet0.vp_c9)._m0[145].z;
    float _388 = (*spvDescriptorSet0.vp_c9)._m0[146].z + _386;
    float _390 = fma(_376, _346, _366);
    float _392 = fma(_374, _266, (*spvDescriptorSet0.vp_c9)._m0[145].x);
    float _394 = fma(_384, _266, (*spvDescriptorSet0.vp_c9)._m0[145].y);
    float _396 = fma(_388, _266, (*spvDescriptorSet0.vp_c9)._m0[145].z);
    float _398 = fma(_378, _346, _368);
    float _400 = fma(_380, _346, _370);
    float _402 = fma(_392, _284, _390);
    float _404 = fma(_394, _284, _398);
    float _406 = fma(_396, _284, _400);
    float _408 = fma(_240, (*spvDescriptorSet0.vp_c9)._m0[146].x, _402);
    float _410 = fma(_240, (*spvDescriptorSet0.vp_c9)._m0[146].y, _404);
    float _412 = fma(_240, (*spvDescriptorSet0.vp_c9)._m0[146].z, _406);
    bool _414 = !_260;
    float _432;
    if (!_414)
    {
        float _416 = in.m_57.x;
        float _418 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _420 = _416 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _422 = fma(_420, (*spvDescriptorSet0.vp_c9)._m0[11].y, _144);
        float _424 = _422 * _418;
        float _426 = floor(_424);
        float _428 = -_426;
        float _430 = _424 + _428;
        _432 = _430;
        _434 = true;
    }
    else
    {
        float _436 = float(_110);
        float _438 = 1.0 / _436;
        float _440 = _144 * _438;
        _432 = _440;
    }
    _434 = false;
    float _442 = _432;
    float _444 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _446 = _442 + _444;
    float _448 = in.m_59.x;
    float _450 = in.m_59.y;
    float _452 = in.m_59.z;
    float _454 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _456 = _454 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _458 = _442 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _460 = isnan(_442);
    bool _462 = _458 || _460;
    bool _464 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _466 = _462 || _464;
    float _468 = float(_466);
    float _470 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _472 = _470 + (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _474 = _442 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _476 = isnan(_442);
    bool _478 = _474 || _476;
    bool _480 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _482 = _478 || _480;
    float _484 = float(_482);
    float _486 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _488 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _486;
    bool _490 = _442 >= (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _492 = isnan(_442);
    bool _494 = _490 || _492;
    bool _496 = isnan((*spvDescriptorSet0.vp_c9)._m0[117].w);
    bool _498 = _494 || _496;
    float _500 = float(_498);
    float _502 = 1.0 / _456;
    float _504 = -_468;
    float _506 = _504 + 1.0;
    bool _508 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].w;
    float _510 = _484 * _506;
    float _512 = -_484;
    float _514 = _512 + 1.0;
    float _516 = 1.0 / _472;
    float _518 = _488 * _502;
    float _520 = -(*spvDescriptorSet0.vp_c9)._m0[116].x;
    float _522 = _520 + (*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _524 = _412 * _452;
    float _526 = _408 * _448;
    float _528 = fma(_518, _446, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _530 = _522 * _516;
    float _532 = _528 * _510;
    float _534 = -_500;
    float _536 = _534 + 1.0;
    float _538 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _540 = _442 + _538;
    float _542 = fma(_514, (*spvDescriptorSet0.vp_c9)._m0[115].x, _532);
    float _544 = _468 * _536;
    float _546 = fma(_530, _540, (*spvDescriptorSet0.vp_c9)._m0[116].x);
    float _548 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _550 = fma(_546, _544, _542);
    float _552 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _554 = _548 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _556 = fma(_500, (*spvDescriptorSet0.vp_c9)._m0[117].x, _550);
    float _558 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _560 = _552 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _562 = _556 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _564 = _410 * _450;
    float _566 = _558 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    out.m_61.x = _554;
    out.m_61.y = _566;
    out.m_61.z = _560;
    out.m_61.w = _562;
    bool _568 = !_508;
    float _586;
    if (!_568)
    {
        float _570 = in.m_57.x;
        float _572 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].w;
        float _574 = _570 * (*spvDescriptorSet0.vp_c9)._m0[13].x;
        float _576 = fma(_574, (*spvDescriptorSet0.vp_c9)._m0[11].w, _144);
        float _578 = _576 * _572;
        float _580 = floor(_578);
        float _582 = -_580;
        float _584 = _578 + _582;
        _586 = _584;
        _588 = true;
    }
    else
    {
        float _590 = float(_110);
        float _592 = 1.0 / _590;
        float _594 = _144 * _592;
        _586 = _594;
    }
    _588 = false;
    float _596 = _586;
    float _598 = in.m_57.x;
    float _600 = _564 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _602 = in.m_57.y;
    int _604 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _606 = _604 != 0;
    float _608 = _524 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _610 = in.m_57.z;
    int _612 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _614 = _612 != 0;
    int _616 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _618 = _616 != 0;
    int _620 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _622 = _620 != 0;
    float _624 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _626 = log2(_624);
    float _628 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    float _630 = in.m_57.w;
    float _632 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    bool _634 = !_622;
    int _636 = _634 ? 0 : 1;
    float _638 = _598 * 2.0;
    float _640 = _598 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    bool _642 = !_618;
    int _644 = _642 ? 0 : 1;
    float _646 = _626 * _144;
    float _648 = _602 * 2.0;
    float _650 = floor(_638);
    float _652 = -_628;
    float _654 = fma(_640, 2.0, _652);
    float _656 = _602 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    float _658 = _610 * 2.0;
    float _660 = -_144;
    float _662 = fma(_660, (*spvDescriptorSet0.vp_c9)._m0[76].x, _654);
    int _664 = abs(_644);
    float _666 = (*spvDescriptorSet0.vp_c9)._m0[83].z + (*spvDescriptorSet0.vp_c9)._m0[83].x;
    float _668 = floor(_648);
    float _670 = _638;
    float _672 = _666;
    bool _674 = _622;
    if (!_606)
    {
        _670 = _602;
    }
    float _676 = _670;
    float _678 = fma(_656, -2.0, _632);
    float _680 = _676;
    if (_606)
    {
        _680 = _598;
    }
    float _682 = _680;
    float _684 = _602 + (-0.5);
    float _686 = float(_664);
    float _688 = fma(_144, (*spvDescriptorSet0.vp_c9)._m0[76].y, _678);
    bool _690 = _630 > 0.5;
    float _692 = exp2(_646);
    bool _694 = _650 >= 0.0;
    bool _696 = isnan(_650);
    bool _698 = _694 || _696;
    bool _700 = isnan(0.0);
    bool _702 = _698 || _700;
    float _704 = fma(_682, (*spvDescriptorSet0.vp_c9)._m0[83].z, _666);
    bool _706 = _650 > 0.0;
    float _708 = in.m_63.x;
    int _710 = _702 ? 0 : 1;
    float _712 = _650;
    float _714 = _682;
    if (!_606)
    {
        _712 = _602;
    }
    float _716 = _712;
    float _718 = floor(_658);
    bool _720 = _668 > 0.0;
    bool _722 = _668 >= 0.0;
    bool _724 = isnan(_668);
    bool _726 = _722 || _724;
    bool _728 = isnan(0.0);
    bool _730 = _726 || _728;
    float _732 = _716;
    if (_606)
    {
        _732 = _598;
    }
    float _734 = _732;
    float _736 = -_692;
    float _738 = _736 + 1.0;
    if (!_606)
    {
        _672 = _598;
    }
    float _740 = _672;
    float _742 = (*spvDescriptorSet0.vp_c9)._m0[82].x + (*spvDescriptorSet0.vp_c9)._m0[81].z;
    float _744 = _740;
    if (_606)
    {
        _744 = _610;
    }
    float _746 = _744;
    float _748 = _734 * (*spvDescriptorSet0.vp_c9)._m0[82].x;
    float _750 = (*spvDescriptorSet0.vp_c9)._m0[84].z + (*spvDescriptorSet0.vp_c9)._m0[84].y;
    float _752 = _746;
    if (!_606)
    {
        _714 = _610;
    }
    float _754 = _714;
    float _756 = fma(_144, (*spvDescriptorSet0.vp_c9)._m0[82].z, _704);
    float _758 = -_742;
    float _760 = fma(_748, 2.0, _758);
    float _762 = fma(_746, (*spvDescriptorSet0.vp_c9)._m0[84].z, _750);
    float _764 = _754;
    if (!_606)
    {
        _752 = _754;
    }
    float _766 = _752;
    float _768 = -_144;
    float _770 = fma(_768, (*spvDescriptorSet0.vp_c9)._m0[81].x, _760);
    float _772 = _766;
    if (_606)
    {
        _772 = _602;
    }
    float _774 = _772;
    float _776 = (*spvDescriptorSet0.vp_c9)._m0[82].y + (*spvDescriptorSet0.vp_c9)._m0[81].w;
    int _778 = _730 ? 0 : 1;
    float _780 = fma(_144, (*spvDescriptorSet0.vp_c9)._m0[84].x, _762);
    float _782 = _774 * (*spvDescriptorSet0.vp_c9)._m0[82].y;
    int _784 = ~_710;
    int _786 = _784 + 1;
    int _788 = _786 + 1;
    float _790 = _188 * _188;
    int _792 = ~_778;
    int _794 = _792 + 1;
    int _796 = _794 + 1;
    float _798 = (*spvDescriptorSet0.vp_c9)._m0[83].w + (*spvDescriptorSet0.vp_c9)._m0[83].y;
    int _800 = _788;
    int _802 = _796;
    if (_606)
    {
        _764 = _602;
    }
    float _804 = _764;
    float _806 = fma(_782, -2.0, _776);
    if (!_706)
    {
        int _808 = ~_710;
        int _810 = _808 + 1;
        _800 = _810;
    }
    int _812 = _800;
    float _814 = fma(_186, _186, _790);
    if (!_720)
    {
        int _816 = ~_778;
        int _818 = _816 + 1;
        _802 = _818;
    }
    int _820 = _802;
    float _822 = fma(_804, (*spvDescriptorSet0.vp_c9)._m0[83].w, _798);
    bool _824 = _718 > 0.0;
    bool _826 = _718 >= 0.0;
    bool _828 = isnan(_718);
    bool _830 = _826 || _828;
    bool _832 = isnan(0.0);
    bool _834 = _830 || _832;
    float _836 = fma(_144, (*spvDescriptorSet0.vp_c9)._m0[82].w, _822);
    bool _838 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _840 = isnan(0.0);
    bool _842 = _838 || _840;
    bool _844 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _846 = _842 || _844;
    float _848 = _846 ? _738 : 0.0;
    bool _850 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _852 = isnan(1.0);
    bool _854 = _850 || _852;
    bool _856 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _858 = _854 || _856;
    float _860 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _862 = 1.0 + _860;
    float _864 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    int _866 = _834 ? 0 : 1;
    float _868 = 1.0 / _862;
    int _870 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _872 = _870 != 0;
    float _874 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    float _876 = fma(_598, (*spvDescriptorSet0.vp_c9)._m0[78].z, _864);
    int _878 = ~_866;
    int _880 = _878 + 1;
    int _882 = _880 + 1;
    float _884 = in.m_65.x;
    float _886 = in.m_65.y;
    float _888 = in.m_65.z;
    float _890 = fma(_602, (*spvDescriptorSet0.vp_c9)._m0[78].w, _874);
    float _892 = fma(_144, (*spvDescriptorSet0.vp_c9)._m0[77].z, _876);
    int _894 = _882;
    bool _896 = _872;
    float _898 = _836;
    if (!_824)
    {
        int _900 = ~_866;
        int _902 = _900 + 1;
        _894 = _902;
    }
    int _904 = _894;
    float _906 = in.m_48.x;
    float _908 = in.m_48.y;
    float _910 = in.m_48.z;
    float _912 = fma(_144, (*spvDescriptorSet0.vp_c9)._m0[77].w, _890);
    float _914 = fma(_144, (*spvDescriptorSet0.vp_c9)._m0[81].y, _806);
    int _916 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _918 = _916 != 0;
    if (_858)
    {
        float _920 = _848 * _868;
        _148 = _920;
    }
    float _922 = _148;
    int _924 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _926 = _924 != 0;
    int _928 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _930 = _928 != 0;
    float _932 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _934 = _932 + (*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _936 = 1.0 / _934;
    float _938 = float(_820);
    float _940 = -(*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _942 = _940 + (*spvDescriptorSet0.vp_c9)._m0[133].w;
    float _944 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _886);
    if (_918)
    {
        bool _946 = _610 > 0.5;
        _674 = _946;
    }
    bool _948 = _674;
    float _950 = _908 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _952 = _908 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _954 = _600 * _944;
    float _956 = _908 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _958 = _598 + _602;
    float _960 = fma(_906, (*spvDescriptorSet0.vp_c10)._m0[5].x, _952);
    float _962 = fma(_906, (*spvDescriptorSet0.vp_c10)._m0[4].x, _950);
    float _964 = fma(_906, (*spvDescriptorSet0.vp_c10)._m0[6].x, _956);
    float _966 = -(*spvDescriptorSet0.vp_c9)._m0[131].x;
    float _968 = (*spvDescriptorSet0.vp_c9)._m0[132].x + _966;
    float _970 = _958 + (-1.0);
    float _972 = -(*spvDescriptorSet0.vp_c9)._m0[132].x;
    float _974 = _972 + (*spvDescriptorSet0.vp_c9)._m0[133].x;
    float _976 = 1.0 / _942;
    float _978 = _968 * _936;
    float _980 = fma(_970, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    float _982 = fma(_190, _190, _814);
    int _984 = abs(_636);
    float _986 = _602 + _610;
    float _988 = -(*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _990 = _596 + _988;
    float _992 = fma(_910, (*spvDescriptorSet0.vp_c10)._m0[4].z, _962);
    float _994 = rsqrt(_982);
    float _996 = _986 + (-1.0);
    float _998 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _1000 = _596 + _998;
    float _1002 = fma(_910, (*spvDescriptorSet0.vp_c10)._m0[6].z, _964);
    float _1004 = fma(_910, (*spvDescriptorSet0.vp_c10)._m0[5].z, _960);
    float _1006 = fma(_996, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    float _1008 = fma(_978, _1000, (*spvDescriptorSet0.vp_c9)._m0[131].x);
    float _1010 = _974 * _976;
    float _1012 = in.m_63.y;
    float _1014 = float(_984);
    float _1016 = fma(_1010, _990, (*spvDescriptorSet0.vp_c9)._m0[132].x);
    float _1018 = float(_812);
    float _1020 = _598 + _610;
    float _1022 = in.m_67.x;
    float _1024 = in.m_67.y;
    float _1026 = in.m_67.z;
    float _1028 = _1014 * _938;
    float _1030 = _186 * _994;
    float _1032 = _188 * _994;
    float _1034 = _190 * _994;
    float _1036 = fma((*spvDescriptorSet0.vp_c10)._m0[2].x, (*spvDescriptorSet0.vp_c9)._m0[191].x, _598);
    float _1038 = _1020 + (-1.0);
    float _1040 = _686 * _1018;
    float _1042 = _1036 + _886;
    float _1044 = -(*spvDescriptorSet0.vp_c8)._m0[28].z;
    float _1046 = _1032 * _1044;
    float _1048 = fma(_1038, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    bool _1050 = !_614;
    int _1052 = _1050 ? 0 : 1;
    float _1054 = _1042 * (*spvDescriptorSet0.vp_c9)._m0[191].y;
    bool _1056 = _602 > 0.5;
    float _1058 = -(*spvDescriptorSet0.vp_c8)._m0[28].x;
    float _1060 = _1034 * _1058;
    float _1062 = _1040 * (-2.0);
    int _1064 = abs(_1052);
    float _1066 = _1054 * 0.15915493667125701904296875;
    float _1068 = -(*spvDescriptorSet0.vp_c8)._m0[28].z;
    float _1070 = -_1060;
    float _1072 = fma(_1030, _1068, _1070);
    float _1074 = _1028 * (-2.0);
    float _1076 = float(_1064);
    float _1078 = -(*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _1080 = -_1046;
    float _1082 = fma(_1034, _1078, _1080);
    float _1084 = _1072 * _1072;
    float _1086 = fma(_1006, _1062, _1006);
    float _1088 = -_1012;
    float _1090 = _1088 + 1.0;
    float _1092 = fma(_1062, _1024, _1024);
    float _1094 = fma(_1082, _1082, _1084);
    float _1096 = fma(_1048, _1074, _1048);
    float _1098 = float(_904);
    float _1100 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    float _1102 = fma(_1074, _1026, _1026);
    float _1104 = _610 + (-0.5);
    float _1106 = fma(_684, (*spvDescriptorSet0.vp_c9)._m0[196].y, _1092);
    float _1108 = _1076 * _1098;
    int _1110 = _690 ? as_type<int>(_1090) : as_type<int>(_1012);
    float _1112 = fma(_1104, (*spvDescriptorSet0.vp_c9)._m0[196].z, _1102);
    float _1114 = fma(_1086, _922, _1106);
    float _1116 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _1118 = _1108 * (-2.0);
    bool _1120 = _596 >= (*spvDescriptorSet0.vp_c9)._m0[133].w;
    bool _1122 = isnan(_596);
    bool _1124 = _1120 || _1122;
    bool _1126 = isnan((*spvDescriptorSet0.vp_c9)._m0[133].w);
    bool _1128 = _1124 || _1126;
    float _1130 = float(_1128);
    float _1132 = _598 + (-0.5);
    int _1134 = _872 ? _1110 : as_type<int>(_1012);
    float _1136 = fma(_1096, _922, _1112);
    float _1138 = _1012;
    int _1140 = _1134;
    float _1142 = _990;
    if (_930)
    {
        float _1144 = _1056 ? _1090 : _1012;
        _1138 = _1144;
    }
    float _1146 = _1138;
    float _1148 = fma(_1118, _1022, _1022);
    int _1150 = as_type<int>(_1146);
    if (_926)
    {
        bool _1152 = _598 > 0.5;
        _896 = _1152;
    }
    bool _1154 = _896;
    float _1156 = -_1130;
    float _1158 = _1156 + 1.0;
    bool _1160 = _596 >= (*spvDescriptorSet0.vp_c9)._m0[132].w;
    bool _1162 = isnan(_596);
    bool _1164 = _1160 || _1162;
    bool _1166 = isnan((*spvDescriptorSet0.vp_c9)._m0[132].w);
    bool _1168 = _1164 || _1166;
    float _1170 = float(_1168);
    float _1172 = in.m_69.x;
    float _1174 = -(*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _1176 = _1030 * _1174;
    float _1178 = _1114 * 0.15915493667125701904296875;
    float _1180 = _1066 * 6.283185482025146484375;
    float _1182 = sin(_1180);
    float _1184 = fma(_980, _1118, _980);
    float _1186 = fma(_1132, (*spvDescriptorSet0.vp_c9)._m0[196].x, _1148);
    bool _1188 = _596 >= (*spvDescriptorSet0.vp_c9)._m0[131].w;
    bool _1190 = isnan(_596);
    bool _1192 = _1188 || _1190;
    bool _1194 = isnan((*spvDescriptorSet0.vp_c9)._m0[131].w);
    bool _1196 = _1192 || _1194;
    float _1198 = float(_1196);
    float _1200 = _1170 * _1158;
    float _1202 = -(*spvDescriptorSet0.vp_c8)._m0[28].x;
    float _1204 = -_1176;
    float _1206 = fma(_1032, _1202, _1204);
    float _1208 = -_1170;
    float _1210 = _1208 + 1.0;
    float _1212 = _1100 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    float _1214 = fma(_1184, _922, _1186);
    float _1216 = _1116 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _1218 = fma(_1206, _1206, _1094);
    float _1220 = _1198 * _1210;
    float _1222 = fma(as_type<float>(_1134), _1212, -0.5);
    float _1224 = _1220;
    if (_918)
    {
        float _1226 = -_708;
        float _1228 = _1226 + 1.0;
        _1140 = as_type<int>(_1228);
    }
    int _1230 = _1140;
    float _1232 = _1136 * 0.15915493667125701904296875;
    float _1234 = _1214 * 0.15915493667125701904296875;
    float _1236 = fma(_1216, _1146, -0.5);
    float _1238 = _1008 * _1220;
    if (_926)
    {
        float _1240 = -_708;
        float _1242 = _1240 + 1.0;
        _1150 = as_type<int>(_1242);
    }
    int _1244 = _1150;
    if (!_918)
    {
        _1224 = _708;
    }
    float _1246 = _1224;
    float _1248 = rsqrt(_1218);
    float _1250 = _1246;
    if (_918)
    {
        float _1252 = _948 ? as_type<float>(_1230) : _708;
        _1250 = _1252;
    }
    float _1254 = _1250;
    float _1256 = _1182 * (*spvDescriptorSet0.vp_c9)._m0[191].z;
    if (!_926)
    {
        _1142 = _708;
    }
    float _1258 = _1142;
    float _1260 = -_1198;
    float _1262 = _1260 + 1.0;
    float _1264 = _1258;
    if (_926)
    {
        float _1266 = _1154 ? as_type<float>(_1244) : _708;
        _1264 = _1266;
    }
    float _1268 = _1264;
    float _1270 = _526 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _1272 = _1256 * _1172;
    float _1274 = _1178 * 6.283185482025146484375;
    float _1276 = sin(_1274);
    float _1278 = fma(_1262, (*spvDescriptorSet0.vp_c9)._m0[131].x, _1238);
    float _1280 = -_688;
    float _1282 = fma(_912, _1236, _1280);
    float _1284 = _1272 + _888;
    float _1286 = _1272 + _884;
    float _1288 = fma(_1016, _1200, _1278);
    float _1290 = _992 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _1292 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _1284);
    float _1294 = _1232 * 6.283185482025146484375;
    float _1296 = cos(_1294);
    float _1298 = _1082 * _1248;
    float _1300 = _1072 * _1248;
    float _1302 = _1206 * _1248;
    float _1304 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _1286);
    float _1306 = _608 * _1292;
    float _1308 = _1030 * _1300;
    float _1310 = _1002 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _1312 = _1234 * 6.283185482025146484375;
    float _1314 = sin(_1312);
    float _1316 = _1270 * _1304;
    bool _1318 = _886 != 0.0;
    bool _1320 = isnan(_886);
    bool _1322 = _1318 || _1320;
    bool _1324 = isnan(0.0);
    bool _1326 = _1322 || _1324;
    float _1328 = fma(_1130, (*spvDescriptorSet0.vp_c9)._m0[133].x, _1288);
    float _1330 = _1034 * _1298;
    float _1332 = _1004 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _1334 = -_884;
    bool _1336 = _1272 == _1334;
    bool _1338 = !_1326;
    bool _1340 = _1336 && _1338;
    float _1342 = _1178 * 6.283185482025146484375;
    float _1344 = cos(_1342);
    float _1346 = _1276 * _1296;
    float _1348 = -_888;
    bool _1350 = _1272 == _1348;
    bool _1352 = _1350 && _1340;
    float _1354 = -_1330;
    float _1356 = fma(_1030, _1302, _1354);
    float _1358 = _1234 * 6.283185482025146484375;
    float _1360 = cos(_1358);
    float _1362 = _1314 * _1276;
    float _1364 = _1232 * 6.283185482025146484375;
    float _1366 = sin(_1364);
    float _1368 = _1314 * _1344;
    float _1370 = _1344 * _1296;
    float _1372 = _1360 * _1344;
    float _1374 = _1360 * _1276;
    float _1376 = _1314 * _1296;
    float _1378 = _1360 * _1296;
    float _1380 = _1378 * _1030;
    float _1382 = fma(_1366, _1372, _1362);
    float _1384 = -_1374;
    float _1386 = fma(_1366, _1368, _1384);
    float _1388 = -_1368;
    float _1390 = fma(_1366, _1374, _1388);
    float _1392 = fma(_1366, _1362, _1372);
    float _1394 = _1032 * _1302;
    float _1396 = _1382 * _1030;
    float _1398 = _1390 * _1030;
    float _1400 = -_1366;
    float _1402 = fma(_1400, _1298, _1380);
    float _1404 = -_1394;
    float _1406 = fma(_1034, _1300, _1404);
    float _1408 = fma(_1370, _1298, _1396);
    float _1410 = fma(_1346, _1298, _1398);
    float _1412 = _1378 * _1034;
    float _1414 = _1382 * _1034;
    float _1416 = fma(_1386, _1406, _1408);
    float _1418 = fma(_1392, _1406, _1410);
    float _1420 = -_1308;
    float _1422 = fma(_1032, _1298, _1420);
    float _1424 = -_1366;
    float _1426 = fma(_1424, _1302, _1412);
    float _1428 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _1430 = fma(_1376, _1406, _1402);
    float _1432 = _1390 * _1034;
    float _1434 = fma(_1370, _1302, _1414);
    float _1436 = fma(_1376, _1422, _1426);
    float _1438 = _954 * _1430;
    float _1440 = fma(_1346, _1302, _1432);
    float _1442 = fma(_1386, _1422, _1434);
    float _1444 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    float _1446 = _954 * _1436;
    float _1448 = fma(_1316, _1416, _1438);
    float _1450 = fma(_1392, _1422, _1440);
    float _1452 = _1378 * _1032;
    float _1454 = fma(_1316, _1442, _1446);
    float _1456 = _780 * (-0.15915493667125701904296875);
    float _1458 = fma(_1306, _1418, _1448);
    float _1460 = _1428 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _1462 = fma(_1306, _1450, _1454);
    float _1464 = _1456 * 6.283185482025146484375;
    float _1466 = sin(_1464);
    float _1468 = _1290 + _1458;
    float _1470 = fma(_1460, _1268, -0.5);
    float _1472 = _1310 + _1462;
    float _1474 = _1382 * _1032;
    float _1476 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1478 = _1468 + _1476;
    float _1480 = _1444 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    float _1482 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1484 = _1472 + _1482;
    float _1486 = fma(_892, _1470, _662);
    float _1488 = _1478 * _1478;
    float _1490 = fma(_1480, _1254, -0.5);
    float _1492 = _1484 * _1484;
    float _1494 = in.m_71.x;
    float _1496 = in.m_71.y;
    float _1498 = in.m_71.z;
    float _1500 = _1456 * 6.283185482025146484375;
    float _1502 = cos(_1500);
    float _1504 = -_1366;
    float _1506 = fma(_1504, _1300, _1452);
    float _1508 = _1488 + _1492;
    float _1510 = _1390 * _1032;
    float _1512 = fma(_1370, _1300, _1474);
    float _1514 = fma(_1376, _1356, _1506);
    float _1516 = _1466 * _1222;
    float _1518 = fma(_1346, _1300, _1510);
    float _1520 = sqrt(_1508);
    float _1522 = fma(_1386, _1356, _1512);
    float _1524 = _954 * _1514;
    float _1526 = fma(_1392, _1356, _1518);
    float _1528 = fma(_1316, _1522, _1524);
    float _1530 = _1502 * _1222;
    float _1532 = -_1516;
    float _1534 = fma(_1502, _1490, _1532);
    float _1536 = fma(_1306, _1526, _1528);
    float _1538 = fma(_1466, _1490, _1530);
    float _1540 = fma(_756, _1534, _770);
    float _1542 = _1332 + _1536;
    float _1544 = _1496;
    float _1546 = _1494;
    float _1548 = _1488;
    float _1550 = _1492;
    float _1552 = _1468;
    float _1554 = _1472;
    float _1556 = _1498;
    float _1558 = _1486;
    float _1560 = _1272;
    if (!_1352)
    {
        float _1562 = fma(_886, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1496);
        _1544 = _1562;
    }
    float _1564 = _1544;
    bool _1566 = _1520 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1568 = -_914;
    float _1570 = fma(_836, _1538, _1568);
    if (!_1352)
    {
        float _1572 = fma(_1286, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1494);
        _1546 = _1572;
    }
    float _1574 = _1546;
    float _1576 = _1430 * _1564;
    float _1578 = _1514 * _1564;
    float _1580 = _1436 * _1564;
    if (!_1566)
    {
        _898 = _1542;
    }
    float _1582 = _898;
    bool _1584 = !_1566;
    float _1586 = _1582;
    if (!_1584)
    {
        float _1588 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1590 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1592 = _1520 + _1590;
        float _1594 = rsqrt(_1508);
        float _1596 = _1592 * _1588;
        float _1598 = _1542 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1600 = _1596 * 0.15915493667125701904296875;
        float _1602 = _1600 * 6.283185482025146484375;
        float _1604 = sin(_1602);
        float _1606 = _1600 * 6.283185482025146484375;
        float _1608 = cos(_1606);
        float _1610 = fma(_1604, _1598, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1612 = _1594 * _1610;
        float _1614 = fma(_1478, _1612, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1616 = _1608 + (-1.0);
        float _1618 = fma(_1484, _1612, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        float _1620 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
        float _1622 = _1614 + _1620;
        float _1624 = _1616 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1626 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
        float _1628 = _1618 + _1626;
        float _1630 = _1622 * _1622;
        float _1632 = fma(_1542, _1608, _1624);
        float _1634 = _1628 * _1628;
        _1586 = _1632;
        _1548 = _1630;
        _1550 = _1634;
        _1552 = _1614;
        _1554 = _1618;
    }
    float _1636 = _1586;
    float _1638 = _1548;
    float _1640 = _1550;
    float _1642 = _1552;
    float _1644 = _1554;
    float _1646 = -(*spvDescriptorSet0.vp_c15)._m0[0].y;
    float _1648 = _1636 + _1646;
    float _1650 = fma(_1522, _1574, _1578);
    if (!_1352)
    {
        float _1652 = fma(_1284, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1498);
        _1556 = _1652;
    }
    float _1654 = _1556;
    float _1656 = fma(_1648, _1648, _1638);
    float _1658 = fma(_1416, _1574, _1576);
    float _1660 = _1656 + _1640;
    float _1662 = fma(_1526, _1654, _1650);
    float _1664 = fma(_1442, _1574, _1580);
    float _1666 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _1668 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _1670 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _1672 = sqrt(_1660);
    float _1674 = fma(_1418, _1654, _1658);
    float _1676 = _1666 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1678 = _1668 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1680 = _1670 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1682 = _1282 + 0.5;
    float _1684 = _1328 * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    float _1686 = _1486 + 0.5;
    float _1688 = _1540 + 0.5;
    float _1690 = _1570 + 0.5;
    float _1692 = fma(_1450, _1654, _1664);
    out.m_73.x = _1172;
    out.m_75.x = _1676;
    out.m_75.y = _1678;
    out.m_75.z = _1680;
    out.m_75.w = _1684;
    bool _1694 = _1672 >= (*spvDescriptorSet0.vp_c16)._m0[1].x;
    bool _1696 = isnan(_1672);
    bool _1698 = _1694 || _1696;
    bool _1700 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].x);
    bool _1702 = _1698 || _1700;
    out.m_77.x = _1686;
    out.m_77.y = _1682;
    out.m_77.z = _1688;
    out.m_77.w = _1690;
    out.m_79.x = _1674;
    out.m_79.y = _1662;
    out.m_79.z = _1692;
    float _1704 = _1688;
    if (!_1702)
    {
        _1558 = 1.0;
    }
    float _1706 = _1558;
    bool _1708 = !_1702;
    float _1710 = _1706;
    if (!_1708)
    {
        bool _1712 = _1672 >= (*spvDescriptorSet0.vp_c16)._m0[1].y;
        bool _1714 = isnan(_1672);
        bool _1716 = _1712 || _1714;
        bool _1718 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].y);
        bool _1720 = _1716 || _1718;
        if (!_1720)
        {
            float _1722 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _1724 = _1672 + _1722;
            float _1726 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _1728 = (*spvDescriptorSet0.vp_c16)._m0[1].y + _1726;
            float _1730 = -(*spvDescriptorSet0.vp_c16)._m0[2].x;
            float _1732 = _1730 + (*spvDescriptorSet0.vp_c16)._m0[2].y;
            float _1734 = 1.0 / _1728;
            float _1736 = _1724 * _1734;
            float _1738 = fma(_1736, _1732, (*spvDescriptorSet0.vp_c16)._m0[2].x);
            _1710 = _1738;
            _1740 = true;
        }
        else
        {
            bool _1742 = _1672 >= (*spvDescriptorSet0.vp_c16)._m0[1].z;
            bool _1744 = isnan(_1672);
            bool _1746 = _1742 || _1744;
            bool _1748 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].z);
            bool _1750 = _1746 || _1748;
            if (!_1750)
            {
                float _1752 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _1754 = _1672 + _1752;
                float _1756 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _1758 = _1756 + (*spvDescriptorSet0.vp_c16)._m0[1].z;
                float _1760 = -(*spvDescriptorSet0.vp_c16)._m0[2].y;
                float _1762 = _1760 + (*spvDescriptorSet0.vp_c16)._m0[2].z;
                float _1764 = 1.0 / _1758;
                float _1766 = _1754 * _1764;
                float _1768 = fma(_1766, _1762, (*spvDescriptorSet0.vp_c16)._m0[2].y);
                _1710 = _1768;
                _1740 = true;
            }
            else
            {
                _1710 = (*spvDescriptorSet0.vp_c16)._m0[2].z;
            }
        }
    }
    _1740 = false;
    float _1770 = _1710;
    float _1772 = -(*spvDescriptorSet0.vp_c16)._m0[0].y;
    float _1774 = _1636 + _1772;
    float _1776 = -(*spvDescriptorSet0.vp_c16)._m0[0].x;
    float _1778 = _1642 + _1776;
    float _1780 = -(*spvDescriptorSet0.vp_c16)._m0[0].z;
    float _1782 = _1644 + _1780;
    float _1784 = fma(_1774, _1770, (*spvDescriptorSet0.vp_c16)._m0[0].y);
    float _1786 = fma(_1778, _1770, (*spvDescriptorSet0.vp_c16)._m0[0].x);
    float _1788 = fma(_1782, _1770, (*spvDescriptorSet0.vp_c16)._m0[0].z);
    float _1790 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1792 = _1784 + _1790;
    float _1794 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1796 = _1786 + _1794;
    float _1798 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1800 = _1788 + _1798;
    float _1802 = _1792 * _1792;
    float _1804 = fma(_1796, _1796, _1802);
    float _1806 = fma(_1800, _1800, _1804);
    float _1808 = rsqrt(_1806);
    float _1810 = sqrt(_1806);
    float _1812 = _1808 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1814 = _1796 * _1812;
    float _1816 = _1800 * _1812;
    float _1818 = _1814 * _1814;
    float _1820 = _1816 * _1816;
    float _1822 = _1818 + _1820;
    float _1824 = sqrt(_1822);
    bool _1826 = _1824 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1828 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1830 = _1824 + _1828;
    float _1832 = _1808;
    float _1834 = _1822;
    float _1836 = _1830;
    float _1838 = _1770;
    float _1840 = _1792;
    if (_1826)
    {
        float _1842 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1832 = _1842;
    }
    float _1844 = _1832;
    if (_1826)
    {
        float _1846 = rsqrt(_1822);
        _1834 = _1846;
    }
    float _1848 = _1834;
    if (_1826)
    {
        float _1850 = _1830 * _1844;
        _1836 = _1850;
    }
    float _1852 = _1836;
    if (_1826)
    {
        float _1854 = _1852 * 0.15915493667125701904296875;
        _1838 = _1854;
    }
    float _1856 = _1838;
    float _1858 = _1844;
    if (_1826)
    {
        float _1860 = _1856 * 6.283185482025146484375;
        float _1862 = sin(_1860);
        _1858 = _1862;
    }
    float _1864 = _1858;
    float _1866 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _1868 = precise::max(0.0, _1866);
    float _1870 = _1800;
    float _1872 = _1868;
    if (_1826)
    {
        float _1874 = _1856 * 6.283185482025146484375;
        float _1876 = cos(_1874);
        _1870 = _1876;
    }
    float _1878 = _1870;
    float _1880 = -_1812;
    float _1882 = -_1868;
    float _1884 = fma(_1792, _1880, _1882);
    float _1886 = _1884;
    if (_1826)
    {
        float _1888 = _1884 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1872 = _1888;
    }
    float _1890 = _1872;
    float _1892 = _1784 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1894 = _1864;
    float _1896 = _1890;
    if (_1826)
    {
        float _1898 = fma(_1864, _1890, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1704 = _1898;
    }
    float _1900 = _1704;
    float _1902 = _1900;
    if (!_1826)
    {
        _1894 = _1814;
    }
    float _1904 = _1894;
    float _1906 = _1904;
    float _1908 = _1878;
    if (_1826)
    {
        float _1910 = _1878 + (-1.0);
        _1896 = _1910;
    }
    float _1912 = _1896;
    float _1914 = _1912;
    if (_1826)
    {
        float _1916 = _1848 * _1900;
        _1560 = _1916;
    }
    float _1918 = _1560;
    if (!_1826)
    {
        _1902 = _1816;
    }
    float _1920 = _1902;
    float _1922 = _1920;
    if (_1826)
    {
        float _1924 = _1912 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1840 = _1924;
    }
    float _1926 = _1840;
    if (_1826)
    {
        float _1928 = _1814 * _1918;
        _1906 = _1928;
    }
    float _1930 = _1906;
    if (!_1826)
    {
        _1914 = _1818;
    }
    float _1932 = _1914;
    float _1934 = _1932;
    if (_1826)
    {
        float _1936 = _1816 * _1918;
        _1922 = _1936;
    }
    float _1938 = _1922;
    if (_1826)
    {
        float _1940 = fma(_1884, _1878, _1926);
        _1886 = _1940;
    }
    float _1942 = _1886;
    if (_1826)
    {
        float _1944 = _1930 * _1930;
        _1934 = _1944;
    }
    float _1946 = _1934;
    if (!_1826)
    {
        _1908 = _1820;
    }
    float _1948 = _1908;
    float _1950 = _1948;
    if (_1826)
    {
        float _1952 = _1938 * _1938;
        _1950 = _1952;
    }
    float _1954 = _1950;
    float _1956 = fma(_1942, _1942, _1946);
    float _1958 = _1784 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1960 = _1784 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1962 = _1956 + _1954;
    float _1964 = _1784 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1966 = fma(_1786, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1958);
    float _1968 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _1970 = fma(_1810, (*spvDescriptorSet0.vp_c15)._m0[23].w, _1968);
    float _1972 = precise::clamp(_1970, 0.0, 1.0);
    float _1974 = rsqrt(_1962);
    float _1976 = fma(_1786, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1964);
    float _1978 = fma(_1786, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1892);
    float _1980 = fma(_1788, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1966);
    float _1982 = -_1972;
    float _1984 = _1982 + 1.0;
    float _1986 = fma(_1788, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1976);
    float _1988 = fma(_1788, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1978);
    float _1990 = fma(_1786, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1960);
    float _1992 = _1980 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1994 = _1986 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1996 = _1988 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1998 = fma(_1788, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1990);
    float _2000 = abs(_1984);
    float _2002 = log2(_2000);
    float _2004 = _1994 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _2006 = fma(_1290, (*spvDescriptorSet0.vp_c15)._m0[652].x, (*spvDescriptorSet0.vp_c15)._m0[652].z);
    float _2008 = _1998 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _2010 = _1974 * _1930;
    float _2012 = fma(_1992, (*spvDescriptorSet0.vp_c8)._m0[7].x, _2004);
    float _2014 = _1974 * _1942;
    float _2016 = _1974 * _1938;
    float _2018 = floor(_2006);
    float _2020 = fma(_1996, (*spvDescriptorSet0.vp_c8)._m0[7].z, _2012);
    float _2022 = fma(_1310, (*spvDescriptorSet0.vp_c15)._m0[652].y, (*spvDescriptorSet0.vp_c15)._m0[652].w);
    float _2024 = fma(_2008, (*spvDescriptorSet0.vp_c8)._m0[7].w, _2020);
    float _2026 = _2010 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _2028 = floor(_2022);
    float _2030 = -_2026;
    float _2032 = fma(_2014, (*spvDescriptorSet0.vp_c15)._m0[21].y, _2030);
    float _2034 = _2002 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _2036 = -_2016;
    float _2038 = fma(_2036, (*spvDescriptorSet0.vp_c15)._m0[21].z, _2032);
    float _2040 = _1996 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _2042 = exp2(_2034);
    float _2044 = fma(_2038, -0.5, 0.5);
    float _2046 = fma(_2038, 0.5, 0.5);
    float _2048 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _2050 = -_2018;
    float _2052 = _2006 + _2050;
    float _2054 = -_2040;
    float _2056 = fma(_2054, _2048, 1.0);
    float _2058 = sqrt(_2044);
    float _2060 = fma(_2046, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _2062 = _1994 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _2064 = _1994 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _2066 = fma(_2046, _2060, -0.212114393711090087890625);
    float _2068 = fma(_1992, (*spvDescriptorSet0.vp_c8)._m0[4].x, _2062);
    float _2070 = fma(_1992, (*spvDescriptorSet0.vp_c8)._m0[5].x, _2064);
    float _2072 = 1.0 / _2024;
    float _2074 = -_2028;
    float _2076 = _2022 + _2074;
    float _2078 = fma(_1996, (*spvDescriptorSet0.vp_c8)._m0[4].z, _2068);
    float _2080 = fma(_1996, (*spvDescriptorSet0.vp_c8)._m0[5].z, _2070);
    float _2082 = _2014 + 1.0;
    float _2084 = fma(_2046, _2066, 1.570728778839111328125);
    float _2086 = fma(_2008, (*spvDescriptorSet0.vp_c8)._m0[4].w, _2078);
    float _2088 = fma(_2008, (*spvDescriptorSet0.vp_c8)._m0[5].w, _2080);
    float _2090 = log2(_2056);
    float _2092 = _2058 * 0.636619746685028076171875;
    float _2094 = -_2014;
    float _2096 = fma(_2042, _2082, _2094);
    float2 _5797 = float2(_2052, _2076);
    float _2098 = dm_bs(spvDescriptorSet0.vp_t_tcb_24.sample(spvDescriptorSet0.vp_t_tcb_24Smplr, select(_5797, float2(0.0), isnan(_5797)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_24, spvDescriptorSet0.vp_t_tcb_24Smplr_w, select(_5797, float2(0.0), isnan(_5797)), level(0.0)).x;
    float _2100 = -_2084;
    float _2102 = fma(_2092, _2100, 1.0);
    float _2104 = fma(_2096, 0.5, 0.5);
    float _2106 = _2086 * _2072;
    float _2108 = _2088 * _2072;
    float _2110 = fma(_2106, 0.5, 0.5);
    float _2112 = fma(_2108, -0.5, 0.5);
    float _2114 = _2090 * 0.693147182464599609375;
    float _2116 = _2114 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float3 _5832 = float3(_2110, _2112, _2116);
    float _2118 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_5832, float3(0.0), isnan(_5832)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_5832, float3(0.0), isnan(_5832)), level(0.0)).x;
    float3 _5843 = float3(_2110, _2112, _2116);
    float4 _2121 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_5843, float3(0.0), isnan(_5843)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_5843, float3(0.0), isnan(_5843)), level(0.0)).xyzw;
    float _2123 = _2121.x;
    float _2125 = _2121.y;
    float _2127 = _2121.z;
    float _2129 = _2121.w;
    float2 _5859 = float2(_2102, _2104);
    float3 _2133 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_5859, float2(0.0), isnan(_5859)), level(0.0)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_5859, float2(0.0), isnan(_5859)), level(0.0)).xyz;
    float _2135 = _2133.x;
    float _2137 = _2133.y;
    float _2139 = _2133.z;
    float _2141 = _1332 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _2143 = _1332 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _2145 = _1994 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    bool _2147 = _1810 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _2149 = isnan(_1810);
    bool _2151 = _2147 || _2149;
    bool _2153 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _2155 = _2151 || _2153;
    float _2157 = fma(_1290, (*spvDescriptorSet0.vp_c8)._m0[11].x, _2141);
    float _2159 = fma(_1290, (*spvDescriptorSet0.vp_c8)._m0[10].x, _2143);
    float _2161 = fma(_1992, (*spvDescriptorSet0.vp_c8)._m0[6].x, _2145);
    float _2163 = fma(_1310, (*spvDescriptorSet0.vp_c8)._m0[11].z, _2157);
    float _2165 = fma(_1310, (*spvDescriptorSet0.vp_c8)._m0[10].z, _2159);
    float _2167 = _2163 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _2169 = _2165 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _2171 = fma(_1996, (*spvDescriptorSet0.vp_c8)._m0[6].z, _2161);
    float _2173 = 1.0 / _2167;
    float _2175 = _2169 + _2167;
    float _2177 = in.m_81.x;
    float _2179 = fma(_2008, (*spvDescriptorSet0.vp_c8)._m0[6].w, _2171);
    float _2181 = _2175 * _2173;
    float _2183 = _2181 * 0.5;
    float _2185 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _2187 = fma(_2183, (*spvDescriptorSet0.vp_c8)._m0[30].w, _2185);
    float _2189 = _2002 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _2191 = 1.0 / _2187;
    float _2193 = exp2(_2189);
    float _2195 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _2197 = _2191 * _2195;
    float _2199 = abs(_2197);
    float _2201 = log2(_2199);
    float _2203 = -_2193;
    float _2205 = _2203 + 1.0;
    bool _2207 = _2197 <= 8000.0;
    bool _2209 = isnan(_2197);
    bool _2211 = _2207 || _2209;
    bool _2213 = isnan(8000.0);
    bool _2215 = _2211 || _2213;
    float _2217 = float(_2215);
    float _2219 = _2201 * (*spvDescriptorSet0.vp_c15)._m0[654].z;
    float _2221 = exp2(_2219);
    float _2223 = fma(_2221, (*spvDescriptorSet0.vp_c15)._m0[654].x, (*spvDescriptorSet0.vp_c15)._m0[654].y);
    float _2225 = precise::clamp(_2223, 0.0, 1.0);
    float _2227 = _2179 + _2024;
    float _2229 = fma(_2225, -2.0, 3.0);
    float _2231 = _2225 * _2225;
    float _2233 = _2227 * 0.5;
    float _2235 = _2231 * _2229;
    out.m_83.z = _2233;
    out.m_83.w = _2024;
    float _2237 = -_2235;
    float _2239 = _2237 + 1.0;
    float _2241 = fma(_2239, (*spvDescriptorSet0.vp_c15)._m0[654].w, _2235);
    float _2243 = _2205 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _2245 = _2217 * _2241;
    out.gl_Position.x = _2086;
    out.gl_Position.y = _2088;
    out.gl_Position.z = _2179;
    out.gl_Position.w = _2024;
    float _2247 = _2245 * (*spvDescriptorSet0.vp_c15)._m0[653].x;
    float _2249 = _2179;
    float _2251 = _2088;
    float _2253 = _2086;
    if (!_2155)
    {
        _2249 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _2255 = _2249;
    float _2257 = _2255;
    float _2259 = _2255;
    if (!_2155)
    {
        _2251 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _2261 = _2251;
    float _2263 = _2261;
    float _2265 = _2261;
    if (!_2155)
    {
        _2253 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _2267 = _2253;
    float _2269 = -_2098;
    float _2271 = _2269 + 1.0;
    float _2273 = _2271 * _2247;
    float _2275 = precise::clamp(_2273, 0.0, 1.0);
    float _2277 = -_2275;
    float _2279 = fma(_2277, (*spvDescriptorSet0.vp_c15)._m0[653].y, 1.0);
    float _2281 = _2279 * _2177;
    float _2283 = _2281 * (*spvDescriptorSet0.vp_c13)._m0[1].w;
    float _2285 = _2243 * _2118;
    float _2287 = -_2243;
    float _2289 = _2287 + 1.0;
    out.m_85.x = _2283;
    float _2291 = _2129 * _2285;
    float _2293 = _2139 * _2285;
    float _2295 = fma(_2135, _2291, _2123);
    float _2297 = fma(_2137, _2291, _2125);
    float _2299 = _2129 * _2289;
    float _2301 = fma(_2129, _2293, _2127);
    out.m_87.x = _2295;
    out.m_87.y = _2297;
    out.m_87.z = _2301;
    out.m_87.w = _2299;
    bool _2303 = !_2155;
    float _2305 = _2267;
    float _2307 = _2267;
    if (!_2303)
    {
        bool _2309 = _1810 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _2311 = isnan(_1810);
        bool _2313 = _2309 || _2311;
        bool _2315 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _2317 = _2313 || _2315;
        if (!_2317)
        {
            float _2319 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2321 = _1810 + _2319;
            float _2323 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2325 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _2323;
            float _2327 = 1.0 / _2325;
            float _2329 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _2331 = _2329 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _2333 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _2335 = _2333 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _2337 = _2321 * _2327;
            float _2339 = precise::clamp(_2337, 0.0, 1.0);
            float _2341 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _2343 = _2341 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _2345 = fma(_2339, _2335, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _2347 = fma(_2339, _2343, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _2349 = fma(_2339, _2331, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            _2265 = _2349;
            _2259 = _2347;
            _2307 = _2345;
            _2351 = true;
        }
        else
        {
            bool _2353 = _1810 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _2355 = isnan(_1810);
            bool _2357 = _2353 || _2355;
            bool _2359 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _2361 = _2357 || _2359;
            if (!_2361)
            {
                _2257 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _2363 = _2257;
            _2259 = _2363;
            if (!_2361)
            {
                _2263 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _2365 = _2263;
            _2265 = _2365;
            if (!_2361)
            {
                _2305 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _2367 = _2305;
            bool _2369 = !_2361;
            _2307 = _2367;
            if (!_2369)
            {
                bool _2371 = _1810 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _2373 = isnan(_1810);
                bool _2375 = _2371 || _2373;
                bool _2377 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _2379 = _2375 || _2377;
                if (!_2379)
                {
                    float _2381 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2383 = _1810 + _2381;
                    float _2385 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2387 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _2385;
                    float _2389 = 1.0 / _2387;
                    float _2391 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _2393 = _2391 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _2395 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _2397 = _2395 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _2399 = _2383 * _2389;
                    float _2401 = precise::clamp(_2399, 0.0, 1.0);
                    float _2403 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _2405 = _2403 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _2407 = fma(_2401, _2397, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _2409 = fma(_2401, _2405, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _2411 = fma(_2401, _2393, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    _2265 = _2411;
                    _2259 = _2409;
                    _2307 = _2407;
                    _2351 = true;
                }
                else
                {
                    _2265 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _2259 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _2307 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                }
            }
        }
    }
    _2351 = false;
    float _2413 = _2265;
    float _2415 = _2259;
    float _2417 = _2307;
    float _2419 = _2413 * 0.586610972881317138671875;
    bool _2421 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    out.m_89.x = 0.0;
    float _2423 = fma(_2415, 0.298911988735198974609375, _2419);
    float _2425 = fma(_2417, 0.114477999508380889892578125, _2423);
    float _2427 = -_2425;
    float _2429 = _2427 + _2415;
    float _2431 = -_2425;
    float _2433 = _2431 + _2413;
    float _2435 = -_2425;
    float _2437 = _2435 + _2417;
    float _2439 = (*spvDescriptorSet0.vp_c10)._m0[3].x * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _2441 = fma(_2429, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2425);
    float _2443 = fma(_2433, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2425);
    float _2445 = fma(_2437, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2425);
    out.m_51.x = _2439;
    out.m_91.x = _2441;
    out.m_91.y = _2443;
    out.m_91.z = _2445;
    if (!_2421)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_61.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_61.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_61.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_61.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_75.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_75.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_75.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_75.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_51.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_51.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_51.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_51.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_91.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_91.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_91.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_91.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_73.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_73.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_73.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_73.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_77.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_77.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_77.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_77.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_83.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_83.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_83.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_83.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_79.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_79.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_79.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_79.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_89.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_89.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_89.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_89.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_85.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_85.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_85.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_85.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_87.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_87.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_87.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_87.w)); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _2447 = -_1784;
    float _2449 = _2447 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
    float _2451 = -_1786;
    float _2453 = _2451 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
    float _2455 = -_1788;
    float _2457 = _2455 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
    float _2459 = _2449 * _2449;
    float _2461 = fma(_2453, _2453, _2459);
    float _2463 = fma(_2457, _2457, _2461);
    float _2465 = sqrt(_2463);
    float _2467 = rsqrt(_2463);
    float _2469 = -_2465;
    float _2471 = _2469 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _2473 = _2471 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
    float _2475 = precise::clamp(_2473, 0.0, 1.0);
    float _2477 = _2453 * _2467;
    float _2479 = _2449 * _2467;
    float _2481 = abs(_2475);
    float _2483 = log2(_2481);
    float _2485 = _2457 * _2467;
    float _2487 = _2477 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
    float _2489 = _1662 * _2479;
    float _2491 = -_2479;
    float _2493 = -_2487;
    float _2495 = fma(_2491, (*spvDescriptorSet0.vp_c15)._m0[656].y, _2493);
    float _2497 = fma(_1674, _2477, _2489);
    float _2499 = -_2485;
    float _2501 = fma(_2499, (*spvDescriptorSet0.vp_c15)._m0[656].z, _2495);
    float _2503 = fma(_1692, _2485, _2497);
    float _2505 = precise::clamp(_2503, 0.0, 1.0);
    float _2507 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
    float _2509 = _2501 + _2507;
    float _2511 = _2483 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
    float _2513 = _2509 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
    float _2515 = precise::clamp(_2513, 0.0, 1.0);
    float _2517 = exp2(_2511);
    float _2519 = _2517 * _2515;
    float _2521 = _2505 * _2519;
    float _2523 = _2521 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
    float _2525 = _2521 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
    float _2527 = _2521 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
    out.m_89.x = _2523;
    out.m_89.y = _2525;
    out.m_89.z = _2527;
    { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_61.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_61.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_61.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_61.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_75.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_75.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_75.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_75.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_51.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_51.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_51.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_51.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_91.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_91.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_91.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_91.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_73.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_73.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_73.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_73.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_77.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_77.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_77.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_77.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_83.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_83.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_83.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_83.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_79.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_79.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_79.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_79.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_89.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_89.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_89.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_89.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_85.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_85.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_85.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_85.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_87.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_87.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_87.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_87.w)); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
}

