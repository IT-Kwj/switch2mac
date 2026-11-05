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
    float4 m_58 [[user(locn0)]];
    float4 m_54 [[user(locn1)]];
    float4 m_62 [[user(locn2)]];
    float4 m_45 [[user(locn3)]];
    float4 m_60 [[user(locn4)]];
    float4 m_64 [[user(locn6)]];
    float4 gl_Position [[position, invariant]];
    float gl_PointSize [[point_size]];
};

struct main0_in
{
    float4 m_42 [[attribute(2)]];
    float4 m_47 [[attribute(3)]];
    float4 m_52 [[attribute(4)]];
    float4 m_56 [[attribute(5)]];
};

vertex main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], uint gl_VertexIndex [[vertex_id]])
{
    main0_out out = {};
    out.m_58 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_54 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_62 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_45 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_60 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_64 = float4(0.0, 0.0, 0.0, 1.0);
    bool _265 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _78 = in.m_42.w;
    float _80 = trunc(_78);
    int _83 = int(_80);
    bool _87 = _83 >= 1;
    float _89 = 0.0;
    if (!_87)
    {
        _89 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _91 = _89;
    float _93 = _91;
    if (!_87)
    {
        out.m_45.x = 0.0;
    }
    int _95 = 0;
    if (!_87)
    {
        float _97 = _91 * 5.0;
        _95 = as_type<int>(_97);
    }
    int _99 = _95;
    int _101 = _99;
    if (!_87)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _1476 = as_type<float>(_99);
        out.gl_Position.z = _1476;
    }
    if (!_87)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _103 = in.m_47.w;
    bool _105 = _103 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _107 = isnan(_103);
    bool _109 = _105 || _107;
    bool _111 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _113 = _109 || _111;
    float _115 = -_103;
    float _117 = _115 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    if (_113)
    {
        float _119 = float(_83);
        _93 = _119;
    }
    float _121 = _93;
    bool _123 = _117 >= _121;
    bool _125 = !_113;
    bool _127 = _123 || _125;
    float _129 = _121;
    if (_127)
    {
        _129 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _131 = _129;
    if (_127)
    {
        out.m_45.x = 0.0;
    }
    if (_127)
    {
        float _133 = _131 * 5.0;
        _101 = as_type<int>(_133);
    }
    int _135 = _101;
    if (_127)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _1545 = as_type<float>(_135);
        out.gl_Position.z = _1545;
    }
    if (_127)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _137 = as_type<float>(int(gl_VertexIndex));
    float _139 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[19].z;
    float _141 = _117 + (*spvDescriptorSet0.vp_c9)._m0[20].z;
    float _143 = in.m_52.x;
    float _145 = _141 * _139;
    int _147 = as_type<int>(_137) & 1;
    bool _149 = _147 != 0;
    int _151 = as_type<int>(_137) & 2;
    bool _153 = _151 != 0;
    float _155 = fma(_143, (*spvDescriptorSet0.vp_c9)._m0[20].x, _145);
    bool _157 = !_153;
    float _159 = _157 ? (-0.5) : 0.5;
    int _161 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 2;
    bool _163 = _161 != 0;
    int _165 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 4;
    bool _167 = _165 != 0;
    float _169 = _155 * 6.283185482025146484375;
    float _171 = floor(_155);
    float _173 = _169 * 0.15915493667125701904296875;
    bool _175 = !_149;
    float _177 = _175 ? (-0.5) : 0.5;
    int _179 = 1 & as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x);
    bool _181 = _179 != 0;
    bool _183 = !_163;
    int _185 = _183 ? 0 : 1;
    float _187 = _173 * 6.283185482025146484375;
    float _189 = cos(_187);
    bool _191 = !_181;
    int _193 = _191 ? 0 : 1;
    int _195 = abs(_185);
    int _197 = abs(_193);
    float _199 = -_171;
    float _201 = _155 + _199;
    float _203 = float(_195);
    float _205 = -_201;
    float _207 = fma(_205, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    bool _209 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    bool _211 = !_167;
    int _213 = _211 ? 0 : 1;
    float _215 = fma(_189, 0.5, 0.5);
    float _217 = abs(_207);
    float _219 = _203 * _217;
    bool _221 = _201 < 0.5;
    float _223 = float(_221);
    int _225 = abs(_213);
    float _227 = -_215;
    float _229 = fma(_227, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    float _231 = float(_197);
    float _233 = -_223;
    float _235 = fma(_233, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    float _237 = float(_225);
    float _239 = fma(_231, _229, _219);
    float _241 = abs(_235);
    float _243 = fma(_237, _241, _239);
    bool _245 = !_209;
    float _247 = 0.5;
    float _263;
    if (!_245)
    {
        float _249 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _251 = _143 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _253 = fma(_251, (*spvDescriptorSet0.vp_c9)._m0[12].x, _117);
        float _255 = _253 * _249;
        float _257 = floor(_255);
        float _259 = -_257;
        float _261 = _255 + _259;
        _263 = _261;
        _265 = true;
    }
    else
    {
        float _267 = float(_83);
        float _269 = 1.0 / _267;
        float _271 = _117 * _269;
        _263 = _271;
    }
    _265 = false;
    float _273 = _263;
    float _275 = float(as_type<int>((*spvDescriptorSet0.vp_c9)._m0[8].x));
    float _277 = in.m_52.y;
    float _279 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _281 = _275 * _143;
    float _283 = float(as_type<int>((*spvDescriptorSet0.vp_c9)._m0[8].z));
    float _285 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _287 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _285;
    float _289 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _291 = (*spvDescriptorSet0.vp_c9)._m0[146].w + _289;
    float _293 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _295 = _293 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _297 = _283 * _143;
    float _299 = trunc(_281);
    int _301 = int(_299);
    float _303 = in.m_42.x;
    float _305 = in.m_42.y;
    float _307 = in.m_42.z;
    int _309 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _311 = _309 != 0;
    int _313 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _315 = _313 != 0;
    bool _317 = _143 > 0.5;
    float _319 = trunc(_297);
    int _321 = int(_319);
    bool _323 = _277 > 0.5;
    float _325 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _327 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _325;
    float _329 = 1.0 / _287;
    int _331 = _301 << 4;
    int _333 = _331 + 1712;
    int _335 = _321 << 4;
    int _337 = _335 + 1968;
    float _339 = _305 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _341 = _305 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _343 = _305 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _345 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _347 = _273 + _345;
    float _349 = 1.0 / _291;
    uint _352 = uint(int(uint(_333) >> uint(2)));
    uint _354 = uint(int(uint(int(_352)) >> uint(2)));
    int _356 = int(_352) & 3;
    float _358 = (*spvDescriptorSet0.vp_c9)._m0[int(_354)][_356];
    int _360 = int(_352) + 1;
    uint _362 = uint(int(uint(_360) >> uint(2)));
    int _364 = _360 & 3;
    float _366 = (*spvDescriptorSet0.vp_c9)._m0[int(_362)][_364];
    float _368 = fma(_303, (*spvDescriptorSet0.vp_c10)._m0[4].x, _339);
    float _370 = _347 * _329;
    float _372 = fma(_303, (*spvDescriptorSet0.vp_c10)._m0[5].x, _341);
    float _374 = fma(_303, (*spvDescriptorSet0.vp_c10)._m0[6].x, _343);
    float _376 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _378 = _273 + _376;
    float _380 = fma(_327, _370, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _382 = 1.0 / _295;
    uint _384 = uint(int(uint(_337) >> uint(2)));
    uint _386 = uint(int(uint(int(_384)) >> uint(2)));
    int _388 = int(_384) & 3;
    float _390 = (*spvDescriptorSet0.vp_c9)._m0[int(_386)][_388];
    int _392 = int(_384) + 1;
    uint _394 = uint(int(uint(_392) >> uint(2)));
    int _396 = _392 & 3;
    float _398 = (*spvDescriptorSet0.vp_c9)._m0[int(_394)][_396];
    float _400 = fma(_307, (*spvDescriptorSet0.vp_c10)._m0[6].z, _374);
    float _402 = _400 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _404 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    int _406 = _337 + 8;
    uint _408 = uint(int(uint(_406) >> uint(2)));
    uint _410 = uint(int(uint(int(_408)) >> uint(2)));
    int _412 = int(_408) & 3;
    float _414 = (*spvDescriptorSet0.vp_c9)._m0[int(_410)][_412];
    float _416 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _418 = _273 + _416;
    float _420 = _418 * _349;
    float _422 = fma(_307, (*spvDescriptorSet0.vp_c10)._m0[5].z, _372);
    float _424 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _426 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _424;
    int _428 = _333 + 8;
    uint _430 = uint(int(uint(_428) >> uint(2)));
    uint _432 = uint(int(uint(int(_430)) >> uint(2)));
    int _434 = int(_430) & 3;
    float _436 = (*spvDescriptorSet0.vp_c9)._m0[int(_432)][_434];
    float _438 = fma(_307, (*spvDescriptorSet0.vp_c10)._m0[4].z, _368);
    float _440 = _422 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _442 = fma(_426, _370, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _444 = _378 * _382;
    float _446 = _438 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _448 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _450 = _440 + _448;
    float _452 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _454 = _452 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _456 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _458 = _402 + _456;
    float _460 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _462 = _446 + _460;
    float _464 = _450 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _466 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _468 = _466 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _470 = fma(_454, _444, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _472 = fma(_462, (*spvDescriptorSet0.vp_c8)._m0[28].x, _464);
    float _474 = fma(_468, _444, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _476 = _450 * _450;
    float _478 = fma(_458, (*spvDescriptorSet0.vp_c8)._m0[28].z, _472);
    float _480 = -_159;
    int _482 = _323 ? as_type<int>(_480) : as_type<int>(_159);
    float _484 = -(*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _486 = (*spvDescriptorSet0.vp_c9)._m0[146].x + _484;
    float _488 = -(*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _490 = (*spvDescriptorSet0.vp_c9)._m0[146].y + _488;
    float _492 = fma(_462, _462, _476);
    bool _494 = _478 >= 0.0;
    float _496 = _358 * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _498 = -_177;
    int _500 = _317 ? as_type<int>(_498) : as_type<int>(_177);
    float _502 = fma(_486, _420, (*spvDescriptorSet0.vp_c9)._m0[145].x);
    bool _504 = !_315;
    float _506 = _504 ? _159 : as_type<float>(_482);
    float _508 = fma(_490, _420, (*spvDescriptorSet0.vp_c9)._m0[145].y);
    bool _510 = !_311;
    float _512 = _510 ? _177 : as_type<float>(_500);
    float _514 = _366 * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _516 = _398 * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _518 = _390 * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _520 = -_506;
    float _522 = _520 + 0.5;
    float _524 = _512 + 0.5;
    float _526 = (*spvDescriptorSet0.vp_c9)._m0[115].x * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _528 = 0.0;
    float _530 = _446;
    if (_494)
    {
        _528 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _532 = _528;
    float _534 = (*spvDescriptorSet0.vp_c9)._m0[131].x * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    float _536 = _414 * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _538 = _514 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _540 = _516 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _542 = _524 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _544 = _522 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    bool _546 = _273 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _548 = isnan(_273);
    bool _550 = _546 || _548;
    bool _552 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _554 = _550 || _552;
    float _556 = float(_554);
    if (_494)
    {
        out.m_45.x = 0.0;
    }
    float _558 = _542 * _279;
    float _560 = _436 * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _562 = _496 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _564 = _518 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _566 = _536 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _568 = fma(_458, _458, _492);
    float _570 = _560 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    bool _572 = _273 >= (*spvDescriptorSet0.vp_c9)._m0[146].w;
    bool _574 = isnan(_273);
    bool _576 = _572 || _574;
    bool _578 = isnan((*spvDescriptorSet0.vp_c9)._m0[146].w);
    bool _580 = _576 || _578;
    float _582 = float(_580);
    float _584 = _544 * _404;
    out.m_54.x = _564;
    out.m_54.y = _540;
    out.m_54.z = _566;
    out.m_54.w = _534;
    float _586 = rsqrt(_568);
    float _588 = -_582;
    float _590 = _588 + 1.0;
    float _592 = in.m_56.x;
    float _594 = in.m_56.y;
    float _596 = _556 * _590;
    out.m_58.x = _562;
    out.m_58.y = _538;
    out.m_58.z = _570;
    out.m_58.w = _526;
    out.m_60.x = _558;
    out.m_60.y = _584;
    float _598 = -_556;
    float _600 = _598 + 1.0;
    bool _602 = _273 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _604 = isnan(_273);
    bool _606 = _602 || _604;
    bool _608 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _610 = _606 || _608;
    float _612 = float(_610);
    float _614 = _462 * _586;
    int _616 = as_type<int>(_570);
    if (_494)
    {
        float _618 = _532 * 5.0;
        _616 = as_type<int>(_618);
    }
    int _620 = _616;
    bool _622 = _273 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _624 = isnan(_273);
    bool _626 = _622 || _624;
    bool _628 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _630 = _626 || _628;
    float _632 = float(_630);
    float _634 = _450 * _586;
    if (_494)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2372 = as_type<float>(_620);
        out.gl_Position.z = _2372;
    }
    float _636 = _632 * _600;
    float _638 = -_632;
    float _640 = _638 + 1.0;
    if (_494)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _642 = -_634;
    float _644 = fma(_642, (*spvDescriptorSet0.vp_c9)._m0[18].w, _440);
    float _646 = _612 * _640;
    float _648 = _458 * _586;
    float _650 = -_614;
    float _652 = fma(_650, (*spvDescriptorSet0.vp_c9)._m0[18].w, _446);
    float _654 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _656 = _644 + _654;
    float _658 = -_612;
    float _660 = _658 + 1.0;
    float _662 = -_648;
    float _664 = fma(_662, (*spvDescriptorSet0.vp_c9)._m0[18].w, _402);
    float _666 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _668 = _652 + _666;
    float _670 = _656 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _672 = -_634;
    float _674 = fma(_672, (*spvDescriptorSet0.vp_c9)._m0[18].w, _450);
    float _676 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _678 = _664 + _676;
    float _680 = -_614;
    float _682 = fma(_680, (*spvDescriptorSet0.vp_c9)._m0[18].w, _462);
    float _684 = fma(_668, (*spvDescriptorSet0.vp_c8)._m0[28].x, _670);
    float _686 = _380 * _646;
    float _688 = _442 * _646;
    float _690 = _674 * _674;
    float _692 = fma(_678, (*spvDescriptorSet0.vp_c8)._m0[28].z, _684);
    float _694 = fma(_660, (*spvDescriptorSet0.vp_c9)._m0[143].x, _686);
    float _696 = fma(_660, (*spvDescriptorSet0.vp_c9)._m0[143].y, _688);
    float _698 = fma(_682, _682, _690);
    float _700 = -_648;
    float _702 = fma(_700, (*spvDescriptorSet0.vp_c9)._m0[18].w, _458);
    bool _704 = _692 >= 0.0;
    float _706 = fma(_470, _636, _694);
    float _708 = fma(_474, _636, _696);
    float _710 = fma(_702, _702, _698);
    float _712 = fma(_502, _596, _706);
    float _714 = fma(_508, _596, _708);
    float _716 = sqrt(_710);
    float _718 = fma(_582, (*spvDescriptorSet0.vp_c9)._m0[146].x, _712);
    float _720 = fma(_582, (*spvDescriptorSet0.vp_c9)._m0[146].y, _714);
    float _722 = _698;
    float _724 = _668;
    float _726 = _664;
    if (_704)
    {
        _722 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _728 = _722;
    float _730 = _718 * _592;
    float _732 = _720 * _594;
    int _734 = as_type<int>(_728);
    if (_704)
    {
        out.m_45.x = 0.0;
    }
    if (_704)
    {
        float _736 = _728 * 5.0;
        _734 = as_type<int>(_736);
    }
    int _738 = _734;
    float _740 = _243 * _730;
    float _742 = _243 * _732;
    if (_704)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2567 = as_type<float>(_738);
        out.gl_Position.z = _2567;
    }
    float _744 = _586 * _716;
    if (_704)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _746 = _742 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _748 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _159);
    float _750 = _740 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _752 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _177);
    float _754 = _744 * _746;
    float _756 = _744 * _750;
    float _758 = _744 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _760 = _758 * 0.5;
    float _762 = _748 * _754;
    bool _764 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[660].y;
    bool _766 = isnan(0.5);
    bool _768 = _764 || _766;
    bool _770 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _772 = _768 || _770;
    float _774 = _752 * _756;
    float _776 = _762 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _778 = _762 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _780 = fma(_774, (*spvDescriptorSet0.vp_c8)._m0[26].x, _776);
    float _782 = fma(_774, (*spvDescriptorSet0.vp_c8)._m0[24].x, _778);
    float _784 = fma(_760, (*spvDescriptorSet0.vp_c8)._m0[26].z, _780);
    float _786 = fma(_760, (*spvDescriptorSet0.vp_c8)._m0[24].z, _782);
    float _788 = _784 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _790 = _786 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _792 = _402 + _788;
    float _794 = _446 + _790;
    float _796 = _762 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _798 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _800 = _792 + _798;
    float _802 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _804 = _794 + _802;
    float _806 = fma(_774, (*spvDescriptorSet0.vp_c8)._m0[25].x, _796);
    float _808 = _800 * _800;
    float _810 = fma(_760, (*spvDescriptorSet0.vp_c8)._m0[25].z, _806);
    float _812 = fma(_804, _804, _808);
    float _814 = _810 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _816 = sqrt(_812);
    float _818 = _440 + _814;
    bool _820 = _816 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _822 = _796;
    float _824 = _762;
    float _826 = _794;
    float _828 = _812;
    if (!_820)
    {
        _822 = _792;
    }
    float _830 = _822;
    float _832 = _830;
    if (!_820)
    {
        _824 = _818;
    }
    float _834 = _824;
    bool _836 = !_820;
    float _838 = _834;
    if (!_836)
    {
        float _840 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _842 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _844 = _816 + _842;
        float _846 = rsqrt(_812);
        float _848 = _844 * _840;
        float _850 = _818 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _852 = _848 * 0.15915493667125701904296875;
        float _854 = _852 * 6.283185482025146484375;
        float _856 = cos(_854);
        float _858 = _852 * 6.283185482025146484375;
        float _860 = sin(_858);
        float _862 = _856 + (-1.0);
        float _864 = fma(_860, _850, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _866 = _862 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _868 = _846 * _864;
        float _870 = fma(_818, _856, _866);
        float _872 = fma(_804, _868, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _874 = fma(_800, _868, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _826 = _872;
        _838 = _870;
        _832 = _874;
    }
    float _876 = _826;
    float _878 = _838;
    float _880 = _832;
    float _882 = -_614;
    float _884 = fma(_882, (*spvDescriptorSet0.vp_c9)._m0[18].w, _876);
    float _886 = -_634;
    float _888 = fma(_886, (*spvDescriptorSet0.vp_c9)._m0[18].w, _878);
    float _890 = -_648;
    float _892 = fma(_890, (*spvDescriptorSet0.vp_c9)._m0[18].w, _880);
    float _894 = _888;
    float _896 = _884;
    float _898 = _892;
    if (!_772)
    {
        float _900 = _656 * _656;
        float _902 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _904 = -_440;
        float _906 = _904 + _878;
        float _908 = fma(_668, _668, _900);
        float _910 = fma(_678, _678, _908);
        float _912 = 1.0 / _744;
        float _914 = sqrt(_910);
        float _916 = precise::min(_914, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _918 = _916 * _902;
        float _920 = -_446;
        float _922 = _920 + _876;
        float _924 = _918 * _912;
        float _926 = -_402;
        float _928 = _926 + _880;
        float _930 = fma(_922, _924, _652);
        float _932 = fma(_906, _924, _644);
        float _934 = fma(_928, _924, _664);
        _894 = _932;
        _896 = _930;
        _898 = _934;
        _724 = _914;
    }
    float _936 = _894;
    float _938 = _896;
    float _940 = _898;
    float _942 = _724;
    float _944 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _946 = _936 + _944;
    float _948 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _950 = _938 + _948;
    float _952 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _954 = _940 + _952;
    float _956 = _946 * _946;
    float _958 = fma(_950, _950, _956);
    float _960 = fma(_954, _954, _958);
    float _962 = rsqrt(_960);
    float _964 = _962 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _966 = _950 * _964;
    float _968 = _954 * _964;
    float _970 = _966 * _966;
    float _972 = _968 * _968;
    float _974 = _970 + _972;
    float _976 = sqrt(_974);
    bool _978 = _976 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _980 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _982 = _976 + _980;
    float _984 = _954;
    float _986 = _974;
    float _988 = _982;
    float _990 = _946;
    float _992 = _966;
    float _994 = _942;
    if (_978)
    {
        float _996 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _984 = _996;
    }
    float _998 = _984;
    if (_978)
    {
        float _1000 = rsqrt(_974);
        _986 = _1000;
    }
    float _1002 = _986;
    if (_978)
    {
        float _1004 = _982 * _998;
        _988 = _1004;
    }
    float _1006 = _988;
    if (_978)
    {
        float _1008 = _1006 * 0.15915493667125701904296875;
        _530 = _1008;
    }
    float _1010 = _530;
    float _1012 = _998;
    float _1014 = _1010;
    if (_978)
    {
        float _1016 = _1010 * 6.283185482025146484375;
        float _1018 = sin(_1016);
        _1012 = _1018;
    }
    float _1020 = _1012;
    float _1022 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _1024 = precise::max(0.0, _1022);
    float _1026 = _962;
    float _1028 = _1024;
    if (_978)
    {
        float _1030 = _1010 * 6.283185482025146484375;
        float _1032 = cos(_1030);
        _1026 = _1032;
    }
    float _1034 = _1026;
    float _1036 = -_964;
    float _1038 = -_1024;
    float _1040 = fma(_946, _1036, _1038);
    if (!_978)
    {
        _990 = _968;
    }
    float _1042 = _990;
    float _1044 = _1042;
    if (_978)
    {
        float _1046 = _1040 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1028 = _1046;
    }
    float _1048 = _1028;
    float _1050 = _1020;
    float _1052 = _1048;
    if (_978)
    {
        float _1054 = fma(_1020, _1048, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1050 = _1054;
    }
    float _1056 = _1050;
    float _1058 = _1056;
    float _1060 = _1034;
    if (_978)
    {
        float _1062 = _1034 + (-1.0);
        _1052 = _1062;
    }
    float _1064 = _1052;
    float _1066 = _1064;
    if (_978)
    {
        float _1068 = _1002 * _1056;
        _828 = _1068;
    }
    float _1070 = _828;
    if (!_978)
    {
        _1058 = _1040;
    }
    float _1072 = _1058;
    float _1074 = sqrt(_960);
    float _1076 = _1072;
    if (_978)
    {
        float _1078 = _1064 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1014 = _1078;
    }
    float _1080 = _1014;
    if (_978)
    {
        float _1082 = _966 * _1070;
        _992 = _1082;
    }
    float _1084 = _992;
    if (!_978)
    {
        _1066 = _970;
    }
    float _1086 = _1066;
    float _1088 = _1086;
    if (_978)
    {
        float _1090 = _968 * _1070;
        _1044 = _1090;
    }
    float _1092 = _1044;
    if (_978)
    {
        float _1094 = fma(_1040, _1034, _1080);
        _1076 = _1094;
    }
    float _1096 = _1076;
    if (_978)
    {
        float _1098 = _1084 * _1084;
        _1088 = _1098;
    }
    float _1100 = _1088;
    if (!_978)
    {
        _1060 = _972;
    }
    float _1102 = _1060;
    float _1104 = _1102;
    if (_978)
    {
        float _1106 = _1092 * _1092;
        _1104 = _1106;
    }
    float _1108 = _1104;
    float _1110 = fma(_1096, _1096, _1100);
    float _1112 = _936 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1114 = _1110 + _1108;
    float _1116 = fma(_938, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1112);
    float _1118 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _1120 = fma(_1074, (*spvDescriptorSet0.vp_c15)._m0[23].w, _1118);
    float _1122 = precise::clamp(_1120, 0.0, 1.0);
    float _1124 = _936 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1126 = rsqrt(_1114);
    float _1128 = fma(_940, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1116);
    float _1130 = -_1122;
    float _1132 = _1130 + 1.0;
    float _1134 = _936 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1136 = fma(_938, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1124);
    float _1138 = _1128 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1140 = _936 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1142 = fma(_938, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1134);
    float _1144 = abs(_1132);
    float _1146 = log2(_1144);
    float _1148 = fma(_940, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1136);
    float _1150 = fma(_938, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1140);
    float _1152 = fma(_940, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1142);
    float _1154 = (-1.0) + (*spvDescriptorSet0.vp_c15)._m0[20].x;
    float _1156 = _1148 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1158 = _1138 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _1160 = _1152 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1162 = _1126 * _1084;
    float _1164 = _1156 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1166 = _1126 * _1096;
    float _1168 = fma(_940, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1150);
    float _1170 = _1162 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _1172 = fma(_1160, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1164);
    float _1174 = _1126 * _1092;
    float _1176 = -_1158;
    float _1178 = fma(_1176, _1154, 1.0);
    float _1180 = -_1170;
    float _1182 = fma(_1166, (*spvDescriptorSet0.vp_c15)._m0[21].y, _1180);
    float _1184 = _1146 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _1186 = _1168 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1188 = fma(_1138, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1172);
    float _1190 = -_1174;
    float _1192 = fma(_1190, (*spvDescriptorSet0.vp_c15)._m0[21].z, _1182);
    float _1194 = exp2(_1184);
    float _1196 = _1156 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1198 = fma(_1186, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1188);
    float _1200 = fma(_1192, -0.5, 0.5);
    float _1202 = _1156 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1204 = fma(_1192, 0.5, 0.5);
    float _1206 = fma(_1160, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1196);
    float _1208 = _1166 + 1.0;
    float _1210 = log2(_1178);
    float _1212 = fma(_1160, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1202);
    float _1214 = fma(_1204, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _1216 = fma(_1138, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1206);
    float _1218 = fma(_1138, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1212);
    float _1220 = fma(_1204, _1214, -0.212114393711090087890625);
    float _1222 = fma(_1186, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1216);
    float _1224 = 1.0 / _1198;
    float _1226 = -_1166;
    float _1228 = fma(_1194, _1208, _1226);
    float _1230 = fma(_1186, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1218);
    float _1232 = fma(_1204, _1220, 1.570728778839111328125);
    float _1234 = fma(_1228, 0.5, 0.5);
    float _1236 = sqrt(_1200);
    float _1238 = _1210 * 0.693147182464599609375;
    float _1240 = _1238 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _1242 = _1222 * _1224;
    float _1244 = _1230 * _1224;
    float _1246 = fma(_1242, 0.5, 0.5);
    float _1248 = fma(_1244, -0.5, 0.5);
    float _1250 = _1236 * 0.636619746685028076171875;
    float3 _3405 = float3(_1246, _1248, _1240);
    float _1252 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_3405, float3(0.0), isnan(_3405)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_3405, float3(0.0), isnan(_3405)), level(0.0)).x;
    float3 _3416 = float3(_1246, _1248, _1240);
    float4 _1255 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_3416, float3(0.0), isnan(_3416)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_3416, float3(0.0), isnan(_3416)), level(0.0)).xyzw;
    float _1257 = _1255.x;
    float _1259 = _1255.y;
    float _1261 = _1255.z;
    float _1263 = _1255.w;
    float _1265 = -_1232;
    float _1267 = fma(_1250, _1265, 1.0);
    float2 _3438 = float2(_1267, _1234);
    float3 _1271 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_3438, float2(0.0), isnan(_3438)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_3438, float2(0.0), isnan(_3438)), level(0.0)).xyz;
    float _1273 = _1271.x;
    float _1275 = _1271.y;
    float _1277 = _1271.z;
    float _1279 = _644 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _1281 = _644 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    bool _1283 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[653].w;
    bool _1285 = isnan(0.5);
    bool _1287 = _1283 || _1285;
    bool _1289 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _1291 = _1287 || _1289;
    float _1293 = fma(_652, (*spvDescriptorSet0.vp_c8)._m0[11].x, _1279);
    float _1295 = fma(_652, (*spvDescriptorSet0.vp_c8)._m0[10].x, _1281);
    float _1297 = fma(_664, (*spvDescriptorSet0.vp_c8)._m0[11].z, _1293);
    float _1299 = fma(_664, (*spvDescriptorSet0.vp_c8)._m0[10].z, _1295);
    float _1301 = _1297 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _1303 = _1299 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _1305 = _1297;
    float _1307 = _1248;
    if (!_1291)
    {
        _726 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _1309 = _726;
    float _1311 = 1.0 / _1301;
    float _1313 = _1303 + _1301;
    if (!_1291)
    {
        _994 = (*spvDescriptorSet0.vp_c9)._m0[140].x;
    }
    float _1315 = _994;
    if (!_1291)
    {
        float _1317 = -_1315;
        float _1319 = _1317 + (*spvDescriptorSet0.vp_c9)._m0[140].y;
        _1305 = _1319;
    }
    float _1321 = _1305;
    float _1323 = _1146 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _1325 = exp2(_1323);
    float _1327 = _1313 * _1311;
    float _1329 = _1327 * 0.5;
    float _1331 = _1156 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _1333 = _1329;
    float _1335 = _1331;
    if (!_1291)
    {
        float _1337 = -_1309;
        float _1339 = fma(_1329, (*spvDescriptorSet0.vp_c8)._m0[30].w, _1337);
        _1333 = _1339;
    }
    float _1341 = _1333;
    float _1343 = fma(_1160, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1331);
    if (_1291)
    {
        _1335 = 1.0;
    }
    float _1345 = _1335;
    float _1347 = _1345;
    if (!_1291)
    {
        float _1349 = 1.0 / _1321;
        _1307 = _1349;
    }
    float _1351 = _1307;
    float _1353 = fma(_1138, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1343);
    float _1355 = fma(_1186, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1353);
    float _1357 = _1341;
    if (!_1291)
    {
        float _1359 = 1.0 / _1341;
        _1357 = _1359;
    }
    float _1361 = _1357;
    float _1363 = -_1325;
    float _1365 = _1363 + 1.0;
    float _1367 = _1355 + _1198;
    float _1369 = _1365 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    if (!_1291)
    {
        float _1371 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
        float _1373 = -_1315;
        float _1375 = fma(_1361, _1371, _1373);
        _247 = _1375;
    }
    float _1377 = _247;
    float _1379 = _1367 * 0.5;
    if (!_1291)
    {
        float _1381 = _1377 * _1351;
        float _1383 = precise::clamp(_1381, 0.0, 1.0);
        _1347 = _1383;
    }
    float _1385 = _1347;
    out.m_62.z = _1379;
    out.m_62.w = _1198;
    float _1387 = _1385 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    bool _1389 = _1385 > 0.0;
    bool _1391 = isnan(_1385);
    bool _1393 = _1389 || _1391;
    bool _1395 = isnan(0.0);
    bool _1397 = _1393 || _1395;
    out.gl_Position.x = _1222;
    out.gl_Position.y = _1230;
    out.gl_Position.z = _1355;
    out.gl_Position.w = _1198;
    float _1399 = _1387 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    out.m_45.x = _1399;
    float _1401 = _1369 * _1252;
    float _1403 = -_1369;
    float _1405 = _1403 + 1.0;
    float _1407 = _1263 * _1401;
    float _1409 = _1263 * _1405;
    float _1411 = _1277 * _1401;
    float _1413 = fma(_1273, _1407, _1257);
    float _1415 = fma(_1275, _1407, _1259);
    float _1417 = fma(_1263, _1411, _1261);
    out.m_64.x = _1413;
    out.m_64.y = _1415;
    out.m_64.z = _1417;
    out.m_64.w = _1409;
    if (_1397)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    out.m_45.x = 0.0;
    float _1419 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _1419;
    out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
}


vertex main0_out main0_z(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], uint gl_VertexIndex [[vertex_id]])
{
    main0_out out = {};
    out.m_58 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_54 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_62 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_45 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_60 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_64 = float4(0.0, 0.0, 0.0, 1.0);
    bool _265 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _78 = in.m_42.w;
    float _80 = trunc(_78);
    int _83 = int(_80);
    bool _87 = _83 >= 1;
    float _89 = 0.0;
    if (!_87)
    {
        _89 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _91 = _89;
    float _93 = _91;
    if (!_87)
    {
        out.m_45.x = 0.0;
    }
    int _95 = 0;
    if (!_87)
    {
        float _97 = _91 * 5.0;
        _95 = as_type<int>(_97);
    }
    int _99 = _95;
    int _101 = _99;
    if (!_87)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _1476 = as_type<float>(_99);
        out.gl_Position.z = _1476;
    }
    if (!_87)
    {
        return out;
    }
    float _103 = in.m_47.w;
    bool _105 = _103 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _107 = isnan(_103);
    bool _109 = _105 || _107;
    bool _111 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _113 = _109 || _111;
    float _115 = -_103;
    float _117 = _115 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    if (_113)
    {
        float _119 = float(_83);
        _93 = _119;
    }
    float _121 = _93;
    bool _123 = _117 >= _121;
    bool _125 = !_113;
    bool _127 = _123 || _125;
    float _129 = _121;
    if (_127)
    {
        _129 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _131 = _129;
    if (_127)
    {
        out.m_45.x = 0.0;
    }
    if (_127)
    {
        float _133 = _131 * 5.0;
        _101 = as_type<int>(_133);
    }
    int _135 = _101;
    if (_127)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _1545 = as_type<float>(_135);
        out.gl_Position.z = _1545;
    }
    if (_127)
    {
        return out;
    }
    float _137 = as_type<float>(int(gl_VertexIndex));
    float _139 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[19].z;
    float _141 = _117 + (*spvDescriptorSet0.vp_c9)._m0[20].z;
    float _143 = in.m_52.x;
    float _145 = _141 * _139;
    int _147 = as_type<int>(_137) & 1;
    bool _149 = _147 != 0;
    int _151 = as_type<int>(_137) & 2;
    bool _153 = _151 != 0;
    float _155 = fma(_143, (*spvDescriptorSet0.vp_c9)._m0[20].x, _145);
    bool _157 = !_153;
    float _159 = _157 ? (-0.5) : 0.5;
    int _161 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 2;
    bool _163 = _161 != 0;
    int _165 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 4;
    bool _167 = _165 != 0;
    float _169 = _155 * 6.283185482025146484375;
    float _171 = floor(_155);
    float _173 = _169 * 0.15915493667125701904296875;
    bool _175 = !_149;
    float _177 = _175 ? (-0.5) : 0.5;
    int _179 = 1 & as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x);
    bool _181 = _179 != 0;
    bool _183 = !_163;
    int _185 = _183 ? 0 : 1;
    float _187 = _173 * 6.283185482025146484375;
    float _189 = cos(_187);
    bool _191 = !_181;
    int _193 = _191 ? 0 : 1;
    int _195 = abs(_185);
    int _197 = abs(_193);
    float _199 = -_171;
    float _201 = _155 + _199;
    float _203 = float(_195);
    float _205 = -_201;
    float _207 = fma(_205, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    bool _209 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    bool _211 = !_167;
    int _213 = _211 ? 0 : 1;
    float _215 = fma(_189, 0.5, 0.5);
    float _217 = abs(_207);
    float _219 = _203 * _217;
    bool _221 = _201 < 0.5;
    float _223 = float(_221);
    int _225 = abs(_213);
    float _227 = -_215;
    float _229 = fma(_227, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    float _231 = float(_197);
    float _233 = -_223;
    float _235 = fma(_233, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    float _237 = float(_225);
    float _239 = fma(_231, _229, _219);
    float _241 = abs(_235);
    float _243 = fma(_237, _241, _239);
    bool _245 = !_209;
    float _247 = 0.5;
    float _263;
    if (!_245)
    {
        float _249 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _251 = _143 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _253 = fma(_251, (*spvDescriptorSet0.vp_c9)._m0[12].x, _117);
        float _255 = _253 * _249;
        float _257 = floor(_255);
        float _259 = -_257;
        float _261 = _255 + _259;
        _263 = _261;
        _265 = true;
    }
    else
    {
        float _267 = float(_83);
        float _269 = 1.0 / _267;
        float _271 = _117 * _269;
        _263 = _271;
    }
    _265 = false;
    float _273 = _263;
    float _275 = float(as_type<int>((*spvDescriptorSet0.vp_c9)._m0[8].x));
    float _277 = in.m_52.y;
    float _279 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _281 = _275 * _143;
    float _283 = float(as_type<int>((*spvDescriptorSet0.vp_c9)._m0[8].z));
    float _285 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _287 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _285;
    float _289 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _291 = (*spvDescriptorSet0.vp_c9)._m0[146].w + _289;
    float _293 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _295 = _293 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _297 = _283 * _143;
    float _299 = trunc(_281);
    int _301 = int(_299);
    float _303 = in.m_42.x;
    float _305 = in.m_42.y;
    float _307 = in.m_42.z;
    int _309 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _311 = _309 != 0;
    int _313 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _315 = _313 != 0;
    bool _317 = _143 > 0.5;
    float _319 = trunc(_297);
    int _321 = int(_319);
    bool _323 = _277 > 0.5;
    float _325 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _327 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _325;
    float _329 = 1.0 / _287;
    int _331 = _301 << 4;
    int _333 = _331 + 1712;
    int _335 = _321 << 4;
    int _337 = _335 + 1968;
    float _339 = _305 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _341 = _305 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _343 = _305 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _345 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _347 = _273 + _345;
    float _349 = 1.0 / _291;
    uint _352 = uint(int(uint(_333) >> uint(2)));
    uint _354 = uint(int(uint(int(_352)) >> uint(2)));
    int _356 = int(_352) & 3;
    float _358 = (*spvDescriptorSet0.vp_c9)._m0[int(_354)][_356];
    int _360 = int(_352) + 1;
    uint _362 = uint(int(uint(_360) >> uint(2)));
    int _364 = _360 & 3;
    float _366 = (*spvDescriptorSet0.vp_c9)._m0[int(_362)][_364];
    float _368 = fma(_303, (*spvDescriptorSet0.vp_c10)._m0[4].x, _339);
    float _370 = _347 * _329;
    float _372 = fma(_303, (*spvDescriptorSet0.vp_c10)._m0[5].x, _341);
    float _374 = fma(_303, (*spvDescriptorSet0.vp_c10)._m0[6].x, _343);
    float _376 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _378 = _273 + _376;
    float _380 = fma(_327, _370, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _382 = 1.0 / _295;
    uint _384 = uint(int(uint(_337) >> uint(2)));
    uint _386 = uint(int(uint(int(_384)) >> uint(2)));
    int _388 = int(_384) & 3;
    float _390 = (*spvDescriptorSet0.vp_c9)._m0[int(_386)][_388];
    int _392 = int(_384) + 1;
    uint _394 = uint(int(uint(_392) >> uint(2)));
    int _396 = _392 & 3;
    float _398 = (*spvDescriptorSet0.vp_c9)._m0[int(_394)][_396];
    float _400 = fma(_307, (*spvDescriptorSet0.vp_c10)._m0[6].z, _374);
    float _402 = _400 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _404 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    int _406 = _337 + 8;
    uint _408 = uint(int(uint(_406) >> uint(2)));
    uint _410 = uint(int(uint(int(_408)) >> uint(2)));
    int _412 = int(_408) & 3;
    float _414 = (*spvDescriptorSet0.vp_c9)._m0[int(_410)][_412];
    float _416 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _418 = _273 + _416;
    float _420 = _418 * _349;
    float _422 = fma(_307, (*spvDescriptorSet0.vp_c10)._m0[5].z, _372);
    float _424 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _426 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _424;
    int _428 = _333 + 8;
    uint _430 = uint(int(uint(_428) >> uint(2)));
    uint _432 = uint(int(uint(int(_430)) >> uint(2)));
    int _434 = int(_430) & 3;
    float _436 = (*spvDescriptorSet0.vp_c9)._m0[int(_432)][_434];
    float _438 = fma(_307, (*spvDescriptorSet0.vp_c10)._m0[4].z, _368);
    float _440 = _422 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _442 = fma(_426, _370, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _444 = _378 * _382;
    float _446 = _438 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _448 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _450 = _440 + _448;
    float _452 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _454 = _452 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _456 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _458 = _402 + _456;
    float _460 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _462 = _446 + _460;
    float _464 = _450 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _466 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _468 = _466 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _470 = fma(_454, _444, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _472 = fma(_462, (*spvDescriptorSet0.vp_c8)._m0[28].x, _464);
    float _474 = fma(_468, _444, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _476 = _450 * _450;
    float _478 = fma(_458, (*spvDescriptorSet0.vp_c8)._m0[28].z, _472);
    float _480 = -_159;
    int _482 = _323 ? as_type<int>(_480) : as_type<int>(_159);
    float _484 = -(*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _486 = (*spvDescriptorSet0.vp_c9)._m0[146].x + _484;
    float _488 = -(*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _490 = (*spvDescriptorSet0.vp_c9)._m0[146].y + _488;
    float _492 = fma(_462, _462, _476);
    bool _494 = _478 >= 0.0;
    float _496 = _358 * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _498 = -_177;
    int _500 = _317 ? as_type<int>(_498) : as_type<int>(_177);
    float _502 = fma(_486, _420, (*spvDescriptorSet0.vp_c9)._m0[145].x);
    bool _504 = !_315;
    float _506 = _504 ? _159 : as_type<float>(_482);
    float _508 = fma(_490, _420, (*spvDescriptorSet0.vp_c9)._m0[145].y);
    bool _510 = !_311;
    float _512 = _510 ? _177 : as_type<float>(_500);
    float _514 = _366 * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _516 = _398 * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _518 = _390 * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _520 = -_506;
    float _522 = _520 + 0.5;
    float _524 = _512 + 0.5;
    float _526 = (*spvDescriptorSet0.vp_c9)._m0[115].x * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _528 = 0.0;
    float _530 = _446;
    if (_494)
    {
        _528 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _532 = _528;
    float _534 = (*spvDescriptorSet0.vp_c9)._m0[131].x * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    float _536 = _414 * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _538 = _514 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _540 = _516 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _542 = _524 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _544 = _522 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    bool _546 = _273 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _548 = isnan(_273);
    bool _550 = _546 || _548;
    bool _552 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _554 = _550 || _552;
    float _556 = float(_554);
    if (_494)
    {
        out.m_45.x = 0.0;
    }
    float _558 = _542 * _279;
    float _560 = _436 * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _562 = _496 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _564 = _518 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _566 = _536 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _568 = fma(_458, _458, _492);
    float _570 = _560 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    bool _572 = _273 >= (*spvDescriptorSet0.vp_c9)._m0[146].w;
    bool _574 = isnan(_273);
    bool _576 = _572 || _574;
    bool _578 = isnan((*spvDescriptorSet0.vp_c9)._m0[146].w);
    bool _580 = _576 || _578;
    float _582 = float(_580);
    float _584 = _544 * _404;
    out.m_54.x = _564;
    out.m_54.y = _540;
    out.m_54.z = _566;
    out.m_54.w = _534;
    float _586 = rsqrt(_568);
    float _588 = -_582;
    float _590 = _588 + 1.0;
    float _592 = in.m_56.x;
    float _594 = in.m_56.y;
    float _596 = _556 * _590;
    out.m_58.x = _562;
    out.m_58.y = _538;
    out.m_58.z = _570;
    out.m_58.w = _526;
    out.m_60.x = _558;
    out.m_60.y = _584;
    float _598 = -_556;
    float _600 = _598 + 1.0;
    bool _602 = _273 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _604 = isnan(_273);
    bool _606 = _602 || _604;
    bool _608 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _610 = _606 || _608;
    float _612 = float(_610);
    float _614 = _462 * _586;
    int _616 = as_type<int>(_570);
    if (_494)
    {
        float _618 = _532 * 5.0;
        _616 = as_type<int>(_618);
    }
    int _620 = _616;
    bool _622 = _273 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _624 = isnan(_273);
    bool _626 = _622 || _624;
    bool _628 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _630 = _626 || _628;
    float _632 = float(_630);
    float _634 = _450 * _586;
    if (_494)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2372 = as_type<float>(_620);
        out.gl_Position.z = _2372;
    }
    float _636 = _632 * _600;
    float _638 = -_632;
    float _640 = _638 + 1.0;
    if (_494)
    {
        return out;
    }
    float _642 = -_634;
    float _644 = fma(_642, (*spvDescriptorSet0.vp_c9)._m0[18].w, _440);
    float _646 = _612 * _640;
    float _648 = _458 * _586;
    float _650 = -_614;
    float _652 = fma(_650, (*spvDescriptorSet0.vp_c9)._m0[18].w, _446);
    float _654 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _656 = _644 + _654;
    float _658 = -_612;
    float _660 = _658 + 1.0;
    float _662 = -_648;
    float _664 = fma(_662, (*spvDescriptorSet0.vp_c9)._m0[18].w, _402);
    float _666 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _668 = _652 + _666;
    float _670 = _656 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _672 = -_634;
    float _674 = fma(_672, (*spvDescriptorSet0.vp_c9)._m0[18].w, _450);
    float _676 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _678 = _664 + _676;
    float _680 = -_614;
    float _682 = fma(_680, (*spvDescriptorSet0.vp_c9)._m0[18].w, _462);
    float _684 = fma(_668, (*spvDescriptorSet0.vp_c8)._m0[28].x, _670);
    float _686 = _380 * _646;
    float _688 = _442 * _646;
    float _690 = _674 * _674;
    float _692 = fma(_678, (*spvDescriptorSet0.vp_c8)._m0[28].z, _684);
    float _694 = fma(_660, (*spvDescriptorSet0.vp_c9)._m0[143].x, _686);
    float _696 = fma(_660, (*spvDescriptorSet0.vp_c9)._m0[143].y, _688);
    float _698 = fma(_682, _682, _690);
    float _700 = -_648;
    float _702 = fma(_700, (*spvDescriptorSet0.vp_c9)._m0[18].w, _458);
    bool _704 = _692 >= 0.0;
    float _706 = fma(_470, _636, _694);
    float _708 = fma(_474, _636, _696);
    float _710 = fma(_702, _702, _698);
    float _712 = fma(_502, _596, _706);
    float _714 = fma(_508, _596, _708);
    float _716 = sqrt(_710);
    float _718 = fma(_582, (*spvDescriptorSet0.vp_c9)._m0[146].x, _712);
    float _720 = fma(_582, (*spvDescriptorSet0.vp_c9)._m0[146].y, _714);
    float _722 = _698;
    float _724 = _668;
    float _726 = _664;
    if (_704)
    {
        _722 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _728 = _722;
    float _730 = _718 * _592;
    float _732 = _720 * _594;
    int _734 = as_type<int>(_728);
    if (_704)
    {
        out.m_45.x = 0.0;
    }
    if (_704)
    {
        float _736 = _728 * 5.0;
        _734 = as_type<int>(_736);
    }
    int _738 = _734;
    float _740 = _243 * _730;
    float _742 = _243 * _732;
    if (_704)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2567 = as_type<float>(_738);
        out.gl_Position.z = _2567;
    }
    float _744 = _586 * _716;
    if (_704)
    {
        return out;
    }
    float _746 = _742 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _748 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _159);
    float _750 = _740 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _752 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _177);
    float _754 = _744 * _746;
    float _756 = _744 * _750;
    float _758 = _744 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _760 = _758 * 0.5;
    float _762 = _748 * _754;
    bool _764 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[660].y;
    bool _766 = isnan(0.5);
    bool _768 = _764 || _766;
    bool _770 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _772 = _768 || _770;
    float _774 = _752 * _756;
    float _776 = _762 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _778 = _762 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _780 = fma(_774, (*spvDescriptorSet0.vp_c8)._m0[26].x, _776);
    float _782 = fma(_774, (*spvDescriptorSet0.vp_c8)._m0[24].x, _778);
    float _784 = fma(_760, (*spvDescriptorSet0.vp_c8)._m0[26].z, _780);
    float _786 = fma(_760, (*spvDescriptorSet0.vp_c8)._m0[24].z, _782);
    float _788 = _784 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _790 = _786 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _792 = _402 + _788;
    float _794 = _446 + _790;
    float _796 = _762 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _798 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _800 = _792 + _798;
    float _802 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _804 = _794 + _802;
    float _806 = fma(_774, (*spvDescriptorSet0.vp_c8)._m0[25].x, _796);
    float _808 = _800 * _800;
    float _810 = fma(_760, (*spvDescriptorSet0.vp_c8)._m0[25].z, _806);
    float _812 = fma(_804, _804, _808);
    float _814 = _810 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _816 = sqrt(_812);
    float _818 = _440 + _814;
    bool _820 = _816 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _822 = _796;
    float _824 = _762;
    float _826 = _794;
    float _828 = _812;
    if (!_820)
    {
        _822 = _792;
    }
    float _830 = _822;
    float _832 = _830;
    if (!_820)
    {
        _824 = _818;
    }
    float _834 = _824;
    bool _836 = !_820;
    float _838 = _834;
    if (!_836)
    {
        float _840 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _842 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _844 = _816 + _842;
        float _846 = rsqrt(_812);
        float _848 = _844 * _840;
        float _850 = _818 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _852 = _848 * 0.15915493667125701904296875;
        float _854 = _852 * 6.283185482025146484375;
        float _856 = cos(_854);
        float _858 = _852 * 6.283185482025146484375;
        float _860 = sin(_858);
        float _862 = _856 + (-1.0);
        float _864 = fma(_860, _850, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _866 = _862 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _868 = _846 * _864;
        float _870 = fma(_818, _856, _866);
        float _872 = fma(_804, _868, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _874 = fma(_800, _868, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _826 = _872;
        _838 = _870;
        _832 = _874;
    }
    float _876 = _826;
    float _878 = _838;
    float _880 = _832;
    float _882 = -_614;
    float _884 = fma(_882, (*spvDescriptorSet0.vp_c9)._m0[18].w, _876);
    float _886 = -_634;
    float _888 = fma(_886, (*spvDescriptorSet0.vp_c9)._m0[18].w, _878);
    float _890 = -_648;
    float _892 = fma(_890, (*spvDescriptorSet0.vp_c9)._m0[18].w, _880);
    float _894 = _888;
    float _896 = _884;
    float _898 = _892;
    if (!_772)
    {
        float _900 = _656 * _656;
        float _902 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _904 = -_440;
        float _906 = _904 + _878;
        float _908 = fma(_668, _668, _900);
        float _910 = fma(_678, _678, _908);
        float _912 = 1.0 / _744;
        float _914 = sqrt(_910);
        float _916 = precise::min(_914, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _918 = _916 * _902;
        float _920 = -_446;
        float _922 = _920 + _876;
        float _924 = _918 * _912;
        float _926 = -_402;
        float _928 = _926 + _880;
        float _930 = fma(_922, _924, _652);
        float _932 = fma(_906, _924, _644);
        float _934 = fma(_928, _924, _664);
        _894 = _932;
        _896 = _930;
        _898 = _934;
        _724 = _914;
    }
    float _936 = _894;
    float _938 = _896;
    float _940 = _898;
    float _942 = _724;
    float _944 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _946 = _936 + _944;
    float _948 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _950 = _938 + _948;
    float _952 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _954 = _940 + _952;
    float _956 = _946 * _946;
    float _958 = fma(_950, _950, _956);
    float _960 = fma(_954, _954, _958);
    float _962 = rsqrt(_960);
    float _964 = _962 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _966 = _950 * _964;
    float _968 = _954 * _964;
    float _970 = _966 * _966;
    float _972 = _968 * _968;
    float _974 = _970 + _972;
    float _976 = sqrt(_974);
    bool _978 = _976 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _980 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _982 = _976 + _980;
    float _984 = _954;
    float _986 = _974;
    float _988 = _982;
    float _990 = _946;
    float _992 = _966;
    float _994 = _942;
    if (_978)
    {
        float _996 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _984 = _996;
    }
    float _998 = _984;
    if (_978)
    {
        float _1000 = rsqrt(_974);
        _986 = _1000;
    }
    float _1002 = _986;
    if (_978)
    {
        float _1004 = _982 * _998;
        _988 = _1004;
    }
    float _1006 = _988;
    if (_978)
    {
        float _1008 = _1006 * 0.15915493667125701904296875;
        _530 = _1008;
    }
    float _1010 = _530;
    float _1012 = _998;
    float _1014 = _1010;
    if (_978)
    {
        float _1016 = _1010 * 6.283185482025146484375;
        float _1018 = sin(_1016);
        _1012 = _1018;
    }
    float _1020 = _1012;
    float _1022 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _1024 = precise::max(0.0, _1022);
    float _1026 = _962;
    float _1028 = _1024;
    if (_978)
    {
        float _1030 = _1010 * 6.283185482025146484375;
        float _1032 = cos(_1030);
        _1026 = _1032;
    }
    float _1034 = _1026;
    float _1036 = -_964;
    float _1038 = -_1024;
    float _1040 = fma(_946, _1036, _1038);
    if (!_978)
    {
        _990 = _968;
    }
    float _1042 = _990;
    float _1044 = _1042;
    if (_978)
    {
        float _1046 = _1040 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1028 = _1046;
    }
    float _1048 = _1028;
    float _1050 = _1020;
    float _1052 = _1048;
    if (_978)
    {
        float _1054 = fma(_1020, _1048, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1050 = _1054;
    }
    float _1056 = _1050;
    float _1058 = _1056;
    float _1060 = _1034;
    if (_978)
    {
        float _1062 = _1034 + (-1.0);
        _1052 = _1062;
    }
    float _1064 = _1052;
    float _1066 = _1064;
    if (_978)
    {
        float _1068 = _1002 * _1056;
        _828 = _1068;
    }
    float _1070 = _828;
    if (!_978)
    {
        _1058 = _1040;
    }
    float _1072 = _1058;
    float _1074 = sqrt(_960);
    float _1076 = _1072;
    if (_978)
    {
        float _1078 = _1064 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1014 = _1078;
    }
    float _1080 = _1014;
    if (_978)
    {
        float _1082 = _966 * _1070;
        _992 = _1082;
    }
    float _1084 = _992;
    if (!_978)
    {
        _1066 = _970;
    }
    float _1086 = _1066;
    float _1088 = _1086;
    if (_978)
    {
        float _1090 = _968 * _1070;
        _1044 = _1090;
    }
    float _1092 = _1044;
    if (_978)
    {
        float _1094 = fma(_1040, _1034, _1080);
        _1076 = _1094;
    }
    float _1096 = _1076;
    if (_978)
    {
        float _1098 = _1084 * _1084;
        _1088 = _1098;
    }
    float _1100 = _1088;
    if (!_978)
    {
        _1060 = _972;
    }
    float _1102 = _1060;
    float _1104 = _1102;
    if (_978)
    {
        float _1106 = _1092 * _1092;
        _1104 = _1106;
    }
    float _1108 = _1104;
    float _1110 = fma(_1096, _1096, _1100);
    float _1112 = _936 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1114 = _1110 + _1108;
    float _1116 = fma(_938, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1112);
    float _1118 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _1120 = fma(_1074, (*spvDescriptorSet0.vp_c15)._m0[23].w, _1118);
    float _1122 = precise::clamp(_1120, 0.0, 1.0);
    float _1124 = _936 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1126 = rsqrt(_1114);
    float _1128 = fma(_940, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1116);
    float _1130 = -_1122;
    float _1132 = _1130 + 1.0;
    float _1134 = _936 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1136 = fma(_938, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1124);
    float _1138 = _1128 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1140 = _936 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1142 = fma(_938, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1134);
    float _1144 = abs(_1132);
    float _1146 = log2(_1144);
    float _1148 = fma(_940, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1136);
    float _1150 = fma(_938, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1140);
    float _1152 = fma(_940, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1142);
    float _1154 = (-1.0) + (*spvDescriptorSet0.vp_c15)._m0[20].x;
    float _1156 = _1148 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1158 = _1138 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _1160 = _1152 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1162 = _1126 * _1084;
    float _1164 = _1156 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1166 = _1126 * _1096;
    float _1168 = fma(_940, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1150);
    float _1170 = _1162 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _1172 = fma(_1160, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1164);
    float _1174 = _1126 * _1092;
    float _1176 = -_1158;
    float _1178 = fma(_1176, _1154, 1.0);
    float _1180 = -_1170;
    float _1182 = fma(_1166, (*spvDescriptorSet0.vp_c15)._m0[21].y, _1180);
    float _1184 = _1146 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _1186 = _1168 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1188 = fma(_1138, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1172);
    float _1190 = -_1174;
    float _1192 = fma(_1190, (*spvDescriptorSet0.vp_c15)._m0[21].z, _1182);
    float _1194 = exp2(_1184);
    float _1196 = _1156 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1198 = fma(_1186, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1188);
    float _1200 = fma(_1192, -0.5, 0.5);
    float _1202 = _1156 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1204 = fma(_1192, 0.5, 0.5);
    float _1206 = fma(_1160, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1196);
    float _1208 = _1166 + 1.0;
    float _1210 = log2(_1178);
    float _1212 = fma(_1160, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1202);
    float _1214 = fma(_1204, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _1216 = fma(_1138, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1206);
    float _1218 = fma(_1138, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1212);
    float _1220 = fma(_1204, _1214, -0.212114393711090087890625);
    float _1222 = fma(_1186, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1216);
    float _1224 = 1.0 / _1198;
    float _1226 = -_1166;
    float _1228 = fma(_1194, _1208, _1226);
    float _1230 = fma(_1186, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1218);
    float _1232 = fma(_1204, _1220, 1.570728778839111328125);
    float _1234 = fma(_1228, 0.5, 0.5);
    float _1236 = sqrt(_1200);
    float _1238 = _1210 * 0.693147182464599609375;
    float _1240 = _1238 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _1242 = _1222 * _1224;
    float _1244 = _1230 * _1224;
    float _1246 = fma(_1242, 0.5, 0.5);
    float _1248 = fma(_1244, -0.5, 0.5);
    float _1250 = _1236 * 0.636619746685028076171875;
    float3 _3405 = float3(_1246, _1248, _1240);
    float _1252 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_3405, float3(0.0), isnan(_3405)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_3405, float3(0.0), isnan(_3405)), level(0.0)).x;
    float3 _3416 = float3(_1246, _1248, _1240);
    float4 _1255 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_3416, float3(0.0), isnan(_3416)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_3416, float3(0.0), isnan(_3416)), level(0.0)).xyzw;
    float _1257 = _1255.x;
    float _1259 = _1255.y;
    float _1261 = _1255.z;
    float _1263 = _1255.w;
    float _1265 = -_1232;
    float _1267 = fma(_1250, _1265, 1.0);
    float2 _3438 = float2(_1267, _1234);
    float3 _1271 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_3438, float2(0.0), isnan(_3438)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_3438, float2(0.0), isnan(_3438)), level(0.0)).xyz;
    float _1273 = _1271.x;
    float _1275 = _1271.y;
    float _1277 = _1271.z;
    float _1279 = _644 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _1281 = _644 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    bool _1283 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[653].w;
    bool _1285 = isnan(0.5);
    bool _1287 = _1283 || _1285;
    bool _1289 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _1291 = _1287 || _1289;
    float _1293 = fma(_652, (*spvDescriptorSet0.vp_c8)._m0[11].x, _1279);
    float _1295 = fma(_652, (*spvDescriptorSet0.vp_c8)._m0[10].x, _1281);
    float _1297 = fma(_664, (*spvDescriptorSet0.vp_c8)._m0[11].z, _1293);
    float _1299 = fma(_664, (*spvDescriptorSet0.vp_c8)._m0[10].z, _1295);
    float _1301 = _1297 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _1303 = _1299 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _1305 = _1297;
    float _1307 = _1248;
    if (!_1291)
    {
        _726 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _1309 = _726;
    float _1311 = 1.0 / _1301;
    float _1313 = _1303 + _1301;
    if (!_1291)
    {
        _994 = (*spvDescriptorSet0.vp_c9)._m0[140].x;
    }
    float _1315 = _994;
    if (!_1291)
    {
        float _1317 = -_1315;
        float _1319 = _1317 + (*spvDescriptorSet0.vp_c9)._m0[140].y;
        _1305 = _1319;
    }
    float _1321 = _1305;
    float _1323 = _1146 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _1325 = exp2(_1323);
    float _1327 = _1313 * _1311;
    float _1329 = _1327 * 0.5;
    float _1331 = _1156 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _1333 = _1329;
    float _1335 = _1331;
    if (!_1291)
    {
        float _1337 = -_1309;
        float _1339 = fma(_1329, (*spvDescriptorSet0.vp_c8)._m0[30].w, _1337);
        _1333 = _1339;
    }
    float _1341 = _1333;
    float _1343 = fma(_1160, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1331);
    if (_1291)
    {
        _1335 = 1.0;
    }
    float _1345 = _1335;
    float _1347 = _1345;
    if (!_1291)
    {
        float _1349 = 1.0 / _1321;
        _1307 = _1349;
    }
    float _1351 = _1307;
    float _1353 = fma(_1138, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1343);
    float _1355 = fma(_1186, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1353);
    float _1357 = _1341;
    if (!_1291)
    {
        float _1359 = 1.0 / _1341;
        _1357 = _1359;
    }
    float _1361 = _1357;
    float _1363 = -_1325;
    float _1365 = _1363 + 1.0;
    float _1367 = _1355 + _1198;
    float _1369 = _1365 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    if (!_1291)
    {
        float _1371 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
        float _1373 = -_1315;
        float _1375 = fma(_1361, _1371, _1373);
        _247 = _1375;
    }
    float _1377 = _247;
    float _1379 = _1367 * 0.5;
    if (!_1291)
    {
        float _1381 = _1377 * _1351;
        float _1383 = precise::clamp(_1381, 0.0, 1.0);
        _1347 = _1383;
    }
    float _1385 = _1347;
    out.m_62.z = _1379;
    out.m_62.w = _1198;
    float _1387 = _1385 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    bool _1389 = _1385 > 0.0;
    bool _1391 = isnan(_1385);
    bool _1393 = _1389 || _1391;
    bool _1395 = isnan(0.0);
    bool _1397 = _1393 || _1395;
    out.gl_Position.x = _1222;
    out.gl_Position.y = _1230;
    out.gl_Position.z = _1355;
    out.gl_Position.w = _1198;
    float _1399 = _1387 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    out.m_45.x = _1399;
    float _1401 = _1369 * _1252;
    float _1403 = -_1369;
    float _1405 = _1403 + 1.0;
    float _1407 = _1263 * _1401;
    float _1409 = _1263 * _1405;
    float _1411 = _1277 * _1401;
    float _1413 = fma(_1273, _1407, _1257);
    float _1415 = fma(_1275, _1407, _1259);
    float _1417 = fma(_1263, _1411, _1261);
    out.m_64.x = _1413;
    out.m_64.y = _1415;
    out.m_64.z = _1417;
    out.m_64.w = _1409;
    if (_1397)
    {
        return out;
    }
    out.m_45.x = 0.0;
    float _1419 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _1419;
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
    out.m_58 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_54 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_62 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_45 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_60 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_64 = float4(0.0, 0.0, 0.0, 1.0);
    bool _265 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _78 = in.m_42.w;
    float _80 = trunc(_78);
    int _83 = int(_80);
    bool _87 = _83 >= 1;
    float _89 = 0.0;
    if (!_87)
    {
        _89 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _91 = _89;
    float _93 = _91;
    if (!_87)
    {
        out.m_45.x = 0.0;
    }
    int _95 = 0;
    if (!_87)
    {
        float _97 = _91 * 5.0;
        _95 = as_type<int>(_97);
    }
    int _99 = _95;
    int _101 = _99;
    if (!_87)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _1476 = as_type<float>(_99);
        out.gl_Position.z = _1476;
    }
    if (!_87)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_58.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_58.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_58.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_58.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_54.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_54.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_54.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_54.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_62.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_62.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_62.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_62.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_45.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_45.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_45.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_45.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_60.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_60.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_60.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_60.w)); dm_cw(dm_gs, dm_p, 36, 0u); dm_cw(dm_gs, dm_p, 37, 0u); dm_cw(dm_gs, dm_p, 38, 0u); dm_cw(dm_gs, dm_p, 39, 0x3f800000u); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_64.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_64.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_64.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_64.w)); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _103 = in.m_47.w;
    bool _105 = _103 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _107 = isnan(_103);
    bool _109 = _105 || _107;
    bool _111 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _113 = _109 || _111;
    float _115 = -_103;
    float _117 = _115 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    if (_113)
    {
        float _119 = float(_83);
        _93 = _119;
    }
    float _121 = _93;
    bool _123 = _117 >= _121;
    bool _125 = !_113;
    bool _127 = _123 || _125;
    float _129 = _121;
    if (_127)
    {
        _129 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _131 = _129;
    if (_127)
    {
        out.m_45.x = 0.0;
    }
    if (_127)
    {
        float _133 = _131 * 5.0;
        _101 = as_type<int>(_133);
    }
    int _135 = _101;
    if (_127)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _1545 = as_type<float>(_135);
        out.gl_Position.z = _1545;
    }
    if (_127)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_58.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_58.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_58.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_58.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_54.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_54.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_54.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_54.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_62.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_62.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_62.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_62.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_45.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_45.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_45.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_45.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_60.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_60.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_60.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_60.w)); dm_cw(dm_gs, dm_p, 36, 0u); dm_cw(dm_gs, dm_p, 37, 0u); dm_cw(dm_gs, dm_p, 38, 0u); dm_cw(dm_gs, dm_p, 39, 0x3f800000u); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_64.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_64.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_64.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_64.w)); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _137 = as_type<float>(int(gl_VertexIndex));
    float _139 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[19].z;
    float _141 = _117 + (*spvDescriptorSet0.vp_c9)._m0[20].z;
    float _143 = in.m_52.x;
    float _145 = _141 * _139;
    int _147 = as_type<int>(_137) & 1;
    bool _149 = _147 != 0;
    int _151 = as_type<int>(_137) & 2;
    bool _153 = _151 != 0;
    float _155 = fma(_143, (*spvDescriptorSet0.vp_c9)._m0[20].x, _145);
    bool _157 = !_153;
    float _159 = _157 ? (-0.5) : 0.5;
    int _161 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 2;
    bool _163 = _161 != 0;
    int _165 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 4;
    bool _167 = _165 != 0;
    float _169 = _155 * 6.283185482025146484375;
    float _171 = floor(_155);
    float _173 = _169 * 0.15915493667125701904296875;
    bool _175 = !_149;
    float _177 = _175 ? (-0.5) : 0.5;
    int _179 = 1 & as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x);
    bool _181 = _179 != 0;
    bool _183 = !_163;
    int _185 = _183 ? 0 : 1;
    float _187 = _173 * 6.283185482025146484375;
    float _189 = cos(_187);
    bool _191 = !_181;
    int _193 = _191 ? 0 : 1;
    int _195 = abs(_185);
    int _197 = abs(_193);
    float _199 = -_171;
    float _201 = _155 + _199;
    float _203 = float(_195);
    float _205 = -_201;
    float _207 = fma(_205, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    bool _209 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    bool _211 = !_167;
    int _213 = _211 ? 0 : 1;
    float _215 = fma(_189, 0.5, 0.5);
    float _217 = abs(_207);
    float _219 = _203 * _217;
    bool _221 = _201 < 0.5;
    float _223 = float(_221);
    int _225 = abs(_213);
    float _227 = -_215;
    float _229 = fma(_227, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    float _231 = float(_197);
    float _233 = -_223;
    float _235 = fma(_233, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    float _237 = float(_225);
    float _239 = fma(_231, _229, _219);
    float _241 = abs(_235);
    float _243 = fma(_237, _241, _239);
    bool _245 = !_209;
    float _247 = 0.5;
    float _263;
    if (!_245)
    {
        float _249 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _251 = _143 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _253 = fma(_251, (*spvDescriptorSet0.vp_c9)._m0[12].x, _117);
        float _255 = _253 * _249;
        float _257 = floor(_255);
        float _259 = -_257;
        float _261 = _255 + _259;
        _263 = _261;
        _265 = true;
    }
    else
    {
        float _267 = float(_83);
        float _269 = 1.0 / _267;
        float _271 = _117 * _269;
        _263 = _271;
    }
    _265 = false;
    float _273 = _263;
    float _275 = float(as_type<int>((*spvDescriptorSet0.vp_c9)._m0[8].x));
    float _277 = in.m_52.y;
    float _279 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _281 = _275 * _143;
    float _283 = float(as_type<int>((*spvDescriptorSet0.vp_c9)._m0[8].z));
    float _285 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _287 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _285;
    float _289 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _291 = (*spvDescriptorSet0.vp_c9)._m0[146].w + _289;
    float _293 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _295 = _293 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _297 = _283 * _143;
    float _299 = trunc(_281);
    int _301 = int(_299);
    float _303 = in.m_42.x;
    float _305 = in.m_42.y;
    float _307 = in.m_42.z;
    int _309 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _311 = _309 != 0;
    int _313 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _315 = _313 != 0;
    bool _317 = _143 > 0.5;
    float _319 = trunc(_297);
    int _321 = int(_319);
    bool _323 = _277 > 0.5;
    float _325 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _327 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _325;
    float _329 = 1.0 / _287;
    int _331 = _301 << 4;
    int _333 = _331 + 1712;
    int _335 = _321 << 4;
    int _337 = _335 + 1968;
    float _339 = _305 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _341 = _305 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _343 = _305 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _345 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _347 = _273 + _345;
    float _349 = 1.0 / _291;
    uint _352 = uint(int(uint(_333) >> uint(2)));
    uint _354 = uint(int(uint(int(_352)) >> uint(2)));
    int _356 = int(_352) & 3;
    float _358 = (*spvDescriptorSet0.vp_c9)._m0[int(_354)][_356];
    int _360 = int(_352) + 1;
    uint _362 = uint(int(uint(_360) >> uint(2)));
    int _364 = _360 & 3;
    float _366 = (*spvDescriptorSet0.vp_c9)._m0[int(_362)][_364];
    float _368 = fma(_303, (*spvDescriptorSet0.vp_c10)._m0[4].x, _339);
    float _370 = _347 * _329;
    float _372 = fma(_303, (*spvDescriptorSet0.vp_c10)._m0[5].x, _341);
    float _374 = fma(_303, (*spvDescriptorSet0.vp_c10)._m0[6].x, _343);
    float _376 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _378 = _273 + _376;
    float _380 = fma(_327, _370, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _382 = 1.0 / _295;
    uint _384 = uint(int(uint(_337) >> uint(2)));
    uint _386 = uint(int(uint(int(_384)) >> uint(2)));
    int _388 = int(_384) & 3;
    float _390 = (*spvDescriptorSet0.vp_c9)._m0[int(_386)][_388];
    int _392 = int(_384) + 1;
    uint _394 = uint(int(uint(_392) >> uint(2)));
    int _396 = _392 & 3;
    float _398 = (*spvDescriptorSet0.vp_c9)._m0[int(_394)][_396];
    float _400 = fma(_307, (*spvDescriptorSet0.vp_c10)._m0[6].z, _374);
    float _402 = _400 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _404 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    int _406 = _337 + 8;
    uint _408 = uint(int(uint(_406) >> uint(2)));
    uint _410 = uint(int(uint(int(_408)) >> uint(2)));
    int _412 = int(_408) & 3;
    float _414 = (*spvDescriptorSet0.vp_c9)._m0[int(_410)][_412];
    float _416 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _418 = _273 + _416;
    float _420 = _418 * _349;
    float _422 = fma(_307, (*spvDescriptorSet0.vp_c10)._m0[5].z, _372);
    float _424 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _426 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _424;
    int _428 = _333 + 8;
    uint _430 = uint(int(uint(_428) >> uint(2)));
    uint _432 = uint(int(uint(int(_430)) >> uint(2)));
    int _434 = int(_430) & 3;
    float _436 = (*spvDescriptorSet0.vp_c9)._m0[int(_432)][_434];
    float _438 = fma(_307, (*spvDescriptorSet0.vp_c10)._m0[4].z, _368);
    float _440 = _422 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _442 = fma(_426, _370, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _444 = _378 * _382;
    float _446 = _438 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _448 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _450 = _440 + _448;
    float _452 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _454 = _452 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _456 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _458 = _402 + _456;
    float _460 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _462 = _446 + _460;
    float _464 = _450 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _466 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _468 = _466 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _470 = fma(_454, _444, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _472 = fma(_462, (*spvDescriptorSet0.vp_c8)._m0[28].x, _464);
    float _474 = fma(_468, _444, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _476 = _450 * _450;
    float _478 = fma(_458, (*spvDescriptorSet0.vp_c8)._m0[28].z, _472);
    float _480 = -_159;
    int _482 = _323 ? as_type<int>(_480) : as_type<int>(_159);
    float _484 = -(*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _486 = (*spvDescriptorSet0.vp_c9)._m0[146].x + _484;
    float _488 = -(*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _490 = (*spvDescriptorSet0.vp_c9)._m0[146].y + _488;
    float _492 = fma(_462, _462, _476);
    bool _494 = _478 >= 0.0;
    float _496 = _358 * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _498 = -_177;
    int _500 = _317 ? as_type<int>(_498) : as_type<int>(_177);
    float _502 = fma(_486, _420, (*spvDescriptorSet0.vp_c9)._m0[145].x);
    bool _504 = !_315;
    float _506 = _504 ? _159 : as_type<float>(_482);
    float _508 = fma(_490, _420, (*spvDescriptorSet0.vp_c9)._m0[145].y);
    bool _510 = !_311;
    float _512 = _510 ? _177 : as_type<float>(_500);
    float _514 = _366 * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _516 = _398 * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _518 = _390 * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _520 = -_506;
    float _522 = _520 + 0.5;
    float _524 = _512 + 0.5;
    float _526 = (*spvDescriptorSet0.vp_c9)._m0[115].x * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _528 = 0.0;
    float _530 = _446;
    if (_494)
    {
        _528 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _532 = _528;
    float _534 = (*spvDescriptorSet0.vp_c9)._m0[131].x * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    float _536 = _414 * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _538 = _514 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _540 = _516 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _542 = _524 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _544 = _522 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    bool _546 = _273 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _548 = isnan(_273);
    bool _550 = _546 || _548;
    bool _552 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _554 = _550 || _552;
    float _556 = float(_554);
    if (_494)
    {
        out.m_45.x = 0.0;
    }
    float _558 = _542 * _279;
    float _560 = _436 * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _562 = _496 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _564 = _518 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _566 = _536 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _568 = fma(_458, _458, _492);
    float _570 = _560 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    bool _572 = _273 >= (*spvDescriptorSet0.vp_c9)._m0[146].w;
    bool _574 = isnan(_273);
    bool _576 = _572 || _574;
    bool _578 = isnan((*spvDescriptorSet0.vp_c9)._m0[146].w);
    bool _580 = _576 || _578;
    float _582 = float(_580);
    float _584 = _544 * _404;
    out.m_54.x = _564;
    out.m_54.y = _540;
    out.m_54.z = _566;
    out.m_54.w = _534;
    float _586 = rsqrt(_568);
    float _588 = -_582;
    float _590 = _588 + 1.0;
    float _592 = in.m_56.x;
    float _594 = in.m_56.y;
    float _596 = _556 * _590;
    out.m_58.x = _562;
    out.m_58.y = _538;
    out.m_58.z = _570;
    out.m_58.w = _526;
    out.m_60.x = _558;
    out.m_60.y = _584;
    float _598 = -_556;
    float _600 = _598 + 1.0;
    bool _602 = _273 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _604 = isnan(_273);
    bool _606 = _602 || _604;
    bool _608 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _610 = _606 || _608;
    float _612 = float(_610);
    float _614 = _462 * _586;
    int _616 = as_type<int>(_570);
    if (_494)
    {
        float _618 = _532 * 5.0;
        _616 = as_type<int>(_618);
    }
    int _620 = _616;
    bool _622 = _273 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _624 = isnan(_273);
    bool _626 = _622 || _624;
    bool _628 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _630 = _626 || _628;
    float _632 = float(_630);
    float _634 = _450 * _586;
    if (_494)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2372 = as_type<float>(_620);
        out.gl_Position.z = _2372;
    }
    float _636 = _632 * _600;
    float _638 = -_632;
    float _640 = _638 + 1.0;
    if (_494)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_58.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_58.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_58.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_58.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_54.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_54.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_54.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_54.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_62.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_62.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_62.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_62.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_45.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_45.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_45.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_45.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_60.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_60.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_60.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_60.w)); dm_cw(dm_gs, dm_p, 36, 0u); dm_cw(dm_gs, dm_p, 37, 0u); dm_cw(dm_gs, dm_p, 38, 0u); dm_cw(dm_gs, dm_p, 39, 0x3f800000u); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_64.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_64.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_64.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_64.w)); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _642 = -_634;
    float _644 = fma(_642, (*spvDescriptorSet0.vp_c9)._m0[18].w, _440);
    float _646 = _612 * _640;
    float _648 = _458 * _586;
    float _650 = -_614;
    float _652 = fma(_650, (*spvDescriptorSet0.vp_c9)._m0[18].w, _446);
    float _654 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _656 = _644 + _654;
    float _658 = -_612;
    float _660 = _658 + 1.0;
    float _662 = -_648;
    float _664 = fma(_662, (*spvDescriptorSet0.vp_c9)._m0[18].w, _402);
    float _666 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _668 = _652 + _666;
    float _670 = _656 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _672 = -_634;
    float _674 = fma(_672, (*spvDescriptorSet0.vp_c9)._m0[18].w, _450);
    float _676 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _678 = _664 + _676;
    float _680 = -_614;
    float _682 = fma(_680, (*spvDescriptorSet0.vp_c9)._m0[18].w, _462);
    float _684 = fma(_668, (*spvDescriptorSet0.vp_c8)._m0[28].x, _670);
    float _686 = _380 * _646;
    float _688 = _442 * _646;
    float _690 = _674 * _674;
    float _692 = fma(_678, (*spvDescriptorSet0.vp_c8)._m0[28].z, _684);
    float _694 = fma(_660, (*spvDescriptorSet0.vp_c9)._m0[143].x, _686);
    float _696 = fma(_660, (*spvDescriptorSet0.vp_c9)._m0[143].y, _688);
    float _698 = fma(_682, _682, _690);
    float _700 = -_648;
    float _702 = fma(_700, (*spvDescriptorSet0.vp_c9)._m0[18].w, _458);
    bool _704 = _692 >= 0.0;
    float _706 = fma(_470, _636, _694);
    float _708 = fma(_474, _636, _696);
    float _710 = fma(_702, _702, _698);
    float _712 = fma(_502, _596, _706);
    float _714 = fma(_508, _596, _708);
    float _716 = sqrt(_710);
    float _718 = fma(_582, (*spvDescriptorSet0.vp_c9)._m0[146].x, _712);
    float _720 = fma(_582, (*spvDescriptorSet0.vp_c9)._m0[146].y, _714);
    float _722 = _698;
    float _724 = _668;
    float _726 = _664;
    if (_704)
    {
        _722 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _728 = _722;
    float _730 = _718 * _592;
    float _732 = _720 * _594;
    int _734 = as_type<int>(_728);
    if (_704)
    {
        out.m_45.x = 0.0;
    }
    if (_704)
    {
        float _736 = _728 * 5.0;
        _734 = as_type<int>(_736);
    }
    int _738 = _734;
    float _740 = _243 * _730;
    float _742 = _243 * _732;
    if (_704)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2567 = as_type<float>(_738);
        out.gl_Position.z = _2567;
    }
    float _744 = _586 * _716;
    if (_704)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_58.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_58.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_58.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_58.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_54.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_54.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_54.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_54.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_62.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_62.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_62.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_62.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_45.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_45.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_45.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_45.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_60.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_60.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_60.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_60.w)); dm_cw(dm_gs, dm_p, 36, 0u); dm_cw(dm_gs, dm_p, 37, 0u); dm_cw(dm_gs, dm_p, 38, 0u); dm_cw(dm_gs, dm_p, 39, 0x3f800000u); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_64.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_64.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_64.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_64.w)); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _746 = _742 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _748 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _159);
    float _750 = _740 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _752 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _177);
    float _754 = _744 * _746;
    float _756 = _744 * _750;
    float _758 = _744 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _760 = _758 * 0.5;
    float _762 = _748 * _754;
    bool _764 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[660].y;
    bool _766 = isnan(0.5);
    bool _768 = _764 || _766;
    bool _770 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _772 = _768 || _770;
    float _774 = _752 * _756;
    float _776 = _762 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _778 = _762 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _780 = fma(_774, (*spvDescriptorSet0.vp_c8)._m0[26].x, _776);
    float _782 = fma(_774, (*spvDescriptorSet0.vp_c8)._m0[24].x, _778);
    float _784 = fma(_760, (*spvDescriptorSet0.vp_c8)._m0[26].z, _780);
    float _786 = fma(_760, (*spvDescriptorSet0.vp_c8)._m0[24].z, _782);
    float _788 = _784 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _790 = _786 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _792 = _402 + _788;
    float _794 = _446 + _790;
    float _796 = _762 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _798 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _800 = _792 + _798;
    float _802 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _804 = _794 + _802;
    float _806 = fma(_774, (*spvDescriptorSet0.vp_c8)._m0[25].x, _796);
    float _808 = _800 * _800;
    float _810 = fma(_760, (*spvDescriptorSet0.vp_c8)._m0[25].z, _806);
    float _812 = fma(_804, _804, _808);
    float _814 = _810 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _816 = sqrt(_812);
    float _818 = _440 + _814;
    bool _820 = _816 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _822 = _796;
    float _824 = _762;
    float _826 = _794;
    float _828 = _812;
    if (!_820)
    {
        _822 = _792;
    }
    float _830 = _822;
    float _832 = _830;
    if (!_820)
    {
        _824 = _818;
    }
    float _834 = _824;
    bool _836 = !_820;
    float _838 = _834;
    if (!_836)
    {
        float _840 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _842 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _844 = _816 + _842;
        float _846 = rsqrt(_812);
        float _848 = _844 * _840;
        float _850 = _818 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _852 = _848 * 0.15915493667125701904296875;
        float _854 = _852 * 6.283185482025146484375;
        float _856 = cos(_854);
        float _858 = _852 * 6.283185482025146484375;
        float _860 = sin(_858);
        float _862 = _856 + (-1.0);
        float _864 = fma(_860, _850, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _866 = _862 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _868 = _846 * _864;
        float _870 = fma(_818, _856, _866);
        float _872 = fma(_804, _868, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _874 = fma(_800, _868, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _826 = _872;
        _838 = _870;
        _832 = _874;
    }
    float _876 = _826;
    float _878 = _838;
    float _880 = _832;
    float _882 = -_614;
    float _884 = fma(_882, (*spvDescriptorSet0.vp_c9)._m0[18].w, _876);
    float _886 = -_634;
    float _888 = fma(_886, (*spvDescriptorSet0.vp_c9)._m0[18].w, _878);
    float _890 = -_648;
    float _892 = fma(_890, (*spvDescriptorSet0.vp_c9)._m0[18].w, _880);
    float _894 = _888;
    float _896 = _884;
    float _898 = _892;
    if (!_772)
    {
        float _900 = _656 * _656;
        float _902 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _904 = -_440;
        float _906 = _904 + _878;
        float _908 = fma(_668, _668, _900);
        float _910 = fma(_678, _678, _908);
        float _912 = 1.0 / _744;
        float _914 = sqrt(_910);
        float _916 = precise::min(_914, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _918 = _916 * _902;
        float _920 = -_446;
        float _922 = _920 + _876;
        float _924 = _918 * _912;
        float _926 = -_402;
        float _928 = _926 + _880;
        float _930 = fma(_922, _924, _652);
        float _932 = fma(_906, _924, _644);
        float _934 = fma(_928, _924, _664);
        _894 = _932;
        _896 = _930;
        _898 = _934;
        _724 = _914;
    }
    float _936 = _894;
    float _938 = _896;
    float _940 = _898;
    float _942 = _724;
    float _944 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _946 = _936 + _944;
    float _948 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _950 = _938 + _948;
    float _952 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _954 = _940 + _952;
    float _956 = _946 * _946;
    float _958 = fma(_950, _950, _956);
    float _960 = fma(_954, _954, _958);
    float _962 = rsqrt(_960);
    float _964 = _962 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _966 = _950 * _964;
    float _968 = _954 * _964;
    float _970 = _966 * _966;
    float _972 = _968 * _968;
    float _974 = _970 + _972;
    float _976 = sqrt(_974);
    bool _978 = _976 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _980 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _982 = _976 + _980;
    float _984 = _954;
    float _986 = _974;
    float _988 = _982;
    float _990 = _946;
    float _992 = _966;
    float _994 = _942;
    if (_978)
    {
        float _996 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _984 = _996;
    }
    float _998 = _984;
    if (_978)
    {
        float _1000 = rsqrt(_974);
        _986 = _1000;
    }
    float _1002 = _986;
    if (_978)
    {
        float _1004 = _982 * _998;
        _988 = _1004;
    }
    float _1006 = _988;
    if (_978)
    {
        float _1008 = _1006 * 0.15915493667125701904296875;
        _530 = _1008;
    }
    float _1010 = _530;
    float _1012 = _998;
    float _1014 = _1010;
    if (_978)
    {
        float _1016 = _1010 * 6.283185482025146484375;
        float _1018 = sin(_1016);
        _1012 = _1018;
    }
    float _1020 = _1012;
    float _1022 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _1024 = precise::max(0.0, _1022);
    float _1026 = _962;
    float _1028 = _1024;
    if (_978)
    {
        float _1030 = _1010 * 6.283185482025146484375;
        float _1032 = cos(_1030);
        _1026 = _1032;
    }
    float _1034 = _1026;
    float _1036 = -_964;
    float _1038 = -_1024;
    float _1040 = fma(_946, _1036, _1038);
    if (!_978)
    {
        _990 = _968;
    }
    float _1042 = _990;
    float _1044 = _1042;
    if (_978)
    {
        float _1046 = _1040 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1028 = _1046;
    }
    float _1048 = _1028;
    float _1050 = _1020;
    float _1052 = _1048;
    if (_978)
    {
        float _1054 = fma(_1020, _1048, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1050 = _1054;
    }
    float _1056 = _1050;
    float _1058 = _1056;
    float _1060 = _1034;
    if (_978)
    {
        float _1062 = _1034 + (-1.0);
        _1052 = _1062;
    }
    float _1064 = _1052;
    float _1066 = _1064;
    if (_978)
    {
        float _1068 = _1002 * _1056;
        _828 = _1068;
    }
    float _1070 = _828;
    if (!_978)
    {
        _1058 = _1040;
    }
    float _1072 = _1058;
    float _1074 = sqrt(_960);
    float _1076 = _1072;
    if (_978)
    {
        float _1078 = _1064 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1014 = _1078;
    }
    float _1080 = _1014;
    if (_978)
    {
        float _1082 = _966 * _1070;
        _992 = _1082;
    }
    float _1084 = _992;
    if (!_978)
    {
        _1066 = _970;
    }
    float _1086 = _1066;
    float _1088 = _1086;
    if (_978)
    {
        float _1090 = _968 * _1070;
        _1044 = _1090;
    }
    float _1092 = _1044;
    if (_978)
    {
        float _1094 = fma(_1040, _1034, _1080);
        _1076 = _1094;
    }
    float _1096 = _1076;
    if (_978)
    {
        float _1098 = _1084 * _1084;
        _1088 = _1098;
    }
    float _1100 = _1088;
    if (!_978)
    {
        _1060 = _972;
    }
    float _1102 = _1060;
    float _1104 = _1102;
    if (_978)
    {
        float _1106 = _1092 * _1092;
        _1104 = _1106;
    }
    float _1108 = _1104;
    float _1110 = fma(_1096, _1096, _1100);
    float _1112 = _936 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1114 = _1110 + _1108;
    float _1116 = fma(_938, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1112);
    float _1118 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _1120 = fma(_1074, (*spvDescriptorSet0.vp_c15)._m0[23].w, _1118);
    float _1122 = precise::clamp(_1120, 0.0, 1.0);
    float _1124 = _936 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1126 = rsqrt(_1114);
    float _1128 = fma(_940, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1116);
    float _1130 = -_1122;
    float _1132 = _1130 + 1.0;
    float _1134 = _936 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1136 = fma(_938, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1124);
    float _1138 = _1128 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1140 = _936 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1142 = fma(_938, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1134);
    float _1144 = abs(_1132);
    float _1146 = log2(_1144);
    float _1148 = fma(_940, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1136);
    float _1150 = fma(_938, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1140);
    float _1152 = fma(_940, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1142);
    float _1154 = (-1.0) + (*spvDescriptorSet0.vp_c15)._m0[20].x;
    float _1156 = _1148 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1158 = _1138 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _1160 = _1152 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1162 = _1126 * _1084;
    float _1164 = _1156 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1166 = _1126 * _1096;
    float _1168 = fma(_940, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1150);
    float _1170 = _1162 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _1172 = fma(_1160, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1164);
    float _1174 = _1126 * _1092;
    float _1176 = -_1158;
    float _1178 = fma(_1176, _1154, 1.0);
    float _1180 = -_1170;
    float _1182 = fma(_1166, (*spvDescriptorSet0.vp_c15)._m0[21].y, _1180);
    float _1184 = _1146 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _1186 = _1168 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1188 = fma(_1138, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1172);
    float _1190 = -_1174;
    float _1192 = fma(_1190, (*spvDescriptorSet0.vp_c15)._m0[21].z, _1182);
    float _1194 = exp2(_1184);
    float _1196 = _1156 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1198 = fma(_1186, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1188);
    float _1200 = fma(_1192, -0.5, 0.5);
    float _1202 = _1156 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1204 = fma(_1192, 0.5, 0.5);
    float _1206 = fma(_1160, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1196);
    float _1208 = _1166 + 1.0;
    float _1210 = log2(_1178);
    float _1212 = fma(_1160, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1202);
    float _1214 = fma(_1204, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _1216 = fma(_1138, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1206);
    float _1218 = fma(_1138, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1212);
    float _1220 = fma(_1204, _1214, -0.212114393711090087890625);
    float _1222 = fma(_1186, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1216);
    float _1224 = 1.0 / _1198;
    float _1226 = -_1166;
    float _1228 = fma(_1194, _1208, _1226);
    float _1230 = fma(_1186, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1218);
    float _1232 = fma(_1204, _1220, 1.570728778839111328125);
    float _1234 = fma(_1228, 0.5, 0.5);
    float _1236 = sqrt(_1200);
    float _1238 = _1210 * 0.693147182464599609375;
    float _1240 = _1238 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _1242 = _1222 * _1224;
    float _1244 = _1230 * _1224;
    float _1246 = fma(_1242, 0.5, 0.5);
    float _1248 = fma(_1244, -0.5, 0.5);
    float _1250 = _1236 * 0.636619746685028076171875;
    float3 _3405 = float3(_1246, _1248, _1240);
    float _1252 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_3405, float3(0.0), isnan(_3405)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_3405, float3(0.0), isnan(_3405)), level(0.0)).x;
    float3 _3416 = float3(_1246, _1248, _1240);
    float4 _1255 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_3416, float3(0.0), isnan(_3416)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_3416, float3(0.0), isnan(_3416)), level(0.0)).xyzw;
    float _1257 = _1255.x;
    float _1259 = _1255.y;
    float _1261 = _1255.z;
    float _1263 = _1255.w;
    float _1265 = -_1232;
    float _1267 = fma(_1250, _1265, 1.0);
    float2 _3438 = float2(_1267, _1234);
    float3 _1271 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_3438, float2(0.0), isnan(_3438)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_3438, float2(0.0), isnan(_3438)), level(0.0)).xyz;
    float _1273 = _1271.x;
    float _1275 = _1271.y;
    float _1277 = _1271.z;
    float _1279 = _644 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _1281 = _644 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    bool _1283 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[653].w;
    bool _1285 = isnan(0.5);
    bool _1287 = _1283 || _1285;
    bool _1289 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _1291 = _1287 || _1289;
    float _1293 = fma(_652, (*spvDescriptorSet0.vp_c8)._m0[11].x, _1279);
    float _1295 = fma(_652, (*spvDescriptorSet0.vp_c8)._m0[10].x, _1281);
    float _1297 = fma(_664, (*spvDescriptorSet0.vp_c8)._m0[11].z, _1293);
    float _1299 = fma(_664, (*spvDescriptorSet0.vp_c8)._m0[10].z, _1295);
    float _1301 = _1297 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _1303 = _1299 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _1305 = _1297;
    float _1307 = _1248;
    if (!_1291)
    {
        _726 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _1309 = _726;
    float _1311 = 1.0 / _1301;
    float _1313 = _1303 + _1301;
    if (!_1291)
    {
        _994 = (*spvDescriptorSet0.vp_c9)._m0[140].x;
    }
    float _1315 = _994;
    if (!_1291)
    {
        float _1317 = -_1315;
        float _1319 = _1317 + (*spvDescriptorSet0.vp_c9)._m0[140].y;
        _1305 = _1319;
    }
    float _1321 = _1305;
    float _1323 = _1146 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _1325 = exp2(_1323);
    float _1327 = _1313 * _1311;
    float _1329 = _1327 * 0.5;
    float _1331 = _1156 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _1333 = _1329;
    float _1335 = _1331;
    if (!_1291)
    {
        float _1337 = -_1309;
        float _1339 = fma(_1329, (*spvDescriptorSet0.vp_c8)._m0[30].w, _1337);
        _1333 = _1339;
    }
    float _1341 = _1333;
    float _1343 = fma(_1160, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1331);
    if (_1291)
    {
        _1335 = 1.0;
    }
    float _1345 = _1335;
    float _1347 = _1345;
    if (!_1291)
    {
        float _1349 = 1.0 / _1321;
        _1307 = _1349;
    }
    float _1351 = _1307;
    float _1353 = fma(_1138, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1343);
    float _1355 = fma(_1186, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1353);
    float _1357 = _1341;
    if (!_1291)
    {
        float _1359 = 1.0 / _1341;
        _1357 = _1359;
    }
    float _1361 = _1357;
    float _1363 = -_1325;
    float _1365 = _1363 + 1.0;
    float _1367 = _1355 + _1198;
    float _1369 = _1365 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    if (!_1291)
    {
        float _1371 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
        float _1373 = -_1315;
        float _1375 = fma(_1361, _1371, _1373);
        _247 = _1375;
    }
    float _1377 = _247;
    float _1379 = _1367 * 0.5;
    if (!_1291)
    {
        float _1381 = _1377 * _1351;
        float _1383 = precise::clamp(_1381, 0.0, 1.0);
        _1347 = _1383;
    }
    float _1385 = _1347;
    out.m_62.z = _1379;
    out.m_62.w = _1198;
    float _1387 = _1385 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    bool _1389 = _1385 > 0.0;
    bool _1391 = isnan(_1385);
    bool _1393 = _1389 || _1391;
    bool _1395 = isnan(0.0);
    bool _1397 = _1393 || _1395;
    out.gl_Position.x = _1222;
    out.gl_Position.y = _1230;
    out.gl_Position.z = _1355;
    out.gl_Position.w = _1198;
    float _1399 = _1387 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    out.m_45.x = _1399;
    float _1401 = _1369 * _1252;
    float _1403 = -_1369;
    float _1405 = _1403 + 1.0;
    float _1407 = _1263 * _1401;
    float _1409 = _1263 * _1405;
    float _1411 = _1277 * _1401;
    float _1413 = fma(_1273, _1407, _1257);
    float _1415 = fma(_1275, _1407, _1259);
    float _1417 = fma(_1263, _1411, _1261);
    out.m_64.x = _1413;
    out.m_64.y = _1415;
    out.m_64.z = _1417;
    out.m_64.w = _1409;
    if (_1397)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_58.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_58.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_58.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_58.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_54.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_54.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_54.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_54.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_62.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_62.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_62.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_62.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_45.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_45.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_45.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_45.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_60.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_60.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_60.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_60.w)); dm_cw(dm_gs, dm_p, 36, 0u); dm_cw(dm_gs, dm_p, 37, 0u); dm_cw(dm_gs, dm_p, 38, 0u); dm_cw(dm_gs, dm_p, 39, 0x3f800000u); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_64.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_64.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_64.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_64.w)); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    out.m_45.x = 0.0;
    float _1419 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _1419;
    { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_58.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_58.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_58.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_58.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_54.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_54.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_54.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_54.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_62.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_62.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_62.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_62.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_45.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_45.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_45.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_45.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_60.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_60.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_60.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_60.w)); dm_cw(dm_gs, dm_p, 36, 0u); dm_cw(dm_gs, dm_p, 37, 0u); dm_cw(dm_gs, dm_p, 38, 0u); dm_cw(dm_gs, dm_p, 39, 0x3f800000u); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_64.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_64.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_64.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_64.w)); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
}

