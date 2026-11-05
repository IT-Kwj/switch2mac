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
    float4 m_56 [[user(locn0)]];
    float4 m_60 [[user(locn1)]];
    float4 m_62 [[user(locn2)]];
    float4 m_45 [[user(locn3)]];
    float4 m_58 [[user(locn4)]];
    float4 m_64 [[user(locn6)]];
    float4 gl_Position [[position, invariant]];
    float gl_PointSize [[point_size]];
};

struct main0_in
{
    float4 m_42 [[attribute(2)]];
    float4 m_47 [[attribute(3)]];
    float4 m_49 [[attribute(4)]];
    float4 m_54 [[attribute(5)]];
};

vertex main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], uint gl_VertexIndex [[vertex_id]])
{
    main0_out out = {};
    out.m_56 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_60 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_62 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_45 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_58 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_64 = float4(0.0, 0.0, 0.0, 1.0);
    bool _383 = false;
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
        float _1624 = as_type<float>(_99);
        out.gl_Position.z = _1624;
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
        float _1693 = as_type<float>(_135);
        out.gl_Position.z = _1693;
    }
    if (_127)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _137 = in.m_49.x;
    float _139 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[19].z;
    float _141 = _117 + (*spvDescriptorSet0.vp_c9)._m0[20].z;
    float _143 = as_type<float>(int(gl_VertexIndex));
    float _145 = _117 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
    bool _147 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
    bool _149 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
    bool _151 = _147 || _149;
    bool _153 = isnan(1.0);
    bool _155 = _151 || _153;
    float _157 = _141 * _139;
    float _159 = 0.0;
    float _161 = _145;
    if (!_155)
    {
        float _163 = _145 * _145;
        float _165 = _163 * 0.5;
        _159 = _165;
    }
    float _167 = _159;
    float _169 = fma(_137, (*spvDescriptorSet0.vp_c9)._m0[20].x, _157);
    float _171 = _167;
    if (!_155)
    {
        float _173 = _167 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _171 = _173;
    }
    float _175 = _171;
    float _177 = in.m_47.x;
    float _179 = in.m_47.y;
    float _181 = in.m_47.z;
    float _183 = _169 * 6.283185482025146484375;
    float _185 = floor(_169);
    int _187 = as_type<int>(_143) & 1;
    bool _189 = _187 != 0;
    int _191 = as_type<int>(_143) & 2;
    bool _193 = _191 != 0;
    float _195 = _183 * 0.15915493667125701904296875;
    int _197 = 1 & as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x);
    bool _199 = _197 != 0;
    float _201 = _195 * 6.283185482025146484375;
    float _203 = cos(_201);
    bool _205 = !_189;
    float _207 = _205 ? (-0.5) : 0.5;
    float _209 = -_185;
    float _211 = _169 + _209;
    bool _213 = !_193;
    float _215 = _213 ? (-0.5) : 0.5;
    bool _217 = !_155;
    float _219 = _175;
    if (!_217)
    {
        float _221 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _223 = log2(_221);
        float _225 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _227 = _225 + 1.0;
        float _229 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _231 = _145 * _223;
        float _233 = 1.0 / _227;
        float _235 = _229 * 0.693147182464599609375;
        float _237 = exp2(_231);
        float _239 = 1.0 / _235;
        float _241 = _237 + (-1.0);
        float _243 = -_241;
        float _245 = fma(_243, _239, _145);
        float _247 = _245 * _233;
        float _249 = _247 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _219 = _249;
    }
    float _251 = _219;
    bool _253 = !_155;
    if (!_253)
    {
        float _255 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _257 = log2(_255);
        float _259 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _261 = _259 + 1.0;
        float _263 = 1.0 / _261;
        float _265 = _145 * _257;
        float _267 = exp2(_265);
        float _269 = -_267;
        float _271 = _269 + 1.0;
        float _273 = _271 * _263;
        _161 = _273;
    }
    float _275 = _161;
    float _277 = fma(_203, 0.5, 0.5);
    int _279 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 2;
    bool _281 = _279 != 0;
    int _283 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 4;
    bool _285 = _283 != 0;
    float _287 = in.m_54.w;
    bool _289 = _211 < 0.5;
    float _291 = float(_289);
    float _293 = -_211;
    float _295 = fma(_293, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    bool _297 = !_199;
    int _299 = _297 ? 0 : 1;
    float _301 = in.m_42.x;
    float _303 = in.m_42.y;
    float _305 = in.m_42.z;
    bool _307 = !_281;
    int _309 = _307 ? 0 : 1;
    float _311 = _251 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _313 = -_291;
    float _315 = fma(_313, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    float _317 = -_277;
    float _319 = fma(_317, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    int _321 = abs(_309);
    float _323 = fma(_275, _177, _311);
    int _325 = abs(_299);
    float _327 = _251 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    bool _329 = !_285;
    int _331 = _329 ? 0 : 1;
    float _333 = fma(_275, _179, _327);
    bool _335 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    int _337 = abs(_331);
    float _339 = _251 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _341 = float(_321);
    float _343 = float(_325);
    float _345 = fma(_275, _181, _339);
    float _347 = abs(_295);
    float _349 = _341 * _347;
    float _351 = fma(_345, _287, _305);
    float _353 = float(_337);
    float _355 = fma(_343, _319, _349);
    float _357 = fma(_323, _287, _301);
    float _359 = fma(_333, _287, _303);
    float _361 = abs(_315);
    float _363 = fma(_353, _361, _355);
    bool _365 = !_335;
    float _381;
    if (!_365)
    {
        float _367 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _369 = _137 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _371 = fma(_369, (*spvDescriptorSet0.vp_c9)._m0[12].x, _117);
        float _373 = _371 * _367;
        float _375 = floor(_373);
        float _377 = -_375;
        float _379 = _373 + _377;
        _381 = _379;
        _383 = true;
    }
    else
    {
        float _385 = float(_83);
        float _387 = 1.0 / _385;
        float _389 = _117 * _387;
        _381 = _389;
    }
    _383 = false;
    float _391 = _381;
    float _393 = in.m_49.y;
    float _395 = float(as_type<int>((*spvDescriptorSet0.vp_c9)._m0[8].z));
    float _397 = _359 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _399 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _401 = _395 * _137;
    float _403 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _405 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _403;
    float _407 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _409 = _407 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    int _411 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _413 = _411 != 0;
    float _415 = fma(_357, (*spvDescriptorSet0.vp_c10)._m0[6].x, _397);
    float _417 = trunc(_401);
    int _419 = int(_417);
    int _421 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _423 = _421 != 0;
    float _425 = _359 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    bool _427 = _137 > 0.5;
    float _429 = fma(_351, (*spvDescriptorSet0.vp_c10)._m0[6].z, _415);
    float _431 = fma(_357, (*spvDescriptorSet0.vp_c10)._m0[5].x, _425);
    float _433 = -(*spvDescriptorSet0.vp_c9)._m0[146].w;
    float _435 = _433 + (*spvDescriptorSet0.vp_c9)._m0[147].w;
    float _437 = 1.0 / _405;
    float _439 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _441 = fma(_351, (*spvDescriptorSet0.vp_c10)._m0[5].z, _431);
    bool _443 = _393 > 0.5;
    float _445 = _439 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _447 = _441 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _449 = 1.0 / _409;
    float _451 = _359 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    int _453 = _419 << 4;
    int _455 = _453 + 1968;
    float _457 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _459 = _391 + _457;
    float _461 = fma(_357, (*spvDescriptorSet0.vp_c10)._m0[4].x, _451);
    float _463 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _465 = (*spvDescriptorSet0.vp_c9)._m0[146].w + _463;
    float _467 = _459 * _437;
    float _469 = 1.0 / _465;
    float _471 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _473 = (*spvDescriptorSet0.vp_c9)._m0[115].x * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _475 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _477 = _471 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _479 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _481 = _391 + _479;
    float _483 = fma(_351, (*spvDescriptorSet0.vp_c10)._m0[4].z, _461);
    float _485 = _475 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    uint _488 = uint(int(uint(_455) >> uint(2)));
    uint _490 = uint(int(uint(int(_488)) >> uint(2)));
    int _492 = int(_488) & 3;
    float _494 = (*spvDescriptorSet0.vp_c9)._m0[int(_490)][_492];
    int _496 = int(_488) + 1;
    uint _498 = uint(int(uint(_496) >> uint(2)));
    int _500 = _496 & 3;
    float _502 = (*spvDescriptorSet0.vp_c9)._m0[int(_498)][_500];
    float _504 = 1.0 / _435;
    float _506 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _508 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _506;
    float _510 = _481 * _449;
    out.m_56.x = _485;
    out.m_56.y = _477;
    out.m_56.z = _445;
    out.m_56.w = _473;
    float _512 = _483 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _514 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _516 = _447 + _514;
    float _518 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _520 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _518;
    float _522 = fma(_508, _467, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _524 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _526 = _512 + _524;
    float _528 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _530 = _391 + _528;
    float _532 = fma(_520, _467, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _534 = -(*spvDescriptorSet0.vp_c9)._m0[146].w;
    float _536 = _391 + _534;
    float _538 = _530 * _469;
    float _540 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    int _542 = _455 + 8;
    uint _544 = uint(int(uint(_542) >> uint(2)));
    uint _546 = uint(int(uint(int(_544)) >> uint(2)));
    int _548 = int(_544) & 3;
    float _550 = (*spvDescriptorSet0.vp_c9)._m0[int(_546)][_548];
    float _552 = -(*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _554 = (*spvDescriptorSet0.vp_c9)._m0[146].y + _552;
    float _556 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _558 = _556 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _560 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _562 = _560 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _564 = _429 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _566 = fma(_558, _510, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _568 = fma(_562, _510, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _570 = _516 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _572 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _574 = _564 + _572;
    float _576 = -(*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _578 = (*spvDescriptorSet0.vp_c9)._m0[146].x + _576;
    float _580 = _536 * _504;
    float _582 = fma(_526, (*spvDescriptorSet0.vp_c8)._m0[28].x, _570);
    float _584 = -(*spvDescriptorSet0.vp_c9)._m0[146].x;
    float _586 = _584 + (*spvDescriptorSet0.vp_c9)._m0[147].x;
    float _588 = -(*spvDescriptorSet0.vp_c9)._m0[146].y;
    float _590 = _588 + (*spvDescriptorSet0.vp_c9)._m0[147].y;
    float _592 = fma(_578, _538, (*spvDescriptorSet0.vp_c9)._m0[145].x);
    float _594 = fma(_574, (*spvDescriptorSet0.vp_c8)._m0[28].z, _582);
    float _596 = -_207;
    int _598 = _427 ? as_type<int>(_596) : as_type<int>(_207);
    float _600 = fma(_586, _580, (*spvDescriptorSet0.vp_c9)._m0[146].x);
    float _602 = fma(_590, _580, (*spvDescriptorSet0.vp_c9)._m0[146].y);
    bool _604 = _391 >= (*spvDescriptorSet0.vp_c9)._m0[147].w;
    bool _606 = isnan(_391);
    bool _608 = _604 || _606;
    bool _610 = isnan((*spvDescriptorSet0.vp_c9)._m0[147].w);
    bool _612 = _608 || _610;
    float _614 = float(_612);
    float _616 = fma(_554, _538, (*spvDescriptorSet0.vp_c9)._m0[145].y);
    bool _618 = !_413;
    float _620 = _618 ? _207 : as_type<float>(_598);
    bool _622 = _594 >= 0.0;
    float _624 = -_614;
    float _626 = _624 + 1.0;
    float _628 = _620 + 0.5;
    float _630 = -_215;
    int _632 = _443 ? as_type<int>(_630) : as_type<int>(_215);
    float _634 = _628 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _636 = _494 * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    bool _638 = _391 >= (*spvDescriptorSet0.vp_c9)._m0[146].w;
    bool _640 = isnan(_391);
    bool _642 = _638 || _640;
    bool _644 = isnan((*spvDescriptorSet0.vp_c9)._m0[146].w);
    bool _646 = _642 || _644;
    float _648 = float(_646);
    float _650 = _502 * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _652 = _634 * _399;
    float _654 = _516 * _516;
    bool _656 = _391 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _658 = isnan(_391);
    bool _660 = _656 || _658;
    bool _662 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _664 = _660 || _662;
    float _666 = float(_664);
    float _668 = -_648;
    float _670 = _668 + 1.0;
    bool _672 = !_423;
    float _674 = _672 ? _215 : as_type<float>(_632);
    float _676 = fma(_526, _526, _654);
    float _678 = _648 * _626;
    bool _680 = _391 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _682 = isnan(_391);
    bool _684 = _680 || _682;
    bool _686 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _688 = _684 || _686;
    float _690 = float(_688);
    float _692 = _666 * _670;
    float _694 = fma(_574, _574, _676);
    float _696 = -_674;
    float _698 = _696 + 0.5;
    float _700 = -_666;
    float _702 = _700 + 1.0;
    bool _704 = _391 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _706 = isnan(_391);
    bool _708 = _704 || _706;
    bool _710 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _712 = _708 || _710;
    float _714 = float(_712);
    float _716 = _550 * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _718 = _698 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _720 = rsqrt(_694);
    float _722 = _690 * _702;
    float _724 = -_690;
    float _726 = _724 + 1.0;
    float _728 = 0.0;
    int _730 = as_type<int>(_636);
    float _732 = _512;
    if (_622)
    {
        _728 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _734 = _728;
    float _736 = _718 * _540;
    float _738 = _650 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _740 = _714 * _726;
    float _742 = _636 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _744 = _716 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    if (_622)
    {
        float _746 = _734 * 5.0;
        _730 = as_type<int>(_746);
    }
    int _748 = _730;
    out.m_58.x = _652;
    out.m_58.y = _736;
    float _750 = _522 * _740;
    float _752 = _532 * _740;
    out.m_60.x = _742;
    out.m_60.y = _738;
    out.m_60.z = _744;
    float _754 = _516 * _720;
    float _756 = _526 * _720;
    if (_622)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2698 = as_type<float>(_748);
        out.gl_Position.z = _2698;
    }
    if (_622)
    {
        out.m_45.x = 0.0;
    }
    if (_622)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _758 = -_754;
    float _760 = fma(_758, (*spvDescriptorSet0.vp_c9)._m0[18].w, _447);
    float _762 = _574 * _720;
    float _764 = -_756;
    float _766 = fma(_764, (*spvDescriptorSet0.vp_c9)._m0[18].w, _512);
    float _768 = -_754;
    float _770 = fma(_768, (*spvDescriptorSet0.vp_c9)._m0[18].w, _516);
    float _772 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _774 = _760 + _772;
    float _776 = -_762;
    float _778 = fma(_776, (*spvDescriptorSet0.vp_c9)._m0[18].w, _564);
    float _780 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _782 = _766 + _780;
    float _784 = in.m_54.x;
    float _786 = in.m_54.y;
    float _788 = _774 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _790 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _792 = _778 + _790;
    float _794 = -_714;
    float _796 = _794 + 1.0;
    float _798 = -_756;
    float _800 = fma(_798, (*spvDescriptorSet0.vp_c9)._m0[18].w, _526);
    float _802 = fma(_782, (*spvDescriptorSet0.vp_c8)._m0[28].x, _788);
    float _804 = _770 * _770;
    float _806 = fma(_796, (*spvDescriptorSet0.vp_c9)._m0[143].x, _750);
    float _808 = fma(_796, (*spvDescriptorSet0.vp_c9)._m0[143].y, _752);
    float _810 = fma(_792, (*spvDescriptorSet0.vp_c8)._m0[28].z, _802);
    float _812 = fma(_800, _800, _804);
    float _814 = -_762;
    float _816 = fma(_814, (*spvDescriptorSet0.vp_c9)._m0[18].w, _574);
    float _818 = fma(_566, _722, _806);
    float _820 = fma(_568, _722, _808);
    bool _822 = _810 >= 0.0;
    float _824 = fma(_816, _816, _812);
    float _826 = fma(_592, _692, _818);
    float _828 = fma(_616, _692, _820);
    float _830 = fma(_600, _678, _826);
    float _832 = fma(_602, _678, _828);
    float _834 = sqrt(_824);
    float _836 = fma(_614, (*spvDescriptorSet0.vp_c9)._m0[147].x, _830);
    float _838 = fma(_614, (*spvDescriptorSet0.vp_c9)._m0[147].y, _832);
    float _840 = _804;
    if (_822)
    {
        _840 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _842 = _840;
    float _844 = _836 * _784;
    float _846 = _838 * _786;
    int _848 = as_type<int>(_842);
    if (_822)
    {
        out.m_45.x = 0.0;
    }
    if (_822)
    {
        float _850 = _842 * 5.0;
        _848 = as_type<int>(_850);
    }
    int _852 = _848;
    float _854 = _363 * _844;
    float _856 = _363 * _846;
    if (_822)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2891 = as_type<float>(_852);
        out.gl_Position.z = _2891;
    }
    float _858 = _720 * _834;
    if (_822)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _860 = _856 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _862 = _854 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _864 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _215);
    float _866 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _207);
    float _868 = _858 * _860;
    float _870 = _858 * _862;
    float _872 = _858 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _874 = _872 * 0.5;
    float _876 = _864 * _868;
    float _878 = _866 * _870;
    bool _880 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[660].y;
    bool _882 = isnan(0.5);
    bool _884 = _880 || _882;
    bool _886 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _888 = _884 || _886;
    float _890 = _876 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _892 = _876 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    bool _894 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[653].w;
    bool _896 = isnan(0.5);
    bool _898 = _894 || _896;
    bool _900 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _902 = _898 || _900;
    float _904 = fma(_878, (*spvDescriptorSet0.vp_c8)._m0[26].x, _890);
    float _906 = fma(_878, (*spvDescriptorSet0.vp_c8)._m0[24].x, _892);
    float _908 = _760 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _910 = fma(_874, (*spvDescriptorSet0.vp_c8)._m0[26].z, _904);
    float _912 = fma(_874, (*spvDescriptorSet0.vp_c8)._m0[24].z, _906);
    float _914 = _910 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _916 = _912 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _918 = _564 + _914;
    float _920 = _512 + _916;
    float _922 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _924 = _918 + _922;
    float _926 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _928 = _920 + _926;
    float _930 = _924 * _924;
    float _932 = fma(_928, _928, _930);
    float _934 = _760 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _936 = sqrt(_932);
    float _938 = fma(_766, (*spvDescriptorSet0.vp_c8)._m0[11].x, _934);
    float _940 = _876 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _942 = fma(_766, (*spvDescriptorSet0.vp_c8)._m0[10].x, _908);
    float _944 = fma(_778, (*spvDescriptorSet0.vp_c8)._m0[11].z, _938);
    float _946 = fma(_878, (*spvDescriptorSet0.vp_c8)._m0[25].x, _940);
    float _948 = fma(_778, (*spvDescriptorSet0.vp_c8)._m0[10].z, _942);
    float _950 = _944 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _952 = fma(_874, (*spvDescriptorSet0.vp_c8)._m0[25].z, _946);
    float _954 = _948 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _956 = 1.0 / _950;
    float _958 = _952 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _960 = _954 + _950;
    bool _962 = _936 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _964 = _447 + _958;
    float _966 = _908;
    float _968 = _944;
    float _970 = _920;
    float _972 = _958;
    float _974 = _960;
    float _976 = _918;
    if (!_962)
    {
        _966 = _918;
    }
    float _978 = _966;
    float _980 = _978;
    if (!_962)
    {
        _968 = _964;
    }
    float _982 = _968;
    bool _984 = !_962;
    float _986 = _982;
    if (!_984)
    {
        float _988 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _990 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _992 = _936 + _990;
        float _994 = rsqrt(_932);
        float _996 = _992 * _988;
        float _998 = _964 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1000 = _996 * 0.15915493667125701904296875;
        float _1002 = _1000 * 6.283185482025146484375;
        float _1004 = sin(_1002);
        float _1006 = _1000 * 6.283185482025146484375;
        float _1008 = cos(_1006);
        float _1010 = fma(_1004, _998, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1012 = _994 * _1010;
        float _1014 = _1008 + (-1.0);
        float _1016 = fma(_928, _1012, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1018 = fma(_924, _1012, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        float _1020 = _1014 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1022 = fma(_964, _1008, _1020);
        _986 = _1022;
        _970 = _1016;
        _980 = _1018;
        _972 = _1004;
    }
    float _1024 = _986;
    float _1026 = _970;
    float _1028 = _980;
    float _1030 = _972;
    float _1032 = -_754;
    float _1034 = fma(_1032, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1024);
    float _1036 = _960 * _956;
    float _1038 = _1036 * 0.5;
    float _1040 = -_756;
    float _1042 = fma(_1040, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1026);
    float _1044 = -_762;
    float _1046 = fma(_1044, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1028);
    float _1048 = _1030;
    float _1050 = _1042;
    float _1052 = _1046;
    if (_902)
    {
        _1048 = 1.0;
    }
    float _1054 = _1048;
    float _1056 = _1054;
    if (_888)
    {
        _974 = _1034;
    }
    float _1058 = _974;
    float _1060 = _1058;
    if (!_888)
    {
        float _1062 = _774 * _774;
        float _1064 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _1066 = -_564;
        float _1068 = _1066 + _1028;
        float _1070 = fma(_782, _782, _1062);
        float _1072 = fma(_792, _792, _1070);
        float _1074 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1076 = sqrt(_1072);
        float _1078 = 1.0 / _858;
        float _1080 = precise::min(_1076, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _1082 = _1080 * _1064;
        float _1084 = _1074 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1086 = _1082 * _1078;
        float _1088 = -_512;
        float _1090 = _1088 + _1026;
        float _1092 = -_447;
        float _1094 = _1092 + _1024;
        float _1096 = _1084 * _1086;
        float _1098 = _1068 * _1086;
        float _1100 = fma(_1090, _1096, _766);
        float _1102 = fma(_1094, _1096, _760);
        float _1104 = fma(_1084, _1098, _778);
        _1060 = _1102;
        _1050 = _1100;
        _1052 = _1104;
        _732 = _1096;
    }
    float _1106 = _1060;
    float _1108 = _1050;
    float _1110 = _1052;
    float _1112 = _732;
    float _1114 = _1112;
    if (!_902)
    {
        float _1116 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1118 = _1116 * 0.15915493667125701904296875;
        float _1120 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1122 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
        float _1124 = fma(_1038, (*spvDescriptorSet0.vp_c8)._m0[30].w, _1122);
        float _1126 = _1118 * 6.283185482025146484375;
        float _1128 = cos(_1126);
        float _1130 = _1120 * 0.15915493667125701904296875;
        float _1132 = _1118 * 6.283185482025146484375;
        float _1134 = sin(_1132);
        float _1136 = 1.0 / _1128;
        float _1138 = _1130 * 6.283185482025146484375;
        float _1140 = cos(_1138);
        float _1142 = _1134 * _1136;
        float _1144 = _1130 * 6.283185482025146484375;
        float _1146 = sin(_1144);
        float _1148 = _1140 * _1142;
        float _1150 = 1.0 / _1124;
        float _1152 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1154 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _1152;
        float _1156 = 1.0 / _1148;
        float _1158 = 1.0 / _1154;
        float _1160 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
        float _1162 = _1150 * _1160;
        float _1164 = _1146 * _1156;
        float _1166 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1168 = fma(_1164, _1162, _1166);
        float _1170 = _1168 * _1158;
        float _1172 = precise::clamp(_1170, 0.0, 1.0);
        _1114 = _1158;
        _1056 = _1172;
    }
    float _1174 = _1114;
    float _1176 = _1056;
    float _1178 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1180 = _1106 + _1178;
    float _1182 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1184 = _1108 + _1182;
    float _1186 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1188 = _1110 + _1186;
    float _1190 = _1180 * _1180;
    float _1192 = fma(_1184, _1184, _1190);
    float _1194 = fma(_1188, _1188, _1192);
    float _1196 = rsqrt(_1194);
    float _1198 = _1196 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1200 = _1184 * _1198;
    float _1202 = _1188 * _1198;
    float _1204 = _1200 * _1200;
    float _1206 = _1202 * _1202;
    float _1208 = _1204 + _1206;
    float _1210 = sqrt(_1208);
    bool _1212 = _1210 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1214 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1216 = _1210 + _1214;
    float _1218 = _1192;
    float _1220 = _1216;
    float _1222 = _1174;
    float _1224 = _1180;
    float _1226 = _1200;
    if (_1212)
    {
        float _1228 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1218 = _1228;
    }
    float _1230 = _1218;
    float _1232 = _1230;
    if (_1212)
    {
        float _1234 = _1216 * _1230;
        _1220 = _1234;
    }
    float _1236 = _1220;
    if (_1212)
    {
        float _1238 = rsqrt(_1208);
        _1232 = _1238;
    }
    float _1240 = _1232;
    float _1242 = _1240;
    if (_1212)
    {
        float _1244 = _1236 * 0.15915493667125701904296875;
        _1222 = _1244;
    }
    float _1246 = _1222;
    float _1248 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _1250 = _1196;
    float _1252 = _1246;
    if (_1212)
    {
        float _1254 = _1246 * 6.283185482025146484375;
        float _1256 = sin(_1254);
        _1250 = _1256;
    }
    float _1258 = _1250;
    float _1260 = precise::max(0.0, _1248);
    float _1262 = _1188;
    float _1264 = _1260;
    if (_1212)
    {
        float _1266 = _1246 * 6.283185482025146484375;
        float _1268 = cos(_1266);
        _1262 = _1268;
    }
    float _1270 = _1262;
    float _1272 = -_1198;
    float _1274 = -_1260;
    float _1276 = fma(_1180, _1272, _1274);
    if (_1212)
    {
        float _1278 = _1276 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1224 = _1278;
    }
    float _1280 = _1224;
    float _1282 = _1258;
    float _1284 = _1280;
    if (_1212)
    {
        float _1286 = fma(_1258, _1280, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1282 = _1286;
    }
    float _1288 = _1282;
    if (!_1212)
    {
        _1284 = _1202;
    }
    float _1290 = _1284;
    float _1292 = _1290;
    if (_1212)
    {
        float _1294 = _1240 * _1288;
        _976 = _1294;
    }
    float _1296 = _976;
    if (!_1212)
    {
        _1242 = _1276;
    }
    float _1298 = _1242;
    float _1300 = sqrt(_1194);
    float _1302 = _1298;
    float _1304 = _1270;
    if (_1212)
    {
        float _1306 = _1270 + (-1.0);
        _1264 = _1306;
    }
    float _1308 = _1264;
    float _1310 = _1308;
    if (_1212)
    {
        float _1312 = _1200 * _1296;
        _1226 = _1312;
    }
    float _1314 = _1226;
    if (_1212)
    {
        float _1316 = _1202 * _1296;
        _1292 = _1316;
    }
    float _1318 = _1292;
    if (_1212)
    {
        float _1320 = _1308 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1252 = _1320;
    }
    float _1322 = _1252;
    if (!_1212)
    {
        _1310 = _1204;
    }
    float _1324 = _1310;
    float _1326 = _1324;
    if (_1212)
    {
        float _1328 = _1314 * _1314;
        _1326 = _1328;
    }
    float _1330 = _1326;
    if (_1212)
    {
        float _1332 = fma(_1276, _1270, _1322);
        _1302 = _1332;
    }
    float _1334 = _1302;
    if (!_1212)
    {
        _1304 = _1206;
    }
    float _1336 = _1304;
    float _1338 = _1336;
    if (_1212)
    {
        float _1340 = _1318 * _1318;
        _1338 = _1340;
    }
    float _1342 = _1338;
    float _1344 = fma(_1334, _1334, _1330);
    float _1346 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _1348 = fma(_1300, (*spvDescriptorSet0.vp_c15)._m0[23].w, _1346);
    float _1350 = precise::clamp(_1348, 0.0, 1.0);
    float _1352 = _1344 + _1342;
    float _1354 = _1106 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1356 = _1106 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1358 = -_1350;
    float _1360 = _1358 + 1.0;
    float _1362 = rsqrt(_1352);
    float _1364 = fma(_1108, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1354);
    float _1366 = _1106 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1368 = fma(_1108, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1356);
    float _1370 = _1106 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1372 = fma(_1110, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1364);
    float _1374 = fma(_1108, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1366);
    float _1376 = fma(_1110, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1368);
    float _1378 = abs(_1360);
    float _1380 = log2(_1378);
    float _1382 = fma(_1108, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1370);
    float _1384 = fma(_1110, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1374);
    float _1386 = _1376 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1388 = _1372 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1390 = fma(_1110, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1382);
    float _1392 = _1384 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1394 = _1386 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1396 = _1362 * _1314;
    float _1398 = _1362 * _1334;
    float _1400 = _1362 * _1318;
    float _1402 = fma(_1392, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1394);
    float _1404 = _1396 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _1406 = (-1.0) + (*spvDescriptorSet0.vp_c15)._m0[20].x;
    float _1408 = _1388 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _1410 = _1390 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1412 = -_1404;
    float _1414 = fma(_1398, (*spvDescriptorSet0.vp_c15)._m0[21].y, _1412);
    float _1416 = fma(_1388, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1402);
    float _1418 = -_1408;
    float _1420 = fma(_1418, _1406, 1.0);
    float _1422 = _1380 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _1424 = -_1400;
    float _1426 = fma(_1424, (*spvDescriptorSet0.vp_c15)._m0[21].z, _1414);
    float _1428 = fma(_1410, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1416);
    float _1430 = _1386 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1432 = exp2(_1422);
    float _1434 = fma(_1426, -0.5, 0.5);
    float _1436 = _1386 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1438 = fma(_1392, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1430);
    float _1440 = fma(_1426, 0.5, 0.5);
    float _1442 = _1398 + 1.0;
    float _1444 = fma(_1392, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1436);
    float _1446 = fma(_1388, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1438);
    float _1448 = log2(_1420);
    float _1450 = fma(_1440, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _1452 = fma(_1388, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1444);
    float _1454 = fma(_1410, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1446);
    float _1456 = fma(_1440, _1450, -0.212114393711090087890625);
    float _1458 = fma(_1410, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1452);
    float _1460 = 1.0 / _1428;
    float _1462 = -_1398;
    float _1464 = fma(_1432, _1442, _1462);
    float _1466 = fma(_1440, _1456, 1.570728778839111328125);
    float _1468 = fma(_1464, 0.5, 0.5);
    float _1470 = sqrt(_1434);
    float _1472 = _1448 * 0.693147182464599609375;
    float _1474 = _1472 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _1476 = _1454 * _1460;
    float _1478 = _1458 * _1460;
    float _1480 = fma(_1476, 0.5, 0.5);
    float _1482 = fma(_1478, -0.5, 0.5);
    float _1484 = _1470 * 0.636619746685028076171875;
    float3 _3904 = float3(_1480, _1482, _1474);
    float _1486 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_3904, float3(0.0), isnan(_3904)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_3904, float3(0.0), isnan(_3904)), level(0.0)).x;
    float3 _3915 = float3(_1480, _1482, _1474);
    float4 _1489 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_3915, float3(0.0), isnan(_3915)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_3915, float3(0.0), isnan(_3915)), level(0.0)).xyzw;
    float _1491 = _1489.x;
    float _1493 = _1489.y;
    float _1495 = _1489.z;
    float _1497 = _1489.w;
    float _1499 = -_1466;
    float _1501 = fma(_1484, _1499, 1.0);
    float2 _3937 = float2(_1501, _1468);
    float3 _1505 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_3937, float2(0.0), isnan(_3937)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_3937, float2(0.0), isnan(_3937)), level(0.0)).xyz;
    float _1507 = _1505.x;
    float _1509 = _1505.y;
    float _1511 = _1505.z;
    float _1513 = _1380 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _1515 = _1386 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    bool _1517 = _1176 > 0.0;
    bool _1519 = isnan(_1176);
    bool _1521 = _1517 || _1519;
    bool _1523 = isnan(0.0);
    bool _1525 = _1521 || _1523;
    float _1527 = _1176 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _1529 = fma(_1392, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1515);
    float _1531 = exp2(_1513);
    float _1533 = fma(_1388, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1529);
    float _1535 = fma(_1410, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1533);
    float _1537 = _1535 + _1428;
    out.gl_Position.x = _1454;
    out.gl_Position.y = _1458;
    out.gl_Position.z = _1535;
    out.gl_Position.w = _1428;
    float _1539 = _1537 * 0.5;
    float _1541 = -_1531;
    float _1543 = _1541 + 1.0;
    float _1545 = _1527 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _1547 = _1543 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    out.m_62.z = _1539;
    out.m_62.w = _1428;
    out.m_45.x = _1545;
    float _1549 = _1547 * _1486;
    float _1551 = -_1547;
    float _1553 = _1551 + 1.0;
    float _1555 = _1497 * _1549;
    float _1557 = _1497 * _1553;
    float _1559 = _1511 * _1549;
    float _1561 = fma(_1507, _1555, _1491);
    float _1563 = fma(_1509, _1555, _1493);
    float _1565 = fma(_1497, _1559, _1495);
    out.m_64.x = _1561;
    out.m_64.y = _1563;
    out.m_64.z = _1565;
    out.m_64.w = _1557;
    if (_1525)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    out.m_45.x = 0.0;
    float _1567 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _1567;
    out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
}


vertex main0_out main0_z(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], uint gl_VertexIndex [[vertex_id]])
{
    main0_out out = {};
    out.m_56 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_60 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_62 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_45 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_58 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_64 = float4(0.0, 0.0, 0.0, 1.0);
    bool _383 = false;
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
        float _1624 = as_type<float>(_99);
        out.gl_Position.z = _1624;
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
        float _1693 = as_type<float>(_135);
        out.gl_Position.z = _1693;
    }
    if (_127)
    {
        return out;
    }
    float _137 = in.m_49.x;
    float _139 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[19].z;
    float _141 = _117 + (*spvDescriptorSet0.vp_c9)._m0[20].z;
    float _143 = as_type<float>(int(gl_VertexIndex));
    float _145 = _117 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
    bool _147 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
    bool _149 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
    bool _151 = _147 || _149;
    bool _153 = isnan(1.0);
    bool _155 = _151 || _153;
    float _157 = _141 * _139;
    float _159 = 0.0;
    float _161 = _145;
    if (!_155)
    {
        float _163 = _145 * _145;
        float _165 = _163 * 0.5;
        _159 = _165;
    }
    float _167 = _159;
    float _169 = fma(_137, (*spvDescriptorSet0.vp_c9)._m0[20].x, _157);
    float _171 = _167;
    if (!_155)
    {
        float _173 = _167 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _171 = _173;
    }
    float _175 = _171;
    float _177 = in.m_47.x;
    float _179 = in.m_47.y;
    float _181 = in.m_47.z;
    float _183 = _169 * 6.283185482025146484375;
    float _185 = floor(_169);
    int _187 = as_type<int>(_143) & 1;
    bool _189 = _187 != 0;
    int _191 = as_type<int>(_143) & 2;
    bool _193 = _191 != 0;
    float _195 = _183 * 0.15915493667125701904296875;
    int _197 = 1 & as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x);
    bool _199 = _197 != 0;
    float _201 = _195 * 6.283185482025146484375;
    float _203 = cos(_201);
    bool _205 = !_189;
    float _207 = _205 ? (-0.5) : 0.5;
    float _209 = -_185;
    float _211 = _169 + _209;
    bool _213 = !_193;
    float _215 = _213 ? (-0.5) : 0.5;
    bool _217 = !_155;
    float _219 = _175;
    if (!_217)
    {
        float _221 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _223 = log2(_221);
        float _225 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _227 = _225 + 1.0;
        float _229 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _231 = _145 * _223;
        float _233 = 1.0 / _227;
        float _235 = _229 * 0.693147182464599609375;
        float _237 = exp2(_231);
        float _239 = 1.0 / _235;
        float _241 = _237 + (-1.0);
        float _243 = -_241;
        float _245 = fma(_243, _239, _145);
        float _247 = _245 * _233;
        float _249 = _247 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _219 = _249;
    }
    float _251 = _219;
    bool _253 = !_155;
    if (!_253)
    {
        float _255 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _257 = log2(_255);
        float _259 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _261 = _259 + 1.0;
        float _263 = 1.0 / _261;
        float _265 = _145 * _257;
        float _267 = exp2(_265);
        float _269 = -_267;
        float _271 = _269 + 1.0;
        float _273 = _271 * _263;
        _161 = _273;
    }
    float _275 = _161;
    float _277 = fma(_203, 0.5, 0.5);
    int _279 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 2;
    bool _281 = _279 != 0;
    int _283 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 4;
    bool _285 = _283 != 0;
    float _287 = in.m_54.w;
    bool _289 = _211 < 0.5;
    float _291 = float(_289);
    float _293 = -_211;
    float _295 = fma(_293, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    bool _297 = !_199;
    int _299 = _297 ? 0 : 1;
    float _301 = in.m_42.x;
    float _303 = in.m_42.y;
    float _305 = in.m_42.z;
    bool _307 = !_281;
    int _309 = _307 ? 0 : 1;
    float _311 = _251 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _313 = -_291;
    float _315 = fma(_313, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    float _317 = -_277;
    float _319 = fma(_317, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    int _321 = abs(_309);
    float _323 = fma(_275, _177, _311);
    int _325 = abs(_299);
    float _327 = _251 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    bool _329 = !_285;
    int _331 = _329 ? 0 : 1;
    float _333 = fma(_275, _179, _327);
    bool _335 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    int _337 = abs(_331);
    float _339 = _251 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _341 = float(_321);
    float _343 = float(_325);
    float _345 = fma(_275, _181, _339);
    float _347 = abs(_295);
    float _349 = _341 * _347;
    float _351 = fma(_345, _287, _305);
    float _353 = float(_337);
    float _355 = fma(_343, _319, _349);
    float _357 = fma(_323, _287, _301);
    float _359 = fma(_333, _287, _303);
    float _361 = abs(_315);
    float _363 = fma(_353, _361, _355);
    bool _365 = !_335;
    float _381;
    if (!_365)
    {
        float _367 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _369 = _137 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _371 = fma(_369, (*spvDescriptorSet0.vp_c9)._m0[12].x, _117);
        float _373 = _371 * _367;
        float _375 = floor(_373);
        float _377 = -_375;
        float _379 = _373 + _377;
        _381 = _379;
        _383 = true;
    }
    else
    {
        float _385 = float(_83);
        float _387 = 1.0 / _385;
        float _389 = _117 * _387;
        _381 = _389;
    }
    _383 = false;
    float _391 = _381;
    float _393 = in.m_49.y;
    float _395 = float(as_type<int>((*spvDescriptorSet0.vp_c9)._m0[8].z));
    float _397 = _359 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _399 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _401 = _395 * _137;
    float _403 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _405 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _403;
    float _407 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _409 = _407 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    int _411 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _413 = _411 != 0;
    float _415 = fma(_357, (*spvDescriptorSet0.vp_c10)._m0[6].x, _397);
    float _417 = trunc(_401);
    int _419 = int(_417);
    int _421 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _423 = _421 != 0;
    float _425 = _359 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    bool _427 = _137 > 0.5;
    float _429 = fma(_351, (*spvDescriptorSet0.vp_c10)._m0[6].z, _415);
    float _431 = fma(_357, (*spvDescriptorSet0.vp_c10)._m0[5].x, _425);
    float _433 = -(*spvDescriptorSet0.vp_c9)._m0[146].w;
    float _435 = _433 + (*spvDescriptorSet0.vp_c9)._m0[147].w;
    float _437 = 1.0 / _405;
    float _439 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _441 = fma(_351, (*spvDescriptorSet0.vp_c10)._m0[5].z, _431);
    bool _443 = _393 > 0.5;
    float _445 = _439 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _447 = _441 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _449 = 1.0 / _409;
    float _451 = _359 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    int _453 = _419 << 4;
    int _455 = _453 + 1968;
    float _457 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _459 = _391 + _457;
    float _461 = fma(_357, (*spvDescriptorSet0.vp_c10)._m0[4].x, _451);
    float _463 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _465 = (*spvDescriptorSet0.vp_c9)._m0[146].w + _463;
    float _467 = _459 * _437;
    float _469 = 1.0 / _465;
    float _471 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _473 = (*spvDescriptorSet0.vp_c9)._m0[115].x * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _475 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _477 = _471 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _479 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _481 = _391 + _479;
    float _483 = fma(_351, (*spvDescriptorSet0.vp_c10)._m0[4].z, _461);
    float _485 = _475 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    uint _488 = uint(int(uint(_455) >> uint(2)));
    uint _490 = uint(int(uint(int(_488)) >> uint(2)));
    int _492 = int(_488) & 3;
    float _494 = (*spvDescriptorSet0.vp_c9)._m0[int(_490)][_492];
    int _496 = int(_488) + 1;
    uint _498 = uint(int(uint(_496) >> uint(2)));
    int _500 = _496 & 3;
    float _502 = (*spvDescriptorSet0.vp_c9)._m0[int(_498)][_500];
    float _504 = 1.0 / _435;
    float _506 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _508 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _506;
    float _510 = _481 * _449;
    out.m_56.x = _485;
    out.m_56.y = _477;
    out.m_56.z = _445;
    out.m_56.w = _473;
    float _512 = _483 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _514 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _516 = _447 + _514;
    float _518 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _520 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _518;
    float _522 = fma(_508, _467, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _524 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _526 = _512 + _524;
    float _528 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _530 = _391 + _528;
    float _532 = fma(_520, _467, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _534 = -(*spvDescriptorSet0.vp_c9)._m0[146].w;
    float _536 = _391 + _534;
    float _538 = _530 * _469;
    float _540 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    int _542 = _455 + 8;
    uint _544 = uint(int(uint(_542) >> uint(2)));
    uint _546 = uint(int(uint(int(_544)) >> uint(2)));
    int _548 = int(_544) & 3;
    float _550 = (*spvDescriptorSet0.vp_c9)._m0[int(_546)][_548];
    float _552 = -(*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _554 = (*spvDescriptorSet0.vp_c9)._m0[146].y + _552;
    float _556 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _558 = _556 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _560 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _562 = _560 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _564 = _429 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _566 = fma(_558, _510, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _568 = fma(_562, _510, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _570 = _516 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _572 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _574 = _564 + _572;
    float _576 = -(*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _578 = (*spvDescriptorSet0.vp_c9)._m0[146].x + _576;
    float _580 = _536 * _504;
    float _582 = fma(_526, (*spvDescriptorSet0.vp_c8)._m0[28].x, _570);
    float _584 = -(*spvDescriptorSet0.vp_c9)._m0[146].x;
    float _586 = _584 + (*spvDescriptorSet0.vp_c9)._m0[147].x;
    float _588 = -(*spvDescriptorSet0.vp_c9)._m0[146].y;
    float _590 = _588 + (*spvDescriptorSet0.vp_c9)._m0[147].y;
    float _592 = fma(_578, _538, (*spvDescriptorSet0.vp_c9)._m0[145].x);
    float _594 = fma(_574, (*spvDescriptorSet0.vp_c8)._m0[28].z, _582);
    float _596 = -_207;
    int _598 = _427 ? as_type<int>(_596) : as_type<int>(_207);
    float _600 = fma(_586, _580, (*spvDescriptorSet0.vp_c9)._m0[146].x);
    float _602 = fma(_590, _580, (*spvDescriptorSet0.vp_c9)._m0[146].y);
    bool _604 = _391 >= (*spvDescriptorSet0.vp_c9)._m0[147].w;
    bool _606 = isnan(_391);
    bool _608 = _604 || _606;
    bool _610 = isnan((*spvDescriptorSet0.vp_c9)._m0[147].w);
    bool _612 = _608 || _610;
    float _614 = float(_612);
    float _616 = fma(_554, _538, (*spvDescriptorSet0.vp_c9)._m0[145].y);
    bool _618 = !_413;
    float _620 = _618 ? _207 : as_type<float>(_598);
    bool _622 = _594 >= 0.0;
    float _624 = -_614;
    float _626 = _624 + 1.0;
    float _628 = _620 + 0.5;
    float _630 = -_215;
    int _632 = _443 ? as_type<int>(_630) : as_type<int>(_215);
    float _634 = _628 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _636 = _494 * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    bool _638 = _391 >= (*spvDescriptorSet0.vp_c9)._m0[146].w;
    bool _640 = isnan(_391);
    bool _642 = _638 || _640;
    bool _644 = isnan((*spvDescriptorSet0.vp_c9)._m0[146].w);
    bool _646 = _642 || _644;
    float _648 = float(_646);
    float _650 = _502 * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _652 = _634 * _399;
    float _654 = _516 * _516;
    bool _656 = _391 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _658 = isnan(_391);
    bool _660 = _656 || _658;
    bool _662 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _664 = _660 || _662;
    float _666 = float(_664);
    float _668 = -_648;
    float _670 = _668 + 1.0;
    bool _672 = !_423;
    float _674 = _672 ? _215 : as_type<float>(_632);
    float _676 = fma(_526, _526, _654);
    float _678 = _648 * _626;
    bool _680 = _391 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _682 = isnan(_391);
    bool _684 = _680 || _682;
    bool _686 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _688 = _684 || _686;
    float _690 = float(_688);
    float _692 = _666 * _670;
    float _694 = fma(_574, _574, _676);
    float _696 = -_674;
    float _698 = _696 + 0.5;
    float _700 = -_666;
    float _702 = _700 + 1.0;
    bool _704 = _391 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _706 = isnan(_391);
    bool _708 = _704 || _706;
    bool _710 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _712 = _708 || _710;
    float _714 = float(_712);
    float _716 = _550 * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _718 = _698 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _720 = rsqrt(_694);
    float _722 = _690 * _702;
    float _724 = -_690;
    float _726 = _724 + 1.0;
    float _728 = 0.0;
    int _730 = as_type<int>(_636);
    float _732 = _512;
    if (_622)
    {
        _728 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _734 = _728;
    float _736 = _718 * _540;
    float _738 = _650 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _740 = _714 * _726;
    float _742 = _636 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _744 = _716 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    if (_622)
    {
        float _746 = _734 * 5.0;
        _730 = as_type<int>(_746);
    }
    int _748 = _730;
    out.m_58.x = _652;
    out.m_58.y = _736;
    float _750 = _522 * _740;
    float _752 = _532 * _740;
    out.m_60.x = _742;
    out.m_60.y = _738;
    out.m_60.z = _744;
    float _754 = _516 * _720;
    float _756 = _526 * _720;
    if (_622)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2698 = as_type<float>(_748);
        out.gl_Position.z = _2698;
    }
    if (_622)
    {
        out.m_45.x = 0.0;
    }
    if (_622)
    {
        return out;
    }
    float _758 = -_754;
    float _760 = fma(_758, (*spvDescriptorSet0.vp_c9)._m0[18].w, _447);
    float _762 = _574 * _720;
    float _764 = -_756;
    float _766 = fma(_764, (*spvDescriptorSet0.vp_c9)._m0[18].w, _512);
    float _768 = -_754;
    float _770 = fma(_768, (*spvDescriptorSet0.vp_c9)._m0[18].w, _516);
    float _772 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _774 = _760 + _772;
    float _776 = -_762;
    float _778 = fma(_776, (*spvDescriptorSet0.vp_c9)._m0[18].w, _564);
    float _780 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _782 = _766 + _780;
    float _784 = in.m_54.x;
    float _786 = in.m_54.y;
    float _788 = _774 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _790 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _792 = _778 + _790;
    float _794 = -_714;
    float _796 = _794 + 1.0;
    float _798 = -_756;
    float _800 = fma(_798, (*spvDescriptorSet0.vp_c9)._m0[18].w, _526);
    float _802 = fma(_782, (*spvDescriptorSet0.vp_c8)._m0[28].x, _788);
    float _804 = _770 * _770;
    float _806 = fma(_796, (*spvDescriptorSet0.vp_c9)._m0[143].x, _750);
    float _808 = fma(_796, (*spvDescriptorSet0.vp_c9)._m0[143].y, _752);
    float _810 = fma(_792, (*spvDescriptorSet0.vp_c8)._m0[28].z, _802);
    float _812 = fma(_800, _800, _804);
    float _814 = -_762;
    float _816 = fma(_814, (*spvDescriptorSet0.vp_c9)._m0[18].w, _574);
    float _818 = fma(_566, _722, _806);
    float _820 = fma(_568, _722, _808);
    bool _822 = _810 >= 0.0;
    float _824 = fma(_816, _816, _812);
    float _826 = fma(_592, _692, _818);
    float _828 = fma(_616, _692, _820);
    float _830 = fma(_600, _678, _826);
    float _832 = fma(_602, _678, _828);
    float _834 = sqrt(_824);
    float _836 = fma(_614, (*spvDescriptorSet0.vp_c9)._m0[147].x, _830);
    float _838 = fma(_614, (*spvDescriptorSet0.vp_c9)._m0[147].y, _832);
    float _840 = _804;
    if (_822)
    {
        _840 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _842 = _840;
    float _844 = _836 * _784;
    float _846 = _838 * _786;
    int _848 = as_type<int>(_842);
    if (_822)
    {
        out.m_45.x = 0.0;
    }
    if (_822)
    {
        float _850 = _842 * 5.0;
        _848 = as_type<int>(_850);
    }
    int _852 = _848;
    float _854 = _363 * _844;
    float _856 = _363 * _846;
    if (_822)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2891 = as_type<float>(_852);
        out.gl_Position.z = _2891;
    }
    float _858 = _720 * _834;
    if (_822)
    {
        return out;
    }
    float _860 = _856 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _862 = _854 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _864 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _215);
    float _866 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _207);
    float _868 = _858 * _860;
    float _870 = _858 * _862;
    float _872 = _858 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _874 = _872 * 0.5;
    float _876 = _864 * _868;
    float _878 = _866 * _870;
    bool _880 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[660].y;
    bool _882 = isnan(0.5);
    bool _884 = _880 || _882;
    bool _886 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _888 = _884 || _886;
    float _890 = _876 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _892 = _876 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    bool _894 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[653].w;
    bool _896 = isnan(0.5);
    bool _898 = _894 || _896;
    bool _900 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _902 = _898 || _900;
    float _904 = fma(_878, (*spvDescriptorSet0.vp_c8)._m0[26].x, _890);
    float _906 = fma(_878, (*spvDescriptorSet0.vp_c8)._m0[24].x, _892);
    float _908 = _760 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _910 = fma(_874, (*spvDescriptorSet0.vp_c8)._m0[26].z, _904);
    float _912 = fma(_874, (*spvDescriptorSet0.vp_c8)._m0[24].z, _906);
    float _914 = _910 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _916 = _912 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _918 = _564 + _914;
    float _920 = _512 + _916;
    float _922 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _924 = _918 + _922;
    float _926 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _928 = _920 + _926;
    float _930 = _924 * _924;
    float _932 = fma(_928, _928, _930);
    float _934 = _760 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _936 = sqrt(_932);
    float _938 = fma(_766, (*spvDescriptorSet0.vp_c8)._m0[11].x, _934);
    float _940 = _876 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _942 = fma(_766, (*spvDescriptorSet0.vp_c8)._m0[10].x, _908);
    float _944 = fma(_778, (*spvDescriptorSet0.vp_c8)._m0[11].z, _938);
    float _946 = fma(_878, (*spvDescriptorSet0.vp_c8)._m0[25].x, _940);
    float _948 = fma(_778, (*spvDescriptorSet0.vp_c8)._m0[10].z, _942);
    float _950 = _944 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _952 = fma(_874, (*spvDescriptorSet0.vp_c8)._m0[25].z, _946);
    float _954 = _948 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _956 = 1.0 / _950;
    float _958 = _952 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _960 = _954 + _950;
    bool _962 = _936 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _964 = _447 + _958;
    float _966 = _908;
    float _968 = _944;
    float _970 = _920;
    float _972 = _958;
    float _974 = _960;
    float _976 = _918;
    if (!_962)
    {
        _966 = _918;
    }
    float _978 = _966;
    float _980 = _978;
    if (!_962)
    {
        _968 = _964;
    }
    float _982 = _968;
    bool _984 = !_962;
    float _986 = _982;
    if (!_984)
    {
        float _988 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _990 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _992 = _936 + _990;
        float _994 = rsqrt(_932);
        float _996 = _992 * _988;
        float _998 = _964 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1000 = _996 * 0.15915493667125701904296875;
        float _1002 = _1000 * 6.283185482025146484375;
        float _1004 = sin(_1002);
        float _1006 = _1000 * 6.283185482025146484375;
        float _1008 = cos(_1006);
        float _1010 = fma(_1004, _998, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1012 = _994 * _1010;
        float _1014 = _1008 + (-1.0);
        float _1016 = fma(_928, _1012, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1018 = fma(_924, _1012, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        float _1020 = _1014 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1022 = fma(_964, _1008, _1020);
        _986 = _1022;
        _970 = _1016;
        _980 = _1018;
        _972 = _1004;
    }
    float _1024 = _986;
    float _1026 = _970;
    float _1028 = _980;
    float _1030 = _972;
    float _1032 = -_754;
    float _1034 = fma(_1032, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1024);
    float _1036 = _960 * _956;
    float _1038 = _1036 * 0.5;
    float _1040 = -_756;
    float _1042 = fma(_1040, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1026);
    float _1044 = -_762;
    float _1046 = fma(_1044, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1028);
    float _1048 = _1030;
    float _1050 = _1042;
    float _1052 = _1046;
    if (_902)
    {
        _1048 = 1.0;
    }
    float _1054 = _1048;
    float _1056 = _1054;
    if (_888)
    {
        _974 = _1034;
    }
    float _1058 = _974;
    float _1060 = _1058;
    if (!_888)
    {
        float _1062 = _774 * _774;
        float _1064 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _1066 = -_564;
        float _1068 = _1066 + _1028;
        float _1070 = fma(_782, _782, _1062);
        float _1072 = fma(_792, _792, _1070);
        float _1074 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1076 = sqrt(_1072);
        float _1078 = 1.0 / _858;
        float _1080 = precise::min(_1076, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _1082 = _1080 * _1064;
        float _1084 = _1074 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1086 = _1082 * _1078;
        float _1088 = -_512;
        float _1090 = _1088 + _1026;
        float _1092 = -_447;
        float _1094 = _1092 + _1024;
        float _1096 = _1084 * _1086;
        float _1098 = _1068 * _1086;
        float _1100 = fma(_1090, _1096, _766);
        float _1102 = fma(_1094, _1096, _760);
        float _1104 = fma(_1084, _1098, _778);
        _1060 = _1102;
        _1050 = _1100;
        _1052 = _1104;
        _732 = _1096;
    }
    float _1106 = _1060;
    float _1108 = _1050;
    float _1110 = _1052;
    float _1112 = _732;
    float _1114 = _1112;
    if (!_902)
    {
        float _1116 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1118 = _1116 * 0.15915493667125701904296875;
        float _1120 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1122 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
        float _1124 = fma(_1038, (*spvDescriptorSet0.vp_c8)._m0[30].w, _1122);
        float _1126 = _1118 * 6.283185482025146484375;
        float _1128 = cos(_1126);
        float _1130 = _1120 * 0.15915493667125701904296875;
        float _1132 = _1118 * 6.283185482025146484375;
        float _1134 = sin(_1132);
        float _1136 = 1.0 / _1128;
        float _1138 = _1130 * 6.283185482025146484375;
        float _1140 = cos(_1138);
        float _1142 = _1134 * _1136;
        float _1144 = _1130 * 6.283185482025146484375;
        float _1146 = sin(_1144);
        float _1148 = _1140 * _1142;
        float _1150 = 1.0 / _1124;
        float _1152 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1154 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _1152;
        float _1156 = 1.0 / _1148;
        float _1158 = 1.0 / _1154;
        float _1160 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
        float _1162 = _1150 * _1160;
        float _1164 = _1146 * _1156;
        float _1166 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1168 = fma(_1164, _1162, _1166);
        float _1170 = _1168 * _1158;
        float _1172 = precise::clamp(_1170, 0.0, 1.0);
        _1114 = _1158;
        _1056 = _1172;
    }
    float _1174 = _1114;
    float _1176 = _1056;
    float _1178 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1180 = _1106 + _1178;
    float _1182 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1184 = _1108 + _1182;
    float _1186 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1188 = _1110 + _1186;
    float _1190 = _1180 * _1180;
    float _1192 = fma(_1184, _1184, _1190);
    float _1194 = fma(_1188, _1188, _1192);
    float _1196 = rsqrt(_1194);
    float _1198 = _1196 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1200 = _1184 * _1198;
    float _1202 = _1188 * _1198;
    float _1204 = _1200 * _1200;
    float _1206 = _1202 * _1202;
    float _1208 = _1204 + _1206;
    float _1210 = sqrt(_1208);
    bool _1212 = _1210 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1214 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1216 = _1210 + _1214;
    float _1218 = _1192;
    float _1220 = _1216;
    float _1222 = _1174;
    float _1224 = _1180;
    float _1226 = _1200;
    if (_1212)
    {
        float _1228 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1218 = _1228;
    }
    float _1230 = _1218;
    float _1232 = _1230;
    if (_1212)
    {
        float _1234 = _1216 * _1230;
        _1220 = _1234;
    }
    float _1236 = _1220;
    if (_1212)
    {
        float _1238 = rsqrt(_1208);
        _1232 = _1238;
    }
    float _1240 = _1232;
    float _1242 = _1240;
    if (_1212)
    {
        float _1244 = _1236 * 0.15915493667125701904296875;
        _1222 = _1244;
    }
    float _1246 = _1222;
    float _1248 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _1250 = _1196;
    float _1252 = _1246;
    if (_1212)
    {
        float _1254 = _1246 * 6.283185482025146484375;
        float _1256 = sin(_1254);
        _1250 = _1256;
    }
    float _1258 = _1250;
    float _1260 = precise::max(0.0, _1248);
    float _1262 = _1188;
    float _1264 = _1260;
    if (_1212)
    {
        float _1266 = _1246 * 6.283185482025146484375;
        float _1268 = cos(_1266);
        _1262 = _1268;
    }
    float _1270 = _1262;
    float _1272 = -_1198;
    float _1274 = -_1260;
    float _1276 = fma(_1180, _1272, _1274);
    if (_1212)
    {
        float _1278 = _1276 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1224 = _1278;
    }
    float _1280 = _1224;
    float _1282 = _1258;
    float _1284 = _1280;
    if (_1212)
    {
        float _1286 = fma(_1258, _1280, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1282 = _1286;
    }
    float _1288 = _1282;
    if (!_1212)
    {
        _1284 = _1202;
    }
    float _1290 = _1284;
    float _1292 = _1290;
    if (_1212)
    {
        float _1294 = _1240 * _1288;
        _976 = _1294;
    }
    float _1296 = _976;
    if (!_1212)
    {
        _1242 = _1276;
    }
    float _1298 = _1242;
    float _1300 = sqrt(_1194);
    float _1302 = _1298;
    float _1304 = _1270;
    if (_1212)
    {
        float _1306 = _1270 + (-1.0);
        _1264 = _1306;
    }
    float _1308 = _1264;
    float _1310 = _1308;
    if (_1212)
    {
        float _1312 = _1200 * _1296;
        _1226 = _1312;
    }
    float _1314 = _1226;
    if (_1212)
    {
        float _1316 = _1202 * _1296;
        _1292 = _1316;
    }
    float _1318 = _1292;
    if (_1212)
    {
        float _1320 = _1308 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1252 = _1320;
    }
    float _1322 = _1252;
    if (!_1212)
    {
        _1310 = _1204;
    }
    float _1324 = _1310;
    float _1326 = _1324;
    if (_1212)
    {
        float _1328 = _1314 * _1314;
        _1326 = _1328;
    }
    float _1330 = _1326;
    if (_1212)
    {
        float _1332 = fma(_1276, _1270, _1322);
        _1302 = _1332;
    }
    float _1334 = _1302;
    if (!_1212)
    {
        _1304 = _1206;
    }
    float _1336 = _1304;
    float _1338 = _1336;
    if (_1212)
    {
        float _1340 = _1318 * _1318;
        _1338 = _1340;
    }
    float _1342 = _1338;
    float _1344 = fma(_1334, _1334, _1330);
    float _1346 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _1348 = fma(_1300, (*spvDescriptorSet0.vp_c15)._m0[23].w, _1346);
    float _1350 = precise::clamp(_1348, 0.0, 1.0);
    float _1352 = _1344 + _1342;
    float _1354 = _1106 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1356 = _1106 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1358 = -_1350;
    float _1360 = _1358 + 1.0;
    float _1362 = rsqrt(_1352);
    float _1364 = fma(_1108, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1354);
    float _1366 = _1106 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1368 = fma(_1108, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1356);
    float _1370 = _1106 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1372 = fma(_1110, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1364);
    float _1374 = fma(_1108, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1366);
    float _1376 = fma(_1110, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1368);
    float _1378 = abs(_1360);
    float _1380 = log2(_1378);
    float _1382 = fma(_1108, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1370);
    float _1384 = fma(_1110, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1374);
    float _1386 = _1376 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1388 = _1372 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1390 = fma(_1110, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1382);
    float _1392 = _1384 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1394 = _1386 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1396 = _1362 * _1314;
    float _1398 = _1362 * _1334;
    float _1400 = _1362 * _1318;
    float _1402 = fma(_1392, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1394);
    float _1404 = _1396 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _1406 = (-1.0) + (*spvDescriptorSet0.vp_c15)._m0[20].x;
    float _1408 = _1388 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _1410 = _1390 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1412 = -_1404;
    float _1414 = fma(_1398, (*spvDescriptorSet0.vp_c15)._m0[21].y, _1412);
    float _1416 = fma(_1388, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1402);
    float _1418 = -_1408;
    float _1420 = fma(_1418, _1406, 1.0);
    float _1422 = _1380 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _1424 = -_1400;
    float _1426 = fma(_1424, (*spvDescriptorSet0.vp_c15)._m0[21].z, _1414);
    float _1428 = fma(_1410, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1416);
    float _1430 = _1386 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1432 = exp2(_1422);
    float _1434 = fma(_1426, -0.5, 0.5);
    float _1436 = _1386 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1438 = fma(_1392, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1430);
    float _1440 = fma(_1426, 0.5, 0.5);
    float _1442 = _1398 + 1.0;
    float _1444 = fma(_1392, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1436);
    float _1446 = fma(_1388, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1438);
    float _1448 = log2(_1420);
    float _1450 = fma(_1440, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _1452 = fma(_1388, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1444);
    float _1454 = fma(_1410, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1446);
    float _1456 = fma(_1440, _1450, -0.212114393711090087890625);
    float _1458 = fma(_1410, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1452);
    float _1460 = 1.0 / _1428;
    float _1462 = -_1398;
    float _1464 = fma(_1432, _1442, _1462);
    float _1466 = fma(_1440, _1456, 1.570728778839111328125);
    float _1468 = fma(_1464, 0.5, 0.5);
    float _1470 = sqrt(_1434);
    float _1472 = _1448 * 0.693147182464599609375;
    float _1474 = _1472 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _1476 = _1454 * _1460;
    float _1478 = _1458 * _1460;
    float _1480 = fma(_1476, 0.5, 0.5);
    float _1482 = fma(_1478, -0.5, 0.5);
    float _1484 = _1470 * 0.636619746685028076171875;
    float3 _3904 = float3(_1480, _1482, _1474);
    float _1486 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_3904, float3(0.0), isnan(_3904)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_3904, float3(0.0), isnan(_3904)), level(0.0)).x;
    float3 _3915 = float3(_1480, _1482, _1474);
    float4 _1489 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_3915, float3(0.0), isnan(_3915)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_3915, float3(0.0), isnan(_3915)), level(0.0)).xyzw;
    float _1491 = _1489.x;
    float _1493 = _1489.y;
    float _1495 = _1489.z;
    float _1497 = _1489.w;
    float _1499 = -_1466;
    float _1501 = fma(_1484, _1499, 1.0);
    float2 _3937 = float2(_1501, _1468);
    float3 _1505 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_3937, float2(0.0), isnan(_3937)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_3937, float2(0.0), isnan(_3937)), level(0.0)).xyz;
    float _1507 = _1505.x;
    float _1509 = _1505.y;
    float _1511 = _1505.z;
    float _1513 = _1380 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _1515 = _1386 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    bool _1517 = _1176 > 0.0;
    bool _1519 = isnan(_1176);
    bool _1521 = _1517 || _1519;
    bool _1523 = isnan(0.0);
    bool _1525 = _1521 || _1523;
    float _1527 = _1176 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _1529 = fma(_1392, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1515);
    float _1531 = exp2(_1513);
    float _1533 = fma(_1388, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1529);
    float _1535 = fma(_1410, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1533);
    float _1537 = _1535 + _1428;
    out.gl_Position.x = _1454;
    out.gl_Position.y = _1458;
    out.gl_Position.z = _1535;
    out.gl_Position.w = _1428;
    float _1539 = _1537 * 0.5;
    float _1541 = -_1531;
    float _1543 = _1541 + 1.0;
    float _1545 = _1527 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _1547 = _1543 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    out.m_62.z = _1539;
    out.m_62.w = _1428;
    out.m_45.x = _1545;
    float _1549 = _1547 * _1486;
    float _1551 = -_1547;
    float _1553 = _1551 + 1.0;
    float _1555 = _1497 * _1549;
    float _1557 = _1497 * _1553;
    float _1559 = _1511 * _1549;
    float _1561 = fma(_1507, _1555, _1491);
    float _1563 = fma(_1509, _1555, _1493);
    float _1565 = fma(_1497, _1559, _1495);
    out.m_64.x = _1561;
    out.m_64.y = _1563;
    out.m_64.z = _1565;
    out.m_64.w = _1557;
    if (_1525)
    {
        return out;
    }
    out.m_45.x = 0.0;
    float _1567 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _1567;
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
    out.m_56 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_60 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_62 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_45 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_58 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_64 = float4(0.0, 0.0, 0.0, 1.0);
    bool _383 = false;
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
        float _1624 = as_type<float>(_99);
        out.gl_Position.z = _1624;
    }
    if (!_87)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_56.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_56.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_56.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_56.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_60.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_60.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_60.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_60.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_62.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_62.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_62.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_62.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_45.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_45.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_45.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_45.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_58.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_58.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_58.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_58.w)); dm_cw(dm_gs, dm_p, 36, 0u); dm_cw(dm_gs, dm_p, 37, 0u); dm_cw(dm_gs, dm_p, 38, 0u); dm_cw(dm_gs, dm_p, 39, 0x3f800000u); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_64.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_64.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_64.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_64.w)); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
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
        float _1693 = as_type<float>(_135);
        out.gl_Position.z = _1693;
    }
    if (_127)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_56.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_56.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_56.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_56.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_60.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_60.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_60.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_60.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_62.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_62.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_62.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_62.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_45.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_45.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_45.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_45.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_58.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_58.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_58.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_58.w)); dm_cw(dm_gs, dm_p, 36, 0u); dm_cw(dm_gs, dm_p, 37, 0u); dm_cw(dm_gs, dm_p, 38, 0u); dm_cw(dm_gs, dm_p, 39, 0x3f800000u); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_64.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_64.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_64.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_64.w)); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _137 = in.m_49.x;
    float _139 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[19].z;
    float _141 = _117 + (*spvDescriptorSet0.vp_c9)._m0[20].z;
    float _143 = as_type<float>(int(gl_VertexIndex));
    float _145 = _117 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
    bool _147 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
    bool _149 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
    bool _151 = _147 || _149;
    bool _153 = isnan(1.0);
    bool _155 = _151 || _153;
    float _157 = _141 * _139;
    float _159 = 0.0;
    float _161 = _145;
    if (!_155)
    {
        float _163 = _145 * _145;
        float _165 = _163 * 0.5;
        _159 = _165;
    }
    float _167 = _159;
    float _169 = fma(_137, (*spvDescriptorSet0.vp_c9)._m0[20].x, _157);
    float _171 = _167;
    if (!_155)
    {
        float _173 = _167 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _171 = _173;
    }
    float _175 = _171;
    float _177 = in.m_47.x;
    float _179 = in.m_47.y;
    float _181 = in.m_47.z;
    float _183 = _169 * 6.283185482025146484375;
    float _185 = floor(_169);
    int _187 = as_type<int>(_143) & 1;
    bool _189 = _187 != 0;
    int _191 = as_type<int>(_143) & 2;
    bool _193 = _191 != 0;
    float _195 = _183 * 0.15915493667125701904296875;
    int _197 = 1 & as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x);
    bool _199 = _197 != 0;
    float _201 = _195 * 6.283185482025146484375;
    float _203 = cos(_201);
    bool _205 = !_189;
    float _207 = _205 ? (-0.5) : 0.5;
    float _209 = -_185;
    float _211 = _169 + _209;
    bool _213 = !_193;
    float _215 = _213 ? (-0.5) : 0.5;
    bool _217 = !_155;
    float _219 = _175;
    if (!_217)
    {
        float _221 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _223 = log2(_221);
        float _225 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _227 = _225 + 1.0;
        float _229 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _231 = _145 * _223;
        float _233 = 1.0 / _227;
        float _235 = _229 * 0.693147182464599609375;
        float _237 = exp2(_231);
        float _239 = 1.0 / _235;
        float _241 = _237 + (-1.0);
        float _243 = -_241;
        float _245 = fma(_243, _239, _145);
        float _247 = _245 * _233;
        float _249 = _247 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _219 = _249;
    }
    float _251 = _219;
    bool _253 = !_155;
    if (!_253)
    {
        float _255 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _257 = log2(_255);
        float _259 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _261 = _259 + 1.0;
        float _263 = 1.0 / _261;
        float _265 = _145 * _257;
        float _267 = exp2(_265);
        float _269 = -_267;
        float _271 = _269 + 1.0;
        float _273 = _271 * _263;
        _161 = _273;
    }
    float _275 = _161;
    float _277 = fma(_203, 0.5, 0.5);
    int _279 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 2;
    bool _281 = _279 != 0;
    int _283 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 4;
    bool _285 = _283 != 0;
    float _287 = in.m_54.w;
    bool _289 = _211 < 0.5;
    float _291 = float(_289);
    float _293 = -_211;
    float _295 = fma(_293, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    bool _297 = !_199;
    int _299 = _297 ? 0 : 1;
    float _301 = in.m_42.x;
    float _303 = in.m_42.y;
    float _305 = in.m_42.z;
    bool _307 = !_281;
    int _309 = _307 ? 0 : 1;
    float _311 = _251 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _313 = -_291;
    float _315 = fma(_313, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    float _317 = -_277;
    float _319 = fma(_317, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    int _321 = abs(_309);
    float _323 = fma(_275, _177, _311);
    int _325 = abs(_299);
    float _327 = _251 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    bool _329 = !_285;
    int _331 = _329 ? 0 : 1;
    float _333 = fma(_275, _179, _327);
    bool _335 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    int _337 = abs(_331);
    float _339 = _251 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _341 = float(_321);
    float _343 = float(_325);
    float _345 = fma(_275, _181, _339);
    float _347 = abs(_295);
    float _349 = _341 * _347;
    float _351 = fma(_345, _287, _305);
    float _353 = float(_337);
    float _355 = fma(_343, _319, _349);
    float _357 = fma(_323, _287, _301);
    float _359 = fma(_333, _287, _303);
    float _361 = abs(_315);
    float _363 = fma(_353, _361, _355);
    bool _365 = !_335;
    float _381;
    if (!_365)
    {
        float _367 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _369 = _137 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _371 = fma(_369, (*spvDescriptorSet0.vp_c9)._m0[12].x, _117);
        float _373 = _371 * _367;
        float _375 = floor(_373);
        float _377 = -_375;
        float _379 = _373 + _377;
        _381 = _379;
        _383 = true;
    }
    else
    {
        float _385 = float(_83);
        float _387 = 1.0 / _385;
        float _389 = _117 * _387;
        _381 = _389;
    }
    _383 = false;
    float _391 = _381;
    float _393 = in.m_49.y;
    float _395 = float(as_type<int>((*spvDescriptorSet0.vp_c9)._m0[8].z));
    float _397 = _359 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _399 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _401 = _395 * _137;
    float _403 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _405 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _403;
    float _407 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _409 = _407 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    int _411 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _413 = _411 != 0;
    float _415 = fma(_357, (*spvDescriptorSet0.vp_c10)._m0[6].x, _397);
    float _417 = trunc(_401);
    int _419 = int(_417);
    int _421 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _423 = _421 != 0;
    float _425 = _359 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    bool _427 = _137 > 0.5;
    float _429 = fma(_351, (*spvDescriptorSet0.vp_c10)._m0[6].z, _415);
    float _431 = fma(_357, (*spvDescriptorSet0.vp_c10)._m0[5].x, _425);
    float _433 = -(*spvDescriptorSet0.vp_c9)._m0[146].w;
    float _435 = _433 + (*spvDescriptorSet0.vp_c9)._m0[147].w;
    float _437 = 1.0 / _405;
    float _439 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _441 = fma(_351, (*spvDescriptorSet0.vp_c10)._m0[5].z, _431);
    bool _443 = _393 > 0.5;
    float _445 = _439 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _447 = _441 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _449 = 1.0 / _409;
    float _451 = _359 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    int _453 = _419 << 4;
    int _455 = _453 + 1968;
    float _457 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _459 = _391 + _457;
    float _461 = fma(_357, (*spvDescriptorSet0.vp_c10)._m0[4].x, _451);
    float _463 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _465 = (*spvDescriptorSet0.vp_c9)._m0[146].w + _463;
    float _467 = _459 * _437;
    float _469 = 1.0 / _465;
    float _471 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _473 = (*spvDescriptorSet0.vp_c9)._m0[115].x * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _475 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _477 = _471 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _479 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _481 = _391 + _479;
    float _483 = fma(_351, (*spvDescriptorSet0.vp_c10)._m0[4].z, _461);
    float _485 = _475 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    uint _488 = uint(int(uint(_455) >> uint(2)));
    uint _490 = uint(int(uint(int(_488)) >> uint(2)));
    int _492 = int(_488) & 3;
    float _494 = (*spvDescriptorSet0.vp_c9)._m0[int(_490)][_492];
    int _496 = int(_488) + 1;
    uint _498 = uint(int(uint(_496) >> uint(2)));
    int _500 = _496 & 3;
    float _502 = (*spvDescriptorSet0.vp_c9)._m0[int(_498)][_500];
    float _504 = 1.0 / _435;
    float _506 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _508 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _506;
    float _510 = _481 * _449;
    out.m_56.x = _485;
    out.m_56.y = _477;
    out.m_56.z = _445;
    out.m_56.w = _473;
    float _512 = _483 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _514 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _516 = _447 + _514;
    float _518 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _520 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _518;
    float _522 = fma(_508, _467, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _524 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _526 = _512 + _524;
    float _528 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _530 = _391 + _528;
    float _532 = fma(_520, _467, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _534 = -(*spvDescriptorSet0.vp_c9)._m0[146].w;
    float _536 = _391 + _534;
    float _538 = _530 * _469;
    float _540 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    int _542 = _455 + 8;
    uint _544 = uint(int(uint(_542) >> uint(2)));
    uint _546 = uint(int(uint(int(_544)) >> uint(2)));
    int _548 = int(_544) & 3;
    float _550 = (*spvDescriptorSet0.vp_c9)._m0[int(_546)][_548];
    float _552 = -(*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _554 = (*spvDescriptorSet0.vp_c9)._m0[146].y + _552;
    float _556 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _558 = _556 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _560 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _562 = _560 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _564 = _429 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _566 = fma(_558, _510, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _568 = fma(_562, _510, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _570 = _516 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _572 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _574 = _564 + _572;
    float _576 = -(*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _578 = (*spvDescriptorSet0.vp_c9)._m0[146].x + _576;
    float _580 = _536 * _504;
    float _582 = fma(_526, (*spvDescriptorSet0.vp_c8)._m0[28].x, _570);
    float _584 = -(*spvDescriptorSet0.vp_c9)._m0[146].x;
    float _586 = _584 + (*spvDescriptorSet0.vp_c9)._m0[147].x;
    float _588 = -(*spvDescriptorSet0.vp_c9)._m0[146].y;
    float _590 = _588 + (*spvDescriptorSet0.vp_c9)._m0[147].y;
    float _592 = fma(_578, _538, (*spvDescriptorSet0.vp_c9)._m0[145].x);
    float _594 = fma(_574, (*spvDescriptorSet0.vp_c8)._m0[28].z, _582);
    float _596 = -_207;
    int _598 = _427 ? as_type<int>(_596) : as_type<int>(_207);
    float _600 = fma(_586, _580, (*spvDescriptorSet0.vp_c9)._m0[146].x);
    float _602 = fma(_590, _580, (*spvDescriptorSet0.vp_c9)._m0[146].y);
    bool _604 = _391 >= (*spvDescriptorSet0.vp_c9)._m0[147].w;
    bool _606 = isnan(_391);
    bool _608 = _604 || _606;
    bool _610 = isnan((*spvDescriptorSet0.vp_c9)._m0[147].w);
    bool _612 = _608 || _610;
    float _614 = float(_612);
    float _616 = fma(_554, _538, (*spvDescriptorSet0.vp_c9)._m0[145].y);
    bool _618 = !_413;
    float _620 = _618 ? _207 : as_type<float>(_598);
    bool _622 = _594 >= 0.0;
    float _624 = -_614;
    float _626 = _624 + 1.0;
    float _628 = _620 + 0.5;
    float _630 = -_215;
    int _632 = _443 ? as_type<int>(_630) : as_type<int>(_215);
    float _634 = _628 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _636 = _494 * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    bool _638 = _391 >= (*spvDescriptorSet0.vp_c9)._m0[146].w;
    bool _640 = isnan(_391);
    bool _642 = _638 || _640;
    bool _644 = isnan((*spvDescriptorSet0.vp_c9)._m0[146].w);
    bool _646 = _642 || _644;
    float _648 = float(_646);
    float _650 = _502 * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _652 = _634 * _399;
    float _654 = _516 * _516;
    bool _656 = _391 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _658 = isnan(_391);
    bool _660 = _656 || _658;
    bool _662 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _664 = _660 || _662;
    float _666 = float(_664);
    float _668 = -_648;
    float _670 = _668 + 1.0;
    bool _672 = !_423;
    float _674 = _672 ? _215 : as_type<float>(_632);
    float _676 = fma(_526, _526, _654);
    float _678 = _648 * _626;
    bool _680 = _391 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _682 = isnan(_391);
    bool _684 = _680 || _682;
    bool _686 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _688 = _684 || _686;
    float _690 = float(_688);
    float _692 = _666 * _670;
    float _694 = fma(_574, _574, _676);
    float _696 = -_674;
    float _698 = _696 + 0.5;
    float _700 = -_666;
    float _702 = _700 + 1.0;
    bool _704 = _391 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _706 = isnan(_391);
    bool _708 = _704 || _706;
    bool _710 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _712 = _708 || _710;
    float _714 = float(_712);
    float _716 = _550 * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _718 = _698 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _720 = rsqrt(_694);
    float _722 = _690 * _702;
    float _724 = -_690;
    float _726 = _724 + 1.0;
    float _728 = 0.0;
    int _730 = as_type<int>(_636);
    float _732 = _512;
    if (_622)
    {
        _728 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _734 = _728;
    float _736 = _718 * _540;
    float _738 = _650 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _740 = _714 * _726;
    float _742 = _636 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _744 = _716 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    if (_622)
    {
        float _746 = _734 * 5.0;
        _730 = as_type<int>(_746);
    }
    int _748 = _730;
    out.m_58.x = _652;
    out.m_58.y = _736;
    float _750 = _522 * _740;
    float _752 = _532 * _740;
    out.m_60.x = _742;
    out.m_60.y = _738;
    out.m_60.z = _744;
    float _754 = _516 * _720;
    float _756 = _526 * _720;
    if (_622)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2698 = as_type<float>(_748);
        out.gl_Position.z = _2698;
    }
    if (_622)
    {
        out.m_45.x = 0.0;
    }
    if (_622)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_56.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_56.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_56.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_56.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_60.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_60.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_60.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_60.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_62.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_62.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_62.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_62.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_45.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_45.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_45.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_45.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_58.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_58.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_58.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_58.w)); dm_cw(dm_gs, dm_p, 36, 0u); dm_cw(dm_gs, dm_p, 37, 0u); dm_cw(dm_gs, dm_p, 38, 0u); dm_cw(dm_gs, dm_p, 39, 0x3f800000u); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_64.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_64.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_64.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_64.w)); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _758 = -_754;
    float _760 = fma(_758, (*spvDescriptorSet0.vp_c9)._m0[18].w, _447);
    float _762 = _574 * _720;
    float _764 = -_756;
    float _766 = fma(_764, (*spvDescriptorSet0.vp_c9)._m0[18].w, _512);
    float _768 = -_754;
    float _770 = fma(_768, (*spvDescriptorSet0.vp_c9)._m0[18].w, _516);
    float _772 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _774 = _760 + _772;
    float _776 = -_762;
    float _778 = fma(_776, (*spvDescriptorSet0.vp_c9)._m0[18].w, _564);
    float _780 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _782 = _766 + _780;
    float _784 = in.m_54.x;
    float _786 = in.m_54.y;
    float _788 = _774 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _790 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _792 = _778 + _790;
    float _794 = -_714;
    float _796 = _794 + 1.0;
    float _798 = -_756;
    float _800 = fma(_798, (*spvDescriptorSet0.vp_c9)._m0[18].w, _526);
    float _802 = fma(_782, (*spvDescriptorSet0.vp_c8)._m0[28].x, _788);
    float _804 = _770 * _770;
    float _806 = fma(_796, (*spvDescriptorSet0.vp_c9)._m0[143].x, _750);
    float _808 = fma(_796, (*spvDescriptorSet0.vp_c9)._m0[143].y, _752);
    float _810 = fma(_792, (*spvDescriptorSet0.vp_c8)._m0[28].z, _802);
    float _812 = fma(_800, _800, _804);
    float _814 = -_762;
    float _816 = fma(_814, (*spvDescriptorSet0.vp_c9)._m0[18].w, _574);
    float _818 = fma(_566, _722, _806);
    float _820 = fma(_568, _722, _808);
    bool _822 = _810 >= 0.0;
    float _824 = fma(_816, _816, _812);
    float _826 = fma(_592, _692, _818);
    float _828 = fma(_616, _692, _820);
    float _830 = fma(_600, _678, _826);
    float _832 = fma(_602, _678, _828);
    float _834 = sqrt(_824);
    float _836 = fma(_614, (*spvDescriptorSet0.vp_c9)._m0[147].x, _830);
    float _838 = fma(_614, (*spvDescriptorSet0.vp_c9)._m0[147].y, _832);
    float _840 = _804;
    if (_822)
    {
        _840 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _842 = _840;
    float _844 = _836 * _784;
    float _846 = _838 * _786;
    int _848 = as_type<int>(_842);
    if (_822)
    {
        out.m_45.x = 0.0;
    }
    if (_822)
    {
        float _850 = _842 * 5.0;
        _848 = as_type<int>(_850);
    }
    int _852 = _848;
    float _854 = _363 * _844;
    float _856 = _363 * _846;
    if (_822)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2891 = as_type<float>(_852);
        out.gl_Position.z = _2891;
    }
    float _858 = _720 * _834;
    if (_822)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_56.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_56.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_56.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_56.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_60.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_60.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_60.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_60.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_62.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_62.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_62.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_62.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_45.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_45.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_45.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_45.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_58.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_58.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_58.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_58.w)); dm_cw(dm_gs, dm_p, 36, 0u); dm_cw(dm_gs, dm_p, 37, 0u); dm_cw(dm_gs, dm_p, 38, 0u); dm_cw(dm_gs, dm_p, 39, 0x3f800000u); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_64.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_64.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_64.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_64.w)); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _860 = _856 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _862 = _854 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _864 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _215);
    float _866 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _207);
    float _868 = _858 * _860;
    float _870 = _858 * _862;
    float _872 = _858 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _874 = _872 * 0.5;
    float _876 = _864 * _868;
    float _878 = _866 * _870;
    bool _880 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[660].y;
    bool _882 = isnan(0.5);
    bool _884 = _880 || _882;
    bool _886 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _888 = _884 || _886;
    float _890 = _876 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _892 = _876 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    bool _894 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[653].w;
    bool _896 = isnan(0.5);
    bool _898 = _894 || _896;
    bool _900 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _902 = _898 || _900;
    float _904 = fma(_878, (*spvDescriptorSet0.vp_c8)._m0[26].x, _890);
    float _906 = fma(_878, (*spvDescriptorSet0.vp_c8)._m0[24].x, _892);
    float _908 = _760 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _910 = fma(_874, (*spvDescriptorSet0.vp_c8)._m0[26].z, _904);
    float _912 = fma(_874, (*spvDescriptorSet0.vp_c8)._m0[24].z, _906);
    float _914 = _910 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _916 = _912 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _918 = _564 + _914;
    float _920 = _512 + _916;
    float _922 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _924 = _918 + _922;
    float _926 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _928 = _920 + _926;
    float _930 = _924 * _924;
    float _932 = fma(_928, _928, _930);
    float _934 = _760 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _936 = sqrt(_932);
    float _938 = fma(_766, (*spvDescriptorSet0.vp_c8)._m0[11].x, _934);
    float _940 = _876 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _942 = fma(_766, (*spvDescriptorSet0.vp_c8)._m0[10].x, _908);
    float _944 = fma(_778, (*spvDescriptorSet0.vp_c8)._m0[11].z, _938);
    float _946 = fma(_878, (*spvDescriptorSet0.vp_c8)._m0[25].x, _940);
    float _948 = fma(_778, (*spvDescriptorSet0.vp_c8)._m0[10].z, _942);
    float _950 = _944 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _952 = fma(_874, (*spvDescriptorSet0.vp_c8)._m0[25].z, _946);
    float _954 = _948 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _956 = 1.0 / _950;
    float _958 = _952 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _960 = _954 + _950;
    bool _962 = _936 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _964 = _447 + _958;
    float _966 = _908;
    float _968 = _944;
    float _970 = _920;
    float _972 = _958;
    float _974 = _960;
    float _976 = _918;
    if (!_962)
    {
        _966 = _918;
    }
    float _978 = _966;
    float _980 = _978;
    if (!_962)
    {
        _968 = _964;
    }
    float _982 = _968;
    bool _984 = !_962;
    float _986 = _982;
    if (!_984)
    {
        float _988 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _990 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _992 = _936 + _990;
        float _994 = rsqrt(_932);
        float _996 = _992 * _988;
        float _998 = _964 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1000 = _996 * 0.15915493667125701904296875;
        float _1002 = _1000 * 6.283185482025146484375;
        float _1004 = sin(_1002);
        float _1006 = _1000 * 6.283185482025146484375;
        float _1008 = cos(_1006);
        float _1010 = fma(_1004, _998, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1012 = _994 * _1010;
        float _1014 = _1008 + (-1.0);
        float _1016 = fma(_928, _1012, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1018 = fma(_924, _1012, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        float _1020 = _1014 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1022 = fma(_964, _1008, _1020);
        _986 = _1022;
        _970 = _1016;
        _980 = _1018;
        _972 = _1004;
    }
    float _1024 = _986;
    float _1026 = _970;
    float _1028 = _980;
    float _1030 = _972;
    float _1032 = -_754;
    float _1034 = fma(_1032, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1024);
    float _1036 = _960 * _956;
    float _1038 = _1036 * 0.5;
    float _1040 = -_756;
    float _1042 = fma(_1040, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1026);
    float _1044 = -_762;
    float _1046 = fma(_1044, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1028);
    float _1048 = _1030;
    float _1050 = _1042;
    float _1052 = _1046;
    if (_902)
    {
        _1048 = 1.0;
    }
    float _1054 = _1048;
    float _1056 = _1054;
    if (_888)
    {
        _974 = _1034;
    }
    float _1058 = _974;
    float _1060 = _1058;
    if (!_888)
    {
        float _1062 = _774 * _774;
        float _1064 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _1066 = -_564;
        float _1068 = _1066 + _1028;
        float _1070 = fma(_782, _782, _1062);
        float _1072 = fma(_792, _792, _1070);
        float _1074 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1076 = sqrt(_1072);
        float _1078 = 1.0 / _858;
        float _1080 = precise::min(_1076, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _1082 = _1080 * _1064;
        float _1084 = _1074 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1086 = _1082 * _1078;
        float _1088 = -_512;
        float _1090 = _1088 + _1026;
        float _1092 = -_447;
        float _1094 = _1092 + _1024;
        float _1096 = _1084 * _1086;
        float _1098 = _1068 * _1086;
        float _1100 = fma(_1090, _1096, _766);
        float _1102 = fma(_1094, _1096, _760);
        float _1104 = fma(_1084, _1098, _778);
        _1060 = _1102;
        _1050 = _1100;
        _1052 = _1104;
        _732 = _1096;
    }
    float _1106 = _1060;
    float _1108 = _1050;
    float _1110 = _1052;
    float _1112 = _732;
    float _1114 = _1112;
    if (!_902)
    {
        float _1116 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1118 = _1116 * 0.15915493667125701904296875;
        float _1120 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1122 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
        float _1124 = fma(_1038, (*spvDescriptorSet0.vp_c8)._m0[30].w, _1122);
        float _1126 = _1118 * 6.283185482025146484375;
        float _1128 = cos(_1126);
        float _1130 = _1120 * 0.15915493667125701904296875;
        float _1132 = _1118 * 6.283185482025146484375;
        float _1134 = sin(_1132);
        float _1136 = 1.0 / _1128;
        float _1138 = _1130 * 6.283185482025146484375;
        float _1140 = cos(_1138);
        float _1142 = _1134 * _1136;
        float _1144 = _1130 * 6.283185482025146484375;
        float _1146 = sin(_1144);
        float _1148 = _1140 * _1142;
        float _1150 = 1.0 / _1124;
        float _1152 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1154 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _1152;
        float _1156 = 1.0 / _1148;
        float _1158 = 1.0 / _1154;
        float _1160 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
        float _1162 = _1150 * _1160;
        float _1164 = _1146 * _1156;
        float _1166 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1168 = fma(_1164, _1162, _1166);
        float _1170 = _1168 * _1158;
        float _1172 = precise::clamp(_1170, 0.0, 1.0);
        _1114 = _1158;
        _1056 = _1172;
    }
    float _1174 = _1114;
    float _1176 = _1056;
    float _1178 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1180 = _1106 + _1178;
    float _1182 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1184 = _1108 + _1182;
    float _1186 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1188 = _1110 + _1186;
    float _1190 = _1180 * _1180;
    float _1192 = fma(_1184, _1184, _1190);
    float _1194 = fma(_1188, _1188, _1192);
    float _1196 = rsqrt(_1194);
    float _1198 = _1196 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1200 = _1184 * _1198;
    float _1202 = _1188 * _1198;
    float _1204 = _1200 * _1200;
    float _1206 = _1202 * _1202;
    float _1208 = _1204 + _1206;
    float _1210 = sqrt(_1208);
    bool _1212 = _1210 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1214 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1216 = _1210 + _1214;
    float _1218 = _1192;
    float _1220 = _1216;
    float _1222 = _1174;
    float _1224 = _1180;
    float _1226 = _1200;
    if (_1212)
    {
        float _1228 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1218 = _1228;
    }
    float _1230 = _1218;
    float _1232 = _1230;
    if (_1212)
    {
        float _1234 = _1216 * _1230;
        _1220 = _1234;
    }
    float _1236 = _1220;
    if (_1212)
    {
        float _1238 = rsqrt(_1208);
        _1232 = _1238;
    }
    float _1240 = _1232;
    float _1242 = _1240;
    if (_1212)
    {
        float _1244 = _1236 * 0.15915493667125701904296875;
        _1222 = _1244;
    }
    float _1246 = _1222;
    float _1248 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _1250 = _1196;
    float _1252 = _1246;
    if (_1212)
    {
        float _1254 = _1246 * 6.283185482025146484375;
        float _1256 = sin(_1254);
        _1250 = _1256;
    }
    float _1258 = _1250;
    float _1260 = precise::max(0.0, _1248);
    float _1262 = _1188;
    float _1264 = _1260;
    if (_1212)
    {
        float _1266 = _1246 * 6.283185482025146484375;
        float _1268 = cos(_1266);
        _1262 = _1268;
    }
    float _1270 = _1262;
    float _1272 = -_1198;
    float _1274 = -_1260;
    float _1276 = fma(_1180, _1272, _1274);
    if (_1212)
    {
        float _1278 = _1276 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1224 = _1278;
    }
    float _1280 = _1224;
    float _1282 = _1258;
    float _1284 = _1280;
    if (_1212)
    {
        float _1286 = fma(_1258, _1280, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1282 = _1286;
    }
    float _1288 = _1282;
    if (!_1212)
    {
        _1284 = _1202;
    }
    float _1290 = _1284;
    float _1292 = _1290;
    if (_1212)
    {
        float _1294 = _1240 * _1288;
        _976 = _1294;
    }
    float _1296 = _976;
    if (!_1212)
    {
        _1242 = _1276;
    }
    float _1298 = _1242;
    float _1300 = sqrt(_1194);
    float _1302 = _1298;
    float _1304 = _1270;
    if (_1212)
    {
        float _1306 = _1270 + (-1.0);
        _1264 = _1306;
    }
    float _1308 = _1264;
    float _1310 = _1308;
    if (_1212)
    {
        float _1312 = _1200 * _1296;
        _1226 = _1312;
    }
    float _1314 = _1226;
    if (_1212)
    {
        float _1316 = _1202 * _1296;
        _1292 = _1316;
    }
    float _1318 = _1292;
    if (_1212)
    {
        float _1320 = _1308 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1252 = _1320;
    }
    float _1322 = _1252;
    if (!_1212)
    {
        _1310 = _1204;
    }
    float _1324 = _1310;
    float _1326 = _1324;
    if (_1212)
    {
        float _1328 = _1314 * _1314;
        _1326 = _1328;
    }
    float _1330 = _1326;
    if (_1212)
    {
        float _1332 = fma(_1276, _1270, _1322);
        _1302 = _1332;
    }
    float _1334 = _1302;
    if (!_1212)
    {
        _1304 = _1206;
    }
    float _1336 = _1304;
    float _1338 = _1336;
    if (_1212)
    {
        float _1340 = _1318 * _1318;
        _1338 = _1340;
    }
    float _1342 = _1338;
    float _1344 = fma(_1334, _1334, _1330);
    float _1346 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _1348 = fma(_1300, (*spvDescriptorSet0.vp_c15)._m0[23].w, _1346);
    float _1350 = precise::clamp(_1348, 0.0, 1.0);
    float _1352 = _1344 + _1342;
    float _1354 = _1106 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1356 = _1106 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1358 = -_1350;
    float _1360 = _1358 + 1.0;
    float _1362 = rsqrt(_1352);
    float _1364 = fma(_1108, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1354);
    float _1366 = _1106 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1368 = fma(_1108, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1356);
    float _1370 = _1106 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1372 = fma(_1110, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1364);
    float _1374 = fma(_1108, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1366);
    float _1376 = fma(_1110, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1368);
    float _1378 = abs(_1360);
    float _1380 = log2(_1378);
    float _1382 = fma(_1108, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1370);
    float _1384 = fma(_1110, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1374);
    float _1386 = _1376 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1388 = _1372 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1390 = fma(_1110, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1382);
    float _1392 = _1384 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1394 = _1386 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1396 = _1362 * _1314;
    float _1398 = _1362 * _1334;
    float _1400 = _1362 * _1318;
    float _1402 = fma(_1392, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1394);
    float _1404 = _1396 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _1406 = (-1.0) + (*spvDescriptorSet0.vp_c15)._m0[20].x;
    float _1408 = _1388 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _1410 = _1390 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1412 = -_1404;
    float _1414 = fma(_1398, (*spvDescriptorSet0.vp_c15)._m0[21].y, _1412);
    float _1416 = fma(_1388, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1402);
    float _1418 = -_1408;
    float _1420 = fma(_1418, _1406, 1.0);
    float _1422 = _1380 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _1424 = -_1400;
    float _1426 = fma(_1424, (*spvDescriptorSet0.vp_c15)._m0[21].z, _1414);
    float _1428 = fma(_1410, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1416);
    float _1430 = _1386 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1432 = exp2(_1422);
    float _1434 = fma(_1426, -0.5, 0.5);
    float _1436 = _1386 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1438 = fma(_1392, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1430);
    float _1440 = fma(_1426, 0.5, 0.5);
    float _1442 = _1398 + 1.0;
    float _1444 = fma(_1392, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1436);
    float _1446 = fma(_1388, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1438);
    float _1448 = log2(_1420);
    float _1450 = fma(_1440, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _1452 = fma(_1388, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1444);
    float _1454 = fma(_1410, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1446);
    float _1456 = fma(_1440, _1450, -0.212114393711090087890625);
    float _1458 = fma(_1410, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1452);
    float _1460 = 1.0 / _1428;
    float _1462 = -_1398;
    float _1464 = fma(_1432, _1442, _1462);
    float _1466 = fma(_1440, _1456, 1.570728778839111328125);
    float _1468 = fma(_1464, 0.5, 0.5);
    float _1470 = sqrt(_1434);
    float _1472 = _1448 * 0.693147182464599609375;
    float _1474 = _1472 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _1476 = _1454 * _1460;
    float _1478 = _1458 * _1460;
    float _1480 = fma(_1476, 0.5, 0.5);
    float _1482 = fma(_1478, -0.5, 0.5);
    float _1484 = _1470 * 0.636619746685028076171875;
    float3 _3904 = float3(_1480, _1482, _1474);
    float _1486 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_3904, float3(0.0), isnan(_3904)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_3904, float3(0.0), isnan(_3904)), level(0.0)).x;
    float3 _3915 = float3(_1480, _1482, _1474);
    float4 _1489 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_3915, float3(0.0), isnan(_3915)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_3915, float3(0.0), isnan(_3915)), level(0.0)).xyzw;
    float _1491 = _1489.x;
    float _1493 = _1489.y;
    float _1495 = _1489.z;
    float _1497 = _1489.w;
    float _1499 = -_1466;
    float _1501 = fma(_1484, _1499, 1.0);
    float2 _3937 = float2(_1501, _1468);
    float3 _1505 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_3937, float2(0.0), isnan(_3937)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_3937, float2(0.0), isnan(_3937)), level(0.0)).xyz;
    float _1507 = _1505.x;
    float _1509 = _1505.y;
    float _1511 = _1505.z;
    float _1513 = _1380 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _1515 = _1386 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    bool _1517 = _1176 > 0.0;
    bool _1519 = isnan(_1176);
    bool _1521 = _1517 || _1519;
    bool _1523 = isnan(0.0);
    bool _1525 = _1521 || _1523;
    float _1527 = _1176 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _1529 = fma(_1392, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1515);
    float _1531 = exp2(_1513);
    float _1533 = fma(_1388, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1529);
    float _1535 = fma(_1410, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1533);
    float _1537 = _1535 + _1428;
    out.gl_Position.x = _1454;
    out.gl_Position.y = _1458;
    out.gl_Position.z = _1535;
    out.gl_Position.w = _1428;
    float _1539 = _1537 * 0.5;
    float _1541 = -_1531;
    float _1543 = _1541 + 1.0;
    float _1545 = _1527 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _1547 = _1543 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    out.m_62.z = _1539;
    out.m_62.w = _1428;
    out.m_45.x = _1545;
    float _1549 = _1547 * _1486;
    float _1551 = -_1547;
    float _1553 = _1551 + 1.0;
    float _1555 = _1497 * _1549;
    float _1557 = _1497 * _1553;
    float _1559 = _1511 * _1549;
    float _1561 = fma(_1507, _1555, _1491);
    float _1563 = fma(_1509, _1555, _1493);
    float _1565 = fma(_1497, _1559, _1495);
    out.m_64.x = _1561;
    out.m_64.y = _1563;
    out.m_64.z = _1565;
    out.m_64.w = _1557;
    if (_1525)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_56.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_56.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_56.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_56.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_60.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_60.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_60.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_60.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_62.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_62.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_62.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_62.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_45.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_45.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_45.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_45.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_58.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_58.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_58.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_58.w)); dm_cw(dm_gs, dm_p, 36, 0u); dm_cw(dm_gs, dm_p, 37, 0u); dm_cw(dm_gs, dm_p, 38, 0u); dm_cw(dm_gs, dm_p, 39, 0x3f800000u); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_64.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_64.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_64.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_64.w)); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    out.m_45.x = 0.0;
    float _1567 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _1567;
    { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_56.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_56.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_56.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_56.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_60.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_60.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_60.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_60.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_62.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_62.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_62.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_62.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_45.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_45.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_45.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_45.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_58.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_58.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_58.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_58.w)); dm_cw(dm_gs, dm_p, 36, 0u); dm_cw(dm_gs, dm_p, 37, 0u); dm_cw(dm_gs, dm_p, 38, 0u); dm_cw(dm_gs, dm_p, 39, 0x3f800000u); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_64.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_64.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_64.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_64.w)); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
}

