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
    constant _16* vp_c7 [[id(4)]];
    constant _16* vp_c13 [[id(5)]];
    texture2d<float> vp_t_tcb_24 [[id(6)]];
    sampler vp_t_tcb_24Smplr [[id(7)]];
    sampler vp_t_tcb_24Smplr_w [[id(8)]];
    constant dm_border_t* dm_border [[id(9)]];
};

struct main0_out
{
    float4 m_65 [[user(locn0)]];
    float4 m_61 [[user(locn1)]];
    float4 m_44 [[user(locn2)]];
    float4 m_59 [[user(locn3)]];
    float4 m_75 [[user(locn4)]];
    float4 m_40 [[user(locn5)]];
    float4 m_57 [[user(locn6)]];
    float4 m_71 [[user(locn7)]];
    float4 m_63 [[user(locn8)]];
    float4 m_73 [[user(locn9)]];
    float4 m_69 [[user(locn10)]];
    float4 gl_Position [[position, invariant]];
    float gl_PointSize [[point_size]];
};

struct main0_in
{
    float4 m_67 [[attribute(0)]];
    float4 m_55 [[attribute(1)]];
    float4 m_49 [[attribute(2)]];
    float4 m_37 [[attribute(3)]];
    float4 m_42 [[attribute(4)]];
    float4 m_51 [[attribute(5)]];
    float4 m_53 [[attribute(6)]];
};

vertex main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], uint gl_VertexIndex [[vertex_id]])
{
    main0_out out = {};
    out.m_65 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_61 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_44 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_59 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_75 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_40 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_57 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_71 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_63 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_73 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_69 = float4(0.0, 0.0, 0.0, 1.0);
    bool _2326 = false;
    bool _312 = false;
    bool _216 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _89 = in.m_37.w;
    float _91 = trunc(_89);
    int _94 = int(_91);
    bool _98 = _94 >= 1;
    float _100 = 0.0;
    if (!_98)
    {
        _100 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _102 = _100;
    if (!_98)
    {
        out.m_40.x = 0.0;
    }
    int _104 = 0;
    if (!_98)
    {
        float _106 = _102 * 5.0;
        _104 = as_type<int>(_106);
    }
    int _108 = _104;
    int _110 = _108;
    if (!_98)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2610 = as_type<float>(_108);
        out.gl_Position.z = _2610;
    }
    if (!_98)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _112 = in.m_42.w;
    float _114 = float(_94);
    float _116 = 1.0 / _114;
    float _118 = -_112;
    float _120 = _118 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _122 = _112 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _124 = isnan(_112);
    bool _126 = _122 || _124;
    bool _128 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _130 = _126 || _128;
    float _132 = _120 * _116;
    bool _134 = _120 >= _114;
    bool _136 = !_130;
    bool _138 = _134 || _136;
    out.m_44.x = _132;
    float _140 = _112;
    float _142 = _132;
    float _144 = _120;
    if (_138)
    {
        _140 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _146 = _140;
    if (_138)
    {
        out.m_40.x = 0.0;
    }
    if (_138)
    {
        float _148 = _146 * 5.0;
        _110 = as_type<int>(_148);
    }
    int _150 = _110;
    if (_138)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2683 = as_type<float>(_150);
        out.gl_Position.z = _2683;
    }
    if (_138)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _152 = as_type<float>(int(gl_VertexIndex));
    float _154 = in.m_49.x;
    float _156 = in.m_49.y;
    float _158 = in.m_49.z;
    int _160 = as_type<int>(_152) & 1;
    bool _162 = _160 != 0;
    int _164 = as_type<int>(_152) & 2;
    bool _166 = _164 != 0;
    bool _168 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _170 = _156 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _172 = _156 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _174 = _156 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    bool _176 = !_162;
    float _178 = _176 ? (-0.5) : 0.5;
    float _180 = fma(_154, (*spvDescriptorSet0.vp_c10)._m0[4].x, _170);
    float _182 = fma(_154, (*spvDescriptorSet0.vp_c10)._m0[5].x, _172);
    float _184 = fma(_154, (*spvDescriptorSet0.vp_c10)._m0[6].x, _174);
    bool _186 = !_166;
    float _188 = _186 ? (-0.5) : 0.5;
    float _190 = fma(_158, (*spvDescriptorSet0.vp_c10)._m0[4].z, _180);
    float _192 = fma(_158, (*spvDescriptorSet0.vp_c10)._m0[5].z, _182);
    float _194 = fma(_158, (*spvDescriptorSet0.vp_c10)._m0[6].z, _184);
    bool _196 = !_168;
    float _214;
    if (!_196)
    {
        float _198 = in.m_51.x;
        float _200 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _202 = _198 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _204 = fma(_202, (*spvDescriptorSet0.vp_c9)._m0[12].x, _120);
        float _206 = _204 * _200;
        float _208 = floor(_206);
        float _210 = -_208;
        float _212 = _206 + _210;
        _214 = _212;
        _216 = true;
    }
    else
    {
        _214 = _132;
    }
    _216 = false;
    float _218 = _214;
    float _220 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _222 = _218 + _220;
    bool _224 = _218 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _226 = isnan(_218);
    bool _228 = _224 || _226;
    bool _230 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _232 = _228 || _230;
    float _234 = float(_232);
    float _236 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _238 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _236;
    float _240 = -_234;
    float _242 = _240 + 1.0;
    bool _244 = _218 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _246 = isnan(_218);
    bool _248 = _244 || _246;
    bool _250 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _252 = _248 || _250;
    float _254 = float(_252);
    float _256 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _258 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _256;
    bool _260 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _262 = 1.0 / _238;
    float _264 = _254 * _242;
    float _266 = -_254;
    float _268 = _266 + 1.0;
    float _270 = _222 * _262;
    float _272 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _274 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _272;
    float _276 = fma(_258, _270, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _278 = fma(_274, _270, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _280 = _276 * _264;
    float _282 = _278 * _264;
    float _284 = fma(_268, (*spvDescriptorSet0.vp_c9)._m0[143].x, _280);
    float _286 = fma(_268, (*spvDescriptorSet0.vp_c9)._m0[143].y, _282);
    float _288 = fma(_234, (*spvDescriptorSet0.vp_c9)._m0[144].x, _284);
    float _290 = fma(_234, (*spvDescriptorSet0.vp_c9)._m0[144].y, _286);
    bool _292 = !_260;
    float _310;
    if (!_292)
    {
        float _294 = in.m_51.x;
        float _296 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _298 = _294 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _300 = fma(_298, (*spvDescriptorSet0.vp_c9)._m0[11].y, _120);
        float _302 = _300 * _296;
        float _304 = floor(_302);
        float _306 = -_304;
        float _308 = _302 + _306;
        _310 = _308;
        _312 = true;
    }
    else
    {
        _310 = _132;
    }
    _312 = false;
    float _314 = _310;
    float _316 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _318 = _314 + _316;
    float _320 = in.m_53.x;
    float _322 = in.m_53.y;
    float _324 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _326 = _324 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _328 = _314 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _330 = isnan(_314);
    bool _332 = _328 || _330;
    bool _334 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _336 = _332 || _334;
    float _338 = float(_336);
    float _340 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _342 = _340 + (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _344 = _314 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _346 = isnan(_314);
    bool _348 = _344 || _346;
    bool _350 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _352 = _348 || _350;
    float _354 = float(_352);
    float _356 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _358 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _356;
    bool _360 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].w;
    float _362 = 1.0 / _326;
    float _364 = -_338;
    float _366 = _364 + 1.0;
    float _368 = _354 * _366;
    float _370 = -_354;
    float _372 = _370 + 1.0;
    float _374 = 1.0 / _342;
    float _376 = _358 * _362;
    float _378 = -(*spvDescriptorSet0.vp_c9)._m0[116].x;
    float _380 = _378 + (*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _382 = _290 * _322;
    float _384 = _288 * _320;
    float _386 = fma(_376, _318, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    bool _388 = _314 >= (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _390 = isnan(_314);
    bool _392 = _388 || _390;
    bool _394 = isnan((*spvDescriptorSet0.vp_c9)._m0[117].w);
    bool _396 = _392 || _394;
    float _398 = float(_396);
    float _400 = _380 * _374;
    float _402 = _386 * _368;
    float _404 = -_398;
    float _406 = _404 + 1.0;
    float _408 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _410 = _314 + _408;
    float _412 = fma(_372, (*spvDescriptorSet0.vp_c9)._m0[115].x, _402);
    float _414 = _338 * _406;
    float _416 = fma(_400, _410, (*spvDescriptorSet0.vp_c9)._m0[116].x);
    float _418 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _420 = fma(_416, _414, _412);
    float _422 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _424 = _418 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _426 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _428 = fma(_398, (*spvDescriptorSet0.vp_c9)._m0[117].x, _420);
    float _430 = _422 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _432 = _426 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _434 = _428 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    bool _436 = !_360;
    if (!_436)
    {
        float _438 = in.m_51.x;
        float _440 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].w;
        float _442 = _438 * (*spvDescriptorSet0.vp_c9)._m0[13].x;
        float _444 = fma(_442, (*spvDescriptorSet0.vp_c9)._m0[11].w, _120);
        float _446 = _444 * _440;
        float _448 = floor(_446);
        float _450 = -_448;
        float _452 = _446 + _450;
        _142 = _452;
    }
    float _454 = _142;
    float _456 = in.m_37.x;
    float _458 = in.m_37.y;
    float _460 = in.m_37.z;
    float _462 = _458 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _464 = _458 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _466 = _458 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _468 = fma(_456, (*spvDescriptorSet0.vp_c10)._m0[5].x, _462);
    float _470 = fma(_456, (*spvDescriptorSet0.vp_c10)._m0[4].x, _464);
    float _472 = fma(_456, (*spvDescriptorSet0.vp_c10)._m0[6].x, _466);
    float _474 = fma(_460, (*spvDescriptorSet0.vp_c10)._m0[5].z, _468);
    float _476 = fma(_460, (*spvDescriptorSet0.vp_c10)._m0[4].z, _470);
    float _478 = fma(_460, (*spvDescriptorSet0.vp_c10)._m0[6].z, _472);
    float _480 = _474 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _482 = _476 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _484 = _478 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _486 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _488 = _480 + _486;
    float _490 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _492 = _482 + _490;
    float _494 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _496 = _484 + _494;
    float _498 = _488 * _488;
    float _500 = fma(_492, _492, _498);
    float _502 = fma(_496, _496, _500);
    float _504 = rsqrt(_502);
    float _506 = _492 * _504;
    float _508 = _496 * _504;
    float _510 = -_506;
    float _512 = fma(_510, (*spvDescriptorSet0.vp_c9)._m0[18].w, _482);
    float _514 = -_508;
    float _516 = fma(_514, (*spvDescriptorSet0.vp_c9)._m0[18].w, _484);
    float _518 = fma(_512, (*spvDescriptorSet0.vp_c15)._m0[652].x, (*spvDescriptorSet0.vp_c15)._m0[652].z);
    float _520 = fma(_516, (*spvDescriptorSet0.vp_c15)._m0[652].y, (*spvDescriptorSet0.vp_c15)._m0[652].w);
    float _522 = floor(_518);
    float _524 = floor(_520);
    float _526 = -_522;
    float _528 = _518 + _526;
    float _530 = -_524;
    float _532 = _520 + _530;
    float2 _3325 = float2(_528, _532);
    float _534 = dm_bs(spvDescriptorSet0.vp_t_tcb_24.sample(spvDescriptorSet0.vp_t_tcb_24Smplr, select(_3325, float2(0.0), isnan(_3325)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_24, spvDescriptorSet0.vp_t_tcb_24Smplr_w, select(_3325, float2(0.0), isnan(_3325)), level(0.0)).x;
    float _536 = in.m_51.x;
    float _538 = in.m_51.y;
    float _540 = in.m_51.z;
    float _542 = in.m_51.w;
    float _544 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    int _546 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _548 = _546 != 0;
    int _550 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _552 = _550 != 0;
    int _554 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _556 = _554 != 0;
    float _558 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _560 = log2(_558);
    int _562 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _564 = _562 != 0;
    float _566 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    float _568 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _570 = _536 * 2.0;
    bool _572 = _536 > 0.5;
    bool _574 = _542 > 0.5;
    float _576 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _578 = _576 + (*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _580 = -_178;
    int _582 = _572 ? as_type<int>(_580) : as_type<int>(_178);
    float _584 = _538 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    int _586 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 16;
    bool _588 = _586 != 0;
    int _590 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 32;
    bool _592 = _590 != 0;
    float _594 = _540 * 2.0;
    float _596 = 1.0 / _578;
    bool _598 = !_548;
    float _600 = _598 ? _178 : as_type<float>(_582);
    float _602 = fma(_584, -2.0, _568);
    bool _604 = _538 > 0.5;
    float _606 = (*spvDescriptorSet0.vp_c9)._m0[83].z + (*spvDescriptorSet0.vp_c9)._m0[83].x;
    float _608 = fma(_120, (*spvDescriptorSet0.vp_c9)._m0[76].y, _602);
    float _610 = -_188;
    int _612 = _604 ? as_type<int>(_610) : as_type<int>(_188);
    float _614 = floor(_594);
    float _616 = _536 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    bool _618 = !_552;
    float _620 = _618 ? _188 : as_type<float>(_612);
    float _622 = -_566;
    float _624 = fma(_616, 2.0, _622);
    int _626 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _628 = _626 != 0;
    float _630 = -(*spvDescriptorSet0.vp_c9)._m0[131].x;
    float _632 = (*spvDescriptorSet0.vp_c9)._m0[132].x + _630;
    float _634 = _538 * 2.0;
    float _636 = -_178;
    int _638 = _604 ? as_type<int>(_636) : as_type<int>(_178);
    float _640 = _540 + _536;
    bool _642 = _540 > 0.5;
    float _644 = _632 * _596;
    float _646 = floor(_634);
    float _648 = _640 + (-1.0);
    float _650 = -_178;
    int _652 = _642 ? as_type<int>(_650) : as_type<int>(_178);
    float _654 = _538 + _540;
    float _656 = -_188;
    int _658 = _642 ? as_type<int>(_656) : as_type<int>(_188);
    float _660 = fma(_648, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    bool _662 = _614 >= 0.0;
    bool _664 = isnan(_614);
    bool _666 = _662 || _664;
    bool _668 = isnan(0.0);
    bool _670 = _666 || _668;
    float _672 = _654 + (-1.0);
    float _674 = floor(_570);
    float _676 = _648;
    float _678 = _544;
    if (!_628)
    {
        _676 = _540;
    }
    float _680 = _676;
    int _682 = _670 ? 0 : 1;
    float _684 = fma(_672, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    bool _686 = _614 > 0.0;
    float _688 = _538 + _536;
    int _690 = ~_682;
    int _692 = _690 + 1;
    int _694 = _692 + 1;
    float _696 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    bool _698 = !_588;
    float _700 = _698 ? _178 : as_type<float>(_638);
    float _702 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _704 = _454 + _702;
    bool _706 = _646 > 0.0;
    float _708 = _688 + (-1.0);
    float _710 = _680;
    int _712 = _694;
    if (_628)
    {
        _710 = _538;
    }
    float _714 = _710;
    float _716 = fma(_644, _704, (*spvDescriptorSet0.vp_c9)._m0[131].x);
    bool _718 = !_592;
    float _720 = _718 ? _188 : as_type<float>(_658);
    float _722 = fma(_708, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    bool _724 = _674 >= 0.0;
    bool _726 = isnan(_674);
    bool _728 = _724 || _726;
    bool _730 = isnan(0.0);
    bool _732 = _728 || _730;
    float _734 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    float _736 = _674;
    if (!_686)
    {
        int _738 = ~_682;
        int _740 = _738 + 1;
        _712 = _740;
    }
    int _742 = _712;
    bool _744 = _646 >= 0.0;
    bool _746 = isnan(_646);
    bool _748 = _744 || _746;
    bool _750 = isnan(0.0);
    bool _752 = _748 || _750;
    float _754 = _696 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _756 = _620 + (-0.5);
    float _758 = (*spvDescriptorSet0.vp_c9)._m0[83].w + (*spvDescriptorSet0.vp_c9)._m0[83].y;
    int _760 = _752 ? 0 : 1;
    bool _762 = _674 > 0.0;
    float _764 = fma(_714, (*spvDescriptorSet0.vp_c9)._m0[83].w, _758);
    float _766 = -_120;
    float _768 = fma(_766, (*spvDescriptorSet0.vp_c9)._m0[76].x, _624);
    float _770 = _544 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _772 = _600 + 0.5;
    int _774 = ~_760;
    int _776 = _774 + 1;
    int _778 = _776 + 1;
    float _780 = -_754;
    float _782 = -_608;
    float _784 = fma(_780, _756, _782);
    int _786 = _778;
    if (!_706)
    {
        int _788 = ~_760;
        int _790 = _788 + 1;
        _786 = _790;
    }
    int _792 = _786;
    float _794 = fma(_770, _772, _768);
    float _796 = _560 * _120;
    if (!_628)
    {
        _678 = _538;
    }
    float _798 = _678;
    float _800 = _734 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    float _802 = _798;
    if (!_628)
    {
        _736 = _540;
    }
    float _804 = _736;
    float _806 = _804;
    if (_628)
    {
        _802 = _536;
    }
    float _808 = _802;
    float _810 = exp2(_796);
    if (_628)
    {
        _806 = _538;
    }
    float _812 = _806;
    int _814 = _732 ? 0 : 1;
    float _816 = _808 * (*spvDescriptorSet0.vp_c9)._m0[82].x;
    int _818 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _820 = _818 != 0;
    int _822 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _824 = _822 != 0;
    int _826 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _828 = _826 != 0;
    float _830 = fma(_808, (*spvDescriptorSet0.vp_c9)._m0[83].z, _606);
    bool _832 = _454 >= (*spvDescriptorSet0.vp_c9)._m0[131].w;
    bool _834 = isnan(_454);
    bool _836 = _832 || _834;
    bool _838 = isnan((*spvDescriptorSet0.vp_c9)._m0[131].w);
    bool _840 = _836 || _838;
    float _842 = float(_840);
    float _844 = _812 * (*spvDescriptorSet0.vp_c9)._m0[82].y;
    bool _846 = _454 >= (*spvDescriptorSet0.vp_c9)._m0[132].w;
    bool _848 = isnan(_454);
    bool _850 = _846 || _848;
    bool _852 = isnan((*spvDescriptorSet0.vp_c9)._m0[132].w);
    bool _854 = _850 || _852;
    float _856 = float(_854);
    float _858 = -_856;
    float _860 = _858 + 1.0;
    float _862 = (*spvDescriptorSet0.vp_c9)._m0[82].x + (*spvDescriptorSet0.vp_c9)._m0[81].z;
    float _864 = _842 * _860;
    float _866 = -(*spvDescriptorSet0.vp_c9)._m0[167].w;
    float _868 = (*spvDescriptorSet0.vp_c9)._m0[168].w + _866;
    float _870 = -_862;
    float _872 = fma(_816, 2.0, _870);
    float _874 = -(*spvDescriptorSet0.vp_c9)._m0[168].w;
    float _876 = _874 + (*spvDescriptorSet0.vp_c9)._m0[169].w;
    float _878 = _716 * _864;
    float _880 = -_842;
    float _882 = _880 + 1.0;
    float _884 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _886 = 1.0 + _884;
    float _888 = (*spvDescriptorSet0.vp_c9)._m0[82].y + (*spvDescriptorSet0.vp_c9)._m0[81].w;
    float _890 = fma(_882, (*spvDescriptorSet0.vp_c9)._m0[131].x, _878);
    float _892 = -_810;
    float _894 = _892 + 1.0;
    int _896 = ~_814;
    int _898 = _896 + 1;
    int _900 = _898 + 1;
    float _902 = fma(_844, -2.0, _888);
    int _904 = _900;
    if (!_762)
    {
        int _906 = ~_814;
        int _908 = _906 + 1;
        _904 = _908;
    }
    int _910 = _904;
    float _912 = 1.0 / _868;
    bool _914 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _916 = isnan(0.0);
    bool _918 = _914 || _916;
    bool _920 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _922 = _918 || _920;
    float _924 = -(*spvDescriptorSet0.vp_c9)._m0[171].w;
    float _926 = (*spvDescriptorSet0.vp_c9)._m0[172].w + _924;
    float _928 = -_120;
    float _930 = fma(_928, (*spvDescriptorSet0.vp_c9)._m0[81].x, _872);
    bool _932 = !_564;
    float _934 = _932 ? _178 : as_type<float>(_652);
    float _936 = 1.0 / _876;
    float _938 = -(*spvDescriptorSet0.vp_c9)._m0[169].w;
    float _940 = (*spvDescriptorSet0.vp_c9)._m0[170].w + _938;
    bool _942 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[14].y;
    float _944 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    float _946 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    float _948 = fma(_120, (*spvDescriptorSet0.vp_c9)._m0[82].z, _830);
    bool _950 = !_828;
    int _952 = _950 ? 0 : 1;
    float _954 = fma(_536, (*spvDescriptorSet0.vp_c9)._m0[78].z, _944);
    float _956 = 1.0 / _886;
    float _958 = -(*spvDescriptorSet0.vp_c9)._m0[170].w;
    float _960 = _958 + (*spvDescriptorSet0.vp_c9)._m0[171].w;
    float _962 = _922 ? _894 : 0.0;
    float _964 = _934 + 0.5;
    bool _966 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _968 = isnan(1.0);
    bool _970 = _966 || _968;
    bool _972 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _974 = _970 || _972;
    float _976 = fma(_538, (*spvDescriptorSet0.vp_c9)._m0[78].w, _946);
    float _978 = fma(_800, _964, _930);
    float _980 = 1.0 / _940;
    float _982 = fma(_120, (*spvDescriptorSet0.vp_c9)._m0[77].z, _954);
    float _984 = fma(_120, (*spvDescriptorSet0.vp_c9)._m0[82].w, _764);
    float _986 = fma(_120, (*spvDescriptorSet0.vp_c9)._m0[77].w, _976);
    float _988 = fma(_120, (*spvDescriptorSet0.vp_c9)._m0[81].y, _902);
    float _990 = _538 + (-0.5);
    float _992 = -(*spvDescriptorSet0.vp_c9)._m0[172].w;
    float _994 = _992 + (*spvDescriptorSet0.vp_c9)._m0[173].w;
    float _996 = _536 + (-0.5);
    float _998 = 1.0 / _960;
    float _1000 = _956;
    if (_974)
    {
        float _1002 = _962 * _956;
        _144 = _1002;
    }
    float _1004 = _144;
    float _1006 = _540 + (-0.5);
    if (!_942)
    {
        _1000 = (*spvDescriptorSet0.vp_c7)._m0[0].x;
    }
    float _1008 = _1000;
    bool _1010 = !_820;
    int _1012 = _1010 ? 0 : 1;
    bool _1014 = !_824;
    int _1016 = _1014 ? 0 : 1;
    float _1018 = 1.0 / _926;
    bool _1020 = !_942;
    float _1022 = _1008;
    if (!_1020)
    {
        float _1024 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[14].y;
        float _1026 = _536 * (*spvDescriptorSet0.vp_c9)._m0[15].y;
        float _1028 = fma(_1026, (*spvDescriptorSet0.vp_c9)._m0[14].y, (*spvDescriptorSet0.vp_c7)._m0[0].x);
        float _1030 = _1028 * _1024;
        float _1032 = floor(_1030);
        float _1034 = -_1032;
        float _1036 = _1030 + _1034;
        _1022 = _1036;
    }
    float _1038 = _1022;
    int _1040 = abs(_1012);
    float _1042 = 1.0 / _994;
    int _1044 = abs(_1016);
    float _1046 = -_506;
    float _1048 = fma(_1046, (*spvDescriptorSet0.vp_c9)._m0[18].w, _492);
    float _1050 = float(_742);
    float _1052 = -_508;
    float _1054 = fma(_1052, (*spvDescriptorSet0.vp_c9)._m0[18].w, _496);
    int _1056 = abs(_952);
    float _1058 = -(*spvDescriptorSet0.vp_c9)._m0[171].w;
    float _1060 = _1038 + _1058;
    float _1062 = float(_1040);
    float _1064 = -(*spvDescriptorSet0.vp_c9)._m0[167].w;
    float _1066 = _1038 + _1064;
    float _1068 = float(_792);
    float _1070 = -(*spvDescriptorSet0.vp_c9)._m0[170].w;
    float _1072 = _1038 + _1070;
    float _1074 = float(_1056);
    float _1076 = _1066 * _912;
    float _1078 = -(*spvDescriptorSet0.vp_c9)._m0[169].w;
    float _1080 = _1038 + _1078;
    float _1082 = _1062 * _1050;
    float _1084 = _1074 * _1068;
    float _1086 = _1080 * _980;
    float _1088 = -(*spvDescriptorSet0.vp_c9)._m0[168].w;
    float _1090 = _1038 + _1088;
    float _1092 = _1072 * _998;
    float _1094 = -(*spvDescriptorSet0.vp_c9)._m0[167].x;
    float _1096 = (*spvDescriptorSet0.vp_c9)._m0[168].x + _1094;
    float _1098 = float(_910);
    float _1100 = -(*spvDescriptorSet0.vp_c9)._m0[172].w;
    float _1102 = _1038 + _1100;
    float _1104 = float(_1044);
    float _1106 = _1090 * _936;
    float _1108 = fma(_1096, _1076, (*spvDescriptorSet0.vp_c9)._m0[167].x);
    float _1110 = _1102 * _1042;
    float _1112 = _1060 * _1018;
    float _1114 = _1104 * _1098;
    float _1116 = in.m_55.x;
    float _1118 = in.m_55.y;
    float _1120 = in.m_55.z;
    float _1122 = _1084 * (-2.0);
    float _1124 = _1114 * (-2.0);
    float _1126 = -(*spvDescriptorSet0.vp_c9)._m0[167].z;
    float _1128 = (*spvDescriptorSet0.vp_c9)._m0[168].z + _1126;
    float _1130 = -(*spvDescriptorSet0.vp_c9)._m0[170].y;
    float _1132 = _1130 + (*spvDescriptorSet0.vp_c9)._m0[171].y;
    float _1134 = fma(_684, _1124, _684);
    float _1136 = fma(_1128, _1076, (*spvDescriptorSet0.vp_c9)._m0[167].z);
    float _1138 = -(*spvDescriptorSet0.vp_c9)._m0[169].y;
    float _1140 = (*spvDescriptorSet0.vp_c9)._m0[170].y + _1138;
    float _1142 = _1082 * (-2.0);
    float _1144 = _488 * _504;
    float _1146 = -(*spvDescriptorSet0.vp_c9)._m0[173].w;
    float _1148 = (*spvDescriptorSet0.vp_c9)._m0[174].w + _1146;
    float _1150 = -(*spvDescriptorSet0.vp_c9)._m0[167].y;
    float _1152 = (*spvDescriptorSet0.vp_c9)._m0[168].y + _1150;
    float _1154 = -_1144;
    float _1156 = fma(_1154, (*spvDescriptorSet0.vp_c9)._m0[18].w, _488);
    float _1158 = 1.0 / _1148;
    float _1160 = fma(_722, _1142, _722);
    float _1162 = -(*spvDescriptorSet0.vp_c9)._m0[170].z;
    float _1164 = _1162 + (*spvDescriptorSet0.vp_c9)._m0[171].z;
    float _1166 = _1156 * _1156;
    float _1168 = fma(_1152, _1076, (*spvDescriptorSet0.vp_c9)._m0[167].y);
    float _1170 = fma(_1124, _1118, _1118);
    float _1172 = fma(_660, _1122, _660);
    float _1174 = fma(_1048, _1048, _1166);
    bool _1176 = _1038 >= (*spvDescriptorSet0.vp_c9)._m0[172].w;
    bool _1178 = isnan(_1038);
    bool _1180 = _1176 || _1178;
    bool _1182 = isnan((*spvDescriptorSet0.vp_c9)._m0[172].w);
    bool _1184 = _1180 || _1182;
    float _1186 = float(_1184);
    float _1188 = fma(_1122, _1120, _1120);
    float _1190 = fma(_990, (*spvDescriptorSet0.vp_c9)._m0[196].y, _1170);
    float _1192 = fma(_1054, _1054, _1174);
    bool _1194 = _1038 >= (*spvDescriptorSet0.vp_c9)._m0[171].w;
    bool _1196 = isnan(_1038);
    bool _1198 = _1194 || _1196;
    bool _1200 = isnan((*spvDescriptorSet0.vp_c9)._m0[171].w);
    bool _1202 = _1198 || _1200;
    float _1204 = float(_1202);
    float _1206 = -(*spvDescriptorSet0.vp_c9)._m0[168].x;
    float _1208 = _1206 + (*spvDescriptorSet0.vp_c9)._m0[169].x;
    float _1210 = -_1186;
    float _1212 = _1210 + 1.0;
    float _1214 = -(*spvDescriptorSet0.vp_c9)._m0[168].y;
    float _1216 = _1214 + (*spvDescriptorSet0.vp_c9)._m0[169].y;
    float _1218 = -(*spvDescriptorSet0.vp_c9)._m0[169].z;
    float _1220 = (*spvDescriptorSet0.vp_c9)._m0[170].z + _1218;
    float _1222 = fma(_1006, (*spvDescriptorSet0.vp_c9)._m0[196].z, _1188);
    float _1224 = fma(_1142, _1116, _1116);
    float _1226 = fma(_1134, _1004, _1190);
    bool _1228 = _1038 >= (*spvDescriptorSet0.vp_c9)._m0[170].w;
    bool _1230 = isnan(_1038);
    bool _1232 = _1228 || _1230;
    bool _1234 = isnan((*spvDescriptorSet0.vp_c9)._m0[170].w);
    bool _1236 = _1232 || _1234;
    float _1238 = float(_1236);
    float _1240 = _1204 * _1212;
    float _1242 = -_1204;
    float _1244 = _1242 + 1.0;
    bool _1246 = _1038 >= (*spvDescriptorSet0.vp_c9)._m0[169].w;
    bool _1248 = isnan(_1038);
    bool _1250 = _1246 || _1248;
    bool _1252 = isnan((*spvDescriptorSet0.vp_c9)._m0[169].w);
    bool _1254 = _1250 || _1252;
    float _1256 = float(_1254);
    float _1258 = _1226 * 0.15915493667125701904296875;
    float _1260 = fma(_996, (*spvDescriptorSet0.vp_c9)._m0[196].x, _1224);
    float _1262 = _1238 * _1244;
    bool _1264 = _1038 >= (*spvDescriptorSet0.vp_c9)._m0[168].w;
    bool _1266 = isnan(_1038);
    bool _1268 = _1264 || _1266;
    bool _1270 = isnan((*spvDescriptorSet0.vp_c9)._m0[168].w);
    bool _1272 = _1268 || _1270;
    float _1274 = float(_1272);
    float _1276 = -_1256;
    float _1278 = _1276 + 1.0;
    float _1280 = sqrt(_1192);
    float _1282 = fma(_1160, _1004, _1260);
    bool _1284 = _1038 >= (*spvDescriptorSet0.vp_c9)._m0[167].w;
    bool _1286 = isnan(_1038);
    bool _1288 = _1284 || _1286;
    bool _1290 = isnan((*spvDescriptorSet0.vp_c9)._m0[167].w);
    bool _1292 = _1288 || _1290;
    float _1294 = float(_1292);
    float _1296 = -(*spvDescriptorSet0.vp_c9)._m0[173].w;
    float _1298 = _1038 + _1296;
    float _1300 = -(*spvDescriptorSet0.vp_c9)._m0[168].z;
    float _1302 = _1300 + (*spvDescriptorSet0.vp_c9)._m0[169].z;
    float _1304 = -(*spvDescriptorSet0.vp_c9)._m0[169].x;
    float _1306 = (*spvDescriptorSet0.vp_c9)._m0[170].x + _1304;
    float _1308 = fma(_1216, _1106, (*spvDescriptorSet0.vp_c9)._m0[168].y);
    float _1310 = _1298 * _1158;
    float _1312 = -_1238;
    float _1314 = _1312 + 1.0;
    float _1316 = _1274 * _1278;
    float _1318 = -_1274;
    float _1320 = _1318 + 1.0;
    float _1322 = fma(_1208, _1106, (*spvDescriptorSet0.vp_c9)._m0[168].x);
    float _1324 = fma(_1302, _1106, (*spvDescriptorSet0.vp_c9)._m0[168].z);
    float _1326 = fma(_1306, _1086, (*spvDescriptorSet0.vp_c9)._m0[169].x);
    float _1328 = _1294 * _1320;
    float _1330 = -_1294;
    float _1332 = _1330 + 1.0;
    float _1334 = _1282 * 0.15915493667125701904296875;
    float _1336 = fma(_1140, _1086, (*spvDescriptorSet0.vp_c9)._m0[169].y);
    float _1338 = _1168 * _1328;
    float _1340 = _1256 * _1314;
    float _1342 = fma(_1172, _1004, _1222);
    float _1344 = fma(_1220, _1086, (*spvDescriptorSet0.vp_c9)._m0[169].z);
    float _1346 = fma(_1332, (*spvDescriptorSet0.vp_c9)._m0[167].y, _1338);
    float _1348 = _1108 * _1328;
    float _1350 = fma(_1132, _1092, (*spvDescriptorSet0.vp_c9)._m0[170].y);
    bool _1352 = _1038 >= (*spvDescriptorSet0.vp_c9)._m0[173].w;
    bool _1354 = isnan(_1038);
    bool _1356 = _1352 || _1354;
    bool _1358 = isnan((*spvDescriptorSet0.vp_c9)._m0[173].w);
    bool _1360 = _1356 || _1358;
    float _1362 = float(_1360);
    float _1364 = fma(_1308, _1316, _1346);
    bool _1366 = _1038 >= (*spvDescriptorSet0.vp_c9)._m0[174].w;
    bool _1368 = isnan(_1038);
    bool _1370 = _1366 || _1368;
    bool _1372 = isnan((*spvDescriptorSet0.vp_c9)._m0[174].w);
    bool _1374 = _1370 || _1372;
    float _1376 = float(_1374);
    float _1378 = _1342 * 0.15915493667125701904296875;
    float _1380 = _1334 * 6.283185482025146484375;
    float _1382 = sin(_1380);
    float _1384 = fma(_1336, _1340, _1364);
    float _1386 = fma(_1332, (*spvDescriptorSet0.vp_c9)._m0[167].x, _1348);
    float _1388 = _1136 * _1328;
    float _1390 = -(*spvDescriptorSet0.vp_c9)._m0[170].x;
    float _1392 = _1390 + (*spvDescriptorSet0.vp_c9)._m0[171].x;
    float _1394 = fma(_1350, _1262, _1384);
    float _1396 = fma(_1322, _1316, _1386);
    float _1398 = fma(_1332, (*spvDescriptorSet0.vp_c9)._m0[167].z, _1388);
    float _1400 = _1258 * 6.283185482025146484375;
    float _1402 = sin(_1400);
    float _1404 = fma(_1392, _1092, (*spvDescriptorSet0.vp_c9)._m0[170].x);
    float _1406 = fma(_1326, _1340, _1396);
    float _1408 = fma(_1324, _1316, _1398);
    float _1410 = fma(_1404, _1262, _1406);
    float _1412 = _504 * _1280;
    float _1414 = _1258 * 6.283185482025146484375;
    float _1416 = cos(_1414);
    float _1418 = -(*spvDescriptorSet0.vp_c9)._m0[171].x;
    float _1420 = (*spvDescriptorSet0.vp_c9)._m0[172].x + _1418;
    float _1422 = -(*spvDescriptorSet0.vp_c9)._m0[171].y;
    float _1424 = (*spvDescriptorSet0.vp_c9)._m0[172].y + _1422;
    float _1426 = _384 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _1428 = -_1362;
    float _1430 = _1428 + 1.0;
    float _1432 = fma(_1420, _1112, (*spvDescriptorSet0.vp_c9)._m0[171].x);
    float _1434 = fma(_1424, _1112, (*spvDescriptorSet0.vp_c9)._m0[171].y);
    float _1436 = -(*spvDescriptorSet0.vp_c9)._m0[172].x;
    float _1438 = _1436 + (*spvDescriptorSet0.vp_c9)._m0[173].x;
    float _1440 = _1334 * 6.283185482025146484375;
    float _1442 = cos(_1440);
    float _1444 = _1382 * _1402;
    float _1446 = _1426 * _1412;
    float _1448 = _1186 * _1430;
    float _1450 = -_1376;
    float _1452 = _1450 + 1.0;
    float _1454 = fma(_1438, _1110, (*spvDescriptorSet0.vp_c9)._m0[172].x);
    float _1456 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _188);
    float _1458 = fma(_1164, _1092, (*spvDescriptorSet0.vp_c9)._m0[170].z);
    float _1460 = _1378 * 6.283185482025146484375;
    float _1462 = cos(_1460);
    float _1464 = _1382 * _1416;
    float _1466 = _1362 * _1452;
    float _1468 = fma(_1344, _1340, _1408);
    float _1470 = fma(_856, (*spvDescriptorSet0.vp_c9)._m0[132].x, _890);
    float _1472 = -(*spvDescriptorSet0.vp_c10)._m0[9].w;
    float _1474 = _480 + _1472;
    float _1476 = _700 + 0.5;
    float _1478 = fma(_1458, _1262, _1468);
    float _1480 = _1378 * 6.283185482025146484375;
    float _1482 = sin(_1480);
    float _1484 = _1442 * _1416;
    float _1486 = _1442 * _1402;
    float _1488 = -_720;
    float _1490 = _1488 + 0.5;
    float _1492 = _1476 * (*spvDescriptorSet0.vp_c9)._m0[90].x;
    float _1494 = _1416 * _1462;
    float _1496 = _1402 * _1462;
    float _1498 = _1382 * _1462;
    float _1500 = _382 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _1502 = _1442 * _1462;
    float _1504 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _178);
    float _1506 = fma(_1432, _1240, _1410);
    float _1508 = fma(_1434, _1240, _1394);
    float _1510 = fma(_1482, _1484, _1444);
    float _1512 = fma(_1482, _1444, _1484);
    float _1514 = -_1486;
    float _1516 = fma(_1482, _1464, _1514);
    float _1518 = -_1464;
    float _1520 = fma(_1482, _1486, _1518);
    float _1522 = -(*spvDescriptorSet0.vp_c9)._m0[172].y;
    float _1524 = _1522 + (*spvDescriptorSet0.vp_c9)._m0[173].y;
    float _1526 = _1500 * _1412;
    float _1528 = fma(_1524, _1110, (*spvDescriptorSet0.vp_c9)._m0[172].y);
    float _1530 = _1446 * _1504;
    float _1532 = -(*spvDescriptorSet0.vp_c9)._m0[173].x;
    float _1534 = (*spvDescriptorSet0.vp_c9)._m0[174].x + _1532;
    float _1536 = _1412 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _1538 = _1536 * 0.5;
    float _1540 = fma(_1528, _1448, _1508);
    float _1542 = -(*spvDescriptorSet0.vp_c9)._m0[173].y;
    float _1544 = (*spvDescriptorSet0.vp_c9)._m0[174].y + _1542;
    float _1546 = fma(_1454, _1448, _1506);
    float _1548 = fma(_1534, _1310, (*spvDescriptorSet0.vp_c9)._m0[173].x);
    float _1550 = _1526 * _1456;
    float _1552 = _1502 * _1538;
    float _1554 = fma(_1544, _1310, (*spvDescriptorSet0.vp_c9)._m0[173].y);
    float _1556 = _1498 * _1538;
    float _1558 = fma(_1548, _1466, _1546);
    float _1560 = _1482 * _1538;
    float _1562 = fma(_1510, _1530, _1552);
    float _1564 = fma(_1554, _1466, _1540);
    float _1566 = fma(_1516, _1530, _1556);
    float _1568 = (*spvDescriptorSet0.vp_c9)._m0[175].x * (*spvDescriptorSet0.vp_c10)._m0[10].z;
    float _1570 = -(*spvDescriptorSet0.vp_c10)._m0[10].w;
    float _1572 = _484 + _1570;
    float _1574 = fma(_1376, (*spvDescriptorSet0.vp_c9)._m0[174].x, _1558);
    float _1576 = -_1560;
    float _1578 = fma(_1494, _1530, _1576);
    float _1580 = -_1550;
    float _1582 = fma(_1520, _1580, _1562);
    float _1584 = -_1144;
    float _1586 = fma(_1584, (*spvDescriptorSet0.vp_c9)._m0[18].w, _480);
    float _1588 = -_1568;
    float _1590 = fma(_1574, _1572, _1588);
    float _1592 = -_1550;
    float _1594 = fma(_1496, _1592, _1578);
    float _1596 = _1582 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    float _1598 = -_1550;
    float _1600 = fma(_1512, _1598, _1566);
    float _1602 = _1582 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    float _1604 = (*spvDescriptorSet0.vp_c9)._m0[175].x * (*spvDescriptorSet0.vp_c10)._m0[8].z;
    float _1606 = fma(_1594, (*spvDescriptorSet0.vp_c10)._m0[10].x, _1596);
    float _1608 = -(*spvDescriptorSet0.vp_c10)._m0[8].w;
    float _1610 = _482 + _1608;
    float _1612 = _1586 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _1614 = fma(_1594, (*spvDescriptorSet0.vp_c10)._m0[8].x, _1602);
    float _1616 = fma(_1376, (*spvDescriptorSet0.vp_c9)._m0[174].y, _1564);
    float _1618 = fma(_1600, (*spvDescriptorSet0.vp_c10)._m0[10].z, _1606);
    float _1620 = -_1604;
    float _1622 = fma(_1574, _1610, _1620);
    float _1624 = fma(_512, (*spvDescriptorSet0.vp_c8)._m0[11].x, _1612);
    float _1626 = fma(_1600, (*spvDescriptorSet0.vp_c10)._m0[8].z, _1614);
    float _1628 = fma(_1618, _1616, _1590);
    float _1630 = _1586 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _1632 = fma(_516, (*spvDescriptorSet0.vp_c8)._m0[11].z, _1624);
    float _1634 = fma(_1626, _1616, _1622);
    float _1636 = _1628 + (*spvDescriptorSet0.vp_c10)._m0[10].w;
    float _1638 = fma(_512, (*spvDescriptorSet0.vp_c8)._m0[10].x, _1630);
    float _1640 = _1632 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _1642 = _1634 + (*spvDescriptorSet0.vp_c10)._m0[8].w;
    float _1644 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1646 = _1636 + _1644;
    float _1648 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    float _1650 = fma(_516, (*spvDescriptorSet0.vp_c8)._m0[10].z, _1638);
    float _1652 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1654 = _1642 + _1652;
    float _1656 = _1646 * _1646;
    float _1658 = _1650 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _1660 = -_188;
    int _1662 = _574 ? as_type<int>(_1660) : as_type<int>(_188);
    float _1664 = fma(_1654, _1654, _1656);
    float _1666 = 1.0 / _1640;
    float _1668 = -(*spvDescriptorSet0.vp_c9)._m0[171].z;
    float _1670 = (*spvDescriptorSet0.vp_c9)._m0[172].z + _1668;
    float _1672 = _1658 + _1640;
    float _1674 = -(*spvDescriptorSet0.vp_c9)._m0[172].z;
    float _1676 = _1674 + (*spvDescriptorSet0.vp_c9)._m0[173].z;
    bool _1678 = !_556;
    float _1680 = _1678 ? _188 : as_type<float>(_1662);
    float _1682 = fma(_1670, _1112, (*spvDescriptorSet0.vp_c9)._m0[171].z);
    float _1684 = _1582 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _1686 = sqrt(_1664);
    float _1688 = fma(_1676, _1110, (*spvDescriptorSet0.vp_c9)._m0[172].z);
    float _1690 = (*spvDescriptorSet0.vp_c9)._m0[175].x * (*spvDescriptorSet0.vp_c10)._m0[9].z;
    float _1692 = -(*spvDescriptorSet0.vp_c9)._m0[173].z;
    float _1694 = (*spvDescriptorSet0.vp_c9)._m0[174].z + _1692;
    float _1696 = _1648 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    float _1698 = _1680 + (-0.5);
    float _1700 = fma(_1594, (*spvDescriptorSet0.vp_c10)._m0[9].x, _1684);
    float _1702 = -_1690;
    float _1704 = fma(_1574, _1474, _1702);
    float _1706 = _1672 * _1666;
    float _1708 = _1706 * 0.5;
    float _1710 = -_1696;
    float _1712 = -_988;
    float _1714 = fma(_1710, _1698, _1712);
    float _1716 = fma(_1682, _1240, _1478);
    float _1718 = fma(_1600, (*spvDescriptorSet0.vp_c10)._m0[9].z, _1700);
    float _1720 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _1722 = fma(_1708, (*spvDescriptorSet0.vp_c8)._m0[30].w, _1720);
    float _1724 = fma(_1694, _1310, (*spvDescriptorSet0.vp_c9)._m0[173].z);
    float _1726 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].z;
    float _1728 = fma(_1718, _1616, _1704);
    bool _1730 = _1686 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1732 = fma(_1688, _1448, _1716);
    float _1734 = _1728 + (*spvDescriptorSet0.vp_c10)._m0[9].w;
    float _1736 = fma(_1724, _1466, _1732);
    float _1738 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].w;
    float _1740 = _1490 * (*spvDescriptorSet0.vp_c9)._m0[90].y;
    float _1742 = (*spvDescriptorSet0.vp_c8)._m0[30].w;
    float _1744 = _1642;
    float _1746 = _1636;
    if (!_1730)
    {
        _1742 = _1734;
    }
    float _1748 = _1742;
    float _1750 = 1.0 / _1722;
    bool _1752 = !_1730;
    float _1754 = _1748;
    if (!_1752)
    {
        float _1756 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1758 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1760 = _1686 + _1758;
        float _1762 = _1734 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1764 = rsqrt(_1664);
        float _1766 = _1760 * _1756;
        float _1768 = _1766 * 0.15915493667125701904296875;
        float _1770 = _1768 * 6.283185482025146484375;
        float _1772 = cos(_1770);
        float _1774 = _1768 * 6.283185482025146484375;
        float _1776 = sin(_1774);
        float _1778 = _1772 + (-1.0);
        float _1780 = fma(_1776, _1762, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1782 = _1778 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1784 = _1764 * _1780;
        float _1786 = fma(_1734, _1772, _1782);
        float _1788 = fma(_1654, _1784, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1790 = fma(_1646, _1784, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _1754 = _1786;
        _1744 = _1788;
        _1746 = _1790;
    }
    float _1792 = _1754;
    float _1794 = _1744;
    float _1796 = _1746;
    float _1798 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _1800 = _1750 * _1798;
    float _1802 = _1492 * _1726;
    float _1804 = _1740 * _1738;
    float _1806 = -_480;
    float _1808 = _1806 + _1792;
    float _1810 = abs(_1800);
    float _1812 = log2(_1810);
    float _1814 = -_982;
    float _1816 = _1814 + 1.0;
    float _1818 = -_482;
    float _1820 = _1818 + _1794;
    float _1822 = _1808 * _1808;
    float _1824 = -_986;
    float _1826 = _1824 + 1.0;
    float _1828 = -_948;
    float _1830 = _1828 + 1.0;
    float _1832 = -_484;
    float _1834 = _1832 + _1796;
    float _1836 = fma(_1820, _1820, _1822);
    float _1838 = -_1816;
    float _1840 = fma(_600, _1838, _794);
    float _1842 = fma(_620, _1826, _784);
    float _1844 = -_1830;
    float _1846 = fma(_934, _1844, _978);
    float _1848 = fma(_1834, _1834, _1836);
    float _1850 = -_984;
    float _1852 = _1850 + 1.0;
    float _1854 = sqrt(_1848);
    float _1856 = _1812 * (*spvDescriptorSet0.vp_c15)._m0[654].z;
    float _1858 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _1860 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _1862 = fma(_1680, _1852, _1714);
    float _1864 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _1866 = _1858 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1868 = _1860 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1870 = _1470 * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    float _1872 = _1864 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1874 = fma(_1376, (*spvDescriptorSet0.vp_c9)._m0[174].z, _1736);
    float _1876 = exp2(_1856);
    out.m_57.x = _1802;
    out.m_57.y = _1804;
    float _1878 = _178 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    bool _1880 = _1854 > 0.0;
    out.m_59.x = _1840;
    out.m_59.y = _1842;
    out.m_59.z = _1846;
    out.m_59.w = _1862;
    float _1882 = -_1482;
    float _1884 = fma(_1494, _1878, _1882);
    out.m_61.x = _1866;
    out.m_61.y = _1868;
    out.m_61.z = _1872;
    out.m_61.w = _1870;
    float _1886 = fma(_1510, _1878, _1502);
    bool _1888 = (*spvDescriptorSet0.vp_c15)._m0[660].y >= 0.5;
    bool _1890 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _1892 = _1888 || _1890;
    bool _1894 = isnan(0.5);
    bool _1896 = _1892 || _1894;
    out.m_63.x = _1874;
    float _1898 = fma(_1516, _1878, _1498);
    float _1900 = fma(_1876, (*spvDescriptorSet0.vp_c15)._m0[654].x, (*spvDescriptorSet0.vp_c15)._m0[654].y);
    float _1902 = precise::clamp(_1900, 0.0, 1.0);
    out.m_65.x = _424;
    out.m_65.y = _430;
    out.m_65.z = _432;
    out.m_65.w = _434;
    float _1904 = _188 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    float _1906 = fma(_1902, -2.0, 3.0);
    float _1908 = _1902 * _1902;
    float _1910 = -_1904;
    float _1912 = fma(_1496, _1910, _1884);
    float _1914 = -_1904;
    float _1916 = fma(_1520, _1914, _1886);
    float _1918 = _1908 * _1906;
    bool _1920 = !_1880;
    float _1922 = _1794;
    float _1924 = _1792;
    float _1926 = _1796;
    if (!_1920)
    {
        float _1928 = _192 * _192;
        float _1930 = rsqrt(_1848);
        float _1932 = fma(_190, _190, _1928);
        float _1934 = fma(_194, _194, _1932);
        float _1936 = sqrt(_1934);
        float _1938 = _1820 * _1930;
        float _1940 = _1808 * _1930;
        float _1942 = _1834 * _1930;
        bool _1944 = _1936 > 0.0;
        bool _1946 = !_1944;
        if (!_1946)
        {
            float _1948 = rsqrt(_1934);
            float _1950 = 1.0 / (*spvDescriptorSet0.vp_c10)._m0[2].z;
            float _1952 = _192 * _1948;
            float _1954 = _190 * _1948;
            float _1956 = _1940 * _1952;
            float _1958 = _194 * _1948;
            float _1960 = fma(_1938, _1954, _1956);
            float _1962 = _1950 * (*spvDescriptorSet0.vp_c9)._m0[142].x;
            float _1964 = fma(_1942, _1958, _1960);
            float _1966 = _1964 * _1962;
            float _1968 = fma(_190, _1966, _1794);
            float _1970 = fma(_192, _1966, _1792);
            float _1972 = fma(_194, _1966, _1796);
            _1922 = _1968;
            _1924 = _1970;
            _1926 = _1972;
        }
    }
    float _1974 = _1922;
    float _1976 = _1924;
    float _1978 = _1926;
    float _1980 = -_506;
    float _1982 = fma(_1980, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1974);
    float _1984 = -_1144;
    float _1986 = fma(_1984, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1976);
    float _1988 = -_508;
    float _1990 = fma(_1988, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1978);
    float _1992 = -_1904;
    float _1994 = fma(_1512, _1992, _1898);
    float _1996 = -_1918;
    float _1998 = _1996 + 1.0;
    float _2000 = _1986;
    float _2002 = _1982;
    float _2004 = _1990;
    if (!_1896)
    {
        float _2006 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
        float _2008 = _1586 + _2006;
        float _2010 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
        float _2012 = _512 + _2010;
        float _2014 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _2016 = -_484;
        float _2018 = _2016 + _1978;
        float _2020 = _2008 * _2008;
        float _2022 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
        float _2024 = _516 + _2022;
        float _2026 = fma(_2012, _2012, _2020);
        float _2028 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _2030 = fma(_2024, _2024, _2026);
        float _2032 = sqrt(_2030);
        float _2034 = 1.0 / _1412;
        float _2036 = _2028 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _2038 = precise::min(_2032, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _2040 = _2038 * _2014;
        float _2042 = -_480;
        float _2044 = _2042 + _1976;
        float _2046 = _2040 * _2034;
        float _2048 = -_482;
        float _2050 = _2048 + _1974;
        float _2052 = _2036 * _2046;
        float _2054 = _2018 * _2046;
        float _2056 = fma(_2050, _2052, _512);
        float _2058 = fma(_2044, _2052, _1586);
        float _2060 = fma(_2036, _2054, _516);
        _2000 = _2058;
        _2002 = _2056;
        _2004 = _2060;
    }
    float _2062 = _2000;
    float _2064 = _2002;
    float _2066 = _2004;
    float _2068 = _2062 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _2070 = fma(_1998, (*spvDescriptorSet0.vp_c15)._m0[654].w, _1918);
    float _2072 = _2062 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _2074 = _2062 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _2076 = fma(_2064, (*spvDescriptorSet0.vp_c8)._m0[1].x, _2068);
    float _2078 = _2062 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _2080 = fma(_2064, (*spvDescriptorSet0.vp_c8)._m0[0].x, _2072);
    float _2082 = fma(_2064, (*spvDescriptorSet0.vp_c8)._m0[2].x, _2074);
    float _2084 = fma(_2066, (*spvDescriptorSet0.vp_c8)._m0[1].z, _2076);
    float _2086 = fma(_2064, (*spvDescriptorSet0.vp_c8)._m0[3].x, _2078);
    float _2088 = fma(_2066, (*spvDescriptorSet0.vp_c8)._m0[0].z, _2080);
    float _2090 = fma(_2066, (*spvDescriptorSet0.vp_c8)._m0[2].z, _2082);
    float _2092 = _2084 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _2094 = fma(_2066, (*spvDescriptorSet0.vp_c8)._m0[3].z, _2086);
    float _2096 = _2088 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _2098 = _2090 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _2100 = _2092 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _2102 = _2092 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _2104 = _2092 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _2106 = _2092 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _2108 = fma(_2096, (*spvDescriptorSet0.vp_c8)._m0[4].x, _2100);
    float _2110 = fma(_2096, (*spvDescriptorSet0.vp_c8)._m0[5].x, _2102);
    float _2112 = fma(_2096, (*spvDescriptorSet0.vp_c8)._m0[6].x, _2104);
    float _2114 = fma(_2096, (*spvDescriptorSet0.vp_c8)._m0[7].x, _2106);
    float _2116 = _2094 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _2118 = fma(_2098, (*spvDescriptorSet0.vp_c8)._m0[4].z, _2108);
    float _2120 = fma(_2098, (*spvDescriptorSet0.vp_c8)._m0[5].z, _2110);
    float _2122 = fma(_2098, (*spvDescriptorSet0.vp_c8)._m0[6].z, _2112);
    float _2124 = fma(_2098, (*spvDescriptorSet0.vp_c8)._m0[7].z, _2114);
    float _2126 = in.m_67.x;
    float _2128 = _1916 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    float _2130 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _2132 = _2062 + _2130;
    bool _2134 = _1800 <= 8000.0;
    bool _2136 = isnan(_1800);
    bool _2138 = _2134 || _2136;
    bool _2140 = isnan(8000.0);
    bool _2142 = _2138 || _2140;
    float _2144 = float(_2142);
    float _2146 = fma(_2116, (*spvDescriptorSet0.vp_c8)._m0[6].w, _2122);
    float _2148 = fma(_1912, (*spvDescriptorSet0.vp_c10)._m0[8].x, _2128);
    float _2150 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _2152 = _2064 + _2150;
    float _2154 = _2132 * _2132;
    float _2156 = _2144 * _2070;
    float _2158 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _2160 = _2066 + _2158;
    float _2162 = -_534;
    float _2164 = _2162 + 1.0;
    float _2166 = fma(_2152, _2152, _2154);
    float _2168 = _2156 * (*spvDescriptorSet0.vp_c15)._m0[653].x;
    float _2170 = fma(_2116, (*spvDescriptorSet0.vp_c8)._m0[4].w, _2118);
    float _2172 = fma(_2116, (*spvDescriptorSet0.vp_c8)._m0[5].w, _2120);
    float _2174 = fma(_2160, _2160, _2166);
    float _2176 = _2164 * _2168;
    float _2178 = precise::clamp(_2176, 0.0, 1.0);
    float _2180 = fma(_2116, (*spvDescriptorSet0.vp_c8)._m0[7].w, _2124);
    float _2182 = _1916 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _2184 = _1916 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    float _2186 = -_2178;
    float _2188 = fma(_2186, (*spvDescriptorSet0.vp_c15)._m0[653].y, 1.0);
    float _2190 = sqrt(_2174);
    float _2192 = fma(_1912, (*spvDescriptorSet0.vp_c10)._m0[9].x, _2182);
    float _2194 = fma(_1912, (*spvDescriptorSet0.vp_c10)._m0[10].x, _2184);
    float _2196 = _2188 * _2126;
    float _2198 = fma(_1994, (*spvDescriptorSet0.vp_c10)._m0[8].z, _2148);
    float _2200 = fma(_1994, (*spvDescriptorSet0.vp_c10)._m0[9].z, _2192);
    float _2202 = fma(_1994, (*spvDescriptorSet0.vp_c10)._m0[10].z, _2194);
    float _2204 = _2196 * (*spvDescriptorSet0.vp_c13)._m0[1].w;
    out.gl_Position.x = _2170;
    out.gl_Position.y = _2172;
    out.gl_Position.z = _2146;
    out.gl_Position.w = _2180;
    out.m_69.x = _2204;
    bool _2206 = _2190 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _2208 = isnan(_2190);
    bool _2210 = _2206 || _2208;
    bool _2212 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _2214 = _2210 || _2212;
    out.m_71.x = _2198;
    out.m_71.y = _2200;
    out.m_71.z = _2202;
    float _2216 = _2192;
    float _2218 = (*spvDescriptorSet0.vp_c15)._m0[653].y;
    float _2220 = _2180;
    float _2222 = _2146;
    float _2224 = _2172;
    float _2226 = _2170;
    if (!_2214)
    {
        _2216 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _2228 = _2216;
    float _2230 = _2228;
    float _2232 = _2228;
    if (!_2214)
    {
        _2218 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _2234 = _2218;
    float _2236 = _2234;
    float _2238 = _2234;
    if (!_2214)
    {
        _2220 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _2240 = _2220;
    float _2242 = _2240;
    float _2244 = _2240;
    if (!_2214)
    {
        _2222 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _2246 = _2222;
    float _2248 = _2246;
    float _2250 = _2246;
    if (!_2214)
    {
        _2224 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _2252 = _2224;
    float _2254 = _2252;
    float _2256 = _2252;
    if (!_2214)
    {
        _2226 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _2258 = _2226;
    bool _2260 = !_2214;
    float _2262 = _2258;
    float _2264 = _2258;
    if (!_2260)
    {
        bool _2266 = _2190 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _2268 = isnan(_2190);
        bool _2270 = _2266 || _2268;
        bool _2272 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _2274 = _2270 || _2272;
        if (!_2274)
        {
            float _2276 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2278 = _2190 + _2276;
            float _2280 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2282 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _2280;
            float _2284 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _2286 = _2284 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _2288 = 1.0 / _2282;
            float _2290 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _2292 = _2290 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _2294 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _2296 = _2294 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _2298 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _2300 = _2298 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _2302 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _2304 = _2302 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _2306 = _2278 * _2288;
            float _2308 = precise::clamp(_2306, 0.0, 1.0);
            float _2310 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _2312 = _2310 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _2314 = fma(_2308, _2286, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _2316 = fma(_2308, _2312, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _2318 = fma(_2308, _2292, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _2320 = fma(_2308, _2296, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _2322 = fma(_2308, _2300, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _2324 = fma(_2308, _2304, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            _2238 = _2314;
            _2256 = _2322;
            _2232 = _2318;
            _2250 = _2320;
            _2244 = _2316;
            _2264 = _2324;
            _2326 = true;
        }
        else
        {
            bool _2328 = _2190 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _2330 = isnan(_2190);
            bool _2332 = _2328 || _2330;
            bool _2334 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _2336 = _2332 || _2334;
            if (!_2336)
            {
                _2230 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _2338 = _2230;
            _2232 = _2338;
            if (!_2336)
            {
                _2236 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _2340 = _2236;
            _2238 = _2340;
            if (!_2336)
            {
                _2242 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _2342 = _2242;
            _2244 = _2342;
            if (!_2336)
            {
                _2248 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _2344 = _2248;
            _2250 = _2344;
            if (!_2336)
            {
                _2254 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _2346 = _2254;
            _2256 = _2346;
            if (!_2336)
            {
                _2262 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _2348 = _2262;
            bool _2350 = !_2336;
            _2264 = _2348;
            if (!_2350)
            {
                bool _2352 = _2190 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _2354 = isnan(_2190);
                bool _2356 = _2352 || _2354;
                bool _2358 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _2360 = _2356 || _2358;
                if (!_2360)
                {
                    float _2362 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2364 = _2190 + _2362;
                    float _2366 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2368 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _2366;
                    float _2370 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _2372 = _2370 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _2374 = 1.0 / _2368;
                    float _2376 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _2378 = _2376 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _2380 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _2382 = _2380 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _2384 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _2386 = _2384 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _2388 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _2390 = _2388 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _2392 = _2364 * _2374;
                    float _2394 = precise::clamp(_2392, 0.0, 1.0);
                    float _2396 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _2398 = _2396 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _2400 = fma(_2394, _2372, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _2402 = fma(_2394, _2398, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _2404 = fma(_2394, _2378, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _2406 = fma(_2394, _2382, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _2408 = fma(_2394, _2386, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _2410 = fma(_2394, _2390, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    _2238 = _2400;
                    _2256 = _2408;
                    _2232 = _2404;
                    _2250 = _2406;
                    _2244 = _2402;
                    _2264 = _2410;
                    _2326 = true;
                }
                else
                {
                    _2238 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _2256 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _2232 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _2250 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _2244 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _2264 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _2326 = false;
    float _2412 = _2238;
    float _2414 = _2256;
    float _2416 = _2232;
    float _2418 = _2250;
    float _2420 = _2244;
    float _2422 = _2264;
    float _2424 = fma(_2200, -0.5, 0.5);
    float _2426 = precise::clamp(_2424, 0.0, 1.0);
    float _2428 = -_2412;
    float _2430 = _2428 + _2414;
    float _2432 = -_2416;
    float _2434 = _2432 + _2418;
    float _2436 = -_2420;
    float _2438 = _2436 + _2422;
    bool _2440 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _2442 = fma(_2426, _2430, _2412);
    float _2444 = fma(_2426, _2434, _2416);
    float _2446 = fma(_2426, _2438, _2420);
    float _2448 = _2442 * 0.586610972881317138671875;
    out.m_40.x = 1.0;
    float _2450 = fma(_2444, 0.298911988735198974609375, _2448);
    float _2452 = fma(_2446, 0.114477999508380889892578125, _2450);
    out.m_73.x = 0.0;
    float _2454 = -_2452;
    float _2456 = _2444 + _2454;
    float _2458 = -_2452;
    float _2460 = _2442 + _2458;
    float _2462 = -_2452;
    float _2464 = _2446 + _2462;
    float _2466 = (*spvDescriptorSet0.vp_c10)._m0[3].x * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _2468 = fma(_2456, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2452);
    float _2470 = fma(_2460, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2452);
    float _2472 = fma(_2464, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2452);
    out.m_69.w = _2466;
    out.m_75.x = _2468;
    out.m_75.y = _2470;
    out.m_75.z = _2472;
    if (!_2440)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _2474 = -_2062;
    float _2476 = _2474 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
    float _2478 = -_2064;
    float _2480 = _2478 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
    float _2482 = -_2066;
    float _2484 = _2482 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
    float _2486 = _2476 * _2476;
    float _2488 = fma(_2480, _2480, _2486);
    float _2490 = fma(_2484, _2484, _2488);
    float _2492 = sqrt(_2490);
    float _2494 = rsqrt(_2490);
    float _2496 = -_2492;
    float _2498 = _2496 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _2500 = _2498 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
    float _2502 = precise::clamp(_2500, 0.0, 1.0);
    float _2504 = _2480 * _2494;
    float _2506 = _2476 * _2494;
    float _2508 = abs(_2502);
    float _2510 = log2(_2508);
    float _2512 = _2484 * _2494;
    float _2514 = _2504 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
    float _2516 = _2200 * _2506;
    float _2518 = -_2506;
    float _2520 = -_2514;
    float _2522 = fma(_2518, (*spvDescriptorSet0.vp_c15)._m0[656].y, _2520);
    float _2524 = fma(_2198, _2504, _2516);
    float _2526 = -_2512;
    float _2528 = fma(_2526, (*spvDescriptorSet0.vp_c15)._m0[656].z, _2522);
    float _2530 = fma(_2202, _2512, _2524);
    float _2532 = precise::clamp(_2530, 0.0, 1.0);
    float _2534 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
    float _2536 = _2528 + _2534;
    float _2538 = _2510 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
    float _2540 = _2536 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
    float _2542 = precise::clamp(_2540, 0.0, 1.0);
    float _2544 = exp2(_2538);
    float _2546 = _2544 * _2542;
    float _2548 = _2532 * _2546;
    float _2550 = _2548 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
    float _2552 = _2548 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
    float _2554 = _2548 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
    out.m_73.x = _2550;
    out.m_73.y = _2552;
    out.m_73.z = _2554;
    out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
}


vertex main0_out main0_z(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], uint gl_VertexIndex [[vertex_id]])
{
    main0_out out = {};
    out.m_65 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_61 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_44 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_59 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_75 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_40 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_57 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_71 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_63 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_73 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_69 = float4(0.0, 0.0, 0.0, 1.0);
    bool _2326 = false;
    bool _312 = false;
    bool _216 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _89 = in.m_37.w;
    float _91 = trunc(_89);
    int _94 = int(_91);
    bool _98 = _94 >= 1;
    float _100 = 0.0;
    if (!_98)
    {
        _100 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _102 = _100;
    if (!_98)
    {
        out.m_40.x = 0.0;
    }
    int _104 = 0;
    if (!_98)
    {
        float _106 = _102 * 5.0;
        _104 = as_type<int>(_106);
    }
    int _108 = _104;
    int _110 = _108;
    if (!_98)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2610 = as_type<float>(_108);
        out.gl_Position.z = _2610;
    }
    if (!_98)
    {
        return out;
    }
    float _112 = in.m_42.w;
    float _114 = float(_94);
    float _116 = 1.0 / _114;
    float _118 = -_112;
    float _120 = _118 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _122 = _112 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _124 = isnan(_112);
    bool _126 = _122 || _124;
    bool _128 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _130 = _126 || _128;
    float _132 = _120 * _116;
    bool _134 = _120 >= _114;
    bool _136 = !_130;
    bool _138 = _134 || _136;
    out.m_44.x = _132;
    float _140 = _112;
    float _142 = _132;
    float _144 = _120;
    if (_138)
    {
        _140 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _146 = _140;
    if (_138)
    {
        out.m_40.x = 0.0;
    }
    if (_138)
    {
        float _148 = _146 * 5.0;
        _110 = as_type<int>(_148);
    }
    int _150 = _110;
    if (_138)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2683 = as_type<float>(_150);
        out.gl_Position.z = _2683;
    }
    if (_138)
    {
        return out;
    }
    float _152 = as_type<float>(int(gl_VertexIndex));
    float _154 = in.m_49.x;
    float _156 = in.m_49.y;
    float _158 = in.m_49.z;
    int _160 = as_type<int>(_152) & 1;
    bool _162 = _160 != 0;
    int _164 = as_type<int>(_152) & 2;
    bool _166 = _164 != 0;
    bool _168 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _170 = _156 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _172 = _156 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _174 = _156 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    bool _176 = !_162;
    float _178 = _176 ? (-0.5) : 0.5;
    float _180 = fma(_154, (*spvDescriptorSet0.vp_c10)._m0[4].x, _170);
    float _182 = fma(_154, (*spvDescriptorSet0.vp_c10)._m0[5].x, _172);
    float _184 = fma(_154, (*spvDescriptorSet0.vp_c10)._m0[6].x, _174);
    bool _186 = !_166;
    float _188 = _186 ? (-0.5) : 0.5;
    float _190 = fma(_158, (*spvDescriptorSet0.vp_c10)._m0[4].z, _180);
    float _192 = fma(_158, (*spvDescriptorSet0.vp_c10)._m0[5].z, _182);
    float _194 = fma(_158, (*spvDescriptorSet0.vp_c10)._m0[6].z, _184);
    bool _196 = !_168;
    float _214;
    if (!_196)
    {
        float _198 = in.m_51.x;
        float _200 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _202 = _198 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _204 = fma(_202, (*spvDescriptorSet0.vp_c9)._m0[12].x, _120);
        float _206 = _204 * _200;
        float _208 = floor(_206);
        float _210 = -_208;
        float _212 = _206 + _210;
        _214 = _212;
        _216 = true;
    }
    else
    {
        _214 = _132;
    }
    _216 = false;
    float _218 = _214;
    float _220 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _222 = _218 + _220;
    bool _224 = _218 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _226 = isnan(_218);
    bool _228 = _224 || _226;
    bool _230 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _232 = _228 || _230;
    float _234 = float(_232);
    float _236 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _238 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _236;
    float _240 = -_234;
    float _242 = _240 + 1.0;
    bool _244 = _218 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _246 = isnan(_218);
    bool _248 = _244 || _246;
    bool _250 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _252 = _248 || _250;
    float _254 = float(_252);
    float _256 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _258 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _256;
    bool _260 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _262 = 1.0 / _238;
    float _264 = _254 * _242;
    float _266 = -_254;
    float _268 = _266 + 1.0;
    float _270 = _222 * _262;
    float _272 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _274 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _272;
    float _276 = fma(_258, _270, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _278 = fma(_274, _270, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _280 = _276 * _264;
    float _282 = _278 * _264;
    float _284 = fma(_268, (*spvDescriptorSet0.vp_c9)._m0[143].x, _280);
    float _286 = fma(_268, (*spvDescriptorSet0.vp_c9)._m0[143].y, _282);
    float _288 = fma(_234, (*spvDescriptorSet0.vp_c9)._m0[144].x, _284);
    float _290 = fma(_234, (*spvDescriptorSet0.vp_c9)._m0[144].y, _286);
    bool _292 = !_260;
    float _310;
    if (!_292)
    {
        float _294 = in.m_51.x;
        float _296 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _298 = _294 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _300 = fma(_298, (*spvDescriptorSet0.vp_c9)._m0[11].y, _120);
        float _302 = _300 * _296;
        float _304 = floor(_302);
        float _306 = -_304;
        float _308 = _302 + _306;
        _310 = _308;
        _312 = true;
    }
    else
    {
        _310 = _132;
    }
    _312 = false;
    float _314 = _310;
    float _316 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _318 = _314 + _316;
    float _320 = in.m_53.x;
    float _322 = in.m_53.y;
    float _324 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _326 = _324 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _328 = _314 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _330 = isnan(_314);
    bool _332 = _328 || _330;
    bool _334 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _336 = _332 || _334;
    float _338 = float(_336);
    float _340 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _342 = _340 + (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _344 = _314 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _346 = isnan(_314);
    bool _348 = _344 || _346;
    bool _350 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _352 = _348 || _350;
    float _354 = float(_352);
    float _356 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _358 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _356;
    bool _360 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].w;
    float _362 = 1.0 / _326;
    float _364 = -_338;
    float _366 = _364 + 1.0;
    float _368 = _354 * _366;
    float _370 = -_354;
    float _372 = _370 + 1.0;
    float _374 = 1.0 / _342;
    float _376 = _358 * _362;
    float _378 = -(*spvDescriptorSet0.vp_c9)._m0[116].x;
    float _380 = _378 + (*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _382 = _290 * _322;
    float _384 = _288 * _320;
    float _386 = fma(_376, _318, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    bool _388 = _314 >= (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _390 = isnan(_314);
    bool _392 = _388 || _390;
    bool _394 = isnan((*spvDescriptorSet0.vp_c9)._m0[117].w);
    bool _396 = _392 || _394;
    float _398 = float(_396);
    float _400 = _380 * _374;
    float _402 = _386 * _368;
    float _404 = -_398;
    float _406 = _404 + 1.0;
    float _408 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _410 = _314 + _408;
    float _412 = fma(_372, (*spvDescriptorSet0.vp_c9)._m0[115].x, _402);
    float _414 = _338 * _406;
    float _416 = fma(_400, _410, (*spvDescriptorSet0.vp_c9)._m0[116].x);
    float _418 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _420 = fma(_416, _414, _412);
    float _422 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _424 = _418 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _426 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _428 = fma(_398, (*spvDescriptorSet0.vp_c9)._m0[117].x, _420);
    float _430 = _422 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _432 = _426 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _434 = _428 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    bool _436 = !_360;
    if (!_436)
    {
        float _438 = in.m_51.x;
        float _440 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].w;
        float _442 = _438 * (*spvDescriptorSet0.vp_c9)._m0[13].x;
        float _444 = fma(_442, (*spvDescriptorSet0.vp_c9)._m0[11].w, _120);
        float _446 = _444 * _440;
        float _448 = floor(_446);
        float _450 = -_448;
        float _452 = _446 + _450;
        _142 = _452;
    }
    float _454 = _142;
    float _456 = in.m_37.x;
    float _458 = in.m_37.y;
    float _460 = in.m_37.z;
    float _462 = _458 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _464 = _458 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _466 = _458 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _468 = fma(_456, (*spvDescriptorSet0.vp_c10)._m0[5].x, _462);
    float _470 = fma(_456, (*spvDescriptorSet0.vp_c10)._m0[4].x, _464);
    float _472 = fma(_456, (*spvDescriptorSet0.vp_c10)._m0[6].x, _466);
    float _474 = fma(_460, (*spvDescriptorSet0.vp_c10)._m0[5].z, _468);
    float _476 = fma(_460, (*spvDescriptorSet0.vp_c10)._m0[4].z, _470);
    float _478 = fma(_460, (*spvDescriptorSet0.vp_c10)._m0[6].z, _472);
    float _480 = _474 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _482 = _476 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _484 = _478 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _486 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _488 = _480 + _486;
    float _490 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _492 = _482 + _490;
    float _494 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _496 = _484 + _494;
    float _498 = _488 * _488;
    float _500 = fma(_492, _492, _498);
    float _502 = fma(_496, _496, _500);
    float _504 = rsqrt(_502);
    float _506 = _492 * _504;
    float _508 = _496 * _504;
    float _510 = -_506;
    float _512 = fma(_510, (*spvDescriptorSet0.vp_c9)._m0[18].w, _482);
    float _514 = -_508;
    float _516 = fma(_514, (*spvDescriptorSet0.vp_c9)._m0[18].w, _484);
    float _518 = fma(_512, (*spvDescriptorSet0.vp_c15)._m0[652].x, (*spvDescriptorSet0.vp_c15)._m0[652].z);
    float _520 = fma(_516, (*spvDescriptorSet0.vp_c15)._m0[652].y, (*spvDescriptorSet0.vp_c15)._m0[652].w);
    float _522 = floor(_518);
    float _524 = floor(_520);
    float _526 = -_522;
    float _528 = _518 + _526;
    float _530 = -_524;
    float _532 = _520 + _530;
    float2 _3325 = float2(_528, _532);
    float _534 = dm_bs(spvDescriptorSet0.vp_t_tcb_24.sample(spvDescriptorSet0.vp_t_tcb_24Smplr, select(_3325, float2(0.0), isnan(_3325)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_24, spvDescriptorSet0.vp_t_tcb_24Smplr_w, select(_3325, float2(0.0), isnan(_3325)), level(0.0)).x;
    float _536 = in.m_51.x;
    float _538 = in.m_51.y;
    float _540 = in.m_51.z;
    float _542 = in.m_51.w;
    float _544 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    int _546 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _548 = _546 != 0;
    int _550 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _552 = _550 != 0;
    int _554 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _556 = _554 != 0;
    float _558 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _560 = log2(_558);
    int _562 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _564 = _562 != 0;
    float _566 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    float _568 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _570 = _536 * 2.0;
    bool _572 = _536 > 0.5;
    bool _574 = _542 > 0.5;
    float _576 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _578 = _576 + (*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _580 = -_178;
    int _582 = _572 ? as_type<int>(_580) : as_type<int>(_178);
    float _584 = _538 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    int _586 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 16;
    bool _588 = _586 != 0;
    int _590 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 32;
    bool _592 = _590 != 0;
    float _594 = _540 * 2.0;
    float _596 = 1.0 / _578;
    bool _598 = !_548;
    float _600 = _598 ? _178 : as_type<float>(_582);
    float _602 = fma(_584, -2.0, _568);
    bool _604 = _538 > 0.5;
    float _606 = (*spvDescriptorSet0.vp_c9)._m0[83].z + (*spvDescriptorSet0.vp_c9)._m0[83].x;
    float _608 = fma(_120, (*spvDescriptorSet0.vp_c9)._m0[76].y, _602);
    float _610 = -_188;
    int _612 = _604 ? as_type<int>(_610) : as_type<int>(_188);
    float _614 = floor(_594);
    float _616 = _536 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    bool _618 = !_552;
    float _620 = _618 ? _188 : as_type<float>(_612);
    float _622 = -_566;
    float _624 = fma(_616, 2.0, _622);
    int _626 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _628 = _626 != 0;
    float _630 = -(*spvDescriptorSet0.vp_c9)._m0[131].x;
    float _632 = (*spvDescriptorSet0.vp_c9)._m0[132].x + _630;
    float _634 = _538 * 2.0;
    float _636 = -_178;
    int _638 = _604 ? as_type<int>(_636) : as_type<int>(_178);
    float _640 = _540 + _536;
    bool _642 = _540 > 0.5;
    float _644 = _632 * _596;
    float _646 = floor(_634);
    float _648 = _640 + (-1.0);
    float _650 = -_178;
    int _652 = _642 ? as_type<int>(_650) : as_type<int>(_178);
    float _654 = _538 + _540;
    float _656 = -_188;
    int _658 = _642 ? as_type<int>(_656) : as_type<int>(_188);
    float _660 = fma(_648, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    bool _662 = _614 >= 0.0;
    bool _664 = isnan(_614);
    bool _666 = _662 || _664;
    bool _668 = isnan(0.0);
    bool _670 = _666 || _668;
    float _672 = _654 + (-1.0);
    float _674 = floor(_570);
    float _676 = _648;
    float _678 = _544;
    if (!_628)
    {
        _676 = _540;
    }
    float _680 = _676;
    int _682 = _670 ? 0 : 1;
    float _684 = fma(_672, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    bool _686 = _614 > 0.0;
    float _688 = _538 + _536;
    int _690 = ~_682;
    int _692 = _690 + 1;
    int _694 = _692 + 1;
    float _696 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    bool _698 = !_588;
    float _700 = _698 ? _178 : as_type<float>(_638);
    float _702 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _704 = _454 + _702;
    bool _706 = _646 > 0.0;
    float _708 = _688 + (-1.0);
    float _710 = _680;
    int _712 = _694;
    if (_628)
    {
        _710 = _538;
    }
    float _714 = _710;
    float _716 = fma(_644, _704, (*spvDescriptorSet0.vp_c9)._m0[131].x);
    bool _718 = !_592;
    float _720 = _718 ? _188 : as_type<float>(_658);
    float _722 = fma(_708, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    bool _724 = _674 >= 0.0;
    bool _726 = isnan(_674);
    bool _728 = _724 || _726;
    bool _730 = isnan(0.0);
    bool _732 = _728 || _730;
    float _734 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    float _736 = _674;
    if (!_686)
    {
        int _738 = ~_682;
        int _740 = _738 + 1;
        _712 = _740;
    }
    int _742 = _712;
    bool _744 = _646 >= 0.0;
    bool _746 = isnan(_646);
    bool _748 = _744 || _746;
    bool _750 = isnan(0.0);
    bool _752 = _748 || _750;
    float _754 = _696 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _756 = _620 + (-0.5);
    float _758 = (*spvDescriptorSet0.vp_c9)._m0[83].w + (*spvDescriptorSet0.vp_c9)._m0[83].y;
    int _760 = _752 ? 0 : 1;
    bool _762 = _674 > 0.0;
    float _764 = fma(_714, (*spvDescriptorSet0.vp_c9)._m0[83].w, _758);
    float _766 = -_120;
    float _768 = fma(_766, (*spvDescriptorSet0.vp_c9)._m0[76].x, _624);
    float _770 = _544 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _772 = _600 + 0.5;
    int _774 = ~_760;
    int _776 = _774 + 1;
    int _778 = _776 + 1;
    float _780 = -_754;
    float _782 = -_608;
    float _784 = fma(_780, _756, _782);
    int _786 = _778;
    if (!_706)
    {
        int _788 = ~_760;
        int _790 = _788 + 1;
        _786 = _790;
    }
    int _792 = _786;
    float _794 = fma(_770, _772, _768);
    float _796 = _560 * _120;
    if (!_628)
    {
        _678 = _538;
    }
    float _798 = _678;
    float _800 = _734 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    float _802 = _798;
    if (!_628)
    {
        _736 = _540;
    }
    float _804 = _736;
    float _806 = _804;
    if (_628)
    {
        _802 = _536;
    }
    float _808 = _802;
    float _810 = exp2(_796);
    if (_628)
    {
        _806 = _538;
    }
    float _812 = _806;
    int _814 = _732 ? 0 : 1;
    float _816 = _808 * (*spvDescriptorSet0.vp_c9)._m0[82].x;
    int _818 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _820 = _818 != 0;
    int _822 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _824 = _822 != 0;
    int _826 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _828 = _826 != 0;
    float _830 = fma(_808, (*spvDescriptorSet0.vp_c9)._m0[83].z, _606);
    bool _832 = _454 >= (*spvDescriptorSet0.vp_c9)._m0[131].w;
    bool _834 = isnan(_454);
    bool _836 = _832 || _834;
    bool _838 = isnan((*spvDescriptorSet0.vp_c9)._m0[131].w);
    bool _840 = _836 || _838;
    float _842 = float(_840);
    float _844 = _812 * (*spvDescriptorSet0.vp_c9)._m0[82].y;
    bool _846 = _454 >= (*spvDescriptorSet0.vp_c9)._m0[132].w;
    bool _848 = isnan(_454);
    bool _850 = _846 || _848;
    bool _852 = isnan((*spvDescriptorSet0.vp_c9)._m0[132].w);
    bool _854 = _850 || _852;
    float _856 = float(_854);
    float _858 = -_856;
    float _860 = _858 + 1.0;
    float _862 = (*spvDescriptorSet0.vp_c9)._m0[82].x + (*spvDescriptorSet0.vp_c9)._m0[81].z;
    float _864 = _842 * _860;
    float _866 = -(*spvDescriptorSet0.vp_c9)._m0[167].w;
    float _868 = (*spvDescriptorSet0.vp_c9)._m0[168].w + _866;
    float _870 = -_862;
    float _872 = fma(_816, 2.0, _870);
    float _874 = -(*spvDescriptorSet0.vp_c9)._m0[168].w;
    float _876 = _874 + (*spvDescriptorSet0.vp_c9)._m0[169].w;
    float _878 = _716 * _864;
    float _880 = -_842;
    float _882 = _880 + 1.0;
    float _884 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _886 = 1.0 + _884;
    float _888 = (*spvDescriptorSet0.vp_c9)._m0[82].y + (*spvDescriptorSet0.vp_c9)._m0[81].w;
    float _890 = fma(_882, (*spvDescriptorSet0.vp_c9)._m0[131].x, _878);
    float _892 = -_810;
    float _894 = _892 + 1.0;
    int _896 = ~_814;
    int _898 = _896 + 1;
    int _900 = _898 + 1;
    float _902 = fma(_844, -2.0, _888);
    int _904 = _900;
    if (!_762)
    {
        int _906 = ~_814;
        int _908 = _906 + 1;
        _904 = _908;
    }
    int _910 = _904;
    float _912 = 1.0 / _868;
    bool _914 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _916 = isnan(0.0);
    bool _918 = _914 || _916;
    bool _920 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _922 = _918 || _920;
    float _924 = -(*spvDescriptorSet0.vp_c9)._m0[171].w;
    float _926 = (*spvDescriptorSet0.vp_c9)._m0[172].w + _924;
    float _928 = -_120;
    float _930 = fma(_928, (*spvDescriptorSet0.vp_c9)._m0[81].x, _872);
    bool _932 = !_564;
    float _934 = _932 ? _178 : as_type<float>(_652);
    float _936 = 1.0 / _876;
    float _938 = -(*spvDescriptorSet0.vp_c9)._m0[169].w;
    float _940 = (*spvDescriptorSet0.vp_c9)._m0[170].w + _938;
    bool _942 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[14].y;
    float _944 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    float _946 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    float _948 = fma(_120, (*spvDescriptorSet0.vp_c9)._m0[82].z, _830);
    bool _950 = !_828;
    int _952 = _950 ? 0 : 1;
    float _954 = fma(_536, (*spvDescriptorSet0.vp_c9)._m0[78].z, _944);
    float _956 = 1.0 / _886;
    float _958 = -(*spvDescriptorSet0.vp_c9)._m0[170].w;
    float _960 = _958 + (*spvDescriptorSet0.vp_c9)._m0[171].w;
    float _962 = _922 ? _894 : 0.0;
    float _964 = _934 + 0.5;
    bool _966 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _968 = isnan(1.0);
    bool _970 = _966 || _968;
    bool _972 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _974 = _970 || _972;
    float _976 = fma(_538, (*spvDescriptorSet0.vp_c9)._m0[78].w, _946);
    float _978 = fma(_800, _964, _930);
    float _980 = 1.0 / _940;
    float _982 = fma(_120, (*spvDescriptorSet0.vp_c9)._m0[77].z, _954);
    float _984 = fma(_120, (*spvDescriptorSet0.vp_c9)._m0[82].w, _764);
    float _986 = fma(_120, (*spvDescriptorSet0.vp_c9)._m0[77].w, _976);
    float _988 = fma(_120, (*spvDescriptorSet0.vp_c9)._m0[81].y, _902);
    float _990 = _538 + (-0.5);
    float _992 = -(*spvDescriptorSet0.vp_c9)._m0[172].w;
    float _994 = _992 + (*spvDescriptorSet0.vp_c9)._m0[173].w;
    float _996 = _536 + (-0.5);
    float _998 = 1.0 / _960;
    float _1000 = _956;
    if (_974)
    {
        float _1002 = _962 * _956;
        _144 = _1002;
    }
    float _1004 = _144;
    float _1006 = _540 + (-0.5);
    if (!_942)
    {
        _1000 = (*spvDescriptorSet0.vp_c7)._m0[0].x;
    }
    float _1008 = _1000;
    bool _1010 = !_820;
    int _1012 = _1010 ? 0 : 1;
    bool _1014 = !_824;
    int _1016 = _1014 ? 0 : 1;
    float _1018 = 1.0 / _926;
    bool _1020 = !_942;
    float _1022 = _1008;
    if (!_1020)
    {
        float _1024 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[14].y;
        float _1026 = _536 * (*spvDescriptorSet0.vp_c9)._m0[15].y;
        float _1028 = fma(_1026, (*spvDescriptorSet0.vp_c9)._m0[14].y, (*spvDescriptorSet0.vp_c7)._m0[0].x);
        float _1030 = _1028 * _1024;
        float _1032 = floor(_1030);
        float _1034 = -_1032;
        float _1036 = _1030 + _1034;
        _1022 = _1036;
    }
    float _1038 = _1022;
    int _1040 = abs(_1012);
    float _1042 = 1.0 / _994;
    int _1044 = abs(_1016);
    float _1046 = -_506;
    float _1048 = fma(_1046, (*spvDescriptorSet0.vp_c9)._m0[18].w, _492);
    float _1050 = float(_742);
    float _1052 = -_508;
    float _1054 = fma(_1052, (*spvDescriptorSet0.vp_c9)._m0[18].w, _496);
    int _1056 = abs(_952);
    float _1058 = -(*spvDescriptorSet0.vp_c9)._m0[171].w;
    float _1060 = _1038 + _1058;
    float _1062 = float(_1040);
    float _1064 = -(*spvDescriptorSet0.vp_c9)._m0[167].w;
    float _1066 = _1038 + _1064;
    float _1068 = float(_792);
    float _1070 = -(*spvDescriptorSet0.vp_c9)._m0[170].w;
    float _1072 = _1038 + _1070;
    float _1074 = float(_1056);
    float _1076 = _1066 * _912;
    float _1078 = -(*spvDescriptorSet0.vp_c9)._m0[169].w;
    float _1080 = _1038 + _1078;
    float _1082 = _1062 * _1050;
    float _1084 = _1074 * _1068;
    float _1086 = _1080 * _980;
    float _1088 = -(*spvDescriptorSet0.vp_c9)._m0[168].w;
    float _1090 = _1038 + _1088;
    float _1092 = _1072 * _998;
    float _1094 = -(*spvDescriptorSet0.vp_c9)._m0[167].x;
    float _1096 = (*spvDescriptorSet0.vp_c9)._m0[168].x + _1094;
    float _1098 = float(_910);
    float _1100 = -(*spvDescriptorSet0.vp_c9)._m0[172].w;
    float _1102 = _1038 + _1100;
    float _1104 = float(_1044);
    float _1106 = _1090 * _936;
    float _1108 = fma(_1096, _1076, (*spvDescriptorSet0.vp_c9)._m0[167].x);
    float _1110 = _1102 * _1042;
    float _1112 = _1060 * _1018;
    float _1114 = _1104 * _1098;
    float _1116 = in.m_55.x;
    float _1118 = in.m_55.y;
    float _1120 = in.m_55.z;
    float _1122 = _1084 * (-2.0);
    float _1124 = _1114 * (-2.0);
    float _1126 = -(*spvDescriptorSet0.vp_c9)._m0[167].z;
    float _1128 = (*spvDescriptorSet0.vp_c9)._m0[168].z + _1126;
    float _1130 = -(*spvDescriptorSet0.vp_c9)._m0[170].y;
    float _1132 = _1130 + (*spvDescriptorSet0.vp_c9)._m0[171].y;
    float _1134 = fma(_684, _1124, _684);
    float _1136 = fma(_1128, _1076, (*spvDescriptorSet0.vp_c9)._m0[167].z);
    float _1138 = -(*spvDescriptorSet0.vp_c9)._m0[169].y;
    float _1140 = (*spvDescriptorSet0.vp_c9)._m0[170].y + _1138;
    float _1142 = _1082 * (-2.0);
    float _1144 = _488 * _504;
    float _1146 = -(*spvDescriptorSet0.vp_c9)._m0[173].w;
    float _1148 = (*spvDescriptorSet0.vp_c9)._m0[174].w + _1146;
    float _1150 = -(*spvDescriptorSet0.vp_c9)._m0[167].y;
    float _1152 = (*spvDescriptorSet0.vp_c9)._m0[168].y + _1150;
    float _1154 = -_1144;
    float _1156 = fma(_1154, (*spvDescriptorSet0.vp_c9)._m0[18].w, _488);
    float _1158 = 1.0 / _1148;
    float _1160 = fma(_722, _1142, _722);
    float _1162 = -(*spvDescriptorSet0.vp_c9)._m0[170].z;
    float _1164 = _1162 + (*spvDescriptorSet0.vp_c9)._m0[171].z;
    float _1166 = _1156 * _1156;
    float _1168 = fma(_1152, _1076, (*spvDescriptorSet0.vp_c9)._m0[167].y);
    float _1170 = fma(_1124, _1118, _1118);
    float _1172 = fma(_660, _1122, _660);
    float _1174 = fma(_1048, _1048, _1166);
    bool _1176 = _1038 >= (*spvDescriptorSet0.vp_c9)._m0[172].w;
    bool _1178 = isnan(_1038);
    bool _1180 = _1176 || _1178;
    bool _1182 = isnan((*spvDescriptorSet0.vp_c9)._m0[172].w);
    bool _1184 = _1180 || _1182;
    float _1186 = float(_1184);
    float _1188 = fma(_1122, _1120, _1120);
    float _1190 = fma(_990, (*spvDescriptorSet0.vp_c9)._m0[196].y, _1170);
    float _1192 = fma(_1054, _1054, _1174);
    bool _1194 = _1038 >= (*spvDescriptorSet0.vp_c9)._m0[171].w;
    bool _1196 = isnan(_1038);
    bool _1198 = _1194 || _1196;
    bool _1200 = isnan((*spvDescriptorSet0.vp_c9)._m0[171].w);
    bool _1202 = _1198 || _1200;
    float _1204 = float(_1202);
    float _1206 = -(*spvDescriptorSet0.vp_c9)._m0[168].x;
    float _1208 = _1206 + (*spvDescriptorSet0.vp_c9)._m0[169].x;
    float _1210 = -_1186;
    float _1212 = _1210 + 1.0;
    float _1214 = -(*spvDescriptorSet0.vp_c9)._m0[168].y;
    float _1216 = _1214 + (*spvDescriptorSet0.vp_c9)._m0[169].y;
    float _1218 = -(*spvDescriptorSet0.vp_c9)._m0[169].z;
    float _1220 = (*spvDescriptorSet0.vp_c9)._m0[170].z + _1218;
    float _1222 = fma(_1006, (*spvDescriptorSet0.vp_c9)._m0[196].z, _1188);
    float _1224 = fma(_1142, _1116, _1116);
    float _1226 = fma(_1134, _1004, _1190);
    bool _1228 = _1038 >= (*spvDescriptorSet0.vp_c9)._m0[170].w;
    bool _1230 = isnan(_1038);
    bool _1232 = _1228 || _1230;
    bool _1234 = isnan((*spvDescriptorSet0.vp_c9)._m0[170].w);
    bool _1236 = _1232 || _1234;
    float _1238 = float(_1236);
    float _1240 = _1204 * _1212;
    float _1242 = -_1204;
    float _1244 = _1242 + 1.0;
    bool _1246 = _1038 >= (*spvDescriptorSet0.vp_c9)._m0[169].w;
    bool _1248 = isnan(_1038);
    bool _1250 = _1246 || _1248;
    bool _1252 = isnan((*spvDescriptorSet0.vp_c9)._m0[169].w);
    bool _1254 = _1250 || _1252;
    float _1256 = float(_1254);
    float _1258 = _1226 * 0.15915493667125701904296875;
    float _1260 = fma(_996, (*spvDescriptorSet0.vp_c9)._m0[196].x, _1224);
    float _1262 = _1238 * _1244;
    bool _1264 = _1038 >= (*spvDescriptorSet0.vp_c9)._m0[168].w;
    bool _1266 = isnan(_1038);
    bool _1268 = _1264 || _1266;
    bool _1270 = isnan((*spvDescriptorSet0.vp_c9)._m0[168].w);
    bool _1272 = _1268 || _1270;
    float _1274 = float(_1272);
    float _1276 = -_1256;
    float _1278 = _1276 + 1.0;
    float _1280 = sqrt(_1192);
    float _1282 = fma(_1160, _1004, _1260);
    bool _1284 = _1038 >= (*spvDescriptorSet0.vp_c9)._m0[167].w;
    bool _1286 = isnan(_1038);
    bool _1288 = _1284 || _1286;
    bool _1290 = isnan((*spvDescriptorSet0.vp_c9)._m0[167].w);
    bool _1292 = _1288 || _1290;
    float _1294 = float(_1292);
    float _1296 = -(*spvDescriptorSet0.vp_c9)._m0[173].w;
    float _1298 = _1038 + _1296;
    float _1300 = -(*spvDescriptorSet0.vp_c9)._m0[168].z;
    float _1302 = _1300 + (*spvDescriptorSet0.vp_c9)._m0[169].z;
    float _1304 = -(*spvDescriptorSet0.vp_c9)._m0[169].x;
    float _1306 = (*spvDescriptorSet0.vp_c9)._m0[170].x + _1304;
    float _1308 = fma(_1216, _1106, (*spvDescriptorSet0.vp_c9)._m0[168].y);
    float _1310 = _1298 * _1158;
    float _1312 = -_1238;
    float _1314 = _1312 + 1.0;
    float _1316 = _1274 * _1278;
    float _1318 = -_1274;
    float _1320 = _1318 + 1.0;
    float _1322 = fma(_1208, _1106, (*spvDescriptorSet0.vp_c9)._m0[168].x);
    float _1324 = fma(_1302, _1106, (*spvDescriptorSet0.vp_c9)._m0[168].z);
    float _1326 = fma(_1306, _1086, (*spvDescriptorSet0.vp_c9)._m0[169].x);
    float _1328 = _1294 * _1320;
    float _1330 = -_1294;
    float _1332 = _1330 + 1.0;
    float _1334 = _1282 * 0.15915493667125701904296875;
    float _1336 = fma(_1140, _1086, (*spvDescriptorSet0.vp_c9)._m0[169].y);
    float _1338 = _1168 * _1328;
    float _1340 = _1256 * _1314;
    float _1342 = fma(_1172, _1004, _1222);
    float _1344 = fma(_1220, _1086, (*spvDescriptorSet0.vp_c9)._m0[169].z);
    float _1346 = fma(_1332, (*spvDescriptorSet0.vp_c9)._m0[167].y, _1338);
    float _1348 = _1108 * _1328;
    float _1350 = fma(_1132, _1092, (*spvDescriptorSet0.vp_c9)._m0[170].y);
    bool _1352 = _1038 >= (*spvDescriptorSet0.vp_c9)._m0[173].w;
    bool _1354 = isnan(_1038);
    bool _1356 = _1352 || _1354;
    bool _1358 = isnan((*spvDescriptorSet0.vp_c9)._m0[173].w);
    bool _1360 = _1356 || _1358;
    float _1362 = float(_1360);
    float _1364 = fma(_1308, _1316, _1346);
    bool _1366 = _1038 >= (*spvDescriptorSet0.vp_c9)._m0[174].w;
    bool _1368 = isnan(_1038);
    bool _1370 = _1366 || _1368;
    bool _1372 = isnan((*spvDescriptorSet0.vp_c9)._m0[174].w);
    bool _1374 = _1370 || _1372;
    float _1376 = float(_1374);
    float _1378 = _1342 * 0.15915493667125701904296875;
    float _1380 = _1334 * 6.283185482025146484375;
    float _1382 = sin(_1380);
    float _1384 = fma(_1336, _1340, _1364);
    float _1386 = fma(_1332, (*spvDescriptorSet0.vp_c9)._m0[167].x, _1348);
    float _1388 = _1136 * _1328;
    float _1390 = -(*spvDescriptorSet0.vp_c9)._m0[170].x;
    float _1392 = _1390 + (*spvDescriptorSet0.vp_c9)._m0[171].x;
    float _1394 = fma(_1350, _1262, _1384);
    float _1396 = fma(_1322, _1316, _1386);
    float _1398 = fma(_1332, (*spvDescriptorSet0.vp_c9)._m0[167].z, _1388);
    float _1400 = _1258 * 6.283185482025146484375;
    float _1402 = sin(_1400);
    float _1404 = fma(_1392, _1092, (*spvDescriptorSet0.vp_c9)._m0[170].x);
    float _1406 = fma(_1326, _1340, _1396);
    float _1408 = fma(_1324, _1316, _1398);
    float _1410 = fma(_1404, _1262, _1406);
    float _1412 = _504 * _1280;
    float _1414 = _1258 * 6.283185482025146484375;
    float _1416 = cos(_1414);
    float _1418 = -(*spvDescriptorSet0.vp_c9)._m0[171].x;
    float _1420 = (*spvDescriptorSet0.vp_c9)._m0[172].x + _1418;
    float _1422 = -(*spvDescriptorSet0.vp_c9)._m0[171].y;
    float _1424 = (*spvDescriptorSet0.vp_c9)._m0[172].y + _1422;
    float _1426 = _384 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _1428 = -_1362;
    float _1430 = _1428 + 1.0;
    float _1432 = fma(_1420, _1112, (*spvDescriptorSet0.vp_c9)._m0[171].x);
    float _1434 = fma(_1424, _1112, (*spvDescriptorSet0.vp_c9)._m0[171].y);
    float _1436 = -(*spvDescriptorSet0.vp_c9)._m0[172].x;
    float _1438 = _1436 + (*spvDescriptorSet0.vp_c9)._m0[173].x;
    float _1440 = _1334 * 6.283185482025146484375;
    float _1442 = cos(_1440);
    float _1444 = _1382 * _1402;
    float _1446 = _1426 * _1412;
    float _1448 = _1186 * _1430;
    float _1450 = -_1376;
    float _1452 = _1450 + 1.0;
    float _1454 = fma(_1438, _1110, (*spvDescriptorSet0.vp_c9)._m0[172].x);
    float _1456 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _188);
    float _1458 = fma(_1164, _1092, (*spvDescriptorSet0.vp_c9)._m0[170].z);
    float _1460 = _1378 * 6.283185482025146484375;
    float _1462 = cos(_1460);
    float _1464 = _1382 * _1416;
    float _1466 = _1362 * _1452;
    float _1468 = fma(_1344, _1340, _1408);
    float _1470 = fma(_856, (*spvDescriptorSet0.vp_c9)._m0[132].x, _890);
    float _1472 = -(*spvDescriptorSet0.vp_c10)._m0[9].w;
    float _1474 = _480 + _1472;
    float _1476 = _700 + 0.5;
    float _1478 = fma(_1458, _1262, _1468);
    float _1480 = _1378 * 6.283185482025146484375;
    float _1482 = sin(_1480);
    float _1484 = _1442 * _1416;
    float _1486 = _1442 * _1402;
    float _1488 = -_720;
    float _1490 = _1488 + 0.5;
    float _1492 = _1476 * (*spvDescriptorSet0.vp_c9)._m0[90].x;
    float _1494 = _1416 * _1462;
    float _1496 = _1402 * _1462;
    float _1498 = _1382 * _1462;
    float _1500 = _382 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _1502 = _1442 * _1462;
    float _1504 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _178);
    float _1506 = fma(_1432, _1240, _1410);
    float _1508 = fma(_1434, _1240, _1394);
    float _1510 = fma(_1482, _1484, _1444);
    float _1512 = fma(_1482, _1444, _1484);
    float _1514 = -_1486;
    float _1516 = fma(_1482, _1464, _1514);
    float _1518 = -_1464;
    float _1520 = fma(_1482, _1486, _1518);
    float _1522 = -(*spvDescriptorSet0.vp_c9)._m0[172].y;
    float _1524 = _1522 + (*spvDescriptorSet0.vp_c9)._m0[173].y;
    float _1526 = _1500 * _1412;
    float _1528 = fma(_1524, _1110, (*spvDescriptorSet0.vp_c9)._m0[172].y);
    float _1530 = _1446 * _1504;
    float _1532 = -(*spvDescriptorSet0.vp_c9)._m0[173].x;
    float _1534 = (*spvDescriptorSet0.vp_c9)._m0[174].x + _1532;
    float _1536 = _1412 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _1538 = _1536 * 0.5;
    float _1540 = fma(_1528, _1448, _1508);
    float _1542 = -(*spvDescriptorSet0.vp_c9)._m0[173].y;
    float _1544 = (*spvDescriptorSet0.vp_c9)._m0[174].y + _1542;
    float _1546 = fma(_1454, _1448, _1506);
    float _1548 = fma(_1534, _1310, (*spvDescriptorSet0.vp_c9)._m0[173].x);
    float _1550 = _1526 * _1456;
    float _1552 = _1502 * _1538;
    float _1554 = fma(_1544, _1310, (*spvDescriptorSet0.vp_c9)._m0[173].y);
    float _1556 = _1498 * _1538;
    float _1558 = fma(_1548, _1466, _1546);
    float _1560 = _1482 * _1538;
    float _1562 = fma(_1510, _1530, _1552);
    float _1564 = fma(_1554, _1466, _1540);
    float _1566 = fma(_1516, _1530, _1556);
    float _1568 = (*spvDescriptorSet0.vp_c9)._m0[175].x * (*spvDescriptorSet0.vp_c10)._m0[10].z;
    float _1570 = -(*spvDescriptorSet0.vp_c10)._m0[10].w;
    float _1572 = _484 + _1570;
    float _1574 = fma(_1376, (*spvDescriptorSet0.vp_c9)._m0[174].x, _1558);
    float _1576 = -_1560;
    float _1578 = fma(_1494, _1530, _1576);
    float _1580 = -_1550;
    float _1582 = fma(_1520, _1580, _1562);
    float _1584 = -_1144;
    float _1586 = fma(_1584, (*spvDescriptorSet0.vp_c9)._m0[18].w, _480);
    float _1588 = -_1568;
    float _1590 = fma(_1574, _1572, _1588);
    float _1592 = -_1550;
    float _1594 = fma(_1496, _1592, _1578);
    float _1596 = _1582 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    float _1598 = -_1550;
    float _1600 = fma(_1512, _1598, _1566);
    float _1602 = _1582 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    float _1604 = (*spvDescriptorSet0.vp_c9)._m0[175].x * (*spvDescriptorSet0.vp_c10)._m0[8].z;
    float _1606 = fma(_1594, (*spvDescriptorSet0.vp_c10)._m0[10].x, _1596);
    float _1608 = -(*spvDescriptorSet0.vp_c10)._m0[8].w;
    float _1610 = _482 + _1608;
    float _1612 = _1586 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _1614 = fma(_1594, (*spvDescriptorSet0.vp_c10)._m0[8].x, _1602);
    float _1616 = fma(_1376, (*spvDescriptorSet0.vp_c9)._m0[174].y, _1564);
    float _1618 = fma(_1600, (*spvDescriptorSet0.vp_c10)._m0[10].z, _1606);
    float _1620 = -_1604;
    float _1622 = fma(_1574, _1610, _1620);
    float _1624 = fma(_512, (*spvDescriptorSet0.vp_c8)._m0[11].x, _1612);
    float _1626 = fma(_1600, (*spvDescriptorSet0.vp_c10)._m0[8].z, _1614);
    float _1628 = fma(_1618, _1616, _1590);
    float _1630 = _1586 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _1632 = fma(_516, (*spvDescriptorSet0.vp_c8)._m0[11].z, _1624);
    float _1634 = fma(_1626, _1616, _1622);
    float _1636 = _1628 + (*spvDescriptorSet0.vp_c10)._m0[10].w;
    float _1638 = fma(_512, (*spvDescriptorSet0.vp_c8)._m0[10].x, _1630);
    float _1640 = _1632 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _1642 = _1634 + (*spvDescriptorSet0.vp_c10)._m0[8].w;
    float _1644 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1646 = _1636 + _1644;
    float _1648 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    float _1650 = fma(_516, (*spvDescriptorSet0.vp_c8)._m0[10].z, _1638);
    float _1652 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1654 = _1642 + _1652;
    float _1656 = _1646 * _1646;
    float _1658 = _1650 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _1660 = -_188;
    int _1662 = _574 ? as_type<int>(_1660) : as_type<int>(_188);
    float _1664 = fma(_1654, _1654, _1656);
    float _1666 = 1.0 / _1640;
    float _1668 = -(*spvDescriptorSet0.vp_c9)._m0[171].z;
    float _1670 = (*spvDescriptorSet0.vp_c9)._m0[172].z + _1668;
    float _1672 = _1658 + _1640;
    float _1674 = -(*spvDescriptorSet0.vp_c9)._m0[172].z;
    float _1676 = _1674 + (*spvDescriptorSet0.vp_c9)._m0[173].z;
    bool _1678 = !_556;
    float _1680 = _1678 ? _188 : as_type<float>(_1662);
    float _1682 = fma(_1670, _1112, (*spvDescriptorSet0.vp_c9)._m0[171].z);
    float _1684 = _1582 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _1686 = sqrt(_1664);
    float _1688 = fma(_1676, _1110, (*spvDescriptorSet0.vp_c9)._m0[172].z);
    float _1690 = (*spvDescriptorSet0.vp_c9)._m0[175].x * (*spvDescriptorSet0.vp_c10)._m0[9].z;
    float _1692 = -(*spvDescriptorSet0.vp_c9)._m0[173].z;
    float _1694 = (*spvDescriptorSet0.vp_c9)._m0[174].z + _1692;
    float _1696 = _1648 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    float _1698 = _1680 + (-0.5);
    float _1700 = fma(_1594, (*spvDescriptorSet0.vp_c10)._m0[9].x, _1684);
    float _1702 = -_1690;
    float _1704 = fma(_1574, _1474, _1702);
    float _1706 = _1672 * _1666;
    float _1708 = _1706 * 0.5;
    float _1710 = -_1696;
    float _1712 = -_988;
    float _1714 = fma(_1710, _1698, _1712);
    float _1716 = fma(_1682, _1240, _1478);
    float _1718 = fma(_1600, (*spvDescriptorSet0.vp_c10)._m0[9].z, _1700);
    float _1720 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _1722 = fma(_1708, (*spvDescriptorSet0.vp_c8)._m0[30].w, _1720);
    float _1724 = fma(_1694, _1310, (*spvDescriptorSet0.vp_c9)._m0[173].z);
    float _1726 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].z;
    float _1728 = fma(_1718, _1616, _1704);
    bool _1730 = _1686 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1732 = fma(_1688, _1448, _1716);
    float _1734 = _1728 + (*spvDescriptorSet0.vp_c10)._m0[9].w;
    float _1736 = fma(_1724, _1466, _1732);
    float _1738 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].w;
    float _1740 = _1490 * (*spvDescriptorSet0.vp_c9)._m0[90].y;
    float _1742 = (*spvDescriptorSet0.vp_c8)._m0[30].w;
    float _1744 = _1642;
    float _1746 = _1636;
    if (!_1730)
    {
        _1742 = _1734;
    }
    float _1748 = _1742;
    float _1750 = 1.0 / _1722;
    bool _1752 = !_1730;
    float _1754 = _1748;
    if (!_1752)
    {
        float _1756 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1758 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1760 = _1686 + _1758;
        float _1762 = _1734 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1764 = rsqrt(_1664);
        float _1766 = _1760 * _1756;
        float _1768 = _1766 * 0.15915493667125701904296875;
        float _1770 = _1768 * 6.283185482025146484375;
        float _1772 = cos(_1770);
        float _1774 = _1768 * 6.283185482025146484375;
        float _1776 = sin(_1774);
        float _1778 = _1772 + (-1.0);
        float _1780 = fma(_1776, _1762, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1782 = _1778 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1784 = _1764 * _1780;
        float _1786 = fma(_1734, _1772, _1782);
        float _1788 = fma(_1654, _1784, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1790 = fma(_1646, _1784, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _1754 = _1786;
        _1744 = _1788;
        _1746 = _1790;
    }
    float _1792 = _1754;
    float _1794 = _1744;
    float _1796 = _1746;
    float _1798 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _1800 = _1750 * _1798;
    float _1802 = _1492 * _1726;
    float _1804 = _1740 * _1738;
    float _1806 = -_480;
    float _1808 = _1806 + _1792;
    float _1810 = abs(_1800);
    float _1812 = log2(_1810);
    float _1814 = -_982;
    float _1816 = _1814 + 1.0;
    float _1818 = -_482;
    float _1820 = _1818 + _1794;
    float _1822 = _1808 * _1808;
    float _1824 = -_986;
    float _1826 = _1824 + 1.0;
    float _1828 = -_948;
    float _1830 = _1828 + 1.0;
    float _1832 = -_484;
    float _1834 = _1832 + _1796;
    float _1836 = fma(_1820, _1820, _1822);
    float _1838 = -_1816;
    float _1840 = fma(_600, _1838, _794);
    float _1842 = fma(_620, _1826, _784);
    float _1844 = -_1830;
    float _1846 = fma(_934, _1844, _978);
    float _1848 = fma(_1834, _1834, _1836);
    float _1850 = -_984;
    float _1852 = _1850 + 1.0;
    float _1854 = sqrt(_1848);
    float _1856 = _1812 * (*spvDescriptorSet0.vp_c15)._m0[654].z;
    float _1858 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _1860 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _1862 = fma(_1680, _1852, _1714);
    float _1864 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _1866 = _1858 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1868 = _1860 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1870 = _1470 * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    float _1872 = _1864 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1874 = fma(_1376, (*spvDescriptorSet0.vp_c9)._m0[174].z, _1736);
    float _1876 = exp2(_1856);
    out.m_57.x = _1802;
    out.m_57.y = _1804;
    float _1878 = _178 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    bool _1880 = _1854 > 0.0;
    out.m_59.x = _1840;
    out.m_59.y = _1842;
    out.m_59.z = _1846;
    out.m_59.w = _1862;
    float _1882 = -_1482;
    float _1884 = fma(_1494, _1878, _1882);
    out.m_61.x = _1866;
    out.m_61.y = _1868;
    out.m_61.z = _1872;
    out.m_61.w = _1870;
    float _1886 = fma(_1510, _1878, _1502);
    bool _1888 = (*spvDescriptorSet0.vp_c15)._m0[660].y >= 0.5;
    bool _1890 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _1892 = _1888 || _1890;
    bool _1894 = isnan(0.5);
    bool _1896 = _1892 || _1894;
    out.m_63.x = _1874;
    float _1898 = fma(_1516, _1878, _1498);
    float _1900 = fma(_1876, (*spvDescriptorSet0.vp_c15)._m0[654].x, (*spvDescriptorSet0.vp_c15)._m0[654].y);
    float _1902 = precise::clamp(_1900, 0.0, 1.0);
    out.m_65.x = _424;
    out.m_65.y = _430;
    out.m_65.z = _432;
    out.m_65.w = _434;
    float _1904 = _188 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    float _1906 = fma(_1902, -2.0, 3.0);
    float _1908 = _1902 * _1902;
    float _1910 = -_1904;
    float _1912 = fma(_1496, _1910, _1884);
    float _1914 = -_1904;
    float _1916 = fma(_1520, _1914, _1886);
    float _1918 = _1908 * _1906;
    bool _1920 = !_1880;
    float _1922 = _1794;
    float _1924 = _1792;
    float _1926 = _1796;
    if (!_1920)
    {
        float _1928 = _192 * _192;
        float _1930 = rsqrt(_1848);
        float _1932 = fma(_190, _190, _1928);
        float _1934 = fma(_194, _194, _1932);
        float _1936 = sqrt(_1934);
        float _1938 = _1820 * _1930;
        float _1940 = _1808 * _1930;
        float _1942 = _1834 * _1930;
        bool _1944 = _1936 > 0.0;
        bool _1946 = !_1944;
        if (!_1946)
        {
            float _1948 = rsqrt(_1934);
            float _1950 = 1.0 / (*spvDescriptorSet0.vp_c10)._m0[2].z;
            float _1952 = _192 * _1948;
            float _1954 = _190 * _1948;
            float _1956 = _1940 * _1952;
            float _1958 = _194 * _1948;
            float _1960 = fma(_1938, _1954, _1956);
            float _1962 = _1950 * (*spvDescriptorSet0.vp_c9)._m0[142].x;
            float _1964 = fma(_1942, _1958, _1960);
            float _1966 = _1964 * _1962;
            float _1968 = fma(_190, _1966, _1794);
            float _1970 = fma(_192, _1966, _1792);
            float _1972 = fma(_194, _1966, _1796);
            _1922 = _1968;
            _1924 = _1970;
            _1926 = _1972;
        }
    }
    float _1974 = _1922;
    float _1976 = _1924;
    float _1978 = _1926;
    float _1980 = -_506;
    float _1982 = fma(_1980, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1974);
    float _1984 = -_1144;
    float _1986 = fma(_1984, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1976);
    float _1988 = -_508;
    float _1990 = fma(_1988, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1978);
    float _1992 = -_1904;
    float _1994 = fma(_1512, _1992, _1898);
    float _1996 = -_1918;
    float _1998 = _1996 + 1.0;
    float _2000 = _1986;
    float _2002 = _1982;
    float _2004 = _1990;
    if (!_1896)
    {
        float _2006 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
        float _2008 = _1586 + _2006;
        float _2010 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
        float _2012 = _512 + _2010;
        float _2014 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _2016 = -_484;
        float _2018 = _2016 + _1978;
        float _2020 = _2008 * _2008;
        float _2022 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
        float _2024 = _516 + _2022;
        float _2026 = fma(_2012, _2012, _2020);
        float _2028 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _2030 = fma(_2024, _2024, _2026);
        float _2032 = sqrt(_2030);
        float _2034 = 1.0 / _1412;
        float _2036 = _2028 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _2038 = precise::min(_2032, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _2040 = _2038 * _2014;
        float _2042 = -_480;
        float _2044 = _2042 + _1976;
        float _2046 = _2040 * _2034;
        float _2048 = -_482;
        float _2050 = _2048 + _1974;
        float _2052 = _2036 * _2046;
        float _2054 = _2018 * _2046;
        float _2056 = fma(_2050, _2052, _512);
        float _2058 = fma(_2044, _2052, _1586);
        float _2060 = fma(_2036, _2054, _516);
        _2000 = _2058;
        _2002 = _2056;
        _2004 = _2060;
    }
    float _2062 = _2000;
    float _2064 = _2002;
    float _2066 = _2004;
    float _2068 = _2062 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _2070 = fma(_1998, (*spvDescriptorSet0.vp_c15)._m0[654].w, _1918);
    float _2072 = _2062 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _2074 = _2062 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _2076 = fma(_2064, (*spvDescriptorSet0.vp_c8)._m0[1].x, _2068);
    float _2078 = _2062 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _2080 = fma(_2064, (*spvDescriptorSet0.vp_c8)._m0[0].x, _2072);
    float _2082 = fma(_2064, (*spvDescriptorSet0.vp_c8)._m0[2].x, _2074);
    float _2084 = fma(_2066, (*spvDescriptorSet0.vp_c8)._m0[1].z, _2076);
    float _2086 = fma(_2064, (*spvDescriptorSet0.vp_c8)._m0[3].x, _2078);
    float _2088 = fma(_2066, (*spvDescriptorSet0.vp_c8)._m0[0].z, _2080);
    float _2090 = fma(_2066, (*spvDescriptorSet0.vp_c8)._m0[2].z, _2082);
    float _2092 = _2084 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _2094 = fma(_2066, (*spvDescriptorSet0.vp_c8)._m0[3].z, _2086);
    float _2096 = _2088 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _2098 = _2090 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _2100 = _2092 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _2102 = _2092 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _2104 = _2092 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _2106 = _2092 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _2108 = fma(_2096, (*spvDescriptorSet0.vp_c8)._m0[4].x, _2100);
    float _2110 = fma(_2096, (*spvDescriptorSet0.vp_c8)._m0[5].x, _2102);
    float _2112 = fma(_2096, (*spvDescriptorSet0.vp_c8)._m0[6].x, _2104);
    float _2114 = fma(_2096, (*spvDescriptorSet0.vp_c8)._m0[7].x, _2106);
    float _2116 = _2094 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _2118 = fma(_2098, (*spvDescriptorSet0.vp_c8)._m0[4].z, _2108);
    float _2120 = fma(_2098, (*spvDescriptorSet0.vp_c8)._m0[5].z, _2110);
    float _2122 = fma(_2098, (*spvDescriptorSet0.vp_c8)._m0[6].z, _2112);
    float _2124 = fma(_2098, (*spvDescriptorSet0.vp_c8)._m0[7].z, _2114);
    float _2126 = in.m_67.x;
    float _2128 = _1916 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    float _2130 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _2132 = _2062 + _2130;
    bool _2134 = _1800 <= 8000.0;
    bool _2136 = isnan(_1800);
    bool _2138 = _2134 || _2136;
    bool _2140 = isnan(8000.0);
    bool _2142 = _2138 || _2140;
    float _2144 = float(_2142);
    float _2146 = fma(_2116, (*spvDescriptorSet0.vp_c8)._m0[6].w, _2122);
    float _2148 = fma(_1912, (*spvDescriptorSet0.vp_c10)._m0[8].x, _2128);
    float _2150 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _2152 = _2064 + _2150;
    float _2154 = _2132 * _2132;
    float _2156 = _2144 * _2070;
    float _2158 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _2160 = _2066 + _2158;
    float _2162 = -_534;
    float _2164 = _2162 + 1.0;
    float _2166 = fma(_2152, _2152, _2154);
    float _2168 = _2156 * (*spvDescriptorSet0.vp_c15)._m0[653].x;
    float _2170 = fma(_2116, (*spvDescriptorSet0.vp_c8)._m0[4].w, _2118);
    float _2172 = fma(_2116, (*spvDescriptorSet0.vp_c8)._m0[5].w, _2120);
    float _2174 = fma(_2160, _2160, _2166);
    float _2176 = _2164 * _2168;
    float _2178 = precise::clamp(_2176, 0.0, 1.0);
    float _2180 = fma(_2116, (*spvDescriptorSet0.vp_c8)._m0[7].w, _2124);
    float _2182 = _1916 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _2184 = _1916 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    float _2186 = -_2178;
    float _2188 = fma(_2186, (*spvDescriptorSet0.vp_c15)._m0[653].y, 1.0);
    float _2190 = sqrt(_2174);
    float _2192 = fma(_1912, (*spvDescriptorSet0.vp_c10)._m0[9].x, _2182);
    float _2194 = fma(_1912, (*spvDescriptorSet0.vp_c10)._m0[10].x, _2184);
    float _2196 = _2188 * _2126;
    float _2198 = fma(_1994, (*spvDescriptorSet0.vp_c10)._m0[8].z, _2148);
    float _2200 = fma(_1994, (*spvDescriptorSet0.vp_c10)._m0[9].z, _2192);
    float _2202 = fma(_1994, (*spvDescriptorSet0.vp_c10)._m0[10].z, _2194);
    float _2204 = _2196 * (*spvDescriptorSet0.vp_c13)._m0[1].w;
    out.gl_Position.x = _2170;
    out.gl_Position.y = _2172;
    out.gl_Position.z = _2146;
    out.gl_Position.w = _2180;
    out.m_69.x = _2204;
    bool _2206 = _2190 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _2208 = isnan(_2190);
    bool _2210 = _2206 || _2208;
    bool _2212 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _2214 = _2210 || _2212;
    out.m_71.x = _2198;
    out.m_71.y = _2200;
    out.m_71.z = _2202;
    float _2216 = _2192;
    float _2218 = (*spvDescriptorSet0.vp_c15)._m0[653].y;
    float _2220 = _2180;
    float _2222 = _2146;
    float _2224 = _2172;
    float _2226 = _2170;
    if (!_2214)
    {
        _2216 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _2228 = _2216;
    float _2230 = _2228;
    float _2232 = _2228;
    if (!_2214)
    {
        _2218 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _2234 = _2218;
    float _2236 = _2234;
    float _2238 = _2234;
    if (!_2214)
    {
        _2220 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _2240 = _2220;
    float _2242 = _2240;
    float _2244 = _2240;
    if (!_2214)
    {
        _2222 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _2246 = _2222;
    float _2248 = _2246;
    float _2250 = _2246;
    if (!_2214)
    {
        _2224 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _2252 = _2224;
    float _2254 = _2252;
    float _2256 = _2252;
    if (!_2214)
    {
        _2226 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _2258 = _2226;
    bool _2260 = !_2214;
    float _2262 = _2258;
    float _2264 = _2258;
    if (!_2260)
    {
        bool _2266 = _2190 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _2268 = isnan(_2190);
        bool _2270 = _2266 || _2268;
        bool _2272 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _2274 = _2270 || _2272;
        if (!_2274)
        {
            float _2276 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2278 = _2190 + _2276;
            float _2280 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2282 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _2280;
            float _2284 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _2286 = _2284 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _2288 = 1.0 / _2282;
            float _2290 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _2292 = _2290 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _2294 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _2296 = _2294 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _2298 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _2300 = _2298 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _2302 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _2304 = _2302 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _2306 = _2278 * _2288;
            float _2308 = precise::clamp(_2306, 0.0, 1.0);
            float _2310 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _2312 = _2310 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _2314 = fma(_2308, _2286, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _2316 = fma(_2308, _2312, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _2318 = fma(_2308, _2292, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _2320 = fma(_2308, _2296, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _2322 = fma(_2308, _2300, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _2324 = fma(_2308, _2304, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            _2238 = _2314;
            _2256 = _2322;
            _2232 = _2318;
            _2250 = _2320;
            _2244 = _2316;
            _2264 = _2324;
            _2326 = true;
        }
        else
        {
            bool _2328 = _2190 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _2330 = isnan(_2190);
            bool _2332 = _2328 || _2330;
            bool _2334 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _2336 = _2332 || _2334;
            if (!_2336)
            {
                _2230 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _2338 = _2230;
            _2232 = _2338;
            if (!_2336)
            {
                _2236 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _2340 = _2236;
            _2238 = _2340;
            if (!_2336)
            {
                _2242 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _2342 = _2242;
            _2244 = _2342;
            if (!_2336)
            {
                _2248 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _2344 = _2248;
            _2250 = _2344;
            if (!_2336)
            {
                _2254 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _2346 = _2254;
            _2256 = _2346;
            if (!_2336)
            {
                _2262 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _2348 = _2262;
            bool _2350 = !_2336;
            _2264 = _2348;
            if (!_2350)
            {
                bool _2352 = _2190 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _2354 = isnan(_2190);
                bool _2356 = _2352 || _2354;
                bool _2358 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _2360 = _2356 || _2358;
                if (!_2360)
                {
                    float _2362 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2364 = _2190 + _2362;
                    float _2366 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2368 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _2366;
                    float _2370 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _2372 = _2370 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _2374 = 1.0 / _2368;
                    float _2376 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _2378 = _2376 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _2380 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _2382 = _2380 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _2384 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _2386 = _2384 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _2388 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _2390 = _2388 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _2392 = _2364 * _2374;
                    float _2394 = precise::clamp(_2392, 0.0, 1.0);
                    float _2396 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _2398 = _2396 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _2400 = fma(_2394, _2372, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _2402 = fma(_2394, _2398, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _2404 = fma(_2394, _2378, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _2406 = fma(_2394, _2382, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _2408 = fma(_2394, _2386, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _2410 = fma(_2394, _2390, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    _2238 = _2400;
                    _2256 = _2408;
                    _2232 = _2404;
                    _2250 = _2406;
                    _2244 = _2402;
                    _2264 = _2410;
                    _2326 = true;
                }
                else
                {
                    _2238 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _2256 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _2232 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _2250 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _2244 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _2264 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _2326 = false;
    float _2412 = _2238;
    float _2414 = _2256;
    float _2416 = _2232;
    float _2418 = _2250;
    float _2420 = _2244;
    float _2422 = _2264;
    float _2424 = fma(_2200, -0.5, 0.5);
    float _2426 = precise::clamp(_2424, 0.0, 1.0);
    float _2428 = -_2412;
    float _2430 = _2428 + _2414;
    float _2432 = -_2416;
    float _2434 = _2432 + _2418;
    float _2436 = -_2420;
    float _2438 = _2436 + _2422;
    bool _2440 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _2442 = fma(_2426, _2430, _2412);
    float _2444 = fma(_2426, _2434, _2416);
    float _2446 = fma(_2426, _2438, _2420);
    float _2448 = _2442 * 0.586610972881317138671875;
    out.m_40.x = 1.0;
    float _2450 = fma(_2444, 0.298911988735198974609375, _2448);
    float _2452 = fma(_2446, 0.114477999508380889892578125, _2450);
    out.m_73.x = 0.0;
    float _2454 = -_2452;
    float _2456 = _2444 + _2454;
    float _2458 = -_2452;
    float _2460 = _2442 + _2458;
    float _2462 = -_2452;
    float _2464 = _2446 + _2462;
    float _2466 = (*spvDescriptorSet0.vp_c10)._m0[3].x * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _2468 = fma(_2456, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2452);
    float _2470 = fma(_2460, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2452);
    float _2472 = fma(_2464, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2452);
    out.m_69.w = _2466;
    out.m_75.x = _2468;
    out.m_75.y = _2470;
    out.m_75.z = _2472;
    if (!_2440)
    {
        return out;
    }
    float _2474 = -_2062;
    float _2476 = _2474 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
    float _2478 = -_2064;
    float _2480 = _2478 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
    float _2482 = -_2066;
    float _2484 = _2482 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
    float _2486 = _2476 * _2476;
    float _2488 = fma(_2480, _2480, _2486);
    float _2490 = fma(_2484, _2484, _2488);
    float _2492 = sqrt(_2490);
    float _2494 = rsqrt(_2490);
    float _2496 = -_2492;
    float _2498 = _2496 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _2500 = _2498 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
    float _2502 = precise::clamp(_2500, 0.0, 1.0);
    float _2504 = _2480 * _2494;
    float _2506 = _2476 * _2494;
    float _2508 = abs(_2502);
    float _2510 = log2(_2508);
    float _2512 = _2484 * _2494;
    float _2514 = _2504 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
    float _2516 = _2200 * _2506;
    float _2518 = -_2506;
    float _2520 = -_2514;
    float _2522 = fma(_2518, (*spvDescriptorSet0.vp_c15)._m0[656].y, _2520);
    float _2524 = fma(_2198, _2504, _2516);
    float _2526 = -_2512;
    float _2528 = fma(_2526, (*spvDescriptorSet0.vp_c15)._m0[656].z, _2522);
    float _2530 = fma(_2202, _2512, _2524);
    float _2532 = precise::clamp(_2530, 0.0, 1.0);
    float _2534 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
    float _2536 = _2528 + _2534;
    float _2538 = _2510 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
    float _2540 = _2536 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
    float _2542 = precise::clamp(_2540, 0.0, 1.0);
    float _2544 = exp2(_2538);
    float _2546 = _2544 * _2542;
    float _2548 = _2532 * _2546;
    float _2550 = _2548 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
    float _2552 = _2548 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
    float _2554 = _2548 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
    out.m_73.x = _2550;
    out.m_73.y = _2552;
    out.m_73.z = _2554;
    return out;
}


struct dm_geometry_capture { device uint* dst; uint4 info; uint stride; short slot[144]; };
static inline void dm_cw(constant dm_geometry_capture& g, device uint* p, uint k, uint v) { short s = g.slot[k]; if (s >= 0) p[s] = v; }
vertex void main0_gs(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], uint gl_VertexIndex [[vertex_id]], uint dm_iid [[instance_id]], constant dm_geometry_capture& dm_gs [[buffer(13)]])
{
    uint dm_vid = gl_VertexIndex;
    uint4 dm_ci = dm_gs.info; device uint* dm_capture = dm_gs.dst;
    if (dm_vid - dm_ci.x >= dm_ci.y || dm_iid - dm_ci.z >= dm_ci.w) return;
    device uint* dm_p = dm_capture + ((ulong(dm_iid - dm_ci.z) * dm_ci.y + dm_vid - dm_ci.x) * dm_gs.stride);

    main0_out out = {};
    out.m_65 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_61 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_44 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_59 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_75 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_40 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_57 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_71 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_63 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_73 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_69 = float4(0.0, 0.0, 0.0, 1.0);
    bool _2326 = false;
    bool _312 = false;
    bool _216 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _89 = in.m_37.w;
    float _91 = trunc(_89);
    int _94 = int(_91);
    bool _98 = _94 >= 1;
    float _100 = 0.0;
    if (!_98)
    {
        _100 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _102 = _100;
    if (!_98)
    {
        out.m_40.x = 0.0;
    }
    int _104 = 0;
    if (!_98)
    {
        float _106 = _102 * 5.0;
        _104 = as_type<int>(_106);
    }
    int _108 = _104;
    int _110 = _108;
    if (!_98)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2610 = as_type<float>(_108);
        out.gl_Position.z = _2610;
    }
    if (!_98)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_65.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_65.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_65.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_65.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_61.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_61.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_61.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_61.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_44.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_44.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_44.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_44.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_59.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_59.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_59.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_59.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_75.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_75.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_75.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_75.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_40.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_40.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_40.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_40.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_57.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_57.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_57.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_57.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_71.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_71.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_71.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_71.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_63.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_63.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_63.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_63.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_73.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_73.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_73.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_73.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_69.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_69.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_69.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_69.w)); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _112 = in.m_42.w;
    float _114 = float(_94);
    float _116 = 1.0 / _114;
    float _118 = -_112;
    float _120 = _118 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _122 = _112 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _124 = isnan(_112);
    bool _126 = _122 || _124;
    bool _128 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _130 = _126 || _128;
    float _132 = _120 * _116;
    bool _134 = _120 >= _114;
    bool _136 = !_130;
    bool _138 = _134 || _136;
    out.m_44.x = _132;
    float _140 = _112;
    float _142 = _132;
    float _144 = _120;
    if (_138)
    {
        _140 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _146 = _140;
    if (_138)
    {
        out.m_40.x = 0.0;
    }
    if (_138)
    {
        float _148 = _146 * 5.0;
        _110 = as_type<int>(_148);
    }
    int _150 = _110;
    if (_138)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2683 = as_type<float>(_150);
        out.gl_Position.z = _2683;
    }
    if (_138)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_65.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_65.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_65.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_65.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_61.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_61.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_61.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_61.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_44.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_44.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_44.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_44.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_59.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_59.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_59.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_59.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_75.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_75.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_75.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_75.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_40.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_40.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_40.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_40.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_57.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_57.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_57.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_57.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_71.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_71.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_71.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_71.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_63.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_63.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_63.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_63.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_73.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_73.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_73.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_73.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_69.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_69.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_69.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_69.w)); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _152 = as_type<float>(int(gl_VertexIndex));
    float _154 = in.m_49.x;
    float _156 = in.m_49.y;
    float _158 = in.m_49.z;
    int _160 = as_type<int>(_152) & 1;
    bool _162 = _160 != 0;
    int _164 = as_type<int>(_152) & 2;
    bool _166 = _164 != 0;
    bool _168 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _170 = _156 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _172 = _156 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _174 = _156 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    bool _176 = !_162;
    float _178 = _176 ? (-0.5) : 0.5;
    float _180 = fma(_154, (*spvDescriptorSet0.vp_c10)._m0[4].x, _170);
    float _182 = fma(_154, (*spvDescriptorSet0.vp_c10)._m0[5].x, _172);
    float _184 = fma(_154, (*spvDescriptorSet0.vp_c10)._m0[6].x, _174);
    bool _186 = !_166;
    float _188 = _186 ? (-0.5) : 0.5;
    float _190 = fma(_158, (*spvDescriptorSet0.vp_c10)._m0[4].z, _180);
    float _192 = fma(_158, (*spvDescriptorSet0.vp_c10)._m0[5].z, _182);
    float _194 = fma(_158, (*spvDescriptorSet0.vp_c10)._m0[6].z, _184);
    bool _196 = !_168;
    float _214;
    if (!_196)
    {
        float _198 = in.m_51.x;
        float _200 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _202 = _198 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _204 = fma(_202, (*spvDescriptorSet0.vp_c9)._m0[12].x, _120);
        float _206 = _204 * _200;
        float _208 = floor(_206);
        float _210 = -_208;
        float _212 = _206 + _210;
        _214 = _212;
        _216 = true;
    }
    else
    {
        _214 = _132;
    }
    _216 = false;
    float _218 = _214;
    float _220 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _222 = _218 + _220;
    bool _224 = _218 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _226 = isnan(_218);
    bool _228 = _224 || _226;
    bool _230 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _232 = _228 || _230;
    float _234 = float(_232);
    float _236 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _238 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _236;
    float _240 = -_234;
    float _242 = _240 + 1.0;
    bool _244 = _218 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _246 = isnan(_218);
    bool _248 = _244 || _246;
    bool _250 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _252 = _248 || _250;
    float _254 = float(_252);
    float _256 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _258 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _256;
    bool _260 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _262 = 1.0 / _238;
    float _264 = _254 * _242;
    float _266 = -_254;
    float _268 = _266 + 1.0;
    float _270 = _222 * _262;
    float _272 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _274 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _272;
    float _276 = fma(_258, _270, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _278 = fma(_274, _270, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _280 = _276 * _264;
    float _282 = _278 * _264;
    float _284 = fma(_268, (*spvDescriptorSet0.vp_c9)._m0[143].x, _280);
    float _286 = fma(_268, (*spvDescriptorSet0.vp_c9)._m0[143].y, _282);
    float _288 = fma(_234, (*spvDescriptorSet0.vp_c9)._m0[144].x, _284);
    float _290 = fma(_234, (*spvDescriptorSet0.vp_c9)._m0[144].y, _286);
    bool _292 = !_260;
    float _310;
    if (!_292)
    {
        float _294 = in.m_51.x;
        float _296 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _298 = _294 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _300 = fma(_298, (*spvDescriptorSet0.vp_c9)._m0[11].y, _120);
        float _302 = _300 * _296;
        float _304 = floor(_302);
        float _306 = -_304;
        float _308 = _302 + _306;
        _310 = _308;
        _312 = true;
    }
    else
    {
        _310 = _132;
    }
    _312 = false;
    float _314 = _310;
    float _316 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _318 = _314 + _316;
    float _320 = in.m_53.x;
    float _322 = in.m_53.y;
    float _324 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _326 = _324 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _328 = _314 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _330 = isnan(_314);
    bool _332 = _328 || _330;
    bool _334 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _336 = _332 || _334;
    float _338 = float(_336);
    float _340 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _342 = _340 + (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _344 = _314 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _346 = isnan(_314);
    bool _348 = _344 || _346;
    bool _350 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _352 = _348 || _350;
    float _354 = float(_352);
    float _356 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _358 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _356;
    bool _360 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].w;
    float _362 = 1.0 / _326;
    float _364 = -_338;
    float _366 = _364 + 1.0;
    float _368 = _354 * _366;
    float _370 = -_354;
    float _372 = _370 + 1.0;
    float _374 = 1.0 / _342;
    float _376 = _358 * _362;
    float _378 = -(*spvDescriptorSet0.vp_c9)._m0[116].x;
    float _380 = _378 + (*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _382 = _290 * _322;
    float _384 = _288 * _320;
    float _386 = fma(_376, _318, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    bool _388 = _314 >= (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _390 = isnan(_314);
    bool _392 = _388 || _390;
    bool _394 = isnan((*spvDescriptorSet0.vp_c9)._m0[117].w);
    bool _396 = _392 || _394;
    float _398 = float(_396);
    float _400 = _380 * _374;
    float _402 = _386 * _368;
    float _404 = -_398;
    float _406 = _404 + 1.0;
    float _408 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _410 = _314 + _408;
    float _412 = fma(_372, (*spvDescriptorSet0.vp_c9)._m0[115].x, _402);
    float _414 = _338 * _406;
    float _416 = fma(_400, _410, (*spvDescriptorSet0.vp_c9)._m0[116].x);
    float _418 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _420 = fma(_416, _414, _412);
    float _422 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _424 = _418 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _426 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _428 = fma(_398, (*spvDescriptorSet0.vp_c9)._m0[117].x, _420);
    float _430 = _422 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _432 = _426 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _434 = _428 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    bool _436 = !_360;
    if (!_436)
    {
        float _438 = in.m_51.x;
        float _440 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].w;
        float _442 = _438 * (*spvDescriptorSet0.vp_c9)._m0[13].x;
        float _444 = fma(_442, (*spvDescriptorSet0.vp_c9)._m0[11].w, _120);
        float _446 = _444 * _440;
        float _448 = floor(_446);
        float _450 = -_448;
        float _452 = _446 + _450;
        _142 = _452;
    }
    float _454 = _142;
    float _456 = in.m_37.x;
    float _458 = in.m_37.y;
    float _460 = in.m_37.z;
    float _462 = _458 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _464 = _458 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _466 = _458 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _468 = fma(_456, (*spvDescriptorSet0.vp_c10)._m0[5].x, _462);
    float _470 = fma(_456, (*spvDescriptorSet0.vp_c10)._m0[4].x, _464);
    float _472 = fma(_456, (*spvDescriptorSet0.vp_c10)._m0[6].x, _466);
    float _474 = fma(_460, (*spvDescriptorSet0.vp_c10)._m0[5].z, _468);
    float _476 = fma(_460, (*spvDescriptorSet0.vp_c10)._m0[4].z, _470);
    float _478 = fma(_460, (*spvDescriptorSet0.vp_c10)._m0[6].z, _472);
    float _480 = _474 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _482 = _476 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _484 = _478 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _486 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _488 = _480 + _486;
    float _490 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _492 = _482 + _490;
    float _494 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _496 = _484 + _494;
    float _498 = _488 * _488;
    float _500 = fma(_492, _492, _498);
    float _502 = fma(_496, _496, _500);
    float _504 = rsqrt(_502);
    float _506 = _492 * _504;
    float _508 = _496 * _504;
    float _510 = -_506;
    float _512 = fma(_510, (*spvDescriptorSet0.vp_c9)._m0[18].w, _482);
    float _514 = -_508;
    float _516 = fma(_514, (*spvDescriptorSet0.vp_c9)._m0[18].w, _484);
    float _518 = fma(_512, (*spvDescriptorSet0.vp_c15)._m0[652].x, (*spvDescriptorSet0.vp_c15)._m0[652].z);
    float _520 = fma(_516, (*spvDescriptorSet0.vp_c15)._m0[652].y, (*spvDescriptorSet0.vp_c15)._m0[652].w);
    float _522 = floor(_518);
    float _524 = floor(_520);
    float _526 = -_522;
    float _528 = _518 + _526;
    float _530 = -_524;
    float _532 = _520 + _530;
    float2 _3325 = float2(_528, _532);
    float _534 = dm_bs(spvDescriptorSet0.vp_t_tcb_24.sample(spvDescriptorSet0.vp_t_tcb_24Smplr, select(_3325, float2(0.0), isnan(_3325)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_24, spvDescriptorSet0.vp_t_tcb_24Smplr_w, select(_3325, float2(0.0), isnan(_3325)), level(0.0)).x;
    float _536 = in.m_51.x;
    float _538 = in.m_51.y;
    float _540 = in.m_51.z;
    float _542 = in.m_51.w;
    float _544 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    int _546 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _548 = _546 != 0;
    int _550 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _552 = _550 != 0;
    int _554 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _556 = _554 != 0;
    float _558 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _560 = log2(_558);
    int _562 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _564 = _562 != 0;
    float _566 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    float _568 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _570 = _536 * 2.0;
    bool _572 = _536 > 0.5;
    bool _574 = _542 > 0.5;
    float _576 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _578 = _576 + (*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _580 = -_178;
    int _582 = _572 ? as_type<int>(_580) : as_type<int>(_178);
    float _584 = _538 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    int _586 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 16;
    bool _588 = _586 != 0;
    int _590 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 32;
    bool _592 = _590 != 0;
    float _594 = _540 * 2.0;
    float _596 = 1.0 / _578;
    bool _598 = !_548;
    float _600 = _598 ? _178 : as_type<float>(_582);
    float _602 = fma(_584, -2.0, _568);
    bool _604 = _538 > 0.5;
    float _606 = (*spvDescriptorSet0.vp_c9)._m0[83].z + (*spvDescriptorSet0.vp_c9)._m0[83].x;
    float _608 = fma(_120, (*spvDescriptorSet0.vp_c9)._m0[76].y, _602);
    float _610 = -_188;
    int _612 = _604 ? as_type<int>(_610) : as_type<int>(_188);
    float _614 = floor(_594);
    float _616 = _536 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    bool _618 = !_552;
    float _620 = _618 ? _188 : as_type<float>(_612);
    float _622 = -_566;
    float _624 = fma(_616, 2.0, _622);
    int _626 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _628 = _626 != 0;
    float _630 = -(*spvDescriptorSet0.vp_c9)._m0[131].x;
    float _632 = (*spvDescriptorSet0.vp_c9)._m0[132].x + _630;
    float _634 = _538 * 2.0;
    float _636 = -_178;
    int _638 = _604 ? as_type<int>(_636) : as_type<int>(_178);
    float _640 = _540 + _536;
    bool _642 = _540 > 0.5;
    float _644 = _632 * _596;
    float _646 = floor(_634);
    float _648 = _640 + (-1.0);
    float _650 = -_178;
    int _652 = _642 ? as_type<int>(_650) : as_type<int>(_178);
    float _654 = _538 + _540;
    float _656 = -_188;
    int _658 = _642 ? as_type<int>(_656) : as_type<int>(_188);
    float _660 = fma(_648, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    bool _662 = _614 >= 0.0;
    bool _664 = isnan(_614);
    bool _666 = _662 || _664;
    bool _668 = isnan(0.0);
    bool _670 = _666 || _668;
    float _672 = _654 + (-1.0);
    float _674 = floor(_570);
    float _676 = _648;
    float _678 = _544;
    if (!_628)
    {
        _676 = _540;
    }
    float _680 = _676;
    int _682 = _670 ? 0 : 1;
    float _684 = fma(_672, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    bool _686 = _614 > 0.0;
    float _688 = _538 + _536;
    int _690 = ~_682;
    int _692 = _690 + 1;
    int _694 = _692 + 1;
    float _696 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    bool _698 = !_588;
    float _700 = _698 ? _178 : as_type<float>(_638);
    float _702 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _704 = _454 + _702;
    bool _706 = _646 > 0.0;
    float _708 = _688 + (-1.0);
    float _710 = _680;
    int _712 = _694;
    if (_628)
    {
        _710 = _538;
    }
    float _714 = _710;
    float _716 = fma(_644, _704, (*spvDescriptorSet0.vp_c9)._m0[131].x);
    bool _718 = !_592;
    float _720 = _718 ? _188 : as_type<float>(_658);
    float _722 = fma(_708, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    bool _724 = _674 >= 0.0;
    bool _726 = isnan(_674);
    bool _728 = _724 || _726;
    bool _730 = isnan(0.0);
    bool _732 = _728 || _730;
    float _734 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    float _736 = _674;
    if (!_686)
    {
        int _738 = ~_682;
        int _740 = _738 + 1;
        _712 = _740;
    }
    int _742 = _712;
    bool _744 = _646 >= 0.0;
    bool _746 = isnan(_646);
    bool _748 = _744 || _746;
    bool _750 = isnan(0.0);
    bool _752 = _748 || _750;
    float _754 = _696 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _756 = _620 + (-0.5);
    float _758 = (*spvDescriptorSet0.vp_c9)._m0[83].w + (*spvDescriptorSet0.vp_c9)._m0[83].y;
    int _760 = _752 ? 0 : 1;
    bool _762 = _674 > 0.0;
    float _764 = fma(_714, (*spvDescriptorSet0.vp_c9)._m0[83].w, _758);
    float _766 = -_120;
    float _768 = fma(_766, (*spvDescriptorSet0.vp_c9)._m0[76].x, _624);
    float _770 = _544 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _772 = _600 + 0.5;
    int _774 = ~_760;
    int _776 = _774 + 1;
    int _778 = _776 + 1;
    float _780 = -_754;
    float _782 = -_608;
    float _784 = fma(_780, _756, _782);
    int _786 = _778;
    if (!_706)
    {
        int _788 = ~_760;
        int _790 = _788 + 1;
        _786 = _790;
    }
    int _792 = _786;
    float _794 = fma(_770, _772, _768);
    float _796 = _560 * _120;
    if (!_628)
    {
        _678 = _538;
    }
    float _798 = _678;
    float _800 = _734 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    float _802 = _798;
    if (!_628)
    {
        _736 = _540;
    }
    float _804 = _736;
    float _806 = _804;
    if (_628)
    {
        _802 = _536;
    }
    float _808 = _802;
    float _810 = exp2(_796);
    if (_628)
    {
        _806 = _538;
    }
    float _812 = _806;
    int _814 = _732 ? 0 : 1;
    float _816 = _808 * (*spvDescriptorSet0.vp_c9)._m0[82].x;
    int _818 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _820 = _818 != 0;
    int _822 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _824 = _822 != 0;
    int _826 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _828 = _826 != 0;
    float _830 = fma(_808, (*spvDescriptorSet0.vp_c9)._m0[83].z, _606);
    bool _832 = _454 >= (*spvDescriptorSet0.vp_c9)._m0[131].w;
    bool _834 = isnan(_454);
    bool _836 = _832 || _834;
    bool _838 = isnan((*spvDescriptorSet0.vp_c9)._m0[131].w);
    bool _840 = _836 || _838;
    float _842 = float(_840);
    float _844 = _812 * (*spvDescriptorSet0.vp_c9)._m0[82].y;
    bool _846 = _454 >= (*spvDescriptorSet0.vp_c9)._m0[132].w;
    bool _848 = isnan(_454);
    bool _850 = _846 || _848;
    bool _852 = isnan((*spvDescriptorSet0.vp_c9)._m0[132].w);
    bool _854 = _850 || _852;
    float _856 = float(_854);
    float _858 = -_856;
    float _860 = _858 + 1.0;
    float _862 = (*spvDescriptorSet0.vp_c9)._m0[82].x + (*spvDescriptorSet0.vp_c9)._m0[81].z;
    float _864 = _842 * _860;
    float _866 = -(*spvDescriptorSet0.vp_c9)._m0[167].w;
    float _868 = (*spvDescriptorSet0.vp_c9)._m0[168].w + _866;
    float _870 = -_862;
    float _872 = fma(_816, 2.0, _870);
    float _874 = -(*spvDescriptorSet0.vp_c9)._m0[168].w;
    float _876 = _874 + (*spvDescriptorSet0.vp_c9)._m0[169].w;
    float _878 = _716 * _864;
    float _880 = -_842;
    float _882 = _880 + 1.0;
    float _884 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _886 = 1.0 + _884;
    float _888 = (*spvDescriptorSet0.vp_c9)._m0[82].y + (*spvDescriptorSet0.vp_c9)._m0[81].w;
    float _890 = fma(_882, (*spvDescriptorSet0.vp_c9)._m0[131].x, _878);
    float _892 = -_810;
    float _894 = _892 + 1.0;
    int _896 = ~_814;
    int _898 = _896 + 1;
    int _900 = _898 + 1;
    float _902 = fma(_844, -2.0, _888);
    int _904 = _900;
    if (!_762)
    {
        int _906 = ~_814;
        int _908 = _906 + 1;
        _904 = _908;
    }
    int _910 = _904;
    float _912 = 1.0 / _868;
    bool _914 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _916 = isnan(0.0);
    bool _918 = _914 || _916;
    bool _920 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _922 = _918 || _920;
    float _924 = -(*spvDescriptorSet0.vp_c9)._m0[171].w;
    float _926 = (*spvDescriptorSet0.vp_c9)._m0[172].w + _924;
    float _928 = -_120;
    float _930 = fma(_928, (*spvDescriptorSet0.vp_c9)._m0[81].x, _872);
    bool _932 = !_564;
    float _934 = _932 ? _178 : as_type<float>(_652);
    float _936 = 1.0 / _876;
    float _938 = -(*spvDescriptorSet0.vp_c9)._m0[169].w;
    float _940 = (*spvDescriptorSet0.vp_c9)._m0[170].w + _938;
    bool _942 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[14].y;
    float _944 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    float _946 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    float _948 = fma(_120, (*spvDescriptorSet0.vp_c9)._m0[82].z, _830);
    bool _950 = !_828;
    int _952 = _950 ? 0 : 1;
    float _954 = fma(_536, (*spvDescriptorSet0.vp_c9)._m0[78].z, _944);
    float _956 = 1.0 / _886;
    float _958 = -(*spvDescriptorSet0.vp_c9)._m0[170].w;
    float _960 = _958 + (*spvDescriptorSet0.vp_c9)._m0[171].w;
    float _962 = _922 ? _894 : 0.0;
    float _964 = _934 + 0.5;
    bool _966 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _968 = isnan(1.0);
    bool _970 = _966 || _968;
    bool _972 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _974 = _970 || _972;
    float _976 = fma(_538, (*spvDescriptorSet0.vp_c9)._m0[78].w, _946);
    float _978 = fma(_800, _964, _930);
    float _980 = 1.0 / _940;
    float _982 = fma(_120, (*spvDescriptorSet0.vp_c9)._m0[77].z, _954);
    float _984 = fma(_120, (*spvDescriptorSet0.vp_c9)._m0[82].w, _764);
    float _986 = fma(_120, (*spvDescriptorSet0.vp_c9)._m0[77].w, _976);
    float _988 = fma(_120, (*spvDescriptorSet0.vp_c9)._m0[81].y, _902);
    float _990 = _538 + (-0.5);
    float _992 = -(*spvDescriptorSet0.vp_c9)._m0[172].w;
    float _994 = _992 + (*spvDescriptorSet0.vp_c9)._m0[173].w;
    float _996 = _536 + (-0.5);
    float _998 = 1.0 / _960;
    float _1000 = _956;
    if (_974)
    {
        float _1002 = _962 * _956;
        _144 = _1002;
    }
    float _1004 = _144;
    float _1006 = _540 + (-0.5);
    if (!_942)
    {
        _1000 = (*spvDescriptorSet0.vp_c7)._m0[0].x;
    }
    float _1008 = _1000;
    bool _1010 = !_820;
    int _1012 = _1010 ? 0 : 1;
    bool _1014 = !_824;
    int _1016 = _1014 ? 0 : 1;
    float _1018 = 1.0 / _926;
    bool _1020 = !_942;
    float _1022 = _1008;
    if (!_1020)
    {
        float _1024 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[14].y;
        float _1026 = _536 * (*spvDescriptorSet0.vp_c9)._m0[15].y;
        float _1028 = fma(_1026, (*spvDescriptorSet0.vp_c9)._m0[14].y, (*spvDescriptorSet0.vp_c7)._m0[0].x);
        float _1030 = _1028 * _1024;
        float _1032 = floor(_1030);
        float _1034 = -_1032;
        float _1036 = _1030 + _1034;
        _1022 = _1036;
    }
    float _1038 = _1022;
    int _1040 = abs(_1012);
    float _1042 = 1.0 / _994;
    int _1044 = abs(_1016);
    float _1046 = -_506;
    float _1048 = fma(_1046, (*spvDescriptorSet0.vp_c9)._m0[18].w, _492);
    float _1050 = float(_742);
    float _1052 = -_508;
    float _1054 = fma(_1052, (*spvDescriptorSet0.vp_c9)._m0[18].w, _496);
    int _1056 = abs(_952);
    float _1058 = -(*spvDescriptorSet0.vp_c9)._m0[171].w;
    float _1060 = _1038 + _1058;
    float _1062 = float(_1040);
    float _1064 = -(*spvDescriptorSet0.vp_c9)._m0[167].w;
    float _1066 = _1038 + _1064;
    float _1068 = float(_792);
    float _1070 = -(*spvDescriptorSet0.vp_c9)._m0[170].w;
    float _1072 = _1038 + _1070;
    float _1074 = float(_1056);
    float _1076 = _1066 * _912;
    float _1078 = -(*spvDescriptorSet0.vp_c9)._m0[169].w;
    float _1080 = _1038 + _1078;
    float _1082 = _1062 * _1050;
    float _1084 = _1074 * _1068;
    float _1086 = _1080 * _980;
    float _1088 = -(*spvDescriptorSet0.vp_c9)._m0[168].w;
    float _1090 = _1038 + _1088;
    float _1092 = _1072 * _998;
    float _1094 = -(*spvDescriptorSet0.vp_c9)._m0[167].x;
    float _1096 = (*spvDescriptorSet0.vp_c9)._m0[168].x + _1094;
    float _1098 = float(_910);
    float _1100 = -(*spvDescriptorSet0.vp_c9)._m0[172].w;
    float _1102 = _1038 + _1100;
    float _1104 = float(_1044);
    float _1106 = _1090 * _936;
    float _1108 = fma(_1096, _1076, (*spvDescriptorSet0.vp_c9)._m0[167].x);
    float _1110 = _1102 * _1042;
    float _1112 = _1060 * _1018;
    float _1114 = _1104 * _1098;
    float _1116 = in.m_55.x;
    float _1118 = in.m_55.y;
    float _1120 = in.m_55.z;
    float _1122 = _1084 * (-2.0);
    float _1124 = _1114 * (-2.0);
    float _1126 = -(*spvDescriptorSet0.vp_c9)._m0[167].z;
    float _1128 = (*spvDescriptorSet0.vp_c9)._m0[168].z + _1126;
    float _1130 = -(*spvDescriptorSet0.vp_c9)._m0[170].y;
    float _1132 = _1130 + (*spvDescriptorSet0.vp_c9)._m0[171].y;
    float _1134 = fma(_684, _1124, _684);
    float _1136 = fma(_1128, _1076, (*spvDescriptorSet0.vp_c9)._m0[167].z);
    float _1138 = -(*spvDescriptorSet0.vp_c9)._m0[169].y;
    float _1140 = (*spvDescriptorSet0.vp_c9)._m0[170].y + _1138;
    float _1142 = _1082 * (-2.0);
    float _1144 = _488 * _504;
    float _1146 = -(*spvDescriptorSet0.vp_c9)._m0[173].w;
    float _1148 = (*spvDescriptorSet0.vp_c9)._m0[174].w + _1146;
    float _1150 = -(*spvDescriptorSet0.vp_c9)._m0[167].y;
    float _1152 = (*spvDescriptorSet0.vp_c9)._m0[168].y + _1150;
    float _1154 = -_1144;
    float _1156 = fma(_1154, (*spvDescriptorSet0.vp_c9)._m0[18].w, _488);
    float _1158 = 1.0 / _1148;
    float _1160 = fma(_722, _1142, _722);
    float _1162 = -(*spvDescriptorSet0.vp_c9)._m0[170].z;
    float _1164 = _1162 + (*spvDescriptorSet0.vp_c9)._m0[171].z;
    float _1166 = _1156 * _1156;
    float _1168 = fma(_1152, _1076, (*spvDescriptorSet0.vp_c9)._m0[167].y);
    float _1170 = fma(_1124, _1118, _1118);
    float _1172 = fma(_660, _1122, _660);
    float _1174 = fma(_1048, _1048, _1166);
    bool _1176 = _1038 >= (*spvDescriptorSet0.vp_c9)._m0[172].w;
    bool _1178 = isnan(_1038);
    bool _1180 = _1176 || _1178;
    bool _1182 = isnan((*spvDescriptorSet0.vp_c9)._m0[172].w);
    bool _1184 = _1180 || _1182;
    float _1186 = float(_1184);
    float _1188 = fma(_1122, _1120, _1120);
    float _1190 = fma(_990, (*spvDescriptorSet0.vp_c9)._m0[196].y, _1170);
    float _1192 = fma(_1054, _1054, _1174);
    bool _1194 = _1038 >= (*spvDescriptorSet0.vp_c9)._m0[171].w;
    bool _1196 = isnan(_1038);
    bool _1198 = _1194 || _1196;
    bool _1200 = isnan((*spvDescriptorSet0.vp_c9)._m0[171].w);
    bool _1202 = _1198 || _1200;
    float _1204 = float(_1202);
    float _1206 = -(*spvDescriptorSet0.vp_c9)._m0[168].x;
    float _1208 = _1206 + (*spvDescriptorSet0.vp_c9)._m0[169].x;
    float _1210 = -_1186;
    float _1212 = _1210 + 1.0;
    float _1214 = -(*spvDescriptorSet0.vp_c9)._m0[168].y;
    float _1216 = _1214 + (*spvDescriptorSet0.vp_c9)._m0[169].y;
    float _1218 = -(*spvDescriptorSet0.vp_c9)._m0[169].z;
    float _1220 = (*spvDescriptorSet0.vp_c9)._m0[170].z + _1218;
    float _1222 = fma(_1006, (*spvDescriptorSet0.vp_c9)._m0[196].z, _1188);
    float _1224 = fma(_1142, _1116, _1116);
    float _1226 = fma(_1134, _1004, _1190);
    bool _1228 = _1038 >= (*spvDescriptorSet0.vp_c9)._m0[170].w;
    bool _1230 = isnan(_1038);
    bool _1232 = _1228 || _1230;
    bool _1234 = isnan((*spvDescriptorSet0.vp_c9)._m0[170].w);
    bool _1236 = _1232 || _1234;
    float _1238 = float(_1236);
    float _1240 = _1204 * _1212;
    float _1242 = -_1204;
    float _1244 = _1242 + 1.0;
    bool _1246 = _1038 >= (*spvDescriptorSet0.vp_c9)._m0[169].w;
    bool _1248 = isnan(_1038);
    bool _1250 = _1246 || _1248;
    bool _1252 = isnan((*spvDescriptorSet0.vp_c9)._m0[169].w);
    bool _1254 = _1250 || _1252;
    float _1256 = float(_1254);
    float _1258 = _1226 * 0.15915493667125701904296875;
    float _1260 = fma(_996, (*spvDescriptorSet0.vp_c9)._m0[196].x, _1224);
    float _1262 = _1238 * _1244;
    bool _1264 = _1038 >= (*spvDescriptorSet0.vp_c9)._m0[168].w;
    bool _1266 = isnan(_1038);
    bool _1268 = _1264 || _1266;
    bool _1270 = isnan((*spvDescriptorSet0.vp_c9)._m0[168].w);
    bool _1272 = _1268 || _1270;
    float _1274 = float(_1272);
    float _1276 = -_1256;
    float _1278 = _1276 + 1.0;
    float _1280 = sqrt(_1192);
    float _1282 = fma(_1160, _1004, _1260);
    bool _1284 = _1038 >= (*spvDescriptorSet0.vp_c9)._m0[167].w;
    bool _1286 = isnan(_1038);
    bool _1288 = _1284 || _1286;
    bool _1290 = isnan((*spvDescriptorSet0.vp_c9)._m0[167].w);
    bool _1292 = _1288 || _1290;
    float _1294 = float(_1292);
    float _1296 = -(*spvDescriptorSet0.vp_c9)._m0[173].w;
    float _1298 = _1038 + _1296;
    float _1300 = -(*spvDescriptorSet0.vp_c9)._m0[168].z;
    float _1302 = _1300 + (*spvDescriptorSet0.vp_c9)._m0[169].z;
    float _1304 = -(*spvDescriptorSet0.vp_c9)._m0[169].x;
    float _1306 = (*spvDescriptorSet0.vp_c9)._m0[170].x + _1304;
    float _1308 = fma(_1216, _1106, (*spvDescriptorSet0.vp_c9)._m0[168].y);
    float _1310 = _1298 * _1158;
    float _1312 = -_1238;
    float _1314 = _1312 + 1.0;
    float _1316 = _1274 * _1278;
    float _1318 = -_1274;
    float _1320 = _1318 + 1.0;
    float _1322 = fma(_1208, _1106, (*spvDescriptorSet0.vp_c9)._m0[168].x);
    float _1324 = fma(_1302, _1106, (*spvDescriptorSet0.vp_c9)._m0[168].z);
    float _1326 = fma(_1306, _1086, (*spvDescriptorSet0.vp_c9)._m0[169].x);
    float _1328 = _1294 * _1320;
    float _1330 = -_1294;
    float _1332 = _1330 + 1.0;
    float _1334 = _1282 * 0.15915493667125701904296875;
    float _1336 = fma(_1140, _1086, (*spvDescriptorSet0.vp_c9)._m0[169].y);
    float _1338 = _1168 * _1328;
    float _1340 = _1256 * _1314;
    float _1342 = fma(_1172, _1004, _1222);
    float _1344 = fma(_1220, _1086, (*spvDescriptorSet0.vp_c9)._m0[169].z);
    float _1346 = fma(_1332, (*spvDescriptorSet0.vp_c9)._m0[167].y, _1338);
    float _1348 = _1108 * _1328;
    float _1350 = fma(_1132, _1092, (*spvDescriptorSet0.vp_c9)._m0[170].y);
    bool _1352 = _1038 >= (*spvDescriptorSet0.vp_c9)._m0[173].w;
    bool _1354 = isnan(_1038);
    bool _1356 = _1352 || _1354;
    bool _1358 = isnan((*spvDescriptorSet0.vp_c9)._m0[173].w);
    bool _1360 = _1356 || _1358;
    float _1362 = float(_1360);
    float _1364 = fma(_1308, _1316, _1346);
    bool _1366 = _1038 >= (*spvDescriptorSet0.vp_c9)._m0[174].w;
    bool _1368 = isnan(_1038);
    bool _1370 = _1366 || _1368;
    bool _1372 = isnan((*spvDescriptorSet0.vp_c9)._m0[174].w);
    bool _1374 = _1370 || _1372;
    float _1376 = float(_1374);
    float _1378 = _1342 * 0.15915493667125701904296875;
    float _1380 = _1334 * 6.283185482025146484375;
    float _1382 = sin(_1380);
    float _1384 = fma(_1336, _1340, _1364);
    float _1386 = fma(_1332, (*spvDescriptorSet0.vp_c9)._m0[167].x, _1348);
    float _1388 = _1136 * _1328;
    float _1390 = -(*spvDescriptorSet0.vp_c9)._m0[170].x;
    float _1392 = _1390 + (*spvDescriptorSet0.vp_c9)._m0[171].x;
    float _1394 = fma(_1350, _1262, _1384);
    float _1396 = fma(_1322, _1316, _1386);
    float _1398 = fma(_1332, (*spvDescriptorSet0.vp_c9)._m0[167].z, _1388);
    float _1400 = _1258 * 6.283185482025146484375;
    float _1402 = sin(_1400);
    float _1404 = fma(_1392, _1092, (*spvDescriptorSet0.vp_c9)._m0[170].x);
    float _1406 = fma(_1326, _1340, _1396);
    float _1408 = fma(_1324, _1316, _1398);
    float _1410 = fma(_1404, _1262, _1406);
    float _1412 = _504 * _1280;
    float _1414 = _1258 * 6.283185482025146484375;
    float _1416 = cos(_1414);
    float _1418 = -(*spvDescriptorSet0.vp_c9)._m0[171].x;
    float _1420 = (*spvDescriptorSet0.vp_c9)._m0[172].x + _1418;
    float _1422 = -(*spvDescriptorSet0.vp_c9)._m0[171].y;
    float _1424 = (*spvDescriptorSet0.vp_c9)._m0[172].y + _1422;
    float _1426 = _384 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _1428 = -_1362;
    float _1430 = _1428 + 1.0;
    float _1432 = fma(_1420, _1112, (*spvDescriptorSet0.vp_c9)._m0[171].x);
    float _1434 = fma(_1424, _1112, (*spvDescriptorSet0.vp_c9)._m0[171].y);
    float _1436 = -(*spvDescriptorSet0.vp_c9)._m0[172].x;
    float _1438 = _1436 + (*spvDescriptorSet0.vp_c9)._m0[173].x;
    float _1440 = _1334 * 6.283185482025146484375;
    float _1442 = cos(_1440);
    float _1444 = _1382 * _1402;
    float _1446 = _1426 * _1412;
    float _1448 = _1186 * _1430;
    float _1450 = -_1376;
    float _1452 = _1450 + 1.0;
    float _1454 = fma(_1438, _1110, (*spvDescriptorSet0.vp_c9)._m0[172].x);
    float _1456 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _188);
    float _1458 = fma(_1164, _1092, (*spvDescriptorSet0.vp_c9)._m0[170].z);
    float _1460 = _1378 * 6.283185482025146484375;
    float _1462 = cos(_1460);
    float _1464 = _1382 * _1416;
    float _1466 = _1362 * _1452;
    float _1468 = fma(_1344, _1340, _1408);
    float _1470 = fma(_856, (*spvDescriptorSet0.vp_c9)._m0[132].x, _890);
    float _1472 = -(*spvDescriptorSet0.vp_c10)._m0[9].w;
    float _1474 = _480 + _1472;
    float _1476 = _700 + 0.5;
    float _1478 = fma(_1458, _1262, _1468);
    float _1480 = _1378 * 6.283185482025146484375;
    float _1482 = sin(_1480);
    float _1484 = _1442 * _1416;
    float _1486 = _1442 * _1402;
    float _1488 = -_720;
    float _1490 = _1488 + 0.5;
    float _1492 = _1476 * (*spvDescriptorSet0.vp_c9)._m0[90].x;
    float _1494 = _1416 * _1462;
    float _1496 = _1402 * _1462;
    float _1498 = _1382 * _1462;
    float _1500 = _382 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _1502 = _1442 * _1462;
    float _1504 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _178);
    float _1506 = fma(_1432, _1240, _1410);
    float _1508 = fma(_1434, _1240, _1394);
    float _1510 = fma(_1482, _1484, _1444);
    float _1512 = fma(_1482, _1444, _1484);
    float _1514 = -_1486;
    float _1516 = fma(_1482, _1464, _1514);
    float _1518 = -_1464;
    float _1520 = fma(_1482, _1486, _1518);
    float _1522 = -(*spvDescriptorSet0.vp_c9)._m0[172].y;
    float _1524 = _1522 + (*spvDescriptorSet0.vp_c9)._m0[173].y;
    float _1526 = _1500 * _1412;
    float _1528 = fma(_1524, _1110, (*spvDescriptorSet0.vp_c9)._m0[172].y);
    float _1530 = _1446 * _1504;
    float _1532 = -(*spvDescriptorSet0.vp_c9)._m0[173].x;
    float _1534 = (*spvDescriptorSet0.vp_c9)._m0[174].x + _1532;
    float _1536 = _1412 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _1538 = _1536 * 0.5;
    float _1540 = fma(_1528, _1448, _1508);
    float _1542 = -(*spvDescriptorSet0.vp_c9)._m0[173].y;
    float _1544 = (*spvDescriptorSet0.vp_c9)._m0[174].y + _1542;
    float _1546 = fma(_1454, _1448, _1506);
    float _1548 = fma(_1534, _1310, (*spvDescriptorSet0.vp_c9)._m0[173].x);
    float _1550 = _1526 * _1456;
    float _1552 = _1502 * _1538;
    float _1554 = fma(_1544, _1310, (*spvDescriptorSet0.vp_c9)._m0[173].y);
    float _1556 = _1498 * _1538;
    float _1558 = fma(_1548, _1466, _1546);
    float _1560 = _1482 * _1538;
    float _1562 = fma(_1510, _1530, _1552);
    float _1564 = fma(_1554, _1466, _1540);
    float _1566 = fma(_1516, _1530, _1556);
    float _1568 = (*spvDescriptorSet0.vp_c9)._m0[175].x * (*spvDescriptorSet0.vp_c10)._m0[10].z;
    float _1570 = -(*spvDescriptorSet0.vp_c10)._m0[10].w;
    float _1572 = _484 + _1570;
    float _1574 = fma(_1376, (*spvDescriptorSet0.vp_c9)._m0[174].x, _1558);
    float _1576 = -_1560;
    float _1578 = fma(_1494, _1530, _1576);
    float _1580 = -_1550;
    float _1582 = fma(_1520, _1580, _1562);
    float _1584 = -_1144;
    float _1586 = fma(_1584, (*spvDescriptorSet0.vp_c9)._m0[18].w, _480);
    float _1588 = -_1568;
    float _1590 = fma(_1574, _1572, _1588);
    float _1592 = -_1550;
    float _1594 = fma(_1496, _1592, _1578);
    float _1596 = _1582 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    float _1598 = -_1550;
    float _1600 = fma(_1512, _1598, _1566);
    float _1602 = _1582 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    float _1604 = (*spvDescriptorSet0.vp_c9)._m0[175].x * (*spvDescriptorSet0.vp_c10)._m0[8].z;
    float _1606 = fma(_1594, (*spvDescriptorSet0.vp_c10)._m0[10].x, _1596);
    float _1608 = -(*spvDescriptorSet0.vp_c10)._m0[8].w;
    float _1610 = _482 + _1608;
    float _1612 = _1586 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _1614 = fma(_1594, (*spvDescriptorSet0.vp_c10)._m0[8].x, _1602);
    float _1616 = fma(_1376, (*spvDescriptorSet0.vp_c9)._m0[174].y, _1564);
    float _1618 = fma(_1600, (*spvDescriptorSet0.vp_c10)._m0[10].z, _1606);
    float _1620 = -_1604;
    float _1622 = fma(_1574, _1610, _1620);
    float _1624 = fma(_512, (*spvDescriptorSet0.vp_c8)._m0[11].x, _1612);
    float _1626 = fma(_1600, (*spvDescriptorSet0.vp_c10)._m0[8].z, _1614);
    float _1628 = fma(_1618, _1616, _1590);
    float _1630 = _1586 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _1632 = fma(_516, (*spvDescriptorSet0.vp_c8)._m0[11].z, _1624);
    float _1634 = fma(_1626, _1616, _1622);
    float _1636 = _1628 + (*spvDescriptorSet0.vp_c10)._m0[10].w;
    float _1638 = fma(_512, (*spvDescriptorSet0.vp_c8)._m0[10].x, _1630);
    float _1640 = _1632 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _1642 = _1634 + (*spvDescriptorSet0.vp_c10)._m0[8].w;
    float _1644 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1646 = _1636 + _1644;
    float _1648 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    float _1650 = fma(_516, (*spvDescriptorSet0.vp_c8)._m0[10].z, _1638);
    float _1652 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1654 = _1642 + _1652;
    float _1656 = _1646 * _1646;
    float _1658 = _1650 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _1660 = -_188;
    int _1662 = _574 ? as_type<int>(_1660) : as_type<int>(_188);
    float _1664 = fma(_1654, _1654, _1656);
    float _1666 = 1.0 / _1640;
    float _1668 = -(*spvDescriptorSet0.vp_c9)._m0[171].z;
    float _1670 = (*spvDescriptorSet0.vp_c9)._m0[172].z + _1668;
    float _1672 = _1658 + _1640;
    float _1674 = -(*spvDescriptorSet0.vp_c9)._m0[172].z;
    float _1676 = _1674 + (*spvDescriptorSet0.vp_c9)._m0[173].z;
    bool _1678 = !_556;
    float _1680 = _1678 ? _188 : as_type<float>(_1662);
    float _1682 = fma(_1670, _1112, (*spvDescriptorSet0.vp_c9)._m0[171].z);
    float _1684 = _1582 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _1686 = sqrt(_1664);
    float _1688 = fma(_1676, _1110, (*spvDescriptorSet0.vp_c9)._m0[172].z);
    float _1690 = (*spvDescriptorSet0.vp_c9)._m0[175].x * (*spvDescriptorSet0.vp_c10)._m0[9].z;
    float _1692 = -(*spvDescriptorSet0.vp_c9)._m0[173].z;
    float _1694 = (*spvDescriptorSet0.vp_c9)._m0[174].z + _1692;
    float _1696 = _1648 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    float _1698 = _1680 + (-0.5);
    float _1700 = fma(_1594, (*spvDescriptorSet0.vp_c10)._m0[9].x, _1684);
    float _1702 = -_1690;
    float _1704 = fma(_1574, _1474, _1702);
    float _1706 = _1672 * _1666;
    float _1708 = _1706 * 0.5;
    float _1710 = -_1696;
    float _1712 = -_988;
    float _1714 = fma(_1710, _1698, _1712);
    float _1716 = fma(_1682, _1240, _1478);
    float _1718 = fma(_1600, (*spvDescriptorSet0.vp_c10)._m0[9].z, _1700);
    float _1720 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _1722 = fma(_1708, (*spvDescriptorSet0.vp_c8)._m0[30].w, _1720);
    float _1724 = fma(_1694, _1310, (*spvDescriptorSet0.vp_c9)._m0[173].z);
    float _1726 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].z;
    float _1728 = fma(_1718, _1616, _1704);
    bool _1730 = _1686 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1732 = fma(_1688, _1448, _1716);
    float _1734 = _1728 + (*spvDescriptorSet0.vp_c10)._m0[9].w;
    float _1736 = fma(_1724, _1466, _1732);
    float _1738 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].w;
    float _1740 = _1490 * (*spvDescriptorSet0.vp_c9)._m0[90].y;
    float _1742 = (*spvDescriptorSet0.vp_c8)._m0[30].w;
    float _1744 = _1642;
    float _1746 = _1636;
    if (!_1730)
    {
        _1742 = _1734;
    }
    float _1748 = _1742;
    float _1750 = 1.0 / _1722;
    bool _1752 = !_1730;
    float _1754 = _1748;
    if (!_1752)
    {
        float _1756 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1758 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1760 = _1686 + _1758;
        float _1762 = _1734 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1764 = rsqrt(_1664);
        float _1766 = _1760 * _1756;
        float _1768 = _1766 * 0.15915493667125701904296875;
        float _1770 = _1768 * 6.283185482025146484375;
        float _1772 = cos(_1770);
        float _1774 = _1768 * 6.283185482025146484375;
        float _1776 = sin(_1774);
        float _1778 = _1772 + (-1.0);
        float _1780 = fma(_1776, _1762, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1782 = _1778 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1784 = _1764 * _1780;
        float _1786 = fma(_1734, _1772, _1782);
        float _1788 = fma(_1654, _1784, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1790 = fma(_1646, _1784, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _1754 = _1786;
        _1744 = _1788;
        _1746 = _1790;
    }
    float _1792 = _1754;
    float _1794 = _1744;
    float _1796 = _1746;
    float _1798 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _1800 = _1750 * _1798;
    float _1802 = _1492 * _1726;
    float _1804 = _1740 * _1738;
    float _1806 = -_480;
    float _1808 = _1806 + _1792;
    float _1810 = abs(_1800);
    float _1812 = log2(_1810);
    float _1814 = -_982;
    float _1816 = _1814 + 1.0;
    float _1818 = -_482;
    float _1820 = _1818 + _1794;
    float _1822 = _1808 * _1808;
    float _1824 = -_986;
    float _1826 = _1824 + 1.0;
    float _1828 = -_948;
    float _1830 = _1828 + 1.0;
    float _1832 = -_484;
    float _1834 = _1832 + _1796;
    float _1836 = fma(_1820, _1820, _1822);
    float _1838 = -_1816;
    float _1840 = fma(_600, _1838, _794);
    float _1842 = fma(_620, _1826, _784);
    float _1844 = -_1830;
    float _1846 = fma(_934, _1844, _978);
    float _1848 = fma(_1834, _1834, _1836);
    float _1850 = -_984;
    float _1852 = _1850 + 1.0;
    float _1854 = sqrt(_1848);
    float _1856 = _1812 * (*spvDescriptorSet0.vp_c15)._m0[654].z;
    float _1858 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _1860 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _1862 = fma(_1680, _1852, _1714);
    float _1864 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _1866 = _1858 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1868 = _1860 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1870 = _1470 * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    float _1872 = _1864 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1874 = fma(_1376, (*spvDescriptorSet0.vp_c9)._m0[174].z, _1736);
    float _1876 = exp2(_1856);
    out.m_57.x = _1802;
    out.m_57.y = _1804;
    float _1878 = _178 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    bool _1880 = _1854 > 0.0;
    out.m_59.x = _1840;
    out.m_59.y = _1842;
    out.m_59.z = _1846;
    out.m_59.w = _1862;
    float _1882 = -_1482;
    float _1884 = fma(_1494, _1878, _1882);
    out.m_61.x = _1866;
    out.m_61.y = _1868;
    out.m_61.z = _1872;
    out.m_61.w = _1870;
    float _1886 = fma(_1510, _1878, _1502);
    bool _1888 = (*spvDescriptorSet0.vp_c15)._m0[660].y >= 0.5;
    bool _1890 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _1892 = _1888 || _1890;
    bool _1894 = isnan(0.5);
    bool _1896 = _1892 || _1894;
    out.m_63.x = _1874;
    float _1898 = fma(_1516, _1878, _1498);
    float _1900 = fma(_1876, (*spvDescriptorSet0.vp_c15)._m0[654].x, (*spvDescriptorSet0.vp_c15)._m0[654].y);
    float _1902 = precise::clamp(_1900, 0.0, 1.0);
    out.m_65.x = _424;
    out.m_65.y = _430;
    out.m_65.z = _432;
    out.m_65.w = _434;
    float _1904 = _188 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    float _1906 = fma(_1902, -2.0, 3.0);
    float _1908 = _1902 * _1902;
    float _1910 = -_1904;
    float _1912 = fma(_1496, _1910, _1884);
    float _1914 = -_1904;
    float _1916 = fma(_1520, _1914, _1886);
    float _1918 = _1908 * _1906;
    bool _1920 = !_1880;
    float _1922 = _1794;
    float _1924 = _1792;
    float _1926 = _1796;
    if (!_1920)
    {
        float _1928 = _192 * _192;
        float _1930 = rsqrt(_1848);
        float _1932 = fma(_190, _190, _1928);
        float _1934 = fma(_194, _194, _1932);
        float _1936 = sqrt(_1934);
        float _1938 = _1820 * _1930;
        float _1940 = _1808 * _1930;
        float _1942 = _1834 * _1930;
        bool _1944 = _1936 > 0.0;
        bool _1946 = !_1944;
        if (!_1946)
        {
            float _1948 = rsqrt(_1934);
            float _1950 = 1.0 / (*spvDescriptorSet0.vp_c10)._m0[2].z;
            float _1952 = _192 * _1948;
            float _1954 = _190 * _1948;
            float _1956 = _1940 * _1952;
            float _1958 = _194 * _1948;
            float _1960 = fma(_1938, _1954, _1956);
            float _1962 = _1950 * (*spvDescriptorSet0.vp_c9)._m0[142].x;
            float _1964 = fma(_1942, _1958, _1960);
            float _1966 = _1964 * _1962;
            float _1968 = fma(_190, _1966, _1794);
            float _1970 = fma(_192, _1966, _1792);
            float _1972 = fma(_194, _1966, _1796);
            _1922 = _1968;
            _1924 = _1970;
            _1926 = _1972;
        }
    }
    float _1974 = _1922;
    float _1976 = _1924;
    float _1978 = _1926;
    float _1980 = -_506;
    float _1982 = fma(_1980, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1974);
    float _1984 = -_1144;
    float _1986 = fma(_1984, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1976);
    float _1988 = -_508;
    float _1990 = fma(_1988, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1978);
    float _1992 = -_1904;
    float _1994 = fma(_1512, _1992, _1898);
    float _1996 = -_1918;
    float _1998 = _1996 + 1.0;
    float _2000 = _1986;
    float _2002 = _1982;
    float _2004 = _1990;
    if (!_1896)
    {
        float _2006 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
        float _2008 = _1586 + _2006;
        float _2010 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
        float _2012 = _512 + _2010;
        float _2014 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _2016 = -_484;
        float _2018 = _2016 + _1978;
        float _2020 = _2008 * _2008;
        float _2022 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
        float _2024 = _516 + _2022;
        float _2026 = fma(_2012, _2012, _2020);
        float _2028 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _2030 = fma(_2024, _2024, _2026);
        float _2032 = sqrt(_2030);
        float _2034 = 1.0 / _1412;
        float _2036 = _2028 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _2038 = precise::min(_2032, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _2040 = _2038 * _2014;
        float _2042 = -_480;
        float _2044 = _2042 + _1976;
        float _2046 = _2040 * _2034;
        float _2048 = -_482;
        float _2050 = _2048 + _1974;
        float _2052 = _2036 * _2046;
        float _2054 = _2018 * _2046;
        float _2056 = fma(_2050, _2052, _512);
        float _2058 = fma(_2044, _2052, _1586);
        float _2060 = fma(_2036, _2054, _516);
        _2000 = _2058;
        _2002 = _2056;
        _2004 = _2060;
    }
    float _2062 = _2000;
    float _2064 = _2002;
    float _2066 = _2004;
    float _2068 = _2062 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _2070 = fma(_1998, (*spvDescriptorSet0.vp_c15)._m0[654].w, _1918);
    float _2072 = _2062 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _2074 = _2062 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _2076 = fma(_2064, (*spvDescriptorSet0.vp_c8)._m0[1].x, _2068);
    float _2078 = _2062 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _2080 = fma(_2064, (*spvDescriptorSet0.vp_c8)._m0[0].x, _2072);
    float _2082 = fma(_2064, (*spvDescriptorSet0.vp_c8)._m0[2].x, _2074);
    float _2084 = fma(_2066, (*spvDescriptorSet0.vp_c8)._m0[1].z, _2076);
    float _2086 = fma(_2064, (*spvDescriptorSet0.vp_c8)._m0[3].x, _2078);
    float _2088 = fma(_2066, (*spvDescriptorSet0.vp_c8)._m0[0].z, _2080);
    float _2090 = fma(_2066, (*spvDescriptorSet0.vp_c8)._m0[2].z, _2082);
    float _2092 = _2084 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _2094 = fma(_2066, (*spvDescriptorSet0.vp_c8)._m0[3].z, _2086);
    float _2096 = _2088 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _2098 = _2090 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _2100 = _2092 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _2102 = _2092 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _2104 = _2092 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _2106 = _2092 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _2108 = fma(_2096, (*spvDescriptorSet0.vp_c8)._m0[4].x, _2100);
    float _2110 = fma(_2096, (*spvDescriptorSet0.vp_c8)._m0[5].x, _2102);
    float _2112 = fma(_2096, (*spvDescriptorSet0.vp_c8)._m0[6].x, _2104);
    float _2114 = fma(_2096, (*spvDescriptorSet0.vp_c8)._m0[7].x, _2106);
    float _2116 = _2094 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _2118 = fma(_2098, (*spvDescriptorSet0.vp_c8)._m0[4].z, _2108);
    float _2120 = fma(_2098, (*spvDescriptorSet0.vp_c8)._m0[5].z, _2110);
    float _2122 = fma(_2098, (*spvDescriptorSet0.vp_c8)._m0[6].z, _2112);
    float _2124 = fma(_2098, (*spvDescriptorSet0.vp_c8)._m0[7].z, _2114);
    float _2126 = in.m_67.x;
    float _2128 = _1916 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    float _2130 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _2132 = _2062 + _2130;
    bool _2134 = _1800 <= 8000.0;
    bool _2136 = isnan(_1800);
    bool _2138 = _2134 || _2136;
    bool _2140 = isnan(8000.0);
    bool _2142 = _2138 || _2140;
    float _2144 = float(_2142);
    float _2146 = fma(_2116, (*spvDescriptorSet0.vp_c8)._m0[6].w, _2122);
    float _2148 = fma(_1912, (*spvDescriptorSet0.vp_c10)._m0[8].x, _2128);
    float _2150 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _2152 = _2064 + _2150;
    float _2154 = _2132 * _2132;
    float _2156 = _2144 * _2070;
    float _2158 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _2160 = _2066 + _2158;
    float _2162 = -_534;
    float _2164 = _2162 + 1.0;
    float _2166 = fma(_2152, _2152, _2154);
    float _2168 = _2156 * (*spvDescriptorSet0.vp_c15)._m0[653].x;
    float _2170 = fma(_2116, (*spvDescriptorSet0.vp_c8)._m0[4].w, _2118);
    float _2172 = fma(_2116, (*spvDescriptorSet0.vp_c8)._m0[5].w, _2120);
    float _2174 = fma(_2160, _2160, _2166);
    float _2176 = _2164 * _2168;
    float _2178 = precise::clamp(_2176, 0.0, 1.0);
    float _2180 = fma(_2116, (*spvDescriptorSet0.vp_c8)._m0[7].w, _2124);
    float _2182 = _1916 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _2184 = _1916 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    float _2186 = -_2178;
    float _2188 = fma(_2186, (*spvDescriptorSet0.vp_c15)._m0[653].y, 1.0);
    float _2190 = sqrt(_2174);
    float _2192 = fma(_1912, (*spvDescriptorSet0.vp_c10)._m0[9].x, _2182);
    float _2194 = fma(_1912, (*spvDescriptorSet0.vp_c10)._m0[10].x, _2184);
    float _2196 = _2188 * _2126;
    float _2198 = fma(_1994, (*spvDescriptorSet0.vp_c10)._m0[8].z, _2148);
    float _2200 = fma(_1994, (*spvDescriptorSet0.vp_c10)._m0[9].z, _2192);
    float _2202 = fma(_1994, (*spvDescriptorSet0.vp_c10)._m0[10].z, _2194);
    float _2204 = _2196 * (*spvDescriptorSet0.vp_c13)._m0[1].w;
    out.gl_Position.x = _2170;
    out.gl_Position.y = _2172;
    out.gl_Position.z = _2146;
    out.gl_Position.w = _2180;
    out.m_69.x = _2204;
    bool _2206 = _2190 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _2208 = isnan(_2190);
    bool _2210 = _2206 || _2208;
    bool _2212 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _2214 = _2210 || _2212;
    out.m_71.x = _2198;
    out.m_71.y = _2200;
    out.m_71.z = _2202;
    float _2216 = _2192;
    float _2218 = (*spvDescriptorSet0.vp_c15)._m0[653].y;
    float _2220 = _2180;
    float _2222 = _2146;
    float _2224 = _2172;
    float _2226 = _2170;
    if (!_2214)
    {
        _2216 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _2228 = _2216;
    float _2230 = _2228;
    float _2232 = _2228;
    if (!_2214)
    {
        _2218 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _2234 = _2218;
    float _2236 = _2234;
    float _2238 = _2234;
    if (!_2214)
    {
        _2220 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _2240 = _2220;
    float _2242 = _2240;
    float _2244 = _2240;
    if (!_2214)
    {
        _2222 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _2246 = _2222;
    float _2248 = _2246;
    float _2250 = _2246;
    if (!_2214)
    {
        _2224 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _2252 = _2224;
    float _2254 = _2252;
    float _2256 = _2252;
    if (!_2214)
    {
        _2226 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _2258 = _2226;
    bool _2260 = !_2214;
    float _2262 = _2258;
    float _2264 = _2258;
    if (!_2260)
    {
        bool _2266 = _2190 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _2268 = isnan(_2190);
        bool _2270 = _2266 || _2268;
        bool _2272 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _2274 = _2270 || _2272;
        if (!_2274)
        {
            float _2276 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2278 = _2190 + _2276;
            float _2280 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2282 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _2280;
            float _2284 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _2286 = _2284 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _2288 = 1.0 / _2282;
            float _2290 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _2292 = _2290 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _2294 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _2296 = _2294 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _2298 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _2300 = _2298 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _2302 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _2304 = _2302 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _2306 = _2278 * _2288;
            float _2308 = precise::clamp(_2306, 0.0, 1.0);
            float _2310 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _2312 = _2310 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _2314 = fma(_2308, _2286, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _2316 = fma(_2308, _2312, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _2318 = fma(_2308, _2292, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _2320 = fma(_2308, _2296, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _2322 = fma(_2308, _2300, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _2324 = fma(_2308, _2304, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            _2238 = _2314;
            _2256 = _2322;
            _2232 = _2318;
            _2250 = _2320;
            _2244 = _2316;
            _2264 = _2324;
            _2326 = true;
        }
        else
        {
            bool _2328 = _2190 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _2330 = isnan(_2190);
            bool _2332 = _2328 || _2330;
            bool _2334 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _2336 = _2332 || _2334;
            if (!_2336)
            {
                _2230 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _2338 = _2230;
            _2232 = _2338;
            if (!_2336)
            {
                _2236 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _2340 = _2236;
            _2238 = _2340;
            if (!_2336)
            {
                _2242 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _2342 = _2242;
            _2244 = _2342;
            if (!_2336)
            {
                _2248 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _2344 = _2248;
            _2250 = _2344;
            if (!_2336)
            {
                _2254 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _2346 = _2254;
            _2256 = _2346;
            if (!_2336)
            {
                _2262 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _2348 = _2262;
            bool _2350 = !_2336;
            _2264 = _2348;
            if (!_2350)
            {
                bool _2352 = _2190 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _2354 = isnan(_2190);
                bool _2356 = _2352 || _2354;
                bool _2358 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _2360 = _2356 || _2358;
                if (!_2360)
                {
                    float _2362 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2364 = _2190 + _2362;
                    float _2366 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2368 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _2366;
                    float _2370 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _2372 = _2370 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _2374 = 1.0 / _2368;
                    float _2376 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _2378 = _2376 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _2380 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _2382 = _2380 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _2384 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _2386 = _2384 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _2388 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _2390 = _2388 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _2392 = _2364 * _2374;
                    float _2394 = precise::clamp(_2392, 0.0, 1.0);
                    float _2396 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _2398 = _2396 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _2400 = fma(_2394, _2372, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _2402 = fma(_2394, _2398, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _2404 = fma(_2394, _2378, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _2406 = fma(_2394, _2382, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _2408 = fma(_2394, _2386, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _2410 = fma(_2394, _2390, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    _2238 = _2400;
                    _2256 = _2408;
                    _2232 = _2404;
                    _2250 = _2406;
                    _2244 = _2402;
                    _2264 = _2410;
                    _2326 = true;
                }
                else
                {
                    _2238 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _2256 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _2232 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _2250 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _2244 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _2264 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _2326 = false;
    float _2412 = _2238;
    float _2414 = _2256;
    float _2416 = _2232;
    float _2418 = _2250;
    float _2420 = _2244;
    float _2422 = _2264;
    float _2424 = fma(_2200, -0.5, 0.5);
    float _2426 = precise::clamp(_2424, 0.0, 1.0);
    float _2428 = -_2412;
    float _2430 = _2428 + _2414;
    float _2432 = -_2416;
    float _2434 = _2432 + _2418;
    float _2436 = -_2420;
    float _2438 = _2436 + _2422;
    bool _2440 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _2442 = fma(_2426, _2430, _2412);
    float _2444 = fma(_2426, _2434, _2416);
    float _2446 = fma(_2426, _2438, _2420);
    float _2448 = _2442 * 0.586610972881317138671875;
    out.m_40.x = 1.0;
    float _2450 = fma(_2444, 0.298911988735198974609375, _2448);
    float _2452 = fma(_2446, 0.114477999508380889892578125, _2450);
    out.m_73.x = 0.0;
    float _2454 = -_2452;
    float _2456 = _2444 + _2454;
    float _2458 = -_2452;
    float _2460 = _2442 + _2458;
    float _2462 = -_2452;
    float _2464 = _2446 + _2462;
    float _2466 = (*spvDescriptorSet0.vp_c10)._m0[3].x * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _2468 = fma(_2456, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2452);
    float _2470 = fma(_2460, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2452);
    float _2472 = fma(_2464, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2452);
    out.m_69.w = _2466;
    out.m_75.x = _2468;
    out.m_75.y = _2470;
    out.m_75.z = _2472;
    if (!_2440)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_65.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_65.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_65.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_65.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_61.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_61.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_61.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_61.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_44.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_44.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_44.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_44.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_59.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_59.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_59.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_59.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_75.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_75.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_75.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_75.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_40.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_40.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_40.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_40.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_57.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_57.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_57.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_57.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_71.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_71.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_71.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_71.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_63.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_63.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_63.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_63.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_73.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_73.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_73.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_73.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_69.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_69.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_69.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_69.w)); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _2474 = -_2062;
    float _2476 = _2474 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
    float _2478 = -_2064;
    float _2480 = _2478 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
    float _2482 = -_2066;
    float _2484 = _2482 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
    float _2486 = _2476 * _2476;
    float _2488 = fma(_2480, _2480, _2486);
    float _2490 = fma(_2484, _2484, _2488);
    float _2492 = sqrt(_2490);
    float _2494 = rsqrt(_2490);
    float _2496 = -_2492;
    float _2498 = _2496 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _2500 = _2498 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
    float _2502 = precise::clamp(_2500, 0.0, 1.0);
    float _2504 = _2480 * _2494;
    float _2506 = _2476 * _2494;
    float _2508 = abs(_2502);
    float _2510 = log2(_2508);
    float _2512 = _2484 * _2494;
    float _2514 = _2504 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
    float _2516 = _2200 * _2506;
    float _2518 = -_2506;
    float _2520 = -_2514;
    float _2522 = fma(_2518, (*spvDescriptorSet0.vp_c15)._m0[656].y, _2520);
    float _2524 = fma(_2198, _2504, _2516);
    float _2526 = -_2512;
    float _2528 = fma(_2526, (*spvDescriptorSet0.vp_c15)._m0[656].z, _2522);
    float _2530 = fma(_2202, _2512, _2524);
    float _2532 = precise::clamp(_2530, 0.0, 1.0);
    float _2534 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
    float _2536 = _2528 + _2534;
    float _2538 = _2510 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
    float _2540 = _2536 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
    float _2542 = precise::clamp(_2540, 0.0, 1.0);
    float _2544 = exp2(_2538);
    float _2546 = _2544 * _2542;
    float _2548 = _2532 * _2546;
    float _2550 = _2548 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
    float _2552 = _2548 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
    float _2554 = _2548 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
    out.m_73.x = _2550;
    out.m_73.y = _2552;
    out.m_73.z = _2554;
    { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_65.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_65.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_65.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_65.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_61.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_61.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_61.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_61.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_44.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_44.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_44.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_44.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_59.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_59.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_59.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_59.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_75.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_75.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_75.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_75.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_40.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_40.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_40.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_40.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_57.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_57.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_57.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_57.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_71.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_71.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_71.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_71.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_63.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_63.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_63.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_63.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_73.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_73.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_73.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_73.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_69.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_69.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_69.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_69.w)); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
}

