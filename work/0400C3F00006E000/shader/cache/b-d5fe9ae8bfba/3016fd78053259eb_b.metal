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
    bool _263 = false;
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
        float _1366 = as_type<float>(_99);
        out.gl_Position.z = _1366;
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
        float _1435 = as_type<float>(_135);
        out.gl_Position.z = _1435;
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
    float _261;
    if (!_245)
    {
        float _247 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _249 = _143 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _251 = fma(_249, (*spvDescriptorSet0.vp_c9)._m0[12].x, _117);
        float _253 = _251 * _247;
        float _255 = floor(_253);
        float _257 = -_255;
        float _259 = _253 + _257;
        _261 = _259;
        _263 = true;
    }
    else
    {
        float _265 = float(_83);
        float _267 = 1.0 / _265;
        float _269 = _117 * _267;
        _261 = _269;
    }
    _263 = false;
    float _271 = _261;
    float _273 = float(as_type<int>((*spvDescriptorSet0.vp_c9)._m0[8].x));
    float _275 = in.m_52.y;
    float _277 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _279 = _273 * _143;
    float _281 = float(as_type<int>((*spvDescriptorSet0.vp_c9)._m0[8].z));
    float _283 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _285 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _283;
    float _287 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _289 = (*spvDescriptorSet0.vp_c9)._m0[146].w + _287;
    float _291 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _293 = _291 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _295 = _281 * _143;
    float _297 = trunc(_279);
    int _299 = int(_297);
    float _301 = in.m_42.x;
    float _303 = in.m_42.y;
    float _305 = in.m_42.z;
    int _307 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _309 = _307 != 0;
    int _311 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _313 = _311 != 0;
    bool _315 = _143 > 0.5;
    float _317 = trunc(_295);
    int _319 = int(_317);
    bool _321 = _275 > 0.5;
    float _323 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _325 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _323;
    float _327 = 1.0 / _285;
    int _329 = _299 << 4;
    int _331 = _329 + 1712;
    int _333 = _319 << 4;
    int _335 = _333 + 1968;
    float _337 = _303 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _339 = _303 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _341 = _303 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _343 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _345 = _271 + _343;
    float _347 = 1.0 / _289;
    uint _350 = uint(int(uint(_331) >> uint(2)));
    uint _352 = uint(int(uint(int(_350)) >> uint(2)));
    int _354 = int(_350) & 3;
    float _356 = (*spvDescriptorSet0.vp_c9)._m0[int(_352)][_354];
    int _358 = int(_350) + 1;
    uint _360 = uint(int(uint(_358) >> uint(2)));
    int _362 = _358 & 3;
    float _364 = (*spvDescriptorSet0.vp_c9)._m0[int(_360)][_362];
    float _366 = fma(_301, (*spvDescriptorSet0.vp_c10)._m0[4].x, _337);
    float _368 = _345 * _327;
    float _370 = fma(_301, (*spvDescriptorSet0.vp_c10)._m0[5].x, _339);
    float _372 = fma(_301, (*spvDescriptorSet0.vp_c10)._m0[6].x, _341);
    float _374 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _376 = _271 + _374;
    float _378 = fma(_325, _368, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _380 = 1.0 / _293;
    uint _382 = uint(int(uint(_335) >> uint(2)));
    uint _384 = uint(int(uint(int(_382)) >> uint(2)));
    int _386 = int(_382) & 3;
    float _388 = (*spvDescriptorSet0.vp_c9)._m0[int(_384)][_386];
    int _390 = int(_382) + 1;
    uint _392 = uint(int(uint(_390) >> uint(2)));
    int _394 = _390 & 3;
    float _396 = (*spvDescriptorSet0.vp_c9)._m0[int(_392)][_394];
    float _398 = fma(_305, (*spvDescriptorSet0.vp_c10)._m0[6].z, _372);
    float _400 = _398 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _402 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    int _404 = _335 + 8;
    uint _406 = uint(int(uint(_404) >> uint(2)));
    uint _408 = uint(int(uint(int(_406)) >> uint(2)));
    int _410 = int(_406) & 3;
    float _412 = (*spvDescriptorSet0.vp_c9)._m0[int(_408)][_410];
    float _414 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _416 = _271 + _414;
    float _418 = _416 * _347;
    float _420 = fma(_305, (*spvDescriptorSet0.vp_c10)._m0[5].z, _370);
    float _422 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _424 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _422;
    int _426 = _331 + 8;
    uint _428 = uint(int(uint(_426) >> uint(2)));
    uint _430 = uint(int(uint(int(_428)) >> uint(2)));
    int _432 = int(_428) & 3;
    float _434 = (*spvDescriptorSet0.vp_c9)._m0[int(_430)][_432];
    float _436 = fma(_305, (*spvDescriptorSet0.vp_c10)._m0[4].z, _366);
    float _438 = _420 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _440 = fma(_424, _368, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _442 = _376 * _380;
    float _444 = _436 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _446 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _448 = _438 + _446;
    float _450 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _452 = _450 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _454 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _456 = _400 + _454;
    float _458 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _460 = _444 + _458;
    float _462 = _448 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _464 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _466 = _464 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _468 = fma(_452, _442, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _470 = fma(_460, (*spvDescriptorSet0.vp_c8)._m0[28].x, _462);
    float _472 = fma(_466, _442, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _474 = _448 * _448;
    float _476 = fma(_456, (*spvDescriptorSet0.vp_c8)._m0[28].z, _470);
    float _478 = -_159;
    int _480 = _321 ? as_type<int>(_478) : as_type<int>(_159);
    float _482 = -(*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _484 = (*spvDescriptorSet0.vp_c9)._m0[146].x + _482;
    float _486 = -(*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _488 = (*spvDescriptorSet0.vp_c9)._m0[146].y + _486;
    float _490 = fma(_460, _460, _474);
    bool _492 = _476 >= 0.0;
    float _494 = _356 * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _496 = -_177;
    int _498 = _315 ? as_type<int>(_496) : as_type<int>(_177);
    float _500 = fma(_484, _418, (*spvDescriptorSet0.vp_c9)._m0[145].x);
    bool _502 = !_313;
    float _504 = _502 ? _159 : as_type<float>(_480);
    float _506 = fma(_488, _418, (*spvDescriptorSet0.vp_c9)._m0[145].y);
    bool _508 = !_309;
    float _510 = _508 ? _177 : as_type<float>(_498);
    float _512 = _364 * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _514 = _396 * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _516 = _388 * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _518 = -_504;
    float _520 = _518 + 0.5;
    float _522 = _510 + 0.5;
    float _524 = (*spvDescriptorSet0.vp_c9)._m0[115].x * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _526 = 0.0;
    if (_492)
    {
        _526 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _528 = _526;
    float _530 = (*spvDescriptorSet0.vp_c9)._m0[131].x * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    float _532 = _412 * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _534 = _512 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _536 = _514 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _538 = _522 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _540 = _520 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    bool _542 = _271 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _544 = isnan(_271);
    bool _546 = _542 || _544;
    bool _548 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _550 = _546 || _548;
    float _552 = float(_550);
    if (_492)
    {
        out.m_45.x = 0.0;
    }
    float _554 = _538 * _277;
    float _556 = _434 * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _558 = _494 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _560 = _516 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _562 = _532 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _564 = fma(_456, _456, _490);
    float _566 = _556 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    bool _568 = _271 >= (*spvDescriptorSet0.vp_c9)._m0[146].w;
    bool _570 = isnan(_271);
    bool _572 = _568 || _570;
    bool _574 = isnan((*spvDescriptorSet0.vp_c9)._m0[146].w);
    bool _576 = _572 || _574;
    float _578 = float(_576);
    float _580 = _540 * _402;
    out.m_54.x = _560;
    out.m_54.y = _536;
    out.m_54.z = _562;
    out.m_54.w = _530;
    float _582 = rsqrt(_564);
    float _584 = -_578;
    float _586 = _584 + 1.0;
    float _588 = in.m_56.x;
    float _590 = in.m_56.y;
    float _592 = _552 * _586;
    out.m_58.x = _558;
    out.m_58.y = _534;
    out.m_58.z = _566;
    out.m_58.w = _524;
    out.m_60.x = _554;
    out.m_60.y = _580;
    float _594 = -_552;
    float _596 = _594 + 1.0;
    float _598 = _460 * _582;
    int _600 = as_type<int>(_566);
    if (_492)
    {
        float _602 = _528 * 5.0;
        _600 = as_type<int>(_602);
    }
    int _604 = _600;
    bool _606 = _271 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _608 = isnan(_271);
    bool _610 = _606 || _608;
    bool _612 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _614 = _610 || _612;
    float _616 = float(_614);
    float _618 = _448 * _582;
    bool _620 = _271 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _622 = isnan(_271);
    bool _624 = _620 || _622;
    bool _626 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _628 = _624 || _626;
    float _630 = float(_628);
    if (_492)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2261 = as_type<float>(_604);
        out.gl_Position.z = _2261;
    }
    float _632 = _616 * _596;
    float _634 = -_616;
    float _636 = _634 + 1.0;
    if (_492)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _638 = -_618;
    float _640 = fma(_638, (*spvDescriptorSet0.vp_c9)._m0[18].w, _438);
    float _642 = _630 * _636;
    float _644 = _456 * _582;
    float _646 = -_598;
    float _648 = fma(_646, (*spvDescriptorSet0.vp_c9)._m0[18].w, _444);
    float _650 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _652 = _640 + _650;
    float _654 = -_630;
    float _656 = _654 + 1.0;
    float _658 = -_644;
    float _660 = fma(_658, (*spvDescriptorSet0.vp_c9)._m0[18].w, _400);
    float _662 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _664 = _648 + _662;
    float _666 = _652 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _668 = -_618;
    float _670 = fma(_668, (*spvDescriptorSet0.vp_c9)._m0[18].w, _448);
    float _672 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _674 = _660 + _672;
    float _676 = -_598;
    float _678 = fma(_676, (*spvDescriptorSet0.vp_c9)._m0[18].w, _460);
    float _680 = fma(_664, (*spvDescriptorSet0.vp_c8)._m0[28].x, _666);
    float _682 = _378 * _642;
    float _684 = _440 * _642;
    float _686 = _670 * _670;
    float _688 = fma(_674, (*spvDescriptorSet0.vp_c8)._m0[28].z, _680);
    float _690 = fma(_656, (*spvDescriptorSet0.vp_c9)._m0[143].x, _682);
    float _692 = fma(_656, (*spvDescriptorSet0.vp_c9)._m0[143].y, _684);
    float _694 = fma(_678, _678, _686);
    float _696 = -_644;
    float _698 = fma(_696, (*spvDescriptorSet0.vp_c9)._m0[18].w, _456);
    bool _700 = _688 >= 0.0;
    float _702 = fma(_468, _632, _690);
    float _704 = fma(_472, _632, _692);
    float _706 = fma(_698, _698, _694);
    float _708 = fma(_500, _592, _702);
    float _710 = fma(_506, _592, _704);
    float _712 = sqrt(_706);
    float _714 = fma(_578, (*spvDescriptorSet0.vp_c9)._m0[146].x, _708);
    float _716 = fma(_578, (*spvDescriptorSet0.vp_c9)._m0[146].y, _710);
    float _718 = _694;
    if (_700)
    {
        _718 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _720 = _718;
    float _722 = _714 * _588;
    float _724 = _716 * _590;
    int _726 = as_type<int>(_720);
    if (_700)
    {
        out.m_45.x = 0.0;
    }
    if (_700)
    {
        float _728 = _720 * 5.0;
        _726 = as_type<int>(_728);
    }
    int _730 = _726;
    float _732 = _243 * _722;
    float _734 = _243 * _724;
    if (_700)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2454 = as_type<float>(_730);
        out.gl_Position.z = _2454;
    }
    float _736 = _582 * _712;
    if (_700)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _738 = _734 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _740 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _159);
    float _742 = _732 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _744 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _177);
    float _746 = _736 * _738;
    float _748 = _736 * _742;
    float _750 = _736 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _752 = _750 * 0.5;
    float _754 = _740 * _746;
    bool _756 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[660].y;
    bool _758 = isnan(0.5);
    bool _760 = _756 || _758;
    bool _762 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _764 = _760 || _762;
    float _766 = _744 * _748;
    float _768 = _754 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _770 = _754 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _772 = fma(_766, (*spvDescriptorSet0.vp_c8)._m0[26].x, _768);
    float _774 = fma(_766, (*spvDescriptorSet0.vp_c8)._m0[24].x, _770);
    float _776 = fma(_752, (*spvDescriptorSet0.vp_c8)._m0[26].z, _772);
    float _778 = fma(_752, (*spvDescriptorSet0.vp_c8)._m0[24].z, _774);
    float _780 = _776 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _782 = _778 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _784 = _400 + _780;
    float _786 = _444 + _782;
    float _788 = _754 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _790 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _792 = _784 + _790;
    float _794 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _796 = _786 + _794;
    float _798 = fma(_766, (*spvDescriptorSet0.vp_c8)._m0[25].x, _788);
    float _800 = _792 * _792;
    float _802 = fma(_752, (*spvDescriptorSet0.vp_c8)._m0[25].z, _798);
    float _804 = fma(_796, _796, _800);
    float _806 = _802 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _808 = sqrt(_804);
    float _810 = _438 + _806;
    bool _812 = _808 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _814 = _802;
    float _816 = _786;
    float _818 = _784;
    if (!_812)
    {
        _814 = _810;
    }
    float _820 = _814;
    bool _822 = !_812;
    float _824 = _820;
    if (!_822)
    {
        float _826 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _828 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _830 = _808 + _828;
        float _832 = _810 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _834 = rsqrt(_804);
        float _836 = _830 * _826;
        float _838 = _836 * 0.15915493667125701904296875;
        float _840 = _838 * 6.283185482025146484375;
        float _842 = cos(_840);
        float _844 = _838 * 6.283185482025146484375;
        float _846 = sin(_844);
        float _848 = _842 + (-1.0);
        float _850 = fma(_846, _832, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _852 = _848 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _854 = _834 * _850;
        float _856 = fma(_810, _842, _852);
        float _858 = fma(_796, _854, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _860 = fma(_792, _854, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _816 = _858;
        _824 = _856;
        _818 = _860;
    }
    float _862 = _816;
    float _864 = _824;
    float _866 = _818;
    float _868 = -_598;
    float _870 = fma(_868, (*spvDescriptorSet0.vp_c9)._m0[18].w, _862);
    float _872 = -_618;
    float _874 = fma(_872, (*spvDescriptorSet0.vp_c9)._m0[18].w, _864);
    float _876 = -_644;
    float _878 = fma(_876, (*spvDescriptorSet0.vp_c9)._m0[18].w, _866);
    float _880 = _874;
    float _882 = _870;
    float _884 = _878;
    float _886 = _862;
    if (!_764)
    {
        float _888 = _652 * _652;
        float _890 = 1.0 / _736;
        float _892 = -_444;
        float _894 = _892 + _862;
        float _896 = -_438;
        float _898 = _896 + _864;
        float _900 = fma(_664, _664, _888);
        float _902 = fma(_674, _674, _900);
        float _904 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _906 = sqrt(_902);
        float _908 = precise::min(_906, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _910 = _908 * _904;
        float _912 = _910 * _890;
        float _914 = -_400;
        float _916 = _914 + _866;
        float _918 = fma(_894, _912, _648);
        float _920 = fma(_898, _912, _640);
        float _922 = fma(_916, _912, _660);
        _880 = _920;
        _882 = _918;
        _884 = _922;
        _886 = _894;
    }
    float _924 = _880;
    float _926 = _882;
    float _928 = _884;
    float _930 = _886;
    float _932 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _934 = _924 + _932;
    float _936 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _938 = _926 + _936;
    float _940 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _942 = _928 + _940;
    float _944 = _934 * _934;
    float _946 = fma(_938, _938, _944);
    float _948 = fma(_942, _942, _946);
    float _950 = rsqrt(_948);
    float _952 = _950 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _954 = _938 * _952;
    float _956 = _942 * _952;
    float _958 = _954 * _954;
    float _960 = _956 * _956;
    float _962 = _958 + _960;
    float _964 = sqrt(_962);
    bool _966 = _964 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _968 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _970 = _964 + _968;
    float _972 = _942;
    float _974 = _962;
    float _976 = _970;
    float _978 = _930;
    float _980 = _952;
    float _982 = _954;
    if (_966)
    {
        float _984 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _972 = _984;
    }
    float _986 = _972;
    if (_966)
    {
        float _988 = rsqrt(_962);
        _974 = _988;
    }
    float _990 = _974;
    if (_966)
    {
        float _992 = _970 * _986;
        _976 = _992;
    }
    float _994 = _976;
    if (_966)
    {
        float _996 = _994 * 0.15915493667125701904296875;
        _978 = _996;
    }
    float _998 = _978;
    float _1000 = _944;
    float _1002 = _998;
    if (_966)
    {
        float _1004 = _998 * 6.283185482025146484375;
        float _1006 = sin(_1004);
        _1000 = _1006;
    }
    float _1008 = _1000;
    float _1010 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _1012 = precise::max(0.0, _1010);
    float _1014 = _950;
    float _1016 = _1012;
    float _1018 = _1010;
    if (_966)
    {
        float _1020 = _998 * 6.283185482025146484375;
        float _1022 = cos(_1020);
        _1014 = _1022;
    }
    float _1024 = _1014;
    float _1026 = -_952;
    float _1028 = -_1012;
    float _1030 = fma(_934, _1026, _1028);
    float _1032 = _1030;
    if (!_966)
    {
        _1016 = _956;
    }
    float _1034 = _1016;
    float _1036 = _1034;
    if (_966)
    {
        float _1038 = _1030 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1018 = _1038;
    }
    float _1040 = _1018;
    float _1042 = _1008;
    float _1044 = _1040;
    if (_966)
    {
        float _1046 = fma(_1008, _1040, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1042 = _1046;
    }
    float _1048 = _1042;
    float _1050 = _1048;
    if (_966)
    {
        float _1052 = _1024 + (-1.0);
        _1044 = _1052;
    }
    float _1054 = _1044;
    float _1056 = _1054;
    if (_966)
    {
        float _1058 = _990 * _1048;
        _980 = _1058;
    }
    float _1060 = _980;
    if (!_966)
    {
        _1050 = _1030;
    }
    float _1062 = _1050;
    float _1064 = sqrt(_948);
    float _1066 = _1062;
    if (_966)
    {
        float _1068 = _1054 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1002 = _1068;
    }
    float _1070 = _1002;
    if (_966)
    {
        float _1072 = _954 * _1060;
        _982 = _1072;
    }
    float _1074 = _982;
    if (!_966)
    {
        _1056 = _958;
    }
    float _1076 = _1056;
    float _1078 = _1076;
    if (_966)
    {
        float _1080 = _956 * _1060;
        _1036 = _1080;
    }
    float _1082 = _1036;
    if (_966)
    {
        float _1084 = fma(_1030, _1024, _1070);
        _1066 = _1084;
    }
    float _1086 = _1066;
    if (_966)
    {
        float _1088 = _1074 * _1074;
        _1078 = _1088;
    }
    float _1090 = _1078;
    if (!_966)
    {
        _1032 = _960;
    }
    float _1092 = _1032;
    float _1094 = _1092;
    if (_966)
    {
        float _1096 = _1082 * _1082;
        _1094 = _1096;
    }
    float _1098 = _1094;
    float _1100 = fma(_1086, _1086, _1090);
    float _1102 = _1100 + _1098;
    float _1104 = _924 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1106 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _1108 = fma(_1064, (*spvDescriptorSet0.vp_c15)._m0[23].w, _1106);
    float _1110 = precise::clamp(_1108, 0.0, 1.0);
    float _1112 = _924 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1114 = rsqrt(_1102);
    float _1116 = fma(_926, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1104);
    float _1118 = -_1110;
    float _1120 = _1118 + 1.0;
    float _1122 = _924 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1124 = fma(_926, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1112);
    float _1126 = _924 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1128 = fma(_928, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1116);
    float _1130 = fma(_926, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1122);
    float _1132 = fma(_928, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1124);
    float _1134 = fma(_926, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1126);
    float _1136 = abs(_1120);
    float _1138 = log2(_1136);
    float _1140 = fma(_928, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1130);
    float _1142 = _1132 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1144 = _1128 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1146 = fma(_928, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1134);
    float _1148 = _1140 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1150 = _1142 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1152 = _1114 * _1074;
    float _1154 = _1114 * _1086;
    float _1156 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _1158 = fma(_1148, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1150);
    float _1160 = _1152 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _1162 = _1144 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _1164 = _1114 * _1082;
    float _1166 = _1146 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1168 = -_1160;
    float _1170 = fma(_1154, (*spvDescriptorSet0.vp_c15)._m0[21].y, _1168);
    float _1172 = -_1162;
    float _1174 = fma(_1172, _1156, 1.0);
    float _1176 = _1138 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _1178 = fma(_1144, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1158);
    float _1180 = -_1164;
    float _1182 = fma(_1180, (*spvDescriptorSet0.vp_c15)._m0[21].z, _1170);
    float _1184 = _1142 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1186 = _1142 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1188 = fma(_1166, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1178);
    float _1190 = fma(_1182, -0.5, 0.5);
    float _1192 = exp2(_1176);
    float _1194 = fma(_1148, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1184);
    float _1196 = fma(_1182, 0.5, 0.5);
    float _1198 = fma(_1148, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1186);
    float _1200 = _1154 + 1.0;
    float _1202 = fma(_1144, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1194);
    float _1204 = fma(_1196, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _1206 = fma(_1144, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1198);
    float _1208 = log2(_1174);
    float _1210 = fma(_1166, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1202);
    float _1212 = fma(_1196, _1204, -0.212114393711090087890625);
    float _1214 = fma(_1166, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1206);
    float _1216 = fma(_1196, _1212, 1.570728778839111328125);
    float _1218 = 1.0 / _1188;
    float _1220 = -_1154;
    float _1222 = fma(_1192, _1200, _1220);
    float _1224 = fma(_1222, 0.5, 0.5);
    float _1226 = sqrt(_1190);
    float _1228 = _1208 * 0.693147182464599609375;
    float _1230 = _1228 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _1232 = _1210 * _1218;
    float _1234 = _1214 * _1218;
    float _1236 = fma(_1232, 0.5, 0.5);
    float _1238 = fma(_1234, -0.5, 0.5);
    float _1240 = _1226 * 0.636619746685028076171875;
    float3 _3286 = float3(_1236, _1238, _1230);
    float _1242 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_3286, float3(0.0), isnan(_3286)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_3286, float3(0.0), isnan(_3286)), level(0.0)).x;
    float3 _3297 = float3(_1236, _1238, _1230);
    float4 _1245 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_3297, float3(0.0), isnan(_3297)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_3297, float3(0.0), isnan(_3297)), level(0.0)).xyzw;
    float _1247 = _1245.x;
    float _1249 = _1245.y;
    float _1251 = _1245.z;
    float _1253 = _1245.w;
    float _1255 = -_1216;
    float _1257 = fma(_1240, _1255, 1.0);
    float2 _3319 = float2(_1257, _1224);
    float3 _1261 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_3319, float2(0.0), isnan(_3319)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_3319, float2(0.0), isnan(_3319)), level(0.0)).xyz;
    float _1263 = _1261.x;
    float _1265 = _1261.y;
    float _1267 = _1261.z;
    float _1269 = _1138 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _1271 = _1142 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _1273 = fma(_1148, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1271);
    float _1275 = exp2(_1269);
    float _1277 = fma(_1144, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1273);
    float _1279 = fma(_1166, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1277);
    float _1281 = _1279 + _1188;
    float _1283 = (*spvDescriptorSet0.vp_c10)._m0[3].x * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    out.gl_Position.x = _1210;
    out.gl_Position.y = _1214;
    out.gl_Position.z = _1279;
    out.gl_Position.w = _1188;
    float _1285 = _1281 * 0.5;
    float _1287 = -_1275;
    float _1289 = _1287 + 1.0;
    out.m_45.x = _1283;
    float _1291 = _1289 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    out.m_62.z = _1285;
    out.m_62.w = _1188;
    float _1293 = _1291 * _1242;
    float _1295 = -_1291;
    float _1297 = _1295 + 1.0;
    float _1299 = _1253 * _1293;
    float _1301 = _1253 * _1297;
    float _1303 = _1267 * _1293;
    float _1305 = fma(_1263, _1299, _1247);
    float _1307 = fma(_1265, _1299, _1249);
    float _1309 = fma(_1253, _1303, _1251);
    out.m_64.x = _1305;
    out.m_64.y = _1307;
    out.m_64.z = _1309;
    out.m_64.w = _1301;
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
    bool _263 = false;
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
        float _1366 = as_type<float>(_99);
        out.gl_Position.z = _1366;
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
        float _1435 = as_type<float>(_135);
        out.gl_Position.z = _1435;
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
    float _261;
    if (!_245)
    {
        float _247 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _249 = _143 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _251 = fma(_249, (*spvDescriptorSet0.vp_c9)._m0[12].x, _117);
        float _253 = _251 * _247;
        float _255 = floor(_253);
        float _257 = -_255;
        float _259 = _253 + _257;
        _261 = _259;
        _263 = true;
    }
    else
    {
        float _265 = float(_83);
        float _267 = 1.0 / _265;
        float _269 = _117 * _267;
        _261 = _269;
    }
    _263 = false;
    float _271 = _261;
    float _273 = float(as_type<int>((*spvDescriptorSet0.vp_c9)._m0[8].x));
    float _275 = in.m_52.y;
    float _277 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _279 = _273 * _143;
    float _281 = float(as_type<int>((*spvDescriptorSet0.vp_c9)._m0[8].z));
    float _283 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _285 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _283;
    float _287 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _289 = (*spvDescriptorSet0.vp_c9)._m0[146].w + _287;
    float _291 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _293 = _291 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _295 = _281 * _143;
    float _297 = trunc(_279);
    int _299 = int(_297);
    float _301 = in.m_42.x;
    float _303 = in.m_42.y;
    float _305 = in.m_42.z;
    int _307 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _309 = _307 != 0;
    int _311 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _313 = _311 != 0;
    bool _315 = _143 > 0.5;
    float _317 = trunc(_295);
    int _319 = int(_317);
    bool _321 = _275 > 0.5;
    float _323 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _325 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _323;
    float _327 = 1.0 / _285;
    int _329 = _299 << 4;
    int _331 = _329 + 1712;
    int _333 = _319 << 4;
    int _335 = _333 + 1968;
    float _337 = _303 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _339 = _303 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _341 = _303 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _343 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _345 = _271 + _343;
    float _347 = 1.0 / _289;
    uint _350 = uint(int(uint(_331) >> uint(2)));
    uint _352 = uint(int(uint(int(_350)) >> uint(2)));
    int _354 = int(_350) & 3;
    float _356 = (*spvDescriptorSet0.vp_c9)._m0[int(_352)][_354];
    int _358 = int(_350) + 1;
    uint _360 = uint(int(uint(_358) >> uint(2)));
    int _362 = _358 & 3;
    float _364 = (*spvDescriptorSet0.vp_c9)._m0[int(_360)][_362];
    float _366 = fma(_301, (*spvDescriptorSet0.vp_c10)._m0[4].x, _337);
    float _368 = _345 * _327;
    float _370 = fma(_301, (*spvDescriptorSet0.vp_c10)._m0[5].x, _339);
    float _372 = fma(_301, (*spvDescriptorSet0.vp_c10)._m0[6].x, _341);
    float _374 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _376 = _271 + _374;
    float _378 = fma(_325, _368, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _380 = 1.0 / _293;
    uint _382 = uint(int(uint(_335) >> uint(2)));
    uint _384 = uint(int(uint(int(_382)) >> uint(2)));
    int _386 = int(_382) & 3;
    float _388 = (*spvDescriptorSet0.vp_c9)._m0[int(_384)][_386];
    int _390 = int(_382) + 1;
    uint _392 = uint(int(uint(_390) >> uint(2)));
    int _394 = _390 & 3;
    float _396 = (*spvDescriptorSet0.vp_c9)._m0[int(_392)][_394];
    float _398 = fma(_305, (*spvDescriptorSet0.vp_c10)._m0[6].z, _372);
    float _400 = _398 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _402 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    int _404 = _335 + 8;
    uint _406 = uint(int(uint(_404) >> uint(2)));
    uint _408 = uint(int(uint(int(_406)) >> uint(2)));
    int _410 = int(_406) & 3;
    float _412 = (*spvDescriptorSet0.vp_c9)._m0[int(_408)][_410];
    float _414 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _416 = _271 + _414;
    float _418 = _416 * _347;
    float _420 = fma(_305, (*spvDescriptorSet0.vp_c10)._m0[5].z, _370);
    float _422 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _424 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _422;
    int _426 = _331 + 8;
    uint _428 = uint(int(uint(_426) >> uint(2)));
    uint _430 = uint(int(uint(int(_428)) >> uint(2)));
    int _432 = int(_428) & 3;
    float _434 = (*spvDescriptorSet0.vp_c9)._m0[int(_430)][_432];
    float _436 = fma(_305, (*spvDescriptorSet0.vp_c10)._m0[4].z, _366);
    float _438 = _420 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _440 = fma(_424, _368, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _442 = _376 * _380;
    float _444 = _436 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _446 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _448 = _438 + _446;
    float _450 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _452 = _450 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _454 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _456 = _400 + _454;
    float _458 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _460 = _444 + _458;
    float _462 = _448 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _464 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _466 = _464 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _468 = fma(_452, _442, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _470 = fma(_460, (*spvDescriptorSet0.vp_c8)._m0[28].x, _462);
    float _472 = fma(_466, _442, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _474 = _448 * _448;
    float _476 = fma(_456, (*spvDescriptorSet0.vp_c8)._m0[28].z, _470);
    float _478 = -_159;
    int _480 = _321 ? as_type<int>(_478) : as_type<int>(_159);
    float _482 = -(*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _484 = (*spvDescriptorSet0.vp_c9)._m0[146].x + _482;
    float _486 = -(*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _488 = (*spvDescriptorSet0.vp_c9)._m0[146].y + _486;
    float _490 = fma(_460, _460, _474);
    bool _492 = _476 >= 0.0;
    float _494 = _356 * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _496 = -_177;
    int _498 = _315 ? as_type<int>(_496) : as_type<int>(_177);
    float _500 = fma(_484, _418, (*spvDescriptorSet0.vp_c9)._m0[145].x);
    bool _502 = !_313;
    float _504 = _502 ? _159 : as_type<float>(_480);
    float _506 = fma(_488, _418, (*spvDescriptorSet0.vp_c9)._m0[145].y);
    bool _508 = !_309;
    float _510 = _508 ? _177 : as_type<float>(_498);
    float _512 = _364 * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _514 = _396 * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _516 = _388 * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _518 = -_504;
    float _520 = _518 + 0.5;
    float _522 = _510 + 0.5;
    float _524 = (*spvDescriptorSet0.vp_c9)._m0[115].x * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _526 = 0.0;
    if (_492)
    {
        _526 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _528 = _526;
    float _530 = (*spvDescriptorSet0.vp_c9)._m0[131].x * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    float _532 = _412 * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _534 = _512 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _536 = _514 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _538 = _522 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _540 = _520 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    bool _542 = _271 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _544 = isnan(_271);
    bool _546 = _542 || _544;
    bool _548 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _550 = _546 || _548;
    float _552 = float(_550);
    if (_492)
    {
        out.m_45.x = 0.0;
    }
    float _554 = _538 * _277;
    float _556 = _434 * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _558 = _494 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _560 = _516 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _562 = _532 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _564 = fma(_456, _456, _490);
    float _566 = _556 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    bool _568 = _271 >= (*spvDescriptorSet0.vp_c9)._m0[146].w;
    bool _570 = isnan(_271);
    bool _572 = _568 || _570;
    bool _574 = isnan((*spvDescriptorSet0.vp_c9)._m0[146].w);
    bool _576 = _572 || _574;
    float _578 = float(_576);
    float _580 = _540 * _402;
    out.m_54.x = _560;
    out.m_54.y = _536;
    out.m_54.z = _562;
    out.m_54.w = _530;
    float _582 = rsqrt(_564);
    float _584 = -_578;
    float _586 = _584 + 1.0;
    float _588 = in.m_56.x;
    float _590 = in.m_56.y;
    float _592 = _552 * _586;
    out.m_58.x = _558;
    out.m_58.y = _534;
    out.m_58.z = _566;
    out.m_58.w = _524;
    out.m_60.x = _554;
    out.m_60.y = _580;
    float _594 = -_552;
    float _596 = _594 + 1.0;
    float _598 = _460 * _582;
    int _600 = as_type<int>(_566);
    if (_492)
    {
        float _602 = _528 * 5.0;
        _600 = as_type<int>(_602);
    }
    int _604 = _600;
    bool _606 = _271 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _608 = isnan(_271);
    bool _610 = _606 || _608;
    bool _612 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _614 = _610 || _612;
    float _616 = float(_614);
    float _618 = _448 * _582;
    bool _620 = _271 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _622 = isnan(_271);
    bool _624 = _620 || _622;
    bool _626 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _628 = _624 || _626;
    float _630 = float(_628);
    if (_492)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2261 = as_type<float>(_604);
        out.gl_Position.z = _2261;
    }
    float _632 = _616 * _596;
    float _634 = -_616;
    float _636 = _634 + 1.0;
    if (_492)
    {
        return out;
    }
    float _638 = -_618;
    float _640 = fma(_638, (*spvDescriptorSet0.vp_c9)._m0[18].w, _438);
    float _642 = _630 * _636;
    float _644 = _456 * _582;
    float _646 = -_598;
    float _648 = fma(_646, (*spvDescriptorSet0.vp_c9)._m0[18].w, _444);
    float _650 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _652 = _640 + _650;
    float _654 = -_630;
    float _656 = _654 + 1.0;
    float _658 = -_644;
    float _660 = fma(_658, (*spvDescriptorSet0.vp_c9)._m0[18].w, _400);
    float _662 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _664 = _648 + _662;
    float _666 = _652 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _668 = -_618;
    float _670 = fma(_668, (*spvDescriptorSet0.vp_c9)._m0[18].w, _448);
    float _672 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _674 = _660 + _672;
    float _676 = -_598;
    float _678 = fma(_676, (*spvDescriptorSet0.vp_c9)._m0[18].w, _460);
    float _680 = fma(_664, (*spvDescriptorSet0.vp_c8)._m0[28].x, _666);
    float _682 = _378 * _642;
    float _684 = _440 * _642;
    float _686 = _670 * _670;
    float _688 = fma(_674, (*spvDescriptorSet0.vp_c8)._m0[28].z, _680);
    float _690 = fma(_656, (*spvDescriptorSet0.vp_c9)._m0[143].x, _682);
    float _692 = fma(_656, (*spvDescriptorSet0.vp_c9)._m0[143].y, _684);
    float _694 = fma(_678, _678, _686);
    float _696 = -_644;
    float _698 = fma(_696, (*spvDescriptorSet0.vp_c9)._m0[18].w, _456);
    bool _700 = _688 >= 0.0;
    float _702 = fma(_468, _632, _690);
    float _704 = fma(_472, _632, _692);
    float _706 = fma(_698, _698, _694);
    float _708 = fma(_500, _592, _702);
    float _710 = fma(_506, _592, _704);
    float _712 = sqrt(_706);
    float _714 = fma(_578, (*spvDescriptorSet0.vp_c9)._m0[146].x, _708);
    float _716 = fma(_578, (*spvDescriptorSet0.vp_c9)._m0[146].y, _710);
    float _718 = _694;
    if (_700)
    {
        _718 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _720 = _718;
    float _722 = _714 * _588;
    float _724 = _716 * _590;
    int _726 = as_type<int>(_720);
    if (_700)
    {
        out.m_45.x = 0.0;
    }
    if (_700)
    {
        float _728 = _720 * 5.0;
        _726 = as_type<int>(_728);
    }
    int _730 = _726;
    float _732 = _243 * _722;
    float _734 = _243 * _724;
    if (_700)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2454 = as_type<float>(_730);
        out.gl_Position.z = _2454;
    }
    float _736 = _582 * _712;
    if (_700)
    {
        return out;
    }
    float _738 = _734 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _740 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _159);
    float _742 = _732 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _744 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _177);
    float _746 = _736 * _738;
    float _748 = _736 * _742;
    float _750 = _736 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _752 = _750 * 0.5;
    float _754 = _740 * _746;
    bool _756 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[660].y;
    bool _758 = isnan(0.5);
    bool _760 = _756 || _758;
    bool _762 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _764 = _760 || _762;
    float _766 = _744 * _748;
    float _768 = _754 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _770 = _754 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _772 = fma(_766, (*spvDescriptorSet0.vp_c8)._m0[26].x, _768);
    float _774 = fma(_766, (*spvDescriptorSet0.vp_c8)._m0[24].x, _770);
    float _776 = fma(_752, (*spvDescriptorSet0.vp_c8)._m0[26].z, _772);
    float _778 = fma(_752, (*spvDescriptorSet0.vp_c8)._m0[24].z, _774);
    float _780 = _776 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _782 = _778 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _784 = _400 + _780;
    float _786 = _444 + _782;
    float _788 = _754 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _790 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _792 = _784 + _790;
    float _794 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _796 = _786 + _794;
    float _798 = fma(_766, (*spvDescriptorSet0.vp_c8)._m0[25].x, _788);
    float _800 = _792 * _792;
    float _802 = fma(_752, (*spvDescriptorSet0.vp_c8)._m0[25].z, _798);
    float _804 = fma(_796, _796, _800);
    float _806 = _802 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _808 = sqrt(_804);
    float _810 = _438 + _806;
    bool _812 = _808 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _814 = _802;
    float _816 = _786;
    float _818 = _784;
    if (!_812)
    {
        _814 = _810;
    }
    float _820 = _814;
    bool _822 = !_812;
    float _824 = _820;
    if (!_822)
    {
        float _826 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _828 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _830 = _808 + _828;
        float _832 = _810 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _834 = rsqrt(_804);
        float _836 = _830 * _826;
        float _838 = _836 * 0.15915493667125701904296875;
        float _840 = _838 * 6.283185482025146484375;
        float _842 = cos(_840);
        float _844 = _838 * 6.283185482025146484375;
        float _846 = sin(_844);
        float _848 = _842 + (-1.0);
        float _850 = fma(_846, _832, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _852 = _848 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _854 = _834 * _850;
        float _856 = fma(_810, _842, _852);
        float _858 = fma(_796, _854, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _860 = fma(_792, _854, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _816 = _858;
        _824 = _856;
        _818 = _860;
    }
    float _862 = _816;
    float _864 = _824;
    float _866 = _818;
    float _868 = -_598;
    float _870 = fma(_868, (*spvDescriptorSet0.vp_c9)._m0[18].w, _862);
    float _872 = -_618;
    float _874 = fma(_872, (*spvDescriptorSet0.vp_c9)._m0[18].w, _864);
    float _876 = -_644;
    float _878 = fma(_876, (*spvDescriptorSet0.vp_c9)._m0[18].w, _866);
    float _880 = _874;
    float _882 = _870;
    float _884 = _878;
    float _886 = _862;
    if (!_764)
    {
        float _888 = _652 * _652;
        float _890 = 1.0 / _736;
        float _892 = -_444;
        float _894 = _892 + _862;
        float _896 = -_438;
        float _898 = _896 + _864;
        float _900 = fma(_664, _664, _888);
        float _902 = fma(_674, _674, _900);
        float _904 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _906 = sqrt(_902);
        float _908 = precise::min(_906, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _910 = _908 * _904;
        float _912 = _910 * _890;
        float _914 = -_400;
        float _916 = _914 + _866;
        float _918 = fma(_894, _912, _648);
        float _920 = fma(_898, _912, _640);
        float _922 = fma(_916, _912, _660);
        _880 = _920;
        _882 = _918;
        _884 = _922;
        _886 = _894;
    }
    float _924 = _880;
    float _926 = _882;
    float _928 = _884;
    float _930 = _886;
    float _932 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _934 = _924 + _932;
    float _936 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _938 = _926 + _936;
    float _940 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _942 = _928 + _940;
    float _944 = _934 * _934;
    float _946 = fma(_938, _938, _944);
    float _948 = fma(_942, _942, _946);
    float _950 = rsqrt(_948);
    float _952 = _950 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _954 = _938 * _952;
    float _956 = _942 * _952;
    float _958 = _954 * _954;
    float _960 = _956 * _956;
    float _962 = _958 + _960;
    float _964 = sqrt(_962);
    bool _966 = _964 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _968 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _970 = _964 + _968;
    float _972 = _942;
    float _974 = _962;
    float _976 = _970;
    float _978 = _930;
    float _980 = _952;
    float _982 = _954;
    if (_966)
    {
        float _984 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _972 = _984;
    }
    float _986 = _972;
    if (_966)
    {
        float _988 = rsqrt(_962);
        _974 = _988;
    }
    float _990 = _974;
    if (_966)
    {
        float _992 = _970 * _986;
        _976 = _992;
    }
    float _994 = _976;
    if (_966)
    {
        float _996 = _994 * 0.15915493667125701904296875;
        _978 = _996;
    }
    float _998 = _978;
    float _1000 = _944;
    float _1002 = _998;
    if (_966)
    {
        float _1004 = _998 * 6.283185482025146484375;
        float _1006 = sin(_1004);
        _1000 = _1006;
    }
    float _1008 = _1000;
    float _1010 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _1012 = precise::max(0.0, _1010);
    float _1014 = _950;
    float _1016 = _1012;
    float _1018 = _1010;
    if (_966)
    {
        float _1020 = _998 * 6.283185482025146484375;
        float _1022 = cos(_1020);
        _1014 = _1022;
    }
    float _1024 = _1014;
    float _1026 = -_952;
    float _1028 = -_1012;
    float _1030 = fma(_934, _1026, _1028);
    float _1032 = _1030;
    if (!_966)
    {
        _1016 = _956;
    }
    float _1034 = _1016;
    float _1036 = _1034;
    if (_966)
    {
        float _1038 = _1030 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1018 = _1038;
    }
    float _1040 = _1018;
    float _1042 = _1008;
    float _1044 = _1040;
    if (_966)
    {
        float _1046 = fma(_1008, _1040, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1042 = _1046;
    }
    float _1048 = _1042;
    float _1050 = _1048;
    if (_966)
    {
        float _1052 = _1024 + (-1.0);
        _1044 = _1052;
    }
    float _1054 = _1044;
    float _1056 = _1054;
    if (_966)
    {
        float _1058 = _990 * _1048;
        _980 = _1058;
    }
    float _1060 = _980;
    if (!_966)
    {
        _1050 = _1030;
    }
    float _1062 = _1050;
    float _1064 = sqrt(_948);
    float _1066 = _1062;
    if (_966)
    {
        float _1068 = _1054 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1002 = _1068;
    }
    float _1070 = _1002;
    if (_966)
    {
        float _1072 = _954 * _1060;
        _982 = _1072;
    }
    float _1074 = _982;
    if (!_966)
    {
        _1056 = _958;
    }
    float _1076 = _1056;
    float _1078 = _1076;
    if (_966)
    {
        float _1080 = _956 * _1060;
        _1036 = _1080;
    }
    float _1082 = _1036;
    if (_966)
    {
        float _1084 = fma(_1030, _1024, _1070);
        _1066 = _1084;
    }
    float _1086 = _1066;
    if (_966)
    {
        float _1088 = _1074 * _1074;
        _1078 = _1088;
    }
    float _1090 = _1078;
    if (!_966)
    {
        _1032 = _960;
    }
    float _1092 = _1032;
    float _1094 = _1092;
    if (_966)
    {
        float _1096 = _1082 * _1082;
        _1094 = _1096;
    }
    float _1098 = _1094;
    float _1100 = fma(_1086, _1086, _1090);
    float _1102 = _1100 + _1098;
    float _1104 = _924 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1106 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _1108 = fma(_1064, (*spvDescriptorSet0.vp_c15)._m0[23].w, _1106);
    float _1110 = precise::clamp(_1108, 0.0, 1.0);
    float _1112 = _924 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1114 = rsqrt(_1102);
    float _1116 = fma(_926, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1104);
    float _1118 = -_1110;
    float _1120 = _1118 + 1.0;
    float _1122 = _924 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1124 = fma(_926, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1112);
    float _1126 = _924 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1128 = fma(_928, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1116);
    float _1130 = fma(_926, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1122);
    float _1132 = fma(_928, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1124);
    float _1134 = fma(_926, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1126);
    float _1136 = abs(_1120);
    float _1138 = log2(_1136);
    float _1140 = fma(_928, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1130);
    float _1142 = _1132 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1144 = _1128 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1146 = fma(_928, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1134);
    float _1148 = _1140 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1150 = _1142 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1152 = _1114 * _1074;
    float _1154 = _1114 * _1086;
    float _1156 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _1158 = fma(_1148, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1150);
    float _1160 = _1152 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _1162 = _1144 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _1164 = _1114 * _1082;
    float _1166 = _1146 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1168 = -_1160;
    float _1170 = fma(_1154, (*spvDescriptorSet0.vp_c15)._m0[21].y, _1168);
    float _1172 = -_1162;
    float _1174 = fma(_1172, _1156, 1.0);
    float _1176 = _1138 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _1178 = fma(_1144, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1158);
    float _1180 = -_1164;
    float _1182 = fma(_1180, (*spvDescriptorSet0.vp_c15)._m0[21].z, _1170);
    float _1184 = _1142 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1186 = _1142 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1188 = fma(_1166, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1178);
    float _1190 = fma(_1182, -0.5, 0.5);
    float _1192 = exp2(_1176);
    float _1194 = fma(_1148, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1184);
    float _1196 = fma(_1182, 0.5, 0.5);
    float _1198 = fma(_1148, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1186);
    float _1200 = _1154 + 1.0;
    float _1202 = fma(_1144, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1194);
    float _1204 = fma(_1196, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _1206 = fma(_1144, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1198);
    float _1208 = log2(_1174);
    float _1210 = fma(_1166, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1202);
    float _1212 = fma(_1196, _1204, -0.212114393711090087890625);
    float _1214 = fma(_1166, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1206);
    float _1216 = fma(_1196, _1212, 1.570728778839111328125);
    float _1218 = 1.0 / _1188;
    float _1220 = -_1154;
    float _1222 = fma(_1192, _1200, _1220);
    float _1224 = fma(_1222, 0.5, 0.5);
    float _1226 = sqrt(_1190);
    float _1228 = _1208 * 0.693147182464599609375;
    float _1230 = _1228 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _1232 = _1210 * _1218;
    float _1234 = _1214 * _1218;
    float _1236 = fma(_1232, 0.5, 0.5);
    float _1238 = fma(_1234, -0.5, 0.5);
    float _1240 = _1226 * 0.636619746685028076171875;
    float3 _3286 = float3(_1236, _1238, _1230);
    float _1242 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_3286, float3(0.0), isnan(_3286)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_3286, float3(0.0), isnan(_3286)), level(0.0)).x;
    float3 _3297 = float3(_1236, _1238, _1230);
    float4 _1245 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_3297, float3(0.0), isnan(_3297)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_3297, float3(0.0), isnan(_3297)), level(0.0)).xyzw;
    float _1247 = _1245.x;
    float _1249 = _1245.y;
    float _1251 = _1245.z;
    float _1253 = _1245.w;
    float _1255 = -_1216;
    float _1257 = fma(_1240, _1255, 1.0);
    float2 _3319 = float2(_1257, _1224);
    float3 _1261 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_3319, float2(0.0), isnan(_3319)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_3319, float2(0.0), isnan(_3319)), level(0.0)).xyz;
    float _1263 = _1261.x;
    float _1265 = _1261.y;
    float _1267 = _1261.z;
    float _1269 = _1138 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _1271 = _1142 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _1273 = fma(_1148, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1271);
    float _1275 = exp2(_1269);
    float _1277 = fma(_1144, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1273);
    float _1279 = fma(_1166, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1277);
    float _1281 = _1279 + _1188;
    float _1283 = (*spvDescriptorSet0.vp_c10)._m0[3].x * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    out.gl_Position.x = _1210;
    out.gl_Position.y = _1214;
    out.gl_Position.z = _1279;
    out.gl_Position.w = _1188;
    float _1285 = _1281 * 0.5;
    float _1287 = -_1275;
    float _1289 = _1287 + 1.0;
    out.m_45.x = _1283;
    float _1291 = _1289 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    out.m_62.z = _1285;
    out.m_62.w = _1188;
    float _1293 = _1291 * _1242;
    float _1295 = -_1291;
    float _1297 = _1295 + 1.0;
    float _1299 = _1253 * _1293;
    float _1301 = _1253 * _1297;
    float _1303 = _1267 * _1293;
    float _1305 = fma(_1263, _1299, _1247);
    float _1307 = fma(_1265, _1299, _1249);
    float _1309 = fma(_1253, _1303, _1251);
    out.m_64.x = _1305;
    out.m_64.y = _1307;
    out.m_64.z = _1309;
    out.m_64.w = _1301;
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
    bool _263 = false;
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
        float _1366 = as_type<float>(_99);
        out.gl_Position.z = _1366;
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
        float _1435 = as_type<float>(_135);
        out.gl_Position.z = _1435;
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
    float _261;
    if (!_245)
    {
        float _247 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _249 = _143 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _251 = fma(_249, (*spvDescriptorSet0.vp_c9)._m0[12].x, _117);
        float _253 = _251 * _247;
        float _255 = floor(_253);
        float _257 = -_255;
        float _259 = _253 + _257;
        _261 = _259;
        _263 = true;
    }
    else
    {
        float _265 = float(_83);
        float _267 = 1.0 / _265;
        float _269 = _117 * _267;
        _261 = _269;
    }
    _263 = false;
    float _271 = _261;
    float _273 = float(as_type<int>((*spvDescriptorSet0.vp_c9)._m0[8].x));
    float _275 = in.m_52.y;
    float _277 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _279 = _273 * _143;
    float _281 = float(as_type<int>((*spvDescriptorSet0.vp_c9)._m0[8].z));
    float _283 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _285 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _283;
    float _287 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _289 = (*spvDescriptorSet0.vp_c9)._m0[146].w + _287;
    float _291 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _293 = _291 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _295 = _281 * _143;
    float _297 = trunc(_279);
    int _299 = int(_297);
    float _301 = in.m_42.x;
    float _303 = in.m_42.y;
    float _305 = in.m_42.z;
    int _307 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _309 = _307 != 0;
    int _311 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _313 = _311 != 0;
    bool _315 = _143 > 0.5;
    float _317 = trunc(_295);
    int _319 = int(_317);
    bool _321 = _275 > 0.5;
    float _323 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _325 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _323;
    float _327 = 1.0 / _285;
    int _329 = _299 << 4;
    int _331 = _329 + 1712;
    int _333 = _319 << 4;
    int _335 = _333 + 1968;
    float _337 = _303 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _339 = _303 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _341 = _303 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _343 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _345 = _271 + _343;
    float _347 = 1.0 / _289;
    uint _350 = uint(int(uint(_331) >> uint(2)));
    uint _352 = uint(int(uint(int(_350)) >> uint(2)));
    int _354 = int(_350) & 3;
    float _356 = (*spvDescriptorSet0.vp_c9)._m0[int(_352)][_354];
    int _358 = int(_350) + 1;
    uint _360 = uint(int(uint(_358) >> uint(2)));
    int _362 = _358 & 3;
    float _364 = (*spvDescriptorSet0.vp_c9)._m0[int(_360)][_362];
    float _366 = fma(_301, (*spvDescriptorSet0.vp_c10)._m0[4].x, _337);
    float _368 = _345 * _327;
    float _370 = fma(_301, (*spvDescriptorSet0.vp_c10)._m0[5].x, _339);
    float _372 = fma(_301, (*spvDescriptorSet0.vp_c10)._m0[6].x, _341);
    float _374 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _376 = _271 + _374;
    float _378 = fma(_325, _368, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _380 = 1.0 / _293;
    uint _382 = uint(int(uint(_335) >> uint(2)));
    uint _384 = uint(int(uint(int(_382)) >> uint(2)));
    int _386 = int(_382) & 3;
    float _388 = (*spvDescriptorSet0.vp_c9)._m0[int(_384)][_386];
    int _390 = int(_382) + 1;
    uint _392 = uint(int(uint(_390) >> uint(2)));
    int _394 = _390 & 3;
    float _396 = (*spvDescriptorSet0.vp_c9)._m0[int(_392)][_394];
    float _398 = fma(_305, (*spvDescriptorSet0.vp_c10)._m0[6].z, _372);
    float _400 = _398 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _402 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    int _404 = _335 + 8;
    uint _406 = uint(int(uint(_404) >> uint(2)));
    uint _408 = uint(int(uint(int(_406)) >> uint(2)));
    int _410 = int(_406) & 3;
    float _412 = (*spvDescriptorSet0.vp_c9)._m0[int(_408)][_410];
    float _414 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _416 = _271 + _414;
    float _418 = _416 * _347;
    float _420 = fma(_305, (*spvDescriptorSet0.vp_c10)._m0[5].z, _370);
    float _422 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _424 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _422;
    int _426 = _331 + 8;
    uint _428 = uint(int(uint(_426) >> uint(2)));
    uint _430 = uint(int(uint(int(_428)) >> uint(2)));
    int _432 = int(_428) & 3;
    float _434 = (*spvDescriptorSet0.vp_c9)._m0[int(_430)][_432];
    float _436 = fma(_305, (*spvDescriptorSet0.vp_c10)._m0[4].z, _366);
    float _438 = _420 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _440 = fma(_424, _368, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _442 = _376 * _380;
    float _444 = _436 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _446 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _448 = _438 + _446;
    float _450 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _452 = _450 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _454 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _456 = _400 + _454;
    float _458 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _460 = _444 + _458;
    float _462 = _448 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _464 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _466 = _464 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _468 = fma(_452, _442, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _470 = fma(_460, (*spvDescriptorSet0.vp_c8)._m0[28].x, _462);
    float _472 = fma(_466, _442, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _474 = _448 * _448;
    float _476 = fma(_456, (*spvDescriptorSet0.vp_c8)._m0[28].z, _470);
    float _478 = -_159;
    int _480 = _321 ? as_type<int>(_478) : as_type<int>(_159);
    float _482 = -(*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _484 = (*spvDescriptorSet0.vp_c9)._m0[146].x + _482;
    float _486 = -(*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _488 = (*spvDescriptorSet0.vp_c9)._m0[146].y + _486;
    float _490 = fma(_460, _460, _474);
    bool _492 = _476 >= 0.0;
    float _494 = _356 * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _496 = -_177;
    int _498 = _315 ? as_type<int>(_496) : as_type<int>(_177);
    float _500 = fma(_484, _418, (*spvDescriptorSet0.vp_c9)._m0[145].x);
    bool _502 = !_313;
    float _504 = _502 ? _159 : as_type<float>(_480);
    float _506 = fma(_488, _418, (*spvDescriptorSet0.vp_c9)._m0[145].y);
    bool _508 = !_309;
    float _510 = _508 ? _177 : as_type<float>(_498);
    float _512 = _364 * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _514 = _396 * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _516 = _388 * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _518 = -_504;
    float _520 = _518 + 0.5;
    float _522 = _510 + 0.5;
    float _524 = (*spvDescriptorSet0.vp_c9)._m0[115].x * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _526 = 0.0;
    if (_492)
    {
        _526 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _528 = _526;
    float _530 = (*spvDescriptorSet0.vp_c9)._m0[131].x * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    float _532 = _412 * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _534 = _512 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _536 = _514 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _538 = _522 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _540 = _520 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    bool _542 = _271 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _544 = isnan(_271);
    bool _546 = _542 || _544;
    bool _548 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _550 = _546 || _548;
    float _552 = float(_550);
    if (_492)
    {
        out.m_45.x = 0.0;
    }
    float _554 = _538 * _277;
    float _556 = _434 * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _558 = _494 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _560 = _516 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _562 = _532 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _564 = fma(_456, _456, _490);
    float _566 = _556 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    bool _568 = _271 >= (*spvDescriptorSet0.vp_c9)._m0[146].w;
    bool _570 = isnan(_271);
    bool _572 = _568 || _570;
    bool _574 = isnan((*spvDescriptorSet0.vp_c9)._m0[146].w);
    bool _576 = _572 || _574;
    float _578 = float(_576);
    float _580 = _540 * _402;
    out.m_54.x = _560;
    out.m_54.y = _536;
    out.m_54.z = _562;
    out.m_54.w = _530;
    float _582 = rsqrt(_564);
    float _584 = -_578;
    float _586 = _584 + 1.0;
    float _588 = in.m_56.x;
    float _590 = in.m_56.y;
    float _592 = _552 * _586;
    out.m_58.x = _558;
    out.m_58.y = _534;
    out.m_58.z = _566;
    out.m_58.w = _524;
    out.m_60.x = _554;
    out.m_60.y = _580;
    float _594 = -_552;
    float _596 = _594 + 1.0;
    float _598 = _460 * _582;
    int _600 = as_type<int>(_566);
    if (_492)
    {
        float _602 = _528 * 5.0;
        _600 = as_type<int>(_602);
    }
    int _604 = _600;
    bool _606 = _271 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _608 = isnan(_271);
    bool _610 = _606 || _608;
    bool _612 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _614 = _610 || _612;
    float _616 = float(_614);
    float _618 = _448 * _582;
    bool _620 = _271 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _622 = isnan(_271);
    bool _624 = _620 || _622;
    bool _626 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _628 = _624 || _626;
    float _630 = float(_628);
    if (_492)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2261 = as_type<float>(_604);
        out.gl_Position.z = _2261;
    }
    float _632 = _616 * _596;
    float _634 = -_616;
    float _636 = _634 + 1.0;
    if (_492)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_58.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_58.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_58.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_58.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_54.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_54.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_54.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_54.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_62.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_62.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_62.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_62.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_45.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_45.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_45.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_45.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_60.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_60.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_60.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_60.w)); dm_cw(dm_gs, dm_p, 36, 0u); dm_cw(dm_gs, dm_p, 37, 0u); dm_cw(dm_gs, dm_p, 38, 0u); dm_cw(dm_gs, dm_p, 39, 0x3f800000u); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_64.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_64.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_64.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_64.w)); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _638 = -_618;
    float _640 = fma(_638, (*spvDescriptorSet0.vp_c9)._m0[18].w, _438);
    float _642 = _630 * _636;
    float _644 = _456 * _582;
    float _646 = -_598;
    float _648 = fma(_646, (*spvDescriptorSet0.vp_c9)._m0[18].w, _444);
    float _650 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _652 = _640 + _650;
    float _654 = -_630;
    float _656 = _654 + 1.0;
    float _658 = -_644;
    float _660 = fma(_658, (*spvDescriptorSet0.vp_c9)._m0[18].w, _400);
    float _662 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _664 = _648 + _662;
    float _666 = _652 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _668 = -_618;
    float _670 = fma(_668, (*spvDescriptorSet0.vp_c9)._m0[18].w, _448);
    float _672 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _674 = _660 + _672;
    float _676 = -_598;
    float _678 = fma(_676, (*spvDescriptorSet0.vp_c9)._m0[18].w, _460);
    float _680 = fma(_664, (*spvDescriptorSet0.vp_c8)._m0[28].x, _666);
    float _682 = _378 * _642;
    float _684 = _440 * _642;
    float _686 = _670 * _670;
    float _688 = fma(_674, (*spvDescriptorSet0.vp_c8)._m0[28].z, _680);
    float _690 = fma(_656, (*spvDescriptorSet0.vp_c9)._m0[143].x, _682);
    float _692 = fma(_656, (*spvDescriptorSet0.vp_c9)._m0[143].y, _684);
    float _694 = fma(_678, _678, _686);
    float _696 = -_644;
    float _698 = fma(_696, (*spvDescriptorSet0.vp_c9)._m0[18].w, _456);
    bool _700 = _688 >= 0.0;
    float _702 = fma(_468, _632, _690);
    float _704 = fma(_472, _632, _692);
    float _706 = fma(_698, _698, _694);
    float _708 = fma(_500, _592, _702);
    float _710 = fma(_506, _592, _704);
    float _712 = sqrt(_706);
    float _714 = fma(_578, (*spvDescriptorSet0.vp_c9)._m0[146].x, _708);
    float _716 = fma(_578, (*spvDescriptorSet0.vp_c9)._m0[146].y, _710);
    float _718 = _694;
    if (_700)
    {
        _718 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _720 = _718;
    float _722 = _714 * _588;
    float _724 = _716 * _590;
    int _726 = as_type<int>(_720);
    if (_700)
    {
        out.m_45.x = 0.0;
    }
    if (_700)
    {
        float _728 = _720 * 5.0;
        _726 = as_type<int>(_728);
    }
    int _730 = _726;
    float _732 = _243 * _722;
    float _734 = _243 * _724;
    if (_700)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2454 = as_type<float>(_730);
        out.gl_Position.z = _2454;
    }
    float _736 = _582 * _712;
    if (_700)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_58.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_58.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_58.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_58.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_54.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_54.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_54.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_54.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_62.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_62.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_62.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_62.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_45.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_45.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_45.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_45.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_60.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_60.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_60.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_60.w)); dm_cw(dm_gs, dm_p, 36, 0u); dm_cw(dm_gs, dm_p, 37, 0u); dm_cw(dm_gs, dm_p, 38, 0u); dm_cw(dm_gs, dm_p, 39, 0x3f800000u); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_64.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_64.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_64.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_64.w)); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _738 = _734 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _740 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _159);
    float _742 = _732 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _744 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _177);
    float _746 = _736 * _738;
    float _748 = _736 * _742;
    float _750 = _736 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _752 = _750 * 0.5;
    float _754 = _740 * _746;
    bool _756 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[660].y;
    bool _758 = isnan(0.5);
    bool _760 = _756 || _758;
    bool _762 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _764 = _760 || _762;
    float _766 = _744 * _748;
    float _768 = _754 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _770 = _754 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _772 = fma(_766, (*spvDescriptorSet0.vp_c8)._m0[26].x, _768);
    float _774 = fma(_766, (*spvDescriptorSet0.vp_c8)._m0[24].x, _770);
    float _776 = fma(_752, (*spvDescriptorSet0.vp_c8)._m0[26].z, _772);
    float _778 = fma(_752, (*spvDescriptorSet0.vp_c8)._m0[24].z, _774);
    float _780 = _776 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _782 = _778 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _784 = _400 + _780;
    float _786 = _444 + _782;
    float _788 = _754 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _790 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _792 = _784 + _790;
    float _794 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _796 = _786 + _794;
    float _798 = fma(_766, (*spvDescriptorSet0.vp_c8)._m0[25].x, _788);
    float _800 = _792 * _792;
    float _802 = fma(_752, (*spvDescriptorSet0.vp_c8)._m0[25].z, _798);
    float _804 = fma(_796, _796, _800);
    float _806 = _802 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _808 = sqrt(_804);
    float _810 = _438 + _806;
    bool _812 = _808 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _814 = _802;
    float _816 = _786;
    float _818 = _784;
    if (!_812)
    {
        _814 = _810;
    }
    float _820 = _814;
    bool _822 = !_812;
    float _824 = _820;
    if (!_822)
    {
        float _826 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _828 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _830 = _808 + _828;
        float _832 = _810 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _834 = rsqrt(_804);
        float _836 = _830 * _826;
        float _838 = _836 * 0.15915493667125701904296875;
        float _840 = _838 * 6.283185482025146484375;
        float _842 = cos(_840);
        float _844 = _838 * 6.283185482025146484375;
        float _846 = sin(_844);
        float _848 = _842 + (-1.0);
        float _850 = fma(_846, _832, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _852 = _848 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _854 = _834 * _850;
        float _856 = fma(_810, _842, _852);
        float _858 = fma(_796, _854, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _860 = fma(_792, _854, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _816 = _858;
        _824 = _856;
        _818 = _860;
    }
    float _862 = _816;
    float _864 = _824;
    float _866 = _818;
    float _868 = -_598;
    float _870 = fma(_868, (*spvDescriptorSet0.vp_c9)._m0[18].w, _862);
    float _872 = -_618;
    float _874 = fma(_872, (*spvDescriptorSet0.vp_c9)._m0[18].w, _864);
    float _876 = -_644;
    float _878 = fma(_876, (*spvDescriptorSet0.vp_c9)._m0[18].w, _866);
    float _880 = _874;
    float _882 = _870;
    float _884 = _878;
    float _886 = _862;
    if (!_764)
    {
        float _888 = _652 * _652;
        float _890 = 1.0 / _736;
        float _892 = -_444;
        float _894 = _892 + _862;
        float _896 = -_438;
        float _898 = _896 + _864;
        float _900 = fma(_664, _664, _888);
        float _902 = fma(_674, _674, _900);
        float _904 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _906 = sqrt(_902);
        float _908 = precise::min(_906, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _910 = _908 * _904;
        float _912 = _910 * _890;
        float _914 = -_400;
        float _916 = _914 + _866;
        float _918 = fma(_894, _912, _648);
        float _920 = fma(_898, _912, _640);
        float _922 = fma(_916, _912, _660);
        _880 = _920;
        _882 = _918;
        _884 = _922;
        _886 = _894;
    }
    float _924 = _880;
    float _926 = _882;
    float _928 = _884;
    float _930 = _886;
    float _932 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _934 = _924 + _932;
    float _936 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _938 = _926 + _936;
    float _940 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _942 = _928 + _940;
    float _944 = _934 * _934;
    float _946 = fma(_938, _938, _944);
    float _948 = fma(_942, _942, _946);
    float _950 = rsqrt(_948);
    float _952 = _950 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _954 = _938 * _952;
    float _956 = _942 * _952;
    float _958 = _954 * _954;
    float _960 = _956 * _956;
    float _962 = _958 + _960;
    float _964 = sqrt(_962);
    bool _966 = _964 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _968 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _970 = _964 + _968;
    float _972 = _942;
    float _974 = _962;
    float _976 = _970;
    float _978 = _930;
    float _980 = _952;
    float _982 = _954;
    if (_966)
    {
        float _984 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _972 = _984;
    }
    float _986 = _972;
    if (_966)
    {
        float _988 = rsqrt(_962);
        _974 = _988;
    }
    float _990 = _974;
    if (_966)
    {
        float _992 = _970 * _986;
        _976 = _992;
    }
    float _994 = _976;
    if (_966)
    {
        float _996 = _994 * 0.15915493667125701904296875;
        _978 = _996;
    }
    float _998 = _978;
    float _1000 = _944;
    float _1002 = _998;
    if (_966)
    {
        float _1004 = _998 * 6.283185482025146484375;
        float _1006 = sin(_1004);
        _1000 = _1006;
    }
    float _1008 = _1000;
    float _1010 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _1012 = precise::max(0.0, _1010);
    float _1014 = _950;
    float _1016 = _1012;
    float _1018 = _1010;
    if (_966)
    {
        float _1020 = _998 * 6.283185482025146484375;
        float _1022 = cos(_1020);
        _1014 = _1022;
    }
    float _1024 = _1014;
    float _1026 = -_952;
    float _1028 = -_1012;
    float _1030 = fma(_934, _1026, _1028);
    float _1032 = _1030;
    if (!_966)
    {
        _1016 = _956;
    }
    float _1034 = _1016;
    float _1036 = _1034;
    if (_966)
    {
        float _1038 = _1030 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1018 = _1038;
    }
    float _1040 = _1018;
    float _1042 = _1008;
    float _1044 = _1040;
    if (_966)
    {
        float _1046 = fma(_1008, _1040, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1042 = _1046;
    }
    float _1048 = _1042;
    float _1050 = _1048;
    if (_966)
    {
        float _1052 = _1024 + (-1.0);
        _1044 = _1052;
    }
    float _1054 = _1044;
    float _1056 = _1054;
    if (_966)
    {
        float _1058 = _990 * _1048;
        _980 = _1058;
    }
    float _1060 = _980;
    if (!_966)
    {
        _1050 = _1030;
    }
    float _1062 = _1050;
    float _1064 = sqrt(_948);
    float _1066 = _1062;
    if (_966)
    {
        float _1068 = _1054 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1002 = _1068;
    }
    float _1070 = _1002;
    if (_966)
    {
        float _1072 = _954 * _1060;
        _982 = _1072;
    }
    float _1074 = _982;
    if (!_966)
    {
        _1056 = _958;
    }
    float _1076 = _1056;
    float _1078 = _1076;
    if (_966)
    {
        float _1080 = _956 * _1060;
        _1036 = _1080;
    }
    float _1082 = _1036;
    if (_966)
    {
        float _1084 = fma(_1030, _1024, _1070);
        _1066 = _1084;
    }
    float _1086 = _1066;
    if (_966)
    {
        float _1088 = _1074 * _1074;
        _1078 = _1088;
    }
    float _1090 = _1078;
    if (!_966)
    {
        _1032 = _960;
    }
    float _1092 = _1032;
    float _1094 = _1092;
    if (_966)
    {
        float _1096 = _1082 * _1082;
        _1094 = _1096;
    }
    float _1098 = _1094;
    float _1100 = fma(_1086, _1086, _1090);
    float _1102 = _1100 + _1098;
    float _1104 = _924 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1106 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _1108 = fma(_1064, (*spvDescriptorSet0.vp_c15)._m0[23].w, _1106);
    float _1110 = precise::clamp(_1108, 0.0, 1.0);
    float _1112 = _924 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1114 = rsqrt(_1102);
    float _1116 = fma(_926, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1104);
    float _1118 = -_1110;
    float _1120 = _1118 + 1.0;
    float _1122 = _924 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1124 = fma(_926, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1112);
    float _1126 = _924 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1128 = fma(_928, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1116);
    float _1130 = fma(_926, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1122);
    float _1132 = fma(_928, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1124);
    float _1134 = fma(_926, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1126);
    float _1136 = abs(_1120);
    float _1138 = log2(_1136);
    float _1140 = fma(_928, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1130);
    float _1142 = _1132 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1144 = _1128 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1146 = fma(_928, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1134);
    float _1148 = _1140 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1150 = _1142 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1152 = _1114 * _1074;
    float _1154 = _1114 * _1086;
    float _1156 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _1158 = fma(_1148, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1150);
    float _1160 = _1152 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _1162 = _1144 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _1164 = _1114 * _1082;
    float _1166 = _1146 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1168 = -_1160;
    float _1170 = fma(_1154, (*spvDescriptorSet0.vp_c15)._m0[21].y, _1168);
    float _1172 = -_1162;
    float _1174 = fma(_1172, _1156, 1.0);
    float _1176 = _1138 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _1178 = fma(_1144, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1158);
    float _1180 = -_1164;
    float _1182 = fma(_1180, (*spvDescriptorSet0.vp_c15)._m0[21].z, _1170);
    float _1184 = _1142 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1186 = _1142 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1188 = fma(_1166, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1178);
    float _1190 = fma(_1182, -0.5, 0.5);
    float _1192 = exp2(_1176);
    float _1194 = fma(_1148, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1184);
    float _1196 = fma(_1182, 0.5, 0.5);
    float _1198 = fma(_1148, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1186);
    float _1200 = _1154 + 1.0;
    float _1202 = fma(_1144, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1194);
    float _1204 = fma(_1196, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _1206 = fma(_1144, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1198);
    float _1208 = log2(_1174);
    float _1210 = fma(_1166, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1202);
    float _1212 = fma(_1196, _1204, -0.212114393711090087890625);
    float _1214 = fma(_1166, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1206);
    float _1216 = fma(_1196, _1212, 1.570728778839111328125);
    float _1218 = 1.0 / _1188;
    float _1220 = -_1154;
    float _1222 = fma(_1192, _1200, _1220);
    float _1224 = fma(_1222, 0.5, 0.5);
    float _1226 = sqrt(_1190);
    float _1228 = _1208 * 0.693147182464599609375;
    float _1230 = _1228 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _1232 = _1210 * _1218;
    float _1234 = _1214 * _1218;
    float _1236 = fma(_1232, 0.5, 0.5);
    float _1238 = fma(_1234, -0.5, 0.5);
    float _1240 = _1226 * 0.636619746685028076171875;
    float3 _3286 = float3(_1236, _1238, _1230);
    float _1242 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_3286, float3(0.0), isnan(_3286)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_3286, float3(0.0), isnan(_3286)), level(0.0)).x;
    float3 _3297 = float3(_1236, _1238, _1230);
    float4 _1245 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_3297, float3(0.0), isnan(_3297)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_3297, float3(0.0), isnan(_3297)), level(0.0)).xyzw;
    float _1247 = _1245.x;
    float _1249 = _1245.y;
    float _1251 = _1245.z;
    float _1253 = _1245.w;
    float _1255 = -_1216;
    float _1257 = fma(_1240, _1255, 1.0);
    float2 _3319 = float2(_1257, _1224);
    float3 _1261 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_3319, float2(0.0), isnan(_3319)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_3319, float2(0.0), isnan(_3319)), level(0.0)).xyz;
    float _1263 = _1261.x;
    float _1265 = _1261.y;
    float _1267 = _1261.z;
    float _1269 = _1138 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _1271 = _1142 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _1273 = fma(_1148, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1271);
    float _1275 = exp2(_1269);
    float _1277 = fma(_1144, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1273);
    float _1279 = fma(_1166, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1277);
    float _1281 = _1279 + _1188;
    float _1283 = (*spvDescriptorSet0.vp_c10)._m0[3].x * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    out.gl_Position.x = _1210;
    out.gl_Position.y = _1214;
    out.gl_Position.z = _1279;
    out.gl_Position.w = _1188;
    float _1285 = _1281 * 0.5;
    float _1287 = -_1275;
    float _1289 = _1287 + 1.0;
    out.m_45.x = _1283;
    float _1291 = _1289 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    out.m_62.z = _1285;
    out.m_62.w = _1188;
    float _1293 = _1291 * _1242;
    float _1295 = -_1291;
    float _1297 = _1295 + 1.0;
    float _1299 = _1253 * _1293;
    float _1301 = _1253 * _1297;
    float _1303 = _1267 * _1293;
    float _1305 = fma(_1263, _1299, _1247);
    float _1307 = fma(_1265, _1299, _1249);
    float _1309 = fma(_1253, _1303, _1251);
    out.m_64.x = _1305;
    out.m_64.y = _1307;
    out.m_64.z = _1309;
    out.m_64.w = _1301;
    { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_58.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_58.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_58.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_58.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_54.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_54.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_54.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_54.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_62.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_62.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_62.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_62.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_45.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_45.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_45.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_45.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_60.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_60.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_60.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_60.w)); dm_cw(dm_gs, dm_p, 36, 0u); dm_cw(dm_gs, dm_p, 37, 0u); dm_cw(dm_gs, dm_p, 38, 0u); dm_cw(dm_gs, dm_p, 39, 0x3f800000u); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_64.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_64.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_64.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_64.w)); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
}

