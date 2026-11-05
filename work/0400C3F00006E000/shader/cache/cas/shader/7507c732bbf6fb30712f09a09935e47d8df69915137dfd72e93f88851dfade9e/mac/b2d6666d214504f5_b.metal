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
    float4 m_55 [[user(locn0)]];
    float4 m_61 [[user(locn1)]];
    float4 m_44 [[user(locn2)]];
    float4 m_59 [[user(locn3)]];
    float4 m_73 [[user(locn4)]];
    float4 m_40 [[user(locn5)]];
    float4 m_57 [[user(locn6)]];
    float4 m_67 [[user(locn7)]];
    float4 m_65 [[user(locn8)]];
    float4 m_71 [[user(locn9)]];
    float4 m_69 [[user(locn10)]];
    float4 gl_Position [[position, invariant]];
    float gl_PointSize [[point_size]];
};

struct main0_in
{
    float4 m_63 [[attribute(0)]];
    float4 m_49 [[attribute(2)]];
    float4 m_37 [[attribute(3)]];
    float4 m_42 [[attribute(4)]];
    float4 m_51 [[attribute(5)]];
    float4 m_53 [[attribute(6)]];
};

vertex main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], uint gl_VertexIndex [[vertex_id]])
{
    main0_out out = {};
    out.m_55 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_61 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_44 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_59 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_73 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_40 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_57 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_67 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_65 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_71 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_69 = float4(0.0, 0.0, 0.0, 1.0);
    bool _2014 = false;
    bool _450 = false;
    bool _306 = false;
    bool _210 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _87 = in.m_37.w;
    float _89 = trunc(_87);
    int _92 = int(_89);
    bool _96 = _92 >= 1;
    float _98 = 0.0;
    if (!_96)
    {
        _98 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _100 = _98;
    if (!_96)
    {
        out.m_40.x = 0.0;
    }
    int _102 = 0;
    if (!_96)
    {
        float _104 = _100 * 5.0;
        _102 = as_type<int>(_104);
    }
    int _106 = _102;
    int _108 = _106;
    if (!_96)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2298 = as_type<float>(_106);
        out.gl_Position.z = _2298;
    }
    if (!_96)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _110 = in.m_42.w;
    float _112 = float(_92);
    float _114 = 1.0 / _112;
    float _116 = -_110;
    float _118 = _116 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _120 = _110 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _122 = isnan(_110);
    bool _124 = _120 || _122;
    bool _126 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _128 = _124 || _126;
    float _130 = _118 * _114;
    bool _132 = _118 >= _112;
    bool _134 = !_128;
    bool _136 = _132 || _134;
    out.m_44.x = _130;
    float _138 = _110;
    if (_136)
    {
        _138 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _140 = _138;
    if (_136)
    {
        out.m_40.x = 0.0;
    }
    if (_136)
    {
        float _142 = _140 * 5.0;
        _108 = as_type<int>(_142);
    }
    int _144 = _108;
    if (_136)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2369 = as_type<float>(_144);
        out.gl_Position.z = _2369;
    }
    if (_136)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _146 = as_type<float>(int(gl_VertexIndex));
    float _148 = in.m_49.x;
    float _150 = in.m_49.y;
    float _152 = in.m_49.z;
    int _154 = as_type<int>(_146) & 1;
    bool _156 = _154 != 0;
    int _158 = as_type<int>(_146) & 2;
    bool _160 = _158 != 0;
    bool _162 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _164 = _150 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _166 = _150 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _168 = _150 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    bool _170 = !_156;
    float _172 = _170 ? (-0.5) : 0.5;
    float _174 = fma(_148, (*spvDescriptorSet0.vp_c10)._m0[4].x, _164);
    float _176 = fma(_148, (*spvDescriptorSet0.vp_c10)._m0[5].x, _166);
    float _178 = fma(_148, (*spvDescriptorSet0.vp_c10)._m0[6].x, _168);
    bool _180 = !_160;
    float _182 = _180 ? (-0.5) : 0.5;
    float _184 = fma(_152, (*spvDescriptorSet0.vp_c10)._m0[4].z, _174);
    float _186 = fma(_152, (*spvDescriptorSet0.vp_c10)._m0[5].z, _176);
    float _188 = fma(_152, (*spvDescriptorSet0.vp_c10)._m0[6].z, _178);
    bool _190 = !_162;
    float _208;
    if (!_190)
    {
        float _192 = in.m_51.x;
        float _194 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _196 = _192 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _198 = fma(_196, (*spvDescriptorSet0.vp_c9)._m0[12].x, _118);
        float _200 = _198 * _194;
        float _202 = floor(_200);
        float _204 = -_202;
        float _206 = _200 + _204;
        _208 = _206;
        _210 = true;
    }
    else
    {
        _208 = _130;
    }
    _210 = false;
    float _212 = _208;
    float _214 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _216 = _212 + _214;
    bool _218 = _212 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _220 = isnan(_212);
    bool _222 = _218 || _220;
    bool _224 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _226 = _222 || _224;
    float _228 = float(_226);
    float _230 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _232 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _230;
    float _234 = -_228;
    float _236 = _234 + 1.0;
    bool _238 = _212 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _240 = isnan(_212);
    bool _242 = _238 || _240;
    bool _244 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _246 = _242 || _244;
    float _248 = float(_246);
    float _250 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _252 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _250;
    bool _254 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _256 = 1.0 / _232;
    float _258 = _248 * _236;
    float _260 = -_248;
    float _262 = _260 + 1.0;
    float _264 = _216 * _256;
    float _266 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _268 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _266;
    float _270 = fma(_252, _264, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _272 = fma(_268, _264, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _274 = _270 * _258;
    float _276 = _272 * _258;
    float _278 = fma(_262, (*spvDescriptorSet0.vp_c9)._m0[143].x, _274);
    float _280 = fma(_262, (*spvDescriptorSet0.vp_c9)._m0[143].y, _276);
    float _282 = fma(_228, (*spvDescriptorSet0.vp_c9)._m0[144].x, _278);
    float _284 = fma(_228, (*spvDescriptorSet0.vp_c9)._m0[144].y, _280);
    bool _286 = !_254;
    float _304;
    if (!_286)
    {
        float _288 = in.m_51.x;
        float _290 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _292 = _288 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _294 = fma(_292, (*spvDescriptorSet0.vp_c9)._m0[11].y, _118);
        float _296 = _294 * _290;
        float _298 = floor(_296);
        float _300 = -_298;
        float _302 = _296 + _300;
        _304 = _302;
        _306 = true;
    }
    else
    {
        _304 = _130;
    }
    _306 = false;
    float _308 = _304;
    float _310 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _312 = _308 + _310;
    float _314 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _316 = _314 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _318 = _308 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _320 = isnan(_308);
    bool _322 = _318 || _320;
    bool _324 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _326 = _322 || _324;
    float _328 = float(_326);
    float _330 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _332 = _330 + (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _334 = _308 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _336 = isnan(_308);
    bool _338 = _334 || _336;
    bool _340 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _342 = _338 || _340;
    float _344 = float(_342);
    float _346 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _348 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _346;
    bool _350 = _308 >= (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _352 = isnan(_308);
    bool _354 = _350 || _352;
    bool _356 = isnan((*spvDescriptorSet0.vp_c9)._m0[117].w);
    bool _358 = _354 || _356;
    float _360 = float(_358);
    float _362 = 1.0 / _316;
    float _364 = -_328;
    float _366 = _364 + 1.0;
    bool _368 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].w;
    float _370 = _344 * _366;
    float _372 = -_344;
    float _374 = _372 + 1.0;
    float _376 = 1.0 / _332;
    float _378 = _348 * _362;
    float _380 = -(*spvDescriptorSet0.vp_c9)._m0[116].x;
    float _382 = _380 + (*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _384 = fma(_378, _312, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _386 = _382 * _376;
    float _388 = _384 * _370;
    float _390 = -_360;
    float _392 = _390 + 1.0;
    float _394 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _396 = _308 + _394;
    float _398 = fma(_374, (*spvDescriptorSet0.vp_c9)._m0[115].x, _388);
    float _400 = _328 * _392;
    float _402 = fma(_386, _396, (*spvDescriptorSet0.vp_c9)._m0[116].x);
    float _404 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _406 = fma(_402, _400, _398);
    float _408 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _410 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _412 = _404 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _414 = fma(_360, (*spvDescriptorSet0.vp_c9)._m0[117].x, _406);
    float _416 = _408 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _418 = _410 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _420 = in.m_53.x;
    float _422 = in.m_53.y;
    float _424 = _414 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    out.m_55.x = _416;
    out.m_55.y = _412;
    out.m_55.z = _418;
    out.m_55.w = _424;
    float _426 = _284 * _422;
    float _428 = _282 * _420;
    bool _430 = !_368;
    float _448;
    if (!_430)
    {
        float _432 = in.m_51.x;
        float _434 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].w;
        float _436 = _432 * (*spvDescriptorSet0.vp_c9)._m0[13].x;
        float _438 = fma(_436, (*spvDescriptorSet0.vp_c9)._m0[11].w, _118);
        float _440 = _438 * _434;
        float _442 = floor(_440);
        float _444 = -_442;
        float _446 = _440 + _444;
        _448 = _446;
        _450 = true;
    }
    else
    {
        _448 = _130;
    }
    _450 = false;
    float _452 = _448;
    float _454 = in.m_51.x;
    float _456 = in.m_51.y;
    float _458 = in.m_51.z;
    float _460 = in.m_51.w;
    float _462 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    int _464 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _466 = _464 != 0;
    float _468 = in.m_37.x;
    float _470 = in.m_37.y;
    float _472 = in.m_37.z;
    int _474 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _476 = _474 != 0;
    float _478 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    int _480 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _482 = _480 != 0;
    int _484 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _486 = _484 != 0;
    float _488 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    bool _490 = _454 > 0.5;
    float _492 = _456 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    bool _494 = _460 > 0.5;
    float _496 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _498 = _496 + (*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _500 = -_172;
    int _502 = _490 ? as_type<int>(_500) : as_type<int>(_172);
    float _504 = (*spvDescriptorSet0.vp_c9)._m0[83].w + (*spvDescriptorSet0.vp_c9)._m0[83].y;
    bool _506 = _456 > 0.5;
    float _508 = 1.0 / _498;
    bool _510 = !_476;
    float _512 = _510 ? _172 : as_type<float>(_502);
    float _514 = -_182;
    int _516 = _506 ? as_type<int>(_514) : as_type<int>(_182);
    bool _518 = _458 > 0.5;
    int _520 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _522 = _520 != 0;
    float _524 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].w;
    float _526 = 0.0;
    float _528 = _524;
    if (!_466)
    {
        _526 = _458;
    }
    float _530 = _526;
    float _532 = _470 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _534 = 0.0;
    float _536 = _530;
    if (!_466)
    {
        _534 = _458;
    }
    float _538 = _534;
    float _540 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    float _542 = 0.0;
    float _544 = _538;
    if (!_466)
    {
        _542 = _456;
    }
    float _546 = _542;
    float _548 = fma(_468, (*spvDescriptorSet0.vp_c10)._m0[4].x, _532);
    bool _550 = !_482;
    float _552 = _550 ? _182 : as_type<float>(_516);
    float _554 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _556 = _546;
    if (_466)
    {
        _536 = _456;
    }
    float _558 = _536;
    float _560 = _454 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    if (_466)
    {
        _556 = _454;
    }
    float _562 = _556;
    if (_466)
    {
        _544 = _456;
    }
    float _564 = _544;
    float _566 = -_540;
    float _568 = fma(_560, 2.0, _566);
    int _570 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 16;
    bool _572 = _570 != 0;
    int _574 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 32;
    bool _576 = _574 != 0;
    float _578 = _470 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _580 = _470 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _582 = fma(_564, (*spvDescriptorSet0.vp_c9)._m0[83].w, _504);
    float _584 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    float _586 = fma(_492, -2.0, _554);
    float _588 = fma(_468, (*spvDescriptorSet0.vp_c10)._m0[6].x, _580);
    float _590 = fma(_456, (*spvDescriptorSet0.vp_c9)._m0[78].w, _584);
    float _592 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _594 = _452 + _592;
    float _596 = (*spvDescriptorSet0.vp_c9)._m0[83].z + (*spvDescriptorSet0.vp_c9)._m0[83].x;
    float _598 = -(*spvDescriptorSet0.vp_c9)._m0[131].x;
    float _600 = (*spvDescriptorSet0.vp_c9)._m0[132].x + _598;
    float _602 = fma(_468, (*spvDescriptorSet0.vp_c10)._m0[5].x, _578);
    float _604 = -_118;
    float _606 = fma(_604, (*spvDescriptorSet0.vp_c9)._m0[76].x, _568);
    float _608 = fma(_472, (*spvDescriptorSet0.vp_c10)._m0[4].z, _548);
    float _610 = _600 * _508;
    float _612 = fma(_472, (*spvDescriptorSet0.vp_c10)._m0[5].z, _602);
    float _614 = _462 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _616 = _512 + 0.5;
    float _618 = fma(_610, _594, (*spvDescriptorSet0.vp_c9)._m0[131].x);
    bool _620 = _452 >= (*spvDescriptorSet0.vp_c9)._m0[132].w;
    bool _622 = isnan(_452);
    bool _624 = _620 || _622;
    bool _626 = isnan((*spvDescriptorSet0.vp_c9)._m0[132].w);
    bool _628 = _624 || _626;
    float _630 = float(_628);
    float _632 = fma(_472, (*spvDescriptorSet0.vp_c10)._m0[6].z, _588);
    float _634 = fma(_614, _616, _606);
    bool _636 = _452 >= (*spvDescriptorSet0.vp_c9)._m0[131].w;
    bool _638 = isnan(_452);
    bool _640 = _636 || _638;
    bool _642 = isnan((*spvDescriptorSet0.vp_c9)._m0[131].w);
    bool _644 = _640 || _642;
    float _646 = float(_644);
    float _648 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    float _650 = -_630;
    float _652 = _650 + 1.0;
    float _654 = fma(_118, (*spvDescriptorSet0.vp_c9)._m0[76].y, _586);
    float _656 = _478 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _658 = _552 + (-0.5);
    float _660 = fma(_562, (*spvDescriptorSet0.vp_c9)._m0[83].z, _596);
    float _662 = (*spvDescriptorSet0.vp_c9)._m0[82].x + (*spvDescriptorSet0.vp_c9)._m0[81].z;
    float _664 = _646 * _652;
    float _666 = _562 * (*spvDescriptorSet0.vp_c9)._m0[82].x;
    float _668 = -_656;
    float _670 = -_654;
    float _672 = fma(_668, _658, _670);
    float _674 = _618 * _664;
    float _676 = -_662;
    float _678 = fma(_666, 2.0, _676);
    float _680 = _558 * (*spvDescriptorSet0.vp_c9)._m0[82].y;
    float _682 = -_172;
    int _684 = _518 ? as_type<int>(_682) : as_type<int>(_172);
    float _686 = (*spvDescriptorSet0.vp_c9)._m0[82].y + (*spvDescriptorSet0.vp_c9)._m0[81].w;
    float _688 = -_646;
    float _690 = _688 + 1.0;
    float _692 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    bool _694 = !_486;
    float _696 = _694 ? _172 : as_type<float>(_684);
    float _698 = _612 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _700 = fma(_680, -2.0, _686);
    float _702 = fma(_690, (*spvDescriptorSet0.vp_c9)._m0[131].x, _674);
    float _704 = _648 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    float _706 = fma(_454, (*spvDescriptorSet0.vp_c9)._m0[78].z, _692);
    float _708 = _608 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _710 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _712 = _698 + _710;
    float _714 = _696 + 0.5;
    float _716 = -_118;
    float _718 = fma(_716, (*spvDescriptorSet0.vp_c9)._m0[81].x, _678);
    float _720 = fma(_118, (*spvDescriptorSet0.vp_c9)._m0[77].w, _590);
    float _722 = fma(_118, (*spvDescriptorSet0.vp_c9)._m0[81].y, _700);
    float _724 = fma(_118, (*spvDescriptorSet0.vp_c9)._m0[77].z, _706);
    float _726 = fma(_118, (*spvDescriptorSet0.vp_c9)._m0[82].w, _582);
    float _728 = _632 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _730 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _732 = _708 + _730;
    float _734 = _712 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _736 = fma(_704, _714, _718);
    float _738 = -_182;
    int _740 = _494 ? as_type<int>(_738) : as_type<int>(_182);
    float _742 = _488 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    float _744 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _746 = _728 + _744;
    float _748 = fma(_732, (*spvDescriptorSet0.vp_c8)._m0[28].x, _734);
    float _750 = -_724;
    float _752 = _750 + 1.0;
    float _754 = fma(_118, (*spvDescriptorSet0.vp_c9)._m0[82].z, _660);
    bool _756 = !_522;
    float _758 = _756 ? _182 : as_type<float>(_740);
    float _760 = fma(_746, (*spvDescriptorSet0.vp_c8)._m0[28].z, _748);
    float _762 = -_752;
    float _764 = fma(_512, _762, _634);
    float _766 = -_720;
    float _768 = _766 + 1.0;
    float _770 = _712 * _712;
    float _772 = _758 + (-0.5);
    bool _774 = _760 >= 0.0;
    float _776 = fma(_552, _768, _672);
    float _778 = fma(_732, _732, _770);
    float _780 = -_172;
    int _782 = _506 ? as_type<int>(_780) : as_type<int>(_172);
    float _784 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].z;
    float _786 = -_182;
    int _788 = _518 ? as_type<int>(_786) : as_type<int>(_182);
    float _790 = -_742;
    float _792 = -_722;
    float _794 = fma(_790, _772, _792);
    float _796 = fma(_630, (*spvDescriptorSet0.vp_c9)._m0[132].x, _702);
    float _798 = -_754;
    float _800 = _798 + 1.0;
    float _802 = -_726;
    float _804 = _802 + 1.0;
    float _806 = fma(_746, _746, _778);
    bool _808 = !_572;
    float _810 = _808 ? _172 : as_type<float>(_782);
    float _812 = -_800;
    float _814 = fma(_696, _812, _736);
    bool _816 = !_576;
    float _818 = _816 ? _182 : as_type<float>(_788);
    float _820 = fma(_758, _804, _794);
    float _822 = _810 + 0.5;
    float _824 = -_818;
    float _826 = _824 + 0.5;
    float _828 = rsqrt(_806);
    float _830 = _736;
    float _832 = _814;
    if (_774)
    {
        _830 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _834 = _830;
    float _836 = _822 * (*spvDescriptorSet0.vp_c9)._m0[90].x;
    float _838 = _826 * (*spvDescriptorSet0.vp_c9)._m0[90].y;
    float _840 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _842 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _844 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _846 = _836 * _784;
    float _848 = _838 * _524;
    float _850 = _840 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _852 = _842 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _854 = _844 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    int _856 = as_type<int>(_834);
    float _858 = _850;
    float _860 = _852;
    if (_774)
    {
        float _862 = _834 * 5.0;
        _856 = as_type<int>(_862);
    }
    int _864 = _856;
    float _866 = _796 * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    out.m_57.x = _846;
    out.m_57.y = _848;
    float _868 = _712 * _828;
    float _870 = _732 * _828;
    out.m_59.x = _764;
    out.m_59.y = _776;
    out.m_59.z = _814;
    out.m_59.w = _820;
    if (_774)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _3610 = as_type<float>(_864);
        out.gl_Position.z = _3610;
    }
    out.m_61.x = _850;
    out.m_61.y = _852;
    out.m_61.z = _854;
    out.m_61.w = _866;
    if (_774)
    {
        out.m_40.x = 0.0;
    }
    if (_774)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _872 = -_868;
    float _874 = fma(_872, (*spvDescriptorSet0.vp_c9)._m0[18].w, _698);
    float _876 = _746 * _828;
    float _878 = -_870;
    float _880 = fma(_878, (*spvDescriptorSet0.vp_c9)._m0[18].w, _708);
    float _882 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _884 = _874 + _882;
    float _886 = -_876;
    float _888 = fma(_886, (*spvDescriptorSet0.vp_c9)._m0[18].w, _728);
    float _890 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _892 = _880 + _890;
    float _894 = _884 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _896 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _898 = _888 + _896;
    float _900 = fma(_892, (*spvDescriptorSet0.vp_c8)._m0[28].x, _894);
    float _902 = fma(_898, (*spvDescriptorSet0.vp_c8)._m0[28].z, _900);
    bool _904 = _902 >= 0.0;
    if (_904)
    {
        _832 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _906 = _832;
    int _908 = as_type<int>(_906);
    if (_904)
    {
        out.m_40.x = 0.0;
    }
    if (_904)
    {
        float _910 = _906 * 5.0;
        _908 = as_type<int>(_910);
    }
    int _912 = _908;
    if (_904)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _3712 = as_type<float>(_912);
        out.gl_Position.z = _3712;
    }
    if (_904)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _914 = fma(_880, (*spvDescriptorSet0.vp_c15)._m0[652].x, (*spvDescriptorSet0.vp_c15)._m0[652].z);
    float _916 = fma(_888, (*spvDescriptorSet0.vp_c15)._m0[652].y, (*spvDescriptorSet0.vp_c15)._m0[652].w);
    float _918 = floor(_914);
    float _920 = floor(_916);
    float _922 = -_918;
    float _924 = _914 + _922;
    float _926 = -_920;
    float _928 = _916 + _926;
    float2 _3748 = float2(_924, _928);
    float _930 = dm_bs(spvDescriptorSet0.vp_t_tcb_24.sample(spvDescriptorSet0.vp_t_tcb_24Smplr, select(_3748, float2(0.0), isnan(_3748)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_24, spvDescriptorSet0.vp_t_tcb_24Smplr_w, select(_3748, float2(0.0), isnan(_3748)), level(0.0)).x;
    float _932 = -_868;
    float _934 = fma(_932, (*spvDescriptorSet0.vp_c9)._m0[18].w, _712);
    float _936 = -_870;
    float _938 = fma(_936, (*spvDescriptorSet0.vp_c9)._m0[18].w, _732);
    float _940 = -(*spvDescriptorSet0.vp_c9)._m0[167].w;
    float _942 = (*spvDescriptorSet0.vp_c9)._m0[168].w + _940;
    float _944 = -(*spvDescriptorSet0.vp_c9)._m0[168].w;
    float _946 = _944 + (*spvDescriptorSet0.vp_c9)._m0[169].w;
    float _948 = -(*spvDescriptorSet0.vp_c9)._m0[169].w;
    float _950 = (*spvDescriptorSet0.vp_c9)._m0[170].w + _948;
    float _952 = -(*spvDescriptorSet0.vp_c9)._m0[170].w;
    float _954 = _952 + (*spvDescriptorSet0.vp_c9)._m0[171].w;
    float _956 = -(*spvDescriptorSet0.vp_c9)._m0[171].w;
    float _958 = (*spvDescriptorSet0.vp_c9)._m0[172].w + _956;
    float _960 = -(*spvDescriptorSet0.vp_c9)._m0[172].w;
    float _962 = _960 + (*spvDescriptorSet0.vp_c9)._m0[173].w;
    bool _964 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[14].y;
    float _966 = 1.0 / _942;
    float _968 = _934 * _934;
    float _970 = -_876;
    float _972 = fma(_970, (*spvDescriptorSet0.vp_c9)._m0[18].w, _746);
    float _974 = fma(_938, _938, _968);
    float _976 = -(*spvDescriptorSet0.vp_c9)._m0[173].w;
    float _978 = (*spvDescriptorSet0.vp_c9)._m0[174].w + _976;
    float _980 = 1.0 / _946;
    if (!_964)
    {
        _528 = (*spvDescriptorSet0.vp_c7)._m0[0].x;
    }
    float _982 = _528;
    float _984 = 1.0 / _950;
    float _986 = 1.0 / _954;
    float _988 = 1.0 / _958;
    float _990 = 1.0 / _962;
    bool _992 = !_964;
    float _994 = _982;
    if (!_992)
    {
        float _996 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[14].y;
        float _998 = _454 * (*spvDescriptorSet0.vp_c9)._m0[15].y;
        float _1000 = fma(_998, (*spvDescriptorSet0.vp_c9)._m0[14].y, (*spvDescriptorSet0.vp_c7)._m0[0].x);
        float _1002 = _1000 * _996;
        float _1004 = floor(_1002);
        float _1006 = -_1004;
        float _1008 = _1002 + _1006;
        _994 = _1008;
    }
    float _1010 = _994;
    float _1012 = -(*spvDescriptorSet0.vp_c9)._m0[167].w;
    float _1014 = _1010 + _1012;
    float _1016 = fma(_972, _972, _974);
    float _1018 = -(*spvDescriptorSet0.vp_c9)._m0[168].w;
    float _1020 = _1010 + _1018;
    float _1022 = 1.0 / _978;
    float _1024 = _1014 * _966;
    float _1026 = -(*spvDescriptorSet0.vp_c9)._m0[169].w;
    float _1028 = _1010 + _1026;
    float _1030 = -(*spvDescriptorSet0.vp_c9)._m0[170].w;
    float _1032 = _1010 + _1030;
    float _1034 = _1020 * _980;
    bool _1036 = _1010 >= (*spvDescriptorSet0.vp_c9)._m0[171].w;
    bool _1038 = isnan(_1010);
    bool _1040 = _1036 || _1038;
    bool _1042 = isnan((*spvDescriptorSet0.vp_c9)._m0[171].w);
    bool _1044 = _1040 || _1042;
    float _1046 = float(_1044);
    float _1048 = _1028 * _984;
    float _1050 = _1032 * _986;
    float _1052 = -(*spvDescriptorSet0.vp_c9)._m0[172].w;
    float _1054 = _1010 + _1052;
    bool _1056 = _1010 >= (*spvDescriptorSet0.vp_c9)._m0[170].w;
    bool _1058 = isnan(_1010);
    bool _1060 = _1056 || _1058;
    bool _1062 = isnan((*spvDescriptorSet0.vp_c9)._m0[170].w);
    bool _1064 = _1060 || _1062;
    float _1066 = float(_1064);
    float _1068 = -(*spvDescriptorSet0.vp_c9)._m0[171].w;
    float _1070 = _1010 + _1068;
    bool _1072 = _1010 >= (*spvDescriptorSet0.vp_c9)._m0[169].w;
    bool _1074 = isnan(_1010);
    bool _1076 = _1072 || _1074;
    bool _1078 = isnan((*spvDescriptorSet0.vp_c9)._m0[169].w);
    bool _1080 = _1076 || _1078;
    float _1082 = float(_1080);
    float _1084 = _1054 * _990;
    float _1086 = -_1046;
    float _1088 = _1086 + 1.0;
    float _1090 = -_1066;
    float _1092 = _1090 + 1.0;
    float _1094 = _1070 * _988;
    bool _1096 = _1010 >= (*spvDescriptorSet0.vp_c9)._m0[168].w;
    bool _1098 = isnan(_1010);
    bool _1100 = _1096 || _1098;
    bool _1102 = isnan((*spvDescriptorSet0.vp_c9)._m0[168].w);
    bool _1104 = _1100 || _1102;
    float _1106 = float(_1104);
    float _1108 = -(*spvDescriptorSet0.vp_c9)._m0[173].w;
    float _1110 = _1010 + _1108;
    float _1112 = -_1082;
    float _1114 = _1112 + 1.0;
    float _1116 = _1082 * _1092;
    float _1118 = _1066 * _1088;
    float _1120 = _1110 * _1022;
    bool _1122 = _1010 >= (*spvDescriptorSet0.vp_c9)._m0[167].w;
    bool _1124 = isnan(_1010);
    bool _1126 = _1122 || _1124;
    bool _1128 = isnan((*spvDescriptorSet0.vp_c9)._m0[167].w);
    bool _1130 = _1126 || _1128;
    float _1132 = float(_1130);
    float _1134 = _1106 * _1114;
    float _1136 = -(*spvDescriptorSet0.vp_c9)._m0[167].x;
    float _1138 = (*spvDescriptorSet0.vp_c9)._m0[168].x + _1136;
    float _1140 = -_1106;
    float _1142 = _1140 + 1.0;
    bool _1144 = _1010 >= (*spvDescriptorSet0.vp_c9)._m0[172].w;
    bool _1146 = isnan(_1010);
    bool _1148 = _1144 || _1146;
    bool _1150 = isnan((*spvDescriptorSet0.vp_c9)._m0[172].w);
    bool _1152 = _1148 || _1150;
    float _1154 = float(_1152);
    float _1156 = -(*spvDescriptorSet0.vp_c9)._m0[168].x;
    float _1158 = _1156 + (*spvDescriptorSet0.vp_c9)._m0[169].x;
    float _1160 = fma(_1138, _1024, (*spvDescriptorSet0.vp_c9)._m0[167].x);
    float _1162 = _1132 * _1142;
    bool _1164 = _1010 >= (*spvDescriptorSet0.vp_c9)._m0[173].w;
    bool _1166 = isnan(_1010);
    bool _1168 = _1164 || _1166;
    bool _1170 = isnan((*spvDescriptorSet0.vp_c9)._m0[173].w);
    bool _1172 = _1168 || _1170;
    float _1174 = float(_1172);
    float _1176 = -_1132;
    float _1178 = _1176 + 1.0;
    float _1180 = _1160 * _1162;
    float _1182 = -_1154;
    float _1184 = _1182 + 1.0;
    float _1186 = -_1174;
    float _1188 = _1186 + 1.0;
    float _1190 = fma(_1158, _1034, (*spvDescriptorSet0.vp_c9)._m0[168].x);
    float _1192 = fma(_1178, (*spvDescriptorSet0.vp_c9)._m0[167].x, _1180);
    float _1194 = -(*spvDescriptorSet0.vp_c9)._m0[167].y;
    float _1196 = (*spvDescriptorSet0.vp_c9)._m0[168].y + _1194;
    float _1198 = _1046 * _1184;
    float _1200 = _1154 * _1188;
    float _1202 = fma(_1190, _1134, _1192);
    float _1204 = fma(_1196, _1024, (*spvDescriptorSet0.vp_c9)._m0[167].y);
    float _1206 = -(*spvDescriptorSet0.vp_c9)._m0[168].y;
    float _1208 = _1206 + (*spvDescriptorSet0.vp_c9)._m0[169].y;
    float _1210 = sqrt(_1016);
    float _1212 = _1204 * _1162;
    float _1214 = -(*spvDescriptorSet0.vp_c9)._m0[169].x;
    float _1216 = (*spvDescriptorSet0.vp_c9)._m0[170].x + _1214;
    float _1218 = fma(_1208, _1034, (*spvDescriptorSet0.vp_c9)._m0[168].y);
    float _1220 = -(*spvDescriptorSet0.vp_c9)._m0[170].x;
    float _1222 = _1220 + (*spvDescriptorSet0.vp_c9)._m0[171].x;
    float _1224 = fma(_1178, (*spvDescriptorSet0.vp_c9)._m0[167].y, _1212);
    float _1226 = fma(_1216, _1048, (*spvDescriptorSet0.vp_c9)._m0[169].x);
    float _1228 = -(*spvDescriptorSet0.vp_c9)._m0[169].y;
    float _1230 = (*spvDescriptorSet0.vp_c9)._m0[170].y + _1228;
    float _1232 = fma(_1222, _1050, (*spvDescriptorSet0.vp_c9)._m0[170].x);
    float _1234 = fma(_1218, _1134, _1224);
    float _1236 = fma(_1226, _1116, _1202);
    float _1238 = fma(_1230, _1048, (*spvDescriptorSet0.vp_c9)._m0[169].y);
    float _1240 = -(*spvDescriptorSet0.vp_c9)._m0[170].y;
    float _1242 = _1240 + (*spvDescriptorSet0.vp_c9)._m0[171].y;
    float _1244 = fma(_1238, _1116, _1234);
    float _1246 = fma(_1232, _1118, _1236);
    float _1248 = -(*spvDescriptorSet0.vp_c9)._m0[171].x;
    float _1250 = (*spvDescriptorSet0.vp_c9)._m0[172].x + _1248;
    float _1252 = fma(_1242, _1050, (*spvDescriptorSet0.vp_c9)._m0[170].y);
    bool _1254 = _1010 >= (*spvDescriptorSet0.vp_c9)._m0[174].w;
    bool _1256 = isnan(_1010);
    bool _1258 = _1254 || _1256;
    bool _1260 = isnan((*spvDescriptorSet0.vp_c9)._m0[174].w);
    bool _1262 = _1258 || _1260;
    float _1264 = float(_1262);
    float _1266 = _828 * _1210;
    float _1268 = fma(_1250, _1094, (*spvDescriptorSet0.vp_c9)._m0[171].x);
    float _1270 = -(*spvDescriptorSet0.vp_c9)._m0[171].y;
    float _1272 = (*spvDescriptorSet0.vp_c9)._m0[172].y + _1270;
    float _1274 = fma(_1252, _1118, _1244);
    float _1276 = -(*spvDescriptorSet0.vp_c9)._m0[172].x;
    float _1278 = _1276 + (*spvDescriptorSet0.vp_c9)._m0[173].x;
    float _1280 = fma(_1268, _1198, _1246);
    float _1282 = fma(_1272, _1094, (*spvDescriptorSet0.vp_c9)._m0[171].y);
    float _1284 = -(*spvDescriptorSet0.vp_c9)._m0[172].y;
    float _1286 = _1284 + (*spvDescriptorSet0.vp_c9)._m0[173].y;
    float _1288 = fma(_1278, _1084, (*spvDescriptorSet0.vp_c9)._m0[172].x);
    float _1290 = -_1264;
    float _1292 = _1290 + 1.0;
    float _1294 = fma(_1282, _1198, _1274);
    float _1296 = fma(_1286, _1084, (*spvDescriptorSet0.vp_c9)._m0[172].y);
    float _1298 = -(*spvDescriptorSet0.vp_c9)._m0[173].x;
    float _1300 = (*spvDescriptorSet0.vp_c9)._m0[174].x + _1298;
    float _1302 = fma(_1288, _1200, _1280);
    float _1304 = _1174 * _1292;
    float _1306 = fma(_1296, _1200, _1294);
    float _1308 = fma(_1300, _1120, (*spvDescriptorSet0.vp_c9)._m0[173].x);
    float _1310 = _426 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _1312 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _182);
    float _1314 = fma(_1308, _1304, _1302);
    float _1316 = _428 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _1318 = -(*spvDescriptorSet0.vp_c9)._m0[173].y;
    float _1320 = (*spvDescriptorSet0.vp_c9)._m0[174].y + _1318;
    float _1322 = _1266 * _1310;
    float _1324 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _172);
    float _1326 = fma(_1320, _1120, (*spvDescriptorSet0.vp_c9)._m0[173].y);
    float _1328 = _1266 * _1316;
    float _1330 = _1312 * _1322;
    float _1332 = -(*spvDescriptorSet0.vp_c10)._m0[8].w;
    float _1334 = _708 + _1332;
    float _1336 = (*spvDescriptorSet0.vp_c9)._m0[175].x * (*spvDescriptorSet0.vp_c10)._m0[8].z;
    float _1338 = fma(_1264, (*spvDescriptorSet0.vp_c9)._m0[174].x, _1314);
    float _1340 = fma(_1326, _1304, _1306);
    float _1342 = _1324 * _1328;
    float _1344 = _1330 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _1346 = _874 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _1348 = -_1336;
    float _1350 = fma(_1338, _1334, _1348);
    float _1352 = _1266 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _1354 = _1352 * 0.5;
    float _1356 = fma(_1342, (*spvDescriptorSet0.vp_c8)._m0[26].x, _1344);
    float _1358 = _1330 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _1360 = fma(_880, (*spvDescriptorSet0.vp_c8)._m0[11].x, _1346);
    float _1362 = -(*spvDescriptorSet0.vp_c10)._m0[10].w;
    float _1364 = _728 + _1362;
    float _1366 = (*spvDescriptorSet0.vp_c9)._m0[175].x * (*spvDescriptorSet0.vp_c10)._m0[10].z;
    float _1368 = fma(_1354, (*spvDescriptorSet0.vp_c8)._m0[26].z, _1356);
    float _1370 = fma(_1342, (*spvDescriptorSet0.vp_c8)._m0[24].x, _1358);
    float _1372 = fma(_888, (*spvDescriptorSet0.vp_c8)._m0[11].z, _1360);
    float _1374 = -_1366;
    float _1376 = fma(_1338, _1364, _1374);
    float _1378 = _1368 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _1380 = fma(_1264, (*spvDescriptorSet0.vp_c9)._m0[174].y, _1340);
    float _1382 = fma(_1354, (*spvDescriptorSet0.vp_c8)._m0[24].z, _1370);
    float _1384 = _874 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _1386 = _1372 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _1388 = fma(_1378, _1380, _1376);
    float _1390 = _1382 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _1392 = fma(_880, (*spvDescriptorSet0.vp_c8)._m0[10].x, _1384);
    float _1394 = 1.0 / _1386;
    float _1396 = _1388 + (*spvDescriptorSet0.vp_c10)._m0[10].w;
    float _1398 = fma(_1390, _1380, _1350);
    float _1400 = fma(_888, (*spvDescriptorSet0.vp_c8)._m0[10].z, _1392);
    float _1402 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1404 = _1396 + _1402;
    float _1406 = _1398 + (*spvDescriptorSet0.vp_c10)._m0[8].w;
    float _1408 = _1400 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _1410 = _1330 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _1412 = _1404 * _1404;
    float _1414 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1416 = _1406 + _1414;
    float _1418 = _1408 + _1386;
    float _1420 = fma(_1342, (*spvDescriptorSet0.vp_c8)._m0[25].x, _1410);
    float _1422 = -(*spvDescriptorSet0.vp_c10)._m0[9].w;
    float _1424 = _698 + _1422;
    float _1426 = fma(_1416, _1416, _1412);
    float _1428 = (*spvDescriptorSet0.vp_c9)._m0[175].x * (*spvDescriptorSet0.vp_c10)._m0[9].z;
    float _1430 = _1418 * _1394;
    float _1432 = _1430 * 0.5;
    float _1434 = fma(_1354, (*spvDescriptorSet0.vp_c8)._m0[25].z, _1420);
    float _1436 = sqrt(_1426);
    float _1438 = -_1428;
    float _1440 = fma(_1338, _1424, _1438);
    float _1442 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _1444 = fma(_1432, (*spvDescriptorSet0.vp_c8)._m0[30].w, _1442);
    float _1446 = _1434 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _1448 = fma(_1446, _1380, _1440);
    float _1450 = 1.0 / _1444;
    float _1452 = -(*spvDescriptorSet0.vp_c9)._m0[167].z;
    float _1454 = (*spvDescriptorSet0.vp_c9)._m0[168].z + _1452;
    float _1456 = _1448 + (*spvDescriptorSet0.vp_c10)._m0[9].w;
    float _1458 = -(*spvDescriptorSet0.vp_c9)._m0[169].z;
    float _1460 = (*spvDescriptorSet0.vp_c9)._m0[170].z + _1458;
    float _1462 = fma(_1454, _1024, (*spvDescriptorSet0.vp_c9)._m0[167].z);
    bool _1464 = _1436 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1466 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _1468 = _1450 * _1466;
    float _1470 = -(*spvDescriptorSet0.vp_c9)._m0[168].z;
    float _1472 = _1470 + (*spvDescriptorSet0.vp_c9)._m0[169].z;
    float _1474 = abs(_1468);
    float _1476 = log2(_1474);
    float _1478 = fma(_1472, _1034, (*spvDescriptorSet0.vp_c9)._m0[168].z);
    float _1480 = _1034;
    float _1482 = _1406;
    float _1484 = _1396;
    if (!_1464)
    {
        _1480 = _1456;
    }
    float _1486 = _1480;
    bool _1488 = !_1464;
    float _1490 = _1486;
    if (!_1488)
    {
        float _1492 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1494 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1496 = _1436 + _1494;
        float _1498 = rsqrt(_1426);
        float _1500 = _1496 * _1492;
        float _1502 = _1456 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1504 = _1500 * 0.15915493667125701904296875;
        float _1506 = _1504 * 6.283185482025146484375;
        float _1508 = cos(_1506);
        float _1510 = _1504 * 6.283185482025146484375;
        float _1512 = sin(_1510);
        float _1514 = _1508 + (-1.0);
        float _1516 = _1514 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1518 = fma(_1512, _1502, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1520 = fma(_1456, _1508, _1516);
        float _1522 = _1498 * _1518;
        float _1524 = fma(_1416, _1522, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1526 = fma(_1404, _1522, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _1490 = _1520;
        _1482 = _1524;
        _1484 = _1526;
    }
    float _1528 = _1490;
    float _1530 = _1482;
    float _1532 = _1484;
    float _1534 = -_698;
    float _1536 = _1534 + _1528;
    float _1538 = -_708;
    float _1540 = _1538 + _1530;
    float _1542 = fma(_1460, _1048, (*spvDescriptorSet0.vp_c9)._m0[169].z);
    float _1544 = _1476 * (*spvDescriptorSet0.vp_c15)._m0[654].z;
    float _1546 = _1536 * _1536;
    float _1548 = _1462 * _1162;
    float _1550 = -_728;
    float _1552 = _1550 + _1532;
    float _1554 = -(*spvDescriptorSet0.vp_c9)._m0[170].z;
    float _1556 = _1554 + (*spvDescriptorSet0.vp_c9)._m0[171].z;
    float _1558 = fma(_1540, _1540, _1546);
    float _1560 = fma(_1178, (*spvDescriptorSet0.vp_c9)._m0[167].z, _1548);
    float _1562 = exp2(_1544);
    float _1564 = fma(_1556, _1050, (*spvDescriptorSet0.vp_c9)._m0[170].z);
    float _1566 = fma(_1552, _1552, _1558);
    float _1568 = fma(_1478, _1134, _1560);
    float _1570 = _182 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    float _1572 = fma(_1542, _1116, _1568);
    float _1574 = sqrt(_1566);
    float _1576 = -(*spvDescriptorSet0.vp_c9)._m0[171].z;
    float _1578 = (*spvDescriptorSet0.vp_c9)._m0[172].z + _1576;
    bool _1580 = (*spvDescriptorSet0.vp_c15)._m0[660].y >= 0.5;
    bool _1582 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _1584 = _1580 || _1582;
    bool _1586 = isnan(0.5);
    bool _1588 = _1584 || _1586;
    float _1590 = fma(_1564, _1118, _1572);
    float _1592 = -(*spvDescriptorSet0.vp_c9)._m0[173].z;
    float _1594 = (*spvDescriptorSet0.vp_c9)._m0[174].z + _1592;
    float _1596 = fma(_1578, _1094, (*spvDescriptorSet0.vp_c9)._m0[171].z);
    float _1598 = -(*spvDescriptorSet0.vp_c9)._m0[172].z;
    float _1600 = _1598 + (*spvDescriptorSet0.vp_c9)._m0[173].z;
    out.m_55.x = _416;
    out.m_55.y = _412;
    out.m_55.z = _418;
    out.m_55.w = _424;
    float _1602 = fma(_1562, (*spvDescriptorSet0.vp_c15)._m0[654].x, (*spvDescriptorSet0.vp_c15)._m0[654].y);
    float _1604 = precise::clamp(_1602, 0.0, 1.0);
    float _1606 = fma(_1594, _1120, (*spvDescriptorSet0.vp_c9)._m0[173].z);
    float _1608 = fma(_1600, _1084, (*spvDescriptorSet0.vp_c9)._m0[172].z);
    float _1610 = fma(_1596, _1198, _1590);
    float _1612 = _172 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    bool _1614 = _1574 > 0.0;
    float _1616 = _1570 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _1618 = fma(_1608, _1200, _1610);
    float _1620 = fma(_1612, (*spvDescriptorSet0.vp_c8)._m0[24].x, _1616);
    float _1622 = fma(_1606, _1304, _1618);
    float _1624 = _1570 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _1626 = _1570 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _1628 = fma(_1604, -2.0, 3.0);
    float _1630 = _1604 * _1604;
    float _1632 = fma(_1612, (*spvDescriptorSet0.vp_c8)._m0[25].x, _1624);
    float _1634 = fma(_1612, (*spvDescriptorSet0.vp_c8)._m0[26].x, _1626);
    float _1636 = _1630 * _1628;
    bool _1638 = !_1614;
    float _1640 = _1530;
    float _1642 = _1528;
    float _1644 = _1532;
    float _1646 = _1634;
    float _1648 = _1632;
    if (!_1638)
    {
        float _1650 = _186 * _186;
        float _1652 = rsqrt(_1566);
        float _1654 = fma(_184, _184, _1650);
        float _1656 = fma(_188, _188, _1654);
        float _1658 = sqrt(_1656);
        float _1660 = _1540 * _1652;
        float _1662 = _1536 * _1652;
        float _1664 = _1552 * _1652;
        bool _1666 = _1658 > 0.0;
        bool _1668 = !_1666;
        if (!_1668)
        {
            float _1670 = rsqrt(_1656);
            float _1672 = 1.0 / (*spvDescriptorSet0.vp_c10)._m0[2].z;
            float _1674 = _186 * _1670;
            float _1676 = _184 * _1670;
            float _1678 = _1662 * _1674;
            float _1680 = _188 * _1670;
            float _1682 = fma(_1660, _1676, _1678);
            float _1684 = _1672 * (*spvDescriptorSet0.vp_c9)._m0[142].x;
            float _1686 = fma(_1664, _1680, _1682);
            float _1688 = _1686 * _1684;
            float _1690 = fma(_184, _1688, _1530);
            float _1692 = fma(_186, _1688, _1528);
            float _1694 = fma(_188, _1688, _1532);
            _1640 = _1690;
            _1642 = _1692;
            _1644 = _1694;
        }
    }
    float _1696 = _1640;
    float _1698 = _1642;
    float _1700 = _1644;
    float _1702 = -_870;
    float _1704 = fma(_1702, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1696);
    float _1706 = -_868;
    float _1708 = fma(_1706, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1698);
    float _1710 = -_876;
    float _1712 = fma(_1710, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1700);
    float _1714 = fma(_1264, (*spvDescriptorSet0.vp_c9)._m0[174].z, _1622);
    float _1716 = -_1636;
    float _1718 = _1716 + 1.0;
    float _1720 = _1708;
    float _1722 = _1704;
    float _1724 = _1712;
    if (!_1588)
    {
        float _1726 = _884 * _884;
        float _1728 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _1730 = -_728;
        float _1732 = _1730 + _1700;
        float _1734 = fma(_892, _892, _1726);
        float _1736 = fma(_898, _898, _1734);
        float _1738 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1740 = sqrt(_1736);
        float _1742 = 1.0 / _1266;
        float _1744 = _1738 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1746 = precise::min(_1740, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _1748 = _1746 * _1728;
        float _1750 = _1748 * _1742;
        float _1752 = -_708;
        float _1754 = _1752 + _1696;
        float _1756 = -_698;
        float _1758 = _1756 + _1698;
        float _1760 = _1744 * _1750;
        float _1762 = _1732 * _1750;
        float _1764 = fma(_1754, _1760, _880);
        float _1766 = fma(_1758, _1760, _874);
        float _1768 = fma(_1744, _1762, _888);
        _1720 = _1766;
        _1722 = _1764;
        _1724 = _1768;
    }
    float _1770 = _1720;
    float _1772 = _1722;
    float _1774 = _1724;
    float _1776 = _1770 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1778 = _1770 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1780 = fma(_1718, (*spvDescriptorSet0.vp_c15)._m0[654].w, _1636);
    float _1782 = _1770 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1784 = fma(_1772, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1776);
    float _1786 = fma(_1772, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1778);
    float _1788 = _1770 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1790 = fma(_1772, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1782);
    float _1792 = fma(_1774, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1784);
    float _1794 = fma(_1774, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1786);
    float _1796 = fma(_1772, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1788);
    float _1798 = fma(_1774, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1790);
    float _1800 = _1792 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1802 = _1794 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1804 = fma(_1774, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1796);
    float _1806 = _1798 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1808 = _1800 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1810 = _1800 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1812 = _1800 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _1814 = _1800 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1816 = fma(_1802, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1808);
    float _1818 = fma(_1802, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1810);
    float _1820 = fma(_1802, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1812);
    float _1822 = fma(_1802, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1814);
    float _1824 = fma(_1806, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1816);
    float _1826 = fma(_1806, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1818);
    float _1828 = fma(_1806, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1820);
    float _1830 = fma(_1806, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1822);
    float _1832 = _1804 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1834 = in.m_63.x;
    float _1836 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1838 = _1770 + _1836;
    bool _1840 = _1468 <= 8000.0;
    bool _1842 = isnan(_1468);
    bool _1844 = _1840 || _1842;
    bool _1846 = isnan(8000.0);
    bool _1848 = _1844 || _1846;
    float _1850 = float(_1848);
    float _1852 = fma(_1832, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1824);
    float _1854 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1856 = _1772 + _1854;
    float _1858 = _1838 * _1838;
    float _1860 = -_930;
    float _1862 = _1860 + 1.0;
    float _1864 = _1850 * _1780;
    out.m_61.x = _850;
    out.m_61.y = _852;
    out.m_61.z = _854;
    out.m_61.w = _866;
    float _1866 = fma(_1856, _1856, _1858);
    float _1868 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1870 = _1774 + _1868;
    float _1872 = _1864 * (*spvDescriptorSet0.vp_c15)._m0[653].x;
    float _1874 = fma(_1832, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1826);
    float _1876 = fma(_1832, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1828);
    float _1878 = fma(_1870, _1870, _1866);
    float _1880 = _1862 * _1872;
    float _1882 = precise::clamp(_1880, 0.0, 1.0);
    float _1884 = fma(_1832, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1830);
    float _1886 = _1620 + (*spvDescriptorSet0.vp_c8)._m0[24].z;
    float _1888 = _1634 + (*spvDescriptorSet0.vp_c8)._m0[26].z;
    float _1890 = -_1882;
    float _1892 = fma(_1890, (*spvDescriptorSet0.vp_c15)._m0[653].y, 1.0);
    float _1894 = _1632 + (*spvDescriptorSet0.vp_c8)._m0[25].z;
    float _1896 = sqrt(_1878);
    out.m_65.x = _1714;
    float _1898 = _1892 * _1834;
    out.gl_Position.x = _1852;
    out.gl_Position.y = _1874;
    out.gl_Position.z = _1876;
    out.gl_Position.w = _1884;
    float _1900 = _1898 * (*spvDescriptorSet0.vp_c13)._m0[1].w;
    out.m_67.x = _1886;
    out.m_67.y = _1894;
    out.m_67.z = _1888;
    out.m_69.x = _1900;
    bool _1902 = _1896 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _1904 = isnan(_1896);
    bool _1906 = _1902 || _1904;
    bool _1908 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _1910 = _1906 || _1908;
    float _1912 = _1826;
    float _1914 = _1878;
    if (!_1910)
    {
        _858 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _1916 = _858;
    float _1918 = _1916;
    float _1920 = _1916;
    if (!_1910)
    {
        _860 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _1922 = _860;
    float _1924 = _1922;
    float _1926 = _1922;
    if (!_1910)
    {
        _1912 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _1928 = _1912;
    float _1930 = _1928;
    float _1932 = _1928;
    if (!_1910)
    {
        _1646 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _1934 = _1646;
    float _1936 = _1934;
    float _1938 = _1934;
    if (!_1910)
    {
        _1648 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _1940 = _1648;
    float _1942 = _1940;
    float _1944 = _1940;
    if (!_1910)
    {
        _1914 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _1946 = _1914;
    bool _1948 = !_1910;
    float _1950 = _1946;
    float _1952 = _1946;
    if (!_1948)
    {
        bool _1954 = _1896 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _1956 = isnan(_1896);
        bool _1958 = _1954 || _1956;
        bool _1960 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _1962 = _1958 || _1960;
        if (!_1962)
        {
            float _1964 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _1966 = _1896 + _1964;
            float _1968 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _1970 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _1968;
            float _1972 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _1974 = _1972 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _1976 = 1.0 / _1970;
            float _1978 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _1980 = _1978 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _1982 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _1984 = _1982 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _1986 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _1988 = _1986 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _1990 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _1992 = _1990 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _1994 = _1966 * _1976;
            float _1996 = precise::clamp(_1994, 0.0, 1.0);
            float _1998 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _2000 = _1998 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _2002 = fma(_1996, _1974, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _2004 = fma(_1996, _2000, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _2006 = fma(_1996, _1980, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _2008 = fma(_1996, _1984, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _2010 = fma(_1996, _1988, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _2012 = fma(_1996, _1992, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            _1926 = _2002;
            _1944 = _2010;
            _1920 = _2006;
            _1938 = _2008;
            _1932 = _2004;
            _1952 = _2012;
            _2014 = true;
        }
        else
        {
            bool _2016 = _1896 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _2018 = isnan(_1896);
            bool _2020 = _2016 || _2018;
            bool _2022 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _2024 = _2020 || _2022;
            if (!_2024)
            {
                _1918 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _2026 = _1918;
            _1920 = _2026;
            if (!_2024)
            {
                _1924 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _2028 = _1924;
            _1926 = _2028;
            if (!_2024)
            {
                _1930 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _2030 = _1930;
            _1932 = _2030;
            if (!_2024)
            {
                _1936 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _2032 = _1936;
            _1938 = _2032;
            if (!_2024)
            {
                _1942 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _2034 = _1942;
            _1944 = _2034;
            if (!_2024)
            {
                _1950 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _2036 = _1950;
            bool _2038 = !_2024;
            _1952 = _2036;
            if (!_2038)
            {
                bool _2040 = _1896 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _2042 = isnan(_1896);
                bool _2044 = _2040 || _2042;
                bool _2046 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _2048 = _2044 || _2046;
                if (!_2048)
                {
                    float _2050 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2052 = _1896 + _2050;
                    float _2054 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2056 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _2054;
                    float _2058 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _2060 = _2058 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _2062 = 1.0 / _2056;
                    float _2064 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _2066 = _2064 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _2068 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _2070 = _2068 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _2072 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _2074 = _2072 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _2076 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _2078 = _2076 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _2080 = _2052 * _2062;
                    float _2082 = precise::clamp(_2080, 0.0, 1.0);
                    float _2084 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _2086 = _2084 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _2088 = fma(_2082, _2060, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _2090 = fma(_2082, _2086, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _2092 = fma(_2082, _2066, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _2094 = fma(_2082, _2070, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _2096 = fma(_2082, _2074, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _2098 = fma(_2082, _2078, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    _1926 = _2088;
                    _1944 = _2096;
                    _1920 = _2092;
                    _1938 = _2094;
                    _1932 = _2090;
                    _1952 = _2098;
                    _2014 = true;
                }
                else
                {
                    _1926 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _1944 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _1920 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _1938 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _1932 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _1952 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _2014 = false;
    float _2100 = _1926;
    float _2102 = _1944;
    float _2104 = _1920;
    float _2106 = _1938;
    float _2108 = _1932;
    float _2110 = _1952;
    float _2112 = fma(_1894, -0.5, 0.5);
    float _2114 = precise::clamp(_2112, 0.0, 1.0);
    float _2116 = -_2100;
    float _2118 = _2116 + _2102;
    float _2120 = -_2104;
    float _2122 = _2120 + _2106;
    float _2124 = -_2108;
    float _2126 = _2124 + _2110;
    bool _2128 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _2130 = fma(_2114, _2118, _2100);
    float _2132 = fma(_2114, _2122, _2104);
    float _2134 = fma(_2114, _2126, _2108);
    float _2136 = _2130 * 0.586610972881317138671875;
    out.m_71.x = 0.0;
    float _2138 = fma(_2132, 0.298911988735198974609375, _2136);
    float _2140 = (*spvDescriptorSet0.vp_c10)._m0[3].x * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    out.m_40.x = 1.0;
    float _2142 = fma(_2134, 0.114477999508380889892578125, _2138);
    float _2144 = -_2142;
    float _2146 = _2132 + _2144;
    float _2148 = -_2142;
    float _2150 = _2130 + _2148;
    float _2152 = -_2142;
    float _2154 = _2134 + _2152;
    out.m_69.w = _2140;
    float _2156 = fma(_2146, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2142);
    float _2158 = fma(_2150, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2142);
    float _2160 = fma(_2154, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2142);
    out.m_73.x = _2156;
    out.m_73.y = _2158;
    out.m_73.z = _2160;
    if (!_2128)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _2162 = -_1770;
    float _2164 = _2162 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
    float _2166 = -_1772;
    float _2168 = _2166 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
    float _2170 = -_1774;
    float _2172 = _2170 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
    float _2174 = _2164 * _2164;
    float _2176 = fma(_2168, _2168, _2174);
    float _2178 = fma(_2172, _2172, _2176);
    float _2180 = sqrt(_2178);
    float _2182 = rsqrt(_2178);
    float _2184 = -_2180;
    float _2186 = _2184 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _2188 = _2186 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
    float _2190 = precise::clamp(_2188, 0.0, 1.0);
    float _2192 = _2168 * _2182;
    float _2194 = _2164 * _2182;
    float _2196 = abs(_2190);
    float _2198 = log2(_2196);
    float _2200 = _2172 * _2182;
    float _2202 = _2192 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
    float _2204 = _1894 * _2194;
    float _2206 = -_2194;
    float _2208 = -_2202;
    float _2210 = fma(_2206, (*spvDescriptorSet0.vp_c15)._m0[656].y, _2208);
    float _2212 = fma(_1886, _2192, _2204);
    float _2214 = -_2200;
    float _2216 = fma(_2214, (*spvDescriptorSet0.vp_c15)._m0[656].z, _2210);
    float _2218 = fma(_1888, _2200, _2212);
    float _2220 = precise::clamp(_2218, 0.0, 1.0);
    float _2222 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
    float _2224 = _2216 + _2222;
    float _2226 = _2198 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
    float _2228 = _2224 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
    float _2230 = precise::clamp(_2228, 0.0, 1.0);
    float _2232 = exp2(_2226);
    float _2234 = _2232 * _2230;
    float _2236 = _2220 * _2234;
    float _2238 = _2236 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
    float _2240 = _2236 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
    float _2242 = _2236 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
    out.m_71.x = _2238;
    out.m_71.y = _2240;
    out.m_71.z = _2242;
    out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
}


vertex main0_out main0_z(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], uint gl_VertexIndex [[vertex_id]])
{
    main0_out out = {};
    out.m_55 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_61 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_44 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_59 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_73 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_40 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_57 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_67 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_65 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_71 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_69 = float4(0.0, 0.0, 0.0, 1.0);
    bool _2014 = false;
    bool _450 = false;
    bool _306 = false;
    bool _210 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _87 = in.m_37.w;
    float _89 = trunc(_87);
    int _92 = int(_89);
    bool _96 = _92 >= 1;
    float _98 = 0.0;
    if (!_96)
    {
        _98 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _100 = _98;
    if (!_96)
    {
        out.m_40.x = 0.0;
    }
    int _102 = 0;
    if (!_96)
    {
        float _104 = _100 * 5.0;
        _102 = as_type<int>(_104);
    }
    int _106 = _102;
    int _108 = _106;
    if (!_96)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2298 = as_type<float>(_106);
        out.gl_Position.z = _2298;
    }
    if (!_96)
    {
        return out;
    }
    float _110 = in.m_42.w;
    float _112 = float(_92);
    float _114 = 1.0 / _112;
    float _116 = -_110;
    float _118 = _116 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _120 = _110 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _122 = isnan(_110);
    bool _124 = _120 || _122;
    bool _126 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _128 = _124 || _126;
    float _130 = _118 * _114;
    bool _132 = _118 >= _112;
    bool _134 = !_128;
    bool _136 = _132 || _134;
    out.m_44.x = _130;
    float _138 = _110;
    if (_136)
    {
        _138 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _140 = _138;
    if (_136)
    {
        out.m_40.x = 0.0;
    }
    if (_136)
    {
        float _142 = _140 * 5.0;
        _108 = as_type<int>(_142);
    }
    int _144 = _108;
    if (_136)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2369 = as_type<float>(_144);
        out.gl_Position.z = _2369;
    }
    if (_136)
    {
        return out;
    }
    float _146 = as_type<float>(int(gl_VertexIndex));
    float _148 = in.m_49.x;
    float _150 = in.m_49.y;
    float _152 = in.m_49.z;
    int _154 = as_type<int>(_146) & 1;
    bool _156 = _154 != 0;
    int _158 = as_type<int>(_146) & 2;
    bool _160 = _158 != 0;
    bool _162 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _164 = _150 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _166 = _150 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _168 = _150 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    bool _170 = !_156;
    float _172 = _170 ? (-0.5) : 0.5;
    float _174 = fma(_148, (*spvDescriptorSet0.vp_c10)._m0[4].x, _164);
    float _176 = fma(_148, (*spvDescriptorSet0.vp_c10)._m0[5].x, _166);
    float _178 = fma(_148, (*spvDescriptorSet0.vp_c10)._m0[6].x, _168);
    bool _180 = !_160;
    float _182 = _180 ? (-0.5) : 0.5;
    float _184 = fma(_152, (*spvDescriptorSet0.vp_c10)._m0[4].z, _174);
    float _186 = fma(_152, (*spvDescriptorSet0.vp_c10)._m0[5].z, _176);
    float _188 = fma(_152, (*spvDescriptorSet0.vp_c10)._m0[6].z, _178);
    bool _190 = !_162;
    float _208;
    if (!_190)
    {
        float _192 = in.m_51.x;
        float _194 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _196 = _192 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _198 = fma(_196, (*spvDescriptorSet0.vp_c9)._m0[12].x, _118);
        float _200 = _198 * _194;
        float _202 = floor(_200);
        float _204 = -_202;
        float _206 = _200 + _204;
        _208 = _206;
        _210 = true;
    }
    else
    {
        _208 = _130;
    }
    _210 = false;
    float _212 = _208;
    float _214 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _216 = _212 + _214;
    bool _218 = _212 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _220 = isnan(_212);
    bool _222 = _218 || _220;
    bool _224 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _226 = _222 || _224;
    float _228 = float(_226);
    float _230 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _232 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _230;
    float _234 = -_228;
    float _236 = _234 + 1.0;
    bool _238 = _212 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _240 = isnan(_212);
    bool _242 = _238 || _240;
    bool _244 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _246 = _242 || _244;
    float _248 = float(_246);
    float _250 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _252 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _250;
    bool _254 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _256 = 1.0 / _232;
    float _258 = _248 * _236;
    float _260 = -_248;
    float _262 = _260 + 1.0;
    float _264 = _216 * _256;
    float _266 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _268 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _266;
    float _270 = fma(_252, _264, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _272 = fma(_268, _264, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _274 = _270 * _258;
    float _276 = _272 * _258;
    float _278 = fma(_262, (*spvDescriptorSet0.vp_c9)._m0[143].x, _274);
    float _280 = fma(_262, (*spvDescriptorSet0.vp_c9)._m0[143].y, _276);
    float _282 = fma(_228, (*spvDescriptorSet0.vp_c9)._m0[144].x, _278);
    float _284 = fma(_228, (*spvDescriptorSet0.vp_c9)._m0[144].y, _280);
    bool _286 = !_254;
    float _304;
    if (!_286)
    {
        float _288 = in.m_51.x;
        float _290 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _292 = _288 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _294 = fma(_292, (*spvDescriptorSet0.vp_c9)._m0[11].y, _118);
        float _296 = _294 * _290;
        float _298 = floor(_296);
        float _300 = -_298;
        float _302 = _296 + _300;
        _304 = _302;
        _306 = true;
    }
    else
    {
        _304 = _130;
    }
    _306 = false;
    float _308 = _304;
    float _310 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _312 = _308 + _310;
    float _314 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _316 = _314 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _318 = _308 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _320 = isnan(_308);
    bool _322 = _318 || _320;
    bool _324 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _326 = _322 || _324;
    float _328 = float(_326);
    float _330 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _332 = _330 + (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _334 = _308 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _336 = isnan(_308);
    bool _338 = _334 || _336;
    bool _340 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _342 = _338 || _340;
    float _344 = float(_342);
    float _346 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _348 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _346;
    bool _350 = _308 >= (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _352 = isnan(_308);
    bool _354 = _350 || _352;
    bool _356 = isnan((*spvDescriptorSet0.vp_c9)._m0[117].w);
    bool _358 = _354 || _356;
    float _360 = float(_358);
    float _362 = 1.0 / _316;
    float _364 = -_328;
    float _366 = _364 + 1.0;
    bool _368 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].w;
    float _370 = _344 * _366;
    float _372 = -_344;
    float _374 = _372 + 1.0;
    float _376 = 1.0 / _332;
    float _378 = _348 * _362;
    float _380 = -(*spvDescriptorSet0.vp_c9)._m0[116].x;
    float _382 = _380 + (*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _384 = fma(_378, _312, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _386 = _382 * _376;
    float _388 = _384 * _370;
    float _390 = -_360;
    float _392 = _390 + 1.0;
    float _394 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _396 = _308 + _394;
    float _398 = fma(_374, (*spvDescriptorSet0.vp_c9)._m0[115].x, _388);
    float _400 = _328 * _392;
    float _402 = fma(_386, _396, (*spvDescriptorSet0.vp_c9)._m0[116].x);
    float _404 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _406 = fma(_402, _400, _398);
    float _408 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _410 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _412 = _404 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _414 = fma(_360, (*spvDescriptorSet0.vp_c9)._m0[117].x, _406);
    float _416 = _408 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _418 = _410 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _420 = in.m_53.x;
    float _422 = in.m_53.y;
    float _424 = _414 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    out.m_55.x = _416;
    out.m_55.y = _412;
    out.m_55.z = _418;
    out.m_55.w = _424;
    float _426 = _284 * _422;
    float _428 = _282 * _420;
    bool _430 = !_368;
    float _448;
    if (!_430)
    {
        float _432 = in.m_51.x;
        float _434 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].w;
        float _436 = _432 * (*spvDescriptorSet0.vp_c9)._m0[13].x;
        float _438 = fma(_436, (*spvDescriptorSet0.vp_c9)._m0[11].w, _118);
        float _440 = _438 * _434;
        float _442 = floor(_440);
        float _444 = -_442;
        float _446 = _440 + _444;
        _448 = _446;
        _450 = true;
    }
    else
    {
        _448 = _130;
    }
    _450 = false;
    float _452 = _448;
    float _454 = in.m_51.x;
    float _456 = in.m_51.y;
    float _458 = in.m_51.z;
    float _460 = in.m_51.w;
    float _462 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    int _464 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _466 = _464 != 0;
    float _468 = in.m_37.x;
    float _470 = in.m_37.y;
    float _472 = in.m_37.z;
    int _474 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _476 = _474 != 0;
    float _478 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    int _480 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _482 = _480 != 0;
    int _484 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _486 = _484 != 0;
    float _488 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    bool _490 = _454 > 0.5;
    float _492 = _456 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    bool _494 = _460 > 0.5;
    float _496 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _498 = _496 + (*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _500 = -_172;
    int _502 = _490 ? as_type<int>(_500) : as_type<int>(_172);
    float _504 = (*spvDescriptorSet0.vp_c9)._m0[83].w + (*spvDescriptorSet0.vp_c9)._m0[83].y;
    bool _506 = _456 > 0.5;
    float _508 = 1.0 / _498;
    bool _510 = !_476;
    float _512 = _510 ? _172 : as_type<float>(_502);
    float _514 = -_182;
    int _516 = _506 ? as_type<int>(_514) : as_type<int>(_182);
    bool _518 = _458 > 0.5;
    int _520 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _522 = _520 != 0;
    float _524 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].w;
    float _526 = 0.0;
    float _528 = _524;
    if (!_466)
    {
        _526 = _458;
    }
    float _530 = _526;
    float _532 = _470 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _534 = 0.0;
    float _536 = _530;
    if (!_466)
    {
        _534 = _458;
    }
    float _538 = _534;
    float _540 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    float _542 = 0.0;
    float _544 = _538;
    if (!_466)
    {
        _542 = _456;
    }
    float _546 = _542;
    float _548 = fma(_468, (*spvDescriptorSet0.vp_c10)._m0[4].x, _532);
    bool _550 = !_482;
    float _552 = _550 ? _182 : as_type<float>(_516);
    float _554 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _556 = _546;
    if (_466)
    {
        _536 = _456;
    }
    float _558 = _536;
    float _560 = _454 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    if (_466)
    {
        _556 = _454;
    }
    float _562 = _556;
    if (_466)
    {
        _544 = _456;
    }
    float _564 = _544;
    float _566 = -_540;
    float _568 = fma(_560, 2.0, _566);
    int _570 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 16;
    bool _572 = _570 != 0;
    int _574 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 32;
    bool _576 = _574 != 0;
    float _578 = _470 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _580 = _470 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _582 = fma(_564, (*spvDescriptorSet0.vp_c9)._m0[83].w, _504);
    float _584 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    float _586 = fma(_492, -2.0, _554);
    float _588 = fma(_468, (*spvDescriptorSet0.vp_c10)._m0[6].x, _580);
    float _590 = fma(_456, (*spvDescriptorSet0.vp_c9)._m0[78].w, _584);
    float _592 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _594 = _452 + _592;
    float _596 = (*spvDescriptorSet0.vp_c9)._m0[83].z + (*spvDescriptorSet0.vp_c9)._m0[83].x;
    float _598 = -(*spvDescriptorSet0.vp_c9)._m0[131].x;
    float _600 = (*spvDescriptorSet0.vp_c9)._m0[132].x + _598;
    float _602 = fma(_468, (*spvDescriptorSet0.vp_c10)._m0[5].x, _578);
    float _604 = -_118;
    float _606 = fma(_604, (*spvDescriptorSet0.vp_c9)._m0[76].x, _568);
    float _608 = fma(_472, (*spvDescriptorSet0.vp_c10)._m0[4].z, _548);
    float _610 = _600 * _508;
    float _612 = fma(_472, (*spvDescriptorSet0.vp_c10)._m0[5].z, _602);
    float _614 = _462 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _616 = _512 + 0.5;
    float _618 = fma(_610, _594, (*spvDescriptorSet0.vp_c9)._m0[131].x);
    bool _620 = _452 >= (*spvDescriptorSet0.vp_c9)._m0[132].w;
    bool _622 = isnan(_452);
    bool _624 = _620 || _622;
    bool _626 = isnan((*spvDescriptorSet0.vp_c9)._m0[132].w);
    bool _628 = _624 || _626;
    float _630 = float(_628);
    float _632 = fma(_472, (*spvDescriptorSet0.vp_c10)._m0[6].z, _588);
    float _634 = fma(_614, _616, _606);
    bool _636 = _452 >= (*spvDescriptorSet0.vp_c9)._m0[131].w;
    bool _638 = isnan(_452);
    bool _640 = _636 || _638;
    bool _642 = isnan((*spvDescriptorSet0.vp_c9)._m0[131].w);
    bool _644 = _640 || _642;
    float _646 = float(_644);
    float _648 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    float _650 = -_630;
    float _652 = _650 + 1.0;
    float _654 = fma(_118, (*spvDescriptorSet0.vp_c9)._m0[76].y, _586);
    float _656 = _478 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _658 = _552 + (-0.5);
    float _660 = fma(_562, (*spvDescriptorSet0.vp_c9)._m0[83].z, _596);
    float _662 = (*spvDescriptorSet0.vp_c9)._m0[82].x + (*spvDescriptorSet0.vp_c9)._m0[81].z;
    float _664 = _646 * _652;
    float _666 = _562 * (*spvDescriptorSet0.vp_c9)._m0[82].x;
    float _668 = -_656;
    float _670 = -_654;
    float _672 = fma(_668, _658, _670);
    float _674 = _618 * _664;
    float _676 = -_662;
    float _678 = fma(_666, 2.0, _676);
    float _680 = _558 * (*spvDescriptorSet0.vp_c9)._m0[82].y;
    float _682 = -_172;
    int _684 = _518 ? as_type<int>(_682) : as_type<int>(_172);
    float _686 = (*spvDescriptorSet0.vp_c9)._m0[82].y + (*spvDescriptorSet0.vp_c9)._m0[81].w;
    float _688 = -_646;
    float _690 = _688 + 1.0;
    float _692 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    bool _694 = !_486;
    float _696 = _694 ? _172 : as_type<float>(_684);
    float _698 = _612 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _700 = fma(_680, -2.0, _686);
    float _702 = fma(_690, (*spvDescriptorSet0.vp_c9)._m0[131].x, _674);
    float _704 = _648 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    float _706 = fma(_454, (*spvDescriptorSet0.vp_c9)._m0[78].z, _692);
    float _708 = _608 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _710 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _712 = _698 + _710;
    float _714 = _696 + 0.5;
    float _716 = -_118;
    float _718 = fma(_716, (*spvDescriptorSet0.vp_c9)._m0[81].x, _678);
    float _720 = fma(_118, (*spvDescriptorSet0.vp_c9)._m0[77].w, _590);
    float _722 = fma(_118, (*spvDescriptorSet0.vp_c9)._m0[81].y, _700);
    float _724 = fma(_118, (*spvDescriptorSet0.vp_c9)._m0[77].z, _706);
    float _726 = fma(_118, (*spvDescriptorSet0.vp_c9)._m0[82].w, _582);
    float _728 = _632 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _730 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _732 = _708 + _730;
    float _734 = _712 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _736 = fma(_704, _714, _718);
    float _738 = -_182;
    int _740 = _494 ? as_type<int>(_738) : as_type<int>(_182);
    float _742 = _488 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    float _744 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _746 = _728 + _744;
    float _748 = fma(_732, (*spvDescriptorSet0.vp_c8)._m0[28].x, _734);
    float _750 = -_724;
    float _752 = _750 + 1.0;
    float _754 = fma(_118, (*spvDescriptorSet0.vp_c9)._m0[82].z, _660);
    bool _756 = !_522;
    float _758 = _756 ? _182 : as_type<float>(_740);
    float _760 = fma(_746, (*spvDescriptorSet0.vp_c8)._m0[28].z, _748);
    float _762 = -_752;
    float _764 = fma(_512, _762, _634);
    float _766 = -_720;
    float _768 = _766 + 1.0;
    float _770 = _712 * _712;
    float _772 = _758 + (-0.5);
    bool _774 = _760 >= 0.0;
    float _776 = fma(_552, _768, _672);
    float _778 = fma(_732, _732, _770);
    float _780 = -_172;
    int _782 = _506 ? as_type<int>(_780) : as_type<int>(_172);
    float _784 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].z;
    float _786 = -_182;
    int _788 = _518 ? as_type<int>(_786) : as_type<int>(_182);
    float _790 = -_742;
    float _792 = -_722;
    float _794 = fma(_790, _772, _792);
    float _796 = fma(_630, (*spvDescriptorSet0.vp_c9)._m0[132].x, _702);
    float _798 = -_754;
    float _800 = _798 + 1.0;
    float _802 = -_726;
    float _804 = _802 + 1.0;
    float _806 = fma(_746, _746, _778);
    bool _808 = !_572;
    float _810 = _808 ? _172 : as_type<float>(_782);
    float _812 = -_800;
    float _814 = fma(_696, _812, _736);
    bool _816 = !_576;
    float _818 = _816 ? _182 : as_type<float>(_788);
    float _820 = fma(_758, _804, _794);
    float _822 = _810 + 0.5;
    float _824 = -_818;
    float _826 = _824 + 0.5;
    float _828 = rsqrt(_806);
    float _830 = _736;
    float _832 = _814;
    if (_774)
    {
        _830 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _834 = _830;
    float _836 = _822 * (*spvDescriptorSet0.vp_c9)._m0[90].x;
    float _838 = _826 * (*spvDescriptorSet0.vp_c9)._m0[90].y;
    float _840 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _842 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _844 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _846 = _836 * _784;
    float _848 = _838 * _524;
    float _850 = _840 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _852 = _842 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _854 = _844 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    int _856 = as_type<int>(_834);
    float _858 = _850;
    float _860 = _852;
    if (_774)
    {
        float _862 = _834 * 5.0;
        _856 = as_type<int>(_862);
    }
    int _864 = _856;
    float _866 = _796 * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    out.m_57.x = _846;
    out.m_57.y = _848;
    float _868 = _712 * _828;
    float _870 = _732 * _828;
    out.m_59.x = _764;
    out.m_59.y = _776;
    out.m_59.z = _814;
    out.m_59.w = _820;
    if (_774)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _3610 = as_type<float>(_864);
        out.gl_Position.z = _3610;
    }
    out.m_61.x = _850;
    out.m_61.y = _852;
    out.m_61.z = _854;
    out.m_61.w = _866;
    if (_774)
    {
        out.m_40.x = 0.0;
    }
    if (_774)
    {
        return out;
    }
    float _872 = -_868;
    float _874 = fma(_872, (*spvDescriptorSet0.vp_c9)._m0[18].w, _698);
    float _876 = _746 * _828;
    float _878 = -_870;
    float _880 = fma(_878, (*spvDescriptorSet0.vp_c9)._m0[18].w, _708);
    float _882 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _884 = _874 + _882;
    float _886 = -_876;
    float _888 = fma(_886, (*spvDescriptorSet0.vp_c9)._m0[18].w, _728);
    float _890 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _892 = _880 + _890;
    float _894 = _884 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _896 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _898 = _888 + _896;
    float _900 = fma(_892, (*spvDescriptorSet0.vp_c8)._m0[28].x, _894);
    float _902 = fma(_898, (*spvDescriptorSet0.vp_c8)._m0[28].z, _900);
    bool _904 = _902 >= 0.0;
    if (_904)
    {
        _832 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _906 = _832;
    int _908 = as_type<int>(_906);
    if (_904)
    {
        out.m_40.x = 0.0;
    }
    if (_904)
    {
        float _910 = _906 * 5.0;
        _908 = as_type<int>(_910);
    }
    int _912 = _908;
    if (_904)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _3712 = as_type<float>(_912);
        out.gl_Position.z = _3712;
    }
    if (_904)
    {
        return out;
    }
    float _914 = fma(_880, (*spvDescriptorSet0.vp_c15)._m0[652].x, (*spvDescriptorSet0.vp_c15)._m0[652].z);
    float _916 = fma(_888, (*spvDescriptorSet0.vp_c15)._m0[652].y, (*spvDescriptorSet0.vp_c15)._m0[652].w);
    float _918 = floor(_914);
    float _920 = floor(_916);
    float _922 = -_918;
    float _924 = _914 + _922;
    float _926 = -_920;
    float _928 = _916 + _926;
    float2 _3748 = float2(_924, _928);
    float _930 = dm_bs(spvDescriptorSet0.vp_t_tcb_24.sample(spvDescriptorSet0.vp_t_tcb_24Smplr, select(_3748, float2(0.0), isnan(_3748)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_24, spvDescriptorSet0.vp_t_tcb_24Smplr_w, select(_3748, float2(0.0), isnan(_3748)), level(0.0)).x;
    float _932 = -_868;
    float _934 = fma(_932, (*spvDescriptorSet0.vp_c9)._m0[18].w, _712);
    float _936 = -_870;
    float _938 = fma(_936, (*spvDescriptorSet0.vp_c9)._m0[18].w, _732);
    float _940 = -(*spvDescriptorSet0.vp_c9)._m0[167].w;
    float _942 = (*spvDescriptorSet0.vp_c9)._m0[168].w + _940;
    float _944 = -(*spvDescriptorSet0.vp_c9)._m0[168].w;
    float _946 = _944 + (*spvDescriptorSet0.vp_c9)._m0[169].w;
    float _948 = -(*spvDescriptorSet0.vp_c9)._m0[169].w;
    float _950 = (*spvDescriptorSet0.vp_c9)._m0[170].w + _948;
    float _952 = -(*spvDescriptorSet0.vp_c9)._m0[170].w;
    float _954 = _952 + (*spvDescriptorSet0.vp_c9)._m0[171].w;
    float _956 = -(*spvDescriptorSet0.vp_c9)._m0[171].w;
    float _958 = (*spvDescriptorSet0.vp_c9)._m0[172].w + _956;
    float _960 = -(*spvDescriptorSet0.vp_c9)._m0[172].w;
    float _962 = _960 + (*spvDescriptorSet0.vp_c9)._m0[173].w;
    bool _964 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[14].y;
    float _966 = 1.0 / _942;
    float _968 = _934 * _934;
    float _970 = -_876;
    float _972 = fma(_970, (*spvDescriptorSet0.vp_c9)._m0[18].w, _746);
    float _974 = fma(_938, _938, _968);
    float _976 = -(*spvDescriptorSet0.vp_c9)._m0[173].w;
    float _978 = (*spvDescriptorSet0.vp_c9)._m0[174].w + _976;
    float _980 = 1.0 / _946;
    if (!_964)
    {
        _528 = (*spvDescriptorSet0.vp_c7)._m0[0].x;
    }
    float _982 = _528;
    float _984 = 1.0 / _950;
    float _986 = 1.0 / _954;
    float _988 = 1.0 / _958;
    float _990 = 1.0 / _962;
    bool _992 = !_964;
    float _994 = _982;
    if (!_992)
    {
        float _996 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[14].y;
        float _998 = _454 * (*spvDescriptorSet0.vp_c9)._m0[15].y;
        float _1000 = fma(_998, (*spvDescriptorSet0.vp_c9)._m0[14].y, (*spvDescriptorSet0.vp_c7)._m0[0].x);
        float _1002 = _1000 * _996;
        float _1004 = floor(_1002);
        float _1006 = -_1004;
        float _1008 = _1002 + _1006;
        _994 = _1008;
    }
    float _1010 = _994;
    float _1012 = -(*spvDescriptorSet0.vp_c9)._m0[167].w;
    float _1014 = _1010 + _1012;
    float _1016 = fma(_972, _972, _974);
    float _1018 = -(*spvDescriptorSet0.vp_c9)._m0[168].w;
    float _1020 = _1010 + _1018;
    float _1022 = 1.0 / _978;
    float _1024 = _1014 * _966;
    float _1026 = -(*spvDescriptorSet0.vp_c9)._m0[169].w;
    float _1028 = _1010 + _1026;
    float _1030 = -(*spvDescriptorSet0.vp_c9)._m0[170].w;
    float _1032 = _1010 + _1030;
    float _1034 = _1020 * _980;
    bool _1036 = _1010 >= (*spvDescriptorSet0.vp_c9)._m0[171].w;
    bool _1038 = isnan(_1010);
    bool _1040 = _1036 || _1038;
    bool _1042 = isnan((*spvDescriptorSet0.vp_c9)._m0[171].w);
    bool _1044 = _1040 || _1042;
    float _1046 = float(_1044);
    float _1048 = _1028 * _984;
    float _1050 = _1032 * _986;
    float _1052 = -(*spvDescriptorSet0.vp_c9)._m0[172].w;
    float _1054 = _1010 + _1052;
    bool _1056 = _1010 >= (*spvDescriptorSet0.vp_c9)._m0[170].w;
    bool _1058 = isnan(_1010);
    bool _1060 = _1056 || _1058;
    bool _1062 = isnan((*spvDescriptorSet0.vp_c9)._m0[170].w);
    bool _1064 = _1060 || _1062;
    float _1066 = float(_1064);
    float _1068 = -(*spvDescriptorSet0.vp_c9)._m0[171].w;
    float _1070 = _1010 + _1068;
    bool _1072 = _1010 >= (*spvDescriptorSet0.vp_c9)._m0[169].w;
    bool _1074 = isnan(_1010);
    bool _1076 = _1072 || _1074;
    bool _1078 = isnan((*spvDescriptorSet0.vp_c9)._m0[169].w);
    bool _1080 = _1076 || _1078;
    float _1082 = float(_1080);
    float _1084 = _1054 * _990;
    float _1086 = -_1046;
    float _1088 = _1086 + 1.0;
    float _1090 = -_1066;
    float _1092 = _1090 + 1.0;
    float _1094 = _1070 * _988;
    bool _1096 = _1010 >= (*spvDescriptorSet0.vp_c9)._m0[168].w;
    bool _1098 = isnan(_1010);
    bool _1100 = _1096 || _1098;
    bool _1102 = isnan((*spvDescriptorSet0.vp_c9)._m0[168].w);
    bool _1104 = _1100 || _1102;
    float _1106 = float(_1104);
    float _1108 = -(*spvDescriptorSet0.vp_c9)._m0[173].w;
    float _1110 = _1010 + _1108;
    float _1112 = -_1082;
    float _1114 = _1112 + 1.0;
    float _1116 = _1082 * _1092;
    float _1118 = _1066 * _1088;
    float _1120 = _1110 * _1022;
    bool _1122 = _1010 >= (*spvDescriptorSet0.vp_c9)._m0[167].w;
    bool _1124 = isnan(_1010);
    bool _1126 = _1122 || _1124;
    bool _1128 = isnan((*spvDescriptorSet0.vp_c9)._m0[167].w);
    bool _1130 = _1126 || _1128;
    float _1132 = float(_1130);
    float _1134 = _1106 * _1114;
    float _1136 = -(*spvDescriptorSet0.vp_c9)._m0[167].x;
    float _1138 = (*spvDescriptorSet0.vp_c9)._m0[168].x + _1136;
    float _1140 = -_1106;
    float _1142 = _1140 + 1.0;
    bool _1144 = _1010 >= (*spvDescriptorSet0.vp_c9)._m0[172].w;
    bool _1146 = isnan(_1010);
    bool _1148 = _1144 || _1146;
    bool _1150 = isnan((*spvDescriptorSet0.vp_c9)._m0[172].w);
    bool _1152 = _1148 || _1150;
    float _1154 = float(_1152);
    float _1156 = -(*spvDescriptorSet0.vp_c9)._m0[168].x;
    float _1158 = _1156 + (*spvDescriptorSet0.vp_c9)._m0[169].x;
    float _1160 = fma(_1138, _1024, (*spvDescriptorSet0.vp_c9)._m0[167].x);
    float _1162 = _1132 * _1142;
    bool _1164 = _1010 >= (*spvDescriptorSet0.vp_c9)._m0[173].w;
    bool _1166 = isnan(_1010);
    bool _1168 = _1164 || _1166;
    bool _1170 = isnan((*spvDescriptorSet0.vp_c9)._m0[173].w);
    bool _1172 = _1168 || _1170;
    float _1174 = float(_1172);
    float _1176 = -_1132;
    float _1178 = _1176 + 1.0;
    float _1180 = _1160 * _1162;
    float _1182 = -_1154;
    float _1184 = _1182 + 1.0;
    float _1186 = -_1174;
    float _1188 = _1186 + 1.0;
    float _1190 = fma(_1158, _1034, (*spvDescriptorSet0.vp_c9)._m0[168].x);
    float _1192 = fma(_1178, (*spvDescriptorSet0.vp_c9)._m0[167].x, _1180);
    float _1194 = -(*spvDescriptorSet0.vp_c9)._m0[167].y;
    float _1196 = (*spvDescriptorSet0.vp_c9)._m0[168].y + _1194;
    float _1198 = _1046 * _1184;
    float _1200 = _1154 * _1188;
    float _1202 = fma(_1190, _1134, _1192);
    float _1204 = fma(_1196, _1024, (*spvDescriptorSet0.vp_c9)._m0[167].y);
    float _1206 = -(*spvDescriptorSet0.vp_c9)._m0[168].y;
    float _1208 = _1206 + (*spvDescriptorSet0.vp_c9)._m0[169].y;
    float _1210 = sqrt(_1016);
    float _1212 = _1204 * _1162;
    float _1214 = -(*spvDescriptorSet0.vp_c9)._m0[169].x;
    float _1216 = (*spvDescriptorSet0.vp_c9)._m0[170].x + _1214;
    float _1218 = fma(_1208, _1034, (*spvDescriptorSet0.vp_c9)._m0[168].y);
    float _1220 = -(*spvDescriptorSet0.vp_c9)._m0[170].x;
    float _1222 = _1220 + (*spvDescriptorSet0.vp_c9)._m0[171].x;
    float _1224 = fma(_1178, (*spvDescriptorSet0.vp_c9)._m0[167].y, _1212);
    float _1226 = fma(_1216, _1048, (*spvDescriptorSet0.vp_c9)._m0[169].x);
    float _1228 = -(*spvDescriptorSet0.vp_c9)._m0[169].y;
    float _1230 = (*spvDescriptorSet0.vp_c9)._m0[170].y + _1228;
    float _1232 = fma(_1222, _1050, (*spvDescriptorSet0.vp_c9)._m0[170].x);
    float _1234 = fma(_1218, _1134, _1224);
    float _1236 = fma(_1226, _1116, _1202);
    float _1238 = fma(_1230, _1048, (*spvDescriptorSet0.vp_c9)._m0[169].y);
    float _1240 = -(*spvDescriptorSet0.vp_c9)._m0[170].y;
    float _1242 = _1240 + (*spvDescriptorSet0.vp_c9)._m0[171].y;
    float _1244 = fma(_1238, _1116, _1234);
    float _1246 = fma(_1232, _1118, _1236);
    float _1248 = -(*spvDescriptorSet0.vp_c9)._m0[171].x;
    float _1250 = (*spvDescriptorSet0.vp_c9)._m0[172].x + _1248;
    float _1252 = fma(_1242, _1050, (*spvDescriptorSet0.vp_c9)._m0[170].y);
    bool _1254 = _1010 >= (*spvDescriptorSet0.vp_c9)._m0[174].w;
    bool _1256 = isnan(_1010);
    bool _1258 = _1254 || _1256;
    bool _1260 = isnan((*spvDescriptorSet0.vp_c9)._m0[174].w);
    bool _1262 = _1258 || _1260;
    float _1264 = float(_1262);
    float _1266 = _828 * _1210;
    float _1268 = fma(_1250, _1094, (*spvDescriptorSet0.vp_c9)._m0[171].x);
    float _1270 = -(*spvDescriptorSet0.vp_c9)._m0[171].y;
    float _1272 = (*spvDescriptorSet0.vp_c9)._m0[172].y + _1270;
    float _1274 = fma(_1252, _1118, _1244);
    float _1276 = -(*spvDescriptorSet0.vp_c9)._m0[172].x;
    float _1278 = _1276 + (*spvDescriptorSet0.vp_c9)._m0[173].x;
    float _1280 = fma(_1268, _1198, _1246);
    float _1282 = fma(_1272, _1094, (*spvDescriptorSet0.vp_c9)._m0[171].y);
    float _1284 = -(*spvDescriptorSet0.vp_c9)._m0[172].y;
    float _1286 = _1284 + (*spvDescriptorSet0.vp_c9)._m0[173].y;
    float _1288 = fma(_1278, _1084, (*spvDescriptorSet0.vp_c9)._m0[172].x);
    float _1290 = -_1264;
    float _1292 = _1290 + 1.0;
    float _1294 = fma(_1282, _1198, _1274);
    float _1296 = fma(_1286, _1084, (*spvDescriptorSet0.vp_c9)._m0[172].y);
    float _1298 = -(*spvDescriptorSet0.vp_c9)._m0[173].x;
    float _1300 = (*spvDescriptorSet0.vp_c9)._m0[174].x + _1298;
    float _1302 = fma(_1288, _1200, _1280);
    float _1304 = _1174 * _1292;
    float _1306 = fma(_1296, _1200, _1294);
    float _1308 = fma(_1300, _1120, (*spvDescriptorSet0.vp_c9)._m0[173].x);
    float _1310 = _426 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _1312 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _182);
    float _1314 = fma(_1308, _1304, _1302);
    float _1316 = _428 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _1318 = -(*spvDescriptorSet0.vp_c9)._m0[173].y;
    float _1320 = (*spvDescriptorSet0.vp_c9)._m0[174].y + _1318;
    float _1322 = _1266 * _1310;
    float _1324 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _172);
    float _1326 = fma(_1320, _1120, (*spvDescriptorSet0.vp_c9)._m0[173].y);
    float _1328 = _1266 * _1316;
    float _1330 = _1312 * _1322;
    float _1332 = -(*spvDescriptorSet0.vp_c10)._m0[8].w;
    float _1334 = _708 + _1332;
    float _1336 = (*spvDescriptorSet0.vp_c9)._m0[175].x * (*spvDescriptorSet0.vp_c10)._m0[8].z;
    float _1338 = fma(_1264, (*spvDescriptorSet0.vp_c9)._m0[174].x, _1314);
    float _1340 = fma(_1326, _1304, _1306);
    float _1342 = _1324 * _1328;
    float _1344 = _1330 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _1346 = _874 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _1348 = -_1336;
    float _1350 = fma(_1338, _1334, _1348);
    float _1352 = _1266 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _1354 = _1352 * 0.5;
    float _1356 = fma(_1342, (*spvDescriptorSet0.vp_c8)._m0[26].x, _1344);
    float _1358 = _1330 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _1360 = fma(_880, (*spvDescriptorSet0.vp_c8)._m0[11].x, _1346);
    float _1362 = -(*spvDescriptorSet0.vp_c10)._m0[10].w;
    float _1364 = _728 + _1362;
    float _1366 = (*spvDescriptorSet0.vp_c9)._m0[175].x * (*spvDescriptorSet0.vp_c10)._m0[10].z;
    float _1368 = fma(_1354, (*spvDescriptorSet0.vp_c8)._m0[26].z, _1356);
    float _1370 = fma(_1342, (*spvDescriptorSet0.vp_c8)._m0[24].x, _1358);
    float _1372 = fma(_888, (*spvDescriptorSet0.vp_c8)._m0[11].z, _1360);
    float _1374 = -_1366;
    float _1376 = fma(_1338, _1364, _1374);
    float _1378 = _1368 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _1380 = fma(_1264, (*spvDescriptorSet0.vp_c9)._m0[174].y, _1340);
    float _1382 = fma(_1354, (*spvDescriptorSet0.vp_c8)._m0[24].z, _1370);
    float _1384 = _874 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _1386 = _1372 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _1388 = fma(_1378, _1380, _1376);
    float _1390 = _1382 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _1392 = fma(_880, (*spvDescriptorSet0.vp_c8)._m0[10].x, _1384);
    float _1394 = 1.0 / _1386;
    float _1396 = _1388 + (*spvDescriptorSet0.vp_c10)._m0[10].w;
    float _1398 = fma(_1390, _1380, _1350);
    float _1400 = fma(_888, (*spvDescriptorSet0.vp_c8)._m0[10].z, _1392);
    float _1402 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1404 = _1396 + _1402;
    float _1406 = _1398 + (*spvDescriptorSet0.vp_c10)._m0[8].w;
    float _1408 = _1400 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _1410 = _1330 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _1412 = _1404 * _1404;
    float _1414 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1416 = _1406 + _1414;
    float _1418 = _1408 + _1386;
    float _1420 = fma(_1342, (*spvDescriptorSet0.vp_c8)._m0[25].x, _1410);
    float _1422 = -(*spvDescriptorSet0.vp_c10)._m0[9].w;
    float _1424 = _698 + _1422;
    float _1426 = fma(_1416, _1416, _1412);
    float _1428 = (*spvDescriptorSet0.vp_c9)._m0[175].x * (*spvDescriptorSet0.vp_c10)._m0[9].z;
    float _1430 = _1418 * _1394;
    float _1432 = _1430 * 0.5;
    float _1434 = fma(_1354, (*spvDescriptorSet0.vp_c8)._m0[25].z, _1420);
    float _1436 = sqrt(_1426);
    float _1438 = -_1428;
    float _1440 = fma(_1338, _1424, _1438);
    float _1442 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _1444 = fma(_1432, (*spvDescriptorSet0.vp_c8)._m0[30].w, _1442);
    float _1446 = _1434 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _1448 = fma(_1446, _1380, _1440);
    float _1450 = 1.0 / _1444;
    float _1452 = -(*spvDescriptorSet0.vp_c9)._m0[167].z;
    float _1454 = (*spvDescriptorSet0.vp_c9)._m0[168].z + _1452;
    float _1456 = _1448 + (*spvDescriptorSet0.vp_c10)._m0[9].w;
    float _1458 = -(*spvDescriptorSet0.vp_c9)._m0[169].z;
    float _1460 = (*spvDescriptorSet0.vp_c9)._m0[170].z + _1458;
    float _1462 = fma(_1454, _1024, (*spvDescriptorSet0.vp_c9)._m0[167].z);
    bool _1464 = _1436 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1466 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _1468 = _1450 * _1466;
    float _1470 = -(*spvDescriptorSet0.vp_c9)._m0[168].z;
    float _1472 = _1470 + (*spvDescriptorSet0.vp_c9)._m0[169].z;
    float _1474 = abs(_1468);
    float _1476 = log2(_1474);
    float _1478 = fma(_1472, _1034, (*spvDescriptorSet0.vp_c9)._m0[168].z);
    float _1480 = _1034;
    float _1482 = _1406;
    float _1484 = _1396;
    if (!_1464)
    {
        _1480 = _1456;
    }
    float _1486 = _1480;
    bool _1488 = !_1464;
    float _1490 = _1486;
    if (!_1488)
    {
        float _1492 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1494 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1496 = _1436 + _1494;
        float _1498 = rsqrt(_1426);
        float _1500 = _1496 * _1492;
        float _1502 = _1456 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1504 = _1500 * 0.15915493667125701904296875;
        float _1506 = _1504 * 6.283185482025146484375;
        float _1508 = cos(_1506);
        float _1510 = _1504 * 6.283185482025146484375;
        float _1512 = sin(_1510);
        float _1514 = _1508 + (-1.0);
        float _1516 = _1514 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1518 = fma(_1512, _1502, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1520 = fma(_1456, _1508, _1516);
        float _1522 = _1498 * _1518;
        float _1524 = fma(_1416, _1522, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1526 = fma(_1404, _1522, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _1490 = _1520;
        _1482 = _1524;
        _1484 = _1526;
    }
    float _1528 = _1490;
    float _1530 = _1482;
    float _1532 = _1484;
    float _1534 = -_698;
    float _1536 = _1534 + _1528;
    float _1538 = -_708;
    float _1540 = _1538 + _1530;
    float _1542 = fma(_1460, _1048, (*spvDescriptorSet0.vp_c9)._m0[169].z);
    float _1544 = _1476 * (*spvDescriptorSet0.vp_c15)._m0[654].z;
    float _1546 = _1536 * _1536;
    float _1548 = _1462 * _1162;
    float _1550 = -_728;
    float _1552 = _1550 + _1532;
    float _1554 = -(*spvDescriptorSet0.vp_c9)._m0[170].z;
    float _1556 = _1554 + (*spvDescriptorSet0.vp_c9)._m0[171].z;
    float _1558 = fma(_1540, _1540, _1546);
    float _1560 = fma(_1178, (*spvDescriptorSet0.vp_c9)._m0[167].z, _1548);
    float _1562 = exp2(_1544);
    float _1564 = fma(_1556, _1050, (*spvDescriptorSet0.vp_c9)._m0[170].z);
    float _1566 = fma(_1552, _1552, _1558);
    float _1568 = fma(_1478, _1134, _1560);
    float _1570 = _182 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    float _1572 = fma(_1542, _1116, _1568);
    float _1574 = sqrt(_1566);
    float _1576 = -(*spvDescriptorSet0.vp_c9)._m0[171].z;
    float _1578 = (*spvDescriptorSet0.vp_c9)._m0[172].z + _1576;
    bool _1580 = (*spvDescriptorSet0.vp_c15)._m0[660].y >= 0.5;
    bool _1582 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _1584 = _1580 || _1582;
    bool _1586 = isnan(0.5);
    bool _1588 = _1584 || _1586;
    float _1590 = fma(_1564, _1118, _1572);
    float _1592 = -(*spvDescriptorSet0.vp_c9)._m0[173].z;
    float _1594 = (*spvDescriptorSet0.vp_c9)._m0[174].z + _1592;
    float _1596 = fma(_1578, _1094, (*spvDescriptorSet0.vp_c9)._m0[171].z);
    float _1598 = -(*spvDescriptorSet0.vp_c9)._m0[172].z;
    float _1600 = _1598 + (*spvDescriptorSet0.vp_c9)._m0[173].z;
    out.m_55.x = _416;
    out.m_55.y = _412;
    out.m_55.z = _418;
    out.m_55.w = _424;
    float _1602 = fma(_1562, (*spvDescriptorSet0.vp_c15)._m0[654].x, (*spvDescriptorSet0.vp_c15)._m0[654].y);
    float _1604 = precise::clamp(_1602, 0.0, 1.0);
    float _1606 = fma(_1594, _1120, (*spvDescriptorSet0.vp_c9)._m0[173].z);
    float _1608 = fma(_1600, _1084, (*spvDescriptorSet0.vp_c9)._m0[172].z);
    float _1610 = fma(_1596, _1198, _1590);
    float _1612 = _172 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    bool _1614 = _1574 > 0.0;
    float _1616 = _1570 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _1618 = fma(_1608, _1200, _1610);
    float _1620 = fma(_1612, (*spvDescriptorSet0.vp_c8)._m0[24].x, _1616);
    float _1622 = fma(_1606, _1304, _1618);
    float _1624 = _1570 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _1626 = _1570 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _1628 = fma(_1604, -2.0, 3.0);
    float _1630 = _1604 * _1604;
    float _1632 = fma(_1612, (*spvDescriptorSet0.vp_c8)._m0[25].x, _1624);
    float _1634 = fma(_1612, (*spvDescriptorSet0.vp_c8)._m0[26].x, _1626);
    float _1636 = _1630 * _1628;
    bool _1638 = !_1614;
    float _1640 = _1530;
    float _1642 = _1528;
    float _1644 = _1532;
    float _1646 = _1634;
    float _1648 = _1632;
    if (!_1638)
    {
        float _1650 = _186 * _186;
        float _1652 = rsqrt(_1566);
        float _1654 = fma(_184, _184, _1650);
        float _1656 = fma(_188, _188, _1654);
        float _1658 = sqrt(_1656);
        float _1660 = _1540 * _1652;
        float _1662 = _1536 * _1652;
        float _1664 = _1552 * _1652;
        bool _1666 = _1658 > 0.0;
        bool _1668 = !_1666;
        if (!_1668)
        {
            float _1670 = rsqrt(_1656);
            float _1672 = 1.0 / (*spvDescriptorSet0.vp_c10)._m0[2].z;
            float _1674 = _186 * _1670;
            float _1676 = _184 * _1670;
            float _1678 = _1662 * _1674;
            float _1680 = _188 * _1670;
            float _1682 = fma(_1660, _1676, _1678);
            float _1684 = _1672 * (*spvDescriptorSet0.vp_c9)._m0[142].x;
            float _1686 = fma(_1664, _1680, _1682);
            float _1688 = _1686 * _1684;
            float _1690 = fma(_184, _1688, _1530);
            float _1692 = fma(_186, _1688, _1528);
            float _1694 = fma(_188, _1688, _1532);
            _1640 = _1690;
            _1642 = _1692;
            _1644 = _1694;
        }
    }
    float _1696 = _1640;
    float _1698 = _1642;
    float _1700 = _1644;
    float _1702 = -_870;
    float _1704 = fma(_1702, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1696);
    float _1706 = -_868;
    float _1708 = fma(_1706, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1698);
    float _1710 = -_876;
    float _1712 = fma(_1710, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1700);
    float _1714 = fma(_1264, (*spvDescriptorSet0.vp_c9)._m0[174].z, _1622);
    float _1716 = -_1636;
    float _1718 = _1716 + 1.0;
    float _1720 = _1708;
    float _1722 = _1704;
    float _1724 = _1712;
    if (!_1588)
    {
        float _1726 = _884 * _884;
        float _1728 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _1730 = -_728;
        float _1732 = _1730 + _1700;
        float _1734 = fma(_892, _892, _1726);
        float _1736 = fma(_898, _898, _1734);
        float _1738 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1740 = sqrt(_1736);
        float _1742 = 1.0 / _1266;
        float _1744 = _1738 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1746 = precise::min(_1740, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _1748 = _1746 * _1728;
        float _1750 = _1748 * _1742;
        float _1752 = -_708;
        float _1754 = _1752 + _1696;
        float _1756 = -_698;
        float _1758 = _1756 + _1698;
        float _1760 = _1744 * _1750;
        float _1762 = _1732 * _1750;
        float _1764 = fma(_1754, _1760, _880);
        float _1766 = fma(_1758, _1760, _874);
        float _1768 = fma(_1744, _1762, _888);
        _1720 = _1766;
        _1722 = _1764;
        _1724 = _1768;
    }
    float _1770 = _1720;
    float _1772 = _1722;
    float _1774 = _1724;
    float _1776 = _1770 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1778 = _1770 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1780 = fma(_1718, (*spvDescriptorSet0.vp_c15)._m0[654].w, _1636);
    float _1782 = _1770 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1784 = fma(_1772, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1776);
    float _1786 = fma(_1772, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1778);
    float _1788 = _1770 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1790 = fma(_1772, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1782);
    float _1792 = fma(_1774, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1784);
    float _1794 = fma(_1774, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1786);
    float _1796 = fma(_1772, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1788);
    float _1798 = fma(_1774, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1790);
    float _1800 = _1792 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1802 = _1794 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1804 = fma(_1774, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1796);
    float _1806 = _1798 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1808 = _1800 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1810 = _1800 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1812 = _1800 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _1814 = _1800 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1816 = fma(_1802, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1808);
    float _1818 = fma(_1802, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1810);
    float _1820 = fma(_1802, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1812);
    float _1822 = fma(_1802, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1814);
    float _1824 = fma(_1806, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1816);
    float _1826 = fma(_1806, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1818);
    float _1828 = fma(_1806, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1820);
    float _1830 = fma(_1806, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1822);
    float _1832 = _1804 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1834 = in.m_63.x;
    float _1836 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1838 = _1770 + _1836;
    bool _1840 = _1468 <= 8000.0;
    bool _1842 = isnan(_1468);
    bool _1844 = _1840 || _1842;
    bool _1846 = isnan(8000.0);
    bool _1848 = _1844 || _1846;
    float _1850 = float(_1848);
    float _1852 = fma(_1832, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1824);
    float _1854 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1856 = _1772 + _1854;
    float _1858 = _1838 * _1838;
    float _1860 = -_930;
    float _1862 = _1860 + 1.0;
    float _1864 = _1850 * _1780;
    out.m_61.x = _850;
    out.m_61.y = _852;
    out.m_61.z = _854;
    out.m_61.w = _866;
    float _1866 = fma(_1856, _1856, _1858);
    float _1868 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1870 = _1774 + _1868;
    float _1872 = _1864 * (*spvDescriptorSet0.vp_c15)._m0[653].x;
    float _1874 = fma(_1832, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1826);
    float _1876 = fma(_1832, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1828);
    float _1878 = fma(_1870, _1870, _1866);
    float _1880 = _1862 * _1872;
    float _1882 = precise::clamp(_1880, 0.0, 1.0);
    float _1884 = fma(_1832, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1830);
    float _1886 = _1620 + (*spvDescriptorSet0.vp_c8)._m0[24].z;
    float _1888 = _1634 + (*spvDescriptorSet0.vp_c8)._m0[26].z;
    float _1890 = -_1882;
    float _1892 = fma(_1890, (*spvDescriptorSet0.vp_c15)._m0[653].y, 1.0);
    float _1894 = _1632 + (*spvDescriptorSet0.vp_c8)._m0[25].z;
    float _1896 = sqrt(_1878);
    out.m_65.x = _1714;
    float _1898 = _1892 * _1834;
    out.gl_Position.x = _1852;
    out.gl_Position.y = _1874;
    out.gl_Position.z = _1876;
    out.gl_Position.w = _1884;
    float _1900 = _1898 * (*spvDescriptorSet0.vp_c13)._m0[1].w;
    out.m_67.x = _1886;
    out.m_67.y = _1894;
    out.m_67.z = _1888;
    out.m_69.x = _1900;
    bool _1902 = _1896 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _1904 = isnan(_1896);
    bool _1906 = _1902 || _1904;
    bool _1908 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _1910 = _1906 || _1908;
    float _1912 = _1826;
    float _1914 = _1878;
    if (!_1910)
    {
        _858 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _1916 = _858;
    float _1918 = _1916;
    float _1920 = _1916;
    if (!_1910)
    {
        _860 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _1922 = _860;
    float _1924 = _1922;
    float _1926 = _1922;
    if (!_1910)
    {
        _1912 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _1928 = _1912;
    float _1930 = _1928;
    float _1932 = _1928;
    if (!_1910)
    {
        _1646 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _1934 = _1646;
    float _1936 = _1934;
    float _1938 = _1934;
    if (!_1910)
    {
        _1648 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _1940 = _1648;
    float _1942 = _1940;
    float _1944 = _1940;
    if (!_1910)
    {
        _1914 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _1946 = _1914;
    bool _1948 = !_1910;
    float _1950 = _1946;
    float _1952 = _1946;
    if (!_1948)
    {
        bool _1954 = _1896 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _1956 = isnan(_1896);
        bool _1958 = _1954 || _1956;
        bool _1960 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _1962 = _1958 || _1960;
        if (!_1962)
        {
            float _1964 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _1966 = _1896 + _1964;
            float _1968 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _1970 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _1968;
            float _1972 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _1974 = _1972 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _1976 = 1.0 / _1970;
            float _1978 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _1980 = _1978 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _1982 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _1984 = _1982 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _1986 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _1988 = _1986 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _1990 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _1992 = _1990 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _1994 = _1966 * _1976;
            float _1996 = precise::clamp(_1994, 0.0, 1.0);
            float _1998 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _2000 = _1998 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _2002 = fma(_1996, _1974, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _2004 = fma(_1996, _2000, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _2006 = fma(_1996, _1980, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _2008 = fma(_1996, _1984, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _2010 = fma(_1996, _1988, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _2012 = fma(_1996, _1992, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            _1926 = _2002;
            _1944 = _2010;
            _1920 = _2006;
            _1938 = _2008;
            _1932 = _2004;
            _1952 = _2012;
            _2014 = true;
        }
        else
        {
            bool _2016 = _1896 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _2018 = isnan(_1896);
            bool _2020 = _2016 || _2018;
            bool _2022 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _2024 = _2020 || _2022;
            if (!_2024)
            {
                _1918 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _2026 = _1918;
            _1920 = _2026;
            if (!_2024)
            {
                _1924 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _2028 = _1924;
            _1926 = _2028;
            if (!_2024)
            {
                _1930 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _2030 = _1930;
            _1932 = _2030;
            if (!_2024)
            {
                _1936 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _2032 = _1936;
            _1938 = _2032;
            if (!_2024)
            {
                _1942 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _2034 = _1942;
            _1944 = _2034;
            if (!_2024)
            {
                _1950 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _2036 = _1950;
            bool _2038 = !_2024;
            _1952 = _2036;
            if (!_2038)
            {
                bool _2040 = _1896 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _2042 = isnan(_1896);
                bool _2044 = _2040 || _2042;
                bool _2046 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _2048 = _2044 || _2046;
                if (!_2048)
                {
                    float _2050 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2052 = _1896 + _2050;
                    float _2054 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2056 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _2054;
                    float _2058 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _2060 = _2058 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _2062 = 1.0 / _2056;
                    float _2064 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _2066 = _2064 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _2068 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _2070 = _2068 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _2072 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _2074 = _2072 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _2076 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _2078 = _2076 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _2080 = _2052 * _2062;
                    float _2082 = precise::clamp(_2080, 0.0, 1.0);
                    float _2084 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _2086 = _2084 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _2088 = fma(_2082, _2060, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _2090 = fma(_2082, _2086, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _2092 = fma(_2082, _2066, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _2094 = fma(_2082, _2070, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _2096 = fma(_2082, _2074, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _2098 = fma(_2082, _2078, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    _1926 = _2088;
                    _1944 = _2096;
                    _1920 = _2092;
                    _1938 = _2094;
                    _1932 = _2090;
                    _1952 = _2098;
                    _2014 = true;
                }
                else
                {
                    _1926 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _1944 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _1920 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _1938 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _1932 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _1952 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _2014 = false;
    float _2100 = _1926;
    float _2102 = _1944;
    float _2104 = _1920;
    float _2106 = _1938;
    float _2108 = _1932;
    float _2110 = _1952;
    float _2112 = fma(_1894, -0.5, 0.5);
    float _2114 = precise::clamp(_2112, 0.0, 1.0);
    float _2116 = -_2100;
    float _2118 = _2116 + _2102;
    float _2120 = -_2104;
    float _2122 = _2120 + _2106;
    float _2124 = -_2108;
    float _2126 = _2124 + _2110;
    bool _2128 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _2130 = fma(_2114, _2118, _2100);
    float _2132 = fma(_2114, _2122, _2104);
    float _2134 = fma(_2114, _2126, _2108);
    float _2136 = _2130 * 0.586610972881317138671875;
    out.m_71.x = 0.0;
    float _2138 = fma(_2132, 0.298911988735198974609375, _2136);
    float _2140 = (*spvDescriptorSet0.vp_c10)._m0[3].x * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    out.m_40.x = 1.0;
    float _2142 = fma(_2134, 0.114477999508380889892578125, _2138);
    float _2144 = -_2142;
    float _2146 = _2132 + _2144;
    float _2148 = -_2142;
    float _2150 = _2130 + _2148;
    float _2152 = -_2142;
    float _2154 = _2134 + _2152;
    out.m_69.w = _2140;
    float _2156 = fma(_2146, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2142);
    float _2158 = fma(_2150, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2142);
    float _2160 = fma(_2154, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2142);
    out.m_73.x = _2156;
    out.m_73.y = _2158;
    out.m_73.z = _2160;
    if (!_2128)
    {
        return out;
    }
    float _2162 = -_1770;
    float _2164 = _2162 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
    float _2166 = -_1772;
    float _2168 = _2166 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
    float _2170 = -_1774;
    float _2172 = _2170 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
    float _2174 = _2164 * _2164;
    float _2176 = fma(_2168, _2168, _2174);
    float _2178 = fma(_2172, _2172, _2176);
    float _2180 = sqrt(_2178);
    float _2182 = rsqrt(_2178);
    float _2184 = -_2180;
    float _2186 = _2184 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _2188 = _2186 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
    float _2190 = precise::clamp(_2188, 0.0, 1.0);
    float _2192 = _2168 * _2182;
    float _2194 = _2164 * _2182;
    float _2196 = abs(_2190);
    float _2198 = log2(_2196);
    float _2200 = _2172 * _2182;
    float _2202 = _2192 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
    float _2204 = _1894 * _2194;
    float _2206 = -_2194;
    float _2208 = -_2202;
    float _2210 = fma(_2206, (*spvDescriptorSet0.vp_c15)._m0[656].y, _2208);
    float _2212 = fma(_1886, _2192, _2204);
    float _2214 = -_2200;
    float _2216 = fma(_2214, (*spvDescriptorSet0.vp_c15)._m0[656].z, _2210);
    float _2218 = fma(_1888, _2200, _2212);
    float _2220 = precise::clamp(_2218, 0.0, 1.0);
    float _2222 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
    float _2224 = _2216 + _2222;
    float _2226 = _2198 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
    float _2228 = _2224 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
    float _2230 = precise::clamp(_2228, 0.0, 1.0);
    float _2232 = exp2(_2226);
    float _2234 = _2232 * _2230;
    float _2236 = _2220 * _2234;
    float _2238 = _2236 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
    float _2240 = _2236 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
    float _2242 = _2236 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
    out.m_71.x = _2238;
    out.m_71.y = _2240;
    out.m_71.z = _2242;
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
    out.m_55 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_61 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_44 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_59 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_73 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_40 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_57 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_67 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_65 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_71 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_69 = float4(0.0, 0.0, 0.0, 1.0);
    bool _2014 = false;
    bool _450 = false;
    bool _306 = false;
    bool _210 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _87 = in.m_37.w;
    float _89 = trunc(_87);
    int _92 = int(_89);
    bool _96 = _92 >= 1;
    float _98 = 0.0;
    if (!_96)
    {
        _98 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _100 = _98;
    if (!_96)
    {
        out.m_40.x = 0.0;
    }
    int _102 = 0;
    if (!_96)
    {
        float _104 = _100 * 5.0;
        _102 = as_type<int>(_104);
    }
    int _106 = _102;
    int _108 = _106;
    if (!_96)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2298 = as_type<float>(_106);
        out.gl_Position.z = _2298;
    }
    if (!_96)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_55.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_55.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_55.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_55.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_61.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_61.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_61.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_61.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_44.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_44.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_44.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_44.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_59.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_59.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_59.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_59.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_73.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_73.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_73.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_73.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_40.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_40.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_40.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_40.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_57.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_57.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_57.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_57.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_67.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_67.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_67.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_67.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_65.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_65.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_65.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_65.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_71.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_71.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_71.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_71.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_69.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_69.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_69.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_69.w)); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _110 = in.m_42.w;
    float _112 = float(_92);
    float _114 = 1.0 / _112;
    float _116 = -_110;
    float _118 = _116 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _120 = _110 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _122 = isnan(_110);
    bool _124 = _120 || _122;
    bool _126 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _128 = _124 || _126;
    float _130 = _118 * _114;
    bool _132 = _118 >= _112;
    bool _134 = !_128;
    bool _136 = _132 || _134;
    out.m_44.x = _130;
    float _138 = _110;
    if (_136)
    {
        _138 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _140 = _138;
    if (_136)
    {
        out.m_40.x = 0.0;
    }
    if (_136)
    {
        float _142 = _140 * 5.0;
        _108 = as_type<int>(_142);
    }
    int _144 = _108;
    if (_136)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2369 = as_type<float>(_144);
        out.gl_Position.z = _2369;
    }
    if (_136)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_55.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_55.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_55.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_55.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_61.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_61.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_61.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_61.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_44.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_44.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_44.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_44.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_59.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_59.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_59.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_59.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_73.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_73.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_73.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_73.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_40.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_40.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_40.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_40.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_57.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_57.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_57.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_57.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_67.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_67.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_67.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_67.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_65.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_65.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_65.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_65.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_71.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_71.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_71.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_71.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_69.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_69.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_69.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_69.w)); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _146 = as_type<float>(int(gl_VertexIndex));
    float _148 = in.m_49.x;
    float _150 = in.m_49.y;
    float _152 = in.m_49.z;
    int _154 = as_type<int>(_146) & 1;
    bool _156 = _154 != 0;
    int _158 = as_type<int>(_146) & 2;
    bool _160 = _158 != 0;
    bool _162 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _164 = _150 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _166 = _150 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _168 = _150 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    bool _170 = !_156;
    float _172 = _170 ? (-0.5) : 0.5;
    float _174 = fma(_148, (*spvDescriptorSet0.vp_c10)._m0[4].x, _164);
    float _176 = fma(_148, (*spvDescriptorSet0.vp_c10)._m0[5].x, _166);
    float _178 = fma(_148, (*spvDescriptorSet0.vp_c10)._m0[6].x, _168);
    bool _180 = !_160;
    float _182 = _180 ? (-0.5) : 0.5;
    float _184 = fma(_152, (*spvDescriptorSet0.vp_c10)._m0[4].z, _174);
    float _186 = fma(_152, (*spvDescriptorSet0.vp_c10)._m0[5].z, _176);
    float _188 = fma(_152, (*spvDescriptorSet0.vp_c10)._m0[6].z, _178);
    bool _190 = !_162;
    float _208;
    if (!_190)
    {
        float _192 = in.m_51.x;
        float _194 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _196 = _192 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _198 = fma(_196, (*spvDescriptorSet0.vp_c9)._m0[12].x, _118);
        float _200 = _198 * _194;
        float _202 = floor(_200);
        float _204 = -_202;
        float _206 = _200 + _204;
        _208 = _206;
        _210 = true;
    }
    else
    {
        _208 = _130;
    }
    _210 = false;
    float _212 = _208;
    float _214 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _216 = _212 + _214;
    bool _218 = _212 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _220 = isnan(_212);
    bool _222 = _218 || _220;
    bool _224 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _226 = _222 || _224;
    float _228 = float(_226);
    float _230 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _232 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _230;
    float _234 = -_228;
    float _236 = _234 + 1.0;
    bool _238 = _212 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _240 = isnan(_212);
    bool _242 = _238 || _240;
    bool _244 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _246 = _242 || _244;
    float _248 = float(_246);
    float _250 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _252 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _250;
    bool _254 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _256 = 1.0 / _232;
    float _258 = _248 * _236;
    float _260 = -_248;
    float _262 = _260 + 1.0;
    float _264 = _216 * _256;
    float _266 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _268 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _266;
    float _270 = fma(_252, _264, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _272 = fma(_268, _264, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _274 = _270 * _258;
    float _276 = _272 * _258;
    float _278 = fma(_262, (*spvDescriptorSet0.vp_c9)._m0[143].x, _274);
    float _280 = fma(_262, (*spvDescriptorSet0.vp_c9)._m0[143].y, _276);
    float _282 = fma(_228, (*spvDescriptorSet0.vp_c9)._m0[144].x, _278);
    float _284 = fma(_228, (*spvDescriptorSet0.vp_c9)._m0[144].y, _280);
    bool _286 = !_254;
    float _304;
    if (!_286)
    {
        float _288 = in.m_51.x;
        float _290 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _292 = _288 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _294 = fma(_292, (*spvDescriptorSet0.vp_c9)._m0[11].y, _118);
        float _296 = _294 * _290;
        float _298 = floor(_296);
        float _300 = -_298;
        float _302 = _296 + _300;
        _304 = _302;
        _306 = true;
    }
    else
    {
        _304 = _130;
    }
    _306 = false;
    float _308 = _304;
    float _310 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _312 = _308 + _310;
    float _314 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _316 = _314 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _318 = _308 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _320 = isnan(_308);
    bool _322 = _318 || _320;
    bool _324 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _326 = _322 || _324;
    float _328 = float(_326);
    float _330 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _332 = _330 + (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _334 = _308 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _336 = isnan(_308);
    bool _338 = _334 || _336;
    bool _340 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _342 = _338 || _340;
    float _344 = float(_342);
    float _346 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _348 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _346;
    bool _350 = _308 >= (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _352 = isnan(_308);
    bool _354 = _350 || _352;
    bool _356 = isnan((*spvDescriptorSet0.vp_c9)._m0[117].w);
    bool _358 = _354 || _356;
    float _360 = float(_358);
    float _362 = 1.0 / _316;
    float _364 = -_328;
    float _366 = _364 + 1.0;
    bool _368 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].w;
    float _370 = _344 * _366;
    float _372 = -_344;
    float _374 = _372 + 1.0;
    float _376 = 1.0 / _332;
    float _378 = _348 * _362;
    float _380 = -(*spvDescriptorSet0.vp_c9)._m0[116].x;
    float _382 = _380 + (*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _384 = fma(_378, _312, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _386 = _382 * _376;
    float _388 = _384 * _370;
    float _390 = -_360;
    float _392 = _390 + 1.0;
    float _394 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _396 = _308 + _394;
    float _398 = fma(_374, (*spvDescriptorSet0.vp_c9)._m0[115].x, _388);
    float _400 = _328 * _392;
    float _402 = fma(_386, _396, (*spvDescriptorSet0.vp_c9)._m0[116].x);
    float _404 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _406 = fma(_402, _400, _398);
    float _408 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _410 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _412 = _404 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _414 = fma(_360, (*spvDescriptorSet0.vp_c9)._m0[117].x, _406);
    float _416 = _408 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _418 = _410 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _420 = in.m_53.x;
    float _422 = in.m_53.y;
    float _424 = _414 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    out.m_55.x = _416;
    out.m_55.y = _412;
    out.m_55.z = _418;
    out.m_55.w = _424;
    float _426 = _284 * _422;
    float _428 = _282 * _420;
    bool _430 = !_368;
    float _448;
    if (!_430)
    {
        float _432 = in.m_51.x;
        float _434 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].w;
        float _436 = _432 * (*spvDescriptorSet0.vp_c9)._m0[13].x;
        float _438 = fma(_436, (*spvDescriptorSet0.vp_c9)._m0[11].w, _118);
        float _440 = _438 * _434;
        float _442 = floor(_440);
        float _444 = -_442;
        float _446 = _440 + _444;
        _448 = _446;
        _450 = true;
    }
    else
    {
        _448 = _130;
    }
    _450 = false;
    float _452 = _448;
    float _454 = in.m_51.x;
    float _456 = in.m_51.y;
    float _458 = in.m_51.z;
    float _460 = in.m_51.w;
    float _462 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    int _464 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _466 = _464 != 0;
    float _468 = in.m_37.x;
    float _470 = in.m_37.y;
    float _472 = in.m_37.z;
    int _474 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _476 = _474 != 0;
    float _478 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    int _480 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _482 = _480 != 0;
    int _484 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _486 = _484 != 0;
    float _488 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    bool _490 = _454 > 0.5;
    float _492 = _456 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    bool _494 = _460 > 0.5;
    float _496 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _498 = _496 + (*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _500 = -_172;
    int _502 = _490 ? as_type<int>(_500) : as_type<int>(_172);
    float _504 = (*spvDescriptorSet0.vp_c9)._m0[83].w + (*spvDescriptorSet0.vp_c9)._m0[83].y;
    bool _506 = _456 > 0.5;
    float _508 = 1.0 / _498;
    bool _510 = !_476;
    float _512 = _510 ? _172 : as_type<float>(_502);
    float _514 = -_182;
    int _516 = _506 ? as_type<int>(_514) : as_type<int>(_182);
    bool _518 = _458 > 0.5;
    int _520 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _522 = _520 != 0;
    float _524 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].w;
    float _526 = 0.0;
    float _528 = _524;
    if (!_466)
    {
        _526 = _458;
    }
    float _530 = _526;
    float _532 = _470 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _534 = 0.0;
    float _536 = _530;
    if (!_466)
    {
        _534 = _458;
    }
    float _538 = _534;
    float _540 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    float _542 = 0.0;
    float _544 = _538;
    if (!_466)
    {
        _542 = _456;
    }
    float _546 = _542;
    float _548 = fma(_468, (*spvDescriptorSet0.vp_c10)._m0[4].x, _532);
    bool _550 = !_482;
    float _552 = _550 ? _182 : as_type<float>(_516);
    float _554 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _556 = _546;
    if (_466)
    {
        _536 = _456;
    }
    float _558 = _536;
    float _560 = _454 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    if (_466)
    {
        _556 = _454;
    }
    float _562 = _556;
    if (_466)
    {
        _544 = _456;
    }
    float _564 = _544;
    float _566 = -_540;
    float _568 = fma(_560, 2.0, _566);
    int _570 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 16;
    bool _572 = _570 != 0;
    int _574 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 32;
    bool _576 = _574 != 0;
    float _578 = _470 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _580 = _470 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _582 = fma(_564, (*spvDescriptorSet0.vp_c9)._m0[83].w, _504);
    float _584 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    float _586 = fma(_492, -2.0, _554);
    float _588 = fma(_468, (*spvDescriptorSet0.vp_c10)._m0[6].x, _580);
    float _590 = fma(_456, (*spvDescriptorSet0.vp_c9)._m0[78].w, _584);
    float _592 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _594 = _452 + _592;
    float _596 = (*spvDescriptorSet0.vp_c9)._m0[83].z + (*spvDescriptorSet0.vp_c9)._m0[83].x;
    float _598 = -(*spvDescriptorSet0.vp_c9)._m0[131].x;
    float _600 = (*spvDescriptorSet0.vp_c9)._m0[132].x + _598;
    float _602 = fma(_468, (*spvDescriptorSet0.vp_c10)._m0[5].x, _578);
    float _604 = -_118;
    float _606 = fma(_604, (*spvDescriptorSet0.vp_c9)._m0[76].x, _568);
    float _608 = fma(_472, (*spvDescriptorSet0.vp_c10)._m0[4].z, _548);
    float _610 = _600 * _508;
    float _612 = fma(_472, (*spvDescriptorSet0.vp_c10)._m0[5].z, _602);
    float _614 = _462 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _616 = _512 + 0.5;
    float _618 = fma(_610, _594, (*spvDescriptorSet0.vp_c9)._m0[131].x);
    bool _620 = _452 >= (*spvDescriptorSet0.vp_c9)._m0[132].w;
    bool _622 = isnan(_452);
    bool _624 = _620 || _622;
    bool _626 = isnan((*spvDescriptorSet0.vp_c9)._m0[132].w);
    bool _628 = _624 || _626;
    float _630 = float(_628);
    float _632 = fma(_472, (*spvDescriptorSet0.vp_c10)._m0[6].z, _588);
    float _634 = fma(_614, _616, _606);
    bool _636 = _452 >= (*spvDescriptorSet0.vp_c9)._m0[131].w;
    bool _638 = isnan(_452);
    bool _640 = _636 || _638;
    bool _642 = isnan((*spvDescriptorSet0.vp_c9)._m0[131].w);
    bool _644 = _640 || _642;
    float _646 = float(_644);
    float _648 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    float _650 = -_630;
    float _652 = _650 + 1.0;
    float _654 = fma(_118, (*spvDescriptorSet0.vp_c9)._m0[76].y, _586);
    float _656 = _478 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _658 = _552 + (-0.5);
    float _660 = fma(_562, (*spvDescriptorSet0.vp_c9)._m0[83].z, _596);
    float _662 = (*spvDescriptorSet0.vp_c9)._m0[82].x + (*spvDescriptorSet0.vp_c9)._m0[81].z;
    float _664 = _646 * _652;
    float _666 = _562 * (*spvDescriptorSet0.vp_c9)._m0[82].x;
    float _668 = -_656;
    float _670 = -_654;
    float _672 = fma(_668, _658, _670);
    float _674 = _618 * _664;
    float _676 = -_662;
    float _678 = fma(_666, 2.0, _676);
    float _680 = _558 * (*spvDescriptorSet0.vp_c9)._m0[82].y;
    float _682 = -_172;
    int _684 = _518 ? as_type<int>(_682) : as_type<int>(_172);
    float _686 = (*spvDescriptorSet0.vp_c9)._m0[82].y + (*spvDescriptorSet0.vp_c9)._m0[81].w;
    float _688 = -_646;
    float _690 = _688 + 1.0;
    float _692 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    bool _694 = !_486;
    float _696 = _694 ? _172 : as_type<float>(_684);
    float _698 = _612 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _700 = fma(_680, -2.0, _686);
    float _702 = fma(_690, (*spvDescriptorSet0.vp_c9)._m0[131].x, _674);
    float _704 = _648 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    float _706 = fma(_454, (*spvDescriptorSet0.vp_c9)._m0[78].z, _692);
    float _708 = _608 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _710 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _712 = _698 + _710;
    float _714 = _696 + 0.5;
    float _716 = -_118;
    float _718 = fma(_716, (*spvDescriptorSet0.vp_c9)._m0[81].x, _678);
    float _720 = fma(_118, (*spvDescriptorSet0.vp_c9)._m0[77].w, _590);
    float _722 = fma(_118, (*spvDescriptorSet0.vp_c9)._m0[81].y, _700);
    float _724 = fma(_118, (*spvDescriptorSet0.vp_c9)._m0[77].z, _706);
    float _726 = fma(_118, (*spvDescriptorSet0.vp_c9)._m0[82].w, _582);
    float _728 = _632 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _730 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _732 = _708 + _730;
    float _734 = _712 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _736 = fma(_704, _714, _718);
    float _738 = -_182;
    int _740 = _494 ? as_type<int>(_738) : as_type<int>(_182);
    float _742 = _488 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    float _744 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _746 = _728 + _744;
    float _748 = fma(_732, (*spvDescriptorSet0.vp_c8)._m0[28].x, _734);
    float _750 = -_724;
    float _752 = _750 + 1.0;
    float _754 = fma(_118, (*spvDescriptorSet0.vp_c9)._m0[82].z, _660);
    bool _756 = !_522;
    float _758 = _756 ? _182 : as_type<float>(_740);
    float _760 = fma(_746, (*spvDescriptorSet0.vp_c8)._m0[28].z, _748);
    float _762 = -_752;
    float _764 = fma(_512, _762, _634);
    float _766 = -_720;
    float _768 = _766 + 1.0;
    float _770 = _712 * _712;
    float _772 = _758 + (-0.5);
    bool _774 = _760 >= 0.0;
    float _776 = fma(_552, _768, _672);
    float _778 = fma(_732, _732, _770);
    float _780 = -_172;
    int _782 = _506 ? as_type<int>(_780) : as_type<int>(_172);
    float _784 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].z;
    float _786 = -_182;
    int _788 = _518 ? as_type<int>(_786) : as_type<int>(_182);
    float _790 = -_742;
    float _792 = -_722;
    float _794 = fma(_790, _772, _792);
    float _796 = fma(_630, (*spvDescriptorSet0.vp_c9)._m0[132].x, _702);
    float _798 = -_754;
    float _800 = _798 + 1.0;
    float _802 = -_726;
    float _804 = _802 + 1.0;
    float _806 = fma(_746, _746, _778);
    bool _808 = !_572;
    float _810 = _808 ? _172 : as_type<float>(_782);
    float _812 = -_800;
    float _814 = fma(_696, _812, _736);
    bool _816 = !_576;
    float _818 = _816 ? _182 : as_type<float>(_788);
    float _820 = fma(_758, _804, _794);
    float _822 = _810 + 0.5;
    float _824 = -_818;
    float _826 = _824 + 0.5;
    float _828 = rsqrt(_806);
    float _830 = _736;
    float _832 = _814;
    if (_774)
    {
        _830 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _834 = _830;
    float _836 = _822 * (*spvDescriptorSet0.vp_c9)._m0[90].x;
    float _838 = _826 * (*spvDescriptorSet0.vp_c9)._m0[90].y;
    float _840 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _842 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _844 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _846 = _836 * _784;
    float _848 = _838 * _524;
    float _850 = _840 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _852 = _842 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _854 = _844 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    int _856 = as_type<int>(_834);
    float _858 = _850;
    float _860 = _852;
    if (_774)
    {
        float _862 = _834 * 5.0;
        _856 = as_type<int>(_862);
    }
    int _864 = _856;
    float _866 = _796 * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    out.m_57.x = _846;
    out.m_57.y = _848;
    float _868 = _712 * _828;
    float _870 = _732 * _828;
    out.m_59.x = _764;
    out.m_59.y = _776;
    out.m_59.z = _814;
    out.m_59.w = _820;
    if (_774)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _3610 = as_type<float>(_864);
        out.gl_Position.z = _3610;
    }
    out.m_61.x = _850;
    out.m_61.y = _852;
    out.m_61.z = _854;
    out.m_61.w = _866;
    if (_774)
    {
        out.m_40.x = 0.0;
    }
    if (_774)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_55.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_55.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_55.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_55.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_61.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_61.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_61.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_61.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_44.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_44.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_44.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_44.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_59.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_59.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_59.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_59.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_73.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_73.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_73.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_73.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_40.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_40.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_40.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_40.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_57.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_57.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_57.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_57.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_67.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_67.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_67.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_67.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_65.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_65.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_65.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_65.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_71.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_71.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_71.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_71.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_69.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_69.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_69.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_69.w)); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _872 = -_868;
    float _874 = fma(_872, (*spvDescriptorSet0.vp_c9)._m0[18].w, _698);
    float _876 = _746 * _828;
    float _878 = -_870;
    float _880 = fma(_878, (*spvDescriptorSet0.vp_c9)._m0[18].w, _708);
    float _882 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _884 = _874 + _882;
    float _886 = -_876;
    float _888 = fma(_886, (*spvDescriptorSet0.vp_c9)._m0[18].w, _728);
    float _890 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _892 = _880 + _890;
    float _894 = _884 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _896 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _898 = _888 + _896;
    float _900 = fma(_892, (*spvDescriptorSet0.vp_c8)._m0[28].x, _894);
    float _902 = fma(_898, (*spvDescriptorSet0.vp_c8)._m0[28].z, _900);
    bool _904 = _902 >= 0.0;
    if (_904)
    {
        _832 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _906 = _832;
    int _908 = as_type<int>(_906);
    if (_904)
    {
        out.m_40.x = 0.0;
    }
    if (_904)
    {
        float _910 = _906 * 5.0;
        _908 = as_type<int>(_910);
    }
    int _912 = _908;
    if (_904)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _3712 = as_type<float>(_912);
        out.gl_Position.z = _3712;
    }
    if (_904)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_55.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_55.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_55.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_55.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_61.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_61.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_61.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_61.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_44.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_44.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_44.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_44.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_59.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_59.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_59.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_59.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_73.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_73.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_73.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_73.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_40.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_40.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_40.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_40.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_57.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_57.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_57.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_57.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_67.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_67.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_67.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_67.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_65.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_65.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_65.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_65.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_71.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_71.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_71.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_71.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_69.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_69.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_69.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_69.w)); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _914 = fma(_880, (*spvDescriptorSet0.vp_c15)._m0[652].x, (*spvDescriptorSet0.vp_c15)._m0[652].z);
    float _916 = fma(_888, (*spvDescriptorSet0.vp_c15)._m0[652].y, (*spvDescriptorSet0.vp_c15)._m0[652].w);
    float _918 = floor(_914);
    float _920 = floor(_916);
    float _922 = -_918;
    float _924 = _914 + _922;
    float _926 = -_920;
    float _928 = _916 + _926;
    float2 _3748 = float2(_924, _928);
    float _930 = dm_bs(spvDescriptorSet0.vp_t_tcb_24.sample(spvDescriptorSet0.vp_t_tcb_24Smplr, select(_3748, float2(0.0), isnan(_3748)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_24, spvDescriptorSet0.vp_t_tcb_24Smplr_w, select(_3748, float2(0.0), isnan(_3748)), level(0.0)).x;
    float _932 = -_868;
    float _934 = fma(_932, (*spvDescriptorSet0.vp_c9)._m0[18].w, _712);
    float _936 = -_870;
    float _938 = fma(_936, (*spvDescriptorSet0.vp_c9)._m0[18].w, _732);
    float _940 = -(*spvDescriptorSet0.vp_c9)._m0[167].w;
    float _942 = (*spvDescriptorSet0.vp_c9)._m0[168].w + _940;
    float _944 = -(*spvDescriptorSet0.vp_c9)._m0[168].w;
    float _946 = _944 + (*spvDescriptorSet0.vp_c9)._m0[169].w;
    float _948 = -(*spvDescriptorSet0.vp_c9)._m0[169].w;
    float _950 = (*spvDescriptorSet0.vp_c9)._m0[170].w + _948;
    float _952 = -(*spvDescriptorSet0.vp_c9)._m0[170].w;
    float _954 = _952 + (*spvDescriptorSet0.vp_c9)._m0[171].w;
    float _956 = -(*spvDescriptorSet0.vp_c9)._m0[171].w;
    float _958 = (*spvDescriptorSet0.vp_c9)._m0[172].w + _956;
    float _960 = -(*spvDescriptorSet0.vp_c9)._m0[172].w;
    float _962 = _960 + (*spvDescriptorSet0.vp_c9)._m0[173].w;
    bool _964 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[14].y;
    float _966 = 1.0 / _942;
    float _968 = _934 * _934;
    float _970 = -_876;
    float _972 = fma(_970, (*spvDescriptorSet0.vp_c9)._m0[18].w, _746);
    float _974 = fma(_938, _938, _968);
    float _976 = -(*spvDescriptorSet0.vp_c9)._m0[173].w;
    float _978 = (*spvDescriptorSet0.vp_c9)._m0[174].w + _976;
    float _980 = 1.0 / _946;
    if (!_964)
    {
        _528 = (*spvDescriptorSet0.vp_c7)._m0[0].x;
    }
    float _982 = _528;
    float _984 = 1.0 / _950;
    float _986 = 1.0 / _954;
    float _988 = 1.0 / _958;
    float _990 = 1.0 / _962;
    bool _992 = !_964;
    float _994 = _982;
    if (!_992)
    {
        float _996 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[14].y;
        float _998 = _454 * (*spvDescriptorSet0.vp_c9)._m0[15].y;
        float _1000 = fma(_998, (*spvDescriptorSet0.vp_c9)._m0[14].y, (*spvDescriptorSet0.vp_c7)._m0[0].x);
        float _1002 = _1000 * _996;
        float _1004 = floor(_1002);
        float _1006 = -_1004;
        float _1008 = _1002 + _1006;
        _994 = _1008;
    }
    float _1010 = _994;
    float _1012 = -(*spvDescriptorSet0.vp_c9)._m0[167].w;
    float _1014 = _1010 + _1012;
    float _1016 = fma(_972, _972, _974);
    float _1018 = -(*spvDescriptorSet0.vp_c9)._m0[168].w;
    float _1020 = _1010 + _1018;
    float _1022 = 1.0 / _978;
    float _1024 = _1014 * _966;
    float _1026 = -(*spvDescriptorSet0.vp_c9)._m0[169].w;
    float _1028 = _1010 + _1026;
    float _1030 = -(*spvDescriptorSet0.vp_c9)._m0[170].w;
    float _1032 = _1010 + _1030;
    float _1034 = _1020 * _980;
    bool _1036 = _1010 >= (*spvDescriptorSet0.vp_c9)._m0[171].w;
    bool _1038 = isnan(_1010);
    bool _1040 = _1036 || _1038;
    bool _1042 = isnan((*spvDescriptorSet0.vp_c9)._m0[171].w);
    bool _1044 = _1040 || _1042;
    float _1046 = float(_1044);
    float _1048 = _1028 * _984;
    float _1050 = _1032 * _986;
    float _1052 = -(*spvDescriptorSet0.vp_c9)._m0[172].w;
    float _1054 = _1010 + _1052;
    bool _1056 = _1010 >= (*spvDescriptorSet0.vp_c9)._m0[170].w;
    bool _1058 = isnan(_1010);
    bool _1060 = _1056 || _1058;
    bool _1062 = isnan((*spvDescriptorSet0.vp_c9)._m0[170].w);
    bool _1064 = _1060 || _1062;
    float _1066 = float(_1064);
    float _1068 = -(*spvDescriptorSet0.vp_c9)._m0[171].w;
    float _1070 = _1010 + _1068;
    bool _1072 = _1010 >= (*spvDescriptorSet0.vp_c9)._m0[169].w;
    bool _1074 = isnan(_1010);
    bool _1076 = _1072 || _1074;
    bool _1078 = isnan((*spvDescriptorSet0.vp_c9)._m0[169].w);
    bool _1080 = _1076 || _1078;
    float _1082 = float(_1080);
    float _1084 = _1054 * _990;
    float _1086 = -_1046;
    float _1088 = _1086 + 1.0;
    float _1090 = -_1066;
    float _1092 = _1090 + 1.0;
    float _1094 = _1070 * _988;
    bool _1096 = _1010 >= (*spvDescriptorSet0.vp_c9)._m0[168].w;
    bool _1098 = isnan(_1010);
    bool _1100 = _1096 || _1098;
    bool _1102 = isnan((*spvDescriptorSet0.vp_c9)._m0[168].w);
    bool _1104 = _1100 || _1102;
    float _1106 = float(_1104);
    float _1108 = -(*spvDescriptorSet0.vp_c9)._m0[173].w;
    float _1110 = _1010 + _1108;
    float _1112 = -_1082;
    float _1114 = _1112 + 1.0;
    float _1116 = _1082 * _1092;
    float _1118 = _1066 * _1088;
    float _1120 = _1110 * _1022;
    bool _1122 = _1010 >= (*spvDescriptorSet0.vp_c9)._m0[167].w;
    bool _1124 = isnan(_1010);
    bool _1126 = _1122 || _1124;
    bool _1128 = isnan((*spvDescriptorSet0.vp_c9)._m0[167].w);
    bool _1130 = _1126 || _1128;
    float _1132 = float(_1130);
    float _1134 = _1106 * _1114;
    float _1136 = -(*spvDescriptorSet0.vp_c9)._m0[167].x;
    float _1138 = (*spvDescriptorSet0.vp_c9)._m0[168].x + _1136;
    float _1140 = -_1106;
    float _1142 = _1140 + 1.0;
    bool _1144 = _1010 >= (*spvDescriptorSet0.vp_c9)._m0[172].w;
    bool _1146 = isnan(_1010);
    bool _1148 = _1144 || _1146;
    bool _1150 = isnan((*spvDescriptorSet0.vp_c9)._m0[172].w);
    bool _1152 = _1148 || _1150;
    float _1154 = float(_1152);
    float _1156 = -(*spvDescriptorSet0.vp_c9)._m0[168].x;
    float _1158 = _1156 + (*spvDescriptorSet0.vp_c9)._m0[169].x;
    float _1160 = fma(_1138, _1024, (*spvDescriptorSet0.vp_c9)._m0[167].x);
    float _1162 = _1132 * _1142;
    bool _1164 = _1010 >= (*spvDescriptorSet0.vp_c9)._m0[173].w;
    bool _1166 = isnan(_1010);
    bool _1168 = _1164 || _1166;
    bool _1170 = isnan((*spvDescriptorSet0.vp_c9)._m0[173].w);
    bool _1172 = _1168 || _1170;
    float _1174 = float(_1172);
    float _1176 = -_1132;
    float _1178 = _1176 + 1.0;
    float _1180 = _1160 * _1162;
    float _1182 = -_1154;
    float _1184 = _1182 + 1.0;
    float _1186 = -_1174;
    float _1188 = _1186 + 1.0;
    float _1190 = fma(_1158, _1034, (*spvDescriptorSet0.vp_c9)._m0[168].x);
    float _1192 = fma(_1178, (*spvDescriptorSet0.vp_c9)._m0[167].x, _1180);
    float _1194 = -(*spvDescriptorSet0.vp_c9)._m0[167].y;
    float _1196 = (*spvDescriptorSet0.vp_c9)._m0[168].y + _1194;
    float _1198 = _1046 * _1184;
    float _1200 = _1154 * _1188;
    float _1202 = fma(_1190, _1134, _1192);
    float _1204 = fma(_1196, _1024, (*spvDescriptorSet0.vp_c9)._m0[167].y);
    float _1206 = -(*spvDescriptorSet0.vp_c9)._m0[168].y;
    float _1208 = _1206 + (*spvDescriptorSet0.vp_c9)._m0[169].y;
    float _1210 = sqrt(_1016);
    float _1212 = _1204 * _1162;
    float _1214 = -(*spvDescriptorSet0.vp_c9)._m0[169].x;
    float _1216 = (*spvDescriptorSet0.vp_c9)._m0[170].x + _1214;
    float _1218 = fma(_1208, _1034, (*spvDescriptorSet0.vp_c9)._m0[168].y);
    float _1220 = -(*spvDescriptorSet0.vp_c9)._m0[170].x;
    float _1222 = _1220 + (*spvDescriptorSet0.vp_c9)._m0[171].x;
    float _1224 = fma(_1178, (*spvDescriptorSet0.vp_c9)._m0[167].y, _1212);
    float _1226 = fma(_1216, _1048, (*spvDescriptorSet0.vp_c9)._m0[169].x);
    float _1228 = -(*spvDescriptorSet0.vp_c9)._m0[169].y;
    float _1230 = (*spvDescriptorSet0.vp_c9)._m0[170].y + _1228;
    float _1232 = fma(_1222, _1050, (*spvDescriptorSet0.vp_c9)._m0[170].x);
    float _1234 = fma(_1218, _1134, _1224);
    float _1236 = fma(_1226, _1116, _1202);
    float _1238 = fma(_1230, _1048, (*spvDescriptorSet0.vp_c9)._m0[169].y);
    float _1240 = -(*spvDescriptorSet0.vp_c9)._m0[170].y;
    float _1242 = _1240 + (*spvDescriptorSet0.vp_c9)._m0[171].y;
    float _1244 = fma(_1238, _1116, _1234);
    float _1246 = fma(_1232, _1118, _1236);
    float _1248 = -(*spvDescriptorSet0.vp_c9)._m0[171].x;
    float _1250 = (*spvDescriptorSet0.vp_c9)._m0[172].x + _1248;
    float _1252 = fma(_1242, _1050, (*spvDescriptorSet0.vp_c9)._m0[170].y);
    bool _1254 = _1010 >= (*spvDescriptorSet0.vp_c9)._m0[174].w;
    bool _1256 = isnan(_1010);
    bool _1258 = _1254 || _1256;
    bool _1260 = isnan((*spvDescriptorSet0.vp_c9)._m0[174].w);
    bool _1262 = _1258 || _1260;
    float _1264 = float(_1262);
    float _1266 = _828 * _1210;
    float _1268 = fma(_1250, _1094, (*spvDescriptorSet0.vp_c9)._m0[171].x);
    float _1270 = -(*spvDescriptorSet0.vp_c9)._m0[171].y;
    float _1272 = (*spvDescriptorSet0.vp_c9)._m0[172].y + _1270;
    float _1274 = fma(_1252, _1118, _1244);
    float _1276 = -(*spvDescriptorSet0.vp_c9)._m0[172].x;
    float _1278 = _1276 + (*spvDescriptorSet0.vp_c9)._m0[173].x;
    float _1280 = fma(_1268, _1198, _1246);
    float _1282 = fma(_1272, _1094, (*spvDescriptorSet0.vp_c9)._m0[171].y);
    float _1284 = -(*spvDescriptorSet0.vp_c9)._m0[172].y;
    float _1286 = _1284 + (*spvDescriptorSet0.vp_c9)._m0[173].y;
    float _1288 = fma(_1278, _1084, (*spvDescriptorSet0.vp_c9)._m0[172].x);
    float _1290 = -_1264;
    float _1292 = _1290 + 1.0;
    float _1294 = fma(_1282, _1198, _1274);
    float _1296 = fma(_1286, _1084, (*spvDescriptorSet0.vp_c9)._m0[172].y);
    float _1298 = -(*spvDescriptorSet0.vp_c9)._m0[173].x;
    float _1300 = (*spvDescriptorSet0.vp_c9)._m0[174].x + _1298;
    float _1302 = fma(_1288, _1200, _1280);
    float _1304 = _1174 * _1292;
    float _1306 = fma(_1296, _1200, _1294);
    float _1308 = fma(_1300, _1120, (*spvDescriptorSet0.vp_c9)._m0[173].x);
    float _1310 = _426 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _1312 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _182);
    float _1314 = fma(_1308, _1304, _1302);
    float _1316 = _428 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _1318 = -(*spvDescriptorSet0.vp_c9)._m0[173].y;
    float _1320 = (*spvDescriptorSet0.vp_c9)._m0[174].y + _1318;
    float _1322 = _1266 * _1310;
    float _1324 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _172);
    float _1326 = fma(_1320, _1120, (*spvDescriptorSet0.vp_c9)._m0[173].y);
    float _1328 = _1266 * _1316;
    float _1330 = _1312 * _1322;
    float _1332 = -(*spvDescriptorSet0.vp_c10)._m0[8].w;
    float _1334 = _708 + _1332;
    float _1336 = (*spvDescriptorSet0.vp_c9)._m0[175].x * (*spvDescriptorSet0.vp_c10)._m0[8].z;
    float _1338 = fma(_1264, (*spvDescriptorSet0.vp_c9)._m0[174].x, _1314);
    float _1340 = fma(_1326, _1304, _1306);
    float _1342 = _1324 * _1328;
    float _1344 = _1330 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _1346 = _874 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _1348 = -_1336;
    float _1350 = fma(_1338, _1334, _1348);
    float _1352 = _1266 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _1354 = _1352 * 0.5;
    float _1356 = fma(_1342, (*spvDescriptorSet0.vp_c8)._m0[26].x, _1344);
    float _1358 = _1330 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _1360 = fma(_880, (*spvDescriptorSet0.vp_c8)._m0[11].x, _1346);
    float _1362 = -(*spvDescriptorSet0.vp_c10)._m0[10].w;
    float _1364 = _728 + _1362;
    float _1366 = (*spvDescriptorSet0.vp_c9)._m0[175].x * (*spvDescriptorSet0.vp_c10)._m0[10].z;
    float _1368 = fma(_1354, (*spvDescriptorSet0.vp_c8)._m0[26].z, _1356);
    float _1370 = fma(_1342, (*spvDescriptorSet0.vp_c8)._m0[24].x, _1358);
    float _1372 = fma(_888, (*spvDescriptorSet0.vp_c8)._m0[11].z, _1360);
    float _1374 = -_1366;
    float _1376 = fma(_1338, _1364, _1374);
    float _1378 = _1368 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _1380 = fma(_1264, (*spvDescriptorSet0.vp_c9)._m0[174].y, _1340);
    float _1382 = fma(_1354, (*spvDescriptorSet0.vp_c8)._m0[24].z, _1370);
    float _1384 = _874 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _1386 = _1372 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _1388 = fma(_1378, _1380, _1376);
    float _1390 = _1382 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _1392 = fma(_880, (*spvDescriptorSet0.vp_c8)._m0[10].x, _1384);
    float _1394 = 1.0 / _1386;
    float _1396 = _1388 + (*spvDescriptorSet0.vp_c10)._m0[10].w;
    float _1398 = fma(_1390, _1380, _1350);
    float _1400 = fma(_888, (*spvDescriptorSet0.vp_c8)._m0[10].z, _1392);
    float _1402 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1404 = _1396 + _1402;
    float _1406 = _1398 + (*spvDescriptorSet0.vp_c10)._m0[8].w;
    float _1408 = _1400 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _1410 = _1330 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _1412 = _1404 * _1404;
    float _1414 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1416 = _1406 + _1414;
    float _1418 = _1408 + _1386;
    float _1420 = fma(_1342, (*spvDescriptorSet0.vp_c8)._m0[25].x, _1410);
    float _1422 = -(*spvDescriptorSet0.vp_c10)._m0[9].w;
    float _1424 = _698 + _1422;
    float _1426 = fma(_1416, _1416, _1412);
    float _1428 = (*spvDescriptorSet0.vp_c9)._m0[175].x * (*spvDescriptorSet0.vp_c10)._m0[9].z;
    float _1430 = _1418 * _1394;
    float _1432 = _1430 * 0.5;
    float _1434 = fma(_1354, (*spvDescriptorSet0.vp_c8)._m0[25].z, _1420);
    float _1436 = sqrt(_1426);
    float _1438 = -_1428;
    float _1440 = fma(_1338, _1424, _1438);
    float _1442 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _1444 = fma(_1432, (*spvDescriptorSet0.vp_c8)._m0[30].w, _1442);
    float _1446 = _1434 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _1448 = fma(_1446, _1380, _1440);
    float _1450 = 1.0 / _1444;
    float _1452 = -(*spvDescriptorSet0.vp_c9)._m0[167].z;
    float _1454 = (*spvDescriptorSet0.vp_c9)._m0[168].z + _1452;
    float _1456 = _1448 + (*spvDescriptorSet0.vp_c10)._m0[9].w;
    float _1458 = -(*spvDescriptorSet0.vp_c9)._m0[169].z;
    float _1460 = (*spvDescriptorSet0.vp_c9)._m0[170].z + _1458;
    float _1462 = fma(_1454, _1024, (*spvDescriptorSet0.vp_c9)._m0[167].z);
    bool _1464 = _1436 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1466 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _1468 = _1450 * _1466;
    float _1470 = -(*spvDescriptorSet0.vp_c9)._m0[168].z;
    float _1472 = _1470 + (*spvDescriptorSet0.vp_c9)._m0[169].z;
    float _1474 = abs(_1468);
    float _1476 = log2(_1474);
    float _1478 = fma(_1472, _1034, (*spvDescriptorSet0.vp_c9)._m0[168].z);
    float _1480 = _1034;
    float _1482 = _1406;
    float _1484 = _1396;
    if (!_1464)
    {
        _1480 = _1456;
    }
    float _1486 = _1480;
    bool _1488 = !_1464;
    float _1490 = _1486;
    if (!_1488)
    {
        float _1492 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1494 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1496 = _1436 + _1494;
        float _1498 = rsqrt(_1426);
        float _1500 = _1496 * _1492;
        float _1502 = _1456 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1504 = _1500 * 0.15915493667125701904296875;
        float _1506 = _1504 * 6.283185482025146484375;
        float _1508 = cos(_1506);
        float _1510 = _1504 * 6.283185482025146484375;
        float _1512 = sin(_1510);
        float _1514 = _1508 + (-1.0);
        float _1516 = _1514 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1518 = fma(_1512, _1502, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1520 = fma(_1456, _1508, _1516);
        float _1522 = _1498 * _1518;
        float _1524 = fma(_1416, _1522, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1526 = fma(_1404, _1522, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _1490 = _1520;
        _1482 = _1524;
        _1484 = _1526;
    }
    float _1528 = _1490;
    float _1530 = _1482;
    float _1532 = _1484;
    float _1534 = -_698;
    float _1536 = _1534 + _1528;
    float _1538 = -_708;
    float _1540 = _1538 + _1530;
    float _1542 = fma(_1460, _1048, (*spvDescriptorSet0.vp_c9)._m0[169].z);
    float _1544 = _1476 * (*spvDescriptorSet0.vp_c15)._m0[654].z;
    float _1546 = _1536 * _1536;
    float _1548 = _1462 * _1162;
    float _1550 = -_728;
    float _1552 = _1550 + _1532;
    float _1554 = -(*spvDescriptorSet0.vp_c9)._m0[170].z;
    float _1556 = _1554 + (*spvDescriptorSet0.vp_c9)._m0[171].z;
    float _1558 = fma(_1540, _1540, _1546);
    float _1560 = fma(_1178, (*spvDescriptorSet0.vp_c9)._m0[167].z, _1548);
    float _1562 = exp2(_1544);
    float _1564 = fma(_1556, _1050, (*spvDescriptorSet0.vp_c9)._m0[170].z);
    float _1566 = fma(_1552, _1552, _1558);
    float _1568 = fma(_1478, _1134, _1560);
    float _1570 = _182 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    float _1572 = fma(_1542, _1116, _1568);
    float _1574 = sqrt(_1566);
    float _1576 = -(*spvDescriptorSet0.vp_c9)._m0[171].z;
    float _1578 = (*spvDescriptorSet0.vp_c9)._m0[172].z + _1576;
    bool _1580 = (*spvDescriptorSet0.vp_c15)._m0[660].y >= 0.5;
    bool _1582 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _1584 = _1580 || _1582;
    bool _1586 = isnan(0.5);
    bool _1588 = _1584 || _1586;
    float _1590 = fma(_1564, _1118, _1572);
    float _1592 = -(*spvDescriptorSet0.vp_c9)._m0[173].z;
    float _1594 = (*spvDescriptorSet0.vp_c9)._m0[174].z + _1592;
    float _1596 = fma(_1578, _1094, (*spvDescriptorSet0.vp_c9)._m0[171].z);
    float _1598 = -(*spvDescriptorSet0.vp_c9)._m0[172].z;
    float _1600 = _1598 + (*spvDescriptorSet0.vp_c9)._m0[173].z;
    out.m_55.x = _416;
    out.m_55.y = _412;
    out.m_55.z = _418;
    out.m_55.w = _424;
    float _1602 = fma(_1562, (*spvDescriptorSet0.vp_c15)._m0[654].x, (*spvDescriptorSet0.vp_c15)._m0[654].y);
    float _1604 = precise::clamp(_1602, 0.0, 1.0);
    float _1606 = fma(_1594, _1120, (*spvDescriptorSet0.vp_c9)._m0[173].z);
    float _1608 = fma(_1600, _1084, (*spvDescriptorSet0.vp_c9)._m0[172].z);
    float _1610 = fma(_1596, _1198, _1590);
    float _1612 = _172 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    bool _1614 = _1574 > 0.0;
    float _1616 = _1570 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _1618 = fma(_1608, _1200, _1610);
    float _1620 = fma(_1612, (*spvDescriptorSet0.vp_c8)._m0[24].x, _1616);
    float _1622 = fma(_1606, _1304, _1618);
    float _1624 = _1570 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _1626 = _1570 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _1628 = fma(_1604, -2.0, 3.0);
    float _1630 = _1604 * _1604;
    float _1632 = fma(_1612, (*spvDescriptorSet0.vp_c8)._m0[25].x, _1624);
    float _1634 = fma(_1612, (*spvDescriptorSet0.vp_c8)._m0[26].x, _1626);
    float _1636 = _1630 * _1628;
    bool _1638 = !_1614;
    float _1640 = _1530;
    float _1642 = _1528;
    float _1644 = _1532;
    float _1646 = _1634;
    float _1648 = _1632;
    if (!_1638)
    {
        float _1650 = _186 * _186;
        float _1652 = rsqrt(_1566);
        float _1654 = fma(_184, _184, _1650);
        float _1656 = fma(_188, _188, _1654);
        float _1658 = sqrt(_1656);
        float _1660 = _1540 * _1652;
        float _1662 = _1536 * _1652;
        float _1664 = _1552 * _1652;
        bool _1666 = _1658 > 0.0;
        bool _1668 = !_1666;
        if (!_1668)
        {
            float _1670 = rsqrt(_1656);
            float _1672 = 1.0 / (*spvDescriptorSet0.vp_c10)._m0[2].z;
            float _1674 = _186 * _1670;
            float _1676 = _184 * _1670;
            float _1678 = _1662 * _1674;
            float _1680 = _188 * _1670;
            float _1682 = fma(_1660, _1676, _1678);
            float _1684 = _1672 * (*spvDescriptorSet0.vp_c9)._m0[142].x;
            float _1686 = fma(_1664, _1680, _1682);
            float _1688 = _1686 * _1684;
            float _1690 = fma(_184, _1688, _1530);
            float _1692 = fma(_186, _1688, _1528);
            float _1694 = fma(_188, _1688, _1532);
            _1640 = _1690;
            _1642 = _1692;
            _1644 = _1694;
        }
    }
    float _1696 = _1640;
    float _1698 = _1642;
    float _1700 = _1644;
    float _1702 = -_870;
    float _1704 = fma(_1702, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1696);
    float _1706 = -_868;
    float _1708 = fma(_1706, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1698);
    float _1710 = -_876;
    float _1712 = fma(_1710, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1700);
    float _1714 = fma(_1264, (*spvDescriptorSet0.vp_c9)._m0[174].z, _1622);
    float _1716 = -_1636;
    float _1718 = _1716 + 1.0;
    float _1720 = _1708;
    float _1722 = _1704;
    float _1724 = _1712;
    if (!_1588)
    {
        float _1726 = _884 * _884;
        float _1728 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _1730 = -_728;
        float _1732 = _1730 + _1700;
        float _1734 = fma(_892, _892, _1726);
        float _1736 = fma(_898, _898, _1734);
        float _1738 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1740 = sqrt(_1736);
        float _1742 = 1.0 / _1266;
        float _1744 = _1738 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1746 = precise::min(_1740, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _1748 = _1746 * _1728;
        float _1750 = _1748 * _1742;
        float _1752 = -_708;
        float _1754 = _1752 + _1696;
        float _1756 = -_698;
        float _1758 = _1756 + _1698;
        float _1760 = _1744 * _1750;
        float _1762 = _1732 * _1750;
        float _1764 = fma(_1754, _1760, _880);
        float _1766 = fma(_1758, _1760, _874);
        float _1768 = fma(_1744, _1762, _888);
        _1720 = _1766;
        _1722 = _1764;
        _1724 = _1768;
    }
    float _1770 = _1720;
    float _1772 = _1722;
    float _1774 = _1724;
    float _1776 = _1770 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1778 = _1770 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1780 = fma(_1718, (*spvDescriptorSet0.vp_c15)._m0[654].w, _1636);
    float _1782 = _1770 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1784 = fma(_1772, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1776);
    float _1786 = fma(_1772, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1778);
    float _1788 = _1770 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1790 = fma(_1772, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1782);
    float _1792 = fma(_1774, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1784);
    float _1794 = fma(_1774, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1786);
    float _1796 = fma(_1772, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1788);
    float _1798 = fma(_1774, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1790);
    float _1800 = _1792 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1802 = _1794 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1804 = fma(_1774, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1796);
    float _1806 = _1798 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1808 = _1800 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1810 = _1800 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1812 = _1800 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _1814 = _1800 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1816 = fma(_1802, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1808);
    float _1818 = fma(_1802, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1810);
    float _1820 = fma(_1802, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1812);
    float _1822 = fma(_1802, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1814);
    float _1824 = fma(_1806, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1816);
    float _1826 = fma(_1806, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1818);
    float _1828 = fma(_1806, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1820);
    float _1830 = fma(_1806, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1822);
    float _1832 = _1804 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1834 = in.m_63.x;
    float _1836 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1838 = _1770 + _1836;
    bool _1840 = _1468 <= 8000.0;
    bool _1842 = isnan(_1468);
    bool _1844 = _1840 || _1842;
    bool _1846 = isnan(8000.0);
    bool _1848 = _1844 || _1846;
    float _1850 = float(_1848);
    float _1852 = fma(_1832, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1824);
    float _1854 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1856 = _1772 + _1854;
    float _1858 = _1838 * _1838;
    float _1860 = -_930;
    float _1862 = _1860 + 1.0;
    float _1864 = _1850 * _1780;
    out.m_61.x = _850;
    out.m_61.y = _852;
    out.m_61.z = _854;
    out.m_61.w = _866;
    float _1866 = fma(_1856, _1856, _1858);
    float _1868 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1870 = _1774 + _1868;
    float _1872 = _1864 * (*spvDescriptorSet0.vp_c15)._m0[653].x;
    float _1874 = fma(_1832, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1826);
    float _1876 = fma(_1832, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1828);
    float _1878 = fma(_1870, _1870, _1866);
    float _1880 = _1862 * _1872;
    float _1882 = precise::clamp(_1880, 0.0, 1.0);
    float _1884 = fma(_1832, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1830);
    float _1886 = _1620 + (*spvDescriptorSet0.vp_c8)._m0[24].z;
    float _1888 = _1634 + (*spvDescriptorSet0.vp_c8)._m0[26].z;
    float _1890 = -_1882;
    float _1892 = fma(_1890, (*spvDescriptorSet0.vp_c15)._m0[653].y, 1.0);
    float _1894 = _1632 + (*spvDescriptorSet0.vp_c8)._m0[25].z;
    float _1896 = sqrt(_1878);
    out.m_65.x = _1714;
    float _1898 = _1892 * _1834;
    out.gl_Position.x = _1852;
    out.gl_Position.y = _1874;
    out.gl_Position.z = _1876;
    out.gl_Position.w = _1884;
    float _1900 = _1898 * (*spvDescriptorSet0.vp_c13)._m0[1].w;
    out.m_67.x = _1886;
    out.m_67.y = _1894;
    out.m_67.z = _1888;
    out.m_69.x = _1900;
    bool _1902 = _1896 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _1904 = isnan(_1896);
    bool _1906 = _1902 || _1904;
    bool _1908 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _1910 = _1906 || _1908;
    float _1912 = _1826;
    float _1914 = _1878;
    if (!_1910)
    {
        _858 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _1916 = _858;
    float _1918 = _1916;
    float _1920 = _1916;
    if (!_1910)
    {
        _860 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _1922 = _860;
    float _1924 = _1922;
    float _1926 = _1922;
    if (!_1910)
    {
        _1912 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _1928 = _1912;
    float _1930 = _1928;
    float _1932 = _1928;
    if (!_1910)
    {
        _1646 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _1934 = _1646;
    float _1936 = _1934;
    float _1938 = _1934;
    if (!_1910)
    {
        _1648 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _1940 = _1648;
    float _1942 = _1940;
    float _1944 = _1940;
    if (!_1910)
    {
        _1914 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _1946 = _1914;
    bool _1948 = !_1910;
    float _1950 = _1946;
    float _1952 = _1946;
    if (!_1948)
    {
        bool _1954 = _1896 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _1956 = isnan(_1896);
        bool _1958 = _1954 || _1956;
        bool _1960 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _1962 = _1958 || _1960;
        if (!_1962)
        {
            float _1964 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _1966 = _1896 + _1964;
            float _1968 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _1970 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _1968;
            float _1972 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _1974 = _1972 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _1976 = 1.0 / _1970;
            float _1978 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _1980 = _1978 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _1982 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _1984 = _1982 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _1986 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _1988 = _1986 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _1990 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _1992 = _1990 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _1994 = _1966 * _1976;
            float _1996 = precise::clamp(_1994, 0.0, 1.0);
            float _1998 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _2000 = _1998 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _2002 = fma(_1996, _1974, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _2004 = fma(_1996, _2000, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _2006 = fma(_1996, _1980, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _2008 = fma(_1996, _1984, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _2010 = fma(_1996, _1988, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _2012 = fma(_1996, _1992, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            _1926 = _2002;
            _1944 = _2010;
            _1920 = _2006;
            _1938 = _2008;
            _1932 = _2004;
            _1952 = _2012;
            _2014 = true;
        }
        else
        {
            bool _2016 = _1896 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _2018 = isnan(_1896);
            bool _2020 = _2016 || _2018;
            bool _2022 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _2024 = _2020 || _2022;
            if (!_2024)
            {
                _1918 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _2026 = _1918;
            _1920 = _2026;
            if (!_2024)
            {
                _1924 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _2028 = _1924;
            _1926 = _2028;
            if (!_2024)
            {
                _1930 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _2030 = _1930;
            _1932 = _2030;
            if (!_2024)
            {
                _1936 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _2032 = _1936;
            _1938 = _2032;
            if (!_2024)
            {
                _1942 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _2034 = _1942;
            _1944 = _2034;
            if (!_2024)
            {
                _1950 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _2036 = _1950;
            bool _2038 = !_2024;
            _1952 = _2036;
            if (!_2038)
            {
                bool _2040 = _1896 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _2042 = isnan(_1896);
                bool _2044 = _2040 || _2042;
                bool _2046 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _2048 = _2044 || _2046;
                if (!_2048)
                {
                    float _2050 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2052 = _1896 + _2050;
                    float _2054 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2056 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _2054;
                    float _2058 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _2060 = _2058 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _2062 = 1.0 / _2056;
                    float _2064 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _2066 = _2064 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _2068 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _2070 = _2068 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _2072 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _2074 = _2072 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _2076 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _2078 = _2076 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _2080 = _2052 * _2062;
                    float _2082 = precise::clamp(_2080, 0.0, 1.0);
                    float _2084 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _2086 = _2084 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _2088 = fma(_2082, _2060, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _2090 = fma(_2082, _2086, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _2092 = fma(_2082, _2066, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _2094 = fma(_2082, _2070, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _2096 = fma(_2082, _2074, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _2098 = fma(_2082, _2078, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    _1926 = _2088;
                    _1944 = _2096;
                    _1920 = _2092;
                    _1938 = _2094;
                    _1932 = _2090;
                    _1952 = _2098;
                    _2014 = true;
                }
                else
                {
                    _1926 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _1944 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _1920 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _1938 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _1932 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _1952 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _2014 = false;
    float _2100 = _1926;
    float _2102 = _1944;
    float _2104 = _1920;
    float _2106 = _1938;
    float _2108 = _1932;
    float _2110 = _1952;
    float _2112 = fma(_1894, -0.5, 0.5);
    float _2114 = precise::clamp(_2112, 0.0, 1.0);
    float _2116 = -_2100;
    float _2118 = _2116 + _2102;
    float _2120 = -_2104;
    float _2122 = _2120 + _2106;
    float _2124 = -_2108;
    float _2126 = _2124 + _2110;
    bool _2128 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _2130 = fma(_2114, _2118, _2100);
    float _2132 = fma(_2114, _2122, _2104);
    float _2134 = fma(_2114, _2126, _2108);
    float _2136 = _2130 * 0.586610972881317138671875;
    out.m_71.x = 0.0;
    float _2138 = fma(_2132, 0.298911988735198974609375, _2136);
    float _2140 = (*spvDescriptorSet0.vp_c10)._m0[3].x * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    out.m_40.x = 1.0;
    float _2142 = fma(_2134, 0.114477999508380889892578125, _2138);
    float _2144 = -_2142;
    float _2146 = _2132 + _2144;
    float _2148 = -_2142;
    float _2150 = _2130 + _2148;
    float _2152 = -_2142;
    float _2154 = _2134 + _2152;
    out.m_69.w = _2140;
    float _2156 = fma(_2146, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2142);
    float _2158 = fma(_2150, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2142);
    float _2160 = fma(_2154, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2142);
    out.m_73.x = _2156;
    out.m_73.y = _2158;
    out.m_73.z = _2160;
    if (!_2128)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_55.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_55.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_55.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_55.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_61.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_61.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_61.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_61.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_44.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_44.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_44.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_44.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_59.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_59.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_59.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_59.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_73.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_73.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_73.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_73.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_40.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_40.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_40.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_40.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_57.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_57.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_57.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_57.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_67.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_67.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_67.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_67.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_65.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_65.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_65.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_65.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_71.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_71.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_71.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_71.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_69.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_69.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_69.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_69.w)); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _2162 = -_1770;
    float _2164 = _2162 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
    float _2166 = -_1772;
    float _2168 = _2166 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
    float _2170 = -_1774;
    float _2172 = _2170 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
    float _2174 = _2164 * _2164;
    float _2176 = fma(_2168, _2168, _2174);
    float _2178 = fma(_2172, _2172, _2176);
    float _2180 = sqrt(_2178);
    float _2182 = rsqrt(_2178);
    float _2184 = -_2180;
    float _2186 = _2184 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _2188 = _2186 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
    float _2190 = precise::clamp(_2188, 0.0, 1.0);
    float _2192 = _2168 * _2182;
    float _2194 = _2164 * _2182;
    float _2196 = abs(_2190);
    float _2198 = log2(_2196);
    float _2200 = _2172 * _2182;
    float _2202 = _2192 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
    float _2204 = _1894 * _2194;
    float _2206 = -_2194;
    float _2208 = -_2202;
    float _2210 = fma(_2206, (*spvDescriptorSet0.vp_c15)._m0[656].y, _2208);
    float _2212 = fma(_1886, _2192, _2204);
    float _2214 = -_2200;
    float _2216 = fma(_2214, (*spvDescriptorSet0.vp_c15)._m0[656].z, _2210);
    float _2218 = fma(_1888, _2200, _2212);
    float _2220 = precise::clamp(_2218, 0.0, 1.0);
    float _2222 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
    float _2224 = _2216 + _2222;
    float _2226 = _2198 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
    float _2228 = _2224 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
    float _2230 = precise::clamp(_2228, 0.0, 1.0);
    float _2232 = exp2(_2226);
    float _2234 = _2232 * _2230;
    float _2236 = _2220 * _2234;
    float _2238 = _2236 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
    float _2240 = _2236 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
    float _2242 = _2236 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
    out.m_71.x = _2238;
    out.m_71.y = _2240;
    out.m_71.z = _2242;
    { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_55.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_55.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_55.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_55.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_61.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_61.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_61.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_61.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_44.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_44.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_44.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_44.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_59.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_59.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_59.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_59.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_73.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_73.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_73.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_73.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_40.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_40.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_40.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_40.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_57.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_57.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_57.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_57.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_67.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_67.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_67.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_67.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_65.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_65.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_65.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_65.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_71.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_71.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_71.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_71.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_69.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_69.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_69.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_69.w)); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
}

